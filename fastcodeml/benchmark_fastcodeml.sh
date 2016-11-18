#!/bin/bash

# iterate over all trees/codon alignment and run fastcodeml and measure the time

files=/data/sample/normal


rm -f /data/times.txt
echo "name;seq;start;end;diff" > /data/times.txt
rm -rf /data/output || true
mkdir -p /data/output
TREES=$files/tree/*.phy
for tree in $TREES
do
  sample=$(basename "$tree")
  basename="${sample%.*}"
  basename2="${basename%.*}"
  codon=$files/codon/$basename2.msa.phy

  seq=$(head -n 1 $codon | cut -c-1)
  
  START=$(date +%s)
  fast -m 22 -d 1 -nt 1 -bf $tree $codon > /data/output/$basename2.fastcodeml
#  fast -m 22 -d 1 -nt 1 -bf $tree $codon > /data/output/$basename2.h1.fastcodeml
  END=$(date +%s)
  lrt=$(grep "LRT:" /data/output/$basename2.fastcodeml | cut -d\   -f2)
  DIFF=$(( $END - $START ))
  echo "$basename2;$seq;$START;$END;$DIFF;$lrt" >> /data/times.txt
  echo "$basename2;$seq;$DIFF;$lrt"
done