===============
33.5. Bluetooth
===============

.. raw:: html

   <div class="navheader">

33.5. Bluetooth
`Zur?ck <network-usb-tethering.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <network-bridging.html>`__

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

33.5. Bluetooth
---------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Pav Lucistnik.

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

33.5.1. ?bersicht
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bluetooth erm?glicht die Bildung von pers?nlichen Netzwerken ?ber
drahtlose Verbindungen bei einer maximalen Reichweite von 10 Metern und
operiert im unlizensierten 2,4-GHz-Band. Solche Netzwerke werden
normalerweise spontan gebildet, wenn sich mobile Ger?te, wie
Mobiltelefone, Handhelds oder Notebooks miteinander verbinden. Im
Gegensatz zu Wireless LAN erm?glicht Bluetooth auch h?herwertige
Dienste, wie FTP-?hnliche Dateiserver, Filepushing, Sprach?bertragung,
Emulation von seriellen Verbindungen und andere mehr.

Der Bluetooth-Stack von FreeBSD verwendet das Netgraph-Framework
(`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4>`__).
Viele Bluetooth-USB-Adapter werden durch den
`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4>`__-Treiber
unterst?tzt. Auf dem Chip BCM2033 von Broadcom basierende
Bluetooth-Ger?te werden von den Treibern
`ubtbcmfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubtbcmfw&sektion=4>`__
sowie
`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4>`__
unterst?tzt. Die Bluetooth-PC-Card 3CRWB60-A von 3Com verwendet den
`ng\_bt3c(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bt3c&sektion=4>`__-Treiber.
Serielle sowie auf UART basierende Bluetooth-Ger?te werden von
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__,
`ng\_h4(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_h4&sektion=4>`__
sowie
`hcseriald(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcseriald&sektion=8>`__
unterst?tzt. Dieses Kapitel beschreibt die Verwendung von
USB-Bluetooth-Adaptern.

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

33.5.2. Die Bluetooth-Unterst?tzung aktivieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bluetooth-Unterst?tzung ist in der Regel als Kernelmodul verf?gbar.
Damit ein Ger?t funktioniert, muss der entsprechende Treiber im Kernel
geladen werden:

.. code:: screen

    # kldload ng_ubt

Ist das Bluetooth-Ger?t beim Systemstart angeschlossen, kann das
entsprechende Modul auch von ``/boot/loader.conf`` geladen werden:

.. code:: programlisting

    ng_ubt_load="YES"

Schlie?en Sie Ihren USB-Adapter an, sollte eine Meldung ?hnlich der
folgenden auf der Konsole (oder in syslog) erscheinen:

.. code:: screen

    ubt0: vendor 0x0a12 product 0x0001, rev 1.10/5.25, addr 2
    ubt0: Interface 0 endpoints: interrupt=0x81, bulk-in=0x82, bulk-out=0x2
    ubt0: Interface 1 (alt.config 5) endpoints: isoc-in=0x83, isoc-out=0x3,
          wMaxPacketSize=49, nframes=6, buffer size=294

Zum Starten und Beenden des Bluetooth-Stacks verwenden Sie
`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8>`__.
Es ist empfehlenswert, den Bluetooth-Stack zu beenden, bevor Sie den
Adapter entfernen. Selbst wenn Sie dies nicht tun, kommt es
(normalerweise) zu keinem fatalen Fehler. Wenn Sie den Bluetooth-Stack
starten, erhalten Sie eine Meldung ?hnlich der folgenden:

.. code:: screen

    # service bluetooth start ubt0
    BD_ADDR: 00:02:72:00:d4:1a
    Features: 0xff 0xff 0xf 00 00 00 00 00
    <3-Slot> <5-Slot> <Encryption> <Slot offset>
    <Timing accuracy> <Switch> <Hold mode> <Sniff mode>
    <Park mode> <RSSI> <Channel quality> <SCO link>
    <HV2 packets> <HV3 packets> <u-law log> <A-law log> <CVSD>
    <Paging scheme> <Power control> <Transparent SCO data>
    Max. ACL packet size: 192 bytes
    Number of ACL packets: 8
    Max. SCO packet size: 64 bytes
    Number of SCO packets: 8

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

33.5.3. Das Host Controller Interface (HCI)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das *Host Controller Interface* (HCI) bietet eine Befehlsschnittstelle
zum Basisbandcontroller und Linkmanager, sowie Zugriff auf den
Hardwarestatus und die Kontrollregister. Dadurch wird ein einheitlicher
Zugriff auf die F?higkeiten des Bluetooth-Basisbands m?glich. Die
HCI-Layer des Rechners tauschen Daten und Befehle mit der HCI-Firmware
der Bluetooth-Ger?te aus. ?ber den Host Controller Transport
Layer-Treiber (also den physikalischen Bus) k?nnen beide HCI-Layer
miteinander kommunizieren.

Eine einzelne Netgraph-Ger?tedatei vom Typ *hci* wird f?r ein einzelnes
Bluetooth-Ger?t erzeugt. Die HCI-Ger?tedatei ist normalerweise mit der
Bluetooth-Ger?tetreiberdatei (downstream) sowie der L2CAP-Ger?tedatei
(upstream) verbunden. Alle HCI-Operationen m?ssen ?ber die
HCI-Ger?tedatei und nicht ?ber die Treiberdatei erfolgen. Der
Standardname f?r die HCI-Ger?tedatei (die in
`ng\_hci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hci&sektion=4>`__
beschrieben wird) lautet „devicehci“.

Eine der wichtigsten Aufgaben ist das Auffinden von sich in Reichweite
befindenden Bluetooth-Ger?ten. Diese Funktion wird als *inquiry*
bezeichnet. Inquiry sowie andere mit HCI in Verbindung stehende
Funktionen werden von
`hccontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hccontrol&sektion=8>`__
zur Verf?gung gestellt. Das folgende Beispiel zeigt, wie man
herausfindet, welche Bluetooth-Ger?te sich in Reichweite befinden. Eine
solche Abfrage dauert nur wenige Sekunden. Beachten Sie, dass ein Ger?t
nur dann antwortet, wenn es sich im Modus *discoverable* befindet.

.. code:: screen

    % hccontrol -n ubt0hci inquiry
    Inquiry result, num_responses=1
    Inquiry result #0
           BD_ADDR: 00:80:37:29:19:a4
           Page Scan Rep. Mode: 0x1
           Page Scan Period Mode: 00
           Page Scan Mode: 00
           Class: 52:02:04
           Clock offset: 0x78ef
    Inquiry complete. Status: No error [00]

``BD_ADDR`` stellt, ?hnlich der MAC-Adresse einer Netzwerkkarte, die
eindeutige Adresse eines Bluetooth-Ger?tes dar. Diese Adresse ist f?r
die Kommunikation mit dem Ger?t n?tig. Es ist aber auch m?glich,
BD\_ADDR einen Klartextnamen zuzuweisen. Die Datei
``/etc/bluetooth/hosts`` enth?lt Informationen ?ber die bekannten
Bluetooth-Rechner. Das folgende Beispiel zeigt, wie man den
Klartextnamen eines entfernten Ger?ts in Erfahrung bringen kann:

.. code:: screen

    % hccontrol -n ubt0hci remote_name_request 00:80:37:29:19:a4
    BD_ADDR: 00:80:37:29:19:a4
    Name: Pav's T39

Wenn Sie ein entferntes Bluetooth-Ger?t abfragen, wird dieses Ihren
Rechner unter dem Namen „your.host.name (ubt0)“ finden. Dieser Name kann
aber jederzeit ge?ndert werden.

Bluetooth erm?glicht Punkt-zu-Punkt-Verbindungen (an denen nur zwei
Bluetooth-Ger?te beteiligt sind), aber auch
Punkt-zu-Multipunkt-Verbindungen, bei denen eine Verbindung von mehreren
Bluetooth-Ger?ten gemeinsam genutzt wird. Das folgende Beispiel zeigt,
wie man die aktiven Basisbandverbindungen des lokalen Ger?tes anzeigen
kann:

.. code:: screen

    % hccontrol -n ubt0hci read_connection_list
    Remote BD_ADDR    Handle Type Mode Role Encrypt Pending Queue State
    00:80:37:29:19:a4     41  ACL    0 MAST    NONE       0     0 OPEN

Ein *connection handle* ist f?r die Beendigung einer Basisbandverbindung
n?tzlich. Im Normalfall werden inaktive Verbindungen aber automatisch
vom Bluetooth-Stack getrennt.

.. code:: screen

    # hccontrol -n ubt0hci disconnect 41
    Connection handle: 41
    Reason: Connection terminated by local host [0x16]

Rufen Sie ``hccontrol help`` auf, wenn Sie eine komplette Liste aller
verf?gbaren HCI-Befehle ben?tigen. Die meisten dieser Befehle m?ssen
nicht als ``root`` ausgef?hrt werden.

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

33.5.4. Das Logical Link Control and Adaptation Protocol (L2CAP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das *Logical Link Control and Adaptation Protocol* (L2CAP) bietet
h?herwertigen Protokollen verbindungsorientierte und verbindungslose
Datendienste an. Dazu geh?ren auch Protokollmultiplexing, Segmentierung
und Reassemblierung. L2CAP erlaubt h?herwertigen Protokollen und
Programmen den Versand und Empfang von L2CAP-Datenpaketen mit einer
L?nge von bis zu 64 Kilobytes.

L2CAP arbeitet *kanal*basiert. Ein Kanal ist eine logische Verbindung
innerhalb einer Basisbandverbindung. Jeder Kanal ist dabei an ein
einziges Protokoll gebunden. Mehrere Ger?te k?nnen an das gleiche
Protokoll gebunden sein, es ist aber nicht m?glich, einen Kanal an
mehrere Protokolle zu binden. Jedes ?ber einen Kanal ankommende
L2CAP-Paket wird an das entsprechende h?herwertige Protokoll
weitergeleitet. Mehrere Kan?le k?nnen sich die gleiche
Basisbandverbindung teilen.

Eine einzelne Netgraph-Ger?tedatei vom Typ *l2cap* wird f?r ein
einzelnes Bluetooth-Ger?t erzeugt. Die L2CAP-Ger?tedatei ist
normalerweise mit der Bluetooth-HCI-Ger?tedatei (downstream) sowie der
Bluetooth-Socket-Ger?tedatei (upstream) verbunden. Der Standardname f?r
die L2CAP-Ger?tedatei, die in
`ng\_l2cap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2cap&sektion=4>`__
beschrieben wird, lautet „devicel2cap“.

Ein n?tzlicher Befehl zum Anpingen von anderen Ger?ten ist
`l2ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=l2ping&sektion=8>`__.
Einige Bluetooth-Ger?te senden allerdings nicht alle erhaltenen Daten
zur?ck. Die Ausgabe ``0 bytes`` ist also kein Fehler:

.. code:: screen

    # l2ping -a 00:80:37:29:19:a4
    0 bytes from 0:80:37:29:19:a4 seq_no=0 time=48.633 ms result=0
    0 bytes from 0:80:37:29:19:a4 seq_no=1 time=37.551 ms result=0
    0 bytes from 0:80:37:29:19:a4 seq_no=2 time=28.324 ms result=0
    0 bytes from 0:80:37:29:19:a4 seq_no=3 time=46.150 ms result=0

Das Programm
`l2control(8) <http://www.FreeBSD.org/cgi/man.cgi?query=l2control&sektion=8>`__
liefert Informationen ?ber L2CAP-Dateien. Das folgende Beispiel zeigt,
wie man die Liste der logischen Verbindungen (Kan?le) sowie die Liste
der Basisbandverbindungen abfragen kann:

.. code:: screen

    % l2control -a 00:02:72:00:d4:1a read_channel_list
    L2CAP channels:
    Remote BD_ADDR     SCID/ DCID   PSM  IMTU/ OMTU State
    00:07:e0:00:0b:ca    66/   64     3   132/  672 OPEN
    % l2control -a 00:02:72:00:d4:1a read_connection_list
    L2CAP connections:
    Remote BD_ADDR    Handle Flags Pending State
    00:07:e0:00:0b:ca     41 O           0 OPEN

`btsockstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=btsockstat&sektion=1>`__
ist ein weiteres Diagnoseprogramm. Es funktioniert analog zu
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__,
arbeitet aber mit Bluetooth-Datenstrukturen. Das folgende Beispiel zeigt
die gleiche Liste der logischen Verbindungen wie
`l2control(8) <http://www.FreeBSD.org/cgi/man.cgi?query=l2control&sektion=8>`__
im vorherigen Beispiel.

.. code:: screen

    % btsockstat
    Active L2CAP sockets
    PCB      Recv-Q Send-Q Local address/PSM       Foreign address   CID   State
    c2afe900      0      0 00:02:72:00:d4:1a/3     00:07:e0:00:0b:ca 66    OPEN
    Active RFCOMM sessions
    L2PCB    PCB      Flag MTU   Out-Q DLCs State
    c2afe900 c2b53380 1    127   0     Yes  OPEN
    Active RFCOMM sockets
    PCB      Recv-Q Send-Q Local address     Foreign address   Chan DLCI State
    c2e8bc80      0    250 00:02:72:00:d4:1a 00:07:e0:00:0b:ca 3    6    OPEN

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

33.5.5. Das RFCOMM-Protokoll
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das RFCOMM-Protokoll emuliert serielle Verbindungen ?ber das
L2CAP-Protokoll. Es basiert auf dem ETSI-Standard TS 07.10. Bei RFCOMM
handelt es sich um ein einfaches Transportprotokoll, das um Funktionen
zur Emulation der 9poligen Schaltkreise von mit RS-232 (EIATIA-232-E)
kompatiblen seriellen Ports erg?nzt wurde. RFCOMM erlaubt bis zu 60
simultane Verbindungen (RFCOMM-Kan?le) zwischen zwei Bluetooth-Ger?ten.

Eine RFCOMM-Kommunikation besteht aus zwei Anwendungen (den
Kommunikationsendpunkten), die ?ber das Kommunikationssegment
miteinander verbunden sind. RFCOMM unterst?tzt Anwendungen, die auf
serielle Ports angewiesen sind. Das Kommunikationssegment entspricht der
(direkten) Bluetooth-Verbindung zwischen den beiden Ger?ten.

RFCOMM k?mmert sich um die direkte Verbindung von zwei Ger?ten, oder um
die Verbindung zwischen einem Ger?t und einem Modem
(Netzwerkverbindung). RFCOMM unterst?tzt auch andere Konfigurationen.
Ein Beispiel daf?r sind Module, die drahtlose Bluetooth-Ger?te mit einer
verkabelten Schnittstelle verbinden k?nnen.

Unter FreeBSD wurde das RFCOMM-Protokoll im Bluetooth Socket-Layer
implementiert.

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

33.5.6. Erstmaliger Verbindungsaufbau zwischen zwei Bluetooth-Ger?ten (*Pairing*)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Voreinstellung nutzt Bluetooth keine Authentifizierung, daher
kann sich jedes Bluetoothger?t mit jedem anderen Ger?t verbinden. Ein
Bluetoothger?t (beispielsweise ein Mobiltelefon) kann jedoch f?r einen
bestimmten Dienst (etwa eine Einw?hlverbindung) eine Authentifizierung
anfordern. Bluetooth verwendet zu diesem Zweck *PIN-Codes*. Ein PIN-Code
ist ein maximal 16 Zeichen langer ASCII-String. Damit eine Verbindung
zustande kommt, muss auf beiden Ger?ten der gleiche PIN-Code verwendet
werden. Nachdem der Code eingegeben wurde, erzeugen beide Ger?te einen
*link key*, der auf den Ger?ten gespeichert wird. Beim n?chsten
Verbindungsaufbau wird der zuvor erzeugte Link Key verwendet. Diesen
Vorgang bezeichnet man als *Pairing*. Geht der Link Key auf einem Ger?t
verloren, muss das Pairing wiederholt werden.

Der
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__-Daemon
verarbeitet alle Bluetooth-Authentifzierungsanforderungen und wird ?ber
die Datei ``/etc/bluetooth/hcsecd.conf`` konfiguriert. Der folgende
Ausschnitt dieser Datei zeigt die Konfiguration f?r ein Mobiltelefon,
das den PIN-Code „1234“ verwendet:

.. code:: programlisting

    device {
            bdaddr  00:80:37:29:19:a4;
            name    "Pav's T39";
            key     nokey;
            pin     "1234";
          }

Von der L?nge abgesehen, unterliegen PIN-Codes keinen Einschr?nkungen.
Einige Ger?te, beispielsweise Bluetooth-Headsets, haben einen festen
PIN-Code eingebaut. Die Option ``-d`` sorgt daf?r, dass der
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__-Daemon
im Vordergrund l?uft. Dadurch kann der Ablauf einfach verfolgt werden.
Stellen Sie das entfernte Ger?t auf *receive pairing* und initiieren Sie
die Bluetoothverbindung auf dem entfernten Ger?t. Sie erhalten die
Meldung, dass Pairing akzeptiert wurde und der PIN-Code ben?tigt wird.
Geben Sie den gleichen PIN-Code ein, den Sie in ``hcsecd.conf``
festgelegt haben. Ihr Computer und das entfernte Ger?t sind nun
miteinander verbunden. Alternativ k?nnen Sie das Pairing auch auf dem
entfernten Ger?t initiieren.

hcsecd kann durch das Einf?gen der folgenden Zeile in ``/etc/rc.conf``
beim Systemstart automatisch aktiviert werden:

.. code:: programlisting

    hcsecd_enable="YES"

Es folgt nun eine beispielhafte Ausgabe des hcsecd-Daemons:

.. code:: programlisting

    hcsecd[16484]: Got Link_Key_Request event from 'ubt0hci', remote bdaddr 0:80:37:29:19:a4
    hcsecd[16484]: Found matching entry, remote bdaddr 0:80:37:29:19:a4, name 'Pav's T39', link key doesn't exist
    hcsecd[16484]: Sending Link_Key_Negative_Reply to 'ubt0hci' for remote bdaddr 0:80:37:29:19:a4
    hcsecd[16484]: Got PIN_Code_Request event from 'ubt0hci', remote bdaddr 0:80:37:29:19:a4
    hcsecd[16484]: Found matching entry, remote bdaddr 0:80:37:29:19:a4, name 'Pav's T39', PIN code exists
    hcsecd[16484]: Sending PIN_Code_Reply to 'ubt0hci' for remote bdaddr 0:80:37:29:19:a4

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

33.5.7. Das Service Discovery Protocol (SDP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das *Service Discovery Protocol* (SDP) erlaubt es Clientanwendungen, von
Serveranwendungen angebotene Dienste sowie deren Eigenschaften
abzufragen. Zu diesen Eigenschaften geh?ren die Art oder die Klasse der
angebotenen Dienste sowie der Mechanismus oder das Protokoll, die zur
Nutzung des Dienstes notwendig sind.

SDP erm?glicht Verbindungen zwischen einem SDP-Server und einem
SDP-Client. Der Server enth?lt eine Liste mit den Eigenschaften der vom
Server angebotenen Dienste. Jeder Eintrag beschreibt jeweils einen
einzigen Serverdienst. Ein Client kann diese Informationen durch eine
SDP-Anforderung vom SDP-Server beziehen. Wenn der Client oder eine
Anwendung des Clients einen Dienst nutzen will, muss eine separate
Verbindung mit dem Dienstanbieter aufgebaut werden. SDP bietet einen
Mechanismus zum Auffinden von Diensten und deren Eigenschaften an, es
bietet aber keine Mechanismen zur Verwendung dieser Dienste.

Normalerweise sucht ein SDP-Client nur nach Diensten, die bestimmte
geforderte Eigenschaften erf?llen. Es ist aber auch m?glich, anhand der
Dienstbeschreibungen eine allgemeine Suche nach den von einem Server
angebotenen Diensten durchzuf?hren. Diesen Vorgang bezeichnet man als
*Browsing*.

Der Bluetooth-SDP-Server
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
und der Kommandozeilenclient
`sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8>`__
sind bereits in der Standardinstallation von FreeBSD enthalten. Das
folgende Beispiel zeigt, wie eine SDP-Abfrage durchgef?hrt wird:

.. code:: screen

    % sdpcontrol -a 00:01:03:fc:6e:ec browse
    Record Handle: 00000000
    Service Class ID List:
            Service Discovery Server (0x1000)
    Protocol Descriptor List:
            L2CAP (0x0100)
                    Protocol specific parameter #1: u/int/uuid16 1
                    Protocol specific parameter #2: u/int/uuid16 1

    Record Handle: 0x00000001
    Service Class ID List:
            Browse Group Descriptor (0x1001)

    Record Handle: 0x00000002
    Service Class ID List:
            LAN Access Using PPP (0x1102)
    Protocol Descriptor List:
            L2CAP (0x0100)
            RFCOMM (0x0003)
                    Protocol specific parameter #1: u/int8/bool 1
    Bluetooth Profile Descriptor List:
            LAN Access Using PPP (0x1102) ver. 1.0

... und so weiter. Beachten Sie, dass jeder Dienst eine Liste seiner
Eigenschaften (etwa den RFCOMM-Kanal) zur?ckgibt. Je nach dem, welche
Dienste Sie ben?tigen, sollten Sie sich einige dieser Eigenschaften
notieren. Einige Bluetooth-Implementationen unterst?tzen kein *Service
Browsing* und geben daher eine leere Liste zur?ck. Ist dies der Fall,
ist es dennoch m?glich, nach einem bestimmten Dienst zu suchen. Das
folgende Beispiel demonstriert die Suche nach dem OBEX Object Push
(OPUSH) Dienst:

.. code:: screen

    % sdpcontrol -a 00:01:03:fc:6e:ec search OPUSH

Unter FreeBSD ist es die Aufgabe des
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__-Servers,
Bluetooth-Clients verschiedene Dienste anzubieten. Sie k?nnen diesen
Server durch das Einf?gen der folgenden Zeile in die Datei
``/etc/rc.conf`` aktivieren:

.. code:: programlisting

    sdpd_enable="YES"

Nun kann der sdpd-Daemon durch folgene Eingabe gestartet werden:

.. code:: screen

    # service sdpd start

Der lokale Server, der den entfernten Clients Bluetooth-Dienste anbieten
soll, bindet diese Dienste an den lokalen SDP-Daemon. Ein Beispiel f?r
eine solche Anwendung ist
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__.
Einmal gestartet, wird der Bluetooth-LAN-Dienst an den lokalen
SDP-Daemon gebunden.

Die Liste der vorhandenen Dienste, die am lokalen SDP-Server registriert
sind, l?sst sich durch eine SDP-Abfrage ?ber einen lokalen Kontrollkanal
abfragen:

.. code:: screen

    # sdpcontrol -l browse

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

33.5.8. Einwahlverbindungen (Dial-Up Networking (DUN)) oder Netzwerkverbindungen mit PPP (LAN)-Profilen einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das *Dial-Up Networking (DUN)*-Profil wird vor allem f?r Modems und
Mobiltelefone verwendet. Dieses Profil erm?glicht folgende Szenarien:

.. raw:: html

   <div class="itemizedlist">

-  Die Verwendung eines Mobiltelefons oder eines Modems durch einen
   Computer als drahtloses Modem, um sich ?ber einen Einwahlprovider mit
   dem Internet zu verbinden oder andere Einwahldienste zu benutzen.

-  Die Verwendung eines Mobiltelefons oder eines Modems durch einen
   Computers, um auf Datenabfragen zu reagieren.

.. raw:: html

   </div>

Der Zugriff auf ein Netzwerk ?ber das PPP (LAN)-Profil kann in folgenden
Situationen verwendet werden:

.. raw:: html

   <div class="itemizedlist">

-  Den LAN-Zugriff f?r ein einzelnes Bluetooth-Ger?t

-  Den LAN-Zugriff f?r mehrere Bluetooth-Ger?te

-  Eine PC-zu-PC-Verbindung (unter Verwendung einer PPP-Verbindung ?ber
   eine emulierte serielle Verbindung)

.. raw:: html

   </div>

Beide Profile werden unter FreeBSD durch
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
sowie
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
implementiert - einem Wrapper, der RFCOMM Bluetooth-Verbindungen unter
PPP nutzbar macht. Bevor ein Profil verwendet werden kann, muss ein
neuer PPP-Abschnitt in ``/etc/ppp/ppp.conf`` erzeugt werden.
Beispielkonfigurationen zu diesem Thema finden Sie in
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__.

Im folgenden Beispiel verwenden wir
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__,
um eine RFCOMM-Verbindung zu einem entfernten Ger?t mit der
``BD_ADDR 00:80:37:29:19:a4`` auf dem RFCOMM-Kanal ``DUN`` aufzubauen.
Die aktuelle RFCOMM-Kanalnummer erhalten Sie vom entfernten Ger?t ?ber
SDP. Es ist auch m?glich, manuell einen RFCOMM-Kanal festzulegen. In
diesem Fall f?hrt
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
keine SDP-Abfrage durch. Verwenden Sie
`sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8>`__,
um die RFCOMM-Kan?le des entfernten Ger?ts herauszufinden.

.. code:: screen

    # rfcomm_pppd -a 00:80:37:29:19:a4 -c -C dun -l rfcomm-dialup

Der
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__-Server
muss laufen, damit ein Netzzugriff mit dem PPP (LAN)-Profil m?glich ist.
Au?erdem muss f?r den LAN-Client ein neuer Eintrag in
``/etc/ppp/ppp.conf`` erzeugt werden. Beispielkonfigurationen zu diesem
Thema finden Sie in
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__.
Danach starten Sie den RFCOMM PPP-Server ?ber eine g?ltige
RFCOMM-Kanalnummer. Der RFCOMM PPP-Server bindet dadurch den
Bluetooth-LAN-Dienst an den lokalen SDP-Daemon. Das folgende Beispiel
zeigt Ihnen, wie man den RFCOMM PPP-Server startet.

.. code:: screen

    # rfcomm_pppd -s -C 7 -l rfcomm-server

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

33.5.9. Das Profil OBEX-Push (OPUSH)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OBEX ist ein h?ufig verwendetes Protokoll f?r den Dateitransfer zwischen
Mobilger?ten. Sein Hauptzweck ist die Kommunikation ?ber die
Infrarotschnittstelle. Es dient daher zum Datentransfer zwischen
Notebooks oder PDAs sowie zum Austausch von Visitenkarten oder
Kalendereintr?gen zwischen Mobiltelefonen und anderen Ger?ten mit
PIM-Funktionen.

Server und Client von OBEX werden durch das Softwarepaket obexapp
bereitgestellt, das als Port
`comms/obexapp <http://www.freebsd.org/cgi/url.cgi?ports/comms/obexapp/pkg-descr>`__
verf?gbar ist.

Mit dem OBEX-Client werden Objekte zum OBEX-Server geschickt oder
angefordert. Ein Objekt kann etwa eine Visitenkarte oder ein Termin
sein. Der OBEX-Client fordert ?ber SDP die Nummer des RFCOMM-Kanals vom
entfernten Ger?t an. Dies kann auch durch die Verwendung des
Servicenamens anstelle der RFCOMM-Kanalnummer erfolgen. Folgende Dienste
werden unterst?tzt: IrMC, FTRN und OPUSH. Es ist m?glich, den
RFCOMM-Kanal als Nummer anzugeben. Es folgt nun ein Beispiel f?r eine
OBEX-Sitzung, bei der ein Informationsobjekt vom Mobiltelefon
angefordert und ein neues Objekt (hier eine Visitenkarte) an das
Telefonbuch des Mobiltelefons geschickt wird:

.. code:: screen

    % obexapp -a 00:80:37:29:19:a4 -C IrMC
    obex> get telecom/devinfo.txt
    Success, response: OK, Success (0x20)
    obex> put new.vcf
    Success, response: OK, Success (0x20)
    obex> di
    Success, response: OK, Success (0x20)

Um OBEX-Push-Dienste anbieten zu k?nnen, muss der sdpd-Server gestartet
sein. Ein Wurzelverzeichnis, in dem alle ankommenden Objekt gespeichert
werden, muss zus?tzlich angelegt werden. In der Voreinstellung ist dies
``/var/spool/obex``. Starten Sie den OBEX-Server mit einer g?ltigen
Kanalnummer. Der OBEX-Server registriert nun den OBEX-Push-Dienst mit
dem lokalen SDP-Daemon. Um den OBEX-Server zu starten, geben Sie
Folgendes ein:

.. code:: screen

    # obexapp -s -C 10

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

33.5.10. Das Profil Serial-Port (SPP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Durch dieses Profil k?nnen Bluetooth-Ger?te RS232- (oder damit
kompatible) serielle Kabelverbindungen emulieren. Anwendungen sind
dadurch in der Lage, ?ber eine virtuelle serielle Verbindung Bluetooth
als Ersatz f?r eine Kabelverbindung zu nutzen.

Das Profil Serial-Port wird durch
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1>`__
verwirklicht. Pseudo-tty wird hier als virtuelle serielle Verbindung
verwendet. Das folgende Beispiel zeigt, wie man sich mit einem
entfernten Serial-Port-Dienst verbindet. Beachten Sie, dass Sie den
RFCOMM-Kanal nicht angeben m?ssen, da
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1>`__
diesen ?ber SDP vom entfernten Ger?t abfragen kann. Wenn Sie dies nicht
wollen, k?nnen Sie einen RFCOMM-Kanal auch manuell festlegen.

.. code:: screen

    # rfcomm_sppd -a 00:07:E0:00:0B:CA -t /dev/ttyp6
    rfcomm_sppd[94692]: Starting on /dev/ttyp6...

Sobald die Verbindung hergestellt ist, kann pseudo-tty als serieller
Port verwenden werden.

.. code:: screen

    # cu -l ttyp6

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

33.5.11. Problembehandlung
~~~~~~~~~~~~~~~~~~~~~~~~~~

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

33.5.11.1. Ein entferntes Ger?t kann keine Verbindung aufbauen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige ?ltere Bluetooth-Ger?te unterst?tzen keinen Rollentausch. Wenn
FreeBSD eine neue Verbindung akzeptiert, wird versucht, die Rolle zu
tauschen, um zum Master zu werden. Ger?te, die dies nicht unterst?tzen,
k?nnen keine Verbindung aufbauen. Beachten Sie, dass der Rollentausch
ausgef?hrt wird, sobald eine neue Verbindung aufgebaut wird, daher ist
es nicht m?glich, das entfernte Ger?t zu fragen, ob es den Rollentausch
unterst?tzt. Dieses Verhalten von FreeBSD kann aber durch eine
HCI-Option ge?ndert werden:

.. code:: screen

    # hccontrol -n ubt0hci write_node_role_switch 0

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

33.5.11.2. Wo finde ich genaue Informationen dar?ber, was schiefgelaufen ist?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Verwenden Sie hcidump, das Sie ?ber den Port
`comms/hcidump <http://www.freebsd.org/cgi/url.cgi?ports/comms/hcidump/pkg-descr>`__
installieren k?nnen. hcidump hat ?hnlichkeiten mit
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__.
Es dient zur Anzeige der Bluetooth-Pakete in einem Terminal oder zur
Speicherung der Pakete in einer Datei (Dump).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+--------------------------------------------+-----------------------------------------+
| `Zur?ck <network-usb-tethering.html>`__?   | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <network-bridging.html>`__   |
+--------------------------------------------+--------------------------------------------+-----------------------------------------+
| 33.4. USB Tethering?                       | `Zum Anfang <index.html>`__                | ?33.6. LAN-Kopplung mit einer Bridge    |
+--------------------------------------------+--------------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
