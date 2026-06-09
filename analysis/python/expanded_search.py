#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Busca EXPANDIDA + triagem por relevância (auditoria 2026-06).

Motivação: o pool perdeu Noh 2026 (citação fabricada / fora dos critérios). Esta
busca amplia a cobertura no PubMed e faz uma TRIAGEM real por sinais de DTA
(sensibilidade/especificidade/2×2) em estudos de IA GENERATIVA (LLM/VLM) em
radiografia de tórax, para identificar estudos elegíveis adicionais.

NB: ao contrário de scripts/01_search_pipeline/search_nlp_tfidf.py (que, apesar do
nome, NÃO faz TF-IDF e atribui relevance_score=1.0), aqui há um escore de triagem
transparente baseado em termos de DTA e de IA generativa, aplicado ao título+abstract.
A inclusão final ainda exige leitura do texto completo e extração verificada do 2×2.
"""
import re, time
from pathlib import Path
import pandas as pd
from Bio import Entrez

Entrez.email = "gabrielborghi10@gmail.com"

BROAD = ("(generative AI OR large language model OR LLM OR vision-language OR VLM OR "
         "GPT-4 OR ChatGPT OR multimodal AI OR foundation model) AND "
         "(chest radiograph OR chest x-ray OR CXR OR thoracic radiograph)")
FOCUSED = BROAD + " AND (diagnostic accuracy OR sensitivity OR specificity OR "       "confusion matrix OR true positive OR ROC OR AUC)"

GEN_TERMS = ["generative","llm","large language model","vision-language","vlm","gpt",
             "chatgpt","multimodal","foundation model","llava","report generation","gemini"]
DTA_TERMS = ["sensitivity","specificity","true positive","false positive","confusion",
             "2x2","2×2","diagnostic accuracy","auroc","auc","roc","ppv","npv","f1"]
# Estudos ja incluidos (para sinalizar sobreposicao)
KNOWN = ["hong","ostrovsky","huang","lee","gunes","tanno","kara-cxr","cxr-llava"]


def esearch_count(term):
    h = Entrez.esearch(db="pubmed", term=term, retmax=0); r = Entrez.read(h); h.close()
    return int(r["Count"])


def esearch_ids(term, retmax):
    h = Entrez.esearch(db="pubmed", term=term, retmax=retmax); r = Entrez.read(h); h.close()
    return r["IdList"]


def fetch(ids):
    out = []
    for i in range(0, len(ids), 200):
        chunk = ids[i:i+200]
        h = Entrez.efetch(db="pubmed", id=",".join(chunk), retmode="xml")
        recs = Entrez.read(h); h.close()
        for a in recs.get("PubmedArticle", []):
            try:
                mc = a["MedlineCitation"]; art = mc["Article"]
                pmid = str(mc["PMID"])
                title = str(art.get("ArticleTitle", ""))
                abst = " ".join(str(x) for x in art.get("Abstract", {}).get("AbstractText", []))
                year = art["Journal"]["JournalIssue"]["PubDate"].get("Year", "NA")
                jour = str(art["Journal"].get("Title", ""))
                au = "NA"
                if art.get("AuthorList"):
                    au = art["AuthorList"][0].get("LastName", "NA")
                out.append(dict(pmid=pmid, author=au, year=year, journal=jour,
                                title=title, abstract=abst))
            except Exception:
                continue
        time.sleep(0.34)
    return out


def score(row):
    blob = (row["title"] + " " + row["abstract"]).lower()
    gen = sum(t in blob for t in GEN_TERMS)
    dta = sum(t in blob for t in DTA_TERMS)
    cxr = any(t in blob for t in ["chest", "thora", "cxr", "radiograph"])
    return gen, dta, (gen >= 1 and dta >= 2 and cxr)


if __name__ == "__main__":
    print("Contagens PubMed:")
    print("  BROAD   :", esearch_count(BROAD))
    print("  FOCUSED :", esearch_count(FOCUSED))

    ids = esearch_ids(FOCUSED, retmax=400)
    print(f"\nBaixando {len(ids)} registros focados (titulo+abstract)...")
    recs = fetch(ids)
    df = pd.DataFrame(recs)
    df["gen"], df["dta"], df["elegivel_provavel"] = zip(*df.apply(score, axis=1))
    df["ja_conhecido"] = df.apply(
        lambda r: any(k in (r["title"] + " " + r["author"]).lower() for k in KNOWN), axis=1)

    Path("outputs/statistics").mkdir(parents=True, exist_ok=True)
    df.sort_values(["elegivel_provavel", "dta", "gen"], ascending=False)\
      .to_csv("outputs/statistics/busca_expandida_triagem.csv", index=False, encoding="utf-8")

    short = df[(df.elegivel_provavel) & (~df.ja_conhecido)]\
              .sort_values(["dta", "gen"], ascending=False)
    print(f"\nTotal focado: {len(df)} | provavelmente elegiveis: {df.elegivel_provavel.sum()}"
          f" | NOVOS (nao conhecidos): {len(short)}")
    print("\n=== SHORTLIST (novos candidatos com sinais de DTA) ===")
    for _, r in short.head(25).iterrows():
        print(f"- PMID {r.pmid} | {r.author} {r.year} | {r.journal[:35]}")
        print(f"    {r.title[:110]}")
    print("\n[OK] Triagem completa salva em outputs/statistics/busca_expandida_triagem.csv")
