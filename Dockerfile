FROM ubuntu:18.04

ENV pgbadger_version="10.0"


RUN apt-get update && \
    apt-get install perl make -y
ADD https://github.com/darold/pgbadger/archive/v${pgbadger_version}.tar.gz /tmp
RUN ls -lh /tmp
RUN cd /tmp/ && \
    tar -xzf v${pgbadger_version}.tar.gz && \
    cd pgbadger-${pgbadger_version} && \
    perl Makefile.PL && \
    make && \
    make install

ENTRYPOINT [ "pgbadger" ]
CMD ["--help"]


