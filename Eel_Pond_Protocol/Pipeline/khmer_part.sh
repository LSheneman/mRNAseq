#!/bin/bash
#Partion assembly

gzip -c trinity_out_dir/Trinity.fasta > trinity-nematostella-raw.fa.gz
python /usr/local/share/khmer/scripts/do-partition.py -x 1e9 -N 4 --threads 4 nema trinity-nematostella-raw.fa.gz
