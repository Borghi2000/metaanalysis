---
title: "Hong 2025a (2025) — Pneumothorax"
authors: "Hong 2025a"
year: 2025
journal: "Radiology"
doi: "10.1148/radiol.241476"
pmid: "314(3):e241476"
pool: "main"
architecture: "VLM"
model_evaluated: "KARA-CXR"
clinical_scenario: "Pneumothorax"
reference_standard: "3 radiologists consensus"
n_total: 2145
tp: 181
fp: 142
fn: 9
tn: 1813
sensibilidade: 0.9526
especificidade: 0.9274
acuracia: 0.9296
quadas_overall: "Low"
quadas_selecao: "Low"
quadas_indice: "Low"
quadas_referencia: "Low"
quadas_fluxo: "Low"
tags:
  - artigo
  - pool/main
  - ano/2025
  - condicao/pneumotorax
  - modelo/kara-cxr
---

# Hong 2025a (2025)

> [!abstract] Ficha de Auditoria e Metadados Clínicos
> - **Título / Identificador:** `hong2025a_diagnostic` | **Estudo:** [[hong2025a_diagnostic]]
> - **Cenário Clínico:** Pneumothorax
> - **Modelo Avaliado:** **KARA-CXR** (VLM)
> - **Padrão de Referência:** 3 radiologists consensus
> - **Amostra Total:** 2145 exames
> - **DOI:** [10.1148/radiol.241476](https://doi.org/10.1148/radiol.241476) | **PMID:** 314(3):e241476
> - **Índice Geral:** [[_Indice_Artigos]] | **Base Master:** `data/master_audit.csv`

> [!info] Desempenho Diagnóstico & Matriz 2×2 (Pool Principal)
> - **Sensibilidade:** 95.3% | **Especificidade:** 92.7% | **Acurácia Bruta:** 93.0%
> - **Razão de Verossimilhança:** RV+ = 13.12 | RV- = 0.05 | DOR = 262.4
> 
> | Matriz 2×2 | Condição Presente (+) | Condição Ausente (-) | Total |
> | :--- | :---: | :---: | :---: |
> | **Teste Positivo (IA+)** | **VP:** 181 | **FP:** 142 | 323 |
> | **Teste Negativo (IA-)** | **FN:** 9 | **VN:** 1813 | 1822 |
> | **Total Real** | 190 | 1955 | **N:** 2145 |

> [!warning] Avaliação Metodológica QUADAS-2
> - **Risco de Viés Global:** **Low**
> - **Domínios de Viés:** Seleção: `Low` | Teste Índice: `Low` | Padrão Ref.: `Low` | Fluxo/Tempo: `Low`

---

## Conteúdo do Artigo Original

**ORIGINAL RESEARCH• COMPUTER APPLICATIONS** 

# Diagnostic Accuracy and Clinical Value of a Domain-specific Multimodal Generative AI Model for Chest Radiograph Report Generation 

**_Eun Kyoung Hong, MD, PhD*_**<sup>**_1_**</sup> **_• Jiyeon Ham, MS*_**<sup>**_2_**</sup> **_• Byungseok Roh, MS_**<sup>**_2_**</sup> **_• Jawook Gu, PhD_**<sup>**_3_**</sup> **_• Beomhee Park, MS_**<sup>**_2_**</sup> **_• Sunghun Kang, MS_**<sup>**_2_**</sup> **_• Kihyun You, MS_**<sup>**_3_**</sup> **_• Jihwan Eom, MS_**<sup>**_2_**</sup> **_• Byeonguk Bae, MS_**<sup>**_2_**</sup> **_• Jae-Bock Jo, BS_**<sup>**_3_**</sup> **_• Ok Kyu Song, MD_**<sup>**_2_**</sup> **_• Woong Bae, MS_**<sup>**_3_**</sup> **_• Ro Woon Lee, MD_**<sup>**_4_**</sup> **_• Chong Hyun Suh, MD, PhD_**<sup>**_5_**</sup> **_• Chan Ho Park, MD_**<sup>**_6_**</sup> **_• Seong Jun Choi, MD, PhD_**<sup>**_6_**</sup> **_• Jai Soung Park, MD, PhD_**<sup>**_6_**</sup> **_• Jae-Hyeong Park, MD, PhD_**<sup>**_7_**</sup> **_• Hyun Jeong Jeon, MD_**<sup>**_8_**</sup> **_• Jeong-Ho Hong, MD, PhD_**<sup>**_9_**</sup> **_• Dosang Cho, MD, PhD_**<sup>**_10_**</sup> **_• Han Seok Choi, MD, PhD_**<sup>**_11_**</sup> **_• Tae Hee Kim, MD_**<sup>**_12_**</sup> 

* E.K.H. and J.H. contributed equally to this work. Author affiliations, funding, and conflicts of interest are listed at the end of this article. See also the editorial by Little in this issue. 

**Radiology 2025; 314(3):e241476  •  https://doi.org/10.1148/radiol.241476  •  Content codes:** 

**_Background:_** Generative artificial intelligence (AI) is anticipated to alter radiology workflows, requiring a clinical value assessment for frequent examinations like chest radiograph interpretation. 

**_Purpose:_** To develop and evaluate the diagnostic accuracy and clinical value of a domain-specific multimodal generative AI model for providing preliminary interpretations of chest radiographs. 

**_Materials and Methods:_** For training, consecutive radiograph-report pairs from frontal chest radiography were retrospectively collected from 42 hospitals (2005–2023). The trained domain-specific AI model generated radiology reports for the radiographs. The test set included public datasets (PadChest, Open-i, VinDr-CXR, and MIMIC-CXR-JPG) and radiographs excluded from training. The sensitivity and specificity of the model-generated reports for 13 radiographic findings, compared with radiologist annotations (reference standard), were calculated (with 95% CIs). Four radiologists evaluated the subjective quality of the reports in terms of acceptability, agreement score, quality score, and comparative ranking of reports from _(a)_ the domainspecific AI model, _(b)_ radiologists, and _(c)_ a general-purpose large language model (GPT-4Vision). Acceptability was defined as whether the radiologist would endorse the report as their own without changes. Agreement scores from 1 (clinically significant discrepancy) to 5 (complete agreement) were assigned using RADPEER; quality scores were on a 5-point Likert scale from 1 (very poor) to 5 (excellent). 

**_Results:_** A total of 8 838 719 radiograph-report pairs (training) and 2145 radiographs (testing) were included (anonymized with respect to sex and gender). Reports generated by the domain-specific AI model demonstrated high sensitivity for detecting two critical radiographic findings: 95.3% (181 of 190) for pneumothorax and 92.6% (138 of 149) for subcutaneous emphysema. Acceptance rate, evaluated by four radiologists, was 70.5% (6047 of 8680), 73.3% (6288 of 8580), and 29.6% (2536 of 8580) for model-generated, radiologist, and GPT-4Vision reports, respectively. Agreement scores were highest for the model-generated reports (median = 4 [IQR, 3–5]) and lowest for GPT-4Vision reports (median = 1 [IQR, 1–3]; _P_ < .001). Quality scores were also highest for the model-generated reports (median = 4 [IQR, 3–5]) and lowest for  the GPT-4Vision reports (median = 2 [IQR, 1–3]; _P_ < .001). From the ranking analysis, model-generated reports were most frequently ranked the highest (60.0%; 5146 of 8580), and GPT-4Vision reports were most frequently ranked the lowest (73.6%; 6312 of 8580). 

**_Conclusion:_** A domain-specific multimodal generative AI model demonstrated potential for high diagnostic accuracy and clinical value in providing preliminary interpretations of chest radiographs for radiologists. 

© RSNA, 2025 

_Supplemental material is available for this article._ 

he recent development of generative artificial intelligence (AI) **T** models, exemplified by well-recognized models like Open AI’s ChatGPT, has signaled a major shift in the landscape of medical technology (1,2). In particular, multimodal generative AI technology, which integrates various types of data, such as images and text, allows for a more comprehensive use in clinical scenarios, such as the interpretation of radiologic images (2–5). However, the adoption of AI in health care necessitates rigorous evaluation, particularly with patient safety in mind (6). In the medical field, the margin for error is minimal, and the consequences of mistakes may carry clinical significance. Therefore, a thorough examination of AI tools developed for the medical field is crucial. With the emergence of multimodal generative AI models, there is a need for ways to ensure that AI models are 

consistent with clinical objectives, in order for this new technology to be incorporated in the field of medicine. 

Precise and timely interpretation of medical images is important due to its substantial impact on patient outcomes, and discrepancies in interpretation, for any reason, can critically alter clinical management (7). Reliance on radiologist interpretation faces challenges due to increasing imaging volumes, leading to delays and potential misinterpretations, emphasizing the need for innovative, consistent, and efficient interpretation methods (8). Deep learning technology, increasingly used for radiologic image analysis, has shown promise in detection and segmentation tasks. However, its impact on reducing radiologist workload, accelerating report generation, and facilitating prompt diagnosis remains to be fully assessed (9–11). In this context, the 

**This copy is for personal use only. To order copies, contact** **_reprints@rsna.org_** 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

## Abbreviation 

AI = artificial intelligence 

## Summary 

A domain-specific multimodal generative AI model demonstrated potential for high diagnostic accuracy and clinical value in providing preliminary interpretations of chest radiographs for radiologists. 

## Key Results 

- A domain-specific multimodal generative AI model was trained on over 8 million radiograph-report pairs to generate a radiology report from a single-view frontal chest radiograph. The modelgenerated reports demonstrated high sensitivity in detecting two critical radiographic findings: 95.3% for pneumothorax and 92.6% for subcutaneous emphysema. 

- The rate of acceptance without modification of reports generated by the domain-specific AI model was 70.5%, compared with 73.3% and 29.6% for radiologist and GPT-4Vision reports, respectively. 

- ■ The reports generated by the domain-specific AI model were preferred over radiologist and GPT-4Vision reports in 60.0% of cases. 

application of multimodal generative models in medical imaging interpretation presents a novel approach (12), and a thorough evaluation of these models is critical. Constant efforts to evaluate not only the ability of models to accurately detect important abnormalities on medical images, but also the quality of generated reports and enhancement of workflow efficiency are essential for understanding the clinical significance and value of these generative AI models (13). 

Therefore, the aim of this study was to develop and evaluate the diagnostic accuracy and clinical value of a domain-specific multimodal generative AI model for interpreting chest radiographs, the most frequently conducted radiologic examination worldwide (14). The intention was to implement comprehensive evaluation strategies to thoroughly assess the model’s ability to generate clinically useful preliminary reports. 

## <u>Materials and Methods</u> 

This retrospective study was approved by the local institutional review boards of all participating hospitals. The requirement for written informed consent was waived, and all data were handled in compliance with the Health Insurance Portability and Accountability Act. This study was supported by Kakao Brain, which provided financial support and access to the computational resources required for the development of the AI model used in this research. The authors who were not employees or consultants of Kakao Brain (R.W.L., S.J.C., J.S.P., H.J.J., J.H.H., D.C., H.S.C., and T.H.K.) had full control over the inclusion and anonymization of data submitted for publication. 

### Study Design 

The clinical performance and clinical value of a domain-specific multimodal generative AI model designed for interpreting chest radiographs was evaluated using two different approaches (Fig 1). The first approach evaluated radiology report detection accuracy, that is, the classification performance of the model for 13 clinically important and frequent findings on chest radiographs. The second approach was a radiology report quality evaluation involving four different rating systems that compared the subjective observations of four radiologists across reports generated by the domain- 

specific AI model, radiologists, and a general-purpose large language model (GPT-4Vision; OpenAI). 

### Datasets 

Figure 2 depicts the data selection process for the model training and testing datasets. 

_Training set.—_ The training set included consecutive radiographreport pairs from frontal chest radiography retrospectively collected from 11 tertiary hospitals in Korea and 31 hospitals and clinics in the United States. Radiograph-report pairs in individuals aged over 15 years obtained between 2005 and 2023 (ie, after implementation of a picture archiving and communicating system) were included. Exclusion criteria were as follows: chest radiograph not in computer or digital radiograph format, chest radiograph not following Digital Imaging and Communications in Medicine (DICOM) standard, chest radiograph without corresponding radiology report, non-English chest radiograph report, and radiograph other than frontal chest radiograph. 

_Test set.—_ The test set included chest radiographs from the Korean and U.S. datasets that were not part of the training data but used the same inclusion and exclusion criteria, as well as radiographs from publicly available datasets (PadChest [15], Open-i [16], VinDr-CXR [17], and MIMIC-CXR-JPG [18]). The test set was used to analyze the detection accuracy and quality of the model-generated radiology reports. The test set was randomly selected initially but then curated by one radiologist (E.K.H., with 10 years of experience in chest radiograph interpretation) to contain an even distribution of abnormal findings for adequate performance evaluation. 

### Model Training 

The AI model developed in this study receives a single-view frontal chest radiograph as input and generates a radiology report as the final output. The model generates radiology reports by first classifying abnormalities through a multilabel classification system using an image encoder, transformer encoder, and classification head (19). To address data scarcity, a two-way loss strategy was used during training (20). The final report is generated by a transformer decoder conditioned on the classified abnormalities and incorporating image features. This model (KARA-CXR, v1.0.0.1, developed by Kakao Brain; now called AIRead-CXR and made available by Sommbit.ai) is not commercially available but is available online for research use purposes only at _https:// airead.soombit.ai/_ (21,22). Detailed descriptions of the data processing and model training steps are provided in Appendix S1. 

### Model Testing 

_Radiology report detection accuracy.—_ The detection accuracy of model-generated radiology reports was evaluated for the 13 most clinically important and frequently identified abnormal findings in chest radiograph reports: atelectasis, consolidation, pleural effusion, fracture, hyperinflation, lung opacity, nodule or mass, pleural lesion (mass or thickening), pneumothorax, pulmonary edema, subcutaneous emphysema, subdiaphragmatic gas, and widened mediastinal silhouette that includes 

**2** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

**Figure 1:** Study design diagram outlining the comprehensive approach used to train and test a domain-specific multimodal generative artificial intelligence (AI) model that generates preliminary radiology reports for chest radiographs. **(A)** The AI model was trained on 8 838 719 radiograph-report pairs. **(B)** The detection accuracy of the model was assessed through comparison with expert radiologist annotations. **(C)** The model-generated reports were evaluated against reports created by radiologists and a general-purpose large language model (GPT-4Vision (GPT-4v]; OpenAI), using multiple quality metrics. 

cardiomegaly. These abnormal findings were not mutually exclusive and were identified based on the definitions provided in the Fleischner Society glossary (23). The 13 abnormal findings were categorized into three levels of clinical urgency (critical, urgent, or nonurgent) following the classifications established in an earlier study (24). In addition, an automated labeling model based on a BERT (Bidirectional Encoder Representations from Transformers) architecture and initialized with CheXbert (25) was developed to annotate the 13 specific abnormal findings, using pseudolabels generated by GPT-4 (OpenAI) (26) for 50 000 MIMIC-CXR-JPG reports (18) for training, and the accuracy of model-generated labels was evaluated against manual annotations (27); detailed information is provided in Appendix S2. 

To evaluate radiology report detection accuracy, the reference standard for identifying and categorizing abnormal findings on chest radiographs was based on independent annotations by three radiologists for each chest radiograph; a total of 12 radiologists (one general radiologist and 11 with subspecialty 

training [three thoracic, three musculoskeletal, one abdominal, two pediatric, and two neuroradiologic], all with over 8 years of experience in chest radiograph interpretation) who were aware of the study design but blinded to all clinical information were involved in the process. The radiologists independently evaluated the presence of the 13 predefined abnormal findings on the chest radiographs included in the test set. Multiple findings could be present in each case, and radiologists were instructed to label all suspicious findings accordingly. Each of the 12 radiologists evaluated over 300 chest radiographs, with varying sets of three radiologists reviewing the same radiographs to establish consensus. To quantify the level of agreement, three consensus levels were set: _full consensus_ if all three radiologists agreed, _partial consensus_ if two radiologists agreed, and _no consensus_ if only one radiologist detected a finding. 

_Radiology report quality evaluation.—_ As part of the methodological approach, a comparative analysis was conducted to 

**3** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

**Figure 2:** Data selection flowchart for artificial intelligence (AI) model training and testing. This flowchart outlines the data curation strategy for the development of the AI model, illustrating the consolidation of diverse radiograph-report pairs from multiple sources, the application of exclusion criteria to refine the dataset quality, and the subsequent categorization into training and test sets. All data were anonymized (including with respect to sex and gender). DICOM = Digital Imaging and Communications in Medicine. 

assess the quality of model-generated reports. This evaluation involved comparisons with radiologist reports generated by one of seven radiologists (all with over 6 years of experience in chest radiograph interpretation, without subspecialty training, and not involved in reference standard establishment) as well as reports generated using GPT-4Vision, accessed via ChatGPT (28), between September and December 2023. The radiologists and GPT-4Vision were provided with the same set of single-view frontal chest radiographs as the domain-specific AI model and were requested to write a radiology report, without access to any previous imaging or clinical information. The radiologists involved in creating radiologist reports provided consent for participation in the study but were not aware of the study design. GPT-4Vision was given a detailed and specific prompt for chest radiograph report generation (Appendix S3). 

The current study used four methods to comprehensively evaluate radiology report quality. Chest radiographs and associated reports in the test set were independently evaluated by four radiologists (readers) who were not involved in other parts of the study. This quality evaluation encompassed acceptability, agreement, quality, and a comparative ranking analysis. 

Acceptability was defined as whether the evaluating radiologist would endorse the report as their own and confirm it without changes. If a report was considered unacceptable, radiologists were required to categorize the reason for this judgment. The categories for unacceptability were as follows: incorrect indication of finding (ie, false-positive mention or omission of findings), 

incorrect location or position (eg, error in the identification of the location or number of lesions), incorrect severity (ie, error in differential diagnosis or probability assessment), or hallucination (ie, model-generated report referred to information that was not present in the input data, eg, the report mentioned previous imaging studies or findings from a CT scan, even though such information was not provided) (29). 

The agreement score was a subjective measure reflecting the extent of agreement between the evaluating radiologist’s opinion and the report, including the clinical significance of any discrepancies. The current study used RADPEER, a peer-review scoring system developed by the American College of Radiology to evaluate agreement (30). Discrepancies and concordances were scored on a 5-point scale: 1, clinically important discrepancy likely to affect patient management; 2, discrepancy in interpretation but unlikely to affect patient management; 3, minor discrepancy with clinical impact; 4, reasonable disagreement with no clinical impact; and 5, complete agreement between interpretations. 

The quality score was a subjective measure reflecting the evaluating radiologist’s opinion of the overall quality of the report, quantified using a 5-point Likert scale: 1, very poor; 2, poor; 3, fair or average; 4, good; and 5, excellent. 

The final component of the radiology report quality evaluation involved subjective comparative ranking of the radiology reports. It required evaluating radiologists to rank the modelgenerated, radiologist, and GPT-4Vision reports for each radiograph based on their overall impression, considering factors such 

**4** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

**Figure 3:** Overview of the evaluation questionnaire for the radiology report quality evaluation. 

as clarity, comprehensiveness, and clinical usefulness. The format of the questionnaire is shown in Figure 3, and examples of radiographs and reports provided to the evaluating radiologists are shown in Figure 4. 

### Statistical Analysis 

For radiology report detection accuracy, the sensitivity and specificity (with 95% CIs) of the model-generated reports for detection of the 13 clinical findings, and all the findings combined, were separately calculated for full-consensus, partial-consensus, and no-consensus reference standards, as established by the three independent radiologists. 

For the radiology report quality evaluation, report acceptance rate was calculated as the proportion of accepted reports out of the total number of reports and was compared between modelgenerated, radiologist, and GPT-4Vision reports for each reader 

and all readers combined using χ<sup>2</sup> tests. Agreement score, quality score, and word count for the reports are presented as medians and IQRs and were compared between the three report types for each reader and all readers combined using the Kruskal-Wallis test. Comparative rankings were analyzed using percentage distributions for each ranking of the three reports and were compared using the χ<sup>2</sup> test. 

The extensive libraries for Python (Python Software Foundation), such as Pandas (version 2.1.1), were used for data manipulation, and SciPy (version 1.11.3) was used for statistical testing, to ensure robust and accurate analysis of the data. For all tests, _P_ < .05 was considered to indicate a statistically significant difference. _P_ value correction was performed using the Bonferroni method. 

## <u>Results</u> 

### Dataset Characteristics 

For the training set, 14 424 926 radiograph-report pairs were initially collected from 11 tertiary hospitals in Korea, and 208 040 radiograph-report pairs were collected from 31 hospitals in the United States. After exclusions, 8 631 116 radiographs from the Korean dataset and 207 603 radiographs from the U.S. dataset were included in the final training set. The test set included 1132 radiographs from the Korean dataset and 437 radiographs from the U.S. dataset that were not part of the training data, as well as 576 radiographs from publicly available datasets (258 from PadChest, 78 from Open-i, 196 from VinDr-CXR, and 44 from MIMIC-CXR-JPG) (Fig 2). 

### Radiology Report Detection Accuracy 

The sensitivity of the reports generated by the domain-specific AI model for critical findings like pneumothorax was up to 95.3% (181 of 190; 95% CI: 92.2, 98.3) for full-consensus, 92.4% (230 of 249; 95% CI: 89.1, 95.7) for partial-consensus, and 84.5% (267 of 316; 95% CI: 80.5, 88.5) for no-consensus reference standards, reflecting robust critical abnormality detection (Table 1). Overall sensitivity across all clinical findings evaluated was 83.2% (1821 of 2190; 95% CI: 81.6, 84.7) for the full-consensus reference standard, decreasing to 51.7% (3958 of 7659; 95% CI: 50.6, 52.8) for the no-consensus reference standard, while specificity slightly increased from 87.9% (22 591 of 25 695; 95% CI: 87.5, 88.3) for the full-consensus reference standard to 95.2% (19 259 of 20 226; 95% CI: 94.9, 95.5) for the no-consensus reference standard, indicating consistent accuracy of the model-generated reports in identifying negative cases. Figure 5 shows representative radiographs illustrating abnormality detection in the model-generated reports, and Figure 6A presents the sensitivity and specificity data from Table 1 graphically. 

### Radiology Report Quality Evaluation 

_Word count.—_ The median word count of reports was 37 (IQR, 29–49) for reports generated by the domain-specific AI model, 61 (IQR, 52–70) for radiologist reports, and 117 (IQR, 105– 132) for GPT-4Vision reports, with a significant difference between the groups ( _P_ < .001). 

**5** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

_Acceptance rate.—_ Of 8580 report evaluations (four independent readers for each report), report acceptance rate across all readers was 73.3% (6288 of 8580) for radiologist reports and 70.5% (6047 of 8580) for reports generated by the domainspecific AI model (Table 2, Fig 6B). In the subset of unacceptable reports, false-positive findings were noted in 11.3%, 9.7%, and 31.7% (971, 831, and 2719 of 8580) of modelgenerated, radiologist, and GPT-4Vision reports, respectively, while false-negative findings were reported in 18.5%, 17.8%, and 39.0% (1584, 1527, and 3347 of 8580), respectively (Table 3). Of these reports with false-positive or -negative findings, 56.5% (1444 of 2555), 65.8% (1552 of 2358), and 73.3% (4446 of 6066) were judged clinically significant for model-generated, radiologist, and GPT-4Vision reports, respectively. Errors in abnormal finding localization on chest radiographs were identified in 14.8%, 13.9%, and 32.7% (1270, 1192, and 2806 of 8580) of model-generated, radiologist, and GPT-4Vision reports, respectively, and incorrect 

counts (eg, number of lesions) were identified in 0.5%, 0.2%, and 0.4% (43, 18, and 32 of 8580), respectively, with 22.4% (294 of 1313), 15.8% (191 of 1210), and 27.8% (788 of 2838) of location or count errors being clinically significant. Hallucinations were present in 19.9% (1707 of 8580) of reports generated by the domain-specific AI model and 42.9% (3684 of 8580) of GPT-4Vision reports (Table 3). 

_Agreement and quality scores.—_ While the median quality score was the same for the reports generated by the domain-specific AI model and radiologists, the model-generated reports demonstrated significantly higher agreement and quality scores compared with the radiologist reports and GPT-4Vision reports, as indicated by statistical testing (median agreement score = 4 [IQR, 3–5], 3 [IQR, 2–5], and 1 [IQR, 1–3] for model-generated, radiologist, and GPT-4Vision reports, respectively, _P_ < .001; median quality score = 4 [IQR, 3–5],  4 [IQR, 2–5], and 2 [IQR, 1–3] for model-generated, radiologist, and GPT-4Vision reports, 

**Figure 4:** Examples of frontal chest radiographs and associated reports generated by a domain-specific artificial intelligence (AI) model, radiologist, and GPT-4Vision (GPT-4v) (OpenAI). **(A)** The report generated by the domain-specific AI model proposes a diagnosis of advanced metastatic disease, the radiologist report suggests miliary Koch tuberculosis, and the GPT-4Vision report proposes potential pulmonary edema or infection as diagnoses. All three of the radiologists involved in establishing the reference standard for this radiograph reported pulmonary metastasis as the most likely diagnosis. **(B)** The report generated by the domain-specific AI model accurately detects a left clavicle fracture (arrow) but also erroneously suggests a left pneumothorax. The radiologist and GPT-4Vision reports do not mention these findings, instead describing the lung fields as clear with a normal cardiac silhouette and mediastinum. Of the three radiologists involved in establishing the reference standard for this radiograph, two confirmed the clavicle fracture, while none reported a pneumothorax. The model-generated report also mentions a CT scan, which represents a hallucination, since CT images were not provided as input _(Fig 4 continues)_ . 

**6** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

**Figure 4** **_(continued)_ : (C)** The report generated by the domain-specific AI model identifies the presence and location of an endotracheal (ET) tube, esophagogastric tube, and right peripherally inserted central catheter (PICC). The report also notes mild pulmonary vascular congestion and a left basilar consolidative opacity, while the radiologist report notes pleural effusion and consolidation. The GPT-4Vision report describes diffuse lung opacities and possible cardiomegaly, with no evidence of pneumothorax. AP = anteroposterior, CP = costophrenic, SVC = superior vena cava. 

respectively; _P_ < .001). Detailed results are displayed in Table 2 and Figure 6C and 6D. 

_Comparative ranking analysis.—_ The comparative ranking analysis by the readers demonstrated that reports generated by the domain-specific AI model were favored, receiving the highest proportion of first-place rankings overall (60.0%, 5146 of 8580); radiologist reports received the most second-place rankings (54.7%, 4695 of 8580) (Table 4, Fig 6E). There was a statistically significant difference in the distribution of rankings among the three types of reports ( _P_ < .001). 

## <u>Discussion</u> 

Generative artificial intelligence (AI) is anticipated to alter radiology workflows, requiring assessment of its clinical value for frequent tasks like chest radiograph interpretation. In this study, we developed and evaluated a multimodal generative AI model for preliminary radiology report generation for chest radiographs and demonstrated the model’s potential in aiding radiologic 

interpretation. Our comprehensive evaluation included two distinct methods. First, we assessed radiology report detection accuracy, focusing on the ability of the model-generated reports to identify 13 clinical findings on chest radiographs. The reports demonstrated reliable detection performance, especially for critical conditions like pneumothorax (95.3%, 181 of 190) and subcutaneous emphysema (92.6%, 138 of 149). The sensitivity remained substantial even with decreasing consensus among radiologists for the reference standard, indicating the model’s robustness. Second, we conducted a radiology report quality evaluation, that is, a qualitative comparison of reports generated by the domain-specific AI model, radiologists, and a generalpurpose language model (GPT-4Vision). The rate of acceptance without modification of reports generated by the domain-specific AI model was 70.5% (6047 of 8680), compared with 73.3% (6288 of 8580) and 29.6% (2536 of 8580) for the radiologist and GPT-4Vision reports, respectively. The reports generated by the domain-specific AI model received high agreement and quality scores and were most frequently ranked the highest (60.0%, 5146 of 8580) among the three report types by evaluating radiologists. 

The strengths of our AI model can be summarized as follows. First, we used an extensive multinational dataset of paired radiographs and reports to develop our multimodal generative AI model. Second, our approach focused on making the model domain-specific, with substantial training data tailored to a specific medical context—preliminary chest radiograph report generation. This approach is unlike previous studies that applied a general-purpose generative model to detecting radiologic findings on chest radiographs in a zero-shot setting, using commercially available classification algorithms for abnormality classification and autonomous chest radiograph reporting (31,32). Third, the performance of the AI model was evaluated with a test set of radiographs from private and public datasets from diverse nations. The model testing process was further strengthened by involving radiologists with various expertise to establish the reference standard and evaluate the model’s performance. Additionally, unlike previously suggested metrics for evaluating AI-generated chest radiograph reports (33), our study used an approach that combined objective analysis of factual correctness with subjective evaluations provided by radiologists. By using a comprehensive array of evaluation methods encompassing factual correctness, acceptability, agreement, quality, and ranking, we not only assessed the technical viability of the AI model, but also further identified the potential clinical value of AI report generation in aiding radiologic interpretation. 

The testing of the AI model in the current study provides several interesting insights that suggest directions for further development and optimization. First, acceptability rate, which can potentially represent the autonomous reporting rate, was higher for radiologist reports compared with the model- generated reports, which scored higher in agreement and quality. This suggests that subtle differences in the language or structure of the model-generated reports, rather than the quality of the findings, may account for lower acceptability, as readers appeared more accustomed to the style and format of the radiologists’ reports. Second, the results of the study demonstrated that most of the false-positive and false-negative findings of the model-generated reports were clinically significant errors, with a substantial number of 

**7** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

**Table 1: Performance of the Domain-specific AI Model for Abnormal Findings According to Consensus Level of the Reference Standard** 

||||Consensus Level o|f Reference Standard*|||
|---|---|---|---|---|---|---|
||Full C|onsensus|Partial|Consensus|No C|onsensus|
|Abnormal Finding|Sensitivity (%)|Specificity (%)|Sensitivity (%)|Specificity (%)|Sensitivity (%)|Specificity (%)|
|Critical|||||||
|Pneumothorax|95.3<br>(92.2, 98.3)<br>[181/190]|92.7<br>(91.6, 93.9)<br>[1813/1955]|92.4<br>(89.1, 95.7)<br>[230/249]|95.1<br>(94.1, 96.1)<br>[1803/1896]|84.5<br>(80.5, 88.5)<br>[267/316]|96.9<br>(96.1, 97.7)<br>[1773/1829]|
|Subdiaphragmatic|71.9|99.9|58.1|100.0|45.3|100.0|
|gas|(60.3, 83.6)<br>[41/57]|(99.7, 100.0)<br>[2085/2088]|(46.9, 69.3)<br>[43/74]|(99.9, 100.0)<br>[2070/2071]|(35.3, 55.3)<br>[43/95]|(99.9, 100.0)<br>[2049/2050]|
|Widened|81.0|80.0|66.5|87.0|53.9|93.6|
|mediastinum|(76.4, 85.7)<br>[222/274]|(78.2, 81.8)<br>[1497/1871]|(62.7, 70.3)<br>[395/594]|(85.4, 88.7)<br>[1350/1551]|(50.8, 57.1)<br>[520/964]|(92.2, 95.0)<br>[1105/1181]|
|Subcutaneous|92.6|98.6|83.1|99.8|72.7|99.9|
|emphysema|(88.4, 96.8)<br>[138/149]|(98.1, 99.1)<br>[1968/1996]|(77.8, 88.3)<br>[162/195]|(99.6, 100.0)<br>[1946/1950]|(66.9, 78.5)<br>[165/227]|(99.8, 100.1)<br>[1918/1918]|
|Urgent|||||||
|Consolidation|733|923|471|952|278|974|
||.<br>(68.4, 79.8)<br>[63/86]|.<br>(91.1, 93.4)<br>[1900/2059]|.<br>(41.3, 53.0)<br>[132/280]|.<br>(94.2, 96.1)<br>[1775/1865]|.<br>(24.3, 31.2)<br>[184/663]|.<br>(96.6, 98.2)<br>[1444/1482]|
|Lung opacity|56.5|74.1|50.6|78.5|41.7|85.3|
||(48.0, 65.0)<br>[74/131]|(72.2, 76.0)<br>[1492/2014]|(46.1, 55.2)<br>[235/464]|(76.6, 80.5)<br>[1320/1681]|(38.7, 44.7)<br>[434/1040]|(83.3, 87.4)<br>[943/1105]|
|Nodule|89.1|82.4|74.4|85.8|51.3|89.6|
||(84.2, 94.0)<br>[139/156]<br>|(80.7, 84.1)<br>[1639/1989]<br>|(69.5, 79.2)<br>[229/308]<br>|(84.3, 87.4)<br>[1577/1837]|(47.5, 55.1)<br>[334/651]<br>|(88.1, 91.2)<br>[1339/1494]|
|Fracture<br>f|68.7<br>(62.2, 75.1)<br>[136/198]|95.4<br>(92.3, 96.4)<br>[1858/1947]|59.6<br>(54.1, 65.0)<br>[187/314]|97.9<br>(97.3, 98.6)<br>[1793/1831]|43.0<br>(38.5, 47.4)<br>[204/477]|98.8<br>(98.3, 99.3)<br>[1648/1668]|
|Pleural effusion|95.9|76.0|89.1|82.5|77.7|90.7|
||(94.0, 97.7)<br>[439/458]<br>|(74.0, 78.0)<br>[1282/1687]<br>|(86.8, 91.5)<br>[583/654]<br>|(80.6, 84.4)<br>[1230/1491]<br>|(75.0. 80.4)<br>[732/942]<br>|(89.0, 92.3)<br>[1091/1203]<br>|
|Pleural lesion|75.4<br>(67.7, 83.2)<br>[89/118]|93.3<br>(92.3, 94.4)<br>[1892/2027]|57.9<br>(51.5, 64.3)<br>[132/228]|95.2<br>(94.2, 96.2)<br>[1825/1917]|33.5<br>(29.3, 37.6)<br>[165/493]|96.4<br>(95.5, 97.3)<br>[1593/1652]|
|Pulmonary edema|93.8|86.1|84.3|90.5|64.3|95.0|
||(88.9, 98.6)<br>[90/96]|(84.6, 87.6)<br>[1764/2049]|(79.6, 89.0)<br>[193/229]|(89.2, 91.8)<br>[1734/1916]|(59.9, 68.7)<br>[290/451]|(93.9, 96.0)<br>[1609/1694]|
|Nonurgent|||||||
|Atelectasis|74.1|75.3|62.7|79.8|51.6|86.0|
|l|(68.4, 79.8)<br>[169/228]<br>|(73.4, 77.3)<br>[1444/1917]<br>|(58.5, 67.0)<br>[308/491]|(77.9, 81.7)<br>[1320/1654]<br>|(37.0, 83.1)<br>[469/909]<br>|(84.1, 87.9)<br>[1063/1236]|
|Hyperinflation<br>i|81.6<br>(70.8, 92.5)<br>[40/49]|93.4<br>(92.3, 94.4)<br>[1957/2096]|55.8<br>(48.6, 63.0)<br>[101/181]|96.0<br>(95.2, 96.9)<br>[1886/1964]|34.8<br>(30.3, 39.3)<br>[150/431]|98.3<br>(97.7, 98.9)<br>[1685/1714]|
|All findings<sup>†</sup>|83.2|87.9|68.8|91.6|51.7|95.2|
|i|(81.6, 84.7)|(87.5, 88.3)|(67.4, 70.2)|(91.2, 91.9)|(50.6, 52.8)|(94.9, 95.5)|
||[1821/2190]|[22591/25695]|[2930/4261]|[21629/23624]|[3958/7659]|[19259/20226]|
|Note.—Data in paren           h i<br>developed by Kakao B<br>* To quantify the leve<br>radiologist agreed, an<br>†Multiple findings co<br>findings.|theses are 95% CIs        h i<br>rain (now called A<br>l of agreement, thre<br>d_no consensus_if onl     i<br>i uld be present on|; data in brackets are    h i<br>IRead-CXR and mad<br>e consensus levels we<br>y one radiologist det  i<br>i     a single image, and e|numbers of reports h i<br>e available by Somm<br>re set:_full consensus_ <br>ected a finding.<br>i         ach is counted as a|. The domain-specifi<br>bit.ai) (21).<br>if all three radiologis<br>i              separate observation|h ic AI model is KARA<br>ts agreed,_partial co_<br>i                for the combined|h i    -CXR, v1.0.0.1,<br>_nsensus_if two<br>i                   analysis of all|

**8** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

**Figure 5:** Four representative frontal chest radiographs illustrating the detection performance of the radiology reports generated by the domain-specific artificial intelligence model. **(A)** The model-generated report for this image was as follows: “Cardiac silhouette is normal. There is a right hilar mass, which may represent a neoplasm, and there is also a right lower lobe consolidation which may represent pneumonia. Patchy opacities are also seen in the right lung base which may represent additional infiltrate. The lungs are hyperinflated, but otherwise clear. No pleural effusion or pneumothorax. No acute osseous abnormality.” The report correctly indicates the presence of a mass (white arrow), in agreement with the radiologists’ interpretation. The black arrow indicates the consolidation identified by the model-generated report. **(B)** The model-generated report for this image was as follows: “The cardiac silhouette is normal in size. There is mild bronchial wall thickening and hyperinflation consistent with COPD. Mild opacity at the bilateral lung bases likely secondary to atelectasis or scarring. There is no definite acute focal consolidation, pleural effusion, or pneumothorax. Bones and soft tissues appear unremarkable.” The report mentions chronic obstructive pulmonary disease (COPD) as present, in contrast to the radiologists’ interpretation. **(C)** The model-generated report for this image was as follows: “The lungs are clear and well aerated. No infiltrate or nodule or effusion is noted. The trachea, mediastinum, heart size, diaphragm and bony elements are intact.” The report accurately indicates the absence of any abnormal findings, consistent with the radiologists’ interpretation. **(D)** The model-generated report for this image was as follows: “The lungs demonstrate no consolidations. The lung parenchymal density and interstitial markings are accentuated secondary to overlying soft tissues. This is more prominent on the LEFT. No pneumothorax. NO evidence of acute disease/changes. No cardiomegaly. NO evidence of acute disease/changes. NO evidence of acute disease/changes.” The report fails to detect a left pneumothorax (arrow) that was identified by the radiologists. 

hallucinations, suggesting room for improvement of the AI model. Overall, while the AI model demonstrated considerable potential, these findings emphasize the need for ongoing development, rigorous testing, integration of feedback from clinical practitioners, and continuous model training to enhance the accuracy and clinical reliability of model-generated reports, so that they meet the high standards required for clinical application. 

Our study had some limitations. First, the study’s retrospective design may limit generalizability. Second, clinical information, additional views, and previous images were not provided as input for the AI model, nor were they available to the radiologists who created reports for comparison. This is different from the clinical setting, in which such information would typically be available and could alter the quality of reports. Third, our research data were not disaggregated by sex or gender as these 

**9** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

**Figure 6:** Performance analysis of reports generated by the domain-specific artificial intelligence (AI) model. **(A)** Radiology report detection accuracy (RRDA) analysis: Radar charts illustrate the sensitivity (left) and specificity (right) of the AI model for detecting various abnormal findings on chest radiographs at different consensus levels of the reference standard established by three radiologists. **(B–E)** Radiology report quality evaluation (RRQE) analysis of model-generated, radiologist, and GPT-4Vision (GPT-4v) (OpenAI) reports. **(B)** Bar graph depicts the acceptance rates of four evaluating radiologists combined. Acceptability was defined as whether the radiologist would endorse the report as their own without changes. **(C, D)** Bar graphs show the **(C)** median agreement score and **(D)** median quality score of the four evaluating radiologists combined. Agreement scores were assigned using the American College of Radiology RADPEER scoring system, with scores ranging from 1 (clinically significant discrepancy) to 5 (complete agreement). Quality scores were assigned using a 5-point Likert scale, with scores ranging from 1 (very poor) to 5 (excellent). **(E)** Bar graph shows the distribution of subjective rankings of the overall impressions of reports by the four evaluating radiologists. Subcu. = subcutaneous. 

variables were not collected. The primary focus of our research was to evaluate the efficacy of the reports generated by the domain-specific AI model in aiding radiologic interpretations, and as such demographic details were not considered necessary for the core objectives of the study. Fourth, the performance of our domain-specific AI model was compared with that of a 

general-purpose AI model whose limited effectiveness in various medical applications has been consistently reported (34,35). Furthermore, there is a potential for bias introduced by comparing the model-generated reports to reports by generalist radiologists rather than thoracic imaging specialists, which may have favored the model’s performance. Finally, the consistently high 

**10** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

**Table 2: Radiology Report Quality Evaluation: Comparison of Reports Generated by a Domain-specific AI Model, Radiologists, and GPT-4Vision** 

|Outcome|Domain-specific AI Model*|Radiologist|GPT-4Vision<sup>†</sup>|_P_Value<sup>‡</sup>|
|---|---|---|---|---|
|Report acceptance rate<sup>§</sup>|||||
|All readers|70.5 (6047/8580)|73.3 (6288/8580)|29.6 (2536/8580)|<.001|
|Reader 1|76.8 (1648/2145)|72.3 (1551/2145)|33.3 (714/2145)|<.001|
|Reader 2|71.7 (1539/2145)|52.6 (1128/2145)|23.2 (497/2145)|.14|
|Reader 3|74.7 (1603/2145)|90.2 (1934/2145)|39.3 (844/2145)|<.001|
|Reader 4|58.6 (1257/2145)|78.1 (1675/2145)|22.4 (481/2145)|<.001|
|Report agreement score<sup>ǁ</sup>|||||
|All readers|4 (3–5)|3 (2–5)|1 (1–3)|<.001|
|Reader 1|4 (3–5)|3 (1–4)|1 (1–2)|<.001|
|Reader 2|4 (3–5)|4 (3–5)|3 (1–4)|<.001|
|Reader 3|5 (4–5)|4 (3–5)|2 (1–4)|<.001|
|Reader 4|4 (3–5)|3 (3–4)|1 (1–3)|<.001|
|Report quality score<sup>#</sup>|||||
|All readers|4 (3–5)|4 (2–5)|2 (1–3)|<.001|
|Reader 1|4 (3–4)|2 (2–3)|1 (1–2)|<.001|
|Reader 2|5 (4–5)|4 (3–5)|2 (1–4)|<.001|
|Reader 3|4 (3–4)|4 (3–5)|2 (1–4)|<.001|
|Reader 4|5(3–5)|4(2–5)|1(1–2)|<.001|

Note.—AI = artificial intelligence. 

* KARA-CXR, v1.0.0.1, developed by Kakao Brain (now called AIRead-CXR and made available by Sommbit.ai) (21). 

- GPT-4Vision (OpenAI), accessed via ChatGPT (28). 

> ‡ For each reader comparison, _P_ values multiplied by four are shown (Bonferroni correction). 

§ Acceptability was defined as whether the radiologist would endorse the report as their own without changes. Report acceptance rates are presented as percentages, with numbers of reports in parentheses. Report acceptance rate was calculated as the proportion of accepted reports out of the total number of reports and was compared across report types using the χ<sup>2</sup> test. 

ǁ Agreement scores were assigned using the American College of Radiology RADPEER scoring system, with scores ranging from 1 (clinically significant discrepancy) to 5 (complete agreement). Agreement scores are presented as medians, with IQRs in parentheses, and were compared across report types using the Kruskal-Wallis test. 

# Quality scores were assigned using a 5-point Likert scale, with scores ranging from 1 (very poor) to 5 (excellent). Quality scores are presented as medians, with IQRs in parentheses, and were compared across report types using the Kruskal-Wallis test. 

**Table 3: Detailed Analysis of Unaccepted Reports** 

|Outcome|Domain-specific AI Model*|Radiologist|GPT-4Vision<sup>†</sup>|
|---|---|---|---|
|Report considered unacceptable|29.5 (2533/8580)|26.7 (2292/8580)|70.4 (6044/8580)|
|Reason for unacceptability||||
|Incorrect indication of finding||||
|i<br>False positive|11.3 (971/8580)|9.7 (831/8580)|31.7 (2719/8580)|
|False negative|18.5 (1584/8580)|17.8 (1527/8580)|39.0 (3347/8580)|
|Clinically significant|56.5 (1444/2555)|65.8 (1552/2358)|73.3 (4446/6066)|
|i<br>Incorrect position of finding||||
|i<br>Location error|14.8 (1270/8580)|13.9 (1192/8580)|32.7 (2806/8580)|
|Number error|0.5 (43/8580)|0.2 (18/8580)|0.4 (32/8580)|
|Clinically significant|22.4 (294/1313)|15.8 (191/1210)|27.8 (788/2838)|
|i<br>Incorrect severity of finding|29.2 (2502/8580)|26.5 (2273/8580)|65.2 (5591/8580)|
|i<br>Clinically significant|38.0 (952/2502)|30.8 (701/2273)|28.6 (1599/5591)|
|i<br>Hallucination|19.9(1707/8580)|NA|42.9(3684/8580)|

Note.—Data are percentages, with numbers of reports in parentheses. AI = artificial intelligence, NA = not applicable. 

* KARA-CXR, v1.0.0.1, developed by Kakao Brain (now called AIRead-CXR and made available by Sommbit.ai) (21). 

† GPT-4Vision (OpenAI), accessed via ChatGPT (28). 

sensitivity of the model-generated reports may partially reflect the performance of the AI labeler, which was fine-tuned for this specific AI model. 

In conclusion, our study indicates that a domain-specific multimodal generative artificial intelligence (AI) model appears to have the potential to produce preliminary reports for chest radiographs 

**11** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

**Table 4: Comparative Ranking Analysis of Reports Generated by a Domain-specific AI Model, Radiologists, and GPT-4Vision** 

|Domain-specific|
|---|
|Ranking<br>i<br>AI Model*<br>Radiologist<br>GPT-4Vision<sup>†</sup>|
|First<br>60.0 (5146/8580) 31.7 (2720/8580)<br>8.3 (714/8580)|
|Second<br>27.2 (2331/8580) 54.7 (4695/8580)<br>18.1 (1554/8580)<br>h|
|Third<br>12.9(1103/8580) 13.6(1165/8580)<br>73.6(6312/8580)|
|Note.—Data are percentages, with numbers of reports in<br>parentheses. There was a statistically significant difference in the<br>distribution of rankings among the three types of reports (χ<sup>2</sup>test,_P_<<br>.001). AI = artificial intelligence.|
|* KARA-CXR, v1.0.0.1, developed by Kakao Brain (now called<br>AIRead-CXR and made available by Sommbit.ai) (21).|
|†GPT-4Vision (OpenAI), accessed via ChatGPT (28).|

with high diagnostic accuracy and clinical value. This could positively influence the efficiency of the radiologic interpretation workflow. Future studies should aim to incorporate prospective study designs, a broader range of case complexities, and a focus on the interpretability and usability of different model-generated reports in diverse real clinical settings, to provide a more clinically relevant evaluation. Additionally, using a larger pool of radiologists with diverse training experience in evaluating the model-generated reports would help assess the AI model’s generalizability across different expertise levels and subspecialty training. 

**Deputy Editor:** Mizuki Nishino **Scientific Editor:** Sarah Atzen 

#### **Author affiliations:** 

- 1 Department of Radiology, Brigham & Women’s Hospital, 75 Francis St, Boston, MA 02215 

- 2 Kakao, Seoul, South Korea 

- 3 Soombit.ai, Seoul, South Korea 

- 4 Inha University, Incheon, South Korea 

- 5 Asan Medical Center, Seoul, South Korea 

- 6 College of Medicine, Soonchunhyang University, Cheonan, South Korea 

- 7 College of Medicine, Chungnam National University, Daejun, South Korea 8 College of Medicine, Chungbuk National University, Cheongju, South Korea 9 School of Medicine, Keimyung University, Daegu, South Korea 10 College of Medicine, Ewha Womans University, Seoul, South Korea 11 College of Medicine, Dongguk University, Goyang, South Korea 12 School of Medicine, Ajou University, Suwon, South Korea Received May 23, 2024; revision requested July 15; final revision received December 23; accepted January 15, 2025. 

**Address correspondence to:** E.K.H. (email: amyh0803@gmail.com). 

**Funding:** Authors declared no funding for this work. 

**Author contributions:** Guarantors of integrity of entire study, **E.K.H., B.R., B.P., S.K., J.E., B.B., R.W.L., S.J.C., J.S.P.** ; study concepts/study design or data acquisition or data analysis/interpretation, all authors; manuscript drafting or manuscript revision for important intellectual content, all authors; approval of final version of submitted manuscript, all authors; agrees to ensure any questions related to the work are appropriately resolved, all authors; literature research, **E.K.H., J.H., B.R., J.G., S.K., J.E., S.J.C., J.S.P., T.H.K.** ; clinical studies, **E.K.H., J.E., W.B., R.W.L., C.H.S., S.J.C., J.S.P., J.H.P., H.J.J., J.H.H., D.C., H.S.C., T.H.K.** ; experimental studies, **E.K.H., J.H., J.G., B.P., S.K., K.Y., J.E., B.B., J.B.J., O.K.S., W.B., C.H.P., S.J.C., H.J.J.** ; statistical analysis, **E.K.H., J.G., B.P., J.E., B.B., S.J.C.** ; and manuscript editing, **E.K.H., J.E., W.B., C.H.S., S.J.C., J.S.P., H.J.J.** 

**Disclosures of conflicts of interest: E.K.H.** Former employee of Kakao Brain. **J.H.** Former employee of Kakao Brain. **B.R.** Former employee of Kakao Brain. **J.G.** Former employee of Kakao Brain. **B.P.** Former employee of Kakao Brain. **S.K.** Former employee of Kakao Brain. **K.Y.** Former employee of Kakao Brain. **J.E.** Former employee of Kakao Brain. **B.B.** Former employee of Kakao Brain. **J.B.J.** Former employee of Kakao Brain. **O.K.S.** Former advisor of Kakao Brain. **W.B.** Former employee of Kakao Brain. **R.W.L.** No relevant relationships. **C.H.S.** No relevant relationships. **C.HP.** No relevant relationships. **S.J.C.** No relevant relationships. **J.S.P.** No relevant relationships. **J.H.P.** No relevant relationships. **H.J.J.** No relevant relationships. **J.H.H.** No relevant relationships. **D.C.** No relevant relationships. **H.S.C.** No relevant relationships. **T.H.K.** No relevant relationships. 

### References 

1. Tu T, Azizi S, Driess D, et al. Towards generalist biomedical AI. NEJM AI 2024;1(3):AIoa2300138. 

2. Shokrollahi Y, Yarmohammadtoosky S, Nikahd MM, Dong P, Li X, Gu L. A comprehensive review of generative AI in healthcare. arXiv 2310.00795 [preprint] https://arxiv.org/abs/2310.00795. Posted October 1, 2023. Accessed December 1, 2023. 

3. Wang Z, Liu L, Wang L, Zhou L. R2gengpt: radiology report generation with frozen LLMs. Meta-Radiology 2023;1(3):100033. 

4. Reale-Nosei G, Amador-Domínguez E, Serrano E. From vision to text: a comprehensive review of natural image captioning in medical diagnosis and radiology report generation. Med Image Anal 2024;97:103264. 

5. Li C, Wong C, Zhang S, et al. Llava-med: training a large language-andvision assistant for biomedicine in one day. arXiv 2306.00890 [preprint] https://arxiv.org/abs/2306.00890. Posted June 1, 2023. Accessed December 1, 2023. 

6. Classen DC, Longhurst C, Thomas EJ. Bending the patient safety curve: how much can AI help? NPJ Digit Med 2023;6(1):2. 

7. Brady A, Brink J, Slavotinek J. Radiology and value-based health care. JAMA 2020;324(13):1286–1287. 

8. White CS, Flukinger T, Jeudy J, Chen JJ. Use of a computer-aided detection system to detect missed lung cancer at chest radiography. Radiology 2009;252(1):273–281. 

9. Rajpurkar P, Chen E, Banerjee O, Topol EJ. AI in health and medicine. Nat Med 2022;28(1):31–38. 

10. Hosny A, Parmar C, Quackenbush J, Schwartz LH, Aerts HJWL. Artificial intelligence in radiology. Nat Rev Cancer 2018;18(8):500–510. 

11. Çallı E, Sogancioglu E, van Ginneken B, van Leeuwen KG, Murphy K. Deep learning for chest X-ray analysis: a survey. Med Image Anal 2021;72:102125. 

12. Cao Y, Li S, Liu Y, et al. A comprehensive survey of AI-generated content (AIGC): a history of generative AI from GAN to ChatGPT. arXiv 2303.04226 [preprint] https://arxiv.org/abs/2303.04226. Posted March 7, 2023. Accessed December 1, 2023. 

13. Pang T, Li P, Zhao L. A survey on automatic generation of medical imaging reports based on deep learning. Biomed Eng Online 2023;22(1):48. 

14. Mettler FA Jr, Mahesh M, Bhargavan-Chatfield M, et al. Patient exposure from radiologic and nuclear medicine procedures in the United States: procedure volume and effective dose for the period 2006–2016. Radiology 2020;295(2):418–427. 

15. Bustos A, Pertusa A, Salinas JM, de la Iglesia-Vayá M. PadChest: a large chest x-ray image dataset with multi-label annotated reports. Med Image Anal 2020;66:101797. 

16. Demner-Fushman D, Kohli MD, Rosenman MB, et al. Preparing a collection of radiology examinations for distribution and retrieval. J Am Med Inform Assoc 2016;23(2):304–310. 

17. Nguyen HQ, Lam K, Le LT, et al. VinDr-CXR: an open dataset of chest X- rays with radiologist’s annotations. Sci Data 2022;9(1):429. 

18. Johnson AE, Pollard TJ, Greenbaum NR, et al. MIMIC-CXR-JPG, a large publicly available database of labeled chest radiographs. arXiv 1901.07042 [preprint] https://arxiv.org/abs/1901.07042. Posted January 21, 2019. Updated November 14, 2019. Accessed December 1, 2023. 

19. Vaswani A, Shazeer N, Parmar N, et al. Attention is all you need. arXiv 1706.03762 [preprint] https://arxiv.org/abs/1706.03762. Posted June 12, 2017. Updated August 2, 2023. Accessed December 1, 2023. 

20. Kobayashi T. Two-way multi-label loss. Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition. Computer Vision Foundation, 2023; 7476-7485. https://openaccess.thecvf.com/content/ CVPR2023/papers/Kobayashi_Two-Way_Multi-Label_Loss_CVPR_2023_ paper.pdf. 

21. AIRead-CXR. Soombit.ai. https://airead.soombit.ai/. Published 2023. Accessed September 1, 2023. 

22. Towards physician-level radiologic report generation: comprehensive exploration of the clinical significance of a novel multimodal generative artificialintelligence model. Anonymous GitHub. https://anonymous.4open.science/r/ NM-2BB5/. Updated January 8, 2024. Accessed December 1, 2023. 

**12** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_ 

<u>Multimodal Generative AI Model for Chest Radiograph Report Generation</u> 

<u>Hong and Ham et al</u> 

23. Hansell DM, Bankier AA, MacMahon H, McLoud TC, Müller NL, Remy J. Fleischner Society: glossary of terms for thoracic imaging. Radiology 2008;246(3):697–722. 

24. Annarumma M, Withey SJ, Bakewell RJ, Pesce E, Goh V, Montana G. Automated triaging of adult chest radiographs with deep artificial neural networks. Radiology 2019;291(1):272. 

25. Smit A, Jain S, Rajpurkar P, Pareek A, Ng AY, Lungren MP. CheXbert: combining automatic labelers and expert annotations for accurate radiology report labeling using BERT. arXiv 2004.09167 [preprint] https://arxiv.org/ abs/2004.09167. Posted April 20, 2020. Updated October 18, 2020. Accessed December 1, 2023. 

26. Achiam J, Adler S, Agarwal S, et al; OpenAI. GPT-4 technical report. arXiv 2303.08774 [preprint] https://arxiv.org/abs/2303.08774. Posted March 15, 2023. Updated March 4, 2024. Accessed December 1, 2023. 

27. Gu J, Cho HC, Kim J, You K, Hong EK, Roh B. CheX-GPT: harnessing large language models for enhanced chest X-ray report labeling. arXiv 2401.11505 [preprint] https://arxiv.org/abs/2401.11505. Posted January 21, 2024. Updated November 6, 2024. Accessed December 1, 2023. 

28. ChatGPT. OpenAI. https://openai.com/. Accessed September 1–December 31, 2023. 

   30. Goldberg-Stein S, Frigini LA, Long S, et al. ACR RADPEER Committee white paper with 2016 updates: revised scoring system, new classifications, self-review, and subspecialized reports. J Am Coll Radiol 2017;14(8):1080–1086. 

   31. Zhou Y, Ong H, Kennedy P, et al. Evaluating GPT-4V (GPT-4 with Vision) on detection of radiologic findings on chest radiographs. Radiology 2024;311(2):e233270. 

   32. Plesner LL, Müller FC, Nybing JD, et al. Autonomous chest radiograph reporting using AI: estimation of clinical impact. Radiology 2023;307(3):e222268. 

   33. Yu F, Endo M, Krishnan R, et al. Evaluating progress in automatic chest X- ray radiology report generation. Patterns 2023;4(9):100802. 

   34. Wu C, Lei J, Zheng Q, et al. Can GPT-4V(ision) serve medical applications? Case studies on GPT-4V for multimodal medical diagnosis. arXiv 231009909 [preprint] https://arxiv.org/abs/2310.09909. Posted October 15, 2023. Updated December 4, 2023. Accessed December 1, 2023. 

   35. Yan Z, Zhang K, Zhou R, He L, Li X, Sun L. Multimodal ChatGPT for medical applications: an experimental study of GPT-4V. arXiv 231019061 https://arxiv.org/abs/2310.19061. Posted October 29, 2023. Accessed December 1, 2023. 

29. Varghese J, Chapiro J. ChatGPT: the transformative influence of generative AI on science and healthcare. J Hepatol 2024;80(6):977–980. 

**13** 

_Radiology:_ Volume 314: Number 3—March 2025<sup>■</sup> _radiology.rsna.org_