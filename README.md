# Diagnostic Accuracy of LLM and VLM Models in Chest Radiograph 
# Interpretation: A Systematic Review and Exploratory 
# Bivariate Hierarchical Meta-analysis

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXXXX)
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
│   ├── 01_search_pipeline/   # NLP/TF-IDF screening
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

### Step 3 — Run the screening pipeline
```bash
python scripts/01_search_pipeline/search_nlp_tfidf.py \
  --input data/raw/search_results/ \
  --output data/processed/ \
  --threshold 0.35
```

The `--threshold` argument corresponds to the empirically 
determined TF-IDF score cutoff described in Section 2.2 
of the manuscript. This value is a declared limitation 
of reproducibility (see manuscript).

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

Raw 2×2 contingency data extracted from the 7 studies 
included in the main bivariate pool.

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
correction (+0.5 to all cells) applied to Noh 2026 
(FP=0 in original data).

## Declared Limitations of Reproducibility

1. The TF-IDF threshold (0.35) was determined empirically 
   and is not derived from a pre-specified rule. Independent 
   replication of the screening step may yield marginally 
   different results.

2. The protocol was not registered prospectively in PROSPERO. 
   Retrospective registration was completed in OSF Registries 
   (https://osf.io/XXXXX) after data extraction, as declared 
   in the manuscript.

3. Manual validation of NLP screening was performed by a 
   single reviewer. Independent replication requires a 
   second reviewer.

## Citation

If you use this code or data, please cite:

> Oliveira, G.B.F. [Title]. [Journal]. [Year]. DOI: [manuscript DOI]

And the software itself:

> Oliveira, G.B.F. llm-vlm-cxr-metaanalysis [Software]. 
> Zenodo. DOI: 10.5281/zenodo.XXXXXXX

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
