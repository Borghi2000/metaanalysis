---
title: "Ciflik 2026 (2026) — Pneumothorax (real-world)"
authors: "Ciflik 2026"
year: 2026
journal: "BMC Pulm Med"
doi: "10.1186/s12890-026-04151-z"
pmid: "41645118"
pool: "main"
architecture: "VLM"
model_evaluated: "GPT-5.1 (ChatGPT)"
clinical_scenario: "Pneumothorax (real-world)"
reference_standard: "2 thoracic surgeons"
n_total: 240
tp: 30
fp: 18
fn: 0
tn: 192
sensibilidade: 1.0
especificidade: 0.9143
acuracia: 0.925
quadas_overall: "Unclear"
quadas_selecao: "Low"
quadas_indice: "Unclear"
quadas_referencia: "Low"
quadas_fluxo: "Low"
tags:
  - artigo
  - pool/main
  - ano/2026
  - condicao/pneumotorax
  - modelo/chatgpt
---

# Ciflik 2026 (2026)

> [!abstract] Ficha de Auditoria e Metadados Clínicos
> - **Título / Identificador:** `ciflik2026` | **Estudo:** [[ciflik2026]]
> - **Cenário Clínico:** Pneumothorax (real-world)
> - **Modelo Avaliado:** **GPT-5.1 (ChatGPT)** (VLM)
> - **Padrão de Referência:** 2 thoracic surgeons
> - **Amostra Total:** 240 exames
> - **DOI:** [10.1186/s12890-026-04151-z](https://doi.org/10.1186/s12890-026-04151-z) | **PMID:** 41645118
> - **Índice Geral:** [[_Indice_Artigos]] | **Base Master:** `data/master_audit.csv`

> [!info] Desempenho Diagnóstico & Matriz 2×2 (Pool Principal)
> - **Sensibilidade:** 100.0% | **Especificidade:** 91.4% | **Acurácia Bruta:** 92.5%
> - **Razão de Verossimilhança:** RV+ = 11.67 | RV- = 0 | DOR = NA
> 
> | Matriz 2×2 | Condição Presente (+) | Condição Ausente (-) | Total |
> | :--- | :---: | :---: | :---: |
> | **Teste Positivo (IA+)** | **VP:** 30 | **FP:** 18 | 48 |
> | **Teste Negativo (IA-)** | **FN:** 0 | **VN:** 192 | 192 |
> | **Total Real** | 30 | 210 | **N:** 240 |

> [!warning] Avaliação Metodológica QUADAS-2
> - **Risco de Viés Global:** **Unclear**
> - **Domínios de Viés:** Seleção: `Low` | Teste Índice: `Unclear` | Padrão Ref.: `Low` | Fluxo/Tempo: `Low`
> - **Nota de Auditoria:** *2x2 confirmado no texto completo (PMID 41645118): PTX 30/240 (12,5%); ChatGPT sens 100%, spec 91,4%; PPV 62,5%=30/48. FN=0 => correção de continuidade.*

---

## Conteúdo do Artigo Original

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 https://doi.org/10.1186/s12890-026-04151-z 

BMC Pulmonary Medicine 

## **Open Access** 

## **RESEARCH** 

# Evaluation of multimodal large language models for pneumothorax assessment in realworld clinical scenarios 

Kadir Baturhan Ciflik<sup>1</sup> and Busra Ozdemir Ciflik<sup>2*</sup> 

### **Abstract** 

**Introduction** Pneumothorax is a potentially life-threatening clinical condition requiring rapid diagnosis and intervention. It may present with symptoms such as dyspnoea, cough, chest pain, tachycardia, and tachypnoea. Heavy workload and technical limitations of chest radiographs may necessitate support for clinicians during the evaluation process. Recently, large language models (LLMs) have increased interest in using their ability to process both text and medical images as supportive tools in diagnostic processes. This study analyzed the performance of two widely used multimodal LLMs in diagnosing pneumothorax in a real clinical setting. 

**Materials and methods** Clinical information and anonymized chest X-rays were presented to both models using an eight-question evaluation file. The responses obtained were compared with the consensus assessment of two thoracic surgeons, considered the gold standard. 

**Results** Pneumothorax was detected in 30 of the total 240 patients (12.5%). ChatGPT demonstrated 100% sensitivity, 91.4% specificity, 62.5% positive predictive value (PPV), and 100% negative predictive value (NPV) in detecting pneumothorax. Gemini had a sensitivity of 70.0%, specificity of 92.9%, PPV of 58.3%, and NPV of 95.6%. The performance of both models in determining the side of pneumothorax was markedly low: ChatGPT had a sensitivity of 14.3%, and Gemini had a sensitivity of 10.0%. When it involved determining the type of pneumothorax, ChatGPT demonstrated a sensitivity of 36.7% (95% CI: 21.9–54.5), while Gemini showed a sensitivity of 60.0% (95% CI: 42.3–75.4). Both models exhibited high specificity (> 91%). When assessing the need for tube thoracostomy, ChatGPT showed 57.7% sensitivity and 94.4% specificity, whereas Gemini showed 46.2% sensitivity and 95.8% specificity. NPV was high and PPV was low in both models. 

**Conclusion** Multimodal LLMs demonstrated high sensitivity in ruling out pneumothorax; however, limitations in agreement, localisation, and management decisions restrict their role to cautious, supportive use under specialist supervision. 

**Keywords** ChatGPT, Gemini, Pneumothorax, Artificial intelligence 

> *Correspondence: Busra Ozdemir Ciflik ozdemirbusra89@gmail.com 1Department of Thoracic Surgery, Kırıkkale Yüksek İhtisas Hospital, Kırıkkale, Türkiye 2Department of Thoracic Surgery, Faculty of Medicine, Kırıkkale University, Kırıkkale, Türkiye 

> © The Author(s) 2026. **Open Access** This article is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License, which permits any non-commercial use, sharing, distribution and reproduction in any medium or format, as long as you give appropriate credit to the original author(s) and the source, provide a link to the Creative Commons licence, and indicate if you modified the licensed material. You do not have permission under this licence to share adapted material derived from this article or parts of it. The images or other third party material in this article are included in the article’s Creative Commons licence, unless indicated otherwise in a credit line to the material. If material is not included in the article’s Creative Commons licence and your intended use is not permitted by statutory regulation or exceeds the permitted use, you will need to obtain permission directly from the copyright holder. To view a copy of this licence, visit  h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y - n c - n d / 4 . 0 /. 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 2 of 13 

### **Introduction** 

Pneumothorax is defined as the presence of air in the pleural space, typically presenting with sudden chest pain and shortness of breath. Additional symptoms, such as cough, tachypnoea, and tachycardia, may also be present [1, 2]. The initial imaging method used for diagnosis is a chest X-ray; however, computed tomography (CT) may be required in more complex or suspicious cases [1, 2]. The management of pneumothorax can be complex depending on various clinical and technical factors. Furthermore, when technical limitations exist in radiological evaluation and there is a shortage of experienced radiologists, clinicians may use additional support methods for diagnosis and treatment [2–4]. 

Recently, artificial intelligence (AI) applications have attracted a great deal of attention as a support method. However, the vast majority of existing AI models have been trained using open-source image datasets that do not accurately reflect real clinical settings [2–4]. While these models can reduce radiologists’ workload, their ability to make accurate diagnoses in real-life conditions may be limited because they do not take into account clinical variables and patient-specific differences sufficiently [5]. Conversely, large language models (LLMs) are becoming increasingly popular among clinicians due to their accessibility and ease of use [1, 2]. Unlike traditional LLMs, which are designed solely for text generation, multimodal models such as ChatGPT and Gemini can analyze medical images directly, thereby contributing to the diagnostic reasoning process [6–8]. 

In this study, we shared the medical histories, physical examination findings, and chest X-rays of patients presenting with the most common symptoms of pneumothorax with two widely used multimodal LLMs. The aim was to evaluate the effectiveness of these models in diagnosing pneumothorax in a real clinical setting, as well as their potential contribution to the clinical process. 

### **Materials and methods** 

Our study included patients aged 18 years and over who presented to a thoracic surgeon at two hospitals between 2023 and 2024 with symptoms including chest pain, shortness of breath, cough, tachypnea, and tachycardia, and for whom complete data was available. Patients under the age of 18, those with incomplete data,, and those without a chest X-ray at the initial evaluation were excluded from the study. The study was designed retrospectively. 

Demographic data, comorbidities, smoking status, reason for referral to the thoracic surgeon, history of trauma, examination findings, diagnoses, surgical status, length of hospital stay, and chest X-rays (images downloaded from the hospital information system in JPG format with a resolution of 2048 × 2048 pixels) were anonymized and 

re-evaluated by two thoracic surgeons during a ‘consensus meeting’ using the same monitor. The answers were recorded. These results were considered an expert consensus reference standard rather than an absolute diagnostic gold standard. The thoracic surgeons performing the consensus assessment were blinded to the LLMgenerated responses but not to the clinical information available at the time of evaluation. Ethical committee approval was obtained for the study protocol under number 2024/6 − 3. Due to the retrospective nature of the study, written consent was not obtained from patients. The study was conducted in accordance with the World Medical Association’s Declaration of Helsinki. 

A data file was prepared for each patient, which was then used to query ChatGPT (GPT-5.1, OpenAI; accessed November 2025) and Gemini (Gemini 2.0 Advanced, Google DeepMind; accessed November 2025). All LLM queries were conducted in stateless sessions with no conversational memory carried over between questions. All available data was shared. This text contained eight questions. These questions defined the steps in the patient’s evaluation process, from diagnosis to treatment. The questions focused specifically on the differential diagnosis and treatment of pneumothorax (Fig. 1). Alongside this data file, lung X-rays with obscured patient information were also provided to the large language models (JPEG format with a resolution of 1024 × 1024 pixels) (Fig. 2). 

#### **Statistical analysis** 

The data were analyzed using the IBM SPSS Statistics Standard Concurrent User V. 26 statistical package (IBM Corp., Armonk, New York, USA). As the descriptive statistics indicated that the data were not normally distributed, they were presented as median (M), interquartile range (IQR), minimum (min), and maximum (max) values. The normality of the numerical variable distribution was assessed using the Shapiro–Wilk normality test. The homogeneity of variances was assessed using the Levene test. For comparisons involving three or more dependent groups, Cochran’s Q test was used for categorical data with two variables. If the results were significant, the groups were compared in pairs using the appropriate test. The McNemar test was used for this purpose. When the categorical data consisted of three or more variables, the dependent groups were compared in pairs using the marginal homogeneity test. For this purpose, the marginal homogeneity test was used. Cohen’s Q test was used to determine and rate the consistency of all categorical data belonging to dependent groups. Agreement between answers was defined according to the following κ values: weak (< 0); mild (0–0.20); moderate (0.21–0.40); substantial (0.41–0.60); and nearly perfect (0.61–1.00) [9]. 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 3 of 13 

**Fig. 1** Example of a patient data file presented to LLMs 

In all comparisons, _p_ < 0.05 was considered statistically significant. 

### **Results** 

#### **General information about the patients** 

Our study included a total of 240 (100%) patients, 91 (37.9%) of whom were female and 149 (62.1%) were male. The median age of the patients was 36.5 years (IQR: 27, min: 16- max: 90). General information about the patients is presented in Table 1. Thirty patients (12.5%) had pneumothorax. Pneumothorax was most frequently observed in the right lung ( _n_ = 19; 63.3%). Of these 

patients, 17 (56.7%) had primary spontaneous pneumothorax, eight (26.7%) had traumatic pneumothorax, four (13.3%) had secondary spontaneous pneumothorax, and one (3.3%) had iatrogenic pneumothorax. Twenty-six patients (10.8%) underwent tube thoracostomy. All of these patients were diagnosed with pneumothorax. Eight patients (3.3%) underwent surgery. The median length of hospital stay was zero (IQR: 0, min: 0-max: 21) days (Table 2). 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 4 of 13 

**Fig. 2 A** A patient with a history of trauma. The thoracic surgeon classified the chest radiograph as suboptimal, whereas both LLMs considered it optimal ( **B** ) A chest radiograph that was accepted as optimal by both the thoracic surgeon and the two LLMs ( **C** ) A chest radiograph in which the thoracic surgeon reported no pneumothorax, while both LLMs indicated the presence of pneumothorax ( **D** ) A chest radiograph in which the thoracic surgeon identified pneumothorax, but both LLMs reported no pneumothorax ( **E** ) A case of left primary spontaneous pneumothorax in which both the thoracic surgeon and the two LLMs confirmed the presence of pneumothorax ( **F** ) A case of right secondary spontaneous pneumothorax in which the thoracic surgeon reported pneumothorax, while both LLMs reported no pneumothorax 

#### **Is the chest X-ray suitable for evaluation?** 

There was a significant difference between the answers provided by the thoracic surgeon and ChatGPT and Gemini (Q (2) = 7.300, _p_ = 0.026). However, despite the absence of a statistically significant difference in pairwise comparisons, agreement between the thoracic surgeon and Gemini was negligible, indicating limited clinical concordance ( _p_ > 0.05) (Table 3). There was no agreement between the thoracic surgeon’s responses and those provided by ChatGPT and Gemini (к = -0.008, _p_ = 0.834) (к = -0.041, _p_ = 0.524). ChatGPT’s sensitivity was 95.8% (CI: 93.0–98.0%), specificity was 0% (CI: 0–79.0%), positive predictive value (PPV) was 99.6% (CI: 98.0–100%), and negative predictive value (NPV) was 0% (CI: 0–27%). Gemini’s sensitivity was calculated as 96.1% (CI: 93.0– 98.0%), specificity as 0% (CI: 0–31%), positive predictive value (PPV) as 95.7% (CI: 92.0–98.0%), and negative predictive value (NPV) as 0% (CI: 0–29%) (Table 4). 

#### **Is it necessary to request additional radiological examinations to evaluate the patient?** 

While a statistically significant difference in outcomes was observed between the thoracic surgeon and both ChatGPT and Gemini ( _p_ < 0.001), Table 3 demonstrates that the agreement and performance between ChatGPT and Gemini were limited, despite the absence of statistical significance ( _p_ = 0.201). The responses provided by the thoracic surgeon and ChatGPT showed moderate agreement (к =0.049, _p_ = 0.037). ChatGPT’s sensitivity was 80.0% (CI: 37.6%–96.4%), specificity was 65.5% (CI: 59.1%–71.4%), PPV was 4.7% (CI: 1.8%–11.4%), and NPV was 99.4% (CI: 97.0%–99.9%). Gemini’s sensitivity was 37.5% (CI: 13.7%–69.4%), specificity was 64.5% (CI: 58.1%–70.4%), PPV was 3.5% (CI: 1.2%–9.8%), and NPV was 96.8% (CI: 93.2%–98.5%) (Table 4). 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 5 of 13 

**Table 1** General information about patients 

|Gender|**_n_(%)**|
|---|---|
|Female|91(37.9)|
|Male|149(62.1)|
|Age, (year)<br>||
|M (IQR, min-max)<br>|36.5(27, 16–90)|
|Symptoms<br>||
|Chest pain<br>|159(66.3)<br>|
|Cough<br>|32(13.3)<br>|
|Dyspnea<br>|30(12.5)<br>|
|Tachypnea and/or tachycardia|19(7.9)|
|Comorbidities||
|None|185(77.1)|
|Previous pneumothorax<br>|15(6.3)<br>|
|Hypertension|10(4.2)|
|<br>Asthma|10(4.2)|
|COPD|9(3.8)|
|Heart failure|4(1.7)|
|Diabetes mellitus|3(1.3)|
|History of CABG|2(0.8)|
|Hypoxic encephalopathy|1(0.4)|
|Thyroidectomy|1(0.4)|
|Trauma status||
|Yes|80(33.3)|
|No|160(66.7)|
|Imaging study||
|Chest x-ray|152(63.3)|
|Chest x-ray + CT|85(35.4)|
|Chest x-ray + CT + MR|3(1.3)|
|Tobacco use||
|Yes|176(73.3)|
|No|64(26.7)|
|Heart rate, (beats per minute)||
|M (IQR, min-max)|91(19, 73–135)|
|Systolic blood pressure, (mmHg)||
|M (IQR, min-max)|140(10, 120–153)|
|Diastolic blood pressure, (mmHg)||
|M (IQR, min-max)|75(10, 70–95)|
|Body temperature, (mmHg)||
|M (IQR, min-max)|36.6(0.40, 36–38)|
|Respiratory rate, (breaths per minute)||
|M (IQR, min-max)|20(3, 16–28)|
|Oxygen saturation, (%)||
|M (IQR, min-max)|94(2, 65–97)|
|Breath sounds||
|Normal|204(85)|
|Decreased<br>|18(7.5)<br>|
|Absent<br>Crackles|10(4.2)<br>6(2.5)|
|Rhonchi|2(0.8)|
|Chest X-ray||
|Optimal|230(95.8)|
|Suboptimal|10(4.2)|
|Diagnosis||

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 6 of 13 

**Table 1** (continued) 

||**_n_(%)**|
|---|---|
|Musculoskeletal pain|155(63.2)|
|Rib fracture|27(11.1)|
|Pneumothorax|29(11.8)|
|Asthma attack|8(3.3)|
|Myocardial infarction|6(2.5)|
|COPD|5(2.1)|
|Pneumonia|5(2.1)|
|Pleural effusion|4(1.7)|
|f<br>Sternal fracture|2(0.8)|
|Lung contusion|1(0.4)|
|Hemopneumothorax|1(0.4)|
|Vertebral fracture|1(0.4)|
|Tuberculosis|1(0.4)|
|Surgery||
|Yes|8(3.3)|
|No|232(96.7)|
|Length of hospital stay, (days)||
|M (IQR, min-max)|0 (0, 0–21)|
|Pneumothorax||
|Yes|30(12.5)|
|No|210(87.5)|
|Laterality of pneumothorax||
|Right|19(63.3)|
|Left|10(33.3)|
|Bilateral|1(3.4)|
|Type of pneumothorax||
|Primary spontaneous pneumothorax|17(56.7)|
|Secondary spontaneous pneumothorax|4(13.3)|
|<br>Traumatic pneumothorax|8(26.7)|
|Iatrogenic pneumothorax|1(3.3)|
|Tube thoracostomy||
|Performed|26(86.7)|
|Notperformed|4(13.3)|

_n_ number of patients, _%_ Percent, _M_ Mean, _IQR_ Interquartile range, _min_ minimum, _max_ maximum, _COPD_ Chronic obstructive pulmonary disease, _CABG_ Coronary Artery Bypass Grafting, _CT_ Computed Tomography, _MR_ Magnetic Resonance Imaging, _mmHg_ Millimeters of Mercury 

#### **What do you think the diagnosis is based on the results of the entire evaluation?** 

There was a significant difference between the thoracic surgeon’s diagnosis and those of ChatGPT and Gemini ( _p_ < 0.001). Nevertheless, although no statistically significant difference was identified, the agreement and performance between ChatGPT and Gemini were observed to be limited ( _p_ = 0.121) (see Table 3). When assessing the consistency of responses, there was negligible agreement between the groups (κ = 0.106, _p_ < 0.001). (к = 0.074, _p_ < 0.001) and (к = 0.099, _p_ < 0.001). ChatGPT’s sensitivity was 62.5% (95% CI: 42.7–78.8), its specificity 79.2% (95% CI: 73.3–84.0), its PPV 25.0% (95% CI: 15.8–37.2), and its NPV 95.0% (95% CI: 90.8–97.3). Gemini’s respective figures were 70.8% (CI: 50.8–85.1%), 64.8% (CI: 58.2–70.9%), 18.3% (CI: 11.7–27.3%), and 95.2% (CI: 90.5–97.7%) (Table 4). 

#### **Do you think you assessed the patient correctly?** 

Although no statistically significant difference was observed, agreement analyses demonstrated negligible concordance, suggesting that similar answers did not reflect shared clinical reasoning (Q (2) = 5.200, _p_ = 0.074). When pairwise comparisons of the answers were performed, the agreement and performance between the groups were found to be limited, despite the absence of statistical significance ( _p_ > 0.05) ( _p_ = 0.125) ( _p_ = 0.375) (Table 23). All answers given by the thoracic surgeon were correct. When assessing the consistency of the answers, there was no consistency between the answers of the thoracic surgeon and ChatGPT or between ChatGPT and Gemini (к=0.000, _p_ > 0.05) (к=-0.007, _p_ = 0.896). There was a weak level of consistency between the thoracic surgeon and Gemini (k = 0.000, _p_ < 0.001). ChatGPT’s sensitivity was calculated as 99.6% (CI: 97.7%– 100%) and PPV as 100% (CI: 98.4%–100%). Since there were no cases with misdiagnosis in the dataset, specificity and NPV could not be calculated. Gemini’s sensitivity 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ 

Page 7 of 13 

(2026) 26:105 

**Table 2** Baseline demographic and clinical characteristics according to pneumothorax status 

||**Pneumothorax(+)**<br>**_n_(%)**|**Pneumothorax(-)**<br>**_n_(%)**|
|---|---|---|
|Gender|||
|Female<br>|2(6.7)<br>|89(42.4)<br>|
|Male|28(93.3)|121(57.6)|
|Age, (year)|||
|M (IQR, min-max)|24(24.7, 17–71)|38(26.2, 16–90)|
|Symptoms|||
|Chest pain|19(63.3)|140(66.7)|
|Cough<br>|3(10)<br>|29(13.8)<br>|
|Dyspnea<br>Tachypnea and/or tachycardia|3(10)<br>5(16.7)|27(12.9)<br>14(6.7)|
|Comorbidities|||
|None|19(63.3)|166(79)|
|Previous pneumothorax|8(26.7)|7(3.3)|
|Hypertension|0(0)|10(4.8)|
|<br>Asthma|0(0)|10(4.8)|
|COPD<br>|2(6.7)|7(3.3)|
|Heart failure|0(0)|4(1.9)|
|Diabetes mellitus|0(0)|3(1.4)|
|History of CABG|0(0)|2(1)|
|Hypoxic encephalopathy|1(3.3)|0(0)|
|Thyroidectomy|0(0)|1(0.5)|
|Trauma status|||
|Yes|7(23.3)|73(34.8)|
|No|23(76.7)|137(65.2)|
|Imaging study|||
|Chest x-ray|21(70)|131(62.4)|
|Chest x-ray + CT|9(30)|76(36.2)|
|Chest x-ray + CT + MR|0(0)|3(1.4)|
|Tobacco use|||
|Yes|22(73.3)|154(73.3)|
|No|8(26.7)|56(26.7)|
|Heart rate, (beats per minute)|||
|M (IQR, min-max)|95.5(14.5, 75–135)|91(15, 73–120)|
|Systolic blood pressure, (mmHg)|||
|M (IQR, min-max)|140(15, 120–153)|140(10, 120–150)|
|Diastolic blood pressure, (mmHg)|||
|M (IQR, min-max)|78.5(10.2, 71–96)|71(10, 70–91)|
|Body temperature, (mmHg)|||
|M (IQR, min-max)|36.3(4.5, 36-37.2)|36.4(3, 36-38.1)|
|Respiratory rate, (breaths per minute)|||
|M (IQR, min-max)|22(5.2, 17–28)|20(3, 16–26)|
|Oxygen saturation, (%)|||
|M (IQR, min-max)|91(3, 65–95)|94(2, 83–97)|
|Breath sounds|||
|Normal|5(16.7)|199(94.8)|
|Decreased<br>|17(56.7)<br>|1(0.5)<br>|
|Absent<br>Crackles|8(26.7)<br>0(0)|2(1)<br>6(2.9)|
|Rhonchi|0(0)|2(1)|
|Chest X-ray|||
|Optimal|26(86.7)|204(97.1)|
|Suboptimal|4(13.3)|6(2.9)|
|Diagnosis|||

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 8 of 13 

**Table 2** (continued) 

||**Pneumothorax(+)**<br>**_n_(%)**|**Pneumothorax(-)**<br>**_n_(%)**|
|---|---|---|
|Musculoskeletal pain|0(0)|155(73.8)|
|Rib fracture|5(13.9)|22(10.5)|
|Pneumothorax|29(80.5)|0(0)|
|Asthma attack|0(0)|8(3.8)|
|Myocardial infarction|0(0)|6(2.9)|
|COPD|0(0)|5(2.4)|
|Pneumonia|0(0)|5(2.4)|
|Pleural effusion|0(0)|4(1.9)|
|Sternal fracture|0(0)|2(1)|
|Lung contusion|0(0)|1(0.5)|
|Hemopneumothorax|1(2.8)|0(0)|
|Vertebral fracture|1(2.8)|0(0)|
|Tuberculosis|0(0)|1(0.5)|
|Surgery|||
|Yes|22(73.3)|210(100)|
|No|8(26.7)|0(0)|
|Length of hospital stay, (days)|||
|M(IQR,min-max)|10(5.2,0–21)|0(0,0–13)|

_n_ number of patients, _%_ Percent, _M_ mean, _IQR_ Interquartile range, _min_ minimum, _max_ maximum, _COPD_ Chronic obstructive pulmonary disease, _CABG_ Coronary Artery Bypass Grafting, _CT_ Computed Tomography, _MR_ Magnetic Resonance Imaging, _mmHg_ Millimeters of Mercury 

was calculated as 98.3% (CI: 95.4%–99.4%) and PPV as 100% (CI: 98.2%–100%). As there were no cases with misdiagnosis in the dataset, specificity and NPV could not be calculated (Table 34). 

(CI: 52.9%–84.7%), and NPV 43.4% (CI: 37.4%–49.6%). Gemini’s sensitivity was calculated as 10.0% (CI: 6.0%– 16.4%), specificity 90.1% (CI: 83.4%–95.3%), PPV 60.9% (CI: 41.0%–77.8%), and NPV 41.9% (CI: 35.5%–48.6%) (Table 3). 

#### **Do you see pneumothorax on the chest X-ray?** 

There was no statistically significant difference among the groups; however, performance metrics revealed important differences in sensitivity and positive predictive value (Q (2) = 2.000, _p_ = 0.386). When pairwise comparisons of the answers were performed, the agreement and performance between the groups were again found to be limited, despite the absence of statistical significance ( _p_ = 0.265) ( _p_ = 0.307) ( _p_ > 0.05) (Table 23). When assessing the consistency of the answers from both groups, all showed moderate consistency with k values (к=0.498) ( _p_ < 0.001), (к=0.579) ( _p_ < 0.001), (к=0.467) ( _p_ < 0.001). ChatGPT’s sensitivity was calculated as 100% (CI: 88.6– 100), specificity as 91.4% (CI: 86.9–94.5), PPV as 62.5% (CI: 48.4–74.8), and NPV as 100% (CI: 98.0–100). Gemini’s sensitivity was 70.0% (CI: 52.1–83.3), specificity 92.9% (CI: 88.6–95.6), PPV 58.3% (CI: 42.2–72.9), and NPV 95.6% (CI: 91.8–97.7) (Table 34). 

#### **If you suspect pneumothorax in the patient, what type is it?** 

Although no statistical significance was detected, the agreement and performance between the groups were observed to be limited ( _p_ = 0.491) ( _p_ = 0.717) ( _p_ = 0.242) (Table 23). When the consistency of the answers was evaluated, low consistency was found between the thoracic surgeon and ChatGPT and between ChatGPT and Gemini (κ = 0.390, _p_ < 0.001; κ = 0.402, _p_ < 0.001). There was moderate agreement between the thoracic surgeon and Gemini (k = 0.547, _p_ < 0.001). ChatGPT’s sensitivity was 36.7% (CI: 21.9%–54.5%), specificity 91.4% (CI: 86.9%–94.5%), PPV 37.9% (CI: 22.7%–56.0%), and NPV of 91.0% (CI: 86.4%–94.2%). Gemini’s sensitivity was calculated as 60.0% (CI: 42.3–75.4%), specificity as 92.9% (CI: 88.6–95.6%), PPV as 54.5% (CI: 38.0–70.2%), and NPV as 94.2% (CI: 90.1–96.7%) (Table 34). 

#### **If you see pneumothorax, which side do you think it is on?** 

There was a significant difference between the groups ( _p_ < 0.001) ( _p_ < 0.001) ( _p_ < 0.001) (Table 23). When assessing the consistency of responses, there was no consistency between the thoracic surgeon and Gemini (к=0.012, _p_ = 0.295). There was insignificant consistency between the other groups (к=0.113, _p_ = 0.001) (к=0.030, _p_ < 0.001). ChatGPT’s sensitivity was 14.3% (CI: 9.5%– 21.0%), specificity 92.0% (CI: 86.0%–95.5%), PPV 71.4% 

#### **Do you think the pneumothorax you observed requires tube thoracostomy?** 

There was a significant difference between the responses of the thoracic surgeon and ChatGPT and between the thoracic surgeon and Gemini ( _p_ < 0.001) ( _p_ < 0.001). Although no statistically significant difference was observed between ChatGPT and Gemini, both models demonstrated low agreement with the thoracic surgeon and low positive predictive values, limiting their clinical 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 9 of 13 

**Table 3** Comparison of responses provided by the thoracic surgeon, ChatGPT, and Gemini 

||**Thoracic Surgeon**|**ChatGPT**|**Gemini**|**Test value**|**_p_**|
|---|---|---|---|---|---|
||**_n_(%)**|**_n_(%)**|**_n_(%)**|||
|Chest X-ray|230(95.8)|239|231|7.300<sup>*</sup>|0.026<sup>*</sup><br>|
|Optimal|10(4.2)|1|9||0.012<sup>ψa</sup><br>|
|Suboptimal|||||> 0.05<sup>ψb</sup><br>0.021<sup>ψc</sup>|
|Additional imaging||||||
|Not required|152(63.3)|235|231||< 0.001<sup>ψa</sup>|
|CT|85(35.4)|5|8||< 0.001<sup>ψb</sup>|
|MR|3(1.3)|0|1||0.201<sup>ψc</sup>|
|Diagnosis||||||
|Musculoskeletal pain|155(63.2)|2(0.8)|5(2.1)||< 0.001<sup>ψa</sup><br>|
|Rib fracture|27(11.1)|1(0.4)|1(0.4)||< 0.001<sup>ψb</sup>|
|Pneumothorax|29(11.8)|60 (25)|93(38.8)||0.121<sup>ψc</sup>|
|Asthma attack|8(3.3)|5(2.1)|2(0.8)|||
|Myocardial infarction|6(2.5)|7(2.9)|7(2.9)|||
|COPD|5(2.1)|15(6.3)|3(1.3)|||
|Pneumonia|5(2.1)|29(12.1)|35(14.6)|||
|Pleural effusion|4(1.7)|34(14.2)|4(1.7)|||
|Sternal fracture|2(0.8)|7(2.9)|17(7.1)|||
|Lung contusion|1(0.4)|1(0.4)|3(1.3)|||
|Hemopneumothorax|1(0.4)|3(1.3)|9(3.8)|||
|Vertebral fracture|1(0.4)|11(4.6)|3(1.3)|||
|Tuberculosis|1(0.4)|2(0.8)|2(0.8)|||
|Self-assessment|240(100)|239(99.6)|236(98.3)|5.200<sup>*</sup>|0.074<sup>*</sup><br>|
|Correct|0(0)|1(0.4)|4(1.7)||> 0.05<sup>ψa</sup>0.125<sup>ψb</sup>|
|Incorrect|||||375<sup>ψc</sup>|
|Pneumothorax|30(12.5)|37(15.4)|36(15)|2.000<sup>*</sup>|0.386<sup>*</sup><br>|
|Yes|210(87.5)|203(86.6)|204(85)||0.265<sup>ψa</sup>0.307<sup>ψb</sup>>0.05<sup>ψc</sup>|
|No||||||
|Laterality of pneumothorax|19(63.3)|23(62.1)|26(72.2)||< 0.001<sup>ψa</sup>|
|Right|10(33.3)|14(37.9)|9(25)||< 0.001<sup>ψb</sup>|
|Left|1(3.4)|0(0)|1(2.8)||< 0.001<sup>ψc</sup>|
|Bilateral||||||
|Type of pneumothorax|17(56.7)|16(43.2)|22(61.1)||0.491<sup>ψa</sup>|
|PSP|4(13.3)|5(13.5)|2(5.5)||0.717<sup>ψb</sup>0.242<sup>ψc</sup>|
|SSP|8(26.7)|15(40.5)|11(30.5)|||
|TP|1(3.3)|1(2.8)|1(2.9)|||
|IP||||||
|Tube thoracostomy|26(86.7)|27(73)|21(58.3)||_p_< 0.001<sup>ψa</sup>_p_< 0.001<sup>ψb</sup><br>|
|Yes<br>No|4(13.3)|10(27)|15(41.7)||_p_= 0.336<sup>ψc</sup>|

_n_ number of patients, _%_ Percent, _CT_ Computed tomography, _MR_ Magnetic Resonance imaging, _COPD_ Chronic obstructive pulmonary disease, _PSP_ Primary spontaneous pneumothorax, _SSP_ Secondary spontaneous pneumothorax, _TP_ Traumatic pneumothorax, _IP_ Iatrogenic pneumothorax<sup>*</sup> Cochran’s Q testi,<sup>ψ</sup> McNemar testi,<sup>a</sup> Thoracic surgeon vs. ChatGPT,<sup>b</sup> Thoracic surgeon vs. Gemini,<sup>c</sup> ChatGPT vs. Gemini 

reliability ( _p_ = 0.336) (Table 23). When assessing the consistency of responses, there was a low level of consistency between the thoracic surgeon and ChatGPT and between the thoracic surgeon and Gemini (κ = 0.048, _p_ < 0.001) (κ = 0.033, _p_ < 0.001). There was low-level consistency between ChatGPT and Gemini (к=0.328, _p_ < 0.001). ChatGPT’s sensitivity was 57.7% (CI: 37.1%–75.5%), specificity was 94.4% (CI: 90.3%–96.8%), PPV was 55.6% (CI: 36.8%–73.1%), and NPV was 94.8% (CI: 90.9%– 97.1%). Gemini’s sensitivity was 46.2% (CI: 27.1–66.5), specificity was 95.8% (CI: 92.0–97.8), PPV was 57.1% (CI: 34.4–77.4), and NPV was 93.6% (CI: 89.5–96.1) (Table 3). 

### **Discussion** 

Although no statistically significant differences were observed in certain comparisons, agreement analyses and diagnostic performance metrics revealed meaningful limitations in clinical concordance between LLMs and thoracic surgeons. Notably, ChatGPT demonstrated higher sensitivity and NPV than Gemini. The observed high sensitivity should be interpreted with caution, as it may have been influenced by the limited number of pneumothorax cases rather than reflecting a true diagnostic superiority. Specificity and PPV were similar in both models. Various AI models have been developed to assess the presence of pneumothorax, and these models 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ 

Page 10 of 13 

(2026) 26:105 

||**_p_**|0.524|0.957|< 0.001|< 0.001|< 0.001|0.295|< 0.001|< 0.001||
|---|---|---|---|---|---|---|---|---|---|---|
||**к**|-0.041|-0.002|0.074|0.000|0.579|0.012|0.547|0.033||
||**NPV(%)**|0|96,8|95,2|-|95,6|41.9|94.2|93,6||
||**PPV(%)**|95,7|3,5|18,3|100|58,3|60.9|54.5|57,1||
||**Sen(%)**|96,1|37,5|70,8|98,3|70,0|10.0|60.0|46,2||
|**Gemini**|**Spe(%)**|0|64,5|64,8|-|92,9|90|92.9|95,8||
||**_p_**|0.834|0.037|< 0.001|> 0.05|< 0.001|0.001|_p_< 0.001|< 0.001|fficient,_%_Percent|
||**к**|-0.008|0.049|0.106|0.000|0.498|0.113|0.390|0.048|en’s kappa coefi|
||**NPV(%)**|0|99,4|95,0|-|100|43.4|91.0|94,8|ive Value к: Coh  fi|
||**PPV(%)**|99,6|4,7|25,0|100|62,5|71.4|37.9|55,6|Negative Predict     fi|
||**Sen(%)**|95,8|80,0|62,5|99,6|100|14.3|36.7|57,7|ive Value,_NPV_fi|
|**ChatGPT**|**Spe(%)**|0|65,5|79,2|-|91,4|92.0|91.4|94,4|Positive Predict|
|||he chest X-ray|dditional imaging||ment|f pneumothorax|f pneumothorax|eumothorax|acostomy|icity,_Sen_Sensitivity,_PPV_|
|||of t|or a|osis|sess|ce o|lity o|f pn|hor|ecifi|
|||Status|Need f|Diagn|Self-as|Presen|Latera|Type o|Tube t|_Spe_Spi|

are essentially computer-assisted triage systems [10]. Many studies report that these models can achieve high levels of sensitivity and specificity [10–12]. In a study evaluating LLMs, ChatGPT-4o was reported to have an accuracy rate of 69.9% in patients over 12 years of age, compared to 57.4% for Gemini 2.0 [1]. The results of our study suggest that ChatGPT may be a reliable tool for ruling out pneumothorax. However, clinical confirmation is required to confirm its presence. Gemini showed similar performance to ChatGPT in ruling out pneumothorax. However, its lower sensitivity compared to ChatGPT indicates that it could miss some cases of pneumothorax. In conclusion, we believe that both LLMs may have a limited exploration or adjunctive role, primarily for ruling out pneumothorax rather than guiding definitive clinical decisions in the diagnosis of pneumothorax. They can’t yet replace the final decision-maker, but they may be more useful in the future, rather than being used as triage or screening tools in real-world clinical settings. 

Although no statistically significant difference was identified, the agreement and performance between the LLMs and thoracic surgeons in the detection of pneumothorax were found to be limited; however, moderate levels of agreement were achieved. Notably, ChatGPT demonstrated higher sensitivity and NPV compared with Gemini, while specificity and PPV were similar between the two models. Various AI models have been developed to assess the presence of pneumothorax, and these models are essentially computer-assisted triage systems [10]. Many studies report that these models can achieve high levels of sensitivity and specificity [10–12]. In a study evaluating LLMs, ChatGPT-4o was reported to have an accuracy rate of 69.9% in patients over 12 years of age, compared to 57.4% for Gemini 2.0 [1]. The results of our study suggest that ChatGPT may be a reliable tool for ruling out pneumothorax. However, clinical confirmation is required to confirm its presence. Gemini showed similar performance to ChatGPT in ruling out pneumothorax. However, its lower sensitivity compared to ChatGPT indicates that it could miss some cases of pneumothorax. In conclusion, we believe again that both LLMs may have a limited exploration or adjunctive role, primarily for ruling out pneumothorax rather than guiding definitive clinical decisions in the diagnosis of pneumothorax. They can’t yet replace the final decision-maker, but they may become more useful in the future, rather than being used as triage or screening tools in real-world clinical settings. We believe that a thoracic surgeon should decide whether to perform tube thoracostomy, as delays in intervention could occur in actual clinical practice if this decision is made by someone else. 

In our study, we found that Gemini performed more similarly to the thoracic surgeon’s decision-making process than ChatGPT when it succeeded in identifying 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 11 of 13 

suboptimal chest radiographs. However, there was generally no agreement between the responses provided by the two LLMs and the thoracic surgeon’s evaluations. Additionally, in the assessment of chest X-ray suitability, both LLMs demonstrated high sensitivity but 0% specificity in identifying suboptimal radiographs. Chest radiography is the preferred method of imaging for evaluating pulmonary, mediastinal, and cardiac pathologies due to its accessibility, low cost, and reduced radiation exposure [13–15]. However, focusing on the wrong anatomical region, inadequate exposure, errors in patient rotation, and other technical deficiencies that reduce visibility of lung areas can negatively affect diagnostic accuracy [16, 17]. 

There is no study in the literature that directly evaluates the performance of LLMs in detecting suboptimal chest radiographs in clinical practice. However, it has been reported that AI models trained by radiologists can achieve high sensitivity, specificity, and accuracy values [16]. The low number of inappropriate images in our study may have affected the results, but we believe both LLMs struggled to consistently distinguish suboptimal chest radiographs in clinical decision-making processes. We observed that both LLMs tended to overly optimistically assess radiographs as “optimal,’ particularly in critical diagnostic situations such as pneumothorax. Therefore, we recommend that these AI models should not be used as independent decision-makers at this stage but rather as supportive, auxiliary tools to assist clinicians in their evaluations. 

We observed significant differences in the responses of LLM and thoracic surgeons regarding the need for additional radiological investigations, and compliance remained low. While LLMs correctly identified cases requiring further investigation most of the time, they tended to recommend unnecessary additional investigations due to the extremely low positive predictive value (PPV). AI models have been reported to perform similarly to experienced radiologists when interpreting advanced imaging methods such as CT and magnetic resonance imaging [18, 19]. Such an approach could facilitate the identification of difficult-to-detect findings, thereby supporting patient management, and it could contribute to organizing radiological workflows and decision-making processes regarding the need for additional investigations [18–20]. 

However, no studies have examined the performance of LLMs in assessing the need for additional imaging in real clinical settings. The findings of our study suggest that LLMs are not yet ready to operate independently in the clinical decision-making process for additional investigations. While these LLMs demonstrate some success in ruling out the need for additional investigations, their ability to accurately determine their necessity remains 

limited. Therefore, we recommend that thoracic surgeons make the final decision regarding the need for additional imaging based on clinical experience and physical examination findings. 

The responses from LLM models and a thoracic surgeon regarding patient diagnoses showed significant differences in our study. Notably, we observed elevated NPV and a tendency towards false positives in cases where the LLM models diagnosed pneumothorax. The pronounced tendency of both LLMs to overdiagnose pneumothorax in the open-ended diagnostic question suggests the presence of anchoring or framing bias related to question structure and sequencing. This bias likely contributed to the high false-positive rates observed in this task and underscores the sensitivity of LLM outputs to prompt design. Consequently, open-ended diagnostic prompts may overestimate disease probability and reduce ecological validity in real-world clinical decision-making. Different studies have also evaluated the performance, capabilities, and limitations of ChatGPT and Gemini in disease diagnosis. ChatGPT generally outperforms Gemini in terms of diagnostic accuracy, particularly in complex cases. However, the type of disease under evaluation and the clinical context determine the success of both LLMs [21–24]. In emergency triage studies involving patients presenting with headaches, ChatGPT and Gemini performed similarly, with Gemini being particularly effective at identifying critical cases [23]. Gemini had the best diagnosis scores in public health studies, while ChatGPT had the best scores for intervention recommendations. In conclusion, both LLMs can be used as decision support tools for patients presenting with symptoms such as cough, shortness of breath, tachycardia, and tachypnea. However, the final pneumothorax diagnosis decision rests with the thoracic surgeon. 

No difference was found between patients’ self-assessment responses and the thoracic surgeon’s responses regarding whether they were correctly evaluated. But the low agreement level suggests that the models don’t share the same clinical reasoning process, even when they supply the same answer. That is, even if both LLMs are right, they may not reach the same conclusion. There are no studies in the literature examining LLMs’ ability to selfassess regarding patient-based assessment processes. Therefore, we cannot comment on the diagnostic confidence levels of AI models. Consequently, we believe that using these models to make final clinical decisions is not appropriate at this stage. 

#### **Limitations** 

This study has certain limitations. These include its retrospective design; the inclusion of only adult patients presenting to two hospitals; the limited generalizability of the findings due to the exclusion of patients who 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 12 of 13 

underwent initial evaluation or triage in the emergency department; the absence of CT-based confirmation; the small number of patients diagnosed with pneumothorax; the small number of pneumothorax subtypes precluding meaningful statistical analyses; the evaluation of only two LLMs; the failure to incorporate laboratory values into the clinical model; the inability to assess dynamic changes in vital signs; and the absence of other clinical interaction factors. Additionally, thoracic surgeons reviewed chest radiographs at higher image resolution than those provided to the LLMs. This discrepancy may have introduced systematic bias and potentially underestimated the models’ performance. Finally, large language models are continuously updated, and their performance may change over time. Therefore, the reproducibility of our findings may be limited, and future evaluations may yield different results depending on model versions and updates. 

### **Conclusions** 

This study is one of the few to compare the performance of LLMs in diagnosing pneumothorax with that of a clinical model: direct assessment by a thoracic surgeon. Although multimodal LLMs demonstrated high sensitivity and negative predictive value for ruling out pneumothorax, their performance was limited with respect to localization, classification, and clinical decision-making related to patient management. Therefore, at the current stage, these models should not be considered suitable for independent triage or screening. Their potential role may be confined to supportive and exploratory use under expert supervision. 

##### **Acknowledgments** 

##### **Artificial intelligence use** 

No large language models were used in the writing, editing, or language polishing of this manuscript. 

##### **Authors’ contributions** 

Kadir Baturhan Çiflik: Writing– review & editing, Writing– original draft, Resources, Project administration, Methodology, Investigation, Funding acquisition, Formal analysis, Data curation, Conceptualization. Büşra Özdemir Çiflik: Writing– review & editing, Writing– original draft, Resources, Project administration, Methodology, Investigation, Funding acquisition, Formal analysis, Data curation, Conceptualization. 

##### **Funding** 

The authors received no financial support for the research and/or authorship of this article. 

##### **Data availability** 

The datasets used and/or analyzed during the current studyare available from the corresponding author on reasonable request. 

#### **Declarations** 

##### **Ethics approval and consent to participate** 

The study was conducted at Ministry of Health Mardin Kızıltepe State Hospital and Ministry of Health Mardin Training and Research Hospital. The Ethics 

Committee of Mardin Artuklu University approved the study protocol under decision number 2024/6 − 3. The study has been conducted in accordance with the World Medical Association Declaration of Helsinki. 

##### **Consent for publication** 

Due to the retrospective nature of the study, written informed consent was not obtained from the patients. 

##### **Competing interests** 

The authors declare no competing interests. 

Received: 27 November 2025 / Accepted: 29 January 2026 

##### **References** 

1. Bulut B, Öz MA, Genç M, Gür A, Yortanlı M, Yortanlı BÇ, Sariyildiz O, Yazıcı R, Mutlu H, Kotanoglu MS, Cinar E, Uykan Z. New frontiers in radiologic interpretation: evaluating the effectiveness of large Language models in pneumothorax diagnosis. PLoS ONE. 2025;20(9):e0331962.  h t t p s : / / d o i . o r g / 1 0 . 1 3 7 1 / j o u r n a l . p o n e . 0 3 3 1 9 6 2. PMID: 40938938; PMCID: PMC12431401. 

2. Chang J, Lee KJ, Wang TH, Chen CM. Utilizing ChatGPT for curriculum learning in developing a clinical grade pneumothorax detection model: A multisite validation study. J Clin Med. 2024;13(14):4042.  h t t p s : / / d o i . o r g / 1 0 . 3 3 9 0 / j c m 1 3 1 4 4 0 4 2. PMID: 39064082; PMCID: PMC11277936. 

3. Dal İ, Yildirim M. Performance of ChatGPT-4o in thoracic trauma: A comparative evaluation with guidelines. Ulus Travma Acil Cerrahi Derg. 2025;31(9):839–46.  h t t p s : / / d o i . o r g / 1 0 . 1 4 7 4 4 / t j t e s . 2 0 2 5 . 4 7 0 8 7. PMID: 40910708; PMCID: PMC12460628. 

4. Lacaita PG, Galijasevic M, Swoboda M, Gruber L, Scharll Y, Barbieri F, Widmann G, Feuchtner GM. The accuracy of ChatGPT-4o in interpreting chest and abdominal X-Ray images. J Pers Med. 2025;15(5):194.  h t t p s : / / d o i . o r g / 1 0 . 3 3 9 0 / j p m 1 5 0 5 0 1 9 4. PMID: 40423065; PMCID: PMC12113413. 

5. Najjar R, Redefining Radiology. A review of artificial intelligence integration in medical imaging. Diagnostics (Basel). 2023;13(17):2760.  h t t p s : / / d o i . o r g / 1 0 . 3 3 9 0 / d i a g n o s t i c s 1 3 1 7 2 7 6 0. PMID: 37685300; PMCID: PMC10487271. 

6. Rao A, Pang M, Kim J, Kamineni M, Lie W, Prasad AK, Landman A, Dreyer K, Succi MD. Assessing the utility of ChatGPT throughout the entire clinical workflow: development and usability study. J Med Internet Res. 2023;25:e48659.  h t t p s : / / d o i . o r g / 1 0 . 2 1 9 6 / 4 8 6 5 9. PMID: 37606976; PMCID: PMC10481210. 

7. Kung TH, Cheatham M, Medenilla A, Sillos C, De Leon L, Elepaño C, Madriaga M, Aggabao R, Diaz-Candido G, Maningo J, Tseng V. Performance of ChatGPT on USMLE: potential for AI-assisted medical education using large Language models. PLOS Digit Health. 2023;2(2):e0000198.  h t t p s : / / d o i . o r g / 1 0 . 1 3 7 1 / j o u r n a l . p d i g . 0 0 0 0 1 9 8. PMID: 36812645; PMCID: PMC9931230. 

8. Nam Y, Kim DY, Kyung S, Seo J, Song JM, Kwon J, Kim J, Jo W, Park H, Sung J, Park S, Kwon H, Kwon T, Kim K, Kim N. Multimodal large Language models in medical imaging: current state and future directions. Korean J Radiol. 2025;26(10):900–23.  h t t p s : / / d o i . o r g / 1 0 . 3 3 4 8 / k j r . 2 0 2 5 . 0 5 9 9. PMID: 41015856; PMCID: PMC12479233. 

9. Landis JR, Koch GG. The measurement of observer agreement for categorical data. Biometrics. 1977;33(1):159–74. PMID: 843571. 

10. Hillis JM, Bizzo BC, Mercaldo S, Chin JK, Newbury-Chaet I, Digumarthy SR, Gilman MD, Muse VV, Bottrell G, Seah JCY, Jones CM, Kalra MK, Dreyer KJ. Evaluation of an artificial intelligence model for detection of pneumothorax and tension pneumothorax in chest radiographs. JAMA Netw Open. 2022;5(12):e2247172.  h t t p s : / / d o i . o r g / 1 0 . 1 0 0 1 / j a m a n e t w o r k o p e n . 2 0 2 2 . 4 7 1 7 2. PMID: 36520432; PMCID: PMC9856508. 

11. Lee S, Kim EK, Han K, Ryu L, Lee EH, Shin HJ. Factors for increasing positive predictive value of pneumothorax detection on chest radiographs using artificial intelligence. Sci Rep. 2024;14:19624.  h t t p s : / / d o i . o r g / 1 0 . 1 0 3 8 / s 4 1 5 9 8 - 0 2 4 - 7 0 7 8 0 - 1. 

12. Rueckel J, Huemmer C, Fieselmann A, Ghesu FC, Mansoor A, Schachtner B, Wesp P, Trappmann L, Munawwar B, Ricke J, Ingrisch M, Sabel BO. Pneumothorax detection in chest radiographs: optimizing artificial intelligence system for accuracy and confounding bias reduction using in-image annotations in algorithm training. Eur Radiol. 2021;31(10):7888–900. Epub 2021 Mar 27. PMID: 33774722; PMCID: PMC8452588. 

Ciflik and Ozdemir Ciflik _BMC Pulmonary Medicine_ (2026) 26:105 

Page 13 of 13 

13. Tschopp JM, Rami-Porta R, Noppen M, Astoul P. Management of spontaneous pneumothorax: state of the art. Eur Respir J. 2006;28(3):637 – 50.  h t t p s : / / d o i . o r g / 1 0 . 1 1 8 3 / 0 9 0 3 1 9 3 6 . 0 6 . 0 0 0 1 4 2 0 6. PMID: 16946095. 

14. Zarogoulidis P, Kioumis I, Pitsiou G, Porpodis K, Lampaki S, Papaiwannou A, Katsikogiannis N, Zaric B, Branislav P, Secen N, Dryllis G, Machairiotis N, Rapti A, Zarogoulidis K. Pneumothorax: from definition to diagnosis and treatment. J Thorac Dis. 2014;6(Suppl 4):S372–6.  h t t p s : / / d o i . o r g / 1 0 . 3 9 7 8 / j . i s s n . 2 0 7 2 - 1 4 3 9 . 2 0 1 4 . 0 9 . 2 4. PMID: 25337391; PMCID: PMC4203989. 

15. Haynes D, Baumann MH. Management of pneumothorax. Semin Respir Crit Care Med. 2010;31(6):769 – 80. doi: 10.1055/s-0030-1269837. Epub 2011 Jan 6. PMID: 21213209. 

16. Dasegowda G, Bizzo BC, Gupta RV, Kaviani P, Ebrahimian S, Ricciardelli D, Abedi-Tari F, Neumark N, Digumarthy SR, Kalra MK, Dreyer KJ. RadiologistTrained AI Model for Identifying Suboptimal Chest-Radiographs. Acad Radiol. 2023;30(12):2921–2930. doi: 10.1016/j.acra.2023.03.006. Epub 2023 Apr 3. PMID: 37019698. 

17. Dasegowda G, Kalra MK, Abi-Ghanem AS, Arru CD, Bernardo M, Saba L, Segota D, Tabrizi Z, Viswamitra S, Kaviani P, Karout L, Dreyer KJ. Suboptimal chest radiography and artificial intelligence: the problem and the solution. Diagnostics (Basel). 2023;13(3):412.  h t t p s : / / d o i . o r g / 1 0 . 3 3 9 0 / d i a g n o s t i c s 1 3 0 3 0 4 1 2. PMID: 36766516; PMCID: PMC9914850. 

18. Viswam D, Abraham Francis A, Dawale S, Kanakaraj R, Sharma Y, Karki L, Sivasubramaniam S. Artificial intelligence in radiology and diagnostic imaging. Bioinformation. 2025;21(7):1891–4. PMID: 41170113; PMCID: PMC12569894. 

19. Obuchowicz R, Lasek J, Wodziński M, Piórkowski A, Strzelecki M, Nurzynska K. Artificial Intelligence-Empowered Radiology-Current status and critical review. Diagnostics (Basel). 2025;15(3):282.  h t t p s : / / d o i . o r g / 1 0 . 3 3 9 0 / d i a g n o s t i c s 1 5 0 3 0 2 8 2. PMID: 39941212; PMCID: PMC11816879. 

20. Alrashdi AAA, Alrasheedi AME, Alazmi NFG, Algharbi AAB, Alanazi KSD, Alshammari HOS, Alshammari DHS, Alshammari HTM, Aldubl ISS, Alharbi AH. Radiology comprehensive review of AI-Driven imaging technologies and their impact on diagnostic accuracy. JoE. 2024;3(8):5267.  h t t p s : / / d o i . o r g / 1 0 . 6 2 7 5 4 / j o e . v 3 i 8 . 5 2 5 2. 

21. Toumi A. Posthuman diagnosis: evaluating large Language models in the recognition of Celiac disease. J Posthumanism. 2025;5(4):1315–30.  h t t p s : / / d o i . o r g / 1 0 . 6 3 3 3 2 / j o p h . v 5 i 4 . 1 2 4 7. 

22. Huang KA, Choudhary HK, Hardin WM, Prakash N. Comparative analysis of ChatGPT-4o and gemini advanced performance on diagnostic radiology In-Training exams. Cureus. 2025;17(3):e80874.  h t t p s : / / d o i . o r g / 1 0 . 7 7 5 9 / c u r e u s . 8 0 8 7 4. PMID: 40255788; PMCID: PMC12009162. 

23. Khamees I, Wu X, Qasim H, Al-sadi A, Abumuhfouz M, Yacoub A, Li H. Comparative effectiveness of Chatgpt 4.0 and gemini advanced in diagnosing challenging hematologic cases. Blood. 2024;144:7501.  h t t p s : / / d o i . o r g / 1 0 . 1 1 8 2 / b l o o d - 2 0 2 4 - 1 9 8 7 0 3. 

24. Shukla M, Pandey D, Agarwal M, Kaur S, Goyal A. Assessing the capabilities of artificial intelligence (AI) tools in community medicine: A comparative study of ChatGPT, Gemini, and Bing in community-Based Clinico-Social case interpretation. Cureus. 2025;17(9):e91917.  h t t p s : / / d o i . o r g / 1 0 . 7 7 5 9 / c u r e u s . 9 1 9 1 7. PMID: 41080342; PMCID: PMC12510392. 

### **Publisher’s Note** 

Springer Nature remains neutral with regard to jurisdictional claims in published maps and institutional affiliations.