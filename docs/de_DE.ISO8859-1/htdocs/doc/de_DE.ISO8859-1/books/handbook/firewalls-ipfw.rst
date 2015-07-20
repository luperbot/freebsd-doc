==========
32.6. IPFW
==========

.. raw:: html

   <div class="navheader">

32.6. IPFW
`Zur?ck <firewalls-ipf.html>`__?
Kapitel 32. Firewalls
?\ `Weiter <advanced-networking.html>`__

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

32.6. IPFW
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die *IPFIREWALL* (IPFW) ist eine vom FreeBSD Project gesponserte
Software-Firewall. Sie wurde und wird freiwillig von Mitgliedern des
FreeBSD Projects geschrieben und gewartet. Mit zustandslosen Regeln und
einer Grammatik f?r Regeln implementiert sie eine sogenannte „Einfache
Zustandsgesteuerte Logik“.

Die Standardinstallation von IPFW enth?lt einen beispielhaften Regelsatz
(``/etc/rc.firewall`` und ``/etc/rc.firewall6``). Dieser ist eher
einfach gehalten; es ist nicht zu erwarten, dass dieser ohne
Modifikationen angewandt werden kann. Dieses Beispiel nutzt keine
zustandsorientierte Filterung, von der allerdings die meisten
Installationen profitieren sollten. Deshalb wird sich dieser Abschnitt
auch nicht auf diese Beispiele st?tzen.

Die zustandslose IPFW Regel-Syntax ist durch ihre technisch ausgefeilten
Selektions-F?higkeiten, die ?ber das Niveau der gebr?chlichen
Firewall-Installationsprogramme weit hinausgehen, sehr m?chtig. IPFW
richtet sich an professionelle oder technisch versierte Nutzer mit
weitergehenden Anforderungen an die Paket-Auswahl. Um die
Ausdrucksst?rke der IPFW zu nutzen, ist sehr detailliertes Wissen ?ber
die Art und Weise, wie verschiedene Protokolle ihre jeweilige
Paket-Header-Information erzeugen und nutzen, erforderlich. Im Rahmen
dieses Abschnitts ist es nicht m?glich, auf alle diese Punkte
detailliert einzugehen.

IPFW besteht aus sieben Komponenten: Hauptbestandteil ist der Kernel
Firewall Filter, ein Regel-Prozessor mit integrierter Paket-Buchf?hrung.
Au?erdem enthalten ist eine Komponente zur Protokollierung der
Aktivit?ten der Firewall (also ein Logfunktion). Weiters besteht die
IPFW aus einer Regel zum Umleiten des Datenverkehrs (``divert``), die
auch Network Address Translation (NAT) unterst?tzt. Die restlichen
Bestandteile dienen verschiedenen fortgeschrittenen Zwecken. Der
*Traffic Shaper*
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
gestattet es beispielsweise, den Datenverkehr zu lenken, w?hrend die
``fwd``-Regel zum Weiterleiten von Datenpaketen dient. Komplettiert wird
IPFW durch Funktionen zum ?berbr?cken von Netzwerkgrenzen
(*Bridge*-Funktion) sowie *ipstealth*, das es gestattet,
bridging-Funktionen durchzuf?hren, ohne dabei das TTL-Feld im IP-Paket
zu erh?hen. IPFW unterst?tzt IPv4 und IPv6.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

32.6.1. IPFW aktivieren
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPFW ist in der FreeBSD-Installation standardm??ig als ein zur Laufzeit
ladbares Kernelmodul enthalten, das vom System automatisch geladen wird,
wenn in der Datei ``rc.conf`` die Option ``firewall_enable="YES"``
gesetzt wird. Es ist daher nicht notwendig, IPFW statisch in den Kernel
zu kompilieren.

W?hrend des Systemstart wird bei gesetzter Option
``firewall_enable="YES"`` (in der Datei ``rc.conf``) folgende Nachricht
ausgegeben:

.. code:: screen

    ipfw2 initialized, divert disabled, rule-based forwarding disabled, default to deny, logging disabled

Das Kernelmodul hat eine Protokollierungsfunktion. Um diese zu
aktivieren und einen Schwellwert f?r die Protokollierung zu definieren,
ist es erforderlich, folgende Ausdr?cke der ``/etc/sysctl.conf``
hinzuzuf?gen:

.. code:: programlisting

    net.inet.ip.fw.verbose=1
    net.inet.ip.fw.verbose_limit=5

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

32.6.2. Kerneloptionen
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist f?r die Aktivierung von IPFW nicht zwingend erforderlich, die
folgenden Optionen in den Kernel zu kompilieren. Es wird hier lediglich
als Hintergrundinformation aufgef?hrt.

.. code:: programlisting

    options IPFIREWALL

Diese Option aktiviert IPFW als Bestandteil des Kernels.

.. code:: programlisting

    options IPFIREWALL_VERBOSE

Diese Option aktiviert die Funktion, alle Pakete, die durch IPFW
verarbeitet werden und bei denen das Schl?sselwort ``log`` gesetzt ist,
zu protokollieren.

.. code:: programlisting

    options IPFIREWALL_VERBOSE_LIMIT=5

Diese Option limitiert die Anzahl der durch
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
protokollierten Pakete auf das angegebene Maximum. Sie wird in
feindlichen Umgebungen verwandt, in denen die Protokollierung der
Firewall-Aktivit?t erw?nscht ist. Dadurch wird ein m?glicher
Denial-of-Service-Angriff durch ?berflutung von
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
verhindert.

.. code:: programlisting

    options IPFIREWALL_DEFAULT_TO_ACCEPT

Diese Option erlaubt allen Paketen, die Firewall zu passieren. Diese
Einstellung kann beispielsweise bei der ersten Konfiguration der
Firewall hilfreich sein.

.. code:: programlisting

    options IPDIVERT

Dies aktiviert die Nutzung der NAT-Funktionalit?t.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Firewall wird alle eingehenden oder ausgehenden Pakete blockieren,
wenn entweder die Kernel-Option ``IPFIREWALL_DEFAULT_TO_ACCEPT`` fehlt
oder aber keine Regel, die die betreffenden Verbindungen explizit
gestattet, existiert. Dies enstpricht im Wesentlichen der Einstellung
„default to deny“

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

32.6.3. Optionen in ``/etc/rc.conf``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Eintrag

.. code:: programlisting

    firewall_enable="YES"

aktiviert die Firewall w?hrend des Systemstarts.

Die Auswahl einer f?r FreeBSD verf?gbaren Firewall erfolgt durch einen
entsprechenden Eintrag in der Datei ``/etc/rc.firewall``, durch den der
Firewalltyp festgelegt wird.

.. code:: programlisting

    firewall_type="open"

Konkret sind folgende Eintr?ge erlaubt:

.. raw:: html

   <div class="itemizedlist">

-  ``open`` — gestattet jeglichen Datenverkehr

-  ``client`` — sch?tzt nur die jeweilige Maschine (Client/Mandant)

-  ``simple`` — sch?tzt das gesamte Netzwerk

-  ``closed`` — unterbindet jeglichen IP-Datenverkehr mit Ausnahme des
   Verkehrs ?ber die Loopback-Schnittstelle.

-  ``UNKNOWN`` — deaktiviert das Laden von Firewallregeln

-  ``filename`` — absoluter Pfad zu einer Datei, in der die
   Firewallregeln definiert sind

.. raw:: html

   </div>

Angepasste Regeln f?r
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
k?nnen auf zwei verschiedene Arten geladen werden. Einerseits kann man
durch die Variable ``firewall_type`` den absoluten Pfad der Datei
angeben, welche die *Firewallregeln* (ohne weitere Optionen) f?r
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
enth?lt. Ein einfaches Beispiel f?r einen Regelsatz, der jeglichen
eingehenden und ausgehenden Datenverkehr blockiert, k?nnte
beispielsweise so aussehen:

.. code:: programlisting

    add deny in add deny out

Andererseits ist es m?glich, den Wert der ``firewall_type``-Variable mit
dem absoluten Pfad einer Datei zu belegen, die (als ausf?hrbares Skript)
die
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__-Kommandos
enth?lt, die beim Booten ausgef?hrt werden sollen. Ein g?ltiges Skript
(das die gleiche Funktion hat wie die Zeile im letzten Beispiel) k?nnte
beispielsweise so aussehen:

.. code:: programlisting

    #!/bin/sh

    ipfw -q flush

    ipfw add deny in
    ipfw add deny out

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn die Variable ``firewall_type`` entweder auf ``client`` oder
``simple`` gesetzt ist, sollten die Standardregeln in der Datei
``/etc/rc.firewall`` gepr?ft und an die Konfiguration der gegebenen
Maschine angepasst werden. Beachten Sie dabei bitte, dass die Beispiele
dieses Kapitels davon ausgehen, dass das ``firewall_script`` auf
``/etc/ipfw.rules`` gesetzt ist.

.. raw:: html

   </div>

Das Logging wird durch folgenden Eintrag aktiviert:

.. code:: programlisting

    firewall_logging="YES"

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Die Variable ``firewall_logging`` definiert lediglich die
sysctl-Variable als ``net.inet.ip.fw.verbose = 1`` (lesen Sie dazu bitte
auch den Abschnitt `Abschnitt?32.6.1, „IPFW
aktivieren“ <firewalls-ipfw.html#firewalls-ipfw-enable>`__ des
Handbuchs). Es gibt keine ``rc.conf``-Variable, mit der man
Protokollierungsschwellen setzen k?nnte. Dies kann lediglich ?ber
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
geschehen, wobei Sie in der Datei ``/etc/sysctl.conf`` nur Werte > 1
angeben sollten:

.. code:: programlisting

    net.inet.ip.fw.verbose_limit=5

.. raw:: html

   </div>

Sollte Ihre Maschinen als Gateway fungieren (also mittels
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
*Network Address Translation* (NAT) durchf?hren), finden Sie weitere
Optionen in ``/etc/rc.conf``.

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

32.6.4. Der Befehl IPFW
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
ist es m?glich, im laufenden Betrieb einzelne Regeln hinzuzuf?gen oder
zu entfernen. Problematisch ist allerdings, dass diese ?nderungen
verloren gehen, wenn das System neu gestartet wird. Daher ist es
empfehlenswert, eigene Regeln in einer Datei zu definieren und diese zu
laden, um die Regeln der Firewall im laufenden Betrieb anzupassen.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
ist jedoch hilfreich, um die Regeln der laufenden Firewall in der
Konsole auszugeben. IPFW erzeugt dynamisch einen Z?hler, der jedes
Paket, auf das eine Regel zutrifft, z?hlt. Dadurch wird es m?glich, die
Funktion einer Regel zu ?berpr?fen.

Eine sequentielle Liste aller Regeln erhalten Sie mit:

.. code:: screen

    # ipfw list

Eine Liste aller Regeln inklusive des letzten Treffers erhalten Sie
durch den folgenden Befehl:

.. code:: screen

    # ipfw -t list

Um eine Liste aller Regeln inklusive der Anzahl der Pakete, die von
einer Regel gefiltert wurden, zu erhalten, geben Sie den folgenden
Befehl ein:

.. code:: screen

    # ipfw -a list

Eine Liste, die zus?tzlich allen dynamischen Regeln enth?lt, erhalten
Sie mit:

.. code:: screen

    # ipfw -d list

Um diese Liste um alle „abgelaufenen“ Regeln zu erweitern, ?dern Sie
diesen Befehl wie folgt ab:

.. code:: screen

    # ipfw -d -e list

Alle Z?hler auf Null zur?cksetzen:

.. code:: screen

    # ipfw zero

Es ist auch m?glich, einen spezifischen Z?hler auszuw?hlen und
zur?ckzusetzen:

.. code:: screen

    # ipfw zero NUM

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

32.6.5. IPFW-Regeln
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Regelwerk ist eine Menge von IPFW-Regeln, die in Abh?ngigkeit von
bestimmten Paketeigenschaften Pakete entweder passieren lassen oder
abweisen. Der zustandshafte bidirektionale Transfer von Paketen zwischen
Rechnern wird als Sitzung bezeichnet. Das Regelwerk der Firewall
verarbeitet sowohl ankommende Pakete (aus dem ?ffentlichen Internet) als
auch Pakete, deren Ursprung in einer Antwort des Systems auf empfangene
Pakete liegt. Jeder TCP/IP-Dienst (wie telnet, www, mail) ist durch sein
Protokoll und durch den priveligierten (eingehenden) Port definiert. An
einen spezifischen Dienst adressierte Pakete kommen von einer
Quelladresse und einem unprivilegierten (high order) Port. Sie
adressieren den spezifischen Port des Dienstes an der Zieladresse. Alle
weiter oben aufgef?hrten Parameter (also Ports und Adressen) k?nnen als
Selektionskriterium zur Erzeugung von Regeln genutzt werden, die ein
Passieren der Firewall f?r oder ein Blockieren von Diensten bewirken.

Wenn ein Paket die Firewall „betritt“, also von der Firewall gepr?ft und
verarbeitet wird, wird die erste Regel des Regelwerkes auf das Paket
angewandt. Auf diese Weise wird in aufsteigender Reihenfolge der
Regelnummer mit allen weiteren Regeln verfahren. Falls die
Selektionsparameter einer Regel auf ein Paket zutreffen, wird das
Aktionsfeld der Regel ausgef?hrt und die Pr?fung des Pakets beendet,
nachfolgende Regeln werden also nicht mehr gepr?ft. Diese Suchmethode
wird als „erster Treffer gewinnt“ bezeichnet. Falls keine Regel auf das
betreffende Paket zutrifft, wird die obligatorische IPFW-R?ckfallregel
(also Regel 65535) angewendet und das Paket wird ohne R?ckantwort
verworfen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Pr?fung der Regeln wird nach Treffern von mit ``count``, ``skipto``
und ``tee`` parametrisierten Regeln ungeachtet des „erster Treffer
gewinnt“-Prinzips weiter fortgef?hrt.

.. raw:: html

   </div>

Die Anweisungen basieren auf der Nutzung von Regeln mit den
zustandsgesteuerten Optionen ``keep``, ``state``, ``limit``, ``in`` und
``out``. Diese bilden die Basis f?r die Spezifikation von
Firewallregeln.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Bei der Arbeit mit Firewallregeln ist Vorsicht geboten. Es ist sehr
einfach, sich selbst auszuschlie?en.

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

32.6.5.1. Syntax der Firewallregeln
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit der in diesem Abschnitt dargestellten Syntax der Regeln kann ein
Standardregelsatz f?r eine „einschlie?ende“ Firewall erstellt werden.
F?r eine vollst?ndige Beschreibung der Regelsyntax lesen Sie bitte die
Manualpage
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__

Regelausdr?cke werden „von links nach rechts“ ausgewertet.
Schl?sselw?rter werden in fetter Schrift dargestellt. Manche
Schl?sselworte beinhalten Unteroptionen, die wiederum selbst aus
Schl?sselworten samt Optionen bestehen k?nnen.

Kommentare sind mit einen f?hrenden Doppelkreuz (``#``) ausgezeichnet.
Sie k?nnen am Ende einer Regel oder in einzelnen, separaten Zeilen
stehen. Leerzeilen werden ignoriert.

*``CMD RULE_NUMBER ACTION LOGGING SELECTION       STATEFUL``*

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

32.6.5.1.1. CMD
'''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jede neue Regel ben?tigt das Pr?fix ``add``, um die Regel der internen
Tabelle hinzuzf?gen.

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

32.6.5.1.2. RULE\_NUMBER
''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zu jeder Regel geh?rt eine Regelnummer zwischen 1 und 65535.

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

32.6.5.1.3. ACTION
''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Regel kann mit einer der vier folgenden Aktionen verbunden sein,
die ausgef?hrt werden, wenn ein Paket den Selektionskriterien der Regel
entspricht.

*``allow | accept | pass | permit``*

Alle diese Aktionen bewirken das Gleiche: Pakete, die den
Selektionskriterien der Regel entsprechen, verlassen den
Regelpr?fungsabschnitt der Firewall und die Regelpr?fung wird beendet.

*``check-state``*

Diese Aktion pr?ft das Paket gegen die Regeln aus den dynamischen
Regeltabellen. Trifft ein Selektionskriterium zu, wird die zur
dynamischen Regel geh?rende Aktion ausgef?hrt. Anderenfalls wird gegen
die n?chste Regel gepr?ft. Die ``check-state``-Regel selbst hat kein
Selektionskriterium. Sollte eine ``check-state``-Regel im Regelwerk
fehlen, wird gegen die erste ``keep-state``- oder ``limit``-Regel in den
dynamischen Regeln gepr?ft.

*``deny | drop``*

Beide Schl?sselworte bewirken dieselbe Aktion: Ein Paket, dass die
Selektionskriterien der Regel erf?llt, wird verworfen und die
Regelpr?fung wird beendet.

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

32.6.5.1.4. Protokollierung
'''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*``log``* oder *``logamount``*

Erf?llt ein Paket die Selektionskriterien mit dem Schl?sselwort ``log``,
wird dies von
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
mit der Annotation SECURITY protokolliert. Dies erfolgt allerdings nur,
wenn die Anzahl der protokollierten Pakete der betreffenden Regel die im
``logamount``-Parameter definierte Schwelle nicht ?bersteigt. Ist der
Parameter ``logamount`` nicht definiert, wird diese Grenze aus der
``sysctl``-Variable ``net.inet.ip.fw.verbose_limit`` ermittelt. Ist
einer dieser beiden Werte auf „Null“ gesetzt, wird unbegrenzt
protokolliert. Wurde hingegen ein definierter Schwellenwert erreicht,
wird die Protokollierung deaktiviert. Um sie zu reaktivieren, k?nnen Sie
entweder den Protokoll- oder den Paketz?hler r?cksetzen (und zwar ?ber
den Befehl ``ipfw reset log``).

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Protokollierung findet statt, nachdem alle Paketselektionskriterien
gepr?ft und bevor die daraus folgende, endg?ltige Aktion (``accept``
oder ``deny``) auf das Paket ausgef?hrt wird. Die Entscheidung, welche
Regel protokolliert werden soll, bleibt Ihnen ?berlassen.

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

32.6.5.1.5. Selektion
'''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die in diesem Abschnitt beschriebenen Schl?sselw?rter beschreiben die
Attribute eines Pakets, durch die bestimmt wird, ob eine Regel auf ein
Paket zutrifft. Die folgenden Attribute dienen der Bestimmung des
Protokolls und m?ssen in der angegebenen Reihenfolge verwendet werden.

*``udp | tcp | icmp``*

Weitere in ``/etc/protocols`` angegebene Protokolle werden ebenfalls
erkannt und k?nnen daher verwendet werden, um das Protokoll zu
definieren, gegen das Pakete gepr?ft werden. Die Angabe des Protokolls
ist verpflichtend.

*``from src to dst``*

Die Schl?sselw?rter ``from`` und ``to`` beziehen sich auf IP-Adressen
und definieren sowohl Ursprungs- als auch Zieladresse einer
Datenverbindung. Firewallregeln m?ssen Parameter f?r den Ursprung *und*
das Ziel enthalten. Das Schl?sselwort ``any`` steht f?r beliebige
IP-Adressen. Bei ``me`` handelt es sich um ein spezielles Schl?sselwort,
das alle IP-Adressen beschreibt, die einer bestimmten
Netzwerkschnittstelle Ihres Systems (auf dem die Firewall l?uft)
zugeordnet sind. Beispiele hierf?r sind ``from me to any``,
``from any to me``, ``from 0.0.0.0/0 to any ``,
``from any to 0.0.0.0/0``, ``from 0.0.0.0 to any``,
``from any to 0.0.0.0`` oder ``from me to 0.0.0.0``. IP-Adressen werden
entweder in CIDR-Notation oder durch Punkte getrennt mit Suffixen
(``192.168.2.101/24``) f?r die Netzmaske oder als einzelne numerische,
durch Punkte getrennte Adressen (``192.168.2.101``) angegeben. Die daf?r
notwendigen Berechnungen erleichtert der Port
`net-mgmt/ipcalc <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/ipcalc/pkg-descr>`__.
Weiterf?hrende Informationen finden sich auf
``http://jodies.de/ipcalc``.

*``port number``*

Bei der Verarbeitung von Protokollen wie TCP oder UDP, die Portnummern
verwenden, muss die Portnummer des betreffenden Dienstes angegeben
werden. Anstelle der Portnummer kann auch der in der Datei
``/etc/services`` definierte Name des Dienstes angegeben werden.

*``in | out``*

Diese Schl?sselw?rter beziehen sich auf die Richtung des Datenverkehrs.
Jede Regel *muss* eines dieser beiden Schl?sselw?rter enthalten.

*``via IF``*

Eine Regel mit dem Schl?sselwort ``via IF`` betrifft nur Pakete, die
?ber die angegebene Schnittstellte geroutet werden (ersetzen Sie ``IF``
durch den Namen Ihrer Netzwerkschnittstelle). Die Angabe des
Schl?sselwortes ``via`` bewirkt, dass die Netzwerkschnittstelle in die
Regelpr?fung aufgenommen wird.

*``setup``*

Dieses obligatorische Schl?sselwort bezeichnet die Anforderung des
Sitzungsstarts f?r TCP-Pakete.

*``keep-state``*

Dieses obligatorische Schl?sselwort bewirkt, dass die Firewall eine
dynamische Regel erzeugt, die bidirektionalen Datenverkehr zwischen
Ursprungs- und Zieladresse sowie Ursprungs- und Zielport pr?ft, der das
gleiche Protokoll verwendet.

*``limit {src-addr | src-port | dst-addr |           dst-port}``*

Wird das Schl?sselwort ``limit`` verwendet, sind nur ``N`` durch diese
Regel definierte Verbindungen erlaubt. Es k?nnen dabei ein oder mehrere
Ursprungs- und Zieladressen sowie ein oder mehrere Ports angegeben
werden. Die Schl?sselw?rter ``limit`` und ``keep-state`` k?nnen nicht in
derselben Regel verwendet werden. Die Option ``limit`` bewirkt dieselbe
Zustandsteuerung wie die Option ``keep-state``, erweitert diese jedoch
um eigene Regeln.

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

32.6.5.2. Optionen f?r zustandsgesteuerte Regeln
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine zustandsgesteuerte Filterung behandelt Datenverkehr als einen
bidirektionalen Austausch von Datenpaketen (die eine sogenannte
Konversation innerhalb einer Sitzung darstellen). Sie ist in der Lage,
zu bestimmen, ob die Konversation von origin?rem Sender und Empf?nger
g?ltigen Prozeduren des bidirektionalen Pakettausches entspricht.
Pakete, die dem Muster von Konversationen in Sitzungen nicht folgen,
werden automatisch als „Betr?ger“ abgelehnt.

Die ``check-state``-Option wird verwendet, wo genau innerhalb des
IPFW-Regelwerks die Pr?fung dynamischer Regeln stattfinden soll. Erf?llt
ein Datenpaket die Selektionskriterien der Regel, verl?sst das Paket die
Firewall. Gleichzeitig wird eine neue dynamische Regel erzeugt, die f?r
das n?chste Paket der bidirektionalen Konversation in der Sitzung
vorgesehen ist. Falls ein Paket die (dyanmische) Regel nicht erf?llt,
wird es gegen die n?chste Regel im Regelwerk gepr?ft.

Dynamische Regeln sind f?r einem sogenannten *SYN-flood*-Angriff
anf?llig, bei dem eine riesige Anzahl „schwebender“ dynamischer
Regelpr?fungungsinstanzen erzeugt wird. Um einem solchen Angriff zu
begegnen, wurde in FreeBSD die neue Option ``limit`` geschaffen. Diese
Option begrenzt die Anzahl der gleichzeitig m?glichen Sitzungen und/oder
Konversationen. Es handelt sich dabei um einen Z?hler, der die Anzahl
von Instanzen dynamischer Regelpr?fungen in Abh?ngigkeit von einer
eindeutigen Urspungs- und Quelladresskombination z?hlt. ?bersteigt der
Z?hler den durch ``limit`` definierten Schwellenwert, wird das Paket
verworfen.

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

32.6.5.3. Protokollierung von Firewall-Nachrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Vorteile einer Protokollierung sind offensichtlich. Sie erm?glicht
nach Aktivierung von Regeln zu untersuchen, welche Pakete verworfen
wurden, von wo diese stammen und f?r welche Systeme sie bestimmt waren.
Diese Informationen sind sehr n?tzlich bei der Erkennung eventueller
Angriffe sowie bei deren Abwehr.

IPFW protokolliert nur jene Regeln, f?r die ein Administrator dies
explizit aktiviert. Ein Aktivieren der Protolllfunktion f?hrt also nicht
dazu, dass automatisch alle Regeln protokolliert werden. Vielmehr
entscheidet der Administrator der Firewall, welche Regeln protokolliert
werden sollen. Dazu wird die Option ``log`` f?r diese Regeln aktiviert.
Im Regelfall werden nur ``deny``-Regeln protokolliert, beispielsweise
die ``deny``-Regel f?r eintreffende ICMP-Nachrichten. ?blicherweise wird
die „ipfw default deny everything“-Regel doppelt angelegt. Einmal mit
und einmal ohne aktivierte Option ``log``. Dadurch erh?lt man eine
Auflistung aller Pakete, auf die keine Regel zutraf.

Protokollierung ist allerdings ein zweischneidiges Schwert, bei
mangelnder Vorsicht wird man mit einer enormen Flut von
Protokollierungsdaten f?rmlich *?berschwemmt* und belastet zus?tzlich
die Festplatte des Systems durch rasch wachsende Protokolldateien.
DoS-Angriffe, die auf diese Art und Weise Festplatten an die
Kapazit?tsgrenze treiben, geh?ren zu den ?ltesten Angriffen ?berhaupt.
Au?erdem werden Protokollnachrichten nicht nur an
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
geschickt, sondern auch auf einem root-Terminal angezeigt.

Die Kerneloption ``IPFIREWALL_VERBOSE_LIMIT=5`` begrenzt die Anzahl
gleicher Nachrichten an
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
f?r eine gegebene Regel auf f?nf Nachrichten. Ist diese Option im Kernel
aktiviert, wird nach Erreichen der festgelegten Anzahl die
Protokollierung einer (sich unmittelbar hintereinander wiederholenden)
Nachricht auf den angegebenen Schwellenwert begrenzt, da beispielsweise
die Speicherung von 200 gleichen Protokollnachrichten durch
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
sinnlos ist. Daher werden durch diesen nur f?f derartige Nachrichten
protokolliert. Alle weiteren derartigen Nachrichten werden nur gez?hlt
und deren Gesamtzahl wird schlie?lich von
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
durch folgenden Ausdruck ausgegeben:

.. code:: programlisting

    last message repeated 45 times

Alle protokollierten Nachrichten f?r Datenpakete werden in der
Voreinstellung in die Datei ``/var/log/security`` (die in der Datei
``/etc/syslog.conf`` definiert wird), geschrieben.

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

32.6.5.4. Skripte zur Regeldefinition erstellen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die meisten fortgeschrittenen IPFW-Nutzer erzeugen eine Datei, die die
Regeln f?r die Firewall enth?lt, um diese als Skript ausf?hren zu
k?nnen. Der Hauptvorteil einer derartigen Konfiguration ist es, dass
dadurch mehrere Regeln gleichzeitig ge?ndert und (re-)aktiviert werden
k?nnen, ohne dass dazu das System neu gestartet werden muss. Dies ist
auch beim Testen von Regel?nderungen sehr hilfreich. Weil es sich bei
der Datei, in der die Regeln gespeichert sind, um ein Skript handelt,
ist es auch m?glich, h?ufig verwendete Werte/Befehle durch Aliase zu
ersetzen und diese so in mehreren Regeln zu nutzen. Diese Funktion wird
im folgenden Beispiel n?her vorgestellt.

Die Syntax des folgenden Skripts entspricht der Syntax von
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__,
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__
sowie
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__.
Felder, die symbolisch substituiert werden, haben das Pr?fix $ (das
Dollarzeichen). Symbolische Felder haben dieses $-Praefix nicht. Der
Wert, mit dem das symbolische Feld belegt wird, muss in „doppelten
Anf?hrungszeichen“ eingeschlossen sein.

Beginnen Sie Ihre Regeldatei wie folgt:

.. code:: programlisting

    ############### start of example ipfw rules script #############
    #
    ipfw -q -f flush       # Delete all rules
    # Set defaults
    oif="tun0"             # out interface
    odns="192.0.2.11"      # ISP's DNS server IP address
    cmd="ipfw -q add "     # build rule prefix
    ks="keep-state"        # just too lazy to key this each time
    $cmd 00500 check-state
    $cmd 00502 deny all from any to any frag
    $cmd 00501 deny tcp from any to any established
    $cmd 00600 allow tcp from any to any 80 out via $oif setup $ks
    $cmd 00610 allow tcp from any to $odns 53 out via $oif setup $ks
    $cmd 00611 allow udp from any to $odns 53 out via $oif $ks
    ################### End of example ipfw rules script ############

Die Regeln in diesem Beispiel sind nicht wichtig. Wichtig ist es, zu
zeigen, wie die symbolische Substitution innerhalb der Regeln verwendet
wird.

Wurde dieses Beispiel in der Datei ``/etc/ipfw.rules`` gespeichert, so
k?nnen alle Regeln durch die Ausf?hrung des folgenden Befehls neu
geladen werden:

.. code:: screen

    # sh /etc/ipfw.rules

Statt ``/etc/ipfw.rules`` k?nnen Sie auch einen beliebigen anderen Namen
und/oder Speicherort verwenden.

Alternativ k?nnten Sie die einzelnen Befehle dieses Skripts auch manuell
starten:

.. code:: screen

    # ipfw -q -f flush
    # ipfw -q add check-state
    # ipfw -q add deny all from any to any frag
    # ipfw -q add deny tcp from any to any established
    # ipfw -q add allow tcp from any to any 80 out via tun0 setup keep-state
    # ipfw -q add allow tcp from any to 192.0.2.11 53 out via tun0 setup keep-state
    # ipfw -q add 00611 allow udp from any to 192.0.2.11 53 out via tun0 keep-state

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

32.6.5.5. Zustandsgesteuertes Regelwerk
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das folgende Regelwerk (ohne NAT-Funktionalit?t) ist ein Beispiel daf?r,
wie man eine sehr sichere „einschlie?ende“ Firewall aufsetzen kann. Eine
einschlie?ende Firewall erlaubt es nur Diensten, f?r die explizite
Regeln existieren, die Firewall zu passieren. Alle anderen Dienste und
Pakete werden hingegen blockiert. Firewalls, die ganze Netzwerksegmente
sch?tzen sollen, ben?tigen mindestens zwei Netzwerkschnittstellen, f?r
die jeweils eigene Regeln definiert werden m?ssen, damit die Firewall
ordnungsgem?? funktioniert.

Alle unixoiden Betriebssysteme (aber auch solche, die Konzepte aus UNIX?
implementieren), darunter auch FreeBSD, verwenden die Schnittstelle
``lo0`` mit der IP-Adresse ``127.0.0.1`` zur internen Kommunikation mit
dem Betriebssystem. Die Firewall muss so eingestellt sein, dass sie den
Datenverkehr dieser speziellen (und nur intern genutzten) Pakete
ungehindert durchl?sst.

Die Regeln, die den Zugriff auf eingehene und ausgehende Verbindungen
regeln, autorisieren und kontrollieren, m?ssen mit der f?r die
Verbindung zum ?ffentlichen Internet verantwortlichen Schnittstelle
assoziiert werden. Bei dieser Schnittstelle kann es sich beispielsweise
um PPP/\ ``tun0`` oder die Netzwerkkarte handelt, ?ber, die mit Ihrem
DSL- oder Kabelmodem verbunden ist.

Falls mehr als eine Netzwerkkarte mit einem privaten Netzwerk (hinter
der Firewall) verbunden sind, m?ssen die Firewallregeln f?r alle diese
Schnittstellen entstammenden Datenpakete freien und ungehinderten
Datenverkehr erlauben.

Es ist sinnvoll, die Regeln in drei Abschnitte aufzuteilen. Der erste
Abschnitt enth?lt die freien, von der Firewall nicht zu ?berwachenden
Netzwerkschnittstellen. Danach folgen die ?ffentlichen, f?r den
ausgehenden Verkehr verantwortlichen Schnittstellen. Zuletzt kommen dann
die Schnittstellen, die f?r den eingehenden Datenverkehr verantwortlich
sind.

Innerhalb der einzelnen Abschnitte ist es sinnvoll, die am h?ufigsten
verwendeten Regeln vor den seltener verwendeten Regel zu platzieren.
Jeder Abschnitt sollte mit einer letzten Regel (die alle Pakete, auf die
keine Regel zutraf, verwirft) abgeschlossen werden.

Der Abschnitt f?r den ausgehenden Datenverkehr des folgenden Beispiels
enth?t nur ``allow``)-Regeln, in denen der Dienst, dem der Zugriff auf
das ?ffentliche Internet gew?hrt wird, eindeutig definiert ist. Alle
Regeln verwenden die Optionen ``proto``, ``port``, ``in/out``, ``via``
sowie ``keep state`` kodiert. Die Regeln mit ``proto tcp`` verwenden
zus?tzlich die Option ``setup``, damit die initiale, eine Sitzung
beginnende Anfrage identifiziert werden kann, damit die die
Zustandsttabelle gef?llt werden kann.

Der Abschnitt f?r den eingehenden Datenverkehr beginnt mit allen Regeln,
die zur Blockierung unerw?nschten Datenverkehrs ben?tigt werden. F?r
diese Vorgehensweise gibt es zwei Gr?nde: Zum einen k?nnten b?sartige
Pakete legtitimen Datenverker so sehr ?hneln, dass sie die Bedingungen
von ``allow``-Regeln erf?llen und daher die Firewall passieren d?rfen.
Daher sollten derartige Pakete direkt verworden werden. Zum anderen
sollten unerw?nschte Pakete mit bekannten (und somit uninteressanten
Mustern) sofort ohne R?ckmeldung blockiert werden, anstatt erst von der
letzten, generischen Regel blockiert (und, was noch wichtiger ist, auch
noch protokolliert). Die letzte Regel jedes Abschnittes blockiert und
protokolliert; sie kann daher dazu verwendet werden, vor Gericht
haltbare Beweise zu erhalten, damit sie gegen Personen vorgehen k?nnen,
die versuchen, Ihre Systeme anzugreifen.

Achten Sie darauf, dass Sie keine Netwerkantworten f?r geblockte Pakete
senden. Diese m?ssen ohne R?ckmeldung verworfen werden, damit ein
Angreifer keine Informationen dar?ber erh?lt, ob seine Datenpakete Ihr
System erreicht hat. Je weniger Information ein Angreifer ?ber Ihr
System erh?lt, desto sicherer ist Ihr System. Datenpakete an Ports, die
nicht bekannten Diensten zugeordnet werden k?nnen, k?nnen ?ber die Datei
``/etc/services`` identifiziert werden. Alternativ kann eine Anfrage an
``http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers``
Klarheit ?ber die Aufgabe/Funktion einer bestimmten Portnummer bringen.
Auf der Seite
``http://www.sans.org/security-resources/idfaq/oddports.php`` kann man
Information ?ber bekannte Trojaner und von diesen verwendete Portnummern
erhalten.

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

32.6.5.6. Ein Beispiel f?r einschlie?ende Regeln
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das folgende Regelwerk (ohne NAT-Funktionalit?t) beschreibt ein
vollst?ndiges, einschlie?endes Regelwerk. Dieses Regelwerk kann direkt
auf Ihren eigenen Systemen eingesetzt werden, wenn alle ``pass``-Regeln
f?r von Ihnen nicht ben?tigten Dienste auskommentiert werden. Falls Sie
keine Protokollierung ben?tigen, k?nnen Sie diese im Abschnitt f?r den
eingehenden Datenverkehr durch eine ``deny`` deaktivieren. Die im
Beispiel verwendete Netzwerkschnittstelle ``dc0`` m?ssen Sie durch die
auf Ihrem System f?r ausgehenden Datenverkehr vorgesehenen
Netzwerkschnittstelle ersetzen. Im Falle von benutzergesteuertem PPPs
w?re dies beispielsweise ``tun0``.

Alle Regeln folgen einem bestimmten Muster.

.. raw:: html

   <div class="itemizedlist">

-  Alle Ausdr?cke, die eine Anfrage zum Beginn einer zustandsgesteuerten
   darstellen, beinhalten den Ausdruck ``keep-state``.

-  Alle Dienste aus dem ?ffentlichen Internet beinhalten die Option
   ``limit``, um gegebenenfalls *flooding* zu unterbinden.

-  Alle Regeln bezeichnen die Richtung durch der Ausdr?cke ``in`` oder
   ``out``.

-  Alle Regeln legen die verwendete Netzwerkschnittstelle die Ausdr?cke
   ``via`` und *``interface-name``* fest.

.. raw:: html

   </div>

Die folgenden Regeln werden in der Datei ``/etc/ipfw.rules`` definiert.

.. code:: programlisting

    ################ Start of IPFW rules file ###############################
    # Flush out the list before we begin.
    ipfw -q -f flush

    # Set rules command prefix
    cmd="ipfw -q add"
    pif="dc0"     # public interface name of NIC
                  # facing the public Internet

    #################################################################
    # No restrictions on Inside LAN Interface for private network
    # Not needed unless you have LAN.
    # Change xl0 to your LAN NIC interface name
    #################################################################
    #$cmd 00005 allow all from any to any via xl0

    #################################################################
    # No restrictions on Loopback Interface
    #################################################################
    $cmd 00010 allow all from any to any via lo0

    #################################################################
    # Allow the packet through if it has previous been added to the
    # the "dynamic" rules table by a allow keep-state statement.
    #################################################################
    $cmd 00015 check-state

    #################################################################
    # Interface facing Public Internet (Outbound Section)
    # Interrogate session start requests originating from behind the
    # firewall on the private network or from this gateway server
    # destined for the public Internet.
    #################################################################

    # Allow out access to my ISP's Domain name server.
    # x.x.x.x must be the IP address of your ISP.s DNS
    # Dup these lines if your ISP has more than one DNS server
    # Get the IP addresses from /etc/resolv.conf file
    $cmd 00110 allow tcp from any to x.x.x.x 53 out via $pif setup keep-state
    $cmd 00111 allow udp from any to x.x.x.x 53 out via $pif keep-state

    # Allow out access to my ISP's DHCP server for cable/DSL configurations.
    # This rule is not needed for .user ppp. connection to the public Internet.
    # so you can delete this whole group.
    # Use the following rule and check log for IP address.
    # Then put IP address in commented out rule & delete first rule
    $cmd 00120 allow log udp from any to any 67 out via $pif keep-state
    #$cmd 00120 allow udp from any to x.x.x.x 67 out via $pif keep-state

    # Allow out non-secure standard www function
    $cmd 00200 allow tcp from any to any 80 out via $pif setup keep-state

    # Allow out secure www function https over TLS SSL
    $cmd 00220 allow tcp from any to any 443 out via $pif setup keep-state

    # Allow out send & get email function
    $cmd 00230 allow tcp from any to any 25 out via $pif setup keep-state
    $cmd 00231 allow tcp from any to any 110 out via $pif setup keep-state

    # Allow out FBSD (make install & CVSUP) functions
    # Basically give user root "GOD" privileges.
    $cmd 00240 allow tcp from me to any out via $pif setup keep-state uid root

    # Allow out ping
    $cmd 00250 allow icmp from any to any out via $pif keep-state

    # Allow out Time
    $cmd 00260 allow tcp from any to any 37 out via $pif setup keep-state

    # Allow out nntp news (i.e. news groups)
    $cmd 00270 allow tcp from any to any 119 out via $pif setup keep-state

    # Allow out secure FTP, Telnet, and SCP
    # This function is using SSH (secure shell)
    $cmd 00280 allow tcp from any to any 22 out via $pif setup keep-state

    # Allow out whois
    $cmd 00290 allow tcp from any to any 43 out via $pif setup keep-state

    # deny and log everything else that.s trying to get out.
    # This rule enforces the block all by default logic.
    $cmd 00299 deny log all from any to any out via $pif

    #################################################################
    # Interface facing Public Internet (Inbound Section)
    # Check packets originating from the public Internet
    # destined for this gateway server or the private network.
    #################################################################

    # Deny all inbound traffic from non-routable reserved address spaces
    $cmd 00300 deny all from 192.168.0.0/16 to any in via $pif  #RFC 1918 private IP
    $cmd 00301 deny all from 172.16.0.0/12 to any in via $pif     #RFC 1918 private IP
    $cmd 00302 deny all from 10.0.0.0/8 to any in via $pif          #RFC 1918 private IP
    $cmd 00303 deny all from 127.0.0.0/8 to any in via $pif        #loopback
    $cmd 00304 deny all from 0.0.0.0/8 to any in via $pif            #loopback
    $cmd 00305 deny all from 169.254.0.0/16 to any in via $pif   #DHCP auto-config
    $cmd 00306 deny all from 192.0.2.0/24 to any in via $pif       #reserved for docs
    $cmd 00307 deny all from 204.152.64.0/23 to any in via $pif  #Sun cluster interconnect
    $cmd 00308 deny all from 224.0.0.0/3 to any in via $pif         #Class D & E multicast

    # Deny public pings
    $cmd 00310 deny icmp from any to any in via $pif

    # Deny ident
    $cmd 00315 deny tcp from any to any 113 in via $pif

    # Deny all Netbios service. 137=name, 138=datagram, 139=session
    # Netbios is MS/Windows sharing services.
    # Block MS/Windows hosts2 name server requests 81
    $cmd 00320 deny tcp from any to any 137 in via $pif
    $cmd 00321 deny tcp from any to any 138 in via $pif
    $cmd 00322 deny tcp from any to any 139 in via $pif
    $cmd 00323 deny tcp from any to any 81 in via $pif

    # Deny any late arriving packets
    $cmd 00330 deny all from any to any frag in via $pif

    # Deny ACK packets that did not match the dynamic rule table
    $cmd 00332 deny tcp from any to any established in via $pif

    # Allow traffic in from ISP's DHCP server. This rule must contain
    # the IP address of your ISP.s DHCP server as it.s the only
    # authorized source to send this packet type.
    # Only necessary for cable or DSL configurations.
    # This rule is not needed for .user ppp. type connection to
    # the public Internet. This is the same IP address you captured
    # and used in the outbound section.
    #$cmd 00360 allow udp from any to x.x.x.x 67 in via $pif keep-state

    # Allow in standard www function because I have apache server
    $cmd 00400 allow tcp from any to me 80 in via $pif setup limit src-addr 2

    # Allow in secure FTP, Telnet, and SCP from public Internet
    $cmd 00410 allow tcp from any to me 22 in via $pif setup limit src-addr 2

    # Allow in non-secure Telnet session from public Internet
    # labeled non-secure because ID & PW are passed over public
    # Internet as clear text.
    # Delete this sample group if you do not have telnet server enabled.
    $cmd 00420 allow tcp from any to me 23 in via $pif setup limit src-addr 2

    # Reject & Log all incoming connections from the outside
    $cmd 00499 deny log all from any to any in via $pif

    # Everything else is denied by default
    # deny and log all packets that fell through to see what they are
    $cmd 00999 deny log all from any to any
    ################ End of IPFW rules file ###############################

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

32.6.5.7. Ein Beispiel f?r zustandshafte NAT-Regeln
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es m?ssen einige zus?tzliche Konfigurationseinstellungen vorgenommen
werden, um die die NAT-Funktion von IPFW zu nutzen. Die Kernelquellen
m?ssen mit der Option ``IPDIVERT`` (im IPFIREWALL-Abschnitt der
Kernelkonfigurationsdatei) neu gebaut werden, um den ben?tigten
angepassten Kernel zu erzeugen.

Zus?tzlich werden folgende Optionen in der ``/etc/rc.conf`` ben?tigt:

.. code:: programlisting

    natd_enable="YES"                   # Enable NATD function
    natd_interface="rl0"                # interface name of public Internet NIC
    natd_flags="-dynamic -m"            # -m = preserve port numbers if possible

Zustandshafte Regeln bei aktiviertem ``divert natd`` (*Network Address
Translation*) verkomplizieren die Formulierung des Regelwerkes
betr?chtlich. Damit Ihre Firewall funktioniert, kommt es insbesondere
auf die Position der Ausdr?cke ``check-state`` sowie ``divert natd`` an.
Sie k?nnen nicht l?nger einen einfachen, kaskadierenden Ablauf verwenden
(also einen Regelsatz, bei dem einfach auf eine Regel nach der anderen
gepr?ft wird. Vielmehr wird der neue Aktionstyp ``skipto`` ben?tigt.
Dies erfordert, dass jede Regel ?ber eine eindeutige Nummer verf?gt, um
so eindeutige Sprungziele zu erhalten.

Im Folgenden wird anhand eines umkommentierten Beispiels der Paketfluss
durch das Regelwerk verdeutlicht.

Die Verarbeitung beginnt mit der ersten Regel (also am Anfang der
Regeldatei. Sie setzt sich Regel f?r Regel weiter fort, bis das Ende der
Datei erreicht ist oder eine Regel f?r das Paket einen Treffer erzielt
und das Paket so die Firewall verlassen kann. Achten Sie besonders auf
die Position der Regeln mit den Nummern ``100, 101, 450, 500`` sowie
``510``. Diese Regeln steuern die Adressumsetzung ausgehender und
eingehender Pakete, so dass deren entsprechende Eintr?ge in der
Zustandstabelle immer die private LAN-Adressen abbilden. Zus?tzlich
werden in allen Regeln die Richtung des Pakets (eingehend oder
ausgehend) so die vom Paket zu verwendende Netzwerkschnittstelle
definiert. Ausgehende Anfragen, die eine Sitzung starten, rufen immer
``skipto rule 500``, damit NAT verwendet werden kann.

Nehmen wir nun an, dass ein Nutzer einen Webbrowser verwendet, um eine
Internetseite aufzurufen. Derartige Anfragen werden in der Regel ?ber
Port 80 geleitet. Die zugeh?rigen Pakete werden durch die Firewall
verarbeitet. Regel 100 trifft nicht zu, denn das Paket geht nach au?en,
nicht nach innen. Regel 101 trifft ebenfalls nicht zu, denn es handelt
sich um das erste Paket. Folglich wird die Sitzung erst initiiert und
kann somit noch nicht in der Zustandstabelle enthalten sein kann. Die
erste Regel, die zutrifft, ist Regel 125. Das Paket will das lokale
Netzwerk ?ber die Schnittstelle zum ?ffentlichen Internet (das hei?t
nach au?en) verlassen, es hat aber noch die Quelladresse des privaten
lokalen Netzwerks. Da Regel 125 zutrifft, werden zwei Aktionen
ausgef?hrt: Die Option ``keep-state`` bewirkt, dass das Paket in der
internen Tabelle f?r zustandshafte, dynamische Regeln registriert wird.
Danach wird der Aktionsteil der Regel ausgef?hrt. Dieser ist Bestandteil
der Informationen, die in die in der Tabelle f?r dynamische Regeln
aufgenommen wird und lautet ``skipto rule  500``. Die Regel 500 f?hrt
NATs auf die IP-Adresse des Paketes durch. Danach verl?sst das Paket das
LAN nach au?en in Richtung des ?ffentlichen Internets. Dieser letzte
Teil ist f?r funktionierendes NAT von entscheidender Bedeutung. Nachdem
dieses Paket am Bestimmungsort angekommen ist, wird dort eine Antwort
generiert und zur?ckgeschickt. Dieses Paket wird auf die gleiche Art und
Weise durch das gegebene Regelwerk verarbeitet. Dieses Mal trifft Regel
100 auf das Paket zu, damit wird die Bestimmungsadresse auf die
zugeh?rige (lokale) LAN-Adresse (r?ck-)abgebildet. Danach wird es von
der ``check-state``-Regel verarbeitet, die Zustandstabelle erkennt, dass
eine zugeh?rige aktive Sitzung vorliegt und das Paket wird freigegeben
und in das LAN geleitet. Es wird innerhalb des LANs von dem PC, der die
zugeh?rige Sitzung h?lt, empfangen, der ein neues Paket absendet und ein
weiteres Datensegment vom entfernten Server anfordert. Dieses Mal wird
bei der Pr?fung der ``check-state``-Regel ein nach au?en gehender
zugeh?riger Eintrag in der Zustandstabelle gefunden und die
entsprechende Aktion (also ``skipto 500``) wird ausgef?hrt. Das Paket
springt zu Regel 500 und wird durch diese Regel f?r das ?ffentliche
Internet freigegeben.

Innerhalb des durch die Firewall gesch?tzten Netzwerks werden alle
eingehenden Pakete, die zu einer existierenden Sitzung geh?ren, durch
die Regel ``check-state`` sowie entsprechend platzierte
``divert natd``-Regeln verarbeitet. Die notwendige Arbeit beschr?nkt
sich darauf, alle „schlechten“ Pakete zu blockieren und nur
authorisierten Diensten zugeh?rige Pakete durchzulassen. In Umkehrung
des bisherigen Beispiels nehmen wir nun, dass auf dem Rechner, auf dem
die Firewall l?uft, auch ein Apache Webserver l?uft, auf den von au?en,
also aus dem ?ffentlichen Internet, zugegriffen werden kann. Das erste
von au?en eintreffende Paket (das auch eine neue Sitzung startet)
erf?llt Regel 100. Die Zieladresse des Paketes wird daher auf die
LAN-Adresse des Firewallrechners abgebildet. Das Paket wird dann weiter
auf alle in der Firewall definierten Regeln gepr?ft und trifft
schlie?lich auf Regel 425. Durch diese Regel werden zwei Aktionen
ausgel?sst: Erstens wird aus dem Paket eine dynamische Regel generiert
und in die Zustandstabelle geschrieben. Zus?tzlich wird jedoch die
Anzahl neuer Sitzungsanfragen (von der gleichen Quell-IP-Adresse) auf
``2`` begrenzt, um so DoS-Angriffe auf Dienste, die auf diesem Port
laufen, zu verhindern. Die Aktion dieser Regel ist ``allow``, daher wird
das Paket freigegeben und in das LAN weitergeleitet. Das als Antwort
generierte Paket wird durch die ``check-state``-Regel als zu einer
Sitzung geh?rend erkannt. Damit wird es der Regel 500 zugef?hrt, NAT
wird durchgef?hrt und ?ber die Schnittstelle zum ?ffentlichen Internet
nach au?en geroutet.

Beispiel 1 f?r einen Regelsatz:

.. code:: programlisting

    #!/bin/sh
    cmd="ipfw -q add"
    skip="skipto 500"
    pif=rl0
    ks="keep-state"
    good_tcpo="22,25,37,43,53,80,443,110,119"

    ipfw -q -f flush

    $cmd 002 allow all from any to any via xl0  # exclude LAN traffic
    $cmd 003 allow all from any to any via lo0  # exclude loopback traffic

    $cmd 100 divert natd ip from any to any in via $pif
    $cmd 101 check-state

    # Authorized outbound packets
    $cmd 120 $skip udp from any to xx.168.240.2 53 out via $pif $ks
    $cmd 121 $skip udp from any to xx.168.240.5 53 out via $pif $ks
    $cmd 125 $skip tcp from any to any $good_tcpo out via $pif setup $ks
    $cmd 130 $skip icmp from any to any out via $pif $ks
    $cmd 135 $skip udp from any to any 123 out via $pif $ks


    # Deny all inbound traffic from non-routable reserved address spaces
    $cmd 300 deny all from 192.168.0.0/16  to any in via $pif  #RFC 1918 private IP
    $cmd 301 deny all from 172.16.0.0/12   to any in via $pif  #RFC 1918 private IP
    $cmd 302 deny all from 10.0.0.0/8      to any in via $pif  #RFC 1918 private IP
    $cmd 303 deny all from 127.0.0.0/8     to any in via $pif  #loopback
    $cmd 304 deny all from 0.0.0.0/8       to any in via $pif  #loopback
    $cmd 305 deny all from 169.254.0.0/16  to any in via $pif  #DHCP auto-config
    $cmd 306 deny all from 192.0.2.0/24    to any in via $pif  #reserved for docs
    $cmd 307 deny all from 204.152.64.0/23 to any in via $pif  #Sun cluster
    $cmd 308 deny all from 224.0.0.0/3     to any in via $pif  #Class D & E multicast

    # Authorized inbound packets
    $cmd 400 allow udp from xx.70.207.54 to any 68 in $ks
    $cmd 420 allow tcp from any to me 80 in via $pif setup limit src-addr 1


    $cmd 450 deny log ip from any to any

    # This is skipto location for outbound stateful rules
    $cmd 500 divert natd ip from any to any out via $pif
    $cmd 510 allow ip from any to any

    ######################## end of rules  ##################

Das folgende Beispiel ist praktisch identisch mit dem ersten Regelsatz.
Allerdings wurden die Regel umfassend kommentiert und umgeschrieben,
damit sie f?r weniger erfahrene Benutzer leichter verst?ndlich werden.

Beispiel 2 f?r einen Regelsatz:

.. code:: programlisting

    #!/bin/sh
    ################ Start of IPFW rules file ###############################
    # Flush out the list before we begin.
    ipfw -q -f flush

    # Set rules command prefix
    cmd="ipfw -q add"
    skip="skipto 800"
    pif="rl0"     # public interface name of NIC
                  # facing the public Internet

    #################################################################
    # No restrictions on Inside LAN Interface for private network
    # Change xl0 to your LAN NIC interface name
    #################################################################
    $cmd 005 allow all from any to any via xl0

    #################################################################
    # No restrictions on Loopback Interface
    #################################################################
    $cmd 010 allow all from any to any via lo0

    #################################################################
    # check if packet is inbound and nat address if it is
    #################################################################
    $cmd 014 divert natd ip from any to any in via $pif

    #################################################################
    # Allow the packet through if it has previous been added to the
    # the "dynamic" rules table by a allow keep-state statement.
    #################################################################
    $cmd 015 check-state

    #################################################################
    # Interface facing Public Internet (Outbound Section)
    # Check session start requests originating from behind the
    # firewall on the private network or from this gateway server
    # destined for the public Internet.
    #################################################################

    # Allow out access to my ISP's Domain name server.
    # x.x.x.x must be the IP address of your ISP's DNS
    # Dup these lines if your ISP has more than one DNS server
    # Get the IP addresses from /etc/resolv.conf file
    $cmd 020 $skip tcp from any to x.x.x.x 53 out via $pif setup keep-state


    # Allow out access to my ISP's DHCP server for cable/DSL configurations.
    $cmd 030 $skip udp from any to x.x.x.x 67 out via $pif keep-state

    # Allow out non-secure standard www function
    $cmd 040 $skip tcp from any to any 80 out via $pif setup keep-state

    # Allow out secure www function https over TLS SSL
    $cmd 050 $skip tcp from any to any 443 out via $pif setup keep-state

    # Allow out send & get email function
    $cmd 060 $skip tcp from any to any 25 out via $pif setup keep-state
    $cmd 061 $skip tcp from any to any 110 out via $pif setup keep-state

    # Allow out FreeBSD (make install & CVSUP) functions
    # Basically give user root "GOD" privileges.
    $cmd 070 $skip tcp from me to any out via $pif setup keep-state uid root

    # Allow out ping
    $cmd 080 $skip icmp from any to any out via $pif keep-state

    # Allow out Time
    $cmd 090 $skip tcp from any to any 37 out via $pif setup keep-state

    # Allow out nntp news (i.e. news groups)
    $cmd 100 $skip tcp from any to any 119 out via $pif setup keep-state

    # Allow out secure FTP, Telnet, and SCP
    # This function is using SSH (secure shell)
    $cmd 110 $skip tcp from any to any 22 out via $pif setup keep-state

    # Allow out whois
    $cmd 120 $skip tcp from any to any 43 out via $pif setup keep-state

    # Allow ntp time server
    $cmd 130 $skip udp from any to any 123 out via $pif keep-state

    #################################################################
    # Interface facing Public Internet (Inbound Section)
    # Check packets originating from the public Internet
    # destined for this gateway server or the private network.
    #################################################################

    # Deny all inbound traffic from non-routable reserved address spaces
    $cmd 300 deny all from 192.168.0.0/16  to any in via $pif  #RFC 1918 private IP
    $cmd 301 deny all from 172.16.0.0/12   to any in via $pif  #RFC 1918 private IP
    $cmd 302 deny all from 10.0.0.0/8      to any in via $pif  #RFC 1918 private IP
    $cmd 303 deny all from 127.0.0.0/8     to any in via $pif  #loopback
    $cmd 304 deny all from 0.0.0.0/8       to any in via $pif  #loopback
    $cmd 305 deny all from 169.254.0.0/16  to any in via $pif  #DHCP auto-config
    $cmd 306 deny all from 192.0.2.0/24    to any in via $pif  #reserved for docs
    $cmd 307 deny all from 204.152.64.0/23 to any in via $pif  #Sun cluster
    $cmd 308 deny all from 224.0.0.0/3     to any in via $pif  #Class D & E multicast

    # Deny ident
    $cmd 315 deny tcp from any to any 113 in via $pif

    # Deny all Netbios service. 137=name, 138=datagram, 139=session
    # Netbios is MS/Windows sharing services.
    # Block MS/Windows hosts2 name server requests 81
    $cmd 320 deny tcp from any to any 137 in via $pif
    $cmd 321 deny tcp from any to any 138 in via $pif
    $cmd 322 deny tcp from any to any 139 in via $pif
    $cmd 323 deny tcp from any to any 81  in via $pif

    # Deny any late arriving packets
    $cmd 330 deny all from any to any frag in via $pif

    # Deny ACK packets that did not match the dynamic rule table
    $cmd 332 deny tcp from any to any established in via $pif

    # Allow traffic in from ISP's DHCP server. This rule must contain
    # the IP address of your ISP's DHCP server as it's the only
    # authorized source to send this packet type.
    # Only necessary for cable or DSL configurations.
    # This rule is not needed for 'user ppp' type connection to
    # the public Internet. This is the same IP address you captured
    # and used in the outbound section.
    $cmd 360 allow udp from x.x.x.x to any 68 in via $pif keep-state

    # Allow in standard www function because I have Apache server
    $cmd 370 allow tcp from any to me 80 in via $pif setup limit src-addr 2

    # Allow in secure FTP, Telnet, and SCP from public Internet
    $cmd 380 allow tcp from any to me 22 in via $pif setup limit src-addr 2

    # Allow in non-secure Telnet session from public Internet
    # labeled non-secure because ID & PW are passed over public
    # Internet as clear text.
    # Delete this sample group if you do not have telnet server enabled.
    $cmd 390 allow tcp from any to me 23 in via $pif setup limit src-addr 2

    # Reject & Log all unauthorized incoming connections from the public Internet
    $cmd 400 deny log all from any to any in via $pif

    # Reject & Log all unauthorized out going connections to the public Internet
    $cmd 450 deny log all from any to any out via $pif

    # This is skipto location for outbound stateful rules
    $cmd 800 divert natd ip from any to any out via $pif
    $cmd 801 allow ip from any to any

    # Everything else is denied by default
    # deny and log all packets that fell through to see what they are
    $cmd 999 deny log all from any to any
    ################ End of IPFW rules file ###############################

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+----------------------------------+----------------------------------------------+
| `Zur?ck <firewalls-ipf.html>`__?     | `Nach oben <firewalls.html>`__   | ?\ `Weiter <advanced-networking.html>`__     |
+--------------------------------------+----------------------------------+----------------------------------------------+
| 32.5. Die IPFILTER-Firewall (IPF)?   | `Zum Anfang <index.html>`__      | ?Kapitel 33. Weiterf?hrende Netzwerkthemen   |
+--------------------------------------+----------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
