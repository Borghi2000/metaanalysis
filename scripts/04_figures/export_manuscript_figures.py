#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exporta as figuras geradas em `outputs/figures/` (PNG) para os formatos que o
manuscrito consome, em `manuscript/figures/`: JPG (usado pelo \\includegraphics) e
PDF (versao para submissao).

Por que este script existe
--------------------------
Esta era a unica etapa do pipeline sem codigo versionado: os PNG eram convertidos a
mao. Isso permitia que uma figura fosse regerada em `outputs/` sem nunca chegar ao
manuscrito -- foi assim que o nomograma de Fagan publicado deixou de ser reproduzivel
pelo `sroc_curve.R`, e que copias defasadas ficaram encalhadas em `manuscript/figures`.

A lista de figuras NAO e' fixa aqui: ela e' extraida dos `\\includegraphics` do
`main.tex`. Assim a exportacao acompanha automaticamente o manuscrito, e uma figura
citada no texto mas ausente de `outputs/figures/` vira erro explicito em vez de um
arquivo silenciosamente velho.

Uso
---
    python scripts/04_figures/export_manuscript_figures.py
    python scripts/04_figures/export_manuscript_figures.py --check   # nao escreve
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

from PIL import Image

TEX = Path("manuscript/main.tex")
SRC = Path("outputs/figures")
DST = Path("manuscript/figures")
JPEG_QUALITY = 95


def figuras_do_manuscrito(tex: Path) -> list[str]:
    """Nomes-base das figuras referenciadas por \\includegraphics no main.tex."""
    padrao = re.compile(r"\\includegraphics\[[^\]]*\]\{figures/([^}]+)\}")
    nomes = [Path(m).stem for m in padrao.findall(tex.read_text(encoding="utf-8"))]
    vistos: dict[str, None] = dict.fromkeys(nomes)  # preserva ordem, remove repetidos
    return list(vistos)


def exportar(nome: str, checar: bool) -> str:
    origem = SRC / f"{nome}.png"
    if not origem.exists():
        return f"FALTA   {nome}.png nao existe em {SRC}/"
    if checar:
        return f"ok      {nome}"

    im = Image.open(origem)
    if im.mode in ("RGBA", "LA", "P"):
        fundo = Image.new("RGB", im.size, "white")
        im = im.convert("RGBA")
        fundo.paste(im, mask=im.split()[-1])
        im = fundo
    else:
        im = im.convert("RGB")

    im.save(DST / f"{nome}.jpg", "JPEG", quality=JPEG_QUALITY,
            subsampling=0, dpi=(300, 300))
    im.save(DST / f"{nome}.pdf", "PDF", resolution=300.0)
    return f"ok      {nome}  ({im.size[0]}x{im.size[1]})"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--check", action="store_true",
                    help="apenas verifica se todo PNG de origem existe")
    args = ap.parse_args()

    if not TEX.exists():
        print(f"[ERRO] {TEX} nao encontrado (rode a partir da raiz do repositorio)")
        return 2

    DST.mkdir(parents=True, exist_ok=True)
    nomes = figuras_do_manuscrito(TEX)
    print(f"{len(nomes)} figuras referenciadas em {TEX}\n")

    linhas = [exportar(n, args.check) for n in nomes]
    print("\n".join(linhas))

    faltando = sum(l.startswith("FALTA") for l in linhas)
    print(f"\n{len(nomes) - faltando}/{len(nomes)} exportadas"
          if not args.check else f"\n{len(nomes) - faltando}/{len(nomes)} disponiveis")
    if faltando:
        print(f"[ERRO] {faltando} figura(s) sem PNG de origem: rode os geradores antes.")
    return 1 if faltando else 0


if __name__ == "__main__":
    sys.exit(main())
