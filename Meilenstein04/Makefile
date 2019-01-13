LATEXMK=latexmk
DOT=dot

all: domaenenmodell.pdf foul.pdf fan.pdf besen.pdf wurf.pdf zelle.pdf ball.pdf ballSpieler.pdf
	$(LATEXMK) -pdf main.tex

domaenenmodell.pdf: ../Meilenstein01/domaenenmodell.dot
	$(DOT) -Tpdf -o domaenenmodell.pdf ../Meilenstein01/domaenenmodell.dot

foul.pdf: ../Meilenstein01/foul.dot
	$(DOT) -Tpdf -o foul.pdf ../Meilenstein01/foul.dot

fan.pdf: ../Meilenstein01/fan.dot
	$(DOT) -Tpdf -o fan.pdf ../Meilenstein01/fan.dot

besen.pdf: ../Meilenstein01/besen.dot
	$(DOT) -Tpdf -o besen.pdf ../Meilenstein01/besen.dot

wurf.pdf: ../Meilenstein01/wurf.dot
	$(DOT) -Tpdf -o wurf.pdf ../Meilenstein01/wurf.dot

zelle.pdf: ../Meilenstein01/zelle.dot
	$(DOT) -Tpdf -o zelle.pdf ../Meilenstein01/zelle.dot

ball.pdf: ../Meilenstein01/ball.dot
	$(DOT) -Tpdf -o ball.pdf ../Meilenstein01/ball.dot

ballSpieler.pdf: ../Meilenstein01/ballSpieler.dot
	$(DOT) -Tpdf -o ballSpieler.pdf ../Meilenstein01/ballSpieler.dot

clean:
	$(LATEXMK) -c
	rm *.pdf
