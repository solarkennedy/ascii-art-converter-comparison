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
  && make install

# [util-say](https://github.com/maandree/util-say/)

# [catimg](https://github.com/posva/catimg) (C and Bash versions)

# [manytools](https://github.com/maandree/util-say/)

# [img-cat](https://github.com/saikobee/img-cat/)

# [img2txt](http://manpages.ubuntu.com/manpages/hardy/man1/img2txt.1.html)

# [aview](http://aa-project.sourceforge.net/aview/)

# [jp2a](https://csl.name/jp2a/)
