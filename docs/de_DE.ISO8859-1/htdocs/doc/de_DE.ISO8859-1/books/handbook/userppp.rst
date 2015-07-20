==============
29.2. User-PPP
==============

.. raw:: html

   <div class="navheader">

29.2. User-PPP
`Zur?ck <ppp-and-slip.html>`__?
Kapitel 29. PPP und SLIP
?\ `Weiter <ppp.html>`__

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

29.2. User-PPP
--------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Aktualisiert und erweitert von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Urspr?nglich geschrieben von Brian Somers.

.. raw:: html

   </div>

.. raw:: html

   <div>

Mit Beitr?gen von Nik Clayton, Dirk Fr?mberg und Peter Childs.

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

Mit FreeBSD?8.0 wurden die Ger?tedateien f?r serielle Ports umbenannt:
``/dev/cuadN`` wurde zu ``/dev/cuauN``, ``/dev/ttydN`` zu
``/dev/ttyuN``. Verwenden Sie noch FreeBSD?7.X, m?ssen Sie dies beim
Lesen der folgenden Abschnitte ber?cksichtigen.

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

29.2.1. User-PPP
~~~~~~~~~~~~~~~~

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

29.2.1.1. Voraussetzungen
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Dokument geht davon aus, dass Sie Folgendes zur Verf?gung haben:

.. raw:: html

   <div class="itemizedlist">

-  Einen Account bei einem Internet Service Provider (ISP), zu dem Sie
   mit PPP eine Verbindung aufbauen k?nnen.

-  Ein Modem oder ein anderes Ger?t, das, richtig konfiguriert und mit
   Ihrem Rechner verbunden, Ihnen die Herstellung einer Verbindung zu
   Ihrem ISP erlaubt.

-  Die Einwahlnummer(n) Ihres ISP.

-  Ihren Login-Namen und Ihr Passwort (entweder ein regul?res
   Login/Passwort-Paar im UNIX?-Stil oder ein PAP bzw. CHAP
   Login/Passwort-Paar).

-  Die IP-Adresse von einem oder mehreren Nameservern. ?blicherweise
   werden Ihnen von Ihrem ISP zwei IP-Adressen f?r diesen Zweck zur
   Verf?gung gestellt. Wenn Sie keine solche IP-Adresse von Ihrem
   Provider bekommen haben, k?nnen Sie das Kommando ``enable dns`` in
   der Datei ``ppp.conf`` verwenden, um ppp anzuweisen, den Nameserver
   f?r Sie einzutragen. Diese Funktion setzt allerdings voraus, dass Ihr
   ISP eine PPP-Implementierung verwendet, die das Aushandeln eines
   Nameservers unterst?tzt.

.. raw:: html

   </div>

Die folgenden Informationen werden Ihnen m?glicherweise von Ihrem ISP
zur Verf?gung gestellt, sie sind aber nicht zwingend erforderlich:

.. raw:: html

   <div class="itemizedlist">

-  Die Gateway IP-Adresse Ihres ISP. Als Gateway wird der Computer
   bezeichnet, zu dem Sie eine Verbindung aufbauen. Die IP-Adresse
   dieses Rechners wird als *default route* eingetragen. Wenn Sie diese
   Information nicht zur Verf?gung haben, kann PPP so konfiguriert
   werden, dass der PPP-Server Ihres ISP w?hrend des Verbindungsaufbaus
   eine g?ltige Adresse ?bermittelt.

   ppp bezieht sich mit ``HISADDR`` auf diese IP-Adresse.

-  Die Netzmaske, die Sie verwenden sollten. Falls Ihnen Ihr ISP keine
   Netzmaske vorgegeben hat, k?nnen Sie ``255.255.255.255`` verwenden.

-  Wenn Ihnen Ihr ISP eine statische IP-Adresse zur Verf?gung stellt,
   k?nnen Sie diese eintragen. Andernfalls lassen wir uns einfach von
   der Gegenstelle eine IP-Adresse zuweisen.

.. raw:: html

   </div>

Falls Ihnen die erforderlichen Informationen fehlen sollten, nehmen Sie
bitte Kontakt mit Ihrem ISP auf.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Beispieldateien, die in diesem Kapitel dargestellt werden, enthalten
Zeilennummern. Die Nummerierung dient lediglich einer leichteren
Orientierung und sollte von Ihnen nicht in Ihre Dateien ?bernommen
werden. Richtiges Einr?cken, durch Tabulatoren und Leerzeichen, ist
ebenfalls wichtig.

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

29.2.1.2. Automatische Konfiguration von PPP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sowohl ``ppp`` als auch ``pppd`` (die PPP-Implementierung auf
Kernelebene, nur unter FreeBSD?7.X) verwenden die Konfigurationsdateien
im Verzeichnis ``/etc/ppp``. Beispiele f?r User-PPP sind in
``/usr/share/examples/ppp/`` zu finden.

Die Konfiguration von ``ppp`` erfordert, je nach Ihren besonderen
Bedingungen, die Bearbeitung einiger Dateien. Was Sie in diese Dateien
eintragen, h?ngt unter anderem davon ab, ob Ihnen Ihr ISP eine statische
IP-Adresse (Sie verwenden immer dieselbe IP-Adresse, die Ihnen einmal
zugeteilt wurde) oder eine dynamische IP-Adresse (Ihre IP-Adresse ?ndert
sich bei jeder Verbindung mit dem ISP) zugewiesen hat.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.2.1.2.1. PPP und statische IP-Adressen
'''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie m?ssen die Konfigurationsdatei ``/etc/ppp/ppp.conf`` bearbeiten. Sie
sollte so aussehen, wie in dem unten angegebenen Beispiel.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Zeilen die mit einem ``:`` enden, beginnen in der ersten Spalte (am
Beginn der Zeile). Alle anderen Zeilen sollten wie dargestellt durch
Leerzeichen oder Tabulatoren einger?ckt werden.

.. raw:: html

   </div>

.. code:: programlisting

    1     default:
    2       set log Phase Chat LCP IPCP CCP tun command
    3       ident user-ppp VERSION (built COMPILATIONDATE)
    4       set device /dev/cuau0
    5       set speed 115200
    6       set dial "ABORT BUSY ABORT NO\\sCARRIER TIMEOUT 5 \
    7                 \"\" AT OK-AT-OK ATE1Q0 OK \\dATDT\\T TIMEOUT 40 CONNECT"
    8       set timeout 180
    9       enable dns
    10
    11    provider:
    12      set phone "(123) 456 7890"
    13      set authname foo
    14      set authkey bar
    15      set login "TIMEOUT 10 \"\" \"\" gin:--gin: \\U word: \\P col: ppp"
    16      set timeout 300
    17      set ifaddr x.x.x.x y.y.y.y 255.255.255.255 0.0.0.0
    18      add default HISADDR

.. raw:: html

   <div class="variablelist">

Zeile 1:
    Gibt den Standardeintrag an. Befehle dieses Eintrags werden
    automatisch ausgef?hrt, wenn ppp l?uft.

Zeile 2:
    Schaltet die Loggingparameter ein. Wenn die Verbindung
    zufriedenstellend funktioniert, k?nnen Sie diese Zeile verk?rzen:

    .. code:: programlisting

        set log phase tun

    Dies verhindert ein ?berm??iges Anwachsen der Logdateien.

Zeile 3:
    Gibt PPP an, wie es sich gegen?ber der Gegenstelle identifizieren
    soll. PPP identifiziert sich gegen?ber der Gegenstelle, wenn es
    Schwierigkeiten bei der Aushandlung und beim Aufbau der Verbindung
    gibt. Dabei werden Informationen bereitgestellt, die dem
    Administrator der Gegenstelle helfen k?nnen, die Ursache der
    Probleme zu finden.

Zeile 4:
    Gibt das Device an, an dem das Modem angeschlossen ist. ``COM1``
    entspricht ``/dev/cuad0`` und ``COM2`` entspricht ``/dev/cuad1``.

Zeile 5:
    Legt die Geschwindigkeit fest, mit der Sie die Verbindung betreiben
    m?chten. Falls ein Wert von 115200 nicht funktioniert (was aber bei
    jedem einigerma?en neuen Modem funktionieren sollte), versuchen Sie
    es stattdessen mit 38400.

Zeilen 6 & 7:
    Die Zeichenfolge f?r die Einwahl. User-PPP verwendet eine
    expect-send Syntax, ?hnlich dem
    `chat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chat&sektion=8>`__-Programm.
    Weitere Informationen zu den Eigenschaften dieser Sprache bietet die
    Manual-Seite.

    Beachten Sie, dass dieser Befehl aufgrund der besseren Lesbarkeit
    auf der n?chsten Zeile weitergeht. Das kann f?r jeden Befehl in
    ``ppp.conf`` gelten, wenn ``\`` das letzte Zeichen in einer Zeile
    ist.

Zeile 8:
    Legt den Zeitrahmen fest, innerhalb dessen eine Reaktion erfolgen
    muss. Der Standardwert liegt bei 180?Sekunden, so dass diese Zeile
    lediglich einen kosmetischen Charakter hat.

Zeile 9:
    Weist PPP an, bei der Gegenstelle eine Best?tigung der lokalen
    Resolvereinstellungen anzufordern. Wenn Sie einen lokalen Nameserver
    betreiben, sollte diese Zeile auskommentiert oder gel?scht werden.

Zeile 10:
    Eine leere Zeile zur besseren Lesbarkeit. Leere Zeilen werden von
    PPP ignoriert.

Zeile 11:
    Bestimmt einen Provider, namens „provider“. Wenn Sie hier den Namen
    Ihres ISP einsetzen, k?nnen Sie sp?ter die Verbindung mit
    ``load ISP`` aufbauen.

Zeile 12:
    Gibt die Telefonnummer des Providers an. Mehrere Telefonnummern
    k?nnen angegeben werden, indem Doppelpunkte (``:``) oder
    Pipe-Zeichen (``|``) als Trennzeichen verwendet werden. Der
    Unterschied zwischen diesen beiden Trennzeichen ist in
    `ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
    beschrieben. Zusammenfassend: Wenn Sie die verschiedenen Nummern
    abwechselnd verwenden m?chten, sollten Sie die Nummern durch einen
    Doppelpunkt trennen. Wenn Sie immer die erste Nummer verwenden
    m?chten und die anderen nur zum Einsatz kommen sollen, wenn eine
    Einwahl mit der ersten Telefonnummer nicht m?glich ist, sollten Sie
    das Pipe-Zeichen zur Trennung verwenden. Wie im Beispiel, sollten
    Sie die gesamte Reihe der Telefonnummern in Anf?hrungszeichen
    setzen.

    Sie m?ssen die Telefonnummer in Anf?hrungszeichen (``"``) setzen,
    wenn Sie Leerzeichen in der Telefonnummer verwenden, ansonsten rufen
    Sie einen Fehler hervor, der vielleicht schwer zu finden ist.

Zeilen 13 & 14:
    Gibt den Benutzernamen und das Passwort an. Wenn Sie zur Verbindung
    einen Login-Prompt im UNIX-Stil verwenden, bezieht sich der Befehl
    ``set login`` mit den \\U und \\P Variablen auf diese Werte. Wenn
    Sie zum Verbindungsaufbau PAP oder CHAP verwenden, werden diese
    Werte zum Zeitpunkt der Authentifizierung verwendet.

Zeile 15:
    Wenn Sie PAP oder CHAP einsetzen, gibt es an dieser Stelle keinen
    Login-Prompt, weshalb Sie diese Zeile auskommentieren oder l?schen
    sollten. Der Abschnitt `Authentifizierung mit PAP und
    CHAP <userppp.html#userppp-PAPnCHAP>`__ enth?lt hierzu weitere
    Einzelheiten.

    Der Login-String hat die gleiche chat-?hnliche Syntax, wie der
    Einwahlstring. Der String in diesem Beispiel funktioniert mit einem
    ISP, dessen Login-Session folgenderma?en aussieht:

    .. code:: screen

        J. Random Provider
        login: foo
        password: bar
        protocol: ppp

    Sie m?ssen dieses Skript noch an Ihre eigenen Erfordernisse
    anpassen. Wenn Sie dieses Skript zum ersten Mal schreiben, sollten
    Sie sicherstellen, dass Sie „chat“-logging aktiviert haben, damit
    Sie ?berpr?fen zu k?nnen, ob die Konversation zwischen Ihrem Rechner
    und dem Rechner des Providers wie erwartet abl?uft.

Zeile 16:
    Setzt einen Zeitrahmen (in Sekunden), innerhalb dessen eine Reaktion
    erfolgen muss. In diesem Fall, wird die Verbindung nach 300?Sekunden
    automatisch geschlossen, wenn keine Aktivit?t zu verzeichnen ist.
    Wenn Sie keinen Zeitrahmen festlegen wollen, nach dessen
    ?berschreiten die Verbindung geschlossen wird, k?nnen Sie diesen
    Wert auf 0 setzen oder die Kommandozeilen-Option ``-ddial``
    verwenden.

Zeile 17:
    Gibt die IP-Adresse f?r das Interface an. Der String *``x.x.x.x``*
    sollte durch die IP-Adresse ersetzt werden, die Ihnen Ihr Provider
    zugeteilt hat. Der String *``y.y.y.y``* sollte durch die IP-Adresse
    ersetzt werden, die Ihr ISP als Gateway angegeben hat (das ist der
    Rechner, mit dem Ihr Rechner eine Verbindung aufbaut). Wenn Ihnen
    Ihr ISP keine Gateway Adresse zur Verf?gung gestellt hat, verwenden
    Sie hier einfach ``10.0.0.2/0``. Wenn Sie eine „erratene“ IP-Adresse
    verwenden m?ssen, sollten Sie in der Datei ``/etc/ppp/ppp.linkup``
    einen entsprechenden Eintrag machen. Folgen Sie dazu den Anweisungen
    im Abschnitt `PPP und dynamische
    IP-Adressen <userppp.html#userppp-dynamicIP>`__. Wenn diese Zeile
    ausgelassen wird, kann ``ppp`` nicht im ``-auto`` Modus betrieben
    werden.

Zeile 18:
    F?gt eine Defaultroute f?r das Gateway Ihres Providers hinzu. Das
    Wort ``HISADDR`` wird dabei durch die in Zeile?17 angegebene Gateway
    Adresse ersetzt. Wichtig ist, dass diese Zeile nach Zeile?17
    erscheint, da andernfalls ``HISADDR`` noch nicht initialisiert ist.

    Wenn Sie ppp nicht im ``-auto`` Modus betreiben, sollte diese Zeile
    in die Datei ``ppp.linkup`` verschoben werden.

.. raw:: html

   </div>

Wenn Sie eine statische IP-Adresse verwenden und ppp im ``-auto`` Modus
l?uft, ist es nicht notwendig, einen Eintrag in die Datei ``ppp.linkup``
hinzuzuf?gen. In diesem Fall hat ihre Routingtabelle bereits die
richtigen Eintr?ge, bevor Sie die Verbindung aufbauen. Sie m?chten aber
vielleicht einen Eintrag hinzuf?gen, um ein Programm aufzurufen, nachdem
die Verbindung aufgebaut ist. Dies wird weiter unten am Beispiel von
Sendmail erkl?rt.

Beispiele f?r Konfigurationsdateien finden Sie im Verzeichnis
``/usr/share/examples/ppp/``.

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

29.2.1.2.2. PPP und dynamische IP-Adressen
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihnen Ihr ISP keine statische IP-Adresse zuteilt, kann ``ppp`` so
konfiguriert werden, dass die lokale und die entfernte IP-Adresse beim
Verbindungsaufbau ausgehandelt werden. Dies geschieht, indem zun?chst
eine IP-Adresse „erraten“ wird, die von ``ppp``, unter Verwendung des IP
Configuration Protocol (IPCP) durch eine richtige ersetzt wird, wenn die
Verbindung aufgebaut ist. Die Konfiguration der Datei ``ppp.conf``
entspricht derjenigen, die im Abschnitt `PPP und statische IP-
Adressen <userppp.html#userppp-staticIP>`__ dargestellt wurde, jedoch
mit folgender ?nderung:

.. code:: programlisting

    17      set ifaddr 10.0.0.1/0 10.0.0.2/0 255.255.255.255 0.0.0.0

Auch hier dient die Zeilennummerierung lediglich der besseren
?bersichtlichkeit. Einr?ckungen, von mindestens einem Leerzeichen, sind
allerdings erforderlich.

.. raw:: html

   <div class="variablelist">

Zeile 17:
    Die Zahl nach dem ``/`` Zeichen, gibt die Anzahl der Bits der
    Adresse an, auf die ppp besteht. Sie m?chten vielleicht andere
    IP-Adressen verwenden, die oben angegebenen werden aber immer
    funktionieren.

    Das letzte Argument (``0.0.0.0``) weist PPP an, den
    Verbindungsaufbau mit der Adresse ``0.0.0.0`` zu beginnen, statt
    ``10.0.0.1`` zu verwenden. Dies ist bei einigen ISPs notwendig.
    Verwenden Sie nicht ``0.0.0.0`` als erstes Argument f?r
    ``set ifaddr``, da so verhindert wird, dass PPP im ``-auto`` Modus
    eine initiale Route setzt.

.. raw:: html

   </div>

Wenn PPP nicht im ``-auto`` Modus l?uft, m?ssen Sie die
Datei\ ``/etc/ppp/ppp.linkup`` editieren. ``ppp.linkup`` kommt zum
Einsatz, wenn eine Verbindung aufgebaut worden ist. Zu diesem Zeitpunkt
hat ``ppp`` die Interface Adressen vergeben und es ist m?glich, die
Eintr?ge in der Routingtabelle hinzuzuf?gen:

.. code:: programlisting

    1     provider:
    2      add default HISADDR

.. raw:: html

   <div class="variablelist">

Zeile 1:
    Beim Aufbau einer Verbindung sucht ``ppp`` in der Datei
    ``ppp.linkup`` nach einem Eintrag. PPP geht dabei nach folgenden
    Regeln vor: Suche zun?chst nach der gleichen Bezeichnung, die wir
    auch in der Datei ``ppp.conf`` verwendet haben. Falls das nicht
    funktioniert, suche nach einem Eintrag der IP-Adresse unseres
    Gateways. Dieser Eintrag ist eine Bezeichnung im Stil von
    IP-Adressen, die sich aus vier Oktetts zusammensetzt. Falls immer
    noch kein passender Eintrag gefunden wurde, suche nach dem Eintrag
    ``MYADDR``.

Zeile 2:
    Diese Zeile weist ``ppp`` an, eine Defaultroute zu verwenden, die
    auf ``HISADDR`` zeigt. ``HISADDR`` wird nach der Aushandlung mit
    IPCP durch die IP-Adresse des Gateways ersetzt.

.. raw:: html

   </div>

Die Dateien ``/usr/share/examples/ppp/ppp.conf.sample`` und
``/usr/share/examples/ppp/ppp.linkup.sample`` bieten detaillierte
Beispiele f?r ``pmdemand`` Eintr?ge.

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

29.2.1.2.3. Annahme eingehender Anrufe
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie ppp auf einem Rechner, der in ein LAN eingebunden ist, so
konfigurieren, dass eingehende Anrufe angenommen werden, m?ssen Sie
entscheiden, ob Pakete an das LAN weitergeleitet werden sollen. Wenn Sie
das m?chten, sollten Sie an die Gegenstelle eine IP-Adresse aus Ihrem
lokalen Subnetz vergeben und den Befehl ``enable proxy`` in die Datei
``/etc/ppp/ppp.conf`` einf?gen. Au?erdem sollte die Datei
``/etc/rc.conf`` Folgendes enthalten:

.. code:: programlisting

    gateway_enable="YES"

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

29.2.1.2.4. Welches getty?
''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Abschnitt `Einw?hlverbindungen <dialup.html>`__ bietet eine gute
Beschreibung, wie Einw?hlverbindungen unter Verwendung von
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
genutzt werden k?nnen.

Eine Alternative zu ``getty`` ist
`mgetty <http://mgetty.greenie.net/>`__, eine raffiniertere Version von
``getty``, die mit Blick auf Einw?hlverbindungen entworfen wurde. Sie
k?nnen dieses Paket ?ber den Port
`comms/mgetty+sendfax <http://www.freebsd.org/cgi/url.cgi?ports/comms/mgetty+sendfax/pkg-descr>`__
installieren.

Der Vorteil von ``mgetty`` ist, dass es auf aktive Weise mit Modems
*spricht*, das hei?t wenn ein Port in ``/etc/ttys`` ausgeschaltet ist,
wird Ihr Modem nicht auf Anrufe reagieren.

Sp?tere Versionen von ``mgetty`` (von 0.99beta aufw?rts) unterst?tzen
auch die automatische Erkennung von PPP-Streams, was Ihren Clients den
skriptlosen Zugang zu Ihren Servern erlaubt.

Der Abschnitt `Mgetty und AutoPPP <userppp.html#userppp-mgetty>`__
bietet weitere Informationen zu ``mgetty``.

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

29.2.1.2.5. PPP und Rechte
''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Befehl ``ppp`` muss normalerweise als ``root`` ausgef?hrt werden.
Wenn Sie jedoch m?chten, dass ``ppp`` im Server-Modus auch von einem
normalen Benutzer, wie unten beschrieben, durch Aufruf von ``ppp``
ausgef?hrt werden kann, m?ssen Sie diesem Benutzer die Rechte erteilen,
``ppp`` auszuf?hren, indem Sie ihn in der Datei ``/etc/group`` der
Gruppe ``network`` hinzuf?gen.

Sie werden ihm ebenfalls den Zugriff auf einen oder mehrere Abschnitte
der Konfigurationsdatei geben m?ssen, indem Sie den ``allow`` Befehl
verwenden:

.. code:: programlisting

    allow users fred mary

Wenn dieser Befehl im ``default`` Abschnitt verwendet wird, erhalten die
angegebenen Benutzer vollst?ndigen Zugriff.

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

29.2.1.2.6. PPP-Shells f?r dynamische IP-Adressen
'''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Erzeugen Sie eine Datei mit dem Namen ``/etc/ppp/ppp-shell``, die
Folgendes enth?lt:

.. code:: programlisting

    #!/bin/sh
    IDENT=`echo $0 | sed -e 's/^.*-\(.*\)$/\1/'`
    CALLEDAS="$IDENT"
    TTY=`tty`

    if [ x$IDENT = xdialup ]; then
            IDENT=`basename $TTY`
    fi

    echo "PPP for $CALLEDAS on $TTY"
    echo "Starting PPP for $IDENT"

    exec /usr/sbin/ppp -direct $IDENT

Dieses Skript sollte ausf?hrbar sein. Nun erzeugen Sie einen
symbolischen Link ``ppp-dialup`` auf dieses Skript mit folgendem Befehl:

.. code:: screen

    # ln -s ppp-shell /etc/ppp/ppp-dialup

Sie sollten dieses Skript als *Shell* f?r alle Benutzer von
Einw?hlverbindungen verwenden. Dies ist ein Beispiel aus der Datei
``/etc/passwd`` f?r einen Benutzer namens ``pchilds``, der PPP f?r
Einw?hlverbindungen verwenden kann (Denken Sie daran, die Passwortdatei
nicht direkt zu editieren, sondern daf?r
`vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__ zu
verwenden).

.. code:: programlisting

    pchilds:*:1011:300:Peter Childs PPP:/home/ppp:/etc/ppp/ppp-dialup

Erstellen Sie ein Verzeichnis ``/home/ppp``, das von allen Benutzern
gelesen werden kann und die folgenden leeren Dateien enth?lt:

.. code:: screen

    -r--r--r--   1 root     wheel           0 May 27 02:23 .hushlogin
    -r--r--r--   1 root     wheel           0 May 27 02:22 .rhosts

Dies verhindert, dass ``/etc/motd`` angezeigt wird.

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

29.2.1.2.7. PPP-Shells f?r statische IP-Adressen
''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Erstellen Sie die Datei ``ppp-shell`` wie oben oben dargestellt.
Erzeugen Sie nun f?r jeden Account mit statischer IP-Adresse einen
symbolischen Link auf ``ppp-shell``.

Wenn Sie beispielsweise die drei Kunden, ``fred``, ``sam`` und ``mary``
haben, f?r die Sie CIDR-/24-Netzwerke routen, schreiben Sie Folgendes:

.. code:: screen

    # ln -s /etc/ppp/ppp-shell /etc/ppp/ppp-fred
    # ln -s /etc/ppp/ppp-shell /etc/ppp/ppp-sam
    # ln -s /etc/ppp/ppp-shell /etc/ppp/ppp-mary

Jeder Einw?hlzugang dieser Kunden sollte den oben erzeugten symbolischen
Link als Shell haben (``mary``'s Shell sollte also ``/etc/ppp/ppp-mary``
sein).

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

29.2.1.2.8. Einrichten von ``ppp.conf`` f?r dynamische IP-Adressen
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Datei ``/etc/ppp/ppp.conf`` sollte in etwa wie folgt aussehen:

.. code:: programlisting

    default:
      set debug phase lcp chat
      set timeout 0

    ttyu0:
      set ifaddr 203.14.100.1 203.14.100.20 255.255.255.255
      enable proxy

    ttyu1:
      set ifaddr 203.14.100.1 203.14.100.21 255.255.255.255
      enable proxy

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Einr?ckungen sind wichtig.

.. raw:: html

   </div>

Der Abschnitt ``default:`` wird f?r jede Sitzung geladen. Erstellen Sie
f?r jede Einw?hlverbindung, die Sie in der Datei ``/etc/ttys``
erm?glicht haben, einen Eintrag, wie oben f?r ``ttyu0:`` gezeigt. Jede
Verbindung sollte eine eigene IP-Adresse aus dem Pool der Adressen
bekommen, die sie f?r diese Benutzergruppe reserviert haben.

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

29.2.1.2.9. Einrichten von ``ppp.conf`` f?r statische IP-Adressen
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zu dem bisher dargestellten Inhalt der Beispieldatei
``/usr/share/examples/ppp/ppp.conf`` sollten Sie einen Abschnitt f?r
jeden Benutzer mit statisch zugewiesener IP-Adresse hinzuf?gen. Wir
werden nun unser Beispiel mit den Accounts ``fred``, ``sam`` und
``mary`` weiterf?hren.

.. code:: programlisting

    fred:
      set ifaddr 203.14.100.1 203.14.101.1 255.255.255.255

    sam:
      set ifaddr 203.14.100.1 203.14.102.1 255.255.255.255

    mary:
      set ifaddr 203.14.100.1 203.14.103.1 255.255.255.255

Die Datei ``/etc/ppp/ppp.linkup`` sollte, falls erforderlich, ebenfalls
Routinginformationen f?r jeden Benutzer mit statischer IP-Adresse
enthalten. Die unten dargestellte Zeile w?rde dem Netzwerk
``203.14.101.0/24`` eine Route ?ber die PPP-Verbindung des Client
hinzuf?gen.

.. code:: programlisting

    fred:
      add 203.14.101.0 netmask 255.255.255.0 HISADDR

    sam:
      add 203.14.102.0 netmask 255.255.255.0 HISADDR

    mary:
      add 203.14.103.0 netmask 255.255.255.0 HISADDR

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

29.2.1.2.10. ``mgetty`` und AutoPPP
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Voreinstellung wird ``mgetty`` mit der Option ``AUTO_PPP``
konfiguriert und kompiliert. Dadurch kann ``mgetty`` die LCP Phase von
PPP-Verbindungen erkennen und automatisch eine ppp-Shell starten. Da
hierbei jedoch die Login/Passwort-Sequenz nicht durchlaufen wird, ist es
notwendig, Benutzer durch PAP oder CHAP zu authentifizieren.

In diesem Abschnitt wird davon ausgegangen, dass der Benutzer den Port
`comms/mgetty+sendfax <http://www.freebsd.org/cgi/url.cgi?ports/comms/mgetty+sendfax/pkg-descr>`__
auf seinem System kompiliert und installiert hat.

Stellen Sie sicher, dass die Datei
``/usr/local/etc/mgetty+sendfax/login.config`` Folgendes enth?lt:

.. code:: programlisting

    /AutoPPP/ -     -           /etc/ppp/ppp-pap-dialup

Hierdurch wird ``mgetty`` angewiesen, das Skript ``ppp-pap-dialup`` f?r
die erkannten PPP-Verbindungen auszuf?hren.

Erstellen Sie nun die Datei ``/etc/ppp/ppp-pap-dialup`` mit folgendem
Inhalt (die Datei sollte ausf?hrbar sein):

.. code:: programlisting

    #!/bin/sh
    exec /usr/sbin/ppp -direct pap$IDENT

Erstellen Sie bitte f?r jede Einw?hlverbindung, die Sie in ``/etc/ttys``
erm?glicht haben, einen korrespondierenden Eintrag in der Datei
``/etc/ppp/ppp.conf``. Diese Eintr?ge k?nnen problemlos, mit den
Definitionen die wir weiter oben gemacht haben, koexistieren.

.. code:: programlisting

    pap:
      enable pap
      set ifaddr 203.14.100.1 203.14.100.20-203.14.100.40
      enable proxy

Jeder Benutzer, der sich auf diese Weise anmeldet, ben?tigt einen
Benutzernamen und ein Passwort in der Datei ``/etc/ppp/ppp.secret``. Sie
haben auch die M?glichkeit, Benutzer mit Hilfe von PAP zu
authentifizieren, indem Sie der Datei ``/etc/passwd`` folgende Option
hinzuf?gen:

.. code:: programlisting

    enable passwdauth

Wenn Sie bestimmten Benutzern eine statische IP-Adresse zuweisen
m?chten, k?nnen Sie diese als drittes Argument in der Datei
``/etc/ppp/ppp.secret`` angeben. In
``/usr/share/examples/ppp/ppp.secret.sample`` finden Sie hierf?r
Beispiele.

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

29.2.1.2.11. MS-Erweiterungen
'''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist m?glich PPP so zu konfigurieren, dass bei Bedarf DNS und NetBIOS
Nameserveradressen bereitgestellt werden.

Um diese Erweiterungen f?r die PPP Version 1.x zu aktivieren, sollte der
entsprechende Abschnitt der Datei ``/etc/ppp/ppp.conf`` um folgende
Zeilen erg?nzt werden:

.. code:: programlisting

    enable msext
    set ns 203.14.100.1 203.14.100.2
    set nbns 203.14.100.5

F?r PPP Version 2 und h?her:

.. code:: programlisting

    accept dns
    set dns 203.14.100.1 203.14.100.2
    set nbns 203.14.100.5

Damit werden den Clients die prim?ren und sekund?ren Nameserveradressen
sowie ein NetBIOS Nameserver-Host mitgeteilt.

In Version 2 und h?her verwendet PPP die Werte, die in
``/etc/resolv.conf`` zu finden sind, wenn die Zeile ``set dns``
weggelassen wird.

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

29.2.1.2.12. Authentifizierung durch PAP und CHAP
'''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige ISPs haben ihr System so eingerichtet, dass der
Authentifizierungsteil eines Verbindungsaufbaus mit Hilfe von PAP oder
CHAP-Mechanismen durchgef?hrt wird. Wenn dies bei Ihnen der Fall sein
sollte, wird Ihnen Ihr ISP bei der Verbindung keinen ``login:``-Prompt
pr?sentieren, sondern sofort mit der Aushandlung der PPP-Verbindung
beginnen.

PAP ist nicht so sicher wie CHAP, doch die Sicherheit ist hierbei
normalerweise kein Problem, da Passw?rter, obgleich von PAP im Klartext
versandt, lediglich ?ber die serielle Verbindung verschickt werden. Es
gibt f?r Cracker wenig M?glichkeiten zu „lauschen“.

Zur?ckkommend auf die Abschnitte `PPP und statische
IP-Adressen <userppp.html#userppp-staticIP>`__ oder `PPP und dynamische
IP-Adressen <userppp.html#userppp-dynamicIP>`__ m?ssen folgende
Ver?nderungen vorgenommen werden:

.. code:: programlisting

    13      set authname MyUserName
    14      set authkey MyPassword
    15      set login

.. raw:: html

   <div class="variablelist">

Zeile 13:
    Diese Zeile legt Ihren PAP/CHAP Benutzernamen fest. Sie m?ssen den
    richtigen Wert f?r *``MyUserName``* eingeben.

Zeile 14:
    Diese Zeile legt Ihr PAP/CHAP Passwort fest. Sie m?ssen den
    richtigen Wert f?r *``MyPassword``* eingeben. Sie k?nnen eine
    zus?tzliche Zeile, wie etwa:

    .. code:: programlisting

        16      accept PAP

    oder

    .. code:: programlisting

        16      accept CHAP

    verwenden, um deutlich zu machen, dass dies beabsichtigt ist, aber
    sowohl PAP wie auch CHAP als standardm??ig akzeptiert werden.

Zeile 15:
    Ihr ISP wird normalerweise nicht von Ihnen verlangen, dass Sie sich
    am Server einloggen, wenn Sie PAP oder CHAP verwenden. Sie m?ssen
    deshalb den String „set login“ deaktivieren.

.. raw:: html

   </div>

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

29.2.1.2.13. Ver?nderung Ihrer ``ppp`` Konfiguration im laufenden Betrieb
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist m?glich, dem Programm ``ppp`` Befehle zu erteilen, w?hrend es im
Hintergrund l?uft. Dazu ist jedoch die Einrichtung eines passenden
Diagnose-Ports erforderlich. Erg?nzen Sie hierzu Ihre
Konfigurationsdatei um folgende Zeile:

.. code:: programlisting

    set server /var/run/ppp-tun%d DiagnosticPassword 0177

Damit wird PPP angewiesen, auf den angegebenen UNIX-Domainsocket zu
h?ren und Clients nach dem angegebenen Passwort zu fragen, bevor der
Zugang Gew?hrt wird. Das ``%d`` wird durch die Nummer des benutzten
``tun``-Devices ersetzt.

Wenn ein Socket eingerichtet ist, kann das Programm
`pppctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppctl&sektion=8>`__
in Skripten verwendet werden, mit denen in das laufende Programm
eingegriffen wird.

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

29.2.1.3. Interne NAT von PPP benutzen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PPP kann Network Address Translation (NAT) ohne Hilfe des Kernels
durchf?hren. Wenn Sie diese Funktion benutzen wollen, f?gen Sie die
folgende Zeile in ``/etc/ppp/ppp.conf`` ein:

.. code:: programlisting

    nat enable yes

Sie k?nnen NAT mit der Option ``-nat`` auf der Kommandozeile von PPP
aktivieren. Weiterhin kann NAT in ``/etc/rc.conf`` mit der Variablen
``ppp_nat`` aktiviert werden. Dies ist auch die Voreinstellung.

Die nachstehende ``/etc/ppp/ppp.conf`` benutzt NAT f?r bestimmte
eingehende Verbindungen:

.. code:: programlisting

    nat port tcp 10.0.0.2:ftp ftp
    nat port tcp 10.0.0.2:http http

Wenn Sie Verbindungen von au?en ?berhaupt nicht trauen, benutzen Sie die
folgende Zeile:

.. code:: programlisting

    nat deny_incoming yes

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

29.2.1.4. Abschlie?ende Systemkonfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie haben ``ppp`` nun konfiguriert, aber bevor PPP eingesetzt werden
kann, gibt noch einige weitere Dinge zu erledigen, die alle die
Bearbeitung der Datei ``/etc/rc.conf`` erfordern.

Gehen Sie diese Datei von oben nach unten durch, und stellen Sie als
Erstes sicher, dass die Zeile ``hostname=`` vorhanden ist:

.. code:: programlisting

    hostname="foo.example.com"

Wenn Ihnen Ihr ISP eine statische IP-Adresse und einen Namen zugewiesen
hat, ist es wahrscheinlich am besten, wenn Sie diesen Namen als
Hostnamen verwenden.

Schauen Sie nach der Variable ``network_interfaces``. Wenn Sie Ihr
System so konfigurieren m?chten, dass bei Bedarf eine Verbindung zu
Ihrem ISP aufgebaut wird, sollten Sie das Device ``tun0`` zu der Liste
hinzuf?gen oder es andernfalls entfernen.

.. code:: programlisting

    network_interfaces="lo0 tun0"
    ifconfig_tun0=

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Variable ``ifconfig_tun0`` sollte leer sein und eine Datei namens
``/etc/start_if.tun0`` sollte erstellt werden. Diese Datei sollte die
nachfolgende Zeile enthalten:

.. code:: programlisting

    ppp -auto mysystem

Dieses Skript startet Ihren ppp-D?mon im Automatik-Modus. Es wird bei
der Netzwerkkonfiguration ausgef?hrt. Wenn Ihr Rechner als Gateway f?r
ein LAN fungiert, m?chten Sie vielleicht auch die Option ``-alias``
verwenden. In der Manual-Seite sind weitere Einzelheiten hierzu zu
finden.

.. raw:: html

   </div>

Stellen Sie sicher, dass der Start eines Routerprogramms in
``/etc/rc.conf`` wie folgt deaktiviert ist:

.. code:: programlisting

    router_enable="NO"

Es ist wichtig, dass der ``routed`` D?mon nicht gestartet wird da
``routed`` dazu tendiert, die von ``ppp`` erstellten Eintr?ge der
Standardroute zu ?berschreiben.

Es ist au?erdem sinnvoll, darauf zu achten, dass die Zeile
``sendmail_flags`` nicht die Option ``-q`` enth?lt, da ``sendmail``
sonst ab und zu die Netzwerkverbindung pr?fen wird, was m?glicherweise
dazu f?hrt, dass sich Ihr Rechner einw?hlt. Sie k?nnen hier Folgendes
angeben:

.. code:: programlisting

    sendmail_flags="-bd"

Der Nachteil dieser L?sung ist, dass Sie ``sendmail`` nach jedem Aufbau
einer ppp-Verbindung auffordern m?ssen, die Mailwarteschlange zu
?berpr?fen, indem Sie Folgendes eingeben:

.. code:: screen

    # /usr/sbin/sendmail -q

Vielleicht m?chten Sie den Befehl ``!bg`` in der Datei ``ppp.linkup``
verwenden, um dies zu automatisieren:

.. code:: programlisting

    1     provider:
    2       delete ALL
    3       add 0 0 HISADDR
    4       !bg sendmail -bd -q30m

Wenn Sie dies nicht m?chten, ist es m?glich, einen „dfilter“
einzusetzen, um SMTP-Verkehr zu blockieren. Weitere Einzelheiten hierzu
finden Sie in den Beispieldateien.

Das Einzige, was nun noch zu tun bleibt, ist Ihren Rechner neu zu
starten. Nach dem Neustart k?nnen Sie entweder:

.. code:: screen

    # ppp

und danach ``dial provider`` eingeben, um eine PPP-Sitzung zu starten,
oder Sie geben:

.. code:: screen

    # ppp -auto provider

ein, um ``ppp`` bei Datenverkehr aus Ihrem Netzwerk heraus, automatisch
eine Verbindung herstellen zu lassen (vorausgesetzt Sie haben kein
``start_if.tun0`` Skript erstellt).

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

29.2.1.5. Zusammenfassung
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden Schritte sind n?tig, wenn ppp zum ersten Mal eingerichtet
werden soll:

Clientseite:

.. raw:: html

   <div class="procedure">

#. Stellen Sie sicher, dass das ``tun`` Device in den Kernel eingebaut
   ist.

#. Vergewissern Sie sich, dass die Ger?tedatei ``tunN`` im Verzeichnis
   ``/dev`` vorhanden ist.

#. Bearbeiten Sie die Datei ``/etc/ppp/ppp.conf``. Das Beispiel
   ``pmdemand`` sollte f?r die meisten ISP ausreichen.

#. Wenn Sie eine dynamische IP-Adresse haben, erstellen Sie einen
   Eintrag in der Datei ``/etc/ppp/ppp.linkup``.

#. Aktualisieren Sie die Datei ``/etc/rc.conf``.

#. Erstellen Sie das Skript ``start_if.tun0``, wenn Sie einen
   bedarfgesteuerten Einwahlprozess (*demand dialing*) ben?tigen.

.. raw:: html

   </div>

Serverseite:

.. raw:: html

   <div class="procedure">

#. Stellen Sie sicher, dass das ``tun`` Device in den Kernel eingebaut
   ist.

#. Vergewissern Sie sich, dass die Ger?tedatei ``tunN`` im Verzeichnis
   ``/dev`` vorhanden ist

#. Erstellen Sie einen Eintrag in der Datei ``/etc/passwd`` (verwenden
   Sie dazu das Programm
   `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__).

#. Erstellen Sie ein Profil im Heimatverzeichnis des Benutzers, das
   ``ppp -direct direct-server`` o.?. ausf?hrt.

#. Bearbeiten Sie die Datei ``/etc/ppp/ppp.conf``. Das Beispiel
   ``direct-server`` sollte ausreichen.

#. Erzeugen Sie einen Eintrag in ``/etc/ppp/ppp.linkup``.

#. Aktualisieren Sie die Datei ``/etc/rc.conf``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------------+----------------------------+
| `Zur?ck <ppp-and-slip.html>`__?   | `Nach oben <ppp-and-slip.html>`__   | ?\ `Weiter <ppp.html>`__   |
+-----------------------------------+-------------------------------------+----------------------------+
| Kapitel 29. PPP und SLIP?         | `Zum Anfang <index.html>`__         | ?29.3. Kernel-PPP          |
+-----------------------------------+-------------------------------------+----------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
