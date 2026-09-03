#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Gerador do fluxograma PRISMA-DTA 2020 — RASTREÁVEL (sem números hardcoded).

TODOS os contadores são lidos de uma fonte única e versionada:
`data/processed/prisma_counts.json` (regenerado a partir da rodada real de busca de
2026-06-09). Cada bloco declara a proveniência do número. O diagrama reflete
automaticamente os dados — alterou o JSON, a figura muda.

Uso
---
    python scripts/01_search_pipeline/generate_prisma_flowchart.py \
        --counts data/processed/prisma_counts.json \
        --output outputs/figures/Fig8_PRISMA_Flowchart_V10.png

O nome de saida termina em `_V10` para casar com a figura consumida pelo main.tex
(`figures/Fig8_PRISMA_Flowchart_V10.jpg`) e com a convencao das demais figuras. Antes
o script gravava em `Fig8_PRISMA_Flowchart.png`, sem o sufixo: reexecutar o pipeline
atualizava um arquivo que o manuscrito nao usava, deixando a figura publicada
silenciosamente defasada.
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
    ap.add_argument("--output",
                    default="outputs/figures/Fig8_PRISMA_Flowchart_V10.png")
    args = ap.parse_args()

    counts = json.loads(Path(args.counts).read_text(encoding="utf-8"))
    idn = counts["identification"]
    rem = counts["before_screening_removed"]
    scr = counts["screening"]
    elig = counts["eligibility"]
    inc = counts["included"]
    ex = elig["excluded"]

    # Rótulos legíveis para os motivos de exclusão (chave -> texto)
    ex_labels = {
        "carta_comentario_editorial": "Cartas/comentarios/editoriais",
        "texto_completo_inacessivel": "Texto completo inacessivel",
        "indice_nao_generativo_CNN": "Indice nao generativo (CNN)",
        "indice_nao_interpreta_imagem_CXR": "Indice nao interpreta imagem CXR",
        "populacao_pediatrica": "Populacao pediatrica",
    }
    ex_lines = "\n".join(
        f"{ex_labels.get(k, k)} ({v})" for k, v in ex.items()
    )
    total_excluded = sum(ex.values())

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
    ax.add_patch(patches.Rectangle((0.2, 1.3), 0.4, 1.4, facecolor="#a5d6a7", alpha=0.5))
    ax.text(0.4, 2.0, "Incluido", rotation=90, ha="center", va="center",
            fontweight="bold", fontsize=11)

    draw_box(ax, 5, 12.8, 6, 0.4,
             "Identificacao de estudos via bases de dados e busca manual",
             color="#ffc107", fontweight="bold")
    draw_box(ax, 3, 11, 3.2, 1.5,
             "Registros identificados:\n"
             f"PubMed (n = {idn['sources']['PubMed']})\n"
             f"SciELO (n = {idn['sources']['SciELO']})\n"
             f"BVS (n = {idn['sources']['BVS']})\n"
             f"Busca manual (n = {idn['records_identified_manual']})", align="left")
    draw_box(ax, 7, 11, 3.2, 1.2,
             "Registros removidos antes\nda triagem:\n"
             f"Duplicados (n = {rem['duplicate_records_removed']})", align="left")
    draw_arrow(ax, 4.6, 11, 5.4, 11)
    draw_arrow(ax, 3, 10.25, 3, 9.25)

    draw_box(ax, 3, 8.5, 3.2, 0.9,
             f"Registros triados por TF-IDF\n(n = {scr['records_screened']})")
    draw_arrow(ax, 4.6, 8.5, 5.4, 8.5)
    draw_box(ax, 7, 8.5, 3.2, 0.9,
             "Registros excluidos pela\n"
             f"triagem automatizada\n(n = {scr['records_excluded_auto']})")
    draw_arrow(ax, 3, 8.05, 3, 5.5)

    draw_box(ax, 3, 5, 3.2, 1.1,
             "Relatorios avaliados para\nelegibilidade (texto completo)\n"
             f"(n = {elig['reports_assessed']})\n"
             f"[{scr['records_passed_tfidf']} TF-IDF + {scr['manual_added']} manual]",
             align="left")
    draw_arrow(ax, 4.6, 5, 5.4, 5)
    draw_box(ax, 7, 4.9, 3.4, 1.9,
             f"Relatorios excluidos (n = {total_excluded}):\n{ex_lines}", align="left",
             fontsize=8)
    draw_arrow(ax, 3, 4.45, 3, 2.6)

    draw_box(ax, 3, 1.9, 3.4, 1.3,
             f"Estudos incluidos na revisao (n = {inc['studies_included_total']})\n"
             f"- Pool principal/2x2 (n = {inc['main_pool_2x2']})\n"
             f"- Pool suplementar (n = {inc['supplemental_pool']})",
             color="#a5d6a7", align="left")

    ax.text(1, 0.4,
            "Busca real PubMed (2026-06-09); SciELO/BVS retornaram 0. Triagem de "
            "titulo/resumo AUTOMATIZADA (TF-IDF + cosseno, limiar 0.04), reproduzivel "
            "pelo codigo.\nElegibilidade por texto completo (revisor) aplicando criterios "
            "PIRT do protocolo. Fonte dos numeros: data/processed/prisma_counts.json.",
            fontsize=8, ha="left")

    out = Path(args.output)
    out.parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(out, dpi=300, bbox_inches="tight")
    print(f"[OK] Fluxograma PRISMA gerado em {out} (contadores de {args.counts})")


if __name__ == "__main__":
    main()
