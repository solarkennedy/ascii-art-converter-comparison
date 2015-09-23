#!/bin/bash

methods="
img2xterm
util-say
catimg
catimg-bash
img-cat
img2txt
jp2a
"

function img2xterm() {
  /usr/local/bin/img2xterm $1 >$2
}

function util-say() {
  /usr/bin/img2ponysay  -- $1 | grep -v '\$' >$2
}

function catimg() {
  /usr/local/bin/catimg $1 >$2
}

function catimg-bash() {
  /usr/bin/catimg.bash $1 >$2
}

function img-cat() {
  /usr/bin/catimg $1 >$2
}

function img2txt() {
  /usr/bin/img2txt $1 >$2
}

function jp2a() {
  filename=$(basename "$1")
  short_filename="${filename%.*}"
  convert $1 /tmp/${short_filename}.jpg
  /usr/bin/jp2a /tmp/${short_filename}.jpg > $2
}

function make_ascii () {
  for input in /inputs/*.png; do
    for method in $methods; do
      filename=$(basename "$input")
      short_filename="${filename%.*}"
      output_filename="/ascii/${short_filename}.${method}.ascii"
      $method $input $output_filename
    done
  done
}

make_ascii
