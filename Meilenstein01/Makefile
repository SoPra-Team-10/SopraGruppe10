LATEXMK=latexmk
DOT=dot

all: domaenenmodell.pdf foul.pdf fan.pdf besen.pdf wurf.pdf zelle.pdf ball.pdf ballSpieler.pdf
	$(LATEXMK) -pdf  main.tex

domaenenmodell.pdf: domaenenmodell.dot
	$(DOT) -Tpdf -o domaenenmodell.pdf domaenenmodell.dot

foul.pdf: foul.dot
	$(DOT) -Tpdf -o foul.pdf foul.dot

fan.pdf: fan.dot
	$(DOT) -Tpdf -o fan.pdf fan.dot

besen.pdf: besen.dot
	$(DOT) -Tpdf -o besen.pdf besen.dot

wurf.pdf: wurf.dot
	$(DOT) -Tpdf -o wurf.pdf wurf.dot

zelle.pdf: zelle.dot
	$(DOT) -Tpdf -o zelle.pdf zelle.dot

ball.pdf: ball.dot
	$(DOT) -Tpdf -o ball.pdf ball.dot

ballSpieler.pdf: ballSpieler.dot
	$(DOT) -Tpdf -o ballSpieler.pdf ballSpieler.dot

clean:
	$(LATEXMK) -c
	rm *.pdf
