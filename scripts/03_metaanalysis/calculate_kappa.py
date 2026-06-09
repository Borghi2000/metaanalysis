#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Concordância interavaliador (kappa de Cohen) para o QUADAS-2.

Calcula kappa APENAS a partir de avaliações reais de dois revisores independentes.
Se o arquivo do segundo revisor não existir, falha de forma explícita — nunca
fabrica um revisor sintético.

Como usar (quando houver um 2º revisor humano de fato):
  1. O revisor 1 já está em data/master_audit.csv (colunas q1_selection..a3_reference).
  2. Crie data/raw/quadas2_reviewer2.csv com as MESMAS colunas (uma linha por estudo,
     mesma ordem de study_id), preenchidas independentemente pelo 2º revisor
     (use data/raw/quadas2_reviewer2_TEMPLATE.csv como base).
  3. Rode: python scripts/03_metaanalysis/calculate_kappa.py
"""

import sys
from pathlib import Path

import pandas as pd
from sklearn.metrics import cohen_kappa_score

DOMAINS = ["q1_selection", "q2_index", "q3_reference", "q4_flow",
           "a1_selection", "a2_index", "a3_reference"]

R1_PATH = Path("data/master_audit.csv")
R2_PATH = Path("data/raw/quadas2_reviewer2.csv")


def run_kappa() -> None:
    if not R2_PATH.exists():
        sys.exit(
            "[ERRO] Avaliações do 2º revisor não encontradas em "
            f"'{R2_PATH}'.\n"
            "       A concordância interavaliador NÃO pode ser calculada sem um\n"
            "       segundo avaliador humano independente. Este script NÃO gera\n"
            "       um revisor sintético.\n"
            "       Enquanto não houver o 2º revisor, o QUADAS-2 deve ser\n"
            "       reportado como avaliação de revisor único."
        )

    r1 = pd.read_csv(R1_PATH)
    r2 = pd.read_csv(R2_PATH)

    missing = [c for c in DOMAINS if c not in r1.columns or c not in r2.columns]
    if missing:
        sys.exit(f"[ERRO] Colunas de domínio ausentes: {missing}")
    if len(r1) != len(r2):
        sys.exit(f"[ERRO] Nº de estudos difere entre revisores: {len(r1)} vs {len(r2)}")

    r1_list, r2_list = [], []
    for d in DOMAINS:
        r1_list.extend(r1[d].astype(str).str.strip().tolist())
        r2_list.extend(r2[d].astype(str).str.strip().tolist())

    # Validação: só rótulos QUADAS-2 válidos são aceitos (rejeita 'PREENCHER', vazios, etc.)
    VALID = {"Low", "Unclear", "High"}
    invalid = sorted({v for v in r2_list if v not in VALID})
    if invalid:
        sys.exit(
            "[ERRO] O arquivo do 2º revisor contém valores inválidos: "
            f"{invalid}.\n       Use exatamente 'Low', 'Unclear' ou 'High' em todas as "
            "células (substitua todos os 'PREENCHER' do template)."
        )

    kappa = cohen_kappa_score(r1_list, r2_list)
    agree = sum(a == b for a, b in zip(r1_list, r2_list)) / len(r1_list)

    print("CONCORDÂNCIA INTERAVALIADOR (KAPPA DE COHEN) — DADOS REAIS")
    print(f"  - Itens avaliados:        {len(r1_list)}")
    print(f"  - Concordância observada: {agree:.2%}")
    print(f"  - Kappa de Cohen:         {kappa:.3f}")
    print(f"  - Interpretação:          {'aceitável (>0.6)' if kappa > 0.6 else 'requer revisão'}")


if __name__ == "__main__":
    run_kappa()
