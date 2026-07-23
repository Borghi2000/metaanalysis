# PRISMA-DTA Checklist (Filled)

**Study Title:** Diagnostic Accuracy of Generative and Multimodal Artificial Intelligence Models in Chest Radiograph Interpretation: A Systematic Review and Exploratory Bivariate Hierarchical Meta-analysis

**Author:** Gabriel Borghi de Freitas Oliveira

> **Note on section references.** Entries point to the numbered sections of
> `manuscript/main.tex` (compiled in `manuscript/main.pdf`). Page numbers are
> deliberately omitted because they shift on every recompilation; the section
> numbering is stable.
>
> **Note on study selection (item 9).** Title/abstract screening was **automated and
> deterministic** (TF-IDF + cosine similarity, threshold 0.04). Full-text eligibility,
> 2×2 extraction and QUADAS-2 judgement were performed by a **single reviewer**;
> inter-rater agreement (Cohen's κ) could therefore not be computed. This is declared
> in Section 2.2/2.3 and as limitation nº 1 (Limitations).

| Section/topic | # | PRISMA-DTA Checklist Item | Reported on Section |
| :--- | :--- | :--- | :--- |
| **TITLE** | 1 | Identify the report as a systematic review (+/- meta-analysis) of diagnostic test accuracy. | Title page |
| **ABSTRACT** | 2 | Provide a structured summary including: background; objectives; eligibility criteria; sources; risk of bias; methods of synthesis; results; limitations; conclusions; and register number. | Resumo / Abstract |
| **INTRODUCTION** | | | |
| Rationale | 3 | Describe the rationale for the review in the context of what is already known. | Section 1.1–1.3 |
| Objectives | 4 | State the objectives/questions, including: index test(s), reference standard, target condition(s), population, and clinical role. | Section 1.4 |
| **METHODS** | | | |
| Protocol and registration | 5 | Indicate if a review protocol exists and where it can be accessed; provide registration information. | Section 2.1 / OSF (osf.io/sh5z7) |
| Eligibility criteria | 6 | Specify study characteristics (e.g., PIRT) and report characteristics used as criteria for eligibility. | Section 2.2 |
| Information sources | 7 | Describe all information sources in the search and date last searched. | Section 2.2 (frozen window 2022/11/30–2026/06/09) |
| Search | 8 | Present full electronic search strategy for at least one database. | Section 2.2 / `SEARCH_PROVENANCE.json` |
| Study selection | 9 | State the process for selecting studies. | Section 2.2 (automated TF-IDF screening; single-reviewer full text) |
| Data collection | 10 | Describe method of data extraction from reports. | Section 2.3 (single reviewer) |
| Data items | 11 | List and define all variables for which data were sought. | Section 2.2 / 2.4 |
| Risk of bias | 12 | Describe methods used for assessing risk of bias (QUADAS-2). | Section 2.3 |
| Summary measures | 13 | State the principal summary measures (Sensitivity, Specificity, SROC, etc.). | Section 2.4 |
| Synthesis of results | 14 | Describe the methods of handling data and combining results of studies (Bivariate Model). | Section 2.4 / 2.5 |
| Risk of bias across studies | 15 | Describe methods of assessing risk of bias across studies (publication bias). | Section 2.6 / 3.5 (Deeks — descriptive only, <10 studies) |
| Additional analyses | 16 | Describe methods of additional analyses (sensitivity/subgroup analyses), indicating which were pre-specified. | Section 2.7 (five pre-specified scenarios) / 2.9 |
| **RESULTS** | | | |
| Study selection | 17 | Give numbers of studies screened, assessed for eligibility, and included. | Section 3.1 / PRISMA flowchart (29 assessed = 17 excluded + 12 included) |
| Study characteristics | 18 | For each study, present characteristics for which data were extracted. | Section 3.1 / Table 1 |
| Risk of bias | 19 | Present data on risk of bias and applicability concerns (QUADAS-2). | Section 3.1 / Table 3 / Figures QUADAS-2 (N=12) |
| Results of studies | 20 | For all included studies, present the individual 2x2 data and accuracy estimates. | Section 3.1 / Tables 1–2 |
| Synthesis of results | 21 | Present results of each meta-analysis, including confidence intervals. | Section 3.2 / Table 4 / Forest plots and SROC |
| Risk of bias across studies | 22 | Present results of assessment of risk of bias across studies. | Section 3.5 / Funnel plot (Deeks reported descriptively) |
| Additional analyses | 23 | Give results of additional analyses (sensitivity/subgroup analyses). | Section 3.3 (Table 5) / 3.5.1–3.5.4 |
| **DISCUSSION** | | | |
| Summary of evidence | 24 | Summarize the main findings including the strength of evidence. | Section 4.1–4.2 |
| Limitations | 25 | Discuss limitations at study and outcome level. | Section Limitations (item nº 1: single reviewer) |
| Conclusions | 26 | Provide a general interpretation of the results and implications. | Section 5 |
| **FUNDING** | 27 | Describe sources of funding for the systematic review. | No external funding; see repository README |

---
*Note: This checklist follows the PRISMA-DTA (Preferred Reporting Items for Systematic Reviews and Meta-Analyses of Diagnostic Test Accuracy) statement (McInnes et al., JAMA 2018).*
