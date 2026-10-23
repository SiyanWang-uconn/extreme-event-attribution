.PHONY: bib main dell2025 git_bib git_meeting git_refer 

bib:
	bibtex-tidy manuscript/reference.bib --sort year,author --modify
main:
	latexmk -cd -pdf -outdir=build manuscript/main.tex
	latexmk -cd -c -outdir=build manuscript/main.tex

dell2025:
	latexmk -cd -pdf -outdir=build meeting_material/Topic_presentation/topic_presentation.tex
	latexmk -cd -c -outdir=build meeting_material/Topic_presentation/topic_presentation.tex

git_bib:
	git add manuscript/reference.bib
	git commit -m "Update reference"

git_meeting:
	git add meeting_material/meeting_minutes.md
	git commit -m "Update meeting_minutes"

git_refer:
	git add -- "references/$(file)"
	git diff --cached --quiet || git commit -m "Add $(file)"
