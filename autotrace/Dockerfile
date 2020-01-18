FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y build-essential \
    intltool imagemagick libmagickcore-dev pstoedit libpstoedit-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove -y

RUN cd /tmp && \
    git clone --depth 1 https://github.com/autotrace/autotrace.git && \
    cd autotrace && \
    ./autogen.sh && \
    LD_LIBRARY_PATH=/usr/local/lib ./configure --prefix=/usr && \
    make && make install 
