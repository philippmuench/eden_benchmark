FROM philippmuench/eden:server_mode

MAINTAINER Philipp Muench "philippmuench@helmholtz-hzi.de"

USER root
COPY benchmark_eden.sh /usr/src/benchmark_eden.sh
ENTRYPOINT ["/bin/bash","/usr/src/benchmark_eden.sh"]
