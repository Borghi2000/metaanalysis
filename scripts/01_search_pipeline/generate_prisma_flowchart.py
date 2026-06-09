#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Gerador do fluxograma PRISMA-DTA 2020 — RASTREÁVEL (sem números hardcoded).

Substitui o antigo `manual_validation.py`, cujo nome não correspondia ao conteúdo
e cujos contadores estavam todos embutidos no código (4185, 3165, 74, 10 …), sem
qualquer ligação com os dados — um passivo para auditoria.

Aqui TODOS os contadores são lidos de uma fonte única e versionada:
`data/processed/prisma_counts.json`, onde cada bloco declara a proveniência do
número (automatizado vs. revisão manual). Após o run real do pipeline, os contadores
automatizados devem ser regenerados a partir de `SEARCH_PROVENANCE.json` e
`SCREENING_PROVENANCE.json` e gravados nesse mesmo JSON — o diagrama então reflete
automaticamente os dados.

Uso
---
    python scripts/01_search_pipeline/generate_prisma_flowchart.py \
        --counts data/processed/prisma_counts.json \
        --output outputs/figures/Fig8_PRISMA_Flowchart.png
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

import matplotlib.patches as patches
import matplotlib.pyplot as plt


def draw_box(ax, x, y, w, h, text, color="white", fontweight="normal",
             fontsize=9, align="center"):
    ax.add_patch(patches.Rectangle((x - w / 2, y - h / 2), w, h, linewidth=1.2,
                                   edgecolor="black", facecolor=color, zorder=3))
    ha = "center" if align == "center" else "left"
    tx = x if align == "center" else x - w / 2 + 0.1
    ax.text(tx, y, text, ha=ha, va="center", fontsize=fontsize,
            fontweight=fontweight, fontname="sans-serif", zorder=4)


def draw_arrow(ax, xs, ys, xe, ye):
    ax.annotate("", xy=(xe, ye), xytext=(xs, ys),
                arrowprops=dict(arrowstyle="->", color="black", lw=1.2), zorder=2)


def main() -> None:
    ap = argparse.ArgumentParser(description="Fluxograma PRISMA-DTA rastreável.")
    ap.add_argument("--counts", default="data/processed/prisma_counts.json")
    ap.add_argument("--output", default="outputs/figures/Fig8_PRISMA_Flowchart.png")
    args = ap.parse_args()

    counts = json.loads(Path(args.counts).read_text(encoding="utf-8"))
    idn = counts["identification"]
    rem = counts["before_screening_removed"]
    scr = counts["screening"]
    ret = counts["retrieval"]
    elig = counts["eligibility"]
    inc = counts["included"]
    ex = elig["excluded"]

    fig, ax = plt.subplots(figsize=(12, 14))
    ax.set_xlim(0, 10)
    ax.set_ylim(0, 14)
    ax.axis("off")
    ax.text(5, 13.5, "Fluxograma PRISMA 2020 para novas revisoes sistematicas",
            ha="center", va="center", fontsize=12, fontweight="bold")

    # Faixas laterais
    ax.add_patch(patches.Rectangle((0.2, 9.5), 0.4, 3, facecolor="#90caf9", alpha=0.5))
    ax.text(0.4, 11, "Identificacao", rotation=90, ha="center", va="center",
            fontweight="bold", fontsize=11)
    ax.add_patch(patches.Rectangle((0.2, 3.5), 0.4, 5.5, facecolor="#90caf9", alpha=0.5))
    ax.text(0.4, 6.25, "Triagem", rotation=90, ha="center", va="center",
            fontweight="bold", fontsize=11)
    ax.add_patch(patches.Rectangle((0.2, 1.5), 0.4, 1.5, facecolor="#a5d6a7", alpha=0.5))
    ax.text(0.4, 2.25, "Incluido", rotation=90, ha="center", va="center",
            fontweight="bold", fontsize=11)

    draw_box(ax, 5, 12.8, 6, 0.4,
             "Identificacao de estudos via bases de dados e registros",
             color="#ffc107", fontweight="bold")
    draw_box(ax, 3, 11, 3, 1.5,
             f"Registros identificados em*:\nBases de dados (n = {idn['records_identified_databases']})"
             f"\nRegistros (n = {idn['records_identified_registers']})", align="left")
    draw_box(ax, 7, 11, 3, 1.5,
             "Registros removidos antes\nda triagem:\n"
             f"Duplicados (n = {rem['duplicate_records_removed']})\n"
             f"Removidos via NLP (n = {rem['removed_via_nlp_automation']})\n"
             f"Outros motivos (n = {rem['removed_other_reasons']})", align="left")
    draw_arrow(ax, 4.5, 11, 5.5, 11)
    draw_arrow(ax, 3, 10.25, 3, 9.25)

    draw_box(ax, 3, 8.5, 3, 0.8, f"Registros triados\n(n = {scr['records_screened']})")
    draw_arrow(ax, 4.5, 8.5, 5.5, 8.5)
    draw_box(ax, 7, 8.5, 3, 0.8, f"Registros excluidos**\n(n = {scr['records_excluded']})")
    draw_arrow(ax, 3, 8.1, 3, 7.4)

    draw_box(ax, 3, 7, 3, 0.8,
             f"Relatorios buscados para\nrecuperacao (n = {ret['reports_sought_for_retrieval']})")
    draw_arrow(ax, 4.5, 7, 5.5, 7)
    draw_box(ax, 7, 7, 3, 0.8,
             f"Relatorios nao recuperados\n(n = {ret['reports_not_retrieved']})")
    draw_arrow(ax, 3, 6.6, 3, 5.9)

    draw_box(ax, 3, 5, 3, 1,
             f"Relatorios avaliados para\nelegibilidade (n = {elig['reports_assessed']})")
    draw_arrow(ax, 4.5, 5, 5.5, 5)
    draw_box(ax, 7, 5, 3, 1.5,
             "Relatorios excluidos:\n"
             f"Reviews/Editoriais ({ex['reviews_editorials']})\n"
             f"Sem dados 2x2 ({ex['no_2x2_data']})\n"
             f"Outros/Pediatria ({ex['other_or_pediatric']})", align="left")
    draw_arrow(ax, 3, 4.5, 3, 2.75)

    draw_box(ax, 3, 2, 3, 1,
             f"Estudos incluidos na revisao\n(n = {inc['studies_included']})\n"
             f"Relatorios de estudos\nincluidos (n = {inc['reports_of_included_studies']})",
             align="left")

    ax.text(1, 0.5,
            "*Numero de registros identificados em cada base: ver SEARCH_PROVENANCE.json.\n"
            "**Triagem por revisor unico (titulo/resumo); etapa manual, nao coberta pelo codigo.",
            fontsize=8, ha="left")

    out = Path(args.output)
    out.parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(out, dpi=300, bbox_inches="tight")
    print(f"[OK] Fluxograma PRISMA gerado em {out} (contadores de {args.counts})")


if __name__ == "__main__":
    main()
