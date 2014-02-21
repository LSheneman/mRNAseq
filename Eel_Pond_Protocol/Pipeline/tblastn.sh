#!/bin/bash
#Run tblastn

blastall -i mouse.protein.faa -d trinity-nematostella.renamed.fa -e 1e-3 -p tblastn -o mouse.x.nema -a 8 -v 4 -b 4
