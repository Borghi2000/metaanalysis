from docx import Document
import os

doc_path = r"e:\Pesquisa projeto\PDF DA PESQUISA\paper_fusao_v10_criticas.docx"
doc = Document(doc_path)

keywords = ["Figura", "Figure", "SROC", "Forest", "PRISMA", "QUADAS", "Fagan", "Nomograma"]

print("--- FINDING PLACEHOLDERS ---")
for i, para in enumerate(doc.paragraphs):
    text = para.text.strip()
    if any(k.lower() in text.lower() for k in keywords):
        print(f"[{i}]: {text}")
