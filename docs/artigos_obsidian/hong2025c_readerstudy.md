---
title: "Value of Using a Generative AI Model in Chest Radiography Reporting: A Reader Study"
authors: "Hong, E. K. and Roh, B. and Park, B. et al."
year: 2025
journal: "Radiology"
doi: "10.1148/radiol.241646"
pmid: "39964264"
pool: "complementary"
category: "Reader Study / Eficiência de Workflow"
architecture: "VLM (Domínio-específico)"
model_evaluated: "KARA-CXR"
tags:
  - artigo
  - pool/complementary
  - categoria/reader-study---eficiência-de-workflow
  - ano/2025
---

# Value of Using a Generative AI Model in Chest Radiography Reporting: A Reader Study

> [!abstract] Ficha de Artigo Metodológico / Complementar
> - **Autores:** Hong, E. K. and Roh, B. and Park, B. et al. (2025)
> - **Periódico:** *Radiology*
> - **Categoria:** Reader Study / Eficiência de Workflow
> - **Papel no Projeto:** Reader study multileitor (5 radiologistas, N=758); redução de 42% no tempo de laudo
> - **DOI:** [10.1148/radiol.241646](https://doi.org/10.1148/radiol.241646) | **PMID:** 39964264
> - **Índice Geral:** [[_Indice_Artigos]]
> - **Observações:** Estudo de fluxo e concordância clínica; não entra no pool bivariado principal por ausência de 2x2 isolado do modelo.

---

## Conteúdo do Artigo Original

**ORIGINAL RESEARCH•THORACIC IMAGING** 

# Value of Using a Generative AI Model in Chest Radiography Reporting: A Reader Study 

**_Eun Kyoung Hong, MD, PhD_**<sup>**_1,2_**</sup> **_• Byungseok Roh, MS_**<sup>**_3_**</sup> **_• Beomhee Park, MS_**<sup>**_3_**</sup> **_• Jae-Bock Jo_**<sup>**_4_**</sup> **_• Woong Bae, MS_**<sup>**_4_**</sup> **_• Jai Soung Park, MD, PhD_**<sup>**_5_**</sup> **_• Dong-Wook Sung, MD, PhD_**<sup>**_6_**</sup> 

Author affiliations, funding, and conflicts of interest are listed at the end of this article. 

See also the editorial by Babyn and Adams in this issue. **Radiology 2025; 314(3):e241646  •  https://doi.org/10.1148/radiol.241646  •  Content codes:** 

**_Background:_** Multimodal generative artificial intelligence (AI) technologies can produce preliminary radiology reports, and validation with reader studies is crucial for understanding the clinical value of these technologies. **_Purpose:_** To assess the clinical value of the use of a domain-specific multimodal generative AI tool for chest radiograph interpretation by means of a reader study. 

**_Materials and Methods:_** A retrospective, sequential, multireader, multicase reader study was conducted using 758 chest radiographs from a publicly available dataset from 2009 to 2017. Five radiologists interpreted the chest radiographs in two sessions: without AI-generated reports and with AI-generated reports as preliminary reports. Reading times, reporting agreement (RADPEER), and quality scores (five-point scale) were evaluated by two experienced thoracic radiologists and compared between the first and second sessions from October to December 2023. Reading times, report agreement, and quality scores were analyzed using a generalized linear mixed model. Additionally, a subset of 258 chest radiographs was used to assess the factual correctness of the reports, and sensitivities and specificities were compared between the reports from the first and second sessions with use of the McNemar test. **_Results:_** The introduction of AI-generated reports significantly reduced average reading times from 34.2 seconds ± 20.4 to 19.8 seconds ± 12.5 ( _P_ < .001). Report agreement scores shifted from a median of 5.0 (IQR, 4.0–5.0) without AI reports to 5.0 (IQR, 4.5–5.0) with AI reports ( _P_ < .001). Report quality scores changed from 4.5 (IQR, 4.0–5.0) without AI reports to 4.5 (IQR, 4.5–5.0) with AI reports ( _P_ < .001). From the subset analysis of factual correctness, the sensitivity for detecting various abnormalities increased significantly, including widened mediastinal silhouettes (84.3% to 90.8%; _P_ < .001) and pleural lesions (77.7% to 87.4%; _P_ < .001). While the overall diagnostic performance improved, variability among individual radiologists was noted. **_Conclusion:_** The use of a domain-specific multimodal generative AI model increased the efficiency and quality of radiology report generation. © RSNA, 2025 _Supplemental material is available for this article._ 

**A** ccurate and prompt interpretation of radiologic examination images is crucial because its potential impact on patient outcomes and discrepancies in interpretations can critically alter clinical management (1). Chest radiography is the most commonly conducted radiologic examination, and to interpret chest radiographs, expertise and considerable time are required (2,3). Traditional reliance on radiologist interpretations, while they are highly accurate, is associated with scalability challenges due to increasing imaging study volumes, leading to a substantial work burden that hinders timely diagnosis, disrupts the clinical workflow, and heightens the risk of misinterpretation (4). In many health care settings, the unavailability of radiologist interpretations emphasizes the need for innovative methods to ensure consistent, high-quality, and timely interpretations of chest radiographs (5). 

In general, radiologic interpretation includes detecting and localizing abnormalities, considering various potential diagnoses, and, most importantly, producing a comprehensive radiology report. Deep learning technology has recently been widely introduced for the initial part of chest radiograph interpretation, with various algorithms demonstrating effective performance on vision-based tasks, such as detection and segmentation (6). Multimodal generative artificial intelligence (AI) technologies, which 

can process and generate a range of data types, including images and text, have potential for advancing the field of radiology (7,8) Generative AI, unlike vision-based classification models, can create data-driven outputs such as detailed radiology reports, not only providing finding classifications but also generating comprehensive and contextually rich reports. 

Previous studies have explored the potential of multimodal generative AI models in creating radiologic interpretations (9,10). However, despite their potential, validation of the clinical value of multimodal generative AI models for increasing reporting accuracy and efficiency, especially through reader studies, remains an unexplored area in the current literature. In the past decade, reader studies have become pivotal for validating new diagnostic technologies in medical imaging, reaching beyond just measuring diagnostic accuracy (11). Therefore, it is crucial to validate the clinical value of multimodal generative AI models by means of a reader study to evaluate how well the technology fits into current workflows and the interpretability of the model outputs across different radiologists. 

Therefore, the aim of this study was to assess the clinical value of the use of a domain-specific multimodal generative AI model for chest radiograph interpretation by means of a reader study, with the goal of improving the radiology workflow. 

**This copy is for personal use only. To order copies, contact** **_reprints@rsna.org_** 

<u>Value of Using a Generative AI Model in Chest Radiography Reporting</u> 

<u>Hong et al</u> 

## Abbreviation 

AI = artificial intelligence 

## Summary 

Use of a multimodal generative artificial intelligence model increased the efficiency and quality of chest radiograph interpretations by reducing reading times and increasing report accuracy and agreement. 

## Key Results 

- In a reader study involving five radiologists interpreting 758 chest radiographs, introduction of artificial intelligence (AI)–generated reports reduced average reading times from 34.2 seconds to 19.8 ( _P_ < .001). 

- Agreement (median, 5.0 [IQR, 4.0–5.0] to 5.0 [IQR, 4.5–5.0]) and quality scores (4.5 [IQR, 4.0–5.0] to 4.5 [IQR, 4.5–5.0]) improved (both _P_ < .001). 

- Sensitivities increased for detecting widened mediastinal silhouettes (84.3% to 90.8%) and pleural lesions (77.7% to 87.4%) (both _P_ < .001). 

## <u>Materials and Methods</u> 

### Study Design 

The protocol for this reader study of a public dataset was exempted from review by the local institutional review board. This study was supported by Kakaobrain, which provided the AI model used in the analysis. Two authors (J.S.P. and D.W.S.) had control over the data and the information submitted for publication. 

### Dataset 

A total of 758 publicly available chest radiographs collected from 2009 to 2017 from the PadChest dataset were used (12), and the chest radiographs were randomly selected with use of Python (version 3.11.5). Table 1 shows the patient demographic characteristics and labels of the abnormalities on the chest radiographs included in the study; this information was provided by the group who initially published the dataset. 

### Report Generation AI Model 

The AI model used for the current study is a domain-specific multimodal generative AI model for chest radiograph report generation (KARA-CXR; Kakaobrain [now AIRead, Soombit.ai] [13]) trained between July 2022 and September 2023. Details are provided in Appendix S1. 

### Reader Study 

A sequential, multireader, multicase reader study was performed in two sessions with 758 chest radiographs (Fig 1) from October to December 2023. Five radiologists, who were the readers, with 7–15 years of experience in chest radiograph interpretation—three with subspecialty training in chest, one in breast, and one in general radiology—independently interpreted the chest radiographs and were blinded to the clinical or label information. In the first session, the readers evaluated the chest radiographs and created reports without AI; in the second session, the readers used AI-generated reports as preliminary drafts, with the option to revise. There was a 4-week washout period between the first and second sessions. Chest radiograph reporting was performed with a dedicated picture archiving and communication system workstation developed in-house, 

**Table 1: Patient Demographic and Chest Radiograph Label Characteristics for the Reader Study Dataset** 

|Characteristic|Value (_n_= 758)|
|---|---|
|Age (y)*|62 (2–97)|
|Sex||
|M|403 (53.2)|
|F|355 (46.8)|
|Projection||
|Posterior-anterior|583 (76.9)|
|Anterior-posterior|175 (23.1)|
|Normal chest radiographs||
|No. of radiographs|224|
|Age (y)*|52|
|Sex||
|M|84 (37.5)|
|F|140 (62.5)|
|Abnormal chest radiographs||
|No. of radiographs|534|
|Age (y)*|68|
|Sex||
|M|319 (59.7)|
|F|215 (40.3)|
|No. of labeled abnormalities||
|1|92 (17.2)|
|2|134 (25.1)|
|3|132 (24.7)|
|4|76 (14.2)|
|≥5<sup>†</sup>|100 (18.7)|
|Labels||
|Manual|563 (74.3)|
|Automatic|195(25.7)|

Note.—Unless otherwise specified, data are numbers of patients, with percentages in parentheses. 

- Age is reported as the median, with the range in parentheses. † The dataset included 42 (7.9%) and 28 (5.2%) cases that had five and six abnormalities, respectively. Additionally, 13 cases (2.4%) had seven, nine cases (1.7%) had eight, six cases (1.1%) had nine, one case (0.2%) had 10, and one case (0.2%) had 11 abnormalities. 

without voice recognition. Before the first session, each reader reviewed 10 chest radiographs (not included in the study) to familiarize themselves with the system. Additionally, readers were encouraged to save commonly used phrases as shortcut keys in the system before the first session. The sequence of the chest radiographs was randomized to minimize bias, and the reading times were recorded automatically. 

### Qualitative Evaluation of the Reports 

Two thoracic radiologists (J.S.P. and D.W.S.), who were evaluators, each with over 20 years of experience and who were not readers, separately evaluated the accuracy and quality of the reports from both sessions. The term _agreement_ refers to the degree of concordance between the radiologist’s opinion and the report, including the clinical significance of any discrepancies. The degree of concordance was evaluated with use of the RADPEER scoring system (14). Discrepancies and concordances were rated according to the following criteria: 1, clinically significant discrepancy; 2, clinically nonsignificant 

**2** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Value of Using a Generative AI Model in Chest Radiography Reporting</u> 

<u>Hong et al</u> 

**Figure 1:** Diagram shows study design. Outline of the reader study assessing the clinical efficacy of artificial intelligence (AI)–generated reports in improving reader performance. 

discrepancy; 3, clinically significant understandable miss; 4, clinically nonsignificant and understandable miss, which is justifiable given the complexity, subtlety, or difficulty of the case; and 5, complete agreement. The “quality” evaluation, however, is a subjective measure reflecting the radiologist’s opinion on the overall quality of the report. The overall report quality was quantified according to a five-point Likert scale: 1, very poor; 2, poor; 3, average; 4, good; and 5, excellent. The evaluators were blinded to all patient clinical information and the readers’ level of experience, and the median scores of the two evaluators were used for the analysis. 

### Factual Correctness of the Reports 

A subset of 258 chest radiographs was used for factual correctness analysis of 13 abnormal chest radiograph findings, as defined in the Fleischner Society glossary (15) (Appendix S2). The reference standard for assessing the accuracy of abnormal findings in chest radiographs was established on the basis of the consensus annotations of all three radiologists for each case. The three radiologists for reference standard establishment all had over 10 years of experience in chest radiograph interpretation, were blinded to all clinical information, and did not participate in the reader study. An automated label extraction 

model to annotate 13 specific abnormal findings was used (16). The label extraction model extracted labels for the presence of 13 abnormalities in all reports for the 258 chest radiographs, for a total of 10 reports from all five readers for the first and second sessions for each chest radiograph. 

### Statistical Analysis 

The sample size was guided by common practices in radiology reader studies and aimed to ensure sufficient power (80%, α = .05) to detect meaningful differences in agreement, quality, and performance metrics, recognizing the limitations of not conducting a formal power calculation. 

Reading times, report agreement, and quality scores were compared using a generalized linear mixed model between the first and second sessions for all five readers and were combined. The model included a fixed effect for the time point (first session as the reference) and a random effect for patients to account for repeated measures across the two sessions. Random intercepts were included to allow for variability between readers, and random slopes were included to capture individual variability in the effect of the introduction of the AI model. The model was fitted using restricted maximum likelihood estimation, and the significance of fixed effects was assessed using 

**3** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Value of Using a Generative AI Model in Chest Radiography Reporting</u> 

<u>Hong et al</u> 

**Table 2: Results of the Reader Study** 

||Rea|ding Time (se|c)|Report|Agreement Sco|re|Repo|rt Quality Scor|e|
|---|---|---|---|---|---|---|---|---|---|
|Result|Without<br>AI Report|With<br>AI Report|_P_Value|Without<br>AI Report|With<br>AI Report|_P_Value|Without<br>AI Report|With<br>AI Report|_P_Value|
|All readers|34.2 ± 20.4|19.8 ± 12.5|<.001|5.0 (4.0–5.0)|5.0 (4.5–5.0)|<.001|4.5 (4.0–5.0)|4.5 (4.5–5.0)|<.001|
|Reader 1|19.6 ± 33.4|12.8 ± 10.0|<.001|5.0 (4.5–5.0)|5.0 (4.5–5.0)|.007|5.0 (4.0–5.0)|4.5 (4.5–5.0)|.08|
|Reader 2|46.9 ± 40.3|47.6 ± 34.8|.55|5.0 (4.5–5.0)|5.0 (4.5–5.0)|.005|4.5 (4.0–5.0)|5.0 (4.5–5.0)|<.001|
|Reader 3|59.8 ± 59.1|7.6 ± 9.6|<.001|4.75 (4.0–5.0)|4.5 (4.5–5.0)|<.001|4.5 (4.0–5.0)|4.5 (4.5–5.0)|<.001|
|Reader 4|17.7 ± 15.0|12.1 ± 12.6|<.001|4.5 (3.5–5.0)|5.0 (4.5–5.0)|<.001|4.5 (3.5–5.0)|4.5 (4.0–5.0)|<.001|
|Reader 5|27.1 ± 20.3|19.1 ± 20.8|<.001|5.0 (4.0–5.0)|5.0 (4.5–5.0)|<.001|4.0 (3.5–4.5)|4.5 (4.5–5.0)|<.001|
|Normal vs abnormal||||||||||
|Labeled normal|20.4 ± 11.1|10.0 ± 5.1|<.001|5.0 (5.0–5.0)|5.0 (4.5–5.0)|.25|5.0 (4.5–5.0)|4.5 (4.5–5.0)|.02|
|Labeled abnormal|40.0 ± 20.6|24.0 ± 12.3|<.001|4.5 (4.0–5.0)|5.0 (4.5–5.0)|<.001|4.5 (4.0–5.0)|4.5 (4.5–5.0)|<.001|
|Specialty training<br>h||||||||||
|Thoracic|32.4 ± 22.8|10.8 ± 7.7|<.001|5.0 (4.0–5.0)|4.74 (4.5–5.0)|<.001|4.5 (4.0–5.0)|4.5 (4.5–5.0)|<.001|
|Nonthoracic|37.0 ± 26.1|33.4 ± 23.4|.005|5.0(4.5–5.0)|5.0(4.5–5.0)|<.001|4.5(4.0–5.0)|4.5(4.5–5.0)|<.001|

Note.—Reading times are means ± SDs, and report agreement and quality scores are medians, with IQRs in parentheses. Readers 1, 3, and 4 were thoracic radiologists; reader 2 was a general radiologist; and reader 5 was a breast radiologist. _P_ values were derived from a generalized linear mixed model with random intercepts. AI = artificial intelligence. 

_z_ tests. Subset analyses were performed for _(a)_ chest radiographs labeled as normal versus abnormal and _(b)_ subspecialties of the readers (thoracic vs nonthoracic). 

For the factual correctness analysis, the sensitivities and specificities of the clinical findings were evaluated with means and CIs and compared between the reports gathered from the first and second sessions with use of the McNemar test. 

Python’s extensive libraries, such as Pandas, SciPy, and statsmodels, were used for statistical testing. For all tests, _P_ < .05 was considered indicative of a statistically significant difference. _P_ value correction was performed using the Bonferroni method in the analysis of the differences in sensitivity and specificity across the 13 abnormal findings in chest radiographs. The statistical analyses were performed by an author (E.K.H.) with expertise in Python-based statistical modeling and medical data analysis. 

## <u>Results</u> 

### Reading Time 

The introduction of AI-generated reports reduced average reading times across all readers, with an average reduction from 34.2 seconds ± 20.4 (SD) to 19.8 seconds ± 12.5 with AI ( _P_ < .001) (Table 2, Fig 2A). The decrease in reading time was consistent across most readers, for both normal and abnormal chest radiograph cases and thoracic and nonthoracic specialty-trained readers. Individual reader analysis revealed a reduction in the reading time of reader 3, which decreased from 59.8 seconds ± 59.1 to 7.6 seconds ± 9.6 ( _P_ < .001). In contrast, a slight increase in reading time, from 46.9 seconds ± 40.3 to 47.6 seconds ± 34.8, was observed for reader 2, but the difference was not statistically significant ( _P_ = .55). 

### Report Agreement and Quality Scores 

Report agreement scores and report quality scores both generally improved with the use of AI-generated reports. The overall report agreement score shifted from a median of 5.0 (IQR, 4.0–5.0) 

to 5.0 (IQR, 4.5–5.0) ( _P_ < .001). For example, reader 4’s agreement score improved from 4.5 (IQR, 3.5–5.0) to 5.0 (IQR, 4.5–5.0) ( _P_ < .001). Furthermore, the overall report quality score changed from 4.5 (IQR, 4.0–5.0) to 4.5 (IQR, 4.5–5.0) (Table 2, Fig 2B). 

### Factual Correctness 

Table 3 presents the sensitivity and specificity of AI-generated reports alongside reader performances from the first and second sessions, focusing on various chest radiograph abnormalities from the subset analysis of factual correctness. AI demonstrated high sensitivity for detecting conditions such as subdiaphragmatic gas (four of four patients [100%]), subcutaneous emphysema (28 of 28 [100%]), and pneumothorax (23 of 24 [96%]). Specificity was consistently high across most categories, including pneumothorax (229 of 234 [98%]), subdiaphragmatic gas (249 of 251 [99%]), and widened mediastinum (217 of 221 [98%]). However, AI showed lower sensitivity for detecting lung opacity (two of 16 [13%]) and hyperinflation (one of four [25%]). 

From the subset analysis of factual correctness, the average sensitivity of identifying widened mediastinal silhouettes increased with AI-generated reports, at 90.8% (range across individual readers, 89.2%–91.9%) compared with 84.3% (range, 51.4%– 97.3%) without AI-generated reports ( _P_ < .001). Readers’ average sensitivities also increased in detecting consolidation (56.8% [range, 36.8%–73.7%] to 74.7% [range, 63.2%–84.2%]; _P_ = .003), lung opacity (28.8% [range, 12.5%–68.8%] to 51.3% [range, 31.3%–62.5%]; _P_ = .002), and pleural lesions (77.7% [range, 40.0%–97.1%] to 87.4% [range, 80.0%–94.3%]; _P_ < .001). However, readers’ average sensitivity for detecting nodules decreased with the introduction of AI-generated reports (from 86.7% [range, 66.7%–100.0%] to 80.0% [range, 66.7%– 100.0%]; _P_ < .001) (Fig 2C). The factual correctness of the reports created by the readers with and without the assistance of AI-generated reports according to each finding is summarized in Table 3 and Figure 3. 

**4** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Value of Using a Generative AI Model in Chest Radiography Reporting</u> 

<u>Hong et al</u> 

**Figure 2:** Examples of chest radiograph interpretations with and without artificial intelligence (AI)–generated reports. **(A)** An example of a case with the largest decrease in radiologist reading time following the presentation of AI-generated reports. The average reading time difference across the five readers was 227.8 seconds for the chest radiograph interpretation without and with an AI-generated report. The AI-generated report mentioned findings related to pulmonary edema (white arrows) and atelectasis or fibrotic changes at lung bases (black arrows). LLF = left lower lung field, LML = left middle lung, r/o = rule out. **(B)** An example that shows a case in which the introduction of AI-generated reports resulted in improvements in both agreement and quality scores, with increases of 2.4 and 1.8 points, respectively. Initially, in the first session without AI-generated reports, three out of five readers classified the case as normal. In contrast, during the second session with AI-generated reports, all five readers identified an infiltrate in the left lower lobe (arrow). LLL = left lower lung. **(C)** An example that features an AI-generated report that identified “scattered pulmonary granulomatous calcifications.” In the first session, three of five readers specifically reported the presence of a nodule. Following the introduction of the AI-generated report, only one reader maintained the specific mention of a nodule, whereas the other four readers adapted their reports to include the AI-suggested terminology of “granulomatous calcifications.” AP = anterior-posterior. All reports were generated with KARA-CXR (Kakaobrain) (now AIRead, Soombit.ai) (13). 

From the analysis of the effects of AI-generated reports on individual reader performance in identifying abnormal findings, the sensitivities and specificities of identifying abnormalities slightly changed with AI-generated reports, although the direction and statistical significance varied (Table 4). Reader 4 exhibited a change in performance, with sensitivity increasing from 54.2% (95% CI: 38.7, 69.8) without AI to 71.1% (95% CI: 62.4, 79.8) with AI and specificity decreasing from 93.4% (95% CI: 88.0, 99.9) without AI to 87.3% (95% CI: 75.9, 98.6) with AI ( _P_ < .001). Additionally, reader 5 exhibited a change in performance with AI, with sensitivity increasing from 61.9% (95% CI: 42.1, 81.7) without AI to 76.9% (95% CI: 63.4, 90.5) with AI and specificity decreasing from 92.9% (95% CI: 85.7, 100.0) without AI to 86.5% with AI (95% CI: 74.3, 98.6) ( _P_ < .001). 

## <u>Discussion</u> 

Validation of multimodal generative artificial intelligence (AI) technologies by means of reader studies is crucial for understanding their clinical value. Through our study, we found that the average reading time for radiologists was reduced from 34.2 seconds ± 20.4 to 19.8 seconds ± 12.5 with the presentation of AI-generated preliminary reports ( _P_ < .001). Report agreement scores, presented as medians, shifted from 5.0 (IQR, 4.0–5.0) to 5.0 (IQR, 4.5–5.0) ( _P_ < .001), and report quality scores changed from 4.5 (IQR, 4.0–5.0) to 4.5 (IQR, 4.5–5.0) ( _P_ < .001) with the presentation of AI-generated preliminary reports. In terms of factual correctness from the subset analysis, significant improvements were observed in the sensitivity for the detection of various abnormalities, including widened mediastinal 

**5** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Value of Using a Generative AI Model in Chest Radiography Reporting</u> 

<u>Hong et al</u> 

**Table 3: Average Reader Performance in Identifying Abnormal Findings from the Factual Correctness Analysis: A Subset Analysis of 258 Cases** 

|Chest Radiograph|<br>AI-genera<br>|ted Report<br>i|Without AI-ge<br>|nerated Reports<br>i|With AI-gene|rated Reports<br>i||
|---|---|---|---|---|---|---|---|
|Abnormality|Sensitivity (%)*|Specificity (%)*|Sensitivity (%)<sup>†</sup>|Specificity (%)<sup>†</sup>|Sensitivity (%)<sup>†</sup>|Specificity (%)<sup>†</sup>|_P_Value|
|Pneumothorax|96 (23/24)|97.8 (229/234)|89.2 (75.0–85.8)|97.9 (84.0–99.6)|88.3 (83.3–95.8)|96.8 (95.7–97.9)|.55|
|Subdiaphragmatic<br>gas|<br>100 (4/4)|99.2 (249/251)|97.1 (85.7–100.0)|99.3 (99.2–99.6)|94.3 (85.7–100.0)|99.8 (99.6–100.0)|.25|
|Widened<br>mediastinum|78 (29/37)|98.2 (217/221)|84.3 (51.4–97.3)|84.7 (72.0–96.8)|90.8 (89.2–91.9)|82.5 (81.5–83.3)|<.001|
|Subcutaneous<br>emphysema|100 (28/28)|98.7 (227/230)|68.6 (39.3–89.3)|99.7 (99.1–100.0)|87.1 (85.7–89.3)|99.7 (99.1–100.0)|.50|
|Consolidation|100 (19/19)|95.0 (227/239)|56.8 (36.8–73.7)|92.8 (88.3–95.4)|74.7 (63.2–84.2)|92.8 (91.6–93.3)|.003|
|Lung opacity|13 (2/16)|90.1 (218/242)|28.8 (12.5–68.8)|75.6 (58.7–90.1)|51.3 (31.3–62.5)|61.9 (58.3–67.4)|.002|
|Nodules|67 (2/3)|96.5 (246/255)|86.7 (66.7–100.0)|85.0 (74.5–92.2)|80.0 (66.7–100.0)|88.0 (85.5–92.2)|<.001|
|Fracture<br>f|97 (33/34)|95.1 (213/224)|68.8 (41.2–88.2)|99.4 (98.2–100.0)|77.7 (67.7–91.2)|98.7 (98.2–99.1)|>.99|
|Pleural effusion|0 (0/0)|87.2 (225/258)|0.0 (0.0–0.0)|100.0<br>(100.0–100.0)|0.0 (0.0–0.0)|100.0<br>(100.0–100.0)|NA|
|Pleural lesions|91 (32/35)|92.4 (206/223)|77.7 (40.0–97.1)|87.9 (68.2–98.2)|87.4 (80.0–94.3)|91.9 (81.6–96.0)|<.001|
|Pulmonary edema|62 (8/13)|98.0 (240/245)|67.7 (30.8–100.0)|92.6 (86.1–99.6)|70.8 (61.5–84.6)|89.0 (86.9–91.4)|>.99|
|Atelectasis<br>l|48 (19/40)|95.9 (209/218)|61.0 (30.0–85.0)|92.1 (86.7–96.3)|67.0 (60.0–75.0)|85.3 (84.9–86.7)|.04|
|Hyperinflation|25(1/4)|85.0(216/254)|25.0(0.0–50.0)|98.9(96.9–100.0)|45.0(25.0–50.0)|95.1(93.3–97.2)|.14|

Note.— _P_ values were derived from the McNemar test. The Bonferroni-corrected alpha level was .0038. AI = artificial intelligence, NA = not applicable. * Data in parentheses indicate the numbers of patients used to calculate sensitivity and specificity. † Values are derived from the average sensitivities and specificities of individual readers. Data in parentheses are minimum and maximum values of the sensitivities and specificities of individual readers. 

silhouettes, consolidation, lung opacity, and pleural lesions. However, the sensitivity for nodule detection also decreased from 86.7% (range, 66.7–100.0) to 80.0% (range, 66.7–100.0) ( _P_ < .001). Further analysis of the effects of AI-generated reports on individual radiologist performance revealed that AI assistance led to increases in sensitivity and specificity for some readers, whereas changes varied among individual radiologists. The results of our study demonstrated that preliminary reports created by a multimodal generative AI model could aid radiologists in chest radiograph interpretation in terms of reading time, report quality, and accuracy. 

Radiologic interpretation involves several steps, including detecting and localizing abnormalities, comparing with previous images, making differential diagnoses, and most importantly, generating reports. Our study is set apart from previous studies through the use of generative AI for radiology report generation to identify the clinical efficacy of such a method in the setting of a reader study. With this approach, we attempted to determine the clinical efficacy of using AI models not only in the first steps of radiologic interpretation but also in the final step of radiologic interpretation and report generation. Our study findings demonstrate the evolution of the technical capabilities from providing classifications and segmentations to preliminary reports using multimodal generative AI and suggest the clinical potential of this new technology. Through our study, we were able to observe changes in the reading time from the presentation of the image to the finalization of radiology reports with the inclusion of AI-generated reports, thereby evaluating the entire process. Unlike previous studies in which only the time from image presentation to the detection and localization of lesions was measured (17–20), 

the potential of the AI model to improve the entire radiology workflow was evaluated in our study. 

Furthermore, both the subjective and objective aspects of AIgenerated radiology reports in improving reader performance were analyzed in our study to determine the added value of the use of this technology in the radiology workflow. In previous studies, the accuracy and quality of reports generated by multimodal AI were evaluated, primarily relying on human ratings on four- or five-point scales (9,10). The subjective qualitative analysis findings from our study, which also included agreement and quality scores, offered insights into changes in the quality of reports as determined by experienced evaluators, comparing performance before and after the introduction of AI-generated reports. Additionally, the objective quantitative analysis provided data on changes in reading times and factual correctness, assessing the diagnostic performance of reports produced with and without the assistance of AI-generated reports. The results of this dual approach demonstrated that the introduction of AI-generated reports could generally increase the efficiency and quality of radiologic interpretations, decrease the reading time, and improve the accuracy of the reports. 

However, several specific results of our study in which the overall positive trend does not apply are interesting. Accurate detection of nodules on chest radiographs is crucial, as chest radiography is not the most effective tool in lung cancer screening but is commonly used for lung cancer screening because of its high availability (21,22). Our study revealed that while there was an overall increase in the detection of other findings, there was a decrease in the detection of nodules with the presentation of AI-generated reports in the interpretation process. 

**6** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Value of Using a Generative AI Model in Chest Radiography Reporting</u> 

<u>Hong et al</u> 

**Figure 3:** Changes in sensitivities and specificities in identifying abnormal findings on chest radiographs. Bar graphs show the **(A)** sensitivities and **(B)** specificities of radiologists in detecting various abnormal findings on chest radiographs, without and with the assistance of artificial intelligence (AI)–generated reports. The error bars display the minimum and maximum values observed among the radiologists. * = Radiographs showing pleural effusion were not part of the data subset used for the factual correctness analysis. 

This decrease could be attributed to the different terms used to describe “nodule,” such as “round opacity” or “calcified granulomas,” making it difficult for the labeler model to extract labels as a “nodule,” even though the underlying context is similar. Furthermore, only a few cases in the subset were positive for 

nodules, and the subset size was insufficient to draw conclusions because of a lack of statistical power. Future research should focus on further investigating the diagnostic performance of AI models and their ability to understand the context of medical reports and accurately extract labels. 

**7** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Value of Using a Generative AI Model in Chest Radiography Reporting</u> 

<u>Hong et al</u> 

**Table 4: Individual Reader Performance in Identifying Abnormal Findings from the Factual Correctness Analysis** 

||With|out AI|Wit|h AI||
|---|---|---|---|---|---|
|Reader|Sensitivity (%)|Specificity (%)|Sensitivity (%)|Specificity (%)|_P_Value|
|Reader 1|64.2 (44.2, 84.3)|91.2 (82.7, 99.8)|76.4 (66.5, 86.3)|85.3 (72.7, 98.0)|.23|
|Reader 2|77.1 (59.0, 95.2)|86.8 (78.7, 95.0)|80.8 (67.3, 94.3)|86.0 (75.2, 96.8)|.07|
|Reader 3|80.7 (69.7, 91.8)|84.9 (74.3, 95.9)|75.8 (66.7, 84.8)|85.2 (72.3, 98.1)|.73|
|Reader 4|54.2 (38.7, 69.8)|93.4 (88.0, 99.9)|71.1 (62.4, 79.8)|87.3 (75.9, 98.6)|<.001|
|Reader 5|61.9(42.1,81.7)|92.9(85.7,100.0)|76.9(63.4,90.5)|86.5(74.3,98.6)|<.001|

Note.—Data in parentheses are 95% CIs. Sensitivity and specificity values represent the mean across all findings. Readers 1, 3, and 4 were thoracic radiologists; reader 2 was a general radiologist; and reader 5 was a breast radiologist. _P_ values were derived from the McNemar test. AI = artificial intelligence. 

Additionally, we noticed individual variability in the effect of introducing AI-generated reports in improving radiologists’ performance. For example, reading time increased for one reader, who tended to be skeptical of the AI-generated reports throughout the study, whereas other readers tended to be more accepting and demonstrated high preference for AI-generated reports as preliminary readings. Additionally, the factual correctness analysis demonstrated that the diagnostic performances of the reports became somewhat homogeneous across radiologists after the introduction of AI-generated reports, with sensitivities and specificities ranging from 54.2%–80.7% and 84.9%–93.4%, respectively, without AI to 71.1%–80.8% and 85.2%–87.3%, respectively, with AI. There were statistically significant increases in sensitivity for two readers, one thoracic radiologist and one breast radiologist with similar years of experience. Notably, while most readers showed an increase in sensitivity following the presentation of AI-generated reports, one radiologist showed a decrease, although the difference was not statistically significant. This variation suggests that although the AI model may increase overall performance consistency, the direction of change and individual perception can vary. Further validation with a larger and more diverse group of radiologists is warranted to fully understand this phenomenon. 

Our study has several limitations. First, the retrospective design with a sequential reader study may have influenced the results, particularly in the reduced reading time observed. Future studies with a crossover design should be conducted to mitigate this potential bias. Second, the number of radiologists involved in the reader study was small, limiting subgroup analysis to examine the differences in the effects of the use of AI-generated reports among radiologists with diverse subspecialty training and experience levels. Third, only findings from reports were used in our study, with no comparisons with previous images. Moreover, some of the findings were missing in the subset analyzed for factual correctness, which should be further explored. A future prospective design study with a larger group of radiologists in diverse clinical settings and further development of the AI model to provide the impression part of the reports and comparative analyses should be performed to fully understand and validate the findings of our study. 

In conclusion, the results of this study suggest the potential of domain-specific multimodal generative artificial intelligence to increase the efficiency and quality of radiology report generation. 

#### **Author affiliations:** 

1 Department of Radiology, Mass General Brigham, Boston, Mass 

2 Department of Radiology, Brigham & Women’s Hospital, 75 Francis St, Boston, MA 02115 

3 Kakaocorp, Seoul, South Korea 

4 Soombit.ai, Seoul, South Korea 

5 Department of Radiology, Soonchunhyang University College of Medicine, Cheonan, South Korea 

6 Department of Radiology, Kyung Hee University School of Medicine, Seoul, South Korea 

Received June 13, 2024; revision requested July 29; final revision received December 2; accepted January 23, 2025. 

**Address correspondence to:** E.K.H. (email: amyh0803@gmail.com). 

**Funding:** Authors declared no funding for this work. 

**Acknowledgments:** The authors acknowledge the contributions of the following individuals who participated in the reader study of this research: Dr Jae Wook Lee, Department of Radiology, Soonchunhyang University Bucheon Hospital; Dr Joonseok Hwang, Kangnam Radiology Clinic; Dr Chan Ho Park, Department of Radiology, Soonchunhyang University Cheonan Hospital; Dr Dabee Lee, Department of Radiology, Dankook University Hospital; and Dr Sun Huh, Yonsei Kookmin Geongang Clinic. 

**Author contributions:** Guarantors of integrity of entire study, **E.K.H., J.B.J., W.B., D.W.S.** ; study concepts/study design or data acquisition or data analysis/interpretation, all authors; manuscript drafting or manuscript revision for important intellectual content, all authors; approval of final version of submitted manuscript, all authors; agrees to ensure any questions related to the work are appropriately resolved, all authors; literature research, **E.K.H., W.B., D.W.S.** ; clinical studies, **E.K.H., W.B., J.S.P., D.W.S.** ; experimental studies, all authors; statistical analysis, **E.K.H., W.B.** ; and manuscript editing, **E.K.H., B.R., J.S.P.** 

**Disclosures of conflicts of interest: E.K.H.** Former employee (medical advisor) of Kakaobrain (2022–2024). **B.R.** Former employee of Kakaobrain. **B.P.** Former employee of Kakaobrain. **J.B.J.** Former employee of Kakaobrain; receipt of medical data from Chungnam National University Hospital, Inha University Hospital, Keimyung University Dongsan Hospital, Soonchunhyang University Medical Center Seoul, Soonchunhyang University Medical Center Gumi, Soonchunhyang University Medical Center Cheonan, Ajou University Hospital, Ewha Womans University Seoul Hospital, Ewha Womans University Mokdong Hospital, Chungbuk National University Hospital, Dongguk University Ilsan Hospital, Segmed, and Vega Imaging Informatics; royalties from Chungnam National University Hospital, Inha University Hospital, Keimyung University Dongsan Hospital, Soonchunhyang University Medical Center Seoul, Soonchunhyang University Medical Center Gumi, Soonchunhyang University Medical Center Cheonan, Ajou University Hospital, Ewha Womans University Seoul Hospital, Ewha Womans University Mokdong Hospital, Chungbuk National University Hospital, and Dongguk University Ilsan Hospital; consulting agreements with Inha University Hospital, Asan Medical Center, Soonchunhyang University College and Graduate School of Medical Sciences, Chungnam National University Hospital, Department of Cardiology in Internal Medicine, Chungbuk National University Hospital, Keimyung University College of Medicine, Ewha Womans University College of Medicine, Dongguk University Medical Center, and Ajou University School of Medicine; membership on the institutional review board for data safety monitoring for Chungnam National University Hospital, Inha University Hospital, 

**Deputy Editor:** Mizuki Nishino **Scientific Editor:** Shannyn Wolfe (AJE) 

**8** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Value of Using a Generative AI Model in Chest Radiography Reporting</u> 

<u>Hong et al</u> 

Keimyung University Dongsan Hospital, Soonchunhyang University Medical Center Seoul, Soonchunhyang University Medical Center Gumi, Soonchunhyang University Medical Center Cheonan, Ajou University Hospital, Ewha Womans University Seoul Hospital, Ewha Womans University Mokdong Hospital, Chungbuk National University Hospital, and Dongguk University Ilsan Hospital. **W.B.** Former employee of Kakaobrain; receipt of medical data from Chungnam National University Hospital, Inha University Hospital, Keimyung University Dongsan Hospital, Soonchunhyang University Medical Center Seoul, Soonchunhyang University Medical Center Gumi, Soonchunhyang University Medical Center Cheonan, Ajou University Hospital, Ewha Womans University Seoul Hospital, Ewha Womans University Mokdong Hospital, Chungbuk National University Hospital, Dongguk University Ilsan Hospital, Segmed, and Vega Imaging Informatics; royalties from Chungnam National University Hospital, Inha University Hospital, Keimyung University Dongsan Hospital, Soonchunhyang University Medical Center Seoul, Soonchunhyang University Medical Center Gumi, Soonchunhyang University Medical Center Cheonan, Ajou University Hospital, Ewha Womans University Seoul Hospital, Ewha Womans University Mokdong Hospital, Chungbuk National University Hospital, and Dongguk University Ilsan Hospital; consulting agreements with Inha University Hospital, Asan Medical Center, Soonchunhyang University College and Graduate School of Medical Sciences, Chungnam National University Hospital, Department of Cardiology in Internal Medicine, Chungbuk National University Hospital, Keimyung University College of Medicine, Ewha Womans University College of Medicine, Dongguk University Medical Center, and Ajou University School of Medicine; membership on the institutional review board for data safety monitoring for Chungnam National University Hospital, Inha University Hospital, Keimyung University Dongsan Hospital, Soonchunhyang University Medical Center Seoul, Soonchunhyang University Medical Center Gumi, Soonchunhyang University Medical Center Cheonan, Ajou University Hospital, Ewha Womans University Seoul Hospital, Ewha Womans University Mokdong Hospital, Chungbuk National University Hospital, and Dongguk University Ilsan Hospital. **J.S.P.** No relevant relationships. **D.W.S.** No relevant relationships. 

### References 

1. Brady A, Brink J, Slavotinek J. Radiology and value-based health care. JAMA 2020;324(13):1286–1287. 

2. Speets AM, van der Graaf Y, Hoes AW, et al. Chest radiography in general practice: indications, diagnostic yield and consequences for patient management. Br J Gen Pract 2006;56(529):574–578. 

3. Mettler FA Jr, Mahesh M, Bhargavan-Chatfield M, et al. Patient exposure from radiologic and nuclear medicine procedures in the United States: procedure volume and effective dose for the period 2006–2016. Radiology 2020; 295(2):418–427. 

4. White CS, Flukinger T, Jeudy J, Chen JJ. Use of a computer-aided detection system to detect missed lung cancer at chest radiography. Radiology 2009; 252(1):273–281. 

5. Scheinfeld MH, Dym RJ. Update on establishing and managing an overnight emergency radiology division. Emerg Radiol 2021;28(5):993–1001. 

6. Çallı E, Sogancioglu E, van Ginneken B, van Leeuwen KG, Murphy K. Deep learning for chest x-ray analysis: a survey. Med Image Anal 2021;72:102125. 

7. Cao Y, Li S, Liu Y, et al. A comprehensive survey of ai-generated content (AIGC): a history of generative AI from GAN to ChatGPT. arXiv 2303.04226 [preprint] https://arxiv.org/abs/2303.04226. Posted March 7, 2023. Accessed December 2023. 

8. Pang T, Li P, Zhao L. A survey on automatic generation of medical imaging reports based on deep learning. Biomed Eng Online 2023;22(1):48. 

9. Nakaura T, Yoshida N, Kobayashi N, et al. Preliminary assessment of automated radiology report generation with generative pre-trained transformers: comparing results to radiologist-generated reports. Jpn J Radiol 2024;42(2):190–200. 

10. Huang J, Neill L, Wittbrodt M, et al. Generative artificial intelligence for chest radiograph interpretation in the emergency department. JAMA Netw Open 2023;6(10):e2336100. 

11. Gennaro G. The “perfect” reader study. Eur J Radiol 2018;103:139–146. 

12. Bustos A, Pertusa A, Salinas J-M, de la Iglesia-Vayá M. PadChest: a large chest x-ray image dataset with multi-label annotated reports. Med Image Anal 2020;66:101797. 

13. Kakaobrain. https://karacxr.ai. Accessed September 2023. 

14. Goldberg-Stein S, Frigini LA, Long S, et al. ACR RADPEER Committee white paper with 2016 updates: revised scoring system, new classifications, self-review, and subspecialized reports. J Am Coll Radiol 2017;14(8):1080–1086. 

15. Hansell DM, Bankier AA, MacMahon H, McLoud TC, Müller NL, Remy J. Fleischner Society: glossary of terms for thoracic imaging. Radiology 2008;246(3):697–722. 

16. Gu J, Cho H-C, Kim J, You K, Hong EK, Roh B. CheX-GPT: harnessing large language models for enhanced chest x-ray report labeling. arXiv 2401.11505 [preprint] https://arxiv.org/abs/2401.11505. Posted January 21, 2024. Updated November 6, 2024. Accessed March 2024. 

17. Nam JG, Kim M, Park J, et al. Development and validation of a deep learning algorithm detecting 10 common abnormalities on chest radiographs. Eur Respir J 2021;57(5):2003061. 

18. Sung J, Park S, Lee SM, et al. Added value of deep learning–based detection system for multiple major findings on chest radiographs: a randomized crossover study. Radiology 2021;299(2):450–459. 

19. Majkowska A, Mittal S, Steiner DF, et al. Chest radiograph interpretation with deep learning models: assessment with radiologist-adjudicated reference standards and population-adjusted evaluation. Radiology 2020;294(2):421–431. 

20. Aggarwal R, Sounderajah V, Martin G, et al. Diagnostic accuracy of deep learning in medical imaging: a systematic review and meta-analysis. NPJ Digit Med 2021;4(1):65. 

21. Passiglia F, Cinquini M, Bertolaccini L, et al. Benefits and harms of lung cancer screening by chest computed tomography: a systematic review and meta-analysis. J Clin Oncol 2021;39(23):2574–2585. [Published correction appears in J Clin Oncol 2021;39(28):3192–3193.] 

22. Kaneko M, Eguchi K, Ohmatsu H, et al. Peripheral lung cancer: screening and detection with low-dose spiral CT versus radiography. Radiology 1996;201(3):798–802. 

**9** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_