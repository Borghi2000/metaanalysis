---
title: "Hong 2025b (2025) — Tuberculosis Screening"
authors: "Hong 2025b"
year: 2025
journal: "AJR"
doi: "10.2214/AJR.25.33059"
pmid: "225:e2533059"
pool: "main"
architecture: "VLM"
model_evaluated: "KARA-CXR"
clinical_scenario: "Tuberculosis Screening"
reference_standard: "Clinical + 2 radiologists"
n_total: 800
tp: 360
fp: 56
fn: 18
tn: 366
sensibilidade: 0.9524
especificidade: 0.8673
acuracia: 0.9075
quadas_overall: "Low"
quadas_selecao: "Low"
quadas_indice: "Low"
quadas_referencia: "Low"
quadas_fluxo: "Low"
tags:
  - artigo
  - pool/main
  - ano/2025
  - condicao/tuberculose
  - modelo/kara-cxr
---

# Hong 2025b (2025)

> [!abstract] Ficha de Auditoria e Metadados Clínicos
> - **Título / Identificador:** `hong2025b_tuberculose` | **Estudo:** [[hong2025b_tuberculose]]
> - **Cenário Clínico:** Tuberculosis Screening
> - **Modelo Avaliado:** **KARA-CXR** (VLM)
> - **Padrão de Referência:** Clinical + 2 radiologists
> - **Amostra Total:** 800 exames
> - **DOI:** [10.2214/AJR.25.33059](https://doi.org/10.2214/AJR.25.33059) | **PMID:** 225:e2533059
> - **Índice Geral:** [[_Indice_Artigos]] | **Base Master:** `data/master_audit.csv`

> [!info] Desempenho Diagnóstico & Matriz 2×2 (Pool Principal)
> - **Sensibilidade:** 95.2% | **Especificidade:** 86.7% | **Acurácia Bruta:** 90.8%
> - **Razão de Verossimilhança:** RV+ = 7.18 | RV- = 0.05 | DOR = 143.6
> 
> | Matriz 2×2 | Condição Presente (+) | Condição Ausente (-) | Total |
> | :--- | :---: | :---: | :---: |
> | **Teste Positivo (IA+)** | **VP:** 360 | **FP:** 56 | 416 |
> | **Teste Negativo (IA-)** | **FN:** 18 | **VN:** 366 | 384 |
> | **Total Real** | 378 | 422 | **N:** 800 |

> [!warning] Avaliação Metodológica QUADAS-2
> - **Risco de Viés Global:** **Low**
> - **Domínios de Viés:** Seleção: `Low` | Teste Índice: `Low` | Padrão Ref.: `Low` | Fluxo/Tempo: `Low`

---

## Conteúdo do Artigo Original

**American Journal of Roentgenology** 

# **Multimodal Generative Artificial Intelligence Model for Creating Radiology Reports for Chest Radiographs in Patients Undergoing Tuberculosis Screening** 

Eun Kyoung Hong, MD, PhD<sup>1</sup> , Hae Won Kim, MD<sup>2</sup> , Ok Kyu Song, MD<sup>1</sup> , Kyu-Chong Lee, MD<sup>3</sup> , Dong Kyu Kim, MD<sup>4</sup> , Jae-Bock Cho, BS<sup>5</sup> , Jungbin Kim, BS<sup>6,7</sup> , Seungho Lee, MS<sup>8</sup> , Woong Bae, MS<sup>5</sup> , Byungseok Roh, MS<sup>9</sup> 

##### **Cardiothoracic Imaging · Original Reearch** 

#### **Available for this article:** 

<u>Supplemental content</u> **BACKGROUND.** Chest radiographs play a crucial role in tuberculosis screening in <u>CME credit</u> high-prevalence regions, although widespread radiographic screening requires exper- <u>Editorial Comment</u> by Zhu tise that may be unavailable in settings with limited medical resources. <u>Editorial Comment</u> by Nishio **OBJECTIVE.** The purpose of this study was to evaluate a multimodal generative artificial intelligence (AI) model for detecting tuberculosis-associated abnormalities on Keywords: artificial intelligence, chest chest radiography in patients undergoing tuberculosis screening. radiograph, generative AI, tuberculosis **METHODS.** This retrospective study evaluated 800 chest radiographs obtained Submitted: Apr 5, 2025 from two public datasets originating from tuberculosis screening programs. A generRevision requested: Apr 18, 2025 ative AI model was used to create free-text reports for the radiographs. AI-generated Revision received: May 18, 2025 reports were classified in terms of presence versus absence and laterality of tubercuAccepted: Jun 23, 2025 losis-related abnormalities. Two radiologists independently reviewed the radiographs First published online: Jul 2, 2025 for tuberculosis presence and laterality in separate sessions, without and with use of Version of record: Oct 15, 2025 AI-generated reports, and recorded if they would accept the report without modification. Two additional radiologists reviewed radiographs and clinical readings from the Based on a presentation at the Radiological datasets to determine the reference standard. Society of North America 2024 annual **RESULTS.** By the reference standard, 378 of 800 radiographs were positive for tubermeeting, Chicago, IL. culosis-related abnormalities. For detection of tuberculosis-related abnormalities, sensiE. K. Hong and H. W. Kim are former tivity, specificity, and accuracy were 95.2%, 86.7%, and 90.8% for AI-generated reports; medical advisors for Kakaobrain. J. B. Cho, 93.1%, 93.6%, and 93.4% for reader 1 without AI-generated reports; 93.1%, 95.0%, and J. Kim, W. Bae, and B. Roh are former 94.1% for reader 1 with AI-generated reports; 95.8%, 87.2%, and 91.3% for reader 2 withemployees of Kakaobrain. The remaining out AI-generated reports; and 95.8%, 91.5%, and 93.5% for reader 2 with AI-generated authors declare that there are no other reports. Accuracy was significantly lower for AI-generated reports than for both readers disclosures relevant to the subject matter alone ( _p_ < .001), but significantly higher with than without AI-generated reports for one of this article. reader (reader 1: _p_ = .47; reader 2: _p_ = .03). Localization performance was significantly lower ( _p_ < .001) for AI-generated reports (63.3%) than for reader 1 (79.8%) and reader 2 (77.9%) without AI-generated reports and did not significantly change for either reader with AI-generated reports (reader 1: 78.7%, _p_ = .71; reader 2: 81.5%, _p_ = .23). Among normal and abnormal radiographs, reader 1 accepted 91.7% and 52.4%, whereas reader 2 accepted 83.2% and 37.0%, respectively, of AI-generated reports. 

**CONCLUSION.** Although AI-generated reports may augment radiologists’ diagnostic assessments, the current model requires human oversight, given inferior standalone performance. 

**CLINICAL IMPACT.** The generative AI model could have potential application to aid tuberculosis screening programs in medically underserved regions, although technical improvements remain required. 

Tuberculosis remains one of the world’s leading causes of death and most lethal infectious diseases [1]. The WHO recommends screening for tuberculosis in high-risk groups, to aid timely detection and address associated morbidity and mortality as well as further transmission [1, 2]. Chest radiography plays a crucial role in this effort due to its afford- 

1Department of Radiology, Mass General Brigham, Brigham & Women’s Hospital, 75 Francis St, Boston, MA 02115. **Address correspondence to** E. K. Hong (amyh0803@gmail.com). 

2Department of Radiology, St. Mary’s Hospital, Seoul, South Korea. 

3Department of Radiology, Korea University College of Medicine, Seoul, South Korea. 

4Department of Radiology, Severance Hospital, Seoul, South Korea. 

5SoombitAI, Seoul, South Korea. 

doi.org/10.2214/AJR.25.33059 _AJR_ 2025; 225:e2533059 ISSN-L 0361-803X/25/2254–e2533059 

© American Roentgen Ray Society 

6Kakaobrain, Seoul, South Korea. 

7Present affiliation: Rayence, Seoul, South Korea. 

8Department of Radiology, Seoul National University Hospital, Seoul, South Korea. 

9Kakao Corp., Seoul, South Korea. 

_www.ajronline.org_ 

AJR:225, October 2025 

**Hong et al.** 

ability and availability, especially in countries with a high prevalence of tuberculosis [3, 4]. However, widespread screening for tuberculosis on chest radiography in large numbers of high-risk patients can be labor-intensive and require expertise that may be unavailable in settings with limited medical resources [5, 6]. New technologies that aid this screening process could thus make a substantial clinical impact. 

Computer-aided diagnosis (CAD) tools have previously been explored to improve tuberculosis detection on chest radiographs [7, 8]. Although earlier generations of CAD tools had limited performance for this purpose, their accuracy has improved significantly after the introduction of artificial intelligence (AI) approaches [7, 8], which themselves have undergone rapid technical advances. As demands on radiologists continue to increase, the benefits associated with the use of AI increasingly appear to outweigh the risks, particularly in underserved populations [9]. For example, the WHO endorses the implementation of autonomous interpretation of chest radiographs for tuberculosis screening in areas where the disease is widespread and in which a shortage of radiologists exists [2]. According to the WHO, the target product profile for tools used for the triage or systematic screening for tuberculosis includes minimum and optimum sensitivities of 90% and 95%, respectively, as well as minimum and optimum specificities of 70% and 80%, respectively [10]. 

Multimodal generative AI technologies can process and generate a range of data types, including images and text [11]. These tools have the potential to create contextually rich data outputs beyond that which can be achieved by conventional generative AI models and have been explored for generating detailed radiology reports from inputted radiologic images [12–14]. 

This study aimed to evaluate a multimodal generative AI model for detecting tuberculosis-associated abnormalities on chest radiography in patients undergoing screening for tuberculosis. 

## **Highlights** 

#### **Key Finding** 

- _For 800 chest radiographs from two public tuberculosis screening datasets, reports created by a generative AI model had accuracy for detecting tuberculosis-related abnormalities of 90.8%, lower than the accuracies of two radiologists (93.4% and 91.3%); the radiologists’ accuracies when interpreting radiographs using AI-generated reports were 94.1% and 93.5%, respectively._ 

#### **Importance** 

- _Tuberculosis screening programs with limited access to radiologic expertise may incorporate generative AI tools, although the present results do not support stand-alone AI reporting._ 

generated reports were previously evaluated in a curated test set of 2145 chest radiographs, balanced for abnormal findings [15]. The model operates through two main components: a classifier that identifies abnormalities using an image encoder (using the Swin Transformer [Microsoft Research Asia] base model, pretrained on ImageNet-21k [Stanford University and Princeton University], with an input resolution of 384 pixels), transformer encoder, and classification head and a captioner that produces a report via a transformer decoder that integrates classified abnormalities and image features. All input chest radiographs are preprocessed by resizing to a matrix size of 384 × 384 pixels and normalized to match the model’s input specifications. The model is not approved for clinical use nor is it commercially available but is available online for investigational use only. 

### **_Datasets_** 

### **Methods** 

This study using public datasets was exempted from review by the local institutional review board. Six authors (E.K.H., H.W.K., J.B.C., J.K., W.B., and B.R.) are former employees of Kakaobrain and contributed to development of the generative AI software. The remaining authors, who are not former or present employees of Kakaobrain, controlled the analysis and information submitted for publication. 

### **_Description of Multimodal Generative AI Model_** 

This study used a domain-specific multimodal generative AI model (KARA-CXR, now called <u>AIRead-CXR) that receives as in-</u> put a chest radiograph and then generates a free-text report describing radiographic findings detected by the model [15]. The AI model does not receive as input patient history or other textbased information in addition to the radiographic image. Its generated reports contain separate findings and impression sections but do not contain a history or impression section. The detected abnormalities are not specific to any particular disease or condition but represent the comprehensive spectrum of abnormalities that may be present on chest radiography. 

The model was trained on approximately 8 million pairs of chest radiographs and corresponding reports from individuals 15 years old and older. The accuracy and quality of the models’ 

The present analysis tested the multimodal AI model using two publicly available datasets of posteroanterior chest radiographs, originating from tuberculosis screening programs in Shenzhen No. 3 People’s Hospital in Shenzhen, China (National Library of Medicine, NIH, and Shenzhen No. 3 People’s Hospital, Guangdong Medical College) and the U.S. Department of Health and Human Services in Montgomery County, MD (National Library of Medicine, NIH) [16]. Neither dataset was used in the model’s earlier training and testing. Each dataset includes a combination of normal and abnormal chest radiographs showing tuberculosis-associated findings. For each radiograph, the databases also contain patient age, patient sex, and a free-text clinical reading; these clinical readings were obtained as part of the screening programs and focused on the presence of tuberculosis-related abnormalities. The dataset from China contains 662 radiographs (described as acquired primarily in September 2012) and the dataset from Montgomery County contains 138 radiographs (date of acquisition not specified). The present analysis used all 800 cases that are available between the two datasets, without exclusion of any cases and without differentiating between cases from the two datasets. For each case, the patient demographic characteristics, radiograph, and clinical reading were extracted from the respective database [16–18]. Figure 1 shows the flow of case selection. 

_www.ajronline.org_ | **2** 

AJR:225, October 2025 

**Generative AI for Radiographs in Tuberculosis Screening** 

<!-- Start of picture text -->
Two publicly available datasets of chest radiographs<br>from tuberculosis screening programs<br>Shenzhen dataset Montgomery County dataset<br>• 662 Radiographs • 138 Radiographs<br>• Acquired September 2012 • Acquired date not specified<br>No exclusions<br>Final analytic dataset<br>• 800 Radiographs<br>• Additional information extracted from database<br>▪ Demographic characteristics<br>▪ Clinical readings<br><!-- End of picture text -->

**Fig. 1—** Diagram shows flow of case selection. Shenzhen dataset was obtained from Shenzhen No. 3 People’s Hospital in Shenzhen, China. Montgomery County dataset was obtained from U.S. Department of Health and Human Services in Montgomery County, MD. 

### **_Determination of the Reference Standard_** 

Given the clinical readings’ unstructured nature and possible inaccuracies, a process was implemented to develop a separate reference standard in a structured format. Two board-certified radiologists (O.K.S. and H.W.K., with 12 and 11 years of posttraining experience, respectively) independently reviewed the radiographs, blinded to the extracted clinical readings, and classified each radiograph as normal if it did not show any tuberculosis-related abnormalities and as abnormal if showing abnormalities indicative of tuberculosis; if the radiograph was classified as abnormal, then the radiologist classified the laterality of the abnormalities as left, right, or bilateral. If at least one of the two radiologists agreed with the clinical reading in the dataset in terms of the presence and laterality of tuberculosis-related abnormalities, then that assessment served as the reference standard for the case. If both radiologists had independently recorded an assessment that was discrepant from the clinical reading in terms of the presence and laterality of tuberculosis-related abnormalities but that was concordant between the two of them, then that assessment served as the reference standard for the case. These final assessments from this process, not the clinical readings from the database, served as the reference standard for all further analyses. No instances arose in which both radiologists had independently recorded an assessment that was both discrepant from the clinical reading and discrepant between the two of them. The AI-generated reports and reference-standard assessments are publicly available [19]. 

### **_Use of Generative AI Model for Processing Radiographs and Assessment of Stand-Alone Model Reports_** 

All radiographs in the dataset were processed by the generative AI model. One radiologist (O.K.S., 12 years of posttraining experience) who was not part of the reader performance tests (de- 

scribed later in the Methods) reviewed the AI-generated reports and was blinded to the radiographs and to the reference-standard assessments. The radiologist classified each AI report as positive or negative for the presence of tuberculosis-related abnormalities. Although classification of the AI report as positive required that the report mention the presence of abnormalities that are recognized to be associated with tuberculosis, this classification did not require that the report explicitly attribute the abnormalities to tuberculosis; accordingly, a report could be classified as positive without explicitly using the term “tuberculosis.” If the report was classified as positive, then the radiologist classified the laterality of these abnormalities according to the report as right, left, or bilateral. 

For each AI-generated report, the radiologist also recorded the number of abnormal findings related to each of the lungs, pleura, and mediastinum; reports could potentially mention abnormal findings related to multiple of these categories and also potentially mention multiple distinct abnormal findings within a category. These mentions of abnormal findings in the AI-generated reports were documented regardless of whether the report was classified as positive or negative for tuberculosis-related abnormalities and regardless of whether the particular finding is one that typically relates to tuberculosis. Examples of abnormal lung findings included nodules, masses, consolidation, and fibrosis. Examples of pleural findings included pleural effusion and pleural thickening. Examples of mediastinal findings included lymphadenopathy and paratracheal opacity. Findings related to changes in inflation (e.g., hypoinflation, hyperinflation), chronic obstructive pulmonary disease, or emphysema were not considered in these assessments. The radiologist also recorded whether each report mentioned the word “tuberculosis.” 

### **_Radiologist Review of Radiographs_** 

Two radiologists (D.K.K. and K.C.L., with 9 and 10 years of posttraining experience, respectively, in chest radiograph interpretation), blinded to all clinical information in the reference-standard assessments, independently evaluated the chest radiographs in two sessions. All radiographs were reviewed in both sessions, with the order of the radiographs randomized in each session. The second session occurred 4 weeks after completion of the first session. In the first session, the radiologists evaluated the radiographs without access to the AI-generated reports. In the second session, the radiologists evaluated the radiographs in conjunction with the radiographs’ previously created AI-generated reports but blinded to their own evaluations from the first sessions; the radiologists did not directly access the AI system as part of this session. 

During the two sessions, the radiologists classified each radiograph in a binary manner in terms of the presence or absence of tuberculosis-related abnormalities; if the radiograph was assessed as showing such abnormalities, then the radiologist recorded their laterality (right, left, or bilateral). The radiologists also recorded for each radiograph their confidence level in their assessment using a 5-point scale (1, least confident; 5, most confident). Figure 2 shows the interface used by the readers, including the display of the AI-generated report in the second session. 

During session 2, the radiologists also recorded the acceptability of each AI-generated report. The report was considered acceptable if the radiologist felt that they would approve the re- 

_www.ajronline.org_ | **3** 

AJR:225, October 2025 

**Hong et al.** 

**Fig. 2—** Interface used by radiologists. Images were obtained from datasets created from tuberculosis screening programs in Shenzhen No. 3 People’s Hospital in Shenzhen, China (National Library of Medicine, NIH, and Shenzhen No. 3 People’s Hospital, Guangdong Medical College) and U.S. Department of Health and Human Services in Montgomery County, MD (National Library of Medicine, NIH) [26, 27]. Used with permission. TB = tuberculosis, pa = posteroanterior, W = window width, L = window level, CTRL = control. **A** and **B,** Images show interface used by radiologists for evaluating chest radiographs in sessions 1 ( **A** ) and 2 ( **B** ). Radiologists were provided with artificial intelligence–generated reports only in session 2. 

#### **A** 

**B** 

port as their own without any modifications. If the report was not considered acceptable, then the radiologist classified the reason for this assessment among the following prespecified options: false-positive finding, false-negative finding, incorrect number or localization of a finding, or hallucination (defined as provision of information unrelated to the inputted chest radiograph, for example, relating to a prior chest radiograph or to a chest CT examination); for all of these categories other than hallucinations, the radiologist also recorded if the error was clinically significant. The radiologists could record multiple reasons a given report was not considered acceptable. 

### **_Statistical Analysis_** 

Data were summarized using descriptive statistics. Reports were treated as being from unique patients for purposes of summarizing age and sex information. The mentions of abnormal findings in the AI-generated reports were tabulated separately for positive and negative AI-generated reports. For each case, the standalone AI-generated report as well as the radiologists’ assessments in the two sessions were classified as true-positive, true-negative, false-positive, or false-negative assessments for the presence of tuberculosis-related abnormalities based on the previously described reference standard; true-positive assessments for the presence of tuberculosis-related abnormalities were further classified in terms of whether they were an exact match with the reference standard for laterality of the abnormalities. The accuracies, sensitivities, specificities, PPVs, and NPVs of the stand-alone AI-generat- 

ed reports and of the two radiologists in each session for detecting tuberculosis-related abnormalities were calculated. Accuracy, sensitivity, and specificity were compared between the stand-alone AI model and each radiologist’s session 1 assessments, as well as between each radiologist’s session 1 and session 2 assessments, using McNemar and _z_ tests. PPV and NPV were not statistically compared. Localization performance was compared between the same combinations of assessments using the chi-square test for independence. The readers’ confidence scores were compared between the two sessions using _t_ tests. The percentage of reports considered acceptable was computed among all reports as well as among normal and abnormal reports according to the reference standard, according to the AI-generated reports, and according to the reader’s session 2 assessments. The reasons the radiologists did not consider the AI-generated reports to be acceptable were also tabulated. 

For all comparisons, a _p_ value less than .05 was considered to indicate a statistically significant difference. Analysis used <u>Python</u> libraries, including Pandas for data manipulation and SciPy for statistical testing. 

### **Results** 

### **_Demographic Characteristics and Reference Standard_** 

Table 1 summarizes characteristics of the datasets and reference standard. The 800 chest radiographs in the analysis were from patients with a median age of 33 years (range, 1–89 years). Of the total, 523 patients were male and 276 patients were fe- 

_www.ajronline.org_ | **4** 

AJR:225, October 2025 

**Generative AI for Radiographs in Tuberculosis Screening** 

**TABLE 1: Summary of Demographic Characteristics and Reference Standard** 

|Characteristic|Value (_n_= 800)|
|---|---|
|Age (y), median (range)|33 (1–89)|
|Sex (no. of patients)||
|Male|523|
|Female|276|
|Missing|1|
|Reference-standard assessment for binary<br>classification of reports (no. of reports)||
|Normal|422|
|Abnormal|378|
|Reference-standard assessment for laterality of<br>abnormal findings (no. of reports)||
|Right|158|
|Left|79|
|Bilateral|141|

male; sex information was missing for one patient. In the process of determining the reference standard, the two radiologists provided an assessment that was different from the dataset’s clinical reading in terms of tuberculosis-related abnormalities in 26 cases (assessed as absent by the clinical reading but present by both radiologists in five cases and as present by the clinical reading but absent by both radiologists in 21 cases); among cases assessed as showing tuberculosis-related abnormalities by both the clinical reading and the two radiologists, the two radiologists provided an assessment that was different from the clinical reading in terms of localization of abnormalities in 77 cases (assessed as bilateral by the clinical reading but unilateral by both radiologists in 37 cases, as unilateral by the clinical reading but bilateral by both radiologists in 34 cases, and as unilateral but different lungs between the clinical reading and both radiologists in six cases). <u>Figure S1 provides examples of cases with discordant assess-</u> ments between the two radiologists and the clinical readings. By the final reference standard, 422 radiographs were classified as normal and 378 as abnormal. Additionally, by the final reference 

standard, of the 378 that were classified as abnormal, the abnormalities were localized to the right lung in 158, to the left lung in 79, and to both lungs in 141. 

### **_Abnormalities Mentioned in AI-Generated Reports_** 

The AI-generated reports were positive for tuberculosis-related abnormalities in 416 cases and negative in 384 cases. Among the positive AI-generated reports, 365 mentioned a total of 1345 lung abnormalities, 93 mentioned a total of 138 pleural abnormalities, and two mentioned single mediastinal abnormalities. Among the negative AI-generated reports, 59 mentioned a total of 102 lung abnormalities, six mentioned single pleural abnormalities, and one mentioned a single mediastinal abnormality. The term “tuberculosis” was mentioned in 22 positive AI-generated reports and in no negative AI-generated reports. 

### **_Comparison of Performance Between Stand-Alone AI Reports and of Radiologists Without Use of AI-Generated Reports_** 

Table 2 summarizes the diagnostic performance of the standalone AI-generated reports and of the two radiologists without use of AI-generated reports. For the detection of tuberculosis-related abnormalities, the stand-alone AI-generated reports had sensitivity of 95.2% (95% CI: 92.6–97.0%), specificity of 86.7% (95% CI: 83.2–89.6%), accuracy of 90.8% (95% CI: 88.5–92.6%), PPV of 86.5% (95% CI: 82.9–89.5%), and NPV of 95.3% (95% CI: 92.7–97.0%); reader 1 in session 1 had sensitivity of 93.1% (95% CI: 90.1–95.3%), specificity of 93.6% (95% CI: 90.9–95.6%), accuracy of 93.4% (95% CI: 91.4–94.9%), PPV of 92.9% (95% CI: 89.8–95.1%), and NPV of 93.8% (95% CI: 91.1–95.8%) and reader 2 in session 1 had sensitivity of 95.8% (95% CI: 93.2–97.4%), specificity of 87.2% (95% CI: 83.7–90.1%), accuracy of 91.3% (95% CI: 89.1–93.0%), PPV of 87.0% (95% CI: 83.4–89.9%), and NPV of 95.8% (95% CI: 93.3– 97.4%). Based on session 1, sensitivity was not significantly different between the stand-alone AI-generated reports and either reader 1 ( _p_ = .21) or reader 2 ( _p_ = .73); specificity was significantly lower for the stand-alone AI-generated reports than for reader 1 ( _p_ < .001) but not significantly different from reader 2 ( _p_ = .84); and accuracy was significantly lower for stand-alone AI-generated reports than for both readers (both _p_ < .001). Localization performance for the stand-alone AI-generated reports was 63.3% (95% CI: 58.4–68.3%), which was significantly lower than for both 

**TABLE 2: Performance of Stand-Alone AI-Generated Reports and of Radiologists in Session 1 for the Detection of Tuberculosis-Related Abnormalities and for Localization Performance** 

|Measure|AI-Generated Reports|Reader 1|_p_|Reader 2|_p_|
|---|---|---|---|---|---|
|Diagnostic performance||||||
|Sensitivity|95.2 [360/378] (92.6–97.0)|93.1 [352/378] (90.1–95.3)|.21|95.8 [362/378] (93.2–97.4)|.73|
|Specificity|86.7 [366/422] (83.2–89.6)|93.6 [395/422] (90.9–95.6)|< .001|87.2 [368/422] (83.7–90.1)|.84|
|Accuracy|90.8 [726/800] (88.5–92.6)|93.4 [747/800] (91.4–94.9)|< .001|91.3 [730/800] (89.1–93.0)|< .001|
|PPV|86.5 [360/416] (82.9–89.5)|92.9 [352/379] (89.8–95.1)||87.0 [362/416] (83.4–89.9)||
|NPV|95.3 [366/384] (92.7–97.0)|93.8 [395/421] (91.1–95.8)||95.8 [368/384] (93.3–97.4)||
|Localization performance|63.3 [228/360] (58.4–68.3)|79.8 [281/352] (75.6–84.0)|< .001|77.9 [282/362] (73.6–82.1)|< .001|

Note—Data are expressed as percentage with numerator and denominator in brackets and 95% CI in parentheses. _p_ values indicate comparison of each reader with AI-generated reports. AI = artificial intelligence. 

_www.ajronline.org_ | **5** 

AJR:225, October 2025 

**Hong et al.** 

**TABLE 3: Comparison of Reader Assessments Between Sessions 1 and 2, Corresponding With Assessments Without and With Use of AI-Generated Reports, Respectively** 

|||Reader 1|||Reader 2||
|---|---|---|---|---|---|---|
|Variable|Session 1|Session 2|_p_|Session 1|Session 2|_p_|
|Diagnostic performance|||||||
|Sensitivity|93.1 [352/378] (90.1–95.3)|93.1 [352/378] (90.1–95.3)|> .99|95.8 [362/378] (93.2–97.4)|95.8 [362/378] (93.2–97.4)|> .99|
|Specificity|93.6 [395/422] (90.9–95.6)|95.0 [401/422] (92.5–96.7)|.37|87.2 [368/422] (83.7–90.1)|91.5 [386/422] (88.4–93.8)|.045|
|Accuracy|93.4 [747/800] (91.4–94.9)|94.1 [753/800] (92.3–95.6)|.47|91.3 [730/800] (89.1–93.0)|93.5 [748/800] (91.6–95.0)|.03|
|PPV|92.9 [352/379] (89.8–95.1)|94.4 [352/373] (91.5–96.3)||87.0 [362/416] (83.4–89.9)|91.0 [362/398] (87.7–93.4)||
|NPV|93.8 [395/421] (91.1–95.8)|93.9 [401/427] (91.2–95.8)||95.8 [368/384] (93.3–97.4)|96.0 [386/402 (93.6–97.5)||
|Localization performance|79.8 [281/352] (75.6–84.0)|78.7 [277/352] (74.4–82.9)|.71|77.9 [282/362] (73.6–82.1)|81.5 [295/362] (77.5–85.5)|.23|
|Confidence (mean ± SD)|4.4 ± 1.0|4.8 ± 0.7|< .001|4.3 ± 0.8|4.1 ± 0.8|.002|

Note—Unless otherwise indicated, data are expressed as percentage with numerator and denominator in brackets and 95% CI in parentheses. Session 1 data for each reader correspond with results found in Table 2. _p_ values represent comparisons between session 1 and session 2 for each reader. AI = artificial intelligence. 

reader 1 (79.8% [95% CI: 75.6–84.0%]) and reader 2 (77.9% [95% CI: 73.6–82.1%]) in session 1 (both _p_ < .001). 

### **_Comparison of Radiologists Without and With Use of AI-Generated Reports_** 

Table 3 summarizes the diagnostic performance of the two radiologists in the second session. In session 2, for the detection of tuberculosis-related abnormalities, reader 1 had sensitivity of 93.1% (95% CI: 90.1–95.3%), specificity of 95.0% (95% CI: 92.5– 96.7%), accuracy of 94.1% (95% CI: 92.3–95.6%), PPV of 94.4% (95% CI: 91.5–96.3%), and NPV of 93.9% (95% CI: 91.2–95.8%) and reader 2 had sensitivity of 95.8% (95% CI: 93.2–97.4%), specificity of 91.5% (95% CI: 88.4–93.8%), accuracy of 93.5% (95% CI: 91.6– 95.0%), PPV of 91.0% (95% CI: 87.7–93.4%), and NPV of 96.0% (95% CI: 93.6–97.5%). Reader 1’s performance in session 2 in comparison with session 1 was not significantly different for sensitivity ( _p_ = > .99), specificity ( _p_ = .37), or accuracy ( _p_ = .47). Reader 2’s performance in session 2 in comparison with session 1 was not significantly different for sensitivity ( _p_ > .99) but was significantly higher for specificity ( _p_ = .045) and accuracy ( _p_ = .03). Localization performance in session 2 for reader 1 was 78.7% (95% CI: 74.4–82.9%) and for reader 2 it was 81.5% (95% CI: 77.5–85.5%); this performance was not significantly different from session 1 for either reader 1 ( _p_ = .71) or reader 2 ( _p_ = .23). Confidence increased significantly from session 1 to session 2 for reader 1 (4.4 ± 1.1 [SD] vs 4.8 ± 0.7, _p_ < .001), but decreased significantly from session 1 to session 2 for reader 2 (4.3 ± 0.8 vs 4.1 ± 0.8, _p_ = .002). Figure 3 shows examples of cases with a change in the radiologist’s interpretation when using the AI-generated reports. 

### **_Acceptability of AI-Generated Reports_** 

Table 4 summarizes the radiologists’ assessments regarding acceptability of the AI-generated reports and the reasons that reports were not considered acceptable. Reader 1 accepted 91.7% of normal reports and 52.4% of abnormal reports according to the reference standard, as well as 91.4% of normal reports and 56.3% of abnormal reports according to the assessment of the AI-generated report. Reader 2 accepted 83.2% of normal reports and 37.0% of abnormal reports according to the reference stan- 

dard, as well as 82.8% of normal reports and 41.6% of abnormal reports according to the assessment of the AI-generated report. 

Among reports that were not considered acceptable, reader 1 and reader 2 identified a false-positive finding in 67 and 70 reports, of which 64 and 43 were considered clinically significant, respectively; a false-negative finding in 126 and 175 reports, of which 122 and 143 were considered clinically significant, respectively; an incorrect number or location of a finding in 48 and 39 reports, of which 43 and 30 were considered clinically significant, respectively; and a hallucination in five and 61 reports, respectively. 

### **Discussion** 

In this study, we assessed the use of a multimodal generative AI model for generating free-text reports for chest radiographs obtained in patients undergoing tuberculosis screening. The stand-alone AI model showed both significantly worse accuracy and significantly worse localization performance in comparison with each of two radiologists. However, one of the two radiologists showed a significant improvement in accuracy when interpreting radiographs with versus without AI-generated reports. Thus, although the AI-generated reports may help augment radiologists’ diagnostic assessments in this clinical setting, the model still requires human oversight for both diagnostic and localization tasks, given its inferior stand-alone performance. 

Prior investigations explored the use of generative AI models for autonomous reporting of chest radiographs [20, 21]. However, this study is the first to our knowledge to explore the application of domain-specific multimodal generative AI for the autonomous generation of reports specifically targeting the detection of tuberculosis-related abnormalities. This application is one for which the WHO has endorsed the use of CAD as a diagnostic tool. Prior research of automated methods for tuberculosis detection on imaging used tools from before the advent of generative AI technologies and focused on prespecified binary classification tasks (e.g., presence vs absence of tuberculosis) [7, 8, 22, 23]. In contrast, the present model reported the presence on radiographs of lung, mediastinal, and pleural findings and did not use a prespecified diagnostic task. In some earlier studies of AI tools for tuberculosis detection, the detected findings were confined 

_www.ajronline.org_ | **6** 

AJR:225, October 2025 

##### **Generative AI for Radiographs in Tuberculosis Screening** 

**A** 

**B** 

**C** 

**D** 

**Fig. 3—** Representative cases showing change in radiologist interpretation in session 2 when using artificial intelligence (AI)-generated report, in comparison with session 1. Images were obtained from datasets created from tuberculosis screening programs in Shenzhen No. 3 People’s Hospital in Shenzhen, China (National Library of Medicine, NIH, and Shenzhen No. 3 People’s Hospital, Guangdong Medical College) and U.S. Department of Health and Human Services in Montgomery County, MD (National Library of Medicine, NIH) [26, 27]. Used with permission. 

**A,** 28-year-old patient who underwent chest radiography for tuberculosis screening. In session 1, both radiologists classified radiograph as abnormal. AI-generated report classified radiograph as normal. In session 2, both radiologists classified radiograph as normal. According to reference-standard assessment, radiograph was normal. 

**B,** 26-year-old patient who underwent chest radiography for tuberculosis screening. In session 1, both radiologists classified radiograph as normal. AI-generated report commented on right perihilar consolidation with scattered patchy opacities in right lung; this report was classified as abnormal for right tuberculosis-related abnormalities. In session 2, one radiologist changed their assessment to abnormal; one radiologist again assessed radiograph as normal. According to referencestandard assessment, radiograph was abnormal for tuberculosis-related abnormalities. 

**C,** 78-year-old patient who underwent chest radiography for tuberculosis screening. In session 1, both radiologists classified radiograph as showing unilateral abnormalities of tuberculosis. AI-generated report commented on consolidation in mid-to-lower right lung, small nodular densities in left lung, and small bilateral pleural effusions; this report was classified as abnormal for bilateral tuberculosis-related abnormalities. In session 2, both radiologists changed their assessments to abnormal for bilateral tuberculosis-related abnormalities. According to reference-standard assessment, radiograph was abnormal for bilateral tuberculosis-related abnormalities. 

**D,** 33-year-old patient who underwent chest radiography for tuberculosis screening. In session 1, both radiologists classified radiograph as showing bilateral abnormalities of tuberculosis. AI-generated report commented on linear atelectasis in right upper lobe and small nodular density in left perihilar region; this report was classified as abnormal for left tuberculosis-related abnormalities. In session 2, both radiologists changed their assessments to abnormal for unilateral tuberculosisrelated abnormalities related to only left-sided disease. According to reference-standard assessment, radiograph was abnormal for bilateral tuberculosis-related abnormalities. 

to just lung abnormalities [8, 24]. In this sense, the present model offered assessments that were both more comprehensive and more nuanced than earlier simpler tools, mimicking the interpretation processes conducted by radiologists. 

The present generative AI model showed stand-alone performance that exceeded the minimum target product profile for tuberculosis screening tests proposed by the WHO. Additionally, although the model’s accuracy was significantly lower than that of the two radiologists, the difference qualitatively was not large. 

Moreover, the two radiologists were willing to accept most normal AI-generated reports without further modification. These findings highlight the model’s potential utility to aid screening programs in medically underserved regions with a high need for assistive diagnostic technologies. In particular, the tool could have value in regions with a high prevalence of tuberculosis yet limited access to radiologists. Nonetheless, the clinical usability of generative AI technologies in such settings highly depends on the models’ ability to autonomously generate accurate and 

_www.ajronline.org_ | **7** 

AJR:225, October 2025 

**Hong et al.** 

**TABLE 4: Acceptability of AI-Generated Reports and Reasons That Reports Were Not Considered Acceptable** 

|Variable|Reader 1|Reader 2|
|---|---|---|
|Report acceptability rate, all|585/800 (73.1)|491/800 (61.4)|
|Reference standard|||
|Normal|387/422 (91.7)|351/422 (83.2)|
|Abnormal|198/378 (52.4)|140/378 (37.0)|
|AI-generated report|||
|Normal|351/384 (91.4)|318/384 (82.8)|
|Abnormal|234/416 (56.3)|173/416 (41.6)|
|Session 2 reader assessment|||
|Normal|383/427 (89.7)|334/402 (83.1)|
|Abnormal|202/373 (54.2)|157/398 (39.4)|
|Reason why report was not acceptable<sup>a</sup>|||
|False-positive|||
|No. of findings|67|70|
|No. clinically significant|64|43|
|False-negative|||
|No. of findings|126|175|
|No. clinically significant|122|143|
|Incorrect number or location|||
|No. of findings|48|39|
|No. clinically significant|43|30|
|Hallucinations (no.)|5|61|

Note—Unless otherwise indicated, data are numerator and denominator with percentage in parentheses. AI = artificial intelligence. aMultiple reasons could be provided for a single report. 

reliable reports. In the current study, the two radiologists were willing to accept considerably lower percentages of abnormal reports related to a range of clinically significant errors and hallucinations. In addition, neither reader showed an improvement in localization performance using the AI-generated reports, and one reader showed significantly worse confidence. These issues limit the current model’s trustworthiness among users and challenge clinical adoption. Continued improvements in model performance will ultimately be critical to address these barriers and support potential application in screening programs. 

This study had limitations. First, the study was conducted retrospectively. Second, the AI tool was tested using radiographs from two specific clinical datasets. The findings may not be generalizable to settings with different patient demographics or other imaging conditions. Third, the reference standard was derived on the basis of radiologist review of the radiographs; a reference standard independent of the radiographs was not available. Fourth, we did not distinguish between active tuberculosis and chronic sequelae, nor did we stratify performance among tuberculosis manifestations including pleurisy or fibrocavitary disease. Fifth, the frequency of hallucinations was markedly different between the two readers. Sixth, localization was performed 

in terms of only laterality; further lobar or zone-level localization was not performed due to the potential for abnormalities to extend across multiple regions and inconsistencies in assigning radiographic abnormalities to individual regions. Seventh, the study did not evaluate whether mentions in the AI-generated reports of individual imaging abnormalities were correct. Eighth, a single radiologist classified the AI-generated reports as positive or negative. Ninth, each radiograph was processed a single time by the AI model, although generative AI technologies are known to provide different outputs when analyzing the same input on multiple occasions. Finally, the AI-generated reports were classified as positive for tuberculosis if they mentioned findings recognized to be associated with tuberculosis; however, such classifications as positive did not require that reports explicitly state that detected abnormalities were due to tuberculosis. Thus, it remains uncertain how well the model can differentiate whether abnormalities are due specifically to tuberculosis versus other lung conditions; a previously described AI tool showed suboptimal differentiation in this regard [25]. 

In conclusion, a multimodal generative AI model was used to create radiology reports for chest radiographs obtained for tuberculosis screening. Although the stand-alone AI model had lower accuracy than two radiologists, concurrent use of the model during radiograph interpretation improved the accuracy of one of the two radiologists. Although the tool could have potential application to aid tuberculosis screening programs in medically underserved regions, further technical improvement is required. 

**Provenance and review:** Not solicited; externally peer reviewed. 

**Peer reviewers:** Yinsu Zhu, The First Affiliated Hospital of Nanjing Medical University; Mizuho Nishio, Institute of Biomedical Research and Innovation Clinical PET Center; additional individual(s) who chose not to disclose their identity. 

**CME:** ARRS is accredited by the Accreditation Council for Continuing Medical Education (ACCME) to provide continuing medical education activities for physicians. The ARRS designates this journal-based CME activity for a maximum of 1.00 AMA PRA Category 1 Credit™. Physicians should claim only the credit commensurate with the extent of their participation in the activity. 

### **References** 

1. Bagcchi S. WHO’s global tuberculosis report 2022. _Lancet Microbe_ 2023; 4:e20 

2. [No authors listed]. _WHO operational handbook on tuberculosis. Module 2. Screening: systematic screening for tuberculosis disease_ . WHO, 2022 

3. den Boon S, White NW, van Lill SWP, et al. An evaluation of symptom and chest radiographic screening in tuberculosis prevalence surveys. _Int J Tuberc Lung Dis_ 2006; 10:876–882 

4. van’t Hoog AH, Meme HK, Laserson KF, et al. Screening strategies for tuberculosis prevalence surveys: the value of chest radiography and symptoms. _Plos One_ 2012; 7:e38691 

5. Melendez J, Sánchez CI, Philipsen RHHM, et al. An automated tuberculosis screening strategy combining X-ray-based computer-aided detection and clinical information. _Sci Rep_ 2016; 6:25265 

6. van’t Hoog AH, Meme HK, van Deutekom H, et al. High sensitivity of chest radiograph reading by clinical officers in a tuberculosis prevalence survey. _Int J Tuberc Lung Dis_ 2011; 15:1308–1314 

7. Kim Y, Park JY, Hwang EJ, Lee SM, Park CM. Applications of artificial intelligence in the thorax: a narrative review focusing on thoracic radiology. _J Thorac Dis_ 2021; 13:6943–6962 

8. Hwang EJ, Jeong WG, David PM, Arentz M, Ruhwald M, Yoon SH. AI for detection of tuberculosis: implications for global health. _Radiol Artif Intell_ 

_www.ajronline.org_ | **8** 

AJR:225, October 2025 

##### **Generative AI for Radiographs in Tuberculosis Screening** 

2024; 6:e230327 

9. Gefter WB, Prokop M, Seo JB, Raoof S, Langlotz CP, Hatabu H. Human-AI symbiosis: a path forward to improve chest radiography and the role of radiologists in patient care. _Radiology_ 2024; 310:e232778 

10. [No authors listed]. _High priority target product profiles for new tuberculosis diagnostics: report of a consensus meeting_ , _28–29 April 2014_ , _Geneva_ , _Switzerland_ . WHO, 2014 

11. Meskó B, Topol EJ. The imperative for regulatory oversight of large language models (or generative AI) in healthcare. _NPJ Digit Med_ 2023; 6:120 

12. Tu T, Azizi S, Driess D, et al. Towards generalist biomedical AI. _NEJM AI_ 2024; 1 

13. Chen Z, Song Y, Chang TH, Wan X. Generating radiology reports via memory-driven transformer. arXiv website. arxiv.org/abs/2010.16056. Published Oct 30, 2020. Revised Apr 28, 2022. Accessed Nov 1, 2023 

14. Park J, Kim S, Yoon B, Hyun J, Choi K. M4CXR Exploring multi-task potentials of multi-modal large language models for chest x-ray interpretation. arXiv website. arxiv.org/abs/2408.16213. Published Aug 29, 2024. Accessed Sep 10, 2024 

15. Hong EK, Ham J, Roh B, et al. Diagnostic accuracy and clinical value of a domain-specific multimodal generative AI model for chest radiograph report generation. _Radiology_ 2025; 314:e241476 

16. Jaeger S, Candemir S, Antani S, Wáng YXJ, Lu PX, Thoma G. Two public chest X-ray datasets for computer-aided screening of pulmonary diseases. _Quant Imaging Med Surg_ 2014; 4:475–477 

17. Staziaki PV, Santinha JA, Coelho MO, Angulo D, Hussain M, Folio LR. Gamification in radiology training module developed during the Society for Imaging Informatics in Medicine Annual Meeting Hackathon. _J Digit Imaging_ 2022; 35:714–722 

18. Yang F, Lu PX, Deng M, et al. Annotations of lung abnormalities in the 

Shenzhen chest X-ray dataset for computer-aided screening of pulmonary diseases. _Data (Basel)_ 2022; 7:95 

19. Hong EK. TB_AI_generated_reports. github.com/amyh0803/TB_AI_ generated_reports. Deposited Jun 10, 2024. Accessed Jun 10, 2024 

20. Plesner LL, Müller FC, Nybing JD, et al. Autonomous chest radiograph reporting using AI: estimation of clinical impact. _Radiology_ 2023; 307:e222268 

21. Huang J, Neill L, Wittbrodt M, et al. Generative artificial intelligence for chest radiograph interpretation in the emergency department. _JAMA Netw Open_ 2023; 6:e2336100 

22. Pande T, Cohen C, Pai M, Ahmad Khan F. Computer-aided detection of pulmonary tuberculosis on digital chest radiographs: a systematic review. _Int J Tuberc Lung Dis_ 2016; 20:1226–1230 

23. Lakhani P, Sundaram B. Deep learning at chest radiography: automated classification of pulmonary tuberculosis by using convolutional neural networks. _Radiology_ 2017; 284:574–582 

24. Hwang EJ, Park S, Jin KN, et al.; Deep Learning-Based Automatic Detection Algorithm Development and Evaluation Group. Development and validation of a deep learning–based automatic detection algorithm for active pulmonary tuberculosis on chest radiographs. _Clin Infect Dis_ 2019; 69:739– 747 

25. Soares TR, de Oliveira RD, Liu YE, et al. Evaluation of chest X-ray with automated interpretation algorithms for mass tuberculosis screening in prisons: a cross-sectional study. _Lancet Reg Health Am_ 2022; 17:100388 

26. Jaeger S, Karargyris A, Candemir S, et al. Automatic tuberculosis screening using chest radiographs. _IEEE Trans Med Imaging_ 2014; 33:233–245 

27. Candemir S, Jaeger S, Palaniappan K, et al. Lung segmentation in chest radiographs using anatomical atlases with nonrigid registration. _IEEE Trans Med Imaging_ 2014; 33:577–590 

_www.ajronline.org_ | **9** 

AJR:225, October 2025