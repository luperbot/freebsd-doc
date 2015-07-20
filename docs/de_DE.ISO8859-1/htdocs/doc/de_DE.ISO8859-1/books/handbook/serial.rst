================
28.2. Einf?hrung
================

.. raw:: html

   <div class="navheader">

28.2. Einf?hrung
`Zur?ck <serialcomms.html>`__?
Kapitel 28. Serielle Daten?bertragung
?\ `Weiter <term.html>`__

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

28.2. Einf?hrung
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Mit FreeBSD?8.0 wurden die Ger?tedateien f?r serielle Ports von
``/dev/ttydN`` in ``/dev/ttyuN`` umbenannt. Setzen Sie noch FreeBSD?7.X
ein, m?ssen Sie die Befehle in den folgenden Abschnitten entsprechend
anpassen.

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

28.2.1. Begriffe
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

bps
    Bits pro Sekunde – Einheit f?r die ?bertragungsgeschwindigkeit.

DEE (DTE)
    Datenendeinrichtung (Data Terminal Equipment) – zum Beispiel Ihr
    Computer.

D?E (DCE)
    Daten?bertragungseinrichtung (Data Communications Equipment) – Ein
    Modem.

RS-232
    EIA (Electronic Industries Association) Norm f?r die serielle
    Daten?bertragung.

.. raw:: html

   </div>

In diesem Abschnitt wird der Begriff „Baud“ nicht f?r
?bertragungsgeschwindigkeiten gebraucht. Baud bezeichnet elektrische
Zustandswechsel pro Zeiteinheit, die Taktfrequenz, w?hrend „bps“ (Bits
pro Sekunde) der *richtige* Begriff f?r die ?bertragungsgeschwindigkeit
ist (die meisten Pedanten sollten damit zufrieden sein).

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

28.2.2. Kabel und Schnittstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um ein Modem oder einen Terminal an Ihr FreeBSD-System anzuschlie?en,
muss Ihr Computer ?ber eine serielle Schnittstelle verf?gen. Zus?tzlich
brauchen Sie noch das passende Kabel, um das Ger?t mit der Schnittstelle
zu verbinden. Wenn Sie mit Ihren Ger?ten und den n?tigen Kabeln schon
vertraut sind, k?nnen Sie diesen Abschnitt ?berspringen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.2.2.1. Kabel
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt verschiedene serielle Kabel. Die zwei h?ufigsten sind
Nullmodemkabel und Standard-RS-232-Kabel. Die Dokumentation Ihrer
Hardware sollte beschreiben, welchen Kabeltyp Sie ben?tigen.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.2.2.1.1. Nullmodemkabel
''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Nullmodemkabel verbindet einige Signale, wie die Betriebserde, eins
zu eins, andere Signale werden getauscht: Die Sende- und
Empfangsleitungen werden zum Beispiel gekreuzt.

Sie k?nnen das Kabel f?r die Anbindung eines Terminals auch selbst
herstellen. Die folgende Tabelle enth?lt die
`Signalnamen <dialup.html#serialcomms-signal-names>`__ von RS-232C sowie
die Pinbelegung f?r einen Stecker vom Typ DB-25. Beachten Sie dabei
aber, dass der Standard zwar eine direkte Verbindung beider Pin 1
(*Protective Ground*) vorschreibt, diese aber in vielen F?llen nicht
vorhanden ist. Einige Terminals ben?tigen nur die Pins 2, 3 und 7 f?r
eine korrekte Funktion, w?hrend andere eine unterschiedliche
Konfiguration als die in den folgenden Beispielen gezeigte ben?tigen.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 28.1. Nullmodemkabel vom Typ DB-25-zu-DB-25

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------+---------+-----------------+---------+----------+
| Signal   | Pin #   | ?               | Pin #   | Signal   |
+==========+=========+=================+=========+==========+
| SG       | 7       | verbunden mit   | 7       | SG       |
+----------+---------+-----------------+---------+----------+
| TD       | 2       | verbunden mit   | 3       | RD       |
+----------+---------+-----------------+---------+----------+
| RD       | 3       | verbunden mit   | 2       | TD       |
+----------+---------+-----------------+---------+----------+
| RTS      | 4       | verbunden mit   | 5       | CTS      |
+----------+---------+-----------------+---------+----------+
| CTS      | 5       | verbunden mit   | 4       | RTS      |
+----------+---------+-----------------+---------+----------+
| DTR      | 20      | verbunden mit   | 6       | DSR      |
+----------+---------+-----------------+---------+----------+
| DTR      | 20      | verbunden mit   | 8       | DCD      |
+----------+---------+-----------------+---------+----------+
| DSR      | 6       | verbunden mit   | 20      | DTR      |
+----------+---------+-----------------+---------+----------+
| DCD      | 8       | verbunden mit   | 20      | DTR      |
+----------+---------+-----------------+---------+----------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden zwei Schemata werden heutzutage ebenfalls h?ufig
eingesetzt:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 28.2. Nullmodemkabel vom Typ DB-9-zu-DB-9

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------+---------+-----------------+---------+----------+
| Signal   | Pin #   | ?               | Pin #   | Signal   |
+==========+=========+=================+=========+==========+
| RD       | 2       | verbunden mit   | 3       | TD       |
+----------+---------+-----------------+---------+----------+
| TD       | 3       | verbunden mit   | 2       | RD       |
+----------+---------+-----------------+---------+----------+
| DTR      | 4       | verbunden mit   | 6       | DSR      |
+----------+---------+-----------------+---------+----------+
| DTR      | 4       | verbunden mit   | 1       | DCD      |
+----------+---------+-----------------+---------+----------+
| SG       | 5       | verbunden mit   | 5       | SG       |
+----------+---------+-----------------+---------+----------+
| DSR      | 6       | verbunden mit   | 4       | DTR      |
+----------+---------+-----------------+---------+----------+
| DCD      | 1       | verbunden mit   | 4       | DTR      |
+----------+---------+-----------------+---------+----------+
| RTS      | 7       | verbunden mit   | 8       | CTS      |
+----------+---------+-----------------+---------+----------+
| CTS      | 8       | verbunden mit   | 7       | RTS      |
+----------+---------+-----------------+---------+----------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 28.3. Nullmodemkabel vom Typ DB-9-zu-DB-25

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------+---------+-----------------+---------+----------+
| Signal   | Pin #   | ?               | Pin #   | Signal   |
+==========+=========+=================+=========+==========+
| RD       | 2       | verbunden mit   | 2       | TD       |
+----------+---------+-----------------+---------+----------+
| TD       | 3       | verbunden mit   | 3       | RD       |
+----------+---------+-----------------+---------+----------+
| DTR      | 4       | verbunden mit   | 6       | DSR      |
+----------+---------+-----------------+---------+----------+
| DTR      | 4       | verbunden mit   | 8       | DCD      |
+----------+---------+-----------------+---------+----------+
| SG       | 5       | verbunden mit   | 7       | SG       |
+----------+---------+-----------------+---------+----------+
| DSR      | 6       | verbunden mit   | 20      | DTR      |
+----------+---------+-----------------+---------+----------+
| DCD      | 1       | verbunden mit   | 20      | DTR      |
+----------+---------+-----------------+---------+----------+
| RTS      | 7       | verbunden mit   | 5       | CTS      |
+----------+---------+-----------------+---------+----------+
| CTS      | 8       | verbunden mit   | 4       | RTS      |
+----------+---------+-----------------+---------+----------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wird ein Pin eines Kabels mit zwei Pins des anderen Kabels verbunden,
werden dazu in der Regel zuerst die beiden Pins mit einem kurzem Draht
verbunden. Danach wird dieser Draht mit dem Pin des anderen Endes
verbunden.

.. raw:: html

   </div>

Die eben besprochenen Schemata scheinen die beliebtesten zu sein. Es
gibt aber noch weitere Varianten. Im Buch *RS-232 Made Easy* wird
beispielsweise SG mit SG verbunden, TD mit RD, RTS und CTS mit DCD, DTR
mit DSR, und umgekehrt.

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

28.2.2.1.2. Standard RS-232C Kabel
''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Standard-RS-232C-Kabel verbindet alle Signale direkt, das hei?t das
Signal „Transmitted Data“ wird mit dem Signal „Transmitted Data“ der
Gegenstelle verbunden. Dieses Kabel wird ben?tigt, um ein Modem mit
einem FreeBSD-System zu verbinden. Manche Terminals ben?tigen dieses
Kabel ebenfalls.

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

28.2.2.2. Schnittstellen
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?ber serielle Schnittstellen werden Daten zwischen dem FreeBSD-System
und dem Terminal ?bertragen. Dieser Abschnitt beschreibt die
verschiedenen Schnittstellen und wie sie unter FreeBSD angesprochen
werden.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.2.2.2.1. Arten von Schnittstellen
''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da es verschiedene Schnittstellen gibt, sollten Sie vor dem Kauf oder
Selbstbau eines Kabels sicherstellen, dass dieses zu den Schnittstellen
Ihres Terminals und FreeBSD-Systems passt.

Die meisten Terminals besitzen DB-25-Stecker. Personal Computer haben
DB-25- oder DB-9-Stecker. Wenn Sie eine serielle Multiportkarte f?r
Ihren PC besitzen, haben Sie vielleicht RJ-12- oder RJ-45-Anschl?sse.

Die Dokumentation Ihrer Ger?te sollte Aufschluss ?ber den Typ der
ben?tigten Anschl?sse geben. Oft hilft es, wenn Sie sich den Anschluss
einfach ansehen.

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

28.2.2.2.2. Schnittstellenbezeichnung
'''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unter FreeBSD sprechen Sie die serielle Schnittstelle (Port) ?ber einen
Eintrag im ``/dev`` Verzeichnis an. Es gibt dort zwei verschiedene
Eintr?ge:

.. raw:: html

   <div class="itemizedlist">

-  Schnittstellen f?r eingehende Verbindungen werden ``/dev/ttyuN``
   genannt. Dabei ist *``N``* die Nummer der Schnittstelle, deren
   Z?hlung bei Null beginnt. Allgemein wird diese Schnittstelle f?r
   Terminals benutzt. Diese Schnittstelle funktioniert nur, wenn ein
   „Data Carrier Detect“ Signal (DCD) vorliegt.

-  F?r ausgehende Verbindungen wird ``/dev/cuadN`` verwendet. Dieser
   Port wird normalerweise nur von Modems genutzt. Sie k?nnen ihn
   allerdings f?r Terminals benutzen, die das „Data Carrier Detect“
   Signal nicht unterst?tzen.

.. raw:: html

   </div>

Wenn Sie einen Terminal an die erste serielle Schnittstelle (``COM1`` in
MS-DOS?), angeschlossen haben, sprechen Sie ihn ?ber ``/dev/ttyu0`` an.
Wenn er an der zweiten seriellen Schnittstelle angeschlossen ist,
verwenden Sie ``/dev/ttyu1``, usw.

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

28.2.3. Kernelkonfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Voreinstellung benutzt FreeBSD vier serielle Schnittstellen, die
in MS-DOS?-Kreisen als ``COM1``, ``COM2``, ``COM3`` und ``COM4`` bekannt
sind. Momentan unterst?tzt FreeBSD einfache Multiportkarten (z.B. die
BocaBoard 1008 und 2016) und bessere wie die von Digiboard und Stallion
Technologies. In der Voreinstellung sucht der Kernel allerdings nur nach
den Standardanschl?ssen.

Um zu ?berpr?fen, ob der Kernel eine Ihrer seriellen Schnittstellen
erkennt, achten Sie auf die Meldungen beim Booten, oder schauen sich
diese sp?ter mit ``/sbin/dmesg`` an. Achten Sie insbesondere auf
Meldungen die mit ``uart`` beginnen, wenn Sie FreeBSD?8.0 oder h?her
verwenden, beziehungsweise ``sio`` wenn Sie FreeBSD?7.2 oder ?lter
verwenden.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Die folgenden Kommandos zeigen Ihnen nur die Meldungen an, welche die
Folge ``uart``, beziehungsweise die Folge ``sio`` enthalten. Verwenden
Sie je nach installierter FreeBSD-Version das entsprechende Kommando:

.. code:: screen

    # /sbin/dmesg | grep 'uart'
    # /sbin/dmesg | grep 'sio'

.. raw:: html

   </div>

Auf einem FreeBSD?7.\ *``X``* System mit vier seriellen Schnittstellen
sollte der Kernel die folgenden Meldungen ausgeben:

.. code:: screen

    sio0 at 0x3f8-0x3ff irq 4 on isa
    sio0: type 16550A
    sio1 at 0x2f8-0x2ff irq 3 on isa
    sio1: type 16550A
    sio2 at 0x3e8-0x3ef irq 5 on isa
    sio2: type 16550A
    sio3 at 0x2e8-0x2ef irq 9 on isa
    sio3: type 16550A

Wenn Ihr Kernel nicht alle seriellen Schnittstellen erkennt, m?ssen Sie
Ihren Kernel ?ber die Datei ``/boot/device.hints`` konfigurieren.
Zus?tzlich k?nnen Sie Eintr?ge f?r Ger?te, die auf Ihrem System nicht
vorhanden sind, aus dem Kernel entfernen.

Die Hilfeseite
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__
enth?lt weitere Informationen zu seriellen Schnittstellen und
Multiportkarten. Seien Sie vorsichtig, wenn Sie Konfigurationsdateien
von ?lteren FreeBSD-Versionen verwenden, da sich die Syntax und die
Bedeutung der Optionen zwischen verschiedenen Versionen ge?ndert hat.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

``port IO_COM1`` ist ein Ersatz f?r ``port 0x3f8``, ``IO_COM2`` bedeutet
``port 0x2f8``, ``IO_COM3`` bedeutet ``port 0x3e8`` und ``IO_COM4``
steht f?r ``port 0x2e8``. Die angegebenen IO-Adressen sind genau wie die
Interrupts 4, 3, 5 und 9 ?blich f?r serielle Schnittstellen. Beachten
Sie bitte, dass sich normale serielle Schnittstellen auf ISA-Bussen
*keine* Interrupts teilen k?nnen. Multiportkarten besitzen zus?tzliche
Schaltkreise, die es allen 16550As auf der Karte erlauben, sich einen
oder zwei Interrupts zu teilen.

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

28.2.4. Ger?tedateien
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die meisten Ger?te im Kernel werden durch Ger?tedateien in ``/dev``
angesprochen. Die ``sio`` Ger?te werden durch ``/dev/ttyuN`` f?r
eingehende Verbindungen und durch ``/dev/cuadN`` f?r ausgehende
Verbindungen angesprochen. Zum Initialisieren der Ger?te stellt FreeBSD
die Dateien ``/dev/ttyuN.init`` und ``/dev/cuadN.init`` zur Verf?gung.
Zus?tzlich existieren Dateien f?r das Sperren von Ger?tedateien
(*Locking*). Dabei handelt es sich um die Dateien ``/dev/ttyuN.lock``
und ``/dev/cuadN.lock``. Diese Dateien werden benutzt, um
Kommunikationsparameter beim ?ffnen eines Ports vorzugeben. F?r Modems,
die zur Flusskontrolle ``RTS/CTS`` benutzen, kann damit ``crtscts``
gesetzt werden. Die Ger?te ``/dev/ttyldN`` und ``/dev/cualaN`` (locking
devices) werden genutzt, um bestimmte Parameter festzuschreiben und vor
Ver?nderungen zu sch?tzen. Weitere Informationen zu Terminals finden Sie
in
`termios(4) <http://www.FreeBSD.org/cgi/man.cgi?query=termios&sektion=4>`__,
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__
erkl?rt die Dateien zum Initialisieren und Sperren der Ger?te,
`stty(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stty&sektion=1>`__
beschreibt schlie?lich Terminal-Einstellungen.

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

28.2.5. Konfiguration der seriellen Schnittstelle
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Anwendungen benutzen normalerweise die Ger?te ``ttyuN`` oder ``cuadN``.
Das Ger?t besitzt einige Voreinstellungen f?r Terminal-I/O, wenn es von
einem Prozess ge?ffnet wird. Mit dem folgenden Kommando k?nnen Sie sich
diese Einstellungen ansehen:

.. code:: screen

    # stty -a -f /dev/ttyu1

Sie k?nnen diese Einstellungen ver?ndern, sie bleiben allerdings nur
solange wirksam, bis das Ger?t geschlossen wird. Wenn das Ger?t danach
wieder ge?ffnet wird, sind die Voreinstellungen wieder wirksam. Um die
Voreinstellungen zu ?ndern, ?ffnen Sie das Ger?t, das zum Initialisieren
dient und ver?ndern dessen Einstellungen. Um beispielsweise f?r
``ttyu5`` den ``CLOCAL`` Modus, 8-Bit Kommunikation und ``XON/XOFF``
Flusssteuerung einzuschalten, setzen Sie das folgende Kommando ab:

.. code:: screen

    # stty -f /dev/ttyu5.init clocal cs8 ixon ixoff

In ``/etc/rc.d/rc.serial`` werden die systemweiten Voreinstellungen f?r
serielle Ger?te vorgenommen.

Um zu verhindern, dass Einstellungen von Anwendungen ver?ndert werden,
k?nnen Sie die Ger?te zum Festschreiben von Einstellungen („locking
devices“) benutzen. Wenn sie beispielsweise die Geschwindigkeit von
``ttyu5`` auf 57600?bps festlegen wollen, benutzen Sie das folgende
Kommando:

.. code:: screen

    # stty -f /dev/ttyld5 57600

Eine Anwendung, die ``ttyu5`` ?ffnet, kann nun nicht mehr die
Geschwindigkeit ?ndern und muss 57600?bps benutzen.

Die Ger?te zum Initialisieren und Festschreiben von Einstellungen
sollten selbstverst?ndlich nur von ``root`` beschreibbar sein.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+------------------------------------+-----------------------------+
| `Zur?ck <serialcomms.html>`__?           | `Nach oben <serialcomms.html>`__   | ?\ `Weiter <term.html>`__   |
+------------------------------------------+------------------------------------+-----------------------------+
| Kapitel 28. Serielle Daten?bertragung?   | `Zum Anfang <index.html>`__        | ?28.3. Terminals            |
+------------------------------------------+------------------------------------+-----------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
