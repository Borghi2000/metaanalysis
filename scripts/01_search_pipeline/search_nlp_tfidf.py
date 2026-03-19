import os
import pandas as pd
from Bio import Entrez
import requests
from bs4 import BeautifulSoup
from dotenv import load_dotenv
import time

# Configurações do PubMed
Entrez.email = "seu-email@exemplo.com" # Placeholder
Entrez.api_key = os.getenv("PUBMED_API_KEY")

def search_pubmed(query, max_results=4000):
    print(f"[+] Buscando no PubMed: '{query}'...")
    handle = Entrez.esearch(db="pubmed", term=query, retmax=max_results)
    record = Entrez.read(handle)
    handle.close()
    return record["IdList"]

def fetch_details(id_list):
    print(f"[+] Extraindo detalhes de {len(id_list)} artigos...")
    ids = ",".join(id_list)
    handle = Entrez.efetch(db="pubmed", id=ids, retmode="xml")
    records = Entrez.read(handle)
    handle.close()
    
    results = []
    for article in records["PubmedArticle"]:
        try:
            pmid = article["MedlineCitation"]["PMID"]
            title = article["MedlineCitation"]["Article"]["ArticleTitle"]
            year = article["MedlineCitation"]["Article"]["Journal"]["JournalIssue"]["PubDate"].get("Year", "N/A")
            authors = "N/A"
            if "AuthorList" in article["MedlineCitation"]["Article"]:
                authors = article["MedlineCitation"]["Article"]["AuthorList"][0]["LastName"]
            
            results.append({
                "paper_id": str(pmid),
                "authors": f"{authors} {year}",
                "year": year,
                "title": title,
                "source": "PubMed",
                "relevance_score": 1.0 # Trivial score for recovery
            })
        except:
            continue
    return results

if __name__ == "__main__":
    query = "(Generative AI OR LLM OR VLM OR ChatGPT) AND (Thoracic OR Chest OR Radiology OR X-ray)"
    ids = search_pubmed(query)
    data = fetch_details(ids)
    df = pd.DataFrame(data)
    
    output_path = "data/raw/all_results_dta.csv"
    os.makedirs("data/raw", exist_ok=True)
    df.to_csv(output_path, index=False)
    print(f"✅ Recuperação concluída: {len(df)} artigos salvos em {output_path}")
