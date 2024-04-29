FROM ubuntu:22.04

RUN apt update \
    && apt install -y --no-install-recommends \
    tar gzip git \
    x11-apps mesa-utils \
    apt-transport-https ca-certificates \
    nettle-dev libjpeg-dev

WORKDIR /work
RUN git clone https://github.com/gsohler/openscad.git
WORKDIR /work/openscad
RUN git checkout python
RUN git submodule update --init --recursive
RUN ./scripts/uni-get-dependencies.sh
RUN mkdir build
WORKDIR /work/openscad/build
RUN cmake -DEXPERIMENTAL=1 -DENABLE_PYTHON=1 -DENABLE_LIBFIVE=1 ..
RUN make -j 8
RUN make install
RUN ldconfig
# optional
# RUN rm -rf /work
WORKDIR /openscad

ENTRYPOINT /usr/local/bin/openscad "$@"

