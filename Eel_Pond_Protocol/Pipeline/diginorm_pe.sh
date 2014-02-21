#!/bin/bash
#Diginorm on paired ends

/usr/local/share/khmer/scripts/normalize-by-median.py -p -k 20 -C 20 -N 4 -x 3e9 --savehash normC20k20.kh *.pe.qc.fq.gz