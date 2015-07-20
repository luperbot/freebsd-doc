=========================
28.4. Einw?hlverbindungen
=========================

.. raw:: html

   <div class="navheader">

28.4. Einw?hlverbindungen
`Zur?ck <term.html>`__?
Kapitel 28. Serielle Daten?bertragung
?\ `Weiter <dialout.html>`__

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

28.4. Einw?hlverbindungen
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Guy Helmer.

.. raw:: html

   </div>

.. raw:: html

   <div>

Mit Anmerkungen von Sean Kelly.

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

Das Einrichten von Einw?hlverbindungen ?hnelt dem Anschlie?en von
Terminals, nur dass Sie anstelle eines Terminals ein Modem verwenden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.4.1. Externe und interne Modems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Externe Modems sind f?r Einw?hlverbindungen besser geeignet, da sie die
Konfiguration in nicht fl?chtigem RAM speichern k?nnen. Zudem verf?gen
Sie ?ber Leuchtanzeigen, die den Status wichtiger RS-232 Signale
anzeigen und unter Umst?nden Besucher beeindrucken k?nnen.

Interne Modems verf?gen normalerweise nicht ?ber nicht fl?chtiges RAM
und lassen sich meist nur ?ber DIP-Schalter konfigurieren. Selbst wenn
ein internes Modem Leuchtanzeigen besitzt, sind diese meist schwer
einzusehen, wenn das Modem eingebaut ist.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.4.1.1. Modems und Kabel
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit einem externen Modem m?ssen Sie das richtige Kabel benutzen: Ein
Standard RS-232C Kabel, bei dem die folgenden Signale miteinander
verbunden sind, sollte ausreichen:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 28.4. Signalnamen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------+---------------------------------------------------------------------------+
| Abk?rzung   | Bedeutung                                                                 |
+=============+===========================================================================+
| RD          | Received Data                                                             |
+-------------+---------------------------------------------------------------------------+
| TD          | Transmitted Data                                                          |
+-------------+---------------------------------------------------------------------------+
| DTR         | Data Terminal Ready                                                       |
+-------------+---------------------------------------------------------------------------+
| DSR         | Data Set Ready                                                            |
+-------------+---------------------------------------------------------------------------+
| DCD         | Data Carrier Detect (dadurch erkennt RS-232 das Signal *Received Line*)   |
+-------------+---------------------------------------------------------------------------+
| SG          | Signal Ground                                                             |
+-------------+---------------------------------------------------------------------------+
| RTS         | Request to Send                                                           |
+-------------+---------------------------------------------------------------------------+
| CTS         | Clear to Send                                                             |
+-------------+---------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Ab Geschwindigkeiten von 2400?bps ben?tigt FreeBSD die Signale RTS und
CTS f?r die Flusssteuerung. Das Signal CD zeigt an, ob ein Tr?ger
vorliegt, das hei?t ob die Verbindung aufgebaut ist oder beendet wurde.
DTR zeigt an, dass das Ger?t betriebsbereit ist. Es gibt einige Kabel,
bei denen nicht alle n?tigen Signale verbunden sind. Wenn Sie Probleme
der Art haben, dass zum Beispiel die Sitzung nicht beendet wird, obwohl
die Verbindung beendet wurde, kann das an einem solchen Kabel liegen.

Wie andere UNIX? Betriebssysteme auch, benutzt FreeBSD Hardwaresignale,
um festzustellen, ob ein Anruf beantwortet wurde, eine Verbindung
beendet wurde, oder um die Verbindung zu schlie?en und das Modem
zur?ckzusetzen. FreeBSD vermeidet es, dem Modem Kommandos zu senden,
oder den Statusreport des Modems abzufragen. Falls Sie ein Benutzer von
PC-basierenden Bulletin Board Systemen sind, mag Sie das verwundern.

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

28.4.2. Schnittstellenbausteine
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD unterst?tzt EIA RS-232C (CCITT V.24) serielle Schnittstellen,
die auf den NS8250, NS16450, NS16550 oder NS16550A Bausteinen basieren.
Die Bausteine der Serie 16550 verf?gen ?ber einen 16?Byte gro?en Puffer,
der als FIFO angelegt ist. Wegen Fehler in der FIFO-Logik kann der
Puffer in einem 16550 Baustein allerdings nicht genutzt werden, das
hei?t der Baustein muss als 16450 betrieben werden. Bei allen Bausteinen
ohne Puffer und dem 16550 Baustein muss jedes Byte einzeln von dem
Betriebssystem verarbeitet werden, was Fehler bei hohen
Geschwindigkeiten oder gro?er Systemlast erzeugt. Es sollten daher nach
M?glichkeit serielle Schnittstellen, die auf 16550A Bausteinen basieren,
eingesetzt werden.

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

28.4.3. ?berblick
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie bei Terminals auch, startet ``init`` f?r jede serielle
Schnittstelle, die eine Einw?hlverbindung zur Verf?gung stellt, einen
``getty`` Prozess. Wenn das Modem beispielsweise an ``/dev/ttyu0``
angeschlossen ist, sollte in der Ausgabe von ``ps       ax`` eine Zeile
wie die folgende erscheinen:

.. code:: screen

     4850 ??  I      0:00.09 /usr/libexec/getty V19200 ttyu0

Wenn sich ein Benutzer einw?hlt und die Verbindung aufgebaut ist, zeigt
das Modem dies durch das CD Signal (Carrier Detect) an. Der Kernel
merkt, dass ein Signal anliegt und vollendet das ?ffnen der
Schnittstelle durch ``getty``. Dann sendet ``getty`` das Anmeldeprompt
mit der ersten f?r die Verbindung vereinbarten Geschwindigkeit und
wartet auf eine Antwort. Wenn die Antwort unverst?ndlich ist, weil zum
Beispiel die Geschwindigkeit des Modems von ``getty``\ s Geschwindigkeit
abweicht, versucht ``getty`` die Geschwindigkeit solange anzupassen, bis
es eine verst?ndliche Antwort erh?lt.

``getty`` f?hrt, nachdem der Benutzer seinen Namen eingegeben hat,
``/usr/bin/login`` aus, welches das Passwort abfragt und danach die
Shell des Benutzers startet.

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

28.4.4. Konfigurationsdateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Drei Konfigurationsdateien in ``/etc`` steuern, ob eine Einwahl in Ihr
FreeBSD-System m?glich ist. Die erste, ``/etc/gettytab``, konfiguriert
den ``/usr/libexec/getty`` D?mon. In ``/etc/ttys`` wird festgelegt, auf
welchen Schnittstellen ``/sbin/init`` einen ``getty`` Prozess startet.
Schlie?lich haben Sie in ``/etc/rc.d/serial`` die M?glichkeit,
Schnittstellen zu initialisieren.

Es gibt zwei Ansichten dar?ber, wie Modems f?r Einw?hlverbindungen unter
UNIX? zu konfigurieren sind. Zum einen kann die Geschwindigkeit zwischen
dem Modem und dem Computer fest eingestellt werden. Sie ist damit
unabh?ngig von der Geschwindigkeit, mit der sich der entfernte Benutzer
einw?hlt. Dies hat den Vorteil, dass der entfernte Benutzer das
Anmeldeprompt sofort bekommt. Der Nachteil bei diesem Verfahren ist,
dass das System die tats?chliche Geschwindigkeit der Verbindung nicht
kennt. Damit k?nnen bildschirmorientierte Programme wie Emacs ihren
Bildschirmaufbau nicht an langsame Verbindungen anpassen, um die
Antwortzeiten zu verbessern.

Die andere M?glichkeit besteht darin, die Geschwindigkeit der RS-232
Schnittstelle des lokalen Modems an die Geschwindigkeit des entfernten
Modems anzupassen. Bei einer V.32bis (14400?bps) Verbindung kann das
lokale Modem die RS-232 Schnittstelle mit 19200?bps betreiben, w?hrend
bei einer Verbindung mit 2400?bps die RS-232 Schnittstelle mit 2400?bps
betrieben wird. Da ``getty`` die Verbindungsgeschwindigkeit des Modems
nicht kennt, startet es den Anmeldevorgang mit der Ausgabe von
``login:`` und wartet auf eine Antwort. Wenn der Benutzer der
Gegenstelle nun nur unverst?ndliche Zeichen erh?lt, muss er solange
**Enter** dr?cken, bis das Anmeldeprompt erscheint. Solange die
Geschwindigkeiten nicht ?bereinstimmen, sind die Antworten der
Gegenstelle f?r ``getty`` ebenfalls unverst?ndlich. In diesem Fall
wechselt ``getty`` zur n?chsten Geschwindigkeit und gibt wieder
``login:`` aus. In aller Regel erh?lt der Benutzer der Gegenstelle nach
ein bis zwei Tastendr?cken eine erkennbare Anmeldeaufforderung. Diese
Anmeldeprozedur sieht nicht so sauber wie die Methode mit einer festen
Geschwindigkeit aus, bietet dem Benutzer einer langsamen Verbindung
allerdings den Vorteil, dass sich bildschirmorientierte Programme an die
Geschwindigkeit anpassen k?nnen.

Im Folgenden wird die Konfiguration f?r beide Methoden besprochen, doch
die Methode der angepassten Geschwindigkeit wird bei der Diskussion
bevorzugt.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.4.4.1. ``/etc/gettytab``
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit ``/etc/gettytab`` wird
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
im Stil von
`termcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=termcap&sektion=5>`__
konfiguriert. Das Format dieser Datei und die Bedeutung der Eintr?ge
wird in
`gettytab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=gettytab&sektion=5>`__
beschrieben.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.4.4.1.1. Konfiguration f?r feste Geschwindigkeit
'''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die Modemgeschwindigkeit vorgeben, werden Sie in
``/etc/gettytab`` nichts ?ndern m?ssen.

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

28.4.4.1.2. Konfiguration f?r angepasste Geschwindigkeit
''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In ``/etc/gettytab`` m?ssen Eintr?ge f?r die Geschwindigkeiten, die Sie
benutzen wollen, sein. Wenn Sie ein 2400?bps Modem besitzen, k?nnen Sie
wahrscheinlich den schon vorhandenen ``D2400`` Eintrag benutzen.

.. code:: programlisting

    #
    # Fast dialup terminals, 2400/1200/300 rotary (can start either way)
    #
    D2400|d2400|Fast-Dial-2400:\
            :nx=D1200:tc=2400-baud:
    3|D1200|Fast-Dial-1200:\
            :nx=D300:tc=1200-baud:
    5|D300|Fast-Dial-300:\
            :nx=D2400:tc=300-baud:

Wenn Sie ein Modem mit einer h?heren Geschwindigkeit besitzen, m?ssen
Sie wahrscheinlich in ``/etc/gettytab`` weitere Eintr?ge erstellen. Hier
ist ein Beispiel, das Sie mit einem 14400?bps Modem benutzen k?nnen:

.. code:: programlisting

    #
    # Additions for a V.32bis Modem
    #
    um|V300|High Speed Modem at 300,8-bit:\
            :nx=V19200:tc=std.300:
    un|V1200|High Speed Modem at 1200,8-bit:\
            :nx=V300:tc=std.1200:
    uo|V2400|High Speed Modem at 2400,8-bit:\
            :nx=V1200:tc=std.2400:
    up|V9600|High Speed Modem at 9600,8-bit:\
            :nx=V2400:tc=std.9600:
    uq|V19200|High Speed Modem at 19200,8-bit:\
            :nx=V9600:tc=std.19200:

Die damit erzeugten Verbindungen verwenden 8?Bit und keine Parit?t.

Im obigen Beispiel startet die Geschwindigkeit bei 19200?bps (eine
V.32bis Verbindung) und geht dann ?ber 9600?bps (V.32), 400?bps,
1200?bps und 300?bps wieder zur?ck zu 19200?bps. Das Schl?sselwort
``nx=`` (*next table*) sorgt f?r das zyklische Durchlaufen der
Geschwindigkeiten. Jede Zeile zieht zudem noch mit ``tc=`` (*table
continuation*) die Vorgabewerte f?r die jeweilige Geschwindigkeit an.

Wenn Sie ein 28800?bps Modem besitzen und/oder Kompression mit einem
14400?bps Modem benutzen wollen, brauchen Sie h?here Geschwindigkeiten
als 19200?bps. Das folgende Beispiel startet mit 57600?bps:

.. code:: programlisting

    #
    # Additions for a V.32bis or V.34 Modem
    # Starting at 57600 bps
    #
    vm|VH300|Very High Speed Modem at 300,8-bit:\
            :nx=VH57600:tc=std.300:
    vn|VH1200|Very High Speed Modem at 1200,8-bit:\
            :nx=VH300:tc=std.1200:
    vo|VH2400|Very High Speed Modem at 2400,8-bit:\
            :nx=VH1200:tc=std.2400:
    vp|VH9600|Very High Speed Modem at 9600,8-bit:\
            :nx=VH2400:tc=std.9600:
    vq|VH57600|Very High Speed Modem at 57600,8-bit:\
            :nx=VH9600:tc=std.57600:

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie eine langsame CPU oder ein stark ausgelastetes System besitzen
und sich kein 16550A in Ihrem System befindet, erhalten Sie bei
57600?bps vielleicht sio Fehlermeldungen der Form „silo overflow“.

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

28.4.4.2. ``/etc/ttys``
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``/etc/ttys`` wurde bereits in `Beispiel?28.1, „Eintr?ge in
``/etc/ttys`` hinzuf?gen“ <term.html#ex-etc-ttys>`__ besprochen. Die
Konfiguration f?r Modems ist ?hnlich, allerdings braucht ``getty`` ein
anderes Argument und es muss ein anderer Terminaltyp angegeben werden.
Der Eintrag f?r beide Methoden (feste und angepasste Geschwindigkeit)
hat die folgende Form:

.. code:: programlisting

    ttyu0   "/usr/libexec/getty xxx"   dialup on

Das erste Feld der obigen Zeile gibt die Ger?tedatei f?r diesen Eintrag
an – ``ttyu0`` bedeutet, dass ``getty`` mit ``/dev/ttyu0`` arbeitet. Das
zweite Feld ``"/usr/libexec/getty xxx"`` gibt das Kommando an, das
``init`` f?r dieses Ger?t startet (*``xxx``* wird durch einen passenden
Eintrag aus ``/etc/gettytab`` ersetzt). Die Vorgabe f?r den Terminaltyp,
hier ``dialup``, wird im dritten Feld angegeben. Das vierte Feld,
``on``, zeigt ``init`` an, dass die Schnittstelle aktiviert ist. Im
f?nften Feld k?nnte noch ``secure`` angegeben werden, um Anmeldungen von
``root`` zu erlauben, doch sollte das wirklich nur f?r physikalisch
sichere Terminals, wie die Systemkonsole, aktiviert werden.

Die Vorgabe f?r den Terminaltyp, ``dialup`` im obigen Beispiel, h?ngt
von lokalen Gegebenheiten ab. Traditionell wird ``dialup`` f?r
Einw?hlverbindungen verwendet, so dass die Benutzer in ihren
Anmeldeskripten den Terminaltyp auf ihren Terminal abstimmen k?nnen,
wenn der Typ auf ``dialup`` gesetzt ist. Wenn Sie aber beispielsweise
nur VT102 Terminals oder Emulatoren einsetzen, k?nnen Sie den
Terminaltyp hier auch fest auf ``vt102`` setzen.

Nachdem Sie ``/etc/ttys`` ge?ndert haben, m?ssen Sie ``init`` ein HUP
Signal schicken, damit es die Datei wieder einliest. Sie k?nnen dazu das
folgende Kommando verwenden:

.. code:: screen

    # kill -HUP 1

Wenn Sie das System zum ersten Mal konfigurieren, sollten Sie dieses
Kommando erst ausf?hren, wenn Sie Ihr Modem richtig konfiguriert und
angeschlossen haben.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.4.4.2.1. Konfiguration f?r feste Geschwindigkeit
'''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Argument von ``getty`` muss in diesem Fall eine feste
Geschwindigkeit vorgeben. Der Eintrag f?r ein Modem, das fest auf
19200?bps eingestellt ist, k?nnte wie folgt aussehen:

.. code:: programlisting

    ttyu0   "/usr/libexec/getty std.19200"   dialup on

Wenn Ihr Modem auf eine andere Geschwindigkeit eingestellt ist, setzen
Sie anstelle von ``std.19200`` einen passenden Eintrag der Form
``std.speed`` ein. Stellen Sie sicher, dass dies auch ein g?ltiger
Verbindungstyp aus ``/etc/gettytab`` ist.

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

28.4.4.2.2. Konfiguration f?r angepasste Geschwindigkeit
''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Argument von ``getty`` muss hier auf einen der Eintr?ge aus
``/etc/gettytab`` zeigen, der zu einer Kette von Eintr?gen geh?rt, die
die zu probierenden Geschwindigkeiten beschreiben. Wenn Sie dem obigen
Beispiel gefolgt sind und zus?tzliche Eintr?ge in ``/etc/gettytab``
erzeugt haben, k?nnen Sie die folgende Zeile verwenden:

.. code:: programlisting

    ttyu0   "/usr/libexec/getty V19200"   dialup on

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

28.4.4.3. ``/etc/rc.d/serial``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modems, die h?here Geschwindigkeiten unterst?tzen, zum Beispiel V.32,
V.32bis und V.34 Modems, benutzen Hardware-Flusssteuerung (``RTS/CTS``).
F?r die entsprechenden Schnittstellen k?nnen Sie die Flusssteuerung mit
``stty`` in ``/etc/rc.d/serial`` einstellen.

Um beispielsweise die Hardware-Flusssteuerung f?r die Ger?te zur Ein-
und Auswahl der zweiten seriellen Schnittstelle (``COM2``) zu
aktivieren, benutzen Sie die Dateien zur Initialisierung der
entsprechenden Ger?te und f?gen die folgenden Zeilen in
``/etc/rc.d/serial`` hinzu:

.. code:: programlisting

    # Serial port initial configuration
    stty -f /dev/ttyu1.init crtscts
    stty -f /dev/cuad1.init crtscts

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

28.4.5. Modemkonfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie ein Modem besitzen, das seine Konfiguration in nicht fl?chtigem
RAM speichert, werden Sie ein Terminalprogramm wie Telix unter MS-DOS?
oder ``tip`` unter FreeBSD ben?tigen, um die Parameter einzustellen.
Verbinden Sie sich mit derselben Geschwindigkeit, die ``getty`` zuerst
benutzen w?rde, mit dem Modem und treffen Sie folgende Einstellungen:

.. raw:: html

   <div class="itemizedlist">

-  DCD ist eingeschaltet, wenn das Tr?gersignal des entfernten Modems
   erkannt wird.

-  Im Betrieb liegt DTR an. Bei einem Verlust von DTR legt das Modem auf
   und setzt sich zur?ck.

-  CTS Flusssteuerung ist f?r ausgehende Daten aktiviert.

-  XON/XOFF Flusssteuerung ist ausgeschaltet.

-  RTS Flusssteuerung ist f?r eingehende Daten aktiviert.

-  Keine R?ckmeldungen ausgeben.

-  Die Echo-Funktion ist deaktiviert.

.. raw:: html

   </div>

In der Dokumentation Ihres Modems finden Sie die n?tigen Befehle, die
Sie absetzen m?ssen, und/oder n?tigen DIP-Schalterstellungen, um die
obigen Einstellungen zu treffen.

F?r ein externes 14400 U.S. Robotics? Sportster? gelten zum Beispiel die
folgenden Befehle:

.. code:: programlisting

    ATZ
    AT&C1&D2&H1&I0&R2&W

Bei dieser Gelegenheit k?nnen Sie auch gleich andere Einstellungen, zum
Beispiel ob Sie V42.bis und/oder MNP5 Kompression benutzen wollen, an
Ihrem Modem vornehmen.

Bei einem externen 14400 U.S. Robotics? Sportster? m?ssen Sie auch noch
einige DIP-Schalter einstellen. Die folgenden Einstellungen k?nnen Sie
vielleicht als Beispiel f?r andere Modems verwenden:

.. raw:: html

   <div class="itemizedlist">

-  Schalter 1: OBEN – DTR normal

-  Schalter 2: N/A (R?ckmeldungen als Text/numerische R?ckmeldungen)

-  Schalter 3: OBEN – Keine R?ckmeldungen ausgeben

-  Schalter 4: UNTEN – Echo-Funktion aus

-  Schalter 5: OBEN – Rufannahme aktiviert

-  Schalter 6: OBEN – Carrier Detect normal

-  Schalter 7: OBEN – Einstellungen aus dem NVRAM laden

-  Schalter 8: N/A (Smart Mode/Dumb Mode)

.. raw:: html

   </div>

F?r Einw?hlverbindungen sollten die R?ckmeldungen deaktiviert sein, da
sonst ``getty`` dem Modem das Anmeldeprompt ``login:`` schickt und das
Modem im Kommandomodus das Prompt wieder ausgibt (Echo-Funktion) oder
eine R?ckmeldung gibt. Das f?hrt dann zu einer l?nglichen und
fruchtlosen Kommunikation zwischen dem Modem und ``getty``.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.4.5.1. Konfiguration f?r feste Geschwindigkeit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Geschwindigkeit zwischen Modem und Computer muss auf einen festen
Wert eingestellt werden. Mit einem externen 14400 U.S. Robotics?
Sportster? Modem setzen die folgenden Kommandos die Geschwindigkeit auf
den Wert der Datenendeinrichtung fest:

.. code:: programlisting

    ATZ
    AT&B1&W

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

28.4.5.2. Konfiguration f?r angepasste Geschwindigkeit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In diesem Fall muss die Geschwindigkeit der seriellen Schnittstelle des
Modems der eingehenden Geschwindigkeit angepasst werden. F?r ein
externes 14400 U.S. Robotics? Sportster? Modem erlauben die folgenden
Befehle eine Anpassung der Geschwindigkeit der seriellen Schnittstelle
f?r Verbindungen, die keine Fehlerkorrektur verwenden:

.. code:: programlisting

    ATZ
    AT&B2&W

Verbindungen mit Fehlerkorrektur (V.42, MNP) verwenden die
Geschwindigkeit der Datenendeinrichtung.

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

28.4.5.3. ?berpr?fen der Modemkonfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die meisten Modems verf?gen ?ber Kommandos, die die Konfiguration des
Modems in lesbarer Form ausgeben. Auf einem externen 14400 U.S.
Robotics? Sportster? zeigt ``ATI5`` die Einstellungen im nicht
fl?chtigen RAM an. Um die wirklichen Einstellungen unter
Ber?cksichtigung der DIP-Schalter zu sehen, benutzen Sie ``ATZ`` gefolgt
von ``ATI4``.

Wenn Sie ein anderes Modem benutzen, schauen Sie bitte in der
Dokumentation Ihres Modems nach, wie Sie die Konfiguration des Modems
?berpr?fen k?nnen.

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

28.4.6. Fehlersuche
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei Problemen k?nnen Sie die Einw?hlverbindung anhand der folgenden
Punkte ?berpr?fen:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.4.6.1. ?berpr?fen des FreeBSD-Systems
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Schlie?en Sie das Modem an das FreeBSD-System an und booten Sie das
System. Wenn Ihr Modem ?ber Statusindikatoren verf?gt, ?berpr?fen Sie,
ob der DTR Indikator leuchtet, wenn das Anmeldeprompt erscheint. Dies
zeigt an, dass das FreeBSD-System einen ``getty`` Prozess auf der
entsprechenden Schnittstelle gestartet hat und das Modem auf einkommende
Verbindungen wartet.

Wenn der DTR-Indikator nicht leuchtet, melden Sie sich an dem
FreeBSD-System an und ?berpr?fen mit ``ps ax``, ob FreeBSD einen
``getty``-Prozess auf der entsprechenden Schnittstelle gestartet hat.
Unter den angezeigten Prozessen sollten Sie ?hnliche wie die folgenden
finden:

.. code:: screen

      114 ??  I      0:00.10 /usr/libexec/getty V19200 ttyu0
      115 ??  I      0:00.10 /usr/libexec/getty V19200 ttyu1

Wenn das Modem noch keinen Anruf entgegengenommen hat und Sie
stattdessen die folgende Zeile sehen

.. code:: screen

      114 d0  I      0:00.10 /usr/libexec/getty V19200 ttyu0

bedeutet dies, dass ``getty`` die Schnittstelle schon ge?ffnet hat und
zeigt Kabelprobleme oder eine falsche Modemkonfiguration an, da
``getty`` die Schnittstelle erst dann ?ffnen kann, wenn das CD Signal
(Carrier Detect) vom Modem anliegt.

Wenn Sie keine ``getty``-Prozesse auf den gew?nschten ``ttyuN`` Ports
finden, untersuchen Sie bitte ``/etc/ttys`` auf Fehler. Suchen Sie auch
in ``/var/log/messages`` nach Meldungen von ``init`` oder ``getty``.
Wenn Sie dort Meldungen finden, sollten Sie noch einmal die beiden
Konfigurationsdateien ``/etc/ttys`` und ``/etc/gettytab`` nach Fehlern
durchsehen. ?berpr?fen Sie auch, ob die Ger?tedateien ``/dev/ttyuN``
vorhanden sind.

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

28.4.6.2. Einw?hlversuch
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Versuchen Sie, sich in Ihr System einzuw?hlen. Auf dem entfernten System
stellen Sie bitte die folgenden Kommunikationsparameter ein: 8?Bit,
keine Parit?t, ein Stop-Bit. Wenn Sie kein Anmeldeprompt erhalten oder
nur unleserliche Zeichen sehen, dr?cken Sie mehrmals, in Abst?nden von
ungef?hr einer Sekunde, **Enter**. Wenn Sie immer noch nicht die
``login:`` Meldung sehen, schicken Sie ein ``BREAK`` Kommando. Wenn Sie
zur Einwahl ein Highspeed-Modem benutzen, verwenden Sie eine feste
Geschwindigkeit auf der seriellen Schnittstelle des Modems (``AT&B1``
f?r ein U.S. Robotics? Sportster?).

Wenn Sie jetzt immer noch kein Anmeldeprompt erhalten, ?berpr?fen Sie
nochmals ``/etc/gettytab`` und stellen sicher, dass

.. raw:: html

   <div class="itemizedlist">

-  der Verbindungstyp in ``/etc/ttys`` zu einem g?ltigen Eintrag in
   ``/etc/gettytab`` geh?rt,

-  jeder der ``nx=`` Eintr?ge in ``gettytab`` g?ltig ist und

-  jeder ``tc=`` Eintrag auf einen g?ltigen Eintrag in ``gettytab``
   verweist.

.. raw:: html

   </div>

Wenn das Modem an Ihrem FreeBSD-System auf einen eingehenden Anruf nicht
antwortet, stellen Sie sicher, dass das Modem so konfiguriert ist, dass
es einen Anruf beantwortet, wenn DTR anliegt. Wenn Ihr Modem
Statusindikatoren besitzt, k?nnen Sie das Anliegen von DTR anhand der
Leuchten ?berpr?fen.

Wenn Sie alles schon mehrfach ?berpr?ft haben und es immer noch noch
nicht funktioniert, machen Sie erst einmal eine Pause, bevor Sie
weitermachen. Wenn es immer noch nicht funktioniert, k?nnen Sie eine
Mail an die Mailingliste 'Fragen und Antworten zu FreeBSD'
``<de-bsd-questions@de.FreeBSD.org>`` schicken, in der Sie Ihr Modem und
Ihr Problem beschreiben und Ihnen sollte geholfen werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+------------------------------------+----------------------------------+
| `Zur?ck <term.html>`__?   | `Nach oben <serialcomms.html>`__   | ?\ `Weiter <dialout.html>`__     |
+---------------------------+------------------------------------+----------------------------------+
| 28.3. Terminals?          | `Zum Anfang <index.html>`__        | ?28.5. Verbindungen nach Au?en   |
+---------------------------+------------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
