# =============================================================================
# META-ANÁLISE MADA - GENAI EM RADIOGRAFIA DE TÓRAX
# Gráficos e Tabelas em PORTUGUÊS
# =============================================================================

library(mada)
library(ggplot2)

cat("\n")
cat("╔════════════════════════════════════════════════════════════════════════╗\n")
cat("║          META-ANÁLISE BIVARIADA FINAL - GENAI EM RADIOGRAFIA          ║\n")
cat("║                    (Versão em Português - N=9)                        ║\n")
cat("╚════════════════════════════════════════════════════════════════════════╝\n\n")

# =============================================================================
# 1. CARREGAR E PREPARAR DADOS
# =============================================================================

cat("📂 CARREGANDO DADOS AUDITADOS...\n")
path_audit <- "data/raw/audit_database.csv"
if (!file.exists(path_audit)) stop("Arquivo audit_database.csv não encontrado!")

full_data <- read.csv(path_audit, stringsAsFactors = FALSE)

# AUDITORIA: no CSV committed TODAS as 10 linhas estao marcadas verified_sum=="YES"
# (os 3 estudos "Accuracy Only" estao mis-coded), o que fazia este filtro retornar 10
# linhas e o reitsma() quebrar nas celulas NA. Criterio robusto: 2x2 completo.
for (col in c("tp", "fp", "tn", "fn")) full_data[[col]] <- suppressWarnings(as.numeric(full_data[[col]]))
dados     <- full_data[complete.cases(full_data[, c("tp", "fp", "tn", "fn")]), ]
dados_acc <- full_data[!complete.cases(full_data[, c("tp", "fp", "tn", "fn")]), ]

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
# 6. FIGURAS -- REMOVIDAS (auditoria)
# =============================================================================
# Este script gerava Grafico_1_FlorestaS, Grafico_2_FlorestaE,
# Grafico_3_NomogramaFagan e Grafico_4_CurvaSROC, que DUPLICAVAM as Figuras 1,
# 2, 3 e 4 do manuscrito com uma renderizacao antiga e sem as convencoes pt-BR.
# Nenhuma era referenciada pelo main.tex, e copias desatualizadas delas acabaram
# encalhadas em manuscript/figures. A fonte unica de figuras passa a ser
# scripts/03_metaanalysis/sroc_curve.R; este script permanece como verificacao
# independente do ponto sumario e gerador das Tabelas 1-3.
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

cat("\n✅ Análise concluída com sucesso!\n\n")
