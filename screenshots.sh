#!/bin/bash

function take_screenshot {
  local input=$1
  local output=$2
  echo "Taking a screenshot of $input and saving it into $output"
  xterm -maximized -e "echo hi && cat $input && read" &
  sleep .5s
  import -window "$(xdotool search --class xterm)" $output
  killall xterm
}

methods="
img2xterm
util-say
catimg
catimg-bash
img-cat
img2txt
jp2a
"

for input in inputs/*.png; do
  echo "Working on input file $input"
  for method in $methods; do
    filename=$(basename "$input")
    short_filename="${filename%.*}"
    input_filename="ascii/${short_filename}.${method}.ascii"
    output_filename="outputs/${short_filename}.${method}.png"
    take_screenshot $input_filename $output_filename
  done
done
