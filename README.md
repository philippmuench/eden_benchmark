# eden_benchmark
comparison with fastcodeml

# dependencies

- [Fasta2Phylip.pl](https://indra.mullins.microbiol.washington.edu/cgi-bin/perlscript/info.cgi?ID=Fasta2Phylip.pl&path=perlscript-scripts) (must be in $PATH, or change path in `fastcodeml/format.sh` line 13)

# run benchmarking

1. place your benchmark dataset in the `data/` folder or use the `./download.sh` to download benchmark datasets used in the manuscript
2. use `fastcodeml/format.sh` to reformat the data (codon alignment) by using `fastcodeml/format.sh data/mysample`
3. create benchmarking of fastcodeml `sudo docker run --cpuset-cpus="0" -v data/sample:/data philippmuench/eden_benchmark:fastcodeml`. Benchmarking times will be written to `data/times_fastcodeml.txt`
4. create benchmarking of eden `sudo docker run --cpuset-cpus="0" -v data/sample:/data philippmuench/eden_benchmark:eden`. Benchmarking times will be written to `data/times_eden.txt`
