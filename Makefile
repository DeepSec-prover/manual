
PANDOC = pandoc --syntax-definition deepsec.xml
IFORMAT = markdown
# FLAGS = --standalone --toc --toc-depth=2 --mathjax=$(MATHJAX)
FLAGS = --standalone --mathjax=$(MATHJAX) 
# STYLE = style.css

ifdef MATHJAX_LOCAL
  MATHJAX = ${MATHJAX_LOCAL}
else
  MATHJAX ?= "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
endif

TEMPLATE_HTML = template/template.html
TEMPLATE_LATEX = template/template.tex

SRC = $(sort $(wildcard src/*.md)) 
SRCPDF = tex/manual.tex tex/install.tex tex/tutorial.tex tex/advanced.tex tex/gui.tex tex/grammar.tex tex/command.tex template/main.tex 
SRCHTML = html/manual.html html/install.html html/tutorial.html html/advanced.html html/gui.html html/grammar.html html/command.html


all: index.html DeepSec-manual.pdf

DeepSec-manual.pdf: $(SRCPDF)
	pdflatex template/main.tex
	biber main
	pdflatex template/main.tex
	pdflatex template/main.tex
	mv main.pdf DeepSec-manual.pdf
	rm main.*

index.html: $(SRCHTML)
	mv html/manual.html index.html

html/%.html: src/%.md
	$(PANDOC) \
	  --template $(TEMPLATE_HTML)\
		--bibliography=biblio.bib\
		--csl=ieee.csl\
	  -t html -o $@ $<

tex/%.tex: src/%.md
	mkdir -p tex
	$(PANDOC) \
		--top-level-division=chapter\
	  --bibliography=biblio.bib\
		--biblatex\
	  -t latex -o $@ $<


template/main.tex: template/main.md
	$(PANDOC) $(FLAGS) template/main.md -o template/main.tex


clean:
	-rm -f html/*.html *.html *.tex tex/*.tex template/main.tex
	-rmdir tex
