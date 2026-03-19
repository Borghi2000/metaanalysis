#!/usr/bin/env python3
"""
Extract text from PDFs listed in data/inventario_arquivos.csv and save to
data/artigos_pdf/texto_extraido/. Produce an index CSV and a log.
Requires: pdfminer.six (pip install pdfminer.six)
"""
import os
import csv
import sys
from pathlib import Path

try:
    from pdfminer.high_level import extract_text
except Exception as e:
    print('pdfminer.six not installed. Run: pip install pdfminer.six')
    raise

BASE = Path(__file__).resolve().parents[1]
INVENTORY = BASE / 'data' / 'inventario_arquivos.csv'
OUT_DIR = BASE / 'data' / 'artigos_pdf' / 'texto_extraido'
OUT_DIR.mkdir(parents=True, exist_ok=True)
INDEX_CSV = BASE / 'data' / 'artigos_pdf' / 'texto_extraido_index.csv'
LOG_CSV = BASE / 'data' / 'extraction_log.csv'

pdf_paths = []
with INVENTORY.open(newline='', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        if row.get('Type','').upper() == 'PDF':
            p = Path(row['Path'])
            # only process PDFs in data\artigos_pdf
            if 'data\\artigos_pdf' in str(p).lower() or str(p).lower().startswith(str((BASE / 'data' / 'artigos_pdf')).lower()):
                pdf_paths.append(p)

with INDEX_CSV.open('w', newline='', encoding='utf-8') as idxf, LOG_CSV.open('w', newline='', encoding='utf-8') as logf:
    idx_writer = csv.writer(idxf)
    log_writer = csv.writer(logf)
    idx_writer.writerow(['pdf_path','txt_path','status','note'])
    log_writer.writerow(['pdf_path','status','message'])

    for p in pdf_paths:
        try:
            if not p.exists():
                log_writer.writerow([str(p),'missing','file not found'])
                continue
            text = extract_text(str(p))
            txt_name = p.stem + '.txt'
            txt_path = OUT_DIR / txt_name
            with txt_path.open('w', encoding='utf-8') as tf:
                tf.write(text)
            idx_writer.writerow([str(p),str(txt_path),'ok',''])
            print(f'Extracted: {p.name} -> {txt_name}')
        except Exception as e:
            log_writer.writerow([str(p),'error',str(e)])
            print(f'Error extracting {p}: {e}')

print('Extraction complete. Index:', INDEX_CSV)
print('Log:', LOG_CSV)
