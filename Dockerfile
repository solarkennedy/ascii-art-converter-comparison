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

# [util-say](https://github.com/maandree/util-say/)
RUN apt-get -y install default-jdk default-jre texinfo
RUN wget -O util-say.zip https://github.com/maandree/util-say/archive/master.zip \
  && unzip util-say.zip \
  && cd util-say-master \
  && make \
  && cp img2ponysay /usr/bin/ \
  && cp util-say.jar /usr/bin/ \
  && cd .. && rm -rf util-say-master util-say.zip

# [catimg](https://github.com/posva/catimg) (C and Bash versions)
RUN apt-get -y install cmake imagemagick
RUN wget -O catimg.zip https://github.com/posva/catimg/archive/master.zip \
  && unzip catimg.zip \
  && cd catimg-master \
  && cmake . \
  && cp catimg /usr/bin/catimg.bash \
  && cp catimg-ext-colors.png /usr/bin/ \
  && make install \
  && cd .. && rm -rf catimg-master catimg.zip

# [img-cat](https://github.com/saikobee/img-cat/)
RUN apt-get -y install npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g img-cat

# [img2txt](http://manpages.ubuntu.com/manpages/hardy/man1/img2txt.1.html)
RUN apt-get -y install caca-utils

# [jp2a](https://csl.name/jp2a/)
RUN apt-get -y install jp2a
