# Registered Protocol (PROSPERO Standard)

Available in: English | [**Português**](docs/PROTOCOL-pt.md)

This repository serves as the methodological support for the meta-analysis protocol focusing on Generative AI in Thoracic Radiology.

## 1. PIRT Criteria (PICO Adapted for DTA)

| Element | Description |
| :--- | :--- |
| **P (Population)** | Adult patients undergoing chest imaging (X-ray, CT, Tomosynthesis). *Exclusion: Pediatric studies.* |
| **I (Index Test)** | Generative AI models (LLMs, VLMs, GPT-4, LMMs, Multimodal Chatbots). |
| **R (Reference)** | Clinical interpretation by experienced Radiologists or Gold Standard (Biopsy/Follow-up when applicable). |
| **T (Target Condition)** | Thoracic pathologies (Pneumothorax, Tuberculosis, Interstitial Lung Diseases, Pleural Effusion, Nodules). |

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

### Exclusion Criteria (Automated Penalties)
- Exclusively pediatric studies (Keywords: pediatric, children, infant).
- Purely discriminative models (Traditional CNNs without a generative component: resnet, efficientnet, vgg).
- Opinion pieces, editorials, or reviews without original data.

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
