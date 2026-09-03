# =============================================================================
# QUADAS2_PLOTS_EN.R — English Version for Elsevier Submission
# Combines Cochrane Methodological Rigor with English Labeling
# =============================================================================

if (dir.exists(".r_lib")) .libPaths(c(".r_lib", .libPaths()))
options(repos = c(CRAN = "https://cran.rstudio.com/"))
required_packages <- c("ggplot2", "dplyr", "tidyr", "forcats", "scales", "patchwork")
for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) install.packages(pkg, lib = ".r_lib")
}

library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(scales)
library(patchwork)

cat("Generating English QUADAS-2 Plots for Elsevier Submission...\n")

# 1. Load Data
master <- read.csv("data/master_audit.csv", stringsAsFactors = FALSE, na.strings = "NA")

# 2. English Translation Function
translate_en <- function(x) {
  x <- trimws(toupper(as.character(x)))
  dplyr::case_when(
    x %in% c("BAIXO", "BAIXA", "LOW")         ~ "Low",
    x %in% c("ALTO",  "ALTA",  "HIGH")        ~ "High",
    TRUE                                       ~ "Unclear"
  )
}

labels_bias <- c(
  "q1_selection" = "Patient Selection",
  "q2_index"     = "Index Test",
  "q3_reference" = "Reference Standard",
  "q4_flow"      = "Flow and Timing"
)
labels_app <- c(
  "a1_selection" = "App.: Patient Selection",
  "a2_index"     = "App.: Index Test",
  "a3_reference" = "App.: Reference Standard"
)

# 3. Data Wrangling
data_long <- master %>%
  mutate(across(all_of(c(names(labels_bias), names(labels_app))), translate_en)) %>%
  mutate(overall = case_when(
    q1_selection == "High" | q2_index == "High" | q3_reference == "High" | q4_flow == "High" ~ "High",
    q1_selection == "Unclear" | q2_index == "Unclear" | q3_reference == "Unclear" | q4_flow == "Unclear" ~ "Unclear",
    TRUE ~ "Low"
  )) %>%
  pivot_longer(cols = c(all_of(names(labels_bias)), all_of(names(labels_app)), overall), 
               names_to = "domain_id", values_to = "judgment") %>%
  mutate(
    domain_label = case_when(
      domain_id %in% names(labels_bias) ~ labels_bias[domain_id],
      domain_id %in% names(labels_app) ~ labels_app[domain_id],
      domain_id == "overall" ~ "Overall Risk of Bias"
    ),
    type = case_when(
      domain_id %in% names(labels_bias) ~ "Risk of Bias",
      domain_id %in% names(labels_app) ~ "Applicability Concerns",
      domain_id == "overall" ~ "Overall Risk"
    ),
    domain_label = factor(domain_label, levels = c(rev(labels_bias), "Overall Risk of Bias", rev(labels_app))),
    authors_year = as.character(authors),
    authors_year = fct_rev(factor(authors_year))
  )

# Cochrane Colors
colors_quadas <- c("Low" = "#00BA38", "High" = "#F8766D", "Unclear" = "#F5C710")

# 4. Traffic Light Plot
cat("  - Creating Traffic Light Plot...\n")
p_tl <- ggplot(data_long, aes(x = domain_label, y = authors_year)) +
  geom_tile(color = "white", fill = "white") +
  geom_point(aes(fill = judgment), size = 9, shape = 21, color = "black", stroke = 0.5) +
  geom_text(aes(label = case_when(
    judgment == "Low" ~ "+",
    judgment == "High" ~ "X",
    judgment == "Unclear" ~ "?"
  )), fontface = "bold", size = 5.5) +
  facet_grid(.~type, scales = "free_x", space = "free_x") +
  scale_fill_manual(values = colors_quadas) +
  labs(title = "Risk of Bias and Applicability Concerns (QUADAS-2)",
       subtitle = "Study-level judgment across domains (Standard Cochrane Colors)",
       x = NULL, y = NULL, fill = "Judgment") +
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

# 5. Summary Plot
cat("  - Creating Summary Plot...\n")
data_summary <- data_long %>%
  group_by(domain_label, judgment, type) %>%
  summarise(count = n(), .groups = "drop") %>%
  group_by(domain_label) %>%
  mutate(percent = count / sum(count)) %>%
  mutate(judgment = factor(judgment, levels = c("High", "Unclear", "Low")))

p_sum <- ggplot(data_summary, aes(x = domain_label, y = percent, fill = judgment)) +
  geom_bar(stat = "identity", width = 0.75, color = "white", linewidth = 0.5) +
  geom_text(aes(label = ifelse(percent > 0.04, scales::percent(percent, accuracy = 1), "")), 
            position = position_stack(vjust = 0.5), size = 4, fontface = "bold", color = "black") +
  facet_grid(type ~ ., scales = "free_y", space = "free_y", switch = "y") + 
  scale_fill_manual(values = colors_quadas) +
  scale_y_continuous(labels = scales::percent_format(), expand = c(0,0)) +
  coord_flip() +
  labs(title = "Risk of Bias and Applicability Concerns Summary",
       subtitle = paste0("Cumulative proportion of study judgments (N = ", nrow(master), " studies)"),
       x = NULL, y = "Proportion of studies (%)", fill = "Judgment") +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0),
    plot.subtitle = element_text(size = 12, color = "grey40", margin = margin(b=15)),
    strip.text.y.left = element_text(face = "bold", size = 11, color = "white", angle = 0),
    strip.background = element_rect(fill = "grey30", color = NA),
    axis.text = element_text(size = 11, color = "black", face = "bold"),
    panel.spacing = unit(0.5, "lines"),
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    plot.margin = margin(20, 20, 20, 20)
  )

p_fig2 <- (p_tl / p_sum) + plot_layout(heights = c(1.2, 1))

targets <- c(
  "outputs/submission/figures/Figure_2_QUADAS2.png",
  "manuscript_elsevier/figures/Figure_2_QUADAS2.png"
)

for (tg in targets) {
  dir.create(dirname(tg), showWarnings = FALSE, recursive = TRUE)
  ggsave(tg, p_fig2, width = 14, height = 15, dpi = 300, bg = "white")
  cat(paste0("[OK] Saved English QUADAS-2 to ", tg, "\n"))
}
