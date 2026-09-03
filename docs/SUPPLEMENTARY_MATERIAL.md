# Material Suplementar / Supplementary Material

**Acurácia Diagnóstica de Modelos de Inteligência Artificial Generativa e Visão-Linguagem na Interpretação de Radiografias de Tórax: Revisão Sistemática e Meta-Análise Bivariada Hierárquica**

**Autor:** Gabriel Borghi de Freitas Oliveira  
**Afiliação:** Universidade de Santo Amaro (UNISA), Campus I, São Paulo - SP, Brasil  
**ORCID:** [https://orcid.org/0009-0001-7191-231X](https://orcid.org/0009-0001-7191-231X)  
**Registro do Protocolo (OSF):** [https://osf.io/4yj92/](https://osf.io/4yj92/)  

---

## Tabela S1: Estratégias Completas de Busca Booleana por Base de Dados

Busca realizada em **09 de junho de 2026**, cobrindo o período retrospectivo a partir de **30 de novembro de 2022** (lançamento do ChatGPT/GPT-3.5) até a data da busca. Sem restrição de idioma na recuperação inicial; triagem restrita a artigos em inglês, espanhol e português.

### 1. PubMed / MEDLINE (Total recuperado: 164 registros)
```text
(("Artificial Intelligence"[Mesh] OR "Large Language Models"[Title/Abstract] OR "generative artificial intelligence"[Title/Abstract] OR "generative AI"[Title/Abstract] OR "vision language model"[Title/Abstract] OR "multimodal large language model"[Title/Abstract] OR "GPT-4"[Title/Abstract] OR "ChatGPT"[Title/Abstract] OR "Gemini"[Title/Abstract] OR "Claude"[Title/Abstract]) 
AND 
("Radiography, Thoracic"[Mesh] OR "chest radiograph"[Title/Abstract] OR "chest X-ray"[Title/Abstract] OR "chest radiography"[Title/Abstract] OR "CXR"[Title/Abstract]) 
AND 
("Diagnostic Test Accuracy"[Title/Abstract] OR "Sensitivity and Specificity"[Mesh] OR "diagnostic accuracy"[Title/Abstract] OR "sensitivity"[Title/Abstract] OR "specificity"[Title/Abstract] OR "ROC Curve"[Mesh] OR "AUC"[Title/Abstract] OR "area under the curve"[Title/Abstract]))
```
*Filtros:* Data de publicação de 30/11/2022 a 09/06/2026.

### 2. SciELO (Scientific Electronic Library Online) (Total recuperado: 0 registros)
```text
((generative AI) OR (large language model) OR (multimodal) OR (inteligencia artificial) OR (GPT)) AND ((radiografia) OR (chest X-ray) OR (torax) OR (tórax)) AND ((acuracia) OR (acurácia) OR (sensibilidade) OR (especificidade))
```

### 3. BVS / LILACS (Biblioteca Virtual em Saúde) (Total recuperado: 0 registros)
```text
(mh:("Inteligência Artificial") OR ti:(generative OR "large language model" OR "vision-language" OR VLM)) AND (mh:("Radiografia Torácica") OR ti:(radiografia OR "chest X-ray" OR tórax)) AND (mh:("Sensibilidade e Especificidade") OR ti:(acurácia OR precisão OR sensibilidade))
```

---

## Tabela S2: Auditoria e Memorial de Cálculo da Reconstrução das Matrizes $2\times 2$

Para assegurar reprodutibilidade absoluta e transparência diagnóstica, documenta-se a procedência de cada célula das matrizes de contingência $2\times 2$ dos estudos em que os números foram derivados de subanálises ou fluxos de triagem reportados no texto primário:

| Estudo / Periódico | Condição / Subtarefa | População Avaliada | VP | FP | FN | VN | Total | Sens (%) | Espec (%) | Racional e Memorial de Cálculo |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **Huang et al. (2025)**<br>*JAMA Netw Open* | Alerta de Pneumotórax em Fluxo Clínico Real | $N = 97.651$ radiografias prospectivas consecutivas | 24 | 22 | 9 | 97.596 | 97.651 | 72,7% | 99,98% | No fluxo hospitalar prospectivo, o modelo gerou 46 alertas para pneumotórax agudo. A auditoria clínica sênior confirmou 24 pneumotórax verdadeiros ($VP=24$) e 22 alarmes falsos ($FP=22$). Houve 9 pneumotórax não alertados pelo sistema ($FN=9$) num total de 33 casos patológicos comprovados. Os demais exames sem alerta e sem pneumotórax compõem $VN = 97.651 - (24 + 22 + 9) = 97.596$. A sensibilidade resultante é $24/33 = 72,7\%$ e a especificidade é $97.596/97.618 = 99,98\%$. Como o volume de VN é desproporcional, o estudo foi submetido à análise de sensibilidade excluindo-o (Cenário B e F). |
| **Ostrovsky (2025)**<br>*Am J Emerg Med* | Pneumonia vs. Padrão Normal / Não-infeccioso | $N = 1.400$ radiografias da coorte NIH ChestX-ray | 141 | 77 | 44 | 1.138 | 1.400 | 76,2% | 93,7% | Avaliação de 1.400 imagens compostas por 200 radiografias normais e 200 de cada uma de 6 patologias agudas. Na subtarefa binária de identificação de pneumonia/consolidação alveolar contra as demais condições, o ChatGPT-4.0 identificou corretamente 141 casos ($VP=141$) e falhou em 44 ($FN=44$) entre os 185 doentes. Entre os 1.215 controles, houve 77 classificações falso-positivas ($FP=77$) e 1.138 identificações corretas de ausência de pneumonia ($VN=1.138$). |

---

## Tabela S3: Parâmetros Técnicos de Inferência e Características dos Modelos de IA

| Estudo | Modelo Avaliado | Versão / Checkpoint | Estratégia de Prompt | Temperatura ($T$) | Formato de Entrada | Resolução | Análise de Alucinação |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Hong 2025a** | KARA-CXR | VLM Dedicado (Fine-tuned) | Structured prompt (DICOM metadata + CXR) | Determinística ($T=0,0$) | DICOM nativo (16-bit) | Resolução nativa | Monitorada (concordância radiológica 5-point) |
| **Hong 2025b** | KARA-CXR | VLM Dedicado (Fine-tuned) | Screening prompt para TB (WHO checklist) | Determinística ($T=0,0$) | DICOM nativo (16-bit) | Resolução nativa | Não observada em lesões cavitárias |
| **Ostrovsky 2025** | ChatGPT-4.0 | GPT-4 Vision (Maio/2024) | Zero-shot: *"Classifique a presença ou ausência de [patologia]"* | Padrão da API ($T \approx 0,7$) | JPEG (8-bit sRGB) | 1024×1024 | Presente em opacidades discretas |
| **Huang 2023** | Transformer GenAI | Domínio-específico (Stanford) | Rascunho assistido de laudo completo | $T=0,2$ | PNG (8-bit) | 512×512 | Classificada por radiologistas do pronto-socorro |
| **Huang 2025** | Generative Draft VLM | Fine-tuned para relatório de tórax | Shadow reporting + critical finding alert | Determinística ($T=0,0$) | DICOM nativo | Resolução nativa | 22 alarmes falsos de pneumotórax auditados |
| **Akçay 2025** | GPT-4o | Checkpoint público (OpenAI) | Zero-shot: *"Existe pneumotórax nesta radiografia? Responda sim/não e localize"* | Não reportada ($T$ padrão) | JPEG (8-bit) | Resolução web | Falso-positivos frequentes em ápices pulmonares |
| **Ciflik 2026** | GPT-4o / Gemini Pro | APIs públicas | Questionário clínico estruturado em 8 itens | Determinística ($T=0,0$) | PNG (8-bit) | 1024×1024 | Avaliada quanto à lateralidade e necessidade de dreno |
| **Güzel 2026** | Gemini 2 Pro | API pública (Google DeepMind) | Prompt padronizado zero-shot para segmentação e detecção | Determinística ($T=0,0$) | PNG (8-bit escala de cinza) | 1024×1024 | Alta taxa de omissão em volumes <10% (colapso de sensibilidade) |
| **Khovanova 2026** | Claude 3.7 Sonnet | Anthropic API | Agent-based prompt (cadeia de raciocínio passo a passo) | Determinística ($T=0,0$) | DICOM convertido em PNG 16-bit | 2048×2048 | Análise sistemática de alucinações vs artefatos costais |
| **Lee 2025** | CXR-LLaVA | Modelo de pesos abertos ajustado | Geração de laudo livre com extração via NLP | $T=0,1$ | PNG (8-bit) | 512×512 | Alucinações avaliadas por CheXbert |
| **Bai 2026** | Janus-Pro-CXR | Arquitetura multimodal DeepSeek 1B | Prompt de leitura preliminar com raciocínio clínico | Determinística ($T=0,0$) | DICOM nativo | Resolução nativa | Ensaio clínico prospectivo com medição de tempo |
| **Bulut 2025** | ChatGPT-4o | Checkpoint público | Prompt comparativo com tomografia de tórax | Não reportada | JPEG (8-bit) | Resolução de captura | Avaliação exclusiva em casos confirmados (sensibilidade) |

---

## Tabela S4: Síntese Qualitativa e Narrativa dos Três Estudos Suplementares

Três estudos elegíveis não forneceram matriz de contingência $2\times 2$ completa (ausência de dados de falsos-positivos ou verdadeiros-negativos tabulados por patologia) e foram sintetizados qualitativamente para complementar o panorama clínico:

1. **Lee et al. (2025)** (*European Radiology*, Vol. 35, n. 6, p. 4374–4386; DOI: `10.1007/s00330-024-11339-6`):
   - **Modelo:** CXR-LLaVA (modelo de visão-linguagem de pesos abertos treinado especificamente em relatórios radiográficos pareados).
   - **Amostra:** $3.689$ radiografias de tórax multilocais com múltiplos achados clínicos.
   - **Métricas:** Relatou acurácia geral e scores linguísticos (BLEU-1 a 4, ROUGE-L, BERTScore e CheXbert), demonstrando que o modelo superou LLMs generalistas na concordância terminológica com radiologistas humanos, mas sem disponibilizar dados de contingência $2\times 2$ discretos por patologia individual para cálculo de sensibilidade e especificidade absolutas.

2. **Bai et al. (2026)** (*Nature Communications*, Vol. 17, n. 1, p. 6141; DOI: `10.1038/s41467-026-72680-6`):
   - **Modelo:** Janus-Pro-CXR (sistema baseado na arquitetura DeepSeek de 1 bilhão de parâmetros para interpretação automatizada de radiografias).
   - **Amostra e Desenho:** Ensaio clínico prospectivo multicêntrico (NCT07117266) com 296 radiografias avaliadas em tempo real em fluxo ambulatorial.
   - **Achados:** Redução de 18,3% no tempo médio de emissão de laudo pelos radiologistas e aumento no escore qualitativo de precisão diagnóstica. Apresentou áreas sob a curva ROC (AUC) individuais para seis achados críticos, porém sem fornecer as frequências brutas de falso-positivos e falso-negativos por limiar de decisão fixo.

3. **Bulut et al. (2025)** (*PLoS ONE*, Vol. 20, n. 9, p. e0331962; DOI: `10.1371/journal.pone.0331962`):
   - **Modelo:** ChatGPT-4o.
   - **Amostra:** 172 pacientes consecutivos com pneumotórax comprovado por tomografia computadorizada (padrão-ouro confirmatório).
   - **Desenho:** Coorte retrospectiva exclusivamente positiva (*sensitivity-only cohort*). O estudo objetivou medir a taxa de detecção do modelo em diferentes gradações de pneumotórax (pequeno, moderado e hipertensivo). A sensibilidade foi de 100% para pneumotórax volumoso/hipertensivo, mas caiu para 38,2% em pequenas lâminas apicais. Devido à ausência de grupo-controle de exames normais ($TN=0, FP=0$), não foi possível derivar a especificidade diagnóstica nem integrar a meta-análise bivariada.

---

## Tabela S5: Avaliação Detalhada das Perguntas Sinalizadoras do QUADAS-2 (*Signaling Questions*)

| Estudo | D1: Seleção de Pacientes (SQ1.1 / SQ1.2 / SQ1.3) | Risco D1 | D2: Teste Índice (SQ2.1 / SQ2.2) | Risco D2 | D3: Padrão de Referência (SQ3.1 / SQ3.2) | Risco D3 | D4: Fluxo e Tempo (SQ4.1 / SQ4.2 / SQ4.3) | Risco D4 | Preocupações de Aplicabilidade (D1 / D2 / D3) | Justificativa do Julgamento Metodológico |
| :--- | :--- | :---: | :--- | :---: | :--- | :---: | :--- | :---: | :---: | :--- |
| **Hong 2025a** | Sim / Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Baixa / Baixa / Baixa | Coorte consecutiva bem descrita; padrão de referência por painel de especialistas; imagens em DICOM nativo sem distorção. |
| **Hong 2025b** | Sim / Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Baixa / Baixa / Baixa | População consecutiva de triagem comunitária de TB; critérios diagnósticos da OMS aplicados cegamente por radiologistas torácicos. |
| **Ostrovsky 2025** | Não / Não / Sim | **Incerto** | Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Incerta / Baixa / Baixa | Amostragem retirada do dataset NIH ChestX-ray 14 pré-balanceada artificialmente (200 normais e 200 por patologia). |
| **Huang 2023** | Incerto / Não / Sim | **Incerto** | Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Baixa / Baixa / Baixa | Amostra de pronto-socorro com enriquecimento de achados anormais agudos; padrão de referência rigoroso baseado em relatórios finais. |
| **Huang 2025** | Sim / Sim / Sim | **Baixo** | Sim / Incerto | **Incerto** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Baixa / Baixa / Baixa | Coorte prospectiva consecutiva maciça ($N=97.651$); limiar de alerta inferido de subanálise do sistema de notificação de achados críticos. |
| **Akçay 2025** | Não / Não / Sim | **Alto** | Sim / Incerto | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Alta / Incerta / Baixa | Desenho caso-controle estrito (110 com pneumotórax vs 110 normais; prevalência artificial de 50%); imagens convertidas para JPEG web. |
| **Ciflik 2026** | Incerto / Não / Sim | **Incerto** | Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Baixa / Baixa / Baixa | Coorte enriquecida retrospectiva de pneumotórax; confirmação por tomografia computadorizada na totalidade dos casos duvidosos. |
| **Güzel 2026** | Incerto / Sim / Sim | **Incerto** | Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Incerta / Incerta / Baixa | Base pública SIIM-ACR; pré-processamento explícito com conversão de DICOM para PNG de 8 bits e compressão espacial de resolução. |
| **Khovanova 2026** | Não / Não / Incerto | **Alto** | Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Alta / Baixa / Baixa | Amostra restrita ($N=83$); proporção artificial de nódulos pulmonares confirmados por TC; compressão de contraste para imagem 8-bit. |
| **Lee 2025** | Sim / Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Baixa / Incerta / Baixa | Amostra multicêntrica ampla ($N=3.689$); modelo ajustado a relatórios pareados; ausência de matriz $2\times 2$ desagregada por achado. |
| **Bai 2026** | Sim / Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Baixa / Baixa / Baixa | Ensaio prospectivo randomizado em fluxo clínico real; avaliação por AUC contínua sem reporte de frequências binárias fixas. |
| **Bulut 2025** | Não / Não / Não | **Alto** | Sim / Incerto | **Baixo** | Sim / Sim | **Baixo** | Sim / Sim / Sim | **Baixo** | Alta / Baixa / Baixa | Coorte exclusivamente positiva para pneumotórax confirmado por TC ($N=172$); ausência completa de controles normais. |

*Legenda das Perguntas Sinalizadoras (Signaling Questions):*
* **Domínio 1 (Seleção):** SQ1.1 = A amostra foi consecutiva ou aleatória?; SQ1.2 = Evitou-se o desenho caso-controle balanceado?; SQ1.3 = Exclusões inapropriadas foram evitadas?
* **Domínio 2 (Teste Índice):** SQ2.1 = O teste índice foi interpretado cegamente em relação ao padrão de referência?; SQ2.2 = O limiar de decisão foi pré-especificado?
* **Domínio 3 (Padrão de Referência):** SQ3.1 = O padrão-ouro classifica corretamente a condição-alvo?; SQ3.2 = Foi interpretado sem conhecimento do teste índice?
* **Domínio 4 (Fluxo e Tempo):** SQ4.1 = Houve intervalo de tempo adequado entre índice e referência?; SQ4.2 = Todos receberam o mesmo padrão de referência?; SQ4.3 = Todos foram incluídos na análise final?

---

## Tabela S6: Relação Nominal dos 17 Estudos Excluídos na Avaliação de Texto Completo

| # | Referência / Autores | Periódico / Ano | Título do Artigo | Motivo Primário de Exclusão (Critérios PIRT) |
| :---: | :--- | :--- | :--- | :--- |
| 1 | **Adams et al.** | *Acad Radiol*, 2024 | Automated summarization of chest radiograph reports using generative LLMs | **Sem teste de imagem:** Avaliou apenas processamento de texto de laudos pré-existentes, sem interpretação direta de radiografias. |
| 2 | **Chen et al.** | *Lancet Digit Health*, 2024 | Deep learning for automated thoracic abnormality detection | **Modelo não elegível:** Arquitetura puramente CNN/ResNet convencional, sem componentes generativos ou de visão-linguagem (VLM/LLM). |
| 3 | **Dosovitskiy et al.** | *arXiv*, 2024 | Benchmark on vision transformers for synthetic radiograph generation | **Sem correlação clínica:** Estudo computacional avaliando fidúcia visual em imagens sintéticas, sem cálculo de sensibilidade/especificidade diagnóstica. |
| 4 | **Elsayed et al.** | *BMC Med Imaging*, 2025 | Feasibility and usability of interactive conversational agents in radiology | **Sem acurácia diagnóstica:** Avaliação ergonômica e de usabilidade de interface conversacional, sem teste de validação de patologias torácicas. |
| 5 | **Gao et al.** | *IEEE Trans Med Imaging*, 2024 | High-resolution anatomical lung field segmentation | **Tarefa não diagnóstica:** Focado exclusivamente em segmentação de contorno anatômico pulmonar, sem detecção de condições clínicas-alvo. |
| 6 | **Kim et al.** | *Korean J Radiol*, 2024 | Multimodal foundation models for high-resolution thoracic CT scans | **Modalidade divergente:** Avaliou tomografia computadorizada (TC) helicoidal de tórax, violando o critério PIRT restrito à radiografia frontal. |
| 7 | **Liu et al.** | *Eur Radiol*, 2024 | Translation of complex radiology reports into patient-centered summaries | **Tarefa não diagnóstica:** Avaliou apenas simplificação textual de vocabulário médico para leigos via GPT-4, sem entrada radiográfica. |
| 8 | **Moor et al.** | *Nature*, 2023 | Foundation models for generalist medical artificial intelligence | **Artigo de perspectiva:** Revisão conceitual sobre modelos fundacionais generalistas (GMAI), sem conjunto de teste empírico ou dados de acurácia. |
| 9 | **Patel et al.** | *J Digit Imaging*, 2025 | Automated ICD-10 diagnostic coding from unstructured thoracic clinical notes | **Sem teste de imagem:** Algoritmo NLP operando exclusivamente sobre notas textuais de prontuário eletrônico. |
| 10 | **Rajpurkar et al.** | *npj Digit Med*, 2024 | Multitask deep neural networks across international chest radiograph cohorts | **Modelo não elegível:** Redes neurais supervisionadas clássicas pré-generativas (DenseNet-121), sem raciocínio multimodal ou linguagem. |
| 11 | **Silva et al.** | *Rev Bras Radiol*, 2025 | Desempenho preliminar de assistentes generativos em plantão radiológico | **Amostra insuficiente:** Série de casos retrospectiva com apenas 5 pacientes ($N=5$), sem significância amostral para cálculo bivariado. |
| 12 | **Tan et al.** | *Radiol Artif Intell*, 2024 | Impact of image resizing and bit-depth normalization in medical vision algorithms | **Foco metodológico:** Comparação física de filtros de compressão sem medição de parâmetros de acurácia diagnóstica de modelos de linguagem. |
| 13 | **Wang et al.** | *Bioinformatics*, 2024 | Self-supervised representation learning for chest radiography | **Pré-treinamento:** Avaliou perda de entropia cruzada em treinamento de embeddings visuais sem desfecho diagnóstico de doença. |
| 14 | **Wu et al.** | *Med Image Anal*, 2024 | Multimodal vision-language models in computational pathology | **Modalidade divergente:** Aplicação em lâminas histológicas de biópsia pulmonar, e não em imagens radiológicas. |
| 15 | **Yang et al.** | *Sci Rep*, 2025 | Generative reporting of incidental thoracic findings | **Sem padrão de referência:** Ausência de validação independente por radiologistas humanos certificados ou tomografia computadorizada. |
| 16 | **Zhang et al.** | *Comput Biol Med*, 2024 | Evaluating natural language generation metrics in radiological AI assistants | **Métricas exclusivamente NLP:** Reportou apenas métricas de texto (BLEU-1 a 4, ROUGE), sem derivação de matriz $2\times 2$ de detecção de achados. |
| 17 | **Zhou et al.** | *Ann Biomed Eng*, 2025 | Pediatric chest radiograph interpretation using visual language models | **População fora do escopo:** Coorte composta exclusivamente por pacientes pediátricos ($<14$ anos), violando o critério PIRT de adultos. |

---

## Tabela S7: Análise de Influência Leave-One-Out (Exclusão Iterativa de Estudos)

Para avaliar se o modelo bivariado de efeitos aleatórios depende desproporcionalmente de qualquer publicação primária isolada, recalculou-se o modelo de Reitsma (REML) omitindo iterativamente um estudo por vez ($N=8$ em cada iteração):

| Estudo Omitido | Exames Restantes ($N$) | Sensibilidade (IC 95%) | Especificidade (IC 95%) | $\tau^2_{\text{sens}}$ | $\tau^2_{\text{fpr}}$ | AUC SROC | Interpretação da Influência |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **Nenhum (Pool Completo)** | 113.714 | 78,1% (54,9--91,3%) | 96,8% (89,1--99,1%) | 2,506 | 4,285 | 0,953 | Estimador sumário de referência geral. |
| **Hong 2025a** | 111.569 | 74,0% (48,5--89,6%) | 97,1% (88,6--99,3%) | 2,347 | 4,313 | 0,943 | Leve redução da sensibilidade agrupada; AUC estável. |
| **Hong 2025b** | 112.914 | 73,8% (48,4--89,4%) | 97,3% (89,8--99,3%) | 2,303 | 4,052 | 0,947 | Teste de cluster: remoção de Hong 2025b mantém especificidade e AUC elevadas. |
| **Ostrovsky 2025** | 112.314 | 78,6% (51,7--92,7%) | 97,0% (88,3--99,3%) | 2,940 | 4,345 | 0,957 | Impacto nulo no ponto sumário global. |
| **Huang 2023** | 113.214 | 77,3% (50,1--92,1%) | 96,5% (86,5--99,2%) | 2,884 | 4,334 | 0,950 | Resultados praticamente inalterados. |
| **Huang 2025** | **16.063** | **79,2% (52,8--92,8%)** | **93,7% (91,0--95,6%)** | **2,917** | **0,236** | **0,950** | **Maior determinante da especificidade:** a exclusão reduz $\tau^2_{\text{fpr}}$ de 4,285 para 0,236, comprovando que a heterogeneidade da taxa de falso-positivos vinha da baixa prevalência (0,03%) deste estudo. |
| **Akçay 2025** | 113.494 | 79,2% (52,7--92,9%) | 96,8% (87,6--99,3%) | 2,917 | 4,394 | 0,956 | Impacto marginal na acurácia e na variância. |
| **Ciflik 2026** | 113.474 | 74,7% (50,1--89,6%) | 97,3% (89,4--99,3%) | 2,338 | 4,247 | 0,947 | A sensibilidade cai levemente devido à remoção do estudo de sensibilidade máxima (100%). |
| **Güzel 2026** | **103.039** | **83,1% (65,3--92,7%)** | **97,0% (88,0--99,3%)** | **1,713** | **4,383** | **0,954** | **Maior determinante da sensibilidade:** a exclusão reduz $\tau^2_{\text{sens}}$ de 2,506 para 1,713 e eleva a sensibilidade agrupada em +5,0 pontos percentuais. |
| **Khovanova 2026** | 113.631 | 82,1% (60,7--93,2%) | 97,1% (88,6--99,3%) | 2,273 | 4,285 | 0,959 | Eleva discretamente a sensibilidade pelo descarte de outro estudo de baixa taxa de detecção (nódulos). |

---

## Conformidade com a Diretriz CLAIM (*Checklist for Artificial Intelligence in Medical Imaging*)

A presente revisão e meta-análise adere às recomendações aplicáveis do checklist CLAIM (RSNA):

| Domínio CLAIM | Descrição do Atendimento no Estudo |
| :--- | :--- |
| **1. Título e Resumo** | Identificação explícita do teste índice (IA generativa e VLMs), patologias-alvo (achados torácicos) e método estatístico (meta-análise bivariada hierárquica de Reitsma). |
| **2. Justificativa e Objetivos** | Contextualização do surgimento dos modelos multimodais de visão e linguagem frente aos modelos clássicos de deep learning, com definição clara do estimando clínico. |
| **3. Critérios de Elegibilidade** | Estrutura PIRT pré-especificada; inclusão transparente de estudos prospectivos e retrospectivos. |
| **4. Padrão de Referência** | Descrição minuciosa dos padrões-ouro de cada estudo (consenso de radiologistas torácicos, confirmação tomográfica, laudo institucional final). |
| **5. Avaliação do Risco de Viés** | Aplicação estrita da ferramenta QUADAS-2 aos 12 estudos incluídos, com gráficos de semáforo, resumo e tabela detalhada de perguntas sinalizadoras (Tabela S5). |
| **6. Métodos Estatísticos** | Ajuste do modelo bivariado hierárquico com máxima verossimilhança restrita (REML), curva SROC, intervalos de predição e nomograma de Fagan. |
| **7. Análises de Sensibilidade** | Dez cenários de robustez testando exclusão de outliers de volume, cluster de estudos (Hong), matrizes reconstruídas, análise Leave-One-Out (Tabela S7) e subgrupos. |
| **8. Transparência de IA e Reprodutibilidade** | Disponibilização integral de dados brutos (`audit_database.csv`), código R e Python sob licença aberta em repositório público com DOI persistente. |

---

## Declaração de Integridade Científica e Uso de Inteligência Artificial Generativa

Em conformidade com a **Portaria CNPq nº 2.664/2026**, as recomendações do *International Committee of Medical Journal Editors* (ICMJE), as diretrizes da *Radiological Society of North America* (RSNA) e o Guia de Autores da Elsevier (*European Journal of Radiology: AI*), documenta-se a governança e o emprego de tecnologias de inteligência artificial generativa no desenvolvimento desta pesquisa:

### 1. Ferramentas e Versões Exatas Utilizadas
- **Claude 4.7 Sonnet** e **Claude 4.7 Opus** (Anthropic, San Francisco, Califórnia, EUA);
- **Gemini 3.6 Flash** e **Gemini 3.1 Pro** (Google DeepMind, Mountain View, Califórnia, EUA).

### 2. Etapa da Pesquisa, Finalidade e Extensão
- **Automação Computacional e Programação:** Auxílio no desenvolvimento, depuração e vetorização de rotinas em Python (pipeline determinístico de triagem por TF-IDF, geração de fluxogramas e gráficos em 300 DPI) e em R (script `scripts/03_metaanalysis/sensitivity_analyses.R` para o modelo hierárquico bivariado de Reitsma, análises de sensibilidade e análise de influência *Leave-One-Out*);
- **Editoração Científica:** Suporte à formatação tipográfica em LaTeX (`manuscript/main.tex`), ajuste de tabelas em `tabularx`/`resizebox` e estruturação de chamadas cruzadas;
- **Aprimoramento Linguístico:** Revisão gramatical e de clareza textual em língua portuguesa e auxílio na tradução/revisão para o inglês acadêmico do *Abstract*.

### 3. Estruturação dos Comandos (Prompts)
A interação ocorreu mediante prompts instrucionais específicos e delimitados a tarefas técnicas auxiliares (ex: *"Implemente um loop em R para calcular o modelo bivariado de Reitsma omitindo um estudo a cada iteração e exporte para CSV"*; *"Verifique a sintaxe da tabela LaTeX para evitar underfull hbox"*). 

> **Delimitação Estrita:** Nenhuma ferramenta de IA generativa participou da decisão clínica sobre inclusão ou exclusão de artigos, da extração manual de dados primários, do julgamento dos domínios de risco do QUADAS-2 ou da interpretação conceitual e médica dos resultados.

### 4. Garantia de Revisão e Responsabilidade Humana
Todo o código-fonte, dados numéricos, cálculos estatísticos, tabelas e redação textual foram integralmente verificados, recalculados e validados pelo autor humano. O autor assume total responsabilidade ética, metodológica e científica pelo conteúdo integral do manuscrito e do material suplementar.

