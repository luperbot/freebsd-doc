=========
2.5. Make
=========

.. raw:: html

   <div class="navheader">

2.5. Make
`Zur?ck <tools-compiling.html>`__?
Kapitel 2. Werkzeuge zur Programmierung
?\ `Weiter <debugging.html>`__

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

2.5. Make
---------

.. raw:: html

   </div>

.. raw:: html

   </div>

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

2.5.1. Was ist ``make``?
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie an einem einfachen Programm mit nur einer oder zwei
Quelltextdateien arbeiten, ist die Eingabe von

.. code:: screen

    % cc file1.c file2.c

zwar nicht aufwendig, wird aber mit zunehmender Anzahl der
Quelltextdateien sehr l?stig—und auch das Kompilieren kann eine Weile
dauern.

Eine M?glichkeit dies zu umgehen besteht in der Verwendung von
Objektdateien, wobei man nur die Quelltextdateien neu kompiliert, die
ver?ndert wurden. So k?nnten wir etwa folgendes erhalten:

.. code:: screen

    % cc file1.o file2.o … file37.c …

falls wir seit dem letzten Kompiliervorgang nur die Datei ``file37.c``
ver?ndert haben. Dadurch k?nnte der Kompiliervorgang um einiges
beschleunigt werden, es mu? jedoch immer noch alles von Hand eingegeben
werden.

Oder wir k?nnten uns ein Shell Skript schreiben. Dieses w?rde jedoch
alles immer wieder neu kompilieren, was bei einem gro?en Projekt sehr
ineffizient w?re.

Was ist, wenn wir hunderte von Quelltextdateien h?tten? Was ist, wenn
wir in einem Team mit anderen Leuten arbeiten w?rden, die vergessen uns
Bescheid zu sagen, falls sie eine der Quelltextdateien ver?ndert haben,
die wir ebenfalls benutzen?

Vielleicht k?nnten wir beide L?sungen kombinieren und etwas wie ein
Shell Skript schreiben, welches eine Art magische Regel enthalten w?rde,
die feststellt, welche Quelltextdateien neu kompiliert werden m?ssten.
Alles was wir br?uchten w?re ein Programm, das diese Regeln verstehen
k?nnte, da diese Aufgabe etwas zu kompliziert f?r eine Shell ist.

Dieses Programm hei?t ``make``. Es liest eine Datei namens *makefile*,
welche ihm sagt, wie unterschiedliche Dateien voneinander abh?ngen, und
berechnet, welche Dateien neu kompiliert werden m?ssen und welche nicht.
Zum Beispiel k?nnte eine Regel etwas sagen wie „wenn ``fromboz.o`` ?lter
als ``fromboz.c`` ist, bedeutet dies, da? jemand die Datei ``fromboz.c``
ver?ndert haben mu?, und diese daher neu kompiliert werden mu?.“ Das
makefile enth?lt au?erdem Regeln die make sagen, *wie* die
Quelltextdatei neu kompiliert werden mu?, was dieses Tool noch sehr viel
m?chtiger macht.

Makefiles werden normalerweise im selben Verzeichnis wie die
Quelltextdateien abgelegt, zu denen sie geh?ren, und kann ``makefile``,
``Makefile`` oder ``MAKEFILE`` hei?en. Die meisten Programmierer
verwenden den Namen ``Makefile``, da diese Schreibweise daf?r sorgt, da?
die Datei gut lesbar ganz oben in der Verzeichnisliste aufgef?hrt wird.
`:sup:`[6]` <#ftn.idp64690512>`__

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

2.5.2. Beispielhafte Verwendung von ``make``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hier ist eine sehr einfache make Datei:

.. code:: programlisting

    foo: foo.c
        cc -o foo foo.c

Sie besteht aus zwei Zeilen, einer Abh?ngigkeitszeile und einer
Erzeugungszeile.

Die Abh?ngigkeitszeile hier besteht aus dem Namen des Programms (auch
*Ziel* genannt), gefolgt von einem Doppelpunkt und einem Leerzeichen,
und anschlie?end dem Namen der Quelltextdatei. Wenn ``make`` diese Zeile
liest ?berpr?ft es die Existenz von ``foo``; falls diese Datei existiert
vergleicht es das Datum der letzten ?nderung von ``foo`` mit der von
``foo.c``. Falls ``foo`` nicht existiert, oder ?lter als ``foo.c`` ist,
liest es die Erzeugungszeile um herauszufinden, was zu tun ist. Mit
anderen Worten, dies ist die Regel die festlegt, wann ``foo.c`` neu
kompiliert werden mu?.

Die Erzeugungszeile beginnt mit einem tab (dr?cken Sie dazu die
**tab**-Taste) gefolgt von dem Befehl, mit dem Sie ``foo`` manuell
erzeugen w?rden. Wenn ``foo`` veraltet ist, oder nicht existiert, f?hrt
``make`` diesen Befehl aus, um die Datei zu erzeugen. Mit anderen
Worten, dies ist die Regel die make sagt, wie ``foo.c`` kompiliert
werden mu?.

Wenn Sie also **``make``** eingeben wird dieses sicherstellen, da?
``foo`` bzgl. Ihrer letzten ?nderungen an ``foo.c`` auf dem neuesten
Stand ist. Dieses Prinzip kann auf ``Makefile``\ s mit hunderten von
Zielen—es ist bei FreeBSD praktisch m?glich, das gesamte Betriebssystem
zu kompilieren, indem man nur **``make world``** im richtigen
Verzeichnis eingibt!

Eine weitere n?tzliche Eigenschaft der makefiles ist, da? die Ziele
keine Programme sein m?ssen. Wir k?nnten zum Beispiel eine make Datei
haben, die wie folgt aussieht:

.. code:: programlisting

    foo: foo.c
        cc -o foo foo.c

    install:
        cp foo /home/me

Wir k?nnen make sagen welches Ziel wir erzeugt haben wollen, indem wir
etwas wie folgt eingeben:

.. code:: screen

    % make target

``make`` wird dann nur dieses Ziel beachten und alle anderen ignorieren.
Wenn wir zum Beispiel **``make foo``** mit dem obigen makefile eingeben,
dann wird make das Ziel ``install`` ignorieren.

Wenn wir nur **``make``** eingeben wird make immer nur nach dem ersten
Ziel suchen und danach mit dem Suchen aufh?ren. Wenn wir hier also nur
**``make``** eingegeben h?tten, w?rde es nur zu dem Ziel ``foo`` gehen,
gegebenenfalls ``foo`` neu kompilieren, und danach einfach aufh?ren,
ohne das Ziel ``install`` zu beachten.

Beachten Sie, da? das ``install``-Ziel von nichts anderem abh?ngt! Dies
bedeutet, da? der Befehl in der nachfolgenden Zeile immer ausgef?hrt
wird, wenn wir dieses Ziel mittels **``make     install``** aufrufen. In
diesem Fall wird die Datei ``foo`` in das Heimatverzeichnis des
Benutzers kopiert. Diese Vorgehensweise wird h?ufig bei makefiles von
Anwendungen benutzt, damit die Anwendung nach erfolgreicher Kompilierung
in das richtige Verzeichnis installiert werden kann.

Dieser Teil ist etwas schwierig zu erkl?ren. Wenn Sie immer noch nicht
so richtig verstanden haben, wie ``make`` funktioniert, w?re es das
Beste, sie erstellen sich selber ein einfaches Programm wie „hello
world“ und eine make Datei wie die weiter oben angegebene, und
experimentieren damit selber ein bi?chen herum. Als n?chstes k?nnten Sie
mehrere Quelltextdateien verwenden, oder in Ihrer Quelltextdatei eine
Header-Datei includen. Der Befehl ``touch`` ist an dieser Stelle ganz
hilfreich—er ver?ndert das Datum einer Datei, ohne das Sie diese extra
editieren m?ssen.

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

2.5.3. Make und include-Dateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

C-Code beginnt h?ufig mit einer Liste von Dateien, die included werden
sollen, zum Beispiel stdio.h. Manche dieser Dateien sind include-Dateien
des Systems, andere geh?ren zum aktuellen Projekt, an dem Sie gerade
arbeiten:

.. code:: programlisting

    #include <stdio.h>
    #include "foo.h"

    int main(....

Um sicherzustellen, da? diese Datei neu kompiliert wird, wenn ``foo.h``
ver?ndert wurde, m?ssen Sie diese Datei Ihrem ``Makefile`` hinzuf?gen:

.. code:: programlisting

    foo: foo.c foo.h

Sobald Ihr Projekt gr??er wird und Sie mehr und mehr eigene
include-Dateien verwalten m?ssen wird es nur noch sehr schwer m?glich
sein, die ?bersicht ?ber alle include-Dateien und Dateien, die von
diesen abh?ngen, beizubehalten. Falls Sie eine include-Datei ver?ndern,
jedoch das erneute Kompilieren aller Dateien, die von dieser Datei
abh?ngen, vergessen, werden die Folgen verheerend sein. Der ``gcc``
besitzt eine Option, bei der er Ihre Dateien analysiert und eine Liste
aller include-Dateien und deren Abh?ngigkeiten erstellt: ``-MM``.

Wenn Sie das Folgende zu Ihrem Makefile hinzuf?gen:

.. code:: programlisting

    depend:
        gcc -E -MM *.c > .depend

und **``make depend``** ausf?hren, wird die Datei ``.depend`` mit einer
Liste von Objekt-Dateien, C-Dateien und den include-Dateien auftauchen:

.. code:: programlisting

    foo.o: foo.c foo.h

Falls Sie ``foo.h`` ver?ndern werden beim n?chsten Aufruf von ``make``
alle Dateien, die von ``foo.h`` abh?ngen, neu kompiliert.

Vergessen Sie nicht jedes mal ``make depend`` aufzurufen, wenn Sie eine
include-Datei zu einer Ihrer Dateien hinzugef?gt haben.

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

2.5.4. FreeBSD Makefiles
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Makefiles k?nnen eher schwierig zu schreiben sein. Gl?cklicherweise
kommen BSD-basierende Systeme wie FreeBSD mit einigen sehr m?chtigen
solcher Dateien als Teil des Systems daher. Ein sehr gutes Beispiel
daf?r ist das FreeBSD Portssystem. Hier ist der grundlegende Teil eines
typischen ``Makefile``\ s des Portssystems:

.. code:: programlisting

    MASTER_SITES=   ftp://freefall.cdrom.com/pub/FreeBSD/LOCAL_PORTS/
    DISTFILES=      scheme-microcode+dist-7.3-freebsd.tgz

    .include <bsd.port.mk>

Wenn wir jetzt in das Verzeichnis dieses Ports wechseln und **``make``**
aufrufen, passiert das Folgende:

.. raw:: html

   <div class="procedure">

#. Es wird ?berpr?ft, ob sich der Quelltext f?r diesen Port bereits auf
   Ihrem System befindet.

#. Falls dies nicht der Fall ist wird eine FTP-Verbindung zu der URL in
   MASTER\_SITES aufgebaut und der Quelltext heruntergeladen.

#. Die Checksumme f?r den Quelltext wird berechnet und mit der schon
   bekannten und f?r sicher und gut empfundenen verglichen. Damit wird
   sichergestellt, da? der Quelltext bei der ?bertragung nicht
   besch?digt wurde.

#. S?mtliche Anpassungen, die n?tig sind, damit der Quelltext unter
   FreeBSD funktioniert, werden vorgenommen—dieser Vorgang wird auch
   *patchen* genannt.

#. Alle speziellen Konfigurationen, die am Quelltext n?tig sind, werden
   vorgenommen. (Viele UNIX? Programmdistributionen versuchen
   herauszufinden, auf welcher UNIX?-Version sie kompiliert werden
   sollen und welche optionalen UNIX?-Features vorhanden sind—an dieser
   Stelle erhalten sie die Informationen im FreeBSD Ports Szenario).

#. Der Quelltext f?r das Programm wird kompiliert. Im Endeffekt wechseln
   wir in das Verzeichnis, in das der Quelltext entpackt wurde, und
   rufen ``make`` auf—die eigene make-Datei des Programms besitzt die
   n?tigen Informationen um dieses zu bauen.

#. Wir haben jetzt eine kompilierte Version des Programmes. Wenn wir
   wollen k?nnen wir dieses jetzt testen; wenn wir ?berzeugt vom
   Programm sind, k?nnen wir **``make install``** eingeben. Dadurch
   werden das Programm sowie alle zugeh?rigen Dateien an die richtige
   Stelle kopiert; es wird auch ein Eintrag in der Paketdatenbank
   erzeugt, soda? der Port sehr einfach wieder deinstalliert werden
   kann, falls wir unsere Meinung ?ber dieses ge?ndert haben.

.. raw:: html

   </div>

Ich glaube jetzt werden Sie mit mir ?bereinstimmen, da? dies ziemlich
eindrucksvoll f?r ein Skript mit vier Zeilen ist!

Das Geheimnis liegt in der letzten Zeile, die ``make`` anweist, in das
makefile des Systems mit dem Namen ``bsd.port.mk`` zu sehen. Man kann
diese Zeile zwar leicht ?bersehen, aber hierher kommt all das klevere
Zeugs—jemand hat ein makefile geschrieben, welches ``make`` anweist,
alle weiter oben beschriebenen Schritte durchzuf?hren (neben vielen
weiteren Dingen, die ich nicht angesprochen habe, einschlie?lich der
Behandlung s?mtlicher Fehler, die auftreten k?nnten) und jeder kann
darauf zur?ckgreifen, indem er eine einzige Zeile in seine eigene
make-Datei einf?gt!

Falls Sie einen Blick in die makefiles des Systems werfen m?chten,
finden Sie diese in ``/usr/share/mk``. Es ist aber wahrscheinlich
besser, wenn Sie damit noch warten, bis Sie ein bi?chen mehr
Praxiserfahrung mit makefiles gesammelt haben, da die dortigen makefiles
sehr kompliziert sind (und wenn Sie sich diese ansehen sollten Sie
besser eine Kanne starken Kaffee griffbereit haben!)

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

2.5.5. Fortgeschrittene Verwendung von ``make``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``Make`` ist ein sehr m?chtiges Werkzeug und kann noch sehr viel mehr
als die gezeigten einfachen Beispiele weiter oben. Bedauerlicherweise
gibt es mehrere verschiedene Versionen von ``make``, und sie alle
unterscheiden sich betr?chtlich voneinander. Der beste Weg
herauszufinden was sie k?nnen ist wahrscheinlich deren Dokumentation zu
lesen—hoffentlich hat diese Einf?hrung Ihnen gen?gend Grundkenntnisse
vermitteln k?nnen, damit Sie dies tun k?nnen.

Die Version von make, die in FreeBSD enthalten ist, ist Berkeley make;
es gibt eine Anleitung dazu in ``/usr/share/doc/psd/12.make``. Um sich
diese anzusehen, m?ssen Sie

.. code:: screen

    % zmore paper.ascii.gz

in diesem Verzeichnis ausf?hren.

Viele Anwendungen in den Ports verwenden GNU make, welches einen sehr
guten Satz an „info“-Seiten mitbringt. Falls Sie irgendeinen dieser
Ports installiert haben wurde GNU make automatisch als ``gmake`` mit
installiert. Es ist auch als eigenst?ndiger Port und Paket verf?gbar.

Um sich die Info-Seiten f?r GNU make anzusehen m?ssen Sie die Datei
``dir`` in ``/usr/local/info`` um einen entsprechenden Eintrag
erweitern. Dies beinhaltet das Einf?gen einer Zeile wie

.. code:: programlisting

     * Make: (make).                 The GNU Make utility.

in die Datei. Nachdem Sie dies getan haben k?nnen Sie **``info``**
eingeben und dann den Men?eintrag make ausw?hlen (oder Sie k?nnen in
Emacs die Tastenkombination **``C-h i``** verwenden).

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64690512" class="footnote">

`:sup:`[6]` <#idp64690512>`__\ Verwenden Sie nicht ``MAKEFILE`` mit
lauter Gro?buchstaben, da diese Schreibweise h?ufig f?r
Dokumentationsdateien wie ``README`` benutzt wird.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+----------------------------------+
| `Zur?ck <tools-compiling.html>`__?   | `Nach oben <tools.html>`__    | ?\ `Weiter <debugging.html>`__   |
+--------------------------------------+-------------------------------+----------------------------------+
| 2.4. Kompilieren mit dem ``cc``?     | `Zum Anfang <index.html>`__   | ?2.6. Debuggen                   |
+--------------------------------------+-------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
