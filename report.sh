#!/bin/bash
set -e

function report_method {
  local file=$1
  local method=$2
  local local_file="/uploads/`basename $file`"
  local original_file=`echo $local_file | cut -f 3 -d '/' | cut -f 1,3 -d . `
  echo "![$original_file converted using $method]($local_file '$original_file converted using $method')"
}

methods="
original
img2xterm
termplay
TerminalImageViewer
pixterm
"

for input in inputs/*.png; do
  filename=$(basename "$input")
  echo ""
  echo "## $filename"
  for method in $methods; do
    short_filename="${filename%.*}"
    output_filename="outputs/${short_filename}.${method}.png"
    report_method $output_filename $method
  done
done

