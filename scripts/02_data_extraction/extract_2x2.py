#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Extrai tabelas do PDF de Huang 2025 para verificação manual
Requer: pip install pymupdf tabula-py
"""

import sys
import os

# Verificar se pymupdf está disponível
try:
    import fitz  # pymupdf
    HAS_FITZ = True
except ImportError:
    HAS_FITZ = False
    print("❌ pymupdf não instalado. Execute: pip install pymupdf")

pdf_path = r"e:\Pesquisa projeto\data\artigos_pdf\huang_2025_oi_250461_1748448325.30901.pdf"

if not os.path.exists(pdf_path):
    print(f"❌ PDF não encontrado: {pdf_path}")
    sys.exit(1)

if not HAS_FITZ:
    print("\n📋 INSTRUÇÕES MANUAIS:")
    print("1. Abra o PDF: huang_2025_oi_250461_1748448325.30901.pdf")
    print("2. Localize a Tabela 1 (Methods ou Results)")
    print("3. Encontre a linha 'Pneumothorax' ou conforme o estudo")
    print("4. Verifique os valores exatos de:")
    print("   - Verdadeiros Positivos (TP)")
    print("   - Falsos Positivos (FP)")
    print("   - Falsos Negativos (FN)")
    print("   - Verdadeiros Negativos (TN)")
    print("\n   Valores atuais (possível erro):")
    print("   TP=24, FP=22, FN=9, TN=97605")
    print("   Soma: 24+22+9+97605 = 97660")
    print("   N declarado: 97651")
    print("   Δ = +9 ❌")
    sys.exit(0)

print("📄 Extracting tablesarom Huang 2025 PDF...\n")

try:
    pdf = fitz.open(pdf_path)
    print(f"✅ PDF aberto: {len(pdf)} páginas\n")
    
    # Procurar por 'Table' ou 'Tabela' em cada página
    for page_num, page in enumerate(pdf, 1):
        text = page.get_text()
        if "Table" in text or "Tabela" in text or "pneumothorax" in text.lower():
            print(f"━━ PÁGINA {page_num} ━━")
            # Imprimir primeiras 2000 caracteres da página
            print(text[:2000])
            print("\n")
    
    pdf.close()
    
except Exception as e:
    print(f"❌ Erro ao ler PDF: {e}")
    print("\n📋 Alternativa: Verifique manualmente no arquivo")
    sys.exit(1)
