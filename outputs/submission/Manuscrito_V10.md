# Manuscrito — Versão v10 (Pós-Auditoria de Rigor Metodológico)

## 1. Resumo (Results Adicionado)
**Resultados:** A busca inicial identificou **4.185** registros, dos quais **3.165** foram submetidos à triagem automatizada via NLP (Natural Language Processing). Após a exclusão de 3.091 artigos irrelevantes e avaliação de 74 textos completos, um total de **10 estudos** (103.417 participantes) foram incluídos. O modelo bivariado (N=7) demonstrou sensibilidade agrupada de **87,9% (IC 95%: 78,6%–93,5%)** e especificidade de **97,9% (IC 95%: 89,7%–99,6%)**. Contudo, os intervalos de predição (PI) — que refletem a incerteza para novos cenários clínicos — foram amplos (**Sens PI: 39%–99%**; **Spec PI: 9%–99%**), sugerindo alta heterogeneidade. A análise de sensibilidade excluindo o estudo dominante (Huang 2025, N=97.651) revelou uma queda na especificidade para **94,6%** e na Razão de Verossimilhança Positiva (RV+) de 41,8 para **16,5**.

## 2. Métodos (Ajustes de Rigor)
**Análise Estatística:** Além do modelo de Reitsma (REML), realizamos análises de sensibilidade para avaliar o impacto do estudo dominante e reportamos os intervalos de predição conforme recomendações do Cochrane Handbook 2023. A independência dos estudos foi assumida no modelo principal, mas a presença de um cluster (Hong 2025a/b/c) foi avaliada qualitativamente na discussão.

## 3. Discussão (Atualizada com Lacunas Críticas)
### Dominância e Heterogeneidade Clínica
A robustez dos achados de especificidade é fortemente dependente de um único estudo multicêntrico (Huang 2025), cuja exclusão reduz drasticamente a utilidade diagnóstica (RV+ cai de 41,8 para 16,5). Adicionalmente, observamos uma variabilidade extrema na prevalência de doenças (range de >2.400x), desde 0,03% até 81%, o que impacta a calibração do modelo e a interpretação das RVs em diferentes contextos clínicos.

### Limitações de Dependência e Validada Externa
Identificamos uma possível violação de independência estatística no grupo Hong 2025 (KARA-CXR, 3 estudos), o que pode inflar a precisão reportada. Ademais, a validade externa é limitada pela concentração geográfica (EUA e Coreia do Sul), sem representação de países de baixa e média renda (LMICs), o que exige cautela na implementação em cenários como o brasileiro.

### Conclusões Revisitadas
Embora a IA Generativa apresente alto potencial para triagem radiográfica, a conclusão de "alta utilidade clínica" deve ser interpretada como **provisória e dependente do cenário operacional**, dada a instabilidade das estimativas bivariadas em pools pequenos (N=7) e a dependência de estudos outliers em volume.

## 4. Declarações Obrigatórias
**Financiamento:** O presente estudo não recebeu financiamento externo direto. Os autores declaram não haver conflitos de interesse (PRISMA-DTA item 26).
**Garantia de Dados:** Os dados brutos e scripts estão disponíveis em suplementar para auditabilidade integral.
