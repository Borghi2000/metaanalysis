# Instruções para o 2º revisor (QUADAS-2) — cálculo do κ de Cohen real

## Objetivo
Obter a **concordância interavaliador** (κ de Cohen) entre dois revisores independentes
na avaliação de risco de viés QUADAS-2 dos 10 estudos incluídos. Isso substitui a
limitação atual de "revisor único" por uma medida real de confiabilidade.

## Quem
Uma 2ª pessoa qualificada (ex.: orientador ou colega com experiência em QUADAS-2),
**idealmente cega** aos julgamentos do revisor 1 (não consultar `data/master_audit.csv`
antes de concluir).

## O que avaliar (para cada um dos 10 estudos)
Ler o texto completo (PDFs em `data/artigos_pdf/`) e julgar **7 domínios** do QUADAS-2:

| Coluna | Domínio QUADAS-2 |
|---|---|
| `q1_selection` | Risco de viés — Seleção de pacientes |
| `q2_index` | Risco de viés — Teste índice |
| `q3_reference` | Risco de viés — Padrão de referência |
| `q4_flow` | Risco de viés — Fluxo e tempo |
| `a1_selection` | Aplicabilidade — Seleção de pacientes |
| `a2_index` | Aplicabilidade — Teste índice |
| `a3_reference` | Aplicabilidade — Padrão de referência |

Cada célula recebe **exatamente** um destes valores (em inglês, como no revisor 1):
`Low`, `Unclear` ou `High`.

## Como preencher
1. Copie `quadas2_reviewer2_TEMPLATE.csv` para **`data/raw/quadas2_reviewer2.csv`**.
2. Substitua **todos** os `PREENCHER` por `Low` / `Unclear` / `High`.
3. **Não** altere a ordem das linhas nem os `study_id` (o cálculo casa linha-a-linha
   com `data/master_audit.csv`).

## Como calcular o κ
```bash
python analysis/python/calculate_kappa.py
```
O script lê o revisor 1 (`data/master_audit.csv`) e o revisor 2
(`data/raw/quadas2_reviewer2.csv`), valida os rótulos e imprime:
concordância observada e **κ de Cohen** sobre os 70 itens (10 estudos × 7 domínios).

## Depois
- **Divergências** entre revisores: resolver por consenso (ou um 3º revisor).
- **Reportar no manuscrito** (§2.3 e nota da Tabela 2): "dois revisores independentes;
  divergências resolvidas por consenso; κ de Cohen = X". Interpretação (Landis & Koch):
  >0,80 quase perfeita; 0,61–0,80 substancial; 0,41–0,60 moderada.
- Remover a limitação atual de "revisor único" (§2.3 e §4.5 item 9).

## (Opcional, rigor adicional)
O 2º revisor pode também **reextrair as matrizes 2×2** de forma independente para a
dupla extração de dados. Akçay/Ciflik/Ostrovsky já foram conferidos contra os PDFs;
faltariam Hong 2025a/b e Huang 2023/2025.
