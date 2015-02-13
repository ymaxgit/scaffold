RUBBER=rubber -Wrefs -Wmisc

pdf: paper.pdf
.PHONY: pdf

paper.pdf: paper.tex
	$(RUBBER) --pdf paper.tex
.PHONY: paper.pdf

clean:
	$(RUBBER) --pdf --clean paper.tex
	$(RUBBER) --ps --clean paper.tex
.PHONY: clean

ps: paper.ps
.PHONY: ps

# for submission
submission: paper.ps
	mv paper.ps haskel01-terei.ps
	mv paper.pdf haskel01-terei.pdf
.PHONY: submission

paper.ps:
	$(RUBBER) --ps paper.tex
.PHONY: paper.ps

# rubber doesn't work on OSX for me, so raw commands...
raw:
	pdflatex paper
	bibtex paper
	pdflatex paper
	pdflatex paper
.PHONE: raw
