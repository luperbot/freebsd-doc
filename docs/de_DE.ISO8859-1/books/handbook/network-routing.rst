=========================
33.2. Gateways und Routen
=========================

.. raw:: html

   <div class="navheader">

33.2. Gateways und Routen
`Zur?ck <advanced-networking.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <network-wireless.html>`__

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

33.2. Gateways und Routen
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Coranth Gryphon.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit ein Rechner einen anderen ?ber ein Netzwerk finden kann, muss ein
Mechanismus vorhanden sein, der beschreibt, wie man von einem Rechner
zum anderen gelangt. Dieser Vorgang wird als *Routing* bezeichnet. Eine
„Route“ besteht aus einem definierten Adressenpaar: Einem „Ziel“ und
einem „Gateway“. Dieses Paar zeigt an, dass Sie ?ber das *Gateway* zum
*Ziel* gelangen wollen. Es gibt drei Arten von Zielen: Einzelne Rechner
(Hosts), Subnetze und das „Standard“ziel. Die „Standardroute“ wird
verwendet, wenn keine andere Route zutrifft. Wir werden Standardrouten
sp?ter etwas genauer behandeln. Au?erdem gibt es drei Arten von
Gateways: Einzelne Rechner (Hosts), Schnittstellen (Interfaces, auch als
„Links“ bezeichnet), sowie Ethernet Hardware-Adressen (MAC-Adressen).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.2.1. Ein Beispiel
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die verschiedenen Aspekte des Routings zu veranschaulichen, verwenden
wir folgende Ausgaben von ``netstat``:

.. code:: screen

    % netstat -r
    Routing tables

    Destination               Gateway            Flags       Refs     Use     Netif Expire

    default                   outside-gw         UGSc        37       418     ppp0
    localhost                 localhost          UH          0        181     lo0
    test0                     0:e0:b5:36:cf:4f   UHLW        5        63288   ed0    77
    10.20.30.255              link#1             UHLW        1        2421
    example.com               link#1             UC          0        0
    host1                     0:e0:a8:37:8:1e    UHLW        3        4601    lo0
    host2                     0:e0:a8:37:8:1e    UHLW        0        5       lo0 =>
    host2.example.com         link#1             UC          0        0
    224                       link#1             UC          0        0

Die ersten zwei Zeilen geben die Standardroute (die wir im `n?chsten
Abschnitt <network-routing.html#network-routing-default>`__ behandeln),
sowie die ``localhost`` Route an.

Das in der Routingtabelle f?r ``localhost`` festgelegte Interface
(``Netif``-Spalte) ``lo0``, ist auch als loopback-Ger?t (Pr?fschleife)
bekannt. Das hei?t, dass der ganze Datenverkehr f?r dieses Ziel intern
(innerhalb des Ger?tes) bleibt, anstatt ihn ?ber ein Netzwerk (LAN) zu
versenden, da das Ziel dem Start entspricht.

Der n?chste auff?llige Punkt sind die mit ``0:e0:`` beginnenden
Adressen. Es handelt sich dabei um Ethernet Hardwareadressen, die auch
als MAC-Adressen bekannt sind. FreeBSD identifiziert Rechner im lokalen
Netz automatisch (im Beispiel ``test0``) und f?gt eine direkte Route zu
diesem Rechner hinzu. Dies passiert ?ber die Ethernet-Schnittstelle
``ed0``. Au?erdem existiert ein Timeout (in der Spalte ``Expire``) f?r
diese Art von Routen, der verwendet wird, wenn dieser Rechner in einem
definierten Zeitraum nicht reagiert. Wenn dies passiert, wird die Route
zu diesem Rechner automatisch gel?scht. Rechner im lokalen Netz werden
durch einen als RIP (Routing Information Protocol) bezeichneten
Mechanismus identifiziert, der den k?rzesten Weg zu den jeweiligen
Rechnern bestimmt.

FreeBSD f?gt au?erdem Subnetzrouten f?r das lokale Subnetz hinzu
(``10.20.30.255`` ist die Broadcast-Adresse f?r das Subnetz
``10.20.30``, ``example.com`` ist der zu diesem Subnetz geh?rige
Domainname). Das Ziel ``link#1`` bezieht sich auf die erste
Ethernet-Karte im Rechner. Sie k?nnen auch feststellen, dass keine
zus?tzlichen Schnittstellen angegeben sind.

Routen f?r Rechner im lokalen Netz und lokale Subnetze werden
automatisch durch den routed Daemon konfiguriert. Ist dieser nicht
gestartet, sind nur statisch definierte (explizit eingegebene) Routen
vorhanden.

Die Zeile ``host1`` bezieht sich auf unseren Rechner, der durch seine
Ethernetadresse bekannt ist. Da unser Rechner der Sender ist, verwendet
FreeBSD automatisch das Loopback-Ger?t (``lo0``), anstatt den
Datenverkehr ?ber die Ethernetschnittstelle zu senden.

Die zwei ``host2`` Zeilen sind ein Beispiel daf?r, was passiert, wenn
wir ein
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
Alias verwenden (Lesen Sie dazu den Abschnitt ?ber Ethernet, wenn Sie
wissen wollen, warum wir das tun sollten.). Das Symbol ``=>`` (nach der
``lo0``-Schnittstelle) sagt aus, dass wir nicht nur das Loopbackger?t
verwenden (da sich die Adresse auf den lokalen Rechner bezieht), sondern
dass es sich zus?tzlich auch um ein Alias handelt. Solche Routen sind
nur auf Rechnern vorhanden, die den Alias bereitstellen; alle anderen
Rechner im lokalen Netz haben f?r solche Routen nur eine einfache
``link#1`` Zeile.

Die letzte Zeile (Zielsubnetz ``224``) behandelt das Multicasting, das
wir in einem anderen Abschnitt besprechen werden.

Schlie?lich gibt es f?r Routen noch verschiedene Attribute, die Sie in
der Spalte ``Flags`` finden. Nachfolgend finden Sie eine kurze ?bersicht
von einigen dieser Flags und ihrer Bedeutung:

.. raw:: html

   <div class="informaltable">

+-----+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| U   | Up: Die Route ist aktiv.                                                                                                                                                 |
+-----+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| H   | Host: Das Ziel der Route ist ein einzelner Rechner (Host).                                                                                                               |
+-----+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| G   | Gateway: Alle Daten, die an dieses Ziel gesendet werden, werden von diesem System an ihr jeweiliges Ziel weitergeleitet.                                                 |
+-----+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| S   | Static: Diese Route wurde manuell konfiguriert, das hei?t sie wurde *nicht* automatisch vom System erzeugt.                                                              |
+-----+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| C   | Clone: Erzeugt eine neue Route, basierend auf der Route f?r den Rechner, mit dem wir uns verbinden. Diese Routenart wird normalerweise f?r lokale Netzwerke verwendet.   |
+-----+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| W   | WasCloned: Eine Route, die automatisch konfiguriert wurde. Sie basiert auf einer lokalen Netzwerkroute (Clone).                                                          |
+-----+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| L   | Link: Die Route beinhaltet einen Verweis auf eine Ethernetkarte (MAC-Adresse).                                                                                           |
+-----+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

33.2.2. Standardrouten
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn sich der lokale Rechner mit einem entfernten Rechner verbinden
will, wird die Routingtabelle ?berpr?ft, um festzustellen, ob bereits
ein bekannter Pfad vorhanden ist. Geh?rt dieser entfernte Rechner zu
einem Subnetz, dessen Pfad uns bereits bekannt ist (*Cloned route*),
dann versucht der lokale Rechner ?ber diese Schnittstelle eine
Verbindung herzustellen.

Wenn alle bekannten Pfade nicht funktionieren, hat der lokale Rechner
eine letzte M?glichkeit: Die Standardroute (Defaultroute). Bei dieser
Route handelt es sich um eine spezielle Gateway-Route (gew?hnlich die
einzige im System vorhandene), die im Flags-Feld immer mit ``C``
gekennzeichnet ist. F?r Rechner im lokalen Netzwerk ist dieses Gateway
auf *welcher Rechner auch immer eine Verbindung nach au?en hat* gesetzt
(entweder ?ber eine PPP-Verbindung, DSL, ein Kabelmodem, T1 oder eine
beliebige andere Netzwerkverbindung).

Wenn Sie die Standardroute f?r einen Rechner konfigurieren, der selbst
als Gateway zur Au?enwelt funktioniert, wird die Standardroute zum
Gateway-Rechner Ihres Internetanbieter (ISP) gesetzt.

Sehen wir uns ein Beispiel f?r Standardrouten an. So sieht eine ?bliche
Konfiguration aus:

.. raw:: html

   <div class="mediaobject">

|image0|

.. raw:: html

   </div>

Die Rechner ``Local1`` und ``Local2`` befinden sich auf Ihrer Seite.
``Local1`` ist mit einem ISP ?ber eine PPP-Verbindung verbunden. Dieser
PPP-Server ist ?ber ein lokales Netzwerk mit einem anderen
Gateway-Rechner verbunden, der ?ber eine Schnittstelle die Verbindung
des ISP zum Internet herstellt.

Die Standardrouten f?r Ihre Maschinen lauten:

.. raw:: html

   <div class="informaltable">

+----------+--------------------+-----------------+
| Host     | Standard Gateway   | Schnittstelle   |
+==========+====================+=================+
| Local2   | Local1             | Ethernet        |
+----------+--------------------+-----------------+
| Local1   | T1-GW              | PPP             |
+----------+--------------------+-----------------+

.. raw:: html

   </div>

Eine h?ufig gestellte Frage lautet: „Warum (oder wie) sollten wir
``T1-GW`` als Standard-Gateway f?r ``Local1`` setzen, statt den (direkt
verbundenen) ISP-Server zu verwenden?“.

Bedenken Sie, dass die PPP-Schnittstelle f?r die Verbindung eine Adresse
des lokalen Netzes des ISP verwendet. Daher werden Routen f?r alle
anderen Rechner im lokalen Netz des ISP automatisch erzeugt. Daraus
folgt, dass Sie bereits wissen, wie Sie ``T1-GW`` erreichen k?nnen! Es
ist also unn?tig, einen Zwischenschritt ?ber den ISP-Server zu machen.

Es ist ?blich, die Adresse ``X.X.X.1`` als Gateway-Adresse f?r ihr
lokales Netzwerk zu verwenden. F?r unser Beispiel bedeutet dies
Folgendes: Wenn Ihr lokaler Klasse-C-Adressraum ``10.20.30`` ist und Ihr
ISP ``10.9.9`` verwendet, sehen die Standardrouten so aus:

.. raw:: html

   <div class="informaltable">

+----------------------------------+-----------------------+
| Rechner (Host)                   | Standardroute         |
+==================================+=======================+
| Local2 (10.20.30.2)              | Local1 (10.20.30.1)   |
+----------------------------------+-----------------------+
| Local1 (10.20.30.1, 10.9.9.30)   | T1-GW (10.9.9.1)      |
+----------------------------------+-----------------------+

.. raw:: html

   </div>

Sie k?nnen die Standardroute ganz einfach in der Datei ``/etc/rc.conf``
festlegen. In unserem Beispiel wurde auf dem Rechner ``Local2`` folgende
Zeile in ``/etc/rc.conf`` eingef?gt:

.. code:: programlisting

    defaultrouter="10.20.30.1"

Die Standardroute kann ?ber
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__
auch direkt gesetzt werden:

.. code:: screen

    # route add default 10.20.30.1

Weitere Informationen zum Bearbeiten von Netzwerkroutingtabellen finden
Sie in
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__.

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

33.2.3. Rechner mit zwei Heimatnetzen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt noch eine Konfigurationsm?glichkeit, die wir besprechen sollten,
und zwar Rechner, die sich in zwei Netzwerken befinden. Technisch
gesehen, z?hlt jeder als Gateway arbeitende Rechner zu den Rechnern mit
zwei Heimatnetzen (im obigen Beispiel unter Verwendung einer
PPP-Verbindung). In der Praxis meint man damit allerdings nur Rechner,
die sich in zwei lokalen Netzen befinden.

Entweder verf?gt der Rechner ?ber zwei Ethernetkarten und jede dieser
Karten hat eine Adresse in einem separaten Subnetz, oder der Rechner hat
nur eine Ethernetkarte und verwendet
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
Aliasing. Die erste M?glichkeit wird verwendet, wenn zwei physikalisch
getrennte Ethernet-Netzwerke vorhanden sind, die zweite, wenn es nur ein
physikalisches Ethernet-Netzwerk gibt, das aber aus zwei logisch
getrennten Subnetzen besteht.

In beiden F?llen werden Routingtabellen erstellt, damit jedes Subnetz
wei?, dass dieser Rechner als Gateway zum anderen Subnetz arbeitet
(*inbound route*). Diese Konfiguration (der Gateway-Rechner arbeitet als
Router zwischen den Subnetzen) wird h?ufig verwendet, wenn es darum
geht, Paketfilterung oder eine Firewall (in eine oder beide Richtungen)
zu implementieren.

Soll dieser Rechner Pakete zwischen den beiden Schnittstellen
weiterleiten, m?ssen Sie diese Funktion manuell konfigurieren und
aktivieren. Lesen Sie den n?chsten Abschnitt, wenn Sie weitere
Informationen zu diesem Thema ben?tigen.

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

33.2.4. Einen Router konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Netzwerkrouter ist einfach ein System, das Pakete von einer
Schnittstelle zur anderen weiterleitet. Internetstandards und gute
Ingenieurspraxis sorgten daf?r, dass diese Funktion in FreeBSD in der
Voreinstellung deaktiviert ist. Sie k?nnen diese Funktion aktivieren,
indem Sie in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
folgende ?nderung durchf?hren:

.. code:: programlisting

    gateway_enable="YES"          # Auf YES setzen, wenn der Rechner als Gateway arbeiten soll

Diese Option setzt die
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__-Variable
``net.inet.ip.forwarding`` auf ``1``. Wenn Sie das Routing kurzzeitig
unterbrechen wollen, k?nnen Sie die Variable auf ``0`` setzen.

Ihr neuer Router ben?tigt nun noch Routen, um zu wissen, wohin er den
Verkehr senden soll. Haben Sie ein (sehr) einfaches Netzwerk, k?nnen Sie
statische Routen verwenden. FreeBSD verf?gt ?ber den Standard
BSD-Routing-Daemon
`routed(8) <http://www.FreeBSD.org/cgi/man.cgi?query=routed&sektion=8>`__,
der RIP (sowohl Version 1 als auch Version 2) und IRDP versteht. BGP?v4,
OSPF?v2 und andere Protokolle werden von
`net/zebra <http://www.freebsd.org/cgi/url.cgi?ports/net/zebra/pkg-descr>`__
unterst?tzt. Es stehen auch kommerzielle Produkte wie gated zur
Verf?gung.

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

33.2.5. Statische Routen einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Al Hoang.

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

33.2.5.1. Manuelle Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nehmen wir an, dass wir ?ber folgendes Netzwerk verf?gen:

.. raw:: html

   <div class="mediaobject">

|image1|

.. raw:: html

   </div>

``RouterA``, ein FreeBSD-Rechner, dient als Router f?r den Zugriff auf
das Internet. Die Standardroute ist auf ``10.0.0.1`` gesetzt, damit ein
Zugriff auf das Internet m?glich wird. Wir nehmen nun an, dass
``RouterB`` bereits konfiguriert ist und daher wei?, wie er andere
Rechner erreichen kann. Dazu wird die Standardroute von ``RouterB`` auf
``192.168.1.1`` gesetzt, da dieser Rechner als Gateway fungiert.

Sieht man sich die Routingtabelle f?r ``RouterA`` an, erh?lt man
folgende Ausgabe:

.. code:: screen

    % netstat -nr
    Routing tables

    Internet:
    Destination        Gateway            Flags    Refs      Use  Netif  Expire
    default            10.0.0.1           UGS         0    49378    xl0
    127.0.0.1          127.0.0.1          UH          0        6    lo0
    10.0.0/24          link#1             UC          0        0    xl0
    192.168.1/24       link#2             UC          0        0    xl1

Mit dieser Routingtabelle kann ``RouterA`` unser internes Netz 2 nicht
erreichen, da keine Route zum Rechner ``192.168.2.0/24`` vorhanden ist.
Um dies zu korrigieren, kann die Route manuell gesetzt werden. Durch den
folgenden Befehl wird das interne Netz 2 in die Routingtabelle des
Rechners ``RouterA`` aufgenommen, indem ``192.168.1.2`` als n?chster
Zwischenschritt verwenden wird:

.. code:: screen

    # route add -net 192.168.2.0/24 192.168.1.2

Ab sofort kann ``RouterA`` alle Rechner des Netzwerks ``192.168.2.0/24``
erreichen.

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

33.2.5.2. Routen dauerhaft einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das obige Beispiel ist f?r die Konfiguration einer statischen Route auf
einem laufenden System geeignet. Diese Information geht jedoch verloren,
wenn der FreeBSD-Rechner neu gestartet werden muss. Um dies zu
verhindern, wird diese Route in ``/etc/rc.conf`` eingetragen:

.. code:: programlisting

    # Add Internal Net 2 as a static route
    static_routes="internalnet2"
    route_internalnet2="-net 192.168.2.0/24 192.168.1.2"

Die Variable ``static_routes`` enth?lt eine Reihe von Strings, die durch
Leerzeichen getrennt sind. Jeder String bezieht sich auf den Namen einer
Route. In unserem Beispiel hat ``static_routes`` *``internalnet2``* als
einzigen String. Zus?tzlich verwendet man die Konfigurationsvariable
``route_internalnet2``, in der alle sonstigen an
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__
zu ?bergebenden Parameter festgelegt werden. In obigen Beispiel h?tte
man folgenden Befehl verwendet:

.. code:: screen

    # route add -net 192.168.2.0/24 192.168.1.2

Daher wird ``"-net 192.168.2.0/24 192.168.1.2"`` als Parameter der
Variable ``route_`` angegeben.

Wie bereits erw?hnt, k?nnen bei ``static_routes`` auch mehrere Strings
angegeben werden. Dadurch lassen sich mehrere statische Routen anlegen.
Durch folgende Zeilen werden auf einem imagin?ren Rechner statische
Routen zu den Netzwerken ``192.168.0.0/24`` sowie ``192.168.1.0/24``
definiert:

.. code:: programlisting

    static_routes="net1 net2"
    route_net1="-net 192.168.0.0/24 192.168.0.1"
    route_net2="-net 192.168.1.0/24 192.168.1.1"

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

33.2.6. Verteilung von Routing-Informationen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wir haben bereits dar?ber gesprochen, wie wir unsere Routen zur
Au?enwelt definieren, aber nicht dar?ber, wie die Au?enwelt uns finden
kann.

Wir wissen bereits, dass Routing-Tabellen so erstellt werden k?nnen,
dass s?mtlicher Verkehr f?r einen bestimmten Adressraum (in unserem
Beispiel ein Klasse-C-Subnetz) zu einem bestimmten Rechner in diesem
Netzwerk gesendet wird, der die eingehenden Pakete im Subnetz verteilt.

Wenn Sie einen Adressraum f?r Ihre Seite zugewiesen bekommen, richtet
Ihr Diensteanbieter seine Routingtabellen so ein, dass der ganze Verkehr
f?r Ihr Subnetz entlang Ihrer PPP-Verbindung zu Ihrer Seite gesendet
wird. Aber woher wissen die Seiten in der Au?enwelt, dass sie die Daten
an Ihren ISP senden sollen?

Es gibt ein System (?hnlich dem verbreiteten DNS), das alle zugewiesenen
Adressr?ume verwaltet und ihre Verbindung zum Internet-Backbone
definiert und dokumentiert. Der „Backbone“ ist das Netz aus
Hauptverbindungen, die den Internetverkehr in der ganzen Welt
transportieren und verteilen. Jeder Backbone-Rechner verf?gt ?ber eine
Kopie von Haupttabellen, die den Verkehr f?r ein bestimmtes Netzwerk
hierarchisch vom Backbone ?ber eine Kette von Diensteanbietern bis hin
zu Ihrer Seite leiten.

Es ist die Aufgabe Ihres Diensteanbieters, den Backbone-Seiten
mitzuteilen, dass sie mit Ihrer Seite verbunden wurden. Durch diese
Mitteilung der Route ist nun auch der Weg zu Ihnen bekannt. Dieser
Vorgang wird als *Bekanntmachung von Routen* (*routing propagation*)
bezeichnet.

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

33.2.7. Problembehebung
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal kommt es zu Problemen bei der Bekanntmachung von Routen, und
einige Seiten sind nicht in der Lage, Sie zu erreichen. Vielleicht der
n?tzlichste Befehl, um festzustellen, wo das Routing nicht funktioniert,
ist
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__.
Er ist au?erdem sehr n?tzlich, wenn Sie einen entfernten Rechner nicht
erreichen k?nnen (lesen Sie dazu auch
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__).

`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__
wird mit dem zu erreichenden Rechner (Host) ausgef?hrt. Angezeigt werden
die Gateway-Rechner entlang des Verbindungspfades. Schlie?lich wird der
Zielrechner erreicht oder es kommt zu einem Verbindungsabbruch
(beispielsweise durch Nichterreichbarkeit eines Gateway-Rechners).

Weitere Informationen finden Sie in
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__.

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

33.2.8. Multicast-Routing
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD unterst?tzt sowohl Multicast-Anwendungen als auch
Multicast-Routing. Multicast-Anwendungen m?ssen nicht konfiguriert
werden, sie laufen einfach. Multicast-Routing muss in der
Kernelkonfiguration aktiviert werden:

.. code:: programlisting

    options MROUTING

Zus?tzlich muss
`mrouted(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mrouted&sektion=8>`__,
der Multicast-Routing-Daemon, ?ber die Datei ``/etc/mrouted.conf``
eingerichtet werden, um Tunnel und DVMRP zu aktivieren. Weitere
Informationen zu diesem Thema finden Sie in
`mrouted(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mrouted&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

`mrouted(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mrouted&sektion=8>`__,
der Multicast Routing Daemon, verwendet das DVMRP Multicast Routing
Protocol, das inzwischen in den meisten Multicast-Installationen durch
`pim(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pim&sektion=4>`__
ersetzt wurde.
`mrouted(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mrouted&sektion=8>`__
sowie die damit in Verbindung stehenden Werkzeuge
`map-mbone(8) <http://www.FreeBSD.org/cgi/man.cgi?query=map-mbone&sektion=8>`__
und
`mrinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mrinfo&sektion=8>`__\ k?nnen
?ber die FreeBSD-Ports-Sammlung (genauer den Port
`net/mrouted <http://www.freebsd.org/cgi/url.cgi?ports/net/mrouted/pkg-descr>`__)
installiert werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+--------------------------------------------+-----------------------------------------+
| `Zur?ck <advanced-networking.html>`__?       | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <network-wireless.html>`__   |
+----------------------------------------------+--------------------------------------------+-----------------------------------------+
| Kapitel 33. Weiterf?hrende Netzwerkthemen?   | `Zum Anfang <index.html>`__                | ?33.3. Drahtlose Netzwerke              |
+----------------------------------------------+--------------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |image0| image:: advanced-networking/net-routing.png
.. |image1| image:: advanced-networking/static-routes.png
