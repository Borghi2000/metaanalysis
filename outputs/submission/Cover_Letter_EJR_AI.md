# Cover Letter

To:  
**The Editor-in-Chief**  
*European Journal of Radiology Artificial Intelligence* (EJR AI)  
Elsevier B.V.

**Date:** September 3, 2026  

**Subject:** Submission of Original Review Article / Systematic Review and Meta-Analysis

Dear Editor-in-Chief and Editorial Board,

I am pleased to submit our manuscript entitled **"Diagnostic Accuracy of Multimodal and Generative Artificial Intelligence in Chest Radiograph Interpretation: A Systematic Review and Hierarchical Bivariate Meta-Analysis"** for consideration for publication in the *European Journal of Radiology Artificial Intelligence*.

### Background and Clinical Relevance
Chest radiography (CXR) remains the most widely performed diagnostic imaging examination worldwide, yet ongoing radiologist shortages and escalating clinical volumes contribute to diagnostic delays and cognitive burnout. In recent months, general-purpose Vision-Language Models (VLMs, such as GPT-4o, Gemini 2 Pro, and Claude 3.7 Sonnet) and domain-adapted medical generative models (such as KARA-CXR and Janus-Pro-CXR) have rapidly emerged, promising automated draft reporting and workflow acceleration. However, regulatory bodies (e.g., FDA, EMA, ANVISA) and clinical societies express urgent concern regarding their diagnostic reliability, susceptibility to hallucinations, and lack of spatial grounding.

### Novelty and Key Findings
To our knowledge, this is the **first systematic review and hierarchical bivariate meta-analysis (Reitsma REML model)** evaluating generative AI in chest radiography under PRISMA-DTA and QUADAS-2 guidelines. Synthesizing 12 primary studies published between 2023 and 2026 across 113,714 radiographs, our findings provide critical insights for radiologists:
1. **Pooled Performance & Inherent Heterogeneity:** The hierarchical model estimated a pooled sensitivity of 78.1% (95% CI: 54.9%–91.3%) and specificity of 96.8% (95% CI: 89.1%–99.1%), with an SROC AUC of 0.953. However, the 95% prediction interval for sensitivity spanned 6.4% to 99.5%, underscoring substantial between-study heterogeneity.
2. **Deconstruction of Specificity Variance:** Influence analysis (*Leave-One-Out*) revealed that between-study variance in false positive rates ($\tau^2_{\text{fpr}}$) dropped from 4.285 to 0.236 upon omitting a single prospective cohort with an extreme low disease prevalence (0.03%), demonstrating that the high pooled specificity is heavily sample-dependent.
3. **Domain-Specific vs. General-Purpose Models:** Domain-adapted architectures achieved markedly higher sensitivity (pooled 89.1%, LR+ 67.39) compared to commercial general-purpose models (pooled 64.8%, LR+ 10.60), which suffer from overly conservative decision thresholds induced by anti-hallucination RLHF penalties.
4. **Clinical Safety Warning:** Model sensitivity collapsed in small lesions (<2 cm pneumothorax AUC = 0.439; pulmonary nodules sensitivity = 31.6%) and showed substantial lateral errors (36.7% lateral inversion in tuberculosis screening). Consequently, **our findings provide robust scientific evidence advising against the autonomous use of generative AI for rule-out triage**, whereas an **assisted second-reading (copilot) paradigm with mandatory human oversight** is supported.

### Editorial & Ethical Statements
- **Compliance with Guidelines:** The review adheres strictly to PRISMA-DTA 2020, STARD 2015, QUADAS-2, and the CLAIM (RSNA) checklist.
- **Originality:** The work described has not been published previously, is not under consideration for publication elsewhere, and its publication is approved by all authors.
- **Competing Interests:** The author declares no competing financial or non-financial interests.
- **Generative AI Disclosure:** Generative AI tools (Claude 4.7 Sonnet/Opus and Gemini 3.6 Flash/3.1 Pro) were utilized strictly in a supportive capacity for programming code optimization, LaTeX typesetting, and language polishing, as formally detailed in the manuscript's Methods and Declaration sections in accordance with Elsevier and ICMJE policies. The human author retains full responsibility for all scientific content.
- **Open Science:** The study protocol is registered on the Open Science Framework (OSF; \url{https://osf.io/4yj92/}). All data extraction sheets, R statistical scripts, and audit logs are made publicly available via Zenodo (DOI: 10.5281/zenodo.19115371) and GitHub (\url{https://github.com/Borghi2000/metaanalysis}).

Given the acute clinical relevance, methodological rigor, and direct alignment with the aims and scope of *European Journal of Radiology Artificial Intelligence*, we believe this paper will be of strong interest to your readership.

Thank you very much for your consideration of our work.

Sincerely,

**Gabriel Borghi de Freitas Oliveira**  
Universidade de Santo Amaro (UNISA)  
Campus I, Rua Professor Enéas de Siqueira Neto, 340 – Jardim das Imbuias, São Paulo - SP, CEP 04829-300, Brazil  
ORCID: [https://orcid.org/0009-0001-7191-231X](https://orcid.org/0009-0001-7191-231X)  
Institutional E-mail: ugabriel2w@estudante.unisa.br  
Alternative E-mail: gabrielborghi10@gmail.com  
