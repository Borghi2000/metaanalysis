---
title: "MOC — Índice Geral de Artigos da Meta-análise"
type: "moc"
tags:
  - indice
  - revisao-dta
  - biblioteca
---

# Map of Content (MOC): Biblioteca de Artigos da Meta-análise

> [!abstract] Apresentação do Cofre
> Esta pasta reúne cópias completas em Markdown de todos os **19 artigos científicos** utilizados na monografia e meta-análise:
> *Acurácia Diagnóstica de Modelos de Inteligência Artificial Generativa e Multimodal na Interpretação de Radiografias de Tórax*.
> 
> Todos os arquivos estão estruturados com metadados YAML (Obsidian Properties), Callouts visuais, matrizes de contingência $2\times 2$, avaliação QUADAS-2 e links bidirecionais `[[...]]`.

---

## 🧭 Visualizações Rápidas & Dashboards

- 📊 **[[_Dashboard_Visual|Painel Executivo & Dashboard com Figuras 300 DPI]]**
- 🗺️ **[[Dashboard_MetaAnalise.canvas|Whiteboard Interativo: Mapa Geral da Meta-Análise]]**
- 🔄 **[[PRISMA_Flow.canvas|Whiteboard Interativo: Fluxo PRISMA 2020]]**

---

## 🧠 Rede de Conhecimento (Knowledge Graph Hubs)

- 🎯 [[Modelos_Dominio_Especificos|Modelos Domínio-Específicos]] (KARA-CXR, Huang Stanford, CXR-LLaVA, Janus-Pro)
- 🌐 [[Modelos_Proposito_Geral|Modelos de Propósito Geral]] (GPT-4o, Gemini 2 Pro, Claude 3.7 Sonnet)
- 🫁 [[Pneumotorax_e_Lesoes_Agudas|Pneumotórax e Lesões Agudas]] (Subgrupo de 5 estudos, análise por tamanho de lesão)
- 🔬 [[Gargalo_DICOM_e_Compressao_8bit|O Gargalo DICOM e Perda de Bits]] (16-bit vs 8-bit, janelamento)
- 👻 [[Alucinacoes_e_Erro_Espacial|Alucinações e Falhas de Grounding]] (Erro de lateralidade, ReXamine)
- ⏱️ [[Vies_de_Automacao_e_Workflow|Viés de Automação e Workflow]] (Redução de 42% no tempo vs risco de co-omissão)
- ⚖️ [[Regulacao_ANVISA_SaMD|Regulação Sanitária ANVISA e SaMD]] (RDC 657/2022, governança clínica)

---

## 1. Pool Principal Bivariado ($N=9$ Estudos com Matriz $2\times 2$)

Estudos com dados quantitativos completos de sensibilidade, especificidade e contagens brutas (VP, FP, FN, VN), modelados pelo modelo bivariado hierárquico de Reitsma via REML.

| Nota no Cofre | Autores / Ano | Modelo | Condição Clínica | Amostra ($N$) | Sens (%) | Spec (%) | Risco QUADAS-2 | Hubs Relacionados |
| :--- | :--- | :--- | :--- | :---: | :---: | :---: | :---: | :--- |
| [[akcay2026]] | Akçay 2025 | **GPT-4o** | Pneumothorax (spontaneous) | 220 | 70.9% | 96.4% | `High` | [[Modelos_Proposito_Geral]], [[Pneumotorax_e_Lesoes_Agudas]] |
| [[ciflik2026]] | Ciflik 2026 | **GPT-5.1 (ChatGPT)** | Pneumothorax (real-world) | 240 | 100.0% | 91.4% | `Unclear` | [[Modelos_Proposito_Geral]], [[Pneumotorax_e_Lesoes_Agudas]] |
| [[guzel2026]] | Güzel 2026 | **Gemini 2 Pro** | Pneumothorax (large-scale SIIM-ACR) | 10675 | 22.0% | 95.0% | `Unclear` | [[Modelos_Proposito_Geral]], [[Gargalo_DICOM_e_Compressao_8bit]] |
| [[hong2025a_diagnostic]] | Hong 2025a | **KARA-CXR** | Pneumothorax | 2145 | 95.3% | 92.7% | `Low` | [[Modelos_Dominio_Especificos]], [[Pneumotorax_e_Lesoes_Agudas]] |
| [[hong2025b_tuberculose]] | Hong 2025b | **KARA-CXR** | Tuberculosis Screening | 800 | 95.2% | 86.7% | `Low` | [[Modelos_Dominio_Especificos]], [[Alucinacoes_e_Erro_Espacial]] |
| [[huang2023]] | Huang 2023 | **Transformer-based GenAI** | Emergency Chest X-ray | 500 | 84.8% | 98.5% | `Unclear` | [[Modelos_Dominio_Especificos]] |
| [[huang2025]] | Huang 2025 | **Generative Draft Reporting** | Pneumothorax (Prospective) | 97651 | 72.7% | 100.0% | `Unclear` | [[Modelos_Dominio_Especificos]], [[Pneumotorax_e_Lesoes_Agudas]] |
| [[khovanova2025]] | Khovanova 2026 | **Claude 3.7 Sonnet** | Pulmonary Nodule | 83 | 31.6% | 93.3% | `High` | [[Modelos_Proposito_Geral]], [[Gargalo_DICOM_e_Compressao_8bit]] |
| [[ostrovsky2025]] | Ostrovsky 2025 | **ChatGPT-4.0** | Pneumonia vs Normal | 1400 | 76.2% | 93.7% | `Unclear` | [[Modelos_Proposito_Geral]] |

---

## 2. Pool Suplementar ($N=3$ Estudos Elegíveis - Síntese Narrativa)

Estudos que preencheram os critérios de elegibilidade PIRT, mas não forneceram matriz $2\times 2$ binária completa reconstruível (relataram apenas AUC por achado, coortes apenas de positivos ou métricas de acurácia global).

| Nota no Cofre | Autores / Ano | Modelo | Cenário Reportado | Amostra ($N$) | Risco QUADAS-2 | Hubs Relacionados |
| :--- | :--- | :--- | :--- | :---: | :---: | :--- |
| [[bai2026]] | Bai 2026 | **Janus-Pro-CXR** | Report Generation (per-finding AUC) | 296 | `Unclear` | [[Modelos_Dominio_Especificos]] |
| [[bulut2025]] | Bulut 2025 | **ChatGPT-4o** | Pneumothorax (sensitivity only) | 172 | `Unclear` | [[Modelos_Proposito_Geral]], [[Pneumotorax_e_Lesoes_Agudas]] |
| [[lee2025]] | Lee 2025 | **CXR-LLaVA** | Chest X-ray Interpretation | 3689 | `Unclear` | [[Modelos_Dominio_Especificos]] |

---

## 3. Estudos Complementares, Metodológicos e Diretrizes ($N=7$)

Artigos fundamentais para a formulação matemática, diretrizes de relato (PRISMA-DTA, QUADAS-2, STARD), framework de explicabilidade (PRIME 2.0) e estudos de workflow radiológico longitudinal.

| Nota no Cofre | Título / Autores | Categoria | Papel na Revisão | Hubs Relacionados |
| :--- | :--- | :--- | :--- | :--- |
| [[banerjee2025_rexamine]] | Banerjee, O. and Saenz, A. and Wu, K. et al. (2025) | `Framework Metodológico / Alucinações` | ReXamine-Global: A Framework for Uncovering Inconsistencies in Radiology Report Generation Metrics | [[Alucinacoes_e_Erro_Espacial]] |
| [[hong2025c_readerstudy]] | Hong, E. K. and Roh, B. and Park, B. et al. (2025) | `Reader Study / Eficiência de Workflow` | Value of Using a Generative AI Model in Chest Radiography Reporting: A Reader Study | [[Vies_de_Automacao_e_Workflow]] |
| [[hong_jacr2025_interaction]] | Hong, E. K. and Suh, C. H. and Nukala, M. et al. (2026) | `Estudo Longitudinal / Viés de Automação` | Radiologist Interaction with Artificial Intelligence-Generated Preliminary Reports: A Longitudinal Multireader Study | [[Vies_de_Automacao_e_Workflow]] |
| [[kagiyama2026_prime2]] | Kagiyama, N. et al. (2026) | `Diretriz Metodológica / Avaliação Multimodal` | PRIME 2.0: Proposed Requirements for Cardiovascular Imaging-Related Multimodal AI Evaluation | [[Alucinacoes_e_Erro_Espacial]], [[Regulacao_ANVISA_SaMD]] |
| [[mcinnes2018_prisma-dta]] | McInnes, M. D. F. and Moher, D. and Thombs, B. D. et al. (2018) | `Diretriz de Relato / PRISMA-DTA` | Preferred Reporting Items for a Systematic Review and Meta-analysis of Diagnostic Test Accuracy Studies: The PRISMA-DTA Statement | -- |
| [[reitsma2005]] | Reitsma, J. B. and Glas, A. S. and Rutjes, A. W. S. et al. (2005) | `Metodologia Estatística / Modelo Bivariado` | Bivariate Analysis of Sensitivity and Specificity Produces Informative Summary Measures in Diagnostic Reviews | -- |
| [[whiting2011_quadas2]] | Whiting, P. F. and Rutjes, A. W. S. and Westwood, M. E. et al. (2011) | `Avaliação de Qualidade / QUADAS-2` | QUADAS-2: A Revised Tool for the Quality Assessment of Diagnostic Accuracy Studies | -- |

---

## Como Navegar Neste Cofre

### 1. No Obsidian (Recomendado)
- Abra o aplicativo Obsidian instalado no seu computador;
- Clique em **"Open folder as vault"** (Abrir pasta como cofre);
- Selecione a pasta: `docs/artigos_obsidian` (ou a raiz do projeto);
- Abra o **Graph View** (`Ctrl + G`) para ver a constelação de artigos coloridos agrupados por hubs conceituais;
- Abra o `Dashboard_MetaAnalise.canvas` para navegar visualmente pelo mapa conceitual.

### 2. No VS Code / Antigravity
- Abra qualquer arquivo `.md` e pressione `Ctrl + Shift + V` para visualizar tabelas, gráficos Mermaid e callouts renderizados.
