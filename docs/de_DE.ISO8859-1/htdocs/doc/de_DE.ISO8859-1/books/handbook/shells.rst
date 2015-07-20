===========
4.9. Shells
===========

.. raw:: html

   <div class="navheader">

4.9. Shells
`Zur?ck <basics-daemons.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <editors.html>`__

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

4.9. Shells
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Von der tagt?glichen Arbeit mit FreeBSD wird eine Menge mit der
Kommandozeilen Schnittstelle der Shell erledigt. Die Hauptaufgabe einer
Shell besteht darin, Kommandos der Eingabe anzunehmen und diese
auszuf?hren. Viele Shells haben au?erdem eingebaute Funktionen, die die
t?gliche Arbeit erleichtern, beispielsweise eine Dateiverwaltung, die
Vervollst?ndigung von Dateinamen (Globbing), einen Kommandozeileneditor,
sowie Makros und Umgebungsvariablen. FreeBSD enth?lt die Shells ``sh``
(die Bourne Shell) und ``tcsh`` (die verbesserte C-Shell) im
Basissystem. Viele andere Shells, wie ``zsh`` oder ``bash``, befinden
sich in der Ports-Sammlung.

Welche Shell soll ich benutzen? Das ist wirklich eine Geschmacksfrage.
Sind Sie ein C-Programmierer, finden Sie vielleicht eine C-artige Shell
wie die ``tcsh`` angenehmer. Kommen Sie von Linux oder ist Ihnen der
Umgang mit UNIX? Systemen neu, so k?nnten Sie die ``bash`` probieren.
Der Punkt ist, dass jede Shell ihre speziellen Eigenschaften hat, die
mit Ihrer bevorzugten Arbeitsumgebung harmonieren k?nnen oder nicht. Sie
m?ssen sich eine Shell aussuchen.

Ein verbreitetes Merkmal in Shells ist die Dateinamen-Vervollst?ndigung.
Sie m?ssen nur einige Buchstaben eines Kommandos oder eines Dateinamen
eingeben und die Shell vervollst?ndigt den Rest automatisch durch
dr?cken der **Tab**-Taste. Hier ist ein Beispiel. Angenommen, Sie haben
zwei Dateien ``foobar`` und ``foo.bar``. Die Datei ``foo.bar`` m?chten
Sie l?schen. Nun w?rden Sie an der Tastatur eingeben:
``rm fo[Tab].       [Tab]``.

Die Shell w?rde dann ``rm       foo[BEEP].bar`` ausgeben.

[BEEP] meint den Rechner-Piepser. Diesen gibt die Shell aus, um
anzuzeigen, dass es den Dateinamen nicht vervollst?ndigen konnte, da es
mehrere M?glichkeiten gibt. Beide Dateien ``foobar`` und ``foo.bar``
beginnen mit ``fo``, so konnte nur bis ``foo`` erg?nzt werden. Nachdem
Sie ``.`` eingaben und dann die **Tab**-Taste dr?ckten, konnte die Shell
den Rest f?r Sie ausf?llen.

Ein weiteres Merkmal der Shell ist der Gebrauch von Umgebungsvariablen.
Dies sind ver?nderbare Schl?sselpaare im Umgebungsraum der Shell, die
jedes von der Shell aufgerufene Programm lesen kann. Daher enth?lt der
Umgebungsraum viele Konfigurationsdaten f?r Programme. Die folgende
Liste zeigt verbreitete Umgebungsvariablen und was sie bedeuten:

.. raw:: html

   <div class="informaltable">

+----------------+-------------------------------------------------------------------------------------------------------+
| Variable       | Beschreibung                                                                                          |
+================+=======================================================================================================+
| ``USER``       | Name des angemeldeten Benutzers.                                                                      |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``PATH``       | Liste mit Verzeichnissen (getrennt durch Doppelpunkt) zum Suchen nach Programmen.                     |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``DISPLAY``    | Der Name des X11-Bildschirms, auf dem Ausgaben erfolgen sollen.                                       |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``SHELL``      | Die aktuelle Shell.                                                                                   |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``TERM``       | Name des Terminaltyps des Benutzers. Benutzt, um die F?higkeiten des Terminals zu bestimmen.          |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``TERMCAP``    | Datenbankeintrag der Terminal Escape Codes, ben?tigt um verschieden Terminalfunktionen auszuf?hren.   |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``OSTYPE``     | Typ des Betriebsystems, beispielsweise FreeBSD.                                                       |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``MACHTYPE``   | Die CPU Architektur auf dem das System l?uft.                                                         |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``EDITOR``     | Vom Benutzer bevorzugter Text-Editor.                                                                 |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``PAGER``      | Vom Benutzer bevorzugter Text-Betrachter.                                                             |
+----------------+-------------------------------------------------------------------------------------------------------+
| ``MANPATH``    | Liste mit Verzeichnissen (getrennt durch Doppelpunkt) zum Suchen nach Manualpages.                    |
+----------------+-------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Das Setzen von Umgebungsvariablen funktioniert von Shell zu Shell
unterschiedlich. Zum Beispiel benutzt man in C-artigen Shells wie der
``tcsh`` dazu ``setenv``. Unter Bourne-Shells wie ``sh`` oder ``bash``
benutzen Sie zum Setzen von Umgebungsvariablen ``export``. Um
beispielsweise die Variable ``EDITOR`` mit ``csh`` oder ``tcsh`` auf
``/usr/local/bin/emacs`` zu setzen, setzen Sie das folgende Kommando ab:

.. code:: screen

    % setenv EDITOR /usr/local/bin/emacs

Unter Bourne-Shells:

.. code:: screen

    % export EDITOR="/usr/local/bin/emacs"

Sie k?nnen die meisten Shells Umgebungsvariablen expandieren lassen, in
dem Sie in der Kommandozeile ein ``$`` davor eingeben. Zum Beispiel gibt
``echo $TERM`` aus, worauf ``$TERM`` gesetzt ist, weil die Shell
``$TERM`` expandiert und das Ergebnis an ``echo`` gibt.

Shells behandeln viele Spezialzeichen, so genannte Metazeichen, als
besondere Darstellungen f?r Daten. Das allgemeinste ist das Zeichen
``*``, das eine beliebige Anzahl Zeichen in einem Dateinamen
repr?sentiert. Diese Metazeichen k?nnen zum Vervollst?ndigen von
Dateinamen (Globbing) benutzt werden. Beispielsweise liefert das
Kommando ``echo *`` nahezu das gleiche wie die Eingabe von ``ls``, da
die Shell alle Dateinamen die mit ``*`` ?bereinstimmen, an ``echo``
weitergibt.

Um zu verhindern, dass die Shell diese Sonderzeichen interpretiert, kann
man sie sch?tzen, indem man ihnen einen Backslash (``\``) voranstellt.
``echo       $TERM`` gibt aus, auf was auch immer Ihr Terminal gesetzt
ist. ``echo \$TERM`` gibt ``$TERM`` genauso aus, wie es hier steht.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.9.1. ?ndern der Shell
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der einfachste Weg Ihre Shell zu ?ndern, ist das Kommando ``chsh`` zu
benutzen. ``chsh`` platziert Sie im Editor, welcher durch Ihre
Umgebungsvariable ``EDITOR`` gesetzt ist, im ``vi`` wenn die Variable
nicht gesetzt ist. ?ndern Sie die Zeile mit „Shell:“ entsprechend Ihren
W?nschen.

Sie k?nnen auch ``chsh`` mit der Option ``-s`` aufrufen, dann wird Ihre
Shell gesetzt, ohne dass Sie in einen Editor gelangen. Um Ihre Shell zum
Beispiel auf die ``bash`` zu ?ndern, geben Sie das folgende Kommando
ein:

.. code:: screen

    % chsh -s /usr/local/bin/bash

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die von Ihnen gew?nschte Shell *muss* in ``/etc/shells`` aufgef?hrt
sein. Haben Sie eine Shell aus der `Ports-Sammlung <ports.html>`__
installiert, sollte das schon automatisch erledigt werden. Installierten
Sie die Shell von Hand, so m?ssen Sie sie dort eintragen.

Haben Sie beispielsweise die ``bash`` nach ``/usr/local/bin``
installiert, geben Sie Folgendes ein:

.. code:: screen

    # echo "/usr/local/bin/bash" >> /etc/shells

Danach k?nnen Sie ``chsh`` aufrufen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+-------------------------------+--------------------------------+
| `Zur?ck <basics-daemons.html>`__?                  | `Nach oben <basics.html>`__   | ?\ `Weiter <editors.html>`__   |
+----------------------------------------------------+-------------------------------+--------------------------------+
| 4.8. D?monen, Signale und Stoppen von Prozessen?   | `Zum Anfang <index.html>`__   | ?4.10. Text-Editoren           |
+----------------------------------------------------+-------------------------------+--------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
