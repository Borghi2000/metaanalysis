#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Etapa 2 do pipeline — TRIAGEM POR RELEVÂNCIA via TF-IDF (real, determinística).

O que faz
---------
Lê o corpus produzido por `search_nlp_tfidf.py` (`data/raw/all_results_search.csv`,
com colunas `title` e `abstract`), calcula um escore de relevância TF-IDF +
similaridade de cosseno de cada registro contra uma SEMENTE conceitual fixa
(radiografia de tórax + IA generativa/LLM/VLM + acurácia diagnóstica) e aplica o
LIMIAR (default 0.04) descrito no manuscrito (§2.2). Registros com
`relevance_score >= limiar` são triados como potencialmente elegíveis.

Por que é reprodutível/auditável
--------------------------------
- A semente (`SCREENING_SEED`), os parâmetros do `TfidfVectorizer` e o limiar estão
  FIXOS e versionados neste arquivo. Não há aleatoriedade: TF-IDF e cosseno são
  determinísticos. Dado o mesmo `all_results_search.csv` e o mesmo limiar, qualquer
  pessoa obtém EXATAMENTE o mesmo subconjunto triado — esta é a propriedade que torna
  a etapa automatizada de triagem auditável publicamente (DOI 10.5281/zenodo.19115371).
- A triagem automatizada NÃO substitui o julgamento clínico das etapas manuais
  subsequentes (leitura de resumos e de textos completos por revisor), que permanecem
  declaradas como limitação no manuscrito (§4.5).

Saídas
------
- data/processed/screening_tfidf_scored.csv   (todos os registros + escore + incluído)
- data/processed/screening_tfidf_included.csv  (apenas os triados)
- data/processed/SCREENING_PROVENANCE.json     (limiar, parâmetros, contagens)

Uso
---
    python scripts/01_search_pipeline/screen_tfidf.py \
        --input data/raw/all_results_search.csv \
        --output data/processed \
        --threshold 0.04
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# --------------------------------------------------------------------------- #
# Semente conceitual FIXA (PIRT: População + Índice + Acurácia diagnóstica)
# --------------------------------------------------------------------------- #
SCREENING_SEED = (
    "chest radiograph chest x-ray thoracic radiography cxr "
    "generative artificial intelligence large language model llm "
    "vision-language model vlm gpt-4 chatgpt multimodal foundation model llava "
    "diagnostic accuracy sensitivity specificity true positive false positive "
    "confusion matrix auroc roc area under the curve radiology interpretation "
    "pneumothorax tuberculosis pleural interstitial lung disease"
)

# Parâmetros FIXOS do vetorizador (determinístico, sem random_state).
VECTORIZER_KW = dict(
    lowercase=True,
    stop_words="english",
    ngram_range=(1, 2),
    min_df=1,
    sublinear_tf=True,
)
DEFAULT_THRESHOLD = 0.04


def compute_scores(df: pd.DataFrame) -> pd.Series:
    """Escore de relevância = cosseno(TF-IDF(doc), TF-IDF(semente))."""
    docs = (df["title"].fillna("") + " " + df["abstract"].fillna("")).str.strip()
    vectorizer = TfidfVectorizer(**VECTORIZER_KW)
    matrix = vectorizer.fit_transform(docs.tolist() + [SCREENING_SEED])
    seed_vec = matrix[-1]
    doc_matrix = matrix[:-1]
    scores = cosine_similarity(doc_matrix, seed_vec).ravel()
    return pd.Series(scores, index=df.index, name="relevance_score")


def main() -> None:
    ap = argparse.ArgumentParser(description="Triagem TF-IDF determinística.")
    ap.add_argument("--input", default="data/raw/all_results_search.csv",
                    help="CSV do corpus (colunas title, abstract).")
    ap.add_argument("--output", default="data/processed",
                    help="diretório de saída (default: data/processed).")
    ap.add_argument("--threshold", type=float, default=DEFAULT_THRESHOLD,
                    help=f"limiar de relevância (default: {DEFAULT_THRESHOLD}).")
    args = ap.parse_args()

    inp = Path(args.input)
    if not inp.exists():
        raise SystemExit(
            f"[erro] corpus não encontrado: {inp}\n"
            f"       Rode antes: python scripts/01_search_pipeline/search_nlp_tfidf.py"
        )

    df = pd.read_csv(inp)
    for col in ("title", "abstract"):
        if col not in df.columns:
            raise SystemExit(f"[erro] coluna obrigatória ausente no corpus: '{col}'")

    df["relevance_score"] = compute_scores(df)
    df["included"] = df["relevance_score"] >= args.threshold
    df = df.sort_values("relevance_score", ascending=False).reset_index(drop=True)

    out_dir = Path(args.output)
    out_dir.mkdir(parents=True, exist_ok=True)
    df.to_csv(out_dir / "screening_tfidf_scored.csv", index=False, encoding="utf-8")
    included = df[df["included"]]
    included.to_csv(out_dir / "screening_tfidf_included.csv",
                    index=False, encoding="utf-8")

    provenance = {
        "input": str(inp),
        "threshold": args.threshold,
        "vectorizer_params": VECTORIZER_KW,
        "screening_seed": SCREENING_SEED,
        "n_input": int(len(df)),
        "n_included": int(included.shape[0]),
        "n_excluded": int(len(df) - included.shape[0]),
    }
    with open(out_dir / "SCREENING_PROVENANCE.json", "w", encoding="utf-8") as fh:
        json.dump(provenance, fh, ensure_ascii=False, indent=2)

    print("=== TRIAGEM TF-IDF ===")
    print(f"  Entrada      : {len(df)} registros")
    print(f"  Limiar       : {args.threshold}")
    print(f"  Triados (>=) : {included.shape[0]}")
    print(f"  Excluídos    : {len(df) - included.shape[0]}")
    print(f"  Saída        : {out_dir / 'screening_tfidf_included.csv'}")


if __name__ == "__main__":
    main()
