[![Build Status](https://travis-ci.org/SoPra-Team-10/Uebungsblaetter.svg?branch=master)](https://travis-ci.org/SoPra-Team-10/Uebungsblaetter)

# SopraGruppe10

# Fertige PDFs
 * [Meilenstein01.pdf](https://SoPra-Team-10.github.io/Uebungsblaetter/Meilenstein01.pdf)
 * [Meilenstein02.pdf](https://SoPra-Team-10.github.io/Uebungsblaetter/Meilenstein02.pdf)
 * [Meilenstein03.pdf](https://SoPra-Team-10.github.io/Uebungsblaetter/Meilenstein03.pdf)
 * [Meilenstein04.pdf](https://SoPra-Team-10.github.io/Uebungsblaetter/Meilenstein04.pdf)
 * [Meilenstein05.pdf](https://SoPra-Team-10.github.io/Uebungsblaetter/Meilenstein05.pdf)
 * [Meilenstein06.pdf](https://SoPra-Team-10.github.io/Uebungsblaetter/Meilenstein06.pdf)
 * [Endabnahme.pdf](https://SoPra-Team-10.github.io/Uebungsblaetter/Endabnahme.pdf)
 * [Pflichtenheft.pdf](https://SoPra-Team-10.github.io/Uebungsblaetter/Pflichtenheft.pdf)

# Build Dependencies
 * Graphviz-Dot
 * Gnu-Make
 * latexmk
 * pdflatex

 # Graphviz on Windows
1. Graphviz runterladen ([Download link](https://graphviz.gitlab.io/download/))
2. Graphviz installieren (am besten in default location, is ja nich so groß)
<a name="SysPath"></a>
3. Graphviz zu Systempfad hinzufügen:
    * Windows+R, dann `"sysdm.cpl"` eingeben
    * Tab "Erweitert" -> Umgebungsvariablen
    * Unter "Systemvariablen" -> Doppelklick auf Path
    * Neu und dann Pfad zur binary also z.B. `"C:\Program Files (x86)\Graphviz2.38\bin"`
4. Jetzt sollte man `.dot`-Files über die Kommandozeile kompillieren können: 
    >`dot -Tpdf -o <file name> <outputfile>`
    
    Hinweis: Das outputfile sollte die Endung `.pdf` haben.

# Make on Windows
1. Make runterladen und installieren ([Download link](http://gnuwin32.sourceforge.net/packages/make.htm))
2. Pathvariablen setzen (siehe [hier](#SysPath))
3. Jetzt kann Make mit
    >`make <target>`

    aus der Kommandozeile aufgerufen werden (geht auch mit git bash)
