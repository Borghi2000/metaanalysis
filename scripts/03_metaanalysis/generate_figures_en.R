# =============================================================================
# GENERATE_FIGURES_EN.R — English Publication Figures for Elsevier (EJR AI)
# Generates Figures 3, 4, 5, 6, 7 and S1 in 100% English with decimal points (.)
# =============================================================================

if (dir.exists(".r_lib")) .libPaths(c(".r_lib", .libPaths()))
options(repos = c(CRAN = "https://cran.rstudio.com/"))
required_packages <- c("mada", "ggplot2", "dplyr", "ggrepel")
for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) install.packages(pkg, lib = ".r_lib")
}

library(mada)
library(ggplot2)
library(dplyr)
library(ggrepel)

# Standard international notation: decimal points
options(OutDec = ".")
fmt <- function(x, digits = 2) formatC(x, format = "f", digits = digits, decimal.mark = ".")

cat("Generating English Meta-Analysis Figures (3, 4, 5, 6, 7, S1)...\n")

# 1. Load Data
master <- read.csv("data/master_audit.csv", stringsAsFactors = FALSE)
dados_biv <- master %>%
  filter(!is.na(tp)) %>%
  mutate(
    TP = as.numeric(tp), FP = as.numeric(fp),
    FN = as.numeric(fn), TN = as.numeric(tn),
    N = as.numeric(n_total),
    authors_year = authors
  )

fit <- reitsma(dados_biv[, c("TP", "FN", "FP", "TN")])
s <- summary(fit)

# Prediction interval
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

# Robust LR omitting Huang 2025
.dh        <- dados_biv[dados_biv$authors != "Huang 2025", ]
.sh        <- summary(reitsma(.dh[, c("TP", "FN", "FP", "TN")]))$coefficients
.sens_h    <- plogis(.sh[1, 1]); .fpr_h <- plogis(.sh[2, 1])
lr_pos_robust <- .sens_h / .fpr_h
lr_neg_robust <- (1 - .sens_h) / (1 - .fpr_h)

# ── FIGURE 3 & 4: Forest Plots with PI (English) ─────────────────────────────
generate_forest_en <- function(type, filenames, subtitle_stats, pi_range) {
  for (fn in filenames) {
    dir.create(dirname(fn), showWarnings = FALSE, recursive = TRUE)
    png(fn, width = 2400, height = 1800, res = 300)
    par(mar = c(8, 4, 4, 2) + 0.1, family = "sans")

    mada::forest(mada::madad(dados_biv[, c("TP", "FN", "FP", "TN")]), type = type,
                 main = "", snames = dados_biv$authors_year, cex = 1.15)

    title(main = subtitle_stats, line = 1, font.main = 1, cex.main = 1.15)

    # Add PI line
    abline(v = pi_range, lty = 3, col = "red", lwd = 2.2)
    mtext(paste0("95% Prediction Interval: ", fmt(pi_range[1]*100, 1), "% - ", fmt(pi_range[2]*100, 1), "%"),
          side = 1, line = 3.8, col = "red", font = 2, cex = 1.05)
    mtext("Square + horizontal line = study estimate (95% CI)   |   Red dashed line = 95% Prediction Interval (PI)",
          side = 1, line = 5.6, col = "black", cex = 0.85)

    dev.off()
    cat(paste0("  [OK] Saved Forest Plot to ", fn, "\n"))
  }
}

# Figure 3: Sensitivity
generate_forest_en("sens", c("outputs/submission/figures/Figure_3_Forest_Sensitivity.png",
                             "manuscript_elsevier/figures/Figure_3_Forest_Sensitivity.png"),
                   sprintf("I² = %s%% (Zhou)", fmt(i2_zhou * 100, 1)), pi_sens)

# Figure 4: Specificity
generate_forest_en("spec", c("outputs/submission/figures/Figure_4_Forest_Specificity.png",
                             "manuscript_elsevier/figures/Figure_4_Forest_Specificity.png"),
                   sprintf("I² = %s%% (Holling)", fmt(i2_holl * 100, 1)), pi_spec)


# ── FIGURE 5: SROC Curve (English) ───────────────────────────────────────────
generate_sroc_en <- function(filenames) {
  for (fn in filenames) {
    dir.create(dirname(fn), showWarnings = FALSE, recursive = TRUE)
    png(fn, width = 2400, height = 2400, res = 300)
    par(mar = c(5, 5, 4, 2), family = "sans")
    
    plot(fit, main = "", pch = 23, bg = "blue", cex = 1.7, xlim = c(0, 0.5), ylim = c(0.1, 1.0),
         ann = FALSE)
    title(xlab = "False Positive Rate (1 - Specificity)", ylab = "Sensitivity", cex.lab = 1.2)
    title(main = sprintf("AUC = %s | Bivariate Reitsma Model (REML)", fmt(auc_val, 3)), line = 1, font.main = 1, cex.main = 1.2)
    grid()

    # Individual studies
    points(dados_biv$FP / (dados_biv$FP + dados_biv$TN),
           dados_biv$TP / (dados_biv$TP + dados_biv$FN),
           pch = 21, bg = "red", cex = 1.4)

    # 95% Prediction Region
    rect(1 - pi_spec[2], pi_sens[1], 1 - pi_spec[1], pi_sens[2], lty = 3, border = "darkred", lwd = 2.2)
    
    legend("bottomright", legend = c("Individual Studies", "Summary Operating Point", "95% Confidence Ellipse", "95% Prediction Region"),
           pch = c(21, 23, NA, NA), pt.bg = c("red", "blue", NA, NA),
           lty = c(0, 0, 1, 3), col = c("black", "black", "black", "darkred"), bty = "n", cex = 1.15)
    dev.off()
    cat(paste0("  [OK] Saved SROC Curve to ", fn, "\n"))
  }
}

generate_sroc_en(c("outputs/submission/figures/Figure_5_SROC.png",
                   "manuscript_elsevier/figures/Figure_5_SROC.png"))


# ── FIGURE 6: Subgroup Bubble Plot (English) ─────────────────────────────────
dominio_especifico <- c("Hong 2025a", "Hong 2025b", "Huang 2023", "Huang 2025")
dados_biv <- dados_biv %>%
  mutate(architecture_class = ifelse(authors %in% dominio_especifico,
                                     "Domain-adapted", "General-purpose"))

p6_en <- ggplot(dados_biv, aes(x = 1 - (TN/(TN+FP)), y = TP/(TP+FN), size = N, fill = architecture_class)) +
  geom_point(alpha = 0.65, shape = 21, color = "black") +
  geom_text_repel(aes(label = authors_year), size = 4.8, fontface = "bold",
                  box.padding = 0.8, point.padding = 0.5,
                  force = 10, segment.color = "grey50") +
  scale_size_continuous(range = c(6, 22),
                        labels = function(x) format(x, big.mark = ",", scientific = FALSE)) +
  scale_x_continuous(limits = c(0, 0.25)) + scale_y_continuous(limits = c(0.1, 1)) +
  scale_fill_manual(values = c("Domain-adapted" = "#F8766D", "General-purpose" = "#00BFC4")) +
  labs(title = NULL,
       subtitle = "Bubble size proportional to total sample size (N radiographs)",
       x = "1 - Specificity (False Positive Rate)", y = "Sensitivity",
       size = "Total N", fill = "Model Class") +
  theme_minimal(base_size = 14) +
  theme(
    plot.subtitle = element_text(size = 13, hjust = 0.5),
    axis.title = element_text(face = "bold", size = 13),
    legend.title = element_text(face = "bold", size = 12),
    legend.position = "right"
  )

for (fn in c("outputs/submission/figures/Figure_6_Subgroup.png",
            "manuscript_elsevier/figures/Figure_6_Subgroup.png")) {
  dir.create(dirname(fn), showWarnings = FALSE, recursive = TRUE)
  ggsave(fn, p6_en, width = 10, height = 8, dpi = 300)
  cat(paste0("  [OK] Saved Subgroup Plot to ", fn, "\n"))
}


# ── FIGURE 7: Fagan Nomogram (English) ────────────────────────────────────────
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
post_p_robust20 <- .inv(.logit(0.20) + log(lr_pos_robust))

cen_lab_en <- c("Outpatient Triage / Screening",
                "Emergency Department / Low Risk",
                "Emergency Department / High Risk")
n_estudos <- nrow(dados_biv)
n_exames_en <- format(sum(dados_biv$N), big.mark = ",", scientific = FALSE)

generate_fagan_en <- function(filenames) {
  for (fn in filenames) {
    dir.create(dirname(fn), showWarnings = FALSE, recursive = TRUE)
    png(fn, width = 2600, height = 3000, res = 300)
    layout(matrix(c(1, 2), nrow = 2), heights = c(3.6, 1))

    # Panel 1
    par(mar = c(1, 4, 2, 4), family = "sans")
    ylim <- c(-7.2, 9.8)
    plot(NA, xlim = c(-0.20, 1.20), ylim = ylim, xlab = "", ylab = "", axes = FALSE, main = "")

    text(0,   9.3, "Pre-test\nProbability (%)", font = 2, cex = 1.1)
    text(0.5, 9.3, "Likelihood\nRatio (LR)", font = 2, cex = 1.1)
    text(1,   9.3, "Post-test\nProbability (%)", font = 2, cex = 1.1)

    segments(0, -7, 0, 7.6); segments(1, -7, 1, 7.6)
    segments(0.5, -7, 0.5, 7.6, col = "grey55")

    probs <- c(0.002, 0.005, 0.01, 0.02, 0.05, 0.1, 0.2, 0.3, 0.5, 0.7, 0.9, 0.95, 0.98, 0.99)
    for (p in probs) {
      y <- -.logit(p); segments(-0.025, y, 0, y, lwd = 1.2)
      text(-0.04, y, sprintf("%g", p * 100), adj = 1, cex = 0.8)
    }
    for (p in probs) {
      y <- .logit(p); segments(1, y, 1.025, y, lwd = 1.2)
      text(1.04, y, sprintf("%g", p * 100), adj = 0, cex = 0.8)
    }
    for (i in seq_along(pre_tests)) {
      yL <- -.logit(pre_tests[i])
      lines(c(0, 1), c(yL, .logit(post_p[i])), col = cores[i], lwd = 2.5)
      lines(c(0, 1), c(yL, .logit(post_n[i])), col = cores[i], lwd = 2.5, lty = 2)
    }

    lrs <- c(0.001, 0.005, 0.01, 0.05, 0.1, 0.2, 0.5, 1, 2, 5, 10, 20, 50, 100, 500, 1000)
    for (L in lrs) {
      y <- log(L) / 2; segments(0.478, y, 0.522, y, col = "grey55")
      text(0.565, y, sprintf("%g", L), adj = 0, cex = 0.7, col = "grey35")
    }

    .boxlab <- function(x, y, txt, cor) {
      w <- strwidth(txt, cex = 1.0) * 1.16; h <- strheight(txt, cex = 1.0) * 2.4
      rect(x - w/2, y - h/2, x + w/2, y + h/2, col = "white", border = cor, lwd = 2.2)
      text(x, y, txt, col = cor, font = 2, cex = 1.0)
    }
    points(0.5, log(lr_pos_main) / 2, pch = 21, bg = cores[3], col = "black", cex = 1.7)
    points(0.5, log(lr_neg_main) / 2, pch = 21, bg = cores[1], col = "black", cex = 1.7)
    .boxlab(0.30, log(lr_pos_main) / 2, paste0("LR+ = ", fmt(lr_pos_main, 2)), cores[3])
    .boxlab(0.27, log(lr_neg_main) / 2 - 0.75, paste0("LR- = ", fmt(lr_neg_main, 3)), cores[1])

    # Panel 2
    par(mar = c(0, 1, 0, 1))
    plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
    rect(0.005, 0.02, 0.995, 0.98, border = "#9DB2C4", lwd = 2)

    text(0.5, 0.88, sprintf("FAGAN NOMOGRAM (MAIN POOL N = %d, %s EXAMINATIONS)",
                            n_estudos, n_exames_en), font = 2, cex = 0.95)
    text(0.5, 0.72, sprintf(paste0("Line convention:  solid line = positive test (LR+ = %s)   |   ",
                                   "dashed line = negative test (LR- = %s)"),
                            fmt(lr_pos_main, 2), fmt(lr_neg_main, 3)), cex = 0.82)
    text(0.5, 0.57, "Probability scenarios (pre-test -> post-test):", font = 2, cex = 0.85)
    for (i in seq_along(pre_tests)) {
      text(0.5, 0.46 - (i - 1) * 0.115,
           sprintf("Pre-test %s%% (%s):   post-test (+) = %s%%   |   post-test (-) = %s%%",
                   fmt(pre_tests[i] * 100, 1), cen_lab_en[i],
                   fmt(post_p[i] * 100, 1), fmt(post_n[i] * 100, 1)),
           cex = 0.82, col = cores[i])
    }
    text(0.5, 0.10, sprintf(paste0("Note: in the robust reference scenario omitting Huang 2025 (LR+ = %s and ",
                                   "LR- = %s), post-test (+) for 20%% pre-test is %s%%."),
                            fmt(lr_pos_robust, 2), fmt(lr_neg_robust, 3),
                            fmt(post_p_robust20 * 100, 1)), font = 3, cex = 0.78)
    dev.off()
    cat(paste0("  [OK] Saved Fagan Nomogram to ", fn, "\n"))
  }
}

generate_fagan_en(c("outputs/submission/figures/Figure_7_Fagan.png",
                    "manuscript_elsevier/figures/Figure_7_Fagan.png"))

cat("\nAll English Meta-Analysis Figures Successfully Generated!\n")
