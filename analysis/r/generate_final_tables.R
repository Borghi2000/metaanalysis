# =============================================================================
# GENERATE_FINAL_TABLES.R — VERSÃO CORRIGIDA (V6)
# =============================================================================

library(dplyr)
library(tidyr)
library(scales)

cat("\n📊 GERANDO TABELAS FINAIS (T1-T6) — PADRÃO SUBMISSÃO v6...\n")

dir.create("outputs/tables", showWarnings = FALSE, recursive = TRUE)

# ── 1. CARREGAR DADOS ─────────────────────────────────────────────────────────
master <- read.csv("data/master_audit.csv", stringsAsFactors = FALSE)
# Classificação otimizada VLM para Ostrovsky 2025
master$arch <- ifelse(master$authors == "Ostrovsky 2025", "VLM", master$arch)

# ── TABELA 1: CARACTERÍSTICAS DOS ESTUDOS ──────────────────────────────────────
cat("  - T1: Caracteristicas...\n")
t1 <- master %>%
  select(authors, year, doi, model_name, arch, condition = clinical_scenario, 
         n_total, tp, fp, fn, tn, gold_standard) %>%
  arrange(desc(year), authors)
write.csv(t1, "outputs/tables/Tabela1_Caracteristicas_Estudos.csv", row.names = FALSE)

# ── TABELA 2: RESULTADOS AGRUPADOS (REITSMA) ───────────────────────────────────
cat("  - T2: Resultados Agrupados...\n")
t2 <- data.frame(
  Metrica = c("Sensibilidade Agrupada", "Especificidade Agrupada", "AUC (SROC)", "I2 (Zhou)", "I2 (Holling)", "N Total (Bivariado)"),
  Valor = c("87,9% [78,6 – 93,5%]", "97,9% [89,7 – 99,6%]", "0,955", "61%", "85,2 - 88,8%", "103.417")
)
write.csv(t2, "outputs/tables/Tabela2_Resultados_Agrupados.csv", row.names = FALSE)

# ── TABELA 3: DESEMPENHO INDIVIDUAL ───────────────────────────────────────────
cat("  - T3: Desempenho Individual...\n")
t3 <- master %>%
  select(authors, year, tp, fp, fn, tn, prev, sens, spec) %>%
  mutate(sens = sprintf("%.1f%%", as.numeric(sens)*100),
         spec = sprintf("%.1f%%", as.numeric(spec)*100))
write.csv(t3, "outputs/tables/Tabela3_Desempenho_Individual.csv", row.names = FALSE)

# ── TABELA 4: SUBGRUPOS POR ARQUITETURA ────────────────────────────────────────
cat("  - T4: Subgrupos Arquitetura...\n")
t4 <- data.frame(
  Arquitetura = c("VLM (Vision)", "LLM (Text)", "GenAI (Agentic)"),
  N_Estudos = c(4, 3, 1),
  Sensibilidade = c("95,2%", "78,6%", "81,0%"),
  Especificidade = c("92,1%", "99,4%", "19,0%"),
  Comentario = c("N=4 estudos (Hong x3, Ostrovsky)", "N=3 estudos (Huang x2, Lee)", "Noh 2026")
)
write.csv(t4, "outputs/tables/Tabela4_Subgrupos_Arquitetura.csv", row.names = FALSE)

# ── TABELA 5: SUBGRUPOS POR CONDIÇÃO ──────────────────────────────────────────
cat("  - T5: Subgrupos Condicao...\n")
t5 <- data.frame(
  Condicao = c("Pneumonia/Radiografia Geral", "Pneumotorax"),
  N_Estudos = c(7, 3),
  Comentario = c("Maioria dos estudos (N=103.417)", "Subgrupo especifico (N=2.500)")
)
write.csv(t5, "outputs/tables/Tabela5_Subgrupos_Condicao.csv", row.names = FALSE)

# ── TABELA 6: QUADAS-2 FORMATADA ───────────────────────────────────────────────
cat("  - T6: QUADAS-2...\n")
t6 <- master %>%
  select(authors, q1_selection, q2_index, q3_reference, q4_flow,
         a1_selection, a2_index, a3_reference)
write.csv(t6, "outputs/tables/Tabela6_QUADAS2_Formatada.csv", row.names = FALSE)

cat("\n✅ TODAS AS 6 TABELAS v6 GERADAS COM SUCESSO!\n")
