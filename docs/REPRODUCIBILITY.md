# Reprodutibilidade e Auditoria do Pipeline de Coleta/Triagem

Este documento descreve, de ponta a ponta, como **reproduzir e auditar** a etapa de
busca e triagem de estudos desta revisão sistemática. O objetivo é que qualquer
pesquisador independente possa, a partir do repositório público
(DOI [10.5281/zenodo.19115371](https://doi.org/10.5281/zenodo.19115371)), reexecutar
a etapa automatizada e verificar cada número do fluxograma PRISMA.

## Princípio: o que o código cobre e o que NÃO cobre

| Etapa | Natureza | Coberta pelo código? |
|---|---|---|
| Busca nas bases (PubMed/SciELO/BVS) | automatizada | ✅ `search_nlp_tfidf.py` |
| Deduplicação | automatizada (determinística) | ✅ `search_nlp_tfidf.py` |
| **Triagem de título/resumo por relevância** (TF-IDF + cosseno, limiar 0.35; **3.165 → 74**) | automatizada (determinística) | ✅ `screen_tfidf.py` |
| Elegibilidade por **texto completo** (74 → incluídos) | **julgamento manual, revisor único** | ❌ **não** — limitação declarada (§4.5) |
| Extração 2×2 / QUADAS-2 | **julgamento manual, revisor único** | ❌ **não** — limitação declarada (§4.5) |

> **A triagem de título/resumo (a redução 3.165 → 74) foi AUTOMATIZADA pela ferramenta
> de relevância TF-IDF — os 3.165 resumos não foram lidos manualmente.** Essa é
> exatamente a etapa que o código torna transparente e **reproduzível de forma
> determinística**. O **julgamento manual de revisor único** aplica-se às etapas
> seguintes — **elegibilidade por texto completo (74 → 10) e extração 2×2/QUADAS-2** —
> que constituem o núcleo analítico e permanecem sujeitas a viés de revisor único
> (limitação declarada no manuscrito §4.5, item 9), **não** sanada pela publicação do código.

## Fluxo de execução

```bash
pip install -r requirements.txt

# 1) Busca + coleta real (PubMed/SciELO/BVS). Requer rede para esses hosts.
python scripts/01_search_pipeline/search_nlp_tfidf.py --output data/raw --retmax 5000
#   -> data/raw/search_results/{pubmed,scielo,bvs}_results.csv
#   -> data/raw/all_results_search.csv                 (corpus com titulo+resumo)
#   -> data/raw/search_results/SEARCH_PROVENANCE.json  (query, data, contagens)

# 2) Triagem TF-IDF deterministica (limiar documentado = 0.35).
python scripts/01_search_pipeline/screen_tfidf.py \
    --input data/raw/all_results_search.csv --output data/processed --threshold 0.35
#   -> data/processed/screening_tfidf_scored.csv / _included.csv
#   -> data/processed/SCREENING_PROVENANCE.json

# 3) Fluxograma PRISMA (contadores lidos de JSON, nada hardcoded).
python scripts/01_search_pipeline/generate_prisma_flowchart.py \
    --counts data/processed/prisma_counts.json
```

## Garantias de reprodutibilidade

- **Consulta e escopo temporal fixos**: a query booleana e o **escopo temporal
  congelado** (`SEARCH_START = 2022/11/30`, lançamento do ChatGPT; `SEARCH_CUTOFF = 2026/06/09`, por data de
  publicação) são constantes no topo de `search_nlp_tfidf.py` e gravados em
  `SEARCH_PROVENANCE.json` a cada execução. A data de corte é fixa de propósito (não é
  "hoje"), de modo que re-rodar em outra data devolve a mesma janela.
- **Triagem determinística**: `screen_tfidf.py` usa TF-IDF + similaridade de cosseno
  contra uma **semente conceitual fixa**, sem aleatoriedade. Mesmo corpus + mesmo
  limiar ⇒ **exatamente o mesmo subconjunto triado**.
- **Contadores PRISMA rastreáveis**: `data/processed/prisma_counts.json` é a fonte
  única; cada bloco declara a proveniência (automatizado vs. revisão manual). O
  diagrama é gerado a partir desse arquivo — não há números mágicos no código.
- **Versões fixadas**: `requirements.txt` (Python) e `requirements_R.txt` (R) pinam as
  versões usadas.

## Escopo temporal fixo e reprodutibilidade

Para garantir reprodutibilidade, a busca usa um **escopo temporal congelado** (por data
de publicação): `2022/11/30` (lançamento do ChatGPT, início da era de IA generativa) a
`2026/06/09` (`SEARCH_CUTOFF`). Como o filtro é por data
de publicação e a data de corte é fixa (não "hoje"), reexecutar a busca em qualquer
momento futuro devolve **a mesma janela** de registros — o limite superior não cresce
com o tempo. A única variação residual possível é a indexação tardia/backfill, pelo
PubMed, de registros anteriores à data de corte; ela é menor e fica documentada nas
contagens por base de `SEARCH_PROVENANCE.json` a cada run. O determinismo da triagem
(TF-IDF + limiar) é total dado o mesmo corpus.

Após a reexecução real (Fase C da auditoria de reprodutibilidade), os contadores
automatizados de `prisma_counts.json` devem ser **regenerados** a partir das
proveniências, e qualquer divergência frente aos números declarados no manuscrito deve
ser reconciliada e documentada.

## Procedência dos dados de estudo

A procedência das matrizes 2×2, as edições manuais de células e as inconsistências
detectadas estão documentadas em [`data/CHANGELOG_dados.md`](../data/CHANGELOG_dados.md)
(auditoria de 2026-06-08). A fonte canônica dos dados de estudo é
`data/master_audit.csv`.
