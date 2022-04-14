#
# Build a PDF with all the notebooks 
#
TEMPLATE=latex
NOTEBOOKS=Lecture-1-Numpy\
          Lecture-2-Matplotlib

LATEXFILES=$(NOTEBOOKS:.ipynb=.tex)

.ipynb.tex:
	jupyter nbconvert --to latex --template $(TEMPLATE) $<

all: latexfiles buildpdf

latexfiles:
	for notebook in $(NOTEBOOKS) ; do \
		jupyter nbconvert --to latex --template $(TEMPLATE) $$notebook ; \
	done

buildpdf: latexfiles
	for notebook in $(NOTEBOOKS) ; do \
		pdflatex $$notebook ; \
	done
    
