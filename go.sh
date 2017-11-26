#!/bin/bash

methods="
img2xterm
termplay
TerminalImageViewer
pixterm
timg
"

function img2xterm() {
  /usr/local/bin/img2xterm $1 >$2
}

function termplay() {
  /root/.cargo/bin/termplay image -h 160 -w 160 --ratio 178 $1 >$2
}

function TerminalImageViewer() {
  script --return -c "/usr/local/bin/tiv -w 160 -h 160 -f $1.upscale" /dev/null | grep -v 'null' >$2
}

function pixterm() {
  script --return -c "/root/gocode/bin/pixterm -tr 80 -tc 160 -s 1 $1" /dev/null | grep -v 'null' > $2
}

function timg() {
  /usr/local/bin/timg -g 160x160 $1 >$2
}

function make_ascii () {
  for input in /inputs/*.png; do
    for method in $methods; do
      filename=$(basename "$input")
      short_filename="${filename%.*}"
      output_filename="/ascii/${short_filename}.${method}.ascii"
      echo $input using $method
      time $method $input $output_filename
    done
  done
}

make_ascii
