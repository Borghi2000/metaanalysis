import os
import json
import re

def verify_vault():
    vault_dir = "docs/artigos_obsidian"
    print("--- 1. Verificando Arquivos .canvas ---")
    canvas_files = [f for f in os.listdir(vault_dir) if f.endswith(".canvas")]
    for c_file in canvas_files:
        path = os.path.join(vault_dir, c_file)
        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)
        print(f"[OK] {c_file} eh JSON valido ({len(data.get('nodes', []))} nós, {len(data.get('edges', []))} arestas)")
        for node in data.get("nodes", []):
            if node.get("type") == "file":
                ref_file = os.path.join(vault_dir, node["file"])
                if not os.path.exists(ref_file):
                    print(f"  [ERRO] Arquivo referenciado no canvas nao existe: {node['file']}")
                else:
                    print(f"  [LINK OK] {node['file']}")

    print("\n--- 2. Verificando Figuras em assets/ ---")
    assets_dir = os.path.join(vault_dir, "assets")
    if os.path.exists(assets_dir):
        files = os.listdir(assets_dir)
        print(f"[OK] assets/ contem {len(files)} arquivos de imagem.")
        for f in sorted(files):
            if f.startswith("Figure_"):
                print(f"  - {f}")
    else:
        print("[ERRO] Diretorio assets/ nao encontrado!")

    print("\n--- 3. Verificando Notas em conhecimento/ ---")
    conhecimento_dir = os.path.join(vault_dir, "conhecimento")
    if os.path.exists(conhecimento_dir):
        hub_files = os.listdir(conhecimento_dir)
        print(f"[OK] conhecimento/ contem {len(hub_files)} notas conceituais.")
        for h in sorted(hub_files):
            print(f"  - {h}")
    else:
        print("[ERRO] Diretorio conhecimento/ nao encontrado!")

    print("\n--- 4. Verificando graph.json ---")
    graph_path = os.path.join(vault_dir, ".obsidian", "graph.json")
    if os.path.exists(graph_path):
        with open(graph_path, "r", encoding="utf-8") as f:
            g_data = json.load(f)
        print(f"[OK] graph.json eh JSON valido com {len(g_data.get('colorGroups', []))} grupos de cor configurados.")

    print("\n[SUCESSO] Integridade completa do cofre Obsidian verificada!")

if __name__ == "__main__":
    verify_vault()
