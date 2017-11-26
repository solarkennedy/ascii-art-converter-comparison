FROM ubuntu:14.04
RUN apt-get update && apt-get -y install \
  libmagick++-dev libncurses5-dev \
  build-essential wget unzip
WORKDIR /tmp

# [img2xterm](https://github.com/rossy/img2xterm)
RUN wget -O img2xterm.zip https://github.com/rossy/img2xterm/archive/master.zip \
  && unzip img2xterm.zip \
  && cd img2xterm-master \
  && make \
  && make install \
  && cd .. && rm -rf img2xterm-master img2xterm.zip

# [termplay](https://github.com/jD91mZM2/termplay)
RUN apt-get -y install curl
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH $PATH:/root/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/
RUN apt-get -y install libopenal-dev libsndfile1-dev
RUN cargo install termplay --no-default-features
  
# [TerminalImageViewer](https://github.com/stefanhaustein/TerminalImageViewer)
RUN apt-get -y install imagemagick
RUN wget -O tiv.zip https://github.com/stefanhaustein/TerminalImageViewer/archive/master.zip \
  && unzip tiv.zip \
  && cd TerminalImageViewer-master/src/main/cpp \
  && make && make install 

# [pixterm](https://github.com/eliukblau/pixterm)
RUN apt-get -y install git
RUN curl -O https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz \
  && tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz \
  && rm go1.9.2.linux-amd64.tar.gz
RUN mkdir /root/gocode && GOPATH=/root/gocode /usr/local/go/bin/go get -u github.com/eliukblau/pixterm

# [timg](https://github.com/hzeller/timg)
RUN apt-get -y install libwebp-dev libgraphicsmagick++-dev
RUN wget -O timg.zip https://github.com/hzeller/timg/archive/v0.9.5.zip \
  && unzip timg.zip \
  && cd timg-0.9.5/src \
  && make && make install
