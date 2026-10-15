.PHONY: bib main git_bib git_meeting git_refer

bib:
	bibtex-tidy manuscript/reference.bib --sort year,author --modify
main:
	latexmk -cd -pdf -outdir=build manuscript/main.tex
	latexmk -cd -c -outdir=build manuscript/main.tex

git_bib:
	git add manuscript/reference.bib
	git commit -m "Update reference"

git_meeting:
	git add meeting_material/meeting_minutes.md
	git commit -m "Update meeting_minutes"

git_refer:
	git add -- "references/$(file)"
	git diff --cached --quiet || git commit -m "Add $(file)"
	git push