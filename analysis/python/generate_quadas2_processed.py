#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Gera data/processed/quadas2_assessments.csv a partir da fonte real master_audit.csv.

AUDITORIA: o arquivo data/processed/quadas2_assessments.csv estava como um STUB
(apenas 1 linha real + a linha literal "..."). Os julgamentos QUADAS-2 reais já
existem em data/master_audit.csv (colunas q1_selection..a3_reference, overall_risk);
este script apenas os MATERIALIZA no formato processado — sem inventar dados.

Limitação (declarar no manuscrito): os julgamentos QUADAS-2 foram realizados por
revisor único, assistidos por ferramenta automatizada (ver master_audit: extracted_by
/ verified_by). NÃO há concordância interavaliador medida (ver calculate_kappa.py).
"""

from pathlib import Path
import pandas as pd

SRC = Path("data/master_audit.csv")
OUT = Path("data/processed/quadas2_assessments.csv")

# domínio no master_audit -> rótulo QUADAS-2 no arquivo processado
COLMAP = {
    "study_id": "study_id",
    "authors": "study",
    "year": "year",
    "q1_selection": "rob_patient_selection",
    "q2_index": "rob_index_test",
    "q3_reference": "rob_reference_standard",
    "q4_flow": "rob_flow_timing",
    "a1_selection": "appl_patient_selection",
    "a2_index": "appl_index_test",
    "a3_reference": "appl_reference_standard",
    "overall_risk": "overall_risk",
}


def main() -> None:
    if not SRC.exists():
        raise SystemExit(f"[ERRO] fonte não encontrada: {SRC}")

    df = pd.read_csv(SRC)
    missing = [c for c in COLMAP if c not in df.columns]
    if missing:
        raise SystemExit(f"[ERRO] colunas ausentes em {SRC}: {missing}")

    out = df[list(COLMAP)].rename(columns=COLMAP)
    OUT.parent.mkdir(parents=True, exist_ok=True)
    out.to_csv(OUT, index=False, encoding="utf-8")

    print(f"[OK] {OUT} gerado com {len(out)} estudos (de {SRC}).")
    print(out.to_string(index=False))


if __name__ == "__main__":
    main()
