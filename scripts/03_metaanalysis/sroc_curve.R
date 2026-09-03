library(mada)
library(ggplot2)
library(dplyr)
library(ggrepel)

# Convencao pt-BR: virgula decimal em toda saida numerica das figuras (eixos,
# rotulos do mada::forest, textos base R) para bater com o corpo do manuscrito.
options(OutDec = ",")
# Para sprintf() (nao respeita OutDec, e' locale de C): formata o numero com
# virgula ANTES de inserir na string via %s.
vg <- function(x, digits = 2) formatC(x, format = "f", digits = digits, decimal.mark = ",")

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

# NOTA (auditoria): o antigo bar chart "Fig7" agregava sens/spec por ARQUITETURA
# bruta (VLM vs. LLM). Essa taxonomia foi abandonada no manuscrito, que estratifica
# por CLASSE DO MODELO (dominio-especifico vs. proposito geral, Secao 2.2/Tabela 6
# e Figura 6). Alem disso, o braco "LLM puro" tinha apenas N=2 estudos -- exatamente
# a comparacao que a Limitacao 5 do manuscrito declara subdimensionada para teste
# formal. A figura nunca foi referenciada no main.tex e foi removida para nao
# contradizer a taxonomia vigente. Ver bloco da FIGURA 6 para a estratificacao atual.

# ── FIGURA 1 & 2: Forest Plots com PI ────────────────────────────────────────

# Custom Forest Plot Function to add PI
generate_forest_with_pi <- function(type, filename, subtitle_stats, pi_range) {
  png(filename, width=2400, height=1800, res=300)
  # Margem inferior ampliada (6 -> 9 linhas) para caber a legenda de texto
  # abaixo do eixo, sem invadir o quadro que mada::forest() desenha sozinho
  # (um legend() dentro da area do grafico colide com o cabecalho dele).
  par(mar = c(9, 4, 4, 2) + 0.1, family = "sans")

  mada::forest(mada::madad(dados_biv[, c("TP", "FN", "FP", "TN")]), type = type,
               main = "", snames = dados_biv$authors_year, cex = 1.1)

  # Apenas Subtítulo Estatístico (Normal, linha 1.5)
  title(main = subtitle_stats, line = 1, font.main = 1, cex.main = 1.1)

  # Adicionar o PI como uma linha pontilhada larga na base
  abline(v = pi_range, lty = 3, col = "red", lwd = 2)
  mtext(paste0("PI: ", vg(pi_range[1]*100, 1), "% - ", vg(pi_range[2]*100, 1), "%"),
        side = 1, line = 4, col = "red", font = 2, cex = 1)
  mtext("Quadrado + linha = estimativa do estudo (IC 95%)   |   linha vermelha pontilhada = Intervalo de Predição (PI) 95%",
        side = 1, line = 6, col = "black", cex = 0.75)

  dev.off()
}

generate_forest_with_pi("sens", "outputs/figures/Fig1_Forest_Sens_V10.png",
                        sprintf("I² = %s%% (Zhou)", vg(i2_zhou * 100, 1)), pi_sens)

generate_forest_with_pi("spec", "outputs/figures/Fig2_Forest_Spec_V10.png",
                        sprintf("I² = %s%% (Holling)", vg(i2_holl * 100, 1)), pi_spec)


# ── FIGURA 3: Nomograma de Fagan (pool principal N=9; pre-teste 5/10/20%) ─────
# Usa as razoes de verossimilhanca do PONTO SUMARIO do pool principal (RV+/RV-),
# conforme o metodo declarado no manuscrito (secao 2.9). Nomograma geometricamente
# correto: eixos em escala logit/log; a reta pre-teste -> RV -> pos-teste satisfaz
# logit(pos) = logit(pre) + ln(RV).
co_main     <- summary(fit)$coefficients
sens_main   <- plogis(co_main[1, 1]); fpr_main <- plogis(co_main[2, 1])
lr_pos_main <- sens_main / fpr_main
lr_neg_main <- (1 - sens_main) / (1 - fpr_main)

.logit <- function(p) log(p / (1 - p))
.inv   <- function(x) 1 / (1 + exp(-x))
pre_tests <- c(0.05, 0.10, 0.20)
cores     <- c("#0072B2", "#009E73", "#D55E00")
post_p    <- .inv(.logit(pre_tests) + log(lr_pos_main))
post_n    <- .inv(.logit(pre_tests) + log(lr_neg_main))

# Cenario de referencia (sem Huang 2025) usado na nota de rodape do painel.
post_p_robust20 <- .inv(.logit(0.20) + log(lr_pos_robust))

# Rotulos clinicos dos tres cenarios pre-teste (Secao 2.9 do manuscrito).
cen_lab   <- c("Triagem Ambulatorial", "Pronto-Socorro / Baixo Risco",
               "Pronto-Socorro / Alto Risco")
n_estudos <- nrow(dados_biv)
n_exames  <- format(sum(dados_biv$N), big.mark = ".", scientific = FALSE)

# Layout em dois paineis: nomograma (topo) + painel de leitura (rodape). O painel
# de rodape substitui a antiga legend() no canto do grafico, que competia por
# espaco com as reguas de pre/pos-teste (densas do topo ao rodape).
png("outputs/figures/Fig3_Fagan_Robust_V10.png", width = 2600, height = 3000, res = 300)
layout(matrix(c(1, 2), nrow = 2), heights = c(3.6, 1))

# ── Painel 1: nomograma ──
par(mar = c(1, 4, 2, 4), family = "sans")
ylim <- c(-7.2, 9.8)
plot(NA, xlim = c(-0.20, 1.20), ylim = ylim, xlab = "", ylab = "", axes = FALSE, main = "")

# Cabecalhos das tres reguas
text(0,   9.3, "Probabilidade\nPré-teste (%)",   font = 2, cex = 1.05)
text(0.5, 9.3, "Razão de\nVerossimilhança (RV)", font = 2, cex = 1.05)
text(1,   9.3, "Probabilidade\nPós-teste (%)",   font = 2, cex = 1.05)

# Eixos verticais
segments(0, -7, 0, 7.6); segments(1, -7, 1, 7.6)
segments(0.5, -7, 0.5, 7.6, col = "grey55")

# Formatador pt-BR dos rotulos das reguas (vg() nao serve: sao valores %g).
.rot <- function(v) gsub("\\.", ",", sprintf("%g", v))

probs <- c(0.002, 0.005, 0.01, 0.02, 0.05, 0.1, 0.2, 0.3, 0.5, 0.7, 0.9, 0.95, 0.98, 0.99)
for (p in probs) {                                   # esquerdo: pre-teste (invertido)
  y <- -.logit(p); segments(-0.025, y, 0, y, lwd = 1.2)
  text(-0.04, y, .rot(p * 100), adj = 1, cex = 0.78)
}
for (p in probs) {                                   # direito: pos-teste
  y <- .logit(p); segments(1, y, 1.025, y, lwd = 1.2)
  text(1.04, y, .rot(p * 100), adj = 0, cex = 0.78)
}
# Retas dos tres cenarios: logit(pos) = logit(pre) + ln(RV). Desenhadas ANTES da
# regua central para que os rotulos de RV fiquem por cima e permanecam legiveis.
for (i in seq_along(pre_tests)) {
  yL <- -.logit(pre_tests[i])
  lines(c(0, 1), c(yL, .logit(post_p[i])), col = cores[i], lwd = 2.4)           # RV+
  lines(c(0, 1), c(yL, .logit(post_n[i])), col = cores[i], lwd = 2.4, lty = 2)  # RV-
}

lrs <- c(0.001, 0.005, 0.01, 0.05, 0.1, 0.2, 0.5, 1, 2, 5, 10, 20, 50, 100, 500, 1000)
for (L in lrs) {                                     # central: razao de verossimilhanca
  y <- log(L) / 2; segments(0.478, y, 0.522, y, col = "grey55")
  text(0.565, y, .rot(L), adj = 0, cex = 0.68, col = "grey35")
}

# Marcadores e rotulos em caixa das duas razoes de verossimilhanca
.boxlab <- function(x, y, txt, cor) {
  w <- strwidth(txt, cex = 1.0) * 1.16; h <- strheight(txt, cex = 1.0) * 2.4
  rect(x - w/2, y - h/2, x + w/2, y + h/2, col = "white", border = cor, lwd = 2.2)
  text(x, y, txt, col = cor, font = 2, cex = 1.0)
}
points(0.5, log(lr_pos_main) / 2, pch = 21, bg = cores[3], col = "black", cex = 1.7)
points(0.5, log(lr_neg_main) / 2, pch = 21, bg = cores[1], col = "black", cex = 1.7)
.boxlab(0.30, log(lr_pos_main) / 2, paste0("RV+ = ", vg(lr_pos_main, 2)), cores[3])
.boxlab(0.27, log(lr_neg_main) / 2 - 0.75, paste0("RV- = ", vg(lr_neg_main, 3)), cores[1])

# ── Painel 2: leitura clinica ──
par(mar = c(0, 1, 0, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.005, 0.02, 0.995, 0.98, border = "#9DB2C4", lwd = 2)

text(0.5, 0.88, sprintf("NOMOGRAMA DE FAGAN (POOL PRINCIPAL N=%d, %s EXAMES)",
                        n_estudos, n_exames), font = 2, cex = 0.95)
text(0.5, 0.72, sprintf(paste0("Convenção de linhas:  linha contínua = teste positivo ",
                               "(RV+ = %s)   |   linha tracejada = teste negativo (RV- = %s)"),
                        vg(lr_pos_main, 2), vg(lr_neg_main, 3)), cex = 0.82)
text(0.5, 0.57, "Cenários de probabilidade (pré-teste -> pós-teste):", font = 2, cex = 0.85)
for (i in seq_along(pre_tests)) {
  text(0.5, 0.46 - (i - 1) * 0.115,
       sprintf("Pré-teste %s%% (%s):   pós-teste (+) = %s%%   |   pós-teste (-) = %s%%",
               vg(pre_tests[i] * 100, 1), cen_lab[i],
               vg(post_p[i] * 100, 1), vg(post_n[i] * 100, 1)),
       cex = 0.82, col = cores[i])
}
text(0.5, 0.10, sprintf(paste0("Nota: no cenário de referência sem Huang 2025 (RV+ = %s e ",
                               "RV- = %s), a pós-teste (+) para pré-teste de 20%% é de %s%%."),
                        vg(lr_pos_robust, 2), vg(lr_neg_robust, 3),
                        vg(post_p_robust20 * 100, 1)), font = 3, cex = 0.78)
dev.off()
layout(1)

cat(sprintf("Fagan (pool principal): RV+=%.2f RV-=%.3f | pos+ 5/10/20%%: %.1f/%.1f/%.1f | pos- : %.1f/%.1f/%.1f\n",
            lr_pos_main, lr_neg_main, post_p[1]*100, post_p[2]*100, post_p[3]*100,
            post_n[1]*100, post_n[2]*100, post_n[3]*100))


# ── FIGURA 4: SROC com Elipse de Predição ─────────────────────────────────────

png("outputs/figures/Fig4_SROC_Prediction_V10.png", width=2400, height=2400, res=300)
par(mar = c(5, 5, 4, 2), family = "sans")
# NOTA: mada::plot.reitsma() so desenha a curva SROC, a elipse e o PONTO SUMARIO
# (via ROCellipse); nao desenha os estudos individuais. pch/bg abaixo estilizam
# o ponto sumario (losango azul), nao os estudos.
# mada::plot.reitsma fixa xlab/ylab em ingles ("Sensitivity"/"False Positive Rate")
# internamente -- passa-los por ... colide ("multiplos argumentos"). Suprime-se a
# anotacao de eixos com ann=FALSE e reescreve-se em pt-BR via title(), para bater
# com as demais figuras (ex.: Figura 6).
plot(fit, main = "", pch = 23, bg = "blue", cex = 1.5, xlim=c(0, 0.5), ylim=c(0.1, 1.0),
     ann = FALSE)
title(xlab = "Taxa de Falsos Positivos (1 - Especificidade)", ylab = "Sensibilidade")
# Apenas Subtítulo
# sprintf("%.3f") ignora OutDec (locale C): formatar via vg() para manter a virgula
title(main = sprintf("AUC = %s | Modelo Reitsma (REML)", vg(auc_val, 3)), line = 1, font.main = 1, cex.main = 1.1)
grid()

# Estudos individuais (bruto, por estudo): FPR = FP/(FP+TN); Sensibilidade = TP/(TP+FN)
points(dados_biv$FP / (dados_biv$FP + dados_biv$TN),
       dados_biv$TP / (dados_biv$TP + dados_biv$FN),
       pch = 21, bg = "red", cex = 1.3)

# Elipse de Predição (Retângulo)
rect(1-pi_spec[2], pi_sens[1], 1-pi_spec[1], pi_sens[2], lty=3, border="darkred", lwd=2)
legend("bottomright", legend = c("Estudos Individuais", "Estimativa Agrupada", "Elipse Confiança 95%", "Região de Predição 95%"),
       pch = c(21, 23, NA, NA), pt.bg = c("red", "blue", NA, NA),
       lty = c(0, 0, 1, 3), col=c("black", "black", "black", "darkred"), bty = "n", cex = 1.1)
dev.off()

# ── FIGURA 5: FUNNEL PLOT ──────────────────────────────────────────────────
# Pseudo-IC 95% (o "funil"/triangulo classico): limites pooled +/- 1.96*SE, com
# SE = 1/precisao. Como o eixo y aqui e a precisao (1/SE), e nao o SE em si, o
# limite e uma curva (hiperbole), nao uma reta -- por isso e tracado como path
# com varios pontos, nao com duas retas de geom_abline.
pooled_logdor <- mean(log(dados_biv$dor))
.prec_obs <- 1 / dados_biv$se_dor
.prec_seq <- seq(min(.prec_obs) * 0.5, max(.prec_obs) * 1.1, length.out = 200)
funil_ic95 <- data.frame(
  y    = rep(.prec_seq, 2),
  x    = pooled_logdor + c(-1.96 / .prec_seq, 1.96 / .prec_seq),
  lado = rep(c("lo", "hi"), each = length(.prec_seq))
)

p5 <- ggplot(dados_biv, aes(x = log(dor), y = 1/se_dor)) +
  geom_path(data = funil_ic95, aes(x = x, y = y, group = lado, linetype = "IC 95% pseudo (funil)"),
            color = "grey45", linewidth = 0.5, inherit.aes = FALSE) +
  geom_point(aes(shape = "Estudo individual"), size = 5, alpha = 0.7,
             fill = "gold", color = "black") +
  geom_vline(aes(xintercept = pooled_logdor, linetype = "Log DOR médio (pool)"),
             color = "black", linewidth = 0.6) +
  scale_shape_manual(name = NULL, values = c("Estudo individual" = 21)) +
  scale_linetype_manual(name = NULL, values = c("Log DOR médio (pool)" = "dashed",
                                                 "IC 95% pseudo (funil)" = "dotted")) +
  guides(shape = guide_legend(override.aes = list(fill = "gold", size = 5))) +
  coord_cartesian(xlim = range(log(dados_biv$dor)) + c(-0.5, 0.5),
                   ylim = c(0, max(.prec_obs) * 1.1)) +
  labs(title = NULL,
       subtitle = sprintf("Teste de Deeks (p = %s; cautela: <10 estudos) | Correção de Haldane (+0,5)", vg(deeks_p, 3)),
       x = "Log Diagnostic Odds Ratio", y = "Precisão (1/EP)") +
  theme_bw(base_size = 14) +
  theme(plot.subtitle = element_text(size = 13, hjust = 0.5),
        legend.position = "bottom", legend.title = element_blank())

ggsave("outputs/figures/Fig5_FunnelPlot_V10.png", p5, width = 8, height = 7, dpi = 300)

# ── FIGURA 6: BUBBLE PLOT ──────────────────────────────────────────────────
# Classe do modelo (Secao 2.2 / Tabela 6 do manuscrito): dominio-especifico vs.
# proposito geral -- NAO e' a mesma coisa que a arquitetura VLM/LLM bruta (ex.:
# Huang 2023/2025 sao LLM mas dominio-especifico; Hong 2025a/b sao VLM e tambem
# dominio-especifico). Usar a taxonomia da Tabela 6 para bater com o texto.
dominio_especifico <- c("Hong 2025a", "Hong 2025b", "Huang 2023", "Huang 2025")
dados_biv <- dados_biv %>%
  mutate(especializacao = ifelse(authors %in% dominio_especifico,
                                  "Domínio-específico", "Propósito geral"))

p6 <- ggplot(dados_biv, aes(x = 1 - (TN/(TN+FP)), y = TP/(TP+FN), size = N, fill = especializacao)) +
  geom_point(alpha = 0.6, shape = 21, color = "black") +
  geom_text_repel(aes(label = authors_year), size = 4.5, fontface = "bold",
                  box.padding = 0.8, point.padding = 0.5,
                  force = 10, segment.color = "grey50") +
  scale_size_continuous(range = c(5, 20),
                        labels = function(x) format(x, big.mark = ".", scientific = FALSE)) +
  scale_x_continuous(limits = c(0, 0.25)) + scale_y_continuous(limits = c(0.1, 1)) +
  labs(title = NULL,
       subtitle = "Tamanho da bolha proporcional ao N de participantes",
       x = "1 - Especificidade", y = "Sensibilidade", size = "N Total", fill = "Classe do Modelo") +
  theme_minimal(base_size = 14) +
  theme(plot.subtitle = element_text(size = 13, hjust = 0.5))

ggsave("outputs/figures/Fig6_BubblePlot_V10.png", p6, width = 10, height = 8, dpi = 300)

cat("\n✅ TODAS AS 6 FIGURAS V10 PADRONIZADAS (ABNT) COM SUCESSO!\n")
