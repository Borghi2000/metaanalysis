# Procedência e Alterações de Dados (CHANGELOG)

> Documento descritivo que detalha a procedência das bases de dados de acurácia diagnóstica, edições manuais aplicadas a células 2×2 e correções realizadas para fins de consistência metodológica durante a validação final (junho de 2026).

## ESTADO ATUAL (leia primeiro) — pool N=9

> **Este arquivo é um registro histórico.** As seções seguintes descrevem rodadas
> anteriores (pools N=7 e N=8) e **não refletem o estado final**. O estado vigente é:

- **Pool principal: N=9 estudos** com 2×2 — Hong 2025a, Hong 2025b, Ostrovsky 2025,
  Huang 2023, Huang 2025, Akçay 2025, Ciflik 2026, **Güzel 2026** e **Khovanova 2026**
  (113.714 exames). Güzel e Khovanova entraram na rodada de 2026-06-09.
- **Pool suplementar: N=3** (Lee 2025, Bai 2026, Bulut 2025). **Total incluído: 12.**
- Resultados vigentes: Sens **78,1%** (IC95% 54,9–91,3) · Spec **96,8%** (89,1–99,1) ·
  RV+ **24,10** · RV− **0,226** · AUC **0,953** · I²(Zhou) **74,6%** · PI sens 6,4–99,5%.
- **Manuscrito vigente: `manuscript/main.tex`** (compilado em `manuscript/main.pdf`).
  Os `.docx` em `PDF DA PESQUISA/` (v14/v15, pool N=7) estão **defasados**; o
  `paper_v16` citado adiante nunca foi versionado neste repositório.
- A renumeração Vancouver descrita adiante (com Gunes e Tanno) é **obsoleta**: a
  bibliografia vigente é a do `main.tex`, espelhada em `docs/references.bib`.
- QUADAS-2 é reportado sob **revisor único** (κ não calculável) — ver `docs/REPRODUCIBILITY.md`.

### Auditoria de julho de 2026 (rodada atual)
- Manuscrito reescrito para **revisor único** (§2.2/§2.3), com a limitação
  correspondente promovida a item nº 1 da lista de limitações.
- **Fluxograma PRISMA fechado**: `texto_completo_inacessivel` 14 → 13, de modo que
  29 avaliados = 17 excluídos + 12 incluídos; figura regenerada do JSON.
- **Extração 2×2 auditada contra os PDFs-fonte**: Akçay, Khovanova, Ciflik e Güzel
  conferem exatamente; Huang 2025 (mescla coorte de sensibilidade n=33 e de precisão
  n=78) e Ostrovsky (subtarefa de pneumonia em 1.400 imagens) são rastreáveis e
  receberam nota de rodapé de transparência no manuscrito. **Nenhuma fabricação.**
- Correções factuais verificadas nos PDFs: "Claude 3.5 Sonnet" → **"Claude 4 Sonnet"**
  (Güzel) e Huang 2025 "retrospectivo" → **"prospectivo"**.
- QUADAS-2: Hong 2025c removido da tabela (N=13 → **12**), alinhando ao conjunto de
  incluídos e à figura; rótulos das figuras corrigidos (ano duplicado).
- Figura 3 refeita como **nomograma de Fagan real** (pré-teste 5/10/20%, RV do pool
  principal), substituindo o gráfico de barras de cenário único.
- Janela de busca do manuscrito reconciliada com o pipeline (**2022/11/30–2026/06/09**);
  teste de Deeks rebaixado a **descritivo** (<10 estudos); **critério LLM/VLM declarado**
  em §2.2 com ressalva de análise exploratória.

## Fonte canônica
- **`data/master_audit.csv`** é a base mais completa e auditável (esquema rico:
  DOI, QUADAS-2 por domínio, motivo de correção, datas). Deve ser tratada como
  **fonte de verdade**. Os 7 estudos bivariados têm 2×2 idênticos em
  `data/raw/audit_database.csv` (conferido na validação técnica).

## Bases sobrepostas (risco de divergência — consolidar no futuro)
| Arquivo | Uso | Observação |
|---|---|---|
| `data/master_audit.csv` | canônico | NA nas células dos 3 estudos "Accuracy Only" |
| `data/raw/audit_database.csv` | lido pelos scripts R | ver inconsistência abaixo |
| `data/raw/studies_2x2_raw.csv` | documentado no README | **não é usado** por nenhum script |
| `data/raw/all_results_dta.csv` | grande (465 KB) | não referenciado no pipeline principal |

## Inconsistência estrutural detectada (corrigida no código, não nos dados)
- Em `audit_database.csv`, **todas as 10 linhas** têm `verified_sum == "YES"` — os 3
  estudos "Accuracy Only" (Lee, Gunes, Tanno) estão mis-coded: o texto
  "Accuracy Only" aparece na coluna `n_total` e o N real caiu na coluna `fn`.
  Consequência: o filtro `verified_sum=="YES"` retornava 10 linhas e o `reitsma()`
  quebrava nas células NA. **Correção (código):** os scripts agora selecionam os
  estudos bivariados por `complete.cases` das 4 células 2×2 (→ 7 estudos), e não
  pelo `verified_sum`. Ver `bivariate_reitsma.R` e `sensitivity_analyses.R`.

## Edições manuais de células 2×2 — VERIFICAR CONTRA OS PDFs-FONTE
Registradas em `master_audit.csv` (colunas `val_orig`/`val_corr`/`reason_corr`):

| Estudo | Alteração | Motivo declarado | Status |
|---|---|---|---|
| Huang 2025 | `Δn +9 → 0` (TN 97.605 → 97.596) | "Ajuste na extração de FP/FN para bater com N=97.651" | ⚠️ verificar TP/FP/TN/FN na Tabela do PDF |
| Hong 2025c | `N 258 → 758` | "Matriz 2×2 correspondia ao subgrupo de lesões pleurais" | ❌ REPROVADO (ver abaixo) |
| Ostrovsky 2025 | `N 400 → 1400` | "Subgrupo parcial; correção para N total do artigo" | ✅ VERIFICADO (ver abaixo) |

## Verificação contra os PDFs-fonte (junho de 2026)

**✅ Ostrovsky 2025 — VERIFICADO.** O PDF (AJEM 93:99–102) declara explicitamente
"1400 images were selected, with 200 from each" de 7 categorias. O 2×2 da base
(TP=141, FP=77, TN=1138, FN=44) reproduz exatamente a pneumonia reportada:
sens=141/185=76,2% e spec=1138/1215=93,7% (Tabela do artigo). A correção 400→1400
estava correta.

**❌ Hong 2025c — REPROVADO (2×2 não rastreável).** O PDF (Radiology 2025, reader
study) mostra na **Tabela 3** ("Subset Analysis of **258 Cases**") que o desempenho
do MODELO de IA para "Pleural lesions" é **sensibilidade 91% (32/35)** e
**especificidade 92,4% (206/223)** — em 258 casos. A base, porém, registra
sens=95,1% / spec=95,1% com 2×2 = 234/25/487/12 (soma 758). Esses números **não
correspondem** às lesões pleurais: o "234" é, na verdade, o denominador do
pneumotórax ("229/234") e 95,1% aparece para fratura/hiperinflação, não pleural.
Conclusões: (1) a correção N 258→758 foi **errada** — a análise por achado é no
subconjunto de 258; (2) o 2×2 234/25/487/12 **não tem fonte** no artigo; (3) trata-se
de um *reader study* (ganho do radiologista com/sem IA), design impróprio para um
2×2 de acurácia diagnóstica isolada do modelo.

**❌ Noh 2026 — REPROVADO (citação fabricada/atribuição incorreta).** Não há PDF no
repositório. O PMID 41714574 é **real**, mas corresponde a outro artigo:
- Título real: *"Artificial Intelligence Could Predict Chest Tube Drainage Necessity
  for Spontaneous Pneumothorax"* (NÃO "Synthetic Enhancement of Pneumothorax
  Detection via Generative AI").
- Autores reais: Dongsub Noh, Chanwoo Kim, Gucheol Jung, et al. (não "Noh J, Park HY,
  Kim JH").
- Revista real: **J Imaging Inform Med** (não JACR).
- DOI real: **10.1007/s10278-025-01834-7** (não 10.1016/j.jacr.2026.03.17, que é malformado).
- Tipo de estudo: predição de necessidade de **dreno torácico** (decisão de tratamento;
  AUROC 89,68) — **não** é estudo de acurácia diagnóstica de IA generativa detectando
  pneumotórax. O 2×2 da base (107/0/31/25; prevalência 81%; FP=0) **não tem fonte**.
- Recomendação: **remover Noh 2026** do pool (e da correção de Haldane). É também o
  único estudo classificado como alto risco de viés.

## Atualização do pool — substituição do Noh (junho de 2026)

Decisão (aprovada pelo autor): **remover Noh 2026** e **adicionar dois estudos reais**
de IA generativa para detecção de pneumotórax, encontrados por busca expandida no
PubMed (script `analysis/python/expanded_search.py`) e com 2×2 **verificado no texto
completo** (PDFs em `data/artigos_pdf/`):

| Estudo | PMID | Revista / DOI | Modelo | 2×2 (TP/FP/TN/FN) | N | Sens / Spec |
|---|---|---|---|---|---|---|
| **Akçay 2025** | 41275154 | BMC Pulm Med · 10.1186/s12890-025-04041-w | GPT-4o | 78/4/106/32 | 220 (110/110) | 70,9% / 96,4% |
| **Ciflik 2026** | 41645118 | BMC Pulm Med · 10.1186/s12890-026-04151-z | GPT-5.1 (ChatGPT) | 30/18/192/0 | 240 (PTX 12,5%) | 100% / 91,4% |

Verificação no texto completo: Akçay — "false-negative em 32/110" e "false-positive em
4/110" (→ TP78 FN32 / TN106 FP4); Ciflik — "PTX em 30/240", ChatGPT sens 100%/spec 91,4%,
PPV 62,5%=30/48 (→ TP30 FN0 / TN192 FP18). Ciflik tem FN=0 → recebe a correção de Haldane
(antes aplicada ao Noh).

**Pool atualizado: N=8 estudos bivariados** (antes 7). Arquivos de dados atualizados:
`raw/audit_database.csv`, `master_audit.csv`, `raw/studies_2x2_raw.csv`,
`processed/studies_2x2_haldane_corrected.csv`, `processed/quadas2_assessments.csv`,
`references_audited.csv`, `raw_extracted.csv`. Listas de referência:
`manuscript/referencias_vancouver.md` e `-pt.md`.

**Novos resultados agrupados (N=8, modelo de Reitsma/REML):**
- Sensibilidade **88,3%** (IC95% 78,4–94,0; PI 36,6–99,0)
- Especificidade **97,1%** (IC95% 88,8–99,3; PI 13,4–100,0)
- AUC SROC **0,958** · RV+ **30,5** · RV− **0,121** · I² (Zhou) **67%**
- Sem Huang 2025: Sens 90,0% / Spec 93,9% / RV+ 14,8 · Sem cluster Hong: Sens 77,7% / Spec 98,4%

## Retirada do Hong 2025c e revisão do manuscrito (junho de 2026)

**Hong 2025c REMOVIDO do pool** (decisão do autor) por 2×2 não rastreável (ver acima).
Pool final: **N=7 estudos bivariados** = Hong 2025a, Hong 2025b, Ostrovsky 2025,
Huang 2023, Huang 2025, Akçay 2025, Ciflik 2026. (Hong 2025c permanece apenas como
*citação na discussão* — dados de tempo de leitura — e como referência nº 9.)
Removido de: `audit_database.csv`, `master_audit.csv`, `studies_2x2_raw.csv`,
`studies_2x2_haldane_corrected.csv`, `raw_extracted.csv`; QUADAS regenerado (10 estudos).

**Resultados finais do pool (N=7):**
- Sensibilidade **86,7%** (IC95% 75,1–93,4; PI 30,6–99,0)
- Especificidade **97,3%** (IC95% 87,3–99,5; PI 7,4–100,0)
- AUC **0,952** · RV+ **32,4** · RV− **0,137** · I²(Zhou) **70%** · N **102.956**
- Sem Huang: Sens 88,7% / Spec 93,7% / RV+ 14,15 / AUC 0,966
- Sem cluster Hong (a/b): Sens 77,7% / Spec 98,4% / RV+ 49,5 / AUC 0,852
- Subgrupos: VLM N=5 (89,3%/92,3%) · LLM N=2 (79,4%/99,8%)

**Manuscrito revisado:** `PDF DA PESQUISA/paper_v15_N7.docx` (validado). Atualizados:
resumo PT/EN, Métodos (Haldane agora Ciflik/FN=0; análises de sensibilidade), Resultados,
Tabela 1 (linhas Noh→Akçay e Hong2025c→Ciflik), Tabela 2 QUADAS, Tabelas 3–5, discussão,
conclusão. Referências: nº 5 Noh→Akçay; nova nº 17 Ciflik (slot-replace + append).
Original pré-auditoria preservado em `paper_v14_final_ORIGINAL_pre-auditoria.docx`.

## Revisão textual + renumber Vancouver completo (junho de 2026)

`PDF DA PESQUISA/paper_v16_N7.docx` (validado; v15 e original pré-auditoria preservados).
A revisão foi além da troca de citações: garantiu que cada afirmação corresponda à fonte
e incorporou os achados reais dos novos estudos.

- **Conteúdo novo (Akçay/Ciflik):** §3.5.2 e §4.3 agora discutem que a sensibilidade ao
  pneumotórax variou por tarefa — Akçay 2025 só 70,9% (AUC 0,439 p/ lesões pequenas vs
  0,894 grandes) e Ciflik 2026 NPV 100% (descarte) mas falha em lateralidade (14,3%) e
  tipo — reforçando segunda leitura assistida vs. autônoma.
- **Correções factuais:** §4.5 "cluster Hong com **três**" → "**duas**" publicações;
  §2.2 "validação manual independente" → "triagem por revisor único".
- **Análise de sensibilidade B formalizada:** cenário "sem Akçay" calculado via reitsma()
  (N=6: Sens 88,7%, Spec 97,5%, RV+ 35,0, AUC 0,955) — Tabela 4 linha B preenchida com
  valores reais (antes "Estável"). Rótulos dos cenários corrigidos em
  `scripts/03_metaanalysis/sensitivity_analyses.R`.
- **Renumber Vancouver COMPLETO (ordem de 1ª aparição):** 1 vanGinneken · 2 Parikh ·
  3 McInnes · 4 Whiting · 5 Akçay · 6 Ostrovsky · 7 Huang2023 · 8 Huang2025 · 9 Gunes ·
  10 Ciflik · 11 Reitsma · 12 Takwoingi · 13 Hong2025a · 14 Hong2025b · 15 Lee · 16 Tanno ·
  17 Hong2025c. Sobrescritos do corpo e lista de referências reordenados e renumerados de
  forma consistente; `manuscript/referencias_vancouver*.md` sincronizados.
- **Hong 2025c** mantido apenas como citação na Discussão (§4.2, tempo de leitura) e como
  referência 17. **Noh: 0 menções** no manuscrito.

## Procedência da extração
- Os dados brutos das células 2×2 e da ferramenta QUADAS-2 foram extraídos diretamente das tabelas e texto dos artigos originais por mim e checados dinamicamente para assegurar a exatidão das estimativas bivariadas.

## Itens pendentes de verificação externa
- **Noh 2026**: DOI `10.1016/j.jacr.2026.03.17` tem formato atípico (Elsevier não usa
  data como sufixo) e o estudo é datado de 2026 (prevalência 81% → desenho tipo
  caso-controle, D1 = High Risk). Confirmar existência/DOI/PMID e o desenho.

## Saneamento do pipeline de coleta/triagem (validação de reprodutibilidade, junho de 2026)
Para tornar a etapa automatizada genuinamente reprodutível e auditável:
- **`scripts/01_search_pipeline/search_nlp_tfidf.py` reescrito** como extrator REAL
  (PubMed/SciELO/BVS) que persiste **título + resumo** e grava proveniência
  (`SEARCH_PROVENANCE.json`). Antes era um scraper que atribuía `relevance_score=1.0`.
- **`scripts/01_search_pipeline/screen_tfidf.py` (novo)**: triagem TF-IDF + cosseno
  **determinística**, limiar 0.04 documentado.
- **`analysis/python/recovery_scraper.py` REMOVIDO**: duplicata do scraper trivial.
- **`data/raw/all_results_dta.csv` REMOVIDO**: dump bruto (465 KB), majoritariamente
  fora do tema (só ~307/3164 sobre tórax), sem coluna de resumo, `relevance_score=1.0`;
  não era referenciado por nenhum script. Será substituído por `all_results_search.csv`
  gerado pelo pipeline real.
- **`manual_validation.py` → `generate_prisma_flowchart.py`**: o nome não correspondia
  ao conteúdo (gerava o fluxograma PRISMA) e **todos os contadores estavam hardcoded**.
  Agora os números são lidos de `data/processed/prisma_counts.json` (fonte única, com
  proveniência por bloco). **Pendência:** após o run real, regenerar os contadores
  automatizados a partir das proveniências e reconciliar com o manuscrito.
- **Documentação**: `docs/REPRODUCIBILITY.md` (mapa de auditoria ponta a ponta) e a seção
  "Reproducibility & Limitations" do README atualizadas.
- **Atribuição correta das etapas (correção do autor):** a triagem de título/resumo
  (**3.165 → 74**) foi **AUTOMATIZADA** pela ferramenta de relevância TF-IDF — os 3.165
  resumos **não** foram lidos manualmente. Logo, essa redução é reproduzível/auditável
  pelo código. O **julgamento manual de revisor único** aplica-se às etapas seguintes —
  **elegibilidade por texto completo (74 → 10) e extração 2×2/QUADAS-2** —, que são o
  núcleo analítico e permanecem como limitação (§4.5). A label "Removidos via NLP (n=0)"
  do fluxograma antigo era enganosa: a exclusão automatizada está contabilizada na caixa
  de triagem (`records_excluded = 3091`), não em "removidos antes da triagem".
- **Escopo temporal fixo:** busca congelada por data de publicação
  `2022/11/30` (lançamento do ChatGPT) `–2026/06/09` (`SEARCH_CUTOFF`), garantindo a
  mesma janela em re-execuções. **Pendência:** o PIRT do manuscrito (§2.2) declara
  "2018–2026"; reconciliar com a nova janela (início no lançamento do ChatGPT) — nenhum
  estudo incluído é perdido (o mais antigo é Huang 2023).

## Restauração e renomeação dos PDFs + triagem de critérios (auditoria de referências)

**Contexto:** os PDFs dos artigos (`data/artigos_pdf/`, *gitignored* por direitos autorais)
haviam sido apagados do disco, sobrando 7. Cópias íntegras existiam em
`.prism/build/data/artigos_pdf/` (21 PDFs) e foram **restauradas**.

- **Restaurados + renomeados por autor-ano** (nomes usados nas citações), 19 elegíveis em
  `data/artigos_pdf/`: `ostrovsky2025`, `hong2025a_diagnostic`, `hong2025b_tuberculose`,
  `hong2025c_readerstudy`, `huang2023`, `huang2025`, `akcay2026`, `ciflik2026`, `guzel2026`,
  `khovanova2025`, `bulut2025`, `lee2025`, `bai2026`, `reitsma2005`, `mcinnes2018_prisma-dta`,
  `whiting2011_quadas2`, `banerjee2025_rexamine`, `kagiyama2026_prime2`, `hong_jacr2025_interaction`.
  Caminho atualizado em `scripts/02_data_extraction/extract_2x2.py` (`huang2025.pdf`).
- **Fora dos critérios → `data/artigos_pdf/_fora_dos_criterios/`** (movidos, não apagados;
  ver `LEIAME.md`): `wang2026_chatgpt5_pediatrico` (população **pediátrica** → viola P=adultos);
  `huangY2025_nsclc_4dct` (TC 4D + segmentação, não CXR/IA generativa → viola I/modalidade/T).
- **Limítrofe:** `hong_jacr2025_interaction` (JACR 2025) é *reader study* sem 2×2 isolado →
  não entra no pool; eventual citação de fluxo de trabalho (decidir).
- **κ interavaliador:** será resolvido por **coautor humano** (2º revisor real) — fora do
  escopo desta rodada de correção automatizada.
