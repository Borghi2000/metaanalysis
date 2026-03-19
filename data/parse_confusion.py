#!/usr/bin/env python3
"""
Parse extracted text files for diagnostic accuracy data (TP,FP,FN,TN, sensitivity, specificity, N, architecture, condition).
Writes data/raw_extracted.csv with one row per PDF/text file and guessed fields.
"""
import re
import csv
from pathlib import Path
BASE = Path(__file__).resolve().parents[1]
TEXT_DIR = BASE / 'data' / 'artigos_pdf' / 'texto_extraido'
OUTPUT = BASE / 'data' / 'raw_extracted.csv'

# heuristics (ordered)
re_tp = re.compile(r"\bTP[:=]?\s*(\d{1,6})\b", re.I)
re_fp = re.compile(r"\bFP[:=]?\s*(\d{1,6})\b", re.I)
re_fn = re.compile(r"\bFN[:=]?\s*(\d{1,6})\b", re.I)
re_tn = re.compile(r"\bTN[:=]?\s*(\d{1,6})\b", re.I)
re_sens = re.compile(r"sensitivity\s*(?:[:=]\s*)?(\d{1,3}\.\d+|\d{1,3})%?", re.I)
re_spec = re.compile(r"specificity\s*(?:[:=]\s*)?(\d{1,3}\.\d+|\d{1,3})%?", re.I)
re_n = re.compile(r"\bN[:=]?\s*(\d{1,6})\b")
re_conf_matrix = re.compile(r"confusion matrix[:\s]*\[?\s*\[?\s*(\d{1,6})[,\s]+(\d{1,6})[,\s]*\]?[,;\s]*\[?\s*(\d{1,6})[,\s]+(\d{1,6})\s*\]?", re.I)
re_arch = re.compile(r"architecture[:\s]*([A-Za-z0-9_\- /]+)", re.I)
re_cond = re.compile(r"condition[:\s]*([A-Za-z0-9_\- /]+)", re.I)

files = list(TEXT_DIR.glob('*.txt')) if TEXT_DIR.exists() else []
rows = []
for f in files:
    text = f.read_text(encoding='utf-8', errors='ignore')
    t = text.replace('\n',' ')
    tp = fp = fn = tn = sens = spec = N = ''
    note = []

    # try confusion matrix
    m = re_conf_matrix.search(t)
    if m:
        tp, fp, fn, tn = m.group(1), m.group(2), m.group(3), m.group(4)
        note.append('matrix')
    else:
        m = re_tp.search(t)
        if m: tp = m.group(1)
        m = re_fp.search(t)
        if m: fp = m.group(1)
        m = re_fn.search(t)
        if m: fn = m.group(1)
        m = re_tn.search(t)
        if m: tn = m.group(1)

    m = re_sens.search(t)
    if m:
        sens = m.group(1)
        # if percent, convert
        try:
            if '%' in m.group(0):
                sens = float(sens)/100.0
            else:
                val = float(sens)
                if val>1: sens = val/100.0
                else: sens = val
        except:
            pass
    m = re_spec.search(t)
    if m:
        spec = m.group(1)
        try:
            if '%' in m.group(0):
                spec = float(spec)/100.0
            else:
                val = float(spec)
                if val>1: spec = val/100.0
                else: spec = val
        except:
            pass
    m = re_n.search(t)
    if m:
        N = m.group(1)

    m = re_arch.search(t)
    arch = m.group(1).strip() if m else ''
    m = re_cond.search(t)
    cond = m.group(1).strip() if m else ''

    rows.append({
        'text_file': str(f), 'tp': tp, 'fp': fp, 'fn': fn, 'tn': tn,
        'sensitivity': sens, 'specificity': spec, 'N': N, 'architecture': arch, 'condition': cond,
        'note': ';'.join(note)
    })

with OUTPUT.open('w', newline='', encoding='utf-8') as outf:
    writer = csv.DictWriter(outf, fieldnames=['text_file','tp','fp','fn','tn','sensitivity','specificity','N','architecture','condition','note'])
    writer.writeheader()
    for r in rows:
        writer.writerow(r)

print('Parsed', len(rows), 'text files. Output ->', OUTPUT)
print('Please manually review and curate data/raw_extracted.csv for ambiguous or missing values before running R meta-analysis.')
