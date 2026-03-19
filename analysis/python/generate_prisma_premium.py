import matplotlib.pyplot as plt
import matplotlib.patches as patches

def draw_box(ax, x, y, width, height, text, color="white", fontweight="normal", fontsize=9, align="center"):
    rect = patches.Rectangle((x-width/2, y-height/2), width, height, linewidth=1.2, edgecolor="black", facecolor=color, zorder=3)
    ax.add_patch(rect)
    ha = "center" if align == "center" else "left"
    text_x = x if align == "center" else x - width/2 + 0.1
    ax.text(text_x, y, text, ha=ha, va="center", fontsize=fontsize, fontweight=fontweight, fontname="sans-serif", zorder=4)

def draw_arrow(ax, xstart, ystart, xend, yend):
    ax.annotate("", xy=(xend, yend), xytext=(xstart, ystart),
                arrowprops=dict(arrowstyle="->", color="black", lw=1.2), zorder=2)

fig, ax = plt.subplots(figsize=(12, 14))
ax.set_xlim(0, 10)
ax.set_ylim(0, 14)
ax.axis("off")

# Title
ax.text(5, 13.5, "Fluxograma PRISMA 2020 para novas revisoes sistematicas", ha="center", va="center", fontsize=12, fontweight="bold")

# Sections Side Labels
ax.add_patch(patches.Rectangle((0.2, 9.5), 0.4, 3, facecolor="#90caf9", alpha=0.5))
ax.text(0.4, 11, "Identificacao", rotation=90, ha="center", va="center", fontweight="bold", fontsize=11)

ax.add_patch(patches.Rectangle((0.2, 3.5), 0.4, 5.5, facecolor="#90caf9", alpha=0.5))
ax.text(0.4, 6.25, "Triagem", rotation=90, ha="center", va="center", fontweight="bold", fontsize=11)

ax.add_patch(patches.Rectangle((0.2, 1.5), 0.4, 1.5, facecolor="#a5d6a7", alpha=0.5))
ax.text(0.4, 2.25, "Incluido", rotation=90, ha="center", va="center", fontweight="bold", fontsize=11)

# Boxes Layout
# 1. Identification
draw_box(ax, 5, 12.8, 6, 0.4, "Identificacao de estudos via bases de dados e registros", color="#ffc107", fontweight="bold")

draw_box(ax, 3, 11, 3, 1.5, "Registros identificados em*:\nBases de dados (n = 4185)\nRegistros (n = 12)", align="left")
draw_box(ax, 7, 11, 3, 1.5, "Registros removidos antes\nda triagem:\nRegistros duplicados (n = 1032)\nRemovidos via NLP (n = 0)\nOutros motivos (n = 0)", align="left")
draw_arrow(ax, 4.5, 11, 5.5, 11)

draw_arrow(ax, 3, 10.25, 3, 9.25)

# 2. Screening
draw_box(ax, 3, 8.5, 3, 0.8, "Registros triados\n(n = 3165)")
draw_arrow(ax, 4.5, 8.5, 5.5, 8.5)
draw_box(ax, 7, 8.5, 3, 0.8, "Registros excluidos**\n(n = 3091)")

draw_arrow(ax, 3, 8.1, 3, 7.4)

# 3. Eligibility
draw_box(ax, 3, 7, 3, 0.8, "Relatorios buscados para\nrecuperacao (n = 74)")
draw_arrow(ax, 4.5, 7, 5.5, 7)
draw_box(ax, 7, 7, 3, 0.8, "Relatorios nao recuperados\n(n = 0)")

draw_arrow(ax, 3, 6.6, 3, 5.9)

draw_box(ax, 3, 5, 3, 1, "Relatorios avaliados para\nelegibilidade (n = 74)")
draw_arrow(ax, 4.5, 5, 5.5, 5)
draw_box(ax, 7, 5, 3, 1.5, "Relatorios excluidos:\nReviews/Editoriais (30)\nSem dados 2x2 (25)\nOutros/Pediatria (9)", align="left")

draw_arrow(ax, 3, 4.5, 3, 2.75)

# 4. Included
draw_box(ax, 3, 2, 3, 1, "Estudos incluidos na revisao\n(n = 10)\nRelatorios de estudos\nincluidos (n = 10)", align="left")

# Footnotes
ax.text(1, 0.5, "*Considerar, se viavel, relatar o numero de registros identificados em cada base de dados consultada.\n**Se ferramentas de automacao foram usadas, indicar quantos registros foram excluidos por humanos e por automacao.", fontsize=8, ha="left")

plt.savefig("outputs/figures/Fig8_PRISMA_Flowchart_V10.png", dpi=300, bbox_inches="tight")
print("\n✅ DIAGRAMA PRISMA 2020 (PORTUGUES) GERADO COM SUCESSO")
