#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Etapa 1 do pipeline — BUSCA E COLETA REAL de registros (PubMed / SciELO / BVS).

Objetivo (auditoria de reprodutibilidade, 2026-06)
--------------------------------------------------
Substituir o antigo script que, "apesar do nome, NÃO fazia TF-IDF e atribuía
relevance_score=1.0". Este módulo realiza a BUSCA real nas três bases declaradas
no manuscrito (§2.2) e PERSISTE título + RESUMO de cada registro, que são o
insumo necessário para a triagem por TF-IDF (ver `screen_tfidf.py`, etapa 2).

A triagem por relevância (TF-IDF + similaridade de cosseno, limiar 0.35) NÃO é
feita aqui — ela vive em `screen_tfidf.py`, para manter coleta e triagem
separadas, versionadas e auditáveis de forma independente.

Reprodutibilidade
-----------------
A consulta booleana, o intervalo de datas e as bases estão FIXOS e documentados
abaixo (constantes `PUBMED_QUERY`, `DATE_RANGE`). Qualquer pesquisador que execute
este script com a mesma consulta/datas obtém o mesmo conjunto de registros
disponíveis na base naquele momento. Como o PubMed cresce ao longo do tempo, a
contagem absoluta pode variar com a data de execução; por isso registramos a data
e as contagens por base em `data/raw/search_results/SEARCH_PROVENANCE.json`.

Pré-requisitos
--------------
- `pip install -r requirements.txt` (biopython, requests, pandas).
- Acesso de rede a `eutils.ncbi.nlm.nih.gov`, `search.scielo.org`,
  `pesquisa.bvsalud.org` (em ambientes com allowlist de egresso, liberar esses hosts).
- (Recomendado) variável de ambiente `PUBMED_API_KEY` para elevar o limite de
  requisições do NCBI; e `ENTREZ_EMAIL` para identificação.

Saídas
------
- data/raw/search_results/pubmed_results.csv
- data/raw/search_results/scielo_results.csv
- data/raw/search_results/bvs_results.csv
- data/raw/all_results_search.csv          (união deduplicada, com título+resumo)
- data/raw/search_results/SEARCH_PROVENANCE.json  (query, data, contagens)

Uso
---
    python scripts/01_search_pipeline/search_nlp_tfidf.py \
        --output data/raw \
        --retmax 5000
"""
from __future__ import annotations

import argparse
import json
import os
import time
from datetime import datetime, timezone
from pathlib import Path
from xml.etree import ElementTree as ET

import pandas as pd
import requests

# --------------------------------------------------------------------------- #
# Parâmetros de busca FIXOS e auditáveis (documentados no manuscrito §2.2/PIRT)
# --------------------------------------------------------------------------- #
DATE_RANGE = ("2018/01/01", "2026/12/31")

# Conceito "Índice" (IA generativa: LLM/VLM) AND conceito "População" (radiografia
# de tórax). Termos restritos a título/resumo ([tiab]) para precisão da triagem.
_AI_TERMS = (
    '"generative artificial intelligence"[tiab] OR "large language model"[tiab] '
    'OR "large language models"[tiab] OR LLM[tiab] OR "vision-language model"[tiab] '
    'OR "vision language model"[tiab] OR VLM[tiab] OR "GPT-4"[tiab] OR ChatGPT[tiab] '
    'OR "multimodal artificial intelligence"[tiab] OR "foundation model"[tiab] '
    'OR LLaVA[tiab] OR "multimodal large language model"[tiab]'
)
_CXR_TERMS = (
    '"chest radiograph"[tiab] OR "chest radiographs"[tiab] OR "chest x-ray"[tiab] '
    'OR "chest x-rays"[tiab] OR CXR[tiab] OR "thoracic radiograph"[tiab] '
    'OR "thoracic radiographs"[tiab] OR "chest radiography"[tiab]'
)
PUBMED_QUERY = (
    f"(({_AI_TERMS}) AND ({_CXR_TERMS})) "
    f'AND ("{DATE_RANGE[0]}"[dp] : "{DATE_RANGE[1]}"[dp])'
)

# Texto livre equivalente para as bases ibero-americanas (SciELO/BVS), que não
# usam a sintaxe de campos do PubMed.
FREE_TEXT_QUERY = (
    "(generative artificial intelligence OR large language model OR LLM OR "
    "vision-language model OR VLM OR ChatGPT OR GPT-4 OR multimodal artificial "
    "intelligence) AND (chest radiograph OR chest x-ray OR CXR OR thoracic radiograph)"
)

EUTILS = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils"
ENTREZ_EMAIL = os.getenv("ENTREZ_EMAIL", "gabrielborghi10@gmail.com")
PUBMED_API_KEY = os.getenv("PUBMED_API_KEY")  # opcional
TOOL_NAME = "llm-vlm-cxr-metaanalysis"

COLUMNS = ["source", "pmid", "doi", "authors", "year", "journal", "title", "abstract"]


# --------------------------------------------------------------------------- #
# PubMed (E-utilities) — fonte primária
# --------------------------------------------------------------------------- #
def _eutils_params(**extra) -> dict:
    params = {"tool": TOOL_NAME, "email": ENTREZ_EMAIL}
    if PUBMED_API_KEY:
        params["api_key"] = PUBMED_API_KEY
    params.update(extra)
    return params


def _throttle() -> None:
    # NCBI: 3 req/s sem chave, 10 req/s com chave.
    time.sleep(0.11 if PUBMED_API_KEY else 0.34)


def pubmed_search_ids(query: str, retmax: int) -> list[str]:
    """esearch paginado: devolve a lista de PMIDs para a consulta."""
    ids: list[str] = []
    batch = 5000  # limite prático do esearch por chamada
    # Primeira chamada para descobrir a contagem total.
    r = requests.get(
        f"{EUTILS}/esearch.fcgi",
        params=_eutils_params(db="pubmed", term=query, retmax=0),
        timeout=60,
    )
    r.raise_for_status()
    total = int(ET.fromstring(r.text).findtext("Count", "0"))
    target = min(total, retmax)
    print(f"[PubMed] '{query[:60]}...' -> {total} registros (coletando {target})")

    retstart = 0
    while retstart < target:
        _throttle()
        r = requests.get(
            f"{EUTILS}/esearch.fcgi",
            params=_eutils_params(
                db="pubmed", term=query,
                retstart=retstart, retmax=min(batch, target - retstart),
            ),
            timeout=60,
        )
        r.raise_for_status()
        page = [e.text for e in ET.fromstring(r.text).iter("Id")]
        if not page:
            break
        ids.extend(page)
        retstart += len(page)
    return ids


def _text(node) -> str:
    """Extrai texto de um nó (incluindo subtags, ex.: AbstractText estruturado)."""
    if node is None:
        return ""
    return "".join(node.itertext()).strip()


def pubmed_fetch(ids: list[str]) -> list[dict]:
    """efetch em lotes: título, resumo, ano, periódico, 1º autor, DOI."""
    out: list[dict] = []
    for i in range(0, len(ids), 200):
        chunk = ids[i:i + 200]
        _throttle()
        r = requests.post(
            f"{EUTILS}/efetch.fcgi",
            data=_eutils_params(db="pubmed", id=",".join(chunk), retmode="xml"),
            timeout=120,
        )
        r.raise_for_status()
        root = ET.fromstring(r.text)
        for art in root.findall(".//PubmedArticle"):
            mc = art.find(".//MedlineCitation")
            article = mc.find("Article") if mc is not None else None
            if article is None:
                continue
            pmid = _text(mc.find("PMID"))
            title = _text(article.find("ArticleTitle"))
            abstract = " ".join(
                _text(t) for t in article.findall(".//Abstract/AbstractText")
            ).strip()
            year = _text(article.find(".//JournalIssue/PubDate/Year")) or \
                _text(article.find(".//JournalIssue/PubDate/MedlineDate"))[:4]
            journal = _text(article.find(".//Journal/Title"))
            first_author = ""
            al = article.find(".//AuthorList/Author")
            if al is not None:
                ln = _text(al.find("LastName"))
                first_author = ln or _text(al.find("CollectiveName"))
            doi = ""
            for eid in art.findall(".//ArticleIdList/ArticleId"):
                if eid.get("IdType") == "doi":
                    doi = _text(eid)
                    break
            out.append({
                "source": "PubMed", "pmid": pmid, "doi": doi.lower(),
                "authors": f"{first_author} {year}".strip(), "year": year,
                "journal": journal, "title": title, "abstract": abstract,
            })
        print(f"[PubMed] detalhes: {min(i + 200, len(ids))}/{len(ids)}")
    return out


# --------------------------------------------------------------------------- #
# SciELO e BVS — fontes complementares (melhor-esforço, via API iAHx/Solr)
# --------------------------------------------------------------------------- #
def _iahx_search(base_url: str, source_label: str, query: str,
                 retmax: int) -> list[dict]:
    """
    Busca via backend Solr/iAHx usado por BVS e SciELO. Retorna registros com
    título e resumo quando disponíveis. Em caso de mudança de schema/endpoint,
    registra o erro e devolve lista vazia (degradação graciosa).
    """
    out: list[dict] = []
    rows = 100
    start = 0
    try:
        while start < retmax:
            resp = requests.get(
                base_url,
                params={
                    "q": query, "lang": "en", "output": "site",
                    "format": "summary", "count": rows, "from": start,
                    "sort": "", "fb": "", "page": (start // rows) + 1,
                },
                headers={"Accept": "application/json",
                         "User-Agent": f"{TOOL_NAME} (research)"},
                timeout=60,
            )
            resp.raise_for_status()
            try:
                data = resp.json()
            except ValueError:
                print(f"[{source_label}] resposta não-JSON; endpoint pode exigir "
                      f"ajuste de parâmetros. Pulando esta base.")
                break
            docs = (data.get("diaServerResponse", [{}])[0]
                    .get("response", {}).get("docs", []))
            if not docs:
                break
            for d in docs:
                out.append({
                    "source": source_label,
                    "pmid": "",
                    "doi": (d.get("doi") or "").lower(),
                    "authors": "; ".join(d.get("au", []))[:120],
                    "year": str(d.get("da", ""))[:4],
                    "journal": d.get("ta") or d.get("journal_title", ""),
                    "title": " ".join(d.get("ti", [])) if isinstance(d.get("ti"), list)
                             else d.get("ti", ""),
                    "abstract": " ".join(d.get("ab", [])) if isinstance(d.get("ab"), list)
                                else d.get("ab", ""),
                })
            start += len(docs)
    except requests.RequestException as exc:
        print(f"[{source_label}] falha de rede/endpoint: {exc}. Pulando esta base.")
    print(f"[{source_label}] coletados {len(out)} registros.")
    return out


def search_scielo(query: str, retmax: int) -> list[dict]:
    return _iahx_search("https://search.scielo.org/", "SciELO", query, retmax)


def search_bvs(query: str, retmax: int) -> list[dict]:
    return _iahx_search("https://pesquisa.bvsalud.org/portal/", "BVS", query, retmax)


# --------------------------------------------------------------------------- #
# Orquestração
# --------------------------------------------------------------------------- #
def _dedupe(df: pd.DataFrame) -> pd.DataFrame:
    """Remove duplicatas por DOI (quando houver) e por título normalizado."""
    df = df.copy()
    df["_key"] = df["doi"].where(df["doi"].astype(bool),
                                 df["title"].str.lower().str.strip())
    df = df.drop_duplicates(subset="_key").drop(columns="_key")
    return df.reset_index(drop=True)


def main() -> None:
    ap = argparse.ArgumentParser(description="Busca real PubMed/SciELO/BVS.")
    ap.add_argument("--output", default="data/raw",
                    help="diretório base de saída (default: data/raw)")
    ap.add_argument("--retmax", type=int, default=5000,
                    help="máximo de registros por base (default: 5000)")
    ap.add_argument("--skip-scielo-bvs", action="store_true",
                    help="coletar apenas PubMed (fonte primária)")
    args = ap.parse_args()

    out_dir = Path(args.output)
    sr_dir = out_dir / "search_results"
    sr_dir.mkdir(parents=True, exist_ok=True)

    counts: dict[str, int] = {}

    # --- PubMed ---
    ids = pubmed_search_ids(PUBMED_QUERY, args.retmax)
    pubmed = pubmed_fetch(ids)
    counts["PubMed"] = len(pubmed)
    pd.DataFrame(pubmed, columns=COLUMNS).to_csv(
        sr_dir / "pubmed_results.csv", index=False, encoding="utf-8")

    # --- SciELO / BVS ---
    scielo, bvs = [], []
    if not args.skip_scielo_bvs:
        scielo = search_scielo(FREE_TEXT_QUERY, min(args.retmax, 500))
        bvs = search_bvs(FREE_TEXT_QUERY, min(args.retmax, 500))
    counts["SciELO"] = len(scielo)
    counts["BVS"] = len(bvs)
    pd.DataFrame(scielo, columns=COLUMNS).to_csv(
        sr_dir / "scielo_results.csv", index=False, encoding="utf-8")
    pd.DataFrame(bvs, columns=COLUMNS).to_csv(
        sr_dir / "bvs_results.csv", index=False, encoding="utf-8")

    # --- União deduplicada ---
    combined = pd.DataFrame(pubmed + scielo + bvs, columns=COLUMNS)
    n_raw = len(combined)
    combined = _dedupe(combined)
    combined.to_csv(out_dir / "all_results_search.csv", index=False, encoding="utf-8")

    provenance = {
        "run_utc": datetime.now(timezone.utc).isoformat(),
        "pubmed_query": PUBMED_QUERY,
        "free_text_query": FREE_TEXT_QUERY,
        "date_range": DATE_RANGE,
        "counts_per_source": counts,
        "total_before_dedup": n_raw,
        "total_after_dedup": int(len(combined)),
        "api_key_used": bool(PUBMED_API_KEY),
    }
    with open(sr_dir / "SEARCH_PROVENANCE.json", "w", encoding="utf-8") as fh:
        json.dump(provenance, fh, ensure_ascii=False, indent=2)

    print("\n=== RESUMO DA BUSCA ===")
    for k, v in counts.items():
        print(f"  {k:8s}: {v}")
    print(f"  Total (bruto): {n_raw} | após dedup: {len(combined)}")
    print(f"  Proveniência: {sr_dir / 'SEARCH_PROVENANCE.json'}")
    print(f"  Corpus para triagem: {out_dir / 'all_results_search.csv'}")


if __name__ == "__main__":
    main()
