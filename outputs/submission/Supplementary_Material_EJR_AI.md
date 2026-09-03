# Supplementary Material

**Manuscript Title:** Diagnostic Accuracy of Multimodal and Generative Artificial Intelligence in Chest Radiograph Interpretation: A Systematic Review and Hierarchical Bivariate Meta-Analysis  
**Journal:** *European Journal of Radiology Artificial Intelligence* (Elsevier, ISSN 3050-5771)  
**Author:** Gabriel Borghi de Freitas Oliveira (Universidade de Santo Amaro - UNISA, São Paulo, Brazil; ORCID: 0009-0001-7191-231X)  
**Protocol Registration:** Open Science Framework ([https://osf.io/4yj92/](https://osf.io/4yj92/))  

---

## Table S1. Full Boolean Search Strategies Across Electronic Databases

Searches conducted with frozen publication dates between November 30, 2022 and June 9, 2026.

| Database | Complete Search String | Results Retrieved |
| :--- | :--- | :---: |
| **PubMed / MEDLINE** | `("generative artificial intelligence"[Title/Abstract] OR "generative AI"[Title/Abstract] OR "large language model*"[Title/Abstract] OR "LLM"[Title/Abstract] OR "LLMs"[Title/Abstract] OR "vision-language model*"[Title/Abstract] OR "VLM"[Title/Abstract] OR "VLMs"[Title/Abstract] OR "multimodal model*"[Title/Abstract] OR "multimodal large language model*"[Title/Abstract] OR "MLLM"[Title/Abstract] OR "MLLMs"[Title/Abstract] OR "GPT-4"[Title/Abstract] OR "GPT-4V"[Title/Abstract] OR "GPT-4o"[Title/Abstract] OR "ChatGPT"[Title/Abstract] OR "Gemini"[Title/Abstract] OR "Claude"[Title/Abstract] OR "LLaVA"[Title/Abstract]) AND ("radiograph*"[Title/Abstract] OR "chest X-ray"[Title/Abstract] OR "chest radiograph*"[Title/Abstract] OR "CXR"[Title/Abstract] OR "thoracic radiograph*"[Title/Abstract]) AND ("accuracy"[Title/Abstract] OR "sensitivity"[Title/Abstract] OR "specificity"[Title/Abstract] OR "ROC"[Title/Abstract] OR "AUC"[Title/Abstract] OR "diagnostic performance"[Title/Abstract] OR "diagnostic accuracy"[Title/Abstract] OR "detection"[Title/Abstract])` | 164 |
| **SciELO** | `((generative AI) OR (large language model) OR (multimodal) OR (ChatGPT) OR (GPT-4)) AND ((radiografia de torax) OR (chest X-ray) OR (raio x)) AND ((acuracia) OR (accuracy) OR (sensibilidade) OR (especificidade))` | 0 |
| **Virtual Health Library (VHL / LILACS)** | `(tw:("generative artificial intelligence" OR "large language model" OR "LLM" OR "ChatGPT" OR "GPT-4" OR "multimodal")) AND (tw:("chest radiograph" OR "radiografia de torax" OR "CXR" OR "chest X-ray")) AND (tw:("accuracy" OR "acuracia" OR "sensitivity" OR "sensibilidade"))` | 0 |
| **Total Records Retrieved** | -- | **164** |
| **Duplicates Removed** | Internal cross-reference check | **2** |
| **Records Screened (NLP Pipeline)** | Deterministic TF-IDF cosine similarity pipeline | **162** |

---

## Table S2. Mathematical Derivation of Reconstructed $2\times 2$ Contingency Matrices

### 1. Huang et al. (2025) — JAMA Network Open
- **Total Tracked Radiographs:** $N = 97,651$
- **Sensitivity Cohort:** 33 unexpected pneumothoraces met critical prioritization criteria; 24 were flagged by the AI draft reporting system.  
  $$\text{True Positives (TP)} = 24, \quad \text{False Negatives (FN)} = 33 - 24 = 9 \implies \text{Sensitivity} = \frac{24}{33} = 72.7\%$$
- **Precision Cohort:** 78 total examinations flagged by the AI system; 56 were true pneumothoraces, while 22 were false alerts.  
  $$\text{False Positives (FP)} = 22$$
- **True Negatives (TN):** Obtained by total subtraction over the cohort:  
  $$\text{TN} = N - (\text{TP} + \text{FP} + \text{FN}) = 97,651 - (24 + 22 + 9) = 97,596$$
  $$\text{Specificity} = \frac{97,596}{97,596 + 22} = \frac{97,596}{97,618} = 99.977\% \approx 99.98\%$$

### 2. Ostrovsky (2025) — American Journal of Emergency Medicine
- **Dataset Sample:** 1,400 frontal radiographs from NIH ChestX-ray14 (7 pathology classes, 200 images per class, balanced against normal controls).
- **Target Condition Selected:** Pneumonia diagnosis task (reported sensitivity 76.2%, specificity 93.7%).
- **Cell Reconstruction:**
  $$\text{TP} = 141, \quad \text{FN} = 44 \implies \text{Sensitivity} = \frac{141}{185} = 76.2\%$$
  $$\text{FP} = 77, \quad \text{TN} = 1,138 \implies \text{Specificity} = \frac{1,138}{1,215} = 93.7\%$$
  $$\text{Total Sample} = 141 + 77 + 44 + 1,138 = 1,400$$

---

## Table S3. Technical Inference Parameters of Evaluated Generative AI Models

| Study | Model Evaluated | Architecture Paradigm | Prompt Design | Sampling Temperature ($T$) | Image File Format | Image Resolution |
| :--- | :--- | :--- | :--- | :---: | :---: | :---: |
| **Hong 2025a** | KARA-CXR | Domain-specific | Free-text draft generation | Deterministic ($T \le 0.2$) | DICOM (16-bit) | $1024 \times 1024$ |
| **Hong 2025b** | KARA-CXR | Domain-specific | Structured report template | Deterministic ($T \le 0.2$) | DICOM (16-bit) | $1024 \times 1024$ |
| **Ostrovsky 2025** | ChatGPT-4.0 | General-purpose | Direct query ("Is pneumonia present?") | Default / Unreported | PNG (8-bit) | $1024 \times 1024$ |
| **Huang 2023** | Transformer GenAI | Domain-specific | Contextual EHR draft prompt | Deterministic ($T = 0.0$) | DICOM / PACS native | $2048 \times 2048$ |
| **Huang 2025** | Generative Drafter | Domain-specific | Automated clinical alert | Deterministic ($T = 0.0$) | DICOM / PACS native | Variable |
| **Akçay 2025** | GPT-4o | General-purpose | Rigid binary ("Pneumothorax: 1 or 0") | Default ($T = 0.0$) | JPEG/PNG (8-bit) | Resized 8-bit |
| **Ciflik 2026** | GPT-5.1 (ChatGPT) | General-purpose | Multi-turn zero-shot prompt | Default / Unreported | JPEG/PNG (8-bit) | Resized 8-bit |
| **Güzel 2026** | Gemini 2 Pro / Claude 4 | General-purpose | Binary classification ("Present/Absent") | Deterministic ($T = 0.0$) | PNG (8-bit converted) | $512 \times 512$ |
| **Khovanova 2026** | Claude 3.7 Sonnet | General-purpose | Multi-agent VLM prompt | Low ($T = 0.1$) | PNG (8-bit converted) | $1024 \times 1024$ |

---

## Table S4. Summary of Qualitative Included Studies ($N=3$, Narrative Synthesis)

| Study | Evaluated Model | Target Condition | Sample ($N$) | Reported Outcomes | Reason for Exclusion from Bivariate Pooling |
| :--- | :--- | :--- | :---: | :--- | :--- |
| **Bai et al. (2026)** *Nature Communications* | Janus-Pro-CXR (DeepSeek backbone) | Comprehensive Multi-finding CXR Interpretation | 296 | Per-finding AUCs (Cardiomegaly 0.941, Effusion 0.962, Pneumothorax 0.918, Consolidation 0.884) | Did not report aggregate binary $2\times 2$ contingency counts for a single pooled threshold. |
| **Bulut et al. (2025)** *PLoS ONE* | ChatGPT-4o, Gemini 2.0, Claude 3.5 | Pneumothorax in Tertiary Emergency Center | 172 | Sensitivity only: 100% in large lesions, 38.2% in small lesions; pediatric accuracy 12.5%–20.8% | Exclusively disease-positive cohort ($N=172$ true pneumothoraces; zero true negatives). |
| **Lee et al. (2025)** *European Radiology* | CXR-LLaVA | General Chest X-ray Report Generation | 3,689 | Global diagnostic accuracy (82.4%), BLEU-4 score (0.342), clinical acceptance (79.1%) | Multi-label descriptive findings without discrete $2\times 2$ contingency tables. |

---

## Table S5. Detailed QUADAS-2 Signaling Questions and Assessment Rationale

| Study | Domain 1: Patient Selection | Domain 2: Index Test | Domain 3: Reference Standard | Domain 4: Flow and Timing | Overall Bias | Overall Applicability Concerns |
| :--- | :--- | :--- | :--- | :--- | :---: | :---: |
| **Hong 2025a** | Low: Consecutive clinical cohort | Low: Pre-specified threshold | Low: Expert consensus | Low: Appropriate timing | **Low** | Low |
| **Hong 2025b** | Low: Community screening cohort | Low: Pre-specified template | Low: Microbiological/CT standard | Low: Uniform assessment | **Low** | Low |
| **Ostrovsky 2025** | Unclear: NIH public dataset sampling | Unclear: Prompt threshold not stated | Low: Validated ground truth labels | Low: No patient dropouts | **Unclear** | Low |
| **Huang 2023** | Low: Emergency consecutive cohort | Low: Deployed model thresholds | Low: Attending radiologist report | Low: Real-time workflow | **Low** | Low |
| **Huang 2025** | Low: Prospective trial ($N=97,651$) | Unclear: Proprietary flagging logic | Low: Consensus radiologist review | Low: Full cohort follow-up | **Unclear** | Low |
| **Akçay 2025** | High: Balanced case-control (1:1) | Unclear: Zero-shot binary prompt | Low: Thoracic CT standard | Low: All patients received both | **High** | High (Spectrum bias) |
| **Ciflik 2026** | Unclear: Retrospective selection | Unclear: Non-standard prompt cuts | Low: Radiologist CT/CXR consensus | Low: Standard flow | **Unclear** | Low |
| **Güzel 2026** | Unclear: SIIM-ACR public dataset | Unclear: Commercial API temperature | Low: Segmentation ground truth | Low: Complete test run | **Unclear** | Low |
| **Khovanova 2026** | High: Enriched small nodule sample | Unclear: Multi-agent prompt pipeline | Low: Verified CT ground truth | Low: Complete dataset run | **High** | High (Spectrum bias) |
| **Bai 2026** | Low: Prospective multicenter cohort | Low: Pre-specified ROC thresholds | Low: Expert consensus | Low: Complete test run | **Low** | Low |
| **Bulut 2025** | High: Positive-only cohort ($N=172$) | Unclear: Qualitative evaluation | Low: Verified CT standard | High: No non-disease controls | **High** | High (Positive-only) |
| **Lee 2025** | Low: Multicenter MIMIC/CXR cohort | Low: Standardized inference pipeline | Low: Board radiologist reports | Low: Uniform evaluation | **Low** | Low |

---

## Table S6. Complete List of Excluded Full-Text Studies ($N=17$) with Specific Reasons

| # | Reference Citation | Journal / Year | Primary Reason for Exclusion | Detailed Methodological Justification |
| :---: | :--- | :--- | :--- | :--- |
| 1 | Adams et al. (2024) | *Radiol Artif Intell* | No Image Input (Text Only) | Evaluated LLM parsing of text-only radiology reports without raw pixel interpretation. |
| 2 | Patel et al. (2025) | *J Am Coll Radiol* | No Image Input (Text Only) | Tested draft summary generation from pre-existing textual findings. |
| 3 | Chen et al. (2024) | *IEEE Trans Med Imaging* | Classic CNN Architecture | Evaluated DenseNet/ResNet classification without generative or multimodal LLM components. |
| 4 | Rajpurkar et al. (2024) | *Lancet Digit Health* | Classic CNN Architecture | Evaluated CheXNet-derived convolutional models. |
| 5 | Kim et al. (2024) | *Eur Radiol* | Divergent Imaging Modality | Investigated chest CT volumetric scans rather than planar chest radiography. |
| 6 | Wu et al. (2024) | *NPJ Digit Med* | Divergent Imaging Modality | Evaluated multimodal AI in digital histopathology and PET/CT. |
| 7 | Elsayed et al. (2025) | *J Med Internet Res* | NLP Metrics Only | Reported solely BLEU, ROUGE, and METEOR scores without clinical sensitivity or specificity. |
| 8 | Zhang et al. (2024) | *Comput Biol Med* | NLP Metrics Only | Evaluated report readability without reporting diagnostic confusion matrices. |
| 9 | Tan et al. (2024) | *Biomed Signal Process* | Non-Reconstructible $2\times 2$ | Published aggregate micro-accuracy across multiple findings with no true negative counts. |
| 10 | Moor et al. (2023) | *Nature* | Review / Perspective | Conceptual review on foundation models in medicine without empirical test data. |
| 11 | Dosovitskiy et al. (2024) | *Acad Radiol* | Editorial / Technical Note | Editorial perspective on LLMs in thoracic imaging with no empirical sample. |
| 12 | Yang et al. (2025) | *Front Med* | Pediatric Population Only | Excluded based on PIRT criteria ($P$: adult patients); pediatric anatomy differs substantially. |
| 13 | Zhou et al. (2025) | *BMC Med Imaging* | Sub-Threshold Sample ($N < 50$) | Evaluated only 28 preliminary examinations in a pilot test setting. |
| 14 | Silva et al. (2024) | *Rev Saude Publica* | Survey / Non-Diagnostic | Assessed clinician perceptions of AI tools without evaluating diagnostic performance. |
| 15 | Kumar et al. (2025) | *Sci Rep* | Non-Generative Machine Learning | Evaluated random forest classifiers on extracted hand-crafted radiomic features. |
| 16 | Wang et al. (2024) | *Int J Med Inform* | No Validated Ground Truth | Index test compared against unverified trainee preliminary reports. |
| 17 | Martinez et al. (2025) | *Diagn Interv Imaging* | Duplicate Patient Cohort | Overlapping institutional cohort with a larger study already included. |

---

## Table S7. Complete Leave-One-Out Sensitivity and Influence Analysis ($N=8$ per Iteration)

All models fitted using Reitsma's bivariate random-effects model (REML) in R (`mada::reitsma`).

| Iteration | Excluded Study | Remaining Sample ($N$) | Pooled Sensitivity (95% CI) | Pooled Specificity (95% CI) | $\tau^2_{\text{sens}}$ | $\tau^2_{\text{fpr}}$ | SROC AUC | Methodological Interpretation |
| :---: | :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **0** | **None (Full Pool)** | **113,714** | **78.1% (54.9--91.3%)** | **96.8% (89.1--99.1%)** | **2.506** | **4.285** | **0.953** | Reference full bivariate model. |
| 1 | Hong 2025a | 111,569 | 74.0% (48.5--89.6%) | 97.1% (88.6--99.3%) | 2.347 | 4.313 | 0.943 | Minor sensitivity decrease; stable AUC. |
| 2 | Hong 2025b | 112,914 | 73.8% (48.4--89.4%) | 97.3% (89.8--99.3%) | 2.303 | 4.052 | 0.947 | Cluster test: removing Hong 2025b maintains high specificity and AUC. |
| 3 | Ostrovsky 2025 | 112,314 | 78.6% (51.7--92.7%) | 97.0% (88.3--99.3%) | 2.940 | 4.345 | 0.957 | Negligible impact on global summary point. |
| 4 | Huang 2023 | 113,214 | 77.3% (50.1--92.1%) | 96.5% (86.5--99.2%) | 2.884 | 4.334 | 0.950 | Minimal change in parameters. |
| 5 | **Huang 2025** | **16,063** | **79.2% (52.8--92.8%)** | **93.7% (91.0--95.6%)** | **2.917** | **0.236** | **0.950** | **Primary specificity determinant:** Omitting Huang 2025 drops $\tau^2_{\text{fpr}}$ from 4.285 to 0.236, proving that specificity variance stemmed from extreme low prevalence (0.03%). |
| 6 | Akçay 2025 | 113,494 | 79.2% (52.7--92.9%) | 96.8% (87.6--99.3%) | 2.917 | 4.394 | 0.956 | Marginal effect on variance. |
| 7 | Ciflik 2026 | 113,474 | 74.7% (50.1--89.6%) | 97.3% (89.4--99.3%) | 2.338 | 4.247 | 0.947 | Sensitivity drops slightly due to removing 100% sensitivity study. |
| 8 | **Güzel 2026** | **103,039** | **83.1% (65.3--92.7%)** | **97.0% (88.0--99.3%)** | **1.713** | **4.383** | **0.954** | **Primary sensitivity determinant:** Omitting Güzel 2026 drops $\tau^2_{\text{sens}}$ from 2.506 to 1.713 and raises pooled sensitivity by +5.0 percentage points. |
| 9 | Khovanova 2026 | 113,631 | 82.1% (60.7--93.2%) | 97.1% (88.6--99.3%) | 2.273 | 4.285 | 0.959 | Modest sensitivity increase upon discarding small nodule outlier. |

---

## CLAIM (*Checklist for Artificial Intelligence in Medical Imaging*) Compliance

| CLAIM Item | Description of Compliance in Current Review |
| :--- | :--- |
| **Title & Abstract** | Identified as a systematic review and bivariate meta-analysis of multimodal generative AI and VLMs in chest radiography. |
| **Study Objectives** | Explicitly formulated research question under PIRT framework, with exploratory synthesis justification. |
| **Search Strategy** | Full boolean search strings for PubMed, SciELO, and VHL with frozen screening window (Table S1). |
| **Reference Standard** | Fully described reference standards (expert thoracic consensus, chest CT verification, institutional records). |
| **Risk of Bias** | Full QUADAS-2 assessment with signaling questions across all 4 domains (Table S5). |
| **Statistical Methods** | Hierarchical bivariate random-effects model (Reitsma REML), SROC curves, prediction intervals, Fagan nomogram. |
| **Sensitivity Analyses** | 10 pre-specified sensitivity scenarios including volume outlier removal, cluster test, and Leave-One-Out (Table S7). |
| **AI Transparency** | Complete disclosure of AI assistive tools used during research in compliance with CNPq, ICMJE, RSNA, and Elsevier. |

---

## Scientific Integrity and Generative AI Disclosure

In accordance with **CNPq Ordinance No. 2,664/2026**, the International Committee of Medical Journal Editors (ICMJE) recommendations, the Radiological Society of North America (RSNA) guidelines, and the Elsevier Author Guide (*European Journal of Radiology Artificial Intelligence*), the use of generative AI technologies in this study is disclosed:
- **Software and Versions:** Claude 4.7 Sonnet, Claude 4.7 Opus (Anthropic, San Francisco, CA); Gemini 3.6 Flash, Gemini 3.1 Pro (Google DeepMind, Mountain View, CA).
- **Scope of Use:** Supportive computational programming (Python/R script optimization, deterministic TF-IDF screening, high-resolution figure plotting) and LaTeX typographical typesetting/English language editing.
- **Human Oversight:** Generative AI tools did not perform clinical eligibility determinations, QUADAS-2 risk judgments, or conceptual medical interpretations. All code, data extractions, statistical calculations, and text were audited, recalculated, and verified by the human author, who assumes full scientific, ethical, and legal accountability.
