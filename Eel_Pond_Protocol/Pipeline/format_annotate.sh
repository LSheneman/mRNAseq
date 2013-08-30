#!/bin/bash
#Format data for annotation against mouse

#unzip current data
gunzip trinity-nematostella.renamed.fa.gz

#Get latest mouse RefSeq
curl -O ftp://ftp.ncbi.nih.gov/refseq/M_musculus/mRNA_Prot/mouse.protein.faa.gz
gunzip mouse.protein.faa.gz

#format both databases for BLAST
formatdb -i mouse.protein.faa -o T -p T
blastall -i mouse.protein.faa -d trinity-nematostella.renamed.fa -e 1e-3 -p tblastn -o mouse.x.nema -a 8 -v 4 -b 4
