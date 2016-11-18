# eden_benchmark
comparison with fastcodeml

# howto

1. place your benchmark dataset in the `data/` folder or use the `./download.sh` to download example eden datasets
2. use `./format.sh` to reformat the data (codon alignment) by using `./format.sh data/mysample`
3. run `sudo docker run -v data:/data -i -t --entrypoint /bin/bash philippmuench/eden_benchmark`
