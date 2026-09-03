---
title: "Dashboard Visual Executivo: Meta-Análise de IA Generativa em Radiografia de Tórax"
type: "dashboard"
tags:
  - dashboard
  - visualizacao
  - meta-analise
  - kpi
---

# 📊 Painel Executivo & Dashboard Visual da Meta-Análise

> [!abstract] Visão Geral do Repositório
> Este painel reúne as métricas analíticas consolidadas, embeds das **7 figuras de submissão em 300 DPI**, consultas dinâmicas do **Dataview**, blocos para o **Obsidian Charts** e atalhos para os **Whiteboards Canvas interativos**.

---

## 🧭 Whiteboards Interativos (Obsidian Canvas)

Abra os mapas conceituais infinitos nativos do Obsidian diretamente com um clique:

| Whiteboard Canvas | Descrição | Atalho |
| :--- | :--- | :---: |
| 🗺️ **Dashboard da Meta-Análise** | Mapeamento relacional de modelos, matrizes 2x2, patologias e alertas regulatórios | [[Dashboard_MetaAnalise.canvas\|Abrir Canvas Geral]] |
| 🔄 **Fluxo de Seleção PRISMA** | Fluxograma PRISMA-DTA 2020 interativo com nós clicáveis para cada estudo e exclusão | [[PRISMA_Flow.canvas\|Abrir PRISMA Canvas]] |

---

## 📌 Indicadores Clínicos & Estatísticos Centrais (KPIs)

> [!summary] Volume Amostral Consolidado
> **113.714** exames radiográficos avaliados em **9 estudos bivariados** (+3 estudos analisados por síntese qualitativa).

> [!info] Ponto Sumário Hierárquico de Reitsma (REML) — *Caráter Exploratório*
> - **Sensibilidade Agrupada:** `78,1%` (IC 95%: 54,9% -- 91,3% | Intervalo de Predição: 6,4% -- 99,5%)
> - **Especificidade Agrupada:** `96,8%` (IC 95%: 89,1% -- 99,1% | Cenário de Ref. sem Huang: `93,7%`)
> - **Razão de Verossimilhança Positiva (RV+):** `24,10`
> - **Razão de Verossimilhança Negativa (RV-):** `0,226`
> - **Área sob a Curva SROC (AUC):** `0,953`

> [!success] Desempenho dos Modelos Domínio-Específicos (KARA-CXR, Stanford, Janus-Pro)
> **Sensibilidade:** `89,1%` | **Especificidade:** `98,7%` | **RV+:** `67,39` | **RV-:** `0,111` | **AUC:** `0,959`
> *Modelos ajustados com dados pareados demonstram capacidade superior de detecção sem perda de especificidade.*

> [!warning] Desempenho dos Modelos de Propósito Geral (GPT-4o, Gemini 2 Pro, Claude 3.7)
> **Sensibilidade:** `64,8%` | **Especificidade:** `93,9%` | **RV+:** `10,60` | **RV-:** `0,375` | **AUC:** `0,941`
> *Penalidades severas de RLHF anti-alucinação induzem limiares hiper-conservadores e omissões em achados sutis.*

> [!danger] Veredito para Prática Clínica e Regulação
> - **Uso Autônomo / Rule-out:** **CONTRAINDICADO** (queda drástica de sensibilidade em lesões pequenas $<2$ cm e erro de lateralidade de 36,7%).
> - **Uso Recomendado:** **Segunda Leitura Assistida (Copiloto)** com conferência visual médica obrigatória.

---

## 🧠 Rede de Conhecimento (Knowledge Graph Hubs)

Acesse os eixos temáticos que estruturam a constelação de notas do cofre:

- 🎯 [[Modelos_Dominio_Especificos|Modelos Domínio-Específicos]] (KARA-CXR, Huang Stanford, CXR-LLaVA, Janus-Pro)
- 🌐 [[Modelos_Proposito_Geral|Modelos de Propósito Geral]] (GPT-4o, Gemini 2 Pro, Claude 3.7 Sonnet)
- 🫁 [[Pneumotorax_e_Lesoes_Agudas|Pneumotórax e Lesões Agudas]] (Subgrupo de 5 estudos, análise por tamanho de lesão)
- 🔬 [[Gargalo_DICOM_e_Compressao_8bit|O Gargalo DICOM e Perda de Bits]] (16-bit vs 8-bit, janelamento)
- 👻 [[Alucinacoes_e_Erro_Espacial|Alucinações e Falhas de Grounding]] (Erro de lateralidade, ReXamine)
- ⏱️ [[Vies_de_Automacao_e_Workflow|Viés de Automação e Workflow]] (Redução de 42% no tempo vs risco de co-omissão)
- ⚖️ [[Regulacao_ANVISA_SaMD|Regulação Sanitária ANVISA e SaMD]] (RDC 657/2022, governança clínica)

---

## 🖼️ Galeria das Figuras de Submissão (300 DPI)

### Figura 1: Fluxograma PRISMA-DTA 2020
![[Figure_1_PRISMA_DTA.png]]
*Fluxo formal de recuperação de 164 registros, triagem NLP determinística e inclusão de 12 estudos (9 bivariados e 3 qualitativos).*

---

### Figura 2: Avaliação de Risco de Viés e Aplicabilidade (QUADAS-2)
![[Figure_2_QUADAS2.png]]
*Painel duplo Cochrane (Traffic Light superior e Summary Bar inferior) avaliando os 4 domínios de viés metodológico.*

---

### Figuras 3 e 4: Gráficos de Floresta (Forest Plots) com Intervalo de Predição
| Sensibilidade Agrupada (PI: 6,4% a 99,5%) | Especificidade Agrupada (PI: 18,1% a 100,0%) |
| :---------------------------------------: | :------------------------------------------: |
|   ![[Figure_3_Forest_Sensitivity.png]]    |     ![[Figure_4_Forest_Specificity.png]]     |

---

### Figuras 5 e 6: Curva SROC Bivariada e Dispersão Diagnóstica (Bubble Plot)
| Curva SROC Hierárquica (AUC = 0,953) | Dispersão por Classe de Especialização |
| :---: | :---: |
| ![[Figure_5_SROC.png]] | ![[Figure_6_Subgroup.png]] |

---

### Figura 7: Nomograma de Fagan Bayesiano
![[Figure_7_Fagan.png]]
*Probabilidades pós-teste para pré-testes de 5% (triagem), 10% (pronto-socorro baixo risco) e 20% (pronto-socorro alto risco).*

---

## ⚡ Consultas Dinâmicas (Plugin Dataview)

Se você utiliza o plugin comunitário **Dataview** no Obsidian, estas tabelas são atualizadas em tempo real com base nas propriedades YAML dos artigos:

### 1. Tabela do Pool Principal Bivariado ($N=9$)
```dataview
TABLE 
  authors_year AS "Autores", 
  model_evaluated AS "Modelo IA", 
  clinical_scenario AS "Patologia", 
  n_total AS "Amostra (N)", 
  sensibilidade AS "Sens (%)", 
  especificidade AS "Spec (%)", 
  quadas_overall AS "Risco QUADAS"
FROM #artigo/pool/main
SORT n_total DESC
```

### 2. Comparativo de Modelos: Domínio-Específico vs. Propósito Geral
```dataview
TABLE 
  model_evaluated AS "Modelo", 
  ai_category AS "Arquitetura", 
  sensibilidade AS "Sensibilidade", 
  especificidade AS "Especificidade"
FROM #artigo
WHERE ai_category != null
SORT sensibilidade DESC
```

---

## 📈 Visualização Interativa (Plugin Obsidian Charts)

Se você tiver instalado o plugin **Obsidian Charts**, este bloco renderiza o gráfico de barras comparativo de acurácia:

```chart
type: bar
labels: [Hong 2025a, Hong 2025b, Huang 2023, Huang 2025, Ostrovsky 2025, Akçay 2025, Ciflik 2026, Güzel 2026, Khovanova 2026]
series:
  - title: Sensibilidade (%)
    data: [95.3, 95.2, 84.8, 72.7, 76.2, 70.9, 100.0, 22.0, 31.6]
  - title: Especificidade (%)
    data: [92.7, 86.7, 98.5, 100.0, 93.7, 96.4, 91.4, 95.0, 93.3]
tension: 0.2
width: 90%
stacked: false
legend: true
```
