# Legendas das Figuras / Figure Captions
**Acurácia Diagnóstica de Modelos de Inteligência Artificial Generativa e Visão-Linguagem na Interpretação de Radiografias de Tórax: Revisão Sistemática e Meta-Análise Bivariada Hierárquica**

---

### Figura 1 / Figure 1
* **Arquivo / File:** `Figure_1_PRISMA_DTA.png`
* **Legenda (PT):** **Fluxograma PRISMA-DTA 2020 de Seleção dos Estudos.** Identificação de 164 registros nas bases PubMed, SciELO e BVS; remoção de 2 duplicatas e triagem automatizada (algoritmo TF-IDF com similaridade de cosseno, limiar de corte 0,04), resultando em 28 artigos selecionados mais 1 artigo adicional identificado por busca reversa de citações ($n=29$). Após avaliação do texto completo segundo os critérios PIRT, 17 artigos foram excluídos por motivos pré-especificados, resultando na inclusão de 12 estudos na revisão sistemática (9 com matriz de contingência $2\times 2$ completa para meta-análise bivariada, totalizando 113.714 exames radiográficos, e 3 analisados exclusivamente por síntese qualitativa e narrativa).
* **Caption (EN):** **PRISMA-DTA 2020 Flow Diagram of Study Selection.** Identification of 164 records from PubMed, SciELO, and BVS databases; removal of 2 duplicates and automated title/abstract screening (TF-IDF vectorizer with cosine similarity, cutoff threshold 0.04), yielding 28 screened articles plus 1 additional study identified through backward citation chaining ($n=29$). Following full-text assessment against PIRT criteria, 17 articles were excluded for pre-specified reasons, resulting in 12 studies included in the systematic review (9 providing complete $2\times 2$ contingency data for bivariate meta-analysis, encompassing 113,714 chest radiographs, and 3 evaluated exclusively via narrative qualitative synthesis).

---

### Figura 2 / Figure 2
* **Arquivo / File:** `Figure_2_QUADAS2.png`
* **Legenda (PT):** **Avaliação do Risco de Viés e Aplicabilidade Clínica (QUADAS-2).** Painel superior (*Traffic Light Plot*): julgamento metodológico detalhado para cada um dos 12 estudos incluídos nos quatro domínios de viés (Seleção de Pacientes, Teste Índice, Padrão de Referência, Fluxo e Tempo) e nos três domínios de aplicabilidade clínica. Painel inferior (*Summary Plot*): proporção acumulada de estudos classificados como baixo risco (verde), risco incerto (amarelo) ou alto risco (vermelho) de viés. Destaca-se alto risco de viés de seleção em estudos que utilizaram amostragem artificialmente balanceada (1:1) com taxas de prevalência discrepantes da prática clínica real.
* **Caption (EN):** **Risk of Bias and Applicability Concerns Assessment (QUADAS-2).** Top panel (*Traffic Light Plot*): study-level methodological judgments for all 12 included studies across the four risk-of-bias domains (Patient Selection, Index Test, Reference Standard, Flow and Timing) and three applicability concern domains. Bottom panel (*Summary Plot*): cumulative proportions of studies categorized as low risk (green), unclear risk (yellow), or high risk (red) of bias. High risk of selection bias was notably driven by studies adopting artificial 1:1 case-control balancing with disease prevalence unrepresentative of routine clinical practice.

---

### Figura 3 / Figure 3
* **Arquivo / File:** `Figure_3_Forest_Sensitivity.png`
* **Legenda (PT):** **Gráfico de Floresta (*Forest Plot*) da Sensibilidade Diagnóstica.** Estimativas pontuais individuais (quadrados) com intervalos de confiança de 95% (linhas horizontais) para os 9 estudos do pool quantitativo bivariado ($n=113.714$ exames). A linha vertical vermelha tracejada delimita o Intervalo de Predição de 95% (PI: 6,4% a 99,5%), derivado de distribuição $t$ de Student ($df=7$). A acentuada heterogeneidade ($I^2_{\text{Zhou}} = 74,6\%$) reflete a disparidade entre modelos de propósito geral avaliando pequenas lesões (colapso de sensibilidade) e modelos domínio-específicos calibrados para detecção de opacidades e triagem.
* **Caption (EN):** **Forest Plot of Diagnostic Sensitivity.** Individual study point estimates (squares) with 95% confidence intervals (horizontal bars) for the 9 studies in the quantitative bivariate pool ($n=113,714$ chest radiographs). The red dashed vertical lines denote the 95% Prediction Interval (PI: 6.4% to 99.5%), derived using a Student's $t$-distribution ($df=7$). The substantial heterogeneity ($I^2_{\text{Zhou}} = 74.6\%$) highlights the marked contrast between general-purpose models facing sensitivity collapse on subtle lesions versus domain-specific models tuned for opacity and screening detection.

---

### Figura 4 / Figure 4
* **Arquivo / File:** `Figure_4_Forest_Specificity.png`
* **Legenda (PT):** **Gráfico de Floresta (*Forest Plot*) da Especificidade Diagnóstica.** Estimativas pontuais de especificidade e IC 95% dos 9 estudos bivariados. A especificidade combinada alcançou 96,8% (IC 95%: 89,1% a 99,1%), com intervalo de predição de 95% variando de 18,1% a 100,0%. Observa-se elevada conservação da especificidade em modelos refinados, prevenindo disparos excessivos de alarmes falsos em fluxos hospitalares de triagem.
* **Caption (EN):** **Forest Plot of Diagnostic Specificity.** Individual study specificity estimates and 95% CIs across the 9 bivariate studies. The pooled summary specificity reached 96.8% (95% CI: 89.1% to 99.1%), with a 95% prediction interval spanning 18.1% to 100.0%. High specificity was consistently preserved in domain-tuned models, preventing false-positive alarm flooding in hospital triage pipelines.

---

### Figura 5 / Figure 5
* **Arquivo / File:** `Figure_5_SROC.png`
* **Legenda (PT):** **Curva Característica de Operação do Receptor Hierárquica Sumarizada (HSROC / SROC).** Curva ajustada pelo modelo bivariado de Reitsma (REML) com Área sob a Curva (AUC) de 0,953. Os círculos vermelhos representam os 9 estudos primários; o losango azul central demarca o ponto sumário de sensibilidade (78,1%) e especificidade (96,8%). A elipse sólida azul representa a região de confiança de 95% do ponto sumário, enquanto a região retangular pontilhada em bordô delimita a dispersão de predição de 95% para futuros estudos e novos ambientes clínicos.
* **Caption (EN):** **Summary Receiver Operating Characteristic (SROC) Curve.** Fitted via Reitsma's hierarchical bivariate model (REML), yielding an Area Under the Curve (AUC) of 0.953. Red circles indicate the 9 individual primary studies; the blue diamond denotes the pooled summary operating point (sensitivity 78.1%, specificity 96.8%). The solid blue ellipse represents the 95% confidence region for the summary estimate, while the dotted dark-red box outlines the 95% prediction region for future studies and prospective clinical deployment settings.

---

### Figura 6 / Figure 6
* **Arquivo / File:** `Figure_6_Subgroup.png`
* **Legenda (PT):** **Dispersão Diagnóstica e Análise de Subgrupo por Classe de Modelo (*Bubble Plot*).** Comparação direta entre modelos Domínio-Específicos (azul, $N=4$ estudos, 101.096 exames) e modelos de Propósito Geral (verde, $N=5$ estudos, 12.618 exames). O tamanho das bolhas é proporcional ao número de exames radiográficos avaliados. Modelos domínio-específicos demonstram agrupamento homogêneo no quadrante superior esquerdo (alta sensibilidade agrupada de 89,1% e especificidade de 98,7%), ao passo que modelos de propósito geral exibem grande dispersão vertical com sensibilidade agrupada inferior (64,8%) decorrente de falhas no reconhecimento de patologias discretas.
* **Caption (EN):** **Diagnostic Space and Subgroup Comparison by Model Specialization (*Bubble Plot*).** Direct comparison between Domain-Specific architectures (blue, $N=4$ studies, 101,096 examinations) and General-Purpose multimodal models (green, $N=5$ studies, 12,618 examinations). Bubble size is proportional to the total volume of chest radiographs. Domain-specific models cluster tightly in the upper-left quadrant (pooled sensitivity 89.1%, specificity 98.7%), whereas general-purpose models show widespread vertical dispersion with lower pooled sensitivity (64.8%) driven by missed subtle lesions.

---

### Figura 7 / Figure 7
* **Arquivo / File:** `Figure_7_Fagan.png`
* **Legenda (PT):** **Nomograma de Fagan Bayesiano para Decisão Clínica.** Translação das Razões de Verossimilhança combinadas (RV+ = 24,10; RV- = 0,226) para três cenários reais de prevalência pré-teste: Triagem Ambulatorial (5%), Pronto-Socorro/Baixo Risco (10%) e Pronto-Socorro/Alto Risco (20%). Linhas contínuas ilustram a probabilidade pós-teste na presença de laudo positivo de IA (elevando o risco de 20% para 85,8%), enquanto linhas tracejadas indicam a probabilidade pós-teste na presença de teste negativo (reduzindo 20% para 5,4%). No cenário de referência sem Huang 2025 (RV+ = 12,54; RV- = 0,222), um pré-teste de 20% atinge 75,8% de probabilidade pós-teste (+).
* **Caption (EN):** **Bayesian Fagan Nomogram for Clinical Decision-Making.** Translation of pooled Likelihood Ratios (LR+ = 24.10; LR- = 0.226) across three realistic pre-test clinical prevalence scenarios: Outpatient Screening (5%), Emergency Department / Low Risk (10%), and Emergency Department / High Risk (20%). Solid lines depict post-test probability following a positive AI finding (increasing risk from 20% to 85.8%), while dashed lines depict post-test probability following a negative finding (reducing risk from 20% to 5.4%). In the reference sensitivity scenario excluding Huang 2025 (LR+ = 12.54; LR- = 0.222), a 20% pre-test risk yields 75.8% post-test probability (+).
