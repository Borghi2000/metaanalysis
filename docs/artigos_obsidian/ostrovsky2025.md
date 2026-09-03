---
title: "Ostrovsky 2025 (2025) — Pneumonia vs Normal"
authors: "Ostrovsky 2025"
year: 2025
journal: "Am J Emerg Med"
doi: "10.1016/j.ajem.2025.03.060"
pmid: "93(2025)99-102"
pool: "main"
architecture: "VLM"
model_evaluated: "ChatGPT-4.0"
clinical_scenario: "Pneumonia vs Normal"
reference_standard: "Radiologists (on-site)"
n_total: 1400
tp: 141
fp: 77
fn: 44
tn: 1138
sensibilidade: 0.7622
especificidade: 0.9366
acuracia: 0.9136
quadas_overall: "Unclear"
quadas_selecao: "Low"
quadas_indice: "Unclear"
quadas_referencia: "Low"
quadas_fluxo: "Low"
tags:
  - artigo
  - pool/main
  - ano/2025
  - condicao/pneumonia
  - modelo/chatgpt
---

# Ostrovsky 2025 (2025)

> [!abstract] Ficha de Auditoria e Metadados Clínicos
> - **Título / Identificador:** `ostrovsky2025` | **Estudo:** [[ostrovsky2025]]
> - **Cenário Clínico:** Pneumonia vs Normal
> - **Modelo Avaliado:** **ChatGPT-4.0** (VLM)
> - **Padrão de Referência:** Radiologists (on-site)
> - **Amostra Total:** 1400 exames
> - **DOI:** [10.1016/j.ajem.2025.03.060](https://doi.org/10.1016/j.ajem.2025.03.060) | **PMID:** 93(2025)99-102
> - **Índice Geral:** [[_Indice_Artigos]] | **Base Master:** `data/master_audit.csv`

> [!info] Desempenho Diagnóstico & Matriz 2×2 (Pool Principal)
> - **Sensibilidade:** 76.2% | **Especificidade:** 93.7% | **Acurácia Bruta:** 91.4%
> - **Razão de Verossimilhança:** RV+ = 12.03 | RV- = 0.25 | DOR = 48.12
> 
> | Matriz 2×2 | Condição Presente (+) | Condição Ausente (-) | Total |
> | :--- | :---: | :---: | :---: |
> | **Teste Positivo (IA+)** | **VP:** 141 | **FP:** 77 | 218 |
> | **Teste Negativo (IA-)** | **FN:** 44 | **VN:** 1138 | 1182 |
> | **Total Real** | 185 | 1215 | **N:** 1400 |

> [!warning] Avaliação Metodológica QUADAS-2
> - **Risco de Viés Global:** **Unclear**
> - **Domínios de Viés:** Seleção: `Low` | Teste Índice: `Unclear` | Padrão Ref.: `Low` | Fluxo/Tempo: `Low`

---

## Conteúdo do Artigo Original

American Journal of Emergency Medicine 93 (2025) 99–102 

Contents lists available at ScienceDirect 

# American Journal of Emergency Medicine 

journal homepage: www.elsevier.com/locate/ajem 

## Evaluating a large language model's accuracy in chest X-ray interpretation for acute thoracic conditions 

### Adam M. Ostrovsky ⁎ 

Sidney Kimmel Medical College at Thomas Jefferson University, Philadelphia, PA, USA 

|a r t i c l e<br>i n f o|a b s t r a c t|
|---|---|
|Article history:<br>Received 10 March 2025<br>Received in revised form 26 March 2025<br>Accepted 26 March 2025<br>Keywords:<br>ChatGPT<br>Artificial intelligence<br>Radiology<br>Diagnosis|Background:The rapid advancement of artificial intelligence (AI) has great ability to impact healthcare. Chest<br>X-rays are essential for diagnosing acute thoracic conditions in the emergency department (ED), but interpreta-<br>tion delays due to radiologist availability can impact clinical decision-making. AI models, including deep learning<br>algorithms, have been explored for diagnostic support, but the potential of large language models (LLMs) in<br>emergency radiology remains largely unexamined.<br>Methods:This study assessed ChatGPT's feasibility in interpreting chest X-rays for acute thoracic conditions com-<br>monly encountered in the ED. A subset of 1400 images from the NIH Chest X-ray dataset was analyzed, represent-<br>ing seven pathology categories: Atelectasis, Effusion, Emphysema, Pneumothorax, Pneumonia, Mass, and No<br>Finding. ChatGPT 4.0, utilizing the“X-Ray Interpreter”add-on, was evaluated for its diagnostic performance<br>across these categories.<br>Results:ChatGPT demonstrated high performance in identifying normal chest X-rays, with a sensitivity of 98.9 %,<br>specificity of 93.9 %, and accuracy of 94.7 %. However, the model's performance varied across pathologies. The<br>best results were observed in diagnosing pneumonia (sensitivity 76.2 %, specificity 93.7 %) and pneumothorax<br>(sensitivity 77.4 %, specificity 89.1 %), while performance for atelectasis and emphysema was lower.<br>Conclusion:ChatGPT demonstrates potential as a supplementary tool for differentiating normal from abnormal<br>chest X-rays, with promising results for certain pathologies like pneumonia. However, its diagnostic accuracy<br>for more subtle conditions requires improvement. Further research integrating ChatGPT with specialized<br>image recognition models could enhance its performance, offering new possibilities in medical imaging and<br>education.<br>© 2025 The Author. Published by Elsevier Inc. This is an open access article under the CC BY license (http://<br>creativecommons.org/licenses/by/4.0/).|

#### 1. Introduction 

The rapid advancement of artificial intelligence (AI) has significantly impacted healthcare, particularly medical imaging [1-3]. Chest X-rays are among the most frequently ordered studies in emergency medicine, important for diagnosing conditions like pneumothorax, pneumonia, and pleural effusions. Delays in interpretation, often due to limited radiologist availability, can affect patient outcomes. Additionally, interpretation is expertise-dependent, time-consuming, and prone to human error, especially in high-volume or resourcelimited settings [4-6]. 

> ⁎ Corresponding author at: Sidney Kimmel Medical College, Thomas Jefferson University, 1025 Walnut St, Philadelphia, PA 19107, USA. E-mail address: Adam.ostrovsky@students.jefferson.edu (A.M. Ostrovsky). 

Deep learning-based AI models increasingly assist radiologists in image interpretation, detecting patterns that may be overlooked by humans. These models improve diagnostic accuracy and efficiency, with convolutional neural networks (CNNs) demonstrating nearexpert performance in medical image classification [7-9]. 

While deep learning dominates AI-driven image analysis, interest is growing in natural language processing (NLP) models like ChatGPT. Developed by OpenAI, ChatGPT is a Large Language Model (LLM) designed for text-based tasks such as summarization and questionanswering [10-12]. Its accessibility and ability to generate contextually relevant text suggest potential applications in medical imaging. However, few studies have examined its direct use for image analysis, as image upload capabilities are a relatively recent development. With this feature now publicly available, it is important to assess its potential for medical imaging applications. This study explores its potential as a supplementary diagnostic tool or educational adjunct in emergency medicine. 

https://doi.org/10.1016/j.ajem.2025.03.060 

0735-6757/© 2025 The Author. Published by Elsevier Inc. This is an open access article under the CC BY license (http://creativecommons.org/licenses/by/4.0/). 

A.M. Ostrovsky 

American Journal of Emergency Medicine 93 (2025) 99–102 

#### 2. Methods 

#### 3.1.2. Mediastinum 

- The heart size appears within normal limits (cardiothoracic ratio < 50 %). 

#### 2.1. Dataset 

- The trachea is midline, with no evidence of deviation. 

- The aortic arch appears smooth and normal in size. 

The NIH Chest X-ray dataset is a comprehensive public resource for studying thoracic pathologies, containing 112,120 frontal-view X-rays from 30,805 patients, each labeled with one or more conditions [13,14]. It is widely used for training and evaluating AI models in medical imaging. For this study, 1400 images were selected, with 200 from each of seven pathology categories: Atelectasis, Effusion, Emphysema, Pneumothorax, Pneumonia, Mass, and No Finding. Only images with a single pathology were included. The “No Finding” category served as a control, ensuring a balanced dataset for assessing ChatGPT's diagnostic performance across conditions. 

#### 2.2. ChatGPT model adaptation and evaluation metrics 

#### 3.1.3. Diaphragm 

- The hemidiaphragms are well-defined and appear at normal levels. 

- The right hemidiaphragm is slightly higher than the left, which is a normal finding due to the position of the liver. 

- No abnormal subdiaphragmatic air is noted. 

#### 3.1.4. Bony structures 

- The ribs, clavicles, and visible portions of the scapulae appear intact, with no evidence of fractures or lytic lesions. 

- The vertebral bodies are aligned with no obvious abnormalities. 

ChatGPT, a natural language processing model, was used in this study via the freely available ChatGPT 4.0 version [15]. The “X-Ray Interpreter” GPT add-on provided automated analysis of lung fields, mediastinum, diaphragm, bony structures, and soft tissues in uploaded chest X-rays. No patient history, including age or clinical background, was provided. X-rays were categorized as “normal” (no findings) or “abnormal” (pathology present). Diagnostic accuracy was assessed using sensitivity, specificity, accuracy, positive predictive value (PPV), and negative predictive value (NPV). Incorrect interpretations were classified as: (1) pathology misread as normal (“Abnormal → Normal”), (2) normal misread as pathology (“Normal → Abnormal”), or (3) incorrect pathology identification (“Abnormal → Abnormal”). Microsoft Excel v16.92 was used for statistical analysis. 

#### 3. Results 

The performance of ChatGPT in diagnosing the seven thoracic pathologies is summarized in Table 1. 

#### 3.1. No finding 

The “No Finding” category, representing normal chest X-rays, had the highest performance metrics. ChatGPT achieved a sensitivity of 98.9 %, specificity of 93.9 %, and accuracy of 94.7 %. A sample ChatGPT output for a “no finding” X-ray is shown below: 

This is a chest X-ray in a posteroanterior (PA) view, which provides a clear overview of the thoracic structures. Here's an analysis of the visible findings for educational purposes: 

#### 3.1.1. Lung fields 

- The lung fields appear well-aerated, with no obvious consolidation, mass, or cavitation noted. 

- No visible pleural effusion or pneumothorax. 

- The pulmonary vascular markings are symmetric and not prominent, suggesting no overt signs of pulmonary congestion. 

#### 3.1.5. Soft tissues 

- The soft tissues of the chest wall appear unremarkable with no visible abnormalities. 

#### 3.1.6. Summary 

This appears to be a normal chest X-ray with no overt pathological findings. It demonstrates well-aerated lungs, normal mediastinal structures, and intact bony anatomy. However, further correlation with clinical symptoms or history may be necessary for a comprehensive assessment. 

#### 3.2. Abnormal findings 

ChatGPT's performance varied across pathologies. Sensitivity and specificity were 44.4 % and 89.1 % for atelectasis, 75.2 % and 88.8 % for effusion, and 44.2 % and 90.3 % for emphysema. Pneumothorax detection was better, with 77.4 % sensitivity, 89.1 % specificity, and 87.8 % accuracy. Pneumonia had the highest pathology accuracy (91.0 %), with 76.2 % sensitivity, and 93.7 % specificity, making it the best-performing pathology category. Mass detection was moderate, with 73.0 % sensitivity, 88.2 % specificity, and 86.7 % accuracy. 

#### 4. Discussion 

AI systems, particularly convolutional neural networks (CNNs), are used by radiologists to assist in reading medical images like X-rays, CT scans, and MRIs. CNNs excel at recognizing patterns and anomalies in images, improving diagnostic accuracy. They process grid-like data, learning spatial hierarchies of features from simple to complex structures. Trained on extensive labeled datasets, CNNs can analyze new images, detecting abnormalities and providing heatmaps or probability scores to support radiologists [16]. In contrast, Large Language Models like GPT-4 are primarily designed for processing and generating human language rather than images. While LLMs excel at text-related 

Table 1 

Diagnostic Performance of ChatGPT Across Seven Chest X-Ray Image Categories. 

|Image<br>|Total Correct|Total Incorrect|||Sensitivity|Specificity|Accuracy|PPV|NPV|
|---|---|---|---|---|---|---|---|---|---|
|Category||Abnormal➔<br>Normal|Normal➔<br>Abnormal|Incorrect➔<br>Incorrect||||||
|No Finding|185|2|12|1|0.989|0.939|0.947|0.749|0.998|
|Atelectasis|59|74|0|67|0.444|0.891|0.842|0.337|0.928|
|Effusion|97|32|0|71|0.752|0.888|0.873|0.447|0.967|
|Emphysema|65|82|0|53|0.442|0.903|0.847|0.389|0.921|
|Pneumothorax|103|30|3|64|0.774|0.891|0.878|0.470|0.969|
|Pneumonia|141|44|5|10|0.762|0.937|0.910|0.688|0.956|
|Mass|89|33|0|78|0.730|0.882|0.867|0.412|0.967|

100 

American Journal of Emergency Medicine 93 (2025) 99–102 

##### A.M. Ostrovsky 

tasks like generation, summarization, and translation, CNNs specialize in image classification, segmentation, and detection. LLMs are not inherently suited for reading medical images because they are not designed to process pixel data or understand spatial relationships and visual patterns, areas where CNNs excel. However, LLMs can complement image analysis by assisting in generating reports, interpreting findings in context, or providing decision support based on textual data. 

While ChatGPT is an LLM, it can “read” X-ray images using computer vision models that are integrated within the system. These models analyze the image to identify objects, patterns, text, and other visual elements. Broadly, the system extracts key features from the image using advanced machine learning techniques, including object recognition, text extraction (if the image contains text), and scene understanding. Based on the analyzed features, ChatGPT creates a natural language description of the image, summarizing its content in a clear and concise way. Once the description is generated, ChatGPT uses its language capabilities to present it to the reader. 

This functionality relies on specialized models for visual processing, like those trained for optical character recognition (OCR) for text or convolutional neural networks for image analysis, complementing ChatGPT's language understanding. Despite this potential, there are significant limitations and challenges to using LLMs for X-ray interpretation. Traditional LLMs are not purpose-built for “vision” tasks, as they lack the architecture needed to process grid-like pixel data and identify spatial and hierarchical patterns, which are necessary for image analysis. Additionally, the integration of LLMs with vision models must ensure high accuracy to avoid risks including misdiagnosis or missed findings. Furthermore, the hallucination problem—where LLMs generate plausible but incorrect information—is a serious concern in medical applications [17-19]. Ethical and regulatory challenges, such as compliance with privacy standards like HIPAA and addressing bias in training data, add further complexity [20,21]. Currently, LLMs can support radiology workflows by summarizing findings from image-processing systems and assisting in creating structured radiology reports [22]. Multi-modal models are at the forefront of research, aiming to combine vision and language capabilities to enhance diagnostic workflows. 

This study highlights both the potential and limitations of using ChatGPT for diagnosing thoracic pathologies from chest X-rays. The model's high accuracy in identifying cases with no findings suggests a potential usefulness in medical education, where real-time feedback is often limited or behind paywalls. Previous studies have examined ChatGPT in the education space, ranging from performance on USMLE examinations to the diagnostic radiology in-training examination [1,23]. Consistent with this study, Hayden et al. found that the chatbot demonstrated deficits in interpreting radiologic images compared to text-based prompts, with an accuracy of 81.5 % on text-only questions versus 47.8 % for image-based questions. In a systematic review of ChatGPT performance in radiology by Keshavatz et al., while the authors agree that ChatGPT is currently limited in providing reliable diagnostic results, several included publications cited attaining “modestly reliable results” with the LLM and highlighted the potential of the tool to support radiologists, especially in circumstances involving a radiologist shortage [24,25], or for common chief complaints [26]. Analyzing ChatGPT performance on radiology board-style questions, Bhayana, Krishna, and Bleakney, demonstrated a 69 % correct response rate to questions from examinations by the Canadian Royal College and American Board of Radiology, achieving a near-passing score [27]. They highlighted the need for further studies in order to track ChatGPT results to questions over time, given that trainees may soon find themselves keen to turn to the LLM to help them obtain quick answers to questions. They warn, however, that ChatGPT's ability to provide confident wrong answers to questions currently limits its ability to be incorporated into medical education. A limitation of a majority of these studies is the lack of questions with images, given the inability of ChatGPT to process them at that time. Their cautions of ChatGPT's fallibility, however, prove to be warranted and are expanded upon in this 

publication, which demonstrates an even lower accuracy for correctly classifying simple radiologic images. Further doubt is cast on the ability of ChatGPT to reliably answer radiology questions by Wagner and ErtlWagner, who found that in addition to GPT only being able to answer 59 out of 88 (67 %) radiology questions correctly, only 47 of the accompanying 343 provided references proved relevant, and 219 were fabricated [28]. 

While ChatGPT might be useful for differentiating between images with “no findings” and those with active pathologies, this study also reveals significant challenges in using the chatbot to obtain a specific diagnosis—particularly between conditions with more subtle or overlapping imaging features. This limitation is critical in both educational and clinical settings, where missed diagnoses can have serious implications for patient outcomes. Notably, ChatGPT's performance in identifying pneumonia was the strongest among all the pathologies studied, which may be due to the more distinct imaging features associated with this condition. 

In the context of AI applications in medical imaging, CheXNet—a deep learning model developed and described by Rajpurkar et al. (2017)—has demonstrated radiologist-level performance in detecting pneumonia from chest X-rays [29]. Trained on the same NIH chest x- ray dataset used for this analysis, CheXNet utilizes a 121-layer convolutional neural network to analyze images and identify pneumonia with high accuracy. This success underscores the potential of integrating advanced AI models into diagnostic workflows, paving the way for exploring large language models like ChatGPT in interpreting medical imaging data. 

The study suggests that ChatGPT's diagnostic accuracy could improve through further development and integration with specialized image models. Fine-tuning it with larger, more diverse datasets may enhance its ability to detect subtle abnormalities and reduce false negatives. A key limitation of this study is the lack of direct comparison between ChatGPT's performance and that of board-certified radiologists. While our findings demonstrate the model's variable diagnostic accuracy, a meaningful benchmark would involve a head-to-head comparison against human experts interpreting the same dataset. Future studies should aim to establish this standard by evaluating ChatGPT's performance relative to radiologists across different levels of experience, as well as against established AI-based radiology tools, such as convolutional neural networks (CNNs). A previous study comparing the performance of the CheXNet convolutional neural network (CNN) to practicing radiologists using the same NIH dataset demonstrated that the algorithm performed on par with radiologists for ten pathologies, outperformed them in one, and performed less effectively in three [30]. 

Additionally, any incremental advancements in large language models for medical imaging will necessitate regulatory oversight under the framework of Software as a Medical Device (SAMD). Given that AI-driven diagnostic tools have the potential to influence clinical decision-making, regulatory bodies such as the U.S. Food and Drug Administration (FDA) and the European Medicines Agency (EMA) play a critical role in evaluating their safety, efficacy, and reliability before widespread implementation. Unlike traditional AI models designed explicitly for medical imaging, ChatGPT and similar LLMs were not originally developed for diagnostic purposes, raising important questions about their classification, validation, and approval pathways. Future iterations of these models, particularly those integrated with visionbased AI systems, will likely require rigorous trials and regulatory review before they can be adopted in real-world clinical settings. Understanding these regulatory hurdles will be essential for ensuring the safe and effective use of LLMs in radiology and beyond. Future research could integrate advanced models like DenseNet or ResNet to complement ChatGPT's language capabilities, improving diagnostic accuracy. Additionally, feedback from board-certified radiologists on ChatGPT's performance and comparing its results with those of medical professionals and other LLMs could provide valuable insights into its potential and progress. 

101 

A.M. Ostrovsky 

American Journal of Emergency Medicine 93 (2025) 99–102 

#### 5. Conclusion 

This study evaluates ChatGPT's potential as a diagnostic tool for chest X-rays in the ED. While it identifies normal cases well, its limitations in detecting critical pathologies highlight the need for further development. In medical education, ChatGPT could help students with limited access to real-time feedback distinguish normal from abnormal findings. Future research should explore combining ChatGPT with other AI models to improve accuracy in high-stakes ED settings. As AI advances, models like ChatGPT could enhance rapid triage, decision support, and educational workflows. 

#### CRediT authorship contribution statement 

Adam M. Ostrovsky: Writing – review & editing, Writing – original draft, Validation, Methodology, Investigation, Formal analysis, Conceptualization. 

#### Declaration of competing interest 

The authors declare that they have no known competing financial interests or personal relationships that could have appeared to influence the work reported in this paper. No funding was received for this work. 

#### Data availability 

The data presented in this study are openly available at https://nihcc. app.box.com/v/ChestXray-NIHCC. 

#### References 

- [1] Kung TH, Cheatham M, Medenilla A, Sillos C, De Leon L, Elepaño C, et al. Performance of ChatGPT on USMLE: potential for AI-assisted medical education using large language models. PLoS Digit Health. 2023;2(2):e0000198. https://doi.org/10.1371/journal.pdig.0000198. PMID: 36812645; PMCID: PMC9931230. 

- [2] Ostrovsky A, Chen J, Shah V, Abai B. Performance of 5 Prominent Large Language Models in Surgical Knowledge Evaluation: A Comparative Analysis [Internet]. Elsevier; 2024. [cited 2024 Dec 25]. Available from: https://www.sciencedirect. com/science/article/pii/S2949761224000579. 

- [3] Xu T, Weng H, Liu F, Yang L, Luo Y, Ding Z, et al. Current status of ChatGPT use in medical education: potentials, challenges, and strategies. J Med Internet Res. 2024; 28(26):e57896. https://doi.org/10.2196/57896. PMID: 39196640; PMCID: PMC11391159. 

- [4] Gefter WB, Hatabu H. Reducing errors resulting from commonly missed chest radiography findings. Chest. 2023;163(3):634–49. https://doi.org/10.1016/j.chest.2022. 12.003. Epub 2022 Dec 10. PMID: 36513187. 

- [5] Wynn RM, Howe JL, Kelahan LC, Fong A, Filice RW, Ratwani RM. The impact of interruptions on chest radiograph interpretation: effects on reading time and accuracy. Acad Radiol. 2018;25(12):1515–20. https://doi.org/10.1016/j.acra.2018.03.016. Epub 2018 Mar 28. PMID: 29605562. 

- [6] Brady A, Laoide RÓ, McCarthy P, McDermott R. Discrepancy and error in radiology: concepts, causes and consequences. Ulster Med J. 2012;81(1):3–9. [PMID: 23536732; PMCID: PMC3609674]. 

- [7] Najjar R. Redefining radiology: a review of artificial intelligence integration in medical imaging. Diagnostics (Basel). 2023;13(17):2760. https://doi.org/10.3390/diagnostics13172760. PMID: 37685300; PMCID: PMC10487271. 

- [8] Mutasa S, Sun S, Ha R. Understanding artificial intelligence based radiology studies: CNN architecture. Clin Imaging. 2021;80:72–6. https://doi.org/10.1016/j.clinimag. 2021.06.033. Epub 2021 Jul 7. PMID: 34256218. 

- [9] Yadav SS, Jadhav SM. Deep convolutional neural network based medical image classification for disease diagnosis. J Big Data. 2019;6:113. https://doi.org/10.1186/ s40537-019-0276-2. 

1038/s41586-023-06291-2. Epub 2023 Jul 12. Erratum in: Nature. 2023 Aug;620 (7973):E19. https://doi.org/10.1038/s41586-023-06455-0. PMID: 37438534; PMCID: PMC10396962. 

   - [11] Omiye JA, Gui H, Rezaei SJ, Zou J, Daneshjou R. Large language models in medicine: the potentials and pitfalls: a narrative review. Ann Intern Med. 2024;177(2):210–20. https://doi.org/10.7326/M23-2772. Epub 2024 Jan 30. PMID: 38285984. 

   - [12] Devnath L, Fan Z, Luo S, Summons P, Wang D. Detection and visualisation of pneumoconiosis using an ensemble of multi-dimensional deep features learned from chest X-rays. Int J Environ Res Public Health. 2022;19(18):11193. https://doi.org/ 10.3390/ijerph191811193. PMID: 36141457; PMCID: PMC9517617. 

   - [13] Wang Xiaosong, Peng Yifan, Le Lu, Zhiyong Lu, Bagheri Mohammadhadi, Summers Ronald. ChestX-ray8: hospital-scale chest X-ray database and benchmarks on weakly-supervised classification and localization of common thorax diseases. IEEE CVPR. 2017:3462–71. 

   - [14] NIH Chest X-Ray Dataset Cloud Healthcare API Google Cloud [Internet]. Google; 2017. [cited 2024 Dec 25]. Available from: https://cloud.google.com/healthcareapi/docs/resources/public-datasets/nih-chest. 

   - [15] OpenAI. ChatGPT (Oct 10 Version) [Large Language Model]. https://chat.openai.com/ chat; 2024. 

   - [16] Yamashita R, Nishio M, Do RKG, Togashi K. Convolutional neural networks: an overview and application in radiology. Insights Imaging. 2018;9(4):611–29. https://doi. org/10.1007/s13244-018-0639-9. [Epub 2018 Jun 22. PMID: 29934920; PMCID: PMC6108980]. 

   - [17] Walters WH, Wilder EI. Fabrication and errors in the bibliographic citations generated by ChatGPT. Sci Rep. 2023;13(1):14045. https://doi.org/10.1038/s41598-02341032-5. PMID: 37679503; PMCID: PMC10484980. 

   - [18] Alkaissi H, McFarlane SI. Artificial hallucinations in ChatGPT: implications in scientific writing. Cureus. 2023;15(2):e35179. https://doi.org/10.7759/cureus.35179. PMID: 36811129; PMCID: PMC9939079. 

   - [19] Chelli M, Descamps J, Lavoué V, Trojani C, Azar M, Deckert M, et al. Hallucination rates and reference accuracy of ChatGPT and bard for systematic reviews: comparative analysis. J Med Internet Res. 2024;26:e53164. https://doi.org/10.2196/53164. PMID: 38776130; PMCID: PMC11153973. 

   - [20] Li J. Security implications of AI Chatbots in health care. J Med Internet Res. 2023;25: e47551. https://doi.org/10.2196/47551. PMID: 38015597; PMCID: PMC10716748. 

   - [21] Rezaeikhonakdar D. AI Chatbots and challenges of HIPAA compliance for AI developers and vendors. J Law Med Ethics. 2023;51(4):988–95. https://doi.org/10.1017/ jme.2024.15. [Epub 2024 Mar 13. PMID: 38477276; PMCID: PMC10937180]. 

   - [22] Mello-Thoms C, Mello CAB. Clinical applications of artificial intelligence in radiology. Br J Radiol. 2023;96(1150):20221031. https://doi.org/10.1259/bjr.20221031. [Epub 2023 Apr 26. PMID: 37099398; PMCID: PMC10546456]. 

   - [23] Hayden N, Gilbert S, Poisson LM, Griffith B, Klochko C. Performance of GPT-4 with vision on text- and image-based ACR diagnostic radiology in-training examination questions. Radiology. 2024;312(3):e240153. https://doi.org/10.1148/radiol.240153. [PMID: 39225605]. 

   - [24] Keshavarz P, Bagherieh S, Nabipoorashrafi SA, Chalian H, Rahsepar AA, Kim GHJ, et al. ChatGPT in radiology: a systematic review of performance, pitfalls, and future perspectives. Diagn Interv Imaging. 2024;105(7–8):251–65. https://doi.org/10. 1016/j.diii.2024.04.003. [Epub 2024 Apr 27. PMID: 38679540]. 

   - [25] Ueda D, Mitsuyama Y, Takita H, Horiuchi D, Walston SL, Tatekawa H, et al. Chatgpt’s diagnostic performance from patient history and imaging findings on the diagnosis please quizzes. Radiology. 2023;308(1):e231040. https://doi.org/10.1148/radiol. 231040. [PMID: 37462501]. 

   - [26] Hirosawa T, Harada Y, Yokose M, Sakamoto T, Kawamura R, Shimizu T. Diagnostic accuracy of differential-diagnosis lists generated by generative Pretrained transformer 3 Chatbot for clinical vignettes with common chief complaints: a pilot study. Int J Environ Res Public Health. 2023;20(4):3378. https://doi.org/10.3390/ ijerph20043378. PMID: 36834073; PMCID: PMC9967747. 

   - [27] Bhayana R, Krishna S, Bleakney RR. Performance of ChatGPT on a radiology boardstyle examination: insights into current strengths and limitations. Radiology. 2023;307(5):e230582. https://doi.org/10.1148/radiol.230582. Epub 2023 May 16. PMID: 37191485. 

   - [28] Wagner MW, Ertl-Wagner BB. Accuracy of information and references using ChatGPT-3 for retrieval of clinical radiological information. Can Assoc Radiol J. 2024;75(1):69–73. https://doi.org/10.1177/08465371231171125. Epub 2023 Apr 20. PMID: 37078489. 

   - [29] Rajpurkar P. CheXNet: radiologist-level pneumonia detection on chest X-rays with deep learning. ArXiv abs/1711. 2017;5225. 

   - [30] Rajpurkar P, Irvin J, Ball RL, et al. Deep learning for chest radiograph diagnosis: a retrospective comparison of the CheXNeXt algorithm to practicing radiologists. PLoS Med. 2018;15(11):e1002686. Published 2018 Nov 20. https://doi.org/10.1371/ journal.pmed.1002686. 

- [10] Singhal K, Azizi S, Tu T, Mahdavi SS, Wei J, Chung HW, et al. Large language models encode clinical knowledge. Nature. 2023;620(7972):172–80. https://doi.org/10. 

102