# =============================================================================
# PERFECT_QUADAS.R — CUSTOM GGPLOT2
# Excelência Visual e Português (PT-BR) para QUADAS-2
# =============================================================================

options(repos = c(CRAN = "https://cran.rstudio.com/"))
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")
if (!require("tidyr")) install.packages("tidyr")
if (!require("forcats")) install.packages("forcats")
if (!require("scales")) install.packages("scales")

library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(scales)

cat("🚀 INICIANDO RECONSTRUÇÃO PREMIUM DOS GRÁFICOS QUADAS-2...\n")

# 1. CARREGAR DADOS
path_master <- "data/master_audit.csv"
master <- read.csv(path_master, stringsAsFactors = FALSE, na.strings = "NA")

# 2. PREPARAR DADOS (Mapeamento PT-BR)
labels_bias <- c(
  "q1_selection" = "Seleção de pacientes",
  "q2_index"     = "Teste índice",
  "q3_reference" = "Padrão de referência",
  "q4_flow"      = "Fluxo e tempo"
)
labels_app <- c(
  "a1_selection" = "Apli.: Seleção",
  "a2_index"     = "Apli.: Teste índice",
  "a3_reference" = "Apli.: Padrão ref."
)

# Long format para os dois tipos
data_long <- master %>%
  select(authors, all_of(names(labels_bias)), all_of(names(labels_app))) %>%
  pivot_longer(cols = -authors, names_to = "domain_id", values_to = "judgment") %>%
  mutate(
    domain_label = case_when(
      domain_id %in% names(labels_bias) ~ labels_bias[domain_id],
      domain_id %in% names(labels_app) ~ labels_app[domain_id]
    ),
    type = ifelse(domain_id %in% names(labels_bias), "Risco de Viés", "Aplicabilidade"),
    judgment = case_when(
      toupper(judgment) %in% c("LOW", "BAIXO", "BAIXA") ~ "Baixo",
      toupper(judgment) %in% c("HIGH", "ALTO", "ALTA") ~ "Alto",
      TRUE ~ "Incerto"
    ),
    # Ordem dos domínios (Bias primeiro, depois Aplicabilidade)
    domain_label = factor(domain_label, levels = c(rev(labels_bias), rev(labels_app))),
    authors = fct_rev(factor(authors))
  )

colors_quadas <- c("Baixo" = "#00BA38", "Alto" = "#F8766D", "Incerto" = "#F5C710") # Yellow for Unclear is better
shapes_quadas <- c("Baixo" = 21, "Alto" = 21, "Incerto" = 21) # All circles

# 3. TRAFFIC LIGHT PLOT (Custom)
cat("  - Gerando Traffic Light Plot Premium...\n")
p_tl <- ggplot(data_long, aes(x = domain_label, y = authors)) +
  geom_point(aes(fill = judgment), size = 8, shape = 21, color = "black", stroke = 0.5) +
  geom_text(aes(label = case_when(
    judgment == "Baixo" ~ "+",
    judgment == "Alto" ~ "X",
    judgment == "Incerto" ~ "?"
  )), fontface = "bold", size = 5) +
  facet_grid(.~type, scales = "free_x", space = "free_x") +
  scale_fill_manual(values = colors_quadas) +
  labs(title = "Avaliação de Risco de Viés e Aplicabilidade (QUADAS-2)",
       subtitle = "Detalhamento por Estudo e Domínio",
       x = NULL, y = NULL, fill = "Julgamento") +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    axis.text.y = element_text(face = "italic", size = 11),
    panel.grid.major = element_line(color = "grey90"),
    legend.position = "bottom"
  )

ggsave("outputs/figures/Grafico_QUADAS2_TrafficLight_PREMIUM.png", p_tl, width = 12, height = 8, dpi = 300, bg = "white")

# 4. SUMMARY PLOT (Custom)
cat("  - Gerando Summary Plot Premium...\n")
data_summary <- data_long %>%
  group_by(domain_label, judgment, type) %>%
  summarise(count = n(), .groups = "drop") %>%
  group_by(domain_label) %>%
  mutate(percent = count / sum(count)) %>%
  # Inverter ordem para que 'Baixo' seja o primeiro na barra (verde à esquerda)
  mutate(judgment = factor(judgment, levels = c("Alto", "Incerto", "Baixo")))

p_sum <- ggplot(data_summary, aes(x = domain_label, y = percent, fill = judgment)) +
  geom_bar(stat = "identity", width = 0.7, color = "white") +
  geom_text(aes(label = ifelse(percent > 0.05, scales::percent(percent, accuracy = 1), "")), 
            position = position_stack(vjust = 0.5), size = 3.5, fontface = "bold") +
  facet_grid(type ~ ., scales = "free_y", space = "free_y") +
  scale_fill_manual(values = colors_quadas) +
  scale_y_continuous(labels = scales::percent_format()) +
  coord_flip() +
  labs(title = "Resumo do Risco de Viés e Aplicabilidade",
       subtitle = "Percentual de julgamentos por domínio (N=10 estudos)",
       x = NULL, y = "Proporção de estudos (%)", fill = "Julgamento") +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    strip.text = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 11),
    legend.position = "bottom"
  )

ggsave("outputs/figures/Grafico_QUADAS2_Summary_PREMIUM.png", p_sum, width = 10, height = 6, dpi = 300, bg = "white")

cat("✅ FIGURAS PREMIUM SALVAS COM SUCESSO!\n")
