build:
	docker build -t ascii-art-comparison .

ascii-output: build
	docker run -t -i ascii-art-comparison bash

screenshots: build
	./screenshots.sh

report: screenshots

