===============
28.3. Terminals
===============

.. raw:: html

   <div class="navheader">

28.3. Terminals
`Zur?ck <serial.html>`__?
Kapitel 28. Serielle Daten?bertragung
?\ `Weiter <dialup.html>`__

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

28.3. Terminals
---------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Sean Kelly.

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

Wenn Sie sich nicht an der Konsole oder ?ber ein Netzwerk an Ihrem
FreeBSD-System anmelden k?nnen, sind Terminals ein bequemer und billiger
Weg auf Ihr System zuzugreifen. Dieser Abschnitt beschreibt wie Sie
Terminals mit FreeBSD benutzen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.3.1. Terminaltypen
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das urspr?ngliche UNIX? System besa? keine Konsolen. Zum Anmelden und
Starten von Programmen wurden stattdessen Terminals benutzt, die an den
seriellen Schnittstellen des Rechners angeschlossen waren. Dies
entspricht der Benutzung eines Modems zum Anmelden auf einem entfernten
System, um dort mit einem Terminalemulator im Textmodus zu arbeiten.

Die Konsolen heutiger PCs besitzen sehr gute Grafikf?higkeiten, trotzdem
gibt es in fast jedem UNIX? System die M?glichkeit, sich ?ber die
serielle Schnittstelle anzumelden; FreeBSD ist da keine Ausnahme. Sie
k?nnen sich an einem Terminal anmelden und dort jedes Textprogramm, das
Sie normalerweise an der Konsole oder in einem ``xterm`` Fenster im X
Window System benutzen, laufen lassen.

Im kommerziellen Umfeld k?nnen Sie viele Terminals an ein FreeBSD-System
anschlie?en und diese auf den Arbeitspl?tzen Ihrer Angestellten
aufstellen. Im privaten Umfeld kann ein ?lterer IBM PC oder Macintosh?
als Terminal dienen. Damit verwandeln Sie einen Einzelarbeitsplatz in
ein leistungsf?higes Mehrbenutzersystem.

FreeBSD kennt drei verschiedene Terminals:

.. raw:: html

   <div class="itemizedlist">

-  `Dumb terminals, <term.html#term-dumb>`__

-  `PCs, die als Terminals fungieren, <term.html#term-pcs>`__

-  `X Terminals. <term.html#term-x>`__

.. raw:: html

   </div>

Die folgenden Abschnitte beschreiben jeden dieser Terminals.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.3.1.1. Dumb-Terminals
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dumb-Terminals (unintelligente Datenstationen) sind Ger?te, die ?ber die
serielle Schnittstelle mit einem Rechner verbunden werden. Sie werden
„unintelligent“ genannt, weil sie nur Text senden und empfangen und
keine Programme laufen lassen k?nnen. Alle Programme, wie Texteditoren,
Compiler oder Spiele befinden sich auf dem Rechner, der mit dem Terminal
verbunden ist.

Es gibt viele Dumb-Terminals, die von verschiedenen Herstellern
produziert werden, wie zum Beispiel der VT-100 von Digital Equipment
Corporation oder der WY-75 von Wyse. So gut wie jeder der verschiedenen
Terminals sollte mit FreeBSD zusammenarbeiten. Manche High-End Ger?te
verf?gen sogar ?ber Grafikf?higkeiten, die allerdings nur von spezieller
Software genutzt werden kann.

Dumb-Terminals sind in Umgebungen beliebt, in denen keine
Grafikanwendungen, wie zum Beispiel X-Programme, laufen m?ssen.

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

28.3.1.2. PCs, die als Terminal fungieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jeder PC kann die Funktion eines
`Dumb-Terminals <term.html#term-dumb>`__, der ja nur Text senden und
empfangen kann, ?bernehmen. Dazu brauchen Sie nur das richtige Kabel und
eine *Terminalemulation*, die auf dem PC l?uft.

Diese Konfiguration ist im privaten Umfeld sehr beliebt. Wenn Ihr
Ehepartner zum Beispiel gerade an der FreeBSD-Konsole arbeitet, k?nnen
Sie einen weniger leistungsstarken PC, der als Terminal mit dem
FreeBSD-System verbunden ist, benutzen, um dort gleichzeitig im
Textmodus zu arbeiten.

Bereits im Basissystem sind mindestens zwei Werkzeuge vorhanden, die Sie
zur Arbeit ?ber eine serielle Konsole einsetzen k?nnen:
`cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1>`__ sowie
`tip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tip&sektion=1>`__.

Um sich von einem FreeBSD-System aus ?ber eine serielle Verbindung mit
einem anderen System zu verbinden, geben Sie folgenden Befehl ein:

.. code:: screen

    # cu -l serial-port-device

„serial-port-device“ ist hier der Name der Ger?tedatei, die einer
bestimmten seriellen Schnittstelle Ihres Systems zugewiesen ist. Diese
Ger?tedateien werden ``/dev/cuadN`` genannt.

Der Buchstabe „N“ muss dabei durch die Nummer des seriellen Ports Ihres
Systems ersetzt werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Beachten Sie, dass die Numerierung dieses Daten (im Gegensatz etwa zu
MS-DOS?-kompatiblen Systemen) unter FreeBSD mit Null und nicht mit Eins
beginnt. Die Schnittstelle „COM1“ entspricht daher in der Regel
``/dev/cuad0`` unter FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

In der Ports-Sammlung finden sich weitere Programme (beispielsweise
`comms/minicom <http://www.freebsd.org/cgi/url.cgi?ports/comms/minicom/pkg-descr>`__),
mit denen Sie eine Verbindung ?ber eine serielle Schnittstelle
herstellen k?nnen.

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

28.3.1.3. X-Terminals
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

X-Terminals sind die ausgereiftesten der verf?gbaren Terminals. Sie
werden nicht mit der seriellen Schnittstelle sondern mit einem Netzwerk,
wie dem Ethernet, verbunden. Diese Terminals sind auch nicht auf den
Textmodus beschr?nkt, sondern k?nnen jede X-Anwendung darstellen.

X-Terminals sind hier nur der Vollst?ndigkeit halber aufgez?hlt. Die
Einrichtung von X-Terminals wird in diesem Abschnitt *nicht*
beschrieben.

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

28.3.2. Konfiguration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Folgenden wird beschrieben, wie Sie Ihr FreeBSD-System konfigurieren
m?ssen, um sich an einem Terminal anzumelden. Dabei wird vorausgesetzt,
dass der Kernel bereits die serielle Schnittstelle, die mit dem Terminal
verbunden ist, unterst?tzt. Weiterhin sollte der Terminal schon
angeschlossen sein.

Aus `Kapitel?13, *FreeBSDs Bootvorgang* <boot.html>`__ wissen Sie, dass
``init`` f?r das Initialisieren des Systems und den Start von Prozessen
zum Zeitpunkt des Systemstarts verantwortlich ist. Unter anderem liest
``init`` ``/etc/ttys`` ein und startet f?r jeden verf?gbaren Terminal
einen ``getty`` Prozess. ``getty`` wiederum fragt beim Anmelden den
Benutzernamen ab und startet ``login``.

Um Terminals auf Ihrem FreeBSD-System einzurichten, f?hren Sie folgenden
Schritte als ``root`` durch:

.. raw:: html

   <div class="procedure">

#. Wenn er noch nicht da ist, f?gen Sie einen Eintrag in ``/etc/ttys``
   f?r die serielle Schnittstelle aus ``/dev`` ein.

#. Geben Sie ``/usr/libexec/getty`` als auszuf?hrendes Programm an. Als
   Parameter f?r ``getty`` geben Sie den passenden Verbindungstyp aus
   ``/etc/gettytab`` an.

#. Geben Sie den Terminaltyp an.

#. Aktivieren Sie den Anschluss.

#. Geben Sie die Sicherheit des Anschlusses an.

#. Veranlassen Sie ``init`` ``/etc/ttys`` erneut zu lesen.

.. raw:: html

   </div>

Optional k?nnen Sie in ``/etc/gettytab`` auch einen auf Ihre Zwecke
angepassten Terminaltyp erstellen. Die genaue Vorgehensweise wird in
diesem Abschnitt nicht erkl?rt, aber die Manualpages von
`gettytab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=gettytab&sektion=5>`__
und
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
enthalten dazu weitere Informationen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.3.2.1. Hinzuf?gen eines Eintrags in ``/etc/ttys``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In ``/etc/ttys`` werden alle Terminals aufgef?hrt, an denen Sie sich auf
dem FreeBSD-System anmelden k?nnen. Hier findet sich zum Beispiel ein
Eintrag f?r die erste virtuelle Konsole ``/dev/ttyv0``, der es Ihnen
erm?glicht, sich dort anzumelden. Die Datei enth?lt des Weiteren
Eintr?ge f?r andere virtuelle Konsolen, serielle Schnittstellen und
Pseudoterminals. Wenn Sie einen Terminal konfigurieren wollen, f?gen sie
einen Eintrag f?r den Namen des Ger?tes aus ``/dev`` ohne das Pr?fix
``/dev`` hinzu. Zum Beispiel wird ``/dev/ttyv0`` als ``ttyv0``
aufgef?hrt.

In der Voreinstellung enth?lt ``/etc/ttys`` Eintr?ge f?r die ersten vier
seriellen Schnittstellen: ``ttyu0`` bis ``ttyu3``. Wenn Sie an eine von
diesen einen Terminal anschlie?en, brauchen Sie keinen weiteren Eintrag
hinzuzuf?gen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 28.1. Eintr?ge in ``/etc/ttys`` hinzuf?gen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Angenommen, wir wollen an ein System zwei Terminals anschlie?en: Einen
Wyse-50 und einen alten 286 IBM PC, der mit Procomm einen VT-100
Terminal emuliert. Den Wyse-Terminal verbinden wir mit der zweiten
seriellen Schnittstelle und den 286 mit der sechsten seriellen
Schnittstelle (einem Anschluss auf einer Multiportkarte). Die
entsprechenden Eintr?ge in ``/etc/ttys`` w?rden dann wie folgt aussehen:

.. code:: programlisting

    ttyu1  "/usr/libexec/getty std.38400"  wy50  on  insecure
    ttyu5   "/usr/libexec/getty std.19200"  vt100  on  insecure
          

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ttys-line1col1>`__         | Das erste Feld gibt normalerweise    |
|                                      | den Namen der Ger?tedatei aus        |
|                                      | ``/dev`` an.                         |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ttys-line1col2>`__         | Im zweiten Feld wird das             |
|                                      | auszuf?hrende Kommando, normal ist   |
|                                      | das                                  |
|                                      | `getty(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=getty&sektion=8>`__, |
|                                      | angegeben. ``getty`` initialisiert   |
|                                      | und ?ffnet die Verbindung, setzt die |
|                                      | Geschwindigkeit und fragt den        |
|                                      | Benutzernamen ab. Danach f?hrt es    |
|                                      | `login(1) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=login&sektion=1>`__  |
|                                      | aus.                                 |
|                                      |                                      |
|                                      | ``getty`` akzeptiert einen           |
|                                      | optionalen Parameter auf der         |
|                                      | Kommandozeile, den Verbindungstyp,   |
|                                      | der die Eigenschaften der            |
|                                      | Verbindung, wie die Geschwindigkeit  |
|                                      | und Parit?t, festlegt. Die Typen und |
|                                      | die damit verbundenen Eigenschaften  |
|                                      | liest ``getty`` aus                  |
|                                      | ``/etc/gettytab``.                   |
|                                      |                                      |
|                                      | ``/etc/gettytab`` enth?lt viele      |
|                                      | Eintr?ge sowohl f?r neue wie auch    |
|                                      | alte Terminalverbindungen. Die       |
|                                      | meisten Eintr?ge, die mit ``std``    |
|                                      | beginnen, sollten mit einem          |
|                                      | festverdrahteten Terminal            |
|                                      | funktionieren. F?r jede              |
|                                      | Geschwindigkeit zwischen 110?bps und |
|                                      | 115200?bps gibt es einen ``std``     |
|                                      | Eintrag. Nat?rlich k?nnen Sie auch   |
|                                      | eigene Eintr?ge erstellen,           |
|                                      | Informationen dazu finden Sie in     |
|                                      | `gettytab(5) <http://www.FreeBSD.org |
|                                      | /cgi/man.cgi?query=gettytab&sektion= |
|                                      | 5>`__.                               |
|                                      |                                      |
|                                      | Wenn Sie den Verbindungstyp in       |
|                                      | ``/etc/ttys`` eintragen, stellen Sie |
|                                      | bitte sicher, dass die               |
|                                      | Kommunikationseinstellungen auch mit |
|                                      | denen des Terminals ?bereinstimmen.  |
|                                      |                                      |
|                                      | In unserem Beispiel verwendet der    |
|                                      | Wyse-50 keine Parit?t und 38400?bps, |
|                                      | der 286 PC benutzt ebenfalls keine   |
|                                      | Parit?t und arbeitet mit 19200?bps.  |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ttys-line1col3>`__         | Das dritte Feld gibt den Terminaltyp |
|                                      | an, der normalerweise mit diesem     |
|                                      | Anschluss verbunden ist. F?r         |
|                                      | Einw?hlverbindungen wird oft         |
|                                      | ``unknown`` oder ``dialup`` benutzt, |
|                                      | da sich die Benutzer praktisch mit   |
|                                      | beliebigen Terminals oder Emulatoren |
|                                      | anmelden k?nnen. Bei                 |
|                                      | festverdrahteten Terminals ?ndert    |
|                                      | sich der Typ nicht, so dass Sie in   |
|                                      | diesem Feld einen richtigen Typ aus  |
|                                      | der                                  |
|                                      | `termcap(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=termcap&sektion=5> |
|                                      | `__                                  |
|                                      | Datenbank angeben k?nnen.            |
|                                      |                                      |
|                                      | In unserem Beispiel benutzen wir f?r |
|                                      | den Wyse-50 den entsprechenden Typ   |
|                                      | aus                                  |
|                                      | `termcap(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=termcap&sektion=5> |
|                                      | `__,                                 |
|                                      | der 286 PC wird als VT-100, den er   |
|                                      | ja emuliert, angegeben.              |
+--------------------------------------+--------------------------------------+
| `|4| <#co-ttys-line1col4>`__         | Das vierte Feld gibt an, ob der      |
|                                      | Anschluss aktiviert werden soll.     |
|                                      | Wenn Sie hier ``on`` angeben,        |
|                                      | startet ``init`` das Programm, das   |
|                                      | im zweiten Feld angegeben wurde      |
|                                      | (normal ``getty``). Wenn Sie ``off`` |
|                                      | angeben, wird das Kommando aus dem   |
|                                      | zweiten Feld nicht ausgef?hrt und    |
|                                      | folglich k?nnen Sie sich dann an dem |
|                                      | betreffenden Terminal nicht          |
|                                      | anmelden.                            |
+--------------------------------------+--------------------------------------+
| `|5| <#co-ttys-line1col5>`__         | Im letzten Feld geben Sie die        |
|                                      | Sicherheit des Anschlusses an. Wenn  |
|                                      | Sie hier ``secure`` angeben, darf    |
|                                      | sich ``root`` (oder jeder Account    |
|                                      | mit der UID ``0``) ?ber diese        |
|                                      | Verbindung anmelden. Wenn Sie        |
|                                      | ``insecure`` angeben, d?rfen sich    |
|                                      | nur unprivilegierte Benutzer         |
|                                      | anmelden. Diese k?nnen sp?ter mit    |
|                                      | `su(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=su&sektion=1>`__        |
|                                      | oder einem ?hnlichen Mechanismus zu  |
|                                      | ``root`` wechseln.                   |
|                                      |                                      |
|                                      | Es wird dringend empfohlen,          |
|                                      | ``insecure`` nur f?r Terminals       |
|                                      | hinter verschlossenen T?ren zu       |
|                                      | verwenden, da Sie mit ``su`` leicht  |
|                                      | zum Superuser werden k?nnen.         |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

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

28.3.2.2. ``init`` zwingen, ``/etc/ttys`` erneut zu lesen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie die n?tigen ?nderungen in ``/etc/ttys`` vorgenommen haben,
schicken Sie ``init`` ein SIGHUP-Signal (hangup), um es zu veranlassen,
seine Konfigurationsdatei neu zu lesen:

.. code:: screen

    # kill -HUP 1

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Da ``init`` immer der erste Prozess auf einem System ist, besitzt es
immer die PID ``1``.

.. raw:: html

   </div>

Wenn alles richtig eingerichtet ist, alle Kabel angeschlossen und die
Terminals eingeschaltet sind, sollte f?r jeden Terminal ein ``getty``
Prozess laufen und auf jedem Terminal sollten Sie eine
Anmeldeaufforderung sehen.

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

28.3.3. Fehlersuche
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Selbst wenn Sie den Anweisungen akribisch gefolgt sind, kann es immer
noch zu Fehlern beim Einrichten eines Terminals kommen. Die folgende
Aufz?hlung von Symptomen beschreibt m?gliche L?sungen:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.3.3.1. Es erscheint kein Anmeldeprompt
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie sicher, dass der Terminal verbunden und eingeschaltet ist.
Wenn ein PC als Terminal fungiert, ?berpr?fen Sie, dass die
Terminalemulation auf den richtigen Schnittstellen l?uft.

Stellen Sie sicher, dass Sie das richtige Kabel verwenden und dass das
Kabel fest mit dem Terminal und dem FreeBSD-Rechner verbunden ist.

Stellen Sie sicher, dass die Einstellungen f?r die Geschwindigkeit (bps)
und Parit?t auf dem FreeBSD System und dem Terminal gleich sind. Wenn
Ihr Terminal einen Bildschirm besitzt, ?berpr?fen Sie die richtige
Einstellung von Helligkeit und Kontrast. Wenn Ihr Terminal druckt,
stellen Sie die ausreichende Versorgung mit Papier und Tinte sicher.

?berpr?fen Sie mit ``ps``, dass der ``getty`` Prozess f?r den Terminal
l?uft:

.. code:: screen

    # ps -axww|grep getty

F?r jeden Terminal sollten Sie einen Eintrag sehen. Aus dem folgenden
Beispiel erkennen Sie, dass ``getty`` auf der zweiten seriellen
Schnittstelle ``tyyd1`` l?uft und den Verbindungstyp ``std.38400`` aus
``/etc/gettytab`` benutzt:

.. code:: screen

    22189  d1  Is+    0:00.03 /usr/libexec/getty std.38400 ttyu1

Wenn ``getty`` nicht l?uft, ?berpr?fen Sie, ob der Anschluss in
``/etc/ttys`` aktiviert ist. Haben Sie ``kill -HUP 1`` abgesetzt,
nachdem Sie ``/etc/ttys`` ge?ndert hatten?

Wenn ``getty`` l?uft, aber der Terminal immer noch kein Anmeldeprompt
ausgibt, oder Sie am Anmeldeprompt nichts eingeben k?nnen, kann es sein,
dass Ihr Terminal oder Kabel keinen Hardware-Handshake unterst?tzt.
?ndern Sie dann den Eintrag ``std.38400`` in ``/etc/ttys`` zu
``3wire.38400``. Nachdem Sie ``/etc/ttys`` ge?ndert haben, setzen Sie
das Kommando ``kill -HUP 1`` ab. Der Eintrag ``3wire`` besitzt ?hnliche
Eigenschaften wie der Eintrag ``std``, ignoriert aber den
Hardware-Handshake. Wenn Sie den Eintrag ``3wire`` verwenden, m?ssen Sie
vielleicht die Geschwindigkeit verkleinern oder die
Software-Flusssteuerung aktivieren, um Puffer?berl?ufe zu vermeiden.

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

28.3.3.2. Es erscheinen nur unverst?ndliche Zeichen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie sicher, dass die Einstellungen f?r die Geschwindigkeit (bps)
und Parit?t auf dem FreeBSD System und dem Terminal gleich sind.
Kontrollieren Sie den ``getty`` Prozess und stellen Sie sicher, dass der
richtige Verbindungstyp aus ``/etc/gettytab`` benutzt wird. Wenn das
nicht der Fall ist, editieren Sie ``/etc/ttys`` und setzen das Kommando
``kill-HUP 1`` ab.

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

28.3.3.3. Zeichen erscheinen doppelt und eingegebene Passw?rter erscheinen im Klartext
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie den Terminal oder die Terminalemulation von „half duplex“
oder „local echo“ auf „full duplex.“ um.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+------------------------------------+-------------------------------+
| `Zur?ck <serial.html>`__?   | `Nach oben <serialcomms.html>`__   | ?\ `Weiter <dialup.html>`__   |
+-----------------------------+------------------------------------+-------------------------------+
| 28.2. Einf?hrung?           | `Zum Anfang <index.html>`__        | ?28.4. Einw?hlverbindungen    |
+-----------------------------+------------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
