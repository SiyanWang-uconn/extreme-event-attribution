.PHONY: bib main

bib:
	bibtex-tidy.cmd manuscript/reference.bib --sort year,author --modify
main:
	latexmk -cd -pdf -outdir=build manuscript/main.tex
	latexmk -cd -c -outdir=build manuscript/main.tex