# ascii-art-converter-comparison

A comparison of tools that convert images to ascii/ansi art

## List of Tools Compared

* [img2xterm](https://github.com/rossy/img2xterm)
* [util-say](https://github.com/maandree/util-say/)
* [catimg](https://github.com/posva/catimg) (C and Bash versions)
* [manytools](http://manytools.org/hacker-tools/convert-images-to-ascii-art/)
* [img-cat](https://github.com/saikobee/img-cat/)
* [img2txt](http://manpages.ubuntu.com/manpages/hardy/man1/img2txt.1.html)
* [aview](http://aa-project.sourceforge.net/aview/)
* [jp2a](https://csl.name/jp2a/)

## Usage

### Build The Docker Image + Output The ASCII Files

    make build

### Launch xterm with the ASCII Files and take Screenshots

    make screenshots

### Build A Markdown [Report](https://github.com/solarkennedy/ascii-art-converter-comparison/blob/master/report.md)

    make report
