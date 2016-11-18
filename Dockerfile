FROM philippmuench/fastcodeml:1.1.0

MAINTAINER Philipp Muench "philippmuench@helmholtz-hzi.de"

RUN mkdir -p /data
COPY benchmark_fastcodeml.sh /usr/src/benchmark_fastcodeml.sh
ENTRYPOINT ["/bin/bash","/usr/src/benchmark_fastcodeml.sh"]
