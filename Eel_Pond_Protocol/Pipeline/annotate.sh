#!/bin/bash
#Annotate the sequences

python /usr/local/share/eel-pond/annotate-seqs.py trinity-nematostella.renamed.fa nema.x.mouse.ortho nema.x.mouse.homol
cp trinity-nematostella.renamed.fa.annot nematostella.fa