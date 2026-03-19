from docx import Document
import os

doc_path = r"e:\Pesquisa projeto\PDF DA PESQUISA\paper_fusao_v10_criticas.docx"
if os.path.exists(doc_path):
    doc = Document(doc_path)
    for i, para in enumerate(doc.paragraphs):
        if para.text.strip():
            print(f"{i}: {para.text}")
else:
    print("File not found.")
