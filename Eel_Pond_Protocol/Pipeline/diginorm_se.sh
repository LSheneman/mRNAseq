#!/bin/bash
#Run diginorm on single ends

   /usr/local/share/khmer/scripts/normalize-by-median.py -C 20 --loadhash normC20k20.kh --savehash normC20k20.kh *.se.qc.fq.gz