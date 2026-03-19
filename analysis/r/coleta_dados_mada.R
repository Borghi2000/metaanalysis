# =============================================================================
# COLETA_DADOS_MADA.R
# Objetivo: Calcular métricas diagnósticas (Bloco E) no master_audit.csv
# =============================================================================

cat("📊 CALCULANDO MÉTRICAS DIAGNÓSTICAS (BLOCO E)...\n")

path_master <- "data/master_audit.csv"
if (!file.exists(path_master)) stop("Arquivo master_audit.csv não encontrado!")

master <- read.csv(path_master, stringsAsFactors = FALSE, na.strings = "NA")

# Função para Intervalo de Confiança Wilson (95%)
wilson_ci <- function(x, n, type = "low") {
  if (is.na(x) || is.na(n) || n == 0) return(NA)
  z <- 1.96
  p <- x / n
  denom <- 1 + z^2/n
  term1 <- p + z^2/(2*n)
  term2 <- z * sqrt((p*(1-p)/n) + (z^2/(4*n^2)))
  if (type == "low") return(max(0, (term1 - term2) / denom))
  if (type == "high") return(min(1, (term1 + term2) / denom))
}

for (i in 1:nrow(master)) {
  # Apenas para estudos com matriz 2x2 (bivariados)
  if (!is.na(master$tp[i]) && master$tp[i] != "NA") {
    tp <- as.numeric(master$tp[i])
    fp <- as.numeric(master$fp[i])
    fn <- as.numeric(master$fn[i])
    tn <- as.numeric(master$tn[i])
    n  <- as.numeric(master$n_total[i])
    
    # Sensibilidade e Especificidade
    master$sens[i] <- round(tp / (tp + fn), 4)
    master$spec[i] <- round(tn / (tn + fp), 4)
    master$acc[i]  <- round((tp + tn) / n, 4)
    master$prev[i] <- round((tp + fn) / n, 4)
    
    # Wilson CI (para Sensibilidade)
    master$ci_low[i]  <- round(wilson_ci(tp, tp + fn, "low"), 4)
    master$ci_high[i] <- round(wilson_ci(tp, tp + fn, "high"), 4)
    
    # LR+ e LR- (com correção de 0.5 se necessário)
    tp_c <- tp; fp_c <- fp; fn_c <- fn; tn_c <- tn
    if (fp == 0 || fn == 0 || tp == 0 || tn == 0) {
      tp_c <- tp + 0.5; fp_c <- fp + 0.5; fn_c <- fn + 0.5; tn_c <- tn + 0.5
    }
    
    sens_c <- tp_c / (tp_c + fn_c)
    spec_c <- tn_c / (tn_c + fp_c)
    
    master$lr_plus[i]  <- round(sens_c / (1 - spec_c), 2)
    master$lr_minus[i] <- round((1 - sens_c) / spec_c, 2)
    master$dor[i]      <- round(master$lr_plus[i] / master$lr_minus[i], 2)
  }
}

# Salvar de volta
write.csv(master, path_master, row.names = FALSE, na = "NA")

cat("✅ BLOCO E ATUALIZADO COM SUCESSO NO MASTER_AUDIT.CSV\n")
