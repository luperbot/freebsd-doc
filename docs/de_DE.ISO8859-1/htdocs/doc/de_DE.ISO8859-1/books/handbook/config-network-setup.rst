===================================
12.8. Einrichten von Netzwerkkarten
===================================

.. raw:: html

   <div class="navheader">

12.8. Einrichten von Netzwerkkarten
`Zur?ck <configtuning-rcd.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-virtual-hosts.html>`__

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

12.8. Einrichten von Netzwerkkarten
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Rechner ohne Netzanschluss ist heute nicht mehr vorstellbar. Die
Konfiguration einer Netzwerkkarte geh?rt zu den allt?glichen Aufgaben
eines FreeBSD Administrators.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.8.1. Bestimmen des richtigen Treibers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie anfangen, sollten Sie das Modell Ihrer Karte kennen, wissen
welchen Chip die Karte benutzt und bestimmen, ob es sich um eine PCI-
oder ISA-Karte handelt. Eine Aufz?hlung der unterst?tzten PCI- und
ISA-Karten finden Sie in der Liste der unterst?tzen Ger?te. Schauen Sie
nach, ob Ihre Karte dort aufgef?hrt ist.

Wenn Sie wissen, dass Ihre Karte unterst?tzt wird, m?ssen Sie den
Treiber f?r Ihre Karte bestimmen. ``/usr/src/sys/conf/NOTES`` und
``/usr/src/sys/arch/conf/NOTES`` enthalten eine Liste der verf?gbaren
Treiber mit Informationen zu den unterst?tzten Chips?tzen und Karten.
Wenn Sie sich nicht sicher sind, ob Sie den richtigen Treiber ausgew?hlt
haben, lesen Sie die Hilfeseite des Treibers. Die Hilfeseite enth?lt
weitere Informationen ?ber die unterst?tzten Ger?te und macht auch auf
m?gliche Probleme aufmerksam.

Wenn Sie eine gebr?uchliche Karte besitzen, brauchen Sie meistens nicht
lange nach dem passenden Treiber zu suchen. Die Treiber zu diesen Karten
sind schon im ``GENERIC``-Kernel enthalten und die Karte sollte w?hrend
des Systemstarts erkannt werden:

.. code:: screen

    dc0: <82c169 PNIC 10/100BaseTX> port 0xa000-0xa0ff mem 0xd3800000-0xd38
    000ff irq 15 at device 11.0 on pci0
    miibus0: <MII bus> on dc0
    bmtphy0: <BCM5201 10/100baseTX PHY> PHY 1 on miibus0
    bmtphy0:  10baseT, 10baseT-FDX, 100baseTX, 100baseTX-FDX, auto
    dc0: Ethernet address: 00:a0:cc:da:da:da
    dc0: [ITHREAD]
    dc1: <82c169 PNIC 10/100BaseTX> port 0x9800-0x98ff mem 0xd3000000-0xd30
    000ff irq 11 at device 12.0 on pci0
    miibus1: <MII bus> on dc1
    bmtphy1: <BCM5201 10/100baseTX PHY> PHY 1 on miibus1
    bmtphy1:  10baseT, 10baseT-FDX, 100baseTX, 100baseTX-FDX, auto
    dc1: Ethernet address: 00:a0:cc:da:da:db
    dc1: [ITHREAD]

Im Beispiel erkennt das System zwei Karten, die den
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4>`__
Treiber benutzen.

Ist der Treiber f?r Ihre Netzwerkkarte nicht in ``GENERIC`` enthalten,
m?ssen Sie den Treiber laden, um die Karte zu benutzen. Sie k?nnen den
Treiber auf zwei Arten laden:

.. raw:: html

   <div class="itemizedlist">

-  Am einfachsten ist es, das Kernelmodul f?r Ihre Karte mit
   `kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
   zu laden. Allerdings gibt es nicht f?r alle Karten Kernelmodule; zum
   Beispiel gibt es keine Kernelmodule f?r ISA-Karten.

-  Alternativ k?nnen Sie den Treiber f?r die Karte fest in den Kernel
   einbinden. Schauen Sie sich dazu ``/usr/src/sys/conf/NOTES``,
   ``/usr/src/sys/arch/conf/NOTES`` und die Hilfeseite des Treibers, den
   Sie in den Kernel einbinden m?chten, an. Die ?bersetzung des Kernels
   wird in `Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__ beschrieben. Wenn Ihre Karte
   w?hrend des Systemstarts vom Kernel (``GENERIC``) erkannt wurde,
   m?ssen Sie den Kernel nicht neu ?bersetzen.

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

12.8.1.1. Windows?-NDIS-Treiber einsetzen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Leider stellen nach wie vor viele Unternehmen die Spezifikationen ihrer
Treiber der Open Source Gemeinde nicht zur Verf?gung, weil sie diese
Informationen als Gesch?ftsgeheimnisse betrachten. Daher haben die
Entwickler von FreeBSD und anderen Betriebssystemen nur zwei
M?glichkeiten. Entweder versuchen sie in einem aufw?ndigen Prozess den
Treiber durch *Reverse Engineering* nachzubauen, oder sie versuchen, die
vorhandenen Bin?rtreiber der Microsoft??Windows?-Plattform zu verwenden.
Die meisten Entwickler, darunter auch die an FreeBSD beteiligten, haben
sich f?r den zweiten Ansatz entschieden.

Bill Paul (wpaul) ist es zu verdanken, dass es seit eine „native“
Unterst?tzung der *Network Driver Interface Specification* (NDIS) gibt.
Der FreeBSD NDISulator (auch als Project Evil bekannt) nutzt den bin?ren
Windows?-Treiber, indem er diesem vorgibt, unter Windows? zu laufen. Da
der
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4>`__-Treiber
eine Windows?-Bin?rdatei nutzt, kann er nur auf i386™- und
amd64-Systemen verwendet werden. Unterst?tzt werden PCI, CardBus, PCMCIA
(PC-Card) und USB-Ger?te.

Um den NDISulator zu verwenden, ben?tigen Sie drei Dinge:

.. raw:: html

   <div class="orderedlist">

#. Die Kernelquellen

#. Den Windows??XP-Bin?rtreiber (mit der Erweiterung ``.SYS``)

#. Die Konfigurationsdatei des Windows??XP-Treibers (mit der Erweiterung
   ``.INF``)

.. raw:: html

   </div>

Suchen Sie die Dateien f?r Ihre Karte. Diese befinden sich meistens auf
einer beigelegten CD-ROM, oder k?nnen von der Internetseite des
Herstellers heruntergeladen werden. In den folgenden Beispielen werden
die Dateien ``W32DRIVER.SYS`` und ``W32DRIVER.INF`` verwendet.

Die Architektur des Treibers muss zur jeweiligen Version von FreeBSD
passen. Benutzen Sie einen Windows? 32-bit Treiber f?r FreeBSD/i386. F?r
FreeBSD/amd64 wird ein Windows? 64-bit Treiber ben?tigt.

Als N?chstes kompilieren Sie den bin?ren Treiber, um ein Kernelmodul zu
erzeugen. Dazu rufen Sie als ``root``
`ndisgen(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndisgen&sektion=8>`__
auf:

.. code:: screen

    # ndisgen /path/to/W32DRIVER.INF /path/to/W32DRIVER.SYS

`ndisgen(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ndisgen&sektion=8>`__
arbeitet interaktiv, ben?tigt es weitere Informationen, so fragt es Sie
danach. Als Ergebnis erhalten Sie ein Kernelmodul im aktuellen
Arbeitsverzeichnis. Benutzen Sie
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
um das neue Modul zu laden:

.. code:: screen

    # kldload ./W32DRIVER.ko

Neben dem vorhin erzeugten Kernelmodul m?ssen Sie auch die Kernelmodule
``ndis.ko`` und ``if_ndis.ko`` laden. Diese Module sollten automatisch
geladen werden, wenn Sie ein von
`ndis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ndis&sektion=4>`__
abh?ngiges Modul laden. Wollen Sie die Module hingegen manuell laden,
geben Sie die folgenden Befehle ein:

.. code:: screen

    # kldload ndis
    # kldload if_ndis

Der erste Befehl l?dt dabei den NDIS-Miniport-Treiber, der zweite das
tats?chliche Netzwerkger?t.

?berpr?fen Sie nun die Ausgabe von
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
auf eventuelle Fehler w?hrend des Ladevorgangs. Gab es dabei keine
Probleme, sollten Sie eine Ausgabe ?hnlich der folgenden erhalten:

.. code:: screen

    ndis0: <Wireless-G PCI Adapter> mem 0xf4100000-0xf4101fff irq 3 at device 8.0 on pci1
    ndis0: NDIS API version: 5.0
    ndis0: Ethernet address: 0a:b1:2c:d3:4e:f5
    ndis0: 11b rates: 1Mbps 2Mbps 5.5Mbps 11Mbps
    ndis0: 11g rates: 6Mbps 9Mbps 12Mbps 18Mbps 36Mbps 48Mbps 54Mbps

Ab jetzt k?nnen Sie mit dem Ger?t ``ndis0`` wie mit jeder anderen
Ger?tedatei (etwa ``dc0``) arbeiten.

Wie jedes Kernelmodul k?nnen auch die NDIS-Module beim Systemstart
automatisch geladen werden. Dazu kopieren Sie das erzeugte Modul
(``W32DRIVER_SYS.ko``) in das Verzeichnis ``/boot/modules``. Danach
f?gen Sie die folgende Zeile in ``/boot/loader.conf`` ein:

.. code:: programlisting

    W32DRIVER_SYS_load="YES"

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

12.8.2. Konfiguration von Netzwerkkarten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem der richtige Treiber f?r die Karte geladen ist, muss die Karte
konfiguriert werden. Unter Umst?nden ist die Karte schon w?hrend der
Installation mit sysinstall konfiguriert worden.

Das nachstehende Kommando zeigt die Konfiguration der Karten eines
Systems an:

.. code:: screen

    % ifconfig
    dc0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=80008<VLAN_MTU,LINKSTATE>
            ether 00:a0:cc:da:da:da
            inet 192.168.1.3 netmask 0xffffff00 broadcast 192.168.1.255
            media: Ethernet autoselect (100baseTX <full-duplex>)
            status: active
    dc1: flags=8802<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=80008<VLAN_MTU,LINKSTATE>
            ether 00:a0:cc:da:da:db
            inet 10.0.0.1 netmask 0xffffff00 broadcast 10.0.0.255
            media: Ethernet 10baseT/UTP
            status: no carrier
    plip0: flags=8810<POINTOPOINT,SIMPLEX,MULTICAST> metric 0 mtu 1500
    lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> metric 0 mtu 16384
            options=3<RXCSUM,TXCSUM>
            inet6 fe80::1%lo0 prefixlen 64 scopeid 0x4
            inet6 ::1 prefixlen 128
            inet 127.0.0.1 netmask 0xff000000
            nd6 options=3<PERFORMNUD,ACCEPT_RTADV>

Im Beispiel werden Informationen zu den folgenden Ger?ten angezeigt:

.. raw:: html

   <div class="itemizedlist">

-  ``dc0``: Der erste Ethernet-Adapter

-  ``dc1``: Der zweite Ethernet-Adapter

-  ``plip0``: Die parallele Schnittstelle (falls Ihr System ?ber eine
   derartige Schnittstelle verf?gt)

-  ``lo0``: Das Loopback-Ger?t

.. raw:: html

   </div>

Der Name der Netzwerkkarte wird aus dem Namen des Treibers und einer
Zahl zusammengesetzt. Die Zahl gibt die Reihenfolge an, in der die
Ger?te beim Systemstart erkannt wurden. Die dritte Karte, die den
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4>`__
Treiber benutzt, w?rde beispielsweise ``sis2`` hei?en.

Der Adapter ``dc0`` aus dem Beispiel ist aktiv. Sie erkennen das an den
folgenden Hinweisen:

.. raw:: html

   <div class="orderedlist">

#. ``UP`` bedeutet, dass die Karte konfiguriert und aktiv ist.

#. Der Karte wurde die Internet-Adresse (``inet``) ``192.168.1.3``
   zugewiesen.

#. Die Subnetzmaske ist richtig (``0xffffff00`` entspricht
   ``255.255.255.0``).

#. Die Broadcast-Adresse ``192.168.1.255`` ist richtig.

#. Die MAC-Adresse der Karte (``ether``) lautet ``00:a0:cc:da:da:da``.

#. Die automatische Medienerkennung ist aktiviert
   (``media: Ethernet autoselect (100baseTX           <full-duplex>)``).
   Der Adapter ``dc1`` benutzt das Medium ``10baseT/UTP``. Weitere
   Informationen ?ber die einstellbaren Medien entnehmen Sie bitte der
   Hilfeseite des Treibers.

#. Der Verbindungsstatus (``status``) ist ``active``, das hei?t es wurde
   ein Tr?gersignal entdeckt. F?r ``dc1`` wird ``status: no carrier``
   angezeigt. Das ist normal, wenn kein Kabel an der Karte angeschlossen
   ist.

.. raw:: html

   </div>

W?re die Karte nicht konfiguriert, w?rde die Ausgabe von
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
so aussehen:

.. code:: screen

    dc0: flags=8843<BROADCAST,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=80008<VLAN_MTU,LINKSTATE>
            ether 00:a0:cc:da:da:da
            media: Ethernet autoselect (100baseTX <full-duplex>)
            status: active

Sie brauchen die Berechtigungen von ``root``, um Ihre Karte zu
konfigurieren. Die Konfiguration kann auf der Kommandozeile mit
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
erfolgen, allerdings m?sste sie dann nach jedem Neustart wiederholt
werden. Dauerhaft wird die Karte in ``/etc/rc.conf`` konfiguriert.

?ffnen Sie ``/etc/rc.conf`` mit Ihrem Lieblingseditor und f?gen Sie f?r
jede Karte Ihres Systems eine Zeile hinzu. In dem hier diskutierten Fall
wurden die nachstehenden Zeilen eingef?gt:

.. code:: programlisting

    ifconfig_dc0="inet 192.168.1.3 netmask 255.255.255.0"
    ifconfig_dc1="inet 10.0.0.1 netmask 255.255.255.0 media 10baseT/UTP"

Ersetzen Sie ``dc0``, ``dc1`` usw. durch die Ger?tenamen Ihrer Karten
und setzen Sie die richtigen IP-Adressen ein. Die Hilfeseiten des
Treibers und
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
enthalten weitere Einzelheiten ?ber verf?gbare Optionen. Die Syntax von
``/etc/rc.conf`` wird in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
erkl?rt.

Wenn Sie das Netz w?hrend der Installation konfiguriert haben,
existieren vielleicht schon Eintr?ge f?r Ihre Karten. ?berpr?fen Sie
``/etc/rc.conf`` bevor Sie weitere Zeilen hinzuf?gen.

In ``/etc/hosts`` k?nnen Sie die Namen und IP-Adressen der Rechner Ihres
LANs eintragen. Weitere Informationen entnehmen Sie bitte
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__
und ``/usr/share/examples/etc/hosts``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Soll Ihr System sich auch mit dem Internet verbinden k?nnen, m?ssen Sie
Default-Gateway und Nameserver manuell konfigurieren:

.. code:: screen

    # echo 'defaultrouter="Ihr_Default_Gateway"' >> /etc/rc.conf
    # echo 'nameserver Ihr_DNS_Server' >> /etc/resolv.conf

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

12.8.3. Test und Fehlersuche
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie die notwendigen ?nderungen in ``/etc/rc.conf`` vorgenommen
haben, f?hren Sie einen Neustart Ihres Systems durch. Dadurch werden die
Adapter konfiguriert und Sie stellen sicher, dass der Start ohne
Konfigurationsfehler erfolgt. Alternativ k?nnen Sie auch lediglich die
Netzwerkeinstellungen neu initialisieren:

.. code:: screen

    # /etc/rc.d/netif restart

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Haben Sie ein Default-Gateway definiert (in der Datei ``/etc/rc.conf``),
m?ssen Sie auch den folgenden Befehl ausf?hren:

.. code:: screen

    # /etc/rc.d/routing restart

.. raw:: html

   </div>

Wenn das System gestartet ist, sollten Sie die Netzwerkkarten testen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.8.3.1. Test der Ethernet-Karte
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit zwei Tests k?nnen Sie pr?fen, ob die Ethernet-Karte richtig
konfiguriert ist. Testen Sie zuerst mit ``ping`` den Adapter selbst und
sprechen Sie dann eine andere Maschine im LAN an.

Zuerst, der Test des Adapters:

.. code:: screen

    % ping -c5 192.168.1.3
    PING 192.168.1.3 (192.168.1.3): 56 data bytes
    64 bytes from 192.168.1.3: icmp_seq=0 ttl=64 time=0.082 ms
    64 bytes from 192.168.1.3: icmp_seq=1 ttl=64 time=0.074 ms
    64 bytes from 192.168.1.3: icmp_seq=2 ttl=64 time=0.076 ms
    64 bytes from 192.168.1.3: icmp_seq=3 ttl=64 time=0.108 ms
    64 bytes from 192.168.1.3: icmp_seq=4 ttl=64 time=0.076 ms

    --- 192.168.1.3 ping statistics ---
    5 packets transmitted, 5 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 0.074/0.083/0.108/0.013 ms

Jetzt versuchen wir, eine andere Maschine im LAN zu erreichen:

.. code:: screen

    % ping -c5 192.168.1.2
    PING 192.168.1.2 (192.168.1.2): 56 data bytes
    64 bytes from 192.168.1.2: icmp_seq=0 ttl=64 time=0.726 ms
    64 bytes from 192.168.1.2: icmp_seq=1 ttl=64 time=0.766 ms
    64 bytes from 192.168.1.2: icmp_seq=2 ttl=64 time=0.700 ms
    64 bytes from 192.168.1.2: icmp_seq=3 ttl=64 time=0.747 ms
    64 bytes from 192.168.1.2: icmp_seq=4 ttl=64 time=0.704 ms

    --- 192.168.1.2 ping statistics ---
    5 packets transmitted, 5 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 0.700/0.729/0.766/0.025 ms

Sie k?nnen auch den Namen der Maschine anstelle von ``192.168.1.2``
benutzen, wenn Sie ``/etc/hosts`` entsprechend eingerichtet haben.

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

12.8.3.2. Fehlersuche
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Fehler zu beheben, ist immer sehr m?hsam. Indem Sie die einfachen Sachen
zuerst pr?fen, erleichtern Sie sich die Aufgabe. Steckt das
Netwerkkabel? Sind die Netzwerkdienste richtig konfiguriert?
Funktioniert die Firewall? Wird die Netwerkkarte von FreeBSD
unterst?tzt? Lesen Sie immer die Hardware-Informationen des Releases,
bevor Sie einen Fehlerbericht einsenden. Aktualisieren Sie Ihre
FreeBSD-Version auf -STABLE. Suchen Sie in den Archiven der
Mailinglisten oder auf dem Internet nach bekannten L?sungen.

Wenn die Karte funktioniert, die Verbindungen aber zu langsam sind,
lesen Sie bitte die Hilfeseite
`tuning(7) <http://www.FreeBSD.org/cgi/man.cgi?query=tuning&sektion=7>`__.
Pr?fen Sie auch die Netzwerkkonfiguration, da falsche Einstellungen die
Ursache f?r langsame Verbindungen sein k?nnen.

Wenn Sie viele device timeout Meldungen in den Systemprotokollen finden,
pr?fen Sie, dass es keinen Konflikt zwischen der Netzwerkkarte und
anderen Ger?ten Ihres Systems gibt. ?berpr?fen Sie nochmals die
Verkabelung. Unter Umst?nden ben?tigen Sie eine neue Netzwerkkarte.

Wenn Sie in den Systemprotokollen watchdog timeout Fehlermeldungen
finden, kontrollieren Sie zuerst die Verkabelung. ?berpr?fen Sie dann,
ob der PCI-Steckplatz der Karte Bus Mastering unterst?tzt. Auf einigen
?lteren Motherboards ist das nur f?r einen Steckplatz (meistens
Steckplatz 0) der Fall. Lesen Sie in der Dokumentation Ihrer Karte und
Ihres Motherboards nach, ob das vielleicht die Ursache des Problems sein
k?nnte.

Die Meldung No route to host erscheint, wenn Ihr System ein Paket nicht
zustellen kann. Das kann vorkommen weil beispielsweise keine
Default-Route gesetzt wurde oder das Netzwerkkabel nicht richtig steckt.
Schauen Sie in der Ausgabe von ``netstat -rn`` nach, ob eine Route zu
dem Zielsystem existiert. Wenn nicht, lesen Sie bitte das `Kapitel?33,
*Weiterf?hrende Netzwerkthemen* <advanced-networking.html>`__.

Die Meldung ping: sendto: Permission denied wird oft von einer falsch
konfigurierten Firewall verursacht. Wenn keine Regeln definiert wurden,
blockiert eine aktivierte Firewall alle Pakete, selbst einfache
``ping``-Pakete. Weitere Informationen erhalten Sie in `Kapitel?32,
*Firewalls* <firewalls.html>`__.

Falls die Leistung der Karte schlecht ist, setzen Sie die
Medienerkennung von ``autoselect`` (automatisch) auf das richtige
Medium. In vielen F?llen l?st diese Ma?nahme Leistungsprobleme. Wenn
nicht, pr?fen Sie nochmal die Netzwerkeinstellungen und lesen Sie die
Hilfeseite
`tuning(7) <http://www.FreeBSD.org/cgi/man.cgi?query=tuning&sektion=7>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+--------------------------------------+---------------------------------------------------+
| `Zur?ck <configtuning-rcd.html>`__?      | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-virtual-hosts.html>`__   |
+------------------------------------------+--------------------------------------+---------------------------------------------------+
| 12.7. Das rc-System f?r Systemdienste?   | `Zum Anfang <index.html>`__          | ?12.9. Virtual Hosts                              |
+------------------------------------------+--------------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
