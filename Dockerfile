FROM debian:bullseye-slim

LABEL author="Philipp Szechenyi"
LABEL description="Samtools container"

RUN apt-get update && \
apt-get install -y bzip2 \
build-essential \
libncurses-dev \
zlib1g-dev \
libbz2-dev \
liblzma-dev

WORKDIR /Samtools

ADD https://github.com/samtools/samtools/releases/download/1.14/samtools-1.14.tar.bz2 /

RUN tar -xf /samtools-1.14.tar.bz2

WORKDIR /Samtools/samtools-1.14
RUN ./configure
RUN make
RUN make install

ENTRYPOINT ["/Samtools/samtools-1.14/samtools"]
