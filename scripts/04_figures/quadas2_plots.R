# =============================================================================
# RUN_QUADAS_PLOTS.R — VERSÃO DEFINITIVA (PREMIUM + COCHRANE)
# Combina Design Gráfico de Alta Qualidade com Rigor Metodológico Cochrane
# =============================================================================

options(repos = c(CRAN = "https://cran.rstudio.com/"))
required_packages <- c("ggplot2", "dplyr", "tidyr", "forcats", "scales", "patchwork")
for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) install.packages(pkg)
}

library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(scales)
library(patchwork)

cat("🚀 GERANDO GRÁFICOS QUADAS-2 (PREMIUM COCHRANE EDITION)...\n")

# 1. CARREGAR DADOS
path_master <- "data/master_audit.csv"
master <- read.csv(path_master, stringsAsFactors = FALSE, na.strings = "NA")

# 2. TRADUÇÃO E MAPEAMENTO
traduzir <- function(x) {
  x <- trimws(toupper(as.character(x)))
  dplyr::case_when(
    x %in% c("BAIXO", "BAIXA", "LOW")         ~ "Baixo",
    x %in% c("ALTO",  "ALTA",  "HIGH")         ~ "Alto",
    TRUE                                        ~ "Incerto"
  )
}

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

# 3. PREPARAR DATA FRAME PARA GGPLOT
data_long <- master %>%
  mutate(across(all_of(c(names(labels_bias), names(labels_app))), traduzir)) %>%
  # Calcular Overall (Pior cenário dos 4 domínios de viés)
  mutate(overall = case_when(
    q1_selection == "Alto" | q2_index == "Alto" | q3_reference == "Alto" | q4_flow == "Alto" ~ "Alto",
    q1_selection == "Incerto" | q2_index == "Incerto" | q3_reference == "Incerto" | q4_flow == "Incerto" ~ "Incerto",
    TRUE ~ "Baixo"
  )) %>%
  pivot_longer(cols = c(all_of(names(labels_bias)), all_of(names(labels_app)), overall), 
               names_to = "domain_id", values_to = "judgment") %>%
  mutate(
    domain_label = case_when(
      domain_id %in% names(labels_bias) ~ labels_bias[domain_id],
      domain_id %in% names(labels_app) ~ labels_app[domain_id],
      domain_id == "overall" ~ "Risco Geral (Overall)"
    ),
    type = case_when(
      domain_id %in% names(labels_bias) ~ "Risco de Viés",
      domain_id %in% names(labels_app) ~ "Aplicabilidade",
      domain_id == "overall" ~ "Risco Geral"
    ),
    # Ordem dos domínios
    domain_label = factor(domain_label, levels = c(rev(labels_bias), "Risco Geral (Overall)", rev(labels_app))),
    # A coluna `authors` do master_audit JA contem o ano (ex.: "Hong 2025a"); usar
    # paste(authors, year) duplicava o ano nos rotulos ("Akcay 2025 2025").
    authors_year = as.character(authors),
    authors_year = fct_rev(factor(authors_year))
  )

# Cores Cochrane/Standard
colors_quadas <- c("Baixo" = "#00BA38", "Alto" = "#F8766D", "Incerto" = "#F5C710")

# 4. TRAFFIC LIGHT PLOT (PREMIUM DESIGN)
cat("  - Criando Traffic Light Plot...\n")
p_tl <- ggplot(data_long, aes(x = domain_label, y = authors_year)) +
  geom_tile(color = "white", fill = "white") + # Fundo limpo
  geom_point(aes(fill = judgment), size = 9, shape = 21, color = "black", stroke = 0.5) +
  geom_text(aes(label = case_when(
    judgment == "Baixo" ~ "+",
    judgment == "Alto" ~ "X",
    judgment == "Incerto" ~ "?"
  )), fontface = "bold", size = 5.5) +
  facet_grid(.~type, scales = "free_x", space = "free_x") +
  scale_fill_manual(values = colors_quadas) +
  labs(title = "Avaliação de Risco de Viés e Aplicabilidade (QUADAS-2)",
       subtitle = "Detalhamento por Estudo e Domínio (Standard Cochrane Colors)",
       x = NULL, y = NULL, fill = "Julgamento") +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0),
    plot.subtitle = element_text(size = 12, color = "grey40", margin = margin(b=20)),
    strip.text = element_text(face = "bold", size = 12, color = "white"),
    strip.background = element_rect(fill = "grey30", color = NA),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 11, color = "black"),
    axis.text.y = element_text(face = "bold", size = 11, color = "black"),
    panel.spacing = unit(1, "lines"),
    legend.position = "bottom",
    legend.title = element_text(face = "bold"),
    panel.grid = element_blank()
  )

ggsave("outputs/figures/Grafico_QUADAS2_TrafficLight.png", p_tl, width = 14, height = 9, dpi = 300, bg = "white")

# 5. SUMMARY PLOT (PREMIUM DESIGN)
cat("  - Criando Summary Plot...\n")
data_summary <- data_long %>%
  group_by(domain_label, judgment, type) %>%
  summarise(count = n(), .groups = "drop") %>%
  group_by(domain_label) %>%
  mutate(percent = count / sum(count)) %>%
  mutate(judgment = factor(judgment, levels = c("Alto", "Incerto", "Baixo")))

p_sum <- ggplot(data_summary, aes(x = domain_label, y = percent, fill = judgment)) +
  geom_bar(stat = "identity", width = 0.75, color = "white", linewidth = 0.5) +
  geom_text(aes(label = ifelse(percent > 0.04, scales::percent(percent, accuracy = 1), "")), 
            position = position_stack(vjust = 0.5), size = 4, fontface = "bold", color = "black") +
  # Inverter posição do facet strip para o topo se possível, ou ajustar a largura
  facet_grid(type ~ ., scales = "free_y", space = "free_y", switch = "y") + 
  scale_fill_manual(values = colors_quadas) +
  scale_y_continuous(labels = scales::percent_format(), expand = c(0,0)) +
  coord_flip() +
  labs(title = "Resumo do Risco de Viés e Aplicabilidade",
       subtitle = paste0("Percentual de julgamentos acumulados (N=", nrow(master), " estudos)"),
       x = NULL, y = "Proporção de estudos (%)", fill = "Julgamento") +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0),
    plot.subtitle = element_text(size = 12, color = "grey40", margin = margin(b=15)),
    strip.text.y.left = element_text(face = "bold", size = 11, color = "white", angle = 0), # Horizontal no lado esquerdo
    strip.background = element_rect(fill = "grey30", color = NA),
    axis.text = element_text(size = 11, color = "black", face = "bold"),
    panel.spacing = unit(0.5, "lines"),
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    plot.margin = margin(20, 20, 20, 20)
  )

ggsave("outputs/figures/Grafico_QUADAS2_Summary.png", p_sum, width = 12, height = 7, dpi = 300, bg = "white")

cat("\n✅ FIGURAS PREMIUM + COCHRANE SALVAS COM SUCESSO EM outputs/figures/\n")