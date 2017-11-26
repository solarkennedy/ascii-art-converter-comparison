report:
	./report.sh

build:
	docker build -t ascii-art-comparison .

debug:
	docker run -t -i -v $(PWD)/inputs:/inputs:ro -v $(PWD)/ascii:/ascii:rw -v $(PWD)/go.sh:/go.sh:ro  ascii-art-comparison bash

ascii: build
	docker run -t -i -v $(PWD)/inputs:/inputs:ro -v $(PWD)/ascii:/ascii:rw -v $(PWD)/go.sh:/go.sh:ro  ascii-art-comparison /go.sh

screenshots:
	./screenshots.sh

inputs: inputs/bender.png inputs/lenna.png inputs/nyan.png

inputs/bender.png:
	wget -O /tmp/input.jpg http://cdn.meme.am/images/300x/5090397.jpg
	convert -resize 160 /tmp/input.jpg $@
	convert -resize 640 /tmp/input.jpg $@.upscale

inputs/lenna.png:
	wget -O /tmp/input.png https://upload.wikimedia.org/wikipedia/en/2/24/Lenna.png
	convert -resize 160 /tmp/input.png $@
	convert -resize 640 /tmp/input.png $@.upscale

inputs/nyan.png:
	wget -O /tmp/input.png https://upload.wikimedia.org/wikipedia/en/e/ed/Nyan_cat_250px_frame.PNG
	convert -resize 160 /tmp/input.png $@
	convert -resize 640 /tmp/input.png $@.upscale

clean:
	git clean -fx
