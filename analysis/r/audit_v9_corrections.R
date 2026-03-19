# =============================================================================
# AUDIT_V9_CORRECTIONS.R
# Correções solicitadas na auditoria do Paper v9
# =============================================================================

library(mada)
library(metafor) # Para cálculos mais precisos de tau^2 e PI se necessário

# 1. Carregar Dados
path_audit <- "data/raw/audit_database.csv"
full_data <- read.csv(path_audit, stringsAsFactors = FALSE)

# Converter colunas para numérico primeiro
full_data$TP <- as.numeric(full_data$tp)
full_data$FP <- as.numeric(full_data$fp)
full_data$TN <- as.numeric(full_data$tn)
full_data$FN <- as.numeric(full_data$fn)

# Filtrar apenas os que possuem dados 2x2 completos
dados <- full_data[complete.cases(full_data[, c("TP", "FP", "TN", "FN")]), ]

cat(sprintf("Total de estudos com dados 2x2: %d\n", nrow(dados)))
print(dados[, c("authors", "TP", "FP", "TN", "FN")])

# 2. Meta-análise Original (N=7)
fit_all <- reitsma(dados[, c("TP", "FN", "FP", "TN")])
sum_all <- summary(fit_all)

# 3. Sensibilidade: Excluir Huang 2025
dados_no_huang <- dados[dados$authors != "Huang 2025", ]
fit_no_huang <- reitsma(dados_no_huang[, c("TP", "FN", "FP", "TN")])
sum_no_huang <- summary(fit_no_huang)

# 4. Cálculo de Intervalos de Predição (PI)
calc_pi <- function(fit) {
  # Extrair logit sens e logit fpr
  s <- summary(fit)
  coefs <- s$coefficients
  v <- vcov(fit)
  
  tsens <- coefs[1, 1]
  tfpr <- coefs[2, 1]
  
  # No mada::reitsma, tau^2 está na diagonal de Psi
  # Garantir que pegamos os valores escalares
  tau2_sens <- as.numeric(fit$Psi[1, 1])
  se2_sens <- as.numeric(v[1, 1])
  
  n_studies <- as.numeric(fit$n)
  tcrit <- qt(0.975, df = n_studies - 2)
  
  # Logit Sens PI
  lo_s <- tsens - tcrit * sqrt(tau2_sens + se2_sens)
  hi_s <- tsens + tcrit * sqrt(tau2_sens + se2_sens)
  pi_sens <- plogis(c(lo_s, hi_s))
  
  # Logit FPR PI
  tau2_fpr <- as.numeric(fit$Psi[2, 2])
  se2_fpr <- as.numeric(v[2, 2])
  lo_f <- tfpr - tcrit * sqrt(tau2_fpr + se2_fpr)
  hi_f <- tfpr + tcrit * sqrt(tau2_fpr + se2_fpr)
  
  # Spec PI
  pi_spec <- c(1 - plogis(hi_f), 1 - plogis(lo_f))
  
  return(list(sens_pi = pi_sens, spec_pi = pi_spec))
}

pi_all <- calc_pi(fit_all)
rho <- fit_all$Psi[1, 2] / sqrt(fit_all$Psi[1, 1] * fit_all$Psi[2, 2])

# 6. Reportar Resultados
s_all <- summary(fit_all)$coefficients
cat("\n--- RESULTADOS DA AUDITORIA CORRETIVA ---\n")
cat(sprintf("N total: %d estudos\n", fit_all$n))
cat(sprintf("Sensibilidade Agrupada: %.1f%% [PI 95%%: %.1f%%-%.1f%%]\n", 
            plogis(s_all[1,1])*100, pi_all$sens_pi[1]*100, pi_all$sens_pi[2]*100))
cat(sprintf("Especificidade Agrupada: %.1f%% [PI 95%%: %.1f%%-%.1f%%]\n", 
            (1-plogis(s_all[2,1]))*100, pi_all$spec_pi[1]*100, pi_all$spec_pi[2]*100))
cat(sprintf("Correlação Sens vs FPR (rho): %.3f\n", rho))

cat("\n--- ANÁLISE DE SENSIBILIDADE (SEM HUANG 2025) ---\n")
s_no_h <- summary(fit_no_huang)$coefficients
sens_no_h <- plogis(s_no_h[1,1])
spec_no_h <- 1 - plogis(s_no_h[2,1])
lr_pos_no_h <- sens_no_h / (1 - spec_no_h)
cat(sprintf("N: %d estudos\n", fit_no_huang$n))
cat(sprintf("Sensibilidade: %.1f%%\n", sens_no_h*100))
cat(sprintf("Especificidade: %.1f%%\n", spec_no_h*100))
cat(sprintf("RV+ (sem Huang): %.2f\n", lr_pos_no_h))

# 7. Salvar Log
sink("outputs/submission/audit_v9_results.txt")
cat("Relatório de Auditoria Metodológica v9\n")
cat("======================================\n\n")
print(summary(fit_all))
cat("\nPI Sens: "); print(pi_all$sens_pi)
cat("PI Spec: "); print(pi_all$spec_pi)
cat("\nRho: "); print(rho)
cat("\n--- SEM HUANG 2025 ---\n")
print(summary(fit_no_huang))
cat("\nRV+ sem Huang: "); print(lr_pos_no_h)
sink()

cat("\n✅ Relatório salvo em: outputs/submission/audit_v9_results.txt\n")
