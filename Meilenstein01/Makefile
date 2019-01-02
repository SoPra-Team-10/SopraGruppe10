LATEXMK=latexmk
DOT=dot

all: domaenenmodell.pdf
	$(LATEXMK) -pdf -silent main.tex

domaenenmodell.pdf: domaenenmodell.dot
	$(DOT) -Tpdf -o domaenenmodell.pdf domaenenmodell.dot

clean:
	$(LATEXMK) -c
	rm *.pdf
