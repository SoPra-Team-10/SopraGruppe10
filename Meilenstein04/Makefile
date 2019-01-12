PDFLATEX=pdflatex
DOT=dot

all: 
	$(PDFLATEX) -includedirectory=Meilenstein01 -includedirectory=Meilenstein02 -includedirectory=Meilenstein03 main.tex

clean:
	$(LATEXMK) -c
	rm *.pdf
