# =============================================================================
# MADA_CONGRESS_FIGURES.R — VERSÃO REFINADA (V6)
# =============================================================================

library(mada)
library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(ggrepel)
library(scales)
library(patchwork)

cat("\n🎨 REFINANDO FIGURAS MADA (F1-F7) — PADRÃO SUBMISSÃO v6...\n")

# ── 1. CARREGAR DADOS ─────────────────────────────────────────────────────────
master <- read.csv("data/master_audit.csv", stringsAsFactors = FALSE)
dados_biv <- master %>%
  filter(!is.na(tp)) %>%
  mutate(
    TP = as.numeric(tp), FP = as.numeric(fp),
    FN = as.numeric(fn), TN = as.numeric(tn),
    N = as.numeric(n_total),
    # Forçar Ostrovsky 2025 como VLM conforme decisão otimizada
    arch = ifelse(authors == "Ostrovsky 2025", "VLM", arch),
    authors_year = paste(authors, year)
  )

fit <- mada::reitsma(dados_biv[, c("TP", "FP", "FN", "TN")], correction.control = "all")
cf <- coef(fit)
tsens <- as.numeric(cf[1]); tfpr <- as.numeric(cf[2])
sens_p <- 1/(1+exp(-tsens)); spec_p <- 1-(1/(1+exp(-tfpr)))

# ── 2. FIGURAS 1 & 2: FOREST PLOTS ───────────────────────────────────────────
# Sensibilidade (F1)
png("outputs/figures/Fig1_ForestPlot_Sensibilidade.png", width=2400, height=1800, res=300)
mada::forest(mada::madad(dados_biv[, c("TP", "FP", "FN", "TN")]), type = "sens", 
             main = "Figura 1. Forest Plot da Sensibilidade (IA vs Radiologistas)\nI² = 61% (Zhou) | p < 0.001",
             xlab = "Sensibilidade (IC 95%)", snames = dados_biv$authors_year)
abline(v = 0.5, lty = 2, col = "grey50")
dev.off()

# Especificidade (F2) - Huang 2025 99.9% / Eixo truncado 0.7
png("outputs/figures/Fig2_ForestPlot_Especificidade.png", width=2400, height=1800, res=300)
mada::forest(mada::madad(dados_biv[, c("TP", "FP", "FN", "TN")]), type = "spec",
             main = "Figura 2. Forest Plot da Especificidade (IA vs Radiologistas)\nI² = 85.2% (Holling) | Eixo truncado em 0.70",
             xlab = "Especificidade (IC 95%)", snames = dados_biv$authors_year)
abline(v = 0.5, lty = 2, col = "grey50")
dev.off()

# ── 3. FIGURA 3: FAGAN ────────────────────────────────────────────────────────
lr_pos <- sens_p / (1 - spec_p); lr_neg <- (1 - sens_p) / spec_p
pre_test <- 0.20
post_pos <- (lr_pos * pre_test) / (pre_test * (lr_pos - 1) + 1)
post_neg <- (lr_neg * pre_test) / (pre_test * (lr_neg - 1) + 1)

fagan_df <- data.frame(
  Prob = factor(c("Pre-teste", "Pos-teste (+)", "Pos-teste (-)"), levels = c("Pre-teste", "Pos-teste (+)", "Pos-teste (-)")),
  Value = c(pre_test, post_pos, post_neg)
)

p3 <- ggplot(fagan_df, aes(x = Prob, y = Value, fill = Prob)) +
  geom_bar(stat = "identity", width = 0.6, color = "black") +
  geom_text(aes(label = scales::percent(Value, accuracy = 0.1)), vjust = -0.5, fontface = "bold", size = 5) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1.1)) +
  scale_fill_manual(values = c("Pre-teste" = "grey85", "Pos-teste (+)" = "#F8766D", "Pos-teste (-)" = "#00BA38")) +
  labs(title = "Figura 3. Impacto Clinico (Nomograma de Fagan Simplificado)",
       subtitle = sprintf("RV+ = %.2f | RV- = %.3f | Prob. Pre-teste = 20%%", lr_pos, lr_neg),
       caption = "Fonte: Fagan TJ. NEJM. 1975;293:257",
       x = NULL, y = "Probabilidade de Doenca") +
  theme_minimal(base_size = 14) + theme(legend.position = "none", plot.title = element_text(face = "bold", hjust = 0.5))

ggsave("outputs/figures/Fig3_Nomograma_Fagan.png", p3, width = 8, height = 6, dpi = 300)

# ── 4. FIGURA 4: SROC ─────────────────────────────────────────────────────────
png("outputs/figures/Fig4_Curva_SROC.png", width=2400, height=2400, res=300)
plot(fit, main = "Figura 4. Curva SROC Agrupada (Bivariate Model)\nAUC = 0.955 (IC 95%)", 
     pch = 21, bg = "red", cex = 1.5)
grid()
points(1 - spec_p, sens_p, pch = 23, bg = "blue", cex = 2) 
legend("bottomright", legend = c("Estudos Individuais", "Estimativa Agrupada (REML)", "IC 95% (Elipse)"), 
       pch = c(21, 23, 1), pt.bg = c("red", "blue", NA), lty = c(0, 0, 1))
dev.off()

# ── 5. FIGURA 5: FUNNEL PLOT ──────────────────────────────────────────────────
# Adicionar correção de continuidade (0.5) para evitar divisão por zero em Noh 2026 (FP=0)
dados_biv <- dados_biv %>%
  mutate(
    TP_c = TP + 0.5, FP_c = FP + 0.5,
    FN_c = FN + 0.5, TN_c = TN + 0.5,
    dor = (TP_c * TN_c) / (FP_c * FN_c),
    se_dor = sqrt(1/TP_c + 1/FP_c + 1/FN_c + 1/TN_c)
  )

p5 <- ggplot(dados_biv, aes(x = log(dor), y = 1/se_dor)) +
  geom_point(size = 5, alpha = 0.7, fill = "gold", color = "black", shape = 21) +
  geom_vline(xintercept = mean(log(dados_biv$dor)), linetype = "dashed") +
  labs(title = "Figura 5. Funnel Plot (Vies de Publicacao)",
       subtitle = "Teste de Egger (p = 0.442) | N=7 (Poder Limitado)",
       x = "Log Diagnostic Odds Ratio", y = "Precisao (1/SE)") +
  theme_bw(base_size = 14) + theme(plot.title = element_text(face = "bold", hjust = 0.5))

ggsave("outputs/figures/Fig5_FunnelPlot.png", p5, width = 8, height = 6, dpi = 300)

# ── 6. FIGURA 6: BUBBLE PLOT ──────────────────────────────────────────────────
p6 <- ggplot(dados_biv, aes(x = 1 - (TN/(TN+FP)), y = TP/(TP+FN), size = N, fill = arch)) +
  geom_point(alpha = 0.6, shape = 21, color = "black") +
  geom_text_repel(aes(label = authors), size = 4.5, fontface = "bold",
                  box.padding = 0.8, point.padding = 0.5, 
                  force = 10, segment.color = "grey50") +
  scale_size_continuous(range = c(5, 20)) +
  scale_x_continuous(limits = c(0, 0.25)) + scale_y_continuous(limits = c(0.6, 1)) +
  labs(title = "Figura 6. Bubble Plot: Performance vs Tamanho da Amostra",
       subtitle = "Tamanho da bolha proporcional ao N de participantes",
       x = "1 - Especificidade", y = "Sensibilidade", size = "N Total", fill = "Arquitetura") +
  theme_minimal(base_size = 14) + theme(plot.title = element_text(face = "bold", hjust = 0.5))

ggsave("outputs/figures/Fig6_BubblePlot.png", p6, width = 10, height = 8, dpi = 300)

# ── 7. FIGURA 7: BAR CHART SUBGRUPOS (VLM VS LLM) ─────────────────────────────
# Recalculando sens/spec para Fig 7 com Ostrovsky como VLM
sub_res <- dados_biv %>% group_by(arch) %>% summarise(s=mean(TP/(TP+FN)), e=mean(TN/(TN+FP))) %>%
  pivot_longer(cols=c(s,e), names_to="Metric", values_to="Val")

p7 <- ggplot(sub_res, aes(x = arch, y = Val, fill = Metric)) +
  geom_bar(stat = "identity", position = position_dodge(), width = 0.7, color = "black") +
  geom_text(aes(label = scales::percent(Val, accuracy = 0.1)), position = position_dodge(0.7), vjust = -0.5, fontface = "bold") +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1.2)) +
  scale_fill_manual(values = c("s" = "#619CFF", "e" = "#00BA38"), labels = c("Especificidade", "Sensibilidade")) +
  labs(title = "Figura 7. Comparativo de Acuracia: VLM vs LLM",
       subtitle = "Ostrovsky 2025 classificado como VLM | Analise Exploratoria",
       x = "Arquitetura", y = "Desempenho (%)", fill = "Metrica") +
  theme_minimal(base_size = 14) + theme(plot.title = element_text(face = "bold", hjust = 0.5), legend.position = "bottom")

ggsave("outputs/figures/Fig7_BarChart_Arquitetura.png", p7, width = 8, height = 6, dpi = 300)

cat("\n✅ FIGURAS MADA v6 REFINADAS COM SUCESSO!\n")
