#!/bin/bash
#Format assembled data for Blastkit

cp trinity_out_dir/Trinity.fasta /root/blastkit/db/db.fa
cd /root/blastkit
formatdb -i db/db.fa -o T -p F
python index-db.py db/db.fa