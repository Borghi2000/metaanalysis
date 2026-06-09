# Registered Protocol (PROSPERO Standard)

Available in: English | [**Português**](docs/PROTOCOL-pt.md)

This repository serves as the methodological support for the meta-analysis protocol focusing on Generative AI in Thoracic Radiology.

## 1. PIRT Criteria (PICO Adapted for DTA)

| Element | Description |
| :--- | :--- |
| **P (Population)** | Adult patients undergoing **chest radiography (X-ray / CXR)**. *Exclusion: pediatric studies; modalities other than chest radiograph (e.g., CT, tomosynthesis).* |
| **I (Index Test)** | Generative AI models that **interpret the radiograph image** (LLMs, VLMs, GPT-4, multimodal LMMs/chatbots). *Exclusion: purely discriminative CNNs; index tests that operate only on free-text reports rather than the image.* |
| **R (Reference)** | Clinical interpretation by experienced Radiologists or Gold Standard (Biopsy/Follow-up when applicable). |
| **T (Target Condition)** | Thoracic pathologies (Pneumothorax, Tuberculosis, Interstitial Lung Diseases, Pleural Effusion, Nodules). *Not restricted to a single condition.* |

> **Scope note (updated 2026-06-09):** The executed pipeline and the registered title ("Chest Radiograph Interpretation") restrict the population to **chest radiograph (X-ray) only**. The earlier mention of CT/tomosynthesis is superseded by this CXR-only scope. The search query (`search_nlp_tfidf.py`) uses CXR terms exclusively.

> **Multi-model extraction rule (updated 2026-06-09):** When a study evaluates several models, the **best-performing generative model** is extracted for the 2x2 (e.g., Güzel 2026 → Gemini 2; Khovanova 2025 → Claude 3.7 Sonnet — non-generative BiomedCLIP/MedRAX excluded from index even when higher-accuracy).

---

## 2. Search Strategy

The primary search is executed via the PubMed/MEDLINE API. The complete string used is:

### PubMed / MEDLINE
```text
"generative ai" AND (radiology OR radiologist OR tomosynthesis) AND (sensitivity OR specificity OR "area under the curve") AND (chest OR thorax OR lung)
```

### SciELO / BVS (Adapted)
```text
(Generative AI OR ChatGPT OR LLM) AND (Radiology OR Thorax)
```

---

## 3. Eligibility Criteria

Screening is performed via an automated pipeline (src/io_module/triager.py) following these weights:

### Inclusion Criteria
- Primary Diagnostic Test Accuracy (DTA) studies.
- Direct comparison between Generative AI and Radiologists.
- Availability of data to construct the 2x2 confusion matrix (TP, FP, TN, FN).

### Exclusion Criteria
- Exclusively pediatric studies (Keywords: pediatric, children, infant).
- Purely discriminative models (Traditional CNNs without a generative component: resnet, efficientnet, vgg).
- Index tests operating only on free-text radiology reports (text extraction) rather than interpreting the radiograph image.
- Modalities other than chest radiograph (CT, tomosynthesis, etc.).
- Opinion pieces, editorials, letters, or reviews without original data.
- Full text not retrievable / inaccessible.

---

## 4. Statistical Model

The analysis utilizes the Bivariate Reitsma Model (hierarchical meta-analysis), which accounts for the correlation between sensitivity and specificity.
- **Software:** R v4.5.x
- **Package:** mada
- **Metrics:** Pooled Sensitivity/Specificity, Summary Receiver Operating Characteristic (SROC), I squared for heterogeneity.

---

## 5. Analysis Pipeline

1.  src/main.py: Initial collection and screening.
2.  src/run_mada_analysis.R: Statistical calculation and confidence ellipses.
3.  src/regenerate_additional_plots.py: Generation of PRISMA flowchart and QUADAS-2 plots.
