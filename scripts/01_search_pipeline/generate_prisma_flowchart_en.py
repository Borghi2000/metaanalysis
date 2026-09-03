#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
PRISMA 2020 Flow Diagram Generator (English Version for International Submission).
Reads directly from data/processed/prisma_counts.json.
Outputs directly to:
  - outputs/submission/figures/Figure_1_PRISMA_DTA.png
  - manuscript_elsevier/figures/Figure_1_PRISMA_DTA.png
"""
from __future__ import annotations
import json
from pathlib import Path
import matplotlib.patches as patches
import matplotlib.pyplot as plt

def draw_box(ax, x, y, w, h, text, color="white", fontweight="normal",
             fontsize=9.5, align="center"):
    ax.add_patch(patches.Rectangle((x - w / 2, y - h / 2), w, h, linewidth=1.2,
                                   edgecolor="#2c3e50", facecolor=color, zorder=3))
    ha = "center" if align == "center" else "left"
    tx = x if align == "center" else x - w / 2 + 0.12
    ax.text(tx, y, text, ha=ha, va="center", fontsize=fontsize,
            fontweight=fontweight, fontname="sans-serif", zorder=4, color="#1a1a1a")

def draw_arrow(ax, xs, ys, xe, ye):
    ax.annotate("", xy=(xe, ye), xytext=(xs, ys),
                arrowprops=dict(arrowstyle="->", color="#2c3e50", lw=1.3), zorder=2)

def main():
    counts_path = Path("data/processed/prisma_counts.json")
    counts = json.loads(counts_path.read_text(encoding="utf-8"))
    
    idn = counts["identification"]
    rem = counts["before_screening_removed"]
    scr = counts["screening"]
    elig = counts["eligibility"]
    inc = counts["included"]
    ex = elig["excluded"]

    ex_labels_en = {
        "carta_comentario_editorial": "Letters / commentaries / editorials",
        "texto_completo_inacessivel": "Full text unavailable",
        "indice_nao_generativo_CNN": "Non-generative index test (CNN)",
        "indice_nao_interpreta_imagem_CXR": "Index test does not interpret CXR",
        "populacao_pediatrica": "Pediatric population only",
    }
    ex_lines = "\n".join(
        f"• {ex_labels_en.get(k, k)} (n = {v})" for k, v in ex.items()
    )
    total_excluded = sum(ex.values())

    fig, ax = plt.subplots(figsize=(11, 13.5), dpi=300)
    ax.set_xlim(0, 10)
    ax.set_ylim(0, 14)
    ax.axis("off")
    
    # Title
    ax.text(5, 13.5, "PRISMA 2020 Flow Diagram for New Systematic Reviews",
            ha="center", va="center", fontsize=13, fontweight="bold", color="#111827")

    # Side banners
    ax.add_patch(patches.Rectangle((0.2, 9.4), 0.4, 3.2, facecolor="#90caf9", alpha=0.6))
    ax.text(0.4, 11.0, "Identification", rotation=90, ha="center", va="center",
            fontweight="bold", fontsize=11.5, color="#0d47a1")
            
    ax.add_patch(patches.Rectangle((0.2, 3.4), 0.4, 5.7, facecolor="#90caf9", alpha=0.6))
    ax.text(0.4, 6.25, "Screening", rotation=90, ha="center", va="center",
            fontweight="bold", fontsize=11.5, color="#0d47a1")
            
    ax.add_patch(patches.Rectangle((0.2, 1.2), 0.4, 1.6, facecolor="#a5d6a7", alpha=0.6))
    ax.text(0.4, 2.0, "Included", rotation=90, ha="center", va="center",
            fontweight="bold", fontsize=11.5, color="#1b5e20")

    # Header Box
    draw_box(ax, 5.175, 12.8, 7.5, 0.45,
             "Identification of studies via databases and manual searches",
             color="#ffecb3", fontweight="bold", fontsize=10.5)

    # Box 1: Records identified
    draw_box(ax, 3.0, 11, 3.8, 1.6,
             "Records identified from:\n"
             f"  PubMed / MEDLINE (n = {idn['sources']['PubMed']})\n"
             f"  SciELO (n = {idn['sources']['SciELO']})\n"
             f"  VHL / BVS (n = {idn['sources']['BVS']})\n"
             f"  Manual search / citation tracking (n = {idn['records_identified_manual']})",
             align="left", fontsize=9.2)

    # Box 2: Removed before screening
    draw_box(ax, 7.35, 11, 3.8, 1.2,
             "Records removed before\nscreening:\n"
             f"  Duplicate records (n = {rem['duplicate_records_removed']})",
             align="left", fontsize=9.2)
             
    draw_arrow(ax, 4.9, 11, 5.45, 11)
    draw_arrow(ax, 3.0, 10.2, 3.0, 9.25)

    # Box 3: Screened
    draw_box(ax, 3.0, 8.5, 3.8, 1.0,
             f"Records screened via\nautomated NLP / TF-IDF pipeline\n(n = {scr['records_screened']})",
             fontsize=9.2)
             
    draw_arrow(ax, 4.9, 8.5, 5.45, 8.5)
    
    # Box 4: Excluded by screening
    draw_box(ax, 7.35, 8.5, 3.8, 1.0,
             "Records excluded by\nautomated NLP pipeline\n"
             f"(n = {scr['records_excluded_auto']})", fontsize=9.2)
             
    draw_arrow(ax, 3.0, 8.0, 3.0, 5.6)

    # Box 5: Eligibility
    draw_box(ax, 3.0, 4.9, 3.8, 1.25,
             "Reports sought for retrieval and\nassessed for full-text eligibility\n"
             f"(n = {elig['reports_assessed']})\n"
             f"[{scr['records_passed_tfidf']} from NLP + {scr['manual_added']} manual tracking]",
             align="left", fontsize=9.0)
             
    draw_arrow(ax, 4.9, 4.9, 5.5, 4.9)

    # Box 6: Excluded reports
    draw_box(ax, 7.55, 4.9, 4.1, 2.1,
             f"Reports excluded (n = {total_excluded}):\n{ex_lines}",
             align="left", fontsize=7.8)
             
    draw_arrow(ax, 3.0, 4.275, 3.0, 2.7)

    # Box 7: Included
    draw_box(ax, 3.0, 2.0, 4.1, 1.35,
             f"Studies included in review (n = {inc['studies_included_total']}):\n"
             f"  • Main bivariate 2x2 pool (n = {inc['main_pool_2x2']})\n"
             f"  • Supplemental qualitative pool (n = {inc['supplemental_pool']})",
             color="#c8e6c9", align="left", fontsize=8.6, fontweight="bold")

    # Footnote
    ax.text(1, 0.45,
            "Notes: Primary search conducted across PubMed, SciELO, and VHL (cut-off: June 9, 2026).\n"
            "Title/abstract screening automated via TF-IDF cosine similarity (threshold 0.04, reproducible via pipeline).\n"
            "Full-text eligibility assessed by human reviewer applying PIRT protocol criteria. Source data: data/processed/prisma_counts.json.",
            fontsize=8, ha="left", color="#4b5563")

    targets = [
        Path("outputs/submission/figures/Figure_1_PRISMA_DTA.png"),
        Path("manuscript_elsevier/figures/Figure_1_PRISMA_DTA.png")
    ]
    for t in targets:
        t.parent.mkdir(parents=True, exist_ok=True)
        plt.savefig(t, dpi=300, bbox_inches="tight")
        print(f"[OK] Saved English PRISMA Flowchart to {t}")

if __name__ == "__main__":
    main()
