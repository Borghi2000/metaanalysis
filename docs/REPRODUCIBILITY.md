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
| Triagem por relevância (TF-IDF + cosseno, limiar 0.35) | automatizada (determinística) | ✅ `screen_tfidf.py` |
| Triagem de título/resumo (elegibilidade) | **julgamento manual, revisor único** | ❌ **não** — limitação declarada (§4.5) |
| Leitura de texto completo / extração 2×2 | **julgamento manual, revisor único** | ❌ **não** — limitação declarada (§4.5) |

> A disponibilização do código garante a **transparência e a reprodutibilidade
> determinística da etapa automatizada**. As etapas manuais subsequentes constituem o
> núcleo analítico da revisão e permanecem sujeitas a viés de revisor único — uma
> limitação honestamente declarada no manuscrito (§4.5, item 9), **não** sanada pela
> publicação do código.

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

- **Consulta fixa e documentada**: a query booleana do PubMed e o intervalo de datas
  (2018–2026) são constantes no topo de `search_nlp_tfidf.py` e gravados em
  `SEARCH_PROVENANCE.json` a cada execução.
- **Triagem determinística**: `screen_tfidf.py` usa TF-IDF + similaridade de cosseno
  contra uma **semente conceitual fixa**, sem aleatoriedade. Mesmo corpus + mesmo
  limiar ⇒ **exatamente o mesmo subconjunto triado**.
- **Contadores PRISMA rastreáveis**: `data/processed/prisma_counts.json` é a fonte
  única; cada bloco declara a proveniência (automatizado vs. revisão manual). O
  diagrama é gerado a partir desse arquivo — não há números mágicos no código.
- **Versões fixadas**: `requirements.txt` (Python) e `requirements_R.txt` (R) pinam as
  versões usadas.

## Limite de reprodutibilidade temporal (caveat honesto)

Reexecutar a busca em uma data futura **não reproduz necessariamente a contagem
histórica** (4.000 / 3.165 registros), porque o PubMed cresce ao longo do tempo. O que
é garantido é o **determinismo do pipeline dado um mesmo corpus, query, data e limiar**.
Por isso, a data de execução e as contagens por base ficam registradas em
`SEARCH_PROVENANCE.json`, permitindo auditoria do que foi obtido em cada run.

Após a reexecução real (Fase C da auditoria de reprodutibilidade), os contadores
automatizados de `prisma_counts.json` devem ser **regenerados** a partir das
proveniências, e qualquer divergência frente aos números declarados no manuscrito deve
ser reconciliada e documentada.

## Procedência dos dados de estudo

A procedência das matrizes 2×2, as edições manuais de células e as inconsistências
detectadas estão documentadas em [`data/CHANGELOG_dados.md`](../data/CHANGELOG_dados.md)
(auditoria de 2026-06-08). A fonte canônica dos dados de estudo é
`data/master_audit.csv`.
