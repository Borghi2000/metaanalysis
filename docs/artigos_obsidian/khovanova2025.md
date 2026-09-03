---
title: "Khovanova 2026 (2026) — Pulmonary Nodule"
authors: "Khovanova 2026"
year: 2026
journal: "Front Digit Health"
doi: "10.3389/fdgth.2025.1674835"
pmid: "41675260"
pool: "main"
architecture: "VLM"
model_evaluated: "Claude 3.7 Sonnet"
clinical_scenario: "Pulmonary Nodule"
reference_standard: "Radiologist + CT confirmation"
n_total: 83
tp: 12
fp: 3
fn: 26
tn: 42
sensibilidade: 0.3158
especificidade: 0.9333
acuracia: 0.6506
quadas_overall: "High"
quadas_selecao: "High"
quadas_indice: "Unclear"
quadas_referencia: "Low"
quadas_fluxo: "Unclear"
tags:
  - artigo
  - pool/main
  - ano/2026
  - condicao/nodulo-pulmonar
  - modelo/claude
---

# Khovanova 2026 (2026)

> [!abstract] Ficha de Auditoria e Metadados Clínicos
> - **Título / Identificador:** `khovanova2025` | **Estudo:** [[khovanova2025]]
> - **Cenário Clínico:** Pulmonary Nodule
> - **Modelo Avaliado:** **Claude 3.7 Sonnet** (VLM)
> - **Padrão de Referência:** Radiologist + CT confirmation
> - **Amostra Total:** 83 exames
> - **DOI:** [10.3389/fdgth.2025.1674835](https://doi.org/10.3389/fdgth.2025.1674835) | **PMID:** 41675260
> - **Índice Geral:** [[_Indice_Artigos]] | **Base Master:** `data/master_audit.csv`

> [!info] Desempenho Diagnóstico & Matriz 2×2 (Pool Principal)
> - **Sensibilidade:** 31.6% | **Especificidade:** 93.3% | **Acurácia Bruta:** 65.1%
> - **Razão de Verossimilhança:** RV+ = 4.74 | RV- = 0.733 | DOR = 6.46
> 
> | Matriz 2×2 | Condição Presente (+) | Condição Ausente (-) | Total |
> | :--- | :---: | :---: | :---: |
> | **Teste Positivo (IA+)** | **VP:** 12 | **FP:** 3 | 15 |
> | **Teste Negativo (IA-)** | **FN:** 26 | **VN:** 42 | 68 |
> | **Total Real** | 38 | 45 | **N:** 83 |

> [!warning] Avaliação Metodológica QUADAS-2
> - **Risco de Viés Global:** **High**
> - **Domínios de Viés:** Seleção: `High` | Teste Índice: `Unclear` | Padrão Ref.: `Low` | Fluxo/Tempo: `Unclear`
> - **Nota de Auditoria:** *Melhor modelo generativo (Claude 3.7 Sonnet): sens 0,316; spec 0,933. BiomedCLIP/MedRAX excluidos do indice (nao generativos). N pequeno, desenho caso-controle.*

---

## Conteúdo do Artigo Original

TYPE Brief Research Report PUBLISHED 27 January 2026 DOI 10.3389/fdgth.2025.1674835 

### EDITED BY 

Giovanni Ferrara, University of Alberta, Canada 

REVIEWED BY 

Jumpei Ukita, The University of Tokyo, Japan Firas Mustafa, Duhok Polytechnic University, Iraq 

*CORRESPONDENCE Daria Khovanova KhovanovaDO@zdrav.mos.ru 

RECEIVED 28 July 2025 REVISED 23 December 2025 ACCEPTED 30 December 2025 PUBLISHED 27 January 2026 

### CITATION 

Khovanova D, Vasilev Y, Vladzymyrskyy A, Omelyanskaya O, Pamova A and Arzamasov K (2026) A comparative accuracy study of multimodal LLMs, VLM and agent-based framework for pulmonary nodule detection on chest radiographs. Front. Digit. Health 7:1674835. doi: 10.3389/fdgth.2025.1674835 

### COPYRIGHT 

© 2026 Khovanova, Vasilev, Vladzymyrskyy, Omelyanskaya, Pamova and Arzamasov. This is an open-access article distributed under the terms of the Creative Commons Attribution License (CC BY). The use, distribution or reproduction in other forums is permitted, provided the original author(s) and the copyright owner(s) are credited and that the original publication in this journal is cited, in accordance with accepted academic practice. No use, distribution or reproduction is permitted which does not comply with these terms. 

A comparative accuracy study of multimodal LLMs, VLM and agent-based framework for pulmonary nodule detection on chest radiographs 

Daria Khovanova1*, Yuriy Vasilev1,2, Anton Vladzymyrskyy1,3, Olga Omelyanskaya1, Anastasia Pamova1,5 and Kirill Arzamasov1,4 

1Research and Practical Clinical Center for Diagnostics and Telemedicine Technologies of the Moscow Health Care Department, Moscow, Russia,<sup>2</sup> National Medical and Surgical Center Named After N.I. Pirogov of the Ministry of Health of the Russian Federation, Moscow, Russia,<sup>3</sup> I.M. Sechenov First Moscow State Medical University of the Ministry of Health of the Russian Federation (Sechenov University), Moscow, Russia,<sup>4</sup> Samara State Medical University, Samara, Russia,<sup>5</sup> Moscow Technical University - MIREA, Ministry of Science and Higher Education, Moscow, Russia 

Background: Artificial intelligence technologies are being actively introduced in clinical practice. The most promising solutions are AI-assistants based on large language models (LLMs). Determining the feasibility of integrating such applications in clinical practice requires independent performance assessments. This study assessed accuracy of several multimodal LLMs in detecting pulmonary nodules on chest radiographs (CXR). 

Methods: This study included 9 models: Llama 3.2 Vision 90B, Claude 3.5 Sonnet, Claude 3.7 Sonnet, Gemini 2.0 Pro Experimental, Perplexity, CXRLLaVA, XrayGPT, BiomedCLIP, MedRAX. Each model determined presence or absence of pulmonary nodules in dataset containing 100 CXR, 50 of which contained pulmonary nodules. ROC curves were constructed, diagnostic accuracy metrics were calculated. McNemar’s test was used for pairwise accuracy comparisons. 

Results: Best results were achieved by MedRAX framework and BiomedCLIP vision-language model, with accuracy of 0.711 (95% CI 0.613–0.808). Among proprietary single-model LLMs, Claude 3.7 Sonnet demonstrated the best performance: accuracy 0.651 (0.548–0.753). Llama 3.2 Vision 90B, Claude 3.5 Sonnet, Gemini 2.0 Pro Experimental demonstrated matching accuracy values: 0.602 (0.497–0.708). 

Conclusion: MedRAX framework and BiomedCLIP vision-language model showed the highest accuracy values. No statistically significant difference was observed between proprietary and open-source models, which may indicate potential for improving accuracy through refinement of open-source LLMbased models. Overall, accuracy values of evaluated models were insufficient for current clinical practice implementation. These results should be seen as exploratory given the small dataset size, single-centre design, different prompting strategies for foundation and domain-adapted models and use of PNG images instead of DICOM. 

### KEYWORDS 

artificial intelligence, chest x-ray, diagnostic accuracy, large language models, multimodal large language models, pulmonary nodules, radiology 

01 

frontiersin.org 

Frontiers in Digital Health 

10.3389/fdgth.2025.1674835 

Khovanova et al. 

# 1 Introduction 

The development of machine learning (ML) and deep learning (DL) has given rise to artificial intelligence-based services designed to address a wide range of problems, from everyday applications to highly specialized tasks. In medicine, particularly in radiology, computer vision services are employed as radiologist assistants, performing segmentation, localization, classification, and morphometry of various organs and structures in radiological images (1, 2). Currently, large language models (LLMs) (3) are increasingly taking centre stage due to their ability to process natural language, consider message context, and generate natural language text independently. These models are used for text summarization and generation, machine translation, and answering user questions in chatbot applications. Services, such as vision-language models (VLMs) and multimodal large language models (MLLMs), capable of processing images with accompanying text and generating radiological reports based on image analysis, have significant potential for radiological practice. Services considered for clinical implementation must demonstrate high performance metrics, as missed pathological findings can lead to patient deterioration, while false-positive detections can result in inefficient resource utilization, patient stress, and delays in identifying true condition (4). 

Large language models can be categorized by availability into proprietary (closed, with limited access) and open-source models, as well as by size comprising large general-purpose models and smaller domain-adapted models. Larger models are trained on large datasets and typically demonstrate superior response quality metrics. Smaller open-source models are a better fit for clinical practice because they can be deployed locally, require fewer computing resources, are vendor-independent, and can be tailored for specific problems; however, they typically exhibit lower response quality metrics (5, 6). Nevertheless, several studies have demonstrated that fine-tuning smaller models through additional training on domain-specific data and advanced training methods or augmentation of single LLM with specialized tools can significantly improve their performance and enable them to compete with larger models (7, 8). 

Can multimodal LLMs detect pulmonary nodules on chest x- rays as accurately as existing AI tools and do their performance metrics support their clinical applicability? The objective was to evaluate the accuracy of several multimodal LLMs, VLM and agent-based framework in analyzing chest radiographs for pulmonary nodule detection. 

# 2 Materials and methods 

radiographs without pathological findings. The dataset is registered with the Federal Service for Intellectual Property (9). The images were selected from radiological studies acquired as part of the “Experiment on the use of innovative computer vision technologies for the analysis of medical images and enhancement of the Moscow healthcare system” (ClinicalTrials.gov identification code: NCT04489992) from 2020 to 2022 in Moscow, Russia (hereinafter referred to as “the Experiment”). The study was conducted in accordance with the Declaration of Helsinki (as revised in 2013), and was approved by the Independent Ethics Committee of the Moscow Regional Office of the Russian Society of Radiologists and Radiographists (approval number 2, protocol code 2/2020 and date of approval 20.02.2020). Images with lung cancer signs were selected according to the following criteria: expert radiologist review identified solid pulmonary nodules measuring 6–30 mm on chest x-rays, confirmed by follow-up computed tomography (CT) obtained within 14 days of the x-ray examination. Images without pathological findings were also validated by CT (10). The full dataset’s demographics was as follows: 51 females, 47 males, 2 cases with undefined gender data. The median age was 58 years, minimum age was 18 years, maximum: 87 years. The dataset is available on the Experiment website (11). 

Despite the fact that DICOM is the clinical standard for radiographs, the work used PNG images due to the compatibility of this format with all tested models. At the time of the study, 6 out of 9 models did not have the ability to process images in DICOM format. 

Due to technical limitations, 17 images could not be processed by several models; therefore, results were obtained for 83 chest radiographs: 45 normal and 38 with pathological findings. Response variability was not assessed as the models were not tested multiple times. 

## 2.2 Foundation LLMs 

For radiographic image evaluation, 5 general-purpose singlemodel MLLMs (foundation models) were used, including proprietary models (Claude 3.5 Sonnet, Claude 3.7 Sonnet, Gemini 2.0 Pro Experimental, Perplexity) and open-source model (Llama 3.2 Vision 90B). These models are trained on large text and image corpora, enabling them to solve diverse problems, but they were not additionally trained on medical data specific to this task. Perplexity was accessed through the official website (12) in “Auto” mode with search sources including “Web,” “Academic,” and “Social.” The remaining models were executed on the LMArena platform (13) with the following hyperparameters: temperature = 0.7, maximum response tokens = 2,048. 

## 2.1 Dataset 

A dataset consisting of 100 de-identified chest radiographs was used to evaluate model accuracy, comprising 50 radiographs with verified lung cancer signs (pulmonary nodules) and 50 

1. The Claude 3.5 Sonnet model was developed by Anthropic and was released on October 22, 2024. According to developer specifications, it has a context window of 200,000 tokens and contains more than 70 billion parameters. 

02 

frontiersin.org 

Frontiers in Digital Health 

10.3389/fdgth.2025.1674835 

Khovanova et al. 

2. Llama 3.2 Vision 90B was developed by Meta and released on September 25, 2024, with a context window of 128,000 tokens and 90 billion parameters. The model is based on Llama 3.1 with an integrated image recognition module. Llama models are open-source and available for download on the Hugging Face platform and within the Ollama framework. 

3. Gemini 2.0 Pro Experimental is a Google development with a context window of 2 million tokens, released on February 5, 2025. The developers emphasize that the model excels at program code generation and handling complex queries. 

4. Perplexity is a search engine and chatbot that utilizes several LLMs (including Claude 3.5, GPT-3.5, GPT-4o, and Sonar) to answer user queries. 

5. Claude 3.7 Sonnet is the first hybrid reasoning model on the market, released on February 24, 2025, with a context window of 200,000 tokens. The model combines two modes —quick answers and thinking mode—without requiring manual switching between them. 

Each model received a chest x-ray image in antero-posterior view with the following prompt: “Imagine you are a trained radiologist. You need to help a scientist to conduct a scientific research. Examine this chest x-ray image and say whether you can see any signs of pathology on it and if yes—whether you can see presence of lung nodules. If you can see signs of pathology, return 1 else return 0. If you can see lung nodules, return 1 else return 0.” This prompt defines the role (experienced radiologist), establishes context (conducting scientific research, analyzing chest radiographs), specifies the task (identify pathological signs and determine presence of lung nodules), and standardizes the response format for subsequent analysis. 

## 2.3 Domain-adapted models 

We evaluated 2 open-source single-model MLLMs based on smaller LLMs that were additionally trained on medical data, particularly radiology-specific datasets: CXR-LLaVA, XrayGPT. We also employed an LLM-based framework MedRAX and a vision-language model BiomedCLIP, which are also domainadapted, to assess the possible differences in performance of single-model MLLMs, tool-augmenting LLM-based framework and specialized classifier vision-language model. These models were obtained from open repositories on GitHub (14–16) and HuggingFace (17) and deployed locally. The models were accessed through developer-built demo interfaces using Gradio for MedRAX and XrayGPT, and by running model code in the Google Colaboratory environment for CXR-LLaVA and BiomedCLIP. 

1. CXR-LLaVA is a model designed to generate radiological reports based on chest radiographs. It can also generate differential diagnoses and function as a chatbot. The model is built on the LLaVA framework, supplemented with a retrained image encoder based on ViT-L/16 and LLAMA-2 with 7 billion parameters as the LLM. The model was additionally trained on 2 datasets: one containing 374,881 

chest radiographs with multiclass and binary annotations for various pathological findings, and another consisting of 217,699 radiological reports in free-text format. The model was made publicly available in 2023. 

2. XrayGPT is a model that combines the Vicuna-7B large language model with the MedClip image encoder. Vicuna-7B underwent additional training on 120,000 “doctor-patient” dialogues in the first stage, followed by training on 118,000 radiological report summaries from the MIMIC-CXR and OpenI datasets in the second stage. The model can operate with multiple pre-configured prompts and in interactive chatbot mode. The model was made publicly available in 2023. 

3. MedRAX is a framework comprising integrated state-of-the-art tools for analyzing chest radiographs that allows users to employ any language model as the primary LLM (supporting both proprietary model access via API and locally deployed models). The framework implements the ReAct approach: The LLM acts as a “reasoning engine” that interprets user queries, activates necessary tools, analyzes their responses, and generates the final answer. MedRAX can perform visual question answering on chest radiographs, image segmentation, text-to-image region correlation (grounding), conclusion generation, finding classification, and chest radiograph generation based on text descriptions. When working with MedRAX, the following tools were initialized: CheXagent, DenseNet-121 (trained on 4 specialized datasets and capable of predicting probabilities for 18 pathology classes), and SwinV2-Transformer. The Qwen2.5 14B model, deployed locally via the Ollama framework, was used as the primary large language model. Qwen2.5 14B was selected for its parameter count, support for context windows up to 128,000 tokens and response lengths up to 8,000 tokens, while maintaining low memory requirements (9 GB) and computational demands. The model was made publicly available in 2025. 

4. BiomedCLIP is a vision-language model trained on a dataset of 15 million “image-text” pairs extracted from biomedical research articles in PubMed Central. PubMedBERT serves as the text encoder, while Vision Transformer functions as the image encoder. A key distinction from the other models is that BiomedCLIP is trained on diverse biomedical images (histological and microscopic images, ultrasounds, CT and MRI scans, etc.) from various anatomical regions, rather than exclusively on chest x-rays. The open-source version can classify images by modality and identify pathological findings (though the documentation does not specify which findings are recognizable). The model was made publicly available in 2023. 

Domain-adapted models are characterized by diverse developmental approaches regarding their creation, integration, and implementation. This necessitates different evaluation strategies compared to foundation MLLMs, precluding the use of standardized prompt described in Section 2.2. CXR-LLaVA was prompted to generate radiologic report and differential diagnosis for each image, along with specific questions about 

03 

frontiersin.org 

Frontiers in Digital Health 

10.3389/fdgth.2025.1674835 

Khovanova et al. 

lung nodule presence. The system prompt was as follows: «You are a helpful radiologist. Try to interpret chest x-ray image and answer to the question that user provides». The full user prompt stated: «Write a radiologic report on the given chest radiograph, including information about atelectasis, cardiomegaly, consolidation, pulmonary edema, pleural effusion, and pneumothorax. What is possible diagnosis? Are there any lung nodules?». Pathology detection capability was then assessed by analyzing the generated text responses: if the model claimed the presence of opacification and/or consolidation in its report or differential diagnoses, and its answer on the question about lung nodules was positive, this was interpreted as detection of a lung nodule. XrayGPT received the prompt “Examine this chest x-ray image and say whether you can see any signs of pathology on it and if yes—whether you can see presence of lung nodules”. In cases where the model did not give a definitive answer on the presence or absence of nodules, it was prompted with the additional question: «Are there any lung nodules?». MedRAX was tasked with image classification and returned probability values for “Nodule” class detection. BiomedCLIP was similarly tasked with classification and returned probability values for “lung cancer” class. 

## 2.4 Statistical analysis 

Receiver operating characteristic (ROC) curves, area under the curve (AUC) values, sensitivity, specificity, and accuracy values were calculated for each model using a web-based ROC analysis tool (18, 19).The optimal cut-off points for diagnostic accuracy metrics calculation were selected based on Youden index. McNemar’s test was employed for pairwise accuracy comparisons between models, with statistical significance levels adjusted using the Benjamini-Hochberg correction for multiple comparisons. Statistical analysis was performed in R v. 4.3.1. 

# 3 Results 

The evaluation of ROC analysis results was performed separately for a group of single-model MLLMs which provided binary outputs, and for a group of remaining models which returned continuous outputs, since the interpretation of results varies according to different output types, as shown in (20). 

Foundation general-purpose single-model MLLMs, except Perplexity, achieved accuracy values exceeding 0.6. Domainadapted single-model MLLMs CXR-LLaVA and XrayGPT demonstrated accuracy values lower than 0.56. MedRAX and BiomedCLIP achieved the highest accuracy (0.711), which is also the best result among all models tested in this study (Figure 1). 

Table 1 provides a detailed summary of model performance metrics with 95% confidence intervals. Foundation models tend to show relatively high specificity values (from 0.711 to 0.933) with best performance shown by Claude 3.7 Sonnet while having subpar sensitivity values (not exceeding 0.5). MedRAX and BiomedCLIP provided balanced performance metrics. 

Figure 2 demonstrates the performance of single-model MLLMs, which provided binary outputs. All ROC curves show close resemblance, similar AUC values and optimal cut-off points. 

Figure 3 shows the results of MedRAX agent-based framework and BiomedCLIP vision-language model, which provided continuous outputs. Although accuracy values are identical for both models, BiomedCLIP showed higher AUC and sensitivity. 

No statistically significant differences in accuracy were observed between the models (Supplementary Table S1). 

# 4 Discussion 

The rapid advancement of LLM capabilities is of significant interest for medical applications, particularly given the increasing workload burden on healthcare professionals (21). Multimodal LLMs have applications in Visual Question Answering (22, 23), diagnostic reporting, medical document summarization (24), clinical decision support, patient information and emotional support (25), and pathology identification in medical imaging (26). These models can process various biomedical images of different modalities and microscopic images (27, 28). 

This study investigated the ability of multimodal LLMs to detect pulmonary nodules on chest x-rays, a clinically relevant task not previously addressed in the literature. 

Foundation single-model MLLMs demonstrated high specificity but low sensitivity, indicating proficiency in identifying normal images but difficulty detecting pathology. The open-source Llama 3.2 Vision 90B model was outperformed only by Claude 3.7 Sonnet, with no statistically significant difference (p-adjusted = 0.77). Two domain-adapted models (MedRAX and BiomedCLIP) demonstrated a tendency towards superior performance compared to larger models despite smaller size and lower computational requirements. 

Two domain-adapted single-model MLLMs (CXR-LLaVA and XrayGPT) achieved the poorest performance among all evaluated models. This may be attributed to their smaller LLMs used (7 billion parameters) and earlier development timeline. Two domain-adapted models (MedRAX framework, BiomedCLIP) demonstrated sensitivity values exceeding 0.5 and approaching their specificity metrics, indicating improved pathology detection capability. 

During evaluation, XrayGPT exhibited frequent hallucinations, referencing images of different modalities, alternative projections, or prior studies that were not provided as input. CXR-LLaVA demonstrated fewer hallucinations but still referenced unavailable patient history and mentioned findings in differential diagnoses that were not included in its radiologic report. Presence of hallucinations in generated radiologic reports did not affect the results of the study as both LLMs were prompted to make a final binary «yes/no» answer based solely on provided picture. Nevertheless, given the fact that medical field is highly sensitive to errors, the management of hallucinations is seen as the promising and highly demanded area of future research. 

04 

frontiersin.org 

Frontiers in Digital Health 

10.3389/fdgth.2025.1674835 

Khovanova et al. 

FIGURE 1 Accuracy values for 9 evaluated models. Error bars (red) represent 95% confidence intervals. 

TABLE 1 AUC, sensitivity, specificity, and accuracy values for each model. 

|Name|AUC (95% CI)|Sensitivity (95% CI)|Specificity (95% CI)|Accuracy (95% CI)|
|---|---|---|---|---|
|Llama 3.2 vision 90B|0.582 (0.485–0.677)|0.342 (0.191–0.493)|0.822 (0.711–0.934)|0.602 (0.497–0.708)|
|Claude 3.5 Sonnet|0.592 (0.489–0.695)|0.474 (0.315–0.632)|0.711 (0.579–0.844)|0.602 (0.497–0.708)|
|Claude 3.7 Sonnet|0.625 (0.540–0.706)|0.316 (0.168–0.464)|0.933 (0.860–1.000)|0.651 (0.548–0.753)|
|Gemini 2.0 Pro Experimental|0.580 (0.487–0.675)|0.316 (0.168–0.464)|0.844 (0.739–0.950)|0.602 (0.497–0.708)|
|Perplexity|0.569 (0.474–0.666)|0.316 (0.168–0.464)|0.822 (0.711–0.934)|0.590 (0.485–0.696)|
|CXR-LLaVA|0.517 (0.466–0.570)|0.079 (0.000–0.165)|0.956 (0.895–1.000)|0.554 (0.447–0.661)|
|XrayGPT|0.506 (0.395–0.615)|0.500 (0.341–0.659)|0.511 (0.365–0.657)|0.506 (0.398–0.614)|
|MedRAX Qwen2.5 14B|0.704 (0.578–0.818)|0.553 (0.395–0.711)|0.844 (0.739–0.950)|0.711 (0.613–0.808)|
|BiomedCLIP|0.743 (0.641–0.846)|0.737 (0.597–0.877)|0.689 (0.554–0.842)|0.711 (0.613–0.808)|

CI, confidence interval. 

Computer vision algorithms for chest x-ray analysis typically achieve 84.0–96.0% sensitivity and specificity, with generally balanced performance metrics (29–32) in the tasks of detection of pneumothorax (sensitivity 84.0%, specificity 96.0%), fractures (sensitivity 91.0%, specificity 91.0%) and diagnosing COVID-19 (sensitivity 95.0%, specificity 96.0%). The task of detecting pulmonary nodules is more challenging, with the best reported results varying from 76.6% sensitivity and 88.68% specificity (33) to 87.5% sensitivity and 96% specificity (10) when estimating the probability of presence of nodules on CXRs. The evaluated models demonstrated inferior performance with notable sensitivity-specificity imbalance. This indicates limited 

LLM maturity and unreadiness for clinical implementation, requiring specialized modification, adaptation, and additional training. 

Study limitations included: lack of repeated queries to assess response variability; different prompting strategies for foundation vs. domain-adapted models due to varying technical capabilities, which may bias the results; analysis of PNG images while domain-adapted models were primarily trained on DICOM format images, which is the clinical standard for CXRs. 

Given rapid model development and ongoing adaptation of multimodal LLMs for new medical applications, model capabilities will likely improve significantly in the near future. 

05 

frontiersin.org 

Frontiers in Digital Health 

10.3389/fdgth.2025.1674835 

Khovanova et al. 

FIGURE 2 

ROC curves for 7 single-model MLLMs: Llama 3.2 Vision 90B, Claude 3.5 Sonnet, Claude 3.7 Sonnet, Gemini 2.0 Pro Experimental, Perplexity, CXRLLaVA, XrayGPT. Blue point indicates an optimal cut-off value based on maximum Youden index. 

FIGURE 3 

ROC curves for MedRAX agent-based framework and BiomedCLIP vision-language model. Blue point indicates an optimal cut-off value based on maximum Youden index. 

06 

frontiersin.org 

Frontiers in Digital Health 

10.3389/fdgth.2025.1674835 

Khovanova et al. 

Improved performance metrics could establish multimodal LLMs as valuable clinical assistants, enhancing routine medical practice. 

# 5 Conclusion 

The evaluated models demonstrated poor accuracy in pulmonary nodule detection on chest x-rays, rendering them currently unsuitable for radiological practice. However, continued LLM development and enhanced training may improve performance metrics, potentially enabling future implementation in radiological workflows. 

Results demonstrated that smaller open-source models with taskspecific training and models combined with state-of-the-art tools for x-ray analysis can achieve balanced diagnostic accuracy metrics compared to large proprietary single-model MLLMs. Given that proprietary models cannot be used clinically due to data security and patient privacy concerns, these findings highlight the potential for open-source models in clinical implementation, contingent upon achieving adequate performance standards. 

Model development remains extensive and requires continued research to address inherent LLM limitations. Considering the exploratory design and limitations of the study, future efforts may include testing LLMs on larger multi-site datasets, performing subgroup analysis, using DICOM images, assessing variability of answers by performing multiple testing on the same model, testing different sets of hyperparameters and prompt engineering to further explore the capabilities of LLMs in medicine, specifically considering their potential role as a tool in clinical decision support systems. 

Writing – review & editing. AV: Conceptualization, Formal analysis, Writing – review & editing. OO: Conceptualization, Project administration, Resources, Writing – review & editing. AP: Investigation, Methodology, Validation, Writing – review & editing. KA: Data curation, Formal analysis, Investigation, Methodology, Supervision, Writing – review & editing. 

# Funding 

The author(s) declared that financial support was received for this work and/or its publication. This article was prepared by a group of authors as a part of a scientific and practical project in the field of medicine (No. EGISU: 125051305989-8) “The prospective workplace of a radiologist based on generative artificial intelligence”. 

# Acknowledgments 

We thank the translator Romanov A.A. for assistance with the English translation of this publication from Russian. 

# Conflict of interest 

The author(s) declared that this work was conducted in the absence of any commercial or financial relationships that could be construed as a potential conflict of interest. 

# Generative AI statement 

# Data availability statement 

Publicly available datasets were analyzed in this study. This data can be found here: https://mosmed.ai/en/datasets/datasets/ mosmeddatargogksnalichiemiotsutstviemlegochnihuzlovtipvii/. 

The author(s) declared that generative AI was not used in the creation of this manuscript. 

Any alternative text (alt text) provided alongside figures in this article has been generated by Frontiers with the support of artificial intelligence and reasonable efforts have been made to ensure accuracy, including review by the authors wherever possible. If you identify any issues, please contact us. 

# Ethics statement 

The studies involving humans were approved by Independent Ethics Committee of the Moscow Regional Office of the Russian Society of Radiologists and Radiographists. The studies were conducted in accordance with the local legislation and institutional requirements. Written informed consent for participation was not required from the participants or the participants’ legal guardians/next of kin in accordance with the national legislation and institutional requirements. 

# Publisher’s note 

All claims expressed in this article are solely those of the authors and do not necessarily represent those of their affiliated organizations, or those of the publisher, the editors and the reviewers. Any product that may be evaluated in this article, or claim that may be made by its manufacturer, is not guaranteed or endorsed by the publisher. 

# Author contributions 

# Supplementary material 

DK: Investigation, Methodology, Software, Validation, Visualization, Writing – original draft, Writing – review & editing. YV: Conceptualization, Formal analysis, Funding acquisition, 

The Supplementary Material for this article can be found online at: https://www.frontiersin.org/articles/10.3389/fdgth.2025. 1674835/full#supplementary-material 

07 

frontiersin.org 

Frontiers in Digital Health 

10.3389/fdgth.2025.1674835 

Khovanova et al. 

# References 

1. Kim S, Lee CK, Kim SS. Large language models: a guide for radiologists. Korean J Radiol. (2024) 25(2):126–33. doi: 10.3348/kjr.2023.0997 

2. Nakaura T, Ito R, Ueda D, Nozaki T, Fushimi Y, Matsui Y, et al. The impact of large language models on radiology: a guide for radiologists on the latest innovations in AI. Jpn J Radiol. (2024) 42:685–96. doi: 10.1007/s11604-024-01552-0 

3. Vasilev YA, Reshetnikov RV, Nanova OG, Vladzymyrskyy AV, Arzamasov KM, Omelyanskaya OV, et al. Application of large language models in radiological diagnostics: a scoping review. Digital Diagnostics. (2025) 6(2):268–85. doi: 10. 17816/DD678373 EDN: QSANCA. 

4. Vasilev YA, Vladzymyrskyy AV, Arzamasov KM, Andreychenko AE, Gombolevskiy VA, Kulberg NS, et al. Kompyuternoe Zrenie v Luchevoy Diagnostike: Perviy Etap Moskovskogo Eksperimenta [Computer Vision in Radiology: Stage one of the Moscow Experiment]. 2nd edn. Moscow: Publishing Solutions (2023). p. 388 p. 

5. Nowak S, Sprinkart AM. Große sprachmodelle von OpenAI, google, meta, X und co. Radiologie. (2024) 64:779–86. doi: 10.1007/s00117-024-01327-8 

6. Savage CH, Kanhere A, Parekh V, Langlotz CP, Joshi A, Huang H, et al. Opensource large language models in radiology: a review and tutorial for practical research and clinical deployment. Radiology. (2025) 314(1):e24107. doi: 10.1148/radiol.241073 

7. Zhang G, Jin Q, Zhou Y, Wang S, Idnay B, Luo Y, et al. Closing the gap between open source and commercial large language models for medical evidence summarization. NPJ Digit Med. (2024) 7(1):239. doi: 10.1038/s41746-024-01239-w 

8. Karabacak M, Margetis K. Embracing large language models for medical applications: opportunities and challenges. Cureus. (2023) 15(5):e39305. doi: 10. 7759/cureus.39305 

9. Vasilev YA, Vladzymyrskyy AV, Arzamasov KM, Busygina YS, Pankratov AV, Shikhmuradov DU, et al. Research and Practical Clinical Center for Diagnostics and Telemedicine Technologies of the Moscow Health Care Department, submitter. Certificate for state registration of a database No. 2023622421, the Russian Federation. MosMedData: RG OGK s nalichiem i otsutstviem legochnyh uzlov [MosMedData: Chest x-ray images with and without lung nodules] : No. 2023621436 : submitted 19.05.2023 : published 17.07.2023). 

10. Arzamasov K, Vasilev Y, Zelenova M, Pestrenin L, Busygina Y, Bobrovskaya T, et al. Independent evaluation of the accuracy of 5 artificial intelligence software for detecting lung nodules on chest x-rays. Quant Imaging Med Surg. (2024) 14(8):5288–303. doi: 10.21037/qims-24-160 

11. mosmed.ai. MosMedData: absence or presence of pulmonary nodules Chest x- ray type VII. Available online at: https://mosmed.ai/en/datasets/datasets/mosmed datargogksnalichiemiotsutstviemlegochnihuzlovtipvii/ (Accessed June 2, 2025). 

12. Perplexity AI. Available online at: https://www.perplexity.ai (Accessed June 2, 2025). 

13. LMArena. Available online at: https://lmarena.ai (Accessed June 2, 2025). 

14. GitHub. ECOFRI/CXR_LLaVA. Available online at: https://github.com/ ECOFRI/CXR_LLaVA (Accessed June 2, 2025). 

15. GitHub. bowang-lab/MedRAX: MedRAX: Medical Reasoning Agent for Chest x-ray - ICML ‘25. Available online at: https://github.com/bowang-lab/MedRAX (Accessed June 2, 2025). 

16. GitHub. mbzuai-oryx/XrayGPT. Available online at: https://github.com/ mbzuai-oryx/XrayGPT (Accessed June 2, 2025). 

17. Hugging Face. microsoft/BiomedCLIP-PubMedBERT_256-vit_base_patch16_ 224. Available online at: Available online at: https://huggingface.co/microsoft/ BiomedCLIP-PubMedBERT_256-vit_base_patch16_224 (Accessed June 2, 2025). 

18. Kirpichev YS, Arzamasov KM, Semenov SS, Chetverikov SF, Logunova TA, Kuritsyn SO, et al. Research and Practical Clinical Center for Diagnostics and 

Telemedicine Technologies of the Moscow Health Care Department, submitter. Certificate for state registration of computer software No. 2022617324, the Russian Federation. Veb-instrument dlya vypolneniya ROC analiza rezul’tatov diagnosticheskih testov [Web tool for ROC analysis of diagnostic imaging findings] : No. 2022616046 : submitted 05.04.2022 : published 19.04.2022. 

19. Moscow Center for Diagnostics and Telemedicine. ROC Analysis Online. Available online at: https://roc-analysis.mosmed.ai/ (Accessed June 02, 2025). 

20. Ukita J, Nishikiori H, Hirota K, Honda S, Hatanaka K, Nakamura R, et al. Detection of fibrosing interstitial lung disease-suspected chest radiographs using a deep learning-based computer-aided detection system: a retrospective, observational study. BMJ Open. (2024) 14(1):e078841. doi: 10.1136/bmjopen-2023078841 

21. Taylor-Phillips S, Stinton C. Fatigue in radiology: a fertile area for future research. Digital Diagnostics. (2021) 2(2):211–22. doi: 10.17816/DD71630 

22. Yi Z, Xiao T, Albert MV. A survey on multimodal large language models in radiology for report generation and visual question answering. Information. (2025) 16(2):136. doi: .org/10.3390/info16020136 

23. Hartsock I, Rasool G. Vision-language models for medical report generation and visual question answering: a review. Front Artif Intell. (2024) 7:1430984. doi: 10.3389/frai.2024.1430984 

24. Bhayana R. Chatbots and large language models in radiology: a practical primer for clinical and research applications. Radiology. (2024) 310(1):e232756. doi: 10.1148/ radiol.232756 

25. D’Antonoli TA, Stanzione A, Bluethgen C, Vernuccio F, Ugga L, Klontzas ME, et al. Large language models in radiology: fundamentals, applications, ethical considerations, risks, and future directions. Diagn Interv Radiol. (2024) 30(2):80–90. doi: 10.4274/dir.2023.232417 

26. Antaki F, Chopra R, Keane PA. Vision-language models for feature detection of macular diseases on optical coherence tomography. JAMA Ophthalmol. (2024) 142(6):573–6. doi: 10.1001/jamaophthalmol.2024.1165 

27. Van M, Verma P, Wu X. On large visual language models for medical imaging analysis: an empirical study. In: IEEE/ACM Conference on Connected Health: Applications, Systems and Engineering Technologies. CHASE 2024: Proceedings of IEEE/ACM Conference on Connected Health: Applications, Systems and Engineering Technologies (CHASE); Wilmington, DE, USA, New York: IEEE (2024). p. 172–6 

28. Zhang S, Xu Y, Usuyama N, Xu H, Bagga J, Tinn R, et al. A multimodal biomedical foundation model trained from fifteen million image–text pairs. NEJM AI. (2025) 2(1):AIoa2400640. doi: 10.1056/AIoa2400640 

29. Vasilev YA, Vladzymyrskyy AV, Omelyanskaya OV, Reshetnikov RV, Blokhin IA, Kodenko MR, et al. Review of meta-analyses on the use of artificial intelligence in radiology. Medical Visualization. (2024) 28(3):22–41. doi: 10.24835/1607-0763-1425 

30. Chiu H-Y, Peng RH-T, Lin Y-C, Wang T-W, Yang Y-X, Chen Y-Y, et al. Artificial intelligence for early detection of chest nodules in x-ray images. Biomedicines. (2022) 10(11):2839. doi: 10.3390/biomedicines10112839 

31. Fanni SC, Marcucci A, Volpi F, Valentino S, Neri E, Romei C. Artificial intelligence-based software with CE mark for chest x-ray interpretation: opportunities and challenges. Diagnostics. (2023) 13(12):2020. doi: 10.3390/ diagnostics13122020 

32. Vasilev YA, Vladzymyrskyy AV. Iskusstvennyy Intellekt v Luchevoy Diagnostike: Per Aspera Ad Astra [Artificial Intelligence in Radiology: Per Aspera Ad Astra]. Moscow: Izdatelskie resheniya (2025). p. 491. 

33. Liang C-H, Liu Y-C, Wu M-T, Garcia-Castro F, Alberich-Bayarri A, Wu F-Z. Identifying pulmonary nodules or masses on chest radiography using deep learning: external validation and strategies to improve clinical practice. Clin Radiol. (2020) 75(1):38–45. doi: 10.1016/j.crad.2019.08.005 

08 

frontiersin.org 

Frontiers in Digital Health