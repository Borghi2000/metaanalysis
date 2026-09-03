import json
import os

def create_metaanalysis_canvas():
    nodes = [
        # --- HEADER CENTRAL ---
        {
            "id": "header",
            "type": "text",
            "text": "# 📊 Meta-Análise: IA Generativa em Radiografia de Tórax\n\n**12 Estudos Incluídos** | **113.714 Exames Radiográficos**\n- **Sensibilidade Agrupada:** `78,1%` (IC 95%: 54,9% - 91,3%)\n- **Especificidade Agrupada:** `96,8%` (IC 95%: 89,1% - 99,1%)\n- **AUC SROC:** `0,953` | **RV+:** `24,10` | **RV-:** `0,226`\n\n> *Ponto sumário de caráter exploratório devido à heterogeneidade clínica e metodológica.*",
            "x": 600,
            "y": 0,
            "width": 600,
            "height": 220,
            "color": "6"
        },
        
        # --- GRUPO: MODELOS DOMÍNIO-ESPECÍFICOS ---
        {
            "id": "grp_domain",
            "type": "group",
            "label": "🎯 Modelos Domínio-Específicos (N=4 estudos bivariados, 101.096 exames)",
            "x": 0,
            "y": 300,
            "width": 800,
            "height": 550,
            "color": "4"
        },
        {
            "id": "card_domain_summary",
            "type": "text",
            "text": "### 🌟 Desempenho do Subgrupo Domínio-Específico\n\n- **Sensibilidade:** **89,1%** (74,5% - 95,8%)\n- **Especificidade:** **98,7%** (80,8% - 99,9%)\n- **Razão Verossimilhança (+):** **67,39**\n- **Razão Verossimilhança (-):** **0,111**\n- **AUC SROC:** **0,959**\n\n*Treinamento pareado de laudos e imagens médicas nativas (DICOM).*",
            "x": 30,
            "y": 350,
            "width": 360,
            "height": 210,
            "color": "4"
        },
        {
            "id": "file_hong2025a",
            "type": "file",
            "file": "hong2025a_diagnostic.md",
            "x": 420,
            "y": 350,
            "width": 340,
            "height": 130
        },
        {
            "id": "file_hong2025b",
            "type": "file",
            "file": "hong2025b_tuberculose.md",
            "x": 420,
            "y": 500,
            "width": 340,
            "height": 130
        },
        {
            "id": "file_huang2025",
            "type": "file",
            "file": "huang2025.md",
            "x": 30,
            "y": 580,
            "width": 360,
            "height": 130
        },
        {
            "id": "file_bai2026",
            "type": "file",
            "file": "bai2026.md",
            "x": 420,
            "y": 650,
            "width": 340,
            "height": 130
        },

        # --- GRUPO: MODELOS DE PROPÓSITO GERAL ---
        {
            "id": "grp_general",
            "type": "group",
            "label": "🌐 Modelos de Propósito Geral (N=5 estudos bivariados, 12.618 exames)",
            "x": 1000,
            "y": 300,
            "width": 800,
            "height": 550,
            "color": "2"
        },
        {
            "id": "card_gen_summary",
            "type": "text",
            "text": "### ⚠️ Desempenho do Subgrupo de Propósito Geral\n\n- **Sensibilidade:** **64,8%** (27,3% - 90,1%)\n- **Especificidade:** **93,9%** (92,6% - 94,9%)\n- **Razão Verossimilhança (+):** **10,60**\n- **Razão Verossimilhança (-):** **0,375**\n- **AUC SROC:** **0,941**\n\n*Atingido por penalidades de RLHF anti-alucinação -> limiar excessivamente conservador.*",
            "x": 1030,
            "y": 350,
            "width": 360,
            "height": 210,
            "color": "2"
        },
        {
            "id": "file_akcay",
            "type": "file",
            "file": "akcay2026.md",
            "x": 1420,
            "y": 350,
            "width": 340,
            "height": 130
        },
        {
            "id": "file_guzel",
            "type": "file",
            "file": "guzel2026.md",
            "x": 1420,
            "y": 500,
            "width": 340,
            "height": 130
        },
        {
            "id": "file_khovanova",
            "type": "file",
            "file": "khovanova2025.md",
            "x": 1030,
            "y": 580,
            "width": 360,
            "height": 130
        },
        {
            "id": "file_ostrovsky",
            "type": "file",
            "file": "ostrovsky2025.md",
            "x": 1420,
            "y": 650,
            "width": 340,
            "height": 130
        },

        # --- GRUPO: ACHADOS UNIVERSAIS & ALERTAS CLÍNICOS ---
        {
            "id": "grp_findings",
            "type": "group",
            "label": "🚨 Achados Universais, Limitações e Alertas Regulatórios",
            "x": 400,
            "y": 920,
            "width": 1000,
            "height": 380,
            "color": "1"
        },
        {
            "id": "card_finding_1",
            "type": "text",
            "text": "### ❌ Colapso em Lesões Pequenas\n- **Pneumotórax <2 cm (Akçay):** AUC = 0,439\n- **Pneumotórax SIIM-ACR (Güzel):** Sens = 22,0%\n- **Nódulos Pulmonares (Khovanova):** Sens = 31,6%\n\n> **Conclusão:** É **contraindicado** o uso como ferramenta de exclusão isolada (*rule-out*).",
            "x": 430,
            "y": 970,
            "width": 300,
            "height": 280,
            "color": "1"
        },
        {
            "id": "card_finding_2",
            "type": "text",
            "text": "### 🛑 Erro Espacial & Alucinações\n- **Erro de Lateralidade (Hong 2025b):** 36,7% de troca entre hemitórax D e E.\n- **ReXamine (Banerjee):** Alucinações graves de tubos e fraturas não existentes.\n\n> **Conclusão:** Falta ancoragem espacial (*grounding*); conferência humana é mandatória.",
            "x": 750,
            "y": 970,
            "width": 300,
            "height": 280,
            "color": "3"
        },
        {
            "id": "card_finding_3",
            "type": "text",
            "text": "### ⚖️ Governança & ANVISA\n- Classificação como SaMD (RDC 657/2022).\n- Ausência de validação prospectiva no SUS.\n- Aumento progressivo de viés de automação passiva (54% -> 60% em Hong JACR).\n\n> **Conclusão:** Indicação aprovável restrita a **segunda leitura assistida**.",
            "x": 1070,
            "y": 970,
            "width": 300,
            "height": 280,
            "color": "5"
        }
    ]

    edges = [
        {"id": "e1", "fromNode": "header", "fromSide": "bottom", "toNode": "card_domain_summary", "toSide": "top", "label": "Modelos Especializados"},
        {"id": "e2", "fromNode": "header", "fromSide": "bottom", "toNode": "card_gen_summary", "toSide": "top", "label": "Modelos Comerciais"},
        {"id": "e3", "fromNode": "card_domain_summary", "fromSide": "right", "toNode": "file_hong2025a", "toSide": "left"},
        {"id": "e4", "fromNode": "card_domain_summary", "fromSide": "bottom", "toNode": "file_huang2025", "toSide": "top"},
        {"id": "e5", "fromNode": "card_gen_summary", "fromSide": "right", "toNode": "file_akcay", "toSide": "left"},
        {"id": "e6", "fromNode": "card_gen_summary", "fromSide": "right", "toNode": "file_guzel", "toSide": "left"},
        {"id": "e7", "fromNode": "card_gen_summary", "fromSide": "bottom", "toNode": "file_khovanova", "toSide": "top"},
        {"id": "e8", "fromNode": "file_guzel", "fromSide": "bottom", "toNode": "card_finding_1", "toSide": "top", "label": "Evidência de Colapso"},
        {"id": "e9", "fromNode": "file_hong2025b", "fromSide": "bottom", "toNode": "card_finding_2", "toSide": "top", "label": "Erro 36.7% lateralidade"},
        {"id": "e10", "fromNode": "header", "fromSide": "bottom", "toNode": "card_finding_3", "toSide": "top", "label": "Diretriz Regulatória"}
    ]

    canvas_data = {"nodes": nodes, "edges": edges}
    
    os.makedirs("docs/artigos_obsidian", exist_ok=True)
    with open("docs/artigos_obsidian/Dashboard_MetaAnalise.canvas", "w", encoding="utf-8") as f:
        json.dump(canvas_data, f, ensure_ascii=False, indent=2)
    print("[OK] Dashboard_MetaAnalise.canvas criado com sucesso!")


def create_prisma_canvas():
    nodes = [
        # Título
        {
            "id": "p_title",
            "type": "text",
            "text": "## 🔄 Fluxo de Seleção PRISMA-DTA 2020\n\nRevisão Sistemática e Meta-análise de IA Generativa em Radiografia de Tórax",
            "x": 300,
            "y": 0,
            "width": 500,
            "height": 90,
            "color": "5"
        },
        # Etapa 1: Identificação
        {
            "id": "p_id",
            "type": "text",
            "text": "### 1. Identificação nas Bases de Dados\n\n- **PubMed / MEDLINE:** `164` registros\n- **SciELO:** `0` registros\n- **BVS / LILACS:** `0` registros\n- **Total Bruto:** `164` registros\n- **Duplicatas removidas:** `2` registros\n- **Total para triagem:** `162` registros",
            "x": 0,
            "y": 140,
            "width": 320,
            "height": 180,
            "color": "6"
        },
        # Etapa 2: Triagem NLP
        {
            "id": "p_screening",
            "type": "text",
            "text": "### 2. Triagem Automatizada por PLN\n\n- Pipeline TF-IDF com similaridade de cosseno (threshold = 0,04)\n- **Registros excluídos na triagem:** `134` artigos\n- **Artigos selecionados:** `28` artigos\n- **Busca reversa de citações:** `+1` artigo (Hong JACR)\n- **Total para leitura integral:** `29` artigos",
            "x": 400,
            "y": 140,
            "width": 340,
            "height": 180,
            "color": "4"
        },
        # Etapa 3: Exclusão Full-Text
        {
            "id": "p_excluded",
            "type": "text",
            "text": "### ❌ 17 Artigos Excluídos no Texto Completo\n\n- **Sem teste de imagem (apenas texto):** Adams 2024, Patel 2025\n- **Modelo CNN clássico (não VLM/LLM):** Chen 2024, Rajpurkar 2024\n- **Modalidade divergente (TC / Patologia):** Kim 2024, Wu 2024\n- **Sem acurácia / Métricas apenas NLP:** Elsayed 2025, Zhang 2024, Tan 2024\n- **Perspectiva / Sem coorte empírica:** Moor 2023, Dosovitskiy 2024\n- **Sem padrão de referência / População pediátrica:** Yang 2025, Zhou 2025\n- *Consulte a Tabela S6 do Material Suplementar para detalhes.*",
            "x": 800,
            "y": 140,
            "width": 400,
            "height": 220,
            "color": "1"
        },
        # Etapa 4: Inclusão
        {
            "id": "p_pool_biv",
            "type": "text",
            "text": "### 🎯 9 Estudos no Pool Bivariado (N=113.714)\n\nMatrizes 2x2 brutas completas modeladas por Reitsma REML:\n- [[akcay2026]] (GPT-4o, N=220)\n- [[ciflik2026]] (GPT-5.1, N=240)\n- [[guzel2026]] (Gemini 2 Pro, N=10.675)\n- [[hong2025a_diagnostic]] (KARA-CXR, N=2.145)\n- [[hong2025b_tuberculose]] (KARA-CXR, N=800)\n- [[huang2023]] (Transformer GenAI, N=500)\n- [[huang2025]] (Generative Drafting, N=97.651)\n- [[khovanova2025]] (Claude 3.7, N=83)\n- [[ostrovsky2025]] (ChatGPT-4.0, N=1.400)",
            "x": 200,
            "y": 380,
            "width": 380,
            "height": 270,
            "color": "4"
        },
        {
            "id": "p_pool_supp",
            "type": "text",
            "text": "### 📖 3 Estudos no Pool Qualitativo\n\nElegíveis segundo PIRT, analisados em síntese narrativa:\n- [[bai2026]] (Janus-Pro-CXR, N=296, AUCs por achado)\n- [[bulut2025]] (ChatGPT-4o, N=172, coorte de sensibilidade)\n- [[lee2025]] (CXR-LLaVA, N=3.689, acurácia e NLP)",
            "x": 650,
            "y": 380,
            "width": 380,
            "height": 180,
            "color": "5"
        }
    ]

    edges = [
        {"id": "pe1", "fromNode": "p_id", "fromSide": "right", "toNode": "p_screening", "toSide": "left", "label": "162 registros"},
        {"id": "pe2", "fromNode": "p_screening", "fromSide": "right", "toNode": "p_excluded", "toSide": "left", "label": "17 excluídos"},
        {"id": "pe3", "fromNode": "p_screening", "fromSide": "bottom", "toNode": "p_pool_biv", "toSide": "top", "label": "9 com 2x2"},
        {"id": "pe4", "fromNode": "p_screening", "fromSide": "bottom", "toNode": "p_pool_supp", "toSide": "top", "label": "3 qualitativos"}
    ]

    canvas_data = {"nodes": nodes, "edges": edges}
    with open("docs/artigos_obsidian/PRISMA_Flow.canvas", "w", encoding="utf-8") as f:
        json.dump(canvas_data, f, ensure_ascii=False, indent=2)
    print("[OK] PRISMA_Flow.canvas criado com sucesso!")

if __name__ == "__main__":
    create_metaanalysis_canvas()
    create_prisma_canvas()
