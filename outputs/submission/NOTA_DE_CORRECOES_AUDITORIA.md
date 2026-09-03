# Nota de Correções da Auditoria — a aplicar no manuscrito

> Data: 2026-06-08. Esta nota lista mudanças que precisam ser feitas **no texto do
> manuscrito** (`Manuscrito_V10.md` e `PDF DA PESQUISA/paper_v14_final.docx`). Não
> foram aplicadas automaticamente ao `.docx` para evitar corromper formatação; o
> autor deve incorporá-las. Achados completos: ver laudo da auditoria.

## 🔴 Obrigatórias antes de qualquer submissão (integridade)

1. **Remover qualquer afirmação de concordância interavaliador / kappa.**
   O κ relatado era sintético (revisor 2 simulado por código). Substituir por:
   *"A avaliação de risco de viés (QUADAS-2) e a extração foram conduzidas por
   revisor único, com auxílio de ferramenta automatizada; não houve segundo
   revisor independente e, portanto, não há concordância interavaliador medida.
   Trata-se de uma limitação relevante."* (ver `analysis/audit_log.txt` → RETRATAÇÃO).

2. **Declarar a assistência por IA/ferramenta automatizada** na triagem (TF-IDF),
   extração 2×2 e QUADAS-2 (`extracted_by=REVISOR_AUTOR`, `verified_by=AUTOR_GABRIEL`).
   Métodos e seção de limitações devem deixar isso explícito.

## 🟠 Recomendadas (precisão e reprodutibilidade)

3. **Contagem de participantes.** O texto atribui "103.417 participantes" aos 10
   estudos incluídos, mas 103.417 é a soma só dos **7** estudos bivariados. Corrigir:
   pool bivariado (7) = **103.417**; todos os incluídos (10) = **107.836**. Frisar
   que **94%** do N bivariado vem de um único estudo (Huang 2025, n=97.651).

4. **Teste de viés de publicação.** O manuscrito/figura cita "Teste de Egger
   (p=0,44)", valor sem base computacional no repositório. Substituir pelo **teste de
   Deeks** (apropriado para DTA), agora calculado: **p = 0,179**. Acrescentar a ressalva
   de que, com < 10 estudos, testes de assimetria de funil têm baixa potência
   (Cochrane DTA) e não devem ser interpretados como evidência de ausência de viés.

5. **Heterogeneidade (I²).** Reportar I² ajustado **e** não ajustado (Holling):
   não ajustado 85,2–88,8% **vs.** ajustado 2,1–3,5%. A enorme divergência reflete a
   dominância de Huang e deve ser discutida, não omitida.

6. **Intervalos de predição.** Mantêm-se válidos e agora são reproduzíveis pelo
   código corrigido: Sens PI **38,7–98,8%**; Spec PI **9,4–100,0%**. Bug que os
   zerava (`fit$n` NULL) foi corrigido em `audit_v9_corrections.R`.

## 🟡 Limitações a promover de "periféricas" a "centrais"

7. **Unidade de análise (independência).** Hong 2025 entra com 3 dos 7 pontos.
   Nova análise de sensibilidade (`sensitivity_analyses.R`): excluir o cluster Hong
   derruba a **sensibilidade agrupada de 87,9% → 79,1%** (e AUC 0,955 → 0,844).
   Isso indica que a precisão/sensibilidade do pool está inflada pelo cluster.

8. **Heterogeneidade clínica.** Condições-alvo distintas (pneumotórax, TB, pleural,
   pneumonia, "tórax geral"), prevalência de 0,03% a 81% e padrões-ouro diferentes
   foram agrupadas num único modelo DTA. Justificar clinicamente ou restringir o pool.

9. **Noh 2026.** Verificar existência/DOI (`10.1016/j.jacr.2026.03.17`, formato
   atípico) e desenho (prevalência 81% → tipo caso-controle, D1 = High Risk).

## Resumo numérico de robustez (gerado por `sensitivity_analyses.R`)

| Cenário | N | Sens | Spec | RV+ | AUC |
|---|---|---|---|---|---|
| Pool completo | 7 | 87,9% | 97,9% | 41,8 | 0,955 |
| Sem Huang 2025 (outlier de volume) | 6 | 89,7% | 94,6% | 16,5 | 0,970 |
| Sem cluster Hong (independência) | 4 | 79,1% | 99,2% | 101,7 | 0,844 |

> Conclusão da auditoria: as estimativas centrais (Sens 87,9% / Spec 97,9%) são
> reproduzíveis, mas **frágeis** — fortemente sensíveis a um estudo dominante e a um
> cluster não-independente. A linguagem de "alta utilidade clínica" deve permanecer
> explicitamente provisória.
