#!/bin/bash

# script to iterate over all codon alignments and create .phy format
# $1 input folder where .msa 

# tar xvf file.tar
# usuage: ./format.sh data/oligo

FILES=$1/*/codon/*.msa
for f in $FILES
do
        echo "Processing $f file..."
        ./Fasta2Phylip.pl $f $f.phy
done
