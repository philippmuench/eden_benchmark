# eden_benchmark
comparison with fastcodeml

# dependencies

- [Fasta2Phylip.pl](https://indra.mullins.microbiol.washington.edu/cgi-bin/perlscript/info.cgi?ID=Fasta2Phylip.pl&path=perlscript-scripts)

# howto

1. place your benchmark dataset in the `data/` folder or use the `./download.sh` to download example eden datasets
2. use `./format.sh` to reformat the data (codon alignment) by using `./format.sh data/mysample`
3. run `sudo docker run -v data:/data -i -t --entrypoint /bin/bash philippmuench/eden_benchmark`
