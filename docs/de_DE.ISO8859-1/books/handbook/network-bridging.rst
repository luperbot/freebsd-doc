===================================
33.6. LAN-Kopplung mit einer Bridge
===================================

.. raw:: html

   <div class="navheader">

33.6. LAN-Kopplung mit einer Bridge
`Zur?ck <network-bluetooth.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <network-aggregation.html>`__

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

33.6. LAN-Kopplung mit einer Bridge
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Andrew Thompson.

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

33.6.1. Einf?hrung
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal ist es n?tzlich, ein physikalisches Netzwerk (wie ein
Ethernetsegment) in zwei separate Netzwerke aufzuteilen, ohne gleich
IP-Subnetze zu erzeugen, die ?ber einen Router miteinander verbunden
sind. Ein Ger?t, das zwei Netze auf diese Weise verbindet, wird als
*Bridge* bezeichnet. Jedes FreeBSD-System mit zwei Netzwerkkarten kann
als Bridge fungieren.

Die Bridge arbeitet, indem sie die MAC Layeradressen (Ethernet Adressen)
der Ger?te in ihren Netzwerksegmenten lernt. Der Verkehr wird nur dann
zwischen zwei Segmenten weitergeleitet, wenn sich Sender und Empf?nger
in verschiedenen Netzwerksegmenten befinden.

In vielerlei Hinsicht entspricht eine Bridge daher einem Ethernet-Switch
mit sehr wenigen Ports.

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

33.6.2. Situationen, in denen *Bridging* angebracht ist
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zahlreiche Situationen, in denen der Einsatz einer Bridge
sinnvoll ist:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.6.2.1. Verbinden von Netzwerken
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Hauptaufgabe einer Bridge ist die Verbindung von zwei oder mehreren
Netzwerksegmenten zu einem gemeinsamen Netzwerk. Es ist oft sinnvoller,
eine hostbasierte Bridge anstelle normaler Netzwerkkomponenten (wie
Kabelverbindungen), Firewalls oder Pseudonetzwerken ?ber die
Schnittstelle einer virtuellen Maschine einzusetzen. Eine Bridge kann
au?erdem ein drahtloses Ger?t mit einem Kabelnetzwerk verbinden. Diese
F?higkeit der Bridge wird als *HostAP-Modus* bezeichnet. Die Bridge
agiert in diesem Fall als Access Point f?r das drahtlose Ger?t.

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

33.6.2.2. Filtering/Traffic Shaping Firewall
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

H?ufig kommt es vor, dass Firewallfunktionen ben?tigt werden, ohne dass
Routing oder *Network Adress Translation* (NAT) verwendet werden soll.

Ein Beispiel daf?r w?re ein kleines Unternehmen, das ?ber DSL oder ISDN
an seinen ISP angebunden ist. Es verf?gt ?ber 13 weltweit erreichbare
IP-Adressen, sein Netzwerk besteht aus 10 Rechnern. In dieser Situation
ist der Einsatz von Subnetzen sowie einer routerbasierten Firewall
schwierig.

Eine brigdebasierte Firewall kann konfiguriert und in den
ISDN/DSL-Downstreampfad ihres Routers eingebunden werden, ohne dass Sie
sich um IP-Adressen k?mmern m?ssen.

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

33.6.2.3. Netzwerk?berwachung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Bridge kann zwei Netzwerksegmente miteinander verbinden und danach
alle Ethernet-Rahmen ?berpr?fen, die zwischen den beiden
Netzwerksegmenten ausgetauscht werden. Dazu verwendet man entweder
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__/`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__
auf dem Netzger?t der Bridge oder schickt Kopien aller Rahmen an ein
zus?tzliches Netzger?t (den sogenannten *Span Port*).

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

33.6.2.4. Layer?2-VPN
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zwei Ethernetnetzwerke k?nnen ?ber einen IP-Link miteinander verbunden
werden, indem Sie die beiden Netzwerke ?ber einen EtherIP-Tunnel koppeln
oder eine
`tap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tap&sektion=4>`__-basierte
L?sung wie OpenVPN einsetzen.

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

33.6.2.5. Layer?2-Redundanz
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Systeme eines Netzwerks k?nnen redundant miteinander verbunden sein.
In diesem Fall verwenden Sie das *Spanning Tree Protocol*, um redundante
Pfade zu blockieren. Damit ein Ethernetnetzwerk korrekt arbeitet, darf
immer nur ein aktiver Pfad zwischen zwei Ger?ten des Netzwerks
existieren. Aufgabe des Spanning Tree Protocols ist es daher, Schleifen
zu entdecken und redundante Links in den Status *blockiert* zu
versetzen. F?llt ein aktiver Link aus, so berechnet das Protokoll einen
neuen Pfad. Dazu wird ein blockierter Pfad in den Status *aktiv*
versetzt, damit alle Systeme des Netzwerks wieder miteinander
kommunizieren k?nnen.

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

33.6.3. Kernelkonfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt nur die
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4>`__-Bridge-Implementierung.
Ein Netgraph-Bridge-Treiber ist ebenfalls verf?gbar, wird hier aber
nicht behandelt. Lesen Sie die Manualpage
`ng\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bridge&sektion=4>`__,
wenn Sie diesen Treiber einsetzen wollen.

Bei diesem Treiber handelt es sich um ein Kernelmodul, das von
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
automatisch geladen wird, wenn ein Bridge-Interface erzeugt wird.
Alternativ ist es aber auch m?glich, die Unterst?tzung f?r den Treiber
in Ihren Kernel zu kompilieren. Dazu f?gen Sie die Zeile
``device if_bridge`` in Ihre Kernelkonfigurationsdatei ein und bauen
danach den Kernel neu.

Paketfilter k?nnen mit allen Firewallpaketen verwendet werden, die das
`pfil(9) <http://www.FreeBSD.org/cgi/man.cgi?query=pfil&sektion=9>`__-Framework
benutzen. Die Firewall kann dabei entweder als Kernelmodul geladen oder
in den Kernel kompiliert werden.

Eine Bridge kann auch als *Traffic Shaper* verwendet werden, wenn Sie
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__
oder
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
einsetzen.

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

33.6.4. Die LAN-Kopplung aktivieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Bridge wird durch das Klonen von Schnittstellen erzeugt. Um eine
Bridge zu erzeugen, verwenden Sie den Befehl
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.
Ist der Bridge-Treiber nicht in Ihren Kernel kompiliert, wird er
automatisch geladen.

.. code:: screen

    # ifconfig bridge create
    bridge0
    # ifconfig bridge0
    bridge0: flags=8802<BROADCAST,SIMPLEX,MULTICAST> metric 0 mtu 1500
            ether 96:3d:4b:f1:79:7a
            id 00:00:00:00:00:00 priority 32768 hellotime 2 fwddelay 15
            maxage 20 holdcnt 6 proto rstp maxaddr 100 timeout 1200
            root id 00:00:00:00:00:00 priority 0 ifcost 0 port 0

Im obigen Beispiel wird die Bridge erzeugt und erh?lt automatisch eine
zuf?llig generierte Ethernet-Adresse zugewiesen. Die Parameter
``maxaddr`` sowie ``timeout`` legen fest, wie viele MAC-Adressen die
Bridge in ihrer Forward-Tabelle halten kann beziehungsweise wie viele
Sekunden jeder Eintrag erhalten bleiben soll, nachdem er zuletzt
verwendet wurde. Die restlichen Parameter sind f?r die Konfiguration von
Spanning?Tree notwendig.

Im n?chsten Schritt werden die Schnittstellen, die die Bridge verbinden
soll, zugewiesen. Damit die Bridge Datenpakete weiterleiten kann, m?ssen
sowohl die Bridge als auch die Schnittstellen (der zu verbindenden
Netzwerksegmente) aktiviert sein:

.. code:: screen

    # ifconfig bridge0 addm fxp0 addm fxp1 up
    # ifconfig fxp0 up
    # ifconfig fxp1 up

Danach ist die Bridge in der Lage, Ethernet-Rahmen zwischen den
Schnittstellen ``fxp0`` und ``fxp1`` weiterzuleiten. Um diese
Konfiguration beim Systemstart automatisch zu aktivieren, m?ssen Sie
folgende Eintr?ge in die Datei ``/etc/rc.conf`` aufnehmen:

.. code:: programlisting

    cloned_interfaces="bridge0"
    ifconfig_bridge0="addm fxp0 addm fxp1 up"
    ifconfig_fxp0="up"
    ifconfig_fxp1="up"

Ben?tigen Sie f?r die Bridge eine IP-Adresse, m?ssen Sie diese der
Schnittstelle der Bridge zuweisen (und nicht einer der Schnittstellen
der gekoppelten Netzwerksegmente). Dabei k?nnen Sie die IP-Adresse
sowohl statisch als auch dynamisch ?ber DHCP zuweisen:

.. code:: screen

    # ifconfig bridge0 inet 192.168.0.1/24

Sie k?nnen der Bridge-Schnittstelle auch eine IPv6-Adresse zuweisen.

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

33.6.5. Firewalls
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem ein Paketfilter aktiviert wurde, k?nnen Datenpakete, die von den
Schnittstellen der gekoppelten Netzwerksegmente gesendet und empfangen
werden, ?ber die Bridge weitergeleitet oder nach bestimmten Regeln
gefiltert oder auch komplett geblockt werden. Ist die Richtung des
Paketflusses wichtig, ist es am besten, eine Firewall auf den
Schnittstellen der einzelnen Netzwerksegmente einzurichten und nicht auf
der Bridge selbst.

Eine Bridge verf?gt ?ber verschiedene Optionen, ?ber die Sie die
Weiterleitung von Nicht-IP- und ARP-Paketen sowie den Einsatz von
Layer?2-Firewalls (mit IPFW) steuern k?nnen. Lesen Sie die Manualpage
`if\_bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=if_bridge&sektion=4>`__,
wenn Sie diese Funktionen ben?tigen.

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

33.6.6. Spanning?Tree
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Bridge-Treiber implementiert das *Rapid Spanning Tree Protocol*
(RSTP oder 802.1w), das abw?rtskompatibel zum veralteten *Spanning Tree
Protocol* (STP) ist. Spanning?Tree dient dazu, Schleifen in einer
Netzwerktopologie zu entdecken und zu entfernen. RSTP arbeitet dabei
schneller als das veraltete STP. RSTP tauscht Informationen mit
benachbarten Switchen aus, um Pakete korrekt weiterzuleiten und eine
Schleifenbildung zu verhindern.

FreeBSD unterst?tzt die Betriebsmode RSTP sowie STP, von denen RSTP als
Standardmodus voreingestellt ist.

Spanning?Tree kann auf den Schnittstellen der durch die Bridge
verbundenen Netzwerksegmente ?ber die Option ``stp`` aktiviert werden.
F?r eine Bridge, die die Schnittstellen ``fxp0`` und ``fxp1`` verbindet,
aktivieren Sie STP wie folgt:

.. code:: screen

    # ifconfig bridge0 stp fxp0 stp fxp1
    bridge0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            ether d6:cf:d5:a0:94:6d
            id 00:01:02:4b:d4:50 priority 32768 hellotime 2 fwddelay 15
            maxage 20 holdcnt 6 proto rstp maxaddr 100 timeout 1200
            root id 00:01:02:4b:d4:50 priority 32768 ifcost 0 port 0
            member: fxp0 flags=1c7<LEARNING,DISCOVER,STP,AUTOEDGE,PTP,AUTOPTP>
                    port 3 priority 128 path cost 200000 proto rstp
                    role designated state forwarding
            member: fxp1 flags=1c7<LEARNING,DISCOVER,STP,AUTOEDGE,PTP,AUTOPTP>
                    port 4 priority 128 path cost 200000 proto rstp
                    role designated state forwarding

Diese Bridge hat die Spanning-Tree-ID ``00:01:02:4b:d4:50`` und die
Priorit?t ``32768``. Da diese ID mit der ``Root-ID`` identisch ist,
handelt es sich um die Root-Bridge dieses Netzwerks.

Auf einer anderen Bridge des Netzwerks ist Spanning?Tree ebenfalls
aktiviert:

.. code:: screen

    bridge0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            ether 96:3d:4b:f1:79:7a
            id 00:13:d4:9a:06:7a priority 32768 hellotime 2 fwddelay 15
            maxage 20 holdcnt 6 proto rstp maxaddr 100 timeout 1200
            root id 00:01:02:4b:d4:50 priority 32768 ifcost 400000 port 4
            member: fxp0 flags=1c7<LEARNING,DISCOVER,STP,AUTOEDGE,PTP,AUTOPTP>
                    port 4 priority 128 path cost 200000 proto rstp
                    role root state forwarding
            member: fxp1 flags=1c7<LEARNING,DISCOVER,STP,AUTOEDGE,PTP,AUTOPTP>
                    port 5 priority 128 path cost 200000 proto rstp
                    role designated state forwarding

Die Zeile
``root id 00:01:02:4b:d4:50 priority 32768     ifcost 400000 port 4``
zeigt an, dass die Root-Bridge wie im obigen Beispiel die ID
``00:01:02:4b:d4:50`` hat. Die Pfadkosten hin zur Root-Bridge betragen
``400000``, wobei der Pfad zur Root-Bridge ?ber ``Port?4`` geht (der
wiederum der Schnittstelle ``fxp0`` entspricht).

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

33.6.7. Fortgeschrittene Funktionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

33.6.7.1. Den Datenfluss rekonstruieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Bridge unterst?tzt den Monitormodus. Dabei werden alle Pakete
verworfen, nachdem sie von
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__
verarbeitet wurden. In diesem Modus erfolgt keine weitere Bearbeitung
und auch keine Weiterleitung von Datenpaketen. Es ist daher m?glich, die
Eingabe von zwei oder mehr Netzwerkschnittstellen in einen einzigen
gemeinsamen
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__-Stream
zu vereinen. Ein solcher Datenstrom ist beispielsweise n?tzlich, um den
Datenverkehr f?r ""network taps"" zu rekonstruieren, die ihre
RX/TX-Signale ?ber verschiedene Schnittstellen senden.

Um die Eingabe von vier Netzwerkschnittstellen in einzigen gemeinsamen
Datenstrom zu vereinen, geben Sie Folgendes ein:

.. code:: screen

    # ifconfig bridge0 addm fxp0 addm fxp1 addm fxp2 addm fxp3 monitor up
    # tcpdump -i bridge0

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

33.6.7.2. Span Ports
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Kopie jedes Ethernet-Rahmens, der an der Bridge ankommt, wird ?ber
einen festgelegten *Span?Port* verschickt. Auf einer Bridge k?nnen
beliebig viele Span?Ports festgelegt werden. Wird eine Schnittstelle als
Span?Port konfiguriert, kann sie nicht mehr als normaler Bridge-Port
verwendet werden. Eine derartige Konfiguration ist beispielsweise
sinnvoll, um den Datenverkehr, der in einem Netzwerk ?ber die Bridge
l?uft, auf einen Rechner zu ?bertragen, der mit einem Span?Port der
Bridge verbunden ist.

Um eine Kopie aller Ethernet-Rahmen ?ber die Schnittstelle ``fxp4`` zu
verschicken, geben Sie Folgendes ein:

.. code:: screen

    # ifconfig bridge0 span fxp4

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

33.6.7.3. Private Schnittstellen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine private Schnittstelle leitet keine Daten an einen Port weiter, bei
dem es sich ebenfalls um eine private Schnittstelle handelt. Der
Datenverkehr wird dabei komplett blockiert, auch Ethernet-Rahmen und
ARP-Pakete werden nicht weitergeleitet. Wollen Sie hingegen nur
spezifische Datenpakete blockieren, sollten Sie eine Firewall einsetzen.

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

33.6.7.4. Schnittstellen als *sticky* kennzeichnen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn die Schnittstelle eines ?ber eine Bridge verbundenen
Netzwerksegments als *sticky* gekennzeichnet wird, werden alle dynamisch
gelernten Adressen als statische Adressen behandelt, sobald sie in den
Forward-Cache der Bridge aufgenommen wurden. Sticky-Eintr?ge werden
niemals aus dem Cache entfernt oder ersetzt. Selbst dann nicht, wenn die
Adresse von einer anderen Schnittstelle verwendet wird. Sie k?nnen
dadurch die Vorteile statischer Adresseintr?ge nutzen, ohne die
Forward-Tabelle vor dem Einsatz der Bridge mit statischen Eintr?gen
f?llen zu m?ssen. Clients, die sich in einem bestimmten von der Bridge
verwalteten Segmente befinden, k?nnen dabei nicht in ein anderes Segment
wechseln.

Ein weiteres Beispiel f?r den Einsatz von Sticky-Adressen w?re die
Kombination einer Bridge mit mehreren VLANs, um einen Router zu
konfigurieren, der in in der Lage ist, einzelne Kundennetzwerke
voneinander zu trennen, ohne IP-Adressbereiche zu verschwenden. F?r das
folgende Beispiel nehmen wir an, dass sich der Client ``CustomerA`` im
VLAN ``vlan100`` und der Client ``CustomerB`` im VLAN ``vlan101``
befinden. Die Bridge hat die IP-Adresse ``192.168.0.1`` und ist als
Internet-Router konfiguriert.

.. code:: screen

    # ifconfig bridge0 addm vlan100 sticky vlan100 addm vlan101 sticky vlan101
    # ifconfig bridge0 inet 192.168.0.1/24

Beide Clients sehen ``192.168.0.1`` als Ihr Default-Gateway. Da der
Br?cken-Cache *sticky* ist, sind Sie nicht dazu in der Lage, die
MAC-Adresse des anderen Kunden zu spoofen und dessen Datenverkehr
abzufangen.

Sie k?nnen die Kommunikation zwischen den VLANs vollst?ndig unterbinden,
wenn Sie private Schnittstellen (oder eine Firewall) einsetzen:

.. code:: screen

    # ifconfig bridge0 private vlan100 private vlan101

Die Kunden sind nun komplett voneinander isoliert und der komplette
``/24``-Adressbereich kann zugewiesen werden, ohne dass Sie Subnetze
einsetzen m?ssen.

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

33.6.7.5. Adressen-Limitierung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die maximale m?gliche Anzahl an eindeutigen MAC-Adressen hinter einer
Schnittstelle kann festgelegt werden. Sobald das Limit erreicht ist,
werden Pakete mit einer unbekannten Quell-Adresse solange verworfen, bis
ein existierender Eintrag gel?scht wird oder abl?uft.

Das folgende Beispiel setzt die maximale Anzahl von Netzger?ten f?r
``CustomerA`` f?r das VLAN ``vlan100`` auf 10.

.. code:: screen

    # ifconfig bridge0 ifmaxaddr vlan100 10

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

33.6.7.6. SNMP-Monitoring
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Schnittstelle der Bridge sowie die STP-Parameter k?nnen durch den
bereits im Basissystem enthaltenen SNMP-Daemon ?berwacht werden. Die
exportierten Bridge-MIBs entsprechen den IETF-Standards, daher k?nnen
Sie einen beliebigen SNMP-Client oder ein beliebiges Monitoring-Werkzeug
einsetzen, um die ben?tigten Daten zu erhalten.

Auf dem Rechner, auf dem die Bridge konfiguriert ist, aktivieren Sie die
Zeile ``begemotSnmpdModulePath."bridge" = "/usr/lib/snmp_bridge.so"`` in
der Datei ``/etc/snmp.config`` und starten danach den bsnmpd-Daemon.
Eventuell ben?tigen Sie noch weitere Konfigurationsparameter wie
Community-Namen und Zugriffslisten. Die Konfiguration dieser Parameter
wird in den Manualpages
`bsnmpd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsnmpd&sektion=1>`__
sowie
`snmp\_bridge(3) <http://www.FreeBSD.org/cgi/man.cgi?query=snmp_bridge&sektion=3>`__
beschrieben.

Die folgenden Beispiele verwenden das Softwarepaket Net-SNMP
(`net-mgmt/net-snmp <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/net-snmp/pkg-descr>`__),
um die Bridge abzufragen. Alternativ k?nnen Sie daf?r auch den Port
`net-mgmt/bsnmptools <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/bsnmptools/pkg-descr>`__
einsetzen. Auf dem SNMP-Client f?gen Sie danach die folgenden Zeilen in
die Datei ``$HOME/.snmp/snmp.conf`` ein, um die MIB-Definitionen der
Bridge in Net-SNMP zu importieren:

.. code:: programlisting

    mibdirs +/usr/share/snmp/mibs
    mibs +BRIDGE-MIB:RSTP-MIB:BEGEMOT-MIB:BEGEMOT-BRIDGE-MIB

Um eine einzelne Bridge ?ber den IETF BRIDGE-MIB (RFC4188) zu
?berwachen, geben Sie Folgendes ein:

.. code:: screen

    % snmpwalk -v 2c -c public bridge1.example.com mib-2.dot1dBridge
    BRIDGE-MIB::dot1dBaseBridgeAddress.0 = STRING: 66:fb:9b:6e:5c:44
    BRIDGE-MIB::dot1dBaseNumPorts.0 = INTEGER: 1 ports
    BRIDGE-MIB::dot1dStpTimeSinceTopologyChange.0 = Timeticks: (189959) 0:31:39.59 centi-seconds
    BRIDGE-MIB::dot1dStpTopChanges.0 = Counter32: 2
    BRIDGE-MIB::dot1dStpDesignatedRoot.0 = Hex-STRING: 80 00 00 01 02 4B D4 50
    ...
    BRIDGE-MIB::dot1dStpPortState.3 = INTEGER: forwarding(5)
    BRIDGE-MIB::dot1dStpPortEnable.3 = INTEGER: enabled(1)
    BRIDGE-MIB::dot1dStpPortPathCost.3 = INTEGER: 200000
    BRIDGE-MIB::dot1dStpPortDesignatedRoot.3 = Hex-STRING: 80 00 00 01 02 4B D4 50
    BRIDGE-MIB::dot1dStpPortDesignatedCost.3 = INTEGER: 0
    BRIDGE-MIB::dot1dStpPortDesignatedBridge.3 = Hex-STRING: 80 00 00 01 02 4B D4 50
    BRIDGE-MIB::dot1dStpPortDesignatedPort.3 = Hex-STRING: 03 80
    BRIDGE-MIB::dot1dStpPortForwardTransitions.3 = Counter32: 1
    RSTP-MIB::dot1dStpVersion.0 = INTEGER: rstp(2)

Der Wert der Variable ``dot1dStpTopChanges.0`` ist hier 2, die
STP-Topologie der Bridge wurde also bereits zweimal ge?ndert. Unter
einer ?nderung versteht man dabei die Anpassung eines oder mehrerer
Links und die Kalkulation eines neuen Baums. Der Wert der Variable
``dot1dStpTimeSinceTopologyChange.0`` gibt an, wann dies zuletzt
geschah.

Um mehrere Bridge-Schnittstellen zu ?berwachen, k?nnen Sie den privaten
BEGEMOT-BRIDGE-MIB einsetzen:

.. code:: screen

    % snmpwalk -v 2c -c public bridge1.example.com
    enterprises.fokus.begemot.begemotBridge
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseName."bridge0" = STRING: bridge0
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseName."bridge2" = STRING: bridge2
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseAddress."bridge0" = STRING: e:ce:3b:5a:9e:13
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseAddress."bridge2" = STRING: 12:5e:4d:74:d:fc
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseNumPorts."bridge0" = INTEGER: 1
    BEGEMOT-BRIDGE-MIB::begemotBridgeBaseNumPorts."bridge2" = INTEGER: 1
    ...
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpTimeSinceTopologyChange."bridge0" = Timeticks: (116927) 0:19:29.27 centi-seconds
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpTimeSinceTopologyChange."bridge2" = Timeticks: (82773) 0:13:47.73 centi-seconds
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpTopChanges."bridge0" = Counter32: 1
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpTopChanges."bridge2" = Counter32: 1
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpDesignatedRoot."bridge0" = Hex-STRING: 80 00 00 40 95 30 5E 31
    BEGEMOT-BRIDGE-MIB::begemotBridgeStpDesignatedRoot."bridge2" = Hex-STRING: 80 00 00 50 8B B8 C6 A9

Um die ?ber den ``mib-2.dot1dBridge``-Subtree ?berwachte
Bridge-Schnittstelle zu ?ndern, geben Sie Folgendes ein:

.. code:: screen

    % snmpset -v 2c -c private bridge1.example.com
    BEGEMOT-BRIDGE-MIB::begemotBridgeDefaultBridgeIf.0 s bridge2

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+--------------------------------------------+--------------------------------------------+
| `Zur?ck <network-bluetooth.html>`__?   | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <network-aggregation.html>`__   |
+----------------------------------------+--------------------------------------------+--------------------------------------------+
| 33.5. Bluetooth?                       | `Zum Anfang <index.html>`__                | ?33.7. Link-Aggregation und Failover       |
+----------------------------------------+--------------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
