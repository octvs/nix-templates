all: main.pdf

main.pdf: %.pdf: %.tex
	latexmk -pdf -lualatex $<

.PHONY: all 
