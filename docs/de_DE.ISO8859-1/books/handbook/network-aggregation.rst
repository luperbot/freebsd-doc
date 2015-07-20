===================================
33.7. Link-Aggregation und Failover
===================================

.. raw:: html

   <div class="navheader">

33.7. Link-Aggregation und Failover
`Zur?ck <network-bridging.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <network-diskless.html>`__

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

33.7. Link-Aggregation und Failover
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Andrew Thompson.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedict Reuschling und Sharon Bahagi.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die von FreeBSD unterst?tzte
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__-Schnittstelle
erlaubt die Gruppierung von mehreren Netzwerkadaptern als eine virtuelle
Schnittstelle mit dem Ziel, Ausfallsicherheit (Failover) und Link
Aggregation bereitzustellen. Bei Failover kann der Verkehr auch dann
weiter flie?en, wenn nur eine Schnittstelle verf?gbar ist. Link
Aggregation funktioniert am besten mit Switches, welche LACP
unterst?tzen, da dieses Protokoll den Datenverkehr bidirektional
verteilt, w?hrend es auch auf den Ausfall einzelner Verbindungen
reagiert.

Die von der lagg-Schnittstelle unterst?tzten Protokolle bestimmten,
welche Ports f?r den ausgehenden Datenverkehr benutzt werden, und ob ein
bestimmter Port eingehenden Datenverkehr akzeptiert. Die folgenden
Protokolle werden von
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__
unterst?tzt:

.. raw:: html

   <div class="variablelist">

failover (Ausfallsicherheit)
    Dieser Modus sendet und empf?ngt Datenverkehr nur auf dem
    Masterport. Sollte der Masterport nicht zur Verf?gung stehen, wird
    der n?chste aktive Port verwendet. Der zuerst hinzugef?gte Adapter
    der virtuellen Schnittstelle wird zum Masterport, jeder weitere
    Adapter dient als Ger?t zur Ausfallsicherheit. Wenn ein Failover auf
    einem Nicht-Master Port stattfindet, wird der urspr?ngliche Port
    wieder zum Master-Port, sobald er wieder verf?gbar ist.

fec / loadbalance (Lastverteilung)
    Cisco? Fast EtherChannel? (FEC) findet sich auf ?lteren Cisco?
    Switches. Es bietet eine statische Konfiguration und handelt weder
    Aggregation mit der Gegenstelle aus, noch werden Frames zur
    ?berwachung der Verbindung ausgetauscht. Wenn der Switch LACP
    unterst?tzt, sollte diese Option auch verwendet werden.

lacp
    Das IEEE? 802.3ad Link-Aggregation Control Protokoll (LACP). Mit
    LACP wird eine Menge von aggregierbaren Verbindungen mit der
    Gegenstelle in einer oder mehreren Link Aggregated Groups (LAG)
    ausgehandelt. Jede LAG besteht aus Ports der gleichen
    Geschwindigkeit, eingestellt auf Voll-Duplex-Betrieb. Der Verkehr
    wird ?ber die Ports in der LAG mit der gr??ten Gesamtgeschwindigkeit
    balanciert. Typischerweise gibt es nur eine LAG, die alle Ports
    enth?lt. Im Falle von ?nderungen in der physischen Anbindung wird
    LACP schnell zu einer neuen Konfiguration konvergieren.

    LACP balanciert ausgehenden Verkehr ?ber die aktiven Ports basierend
    auf der gehashten Protokollheaderinformation und akzeptiert
    eingehenden Verkehr auf jedem aktiven Port. Der Hash beinhaltet die
    Ethernet-Quell- und Zieladresse, und, soweit verf?gbar, den
    VLAN-Tag, sowie die IPv4 oder IPv6 Quell- und Zieladresse.

roundrobin
    Dieser Modus verteilt ausgehenden Verkehr mittels einer
    Round-Robin-Zuteilung ?ber alle aktiven Ports und akzeptiert
    eingehenden Verkehr auf jedem aktiven Port. Da dieser Modus die
    Reihenfolge von Ethernet-Frames verletzt, sollte er mit Vorsicht
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

33.7.1. Beispiele
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt zeigt, wie man einen Cisco? Switch und ein
FreeBSD-System f?r LACP Load Balancing konfiguriert. Weiterhin wird
gezeigt, wie man zwei Ethernet-Schnittstellen, sowie eine Ethernet- und
eine Drahtlos-Schnittstelle f?r den Failover-Modus konfigurieren kann.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 33.1. LACP Aggregation mit einem Switch von Cisco?

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Dieses Beispiel verbindet zwei
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4>`__
Ethernet-Schnittstellen einer FreeBSD-Maschine zu den ersten zwei
Ethernet-Ports auf einem Cisco? Switch als eine einzelne, lastverteilte
und ausfallsichere Verbindung. Weitere Adapter k?nnen hinzugef?gt
werden, um den Durchsatz zu erh?hen und die Ausfallsicherheit zu
steigern. Ersetzen Sie die Namen der Cisco?-Ports, Ethernet-Ger?te,
channel-group Nummern und IP-Adressen im Beispiel durch Namen, die mit
Ihrer lokalen Konfiguration ?bereinstimmen.

Da die Reihenfolge der Frames bei Ethernet zwingend eingehalten werden
muss, flie?t auch jeglicher Verkehr zwischen zwei Stationen ?ber den
gleichen physischen Kanal, was die maximale Geschwindigkeit der
Verbindung auf die eines einzelnen Adapters beschr?nkt. Der
?bertragungsalgorithmus versucht, so viele Informationen wie m?glich zu
verwenden, um die verschiedenen Verkehrsfl?sse zu unterscheiden und
balanciert diese ?ber die verf?gbaren Adapter.

F?gen Sie auf dem Cisco?-Switch die Adapter *``FastEthernet0/1``* und
*``FastEthernet0/2``* zu der channel-group *``1``* hinzu:

.. code:: screen

    interface
    FastEthernet0/1
     channel-group 1 mode active
     channel-protocol lacp
    !
    interface FastEthernet0/2
     channel-group 1 mode active
     channel-protocol lacp

Auf der Maschine mit FreeBSD erstellen Sie die
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__-Schnittstelle
unter Verwendung von *``fxp0``* und *``fxp1``* und starten Sie
Schnittstelle mit der IP-Adresse *``10.0.0.3/24``*:

.. code:: screen

    # ifconfig
    fxp0 up
    # ifconfig fxp1
    up
    # ifconfig lagg0 create 
    # ifconfig lagg0 up laggproto lacp laggport
    fxp0 laggport
    fxp1
    10.0.0.3/24

Als n?chstes, ?berpr?fen Sie den Status der virtuellen Schnittstelle:

.. code:: screen

    # ifconfig lagg0
    lagg0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=8<VLAN_MTU>
            ether 00:05:5d:71:8d:b8
            media: Ethernet autoselect
            status: active
            laggproto lacp
            laggport: fxp1 flags=1c<ACTIVE,COLLECTING,DISTRIBUTING>
            laggport: fxp0 flags=1c<ACTIVE,COLLECTING,DISTRIBUTING>

Ports, die als *ACTIVE* markiert sind, sind Teil der aktiven
Aggregations-Gruppe, die mit dem Switch ausgehandelt wurde und der
Verkehr wird ?ber diese ?bertragen und empfangen. Benutzen Sie ``-v`` im
obigen Kommando, um sich die LAG-Bezeichner anzeigen zu lassen.

Um den Status der Ports auf dem Cisco? Switch anzuzeigen:

.. code:: screen

    switch# show lacp neighbor
    Flags:  S - Device is requesting Slow LACPDUs
            F - Device is requesting Fast LACPDUs
            A - Device is in Active mode       P - Device is in Passive mode

    Channel group 1 neighbors

    Partner's information:

                      LACP port                        Oper    Port     Port
    Port      Flags   Priority  Dev ID         Age     Key     Number   State
    Fa0/1     SA      32768     0005.5d71.8db8  29s    0x146   0x3      0x3D
    Fa0/2     SA      32768     0005.5d71.8db8  29s    0x146   0x4      0x3D

Benutzen Sie das Kommando **``show lacp neighbor       detail``**, um
weitere Informationen zu erhalten.

Damit diese Konfiguration auch nach einem Neustart erhalten bleibt,
f?gen Sie auf Ihrem FreeBSD-System folgende Eintr?ge in ``/etc/rc.conf``
hinzu:

.. code:: programlisting

    ifconfig_fxp0="up"
    ifconfig_fxp1="up"
    cloned_interfaces="lagg0
    ifconfig_lagg0="laggproto lacp laggport fxp0 laggport fxp1 10.0.0.3/24"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 33.2. Ausfallsicherer Modus

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Der ausfallsichere Modus kann verwendet werden, um zu einer zweiten
Schnittstelle zu wechseln, sollte die Verbindung mit der
Master-Schnittstelle ausfallen. Um den ausfallsicheren Modus zu
konfigurieren, stellen Sie sicher, dass die zugrunde liegenden
physikalischen Schnittstellen aktiv sind. Erstellen Sie dann die
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__-Schnittstelle.
In diesem Beispiel ist *``fxp0``* die Master-Schnittstelle, *``fxp1``*
die sekund?re Schnittstelle, und der virtuellen Schnittstelle wird die
IP-Adresse *``10.0.0.15/24``* zugewiesen:

.. code:: screen

    # ifconfig
    fxp0 up
    # ifconfig fxp1
    up
    # ifconfig lagg0 create
    # ifconfig lagg0 up laggproto failover laggport
    fxp0 laggport
    fxp1
    10.0.0.15/24

Die virtuelle Schnittstelle sollte in etwa so aussehen:

.. code:: screen

    # ifconfig lagg0
    lagg0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=8<VLAN_MTU>
            ether 00:05:5d:71:8d:b8
            inet 10.0.0.15 netmask 0xffffff00 broadcast 10.0.0.255
            media: Ethernet autoselect
            status: active
            laggproto failover
            laggport: fxp1 flags=0<>
            laggport: fxp0 flags=5<MASTER,ACTIVE>

Der Verkehr wird auf *``fxp0``* ?bertragen und empfangen. Wenn die
Verbindung auf *``fxp0``* abbricht, so wird *``fxp1``* die Verbindung
?bernehmen. Sobald die Verbindung auf der Master-Schnittstelle
wiederhergestellt ist, wird diese auch wieder als aktive Schnittstelle
genutzt.

Damit diese Konfiguration auch nach einem Neustart erhalten bleibt,
f?gen Sie folgende Eintr?ge in ``/etc/rc.conf`` hinzu:

.. code:: programlisting

    ifconfig_fxp0="up"
    ifconfig_fxp1="up"
    cloned_interfaces="lagg0
    ifconfig_lagg0="laggproto failover laggport fxp0 laggport fxp1 10.0.0.15/24"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 33.3. Failover Modus zwischen Ethernet- und
Wireless-Schnittstellen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

F?r Laptop-Benutzer ist es normalerweise w?nschenswert, wireless als
sekund?re Schnittstelle einzurichten, die verwendet wird, wenn die
Ethernet-Verbindung nicht verf?gbar ist. Mit
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__
ist es m?glich, ein Failover zu konfigurieren, welches die
Ethernet-Verbindung aus Performance- und Sicherheitsgr?nden bevorzugt,
w?hrend es gleichzeitig m?glich bleibt, Daten ?ber die drahtlose
Verbindung zu ?bertragen.

Dies wird durch das ?berschreiben der physikalischen MAC-Adresse der
drahtlosen Schnittstelle, durch die der Ethernet-Schnittstelle erreicht.

In dieser Konfiguration behandeln wir die Ethernet-Schnittstelle
*``bge0``* als die Master und die drahtlose Schnittstelle *``wlan0``*
als die Failover-Schnittstelle. Die *``wlan0``* wurde von der *``iwn0``*
mit der MAC-Adresse der Ethernet-Schnittstelle eingerichtet. Im ersten
Schritt ermitteln wir die MAC-Adresse der Ethernet-Schnittstelle:

.. code:: screen

    # ifconfig bge0
    bge0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
     options=19b<RXCSUM,TXCSUM,VLAN_MTU,VLAN_HWTAGGING,VLAN_HWCSUM,TSO4>
     ether 00:21:70:da:ae:37
     inet6 fe80::221:70ff:feda:ae37%bge0 prefixlen 64 scopeid 0x2
     nd6 options=29<PERFORMNUD,IFDISABLED,AUTO_LINKLOCAL>
     media: Ethernet autoselect (1000baseT <full-duplex>)
     status: active

Ersetzen Sie *``bge0``* durch den Namen der Ethernet-Schnittstelle Ihres
Systems. Die ``ether``-Zeile wird die MAC-Adresse der angegebenen
Schnittstelle enthalten. ?ndern Sie nun die MAC-Adresse der zugrunde
liegenden Wireless-Schnittstelle:

.. code:: screen

    # ifconfig
    iwn0 ether
    00:21:70:da:ae:37

Starten Sie den Wireless-Schnittstelle, aber ohne IP-Adresse:

.. code:: screen

    # ifconfig wlan0 create wlandev
    iwn0 ssid
    my_router up

Stellen Sie sicher, dass die *``bge0``*-Schnittstelle aktiv ist.
Erstellen Sie dann die
`lagg(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lagg&sektion=4>`__-Schnittstelle
mit *``bge0``* als Master mit Failover auf *``wlan0``*:

.. code:: screen

    # ifconfig
    bge0 up
    # ifconfig lagg0 create
    # ifconfig lagg0 up laggproto failover laggport
    bge0 laggport wlan0

Die virtuelle Schnittstelle sollte in etwa so aussehen:

.. code:: screen

    # ifconfig lagg0
    lagg0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=8<VLAN_MTU>
            ether 00:21:70:da:ae:37
            media: Ethernet autoselect
            status: active
            laggproto failover
            laggport: wlan0 flags=0<>
            laggport: bge0 flags=5<MASTER,ACTIVE>

Damit diese Konfiguration auch nach einem Neustart erhalten bleibt,
f?gen Sie folgende Eintr?ge in ``/etc/rc.conf`` hinzu:

.. code:: programlisting

    ifconfig_bge0="up"
    ifconfig_iwn0="ether
    00:21:70:da:ae:37"
    wlans_iwn0="wlan0"
    ifconfig_wlan0="WPA"
    cloned_interfaces="lagg0"
    ifconfig_lagg0="laggproto failover laggport
    bge0 laggport wlan0
    DHCP"

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

+----------------------------------------+--------------------------------------------+-----------------------------------------+
| `Zur?ck <network-bridging.html>`__?    | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <network-diskless.html>`__   |
+----------------------------------------+--------------------------------------------+-----------------------------------------+
| 33.6. LAN-Kopplung mit einer Bridge?   | `Zum Anfang <index.html>`__                | ?33.8. Plattenloser Betrieb mit PXE     |
+----------------------------------------+--------------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
