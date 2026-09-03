# =============================================================================
# ANALISES DE SENSIBILIDADE E SUBGRUPOS - META-ANALISE DTA (GenAI em Radiografia)
# =============================================================================
# Este script avalia formalmente a estabilidade do modelo bivariado hierarquico
# de Reitsma atraves de 10 cenarios de sensibilidade e subgrupos clinicos:
#   (1) Pool completo                                                (N=9)
#   (A) Sem o outlier de volume/baixa sensibilidade Guzel 2026       (N=8)
#   (B) Sem o outlier de volume Huang 2025 (TN ~97k)                 (N=8)
#   (C) Sem ambos os outliers de volume (Guzel + Huang 2025)         (N=7)
#   (D) Sem alto risco QUADAS-2 (Akcay + Khovanova)                  (N=7)
#   (E) Sem dependencia de cluster Hong (sem Hong 2025b)             (N=8)
#   (F) Sem matrizes derivadas/reconstruidas (sem Huang + Ostrovsky) (N=7)
#   (G) Subgrupo exclusivo de Pneumotorax                            (N=5)
#   (H) Subgrupo Outras Patologias (TB, pneumonia, nodulo)           (N=4)
#   (I) Subgrupo Modelos Dominio-Especificos (KARA-CXR, Huang)       (N=4)
#   (J) Subgrupo Modelos de Proposito Geral (GPT-4o, Gemini, Claude) (N=5)
#
# Cada cenario reporta Sens/Spec (IC95%), Intervalo de Predicao (PI, 95%),
# Razoes de Verossimilhanca (RV+/RV-), I2 (Zhou) e AUC da curva SROC.
# =============================================================================
if (dir.exists(".r_lib")) .libPaths(c(".r_lib", .libPaths()))
suppressMessages(library(mada))

dados <- read.csv("data/raw/audit_database.csv", stringsAsFactors = FALSE)
for (col in c("tp", "fp", "tn", "fn", "n_total")) {
  dados[[toupper(col)]] <- suppressWarnings(as.numeric(dados[[col]]))
}
dados <- dados[complete.cases(dados[, c("TP", "FP", "TN", "FN")]), ]
dados$N <- dados$N_TOTAL

# Intervalo de predicao em nivel de estudo (distribuicao t de Student com df = n - 2)
calc_pi <- function(fit) {
  co <- summary(fit)$coefficients
  v  <- vcov(fit)
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
  fit <- tryCatch(
    reitsma(d[, c("TP", "FN", "FP", "TN")]),
    error = function(e) NULL
  )
  if (is.null(fit)) {
    return(data.frame(
      Cenario       = rotulo,
      N_estudos     = nrow(d),
      N_exames      = sum(d$N),
      Sens          = NA, Sens_IC = "NA", Sens_PI = "NA",
      Spec          = NA, Spec_IC = "NA", Spec_PI = "NA",
      RV_pos        = NA, RV_neg = NA, I2_Zhou = NA, AUC = NA,
      stringsAsFactors = FALSE
    ))
  }
  s   <- summary(fit)
  co  <- s$coefficients; v <- vcov(fit)
  sens <- plogis(co[1, 1]); fpr <- plogis(co[2, 1]); spec <- 1 - fpr
  ci_sens <- plogis(co[1, 1] + c(-1, 1) * 1.96 * sqrt(v[1, 1]))
  ci_spec <- 1 - plogis(co[2, 1] - c(-1, 1) * 1.96 * sqrt(v[2, 2]))
  pi <- calc_pi(fit)
  data.frame(
    Cenario       = rotulo,
    N_estudos     = nrow(d),
    N_exames      = sum(d$N),
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

# Definicao dos cenarios de sensibilidade e subgrupos
d_full        <- dados
d_noGuzel     <- dados[!grepl("zel", dados$authors), ]
d_noHuang     <- dados[dados$authors != "Huang 2025", ]
d_noVolOut    <- dados[!grepl("zel", dados$authors) & dados$authors != "Huang 2025", ]
d_lowRisk     <- dados[!grepl("Ak|Khovanova", dados$authors), ]
d_noClusterH  <- dados[dados$authors != "Hong 2025b", ] # Teste de independencia do cluster Hong
d_direct2x2   <- dados[!dados$authors %in% c("Huang 2025", "Ostrovsky 2025"), ] # Apenas 2x2 primarios diretos
d_ptx         <- dados[grepl("Pneumothorax", dados$clinical_scenario), ]
d_otherCond   <- dados[!grepl("Pneumothorax", dados$clinical_scenario), ]
d_domainSpec  <- dados[dados$authors %in% c("Hong 2025a", "Hong 2025b", "Huang 2023", "Huang 2025"), ]
d_genPurpose  <- dados[!dados$authors %in% c("Hong 2025a", "Hong 2025b", "Huang 2023", "Huang 2025"), ]
d_retrospect  <- dados[dados$authors != "Huang 2025", ] # Coortes retrospectivas (N=8)

lbl <- function(pref, d) sprintf("%s (N=%d)", pref, nrow(d))

tab <- rbind(
  resumo_cenario(lbl("1. Pool completo", d_full), d_full),
  resumo_cenario(lbl("A. Sem outlier Guzel 2026", d_noGuzel), d_noGuzel),
  resumo_cenario(lbl("B. Sem outlier Huang 2025 (Ref. Clinica)", d_noHuang), d_noHuang),
  resumo_cenario(lbl("C. Sem ambos outliers de volume", d_noVolOut), d_noVolOut),
  resumo_cenario(lbl("D. Sem alto risco QUADAS (Akcay+Khovanova)", d_lowRisk), d_lowRisk),
  resumo_cenario(lbl("E. Sem cluster Hong (sem Hong 2025b)", d_noClusterH), d_noClusterH),
  resumo_cenario(lbl("F. Sem matrizes reconstruidas (diretas apenas)", d_direct2x2), d_direct2x2),
  resumo_cenario(lbl("G. Subgrupo Pneumotorax", d_ptx), d_ptx),
  resumo_cenario(lbl("H. Subgrupo Outras Patologias", d_otherCond), d_otherCond),
  resumo_cenario(lbl("I. Subgrupo Dominio-Especifico", d_domainSpec), d_domainSpec),
  resumo_cenario(lbl("J. Subgrupo Proposito Geral", d_genPurpose), d_genPurpose),
  resumo_cenario(lbl("K. Apenas Coortes Retrospectivas", d_retrospect), d_retrospect)
)

cat("\n=== ANALISES DE SENSIBILIDADE E SUBGRUPOS (N=9) ===\n\n")
print(tab, row.names = FALSE)

dir.create("outputs/statistics", showWarnings = FALSE, recursive = TRUE)
write.csv(tab, "outputs/statistics/Sensibilidade_Cenarios.csv", row.names = FALSE)
cat("\n[OK] Tabela salva em: outputs/statistics/Sensibilidade_Cenarios.csv\n")

# =============================================================================
# ANALISE LEAVE-ONE-OUT (INFLUENCIA INDIVIDUAL DE CADA ESTUDO)
# =============================================================================
cat("\n=== ANALISE LEAVE-ONE-OUT (N=9 ESTUDOS) ===\n\n")

loo_list <- list()
for (i in 1:nrow(dados)) {
  study_omitted <- dados$authors[i]
  d_sub <- dados[-i, ]
  fit_loo <- tryCatch(reitsma(d_sub[, c("TP", "FN", "FP", "TN")]), error = function(e) NULL)
  
  if (!is.null(fit_loo)) {
    s_loo <- summary(fit_loo)
    co_loo <- s_loo$coefficients
    v_loo  <- vcov(fit_loo)
    sens_loo <- plogis(co_loo[1, 1])
    spec_loo <- 1 - plogis(co_loo[2, 1])
    ci_sens_loo <- plogis(co_loo[1, 1] + c(-1, 1) * 1.96 * sqrt(v_loo[1, 1]))
    ci_spec_loo <- 1 - plogis(co_loo[2, 1] - c(-1, 1) * 1.96 * sqrt(v_loo[2, 2]))
    tau2_sens <- fit_loo$Psi[1, 1]
    tau2_fpr  <- fit_loo$Psi[2, 2]
    auc_loo   <- s_loo$AUC$AUC
    
    loo_list[[i]] <- data.frame(
      Estudo_Omitido = study_omitted,
      N_restante     = nrow(d_sub),
      Exames_rest    = sum(d_sub$N),
      Sens           = round(sens_loo * 100, 1),
      Sens_IC        = sprintf("%.1f-%.1f", ci_sens_loo[1] * 100, ci_sens_loo[2] * 100),
      Spec           = round(spec_loo * 100, 1),
      Spec_IC        = sprintf("%.1f-%.1f", ci_spec_loo[1] * 100, ci_spec_loo[2] * 100),
      Tau2_Sens      = round(tau2_sens, 3),
      Tau2_FPR       = round(tau2_fpr, 3),
      AUC            = round(auc_loo, 3),
      stringsAsFactors = FALSE
    )
  }
}

tab_loo <- do.call(rbind, loo_list)
print(tab_loo, row.names = FALSE)
write.csv(tab_loo, "outputs/statistics/Leave_One_Out.csv", row.names = FALSE)
cat("\n[OK] Analise Leave-One-Out salva em: outputs/statistics/Leave_One_Out.csv\n")

