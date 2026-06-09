# =============================================================================
# GENERATE_FINAL_TABLES.R — VERSÃO CORRIGIDA (V6)
# =============================================================================

suppressMessages({library(dplyr); library(tidyr); library(scales); library(mada)})

cat("\n📊 GERANDO TABELAS FINAIS (T1-T6) — DATA-DRIVEN (auditoria 2026-06)...\n")

dir.create("outputs/tables", showWarnings = FALSE, recursive = TRUE)

# ── 1. CARREGAR DADOS ─────────────────────────────────────────────────────────
master <- read.csv("data/master_audit.csv", stringsAsFactors = FALSE)
# Classificação otimizada VLM para Ostrovsky 2025
master$arch <- ifelse(master$authors == "Ostrovsky 2025", "VLM", master$arch)

# Subconjunto bivariado (2x2 completo) e ajuste Reitsma do pool
biv <- master
for (c in c("tp","fp","fn","tn")) biv[[toupper(c)]] <- suppressWarnings(as.numeric(biv[[c]]))
biv <- biv[complete.cases(biv[, c("TP","FP","FN","TN")]), ]
fit <- reitsma(biv[, c("TP","FN","FP","TN")]); s <- summary(fit); co <- s$coefficients; v <- vcov(fit)
sens_p <- plogis(co[1,1]); spec_p <- 1 - plogis(co[2,1])
ci_s <- plogis(co[1,1] + c(-1,1)*1.96*sqrt(v[1,1]))
ci_e <- 1 - plogis(co[2,1] - c(-1,1)*1.96*sqrt(v[2,2]))

# ── TABELA 1: CARACTERÍSTICAS DOS ESTUDOS ──────────────────────────────────────
cat("  - T1: Caracteristicas...\n")
t1 <- master %>%
  select(authors, year, doi, model_name, arch, condition = clinical_scenario, 
         n_total, tp, fp, fn, tn, gold_standard) %>%
  arrange(desc(year), authors)
write.csv(t1, "outputs/tables/Tabela1_Caracteristicas_Estudos.csv", row.names = FALSE)

# ── TABELA 2: RESULTADOS AGRUPADOS (REITSMA) — calculado, nao hardcoded ─────────
cat("  - T2: Resultados Agrupados...\n")
i2z <- s$i2[["Zhou"]] * 100
i2h <- range(c(s$i2[["HollingUnadjusted1"]], s$i2[["HollingUnadjusted2"]], s$i2[["HollingUnadjusted3"]])) * 100
i2ha <- range(c(s$i2[["HollingAdjusted1"]], s$i2[["HollingAdjusted2"]], s$i2[["HollingAdjusted3"]])) * 100
# intervalo de predicao (metodo t, df = n-2)
nb <- nrow(biv); tcrit <- qt(0.975, df = nb - 2)
pi_s <- plogis(co[1,1] + c(-1,1)*tcrit*sqrt(fit$Psi[1,1] + v[1,1]))
pi_e <- c(1 - plogis(co[2,1] + tcrit*sqrt(fit$Psi[2,2] + v[2,2])),
          1 - plogis(co[2,1] - tcrit*sqrt(fit$Psi[2,2] + v[2,2])))
lr_p <- sens_p / (1 - spec_p); lr_n <- (1 - sens_p) / spec_p
biv$N_TOTAL <- suppressWarnings(as.numeric(biv$n_total))
t2 <- data.frame(
  Metrica = c("Sensibilidade Agrupada (IC95%)", "Sensibilidade - PI 95%",
              "Especificidade Agrupada (IC95%)", "Especificidade - PI 95%",
              "RV+", "RV-", "AUC (SROC)",
              "I2 (Zhou)", "I2 (Holling, nao ajustado)", "I2 (Holling, ajustado)",
              "N estudos bivariados", "N participantes (bivariado)"),
  Valor = c(sprintf("%.1f%% [%.1f - %.1f%%]", sens_p*100, ci_s[1]*100, ci_s[2]*100),
            sprintf("%.1f - %.1f%%", pi_s[1]*100, pi_s[2]*100),
            sprintf("%.1f%% [%.1f - %.1f%%]", spec_p*100, ci_e[1]*100, ci_e[2]*100),
            sprintf("%.1f - %.1f%%", pi_e[1]*100, pi_e[2]*100),
            sprintf("%.1f", lr_p), sprintf("%.3f", lr_n),
            sprintf("%.3f", s$AUC$AUC),
            sprintf("%.0f%%", i2z),
            sprintf("%.1f - %.1f%%", i2h[1], i2h[2]),
            sprintf("%.1f - %.1f%%", i2ha[1], i2ha[2]),
            nb,
            format(sum(biv$N_TOTAL), big.mark="."))
)
write.csv(t2, "outputs/tables/Tabela2_Resultados_Agrupados.csv", row.names = FALSE)

# ── TABELA 3: DESEMPENHO INDIVIDUAL ───────────────────────────────────────────
cat("  - T3: Desempenho Individual...\n")
t3 <- master %>%
  select(authors, year, tp, fp, fn, tn, prev, sens, spec) %>%
  mutate(sens = sprintf("%.1f%%", as.numeric(sens)*100),
         spec = sprintf("%.1f%%", as.numeric(spec)*100))
write.csv(t3, "outputs/tables/Tabela3_Desempenho_Individual.csv", row.names = FALSE)

# ── TABELA 4: SUBGRUPOS POR ARQUITETURA — Reitsma por subgrupo, nao hardcoded ───
cat("  - T4: Subgrupos Arquitetura...\n")
arch_rows <- lapply(sort(unique(biv$arch)), function(a) {
  d <- biv[biv$arch == a, ]
  if (nrow(d) < 2) return(NULL)
  fa <- summary(reitsma(d[, c("TP","FN","FP","TN")]))$coefficients
  data.frame(Arquitetura = a, N_Estudos = nrow(d),
             Sensibilidade = sprintf("%.1f%%", plogis(fa[1,1])*100),
             Especificidade = sprintf("%.1f%%", (1-plogis(fa[2,1]))*100),
             Estudos = paste(d$authors, collapse = ", "))
})
t4 <- bind_rows(arch_rows)
write.csv(t4, "outputs/tables/Tabela4_Subgrupos_Arquitetura.csv", row.names = FALSE)

# ── TABELA 5: SUBGRUPOS POR CONDIÇÃO — contagem a partir dos dados ─────────────
cat("  - T5: Subgrupos Condicao...\n")
biv$cond_grp <- ifelse(grepl("pneumothorax|pneumot", biv$clinical_scenario, ignore.case = TRUE),
                       "Pneumotorax", "Outras condicoes toracicas")
t5 <- biv %>% group_by(Condicao = cond_grp) %>%
  summarise(N_Estudos = n(),
            N_participantes = format(sum(N_TOTAL), big.mark = "."),
            Estudos = paste(authors, collapse = ", "), .groups = "drop")
write.csv(t5, "outputs/tables/Tabela5_Subgrupos_Condicao.csv", row.names = FALSE)

# ── TABELA 6: QUADAS-2 FORMATADA ───────────────────────────────────────────────
cat("  - T6: QUADAS-2...\n")
t6 <- master %>%
  select(authors, q1_selection, q2_index, q3_reference, q4_flow,
         a1_selection, a2_index, a3_reference)
write.csv(t6, "outputs/tables/Tabela6_QUADAS2_Formatada.csv", row.names = FALSE)

cat("\n✅ TODAS AS 6 TABELAS v6 GERADAS COM SUCESSO!\n")
