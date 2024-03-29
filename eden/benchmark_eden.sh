#!/bin/bash

# iterate over all trees/codon alignment and run fastcodeml and measure the time

files=/data

rm -rf /data/times_eden.txt || true
echo "name;seq;start;end;diff" > /data/times_eden.txt
rm -rf /data/output_eden || true
mkdir -p /data/output_eden
TREES=$files/tree/*.phy
for tree in $TREES
do
  sample=$(basename "$tree")
  basename="${sample%.*}"
  basename2="${basename%.*}"
  codon=$files/codon/$basename2.msa
  seq=$(grep -c ">" $codon)
  START=$(date +%s%3N)
  java -cp /home/eden/src/phyloTreeTools/ phyloDriver \
    -p -n $tree \
    -t $files/msa/faa/$basename2.msa \
    -f DelTran -cyt \
    -o /data/output_eden/$basename.txt \
    -tc $files/codon/$basename2.msa \
    -d > /dev/null 2> /dev/null || true
  END=$(date +%s%3N)
  DIFF=$(( $END - $START ))
  echo "$basename2;$seq;$START;$END;$DIFF" >> /data/times_eden.txt
  echo "$basename2;$seq;$DIFF"
done
