#!/bin/bash

function take_screenshot {
  local input=$1
  local output=$2
  echo "Taking a screenshot of $input and saving it into $output"
  xterm -maximized -e "echo hi && cat $input && read" &
  sleep .5s
  window_id=$(xdotool search --class xterm | head)
  import -window "$window_id" /tmp/screenshot.png
  convert /tmp/screenshot.png -trim -background Grey -gravity Center -pointsize 48 label:"Method: $method" +swap -append $output
  killall xterm
}

function save_original {
  local input=$1
  local output=$2
  convert $input -trim -resize 600% -background Grey -gravity Center -pointsize 48 label:"Original" +swap -append $output
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
  save_original $input "outputs/${short_filename}.original.png"
done
