# =============================================================================
# GENERATE_PRISMA_DTA.R
# Geração do Fluxograma PRISMA-DTA (Figura 8)
# =============================================================================

library(ggplot2)

# Coordenadas e Textos para o Fluxograma (Estimativa Baseada no Estudo)
# 1. Identification
# 2. Screening
# 3. Eligibility
# 4. Included

prisma_data <- data.frame(
  x = c(2, 5, 3.5, 3.5, 3.5, 6, 3.5, 6, 3.5, 3.5),
  y = c(10, 10, 8.5, 7, 5.5, 5.5, 4, 4, 2.5, 1.5),
  label = c(
    "Registros identificados em\nbases de dados (n = 4185)",
    "Registros adicionais\n(outras fontes) (n = 12)",
    "Registros apos remocao\nde duplicatas (n = 3165)",
    "Triagem via NLP\n(all_results_dta) (n = 3165)",
    "Artigos de texto completo\navaliados (Eligibility) (n = 74)",
    "Registros excluidos\nvia NLP (n = 3091)",
    "Estudos incluidos na\nsintese qualitativa (n = 10)",
    "Artigos excluidos (n = 64):\n- Reviews/Editorais (30)\n- Sem dados 2x2 (25)\n- Outros/Pediatria (9)",
    "Estudos incluidos na\nsintese quantitativa\n(Meta-analise) (n = 7)",
    "Estudos apenas qualitativos\n(n = 3)"
  ),
  box_type = c("In", "In", "Process", "Process", "Process", "Out", "Included", "Out", "Final", "Final")
)

p <- ggplot(prisma_data, aes(x = x, y = y)) +
  # Caixas
  geom_rect(aes(xmin = x - 1.2, xmax = x + 1.2, ymin = y - 0.4, ymax = y + 0.4), 
            fill = "white", color = "black", size = 0.5) +
  # Texto
  geom_text(aes(label = label), size = 3.5, family = "sans") +
  # Setas (Conexões verticais)
  geom_segment(aes(x = 3.5, y = 8.1, xend = 3.5, yend = 7.4), arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = 3.5, y = 6.6, xend = 3.5, yend = 5.9), arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = 3.5, y = 5.1, xend = 3.5, yend = 4.4), arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = 3.5, y = 3.6, xend = 3.5, yend = 2.9), arrow = arrow(length = unit(0.2, "cm"))) +
  # Setas (Conexões horizontais/saída)
  geom_segment(aes(x = 4.7, y = 7, xend = 4.8, yend = 7)) + # Placeholder
  geom_segment(aes(x = 3.5, y = 5.5, xend = 4.8, yend = 5.5), arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = 3.5, y = 4, xend = 4.8, yend = 4), arrow = arrow(length = unit(0.2, "cm"))) +
  # Conexões iniciais
  geom_segment(aes(x = 2, y = 9.6, xend = 3.5, yend = 8.9), arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = 5, y = 9.6, xend = 3.5, yend = 8.9), arrow = arrow(length = unit(0.2, "cm"))) +
  scale_x_continuous(limits = c(0, 8)) +
  scale_y_continuous(limits = c(0, 11)) +
  theme_void() +
  labs(title = NULL,
       subtitle = "Subtitulo: Fluxograma PRISMA-DTA de Selecao dos Estudos") +
  theme(plot.subtitle = element_text(hjust = 0.5, size = 12, face = "italic"))

ggsave("outputs/figures/Fig8_PRISMA_Flowchart_V10.png", p, width = 10, height = 8, dpi = 300)

cat("\n✅ DIAGRAMA PRISMA-DTA GERADO COM SUCESSO!\n")
