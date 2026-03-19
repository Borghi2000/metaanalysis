# =============================================================================
# META-ANÁLISE MADA - GENAI EM RADIOGRAFIA DE TÓRAX
# Gráficos e Tabelas em PORTUGUÊS
# =============================================================================

library(mada)
library(ggplot2)

cat("\n")
cat("╔════════════════════════════════════════════════════════════════════════╗\n")
cat("║          META-ANÁLISE BIVARIADA FINAL - GENAI EM RADIOGRAFIA          ║\n")
cat("║                    (Versão em Português - N=7)                        ║\n")
cat("╚════════════════════════════════════════════════════════════════════════╝\n\n")

# =============================================================================
# 1. CARREGAR E PREPARAR DADOS
# =============================================================================

cat("📂 CARREGANDO DADOS AUDITADOS...\n")
path_audit <- "data/raw/audit_database.csv"
if (!file.exists(path_audit)) stop("Arquivo audit_database.csv não encontrado!")

full_data <- read.csv(path_audit, stringsAsFactors = FALSE)

# Separar estudos por tipo
dados <- full_data[full_data$verified_sum == "YES", ]
dados_acc <- full_data[full_data$verified_sum == "Accuracy Only", ]

cat(sprintf("   ✓ %d estudos bivariados carregados\n", nrow(dados)))
cat(sprintf("   ✓ %d estudos de acurácia carregados\n", nrow(dados_acc)))

# Converter para numérico e preparar mada
dados$TP <- as.numeric(dados$tp)
dados$FP <- as.numeric(dados$fp)
dados$TN <- as.numeric(dados$tn)
dados$FN <- as.numeric(dados$fn)
dados$N  <- as.numeric(dados$n_total)

# Sensibilidade e especificidade individuais
dados$sens_ind <- dados$TP / (dados$TP + dados$FN)
dados$spec_ind <- dados$TN / (dados$TN + dados$FP)

cat("\n════════════════════════════════════════════════════════════════════════\n")

# =============================================================================
# 2. EXECUTAR META-ANÁLISE BIVARIADA (REITSMA)
# =============================================================================

cat("📊 EXECUTANDO META-ANÁLISE BIVARIADA (REITSMA)...\n\n")

fit_overall <- reitsma(dados[, c("TP", "FN", "FP", "TN")])
coef <- summary(fit_overall)$coefficients

# Extrair estimativas agrupadas
sens_pooled <- plogis(coef["tsens.(Intercept)", "Estimate"])
spec_pooled <- 1 - plogis(coef["tfpr.(Intercept)", "Estimate"])

# Calcular IC 95%
se_logit_sens <- sqrt(vcov(fit_overall)["tsens.(Intercept)", "tsens.(Intercept)"])
se_logit_spec <- sqrt(vcov(fit_overall)["tfpr.(Intercept)", "tfpr.(Intercept)"])

ci_lo_sens <- plogis(coef["tsens.(Intercept)", "Estimate"] - 1.96 * se_logit_sens)
ci_hi_sens <- plogis(coef["tsens.(Intercept)", "Estimate"] + 1.96 * se_logit_sens)

ci_lo_spec <- 1 - plogis(coef["tfpr.(Intercept)", "Estimate"] + 1.96 * se_logit_spec)
ci_hi_spec <- 1 - plogis(coef["tfpr.(Intercept)", "Estimate"] - 1.96 * se_logit_spec)

# Razões de verossimilhança
lr_pos <- sens_pooled / (1 - spec_pooled)
lr_neg <- (1 - sens_pooled) / spec_pooled

cat(sprintf("✓ Sensibilidade agrupada:  %.1f%% [IC 95%%: %.1f%%-%.1f%%]\n", 
            sens_pooled*100, ci_lo_sens*100, ci_hi_sens*100))
cat(sprintf("✓ Especificidade agrupada: %.1f%% [IC 95%%: %.1f%%-%.1f%%]\n", 
            spec_pooled*100, ci_lo_spec*100, ci_hi_spec*100))
cat(sprintf("✓ Razão de verossimilhança POSITIVA: %.2f\n", lr_pos))
cat(sprintf("✓ Razão de verossimilhança NEGATIVA: %.3f\n\n", lr_neg))

# Heterogeneidade será relatada na análise
# (σ² da interceptação de sensibilidade)

# =============================================================================
# 3. TABELA 1: CARACTERÍSTICAS DOS ESTUDOS
# =============================================================================

cat("\n📋 TABELA 1: CARACTERÍSTICAS DOS ESTUDOS INCLUÍDOS\n")
cat("─────────────────────────────────────────────────────────────────────\n\n")

tabela1 <- data.frame(
  "Estudo" = paste0(dados$authors, " (", dados$year, ")"),
  "Arquitetura" = dados$arch,
  "Cenário" = dados$clinical_scenario,
  "N Total" = dados$N,
  "TP" = dados$TP,
  "FP" = dados$FP,
  "FN" = dados$FN,
  "TN" = dados$TN
)

print(tabela1, row.names = FALSE)

# Salvar Tabela 1
write.csv(tabela1, "outputs/statistics/Tabela1_Estudos_Incluidos.csv", row.names = FALSE)
cat("\n✓ Salvo: outputs/statistics/Tabela1_Estudos_Incluidos.csv\n")

# =============================================================================
# 4. TABELA 2: RESULTADOS DE DESEMPENHO DIAGNÓSTICO
# =============================================================================

cat("\n📋 TABELA 2: DESEMPENHO DIAGNÓSTICO INDIVIDUAL DOS ESTUDOS\n")
cat("─────────────────────────────────────────────────────────────────────\n\n")

tabela2 <- data.frame(
  "Estudo" = paste0(dados$authors, " (", dados$year, ")"),
  "Sensibilidade %" = paste0(sprintf("%.1f%%", dados$sens_ind*100)),
  "Especificidade %" = paste0(sprintf("%.1f%%", dados$spec_ind*100)),
  "VP" = dados$TP,
  "FP" = dados$FP,
  "FN" = dados$FN,
  "VN" = dados$TN,
  "Acurácia %" = sprintf("%.1f%%", 
                         (dados$TP + dados$TN) / (dados$TP + dados$FP + dados$FN + dados$TN) * 100)
)

print(tabela2, row.names = FALSE)

# Salvar Tabela 2
write.csv(tabela2, "outputs/statistics/Tabela2_Desempenho_Individual.csv", row.names = FALSE)
cat("\n✓ Salvo: outputs/statistics/Tabela2_Desempenho_Individual.csv\n")

# =============================================================================
# 5. TABELA 3: RESULTADOS AGRUPADOS
# =============================================================================

cat("\n📋 TABELA 3: RESULTADOS META-ANALÍTICOS AGRUPADOS\n")
cat("─────────────────────────────────────────────────────────────────────\n\n")

tabela3 <- data.frame(
  "Métrica" = c("Sensibilidade", "Especificidade", "RV Positiva", "RV Negativa", 
                 "Estudos Incluídos", "Total de Participantes"),
  "Estimativa" = c(
    sprintf("%.1f%%", sens_pooled*100),
    sprintf("%.1f%%", spec_pooled*100),
    sprintf("%.2f", lr_pos),
    sprintf("%.3f", lr_neg),
    nrow(dados),
    sum(dados$n_total)
  ),
  "IC 95%" = c(
    sprintf("%.1f%%-%.1f%%", ci_lo_sens*100, ci_hi_sens*100),
    sprintf("%.1f%%-%.1f%%", ci_lo_spec*100, ci_hi_spec*100),
    "—",
    "—",
    "—",
    "—"
  )
)

print(tabela3, row.names = FALSE)

# Salvar Tabela 3
write.csv(tabela3, "outputs/statistics/Tabela3_Resultados_Agrupados.csv", row.names = FALSE)
cat("\n✓ Salvo: outputs/statistics/Tabela3_Resultados_Agrupados.csv\n")

# =============================================================================
# 6. FOREST PLOT - SENSIBILIDADE
# =============================================================================

cat("\n📈 GERANDO GRÁFICOS...\n")

png("outputs/figures/Grafico_1_FlorestaS.png", width = 1200, height = 700, res = 120)
par(mar = c(5, 16, 4, 2), family = "sans")

sens_vals <- dados$sens_ind
y_pos <- nrow(dados):1

plot(NA, xlim = c(0.3, 1.0), ylim = c(0.2, nrow(dados) + 1.5),
     xlab = "Sensibilidade", ylab = "",
     main = "Gráfico 1: Floresta de Sensibilidade por Estudo (N=7)",
     yaxt = "n", font.main = 2, cex.main = 1.4, cex.lab = 1.1)

# Estudos individuais
for(i in 1:nrow(dados)) {
  se_sens <- sqrt(sens_vals[i] * (1 - sens_vals[i]) / (dados$TP[i] + dados$FN[i]))
  ci_lo <- max(0, sens_vals[i] - 1.96 * se_sens)
  ci_hi <- min(1, sens_vals[i] + 1.96 * se_sens)
  
  segments(ci_lo, y_pos[i], ci_hi, y_pos[i], lwd = 2.5, col = "#003D82")
  points(sens_vals[i], y_pos[i], pch = 15, cex = 1.8, col = "#003D82")
}

# Estimativa agrupada
ci_lo_pool_sens <- max(0.3, ci_lo_sens)
ci_hi_pool_sens <- min(1.0, ci_hi_sens)
segments(ci_lo_pool_sens, 0.4, ci_hi_pool_sens, 0.4, lwd = 4, col = "#DC143C")
points(sens_pooled, 0.4, pch = 18, cex = 3.2, col = "#DC143C")

# Rótulos dos estudos
study_labels <- paste0(dados$authors, "\n(", dados$year, ")\nn=", dados$n_total)
axis(2, at = y_pos, labels = study_labels, las = 1, cex.axis = 0.9, font = 1)
axis(2, at = 0.4, labels = "AGRUPADO", las = 1, cex.axis = 1.0, font = 2, col.axis = "#DC143C")

# Linha vertical
abline(v = sens_pooled, lty = 2, col = "gray40", lwd = 1.5, alpha = 0.7)

# Anotação
text(0.32, nrow(dados) + 1.0,
     sprintf("Sensibilidade Agrupada: %.1f%%\n[IC 95%%: %.1f%%-%.1f%%]",
             sens_pooled*100, ci_lo_sens*100, ci_hi_sens*100),
     cex = 1.0, font = 2, adj = 0,
     bbox = list(boxstyle = "round", fill = "#FFF8DC", col = "#DC143C", lwd = 2))

axis(1, at = seq(0.3, 1.0, 0.1), cex.axis = 0.9)
dev.off()

cat("   ✓ Gráfico 1: outputs/figures/Grafico_1_FlorestaS.png\n")

# =============================================================================
# 7. FOREST PLOT - ESPECIFICIDADE
# =============================================================================

png("outputs/figures/Grafico_2_FlorestaE.png", width = 1200, height = 700, res = 120)
par(mar = c(5, 16, 4, 2), family = "sans")

spec_vals <- dados$spec_ind

plot(NA, xlim = c(0.8, 1.0), ylim = c(0.2, nrow(dados) + 1.5),
     xlab = "Especificidade", ylab = "",
     main = "Gráfico 2: Floresta de Especificidade por Estudo (N=7)",
     yaxt = "n", font.main = 2, cex.main = 1.4, cex.lab = 1.1)

# Estudos individuais
for(i in 1:nrow(dados)) {
  se_spec <- sqrt(spec_vals[i] * (1 - spec_vals[i]) / (dados$TN[i] + dados$FP[i]))
  ci_lo <- max(0, spec_vals[i] - 1.96 * se_spec)
  ci_hi <- min(1, spec_vals[i] + 1.96 * se_spec)
  
  segments(ci_lo, y_pos[i], ci_hi, y_pos[i], lwd = 2.5, col = "#2E7D32")
  points(spec_vals[i], y_pos[i], pch = 15, cex = 1.8, col = "#2E7D32")
}

# Estimativa agrupada
ci_lo_pool_spec <- max(0.8, ci_lo_spec)
ci_hi_pool_spec <- min(1.0, ci_hi_spec)
segments(ci_lo_pool_spec, 0.4, ci_hi_pool_spec, 0.4, lwd = 4, col = "#DC143C")
points(spec_pooled, 0.4, pch = 18, cex = 3.2, col = "#DC143C")

# Rótulos dos estudos
axis(2, at = y_pos, labels = study_labels, las = 1, cex.axis = 0.9, font = 1)
axis(2, at = 0.4, labels = "AGRUPADO", las = 1, cex.axis = 1.0, font = 2, col.axis = "#DC143C")

# Linha vertical
abline(v = spec_pooled, lty = 2, col = "gray40", lwd = 1.5, alpha = 0.7)

# Anotação
text(0.805, nrow(dados) + 1.0,
     sprintf("Especificidade Agrupada: %.1f%%\n[IC 95%%: %.1f%%-%.1f%%]",
             spec_pooled*100, ci_lo_spec*100, ci_hi_spec*100),
     cex = 1.0, font = 2, adj = 0,
     bbox = list(boxstyle = "round", fill = "#FFF8DC", col = "#2E7D32", lwd = 2))

axis(1, at = seq(0.80, 1.0, 0.05), cex.axis = 0.9)
dev.off()

cat("   ✓ Gráfico 2: outputs/figures/Grafico_2_FlorestaE.png\n")

# -- 6.3 SROC Curve
png("outputs/figures/Grafico_4_CurvaSROC.png", width = 800, height = 800, res = 120)
plot(fit_overall, main = "Gráfico 4: Curva SROC e Resumo Bivariado (N=7)",
     xlab = "1 - Especificidade", ylab = "Sensibilidade",
     sroc = TRUE, ellipse = TRUE, pch = 1, cex = 1.2)
points(1 - dados$spec_ind, dados$sens_ind, pch = 19, col = "#003D8280", cex = 1.5)
points(1 - spec_pooled, sens_pooled, pch = 18, col = "#DC143C", cex = 3)
legend("bottomright", legend = c("Estudos Individuais", "Estimativa Agrupada (Reitsma)", "Elipse de Confiança 95%"),
       pch = c(19, 18, NA), lty = c(NA, NA, 1), col = c("#003D8280", "#DC143C", "black"), bty = "n")
dev.off()

cat("   ✓ Gráfico 4: outputs/figures/Grafico_4_CurvaSROC.png\n")

# =============================================================================
# 8. NOMOGRAMA DE FAGAN
# =============================================================================

png("outputs/figures/Grafico_3_NomogramaFagan.png", width = 900, height = 1100, res = 120)
par(mar = c(3, 12, 3, 12), family = "sans")

# Probabilidades pré-teste (prevalência aproximada)
prev_pre <- sum(dados$TP + dados$FN) / sum(dados$n_total)

# Calcular probabilidade pós-teste
odd_pre <- prev_pre / (1 - prev_pre)
odd_pos <- odd_pre * lr_pos
odd_neg <- odd_pre * lr_neg

prob_pos <- odd_pos / (1 + odd_pos)
prob_neg <- odd_neg / (1 + odd_neg)

# Frame do nomograma
plot(NA, xlim = c(-1, 2), ylim = c(-0.1, 1.1),
     xlab = "", ylab = "", main = "Gráfico 3: Nomograma de Fagan",
     font.main = 2, cex.main = 1.4,
     xaxt = "n", yaxt = "n")

# Eixo esquerdo (Probabilidade Pré-teste)
probs <- c(0.01, 0.02, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.98, 0.99)
y_prob <- probs

# Plot esquerdo
for(i in seq_along(probs)) {
  text(-0.95, y_prob[i], sprintf("%.0f%%", probs[i]*100), adj = 1, cex = 0.9)
  segments(-0.92, y_prob[i], -0.85, y_prob[i], lwd = 1)
}
text(-0.95, -0.06, "Probabilidade\nPré-teste", adj = 0.5, cex = 1.0, font = 2)

# Eixo central (Razão de Verossimilhança)
lr_values <- c(0.01, 0.05, 0.1, 0.2, 0.5, 1, 2, 5, 10, 20, 50, 100)
log_lr <- log(lr_values)
max_log_lr <- log(100)

for(i in seq_along(lr_values)) {
  y_lr <- 0.1 + (log_lr[i] / max_log_lr) * 0.8
  text(0.5, y_lr, sprintf("%.2f", lr_values[i]), adj = 0.5, cex = 0.85)
  segments(0.35, y_lr, 0.65, y_lr, lwd = 0.8)
}
text(0.5, -0.06, "Razão de\nVerossimilhança", adj = 0.5, cex = 1.0, font = 2)

# Plot direito (Probabilidade Pós-teste)
for(i in seq_along(probs)) {
  text(1.95, y_prob[i], sprintf("%.0f%%", probs[i]*100), adj = 0, cex = 0.9)
  segments(1.85, y_prob[i], 1.92, y_prob[i], lwd = 1)
}
text(1.95, -0.06, "Probabilidade\nPós-teste", adj = 0.5, cex = 1.0, font = 2)

# Linha de LR Positiva
y_lr_pos <- 0.1 + (log(lr_pos) / max_log_lr) * 0.8
points(0.5, y_lr_pos, pch = 19, cex = 2.0, col = "#DC143C")
lines(c(-0.85, 1.92), c(prev_pre, prob_pos), lty = 2, col = "#DC143C", lwd = 2.5)

# Linha de LR Negativa
y_lr_neg <- 0.1 + (log(lr_neg) / max_log_lr) * 0.8
points(0.5, y_lr_neg, pch = 19, cex = 2.0, col = "#0066CC")
lines(c(-0.85, 1.92), c(prev_pre, prob_neg), lty = 2, col = "#0066CC", lwd = 2.5)

# Anotações
text(0.5, 1.02, "Teste com resultado POSITIVO", adj = 0.5, cex = 1.0, col = "#DC143C", font = 2)
text(0.5, -0.02, "Teste com resultado NEGATIVO", adj = 0.5, cex = 1.0, col = "#0066CC", font = 2)

# Legenda
text(-0.95, 0.95, sprintf("RV+ = %.2f\nProb. Pós = %.1f%%", lr_pos, prob_pos*100),
     cex = 0.95, adj = 0, font = 1,
     bbox = list(boxstyle = "round", fill = "#FFE6E6", col = "#DC143C", lwd = 1.5))
text(1.95, 0.05, sprintf("RV- = %.3f\nProb. Pós = %.1f%%", lr_neg, prob_neg*100),
     cex = 0.95, adj = 1, font = 1,
     bbox = list(boxstyle = "round", fill = "#E6F2FF", col = "#0066CC", lwd = 1.5))

dev.off()

cat("   ✓ Gráfico 3: outputs/figures/Grafico_3_NomogramaFagan.png\n")

# =============================================================================
# 9. RESUMO FINAL
# =============================================================================

cat("\n")
cat("╔════════════════════════════════════════════════════════════════════════╗\n")
cat("║                       RESUMO FINAL DOS RESULTADOS                      ║\n")
cat("╚════════════════════════════════════════════════════════════════════════╝\n\n")

cat(sprintf("📊 Número de Estudos: %d\n", nrow(dados)))
cat(sprintf("👥 Total de Participantes: %s\n", format(sum(dados$n_total), big.mark=".")))
cat(sprintf("📈 Sensibilidade Agrupada: %.1f%% [%.1f%%-%.1f%%]\n", 
            sens_pooled*100, ci_lo_sens*100, ci_hi_sens*100))
cat(sprintf("📊 Especificidade Agrupada: %.1f%% [%.1f%%-%.1f%%]\n",
            spec_pooled*100, ci_lo_spec*100, ci_hi_spec*100))
cat(sprintf("➕ Razão de Verossimilhança Positiva: %.2f\n", lr_pos))
cat(sprintf("➖ Razão de Verossimilhança Negativa: %.3f\n", lr_neg))

cat("\n📁 ARQUIVOS GERADOS:\n")
cat("   ✓ outputs/statistics/Tabela1_Estudos_Incluidos.csv\n")
cat("   ✓ outputs/statistics/Tabela2_Desempenho_Individual.csv\n")
cat("   ✓ outputs/statistics/Tabela3_Resultados_Agrupados.csv\n")
cat("   ✓ outputs/figures/Grafico_1_FlorestaS.png\n")
cat("   ✓ outputs/figures/Grafico_2_FlorestaE.png\n")
cat("   ✓ outputs/figures/Grafico_3_NomogramaFagan.png\n")

cat("\n✅ Análise concluída com sucesso!\n\n")
