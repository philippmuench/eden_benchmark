#!/bin/bash

# download eden result
echo "download data..."
mkdir -p data
wget https://www.dropbox.com/s/xf86eaml6qauv3q/oligo.tar?dl=1 -O data/oligo.tar
wget https://www.dropbox.com/s/7usgqx72m4ndlf2/bmi.tar?dl=1 -O data/bmi.tar  
wget https://www.dropbox.com/s/ww9ubr4dufh15r9/bodysites.tar?dl=1 -O data/bodysites.tar
echo "done!"
