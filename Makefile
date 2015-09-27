report: screenshots

build:
	docker build -t ascii-art-comparison .

ascii-output: build
	docker run -t -i -v $(PWD)/inputs:/inputs:ro -v $(PWD)/ascii:/ascii:rw -v $(PWD)/go.sh:/go.sh:ro  ascii-art-comparison /go.sh

screenshots: build inputs
	./screenshots.sh

inputs: inputs/bender.png

inputs/bender.png:
	wget -O inputs/bender.png https://upload.wikimedia.org/wikipedia/en/a/a6/Bender_Rodriguez.png
	convert -size 160 inputs/bender.png inputs/bender-resized.png
	mv inputs/bender-resized.png inputs/bender.png

clean:
	git clean -fx
