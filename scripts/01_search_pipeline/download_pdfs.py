#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Etapa 3 do pipeline: comparar artigos triados com PDFs ja baixados,
avaliar criterios de inclusao/exclusao e baixar os ausentes via open access.
"""
import json
import os
import re
import sys
import time
from pathlib import Path

import pandas as pd
import requests

PDF_DIR = Path("data/artigos_pdf")
PDF_DIR.mkdir(parents=True, exist_ok=True)

EMAIL = "gabrielborghi10@gmail.com"  # obrigatorio pela Unpaywall API

# ---------------------------------------------------------------------------
# Criterios de inclusao/exclusao baseados em titulo e abstract
# ---------------------------------------------------------------------------
def evaluate_inclusion(title: str, abstract: str, authors: str) -> tuple[str, str]:
    """
    Retorna (decisao, motivo) onde decisao e 'INCLUIR', 'EXCLUIR', ou 'INCERTO'.
    Baseado nos criterios PIRT do manuscrito:
      - Populacao: pacientes com radiografia de torax (CXR)
      - Indice: IA generativa / LLM / VLM (nao deep learning classico)
      - Referencia: especialista (radiologista/clinico)
      - Desfecho: acuracia diagnostica (sensibilidade, especificidade, AUC etc.)
    """
    title_l = title.lower()
    abstract_l = abstract.lower() if abstract else ""

    # Exclusao imediata: cartas, comentarios, editoriais sem dados originais
    editorial_signals = [
        "reader comment", "letter to", "editorial", "commentary",
        "author reply", "response to"
    ]
    for sig in editorial_signals:
        if sig in title_l:
            return "EXCLUIR", f"Carta/comentario/editorial: '{sig}' no titulo"

    # Exclusao: sem CXR como modalidade
    cxr_signals = [
        "chest radiograph", "chest x-ray", "cxr", "chest x ray",
        "radiografia de torax", "chest radiography", "thoracic radiograph",
        "chest film", "plain film"
    ]
    has_cxr = any(s in title_l or s in abstract_l for s in cxr_signals)
    if not has_cxr:
        return "EXCLUIR", "Nao avalia radiografia de torax como modalidade principal"

    # Exclusao: indice nao e IA generativa/LLM/VLM
    gen_ai_signals = [
        "large language model", "llm", "gpt", "chatgpt", "gemini",
        "vision-language model", "vlm", "generative ai",
        "generative artificial intelligence", "multimodal",
        "foundation model", "llava", "claude", "deepseek",
        "multimodal large language", "vlm", "vision language"
    ]
    has_gen_ai = any(s in title_l or s in abstract_l for s in gen_ai_signals)
    if not has_gen_ai:
        return "EXCLUIR", "Indice nao e IA generativa/LLM/VLM"

    # Verificar se ha metricas de acuracia diagnostica
    accuracy_signals = [
        "sensitivity", "specificity", "accuracy", "auc", "auroc",
        "roc", "f1", "positive predictive", "negative predictive",
        "diagnostic performance", "diagnostic accuracy",
        "true positive", "false positive", "confusion matrix"
    ]
    has_accuracy = any(s in abstract_l for s in accuracy_signals)

    # Se sem abstract, nao conseguimos avaliar completamente
    if not abstract:
        if has_gen_ai and has_cxr:
            return "INCERTO", "Sem abstract disponivel para avaliacao completa"

    if not has_accuracy and abstract:
        # Pode ser estudo de geracao de laudos sem metricas diagnosticas
        report_gen_signals = ["report generation", "radiology report", "creating reports", "generating reports"]
        is_report_gen_only = any(s in abstract_l for s in report_gen_signals)
        if is_report_gen_only and not has_accuracy:
            return "INCERTO", "Parece ser geracao de laudos apenas; sem metricas de acuracia diagnostica claras no abstract"

    return "INCLUIR", "Cumpre criterios PIRT: CXR + IA generativa + metricas de acuracia"


# ---------------------------------------------------------------------------
# Mapeamento de PDFs locais -> artigos
# ---------------------------------------------------------------------------
def build_local_pdf_map(pdf_dir: Path) -> dict:
    """
    Cria um mapa com sinais dos PDFs locais (nome do arquivo normalizado)
    para identificar quais artigos ja foram baixados.
    """
    mapping = {}
    for f in pdf_dir.glob("*.pdf"):
        name = f.stem.lower()
        mapping[name] = f
    return mapping


def pdf_already_downloaded(doi: str, pmid: str, title: str, pdf_dir: Path) -> tuple[bool, str]:
    """Verifica se um artigo ja tem PDF baixado, por DOI, PMID ou palavras do titulo."""
    local_pdfs = list(pdf_dir.glob("*.pdf"))

    # Normalizar DOI para comparacao com nome de arquivo
    doi_slug = doi.replace("/", "_").replace(".", "_").replace(":", "_").lower() if doi else ""
    pmid_str = str(pmid)

    # Palavras-chave do titulo para matching fuzzy
    title_words = re.sub(r"[^a-z0-9 ]", "", title.lower()).split()
    significant_words = [w for w in title_words if len(w) > 5][:5]

    for pdf in local_pdfs:
        stem = pdf.stem.lower()

        # Match por PMID
        if pmid_str and pmid_str in stem:
            return True, pdf.name

        # Match por fragmento do DOI
        doi_parts = doi.replace("/", "-").lower().split("-") if doi else []
        meaningful_doi_parts = [p for p in doi_parts if len(p) > 4]
        for part in meaningful_doi_parts:
            if part in stem:
                return True, pdf.name

        # Match por palavras significativas do titulo (pelo menos 3 de 5)
        if significant_words:
            matches = sum(1 for w in significant_words if w in stem)
            if matches >= min(3, len(significant_words)):
                return True, pdf.name

    return False, ""


# ---------------------------------------------------------------------------
# Download via Unpaywall + fallback direto
# ---------------------------------------------------------------------------
def get_oa_url(doi: str) -> str | None:
    """Consulta Unpaywall para obter URL de PDF open access."""
    if not doi:
        return None
    try:
        url = f"https://api.unpaywall.org/v2/{doi}?email={EMAIL}"
        r = requests.get(url, timeout=15)
        if r.status_code != 200:
            return None
        data = r.json()
        # Preferir PDF de best_oa_location
        best = data.get("best_oa_location")
        if best:
            pdf_url = best.get("url_for_pdf") or best.get("url")
            if pdf_url and pdf_url.endswith(".pdf"):
                return pdf_url
            if pdf_url:
                return pdf_url
        # Fallback: percorrer todas as locations
        for loc in data.get("oa_locations", []):
            pdf_url = loc.get("url_for_pdf")
            if pdf_url:
                return pdf_url
    except Exception as e:
        print(f"  [Unpaywall] erro para {doi}: {e}")
    return None


def safe_filename(title: str, authors: str, year: str) -> str:
    """Gera nome de arquivo seguro a partir de autores/ano/titulo."""
    base = f"{authors}_{year}_{title[:50]}".lower()
    base = re.sub(r"[^a-z0-9_]", "_", base)
    base = re.sub(r"_+", "_", base).strip("_")
    return base[:80] + ".pdf"


def download_pdf(url: str, dest: Path) -> bool:
    """Baixa PDF de uma URL. Retorna True se sucesso."""
    try:
        headers = {
            "User-Agent": "Mozilla/5.0 (research; gabrielborghi10@gmail.com)",
            "Accept": "application/pdf,*/*",
        }
        r = requests.get(url, headers=headers, timeout=30, allow_redirects=True)
        if r.status_code == 200:
            content_type = r.headers.get("Content-Type", "")
            if "pdf" in content_type or r.content[:4] == b"%PDF":
                dest.write_bytes(r.content)
                return True
            else:
                print(f"  [aviso] URL retornou {content_type}, nao e PDF")
        else:
            print(f"  [HTTP {r.status_code}] {url}")
    except Exception as e:
        print(f"  [erro download] {e}")
    return False


# ---------------------------------------------------------------------------
# Pipeline principal
# ---------------------------------------------------------------------------
def main():
    included_csv = Path("data/processed/screening_tfidf_included.csv")
    if not included_csv.exists():
        sys.exit("[erro] Rode screen_tfidf.py primeiro.")

    df = pd.read_csv(included_csv)
    df["abstract"] = df["abstract"].fillna("")

    results = []
    to_download = []
    already_have = []
    excluded = []
    uncertain = []

    print("\n" + "=" * 80)
    print("AVALIACAO DE CRITERIOS DE INCLUSAO/EXCLUSAO E STATUS DE DOWNLOAD")
    print("=" * 80)

    for _, row in df.iterrows():
        title = str(row.get("title", ""))
        abstract = str(row.get("abstract", ""))
        authors = str(row.get("authors", ""))
        year = str(row.get("year", ""))
        doi = str(row.get("doi", ""))
        pmid = str(row.get("pmid", ""))

        decisao, motivo = evaluate_inclusion(title, abstract, authors)

        # Verificar se ja baixado
        already, existing_file = pdf_already_downloaded(doi, pmid, title, PDF_DIR)

        result = {
            "authors": authors, "year": year, "title": title[:70],
            "doi": doi, "pmid": pmid,
            "decisao": decisao, "motivo": motivo,
            "ja_baixado": already, "arquivo_local": existing_file,
        }
        results.append(result)

        if decisao == "EXCLUIR":
            excluded.append(result)
        elif already:
            already_have.append(result)
        else:
            if decisao in ("INCLUIR", "INCERTO"):
                to_download.append(result)
                if decisao == "INCERTO":
                    uncertain.append(result)

    # Mostrar status
    print(f"\nTotal avaliado: {len(results)} artigos")
    print(f"  EXCLUIR  : {len(excluded)}")
    print(f"  Ja baixados: {len(already_have)}")
    print(f"  A baixar   : {len(to_download)} (incluindo {len(uncertain)} INCERTOS)")

    print("\n" + "-" * 80)
    print("EXCLUIDOS (criterio de inclusao/exclusao nao atendido):")
    print("-" * 80)
    for r in excluded:
        print(f"  - {r['authors']} | {r['title'][:60]}")
        print(f"    Motivo: {r['motivo']}")

    print("\n" + "-" * 80)
    print("JA BAIXADOS (mapeados para PDFs locais):")
    print("-" * 80)
    for r in already_have:
        print(f"  [{r['decisao']}] {r['authors']} | {r['title'][:55]}")
        print(f"    Arquivo: {r['arquivo_local']}")

    print("\n" + "-" * 80)
    print("A BAIXAR:")
    print("-" * 80)
    for r in to_download:
        flag = " [INCERTO]" if r["decisao"] == "INCERTO" else ""
        print(f"  {r['authors']} | {r['title'][:55]}{flag}")
        print(f"    DOI: {r['doi']}")

    # Download
    print("\n" + "=" * 80)
    print("INICIANDO DOWNLOADS via Unpaywall (open access only)...")
    print("=" * 80)

    download_log = []

    for r in to_download:
        doi = r["doi"]
        authors = r["authors"]
        year = r["year"]
        title = r["title"]
        pmid = r["pmid"]

        print(f"\n[{authors}] {title[:55]}...")
        print(f"  DOI: {doi}")

        oa_url = get_oa_url(doi)
        time.sleep(1)  # respeitar rate limit da API

        if not oa_url:
            print("  [!] Sem URL open access encontrada via Unpaywall.")
            download_log.append({**r, "status": "SEM_OA", "url": None, "arquivo": None})
            continue

        print(f"  OA URL: {oa_url}")
        fname = safe_filename(title, authors, year)
        dest = PDF_DIR / fname

        # evitar duplo download se arquivo ja existe com nome gerado
        if dest.exists():
            print(f"  [skip] Arquivo ja existe: {fname}")
            download_log.append({**r, "status": "JA_EXISTIA", "url": oa_url, "arquivo": fname})
            continue

        ok = download_pdf(oa_url, dest)
        if ok:
            size_kb = dest.stat().st_size // 1024
            print(f"  [OK] Baixado: {fname} ({size_kb} KB)")
            download_log.append({**r, "status": "BAIXADO", "url": oa_url, "arquivo": fname})
        else:
            print(f"  [!] Falha ao baixar de {oa_url}")
            download_log.append({**r, "status": "FALHA_DOWNLOAD", "url": oa_url, "arquivo": None})

    # Salvar log
    log_path = Path("data/processed/download_log.json")
    with open(log_path, "w", encoding="utf-8") as f:
        json.dump(download_log, f, indent=2, ensure_ascii=False)

    # Relatorio final
    print("\n" + "=" * 80)
    print("RELATORIO FINAL")
    print("=" * 80)
    baixados = [l for l in download_log if l["status"] == "BAIXADO"]
    sem_oa = [l for l in download_log if l["status"] == "SEM_OA"]
    falhas = [l for l in download_log if l["status"] == "FALHA_DOWNLOAD"]

    print(f"\n  Excluidos por criterio    : {len(excluded)}")
    print(f"  Ja tinham PDF local       : {len(already_have)}")
    print(f"  Baixados agora            : {len(baixados)}")
    print(f"  Sem versao open access    : {len(sem_oa)}")
    print(f"  Falha no download         : {len(falhas)}")

    total_disponiveis = len(already_have) + len(baixados)
    total_incluidos = len(results) - len(excluded)
    print(f"\n  Total incluidos para revisao: {total_incluidos}")
    print(f"  Total com PDF disponivel    : {total_disponiveis}")

    if sem_oa:
        print("\n  [!] SEM versao OA (requer acesso institucional):")
        for r in sem_oa:
            print(f"      - {r['authors']} | {r['doi']}")

    print(f"\n  Log salvo em: {log_path}")


if __name__ == "__main__":
    main()
