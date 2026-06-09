# Diagnostic Accuracy of LLM and VLM Models in Chest Radiograph 
# Interpretation: A Systematic Review and Exploratory 
# Bivariate Hierarchical Meta-analysis

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19115371.svg)](https://doi.org/10.5281/zenodo.19115371)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OSF Registration](https://img.shields.io/badge/OSF-Registration-blue)](https://osf.io/XXXXX)

## Overview

This repository contains all code, data, and analysis scripts used in:

> Oliveira, G.B.F. Diagnostic Accuracy of Generative and Multimodal 
> Artificial Intelligence Models in Chest Radiograph Interpretation: 
> A Systematic Review and Exploratory Bivariate Hierarchical 
> Meta-analysis. *[Journal Name]*. [Year]. DOI: [manuscript DOI]

The systematic review followed PRISMA-DTA guidelines. 
The bivariate hierarchical random-effects model (Reitsma et al., 2005) 
was estimated by Restricted Maximum Likelihood (REML) using 
the `mada` package in R.

## Repository Structure
```
metaanalysis/
├── data/
│   ├── raw/               # Original extracted data
│   └── processed/         # Haldane-corrected matrices
├── scripts/
│   ├── 01_search_pipeline/   # Search (PubMed/SciELO/BVS) + TF-IDF screening
│   ├── 02_data_extraction/   # 2x2 matrix extraction
│   ├── 03_metaanalysis/      # R scripts for all models
│   └── 04_figures/           # Figure generation
├── outputs/
│   ├── figures/           # All manuscript figures
│   └── tables/            # All manuscript tables
└── docs/
    └── protocol_osf.md    # Pre-registered protocol (OSF)
```

## Dependencies

### Python (screening pipeline)
- Python >= 3.9
- See `requirements.txt`

### R (meta-analysis)
- R >= 4.3.0
- See `requirements_R.txt`

## How to Reproduce

### Step 1 — Clone the repository
```bash
git clone https://github.com/Borghi2000/metaanalysis.git
cd metaanalysis
```

### Step 2 — Install Python dependencies
```bash
pip install -r requirements.txt
```

### Step 3 — Run the search + screening pipeline

The pipeline has two deterministic, auditable stages:

```bash
# 3a. Real search + harvest (PubMed/SciELO/BVS). Requires network access to
#     eutils.ncbi.nlm.nih.gov, search.scielo.org, pesquisa.bvsalud.org.
python scripts/01_search_pipeline/search_nlp_tfidf.py \
  --output data/raw \
  --retmax 5000

# 3b. TF-IDF relevance screening (deterministic; threshold documented in §2.2).
python scripts/01_search_pipeline/screen_tfidf.py \
  --input data/raw/all_results_search.csv \
  --output data/processed/ \
  --threshold 0.35
```

Stage 3a fetches title + abstract for every record using a fixed, documented boolean 
query and a **frozen temporal scope** (publication date 2022/11/30 — the ChatGPT 
launch — to 2026/06/09), writing 
`data/raw/search_results/SEARCH_PROVENANCE.json` (query, run date, per-source counts). 
Stage 3b computes a TF-IDF + cosine-similarity relevance score against a fixed conceptual 
seed and applies the `--threshold` cutoff (0.35). This title/abstract screening (the 
**3,165 → 74** reduction) is **automated and deterministic** — the abstracts were not 
read manually — so the same corpus and threshold reproduce exactly the same subset, and 
the step can be audited publicly.

See [`docs/REPRODUCIBILITY.md`](docs/REPRODUCIBILITY.md) for the end-to-end audit map. 
The manual single-reviewer steps — **full-text eligibility (74 → 10) and 2×2 / QUADAS-2 
extraction** — are **not** covered by the code and remain a declared limitation 
(see manuscript §4.5).

### Step 4 — Run the meta-analysis (R)

Open R or RStudio and run in sequence:
```r
source("scripts/03_metaanalysis/bivariate_reitsma.R")
source("scripts/03_metaanalysis/sensitivity_analyses.R")
source("scripts/03_metaanalysis/sroc_curve.R")
source("scripts/03_metaanalysis/fagan_nomogram.R")
```

### Step 5 — Generate figures
```r
source("scripts/04_figures/forest_plot_sensitivity.R")
source("scripts/04_figures/forest_plot_specificity.R")
source("scripts/04_figures/funnel_plot.R")
source("scripts/04_figures/bubble_plot.R")
```

All figures will be saved to `outputs/figures/`.

## Data Description

### data/raw/studies_2x2_raw.csv

Raw 2×2 contingency data extracted from the 8 studies 
included in the main bivariate pool (auditoria 2026-06: Noh 2026 
removido por citação inválida; Akçay 2025 e Ciflik 2026 adicionados).

| Column | Description |
|--------|-------------|
| study_id | Unique study identifier |
| author | First author surname |
| year | Publication year |
| architecture | LLM or VLM |
| condition | Target condition |
| tp | True positives |
| fp | False positives |
| tn | True negatives |
| fn | False negatives |
| n_total | Total sample size |
| prevalence | Condition prevalence in test set |
| gold_standard | Reference standard used |
| haldane_applied | Boolean: Haldane correction applied |

### data/processed/studies_2x2_haldane_corrected.csv

Same structure as raw file with Haldane-Anscombe 
correction (+0.5 to all cells) applied to Ciflik 2026 
(FN=0 in original data; raw sensitivity=100%).

## Reproducibility & Limitations

**Automated screening is reproducible and auditable.** The search query, date 
range, TF-IDF parameters, and the 0.35 threshold are fixed and documented in the 
pipeline scripts (`search_nlp_tfidf.py`, `screen_tfidf.py`). The screening is 
deterministic: given the same corpus and threshold, any researcher obtains exactly 
the same screened subset. Provenance is recorded in `SEARCH_PROVENANCE.json` and 
`SCREENING_PROVENANCE.json`. See [`docs/REPRODUCIBILITY.md`](docs/REPRODUCIBILITY.md).

Remaining limitations:

1. The TF-IDF threshold (0.35) was determined empirically rather than from a 
   pre-specified rule. The search uses a **frozen temporal scope** (publication date 
   2022/11/30 — the ChatGPT launch — to 2026/06/09), so re-running returns the same 
   window; the screening is deterministic for a given corpus and threshold.

2. The protocol was not registered prospectively in PROSPERO. Retrospective 
   registration was completed in OSF Registries (https://osf.io/XXXXX) after data 
   extraction, as declared in the manuscript.

3. **The manual steps — full-text eligibility assessment (74 → 10) and 2×2 / 
   QUADAS-2 extraction — were performed by a single reviewer and are NOT covered by 
   the code.** (Title/abstract screening, by contrast, was automated via TF-IDF.) 
   These manual steps constitute the analytic core of the review and remain subject 
   to single-reviewer selection bias; independent replication requires a second 
   reviewer (see manuscript §4.5).

## Auditoria de Rigor (2026-06)

Uma auditoria de código, rigor e resultados foi conduzida em 2026-06-08. Pontos
essenciais e correções aplicadas:

- **Concordância interavaliador (κ) era sintética** e foi retratada;
  `analysis/python/calculate_kappa.py` agora exige um 2º revisor real ou falha.
  Até lá, o QUADAS-2 é de **revisor único, assistido por ferramenta automatizada**.
- **Bug nos intervalos de predição corrigido** (`fit$n` NULL em `mada::reitsma`);
  os PI agora são reproduzíveis pelo código (Sens 38,7–98,8%; Spec 9,4–100%).
- **Scripts deduplicados**: 6 scripts de figura eram cópias idênticas e 3 de análise
  também. Há agora uma única fonte de verdade; os demais redirecionam.
- **`sensitivity_analyses.R` agora faz análise de sensibilidade real** (sem Huang,
  sem cluster Hong) — antes era cópia do script principal.
- **Filtro de dados corrigido**: o `verified_sum=="YES"` selecionava 10 linhas
  (3 mis-coded) e quebrava o modelo; agora usa-se `complete.cases` (7 estudos).
- **Números das figuras deixaram de ser hardcoded** (AUC, I², PI, RV+ e o teste de
  assimetria — agora **Deeks**, não Egger — são calculados dos dados).

Ver `data/CHANGELOG_dados.md` (procedência + edições manuais a verificar) e
`outputs/submission/NOTA_DE_CORRECOES_AUDITORIA.md` (mudanças a aplicar no manuscrito).

## Citation

If you use this code or data, please cite:

> Oliveira, G.B.F. [Title]. [Journal]. [Year]. DOI: [manuscript DOI]

And the software itself:

> Oliveira, G.B.F. llm-vlm-cxr-metaanalysis [Software]. 
> Zenodo. DOI: 10.5281/zenodo.19115371

See also `CITATION.cff` for machine-readable citation metadata.

## License

This repository is licensed under the MIT License. 
See `LICENSE` for details.

The data in `data/raw/` was extracted from published studies 
and is provided for reproducibility purposes only. 
Original data remains subject to the copyright 
of the respective publishers.

## Contact

Gabriel Borghi de Freitas Oliveira — [institutional email]
