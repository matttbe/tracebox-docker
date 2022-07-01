FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        build-essential autoconf automake libtool liblua5.2-dev libpcap-dev \
        libjson-c-dev libcurl4-gnutls-dev lua-ldoc libnetfilter-queue-dev lua5.2 \
        git ca-certificates && \
    apt-get clean && rm -r /var/lib/apt/

RUN cd /tmp && \
    git clone https://github.com/tracebox/tracebox.git && \
    cd tracebox && \
        ./bootstrap.sh && \
        ./configure --disable-dependency-tracking && \
        make -j$(nproc) && \
        make install && \
    cd / && rm -rf tracebox

ENTRYPOINT ["/usr/local/bin/tracebox"]
