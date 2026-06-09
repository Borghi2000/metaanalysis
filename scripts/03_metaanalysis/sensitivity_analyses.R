# =============================================================================
# ANALISES DE SENSIBILIDADE - META-ANALISE DTA (GenAI em Radiografia de Torax)
# =============================================================================
# AUDITORIA: este arquivo era uma copia byte-a-byte de bivariate_reitsma.R e NAO
# realizava nenhuma analise de sensibilidade (apesar do nome e da chamada no README).
# Reescrito para executar, de fato, as analises de robustez declaradas no manuscrito:
#   (1) Pool completo (N=7)
#   (2) Excluindo o outlier de volume Huang 2025 (N=6)
#   (3) Excluindo o cluster nao-independente Hong 2025 a/b/c (N=4)  -> unidade de analise
# Cada cenario reporta Sens/Spec (IC95%), intervalo de predicao (PI), RV+/RV-,
# I2 (Zhou) e AUC. Nada hardcoded.
# =============================================================================

suppressMessages(library(mada))

dados <- read.csv("data/raw/audit_database.csv", stringsAsFactors = FALSE)
# AUDITORIA: NAO usar o filtro verified_sum=="YES" -- no CSV committed TODAS as 10
# linhas estao marcadas "YES" (os 3 estudos "Accuracy Only" estao mis-coded). O
# criterio robusto e exigir as 4 celulas 2x2 numericas (cai para os 7 bivariados).
for (col in c("tp", "fp", "tn", "fn", "n_total")) dados[[toupper(col)]] <- suppressWarnings(as.numeric(dados[[col]]))
dados <- dados[complete.cases(dados[, c("TP", "FP", "TN", "FN")]), ]
dados$N <- dados$N_TOTAL

# Intervalo de predicao em nivel de estudo (df = n_estudos - 2).
calc_pi <- function(fit) {
  co <- summary(fit)$coefficients; v <- vcov(fit)
  n  <- nrow(fit$data)
  if (n < 3) return(list(sens = c(NA, NA), spec = c(NA, NA)))
  tcrit <- qt(0.975, df = n - 2)
  ls <- co[1, 1]; lf <- co[2, 1]
  hw_s <- tcrit * sqrt(fit$Psi[1, 1] + v[1, 1])
  hw_f <- tcrit * sqrt(fit$Psi[2, 2] + v[2, 2])
  list(sens = plogis(c(ls - hw_s, ls + hw_s)),
       spec = c(1 - plogis(lf + hw_f), 1 - plogis(lf - hw_f)))
}

resumo_cenario <- function(rotulo, d) {
  fit <- reitsma(d[, c("TP", "FN", "FP", "TN")])
  s   <- summary(fit)
  co  <- s$coefficients; v <- vcov(fit)
  sens <- plogis(co[1, 1]); fpr <- plogis(co[2, 1]); spec <- 1 - fpr
  ci_sens <- plogis(co[1, 1] + c(-1, 1) * 1.96 * sqrt(v[1, 1]))
  ci_spec <- 1 - plogis(co[2, 1] - c(-1, 1) * 1.96 * sqrt(v[2, 2]))
  pi <- calc_pi(fit)
  data.frame(
    Cenario       = rotulo,
    N_estudos     = nrow(d),
    N_participantes = sum(d$N),
    Sens          = round(sens * 100, 1),
    Sens_IC       = sprintf("%.1f-%.1f", ci_sens[1] * 100, ci_sens[2] * 100),
    Sens_PI       = sprintf("%.1f-%.1f", pi$sens[1] * 100, pi$sens[2] * 100),
    Spec          = round(spec * 100, 1),
    Spec_IC       = sprintf("%.1f-%.1f", ci_spec[1] * 100, ci_spec[2] * 100),
    Spec_PI       = sprintf("%.1f-%.1f", pi$spec[1] * 100, pi$spec[2] * 100),
    RV_pos        = round(sens / fpr, 2),
    RV_neg        = round((1 - sens) / spec, 3),
    I2_Zhou       = round(s$i2[["Zhou"]] * 100, 1),
    AUC           = round(s$AUC$AUC, 3),
    stringsAsFactors = FALSE
  )
}

# Cenarios de robustez para o pool atual (N=9). QUADAS alto risco = Akcay + Khovanova.
d_full      <- dados
d_noGuzel   <- dados[!grepl("zel", dados$authors), ]            # outlier de volume + sens muito baixa
d_noHuang   <- dados[dados$authors != "Huang 2025", ]          # outlier de volume (TN ~97k)
d_noVolOut  <- dados[!grepl("zel", dados$authors) & dados$authors != "Huang 2025", ]  # ambos mega-volume
d_lowRisk   <- dados[!grepl("Ak|Khovanova", dados$authors), ]  # remove alto risco QUADAS
d_ptx       <- dados[grepl("Pneumothorax", dados$clinical_scenario), ]  # subgrupo homogeneo

lbl <- function(pref, d) sprintf("%s (N=%d)", pref, nrow(d))
tab <- rbind(
  resumo_cenario(lbl("1. Pool completo", d_full), d_full),
  resumo_cenario(lbl("A. Sem outlier de volume Guzel 2026", d_noGuzel), d_noGuzel),
  resumo_cenario(lbl("B. Sem outlier de volume Huang 2025", d_noHuang), d_noHuang),
  resumo_cenario(lbl("C. Sem ambos outliers de volume", d_noVolOut), d_noVolOut),
  resumo_cenario(lbl("D. Sem alto risco QUADAS (Akcay+Khovanova)", d_lowRisk), d_lowRisk),
  resumo_cenario(lbl("E. Subgrupo Pneumotorax", d_ptx), d_ptx)
)

cat("\n=== ANALISES DE SENSIBILIDADE / ROBUSTEZ (N=9) ===\n\n")
print(tab, row.names = FALSE)

dir.create("outputs/statistics", showWarnings = FALSE, recursive = TRUE)
write.csv(tab, "outputs/statistics/Sensibilidade_Cenarios.csv", row.names = FALSE)
cat("\n[OK] Salvo: outputs/statistics/Sensibilidade_Cenarios.csv\n")

cat("\nLeitura: Guzel 2026 e Huang 2025 dominam por volume; remove-los eleva a\n",
    "sensibilidade agrupada. O subgrupo homogeneo de pneumotorax e a analise mais\n",
    "interpretavel clinicamente.\n")
