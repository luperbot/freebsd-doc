=====================
3.3. Puffer-?berl?ufe
=====================

.. raw:: html

   <div class="navheader">

3.3. Puffer-?berl?ufe
`Zur?ck <secure-philosophy.html>`__?
Kapitel 3. Sicheres Programmieren
?\ `Weiter <secure-setuid.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3. Puffer-?berl?ufe
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puffer-?berl?ufe gibt es schon seit den Anf?ngen der
Von-Neuman-Architektur `1 <bi01.html#COD>`__. Sie erlangten zum ersten
Mal durch den Internetwurm Morris im Jahre 1988 ?ffentliche Bekanntheit.
Ungl?cklicherweise funktioniert der gleiche grundlegende Angriff noch
heute. Die bei weitem h?ufigste Form eines Puffer-?berlauf-Angriffs
basiert darauf, den Stack zu korrumpieren.

Die meisten modernen Computer-Systeme verwenden einen Stack, um
Argumente an Prozeduren zu ?bergeben und lokale Variablen zu speichern.
Ein Stack ist ein last-in-first-out-Puffer (LIFO) im hohen
Speicherbereich eines Prozesses. Wenn ein Programm eine Funktion aufruft
wird ein neuer "Stackframe" erzeugt. Dieser besteht aus den Argumenten,
die der Funktion ?bergeben wurden und einem variabel grossem Bereich f?r
lokale Variablen. Der "Stack-Pointer" ist ein Register, dass die
aktuelle Adresse der Stack-Spitze enth?lt. Da sich dieser Wert oft
?ndert, wenn neue Werte auf dem Stack abgelegt werden, bieten viele
Implementierungen einen "Frame-Pointer", der nahe am Anfang des
Stack-Frames liegt und es so leichter macht lokale Variablen relativ zum
aktuellen Stackframe zu adressieren. `1 <bi01.html#COD>`__ Die
R?cksprungadresse der Funktionen werden ebenfalls auf dem Stack
gespeichert und das ist der Grund f?r Stack-?berlauf-Exploits. Denn ein
b?swilliger Nutzer kann die R?cksprungadresse der Funktion ?berschreiben
indem er eine lokale Variable in der Funktion ?berlaufen l?sst, wodurch
es ihm m?glich ist beliebigen Code auszuf?hren.

Obwohl Stack-basierte Angriffe bei weitem die H?ufigsten sind, ist es
auch m?glich den Stack mit einem Heap-basierten (malloc/free) Angriff zu
?berschreiben.

Die C-Programmiersprache f?hrt keine automatischen Bereichs?berpr?fungen
bei Feldern oder Zeigern durch, wie viele andere Sprachen das tun.
Au?erdem enth?lt die C-Standardbibliothek eine Handvoll sehr
gef?hrlicher Funktionen.

.. raw:: html

   <div class="informaltable">

+----------------------------------------------------------+------------------------------------------+
| ``strcpy``\ (char \*dest, const char \*src)              | Kann den Puffer dest ?berlaufen lassen   |
+----------------------------------------------------------+------------------------------------------+
| ``strcat``\ (char \*dest, const char \*src)              | Kann den Puffer dest ?berlaufen lassen   |
+----------------------------------------------------------+------------------------------------------+
| ``getwd``\ (char \*buf)                                  | Kann den Puffer buf ?berlaufen lassen    |
+----------------------------------------------------------+------------------------------------------+
| ``gets``\ (char \*s)                                     | Kann den Puffer s ?berlaufen lassen      |
+----------------------------------------------------------+------------------------------------------+
| ``[vf]scanf``\ (const char \*format, ...)                | Kann sein Argument ?berlaufen lassen     |
+----------------------------------------------------------+------------------------------------------+
| ``realpath``\ (char \*path, char resolved\_path[])       | Kann den Puffer path ?berlaufen lassen   |
+----------------------------------------------------------+------------------------------------------+
| ``[v]sprintf``\ (char \*str, const char \*format, ...)   | Kann den Puffer str ?berlaufen lassen    |
+----------------------------------------------------------+------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.1. Puffer-?berlauf Beispiel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das folgende Quellcode-Beispiel enth?lt einen Puffer-?berlauf, der
darauf ausgelegt ist die R?cksprungadresse zu ?berschreiben und die
Anweisung direkt nach dem Funktionsaufruf zu ?berspringen. (Inspiriert
durch `4 <bi01.html#Phrack>`__)

.. code:: programlisting

    #include <stdio.h>

    void manipulate(char *buffer) {
    char newbuffer[80];
    strcpy(newbuffer,buffer);
    }

    int main() {
    char ch,buffer[4096];
    int i=0;

    while ((buffer[i++] = getchar()) != '\n') {};

    i=1;
    manipulate(buffer);
    i=2;
    printf("The value of i is : %d\n",i);
    return 0;
    }

Betrachten wir nun, wie das Speicherabbild dieses Prozesses aussehen
w?rde, wenn wir 160 Leerzeichen in unser kleines Programm eingeben,
bevor wir Enter dr?cken.

[XXX figure here!]

Offensichtlich kann man durch b?swilligere Eingaben bereits kompilierten
Programmtext ausf?hren (wie z.B. exec(/bin/sh)).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.2. Puffer-?berl?ufe vermeiden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die direkteste L?sung, um Stack-?berl?ufe zu vermeiden, ist immer
gr?ssenbegrenzten Speicher und String-Copy-Funktionen zu verwenden.
``strncpy`` und ``strncat`` sind Teil der C-Standardbibliothek. Diese
Funktionen akzeptieren einen L?ngen-Parameter. Dieser Wert sollte nicht
gr??er sein als die L?nge des Zielpuffers. Die Funktionen kopieren dann
bis zu \`length' Bytes von der Quelle zum Ziel. Allerdings gibt es
einige Probleme. Keine der Funktionen garantiert, dass die Zeichenkette
NUL-terminiert ist, wenn die Gr??e des Eingabepuffers so gro? ist wie
das Ziel. Au?erdem wird der Parameter length zwischen strncpy und
strncat inkonsistent definiert, weshalb Programmierer leicht bez?glich
der korrekten Verwendung durcheinander kommen k?nnen. Weiterhin gibt es
einen sp?rbaren Leistungsverlust im Vergleich zu ``strcpy``, wenn eine
kurze Zeichenkette in einen gro?en Puffer kopiert wird. Denn ``strncpy``
f?lt den Puffer bis zur angegebenen L?nge mit NUL auf.

In OpenBSD wurde eine weitere M?glichkeit zum kopieren von
Speicherbereichen implementiert, die dieses Problem umgeht. Die
Funktionen ``strlcpy`` und ``strlcat`` garantieren, dass das Ziel immer
NUL-terminiert wird, wenn das Argument length ungleich null ist. F?r
weitere Informationen ?ber diese Funktionen lesen Sie bitte
`6 <bi01.html#OpenBSD>`__. Die OpenBSD-Funktionen ``strlcpy`` und
``strlcat`` sind seit Version 3.3 auch in FreeBSD verf?gbar.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.2.1. Compiler-basierte Laufzeit?berpr?fung von Grenzen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ungl?cklicherweise gibt es immer noch sehr viel Quelltext, der allgemein
verwendet wird und blind Speicher umherkopiert, ohne eine der gerade
besprochenen Funktionen, die Begrenzungen unterst?tzen, zu verwenden.
Gl?cklicherweise gibt es einen Weg, um solche Angriffe zu verhindern -
?berpr?fung der Grenzen zur Laufzeit, die in verschiedenen C/C++
Compilern eingebaut ist.

ProPolice ist eine solche Compiler-Eigenschaft und ist in den
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__
Versionen 4.1 und h?her integriert. Es ersetzt und erweitert die
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__
StackGuard-Erweiterung von fr?her.

ProPolice sch?tzt gegen stackbasierte Puffer?berl?ufe und andere
Angriffe durch das Ablegen von Pseudo-Zufallszahlen in
Schl?sselbereichen des Stacks bevor es irgendwelche Funktionen aufruft.
Wenn eine Funktion beendet wird, werden diese „Kanarienv?gel“ ?berpr?ft
und wenn festgestellt wird, dass diese ver?ndert wurden wird das
Programm sofort abgebrochen. Dadurch wird jeglicher Versuch, die
R?cksprungadresse oder andere Variablen, die auf dem Stack gespeichert
werden, durch die Ausf?hrung von Schadcode zu manipulieren, nicht
funktionieren, da der Angreifer auch die Pseudo-Zufallszahlen unber?hrt
lassen m?sste.

Ihre Anwendungen mit ProPolice neu zu kompilieren ist eine effektive
Ma?nahme, um sie vor den meisten Puffer-?berlauf-Angriffen zu sch?tzen,
aber die Programme k?nnen noch immer kompromittiert werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.2.2. Bibliotheks-basierte Laufzeit?berpr?fung von Grenzen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Compiler-basierte Mechanismen sind bei Software, die nur im Bin?rformat
vertrieben wird, und die somit nicht neu kompiliert werden kann v?llig
nutzlos. F?r diesen Fall gibt es einige Bibliotheken, welche die
unsicheren Funktionen der C-Bibliothek (``strcpy``, ``fscanf``,
``getwd``, etc..) neu implementieren und sicherstellen, dass nicht
hinter den Stack-Pointer geschrieben werden kann.

.. raw:: html

   <div class="itemizedlist">

-  libsafe
-  libverify
-  libparanoia

.. raw:: html

   </div>

Leider haben diese Bibliotheks-basierten Verteidigungen mehrere
Schw?chen. Diese Bibliotheken sch?tzen nur vor einer kleinen Gruppe von
Sicherheitsl?cken und sie k?nnen das eigentliche Problem nicht l?sen.
Diese Ma?nahmen k?nnen versagen, wenn die Anwendung mit
-fomit-frame-pointer kompiliert wurde. Au?erdem kann der Nutzer die
Umgebungsvariablen LD\_PRELOAD und LD\_LIBRARY\_PATH ?berschreiben oder
l?schen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <secure-philosophy.html>`__?   | `Nach oben <secure.html>`__   | ?\ `Weiter <secure-setuid.html>`__   |
+----------------------------------------+-------------------------------+--------------------------------------+
| 3.2. Methoden des sicheren Entwurfs?   | `Zum Anfang <index.html>`__   | ?3.4. SetUID-Themen                  |
+----------------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
