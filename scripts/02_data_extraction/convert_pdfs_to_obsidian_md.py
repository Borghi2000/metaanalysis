#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script: convert_pdfs_to_obsidian_md.py
Converte os 19 PDFs científicos de data/artigos_pdf/ em notas Markdown (.md)
ricas e padronizadas para o ecossistema Obsidian e visualizadores Markdown universais.

Enriquece cada nota com:
- YAML Frontmatter (Obsidian Properties)
- Ficha de Auditoria e Metadados Clínicos (Obsidian Callouts)
- Matriz de Contingência 2x2 e Métricas Diagnósticas
- Avaliação de Risco de Viés QUADAS-2
- Texto completo do artigo com tabelas e seções extraídas via pymupdf4llm
- Conexões e Wikilinks bidirecionais [[...]]
"""

import os
import re
import csv
import sys
import pymupdf4llm

if sys.platform == "win32":
    try:
        sys.stdout.reconfigure(encoding="utf-8")
        sys.stderr.reconfigure(encoding="utf-8")
    except Exception:
        pass

BASE_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
PDF_DIR = os.path.join(BASE_DIR, "data", "artigos_pdf")
OUTPUT_DIR = os.path.join(BASE_DIR, "docs", "artigos_obsidian")
AUDIT_CSV = os.path.join(BASE_DIR, "data", "master_audit.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

# Mapeamento explícito de PDF para ID do master_audit ou metadados complementares
METADATA_EXT = {
    "hong2025c_readerstudy.pdf": {
        "title": "Value of Using a Generative AI Model in Chest Radiography Reporting: A Reader Study",
        "authors": "Hong, E. K. and Roh, B. and Park, B. et al.",
        "year": 2025,
        "journal": "Radiology",
        "doi": "10.1148/radiol.241646",
        "pmid": "39964264",
        "pool": "complementary",
        "category": "Reader Study / Eficiência de Workflow",
        "model_extracted": "KARA-CXR",
        "arch": "VLM (Domínio-específico)",
        "clinical_scenario": "Reader study multileitor (5 radiologistas, N=758); redução de 42% no tempo de laudo",
        "notes": "Estudo de fluxo e concordância clínica; não entra no pool bivariado principal por ausência de 2x2 isolado do modelo."
    },
    "hong_jacr2025_interaction.pdf": {
        "title": "Radiologist Interaction with Artificial Intelligence-Generated Preliminary Reports: A Longitudinal Multireader Study",
        "authors": "Hong, E. K. and Suh, C. H. and Nukala, M. et al.",
        "year": 2026,
        "journal": "Journal of the American College of Radiology",
        "doi": "10.1016/j.jacr.2025.10.016",
        "pmid": "39855521",
        "pool": "complementary",
        "category": "Estudo Longitudinal / Viés de Automação",
        "model_extracted": "KARA-CXR",
        "arch": "VLM (Domínio-específico)",
        "clinical_scenario": "Estudo longitudinal com 5 radiologistas (N=756) avaliando habituação e aceitação passiva (54,6% -> 60,2%)",
        "notes": "Documenta aumento do viés de automação e aceitação acrítica de laudos preliminares ao longo do tempo."
    },
    "banerjee2025_rexamine.pdf": {
        "title": "ReXamine-Global: A Framework for Uncovering Inconsistencies in Radiology Report Generation Metrics",
        "authors": "Banerjee, O. and Saenz, A. and Wu, K. et al.",
        "year": 2025,
        "journal": "arXiv preprint",
        "doi": "arXiv:2509.01188",
        "pmid": "NA",
        "pool": "complementary",
        "category": "Framework Metodológico / Alucinações",
        "model_extracted": "Vários VLMs",
        "arch": "VLM / LLM",
        "clinical_scenario": "Avaliação de factualidade clínica e alucinações graves em laudos gerados por IA",
        "notes": "Demonstra falhas críticas em métricas de NLP (BLEU/BERTScore) e documenta relatos alucinados de fraturas e tubos inexistentes."
    },
    "kagiyama2026_prime2.pdf": {
        "title": "PRIME 2.0: Proposed Requirements for Cardiovascular Imaging-Related Multimodal AI Evaluation",
        "authors": "Kagiyama, N. et al.",
        "year": 2026,
        "journal": "JACC: Cardiovascular Imaging",
        "doi": "10.1016/j.jcmg.2025.08.004",
        "pmid": "41524310",
        "pool": "complementary",
        "category": "Diretriz Metodológica / Avaliação Multimodal",
        "model_extracted": "NA",
        "arch": "Framework Normativo",
        "clinical_scenario": "Requisitos mínimos de transparência, prompts e controle de alucinação para IA multimodal",
        "notes": "Subsidia o referencial teórico de reporte e transparência em imagem médica multimodal adotado nesta revisão."
    },
    "mcinnes2018_prisma-dta.pdf": {
        "title": "Preferred Reporting Items for a Systematic Review and Meta-analysis of Diagnostic Test Accuracy Studies: The PRISMA-DTA Statement",
        "authors": "McInnes, M. D. F. and Moher, D. and Thombs, B. D. et al.",
        "year": 2018,
        "journal": "JAMA",
        "doi": "10.1001/jama.2017.19163",
        "pmid": "29362800",
        "pool": "complementary",
        "category": "Diretriz de Relato / PRISMA-DTA",
        "model_extracted": "NA",
        "arch": "Norma Internacional",
        "clinical_scenario": "Checklist e diretriz oficial para condução de revisões sistemáticas de acurácia diagnóstica",
        "notes": "Padrão metodológico norteador de toda a estrutura do presente trabalho."
    },
    "reitsma2005.pdf": {
        "title": "Bivariate Analysis of Sensitivity and Specificity Produces Informative Summary Measures in Diagnostic Reviews",
        "authors": "Reitsma, J. B. and Glas, A. S. and Rutjes, A. W. S. et al.",
        "year": 2005,
        "journal": "Journal of Clinical Epidemiology",
        "doi": "10.1016/j.jclinepi.2005.02.022",
        "pmid": "16168343",
        "pool": "complementary",
        "category": "Metodologia Estatística / Modelo Bivariado",
        "model_extracted": "NA",
        "arch": "Modelo Estatístico",
        "clinical_scenario": "Formulação matemática do modelo bivariado hierárquico de efeitos aleatórios",
        "notes": "Fundamento matemático para o pooling de sensibilidade e especificidade via REML executado no pacote mada."
    },
    "whiting2011_quadas2.pdf": {
        "title": "QUADAS-2: A Revised Tool for the Quality Assessment of Diagnostic Accuracy Studies",
        "authors": "Whiting, P. F. and Rutjes, A. W. S. and Westwood, M. E. et al.",
        "year": 2011,
        "journal": "Annals of Internal Medicine",
        "doi": "10.7326/0003-4819-155-8-201110180-00009",
        "pmid": "22007046",
        "pool": "complementary",
        "category": "Avaliação de Qualidade / QUADAS-2",
        "model_extracted": "NA",
        "arch": "Instrumento Metodológico",
        "clinical_scenario": "Ferramenta padrão de avaliação de risco de viés e preocupações de aplicabilidade",
        "notes": "Base para a avaliação dos 4 domínios de viés e 3 de aplicabilidade aplicada aos 12 estudos incluídos."
    }
}

PDF_TO_STUDY_ID = {
    "hong2025a_diagnostic.pdf": "STU_001",
    "hong2025b_tuberculose.pdf": "STU_002",
    "ostrovsky2025.pdf": "STU_004",
    "huang2023.pdf": "STU_005",
    "huang2025.pdf": "STU_006",
    "akcay2026.pdf": "STU_007",
    "ciflik2026.pdf": "STU_011",
    "lee2025.pdf": "STU_008",
    "guzel2026.pdf": "STU_013",
    "khovanova2025.pdf": "STU_014",
    "bai2026.pdf": "STU_015",
    "bulut2025.pdf": "STU_016"
}

def load_master_audit():
    audit_data = {}
    if not os.path.exists(AUDIT_CSV):
        print(f"[AVISO] Arquivo {AUDIT_CSV} não encontrado.")
        return audit_data
    with open(AUDIT_CSV, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            s_id = row.get("study_id", "").strip()
            if s_id:
                audit_data[s_id] = row
    return audit_data

def clean_markdown_text(text):
    text = re.sub(r'(\n\s*){4,}', '\n\n', text)
    return text.strip()

def build_frontmatter_and_header(pdf_filename, audit_row, ext_meta):
    stem = os.path.splitext(pdf_filename)[0]
    
    if audit_row:
        authors = audit_row.get("authors", "")
        year = audit_row.get("year", "")
        doi = audit_row.get("doi", "")
        pmid = audit_row.get("pmid", "")
        journal = audit_row.get("journal", "")
        arch = audit_row.get("arch", "")
        model_name = audit_row.get("model_name", "")
        scenario = audit_row.get("clinical_scenario", "")
        gold = audit_row.get("gold_standard", "")
        n_tot = audit_row.get("n_total", "")
        tp = audit_row.get("tp", "")
        fp = audit_row.get("fp", "")
        fn = audit_row.get("fn", "")
        tn = audit_row.get("tn", "")
        sens = audit_row.get("sens", "")
        spec = audit_row.get("spec", "")
        acc = audit_row.get("acc", "")
        lr_plus = audit_row.get("lr_plus", "")
        lr_minus = audit_row.get("lr_minus", "")
        dor = audit_row.get("dor", "")
        q_sel = audit_row.get("q1_selection", "")
        q_idx = audit_row.get("q2_index", "")
        q_ref = audit_row.get("q3_reference", "")
        q_flow = audit_row.get("q4_flow", "")
        q_ov = audit_row.get("overall_risk", "")
        notes = audit_row.get("notes", "")
        
        has_2x2 = tp not in ["NA", "", None] and fn not in ["NA", "", None]
        pool = "main" if has_2x2 else "supplemental"
        
        tags = ["artigo", f"pool/{pool}", f"ano/{year}"]
        if "Pneumothorax" in scenario or "pneumotórax" in scenario.lower():
            tags.append("condicao/pneumotorax")
        elif "Tuberculosis" in scenario:
            tags.append("condicao/tuberculose")
        elif "Pneumonia" in scenario:
            tags.append("condicao/pneumonia")
        elif "Nodule" in scenario or "Nódulo" in scenario:
            tags.append("condicao/nodulo-pulmonar")
        
        if "GPT" in model_name or "ChatGPT" in model_name:
            tags.append("modelo/chatgpt")
        elif "Gemini" in model_name:
            tags.append("modelo/gemini")
        elif "Claude" in model_name:
            tags.append("modelo/claude")
        elif "KARA" in model_name:
            tags.append("modelo/kara-cxr")
            
        tags_str = "\n".join([f"  - {t}" for t in tags])
        
        yaml_block = f"""---
title: "{authors} ({year}) — {scenario}"
authors: "{authors}"
year: {year}
journal: "{journal}"
doi: "{doi}"
pmid: "{pmid}"
pool: "{pool}"
architecture: "{arch}"
model_evaluated: "{model_name}"
clinical_scenario: "{scenario}"
reference_standard: "{gold}"
n_total: {n_tot if n_tot != 'NA' else 'null'}
tp: {tp if tp != 'NA' else 'null'}
fp: {fp if fp != 'NA' else 'null'}
fn: {fn if fn != 'NA' else 'null'}
tn: {tn if tn != 'NA' else 'null'}
sensibilidade: {sens if sens != 'NA' else 'null'}
especificidade: {spec if spec != 'NA' else 'null'}
acuracia: {acc if acc != 'NA' else 'null'}
quadas_overall: "{q_ov}"
quadas_selecao: "{q_sel}"
quadas_indice: "{q_idx}"
quadas_referencia: "{q_ref}"
quadas_fluxo: "{q_flow}"
tags:
{tags_str}
---
"""
        callout_block = f"""# {authors} ({year})

> [!abstract] Ficha de Auditoria e Metadados Clínicos
> - **Título / Identificador:** `{stem}` | **Estudo:** [[{stem}]]
> - **Cenário Clínico:** {scenario}
> - **Modelo Avaliado:** **{model_name}** ({arch})
> - **Padrão de Referência:** {gold}
> - **Amostra Total:** {n_tot} exames
> - **DOI:** [{doi}](https://doi.org/{doi}) | **PMID:** {pmid}
> - **Índice Geral:** [[_Indice_Artigos]] | **Base Master:** `data/master_audit.csv`
"""
        if has_2x2:
            sens_pct = f"{float(sens)*100:.1f}%" if sens != "NA" else "NA"
            spec_pct = f"{float(spec)*100:.1f}%" if spec != "NA" else "NA"
            acc_pct = f"{float(acc)*100:.1f}%" if acc != "NA" else "NA"
            callout_block += f"""
> [!info] Desempenho Diagnóstico & Matriz 2×2 (Pool Principal)
> - **Sensibilidade:** {sens_pct} | **Especificidade:** {spec_pct} | **Acurácia Bruta:** {acc_pct}
> - **Razão de Verossimilhança:** RV+ = {lr_plus} | RV- = {lr_minus} | DOR = {dor}
> 
> | Matriz 2×2 | Condição Presente (+) | Condição Ausente (-) | Total |
> | :--- | :---: | :---: | :---: |
> | **Teste Positivo (IA+)** | **VP:** {tp} | **FP:** {fp} | {int(float(tp))+int(float(fp))} |
> | **Teste Negativo (IA-)** | **FN:** {fn} | **VN:** {tn} | {int(float(fn))+int(float(tn))} |
> | **Total Real** | {int(float(tp))+int(float(fn))} | {int(float(fp))+int(float(tn))} | **N:** {n_tot} |
"""
        else:
            callout_block += f"""
> [!note] Síntese Qualitativa / Pool Suplementar
> Este estudo integra o **Pool Suplementar** ($N=3$). Não disponibilizou matriz binária $2\\times 2$ completa reconstruível para metanálise bivariada, sendo incluído na síntese narrativa e qualitativa.
"""
        
        callout_block += f"""
> [!warning] Avaliação Metodológica QUADAS-2
> - **Risco de Viés Global:** **{q_ov}**
> - **Domínios de Viés:** Seleção: `{q_sel}` | Teste Índice: `{q_idx}` | Padrão Ref.: `{q_ref}` | Fluxo/Tempo: `{q_flow}`
"""
        if notes and notes != "NA":
            callout_block += f"> - **Nota de Auditoria:** *{notes}*\n"

        return yaml_block + "\n" + callout_block + "\n---\n\n"

    elif ext_meta:
        title = ext_meta.get("title", "")
        authors = ext_meta.get("authors", "")
        year = ext_meta.get("year", "")
        journal = ext_meta.get("journal", "")
        doi = ext_meta.get("doi", "")
        pmid = ext_meta.get("pmid", "")
        pool = ext_meta.get("pool", "complementary")
        category = ext_meta.get("category", "")
        scenario = ext_meta.get("clinical_scenario", "")
        model = ext_meta.get("model_extracted", "NA")
        arch = ext_meta.get("arch", "NA")
        notes = ext_meta.get("notes", "")
        
        yaml_block = f"""---
title: "{title}"
authors: "{authors}"
year: {year}
journal: "{journal}"
doi: "{doi}"
pmid: "{pmid}"
pool: "{pool}"
category: "{category}"
architecture: "{arch}"
model_evaluated: "{model}"
tags:
  - artigo
  - pool/{pool}
  - categoria/{category.lower().replace(' ', '-').replace('/', '-')}
  - ano/{year}
---
"""
        callout_block = f"""# {title}

> [!abstract] Ficha de Artigo Metodológico / Complementar
> - **Autores:** {authors} ({year})
> - **Periódico:** *{journal}*
> - **Categoria:** {category}
> - **Papel no Projeto:** {scenario}
> - **DOI:** [{doi}](https://doi.org/{doi}) | **PMID:** {pmid}
> - **Índice Geral:** [[_Indice_Artigos]]
> - **Observações:** {notes}
"""
        return yaml_block + "\n" + callout_block + "\n---\n\n"
        
    else:
        yaml_block = f"""---
title: "{stem}"
pool: "unknown"
tags:
  - artigo
---
"""
        callout_block = f"""# {stem}
> [!abstract] Documento do Repositório
> - **Arquivo:** `{pdf_filename}`
> - **Índice Geral:** [[_Indice_Artigos]]
"""
        return yaml_block + "\n" + callout_block + "\n---\n\n"

def process_all_pdfs():
    audit_data = load_master_audit()
    pdf_files = sorted([f for f in os.listdir(PDF_DIR) if f.lower().endswith(".pdf")])
    
    print(f"\n=======================================================")
    print(f" Iniciando conversão de {len(pdf_files)} PDFs para Obsidian Markdown")
    print(f" Origem: {PDF_DIR}")
    print(f" Destino: {OUTPUT_DIR}")
    print(f"=======================================================\n")
    
    success_count = 0
    generated_files = []
    
    for idx, pdf_name in enumerate(pdf_files, 1):
        pdf_path = os.path.join(PDF_DIR, pdf_name)
        stem = os.path.splitext(pdf_name)[0]
        out_path = os.path.join(OUTPUT_DIR, f"{stem}.md")
        
        print(f"[{idx}/{len(pdf_files)}] Processando: {pdf_name}...")
        
        try:
            raw_md = pymupdf4llm.to_markdown(pdf_path)
            clean_md = clean_markdown_text(raw_md)
        except Exception as e:
            print(f"   [ERRO na extração]: {e}")
            clean_md = f"\n*Erro ao extrair conteúdo do PDF: {e}*\n"
            
        audit_row = None
        ext_meta = None
        
        if pdf_name in PDF_TO_STUDY_ID:
            s_id = PDF_TO_STUDY_ID[pdf_name]
            audit_row = audit_data.get(s_id)
        elif pdf_name in METADATA_EXT:
            ext_meta = METADATA_EXT[pdf_name]
            
        header = build_frontmatter_and_header(pdf_name, audit_row, ext_meta)
        
        full_document = header + "## Conteúdo do Artigo Original\n\n" + clean_md
        
        with open(out_path, "w", encoding="utf-8") as f:
            f.write(full_document)
            
        size_kb = len(full_document.encode("utf-8")) / 1024
        print(f"   [OK] Salvo: {stem}.md ({size_kb:.1f} KB)")
        success_count += 1
        generated_files.append((stem, pdf_name, audit_row, ext_meta))
        
    generate_moc(generated_files)
    
    print(f"\n Concluído com sucesso! {success_count}/{len(pdf_files)} arquivos gerados.")
    print(f" MOC gerado em: {os.path.join(OUTPUT_DIR, '_Indice_Artigos.md')}\n")

def generate_moc(files_info):
    moc_path = os.path.join(OUTPUT_DIR, "_Indice_Artigos.md")
    
    main_pool = []
    supp_pool = []
    comp_pool = []
    
    for stem, pdf_name, audit_row, ext_meta in files_info:
        if audit_row:
            tp = audit_row.get("tp", "")
            if tp not in ["NA", "", None]:
                main_pool.append((stem, audit_row))
            else:
                supp_pool.append((stem, audit_row))
        elif ext_meta:
            comp_pool.append((stem, ext_meta))
            
    content = f"""---
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
> Todos os arquivos estão estruturados com metadados YAML (Obsidian Properties), Callouts visuais, matrizes de contingência $2\\times 2$, avaliação QUADAS-2 e links bidirecionais `[[...]]`.

---

## 1. Pool Principal Bivariado ($N=9$ Estudos com Matriz $2\\times 2$)

Estudos com dados quantitativos completos de sensibilidade, especificidade e contagens brutas (VP, FP, FN, VN), modelados pelo modelo bivariado hierárquico de Reitsma via REML.

| Nota no Cofre | Autores / Ano | Modelo | Condição Clínica | Amostra ($N$) | Sens (%) | Spec (%) | Risco QUADAS-2 |
| :--- | :--- | :--- | :--- | :---: | :---: | :---: | :---: |
"""
    for stem, row in main_pool:
        authors = row.get("authors", "")
        model = row.get("model_name", "")
        cond = row.get("clinical_scenario", "")
        n_tot = row.get("n_total", "")
        sens = f"{float(row.get('sens', 0))*100:.1f}%" if row.get("sens") != "NA" else "NA"
        spec = f"{float(row.get('spec', 0))*100:.1f}%" if row.get("spec") != "NA" else "NA"
        q_ov = row.get("overall_risk", "")
        content += f"| [[{stem}]] | {authors} | **{model}** | {cond} | {n_tot} | {sens} | {spec} | `{q_ov}` |\n"

    content += """
---

## 2. Pool Suplementar ($N=3$ Estudos Elegíveis - Síntese Narrativa)

Estudos que preencheram os critérios de elegibilidade PIRT, mas não forneceram matriz $2\\times 2$ binária completa reconstruível (relataram apenas AUC por achado, coortes apenas de positivos ou métricas de acurácia global).

| Nota no Cofre | Autores / Ano | Modelo | Cenário Reportado | Amostra ($N$) | Risco QUADAS-2 |
| :--- | :--- | :--- | :--- | :---: | :---: |
"""
    for stem, row in supp_pool:
        authors = row.get("authors", "")
        model = row.get("model_name", "")
        cond = row.get("clinical_scenario", "")
        n_tot = row.get("n_total", "")
        q_ov = row.get("overall_risk", "")
        content += f"| [[{stem}]] | {authors} | **{model}** | {cond} | {n_tot} | `{q_ov}` |\n"

    content += """
---

## 3. Estudos Complementares, Metodológicos e Diretrizes ($N=7$)

Artigos fundamentais para a formulação matemática, diretrizes de relato (PRISMA-DTA, QUADAS-2, STARD), framework de explicabilidade (PRIME 2.0) e estudos de workflow radiológico longitudinal.

| Nota no Cofre | Título / Autores | Categoria | Papel na Revisão |
| :--- | :--- | :--- | :--- |
"""
    for stem, meta in comp_pool:
        title = meta.get("title", "")
        authors = meta.get("authors", "")
        year = meta.get("year", "")
        cat = meta.get("category", "")
        content += f"| [[{stem}]] | {authors} ({year}) | `{cat}` | {title} |\n"

    content += """
---

## Como Navegar Neste Cofre

### 1. No Obsidian (Recomendado)
- Abra o aplicativo Obsidian instalado no seu computador;
- Clique em **"Open folder as vault"** (Abrir pasta como cofre);
- Selecione a pasta: `docs/artigos_obsidian` (ou a raiz do projeto);
- Você terá acesso imediato às propriedades dos artigos, ao **Graph View** (Grafo de Conexões) e à busca em texto integral.

### 2. No VS Code / Antigravity (Sem abrir o app Obsidian)
- **Pré-visualização Markdown:** Abra qualquer arquivo `.md` e pressione `Ctrl + Shift + V` para ver as tabelas e blocos renderizados com formatação rica.
- Extensões como *Markdown All in One* ou *Foam* suportam os links `[[...]]` nativamente.

### 3. Consultas Dinâmicas com o Plugin Dataview (Obsidian)
Se instalar o plugin comunitário **Dataview** no Obsidian, você pode criar tabelas e painéis interativos automaticamente:

```dataview
TABLE model_evaluated AS "Modelo", clinical_scenario AS "Cenário", sensibilidade AS "Sens", especificidade AS "Spec", quadas_overall AS "QUADAS"
FROM #artigo/pool/main
SORT year DESC
```
"""

    with open(moc_path, "w", encoding="utf-8") as f:
        f.write(content)

if __name__ == "__main__":
    process_all_pdfs()
