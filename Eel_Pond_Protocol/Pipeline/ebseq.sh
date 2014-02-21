#!/bin/bash
#Get ebseq matrix
cp ../rsem/0-vs-6-hour.matrix .
rsem-run-ebseq 0-vs-6-hour.matrix 5,5 0-vs-6-hour.changed