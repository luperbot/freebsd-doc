=================================
32.5. Die IPFILTER-Firewall (IPF)
=================================

.. raw:: html

   <div class="navheader">

32.5. Die IPFILTER-Firewall (IPF)
`Zur?ck <firewalls-pf.html>`__?
Kapitel 32. Firewalls
?\ `Weiter <firewalls-ipfw.html>`__

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

32.5. Die IPFILTER-Firewall (IPF)
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Geschrieben wurde IPFILTER von Darren Reed. IPFILTER ist vom
Betriebssystem unabh?ngig: Es ist eine Open Source Anwendung, die auf
die Betriebssysteme FreeBSD, NetBSD, OpenBSD, SunOS™, HP/UX und Solaris™
portiert wurde. IPFILTER wird aktiv betreut und gepflegt. Es werden
regelm??ig neue Versionen herausgegeben.

IPFILTER basiert auf einer kernelseitigen Firewall und einem NAT
Mechanismus, der durch Anwenderprogramme betreut und gesteuert werden
kann. Die Regeln der Firewall werden mit dem Programm
`ipf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=8>`__
gesetzt oder gel?scht. F?r die Manipulation der NAT Regeln verwendet man
`ipnat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ipnat&sektion=1>`__.
Mit
`ipfstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfstat&sektion=8>`__
werden Laufzeitstatistiken der kernelseitigen Anteile von IPFILTER
aufgelistet. Und mit dem Programm
`ipmon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipmon&sektion=8>`__
kann man die Aktionen von IPFILTER in die Protokolldateien des Systems
speichern.

IPF funktionierte urspr?nglich mit einer Regel-Prozess-Logik ? la „die
letzte Regel, die passt, entscheidet“ und verwendete ausschlie?lich
Regeln ohne feste Zust?nde. Inzwischen wurde die Regel-Prozess-Logik
drastisch modernisiert: Es gibt eine ``quick`` und eine
zustandsorientierte ``       keep-state`` Option. Die offizielle
Dokumentation beinhaltet leider nur die veralteten Parameter zur
Regelerstellung - die neuen Funktionen werden nur als Zusatzoptionen
aufgelistet, was ihre Vorteile beim Erstellen einer weit ?berlegenen und
viel sichereren Firewall v?llig untergr?bt.

Die Anweisungen in diesem Kapitel basieren darauf, Regeln mit den
Optionen ``quick`` und ``keep-state`` zu erstellen. Mit diesem
Grundwissen wird man einen kompletten einschlie?enden Regelsatz
erstellen k?nnen.

F?r eine ausf?hrliche Erl?uterung der alten Methode zur
Regelverarbeitung schauen Sie bitte auf
``http://www.obfuscation.org/ipf/ipf-howto.html#TOC_1`` oder
``http://coombs.anu.edu.au/~avalon/ip-filter.html``.

Antworten auf h?ufige Fragen finden Sie unter
``http://www.phildev.net/ipf/index.html``.

Und ein durchsuchbares Archiv der Mailingliste zu IPFILTER gibt es unter
``http://marc.theaimsgroup.com/?l=ipfilter``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

32.5.1. Aktivieren von IPF
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD enth?lt IPF in der Standardversion als ladbares Kernelmodul.
Dieses Modul wird vom System automatisch geladen, wenn in der
``rc.conf`` der Eintrag\ ``         ipfilter_enable="YES"`` angelegt
wird. In dieser urspr?nglichen Konfiguration ist die Protokollierung
aktiv und die Option ``default pass all`` ("Pakete passieren lassen")
als Standard gesetzt. Um die ``block all`` ("alles Blockieren") Option
zu setzen, muss man nicht gleich einen neuen Kernel bauen - es reicht,
``block all`` als letzte Position des Regelsatzes aufzulisten.

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

32.5.2. Kernel-Optionen
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist nicht unbedingt notwendig, IPF durch die folgenden Optionen
direkt in der Kernel einzubinden. Diese M?glichkeit der Verwendung von
IPF wird hier mehr als Hintergrundwissen angeboten. Man sollte nur
wissen, dass dadurch nicht mehr das Kernelmodul geladen wird - und
dementsprechend auch nicht mehr entladen werden kann.

Die Beschreibung der einzelnen Optionen von IPF f?r die Verwendung in
der Kernelkonfiguration finden Sie auch in der Datei
``/usr/src/sys/conf/NOTES``.

.. code:: programlisting

    options IPFILTER
    options IPFILTER_LOG
    options IPFILTER_DEFAULT_BLOCK

``options IPFILTER`` aktiviert die Verwendung der „IPFILTER“ Firewall.

``options IPFILTER_LOG`` aktiviert den Logging-Mechanismus. Das
bedeutet, dass jedes Paket geloggt wird, auf das eine Regel passt, die
das Schl?sselwort ``log`` enth?lt. Dazu wird der Pseudo—Device ``ipl``
verwendet.

``options IPFILTER_DEFAULT_BLOCK`` ?ndert das Verhalten der Firewall
dahingehend, dass jedes Paket, dass nicht explizit von einer ``pass``
Regel Zugang erh?lt, abgewiesen, bzw. geblockt, wird.

Diese Einstellungen werden erst aktiv, wenn der Kernel, in den sie
eingebunden wurden, kompiliert, installiert und gebootet wurde.

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

32.5.3. Optionen in rc.conf
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um IPF w?hrend des Bootvorgangs einzubinden, braucht man lediglich die
folgenden Zeilen der Datei ``/etc/rc.conf`` anzuf?gen:

.. code:: programlisting

    ipfilter_enable="YES"             # Startet IPF
    ipfilter_rules="/etc/ipf.rules"   # liest den Regelsatz aus einer Datei
    ipmon_enable="YES"                # Startet das IP-Monitor Log
    ipmon_flags="-Ds"                 # D = Als Da:mon starten
                                      # s = Protokollierung via syslog
                                      # v = Protokollierung von tcp window, ack, seq
                                      # n = Namen statt IP & port ausgeben
          

Falls sich hinter der Firewall ein lokales Netzwerk befindet, das den
reservierten privaten Adressbereich verwendet, m?ssen die folgenden
Zeilen zur Aktivierung von NAT ebenfalls in ``/etc/rc.conf`` eingetragen
werden:

.. code:: programlisting

    gateway_enable="YES"              # Aktivierung des LAN-Gateways
    ipnat_enable="YES"                # Startet die ipnat Funktion
    ipnat_rules="/etc/ipnat.rules"    # Liest die ipnat-Regeldefinitionen aus einer Datei
          

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

32.5.4. Der Befehl ipf
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit dem Befehl
`ipf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=8>`__
liest man die Datei, die den Regelsatz enth?lt ein. Mit dem folgenden
Befehl k?nnen Sie Ihre eigenen, f?r Ihr System ma?geschneiderten Regeln
einlesen und so in einem Schritt alle Regeln der laufenden Firewall
ersetzen:

.. code:: screen

    # ipf -Fa -f /etc/ipf.rules

``-Fa`` bedeutet, dass alle intern gespeicherten Tabellen mit Regeln
gel?scht werden.

``-f`` gibt die Datei an, aus der die neuen Regeln gelesen werden
sollen.

Mit diesen beiden Optionen erhalten Sie die M?glichkeit, ?nderungen an
der Datei mit Ihrem Regelsatz vorzunehmen und gleich die Firewall mit
den neuen Regeln zu best?cken, ohne den Rechner neu starten zu m?ssen.
Da dieser Vorgang beliebig wiederholt werden kann, ist es ein sehr
bequemer Weg, neue Regeln einzuarbeiten und zu testen.

Um mehr ?ber diese und weitere Optionen von
`ipf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=8>`__ zu
erfahren, konsultieren Sie bitte die Manpage.

`ipf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=8>`__
erwartet, dass es sich bei der Datei mit dem Regelsatz um eine
Standard-Textdatei handelt. Eine Datei, die ein Skript oder Variablen
enth?lt, wird nicht verarbeitet.

Es gibt allerdings doch einen Weg, IPF Regeln mit Hilfe von Skripten und
Variablen zu erstellen. Weitere Informationen dazu finden Sie unter
`Abschnitt?32.5.9, „Die Erstellung eines Regelsatzes mit
Variablen“ <firewalls-ipf.html#firewalls-ipf-rules-script>`__.

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

32.5.5. IPFSTAT
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das normale Verhalten von
`ipfstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfstat&sektion=8>`__
ist, die Zusammenfassung der angefallenen Statistiken, die als Resultat
der Anwendung von nutzerspezifischen Regeln auf ein- und ausgehende
Pakete seit dem letzten Start der Firewall oder seit dem letzten
Zur?cksetzen der Z?hler auf Null durch das Kommando ``ipf -Z``
angesammelt wurden, abzurufen und anzuzeigen.

F?r weiterf?hrende Informationen schauen Sie bitte auf die Manpage von
`ipfstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfstat&sektion=8>`__!

Die Ausgabe von
`ipfstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfstat&sektion=8>`__,
wenn keine Parameter ?bergeben wurden, sieht etwa so aus:

.. code:: screen

    input packets: blocked 99286 passed 1255609 nomatch 14686 counted 0
    output packets: blocked 4200 passed 1284345 nomatch 14687 counted 0
    input packets logged: blocked 99286 passed 0
    output packets logged: blocked 0 passed 0
    packets logged: input 0 output 0
    log failures: input 3898 output 0
    fragment state(in): kept 0 lost 0
    fragment state(out): kept 0 lost 0
    packet state(in): kept 169364 lost 0
    packet state(out): kept 431395 lost 0
    ICMP replies: 0 TCP RSTs sent: 0
    Result cache hits(in): 1215208 (out): 1098963
    IN Pullups succeeded: 2 failed: 0
    OUT Pullups succeeded: 0 failed: 0
    Fastroute successes: 0 failures: 0
    TCP cksum fails(in): 0 (out): 0
    Packet log flags set: (0)

Wenn die Option ``-i`` f?r „eingehend“ oder ``-o`` f?r „ausgehend“
?bergeben wird, liefert das Kommando eine entsprechende Liste von
Filter-Regeln, die gerade installiert sind und vom Kernel verwendet
werden.

``ipfstat -in`` zeigt alle aktive Regeln f?r eingehende Verbindungen
zusammen mit ihren Nummern.

``ipfstat -on`` erledigt dasselbe f?r die ausgehenden Verbindungen.

Die Ausgabe sieht in etwa folgenderma?en aus:

.. code:: screen

    @1 pass out on xl0 from any to any
    @2 block out on dc0 from any to any
    @3 pass out quick on dc0 proto tcp/udp from any to any keep state

``ipfstat -ih`` zeigt die Tabelle der aktiven Regeln f?r eingehende
Verbindungen zusammen mit der Anzahl, wie oft jeder einzelnen Regel
entsprochen wurde.

``ipfstat -oh`` zeigt das Gleiche f?r die ausgehenden Verbindungen.

Hier wird die Ausgabe so oder so ?hnlich aussehen:

.. code:: screen

    2451423 pass out on xl0 from any to any
    354727 block out on dc0 from any to any
    430918 pass out quick on dc0 proto tcp/udp from any to any keep state

Einer der wichtigsten Funktionen von ``ipfstat`` wird ?ber die Option
``-t`` bereitgestellt. Mit ihr wird eine Statustabelle vergleichbar der
Prozess-Tabelle von
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
ausgegeben. Mit dieser Funktion erhalten Sie im Falle eines Angriffs die
M?glichkeit, die angreifenden Pakete zu identifizieren, abzufangen und
auszuwerten. Weitere Unteroptionen er?ffnen, die IP-Adresse, den Port
oder das Protokoll, geteilt nach Herkunft und Ziel, auszuw?hlen und dann
in Echtzeit zu beobachten. Lesen Sie dazu bitte auch die Manpage von
`ipfstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfstat&sektion=8>`__.

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

32.5.6. IPMON
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit der Befehl ``ipmon`` korrekt arbeiten kann, muss die Option
``IPFILTER_LOG`` in die Kernelkonfiguration eingearbeitet werden. Das
Kommando selbst arbeitet in zwei verschiedenen Modi. F?r den nativen
Modus startet man ``ipmon`` auf der Kommandozeile ohne die Option
``-D``.

Der Hintergrundmodus (``daemon mode``) dient der Erstellung eines
stetigen Systemprotokolls, so dass Eintr?ge vergangener Ereignisse
inspiziert werden k?nnen. So sollen FreeBSD und IPFILTER entsprechend
ihrer Konfiguration zusammen arbeiten. FreeBSD kann mit einem
eingebauten Mechanismus Systemprotokolle turnusm??ig abspeichern. Aus
diesem Grund sollte man besser
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
verwenden anstatt die Protokollinformationen in eine Datei zu schreiben,
wie es als Standard vorgesehen ist. In der Standard-\ ``rc.conf``-Datei
(im Ordner ``/etc/defaults/``) wird dem Eintrag ``ipmon_flags`` die
Option ``-Ds`` ?bergeben:

.. code:: programlisting

    ipmon_flags="-Ds" # D = Als Da:mon starten
    # s = Protokollierung via syslog
    # v = Protokollierung von tcp window, ack, seq
    # n = Namen statt IP & port ausgeben

Die Vorteile des Protokollierens liegen auf der Hand: Sie versetzen den
Administrator in die Lage, nach einem Vorfall Informationen abzurufen,
etwa welche Pakete aussortiert wurden, welche Adressen diese Pakete
gesendet haben oder wohin sie gesendet werden sollten. Alles in allem
erh?lt er ein sehr gutes Werkzeug zum Aufsp?ren von Angreifern.

Jedoch, auch wenn die Protokollierung aktiviert ist, wird IPF keine
einzige Regel zum Protokollieren von alleine entwerfen und umsetzen. Der
Administrator der Firewall entscheidet, welche Regeln in seinem
Regelsatz mitgeschrieben werden sollen und er muss dementsprechend das
Schl?sselword ``log`` in dieser Regel angeben. Normalerweise werden nur
Treffer auf abweisende Regeln protokolliert.

Es ist ?blich, als letzte Regel eine alles blockierende Regel mit dem
Schl?sselwort ``log`` in den Regelsatz einzutragen. Dadurch erkennt man
alle Pakete, die keiner Regel im Regelsatz entsprachen.

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

32.5.7. IPMON Logging
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Syslogd verwendet seine eigene Methode zum Sortieren der gesammtelten
Protokolldaten - spezielle Gruppierungen namens „facility“ und „level“.
IPMON verwendet im ``daemon``-Modus als „facility“ den Wert
``security``. Die folgenden „level“ k?nnen f?r eine genauere Trennung
der Protokolldaten verwendet werden:

.. code:: screen

    LOG_INFO - Alle zu protokollierenden Pakete
    LOG_NOTICE - Protokollierte Pakete, die passieren durften
    LOG_WARNING - Protokollierte Pakete, die blockiert wurden
    LOG_ERR - Protokollierte Pakete, deren Headerdaten nicht komplett vorlagen

Damit IPFILTER angewiesen werden kann, alle Protokolldaten in die Datei
``/var/log/ipfilter.log`` zu schreiben, muss diese erst erstellt werden.
Folgendes Kommando ?bernimmt diese Aufgabe:

.. code:: screen

    # touch /var/log/ipfilter.log

Die Funktionen von
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
werden durch Definition in der Datei ``/etc/syslog.conf`` gesteuert. In
dieser Datei kann sehr weitl?fig eingestellt werden, wie syslog mit den
Systemnachrichten umgehen soll, die ihm von Anwendungen wie IPF
?bergeben werden.

F?gen Sie folgende Definition in die Datei ``/etc/syslog.conf`` ein, um
die Protokollierung f?r IPF via ``syslog`` zu aktivieren:

.. code:: programlisting

    security.* /var/log/ipfilter.log

``security.*`` bedeutet, dass alle Nachrichten der Klasse ``security.*``
am angegebenen Ort (hier eine Datei) geschrieben werden sollen.

Um ?nderungen an der Datei ``/etc/syslog.conf`` zu aktivieren m?ssen Sie
den Rechner neu starten, oder den Befehl

.. code:: screen

    # /etc/rc.d/syslogd reload

ausf?hren.

Vergessen Sie nicht, ``/etc/newsyslog.conf`` anzupassen, damit die neuen
Protokolldateien, die eben konfiguriert wurden, auch in den
Rotationsturnus eingef?gt werden!

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

32.5.8. Die Formatierung der Logdatei
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachrichten, die durch ``ipmon`` erzeugt werden, bestehen aus durch
Leerstellen getrennten Datenfeldern. Folgende Felder sind in allen
Nachrichten enthalten:

.. raw:: html

   <div class="orderedlist">

#. Das Datum der Paketerstellung.

#. Die Uhrzeit der Paketerstellung in der Form ``HH:MM:SS.F``, mit
   Stunden, Minuten, Sekunden und Sekundenbruchteilen, wobei letztere
   mehrere Stellen lang sein k?nnen.

#. Der Name der Schnittstelle, die das Paket verarbeitet hat, bspw.
   ``dc0``.

#. Die Gruppe und die Nummer der angewandten Regel, bspw. ``@0:17``.

#. Die ausgef?hrte Aktion: p f?r ``passed`` (zugelassen), b f?r
   blockiert, S f?r ``short packet`` (unvollst?ndiger Header), n f?r
   ``no match`` (gar keine Regel wurde ber?hrt) und L f?r Log-Regel. Die
   Reihe, in der die Flags angezeigt werden ist: S, p, b, n, L. Ein gro?
   geschriebenes P oder B bedeutet, dass das Paket aufgrund einer
   globalen Einstellung protokolliert wurde und nicht wegen einer
   einzelnen Regel.

#. Die Adressen. Diese bestehen aus drei Feldern: Der Quelladresse mit
   Port (getrennt durch ein Komma), dem Symbol „->“ und der Zieladresse.
   Also bspw. ``209.53.15.22,80 -> 198.64.221.18,1722``.

#. ``PR`` gefolgt vom Namen eines Netzwerk-Protokolls oder dessen
   Nummer. Bspw. ``PR tcp``.

#. ``len`` gefolgt von der L?nge des Headers und der Gesamtl?nge des
   Paketes, beispielsweise ``len 20 40``.

.. raw:: html

   </div>

Wenn es sich um ein TCP-Paket handelt, wird ein weiteres Feld, beginnend
mit einem Querstrich und gefolgt von Buchstaben, die den gesetzten Flags
entsprechen, angezeigt. Lesen Sie bitte die Manpage
`ipmon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipmon&sektion=8>`__
f?r eine Liste der Buchstaben und deren Bedeutungen.

Falls das Paket ein ICMP-Paket ist, werden zwei Felder am Ende
hinzugef?gt - das erstere ist immer „ICMP“, das zweite enth?lt die
ICMP-Nachricht und den Nachrichtentyp, getrennt durch einen
Schr?gstrich. ``ICMP 3/3`` steht beispielsweise f?r „Port nicht
erreichbar“.

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

32.5.9. Die Erstellung eines Regelsatzes mit Variablen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Erfahrenere IPF Anwender erstellen sich eine Datei, die die Regeln
enth?lt und gestalten diese als ein Skript, in dem Variablen verwendet
werden. Der wichtigste Vorteil besteht darin, dass man lediglich den
Wert der Variablen anpassen muss und diese, sobald das Skript gestartet
wird, durch die entsprechenden Werte ersetzt und die Regeln entsprechend
formuliert werden. In Skripten kann man so h?ufig verwendete Werte
einfach als Variable in mehreren Regeln zuweisen. Am folgenden Beispiel
soll das verdeutlicht werden.

Die Syntax dieses Skriptes ist kompatibel mit den Shells
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__,
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__ und
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__.

Variablen beginnen mit einem Dollar-Zeichen: ``$Variablenname``. Im
Beispiel unten steht ``$oif`` f?r die Variable, in der der Name der
Schnittstelle abgelegt wird, ?ber die der Verkehr nach au?en erfolgt.

In Variablenzuweisungen fehlt das beginnende $-Zeichen. Alleine der Name
der Variable wird angegeben, gefolgt von einem Gleichheitszeichen, und
dem Wert, der der Variablen zugewiesen werden soll. Dieser muss in
doppelten Anf?hrungszeichen (``""``) stehen. Also folgt eine Zuweisung
dem Schema ``Variablenname = "Wert"``.

.. code:: programlisting

    ############# Start of IPF rules script ########################

    oif="dc0"            # Name der Internet-Schnittstelle
    odns="192.0.2.11"    # IP des DNS-Servers unseres ISPs
    myip="192.0.2.7"     # die statische IP, die uns der ISP zugeteilt hat
    ks="keep state"
    fks="flags S keep state"

    # Sie haben die Wahl, aus diesem Skript eine eigene
    # /etc/ipf.rules erstellen zu lassen oder es einfach
    # direkt als Skript laufen zu lassen.
    #
    # Entfernen Sie dazu das eine Kommentarzeichen
    # und kommentieren Sie die andere Zeile aus!
    #
    # 1) Diese Zeile verwenden Sie zur Erstellung von /etc/ipf.rules
    #cat > /etc/ipf.rules << EOF
    #
    # 2) Diese Zeile, wenn Sie direkt mit dem Skript arbeiten wollen
    /sbin/ipf -Fa -f - << EOF

    # Erlaubnis ausgehenden Verkehrs an den Nameserver des ISPs
    pass out quick on $oif proto tcp from any to $odns port = 53 $fks
    pass out quick on $oif proto udp from any to $odns port = 53 $ks

    # Erlaubnis ausgehenden unsicheren www-Verkehrs
    pass out quick on $oif proto tcp from $myip to any port = 80 $fks

    # Erlaubnis ausgehenden sicheren www-Verkehrs https via TLS SSL
    pass out quick on $oif proto tcp from $myip to any port = 443 $fks
    EOF
    ################## End of IPF rules script ########################

Das ist schon alles. Die Regeln selbst sind im Beispiel nicht so wichtig
- achten Sie auf die Anwendung der Variablenzuweisung am Anfang und die
Verwendung der Variablen im Skript. Falls das obige Beispiel in einer
Datei namens ``/etc/ipf.rules.script`` gespeichert wurde, k?nnen die
Regeln mit folgenden Kommando neu geladen werden:

.. code:: screen

    # sh /etc/ipf.rules.script

Es gibt ein Problem mit Regelsatz-Dateien, die Variablen verwenden: IPF
kann mit Variablen nichts anfangen - und kann derartige Skripte nicht
direkt einlesen.

Unser kleines Skript kann daher nur auf eine der beiden folgenden Weisen
verwendet werden:

.. raw:: html

   <div class="itemizedlist">

-  Entfernen Sie das Kommentarzeichen der Zeile, die mit ``cat``
   beginnt. Kommentieren Sie die Zeile aus, die mit ``/sbin/ipf``
   beginnt. Schreiben Sie die Zeile ``ipfilter_enable="YES"`` in die
   Datei ``/etc/rc.conf`` und rufen Sie dann das Skript auf, um
   ``/etc/ipf.rules`` zu erstellen oder zu erneuern.

-  Deaktivieren Sie IPFILTER in den Systemstart-Skripten, indem Sie die
   Zeile ``ipfilter_enable="NO"`` in die Datei ``/etc/rc.conf``
   eintragen (was auch der Standard-Einstellung entspricht).

   F?gen Sie ein Skript ?hnlich dem folgenden in Ihr Verzeichnis
   ``/usr/local/etc/rc.d/``. Es sinnvoll, dem Skript einen
   offensichtlichen Namen zu geben, wie etwa ``ipf.loadrules.sh``. Die
   Endung ``.sh`` ist dabei verbindlich.

   .. code:: programlisting

       #!/bin/sh
       sh /etc/ipf.rules.script

   Die Zugriffsrechte f?r die Datei, die das Skript enth?lt, m?ssen f?r
   den Eigent?mer ``root`` auf Lesen, Schreiben und Ausf?hren gesetzt
   werden.

   .. code:: screen

       # chmod 700 /usr/local/etc/rc.d/ipf.loadrules.sh

.. raw:: html

   </div>

Wenn nun Ihr System startet, werden Ihre IPF-Regeln geladen.

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

32.5.10. IPF Regels?tze
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Regelsatz ist eine Gruppe von IPF-Regeln, die anhand der Werte eines
Netzwerkpaketes entscheiden, ob dieses Paket durchgelassen oder
blockiert wird. Der Austausch von Paketen erfolgt immer zweiseitig in
Form einer sogenannten Session. Der Regelsatz der Firewall verarbeitet
sowohl die eingehenden Pakete aus dem ?ffentlichen Internet als auch die
Pakete, die vom System als Antwort auf die Ersteren gesendet werden.
Jeder Dienst, der via TCP/IP arbeitet, zum Beispiel ``telnet``, ``www``
oder ``mail``, ist vordefiniert durch sein Protokoll und seinen
privilegierten Port, an dem er auf Anfragen wartet und reagieren kann.
Pakete, die gezielt einen Dienst ansprechen sollen, werden von einem
unprivilegierten Port des Senders an einen konkreten privilegierten Port
des Zielsystems geschickt. Alle genannten Parameter (Ports, Adressen
usw.) k?nnen als Auswahlkriterien zum erstellen von Regeln eingesetzt
werden, die Dienste erlauben oder blockieren.

IPF wurde urspr?nglich mit einer Regel-Prozess-Logik geschrieben, die
ausschlie?lich statusfreie Regeln zulie? und nach dem Prinzip „die
letzte Regel, die passt, entscheidet“ arbeitete. Mit der Zeit erhielt
IPF eine ``quick`` Option sowie ``keep-state`` Option f?r die Anwendung
von zustandsorientierten Regeln, was die Regel-Prozess-Logik signifikant
modernisierte.

Die Anweisungen in diesem Kapitel basieren auf der Verwendung von
Regeln, die diese beiden neuen Optionen verarbeiten. Dies ist das
Framework zur Entwicklung eines Firewallregelsatzes.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Wenn Sie mit einer Firewall arbeiten, seien Sie *sehr vorsichtig*. Durch
wenige Einstellungen k?nnen Sie sich aus Ihrem System *aussperren*. Wenn
Sie auf der sicheren Seite sein wollen, f?hren Sie die
Firewall-Konfiguration direkt am entsprechenden Ger?t aus und nicht ?ber
eine Netzwerkverbindung wie bspw. ssh.

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

32.5.11. IPF Regel-Syntax
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Syntax zur Erstellung der Regeln, die hier vorgestellt wird, ist
dahingehend vereinfacht worden, dass sie ausschliesslich auf den
modernen Regelkontext, mit statusbehafteten Regeln und einer „die erste
Regel, die passt, gewinnt“-Logik, zur?ckgreift. Um alles ?ber die
veraltete Syntax zu erfahren, lesen Sie bitte die Man-Page von
`ipf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=8>`__.

Ein ``#``-Zeichen markiert den Beginn eines Kommentars. Es darf nach
nach einer Regel stehen oder als erstes Zeichen einer Zeile. Leere
Zeilen werden von der Regel-Prozess-Logik ignoriert.

Regeln enthalten Schl?sselw?rter. Diese Schl?sselw?rter m?ssen in einer
bestimmten Reihenfolge von links nach rechts in einer Zeile erscheinen.
Als solche identifizierte Schl?sselw?rter werden fett wiedergegeben.
Einige Schl?sselw?rter haben Unteroptionen, die wiederum selbst
Schl?sselw?rter sein und ebenfalls weiter Unteroptionen einschlie?en
k?nnen.

*``ACTION IN-OUT OPTIONS SELECTION STATEFUL PROTO         SRC_ADDR,DST_ADDR OBJECT PORT_NUM TCP_FLAG         STATEFUL``*

*``ACTION``* = block \| pass

*``IN-OUT``* = in \| out

*``OPTIONS``* = log \| quick \| on interface-name

*``SELECTION``* = proto value \| source/destination IP \| port = number
\| flags flag-value

*``PROTO``* = tcp/udp \| udp \| tcp \| icmp

*``SRC_ADD,DST_ADDR``* = all \| from object to object

*``OBJECT``* = IP address \| any

*``PORT_NUM``* = port number

*``TCP_FLAG``* = S

*``STATEFUL``* = keep state

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

32.5.11.1. ACTION
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die „ACTION“ bestimmt, was mit dem Paket passieren soll, wenn der Rest
der Regel zutrifft. Dieser Teil muss f?r jede Regel angegeben werden.

Das Schl?sselwort ``block`` gibt an, dass das Paket verfallen soll, wenn
die Auswahlparameter zutreffen.

Das Schl?sselwort ``pass`` gibt an, dass das Paket durch die Firewall
durchgelassen werden soll, wenn die Auswahlparameter zutreffen.

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

32.5.11.2. IN-OUT
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ebenfalls verbindlich ist die Angabe, welchen Teil der Verbindung, Ein-
oder Ausgang, die Regel beeinflussen soll. Das n?chste Schl?sselwort
muss daher entweder ``in``, f?r eingehend, oder ``out``, f?r ausgehend,
lauten - oder die Regel wird aufgrund eines Syntaxfehlers nicht
umgesetzt.

``in`` bedeutet, dass diese Regel auf eingehende Pakete angewendet wird,
die gerade an der dem ?ffentlichen Internet zugewandten Schnittstelle
empfangen wurden.

``out`` bedeutet, das diese Regel auf ausgehende Pakete angewendet wird,
also Pakete die gerade gesendet werden und deren Zieladresse im
?ffentlichen Internet liegt.

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

32.5.11.3. OPTIONS
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Optionen m?ssen in der hier aufgef?hrten Reihenfolge verwendet
werden.

.. raw:: html

   </div>

``log`` bestimmt, dass die Kopfdaten des Paketes an die
Systemschnittstelle
`ipl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipl&sektion=4>`__
geschrieben werden sollen. Genaueres dazu weiter unten im Abschnitt
LOGGING.

``quick`` bestimmt, dass, *wenn* die Auswahlkriterien der Regel auf das
Paket zutreffen, keine weiteren Regeln ausgewertet werden. So vermeidet
man das Abarbeiten des gesamten Regelsatzes. Diese Option ist eine
verbindliche Vorraussetzung der modernen Regel-Prozess-Logik.

``on`` bestimmt den Namen der Schnittstelle, der als Auswahlkriterium
hinzugef?gt werden soll. Die Namen aller verf?gbaren Schnittstellen
werden durch den Befehl
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
angezeigt. wenn man diese Option verwendet, passt die Regeln nur auf
Pakete, die durch diese Schnittstelle empfangen (``in``) oder gesendet
(``out``) wurden. F?r die modernisierte Regel-Prozess-Logik ist die
Verwendung dieser Option verbindlich.

Wenn ein Paket protokolliert wird, werden die Kopfdaten in die
Pseudo-Schnittstelle
`ipl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipl&sektion=4>`__
geschrieben. Folgende Parameter k?nnen zus?tzlich ?bergeben werden,
m?ssen dazu aber direkt nach dem Schl?sselwort ``log`` und in gleicher
Reihenfolge stehen:

``body`` bestimmt, dass die ersten 128 Bytes des Paketinhaltes
zus?tzlich zu den Kopfdaten protokolliert werden.

``first`` trifft nur zu, wenn das Schl?sselwort ``log`` zusammen mit
``keep-state`` verwendet wird. Es bestimmt, dass nur das ausl?sende
Paket protokolliert wird und nicht jedes weitere Paket, dass von der
gespeicherten Status-Regel betroffen ist.

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

32.5.11.4. SELECTION
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Schl?sselw?rter, die in diesem Abschnitt vorgestellt werden, dienen
zur Beschreibung von Attributen, anhand derer gepr?ft und entschieden
wird, ob eine Regel zutrifft oder nicht. Es gibt ein Schl?sselwort, und
das hat mehrere Optionen, von denen eine ausgew?hlt werden muss. Die
folgenden allgemeinen Attribute k?nnen beliebig zum Erstellen einer
Regel verwendet werden, allerdings nur in der vorgestellten Reihenfolge:

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

32.5.11.5. PROTO
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``proto`` ist das Schl?sselwort f?r das im Paket angewendete Protokoll.
Als Option ein Protokoll aus Auswahlkriterium ?bergeben. Diese Option
ist verbindlich, wenn man die moderne Regel-Prozess-Logik verwendet.

``tcp/udp | udp | tcp | icmp`` oder irgendein Protokollname, der in der
Datei ``/etc/protocols`` zu finden ist, kann ?bergeben werden. Au?erdem
kann das Schl?sselwort ``tcp/udp`` verwendet werden, wenn sowohl TCP als
auch UDP von der Regel betroffen sein sollen. Dieses Schl?sselwort wurde
eingef?hrt, um Duplikate sonst identischer Regeln zu vermeiden.

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

32.5.11.6. SRC\_ADDR/DST\_ADDR
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Schl?sselwort ``all`` ist ein Synonym f?r „from any to any“ ohne
weitere Auswahlkriterien.

``from src to dst``: Die Schl?sselw?rter ``from`` und ``to`` dienen zur
Angabe von Quelle und Ziel in Form von IP-Adressen oder -Bereichen.
Innerhalb einer Regel muss immer beides angegeben werden. Statt einer
Adresse kann auch das Schl?sselwort ``any`` ?bergeben werden, das f?r
jede beliebige IP-Adresse steht. Zum Beispiel: ``from any to any`` oder
``from 0.0.0.0/0 to any`` oder ``from any to 0.0.0.0/0`` oder
``from 0.0.0.0 to any`` oder ``from any to 0.0.0.0`` bedeuten alle das
Gleiche.

IP-Bereiche k?nnen nur in der CIDR-Notation angegeben werden. Der Port
`net-mgmt/ipcalc <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/ipcalc/pkg-descr>`__
hilft Ihnen bei der Berechnung der richtigen Angaben. Weiterf?hrende
Informationen zu CIDR finden Sie auf der Webseite von
```ipcalc`` <http://www.rfc-editor.org/rfc/rfc1519.txt>`__.

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

32.5.11.7. PORT
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ein Port als Auswahlkriterium ?bergeben wurde, bei Quelle und/oder
Ziel, wird er nur bei TCP und UDP Paketen verwendet. Angegeben werden
kann entweder die Portnummer oder der Dienstname aus ``/etc/services``.
Die Verwendung der Portoption mit dem ``to``-Objekt ist verbindlich f?r
die Verwendung der modernisierten Regel-Prozess-Logik. Ein Beispiel f?r
die Filterung Paketen von allen Quell-IPs mit beliebiger Portnummer auf
beliebige Ziel-IPs mit der Portnummer 80 (dem ``www``-Port):
``from any to any port = 80``.

Einfache Portvergleiche k?nnen auf verschiedenen Wegen erfolgen. Mehrere
Vergleichsoperatoren stehen daf?r zur Verf?gung. Genauso k?nnen Bereiche
angegeben werden.

port "=" \| "!=" \| "<" \| ">" \| "<=" \| ">=" \| "eq" \| "ne" \| "lt"
\| "gt" \| "le" \| "ge".

Um einen Bereich anzugeben: port "<>" \| "><"

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Genau wie die Trefferspezifikation f?r Quelle und Ziel sind auch die
beiden folgenden Parameter obligatorisch bei der Verwendung der modernen
Regel-Prozess-Logik.

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

32.5.11.8. TCP\_FLAG
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Flags spielen nur beim Filtern von TCP eine Rolle. Die Buchstaben
entsprechen jeweils einem m?glichen Flag, dass in den Kopfdaten der
TCP-Pakete geprueft werden soll.

Die moderne Regel-Prozess-Logik verwendet den Parameter ``flags S`` um
eine Anfrage zum Start einer TCP-Session zu identifizieren.

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

32.5.11.9. STATEFUL
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``keep state`` zeigt bei einer Passage-Regel an, dass f?r alle Pakete,
die die Selektion erfolgreich durchlaufen, ``Stateful Filtering``
eingerichtet werden soll.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Diese Option ist obligatorisch f?r die Verwendung der modernen
Prozess-Regel-Logik.

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

32.5.12. Stateful Filtering
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stateful filtering treats traffic as a bi-directional exchange of
packets comprising a session conversation. When activated, keep-state
dynamically generates internal rules for each anticipated packet being
exchanged during the bi-directional session conversation. It has
sufficient matching capabilities to determine if the session
conversation between the originating sender and the destination are
following the valid procedure of bi-directional packet exchange. Any
packets that do not properly fit the session conversation template are
automatically rejected as impostors.

Keep state will also allow ICMP packets related to a TCP or UDP session
through. So if you get ICMP type 3 code 4 in response to some web
surfing allowed out by a keep state rule, they will be automatically
allowed in. Any packet that IPF can be certain is part of an active
session, even if it is a different protocol, will be let in.

What happens is:

Packets destined to go out through the interface connected to the public
Internet are first checked against the dynamic state table. If the
packet matches the next expected packet comprising an active session
conversation, then it exits the firewall and the state of the session
conversation flow is updated in the dynamic state table. Packets that do
not belong to an already active session, are simply checked against the
outbound ruleset.

Packets coming in from the interface connected to the public Internet
are first checked against the dynamic state table. If the packet matches
the next expected packet comprising an active session conversation, then
it exits the firewall and the state of the session conversation flow is
updated in the dynamic state table. Packets that do not belong to an
already active session, are simply checked against the inbound ruleset.

When the conversation completes it is removed from the dynamic state
table.

Stateful filtering allows you to focus on blocking/passing new sessions.
If the new session is passed, all its subsequent packets will be allowed
through automatically and any impostors automatically rejected. If a new
session is blocked, none of its subsequent packets will be allowed
through. Stateful filtering has technically advanced matching abilities
capable of defending against the flood of different attack methods
currently employed by attackers.

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

32.5.13. Inclusive Ruleset Example
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following ruleset is an example of how to code a very secure
inclusive type of firewall. An inclusive firewall only allows services
matching ``pass`` rules through, and blocks all others by default.
Firewalls intended to protect other machines, also called „network
firewalls“, should have at least two interfaces, which are generally
configured to trust one side (the LAN) and not the other (the public
Internet). Alternatively, a firewall might be configured to protect only
the system it is running on—this is called a „host based firewall“, and
is particularly appropriate for servers on an untrusted network.

All UNIX? flavored systems including FreeBSD are designed to use
interface ``lo0`` and IP address ``127.0.0.1`` for internal
communication within the operating system. The firewall rules must
contain rules to allow free unmolested movement of these special
internally used packets.

The interface which faces the public Internet is the one to place the
rules that authorize and control access of the outbound and inbound
connections. This can be your user PPP ``tun0`` interface or your NIC
that is connected to your DSL or cable modem.

In cases where one or more NICs are cabled to private network segments,
those interfaces may require rules to allow packets originating from
those LAN interfaces transit to each other and/or to the outside
(Internet).

The rules should be organized into three major sections: first trusted
interfaces, then the public interface outbound, and last the public
untrusted interface inbound.

The rules in each of the public interface sections should have the most
frequently matched rules placed before less commonly matched rules, with
the last rule in the section blocking and logging all packets on that
interface and direction.

The Outbound section in the following ruleset only contains ``pass``
rules which contain selection values that uniquely identify the service
that is authorized for public Internet access. All the rules have the
``quick``, ``on``, ``proto``, ``port``, and ``keep state`` options set.
The ``proto     tcp`` rules have the ``flag`` option included to
identify the session start request as the triggering packet to activate
the stateful facility.

The Inbound section has all the blocking of undesirable packets first,
for two different reasons. The first is that malicious packets may be
partial matches for legitimate traffic. These packets have to be
discarded rather than allowed in, based on their partial matches against
``allow`` rules. The second reason is that known and uninteresting
rejects may be blocked silently, rather than being caught and logged by
the last rules in the section. The final rule in each section, blocks
and logs all packets and can be used to create the legal evidence needed
to prosecute the people who are attacking your system.

Another thing that should be taken care of, is to ensure there is no
response returned for any of the undesirable traffic. Invalid packets
should just get dropped and vanish. This way the attacker has no
knowledge if his packets have reached your system. The less the
attackers can learn about your system, the more time they must invest
before actually doing something bad. Rules that include a ``log first``
option, will only log the event the first time they are triggered. This
option is included in the sample ``nmap OS fingerprint`` rule. The
`security/nmap <http://www.freebsd.org/cgi/url.cgi?ports/security/nmap/pkg-descr>`__
utility is commonly used by attackers who attempt to identify the
operating system of your server.

Any time there are logged messages on a rule with the ``log first``
option, an ``ipfstat -hio`` command should be executed to evaluate how
many times the rule has actually matched. Large number of matches
usually indicate that the system is being flooded (i.e.: under attack).

The ``/etc/services`` file may be used to lookup unknown port numbers.
Alternatively, visit
``http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers`` and do
a port number lookup to find the purpose of a particular port number.

Check out this link for port numbers used by Trojans
``http://www.sans.org/security-resources/idfaq/oddports.php``.

The following ruleset creates a complete and very secure ``inclusive``
type of firewall ruleset that has been tested on production systems. It
can be easily modified for your own system. Just comment out any
``pass`` rules for services that should not be authorized.

To avoid logging unwanted messages, just add a ``block`` rule in the
inbound section.

The ``dc0`` interface name has to be changed in every rule to the real
interface name of the NIC card that connects your system to the public
Internet. For user PPP it would be ``tun0``.

Add the following statements to ``/etc/ipf.rules``:

.. code:: programlisting

    #################################################################
    # No restrictions on Inside LAN Interface for private network
    # Not needed unless you have LAN
    #################################################################

    #pass out quick on xl0 all
    #pass in quick on xl0 all

    #################################################################
    # No restrictions on Loopback Interface
    #################################################################
    pass in quick on lo0 all
    pass out quick on lo0 all

    #################################################################
    # Interface facing Public Internet (Outbound Section)
    # Match session start requests originating from behind the
    # firewall on the private network
    # or from this gateway server destined for the public Internet.
    #################################################################

    # Allow out access to my ISP's Domain name server.
    # xxx must be the IP address of your ISP's DNS.
    # Dup these lines if your ISP has more than one DNS server
    # Get the IP addresses from /etc/resolv.conf file
    pass out quick on dc0 proto tcp from any to xxx port = 53 flags S keep state
    pass out quick on dc0 proto udp from any to xxx port = 53 keep state

    # Allow out access to my ISP's DHCP server for cable or DSL networks.
    # This rule is not needed for 'user ppp' type connection to the
    # public Internet, so you can delete this whole group.
    # Use the following rule and check log for IP address.
    # Then put IP address in commented out rule & delete first rule
    pass out log quick on dc0 proto udp from any to any port = 67 keep state
    #pass out quick on dc0 proto udp from any to z.z.z.z port = 67 keep state


    # Allow out non-secure standard www function
    pass out quick on dc0 proto tcp from any to any port = 80 flags S keep state

    # Allow out secure www function https over TLS SSL
    pass out quick on dc0 proto tcp from any to any port = 443 flags S keep state

    # Allow out send & get email function
    pass out quick on dc0 proto tcp from any to any port = 110 flags S keep state
    pass out quick on dc0 proto tcp from any to any port = 25 flags S keep state

    # Allow out Time
    pass out quick on dc0 proto tcp from any to any port = 37 flags S keep state

    # Allow out nntp news
    pass out quick on dc0 proto tcp from any to any port = 119 flags S keep state

    # Allow out gateway & LAN users' non-secure FTP ( both passive & active modes)
    # This function uses the IPNAT built in FTP proxy function coded in
    # the nat rules file to make this single rule function correctly.
    # If you want to use the pkg_add command to install application packages
    # on your gateway system you need this rule.
    pass out quick on dc0 proto tcp from any to any port = 21 flags S keep state

    # Allow out ssh/sftp/scp (telnet/rlogin/FTP replacements)
    # This function is using SSH (secure shell)
    pass out quick on dc0 proto tcp from any to any port = 22 flags S keep state

    # Allow out insecure Telnet
    pass out quick on dc0 proto tcp from any to any port = 23 flags S keep state

    # Allow out FreeBSD CVSup
    pass out quick on dc0 proto tcp from any to any port = 5999 flags S keep state

    # Allow out ping to public Internet
    pass out quick on dc0 proto icmp from any to any icmp-type 8 keep state

    # Allow out whois from LAN to public Internet
    pass out quick on dc0 proto tcp from any to any port = 43 flags S keep state

    # Block and log only the first occurrence of everything
    # else that's trying to get out.
    # This rule implements the default block
    block out log first quick on dc0 all

    #################################################################
    # Interface facing Public Internet (Inbound Section)
    # Match packets originating from the public Internet
    # destined for this gateway server or the private network.
    #################################################################

    # Block all inbound traffic from non-routable or reserved address spaces
    block in quick on dc0 from 192.168.0.0/16 to any    #RFC 1918 private IP
    block in quick on dc0 from 172.16.0.0/12 to any     #RFC 1918 private IP
    block in quick on dc0 from 10.0.0.0/8 to any        #RFC 1918 private IP
    block in quick on dc0 from 127.0.0.0/8 to any       #loopback
    block in quick on dc0 from 0.0.0.0/8 to any         #loopback
    block in quick on dc0 from 169.254.0.0/16 to any    #DHCP auto-config
    block in quick on dc0 from 192.0.2.0/24 to any      #reserved for docs
    block in quick on dc0 from 204.152.64.0/23 to any   #Sun cluster interconnect
    block in quick on dc0 from 224.0.0.0/3 to any       #Class D & E multicast

    ##### Block a bunch of different nasty things. ############
    # That I do not want to see in the log

    # Block frags
    block in quick on dc0 all with frags

    # Block short tcp packets
    block in quick on dc0 proto tcp all with short

    # block source routed packets
    block in quick on dc0 all with opt lsrr
    block in quick on dc0 all with opt ssrr

    # Block nmap OS fingerprint attempts
    # Log first occurrence of these so I can get their IP address
    block in log first quick on dc0 proto tcp from any to any flags FUP

    # Block anything with special options
    block in quick on dc0 all with ipopts

    # Block public pings
    block in quick on dc0 proto icmp all icmp-type 8

    # Block ident
    block in quick on dc0 proto tcp from any to any port = 113

    # Block all Netbios service. 137=name, 138=datagram, 139=session
    # Netbios is MS/Windows sharing services.
    # Block MS/Windows hosts2 name server requests 81
    block in log first quick on dc0 proto tcp/udp from any to any port = 137
    block in log first quick on dc0 proto tcp/udp from any to any port = 138
    block in log first quick on dc0 proto tcp/udp from any to any port = 139
    block in log first quick on dc0 proto tcp/udp from any to any port = 81

    # Allow traffic in from ISP's DHCP server. This rule must contain
    # the IP address of your ISP's DHCP server as it's the only
    # authorized source to send this packet type. Only necessary for
    # cable or DSL configurations. This rule is not needed for
    # 'user ppp' type connection to the public Internet.
    # This is the same IP address you captured and
    # used in the outbound section.
    pass in quick on dc0 proto udp from z.z.z.z to any port = 68 keep state

    # Allow in standard www function because I have apache server
    pass in quick on dc0 proto tcp from any to any port = 80 flags S keep state

    # Allow in non-secure Telnet session from public Internet
    # labeled non-secure because ID/PW passed over public Internet as clear text.
    # Delete this sample group if you do not have telnet server enabled.
    #pass in quick on dc0 proto tcp from any to any port = 23 flags S keep state

    # Allow in secure FTP, Telnet, and SCP from public Internet
    # This function is using SSH (secure shell)
    pass in quick on dc0 proto tcp from any to any port = 22 flags S keep state

    # Block and log only first occurrence of all remaining traffic
    # coming into the firewall. The logging of only the first
    # occurrence avoids filling up disk with Denial of Service logs.
    # This rule implements the default block.
    block in log first quick on dc0 all
    ################### End of rules file #####################################

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

32.5.14. NAT
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NAT stands for *Network Address Translation*. To those familiar with
Linux?, this concept is called IP Masquerading; NAT and IP Masquerading
are the same thing. One of the many things the IPF NAT function enables
is the ability to have a private Local Area Network (LAN) behind the
firewall sharing a single ISP assigned IP address on the public
Internet.

You may ask why would someone want to do this. ISPs normally assign a
dynamic IP address to their non-commercial users. Dynamic means that the
IP address can be different each time you dial in and log on to your
ISP, or for cable and DSL modem users, when the modem is power cycled.
This dynamic IP address is used to identify your system to the public
Internet.

Now lets say you have five PCs at home and each one needs Internet
access. You would have to pay your ISP for an individual Internet
account for each PC and have five phone lines.

With NAT only a single account is needed with your ISP. The other four
PCs may then be cabled to a switch and the switch to the NIC in your
FreeBSD system which is going to service your LAN as a gateway. NAT will
automatically translate the private LAN IP address for each separate PC
on the LAN to the single public IP address as it exits the firewall
bound for the public Internet. It also does the reverse translation for
returning packets.

There is a special range of IP addresses reserved for NATed private
LANs. According to RFC 1918, the following IP ranges may be used for
private nets which will never be routed directly to the public Internet:

.. raw:: html

   <div class="informaltable">

+----------------------------+-----+---------------------------------+
| Start IP ``10.0.0.0``      | -   | Ending IP ``10.255.255.255``    |
+----------------------------+-----+---------------------------------+
| Start IP ``172.16.0.0``    | -   | Ending IP ``172.31.255.255``    |
+----------------------------+-----+---------------------------------+
| Start IP ``192.168.0.0``   | -   | Ending IP ``192.168.255.255``   |
+----------------------------+-----+---------------------------------+

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

32.5.15. IPNAT
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NAT rules are loaded by using the ``ipnat`` command. Typically the NAT
rules are stored in ``/etc/ipnat.rules``. See
`ipnat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ipnat&sektion=1>`__
for details.

When changing the NAT rules after NAT has been started, make your
changes to the file containing the NAT rules, then run the ``ipnat``
command with the ``-CF`` flags to delete the internal in use NAT rules
and flush the contents of the translation table of all active entries.

To reload the NAT rules issue a command like this:

.. code:: screen

    # ipnat -CF -f /etc/ipnat.rules

To display some statistics about your NAT, use this command:

.. code:: screen

    # ipnat -s

To list the NAT table's current mappings, use this command:

.. code:: screen

    # ipnat -l

To turn verbose mode on, and display information relating to rule
processing and active rules/table entries:

.. code:: screen

    # ipnat -v

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

32.5.16. IPNAT Rules
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NAT rules are very flexible and can accomplish many different things to
fit the needs of commercial and home users.

The rule syntax presented here has been simplified to what is most
commonly used in a non-commercial environment. For a complete rule
syntax description see the
`ipnat(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ipnat&sektion=5>`__
manual page.

The syntax for a NAT rule looks something like this:

.. code:: programlisting

    map IF LAN_IP_RANGE -> PUBLIC_ADDRESS

The keyword ``map`` starts the rule.

Replace *``IF``* with the external interface.

The *``LAN_IP_RANGE``* is what your internal clients use for IP
Addressing, usually this is something like ``192.168.1.0/24``.

The *``PUBLIC_ADDRESS``* can either be the external IP address or the
special keyword ``0/32``, which means to use the IP address assigned to
*``IF``*.

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

32.5.17. How NAT works
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A packet arrives at the firewall from the LAN with a public destination.
It passes through the outbound filter rules, NAT gets its turn at the
packet and applies its rules top down, first matching rule wins. NAT
tests each of its rules against the packet's interface name and source
IP address. When a packet's interface name matches a NAT rule then the
source IP address (i.e.: private LAN IP address) of the packet is
checked to see if it falls within the IP address range specified to the
left of the arrow symbol on the NAT rule. On a match the packet has its
source IP address rewritten with the public IP address obtained by the
``0/32`` keyword. NAT posts an entry in its internal NAT table so when
the packet returns from the public Internet it can be mapped back to its
original private IP address and then passed to the filter rules for
processing.

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

32.5.18. Enabling IPNAT
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To enable IPNAT add these statements to ``/etc/rc.conf``.

To enable your machine to route traffic between interfaces:

.. code:: programlisting

    gateway_enable="YES"

To start IPNAT automatically each time:

.. code:: programlisting

    ipnat_enable="YES"

To specify where to load the IPNAT rules from:

.. code:: programlisting

    ipnat_rules="/etc/ipnat.rules"

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

32.5.19. NAT for a very large LAN
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For networks that have large numbers of PC's on the LAN or networks with
more than a single LAN, the process of funneling all those private IP
addresses into a single public IP address becomes a resource problem
that may cause problems with the same port numbers being used many times
across many NATed LAN PC's, causing collisions. There are two ways to
relieve this resource problem.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

32.5.19.1. Assigning Ports to Use
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A normal NAT rule would look like:

.. code:: programlisting

    map dc0 192.168.1.0/24 -> 0/32

In the above rule the packet's source port is unchanged as the packet
passes through IPNAT. By adding the ``portmap`` keyword, IPNAT can be
directed to only use source ports in the specified range. For example
the following rule will tell IPNAT to modify the source port to be
within the range shown:

.. code:: programlisting

    map dc0 192.168.1.0/24 -> 0/32 portmap tcp/udp 20000:60000

Additionally we can make things even easier by using the ``auto``
keyword to tell IPNAT to determine by itself which ports are available
to use:

.. code:: programlisting

    map dc0 192.168.1.0/24 -> 0/32 portmap tcp/udp auto

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

32.5.19.2. Using a Pool of Public Addresses
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In very large LANs there comes a point where there are just too many LAN
addresses to fit into a single public address. If a block of public IP
addresses is available, these addresses can be used as a „pool“, and
IPNAT may pick one of the public IP addresses as packet-addresses are
mapped on their way out.

For example, instead of mapping all packets through a single public IP
address, as in:

.. code:: programlisting

    map dc0 192.168.1.0/24 -> 204.134.75.1

A range of public IP addresses can be specified either with a netmask:

.. code:: programlisting

    map dc0 192.168.1.0/24 -> 204.134.75.0/255.255.255.0

or using CIDR notation:

.. code:: programlisting

    map dc0 192.168.1.0/24 -> 204.134.75.0/24

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

32.5.20. Port Redirection
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A very common practice is to have a web server, email server, database
server and DNS server each segregated to a different PC on the LAN. In
this case the traffic from these servers still have to be NATed, but
there has to be some way to direct the inbound traffic to the correct
LAN PCs. IPNAT has the redirection facilities of NAT to solve this
problem. For example, assuming a web server operating on LAN address
``10.0.10.25`` and using a single public IP address of ``20.20.20.5``
the rule would be coded as follows:

.. code:: programlisting

    rdr dc0 20.20.20.5/32 port 80 -> 10.0.10.25 port 80

or:

.. code:: programlisting

    rdr dc0 0.0.0.0/0 port 80 -> 10.0.10.25 port 80

or for a LAN DNS Server on LAN address of ``10.0.10.33`` that needs to
receive public DNS requests:

.. code:: programlisting

    rdr dc0 20.20.20.5/32 port 53 -> 10.0.10.33 port 53 udp

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

32.5.21. FTP and NAT
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FTP is a dinosaur left over from the time before the Internet as it is
known today, when research universities were leased lined together and
FTP was used to share files among research Scientists. This was a time
when data security was not a consideration. Over the years the FTP
protocol became buried into the backbone of the emerging Internet and
its username and password being sent in clear text was never changed to
address new security concerns. FTP has two flavors, it can run in active
mode or passive mode. The difference is in how the data channel is
acquired. Passive mode is more secure as the data channel is acquired by
the ordinal ftp session requester. For a real good explanation of FTP
and the different modes see ``http://www.slacksite.com/other/ftp.html``.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

32.5.21.1. IPNAT Rules
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPNAT has a special built in FTP proxy option which can be specified on
the NAT map rule. It can monitor all outbound packet traffic for FTP
active or passive start session requests and dynamically create
temporary filter rules containing only the port number really in use for
the data channel. This eliminates the security risk FTP normally exposes
the firewall to from having large ranges of high order port numbers
open.

This rule will handle all the traffic for the internal LAN:

.. code:: programlisting

    map dc0 10.0.10.0/29 -> 0/32 proxy port 21 ftp/tcp

This rule handles the FTP traffic from the gateway:

.. code:: programlisting

    map dc0 0.0.0.0/0 -> 0/32 proxy port 21 ftp/tcp

This rule handles all non-FTP traffic from the internal LAN:

.. code:: programlisting

    map dc0 10.0.10.0/29 -> 0/32

The FTP map rule goes before our regular map rule. All packets are
tested against the first rule from the top. Matches on interface name,
then private LAN source IP address, and then is it a FTP packet. If all
that matches then the special FTP proxy creates temp filter rules to let
the FTP session packets pass in and out, in addition to also NATing the
FTP packets. All LAN packets that are not FTP do not match the first
rule and fall through to the third rule and are tested, matching on
interface and source IP, then are NATed.

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

32.5.21.2. IPNAT FTP Filter Rules
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Only one filter rule is needed for FTP if the NAT FTP proxy is used.

Without the FTP Proxy, the following three rules will be needed:

.. code:: programlisting

    # Allow out LAN PC client FTP to public Internet
    # Active and passive modes
    pass out quick on rl0 proto tcp from any to any port = 21 flags S keep state

    # Allow out passive mode data channel high order port numbers
    pass out quick on rl0 proto tcp from any to any port > 1024 flags S keep state

    # Active mode let data channel in from FTP server
    pass in quick on rl0 proto tcp from any to any port = 20 flags S keep state

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+----------------------------------+---------------------------------------+
| `Zur?ck <firewalls-pf.html>`__?                 | `Nach oben <firewalls.html>`__   | ?\ `Weiter <firewalls-ipfw.html>`__   |
+-------------------------------------------------+----------------------------------+---------------------------------------+
| 32.4. Paket Filter (PF) von OpenBSD und ALTQ?   | `Zum Anfang <index.html>`__      | ?32.6. IPFW                           |
+-------------------------------------------------+----------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
