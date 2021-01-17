FROM ubuntu:20.04

ENV TZ=Asia/Tehran

# RUN apt-get -y purge ...
RUN apt-get -y update
# RUN apt-get -y upgrade

RUN apt-get install -y tzdata
RUN apt-get -y install build-essential
# RUN apt-get -y install mingw-w64
# RUN apt-get -y install ninja-build
RUN apt-get -y install pkg-config
# RUN apt-get -y install cmake
# RUN apt-get -y install zip unzip
RUN apt-get -y install git

RUN apt-get -y autoremove --purge
RUN apt-get -y autoclean
RUN apt-get -y clean

COPY scripts/entrypoint.sh /usr/sbin

ENV GOROOT="/home/hossein/Apps/go"
ENV PATH="/home/hossein/Apps/go/bin:${PATH}"
ENV GOCACHE=/tmp/go

RUN groupadd -g 1000 hossein && useradd --no-log-init -u 1000 -g hossein hossein
USER hossein

ENTRYPOINT ["/usr/sbin/entrypoint.sh"]
