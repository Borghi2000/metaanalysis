---
title: "Akçay 2025 (2025) — Pneumothorax (spontaneous)"
authors: "Akçay 2025"
year: 2025
journal: "BMC Pulm Med"
doi: "10.1186/s12890-025-04041-w"
pmid: "41275154"
pool: "main"
architecture: "VLM"
model_evaluated: "GPT-4o"
clinical_scenario: "Pneumothorax (spontaneous)"
reference_standard: "Thoracic surgeon consensus"
n_total: 220
tp: 78
fp: 4
fn: 32
tn: 106
sensibilidade: 0.7091
especificidade: 0.9636
acuracia: 0.8364
quadas_overall: "High"
quadas_selecao: "High"
quadas_indice: "Unclear"
quadas_referencia: "Low"
quadas_fluxo: "Low"
tags:
  - artigo
  - pool/main
  - ano/2025
  - condicao/pneumotorax
  - modelo/chatgpt
---

# Akçay 2025 (2025)

> [!abstract] Ficha de Auditoria e Metadados Clínicos
> - **Título / Identificador:** `akcay2026` | **Estudo:** [[akcay2026]]
> - **Cenário Clínico:** Pneumothorax (spontaneous)
> - **Modelo Avaliado:** **GPT-4o** (VLM)
> - **Padrão de Referência:** Thoracic surgeon consensus
> - **Amostra Total:** 220 exames
> - **DOI:** [10.1186/s12890-025-04041-w](https://doi.org/10.1186/s12890-025-04041-w) | **PMID:** 41275154
> - **Índice Geral:** [[_Indice_Artigos]] | **Base Master:** `data/master_audit.csv`

> [!info] Desempenho Diagnóstico & Matriz 2×2 (Pool Principal)
> - **Sensibilidade:** 70.9% | **Especificidade:** 96.4% | **Acurácia Bruta:** 83.6%
> - **Razão de Verossimilhança:** RV+ = 19.48 | RV- = 0.302 | DOR = 64.5
> 
> | Matriz 2×2 | Condição Presente (+) | Condição Ausente (-) | Total |
> | :--- | :---: | :---: | :---: |
> | **Teste Positivo (IA+)** | **VP:** 78 | **FP:** 4 | 82 |
> | **Teste Negativo (IA-)** | **FN:** 32 | **VN:** 106 | 138 |
> | **Total Real** | 110 | 110 | **N:** 220 |

> [!warning] Avaliação Metodológica QUADAS-2
> - **Risco de Viés Global:** **High**
> - **Domínios de Viés:** Seleção: `High` | Teste Índice: `Unclear` | Padrão Ref.: `Low` | Fluxo/Tempo: `Low`
> - **Nota de Auditoria:** *Substitui o Noh fabricado. 2x2 CONFIRMADO no texto completo (PMID 41275154): FN=32/110, FP=4/110 => TP78 FP4 TN106 FN32; sens 70,9%, spec 96,4%, AUC 0,836. Desenho caso-controle 110/110 => D1 High.*

---

## Conteúdo do Artigo Original

BMC Pulmonary Medicine 

Akçay _et al. BMC Pulmonary Medicine_ (2026) 26:8 https://doi.org/10.1186/s12890-025-04041-w 

## **Open Access** 

## **RESEARCH** 

# Evaluation of the effectiveness of the ChatGPT artificial intelligence application in the diagnosis of spontaneous pneumothorax on chest radiograph interpretation 

Onur Akçay<sup>1*</sup> , Azat Özel<sup>1</sup> , Özgür Öztürk<sup>1*</sup> , Tuba Acar<sup>1</sup> , Ahmet Kayahan Tekneci<sup>2</sup> , Tevfik İlker Akçam<sup>2</sup> and Soner Gürsoy<sup>1</sup> 

### **Abstract** 

**Background** Spontaneous pneumothorax is a potentially life-threatening condition commonly diagnosed using chest radiographs. However, interpreting chest X-rays can be challenging due to anatomical overlap and observer variability. This study aimed to evaluate the diagnostic accuracy of ChatGPT, a large language model (LLM), in detecting pneumothorax on chest radiographs compared to expert thoracic surgeons. 

**Methods** In this retrospective study, 220 chest radiographs were assessed. Expert consensus classified 110 cases with pneumothorax and 110 without. The images were uploaded to the GPT-4o model without any clinical information, and ChatGPT was asked to identify the presence or absence of pneumothorax. Diagnostic performance was evaluated by calculating sensitivity, specificity, accuracy, positive and negative predictive values, and area under the receiver operating characteristic curve (AUC). Subgroup analyses were performed based on pneumothorax size. **Results** ChatGPT demonstrated an overall diagnostic accuracy of 83.7%, sensitivity of 70.9%, specificity of 96.4%, positive predictive value of 95.1%, and negative predictive value of 76.8%. The AUC was 0.836 (95% CI: 0.780-0.893). Diagnostic performance was higher for large pneumothoraces (AUC: 0.894) compared to small pneumothoraces (AUC: 0.439). Cohen’s kappa coefficient indicated substantial agreement (κ=0.673; 95%CI: 0.575-0.771) with expert evaluations. 

**Conclusions** ChatGPT demonstrates potential in detecting pneumothorax on chest radiographs, particularly in cases of large pneumothorax. However, its limited sensitivity for small pneumothoraces raises significant concerns about its reliability in clinical decision-making. Any use of ChatGPT in diagnostic workflows should be approached with caution, as unverified outputs may lead to inappropriate interventions or under-triaging. Therefore, the model is not suitable as a standalone diagnostic or triage tool. Its potential utility may lie in exploratory or supervised settings where expert oversight is available, but further validation is required before clinical implementation can be considered. 

*Correspondence: Onur  Akçay onur_akcay@yahoo.com Özgür Öztürk ozgur.ozturk54@hotmail.com Full list of author information is available at the end of the article 

> © The Author(s) 2025. **Open Access** This article is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License, which permits any non-commercial use, sharing, distribution and reproduction in any medium or format, as long as you give appropriate credit to the original author(s) and the source, provide a link to the Creative Commons licence, and indicate if you modified the licensed material. You do not have permission under this licence to share adapted material derived from this article or parts of it. The images or other third party material in this article are included in the article’s Creative Commons licence, unless indicated otherwise in a credit line to the material. If material is not included in the article’s Creative Commons licence and your intended use is not permitted by statutory regulation or exceeds the permitted use, you will need to obtain permission directly from the copyright holder. To view a copy of this licence, visit  h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y - n c - n d / 4 . 0 /. 

Page 2 of 8 

Akçay _et al. BMC Pulmonary Medicine_ (2026) 26:8 

**Keywords** ChatGPT, Pneumothorax, Chest radiograph, Artificial intelligence, Diagnostic accuracy, Emergency medicine 

### **Introduction** 

Spontaneous pneumothorax is a potentially life-threatening clinical condition characterized by partial or complete lung collapse due to the accumulation of air in the pleural cavity without any history of trauma [1, 2]. Primary spontaneous pneumothorax is most commonly observed in young, thin males, with an incidence reported as 7.4 per 100,000 per year in men and 1.2 per 100,000 per year in women [3]. 

The most frequently utilized imaging modality for the diagnosis of pneumothorax is chest radiography, owing to its widespread availability and ease of practical application [3–5]. Globally, chest X-ray remains the most commonly used initial diagnostic tool for evaluating thoracic diseases [6]. However, due to anatomical overlap, low contrast resolution, and observer-dependent variability, interpreting chest radiographs for pneumothorax diagnosis may not always be straightforward, particularly for less experienced clinicians. 

In addition, access to radiology specialists remains limited worldwide, which can lead to delays in both diagnosis and treatment processes [7]. With the increasing volume of imaging studies, artificial intelligence (AI)based solutions have emerged as promising tools that not only reduce the workload of radiologists but also offer the potential for high-accuracy image interpretation [4]. Notably, AI systems have the potential to overcome geographical and resource-related constraints, thereby enhancing access to high-quality diagnostic services [7]. 

In recent years, AI-based algorithms have demonstrated high accuracy in detecting a wide range of thoracic pathologies, including pneumothorax, and have notably contributed to diagnostic workflows, particularly in emergency departments [4]. In light of these advancements, the integration of AI into clinical decision support systems has gained increasing importance. Although the diagnostic performance of AI-based algorithms is promising, their interpretive capacity often remains closely tied to the datasets on which they are trained. Recently, among multimodal AI approaches, ChatGPT has emerged as a notable tool. Its proposed capabilities include generating text based on imaging data, interpreting radiology reports, and contextualizing AI outputs within clinical settings [5, 8]. 

One of the distinguishing features of ChatGPT is its potential to generate diagnostic inferences based solely on visual inputs, despite not being specifically trained on labeled medical imaging data. This capability represents a fundamental difference from conventional AI models. However, systematic studies investigating the 

ability of models like ChatGPT to derive clinically meaningful insights from imaging data remain limited. The aim of this study is to evaluate the diagnostic accuracy of ChatGPT, a large language model (LLM), in identifying pneumothorax on chest radiographs and to compare its performance with the reference assessments made by experienced thoracic surgeons. 

ChatGPT was selected for this study not because it is a dedicated image interpretation tool, but due to its widespread use and accessibility in real-world clinical environments. As one of the most commonly used AI platforms globally, ChatGPT is frequently consulted by physicians for medical decision support. In particular, we have observed in our clinical practice that junior physicians and general practitioners working in emergency departments-especially those without direct access to radiologists or thoracic surgeons-often turn to ChatGPT for preliminary guidance in image interpretation. This trend reflects a growing interest in technology-assisted diagnostic support, despite ChatGPT not being specifically trained on labeled medical imaging data. Therefore, evaluating the diagnostic capabilities and limitations of ChatGPT in this context is both timely and clinically relevant. 

This study was not designed to replicate a real-world radiological workflow but to explore ChatGPT’s baseline capacity for visual inference in the absence of textual or clinical context. By isolating image-based reasoning, we aimed to assess the model’s intrinsic interpretive potential when presented with visual data alone. 

The primary aim of this study is to evaluate the diagnostic accuracy of ChatGPT-4o in detecting pneumothorax on chest radiographs, rather than to investigate its feasibility as a general diagnostic assistant. This study directly compares the model’s output with the consensus diagnoses of thoracic surgeons. 

### **Patients and methods** 

This study is a retrospective, descriptive diagnostic accuracy investigation designed to evaluate the potential contribution of large language models (LLMs), such as ChatGPT, in diagnosing pneumothorax using chest radiographs. The primary objective of the study is to assess the usability of ChatGPT in pneumothorax diagnosis, despite its limited image interpretation capabilities. 

The study group, determined through sample analysis, consisted of 220 patients with digital chest radiographs obtained in the standing and posteroanterior positions between January 2024 and March 2025. All patients included in the study were selected from 

Page 3 of 8 

Akçay _et al. BMC Pulmonary Medicine_ (2026) 26:8 

individuals who presented to the outpatient clinic with complaints of chest pain or shortness of breath and had no history of surgery or trauma. Cases of postoperative, traumatic, or intensive care–associated pneumothorax were excluded from the study. Four thoracic surgeons, each with at least 10 years of clinical experience, independently evaluated each radiograph without access to any clinical information. Diagnoses reached by unanimous agreement among the surgeons were accepted as the reference standard. Based on the consensus results, 110 patients without pneumothorax were classified as Group 1, and 110 patients diagnosed with pneumothorax were classified as Group 2. According to the 2010 British Thoracic Society guidelines, pneumothoraces measuring less than 2 cm from the hilum to the pleural space were classified as “small,” and those measuring 2 cm or more were classified as “large.” Accordingly, patients in Group 2 were divided into two subgroups: small pneumothorax (Group 2-S) and large pneumothorax (Group 2-L), and diagnostic accuracy was assessed based on pneumothorax size [9]. 

All chest radiographs were saved in JPEG format and uploaded to the ChatGPT model (OpenAI, GPT-4o) between May 1 and May 5, 2025. To eliminate systematic ordering bias, the images were presented to the model in a randomized sequence, without any accompanying patient information, clinical history, or guiding text. The model was instructed to respond to each image solely with either “pneumothorax present” or “no pneumothorax.” It was not permitted to provide comments, explanations, or treatment suggestions. Furthermore, the ChatGPT model was not subjected to any visual training or pre-calibration. As such, the general-purpose language model was tested for its ability to perform visual-based inference. 

This study received ethical approval from the NonInterventional Clinical Research Ethics Committee (Ethics Committee Approval No: 2140-19/03/2025). 

All chest radiographs included in the study were obtained in a single center using a standard digital radiography system (SG Healthcare, Seoul, South Korea). Images were acquired in the standing posteroanterior (PA) position only; no anteroposterior (AP) or lateral views were included. Each case had a single radiographic view for evaluation. The radiographic parameters were standardized across patients, with a tube voltage of 150 kVp and a tube current of 2–5 mA, depending on body habitus. None of the radiographs were accompanied by a formal radiologist report, and no radiologist evaluations were included in this study. Therefore, no direct comparison was made between radiologist interpretations and the assessments by ChatGPT or thoracic surgeons. 

In our institution, thoracic surgeons frequently participate in the evaluation of chest radiographs in the absence of an on-site radiologist, particularly in emergency settings. Each surgeon included in the study had over 10 years of experience in interpreting thoracic imaging, and their consensus was considered as a reference standard to ensure consistency and reduce interobserver variability. Furthermore, in our clinical workflow, thoracic surgeons are not only involved in interpreting chest radiographs but also in making definitive treatment decisions and planning surgical interventions when necessary. Therefore, their assessments carry both diagnostic and therapeutic significance in real-world practice. While radiologist interpretation is traditionally regarded as the gold standard, in our clinical environment thoracic surgeons often serve in this role during off-hours or in resource-limited settings. For these reasons, their consensus diagnoses were used in this study. We acknowledge this as a methodological limitation and have now added this point to the “Limitations” section. 

Statistical analyses of the data obtained in this study were performed using IBM SPSS Statistics for Windows, Version 25.0 (IBM Corp., Armonk, NY, USA). Continuous variables were expressed as mean ± standard deviation or median (minimum–maximum), while categorical variables were presented as numbers (n) and percentages (%). The distribution of the data was assessed using the Kolmogorov–Smirnov test. 

The diagnostic performance of the ChatGPT model in identifying pneumothorax was evaluated based on sensitivity, specificity, accuracy, positive predictive value (PPV), negative predictive value (NPV), and the area under the receiver operating characteristic (ROC) curve (AUC). Confidence intervals (95% CI) were calculated for AUC values. Diagnostic agreement between the model and expert assessments was analyzed using Cohen’s kappa coefficient. Between-group comparisons were performed using the independent samples t-test for parametric data and the Mann–Whitney U test for nonparametric data. Categorical variables were analyzed using the chi-square test or Fisher’s exact test, as appropriate. Subgroup analyses were conducted according to pneumothorax size (small/large), laterality (right/left), patient age, and presenting symptoms. A p-value of < 0.05 was considered statistically significant in all analyses. 

### **Results** 

The study cohort consisted of 64 female (29.1%) and 156 male (70.9%) patients. A significantly higher proportion of male patients was observed in Group 2 ( _p_ < 0.001). The mean age of the overall study population was 25.52 ± 7.91 years. Patients in Group 2 were significantly younger than those in Group 1 (Group 1: 28.18 ± 8.24 years; Group 2: 22.85 ± 4.96 years; _p_ < 0.001). The most common 

Page 4 of 8 

Akçay _et al. BMC Pulmonary Medicine_ (2026) 26:8 

**Table 1** Demographic, clinical characteristics and ChatGPT diagnostic outputs of study <u>groups</u> 

||**Group1**<br>**(****_N_ = 110)**|**Group 2**<br>**(****_N_ = 110)**|**Total**<br>**(****_N_ = 220)**|**_P_**|
|---|---|---|---|---|
|Age|28.18_±_8.24|22.85_±_4.96|25.52_±_7.91|< 0.001|
|**Gender**||||< 0.001|
|**Female**|53 (48.2%)|11 (10%)|64 (29.1%)||
|**Male**|57 (51.8%)|99 (90%)|156 (70.9%)||
|**Presenting**||||< 0.001|
|**Symptom**|||||
|**Chest Pain**|12 (10.9%)|99 (90%)|111 (50.5%)||
|**Dyspnea**|98 (89.1%)|11 (10%)|109 (49.5%)||
|**ChatGPT Answer**||||< 0.001|
|**No**|106 (96.4%)|32 (29.1%)|138 (62.7%)||
|**Pneumothorax**|||||
|**Pneumothorax**<br>**Present**|4 (3.6%)|78 (70.9%)|82 (37.3%)||

**Table 2** Subgroup comparison based on pneumothorax size 

||**Group2-S**<br>**(****_N_ = 30)**|**Group 2-L**<br>**(****_N_ = 80)**|**_P_**|
|---|---|---|---|
|Age|21.77_±_3.22|23.26_±_5.43|0.160|
|**Gender**|||0.347|
|**Female**|4 (13.3%)|7 (8.8%)||
|**Male**|26 (86.7%)|73 (91.3%)||
|**Presenting Symptom**|||0.140|
|**Chest Pain**|29 (96.7%)|70 (87.5%)||
|**Dyspnea**|1 (3.3%)|10 (12.5%)||
|**ChatGPT Answer**|||< 0.001|
|**No Pneumothorax**|22 (73.3%)|10 (12.5%)||
|**Pneumothorax Present**|8 (26.7%)|70 (87.5%)||
|**Side of Pneumothorax**|||0.088|
|**Right**|10 (33.3%)|40 (50%)||
|**Left**|20(66.7%)|40(50%)||

presenting symptom in Group 1 was dyspnea (89.1%), whereas chest pain was more frequent in Group 2 (90%), and this difference was statistically significant (89.1% vs. 90%; _p_ < 0.001). (Table 1) 

In Group 2, pneumothorax was detected in the right hemithorax in 50 patients (45.5%) and in the left hemithorax in 60 patients (54.5%). Based on pneumothorax size, 30 patients (27.3%) were classified as having a small pneumothorax (Group 2-S), while 80 patients (72.7%) were classified as having a large pneumothorax (Group 2-L). In the subgroup analyses according to pneumothorax size, no statistically significant differences were found in terms of sex, age, presenting symptoms, or side of involvement ( _p_ = 0.347; _p_ = 0.160; _p_ = 0.140; and _p_ = 0.088, respectively). When ChatGPT’s responses were evaluated, the model was observed to produce a significantly higher rate of false-negative results in Group 2-S patients ( _p_ < 0.001). (Table 2) 

In this study, the overall diagnostic accuracy of ChatGPT was calculated as 83.7%. The model demonstrated a 

**Table 3** Diagnostic performance metrics of ChatGPT 

|**True Positive**|**70.9%**|
|---|---|
|False Positive|3.6%|
|True Negative|96.4%|
|False Negative|29.1%|
|Accuracy|83.65%|
|Sensitivity<br>i|70.9%|
|Specificity|96.4%|
|Positive Predictive Value|95.1%|
|Negative Predictive Value|76.8%|
|Area Under The Curve|0.836|
|Youden’s Index|0.673|
|Cohen’s Kappa|0.673|

sensitivity of 70.9%, a specificity of 96.4%, a positive predictive value of 95.1%, and a negative predictive value of 76.8%. Compared to the reference diagnosis, the model yielded false-negative results in 32 of the 110 pneumothorax cases (29.1%), which was statistically significant ( _p_ < 0.001). Additionally, false-positive results were observed in 4 of the 110 patients without pneumothorax (3.6%). (Table 3) (Fig. 1). 

The Youden index was calculated as 0.673 (95% CI: 0.553–0.793), indicating a moderate-to-good level of diagnostic accuracy. According to the ROC analysis, the area under the curve (AUC) for ChatGPT was calculated as 0.836 (95% CI: 0.780–0.893), demonstrating high diagnostic performance (Fig. 2). The AUC values based on pneumothorax size were 0.439 for small pneumothorax (95% CI: 0.331–0.546) and 0.894 for large pneumothorax (95% CI: 0.845–0.943). These findings indicate that the diagnostic accuracy of the model increases with the size of the pneumothorax. In the subgroup analysis, the AUC for small pneumothorax was significantly lower, suggesting reduced diagnostic reliability in small-volume cases. 

The agreement between ChatGPT’s responses and expert evaluations was assessed using Cohen’s kappa coefficient and found to be 0.673. According to the Landis and Koch classification, this value indicates a 

**Fig. 1** Example Chest Radiographs: ( **A** ) False-Negative Case (Small Pneumothorax), ( **B** ) True-Positive Case (Large Pneumothorax) 

Page 5 of 8 

Akçay _et al. BMC Pulmonary Medicine_ (2026) 26:8 

**Fig. 2** ROC Curve of ChatGPT Model for Pneumothorax Detection 

“substantial level of agreement,” reflecting moderate-tohigh reliability for research contexts ( _p_ < 0.001). 

When evaluating ChatGPT’s performance in pneumothorax diagnosis, the likelihood of cases classified as “pneumothorax present” by the model truly having pneumothorax was significantly higher than those classified as “no pneumothorax.” The odds ratio (OR) was calculated as 64.59 (95% CI: 21.94–190.17; _p_ < 0.001). This finding indicates that ChatGPT exhibits strong discriminative performance in predicting the presence of pneumothorax. 

### **Discussion** 

Chest radiography currently accounts for approximately 26% of all diagnostic radiological examinations performed worldwide [6]. However, the manual interpretation of chest radiographs remains a time-consuming, labor-intensive process that is prone to human error-particularly for radiologists who are required to review large 

volumes of images daily [7]. Despite the rapid increase in imaging demand, the growth in the number of radiologists has not kept pace, leading to potential diagnostic delays, especially in high-volume clinical environments such as emergency departments [4]. 

The increasing burden on human resources in clinical practice has prompted the search for alternative solutions to accelerate diagnostic workflows. In this context, artificial intelligence (AI)-based applications supported by recent technological advancements have come to the forefront. Within this framework of clinical workload and the need for expert interpretation, our study evaluated the diagnostic performance of a large language model-ChatGPT-in identifying pneumothorax. Our findings highlight both the potential benefits and the limitations of such models in the diagnostic decision-making process. 

The interpretation of chest radiographs is a complex process that requires experience and expertise due to 

Page 6 of 8 

Akçay _et al. BMC Pulmonary Medicine_ (2026) 26:8 

anatomical overlap, physiological variations, and the similar radiographic appearance of different pathologies. Indeed, it has been reported that approximately 22% of diagnostic radiology errors are associated with chest X-ray interpretation [6]. Consequently, the use of AI systems to alleviate clinical workload and enhance diagnostic accuracy is becoming increasingly widespread [4, 7]. 

In recent years, deep learning-based AI models have demonstrated diagnostic performance in pneumothorax detection comparable to that of human experts. Thian et al. [2] reported AUC values ranging from 0.91 to 0.98 in their multicenter model. Monti et al. [4] highlighted high specificity rates (93%) in AI-assisted reporting systems. Additionally, some studies have shown that ChatGPT is more commonly used in supportive roles such as interpretation and prioritization, rather than for direct diagnosis [10, 11]. 

Generalizability is a critical parameter in the integration of these technologies into real-world clinical practice. In particular, whether model performance can be maintained across chest radiographs obtained from different centers using various imaging devices remains an area of ongoing investigation [3]. Thian et al. [2] reported that models tested on multicenter external datasets were able to sustain high AUC values. However, some studies have shown that the performance of AI models may vary across clinical subgroups. Monti et al. [4] emphasized that model sensitivity was significantly reduced in radiographs obtained in the supine position, suggesting that diagnostic capacity may be limited in intensive care and trauma patients. These findings indicate that systems like ChatGPT may be more suitable for supportive roles rather than direct diagnostic use. In our study, the falsenegative rate was 29.1%, predominantly concentrated in the subgroup of patients with small pneumothoraces. While our analysis yielded an AUC of 0.836, Thian et al. [2] reported AUC values ranging from 0.91 to 0.98 in their multicenter studies. This discrepancy may largely be attributed to the model’s limited performance in detecting small pneumothoraces, highlighting the potential for diagnostic errors in low-contrast lesions. 

In our study, ChatGPT’s limited diagnostic performance can be attributed to its lack of training on visual data and its reduced ability to detect subtle abnormalities such as small pneumothoraces. For instance, while the sensitivity of the model in our study was 70.9%, Chang et al. [11] reported a value of 97%, highlighting the significant influence of the training context on diagnostic output. Since ChatGPT has not undergone dedicated visual training, it struggles to detect pathologies located in low-contrast and anatomically constrained regionssuch as pneumothorax. Moreover, the model’s analysis of low-resolution visual input may hinder its ability to distinguish fine pleural lines. Unlike radiology-specific 

AI models, ChatGPT lacks intrinsic radiographic pattern recognition capabilities, which further impairs its diagnostic performance in identifying subtle pathologies like small pneumothoraces. Especially in low-contrast images, the inability of models like ChatGPT to differentiate radiologic patterns presents a critical disadvantage. The AUC of 0.439 for small pneumothoraces indicates that the model performed worse than random classification in this subgroup. This may stem from ChatGPT’s delayed ability to identify the pleural line in images with minimal anatomical changes and low visual contrast. 

In a systematic review conducted by Sugibayashi et al., the overall AUC value was reported as 0.97; however, significant methodological limitations were identified across the included studies [3]. Notably, 57% of the studies were found to have a high risk of bias [8]. These findings suggest that while AI systems integrated with language models like ChatGPT may offer clinical utility, they are not yet reliable enough to serve as standalone diagnostic tools. Nevertheless, in primary care settings or emergency departments where access to imaging specialists is limited, systems like ChatGPT may hold potential as triage tools. In this context, despite their lower diagnostic accuracy, such systems could still be valuable as an initial screening mechanism to help ensure that clinically significant cases are not overlooked. 

It should be noted that our experimental design intentionally excluded clinical context to isolate ChatGPT’s pure image-based reasoning ability. This approach allowed us to establish a baseline understanding of the model’s performance under minimal input conditions. However, in clinical practice, radiologists always interpret chest radiographs alongside relevant patient information. Future research should therefore integrate both visual and textual data to more accurately reflect realworld diagnostic workflows and to assess the potential of multimodal LLMs in clinical contexts. 

Nonetheless, it should not be overlooked that ChatGPT, as a text-based language model that does not require specialized visual training, may still offer some degree of radiographic workload sharing in cases such as small pneumothoraces. However, ChatGPT lacks the pattern recognition architecture required for precise image interpretation. In the future, the integration of language models like ChatGPT into multimodal AI systems-such as GPT-4 V, Gemini, or MedCLIP—that are capable of processing both textual and visual data may enable the development of hybrid clinical decision support platforms. These systems could provide a more comprehensive and reliable interpretative framework by combining radiological pattern recognition with natural language processing, thereby increasing both diagnostic accuracy and confidence. While the overall accuracy of the model is promising, its diagnostic performance remains 

Page 7 of 8 

Akçay _et al. BMC Pulmonary Medicine_ (2026) 26:8 

inadequate in clinically important subgroups such as small pneumothoraces. Therefore, ChatGPT is not currently recommended for clinical use; however, it does have potential as a preliminary assessment or pre-screening tool. 

#### **Limitations** 

This study has several limitations. First, the ChatGPT model is a text-based artificial intelligence system and has not been trained on visual data. The study was conducted using sequentially uploaded JPEG-format images, and potential sources of systematic bias were not thoroughly analyzed. The effects of randomization and the possibility of order effects were not controlled. Moreover, only a single large language model (LLM) was evaluated, and no comparisons were made with alternative models. Therefore, the findings are specific to the current version of ChatGPT and cannot be generalized to other AI systems. 

One of the primary limitations of our study is the lack of confirmation using thoracic computed tomography (CT), which is considered the definitive reference standard for pneumothorax diagnosis. Although the consensus diagnoses of expert thoracic surgeons were used as a surrogate gold standard, CT imaging remains the most accurate modality for detecting even the smallest pneumothoraces. Future studies incorporating thoracic CT validation could provide a more robust reference standard and allow for a more precise assessment of ChatGPT’s diagnostic capabilities. 

Since all chest radiographs were processed and uploaded in JPEG format, image quality and diagnostic reliability may have been compromised. The use of standardized diagnostic imaging formats (e.g., DICOM) in future research could improve the accuracy of AI model evaluations. 

Another limitation of this study is the lack of clinical contextual information provided to the model. Since radiologists typically evaluate imaging studies in conjunction with patient history and presenting symptoms, the absence of such context in our design restricts the generalizability of the findings. Future studies incorporating both imaging and clinical data would provide a more comprehensive evaluation of ChatGPT’s diagnostic utility. 

The other limitations of our study is the use of thoracic surgeons as the reference standard rather than radiologists. While all surgeons involved had over a decade of clinical and imaging interpretation experience, their assessments may not fully reflect the diagnostic standards of board-certified radiologists. The absence of radiologist interpretations in this study was due to institutional constraints, particularly in emergency settings. Therefore, the generalizability of our findings may be 

limited, especially when considering settings where radiologists routinely evaluate imaging studies. 

### **Conclusion** 

This study represents one of the first applications to evaluate the diagnostic performance of the large language model ChatGPT in detecting pneumothorax, benchmarked against the reference assessments of experienced thoracic surgeons. In contrast to previous literature reporting high diagnostic accuracy for AI models, our findings demonstrate that ChatGPT exhibits limited diagnostic performance in interpreting chest radiographs for pneumothorax. Notably, the model produced a high rate of false negatives in cases of small pneumothoraces. Although ChatGPT demonstrated high specificity, its low sensitivity-particularly for small pneumothoraces-raises concerns regarding its use in clinical settings where radiologists or thoracic surgeons are not readily available. In such environments, especially in emergency departments, there is a risk that small pneumothoraces may be missed when ChatGPT is used for initial evaluation. In other words, while ChatGPT may provide high specificity in identifying large pneumothoraces, its performance is inadequate when subtle, low-contrast findings are present. 

Therefore, ChatGPT should not be regarded as a standalone diagnostic or triage tool in clinical settings. While it may appear useful for preliminary assessments in resource-limited environments, any clinical action based on its output—such as chest tube placement or triage prioritization—carries significant risks if not verified by qualified professionals. Particularly in false-negative cases, under-triaging could delay critical interventions, and false positives could lead to unnecessary procedures. For this reason, we strongly emphasize that ChatGPT’s outputs must be interpreted within the full clinical context by trained physicians and not be used in isolation for medical decision-making. Future research may explore the integration of language models like ChatGPT into multimodal AI systems that incorporate radiologic image training and clinical safeguards to enhance diagnostic safety. 

##### **Abbreviations** 

AI Artificial intelligence 

AUC  Area under the curve LLM  Large language model ROC  Receiver operating characteristic 

SPSS  Statistical package for the social sciences 

##### **Acknowledgements** 

Not applicable. 

##### **Authors’ contributions** 

**OA: ** Conceptualization, Methodology, Expert Evaluation, Formal Analysis, Writing-Original Draft.**AÖ:** Conceptualization, Data curation, WritingOriginal Draft.**ÖÖ:** Data curation, Methodology, Conceptualization, Expert Evaluation, Supervision, Writing-Original Draft.**TA: ** Investigation, 

Page 8 of 8 

Akçay _et al. BMC Pulmonary Medicine_ (2026) 26:8 

Visualization, Expert Review.**AKT: ** Writing-Original Draft.**TİA: ** WritingReview&Editing.**SG:** Expert evaluation, Writing-Review&Editing.All authors read and approved the final manuscript. 

##### **Funding** 

This research received no specific grant from any funding agency in the public, commercial, or not-for-profit sectors. 

##### **Data availability** 

The datasets generated and analyzed during the current study contain personal health information and cannot be shared publicly due to national data protection regulations (Turkish Personal Data Protection Law). Data may be available from the corresponding author upon reasonable request and with appropriate ethical approvals. 

#### **Declarations** 

##### **Ethical approval and consent to participate** 

This study was approved by the Ethics Committee of the Bakircay University Non-Interventional Clinical Research Ethics Committee (Ethics Committee Approval No: 2140-19/03/2025). All procedures were conducted in accordance with the ethical committee of the institutional and/or national research comittee and with 1964 Helsinki Declaration and its later amendments. Informed consent to participate was obtained from all participants prior to inclusion in the study. 

##### **Consent for publication** 

The study used anonymized chest radiographs without any personally identifiable information. Therefore, consent for publication was not required. 

##### **Competing interests** 

The authors declare no competing interests. 

##### **References** 

1. Akcay O, Acar T, Cantay S, Anar S. Minimally invasive approach to pneumothorax: single Port or two Ports? Turk Gogus Kalp Damar Cerrahisi Derg. 2020;28:347–51. 

2. Thian LY, Ng D, Hallinan JTPD, Jagmohan P, Sia SY, Tan CH, et al. Deep learning systems for pneumothorax detection on chest radiographs: A multicenter external validation study. Radiol Artif Intell. 2021;3:e200190. 

3. Sugibayashi T, Walston SL, Matsumoto T, Mitsuyama Y, Miki Y, Ueda D. Deep learning for pneumothorax diagnosis: a systematic review and meta-analysis. Eur Respir Rev. 2023;32:220259. 

4. Monti CB, Bianchi LMG, Rizzetto F, Carbonaro LA, Vanzulli A. Diagnostic performance of an artificial intelligence model for the detection of pneumothorax at chest X-ray. Clin Imaging. 2025;117:110355. 

5. Rajpurkar P, Irvin J, Ball RL, Zhu K, Yang B, Mehta H, et al. Deep learning for chest radiograph diagnosis: A retrospective comparison of the CheXNeXt algorithm to practicing radiologists. PLos Med. 2018;15:e1002686. 

6. Hwang EJ, Park S, Jin KN, Kim JI, Choi SY, Lee JH, et al. Development and validation of a deep learning based automated detection algorithm for major thoracic diseases of chest radiographs. JAMA Netw Open. 2019;2:e191095. 

7. Sufian MA, Hamiz W, Sharifi T, Zaman S, Alsadder L, Lee E, et al. AI-Driven thoracic X-ray diagnostics: transformative transfer learning for clinical validation in pulmonary radiography. J Pers Med. 2024;14:856. 

8. Akhter Y, Singh R, Vatsa M. AI-based radiodiagnosis using chest X-rays: A review. Front Big Data. 2023;6:1120989. 

9. MacDuff A, Arnold A, Harvey J, on behalf of the BTS Pleural Disease Guideline Group. Management of spontaneous pneumothorax: British thoracic society pleural disease guideline 2010. Thorax. 2010;65:18–31. 

10. Huang J, Neill L, Wittbrodt, Melnick D, Klug M, Thompson MM, et al. Generative artificial intelligence for chest radiograph interpretation in the emergency department. JAMA Netw Open. 2023;6:e2336100. 

11. Chang J, Lee KJ, Wang TH, Chen CM. Utilizing ChatGPT for curriculum learning in developing a clinical grade pneumothorax detection model: A multisite validation study. J Clin Med. 2024;13:4042. 

##### **Author details** 

1Department of Thoracic Surgery, Bakircay University, Cigli Training and Research Hospital, Yeni Mahalle, Murat Karayalçin Bulvari No:18, Izmir 35620, Turkey 

2Department of Thoracic Surgery, Ege University Faculty of Medicine, Kazımdirik, Üniversite Cd. No:9, Bornova/İzmir 35100, Turkey 

### **Publisher’s Note** 

Springer Nature remains neutral with regard to jurisdictional claims in published maps and institutional affiliations. 

Received: 5 August 2025 / Accepted: 18 November 2025