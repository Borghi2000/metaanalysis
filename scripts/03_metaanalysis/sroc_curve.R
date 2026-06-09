library(mada)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggrepel)
library(scales)

# 1. Carregar Dados
master <- read.csv("data/master_audit.csv", stringsAsFactors = FALSE)
dados_biv <- master %>%
  filter(!is.na(tp)) %>%
  mutate(
    TP = as.numeric(tp), FP = as.numeric(fp),
    FN = as.numeric(fn), TN = as.numeric(tn),
    N = as.numeric(n_total),
    authors_year = authors # Ja contem o ano no CSV
  )

fit <- reitsma(dados_biv[, c("TP", "FN", "FP", "TN")])
s <- summary(fit)

# === ESTATISTICAS DERIVADAS DOS DADOS (auditoria: nada hardcoded) =============
# Intervalo de predicao em nivel de estudo (df = n_estudos - 2).
.calc_pi <- function(fit) {
  co <- summary(fit)$coefficients; v <- vcov(fit)
  n  <- nrow(fit$data); tcrit <- qt(0.975, df = n - 2)
  ls <- co[1, 1]; lf <- co[2, 1]
  hw_s <- tcrit * sqrt(fit$Psi[1, 1] + v[1, 1])
  hw_f <- tcrit * sqrt(fit$Psi[2, 2] + v[2, 2])
  list(sens = plogis(c(ls - hw_s, ls + hw_s)),
       spec = c(1 - plogis(lf + hw_f), 1 - plogis(lf - hw_f)))
}
.pis     <- .calc_pi(fit)
pi_sens  <- .pis$sens
pi_spec  <- .pis$spec
auc_val  <- s$AUC$AUC
i2_zhou  <- s$i2[["Zhou"]]
i2_holl  <- max(s$i2[["HollingUnadjusted1"]], s$i2[["HollingUnadjusted2"]], s$i2[["HollingUnadjusted3"]])

# Teste de assimetria de funil de DEEKS (apropriado para DTA; o teste de Egger
# classico nao e recomendado para razoes diagnosticas). ATENCAO: com < 10 estudos
# o teste tem baixa potencia (Cochrane DTA) e seu p deve ser lido com cautela.
.ess    <- (dados_biv$TP + dados_biv$FN) * (dados_biv$TN + dados_biv$FP) /
           ((dados_biv$TP + dados_biv$FN) + (dados_biv$TN + dados_biv$FP))
.lndor  <- log(((dados_biv$TP + 0.5) * (dados_biv$TN + 0.5)) /
               ((dados_biv$FP + 0.5) * (dados_biv$FN + 0.5)))
deeks_p <- tryCatch(summary(lm(.lndor ~ I(1 / sqrt(.ess)), weights = .ess))$coefficients[2, 4],
                    error = function(e) NA_real_)

# RV+ / RV- robustas: pool excluindo o outlier de volume Huang 2025
.dh        <- dados_biv[dados_biv$authors != "Huang 2025", ]
.sh        <- summary(reitsma(.dh[, c("TP", "FN", "FP", "TN")]))$coefficients
.sens_h    <- plogis(.sh[1, 1]); .fpr_h <- plogis(.sh[2, 1])
lr_pos_robust <- .sens_h / .fpr_h
lr_neg_robust <- (1 - .sens_h) / (1 - .fpr_h)

# ── PREPARAÇÃO DE DADOS ADICIONAIS ───────────────────────────────────────────
# Adicionar correção de continuidade (0.5) para as métricas do Funnel Plot
dados_biv <- dados_biv %>%
  mutate(
    TP_c = TP + 0.5, FP_c = FP + 0.5, FN_c = FN + 0.5, TN_c = TN + 0.5,
    dor = (TP_c * TN_c) / (FP_c * FN_c),
    se_dor = sqrt(1/TP_c + 1/FP_c + 1/FN_c + 1/TN_c)
  )

# Recalculando sens/spec para Fig 7 (Subgrupos)
sub_res <- dados_biv %>% 
  mutate(arch = ifelse(authors == "Ostrovsky 2025", "VLM", arch)) %>%
  group_by(arch) %>% 
  summarise(s=mean(TP/(TP+FN)), e=mean(TN/(TN+FP))) %>%
  pivot_longer(cols=c(s,e), names_to="Metric", values_to="Val")

# ── FIGURA 1 & 2: Forest Plots com PI ────────────────────────────────────────

# Custom Forest Plot Function to add PI
generate_forest_with_pi <- function(type, filename, subtitle_stats, pi_range) {
  png(filename, width=2400, height=1800, res=300)
  par(mar = c(6, 4, 4, 2) + 0.1, family = "sans")
  
  mada::forest(mada::madad(dados_biv[, c("TP", "FN", "FP", "TN")]), type = type, 
               main = "", snames = dados_biv$authors_year, cex = 1.1)
  
  # Apenas Subtítulo Estatístico (Normal, linha 1.5)
  title(main = subtitle_stats, line = 1, font.main = 1, cex.main = 1.1)
  
  # Adicionar o PI como uma linha pontilhada larga na base
  abline(v = pi_range, lty = 3, col = "red", lwd = 2)
  mtext(paste0("PI: ", round(pi_range[1]*100, 1), "% - ", round(pi_range[2]*100, 1), "%"), 
        side = 1, line = 4, col = "red", font = 2, cex = 1)
  
  dev.off()
}

generate_forest_with_pi("sens", "outputs/figures/Fig1_Forest_Sens_V10.png",
                        sprintf("I² = %.0f%% (Zhou)", i2_zhou * 100), pi_sens)

generate_forest_with_pi("spec", "outputs/figures/Fig2_Forest_Spec_V10.png",
                        sprintf("I² = %.1f%% (Holling)", i2_holl * 100), pi_spec)


# ── FIGURA 3: Fagan (Cenário de Sensibilidade sem Huang) ─────────────────────
# lr_pos_robust / lr_neg_robust calculados acima (pool sem Huang 2025)
pre_test <- 0.20
post_pos <- (lr_pos_robust * pre_test) / (pre_test * (lr_pos_robust - 1) + 1)

fagan_df <- data.frame(
  Prob = factor(c("Pre-teste", "Pos-teste (Robusto)"), levels = c("Pre-teste", "Pos-teste (Robusto)")),
  Value = c(pre_test, post_pos)
)

p3 <- ggplot(fagan_df, aes(x = Prob, y = Value, fill = Prob)) +
  geom_bar(stat = "identity", width = 0.5, color = "black") +
  geom_text(aes(label = scales::percent(Value, accuracy = 0.1)), vjust = -0.5, fontface = "bold", size = 6) +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1.05)) +
  scale_fill_manual(values = c("Pre-teste" = "grey80", "Pos-teste (Robusto)" = "#E69F00")) +
  labs(title = NULL,
       subtitle = sprintf("RV+ = %.1f | RV- = %.2f | Prob. Pre-teste = 20%%", lr_pos_robust, lr_neg_robust),
       x = NULL, y = "Probabilidade de Doenca") +
  theme_minimal(base_size = 14) +
  theme(plot.subtitle = element_text(size = 13, hjust = 0.5))

ggsave("outputs/figures/Fig3_Fagan_Robust_V10.png", p3, width = 8, height = 7, dpi = 300)


# ── FIGURA 4: SROC com Elipse de Predição ─────────────────────────────────────

png("outputs/figures/Fig4_SROC_Prediction_V10.png", width=2400, height=2400, res=300)
par(mar = c(5, 5, 4, 2), family = "sans")
plot(fit, main = "", pch = 21, bg = "red", cex = 1.5, xlim=c(0, 0.5), ylim=c(0.1, 1.0))
# Apenas Subtítulo
title(main = sprintf("AUC = %.3f | Modelo Reitsma (REML)", auc_val), line = 1, font.main = 1, cex.main = 1.1)
grid()

# Elipse de Predição (Retângulo)
rect(1-pi_spec[2], pi_sens[1], 1-pi_spec[1], pi_sens[2], lty=3, border="darkred", lwd=2)
legend("bottomright", legend = c("Estudos Individuais", "Estimativa Agrupada", "Elipse Confiança 95%", "Região de Predição 95%"), 
       pch = c(21, 23, NA, NA), pt.bg = c("red", "blue", NA, NA), 
       lty = c(0, 0, 1, 3), col=c("black", "black", "black", "darkred"), bty = "n", cex = 1.1)
dev.off()

# ── FIGURA 5: FUNNEL PLOT ──────────────────────────────────────────────────
p5 <- ggplot(dados_biv, aes(x = log(dor), y = 1/se_dor)) +
  geom_point(size = 5, alpha = 0.7, fill = "gold", color = "black", shape = 21) +
  geom_vline(xintercept = mean(log(dados_biv$dor)), linetype = "dashed") +
  labs(title = NULL,
       subtitle = sprintf("Teste de Deeks (p = %.3f; cautela: <10 estudos) | Correcão de Haldane (+0.5)", deeks_p),
       x = "Log Diagnostic Odds Ratio", y = "Precisao (1/SE)") +
  theme_bw(base_size = 14) +
  theme(plot.subtitle = element_text(size = 13, hjust = 0.5))

ggsave("outputs/figures/Fig5_FunnelPlot_V10.png", p5, width = 8, height = 7, dpi = 300)

# ── FIGURA 6: BUBBLE PLOT ──────────────────────────────────────────────────
p6 <- ggplot(dados_biv, aes(x = 1 - (TN/(TN+FP)), y = TP/(TP+FN), size = N, fill = arch)) +
  geom_point(alpha = 0.6, shape = 21, color = "black") +
  geom_text_repel(aes(label = authors_year), size = 4.5, fontface = "bold",
                  box.padding = 0.8, point.padding = 0.5, 
                  force = 10, segment.color = "grey50") +
  scale_size_continuous(range = c(5, 20)) +
  scale_x_continuous(limits = c(0, 0.25)) + scale_y_continuous(limits = c(0.1, 1)) +
  labs(title = NULL,
       subtitle = "Tamanho da bolha proporcional ao N de participantes",
       x = "1 - Especificidade", y = "Sensibilidade", size = "N Total", fill = "Arquitetura") +
  theme_minimal(base_size = 14) +
  theme(plot.subtitle = element_text(size = 13, hjust = 0.5))

ggsave("outputs/figures/Fig6_BubblePlot_V10.png", p6, width = 10, height = 8, dpi = 300)

# ── FIGURA 7: BAR CHART SUBGRUPOS (VLM VS LLM) ─────────────────────────────
p7 <- ggplot(sub_res, aes(x = arch, y = Val, fill = Metric)) +
  geom_bar(stat = "identity", position = position_dodge(), width = 0.7, color = "black") +
  geom_text(aes(label = scales::percent(Val, accuracy = 0.1)), 
            position = position_dodge(0.7), vjust = -0.5, fontface = "bold") +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1.2)) +
  scale_fill_manual(values = c("s" = "#619CFF", "e" = "#00BA38"), 
                    labels = c("Especificidade", "Sensibilidade")) +
  labs(title = NULL,
       subtitle = "Ostrovsky 2025 classificado como VLM | Analise Exploratoria",
       x = "Arquitetura", y = "Desempenho (%)", fill = "Métrica") +
  theme_minimal(base_size = 14) +
  theme(plot.subtitle = element_text(size = 13, hjust = 0.5),
        legend.position = "bottom")

ggsave("outputs/figures/Fig7_BarChart_V10.png", p7, width = 8, height = 7, dpi = 300)

cat("\n✅ TODAS AS 7 FIGURAS V10 PADRONIZADAS (ABNT) COM SUCESSO!\n")
