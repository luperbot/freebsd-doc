======================================
10.4. Erweiterte Drucker-Konfiguration
======================================

.. raw:: html

   <div class="navheader">

10.4. Erweiterte Drucker-Konfiguration
`Zur?ck <printing-intro-setup.html>`__?
Kapitel 10. Drucken
?\ `Weiter <printing-using.html>`__

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

10.4. Erweiterte Drucker-Konfiguration
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Johann Kois.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt den Einsatz von Filtern f?r das Drucken
speziell formatierter Seiten oder von Deckbl?ttern, das Drucken ?ber ein
Netzwerk sowie die Beschr?nkung und Verrechnung der Druckernutzung.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.4.1. Filter
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Obwohl LPD Netzwerkprotokolle, Warteschlangen, Zugriffskontrollen und
andere f?r das Drucken wichtige Aspekte prinzipiell unterst?tzt,
passiert ein Gro?teil der *wirklichen* Arbeit in den sogenannten
*Filtern*. Dabei handelt es sich um Programme, die direkt mit einem
Drucker kommunizieren und deren Ger?tespezifika und spezielle
Anforderungen erf?llen. Im einfachsten Fall installiert man nur einen
reinen Textfilter, der mit beinahe allen Druckern funktionieren sollte.
(Lesen Sie dazu auch den Abschnitt `Den Text-Filter
installieren <printing-intro-setup.html#printing-textfilter>`__.)

Um die erweiterten F?higkeiten von Druckern auch einsetzen zu k?nnen,
sollten Sie verstehen, wie Filter arbeiten, da diese f?r die
Bereitstellung dieser Funktionen zust?ndig sind. Die schlechte Nachricht
ist, dass *Sie* diese Filter bereitstellen m?ssen. Die gute Nachricht
ist allerdings, dass diese in der Regel bereits vorhanden sind. Ist dies
nicht der Fall, k?nnen Sie einen Filter meist relativ einfach selbst
erstellen.

Der Filter ``/usr/libexec/lpr/lpf`` wird bereits mit FreeBSD geliefert.
Er k?mmert sich um die korrekte Behandlung von gel?schten Zeichen (das
sogenannte *Backspacing*), um im Text enthaltene Tabulatoren, sowie um
die Verrechnung von Druckauftr?gen. Das ist aber auch alles, was dieser
Filter kann. Zus?tzliche Filter und f?r die Funktion von Filtern n?tige
Komponenten finden sich aber in der FreeBSD Ports-Sammlung.

Dieser Abschnitt behandelt folgende Themen:

.. raw:: html

   <div class="itemizedlist">

-  Der Abschnitt `Die Funktionsweise von
   Filtern <printing-advanced.html#printing-advanced-filters>`__
   versucht, einen ?berblick ?ber die Rolle von Filtern innerhalb des
   Druckprozesses zu geben. Sie sollten diesen Abschnitt lesen, damit
   Sie verstehen, was „unter der Haube“ passiert, wenn LPD einen Filter
   verwendet. Dieses Wissen wird Ihnen dabei helfen, Probleme, die bei
   Installation von Filtern f?r verschiedene Drucker entstehen k?nnen,
   vorauszusehen und zu beheben.

-  LPD geht davon aus, dass jeder Drucker in der Lage ist, normalen Text
   zu drucken. F?r PostScript?- (oder andere sprachbasierte) Drucker
   stellt dies allerdings ein Problem dar, da diese nicht in der Lage
   sind, normalen Text direkt zu drucken. Der Abschnitt `Normalen Text
   auf PostScript?-Druckern
   drucken <printing-advanced.html#printing-advanced-if-conversion>`__
   beschreibt, wie Sie dieses Problem l?sen k?nnen. Besitzen Sie einen
   PostScript?-Drucker, sollten Sie diesen Abschnitt lesen.

-  PostScript? ist ein popul?res Ausgabeformat, das von vielen
   Programmen unterst?tzt wird. Es ist sogar m?glich, PostScript?-Code
   direkt zu schreiben. Leider sind PostScript?-Drucker in der Regel
   relativ teuer. Der Abschnitt `PostScript? auf
   Nicht-PostScript?-Druckern
   emulieren <printing-advanced.html#printing-advanced-ps>`__
   beschreibt, wie Sie einen Textfilter anpassen m?ssen, um
   PostScript?-Daten auf einem *nicht-PostScript?-f?higen Drucker*
   auszugeben. Haben Sie keinen PostScript?-Drucker, sollten Sie
   insbesondere diesen Abschnitt lesen.

-  Der Abschnitt
   `Konvertierungsfilter <printing-advanced.html#printing-advanced-convfilters>`__
   beschreibt eine M?glichkeit zur automatischen Konvertierung
   verschiedener Dateiformate in ein von Ihrem Drucker unterst?tztes
   Format. Nachdem Sie diesen Abschnitt gelesen haben, werden Sie in der
   Lage sein, Ihren Drucker so zu konfigurieren, dass Sie durch die
   Eingabe von ``lpr -t`` troff-Daten, von ``lpr -d`` TeX-DVI-Daten,
   oder von ``lpr -v`` Rasterbilddaten drucken k?nnen. Daher sollten Sie
   diesen Abschnitt auf jeden Fall lesen.

-  Im Abschnitt
   `Ausgabefilter <printing-advanced.html#printing-advanced-of>`__ wird
   eine nur selten genutzte Eigenschaft von LPD, die sogenannten
   Ausgabefilter, beschrieben. Wenn Sie keine
   `Deckbl?tter <printing-advanced.html#printing-advanced-header-pages>`__
   drucken m?ssen, k?nnen Sie diesen Abschnitt ?berspringen.

-  Der Abschnitt `lpf: Ein
   Textfilter <printing-advanced.html#printing-advanced-lpf>`__
   beschreibt ``lpf``, einen kompletten, wenn auch einfachen Textfilter
   f?r Zeilendrucker (oder auch Laserdrucker, die sich analog
   verhalten), der bereits mit FreeBSD geliefert wird. Wenn Sie nur am
   Ausdruck von reinem Text interessiert sind, oder wenn Ihr Drucker nur
   „Schrott“ produziert, wenn er auf Backspace-Zeichen trifft, sollten
   Sie sich ``lpf`` n?her ansehen.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Eine Kopie der verschiedenen Skripte finden Sie im Verzeichnis
``/usr/share/examples/printing``.

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

10.4.1.1. Die Funktionsweise von Filtern
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei einem Filter handelt es sich um ein ausf?hrbares Programm, das von
LPD gestartet wird, um den ger?teabh?ngigen Teil der Kommunikation mit
einem Drucker zu ?bernehmen.

Wenn LPD eine Datei ?ber einen Druckauftrag drucken will, startet es ein
Filterprogramm. Danach setzt es die Standardeingabe des Filters auf die
zu druckende Datei, die Standardausgabe auf den Drucker und die
Standardfehlerausgabe auf ``/dev/console`` (Voreinstellung) oder auf die
?ber die Option ``lf`` in ``/etc/printcap`` festgelegte Datei.

Welcher Filter von LPD mit welchen Argumenten geladen wird, wird in der
Datei ``/etc/printcap`` oder durch die Argumente, die der Anwender
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__ auf
der Kommandozeile ?bergibt, festgelegt. Gibt der Anwender beispielsweise
``lpr -t`` ein, startet LPD ?ber die ``tf``-F?higkeit den troff-Filter
f?r den gew?nschten Drucker. Wollen Sie hingegen normalen Text drucken,
wird der ``if``-Filter gestartet. (F?r Ausnahmen von diesem Vorgehen
lesen Sie bitte den Abschnitt
`Ausgabefilter <printing-advanced.html#printing-advanced-of>`__.)

Es gibt drei Arten von Filtern, die Sie in ``/etc/printcap`` angeben
k?nnen:

.. raw:: html

   <div class="itemizedlist">

-  *Textfilter* (die in der LPD-Dokumentation als *input filter*
   bezeichnet werden) sind f?r den Druck von normalem Text zust?ndig. Es
   handelt sich dabei um eine Art Standardfilter, da LPD von jedem
   Drucker erwartet, dass er normalen Text drucken kann. Aufgabe des
   Textfilters ist es, sicherzustellen, dass gel?schte Zeichen
   (*Backspaces*), Tabulatoren und andere Sonderzeichen Ihren Drucker
   nicht verwirren. Falls Sie f?r die Nutzung eines Druckers bezahlen
   m?ssen, kann der Textfilter ?ber die Anzahl der gedruckten Zeilen
   auch die Anzahl der von Ihnen gedruckten Seiten ermitteln. Der
   Textfilter wird mit folgenden Argumenten gestartet:

   .. raw:: html

      <div class="cmdsynopsis">

   ``filter-name`` [-c] -w *``width``* -l *``length``* -i *``indent``*
   -n *``login``* -h *``host``* *``acct-file``*

   .. raw:: html

      </div>

   Die einzelnen Argumente haben folgende Bedeutung:

   .. raw:: html

      <div class="variablelist">

   ``-c``
       Notwendig, wenn ``lpr                       -l`` verwendet wird.

   *``width``*
       Der Wert der in ``/etc/printcap`` festgelegten Option ``pw``
       (*page width*). In der Voreinstellung ist dieser Wert auf 132
       gesetzt.

   *``length``*
       Der Wert der ``pl``-F?higkeit (*page length*), Voreinstellung 66.

   *``indent``*
       Der durch ``lpr                       -i`` festgelegte Einzug,
       Voreinstellung 0.

   *``login``*
       Der Name des Benutzers, der die Datei druckt.

   *``host``*
       Der Rechner, auf dem der Druckauftrag gestartet wurde.

   *``acct-file``*
       Der Name der Verrechnungsdatei, in der die Ergebnisse der
       ``af``-F?higkeit gespeichert werden.

   .. raw:: html

      </div>

-  Ein *Konvertierungsfilter* konvertiert verschiedene Dateiformate in
   ein Format, das Ihr Drucker auf Papier ausgeben kann. So kann etwa
   der ditroff-Schriftsatz nicht direkt gedruckt werden, daher m?ssen
   Sie einen Konvertierungsfilter installieren, um diese Daten in ein
   Format zu bringen, das Ihr Drucker verarbeiten und drucken kann. Der
   Abschnitt
   `Konvertierungsfilter <printing-advanced.html#printing-advanced-convfilters>`__
   enth?lt ausf?hrliche Informationen zu diesen Filtern.
   Konvertierungsfilter k?nnen auch zur Verrechnung verwendet werden.
   Sie werden mit folgenden Argumenten gestartet:

   .. raw:: html

      <div class="cmdsynopsis">

   ``filter-name`` -x *``pixel-width``* -y *``pixel-height``* -n
   *``login``* -h *``host``* *``acct-file``*

   .. raw:: html

      </div>

   *``pixel-width``* ist der Wert der ``px``-F?higkeit (Voreinstellung
   0), w?hrend *``pixel-height``* dem Wert der ``py``-F?higkeit
   (Voreinstellung ebenfalls 0) entspricht.

-  *Ausgabefilter* werden nur verwendet, wenn keine Textfilter vorhanden
   sind oder wenn Deckbl?tter ben?tigt werden. Der Abschnitt
   `Ausgabefilter <printing-advanced.html#printing-advanced-of>`__
   enth?lt weitere Informationen. Ausgabefilter unterst?tzen nur zwei
   Argumente:

   .. raw:: html

      <div class="cmdsynopsis">

   ``filter-name`` -w *``width``* -l *``length``*

   .. raw:: html

      </div>

   Beide Argumente entsprechen den Optionen ``-w`` und ``-l`` der
   Textfilter.

.. raw:: html

   </div>

Alle Filter sollten mit folgenden R?ckgabewerten (Exitcodes) *beendet*
werden:

.. raw:: html

   <div class="variablelist">

exit 0
    Der Filter hat die Datei erfolgreich gedruckt.

exit 1
    Der Filter war nicht in der Lage, die Datei zu drucken und meldet
    diesen Exitcode an LPD, um die Datei erneut zu drucken. LPD startet
    daraufhin den Filter erneut.

exit 2
    Der Filter war nicht in der Lage, die Datei zu drucken. Bei diesem
    Exitcode soll LPD aber nicht versuchen, die Datei erneut zu drucken,
    sondern den Druckauftrag verwerfen.

.. raw:: html

   </div>

``/usr/libexec/lpr/lpf``, der mit FreeBSD gelieferte Textfilter, nutzt
die Argumente *page width* und *page length*, um festzulegen, wann ein
Seitenumbruch (*form feed*) gesendet werden soll sowie zur Verrechnung
von Druckauftr?gen. Dazu werden der Benutzername, der f?r den
Druckauftrag verwendete Rechner sowie die Verrechnungsdatei ausgewertet,
um die entsprechenden Eintr?ge zu erstellen.

Wenn Sie auf der Suche nach Filtern sind, achten Sie darauf, dass diese
LPD-kompatibel sind. Dazu m?ssen diese die oben beschriebenen Argumente
unterst?tzen. Wenn Sie planen, Ihre Filter selbst zu erstellen, m?ssen
diese ebenfalls die gleichen Argumente und Exitcodes unterst?tzen.

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

10.4.1.2. Normalen Text auf PostScript?-Druckern drucken
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie sind der alleinige Benutzer Ihres Computers und Ihres
PostScript?-Druckers und Sie sind sich sicher, dass Sie niemals normalen
Text an Ihren Drucker senden werden? Au?erdem werden Sie niemals ein
Programm verwenden, um normalen Text auszudrucken? Nur wenn dies alles
zutrifft, k?nnen Sie diesen Abschnitt ?berspringen.

Wollen Sie allerdings sowohl PostScript? als auch normalen Text drucken,
m?ssen Sie Ihren Drucker zuvor entsprechend konfigurieren. Dazu muss Ihr
Textfilter in der Lage sein, zu unterscheiden, ob es sich bei einem
ankommenden Druckauftrag um normalen Text oder um PostScript?-Daten
handelt. Jeder PostScript?-Druckauftrag muss mit den Zeichen ``%!``
beginnen (sehen Sie in Ihrem Druckerhandbuch nach, ob Ihr Drucker
weitere Sprachen unterst?tzt). Sind dies die beiden ersten Zeichen eines
Druckauftrages, so handelt es sich um PostScript?-Daten, die direkt
gedruckt werden k?nnen. Fehlen diese Zeichen allerdings, muss der
Textfilter den Inhalt der Datei nach PostScript? konvertieren, bevor die
Datei gedruckt werden kann.

Wie funktioniert diese Unterscheidung?

Haben Sie einen seriellen Drucker, k?nnen Sie ``lprps`` installieren.
``lprps`` ist ein PostScript?-Druckerfilter, der eine
Zweiwegekommunikation mit einem Drucker erm?glicht. Er aktualisiert die
Druckerstatusdatei mit Protokollinformationen des Druckers. Dadurch sind
Anwender und Administratoren in der Lage, den genauen Zustand des
Druckers zu pr?fen (durch Meldungen wie toner low oder paper jam).
Wichtiger ist allerdings, dass ``lprps`` ``psif`` enth?lt, ein Programm,
das feststellen kann, ob ein ankommender Druckauftrag normalen Text
enth?lt. Ist dies der Fall, wird ``textps`` (das ebenfalls mit ``lprps``
geliefert wird) aufgerufen und die Datei nach PostScript? konvertiert.
Danach kann ``lprps`` die Datei an den Drucker senden.

``lprps`` ist in der FreeBSD `Ports-Sammlung <ports.html>`__ enthalten.
Je nach der von Ihnen verwendeten Papiergr??e installieren Sie dazu den
Port
`print/lprps-a4 <http://www.freebsd.org/cgi/url.cgi?ports/print/lprps-a4/pkg-descr>`__
oder
`print/lprps-letter <http://www.freebsd.org/cgi/url.cgi?ports/print/lprps-letter/pkg-descr>`__.
Nach der Installation m?ssen Sie nur noch den Pfad zum Programm ``psif``
angeben, das als Teil von ``lprps`` installiert wird. Haben Sie
``lprps`` ?ber die Ports-Sammlung installiert, f?gen Sie folgende Zeile
in den Eintrag Ihres PostScript?-Druckers in ``/etc/printcap`` ein:

.. code:: programlisting

    :if=/usr/local/libexec/psif:

Zus?tzlich sollten Sie die ``rw``-F?higkeit aktivieren, um LPD im
Schreib- und Lesemodus zu ?ffnen.

Haben Sie hingegen einen parallelen PostScript?-Drucker, was eine
Zweiwegekommunikation mit Ihrem Drucker (auf die ``lprps`` angewiesen
ist) unm?glich macht, k?nnen Sie das folgende Shell-Skript verwenden:

.. code:: programlisting

    #!/bin/sh
    #
    #  psif - Drucke PostScript oder normalen Text auf einem PostScript-Drucker
    #  Script-Version; das ist NICHT die mit lprps gelieferte Version!
    #  Installiert unter:  /usr/local/libexec/psif
    #

    IFS="" read -r first_line
    first_two_chars=`expr "$first_line" : '\(..\)'`

    if [ "$first_two_chars" = "%!" ]; then
        #
        #  PostScript - einfach drucken.
        #
        echo "$first_line" && cat && printf "\004" && exit 0
        exit 2
    else
        #
        #  Normaler Text - zuerst konvertieren, dann drucken.
        #
        ( echo "$first_line"; cat ) | /usr/local/bin/textps && printf "\004" && exit 0
        exit 2
    fi      

F?r dieses Skript wurde ``textps`` als seperates Programm installiert,
um normalen Text nach PostScript? zu konvertieren. Sie k?nnen aber auch
jeden anderen Text-nach-PostScript?-Konverter verwenden. Die FreeBSD
`Ports-Sammlung <ports.html>`__ enth?lt mit ``a2ps`` ein umfangreiches
Programm zur Konvertierung von normalem Text nach PostScript?.

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

10.4.1.3. PostScript? auf Nicht-PostScript?-Druckern emulieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei PostScript? handelt es sich um den *de facto*-Standard f?r
hochwertigen Schriftsatz und Druck. Leider ist PostScript? aber auch ein
*teurer* Standard. Gl?cklicherweise hat Aladdin Enterprises daher eine
freie PostScript?-?hnliche Implementierung namens Ghostscript
entwickelt, die auch unter FreeBSD lauff?hig ist. Ghostscript kann fast
jede PostScript?-Datei lesen und auf den verschiedensten Ger?ten
ausgeben, darunter auch auf vielen Nicht-PostScript?-Druckern. Durch die
Installation von Ghostscript und die Nutzung eines speziellen
Textfilters erreichen Sie, dass sich Ihr Nicht-PostScript?-Drucker wie
ein echter PostScript?-Drucker verh?lt.

Ghostscript ist in verschiedenen Versionen in der FreeBSD Ports-Sammlung
enhalten, die am h?figsten verwendete Version ist
`print/ghostscript-gpl <http://www.freebsd.org/cgi/url.cgi?ports/print/ghostscript-gpl/pkg-descr>`__.

Um PostScript? zu emulieren, muss der Textfilter erkennen, ob er eine
PostScript?-Datei drucken soll. Ist dies nicht der Fall, wird die Datei
direkt an den Drucker geschickt. Anderenfalls wird die Datei an
Ghostscript ?bergeben, das die Datei in ein Format konvertiert, das Ihr
Drucker versteht.

Dazu ein Beispiel. Das folgende Skript ist ein Textfilter f?r den
Drucker DeskJet 500 von Hewlett Packard. Nutzen Sie einen anderen
Drucker, m?ssen Sie die Option ``-sDEVICE`` beim Aufruf von ``gs``
(Ghostscript) entsprechend anpassen. Eine Liste der von Ghostscript
unterst?tzten Ger?te erhalten Sie durch die Eingabe von ``gs -h`` auf
der Kommandozeile.

.. code:: programlisting

    #!/bin/sh
    #
    #  ifhp - Ghostscript-emuliertes PostScript auf einem HP DeskJet 500 drucken
    #  Installiert unter:  /usr/local/libexec/ifhp

    #
    #  LF als CR+LF behandeln (um einen "Treppeneffekt" auf HP/PCL-Drucker
    #  zu vermeiden)
    #
    printf "\033&k2G" || exit 2

    #
    #  Lies die ersten zwei Zeichen der Datei
    #
    IFS="" read -r first_line
    first_two_chars=`expr "$first_line" : '\(..\)'`

    if [ "$first_two_chars" = "%!" ]; then
        #
        #  Oh.  Es ist PostScript; mit Ghostscript konvertieren, danach drucken.
        #
        /usr/local/bin/gs -dSAFER -dNOPAUSE -q -sDEVICE=djet500 \
          -sOutputFile=- - && exit 0
    else
        #
        #  Normaler Text oder HP/PCL, einfach direkt drucken.  Ans Ende setzen wir
        #  einen Seitenumbruch (also ein Form Feed), damit auch die letzte Seite
        #  ausgeworfen wird.
        #
        echo "$first_line" && cat && printf "\033&l0H" &&
    exit 0
    fi

    exit 2

Zuletzt m?ssen Sie LPD noch durch die ``if``-F?higkeit ?ber den neuen
Filter informieren:

.. code:: programlisting

    :if=/usr/local/libexec/ifhp:

Das ist alles. Ab sofort sollte sowohl ein ``lpr       normaler.text``
als auch ein ``lpr wasauchimmer.ps`` funktionieren und beide Dateien
sollten problemlos gedruckt werden.

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

10.4.1.4. Konvertierungsfilter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie Ihren Drucker wie unter `Einfache
Drucker-Konfiguration <printing-intro-setup.html#printing-simple>`__
eingerichtet haben, wollen Sie wahrscheinlich einige
Konvertierungsfilter installieren, damit Sie (abgesehen von ASCII-Text)
auch Ihre Lieblings-Dateiformate drucken k?nnen.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.4.1.4.1. Warum sollte ich einen Konvertierungsfilter installieren?
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Konvertierungsfilter erleichtern das Drucken von verschiedenen
Dateiformaten. Nehmen wir beispielsweise an, dass Sie sehr viel mit dem
TeX-Satzsystem arbeiten und ?ber einen PostScript?-Drucker verf?gen.
Eine vom TeX-System erzeugte DVI-Datei kann erst dann gedruckt werden,
nachdem diese nach PostScript? konvertiert wurde. Dazu geben Sie
Folgendes ein:

.. code:: screen

    % dvips seaweed-analysis.dvi
    % lpr seaweed-analysis.ps

Haben Sie einen Konvertierungsfilter f?r DVI-Dateien installiert, k?nnen
Sie die manuelle Konvertierung ?berspringen, da dies nun LPD f?r Sie
erledigt. Wollen Sie eine DVI-Datei drucken, geben Sie nur noch den
folgenden Befehl ein:

.. code:: screen

    % lpr -d seaweed-analysis.dvi

Durch die Verwendung der Option ``-d`` wurde LPD angewiesen, unsere
DVI-Datei vor dem Druck zu konvertieren. Der Abschnitt `Formatierungs-
und
Konvertierungsoptionen <printing-using.html#printing-lpr-options-format>`__
beschreibt die dabei m?glichen Optionen.

F?r jede Konvertierungsoption, die Ihr Drucker unterst?tzen soll, m?ssen
Sie einen eigenen *Konvertierungsfilter* installieren und dessen Pfad in
der Datei ``/etc/printcap`` angeben. Ein Konvertierungsfilter verh?lt
sich im Prinzip wie ein Textfilter bei einer einfachen
Druckerkonfiguration (lesen Sie dazu auch den Abschnitt `Den Textfilter
installieren <printing-intro-setup.html#printing-textfilter>`__),
allerdings konvertiert er die Datei in ein Format, das Ihr Drucker
versteht, anstatt normalen Text zu drucken.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.4.1.4.2. Welche Konvertierungsfilter sollte ich installieren?
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie sollten nur Filter installieren, die Sie auch ben?tigen. Wenn Sie
sehr viele DVI-Dateien drucken, sollten Sie auch einen
DVI-Konvertierungsfilter installieren. M?ssen Sie viele troff-Daten
drucken, ist ein troff-Filter hilfreich.

Die folgende Tabelle listet die von LPD unterst?tzten Filter sowie die
Eintr?ge in ``/etc/printcap`` auf, mit denen Sie diese F?higkeiten
aktivieren. Zus?tzlich wird angegeben, wie Sie ``lpr`` jeweils aufrufen
m?ssen:

.. raw:: html

   <div class="informaltable">

+-----------------+-------------------------------+----------------------------+
| Dateityp        | ``/etc/printcap``-F?higkeit   | ``lpr``-Option             |
+=================+===============================+============================+
| cifplot         | ``cf``                        | ``-c``                     |
+-----------------+-------------------------------+----------------------------+
| DVI             | ``df``                        | ``-d``                     |
+-----------------+-------------------------------+----------------------------+
| plot            | ``gf``                        | ``-g``                     |
+-----------------+-------------------------------+----------------------------+
| ditroff         | ``nf``                        | ``-n``                     |
+-----------------+-------------------------------+----------------------------+
| FORTRAN-Text    | ``rf``                        | ``-f``                     |
+-----------------+-------------------------------+----------------------------+
| troff           | ``tf``                        | ``-f``                     |
+-----------------+-------------------------------+----------------------------+
| Rasterdaten     | ``vf``                        | ``-v``                     |
+-----------------+-------------------------------+----------------------------+
| Normaler Text   | ``if``                        | keine, ``-p``, or ``-l``   |
+-----------------+-------------------------------+----------------------------+

.. raw:: html

   </div>

Wollen Sie also ``lpr -d`` verwenden, muss die ``df``-F?higkeit in
``/etc/printcap`` aktiviert sein.

Obwohl manche Leute etwas anderes behaupten, sind Formate wie
FORTRAN-Text und -Plot inzwischen nahezu obsolet. Wenn Sie diese Formate
dennoch ben?tigen, installieren Sie einfach einen angepassten Filter.
Wollen Sie beispielsweise zwar Printerleaf-Dateien (also Dateien des
Desktop Publishing-Programms von Interleaf), aber keine Plotdateien
drucken, so k?nnen Sie einen Printerleaf-Konvertierungsfilter
installieren, der es durch die Aktivierung der ``gf``-F?higkeit erlaubt,
diese Dateien direkt zu drucken. Nun m?ssen Sie Ihren Mitarbeitern nur
noch mitteilen, dass ``lpr -g`` nun f?r „drucke Printerleaf-Dateien“
steht.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.4.1.4.3. Konvertierungsfilter installieren
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da Konvertierungsfilter nicht zum Basissystem von FreeBSD geh?ren,
sollten diese unter ``/usr/local`` installiert werden. H?ufig wird das
Verzeichnis ``/usr/local/libexec`` verwendet, da es sich bei
Konvertierungsfiltern um spezielle Programme handelt, die nur von LPD,
aber nicht von einem normalen Benutzer gestartet werden.

Um einen Konvertierungsfilter zu aktivieren, m?ssen Sie dessen Pfad
zus?tzlich zur ben?tigten F?higkeit in der Datei ``/etc/printcap``
eintragen.

In unserem Beispiel wollen wir einen DVI-Konvertierungsfilter f?r den
Drucker ``bamboo`` installieren. Unsere bereits bekannte
``/etc/printcap`` wurde allerdings um die ``df``-F?higkeit f?r den
Drucker ``bamboo`` erweitert:

.. code:: programlisting

    #
    #  /etc/printcap des Rechners rose - neuer df-Filter f?r bamboo
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :sh:sd=/var/spool/lpd/rattan:\
            :lp=/dev/lpt0:\
            :if=/usr/local/libexec/if-simple:

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :sh:sd=/var/spool/lpd/bamboo:\
            :lp=/dev/ttyu5:ms#-parenb cs8 clocal crtscts:rw:\
            :if=/usr/local/libexec/psif:\
            :df=/usr/local/libexec/psdf:

Beim DVI-Filter handelt es sich um ein Shell-Skript namens
``/usr/local/libexec/psdf``:

.. code:: programlisting

    #!/bin/sh
    #
    #  psdf - DVI-nach-PostScript Druckerfilter
    #  Installiert unter:  /usr/local/libexec/psdf
    #
    #  Wird von lpd aktiviert, wenn der Nutzer lpr -d eingibt.
    #
    exec /usr/local/bin/dvips -f | /usr/local/libexec/lprps "$@"

Dieses Skript startet ``dvips`` im Filtermodus (durch das Argument
``-f`` wird der Druckauftrag ?ber die Standardeingabe entgegengenommen).
Danach wird der PostScript?-Druckerfilter ``lprps`` (lesen Sie dazu auch
den Abschnitt `Drucken von reinen Textdateien auf einem
PostScript?-Drucker <printing-advanced.html#printing-advanced-if-conversion>`__)
mit den von LPD ?bergebenen Argumenten gestartet. Das ``lprps``-Werkzeug
wiederum nutzt diese Argumente, um die gedruckten Seiten zu verrechnen.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.4.1.4.4. Beispiele f?r Konvertierungsfilter
''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da es keine verbindliche Prozedur zur Installation eines Druckerfilters
gibt, folgen nun weitere Beispiele in diesem Abschnitt. Verwenden Sie
diese, um Ihre eigenen Filter zu erstellen. Falls ein Filter Ihren
Anforderungen bereits entspricht, k?nnen Sie ihn auch direkt verwenden.

Das erste Beispiel beschreibt einen Konvertierungsfilter f?r GIF-Dateien
f?r den Drucker LaserJet III-Si von Hewlett Packard:

.. code:: programlisting

    #!/bin/sh
    #
    #  hpvf - Konvertiert GIF-Dateien nach HP/PCL, danach wird gedruckt.
    #  Installiert unter:  /usr/local/libexec/hpvf

    PATH=/usr/X11R6/bin:$PATH; export PATH
    giftopnm | ppmtopgm | pgmtopbm | pbmtolj -resolution 300 \
        && exit 0 \
        || exit 2

Dieser Filter konvertiert eine GIF-Datei in eine portable Anymap, diese
in ein portables Graustufenbild, dieses wiederum in eine portable
Bitmap, die schlie?lich in ein LaserJet/PCL-kompatibles Format
umgewandelt wird.

``/etc/printcap`` muss f?r einen Drucker, der diesen Filter nutzen will,
folgenden Eintrag enthalten:

.. code:: programlisting

    #
    #  /etc/printcap des Rechners orchid
    #
    teak|hp|laserjet|Hewlett Packard LaserJet 3Si:\
            :lp=/dev/lpt0:sh:sd=/var/spool/lpd/teak:mx#0:\
            :if=/usr/local/libexec/hpif:\
            :vf=/usr/local/libexec/hpvf:

Das folgende Skript ist ein Konvertierungsfilter, der das Drucken von
troff-Daten des groff-Textsatzsystems auf dem PostScript?-Drucker
``bamboo`` erm?glicht:

.. code:: programlisting

    #!/bin/sh
    #
    #  pstf - Konvertiert groff's troff-Daten nach PS, dann wird gedruckt.
    #  Installiert unter:  /usr/local/libexec/pstf
    #
    exec grops | /usr/local/libexec/lprps "$@"

Dieses Skript nutzt wiederum ``lprps``, um mit dem Drucker zu
kommunizieren. W?re der Drucker an einem parallelen Port angeschlossen,
w?rde das Skript so aussehen:

.. code:: programlisting

    #!/bin/sh
    #
    #  pstf - Konvertiert groff's troff-Daten nach PS, danach wird gedruckt.
    #  Installiert unter:  /usr/local/libexec/pstf
    #
    exec grops

Das ist alles. Um den Filter verwenden zu k?nnen, m?ssen Sie ihn
allerdings noch in ``/etc/printcap`` aktivieren:

.. code:: programlisting

    :tf=/usr/local/libexec/pstf:

Das n?chste Skript ist ein FORTRAN-Textfilter f?r jeden Drucker, der
normalen Text direkt drucken kann und der hier f?r den Drucker ``teak``
installiert wird:

.. code:: programlisting

    #!/bin/sh
    #
    # hprf - FORTRAN-Textfilter f?r den Drucker LaserJet 3si:
    # Installiert unter:  /usr/local/libexec/hprf
    #

    printf "\033&k2G" && fpr && printf "\033&l0H" &&
     exit 0
    exit 2    

Zus?tzlich ben?tigen wir wiederum einen Eintrag in ``/etc/printcap``, um
diesen Filter f?r den Drucker ``teak`` zu aktivieren:

.. code:: programlisting

    :rf=/usr/local/libexec/hprf:

Das letzte Beispiel ist etwas komplexer. Es soll ein DVI-Filter f?r den
bereits erw?hnten LaserJet-Drucker ``teak`` installiert werden. Der
erste Teil ist einfach: Sie m?ssen den Pfad des DVI-Filters in
``/etc/printcap`` eintragen:

.. code:: programlisting

    :df=/usr/local/libexec/hpdf:

Nun kommt der schwierige Teil: Sie m?ssen den Filter funktionsf?hig
machen. Dazu ben?tigen Sie einen DVI-nach-LaserJet/PCL-Konverter.
Gl?cklicherweise enth?lt die FreeBSD `Ports-Sammlung <ports.html>`__ mit
`print/dvi2xx <http://www.freebsd.org/cgi/url.cgi?ports/print/dvi2xx/pkg-descr>`__
ein solches Programm. Nach der Installation des Pakets verf?gen wir ?ber
das Programm ``dvilj2p``, das zur Konvertierung von DVI-Daten in zu den
Druckern LaserJet IIp, LaserJet III, sowie LaserJet 2000 kompatible
Codes ben?tigt wird.

Durch den Einsatz von ``dvilj2p`` wird der Filter ``hpdf`` relativ
komplex, da ``dvilj2p`` nicht von der Standardeingabe lesen kann,
sondern als Eingabe einen Dateinamen erwartet. Zus?tzlich muss der
Dateiname auf ``.dvi`` enden, daher ist die Verwendung von ``/dev/fd/0``
als Standardeingabe problematisch. Wir k?nnen diese Problem aber
umgehen, indem wir einen tempor?ren Dateinamen symbolisch nach
``/dev/fd/0`` linken. Dadurch wird ``dvilj2p`` gezwungen, dennoch von
der Standardeingabe zu lesen.

Das letzte Problem, das wir noch l?sen m?ssen, ist, dass wir ``/tmp``
nicht als tempor?ren Link verwenden k?nnen. Symbolische Links geh?ren
dem User sowie der Gruppe ``bin``. Der Filter l?uft aber als User
``daemon``. Au?erdem ist ``/tmp`` durch ein Sticky-Bit gesichert. Daher
kann der Filter den Link zwar erzeugen, ein Aufr?umen ist aber nicht
mehr m?glich, weil sich die Eigent?mer des Filters und des tempor?ren
Verzeichnisses unterscheiden.

Daher legt der Filter den symbolischen Link im Arbeitsverzeichnis an,
das gleichzeitig als Spooling-Verzeichnis dient (festgelegt durch die
Aktivierung der ``sd``-F?higkeit in ``/etc/printcap``). Das
Arbeitsverzeichnis ist ein idealer Ort f?r den Filter, insbesondere da
dieses (manchmal) sogar ?ber mehr freien Speicherplatz als ``/tmp``
verf?gt.

Mit diesen Informationen sind wir nun in der Lage, den Filter zu
entwickeln:

.. code:: programlisting

    #!/bin/sh
    #
    #  hpdf - DVI-Daten auf einen HP/PCL-Drucker drucken
    #  Installiert unter:  /usr/local/libexec/hpdf

    PATH=/usr/local/bin:$PATH; export PATH

    #
    #  Eine Funktion zum Aufr?umen unserer tempor?ren Dateien.
    #  Diese finden sich im Arbeitsverzeichnis, das wir auch als
    #  Spooling-Verzeichnis f?r unseren Drucker verwenden werden.
    #
    cleanup() {
       rm -f hpdf$$.dvi
    }

    #
    #  Eine Funktion, um fatale Fehler zu behandeln.  Dazu die Meldung
    #  ausgeben, danach ein exit 2.  Dadurch wei? LPD, dass es
    #  den Auftrag nicht noch einmal drucken soll.
    #
    fatal() {
        echo "$@" 1>&2
        cleanup
        exit 2
    }

    #
    #  Wenn ein Anwender den Auftrag entfernt, sendet LPD ein SIGINT, daher
    #  wollen wir SIGINT und einige andere Signale abfangen (trappen), um
    #  nach der Konvertierung aufr?umen zu k?nnen.
    #
    trap cleanup 1 2 15

    #
    #  Bevor wir anfangen, r?umen wir noch auf.  Sicher ist sicher.
    #
    cleanup

    #
    #  Die DVI-Eingabedatei auf die Standardeingabe linken (die zu druckende
    #  Datei).
    #
    ln -s /dev/fd/0 hpdf$$.dvi || fatal "Konnte Symlink nicht anlegen!"

    #
    #  Umwandeln: LF = CR+LF
    #
    printf "\033&k2G" || fatal "Konnte Drucker nicht initialisieren!"

    #
    #  Konvertieren und drucken.  Da der R?ckgabewert von dvilj2p
    #  unzuverl?ssig ist, ignorieren wir ihn einfach.
    #
    dvilj2p -M1 -q -e- dfhp$$.dvi

    #
    #  Aufr?umen und beenden.
    #
    cleanup
    exit 0    

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.4.1.4.5. Automatische Konvertierung: Eine Alternative zu Konvertierungsfiltern
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alle in diesem Abschnitt besprochenen Konvertierungsfilter sind zwar
sehr hilfreich, allerdings m?ssen Sie nach wie vor bei jedem Aufruf von
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
angeben, welchen Filter sie verwenden wollen, was mit der Zeit sicher
nervend wird. Schlimmer ist allerdings, dass die Auswahl eines
unpassenden Filters dazu f?hren kann, dass Sie Hunderte Seiten Papier
ausdrucken.

Statt also Konvertierungsfilter zu installieren, k?nnten Sie den
Textfilter (der ohnehin der Standardfilter ist) verwenden, um den zu
druckenden Dateityp zu erkennen und anschlie?end den korrekten
Konvertierungsfilter auszuw?hlen. Um den Dateityp zu bestimmen, k?nnen
Sie beispielsweise ``file`` verwenden. Leider ist es bei *einigen*
Dateitypen problematisch, diese zu unterscheiden. Daher k?nnten Sie f?r
diese Dateitypen dennoch einen Konvertierungsfilter installieren.

Die FreeBSD Ports-Sammlung enth?lt mit ``apsfilter``
(`print/apsfilter <http://www.freebsd.org/cgi/url.cgi?ports/print/apsfilter/pkg-descr>`__)
einen Textfilter, der diese automatische Konvertierung durchf?hren kann.
Er ist in der Lage, normalen Text, PostScript?, DVI und beinahe jede Art
von Datei zu erkennen, diese zu konvertieren und auf Ihren Drucker
auszugeben.

.. raw:: html

   </div>

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

10.4.1.5. Ausgabefilter
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

LPD unterst?tzt noch eine weitere Filterart, die sogenannten
Ausgabefilter. Diese sind –?analog zu einem Textfilter?–? f?r den Druck
von normalem Text ausgelegt, allerdings verf?gen sie im Vergleich zu
diesen nur ?ber sehr eingeschr?nkte F?higkeiten. Wenn Sie einen
Ausgabefilter (aber keinen Textfilter) verwenden, dann

.. raw:: html

   <div class="itemizedlist">

-  startet LPD nur einen Ausgabefilter f?r den kompletten Druckauftrag,
   statt f?r jede Datei des Auftrags einen eigenen Filter zu starten.

-  k?mmert sich LPD nicht darum, den Beginn oder das Ende einer Datei
   innerhalb des Druckauftrages zu finden.

-  ?bergibt LPD weder den Benutzer- noch den Rechnernamen desjenigen,
   der den Druckauftrag erteilt hat, an den Ausgabefilter, was eine
   Verrechnung von Druckauftr?gen unm?glich macht. Ausgabefilter
   unterst?tzen insgesamt nur zwei Argumente:

   .. raw:: html

      <div class="cmdsynopsis">

   ``filter-name`` -w *``width``* -l *``length``*

   .. raw:: html

      </div>

   *``width``* basiert auf der ``pw``-F?higkeit, *``length``* hingegen
   auf der ``pl``-F?higkeit des gew?hlten Druckers.

.. raw:: html

   </div>

Lassen Sie sich von dieser angeblichen Einfachheit eines Ausgabefilters
nicht t?uschen. Ausgabefilter sind beispielsweise *nicht dazu in der
Lage*, jede Datei eines Druckauftrages auf einer neuen Seite zu drucken.
Dazu ben?tigen Sie einen Textfilter (die im Abschnitt `Den Textfilter
installieren <printing-intro-setup.html#printing-textfilter>`__
beschrieben werden). Au?erdem sind Ausgabefilter in Wirklichkeit
*komplexer*, da sie den gesendeten Bytestrom nicht nur auf Sonderzeichen
hin untersuchen m?ssen, sondern auch die ?bertragung von Signalen f?r
LPD ?bernehmen m?ssen.

Sie *ben?tigen* Ausgabefilter aber dann, wenn Sie Deckbl?tter drucken
wollen, da dazu Escape-Sequenzen und Initialisierungsstrings
erforderlich sind. (Es ist allerdings *nicht m?glich*, den Druck dieser
Deckbl?tter zu verrechnen, da LPD keine Benutzer- oder
Rechnerinformationen an den Ausgabefilter ?bergibt.)

LPD kann f?r den gleichen Drucker sowohl Ausgabefilter als auch
Textfilter verwenden. In solchen F?llen verwendet LPD den Ausgabefilter
nur f?r den Druck von Deckbl?ttern (die im Abschnitt
`Deckbl?tter <printing-advanced.html#printing-advanced-header-pages>`__
n?her beschrieben werden). Nach dem Druck des Deckblattes erwartet LPD,
dass sich der Ausgabefilter *selbst beendet*. Dazu werden zwei Bytes an
den Ausgabefilter gesendet: ASCII 031, gefolgt von ASCII 001. Wenn ein
Ausgabefilter diese zwei Bytes (031, 001) empf?ngt, sendet er das Signal
``SIGSTOP`` an sich selbst. Nachdem LPD den Rest des Druckauftrages
erledigt hat, wird der Ausgabefilter erneut gestartet, indem ein
``SIGCONT`` an den Ausgabefilter gesendet wird.

Haben Sie nur einen Ausgabefilter, aber *keinen* Textfilter installiert,
dann verwendet LPD den Ausgabefilter auch f?r den Druck von normalem
Text. Wie bereits erw?hnt, werden dabei allerdings alle Dateien des
Druckauftrags unmittelbar hintereinander gedruckt, Seitenumbr?che oder
ein zus?tzlicher Papiervorschub sind also nicht m?glich. Da dieses
Verhalten von Ihnen wahrscheinlich *nicht* gew?nscht wird, werden Sie in
fast allen F?llen einen zus?tzlichen Textfilter ben?tigen.

Der weiter oben beschriebene Textfilter ``lpf`` kann auch als
Ausgabefilter verwendet werden. Wenn Sie nur einen funktionierenden
Ausgabefilter ben?tigen, aber nicht den daf?r ben?tigten Code (zur
Zeichenerkennung und zum Senden von Signalen) schreiben wollen, sollten
Sie sich ``lpf`` n?her ansehen. Sie k?nnen ``lpf`` auch in ein
Shell-Skript einbinden, um von Ihrem Drucker ben?tigte
Initialisierungscodes zu verarbeiten.

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

10.4.1.6. ``lpf``: Ein Textfilter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Textfilter (Eingabefilter) ``/usr/libexec/lpr/lpf`` wird bereits mit
FreeBSD geliefert. Er erlaubt das Einr?cken der Ausgabe (?ber
``lpr -i``), die ?bergabe von Zeichen-Literalen (?ber ``lpr -l``), das
Anpassen der Druckposition bei gel?schten Zeichen (*Backspaces*) oder
Tabulatoren, sowie die Verrechnung gedruckter Seiten. Zus?tzlich kann
dieser Textfilter auch als Ausgabefilter arbeiten.

``lpf`` ist f?r viele verschiedene Druckumgebungen geeignet. Zwar ist
dieser Textfilter nicht in der Lage, Initialisierungssequenzen an einen
Drucker zu senden, dieses Problem kann allerdings durch das Schreiben
und Ausf?hren eines Shell-Skripts (das diese Funktion ?bernimmt) und das
anschlie?ende Aufrufen von ``lpf`` gel?st werden.

Damit Sie ``lpf`` f?r die Verrechnung von Druckauftr?gen einsetzen
k?nnen, m?ssen Sie die korrekten Werte f?r die ``pw``- und
``pl``-F?higkeiten in ``/etc/printcap`` eintragen. ``lpf`` verwendet
diese Werte, um festzustellen, wieviel Text auf eine Seite passt und
wieviele Seiten im Druckauftrag enthalten sind. Weitere Informationen
zur Verrechnung der Druckernutzung enth?lt der Abschnitt `Die
Druckernutzung
verrechnen <printing-advanced.html#printing-advanced-acct>`__.

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

10.4.2. Deckbl?tter
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie *viele* Benutzer mit verschiedenen Druckern verwalten m?ssen,
sollten Sie *Deckbl?tter* als notwendiges ?bel akzeptieren.

Deckbl?tter (manchmal auch als *Bannerseiten* oder *burst pages*
bezeichnet) geben an, wem die Ausgabe eines Druckauftrags geh?rt. Sie
werden normalerweise in gro?en fetten Buchstaben gedruckt, manchmal
sogar mit zus?tzlicher Umrandung, damit man sie leichter von den
tats?chlichen Seiten eines Druckauftrages unterscheiden kann. Der
Nachteil von Deckbl?ttern ist allerdings, dass es sich dabei um eine
zus?tzliche zu druckende Seite handelt, die in der Regel bereits nach
wenigen Minuten wieder im Papierkorb landet. Da aber f?r jeden
Druckauftrag nur ein einziges Deckblatt gedruckt wird, ist der
Papierverbrauch in den meisten F?llen tolerierbar.

Das LPD-System kann Deckbl?tter automatisch erzeugen, *wenn* Ihr Drucker
normalen Text direkt drucken kann. Haben Sie hingegen einen
PostScript?-Drucker, ben?tigen Sie ein externes Programm, um die
Deckbl?tter zu generieren (Lesen Sie dazu auch den Abschnitt
`Deckbl?tter auf PostScript?-Druckern
erzeugen <printing-advanced.html#printing-advanced-header-pages-ps>`__.).

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.4.2.1. Deckbl?tter aktivieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Abschnitt `Einfache
Drucker-Konfiguration <printing-intro-setup.html#printing-simple>`__
haben wir die Ausgabe von Deckbl?ttern durch die die Angabe der Option
``sh`` (*suppress header*) in ``/etc/printcap`` deaktiviert. Um die
Ausgabe von Deckbl?ttern wieder zu aktivieren, m?ssen Sie daher die
``sh``-F?higkeit wieder entfernen.

Das klingt zu einfach? Wo ist der Haken?

Sie haben recht. Es ist *m?glich*, dass Sie einen Ausgabefilter
verwenden m?ssen, um die n?tigen Initialisierungsstrings an den Drucker
zu senden. Das folgende Beispiel beschreibt einen Ausgabefilter f?r
PCL-kompatible Drucker von Hewlett Packard:

.. code:: programlisting

    #!/bin/sh
    #
    #  hpof - Ausgabefilter f?r PCL-kompatible Drucker von Hewlett Packard
    #  Installiert unter:  /usr/local/libexec/hpof

    printf "\033&k2G" || exit 2
    exec /usr/libexec/lpr/lpf

Geben Sie den Pfad des Ausgabefilters ?ber die ``of``-F?higkeit an.
Weitere Informationen finden Sie im Abschnitt
`Ausgabefilter <printing-advanced.html#printing-advanced-of>`__.

Das n?chste Beispiel beschreibt die Datei ``/etc/printcap`` des bereits
erw?hnten Druckers ``teak``. Allerdings sind nun die Ausgabe von
Deckbl?ttern sowie der vorhin beschriebene Ausgabefilter enthalten:

.. code:: programlisting

    #
    #  /etc/printcap f?r den Rechner orchid
    #
    teak|hp|laserjet|Hewlett Packard LaserJet 3Si:\
            :lp=/dev/lpt0:sd=/var/spool/lpd/teak:mx#0:\
            :if=/usr/local/libexec/hpif:\
            :vf=/usr/local/libexec/hpvf:\
            :of=/usr/local/libexec/hpof:

Wenn ein Anwender nun einen Druckauftrag an den Drucker ``teak``
schickt, wird f?r jeden Druckauftrag ein Deckblatt erstellt. Ben?tigt
ein Anwender keine Deckbl?tter, kann er die Ausgabe dieser Seiten durch
die Verwendung von ``lpr       -h`` unterdr?cken. Weitere, f?r die
Ausgabe von Deckbl?ttern interessante
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__-Optionen
finden Sie im Abschnitt
`Deckblattoptionen <printing-using.html#printing-lpr-options-misc>`__.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

LPD verwendet ein *Form Feed*, um das Deckblatt abzuschlie?en. Wenn Ihr
Drucker ein anderes Zeichen verwendet, um eine Seite auszuwerfen, geben
Sie dieses ?ber die ``ff``-F?higkeit in ``/etc/printcap`` an.

.. raw:: html

   </div>

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

10.4.2.2. Deckbl?tter kontrollieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Haben Sie die Ausgabe von Deckbl?ttern aktiviert, gibt LPD eine ganze
Seite in gro?en Buchstaben aus, die den Anwender, den verwendeten
Rechner sowie den Druckauftrag beschreiben. Das folgende Beispiel ist
ein Deckblatt f?r den Druckauftrag „outline“, der von ``kelly`` auf dem
Rechner ``rose`` erstellt wurde:

.. code:: screen

          k                   ll       ll
          k                    l        l
          k                    l        l
          k   k     eeee       l        l     y    y
          k  k     e    e      l        l     y    y
          k k      eeeeee      l        l     y    y
          kk k     e           l        l     y    y
          k   k    e    e      l        l     y   yy
          k    k    eeee      lll      lll     yyy y
                                                   y
                                              y    y
                                               yyyy


                                       ll
                              t         l        i
                              t         l
           oooo    u    u   ttttt       l       ii     n nnn     eeee
          o    o   u    u     t         l        i     nn   n   e    e
          o    o   u    u     t         l        i     n    n   eeeeee
          o    o   u    u     t         l        i     n    n   e
          o    o   u   uu     t  t      l        i     n    n   e    e
           oooo     uuu u      tt      lll      iii    n    n    eeee









          r rrr     oooo     ssss     eeee
          rr   r   o    o   s    s   e    e
          r        o    o    ss      eeeeee
          r        o    o      ss    e
          r        o    o   s    s   e    e
          r         oooo     ssss     eeee







                                                  Job:  outline
                                                  Date: Sun Sep 17 11:04:58 1995

LPD f?gt ein *Form Feed* an diesen Text an, damit der eigentliche
Druckauftrag auf einer neuen Seite gestartet wird (es sei denn, Sie
haben die ``sf``-F?higkeit (*suppress form feeds*) des jeweiligen
Druckers in ``/etc/printcap`` aktiviert).

Wenn Sie dies w?schen, kann LPD auch nur ein *kurzes Deckblatt*
ausgeben. Dazu verwenden Sie die Option ``sb`` (*short banner*) in
``/etc/printcap``. Dadurch erhalten Sie ein Deckblatt ?hnlich dem
folgenden:

.. code:: screen

    rose:kelly  Job: outline  Date: Sun Sep 17 11:07:51 1995

In der Voreinstellung druckt LPD zuerst das Deckblatt und danach den
eigentlichen Druckauftrag. Um diese Reihenfolge umzukehren, geben Sie
die Option ``hl`` (*header last*) in ``/etc/printcap`` ans.

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

10.4.2.3. Deckbl?tter verrechnen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die in LPD eingebaute Funktion zur Erstellung von Deckbl?ttern
verwenden, werden Sie auf folgendes Paradigma sto?en: Deckbl?tter m?ssen
*kostenlos* sein.

Warum ist das so?

Weil der Ausgabefilter das einzige externe Programm ist, das zum
Zeitpunkt der Erstellung des Deckblatts eine Verrechnung durchf?hren
k?nnte. Da Ausgabefilter aber weder ?ber *Benutzer- noch ?ber
Rechnerinformationen* verf?gen, ist es nicht m?glich, einen Druckauftrag
einem bestimmten Benutzer zuzuordnen. Da ein Benutzer die Ausgabe von
Deckbl?ttern ?ber ``lpr -h`` unterdr?cken kann, ist es auch nicht
m?glich, die Vorgabe „verrechne eine zus?tzliche Seite“ in den Text-
oder Konvertierungsfilter (die ?ber die zur Verrechnung n?tigen
Benutzer- und Rechnerinformationen verf?gen) aufzunehmen, weil Benutzer
sonst f?r Deckbl?tter bezahlen m?ssten, die sie nicht gedruckt haben.

Es ist *ebenfalls nicht ausreichend*, jeden Filter eigene Deckbl?tter
erzeugen zu lassen (und sie dadurch verrechnen zu k?nnen). Wollte ein
Benutzer durch ein ``lpr -h`` die Ausgabe eines Deckblattes
unterdr?cken, w?rde dieses nun trotzdem verrechnet werden, da LPD keine
Informationen ?ber die Verwendung der Option ``-h`` an einen Filter
weitergibt.

Welche M?glichkeiten habe ich nun?

Sie k?nnen:

.. raw:: html

   <div class="itemizedlist">

-  Das Paradigma von LPD einfach akzeptieren und die Deckbl?tter gratis
   abgeben.

-  Eine alternatives Drucksystem wie LPRng installieren. Der Abschnitt
   `Alternativen zum
   Standard-Drucksystem <printing-lpd-alternatives.html>`__ beschreibt
   verschiedene Drucksysteme, die LPD ersetzen k?nnen.

-  Schreiben Sie einen *intelligenten* Ausgabefilter. Normalerweise
   k?mmert sich ein Ausgabefilter nur um die Initialisierung des
   Druckers oder um eine einfache Zeichenkonvertierung. Au?erdem eignet
   er sich f?r die Ausgabe von Deckbl?ttern und normalem Text, wenn Sie
   keinen Text- oder Eingabefilter installiert haben. Haben Sie
   allerdings einen Textfilter installiert, verwendet LPD Ausgabefilter
   nur f?r die Ausgabe von Deckbl?ttern. Ein Ausgabefilter kann den Text
   des von LPD erzeugten Deckblattes untersuchen, um festzustellen,
   welcher Benutzer und welcher Rechner den Druckauftrag gestartet hat.
   Leider wei? der Ausgabefilter auch mit dieser Methode nicht, welche
   Datei er zur Verrechnung verwenden soll (da der Name dieser Datei
   durch die ``af``-F?higkeit ?bergeben wird). Wenn Sie eine
   Standard-Verrechnungsdatei verwenden, k?nnen Sie diese in den
   Ausgabefilter einbauen. Um den Text des Deckblattes zu untersuchen,
   verwenden Sie die ``sh``-F?higkeit (*short header*) in
   ``/etc/printcap``. Falls Ihnen das zuviel Aufwand ist, freuen sich
   Ihre Benutzer sicher dar?ber, wenn Sie ihnen den kostenlosen Druck
   von Deckbl?ttern erlauben.

.. raw:: html

   </div>

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

10.4.2.4. Deckbl?tter auf PostScript?-Druckern ausgeben
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Regel erzeugt LPD ein Deckblatt mit normalem Text, das f?r viele
verschiedene Drucker geeignet ist. Da PostScript?-Drucker normalen Text
aber nicht drucken k?nnen, ist die LPD-Funktion zur Erstellung von
Deckbl?ttern auf diesen Drucker relativ sinnlos.

Es sei denn, jeder Text- und Konvertierungsfilter erzeugt ?ber den
Benutzer- und Rechnernamen sein eigenes, f?r den jeweiligen Drucker
geeignetes Deckblatt. Das Problem dieser Methode ist allerdings, dass
ein Anwender auch dann ein Deckblatt erh?lt, wenn er dies ?ber
``lpr -h`` verhindern wollte.

Das folgende Skript ben?tigt drei Argumente (den Loginnamen des
Benutzers, den Rechnernamen und den Namen des Druckauftrages), um daraus
ein einfaches PostScript?-Deckblatt zu erzeugen:

.. code:: programlisting

    #!/bin/sh
    #
    #  make-ps-header - ein PostScript-Deckblatt auf stdout ausgeben
    #  Installiert unter:  /sr/local/libexec/make-ps-header
    #

    #
    #  Die folgenden Werte sind PostScript-Einheiten (72 pro Zoll).
    #  Passen Sie diese Werte f?r A4 oder die von Ihnen verwendete
    #  Papiergr??e an:
    #
    page_width=612
    page_height=792
    border=72

    #
    #  Argumente pr?fen
    #
    if [ $# -ne 3 ]; then
        echo "Usage: `basename $0` <user> <host> <job>" 1>&2
        exit 1
    fi

    #
    #  Diese Werte in Variablen speichern, damit der PostScript-Code
    #  ?bersichtlicher wird.
    #
    user=$1
    host=$2
    job=$3
    date=`date`

    #
    #  Sende den PostScript-Code an stdout.
    #
    exec cat <<EOF
    %!PS

    %
    %  Sicherstellen, dass es keine unerw?nschten Wechselwirkungen mit
    %  dem folgenden Druckauftrag gibt.
    %
    save

    %
    %  Ziehe eine fette Umrandung.
    %
    $border $border moveto
    $page_width $border 2 mul sub 0 rlineto
    0 $page_height $border 2 mul sub rlineto
    currentscreen 3 -1 roll pop 100 3 1 roll setscreen
    $border 2 mul $page_width sub 0 rlineto closepath
    0.8 setgray 10 setlinewidth stroke 0 setgray

    %
    %  Zeige den Benutzernamen gro? und fett an.
    %
    /Helvetica-Bold findfont 64 scalefont setfont
    $page_width ($user) stringwidth pop sub 2 div $page_height 200 sub moveto
    ($user) show

    %
    %  Und nun zeige noch die Einzelheiten an.
    %
    /Helvetica findfont 14 scalefont setfont
    /y 200 def
    [ (Job:) (Host:) (Date:) ] {
    200 y moveto show /y y 18 sub def }
    forall

    /Helvetica-Bold findfont 14 scalefont setfont
    /y 200 def
    [ ($job) ($host) ($date) ] {
            270 y moveto show /y y 18 sub def
    } forall

    %
    % Das wars.
    %
    restore
    showpage
    EOF     

Nun kann jeder Konvertierungs- oder Textfilter dieses Skript aufrufen,
um zuerst das Deckblatt zu erzeugen und danach den Druckauftrag zu
drucken. Das n?chste Beispiel enth?lt den bereits beschriebenen
DVI-Konvertierungsfilter, der hier um die Funktion zur Erzeugung eines
Deckblatts erweitert wurde:

.. code:: programlisting

    #!/bin/sh
    #
    #  psdf - DVI-nach-PostScript - Druckerfilter
    #  Installiert unter:  /usr/local/libexec/psdf
    #
    #  Wird von lpd aufgerufen, wenn der Benutzer lpr -d verwendet.
    #

    orig_args="$@"

    fail() {
        echo "$@" 1>&2
        exit 2
    }

    while getopts "x:y:n:h:" option; do
        case $option in
            x|y)  ;; # Ignore
            n)    login=$OPTARG ;;
            h)    host=$OPTARG ;;
            *)    echo "LPD started `basename $0` wrong." 1>&2
                  exit 2
                  ;;
        esac
    done

    [ "$login" ] || fail "No login name"
    [ "$host" ] || fail "No host name"

    ( /usr/local/libexec/make-ps-header $login $host "DVI File"
      /usr/local/bin/dvips -f ) | eval /usr/local/libexec/lprps $orig_args

Beachten Sie, dass der Filter die Liste der Argumente ?berpr?ft, um den
Benutzer- und den Rechnernamen zu ermitteln. Dieser Vorgang ist
prinzipiell f?r alle Filter identisch. Der Textfilter ben?tigt
allerdings etwas andere Argumente, die im Abschnitt `Die Funktionsweise
von Filtern <printing-advanced.html#printing-advanced-filters>`__
beschrieben werden.

Wie bereits erw?hnt, deaktiviert diese Methode leider die „suppress
header page“-Option (also die Option ``-h``) von ``lpr``. Benutzer
k?nnen danach den Ausdruck eines Deckblattes nicht mehr verhindern, da
der angepasste Filter zu jedem Druckauftrag automatisch ein Deckblatt
erstellt.

Damit ein Benutzer bei Bedarf den Ausdruck eines Deckblatts dennoch
unterbinden kann, m?ssen Sie auch hier den im Abschnitt `Deckbl?tter
verrechnen <printing-advanced.html#printing-advanced-header-pages-accounting>`__
beschriebenen Trick einsetzen: Schreiben Sie einen Ausgabefilter, der
das von LPD erzeugte Deckblatt untersucht und daraus eine
PostScript?-Version erzeugt. Wenn der Benutzer den Druckauftrag mit
``lpr -h`` verschickt, erzeugt LPD kein Deckblatt, was in weiterer Folge
auch f?r Ihren Ausgabefilter gilt. Soll hingegen ein Deckblatt erzeugt
werden, liest der Ausgabefilter den von LPD ?bergebenen Text und erzeugt
daraus ein f?r Ihren PostScript?-Drucker geeignetes Deckblatt.

Haben Sie Ihren PostScript?-Drucker ?ber eine serielle Verbindung
angeschlossen, k?nnen Sie auch ``lprps`` verwenden. In diesem Paket ist
mit ``psof`` auch ein Ausgabefilter enthalten, der die eben
beschriebenen Funktionen ?bernehmen kann. Beachten Sie aber, dass Sie
mit ``psof`` keine Deckbl?tter verrechnen k?nnen.

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

10.4.3. Drucken ?ber ein Netzwerk
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD unterst?tzt das Drucken ?ber ein Netzwerk, also den Versand von
Druckauftr?gen an einen entfernten Drucker. Man unterscheidet dabei zwei
M?glichkeiten:

.. raw:: html

   <div class="itemizedlist">

-  Den Zugriff auf einen an einem entfernten Rechner angeschlossenen
   Drucker. Sie konfigurieren dabei auf Ihrem System einen Drucker, der
   ?ber eine konventionelle serielle oder parallele Verbindung an einem
   anderen Rechner angeschlossen ist. Danach richten Sie LPD auf dem
   entfernten System so ein, dass andere Drucker ?ber das Netzwerk auf
   diesen Drucker zugreifen k?nnen. Der Abschnitt `Auf entfernten
   Rechnern installierte
   Drucker <printing-advanced.html#printing-advanced-network-rm>`__
   beschreibt, wie Sie dazu vorgehen m?ssen.

-  Den Zugriff auf einen direkt an ein Netzwerk angeschlossenen Drucker.
   Ein solcher Drucker verf?gt anstelle (oder zus?tzlich zu) einer
   parallelen oder seriellen Schnittstelle ?ber eine
   Netzwerkschnittstelle. Ein solcher Drucker kann sich auf zwei Arten
   verhalten:

   .. raw:: html

      <div class="itemizedlist">

   -  Er kann das LPD-Protokoll direkt unterst?tzen und sogar Druckjobs
      von entfernten Rechner verwalten. In diesem Fall verh?lt sich der
      Drucker wie ein normaler Rechner, auf dem LPD l?uft. Lesen Sie den
      Abschnitt `Auf entfernten Rechnern installierte
      Drucker <printing-advanced.html#printing-advanced-network-rm>`__,
      um einen solchen Drucker einzurichten.

   -  Er k?nnte Verbindungen ?ber ein Netzwerk unterst?tzen. In diesem
      Fall „verbinden“ Sie den Drucker mit einem Rechner Ihres
      Netzwerks, der danach f?r die Verwaltung von Druckauftr?gen sowie
      den tats?chlichen Druck verantwortlich ist. Der Abschnitt `Drucker
      mit direkter
      TCP-Schnittstelle <printing-advanced.html#printing-advanced-network-net-if>`__
      enth?lt Hinweise zur Installation derartiger Drucker.

   .. raw:: html

      </div>

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

10.4.3.1. Auf entfernten Rechnern installierte Drucker
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das LPD-Drucksystem unterst?tzt den Versand von Druckauftr?gen an andere
Rechner, auf denen entweder LPD l?uft oder die zu LPD kompatibel sind.
Dadurch k?nnen Sie einen Drucker auf einem Rechner installieren und von
anderen Rechnern des Netzwerks darauf zugreifen. Au?erdem werden Drucker
mit direkter TCP-Schnittstelle unterst?tzt, wenn diese das LPD-Protokoll
unterst?tzen.

Um diese Art des Druckens ?ber ein Netzwerk zu aktivieren, installieren
Sie zuerst Ihren Drucker auf einem Rechner Ihres Netzwerks, dem
sogenannten *printer host*. Die dazu n?tigen Schritte werden im
Abschnitt `Einfache
Drucker-Konfiguration <printing-intro-setup.html#printing-simple>`__
beschrieben. Falls Sie eine erweiterte Druckerkonfiguration ben?tigen,
sollten Sie auch den Abschnitt `Erweiterte
Drucker-Konfiguration <printing-advanced.html>`__ lesen. Danach testen
Sie, ob der Drucker alle von Ihnen aktivierten LPD-F?higkeiten
unterst?tzt. Stellen Sie auch sicher, dass Ihr *lokales System*
berechtigt ist, den LPD-Dienst auf dem *entfernten System* zu nutzen
(lesen Sie dazu den Abschnitt `Druckauftr?ge auf entfernten Druckern
beschr?nken <printing-advanced.html#printing-advanced-restricting-remote>`__).

Wenn Sie einen Drucker mit einer zu LPD kompatiblen
Netzwerkschnittstelle verwenden, handelt es sich beim *printer host* um
den Drucker selbst, und der *Druckername* ist der von Ihnen f?r diesen
Drucker vorgegebene Name. Lesen Sie die Dokumentation Ihres Druckers
und/oder der Netzwerkschnittstelle Ihres Druckers, um dies zu kl?ren.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Wenn Sie einen Hewlett Packard Laserjet-Drucker verwenden, sorgt der
Druckername ``text`` f?r eine automatische LF-zu-CRLF-Konvertierung. In
diesem Fall wird das ``hpif``-Skript nicht ben?tigt.

.. raw:: html

   </div>

Danach m?ssen Sie auf jedem Rechner, der auf diesen Drucker zugreifen
soll, einen entsprechenden Eintrag in deren ``/etc/printcap`` aufnehmen.
Dazu werden folgende Informationen ben?tigt:

.. raw:: html

   <div class="orderedlist">

#. Der Name des Eintrags. Entspricht in der Regel dem Eintrag auf dem
   *printer host*.

#. Lassen Sie den Eintrag f?r die ``lp``-F?higkeit leer, schreiben Sie
   also ``:lp=:``.

#. Erzeugen Sie ein Spooling-Verzeichnis und geben Sie dessen Pfad ?ber
   die ``sd``-F?higkeit an. LPD speichert Ihre Druckauftr?ge in diesem
   Verzeichnis, bevor sie an den Drucker geschickt werden.

#. Geben Sie den Namen des *printer hosts* ?ber die ``rm``-F?higkeit an.

#. Geben Sie den Namen des Druckers (auf dem *printer host*) ?ber die
   ``rp``-F?higkeit an.

.. raw:: html

   </div>

Das ist alles. Sie ben?tigen weder Konvertierungsfilter, noch
Seitengr??en oder sonstige Angaben in Ihrer lokalen ``/etc/printcap``.

Dazu ein Beispiel. Der Rechner ``rose`` verf?gt ?ber zwei Drucker,
``bamboo`` und ``rattan``. Wir wollen nun allen Benutzern des Rechners
``orchid`` erlauben, diese Drucker zu verwenden. Es folgt nun wieder die
bereits aus dem Abschnitt `Deckbl?tter
verwenden <printing-advanced.html#printing-advanced-header-pages-enabling>`__
bekannte ``/etc/printcap`` f?r den Rechner ``orchid``. Diese enthielt
bereits einen Eintrag f?r den Drucker ``teak``. Zus?tzlich tragen wir
nun die zwei Drucker des Rechners ``rose`` ein:

.. code:: programlisting

    #
    #  /etc/printcap f?r den Rechner orchid - mit zus?tzlichen
    #  Eintr?gen f?r die (entfernten) Drucker auf dem Rechner rose
    #

    #
    #  teak ist ein lokaler Drucker und direkt mit orchid verbunden:
    #
    teak|hp|laserjet|Hewlett Packard LaserJet 3Si:\
            :lp=/dev/lpt0:sd=/var/spool/lpd/teak:mx#0:\
            :if=/usr/local/libexec/ifhp:\
            :vf=/usr/local/libexec/vfhp:\
            :of=/usr/local/libexec/ofhp:

    #
    #  rattan ist mit rose verbunden, Druckauftr?ge f?r rattan gehen daher
    #  an den Rechner rose:
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :lp=:rm=rose:rp=rattan:sd=/var/spool/lpd/rattan:

    #
    #  bamboo ist ebenfalls mit rose verbunden:
    #
    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :lp=:rm=rose:rp=bamboo:sd=/var/spool/lpd/bamboo:

Nun m?ssen wir nur noch die Spooling-Verzeichnisse auf dem Rechner
``orchid`` erzeugen:

.. code:: screen

    # mkdir -p /var/spool/lpd/rattan /var/spool/lpd/bamboo
    # chmod 770 /var/spool/lpd/rattan /var/spool/lpd/bamboo
    # chown daemon:daemon /var/spool/lpd/rattan /var/spool/lpd/bamboo

Damit k?nnen Benutzer des Rechners ``orchid`` die Drucker ``rattan`` und
``bamboo`` verwenden. Ein Benutzer gibt auf ``orchid`` beispielsweise
ein:

.. code:: screen

    % lpr -P bamboo -d sushi-review.dvi

Die Anwendung LPD auf dem Rechner ``orchid`` kopiert daraufhin den
Druckauftrag in das Spooling-Verzeichnis ``/var/spool/lpd/bamboo`` und
stellt fest, dass es sich um einen DVI-Auftrag handelt. Sobald ``rose``
?ber genug freien Platz im ``bamboo``-Spooling-Verzeichnis verf?gt,
w?rden die beiden LPD die Datei auf den Rechner ``rose`` transferieren.
Diese Datei verbleibt danach in der Druckerwarteschlange des Rechners
``rose``, bis der Ausdruck der Datei abgeschlossen ist. Vor dem Ausdruck
w?rde die Datei noch von DVI nach PostScript? konvertiert werden, da es
sich bei ``bamboo`` um einen an den Rechner ``rose`` angeschlossenen
PostScript?-Drucker handelt.

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

10.4.3.2. Drucker mit direkter TCP-Schnittstelle
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie eine Netzwerkkarte f?r Ihren Drucker kaufen, k?nnen Sie zwei
verschiedene Versionen w?hlen: Eine Version, die ein Drucksystem
emuliert (die teure Version), oder eine Version, die sich verh?lt, als
w?re der Drucker an eine serielle oder parallele Schnittstelle
angeschlossen (die billige Version). Dieser Abschnitt beschreibt die
billige Variante. Bevorzugen Sie die teure Variante, sollten Sie den
Abschnitt `Auf entfernten Rechnern installierte
Drucker <printing-advanced.html#printing-advanced-network-rm>`__
nochmals lesen.

Das Format der Datei ``/etc/printcap`` erlaubt es Ihnen, anzugeben,
welche serielle oder parallele Schnittstelle verwendet werden soll und
(falls Sie eine serielle Schnittstelle verwenden) welche Parameter
(Baudrate, Flu?kontrolle, Behandlung von Tabulatoren, Konvertierung von
neuen Zeilen und andere mehr) Sie verwenden wollen. Es gibt allerdings
keine M?glichkeit, eine Verbindung zu einem Drucker zu definieren, der
einen TCP/IP- oder einem anderem Netzwerkport auf Druckauftr?ge hin
abfragt.

Um Daten an einen Netzwerkdrucker zu schicken, m?ssen Sie daher ein
Kommunikationsprogramm entwickeln, das von Text- und
Konvertierungsfiltern aufgerufen werden kann. Dazu ein Beispiel. Das
Skript ``netprint`` ?bernimmt alle Daten von der Standardeingabe und
schickt sie an einen Netzwerkdrucker. ``netprint`` erwartet zwei
Argumente: Als erstes Argument wird der Hostname des Druckers und als
zweites Argument der Port, ?ber den die Verbindung erfolgen soll,
?bergeben. Dabei handelt sich allerdings um eine Ein-Wege-Kommunikation
(von FreeBSD zum Drucker). Viele Netzwerkdrucker unterst?tzen aber auch
eine Zwei-Wege-Kommunikation, deren Vorteile (Abfrage des Druckerstatus,
die Verrechnung von Druckauftr?gen und andere mehr) Sie vielleicht
nutzen wollen.

.. code:: programlisting

    #!/usr/bin/perl
    #
    #  netprint - Textfilter f?r einen Netzwerkdrucker
    #  Installiert unter:  /usr/local/libexec/netprint
    #
    $#ARGV eq 1 || die "Usage: $0 <printer-hostname> <port-number>";

    $printer_host = $ARGV[0];
    $printer_port = $ARGV[1];

    require 'sys/socket.ph';

    ($ignore, $ignore, $protocol) = getprotobyname('tcp');
    ($ignore, $ignore, $ignore, $ignore, $address)
        = gethostbyname($printer_host);

    $sockaddr = pack('S n a4 x8', &AF_INET, $printer_port, $address);

    socket(PRINTER, &PF_INET, &SOCK_STREAM, $protocol)
        || die "Can't create TCP/IP stream socket: $!";
    connect(PRINTER, $sockaddr) || die "Can't contact $printer_host: $!";
    while (<STDIN>) { print PRINTER; }
    exit 0; 

Dieses Skript kann f?r verschiedene Filter eingesetzt werden. Das
folgende Beispiel verwendet den an ein Netzwerk angeschlossenen
Zeilendrucker Diablo 750-N. Dieser Drucker empf?ngt zu druckende Daten
auf dem Port 5100. Der Hostname des Druckers lautet ``scrivener``. Daher
sieht der Textfilter f?r diesen Drucker wie folgt aus:

.. code:: programlisting

    #!/bin/sh
    #
    #  diablo-if-net - Textfilter f?r den Diablo-Drucker `scrivener'.
    #  Drucker lauscht auf Port 5100.
    #  Installiert unter:  /usr/local/libexec/diablo-if-net
    #
    exec /usr/libexec/lpr/lpf "$@" | /usr/local/libexec/netprint scrivener 5100

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

10.4.4. Den Druckerzugriff beschr?nken
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, wie Sie den Druckerzugriff beschr?nken
k?nnen. Das LPD-Drucksystem erlaubt Ihnen die Kontrolle dar?ber, wer
lokal oder ?ber ein Netzwerk auf einen Drucker zugreifen darf, ob
mehrere Kopien erstellt werden d?rfen und wie gro? Druckauftr?ge und
Druckerwarteschlangen werden d?rfen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.4.4.1. Den Ausdruck von mehreren Kopien verhindern
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das LPD-System macht es dem einzelnen Benutzer einfach, mehrere Kopien
einer Datei zu drucken. So werden mit ``lpr -#5`` beispielsweise f?nf
Kopien jeder Datei des Druckauftrags erstellt. Ob dies gut oder schlecht
ist, m?ssen Sie selbst entscheiden.

Wenn Sie der Meinung sind, dass multiple Kopien eine unn?tige
Beanspruchung Ihres Druckers darstellen, sollten Sie die ``-#``-Opion
von `lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
deaktivieren, indem Sie die ``sc``-F?higkeit in Ihre ``/etc/printcap``
aufnehmen. Verwendet ein Benutzer dennoch die Option ``-#``, erh?lt er
daraufhin folgende Meldung:

.. code:: screen

    lpr: multiple copies are not allowed

Wenn Sie den Zugriff auf einen entfernten Drucker (wie in Abschnitt `Auf
entfernten Rechnern installierte
Drucker <printing-advanced.html#printing-advanced-network-rm>`__
beschrieben) konfiguriert haben, m?ssen Sie die ``sc``-F?higkeit auch
auf den entfernten Rechnern, die auf Ihren Drucker zugreifen d?rfen, in
``/etc/printcap`` eintragen, damit Benutzer diese Vorgabe nicht durch
den Wechsel auf einen anderen Rechner umgehen k?nnen.

Dazu ein Beispiel. Es handelt sich dabei um die Datei ``/etc/printcap``
auf dem Rechner ``rose``. Der Drucker ``rattan`` soll multiple Kopien
zulassen, auf dem Laserdrucker ``bamboo`` sollen multiple Kopien
hingegen nicht erlaubt sein, daher m?ssen wir f?r diesen Drucker die
``sc``-F?higkeit aktivieren:

.. code:: programlisting

    #
    #  /etc/printcap f?r den Rechner rose - multiple Kopien auf bamboo verbieten
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :sh:sd=/var/spool/lpd/rattan:\
            :lp=/dev/lpt0:\
            :if=/usr/local/libexec/if-simple:

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :sh:sd=/var/spool/lpd/bamboo:sc:\
            :lp=/dev/ttyu5:ms#-parenb cs8 clocal crtscts:rw:\
            :if=/usr/local/libexec/psif:\
            :df=/usr/local/libexec/psdf:

Au?erdem m?ssen wir noch die ``sc``-F?higkeit in der Datei
``/etc/printcap`` des Rechners ``orchid`` aktivieren. Parallel dazu
untersagen wir das Erstellen von multiplen Kopien auf dem Drucker
``teak``:

.. code:: programlisting

    #
    #  /etc/printcap f?r den Rechner orchid - lokal machen wir keine multiplen Kopien
    #  Lokaler Drucker teak oder entfernter Drucker bamboo:
    teak|hp|laserjet|Hewlett Packard LaserJet 3Si:\
            :lp=/dev/lpt0:sd=/var/spool/lpd/teak:mx#0:sc:\
            :if=/usr/local/libexec/ifhp:\
            :vf=/usr/local/libexec/vfhp:\
            :of=/usr/local/libexec/ofhp:

    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :lp=:rm=rose:rp=rattan:sd=/var/spool/lpd/rattan:

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :lp=:rm=rose:rp=bamboo:sd=/var/spool/lpd/bamboo:sc:

Durch die Verwendung der ``sc``-F?higkeit ist zwar die Verwendung von
``lpr -#`` nicht mehr m?glich, ein Benutzer kann aber weiterhin
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
mehrmals hintereinander aufrufen oder eine Datei mehrfach in den
gleichen Druckauftrag aufnehmen:

.. code:: screen

    % lpr forsale.sign forsale.sign forsale.sign forsale.sign forsale.sign

Auch dieser Mi?brauch Ihres Druckers kann verhindert werden, falls Sie
dies w?nschen. Diese Ma?nahmen werden in diesem Abschnitt allerdings
nicht behandelt.

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

10.4.4.2. Den Zugriff auf bestimmte Drucker beschr?nken
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen angeben, wer auf welchem Drucker drucken darf, wenn Sie den
Gruppenmechanismus von UNIX? in Kombination mit der ``rg``-F?higkeit von
``/etc/printcap`` einsetzen. Weisen Sie dazu alle Benutzer, die auf
einen Drucker zugreifen d?rfen, einer gemeinsamen Gruppe zu und geben
Sie diese Gruppe ?ber die ``rg``-F?higkeit an.

Wenn Benutzer, die dieser Gruppe nicht angeh?ren (dies gilt auch f?r
``root``), werden diese durch die Meldung begr?sst, wenn Sie diesen
Drucker verwenden wollen.

.. code:: screen

    lpr: Not a member of the restricted group

Analog zur ``sc``-F?higkeit (*suppress multiple copies*) m?ssen Sie die
``rg``-F?higkeit auch auf allen entfernten Rechnern aktivieren, die auf
Ihren Drucker zugreifen d?rfen (lesen Sie dazu auch den Abschnitt `Auf
entfernten Rechnern installierte
Drucker <printing-advanced.html#printing-advanced-network-rm>`__).

Wollen wir beispielsweise allen Benutzern die Verwendung des Druckers
``rattan``, aber nur Mitgliedern der Gruppe ``artists`` die Verwendung
des Druckers ``bamboo`` erlauben, passen wir die bereits bekannte
``/etc/printcap`` des Rechners ``rose`` entsprechend an:

.. code:: programlisting

    #
    #  /etc/printcap des Rechners rose - Zugriffsbeschr?nkung f?r bamboo
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :sh:sd=/var/spool/lpd/rattan:\
            :lp=/dev/lpt0:\
            :if=/usr/local/libexec/if-simple:

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :sh:sd=/var/spool/lpd/bamboo:sc:rg=artists:\
            :lp=/dev/ttyu5:ms#-parenb cs8 clocal crtscts:rw:\
            :if=/usr/local/libexec/psif:\
            :df=/usr/local/libexec/psdf:

Die Datei ``/etc/printcap`` des Rechners ``orchid`` wird dadurch nicht
beeinflusst. Jeder Benutzer des Rechners ``orchid`` kann also weiterhin
den Drucker ``bamboo`` verwenden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

F?r jeden Drucker kann nur eine einzige priviligierte Gruppe erstellt
werden.

.. raw:: html

   </div>

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

10.4.4.3. Die Gr??e von Druckauftr?gen kontrollieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie viele Benutzer haben, die Ihre Drucker verwenden d?rfen, werden
Sie wahrscheinlich eine Obergrenze f?r Dateien angeben wollen, die
Benutzer an Ihren Drucker senden d?rfen. Dies ist sinnvoll, weil
Speicherplatz f?r Spooling-Verzeichnisse nur begrenzt verf?gbar ist und
Sie stets sicherstellen m?ssen, dass auch die Druckauftr?ge anderer
Benutzer verarbeitet werden k?nnen.

LPD verwendet die ``mx``-F?higkeit, um die maximal erlaubte Gr??e von
Dateien eines Druckauftrags anzugeben. Dieser Wert wird in 1.024 Bytes
gro?en ``BUFSIZ``-Bl?cken angegeben. Setzen Sie diesen Wert auf Null,
gibt es keine Gr??enbeschr?nkung. Existiert die ``mx``-F?higkeit
hingegen ?berhaupt nicht, so gilt ein Limit von 1.000?Bl?cken.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Diese Limits gelten nur f?r die Gr??e von *Dateien* innerhalb eines
Druckauftrages, *nicht aber* f?r die Gesamtgr??e des Druckauftrags.

.. raw:: html

   </div>

LPD lehnt eine Datei auch dann nicht ab, wenn sie das Limit des Druckers
?berschreitet. Vielmehr wird die Datei bis zum Erreichen des Limits in
die Warteschlange geladen, danach wird der Druck gestartet. Der das
Limit ?berschreitende Rest wird hingegen verworfen und nicht gedruckt!

Mit diesem Wissen k?nnen wir nun Limits f?r die Drucker ``rattan`` und
``bamboo`` definieren. Da PostScript?-Dateien der Gruppe ``artists`` in
der Regel sehr gro? sind, setzen wir ein Limit von f?nf Megabytes. F?r
den Druck von normalen Text (auf dem Drucker ``rattan``) setzen wir
hingegen kein Limit:

.. code:: programlisting

    #
    #  /etc/printcap f?r den Rechner rose
    #

    #
    #  Kein Gr??enlimit:
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :sh:mx#0:sd=/var/spool/lpd/rattan:\
            :lp=/dev/lpt0:\
            :if=/usr/local/libexec/if-simple:

    #
    #  Ein Limit von 5 Megabyte:
    #
    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :sh:sd=/var/spool/lpd/bamboo:sc:rg=artists:mx#5000:\
            :lp=/dev/ttyu5:ms#-parenb cs8 clocal crtscts:rw:\
            :if=/usr/local/libexec/psif:\
            :df=/usr/local/libexec/psdf:

Auch diese Limits gelten nur f?r lokale Benutzer. Wenn Sie den Zugriff
auf Ihren Drucker auch ?ber ein Netzwerk erlauben wollen, unterliegen
die Benutzer dieser Rechner diesen Limits nicht. Daher m?ssen Sie diese
Limits ?ber die ``mx``-F?higkeit auch in der ``/etc/printcap`` jedes
Rechners definieren, der Ihren Drucker verwenden darf. Der Abschnitt
`Auf entfernten Rechnern installierte
Drucker <printing-advanced.html#printing-advanced-network-rm>`__ enth?lt
weitere Informationen zum Drucken ?ber ein Netzwerk.

Es gibt eine weitere M?glichkeit, um die Gr??e von Druckauftr?gen von
entfernten Rechnern zu beschr?nken. Lesen Sie dazu den Abschnitt
`Druckauftr?ge von entfernten Rechnern
beschr?nken <printing-advanced.html#printing-advanced-restricting-remote>`__.

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

10.4.4.4. Druckauftr?ge von entfernten Rechnern beschr?nken
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das LPD-System bietet mehrere M?glichkeiten, um Druckauftr?ge zu
beschr?nken, die auf entfernten Rechnern gestartet wurden:

.. raw:: html

   <div class="variablelist">

Rechner beschr?nken
    Sie k?nnen festlegen, von welchen entfernten Rechnern ein lokaler
    LPD Druckauftr?ge annimmt, indem Sie die Dateien
    ``/etc/hosts.equiv`` sowie ``/etc/hosts.lpd`` entsprechend anpassen.
    LPD ?berpr?ft diese Dateien, um festzustellen, ob ein Druckauftrag
    von einem Rechner stammt, der in einer dieser Dateien aufgef?hrt
    ist. Ist dies nicht der Fall, lehnt LPD den Druckauftrag ab.

    Der Aufbau dieser Datei ist sehr einfach: Jede Zeile enth?lt einen
    einzigen Rechnernamen. Beachten Sie aber, dass ``/etc/hosts.equiv``
    auch vom
    `ruserok(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ruserok&sektion=3>`__-Protokoll
    ben?tigt wird und ?nderungen dieser Datei auch Programme wie
    `rsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsh&sektion=1>`__
    und
    `rcp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rcp&sektion=1>`__
    beeinflussen k?nnen.

    Das folgende Beispiel beschreibt die Datei ``/etc/hosts.lpd`` auf
    dem Rechner ``rose``:

    .. code:: programlisting

        orchid
        violet
        madrigal.fishbaum.de

    Durch diese Vorgaben akzeptiert ``rose`` nur noch Druckauftr?ge von
    den Rechnern ``orchid``, ``violet``, und ``madrigal.fishbaum.de``.
    Versucht ein anderer Rechner, auf den LPD von ``rose`` zuzugreifen,
    wird dieser Druckauftrag abgelehnt werden.

Gr??enbeschr?nkungen
    Sie k?nnen festlegen, wieviel Speicherplatz auf dem Dateisystem, in
    dem das Spooling-Verzeichnis liegt, mindestens frei sein muss. Dazu
    erzeugen Sie im Spooling-Verzeichnis Ihres lokalen Druckers die
    Datei ``minfree``. In dieser Datei geben Sie an, wieviele 512?Byte
    gro?e Bl?cke auf Ihrer Platte frei sein m?ssen, damit ein
    Druckauftrag von einem entfernten Rechner akzeptiert wird.

    Durch diese Vorgabe k?nnen Sie sicherstellen, dass Benutzer von
    entfernten Rechnern Ihr Dateisystem nicht „zum?llen“. Au?erdem
    k?nnen Sie damit lokale Benutzer bevorzugen, da diese auch dann noch
    Druckauftr?ge erteilen d?rfen, wenn der verf?gbare Plattenplatz
    unter das in der Datei ``minfree`` definierte Limit gefallen ist.

    Legen wir nun die Datei ``minfree`` f?r den Drucker ``bamboo`` an.
    Zuerst untersuchen wir ``/etc/printcap``, um das
    Spooling-Verzeichnis f?r diesen Drucker zu finden. Das folgende
    Beispiel zeigt den Eintrag f?r den Drucker ``bamboo``:

    .. code:: programlisting

        bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
                :sh:sd=/var/spool/lpd/bamboo:sc:rg=artists:mx#5000:\
                :lp=/dev/ttyu5:ms#-parenb cs8 clocal crtscts:rw:mx#5000:\
                :if=/usr/local/libexec/psif:\
                :df=/usr/local/libexec/psdf:

    Das Spooling-Verzeichnis wird ?ber die ``sd``-F?higkeit festgelegt.
    Wir wollen, dass mindestens drei Megabyte (also 6144?Bl?cke) freier
    Plattenplatz vorhanden sein m?ssen, damit LPD einen Druckauftrag von
    einem entfernten Rechner akzeptiert:

    .. code:: screen

        # echo 6144 > /var/spool/lpd/bamboo/minfree

Benutzer beschr?nken
    Sie k?nnen auch festlegen, welche entfernten Benutzer Ihren lokalen
    Drucker verwenden d?rfen, indem Sie die ``rs``-F?higkeit in
    ``/etc/printcap`` definieren. Wenn f?r den Eintrag eines lokalen
    Druckers die ``rs``-F?higkeit definiert ist, akzeptiert LPD
    Druckauftr?ge von entfernten Rechnern nur dann, *wenn* der Benutzer,
    der den Druckauftrag gesendet hat, auch ?ber ein gleichnamiges
    Benutzerkonto auf dem lokalen Rechner verf?gt. Ist dies nicht der
    Fall, lehnt LPD den Druckauftrag ab.

    Diese F?higkeit ist besonders in Umgebungen n?tzlich, in denen
    beispielsweise verschiedene Abteilungen ein gemeinsames Netzwerk
    teilen, wobei einige Benutzer zu mehreren Abteilungen geh?ren. Haben
    diese Benutzer auch ein Benutzerkonto auf Ihrem System, so k?nnen
    sie Ihren Drucker auch von ihrer eigenen Abteilung aus nutzen.
    Wollen Sie zwar den Zugriff auf Ihren Drucker, *nicht aber* den
    Zugriff auf Ihre ?brigen Ressourcen erlauben, k?nnen Sie f?r diese
    Benutzer einen sogenannten „Token-Account“ ohne Heimatverzeichnis
    und mit einer nutzlosen Shell wie ``/usr/bin/false`` erstellen.

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

10.4.5. Die Druckernutzung verrechnen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie wollen die Nutzung Ihrer Drucker kostenpflichtig machen? Warum auch
nicht? Papier und Tinte kosten Geld. Auch eine regelm??ige Wartung muss
bezahlt werden. Nachdem Sie einen Preis festgelegt haben, den Sie f?r
jede gedruckte Seite verrechnen wollen, stellt sich die Frage, wie Sie
die Verrechnung der Druckkosten technisch umsetzen k?nnen.

Die schlechte Nachricht ist, dass das LPD-System dabei wenig hilfreich
ist. Die Verrechnung von Druckauftr?gen h?ngt stark vom verwendeten
Drucker, den zu druckenden Dateiformaten und *Ihren* Anforderungen an
die Verrechnung der Druckernutzung ab.

Um die Verrechnung der Druckernutzung zu implementieren, m?ssen Sie
sowohl Ihre Textfilter (um den Druck von normalem Text abzurechnen) als
auch Ihre Konvertierungsfilter (um den Druck sonstiger Formate
abzurechnen) entsprechend anpassen, damit diese die Zahl der gedruckten
Seiten ermitteln k?nnen. Leider k?nnen Sie dazu nicht einen einfachen
Ausgabefilter verwenden, da diese die Verrechnung von Druckauftr?gen
nicht unterst?tzen. Weitere Informationen zu den verschiedenen
Filterarten finden Sie im Abschnitt
`Filter <printing-advanced.html#printing-advanced-filter-intro>`__.

Prinzipiell gibt es zwei M?glichkeiten, wie Sie diese Verrechnung
umsetzen k?nnen:

.. raw:: html

   <div class="itemizedlist">

-  Die *periodische Verrechnung* wird h?ufiger verwendet, da sie
   einfacher zu implementieren ist. Wenn ein Druckauftrag ausgef?hrt
   wird, schreibt der Filter den Benutzer, den verwendeten Rechner sowie
   die Anzahl der gedruckten Seiten in eine Verrechnungsdatei. Nach
   einem zu definierenden Zeitraum werden diese Dateien ausgewertet, die
   Gesamtzahl der von einem Benutzer gedruckten Seiten bestimmt und dem
   jeweiligen Benutzer verrechnet. Danach werden alle Protokolldateien
   zur?ckgesetzt, und die Protokollierung beginnt von Neuem.

-  Die *unmittelbare Verrechnung* wird nur selten eingesetzt, das sie
   schwieriger zu implementieren ist. Bei dieser Methode wird der
   Druckauftrag verrechnet, sobald der Drucker verwendet wird. Dadurch
   k?nnen Sie beispielsweise verhindern, dass ein Benutzer seine
   erlaubte „Druckquote“ ?berschreitet. Zus?tzlich k?nnen Sie es Ihren
   Benutzern erlauben, deren Druckquote abzufragen oder anzupassen.
   Allerdings ben?tigen Sie eine Datenbank, um Benutzer und deren Quoten
   verwalten zu k?nnen.

.. raw:: html

   </div>

Das LPD-Drucksystem unterst?tzt beide Methoden. Allerdings m?ssen Sie
die ben?tigen Filter sowie den zur Verrechnung n?tigen Code selbst
bereitstellen. Der Vorteil dabei ist allerdings, dass Sie in der Wahl
Ihrer Verrechnungsmethode ?u?erst flexibel sind. So k?nnen Sie sich etwa
f?r die periodische oder die unmittelbare Verrechnung entscheiden. Sie
k?nnen festlegen, welche Informationen Sie erfassen wollen:
Benutzernamen, Rechnernamen, die Art der Druckauftr?ge, die Anzahl der
gedruckten Seiten, den Papierverbrauch, den Zeitaufwand f?r die
Bearbeitung eines Druckauftrages und viele andere mehr. Dazu m?ssen Sie
Ihre Filter entsprechend anpassen, damit diese Informationen erfassst
und gespeichert werden.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.4.5.1. Kurzanleitung f?r die Implementierung der Druckerverrechnung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD bietet Ihnen zwei Programme, um eine periodische Verrechnung
rasch zu implementieren. Dabei handelt es sich um den im Abschnitt `lpf:
Ein Textfilter <printing-advanced.html#printing-advanced-lpf>`__
behandelten Textfilter sowie um
`pac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pac&sektion=8>`__, ein
Programm, mit dem Sie Eintr?ge aus Verrechnungsdateien auslesen und
aufsummieren k?nnen.

Wie bereits im Abschnitt
`Filter <printing-advanced.html#printing-advanced-filters>`__ erw?hnt,
startet LPD den Text- oder Konvertierungsfilter mit dem Namen der
Verrechnungsdatei als Argument. Dadurch wei? der Filter, in welche Datei
er einen Verrechnungseintrag schreiben soll. Der Name dieser Datei wird
?ber die ``af``-F?higkeit in ``/etc/printcap`` festgelegt. Falls die
Datei nicht ?ber einen absoluten Pfad angegeben wird, handelt es sich um
einen Pfad relativ zum Spooling-Verzeichnis.

LPD startet ``lpf`` mit den Argumenten *page width und page length*, die
?ber die ``pw``- und ``pl``-F?higkeit definiert werden. Das Kommando
``lpf`` verwendet diese Argumente danach, um den Papierverbrauch zu
bestimmen. Nachdem die Datei an den Drucker geschickt wurde, wird ein
Verrechnungseintrag in die Verrechnungsdatei geschrieben. Ein solcher
Eintrag sieht dabei ?hnlich den folgenden aus:

.. code:: programlisting

    2.00 rose:andy
    3.00 rose:kelly
    3.00 orchid:mary
    5.00 orchid:mary
    2.00 orchid:zhang

Sie sollten f?r jeden Drucker eine eigene Verrechnungsdatei verwenden,
da ``lpf`` die Verrechnungsdatei nicht sperren kann. Sind also
gleichzeitig zwei ``lpf``-Instanzen aktiv, kann es dazu kommen, dass
Ihre Verrechnungsdatei zerst?rt wird, wenn beide Instanzen gleichzeitig
in die gleiche Datei schreiben. Damit f?r jeden Drucker eine eigene
Verrechnungsdatei angelegt wird, f?gen Sie den Eintrag ``af=acct`` in
``/etc/printcap`` ein. Dadurch wird f?r jeden Drucker eine separate
Verrechnungsdatei mit dem Namen ``acct`` im Spooling-Verzeichnis des
jeweiligen Druckers erzeugt.

Wenn Sie Ihre Daten erfasst haben und die entstandenen Kosten Ihren
Benutzern verrechnen wollen, starten Sie
`pac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pac&sektion=8>`__.
Dazu wechseln Sie in das Spooling-Verzeichnis des auszuwertenden
Druckers und geben ``pac`` ein. Dadurch erhalten Sie eine Ausgabe
?hnlich der folgenden:

.. code:: screen

      Login               pages/feet   runs    price
    orchid:kelly                5.00    1   $  0.10
    orchid:mary                31.00    3   $  0.62
    orchid:zhang                9.00    1   $  0.18
    rose:andy                   2.00    1   $  0.04
    rose:kelly                177.00  104   $  3.54
    rose:mary                  87.00   32   $  1.74
    rose:root                  26.00   12   $  0.52

    total                     337.00  154   $  6.74

Folgende Argumente k?nnen an
`pac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pac&sektion=8>`__
?bergeben werden:

.. raw:: html

   <div class="variablelist">

``-PDrucker``
    Gibt an, welcher *``Drucker``* ausgewertet werden soll. Diese Option
    setzt voraus, dass f?r die ``af``-F?higkeit in ``/etc/printcap`` ein
    absoluter Pfad angegeben wurde.

``-c``
    Sortiert die Ausgabe nach den verursachten Kosten anstelle einer
    alphabetischen Sortierung der Benutzernamen.

``-m``
    Ignoriert den Rechnernamen in Verrechnungsdateien. Ist diese Option
    gesetzt, ist der Benutzer ``smith`` auf dem Rechner ``alpha`` mit
    dem Benutzer ``smith`` auf dem Rechner ``gamma`` identisch. Ist
    diese Option nicht gesetzt, handelt es sich um unterschiedliche
    Benutzer.

``-pPreis``
    Berechnet die entstandenen Kosten aus dem *``Preis``* in Dollar pro
    Seite statt aus dem ?ber die ``pc``-F?higkeit in ``/etc/printcap``
    definierten Preis. In der Voreinstellung sind dies zwei Cent pro
    Seite. Sie k?nnen aber auch einen eigenen *``Preis``* in Form einer
    Gleitkommazahl angeben.

``-r``
    Die Sortierreihenfolge umkehren.

``-s``
    Die Verrechnungsdatei in einer neuen Datei aufsummieren und die
    originale Verrechnungsdatei zur?cksetzen.

*``name``* *``…``*
    Verrechnungsinformationen nur f?r die angegebenen Benutzernamen
    ausgeben.

.. raw:: html

   </div>

In der Voreinstellung gibt
`pac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pac&sektion=8>`__ aus,
wieviele Seiten von welchem Benutzer auf welchem Rechner gedruckt
wurden. Wenn Rechnernamen f?r Sie uninteressant sind (weil sich Benutzer
beispielsweise auf jedem Rechner anmelden k?nnen), sollten Sie
``pac       -m`` verwenden, um die folgende Ausgabe zu erhalten:

.. code:: screen

      Login               pages/feet   runs    price
    andy                        2.00    1   $  0.04
    kelly                     182.00  105   $  3.64
    mary                      118.00   35   $  2.36
    root                       26.00   12   $  0.52
    zhang                       9.00    1   $  0.18

    total                     337.00  154   $  6.74

Um den zu verrechnenden Betrag zu ermitteln, verwendet
`pac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pac&sektion=8>`__ die
``pc``-F?higkeit von ``/etc/printcap`` (Voreinstellung 200, dieser Wert
entspricht 2 Cents). Geben Sie hier (als Hundertfaches des tats?chlichen
Wertes) den Preis pro Seite an, den Sie verrechnen wollen. Sie k?nnen
diesen Wert ?berschreiben, wenn Sie
`pac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pac&sektion=8>`__ mit
der Option ``-p`` ausf?hren. Beachten Sie dabei aber, dass Sie in diesem
Fall die Einheiten in Dollar angeben, und nicht als Hundertfaches des
tats?chlichen Cent-Betrages. So steht

.. code:: screen

    # pac -p1.50

beispielsweise f?r einen Preis von einem Dollar und f?nfzig Cent pro
Seite.

Der Aufruf von ``pac -s`` f?hrt schlie?lich dazu, dass die aufsummierten
Informationen in einer eigenen Auswertedatei gespeichert werden. Diese
hat den gleichen Namen wie die Verrechnungsdatei, es wird lediglich ein
``_sum`` an den Dateinamen angeh?ngt. Danach wird die Verrechnungsdatei
zur?ckgesetzt. Wenn Sie
`pac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pac&sektion=8>`__
erneut aufrufen, wird die Auswertedatei eingelesen, um die Startbetr?ge
zu erhalten, alle weiteren Informationen stammen danach aus der normalen
Verrechnungsdatei.

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

10.4.5.2. Wie kann man die Anzahl der gedruckten Seiten ermitteln?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die Druckernutzung auch nur ann?hernd genau verrechnen zu k?nnen,
m?ssen Sie ermitteln, wieviel Papier ein Druckauftrag verbraucht. Die
Bestimmung dieses Wertes ist das zentrale Problem, das Sie l?sen m?ssen,
wenn Sie Druckauftr?ge kostenpflichtig machen wollen.

Normaler Text stellt in der Regel kein Problem dar: Sie z?hlen dazu nur
die Zeilen des Druckauftrages und dividieren diesen Wert durch die
Anzahl der Zeilen pro Seite, die Ihr Drucker bietet. Allerdings d?rfen
Sie dabei nicht vergessen, dass gel?schte Zeichen (*Backspaces*) Zeilen
?berschreiben. Au?erdem k?nnen sich lange logische Zeilen (im
Druckauftrag) ?ber mehrere physikalische Zeilen (am Ausdruck)
erstrecken.

Der im Abschnitt `lpf: Ein
Textfilter <printing-advanced.html#printing-advanced-lpf>`__
vorgestellte Textfilter ``lpf`` ber?cksichtigt diese Besonderheiten.
Wenn Sie einen eigenen Textfilter f?r die Verrechnung der Druckernutzung
schreiben wollen, sollten Sie sich daher den Quellcode von ``lpf`` n?her
ansehen.

Aber was ist mit anderen Dateiformaten?

F?r die DVI-nach-LaserJet- oder f?r die
DVI-nach-PostScript?-Konvertierung k?nnen Sie die Protokolldateien von
``dvilj`` oder ``dvips`` auslesen, um festzustellen, wieviele Seiten
konvertiert wurden. Die gleiche Methode k?nnte auch mit anderen
Dateitypen funktionieren.

Alle diese Methoden haben aber das Problem, dass ein Drucker
m?glicherweise nicht alle Seiten des Druckauftrages drucken kann. So
k?nnte es etwa zu einem Papierstau kommen, der Toner k?nnte zu Ende
gehen oder es k?nnte ein Druckerdefekt auftreten?–?trotzdem w?rden alle
Seiten des Druckauftrages verrechnet werden.

Was kann man dagegen tun?

Es gibt nur eine einzige *sichere* Methode, um die Druckernutzung
*exakt* zu bestimmen. Besorgen Sie sich einen Drucker, der das
verbrauchte Papier protokolliert und verbinden Sie ihn ?ber eine
serielle oder eine Netzwerkverbindung. Nahezu alle PostScript?-Drucker,
aber auch viele andere Modelle und Druckertypen (beispielsweise
Laserdrucker von Imagen) sind dazu in der Lage. Passen Sie die Filter
f?r diese Drucker entsprechend an, damit diese nach jedem Druckauftrag
die Anzahl der gedruckten Seiten ermitteln und verrechnen Sie
Druckauftr?ge *ausschlie?lich* ?ber diesen Wert. Danach m?ssen Sie sich
um die Anzahl der gedruckten Zeilen oder um m?gliche Druckerprobleme nie
mehr k?mmern.

Sie k?nnen aber auch gro?z?gig sein und alle Ausdrucke kostenlos
abgeben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------------+---------------------------------------+
| `Zur?ck <printing-intro-setup.html>`__?   | `Nach oben <printing.html>`__   | ?\ `Weiter <printing-using.html>`__   |
+-------------------------------------------+---------------------------------+---------------------------------------+
| 10.3. Grund-Konfiguration?                | `Zum Anfang <index.html>`__     | ?10.5. Drucker verwenden              |
+-------------------------------------------+---------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
