all: main.pdf

main.pdf: %.pdf: %.tex
	latexmk -quiet -pdf -lualatex $<

.PHONY: all 
