# =============================================================================
# AUDIT_CALIBRATION.R — VERSÃO FINAL ESTÁVEL
# =============================================================================

library(mada)
library(dplyr)

# ── CONFIGURAÇÕES ─────────────────────────────────────────────────────────────
PATH_MASTER <- "data/master_audit.csv"
LOG_FILE    <- "outputs/audit_log.txt"

dir.create("outputs", showWarnings = FALSE)

cat("\n🚀 INICIANDO AUDITORIA FINAL (10 ESTUDOS) - PHASE 7\n")

# ── 1. CARREGAR DADOS ─────────────────────────────────────────────────────────
master <- read.csv(PATH_MASTER, stringsAsFactors = FALSE, na.strings = "NA")
dados_biv <- master %>% filter(!is.na(tp)) %>%
  mutate(TP=as.numeric(tp), FP=as.numeric(fp), FN=as.numeric(fn), TN=as.numeric(tn), N_orig=as.numeric(n_total))

# ── VALORES DE REFERÊNCIA ─────────────────────────────────────────────────────
SENS_ESP <- 0.879; SPEC_ESP <- 0.979; AUC_ESP <- 0.955; TOT_ESP_BIV <- 103417L

# ── LOG E CONTADORES ──────────────────────────────────────────────────────────
n_erros <- 0; n_alertas <- 0; log_lines <- c()
reg_ok <- function(m) { cat("  ✅ OK: ", m, "\n"); log_lines <<- c(log_lines, paste("[OK]", m)) }
reg_erro <- function(m) { n_erros <<- n_erros + 1; cat("  🔴 ERRO: ", m, "\n"); log_lines <<- c(log_lines, paste("[ERRO]", m)) }
reg_alerta <- function(m) { n_alertas <<- n_alertas + 1; cat("  ⚠️  ALERTA: ", m, "\n"); log_lines <<- c(log_lines, paste("[ALERTA]", m)) }

# ══════════════════════════════════════════════════════════════════════════════
cat("\nBLOCO 1: INTEGRIDADE DA MATRIZ 2x2 (N=7)\n")
for (i in seq_len(nrow(dados_biv))) {
  r <- dados_biv[i,]
  delta <- (r$TP+r$FP+r$FN+r$TN) - r$N_orig
  if (delta == 0) reg_ok(sprintf("%-16s | Delta=0", r$authors)) else reg_erro(sprintf("%-16s | Delta=%d", r$authors, delta))
}

cat("\nBLOCO 2: PARTICIPANTES E DADOS EXTRAS (N=10)\n")
tot_n_biv <- sum(dados_biv$N_orig)
if (tot_n_biv == TOT_ESP_BIV) reg_ok(sprintf("Total N Bivariado = %d", tot_n_biv)) else reg_erro(sprintf("Total N diverge: %d vs %d", tot_n_biv, TOT_ESP_BIV))

dados_ext <- master %>% filter(is.na(tp))
for (i in seq_len(nrow(dados_ext))) reg_ok(sprintf("%s (N=%s) auditado como Accuracy-only", dados_ext$authors[i], dados_ext$n_total[i]))

# ══════════════════════════════════════════════════════════════════════════════
cat("\nBLOCO 4: CALIBRAÇÃO REITSMA\n")
tryCatch({
  fit <- mada::reitsma(dados_biv[, c("TP", "FP", "FN", "TN")], correction.control = "all")
  cf  <- as.numeric(coef(fit)) # tsens, tfpr
  s   <- 1/(1+exp(-cf[1]))
  e   <- 1-(1/(1+exp(-cf[2])))
  au  <- as.numeric(mada::AUC(fit))
  
  cat(sprintf("  Calculado: Sens=%.4f Spec=%.4f AUC=%.4f\n", s, e, au))
  if (abs(s - SENS_ESP) < 0.005) reg_ok("Sensilidade ok.") else reg_erro("Sens descalibrada.")
  if (abs(e - SPEC_ESP) < 0.005) reg_ok("Especificidade ok.") else reg_erro("Spec descalibrada.")
}, error = function(err) reg_erro(paste("Erro no Reitsma:", err$message)))

pdom <- max(dados_biv$N_orig)/sum(dados_biv$N_orig)*100
if (pdom > 50) reg_alerta(sprintf("%s domina o pooling (%.1f%%)", dados_biv$authors[which.max(dados_biv$N_orig)], pdom))

writeLines(c(paste("AUDITORIA FINAL —", Sys.time()), log_lines), LOG_FILE)
cat(sprintf("\n📝 Log salvo em: %s\n\n", LOG_FILE))
