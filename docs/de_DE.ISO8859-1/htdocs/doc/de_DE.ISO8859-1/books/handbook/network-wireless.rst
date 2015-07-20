=========================
33.3. Drahtlose Netzwerke
=========================

.. raw:: html

   <div class="navheader">

33.3. Drahtlose Netzwerke
`Zur?ck <network-routing.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <network-usb-tethering.html>`__

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

33.3. Drahtlose Netzwerke
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Loader, Marc Fonvieille und Murray Stokely.

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

33.3.1. Grundlagen
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die meisten drahtlosen Netzwerke basieren auf dem Standard IEEE??802.11.
Sie bestehen aus Stationen, die in der Regel im 2,4?GHz- oder im
5?GHz-Band miteinander kommunizieren. Es ist aber auch m?glich, dass
regional andere Frequenzen, beispielsweise im 2,3?GHz- oder
4,9?GHz-Band, verwendet werden.

802.11-Netzwerke k?nnen auf zwei verschiedene Arten aufgebaut sein: Im
*Infrastruktur-Modus* agiert eine Station als Master, mit dem sich alle
anderen Stationen verbinden. Die Summe aller Stationen wird als BSS
(Basic Service Set), die Master-Station hingegen als Access Point (AP)
bezeichnet. In einem BSS l?uft jedwede Kommunikation ?ber den Access
Point. Die zweite Form drahtloser Netzwerke sind die sogenannten
*Ad-hoc-Netzwerke* (auch als IBSS bezeichnet), in denen es keinen Access
Point gibt und in denen die Stationen direkt miteinander kommunizieren.

Die ersten 802.11-Netzwerke arbeiteten im 2,4?GHz-Band und nutzten dazu
Protokolle der IEEE?-Standards 802.11 sowie 802.11b. Diese Standards
legen unter anderem Betriebsfrequenzen sowie Merkmale des MAC-Layers
(wie Frames und Transmissionsraten) fest. Sp?ter kam der Standard
802.11a hinzu, der im 5?GHz-Band, im Gegensatz zu den ersten beiden
Standards aber mit unterschiedlichen Signalmechanismen und h?heren
Transmissionsraten arbeitet. Der neueste Standard 802.11g implementiert
die Signal- und Transmissionsmechanismen von 802.11a im 2,4?GHz-Band,
ist dabei aber abw?rtskompatibel zu 802.11b-Netzwerken.

Unabh?ngig von den zugrundeliegenden Transportmechanismen verf?gen
802.11-Netzwerke ?ber diverse Sicherheitsmechanismen. Der urspr?ngliche
802.11-Standard definierte lediglich ein einfaches Sicherheitsprotokoll
namens WEP. Dieses Protokoll verwendet einen fixen (gemeinsam
verwendeten) Schl?ssel sowie die RC4-Kryptografie-Chiffre, um Daten
verschl?sselt ?ber das drahtlose Netzwerk zu senden. Alle Stationen des
Netzwerks m?ssen sich auf den gleichen fixen Schl?ssel einigen, um
miteinander kommunizieren zu k?nnen. Dieses Schema ist sehr leicht zu
knacken und wird deshalb heute kaum mehr eingesetzt. Aktuelle
Sicherheitsmechanismen bauen auf dem Standard IEEE??802.11i auf, der
neue kryptografische Schl?ssel (Chiffren), ein neues Protokoll f?r die
Anmeldung von Stationen an einem Access Point, sowie Mechanismen zum
Austausch von Schl?sseln als Vorbereitung der Kommunikation zwischen
verschiedenen Ger?ten festlegt. Kryptografische Schl?ssel werden
regelm??ig getauscht. Au?erdem gibt es Mechanismen, um Einbruchsversuche
zu entdecken (und Gegenma?nahmen ergreifen zu k?nnen). Ein weiteres
h?ufig verwendetes Sicherheitsprotokoll ist WPA. Dabei handelt es sich
um einen Vorl?ufer von 802.11i, der von einem Industriekonsortium als
Zwischenl?sung bis zur endg?ltigen Verabschiedung von 802.11i entwickelt
wurde. WPA definiert eine Untergruppe der Anforderungen des
802.11i-Standards und ist f?r den Einsatz in ?lterer Hardware
vorgesehen. WPA ben?tigt nur den (auf dem urspr?nglichen WEP-Code
basierenden) TKIP-Chiffre. 802.11i erlaubt zwar auch die Verwendung von
TKIP, fordert aber zus?tzlich eine st?rkere Chiffre (AES-CCM) f?r die
Datenverschl?sselung. (AES war f?r WPA nicht vorgesehen, weil man es als
zu rechenintensiv f?r den Einsatz in ?lteren Ger?ten ansah.)

Neben den weiter oben erw?hnten Standards ist auch der Standard 802.11e
von gro?er Bedeutung. Dieser definiert Protokolle zur ?bertragung von
Multimedia-Anwendungen wie das Streaming von Videodateien oder
Voice-over-IP (VoIP) in einem 802.11-Netzwerk. Analog zu 802.11i verf?gt
auch 802.11e ?ber eine vorl?ufige Spezifikation namens WMM (urspr?nglich
WME), die von einem Industriekonsortium als Untergruppe von 802.11e
spezifiziert wurde, um Multimedia-Anwendungen bereits vor der
endg?ltigen Verabschiedung des 802.11e-Standards implementieren zu
k?nnen. 802.11e sowie WME/WMM erlauben eine Priorit?tenvergabe beim
Datentransfer im einem drahtlosen Netzwerk. M?glich wird dies durch den
Einsatz von Quality of Service-Protokollen (QoS) und erweiterten
Medienzugriffsprotokollen. Werden diese Protokolle korrekt
implementiert, erlauben sie daher hohe Daten?bertragungsraten und einen
priorisierten Datenfluss.

FreeBSD unterst?tzt die Standards 802.11a, 802.11b, sowie 802.11g.
Ebenfalls unterst?tzt werden WPA sowie die Sicherheitsprotokolle gem??
802.11i (dies sowohl f?r 11a, 11b als auch 11g). QoS und
Verkehrspriorisierung, die von den WME/WMM-Protokollen ben?tigt werden,
werden ebenfalls (allerdings nicht f?r alle drahtlosen Ger?te)
unterst?tzt.

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

33.3.2. Basiskonfiguration
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

33.3.2.1. Kernelkonfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um ein drahtloses Netzwerk zu nutzen, ben?tigen Sie eine drahtlose
Netzwerkkarte und einen Kernel, der drahtlose Netzwerke unterst?tzt. Der
FreeBSD-Kernel unterst?tzt den Einsatz von Kernelmodulen. Daher m?ssen
Sie nur die Unterst?tzung f?r die von Ihnen verwendeten Ger?te
aktivieren.

Als Erstes ben?tigen Sie ein drahtloses Ger?t. Die meisten drahtlosen
Ger?te verwenden Bauteile von Atheros und werden deshalb vom
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4>`__-Treiber
unterst?tzt. Um diesen Treiber zu verwenden, nehmen Sie die folgende
Zeile in die Datei ``/boot/loader.conf`` auf:

.. code:: programlisting

    if_ath_load="YES"

Der Atheros-Treiber besteht aus drei Teilen: dem Treiber selbst
(`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4>`__),
dem Hardware-Support-Layer f?r die chip-spezifischen Funktionen
(`ath\_hal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath_hal&sektion=4>`__)
sowie einem Algorithmus zur Auswahl der korrekten Frame-?bertragungsrate
(ath\_rate\_sample). Wenn Sie die Unterst?tzung f?r diesen Treiber als
Kernelmodul laden, k?mmert sich dieses automatisch um diese Aufgaben.
Verwenden Sie ein Nicht-Atheros-Ger?t, so m?ssen Sie hingegen das f?r
dieses Ger?t geeignete Modul laden, beispielsweise

.. code:: programlisting

    if_wi_load="YES"

f?r Ger?te, die auf Bauteilen von Intersil Prism basieren und daher den
Treiber
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4>`__
voraussetzen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

In den folgenden Abschnitten wird der
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4>`__-Treiber
verwendet. Verwenden Sie ein anderes Ger?t, m?ssen Sie diesen Wert daher
an Ihre Konfiguration anpassen. Eine Liste aller verf?gbaren Treiber und
unterst?tzten drahtlosen Ger?te finden sich in den FreeBSD Hardware
Notes. Diese sind f?r verschiedene Releases und Architekturen auf der
Seite `Release
Information <http://www.FreeBSD.org/releases/index.html>`__ der FreeBSD
Homepage. Gibt es keinen nativen FreeBSD-Treiber f?r Ihr drahtloses
Ger?t, k?nnen Sie m?glicherweise mit
`NDIS <config-network-setup.html#config-network-ndis>`__ einen
Windows?-Treiber verwenden.

.. raw:: html

   </div>

Zus?tzlich ben?tigen Sie noch Module zur Verschl?sselung ihres
drahtlosen Netzwerks. Diese werden normalerweise dynamisch vom
`wlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan&sektion=4>`__-Modul
geladen. Im folgenden Beispiel erfolgt allerdings eine manuelle
Konfiguration. Folgende Module sind verf?gbar:
`wlan\_wep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_wep&sektion=4>`__,
`wlan\_ccmp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_ccmp&sektion=4>`__
sowie
`wlan\_tkip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_tkip&sektion=4>`__.
Sowohl
`wlan\_ccmp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_ccmp&sektion=4>`__
als auch
`wlan\_tkip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_tkip&sektion=4>`__
werden nur ben?tigt, wenn Sie WPA und/oder die Sicherheitsprotokolle von
802.11i verwenden wollen. Wollen Sie Ihr Netzwerk hingegen ohne
Verschl?sselung betreiben, ben?tigen Sie nicht einmal die
`wlan\_wep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan_wep&sektion=4>`__-Unterst?tzung.
Um alle drei Module beim Systemstart zu laden, f?gen Sie folgende Zeilen
in die Datei ``/boot/loader.conf`` ein:

.. code:: programlisting

    wlan_wep_load="YES"
    wlan_ccmp_load="YES"
    wlan_tkip_load="YES"

Um diese neuen Eintr?ge in der Datei ``/boot/loader.conf`` zu
aktivieren, m?ssen Sie Ihr FreeBSD-System neu starten. Alternativ k?nnen
Sie die Kernelmodule aber auch manuell mit
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
laden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wollen Sie keine Kernelmodule verwenden, k?nnen Sie die ben?tigten
Treiber auch in Ihren Kernel kompilieren. Dazu nehmen Sie folgende
Zeilen in Ihre Kernelkonfigurationsdatei auf:

.. code:: programlisting

    device wlan              # 802.11 support
    device wlan_wep          # 802.11 WEP support
    device wlan_ccmp         # 802.11 CCMP support
    device wlan_tkip         # 802.11 TKIP support
    device wlan_amrr         # AMRR transmit rate control algorithm
    device ath               # Atheros pci/cardbus NIC's
    device ath_hal           # pci/cardbus chip support
    options AH_SUPPORT_AR5416 # enable AR5416 tx/rx descriptors
    device ath_rate_sample   # SampleRate tx rate control for ath

Danach bauen Sie den neuen Kernel und starten Ihr FreeBSD-System neu.

.. raw:: html

   </div>

W?hrend des Systemstarts sollten nun einige Informationen ?hnlich den
folgenden ?ber das von Ihnen verwendete drahtlose Ger?t ausgegeben
werden:

.. code:: screen

    ath0: <Atheros 5212> mem 0x88000000-0x8800ffff irq 11 at device 0.0 on cardbus1
    ath0: [ITHREAD]
    ath0: AR2413 mac 7.9 RF2413 phy 4.5

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

33.3.3. Infrastruktur-Modus
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Drahtlose Netzwerke werden in der Regel im Infrastruktur-Modus (auch
BSS-Modus genannt) betrieben. Dazu werden mehrere drahtlose Access
Points zu einem gemeinsamen drahtlosen Netzwerk verbunden. Jedes dieser
drahtlosen Netzwerke hat einen eigenen Namen, der als *SSID* bezeichnet
wird. Alle Clients eines drahtlosen Netzwerks verbinden sich in diesem
Modus mit einem Access Point.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.3.1. FreeBSD-Clients
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

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

33.3.3.1.1. Einen Access Point finden
'''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um nach drahtlosen Netzwerken zu suchen verwenden Sie ``ifconfig``.
Dieser Scanvorgang kann einige Zeit in Anspruch nehmen, da dazu jede
verf?gbare Frequenz auf verf?gbare Access Points hin ?berpr?ft werden
muss. Um die Suche zu starten, m?ssen Sie als Super-User angemeldet
sein:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 up scan
    SSID/MESH ID    BSSID              CHAN RATE   S:N     INT CAPS
    dlinkap         00:13:46:49:41:76   11   54M -90:96   100 EPS  WPA WME
    freebsdap       00:11:95:c3:0d:ac    1   54M -83:96   100 EPS  WPA

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ihre Netzwerkkarte muss in den Status ``up`` versetzt werden, bevor Sie
den ersten Scanvorgang starten k?nnen. F?r sp?tere Scans ist dies aber
nicht mehr erforderlich.

.. raw:: html

   </div>

Als Ergebnis erhalten Sie eine Liste mit allen gefundenen
BSS/IBSS-Netzwerken. Zus?tzlich zur ``SSID`` (dem Namen des Netzwerks)
wird auch die ``BSSID`` ausgegeben. Dabei handelt es sich um MAC-Adresse
des Access Points. Das Feld ``CAPS`` gibt den Typ des Netzwerks sowie
die F?higkeiten der Stationen innerhalb des Netzwerks an:

.. raw:: html

   <div class="variablelist">

``E``
    Extended Service Set (ESS). Zeigt an, dass die Station Teil eines
    Infrastruktur-Netzwerks ist (und nicht eines IBSS/Ad-hoc-Netzwerks).

``I``
    IBSS/Ad-hoc-Netzwerk. Die Station ist Teil eines Ad-hoc-Netzwerks
    (und nicht eines ESS-Netzwerks).

``P``
    Privacy. Alle Datenframes, die innerhalb des BSS ausgetauscht
    werden, sind verschl?sselt. Dieses BSS verwendet dazu
    kryptografische Verfahren wie WEP, TKIP oder AES-CCMP.

``S``
    Short Preamble. Das Netzwerk verwendet eine kurze Pr?ambel
    (definiert in 802.11b High Rate/DSSS PHY). Eine kurze Pr?ambel
    verwendet ein 56?Bit langes Sync-Feld (im Gegensatz zu einer langen
    Pr?ambel, die ein 128?Bit langes Sync-Feld verwendet).

``s``
    Short slot time. Das 802.11g-Netzwerk verwendet eine kurze Slotzeit,
    da es in diesem Netzwerk keine veralteten (802.11b) Ger?te gibt.

.. raw:: html

   </div>

Um eine Liste der bekannten Netzwerke auszugeben, verwenden Sie den
folgenden Befehl:

.. code:: screen

    # ifconfig wlan0 list scan

Diese Liste kann entweder automatisch durch das drahtlose Ger?t oder
manuell durch eine ``scan``-Aufforderung aktualisiert werden. Veraltete
Informationen werden dabei automatisch entfernt.

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

33.3.3.1.2. Basiseinstellungen
''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, wie Sie ein einfaches drahtloses Netzwerk
ohne Verschl?sselung unter FreeBSD einrichten. Nachdem Sie sich mit den
Informationen dieses Abschnitts vertraut gemacht haben, sollten Sie Ihr
drahtloses Netzwerk mit
`WPA <network-wireless.html#network-wireless-wpa>`__ verschl?sseln.

Das Einrichten eines drahtlosen Netzwerks erfolgt in drei Schritten: Der
Auswahl eines Access Points, der Anmeldung Ihrer Station sowie der
Konfiguration Ihrer IP-Adresse.

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.3.1.2.1. Einen Access Point ausw?hlen
                                          

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Normalfall wird sich Ihre Station automatisch mit einem der zur
Verf?gung stehenden Access Points verbinden. Sie m?ssen dazu lediglich
Ihr drahtloses Ger?t aktivieren. Alternativ k?nnen Sie auch einen
Eintrag ?hnlich dem folgenden in ``/etc/rc.conf`` aufnehmen:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="DHCP"

Wollen Sie sich hingegen mit einem bestimmten Access Point verbinden,
m?ssen Sie dessen SSID angeben:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="ssid Ihre_SSID DHCP"

Gibt es in Ihrem Netzwerk mehrere Access Points mit der gleichen SSID
(was der Einfachheit wegen h?ufig der Fall ist), k?nnen Sie sich dennoch
mit einem bestimmten Access Point verbinden. Dazu m?ssen Sie lediglich
die BSSID des Access Points angeben (die Angabe der SSID ist in diesem
Fall nicht erforderlich):

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="ssid Ihre_SSID bssid xx:xx:xx:xx:xx:xx DHCP"

Es gibt noch weitere M?glichkeiten, den Zugriff auf bestimmte Access
Point zu beschr?nken, beispielsweise durch die Begrenzung der
Frequenzen, auf denen eine Station nach einem Access Point sucht.
Sinnvoll ist ein solches Vorgehen beispielsweise, wenn Ihr drahtloses
Ger?t in verschiedenen Frequenzbereichen arbeiten kann, da in diesem
Fall das Pr?fen aller Frequenzen sehr zeitintensiv ist. Um nur innerhalb
eines bestimmten Frequenzbereichs nach einem Access Point zu suchen,
verwenden Sie die Option ``mode``:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="mode 11g ssid Ihre_SSID DHCP"

Dadurch sucht Ihr drahtloses Ger?t nur im 2,4?GHz-Band (802.11g), aber
nicht innerhalb des 5?GHz-Bandes nach einem Access Point. Mit der Option
``channel`` k?nnen Sie eine bestimmte Frequenz vorgeben, auf der gesucht
werden soll. Die Option ``chanlist`` erlaubt die Angabe mehrerer
erlaubter Frequenzen. Eine umfassende Beschreibung dieser Optionen
finden Sie in der Manualpage
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.3.1.2.2. Authentifizierung
                               

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie einen Access Point gefunden haben, muss sich Ihrem Station am
Access Point anmelden, bevor Sie Daten ?bertragen kann. Dazu gibt es
verschiedene M?glichkeiten. Am h?ufigsten wird nach wie vor die
sogenannte *offene Authentifizierung* verwendet. Dabei wird es jeder
Station erlaubt, sich mit einem Netzwerk zu verbinden und Daten zu
?bertragen. Aus Sicherheitsgr?nden sollte diese Methode allerdings nur
zu Testzwecken bei der erstmaligen Einrichtung eines drahtlosen
Netzwerks verwendet werden. Andere Authentifizierungsmechanismen
erfordern den Austausch kryptografischer Informationen, bevor Sie die
?bertragung von Daten erlauben. Dazu geh?ren der Austausch fixer (vorher
vereinbarter) Schl?ssel oder Kennw?rter sowie der Einsatz komplexerer
Verfahren mit Backend-Diensten wie RADIUS. Die meisten Netzwerke nutzen
allerdings nach wie vor die offene Authentifizierung, da dies die
Voreinstellung ist. Am zweith?ufigsten kommt das weiter unten
beschriebene
`WPA-PSK <network-wireless.html#network-wireless-wpa-wpa-psk>`__ (das
auch als *WPA Personal* bezeichnet wird) zum Einsatz.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Verwenden Sie eine Apple? AirPort? Extreme-Basisstation als Access
Point, ben?tigen Sie wahrscheinlich sowohl die
Shared-Key-Authentifizierung als auch einen WEP-Schl?ssel. Die
entsprechende Konfiguration erfolgt entweder in der Datei
``/etc/rc.conf`` oder ?ber das Programm
`wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8>`__.
Verwenden Sie nur eine einzige AirPort?-Basisstation, ben?tigen Sie
einen Eintrag ?hnlich dem folgenden:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="authmode shared wepmode on weptxkey 1 wepkey 01234567 DHCP"

Normalerweise sollten Sie Shared-Key-Authentifizierung aber nicht
verwenden, da diese die Sicherheit des WEP-Schl?ssel noch weiter
verringert. M?ssen Sie WEP einsetzen (beispielsweise weil Sie zu
veralteten Ger?ten kompatibel bleiben m?ssen), sollten Sie WEP nur
zusammen mit der offenen Authentifizierung (``open`` authentication)
verwenden. WEP wird im `Abschnitt?33.3.3.1.4,
„WEP“ <network-wireless.html#network-wireless-wep>`__ n?her beschrieben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.3.1.2.3. Eine IP-Adresse ?ber DHCP beziehen
                                                

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie einen Access Point gefunden und sich authentifiziert haben,
ben?tigen Sie noch eine IP-Adresse, die Sie in der Regel ?ber DHCP
zugewiesen bekommen. Dazu m?ssen Sie lediglich die Option ``DHCP`` in
Ihre in der Datei ``/etc/rc.conf`` vorhandene Konfiguration Ihres
drahtlosen Ger?ts aufnehmen:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="DHCP"

Nun k?nnen Sie Ihr drahtloses Ger?t starten:

.. code:: screen

    # service netif start

Nachdem Sie das Ger?t aktiviert haben, k?nnen Sie mit ``ifconfig`` den
Status des Ger?ts ``ath0`` abfragen:

.. code:: screen

    # ifconfig wlan0
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            ether 00:11:95:d5:43:62
            inet 192.168.1.100 netmask 0xffffff00 broadcast 192.168.1.255
            media: IEEE 802.11 Wireless Ethernet OFDM/54Mbps mode 11g
            status: associated
            ssid dlinkap channel 11 (2462 Mhz 11g) bssid 00:13:46:49:41:76
            country US ecm authmode OPEN privacy OFF txpower 21.5 bmiss 7
            scanvalid 60 bgscan bgscanintvl 300 bgscanidle 250 roam:rssi 7
            roam:rate 5 protmode CTS wme burst

``status: associated`` besagt, dass sich Ihr Ger?t mit dem drahtlosen
Netzwerk verbunden hat (konkret mit dem Netzwerk ``dlinkap``).
``bssid 00:13:46:49:41:76`` gibt die MAC-Adresse Ihres Access Points aus
und die Zeile mit ``authmode OPEN`` informiert Sie dar?ber, dass Ihre
Kommunikation nicht verschl?sselt wird.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.3.1.2.4. Statische IP-Adressen
                                   

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alternativ zu dynamischen IP-Adressen k?nnen Sie auch eine statische
IP-Adresse verwenden. Dazu ersetzen Sie in Ihrer Konfiguration ``DHCP``
durch die zu verwendende IP-Adresse. Beachten Sie dabei, dass Sie die
anderen Konfigurationsparameter nicht versehentlich ver?ndern:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="inet 192.168.1.100 netmask 255.255.255.0 ssid your_ssid_here"

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

33.3.3.1.3. WPA
'''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei WPA (Wi-Fi Protected Access) handelt es sich um ein
Sicherheitsprotokoll, das in 802.11-Netzwerken verwendet wird, um die
Nachteile von `WEP <network-wireless.html#network-wireless-wep>`__
(fehlende Authentifizierung und schwache Verschl?sselung) zu vermeiden.
WPA stellt das aktuelle 802.1X-Authentifizierungsprotokoll dar und
verwendet eine von mehreren Chiffren, um die Datensicherheit zu
gew?hrleisten. Die einzige Chiffre, die von WPA verlangt wird, ist TKIP
(*Temporary Key Integrity Protocol*), eine Chiffre, die die von WEP
verwendete RC4-Chiffre um Funktionen zur Pr?fung der Datenintegrit?t und
zur Erkennung und Bek?mpfung von Einbruchsversuchen erweitert. TKIP ist
durch Softwaremodifikationen auch unter veralteter Hardware lauff?hig.
Im Vergleich zu WEP ist WPA zwar sehr viel sicherer, es ist aber dennoch
nicht v?llig immun gegen Angriffe. WPA definiert mit AES-CCMP noch eine
weitere Chiffre als Alternative zu TKIP. AES-CCMP (das h?ufig als WPA2
oder RSN bezeichnet wird) sollte, wenn m?glich, eingesetzt werden.

WPA definiert Authentifizierungs- und Verschl?sselungsprotokolle. Die
Authentifizierung erfolgt in der Regel ?ber eine der folgenden
Techniken: 802.1X gemeinsam mit einem Backend-Authentifizierungsdienst
wie RADIUS, oder durch einen Minimal-Handshake zwischen der Station und
dem Access Point mit einem vorher vereinbarten gemeinsamen Schl?ssel.
Die erste Technik wird als *WPA Enterprise*, die zweite hingegen als
*WPA Personal* bezeichnet. Da sich der Aufwand f?r das Aufsetzen eines
RADIUS-Backend-Servers f?r die meisten drahtlosen Netzwerke nicht lohnt,
wird WPA in der Regel als WPA-PSK (WPA, Pre-Shared-Key) konfiguriert.

Die Kontrolle der drahtlosen Verbindung sowie die vorangehende
Authentifizierung (?ber Schl?ssel oder durch die Kommunikation mit einem
Server) erfolgt ?ber das Programm
`wpa\_supplicant(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant&sektion=8>`__,
das ?ber die Datei ``/etc/wpa_supplicant.conf`` eingerichtet wird.
Ausf?hrliche Informationen zur Konfiguration des Programms finden sich
in der Manualpage
`wpa\_supplicant.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=wpa_supplicant.conf&sektion=5>`__.

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.3.1.3.1. WPA-PSK
                     

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

WPA-PSK oder WPA-Personal basiert auf einem gemeinsamen (vorher
vereinbarten) Schl?ssel (PSK), der aus einem Passwort generiert und
danach als Master-Key des drahtlosen Netzwerks verwendet wird. Jeder
Benutzer des drahtlosen Netzwerks verwendet daher *den gleichen*
Schl?ssel. WPA-PSK sollte nur in kleinen Netzwerken eingesetzt werden,
in denen die Konfiguration eines Authentifizierungsservers nicht m?glich
oder erw?nscht ist.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Achten Sie darauf, dass Sie immer starke Passw?rter verwenden, die
ausreichend lang sind und, wenn m?glich, auch Sonderzeichen enthalten,
damit diese nicht leicht erraten und/oder umgangen werden k?nnen.

.. raw:: html

   </div>

Der erste Schritt zum Einsatz von WPA-PSK ist die Konfiguration der SSID
und des gemeinsamen Schl?ssels Ihres Netzwerks in der Datei
``/etc/wpa_supplicant.conf``:

.. code:: programlisting

    network={
      ssid="freebsdap"
      psk="freebsdmall"
    }

Danach geben Sie in ``/etc/rc.conf`` an, dass WPA zur Verschl?sselung
eingesetzt werden soll und dass die IP-Adresse ?ber DHCP bezogen wird:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="WPA DHCP"

Nun k?nnen Sie Ihr Netzger?t aktivieren:

.. code:: screen

    # service netif start
    Starting wpa_supplicant.
    DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 5
    DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 6
    DHCPOFFER from 192.168.0.1
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67
    DHCPACK from 192.168.0.1
    bound to 192.168.0.254 -- renewal in 300 seconds.
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet OFDM/36Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 MHz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

Alternativ k?nnen Sie die Konfiguration von
`WPA-PSK <network-wireless.html#network-wireless-wpa-wpa-psk>`__ auch
manuell durchf?hren, wobei Sie wiederum die Konfigurationsdatei
``/etc/wpa_supplicant.conf`` verwenden:

.. code:: screen

    # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf
    Trying to associate with 00:11:95:c3:0d:ac (SSID='freebsdap' freq=2412 MHz)
    Associated with 00:11:95:c3:0d:ac
    WPA: Key negotiation completed with 00:11:95:c3:0d:ac [PTK=CCMP GTK=CCMP]
    CTRL-EVENT-CONNECTED - Connection to 00:11:95:c3:0d:ac completed (auth) [id=0 id_str=]

Im zweiten Schritt starten Sie nun ``dhclient``, um eine IP-Adresse vom
DHCP-Server zu beziehen:

.. code:: screen

    # dhclient wlan0
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67
    DHCPACK from 192.168.0.1
    bound to 192.168.0.254 -- renewal in 300 seconds.
    # ifconfig wlan0
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet OFDM/36Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 MHz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Enth?lt Ihre ``/etc/rc.conf`` bereits die Zeile
``ifconfig_wlan0="DHCP"``, m?ssen Sie ``dhclient`` nicht mehr manuell
aufrufen, da ``dhclient`` in diesem Fall automatisch gestartet wird,
nachdem ``wpa_supplicant`` die Schl?ssel ?bergibt.

.. raw:: html

   </div>

Sollte der Einsatz von DHCP nicht m?glich sein, k?nnen Sie auch eine
statische IP-Adresse angeben, nachdem ``wpa_supplicant`` Ihre Station
authentifiziert hat:

.. code:: screen

    # ifconfig wlan0 inet 192.168.0.100 netmask 255.255.255.0
    # ifconfig wlan0
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.100 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet OFDM/36Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 MHz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

Verwenden Sie DHCP nicht, m?ssen Sie zus?tzlich noch das
Standard-Gateway sowie den/die Nameserver manuell festlegen:

.. code:: screen

    # route add default your_default_router
                  # echo "nameserver your_DNS_server" >> /etc/resolv.conf
                

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.3.1.3.2. WPA und EAP-TLS
                             

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die zweite M?glichkeit, WPA einzusetzen, ist die Verwendung eines
802.1X-Backend-Authentifizierungsservers. Diese Variante wird als
WPA-Enterprise bezeichnet, um sie vom weniger sicheren WPA-Personal
abzugrenzen, das auf dem Austausch gemeinsamer (und vorher vereinbarter
Schl?ssel) basiert. Die bei WPA-Enterprise verwendete Authentifizierung
basiert auf EAP (*Extensible Authentication Protocol*).

EAP selbst bietet keine Verschl?sselung, sondern operiert in einem
verschl?sselten Tunnel. Es gibt verschiedene, auf EAP basierende
Authentifizierungsmethoden, darunter EAP-TLS, EAP-TTLS sowie EAP-PEAP.

Bei EAP-TLS (*EAP with Transport Layers Security*) handelt es sich um
sehr gut unterst?tztes Authentifizierungsprotokoll, da es sich dabei um
die erste EAP-Methode handelt, die von der `Wi-Fi
Alliance <http://www.wi-fi.org/>`__ zertifiziert wurde. EAP-TLS
erfordert drei Zertifikate: Das (auf allen Rechnern installierte)
CA-Zertifikat, das Server-Zertifikat Ihres Authentifizierungsservers,
sowie ein Client-Zertifikat f?r jeden drahtlosen Client. Sowohl der
Authentifizierungsservers als auch die drahtlosen Clients
authentifizieren sich gegenseitig durch ihre Zertifikate, wobei sie
?berpr?fen, ob diese Zertifikate auch von der Zertifizierungs-Authorit?t
(CA) des jeweiligen Unternehmens signiert wurden.

Die Konfiguration erfolgt (analog zu WPA-PSK) ?ber die Datei
``/etc/wpa_supplicant.conf``:

.. code:: programlisting

    network={
      ssid="freebsdap" 
      proto=RSN  
      key_mgmt=WPA-EAP 
      eap=TLS 
      identity="loader" 
      ca_cert="/etc/certs/cacert.pem" 
      client_cert="/etc/certs/clientcert.pem" 
      private_key="/etc/certs/clientkey.pem" 
      private_key_passwd="freebsdmallclient" 
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-tls-ssid>`__               | Der Name des Netzwerks (die SSID).   |
+--------------------------------------+--------------------------------------+
| `|2| <#co-tls-proto>`__              | Das RSN/WPA2-Protokoll (IEEE?        |
|                                      | 802.11i) wird verwendet.             |
+--------------------------------------+--------------------------------------+
| `|3| <#co-tls-kmgmt>`__              | Die ``key_mgmt``-Zeile bezieht sich  |
|                                      | auf das verwendete                   |
|                                      | Key-Management-Protokoll. In diesem  |
|                                      | Beispiel wird WPA gemeinsam mit der  |
|                                      | EAP-Authentifizierung verwendet      |
|                                      | (``WPA-EAP``).                       |
+--------------------------------------+--------------------------------------+
| `|4| <#co-tls-eap>`__                | Die f?r die Verbindung verwendete    |
|                                      | EAP-Methode.                         |
+--------------------------------------+--------------------------------------+
| `|5| <#co-tls-id>`__                 | Das ``identity``-Feld enth?lt den    |
|                                      | von EAP verwendeten                  |
|                                      | Identifizierungsstring.              |
+--------------------------------------+--------------------------------------+
| `|6| <#co-tls-cacert>`__             | Das Feld ``ca_cert`` gibt den Pfad   |
|                                      | zum CA-Zertifikat an. Dieses Datei   |
|                                      | wird ben?tigt, um das                |
|                                      | Server-Zertifikat zu verifizieren.   |
+--------------------------------------+--------------------------------------+
| `|7| <#co-tls-clientcert>`__         | Die ``client_cert``-Zeile gibt den   |
|                                      | Pfad zum Client-Zertifikat an. Jeder |
|                                      | Client hat ein eigenes, innerhalb    |
|                                      | des Netzwerks eindeutiges,           |
|                                      | Zertifikat.                          |
+--------------------------------------+--------------------------------------+
| `|8| <#co-tls-pkey>`__               | Das Feld ``private_key`` gibt den    |
|                                      | Pfad zum privaten Schl?ssel des      |
|                                      | Client-Zertifikat an.                |
+--------------------------------------+--------------------------------------+
| `|9| <#co-tls-pwd>`__                | Das Feld ``private_key_passwd``      |
|                                      | enth?lt die Passphrase f?r den       |
|                                      | privaten Schl?ssel.                  |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Danach f?gen Sie die folgende Zeile in ``/etc/rc.conf`` ein:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="WPA DHCP"

Nun k?nnen Sie Ihr drahtloses Ger?t aktivieren:

.. code:: screen

    # service netif start
    Starting wpa_supplicant.
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 7
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 15
    DHCPACK from 192.168.0.20
    bound to 192.168.0.254 -- renewal in 300 seconds.
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet DS/11Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 MHz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

Alternativ k?nnen Sie Ihr drahtloses Ger?t wiederum manuell ?ber
``wpa_supplicant`` und ``ifconfig`` aktivieren.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.3.1.3.3. WPA und EAP-TTLS
                              

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei EAP-TLS m?ssen sowohl der Authentifizierungsserver als auch die
Clients jeweils ein eigenes Zertifikat aufweisen. Setzen Sie hingegen
EAP-TTLS (*EAP-Tunneled Transport Layer Security*) ein, ist das
Client-Zertifikat optional. EAP-TTLS geht dabei ?hnlich vor wie
verschl?sselte Webseiten, bei denen der Webserver einen sicheren
SSL-Tunnel erzeugen kann, ohne dass der Besucher dabei ?ber ein
clientseitiges Zertifikat verf?gen muss. EAP-TTLS verwendet einen
verschl?sselten TLS-Tunnel zum sicheren Transport der
Authentifizierungsdaten.

Die Konfiguration von EAP-TTLS erfolgt in der Datei
``/etc/wpa_supplicant.conf``:

.. code:: programlisting

    network={
      ssid="freebsdap"
      proto=RSN
      key_mgmt=WPA-EAP
      eap=TTLS 
      identity="test" 
      password="test" 
      ca_cert="/etc/certs/cacert.pem" 
      phase2="auth=MD5" 
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ttls-eap>`__               | Die f?r die Verbindung verwendete    |
|                                      | EAP-Methode.                         |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ttls-id>`__                | Das ``identity``-Feld enth?lt den    |
|                                      | Identifizierungsstring f?r die       |
|                                      | EAP-Authentifizierung innerhalb des  |
|                                      | verschl?sselten TlS-Tunnels.         |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ttls-passwd>`__            | Das ``password``-Feld enth?lt die    |
|                                      | Passphrase f?r die                   |
|                                      | EAP-Authentifizierung.               |
+--------------------------------------+--------------------------------------+
| `|4| <#co-ttls-cacert>`__            | Das Feld ``ca_cert`` gibt den Pfad   |
|                                      | zum CA-Zertifikat an, das ben?tigt   |
|                                      | wird, um das Server-Zertifikat zu    |
|                                      | verifizieren.                        |
+--------------------------------------+--------------------------------------+
| `|5| <#co-ttls-pha2>`__              | Die innerhalb des verschl?sselten    |
|                                      | TLS-Tunnels verwendete               |
|                                      | Authentifizierungsmethode. In        |
|                                      | unserem Beispiel handelt es sich     |
|                                      | dabei um EAP und MD5. Diese Phase    |
|                                      | der „inneren Authentifizierung“ wird |
|                                      | oft als „phase2“ bezeichnet.         |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Folgende Zeilen m?ssen zus?tzlich in die Datei ``/etc/rc.conf``
aufgenommen werden:

.. code:: programlisting

    wlans_ath0="wlan0"
    ifconfig_wlan0="WPA DHCP"

Nun k?nnen Sie Ihr drahtloses Ger?t aktivieren:

.. code:: screen

    # service netif start
    Starting wpa_supplicant.
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 7
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 15
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 21
    DHCPACK from 192.168.0.20
    bound to 192.168.0.254 -- renewal in 300 seconds.
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet DS/11Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 MHz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.3.1.3.4. WPA und EAP-PEAP
                              

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PEAP (*Protected EAP*) wurde als Alternative zu EAP-TTLS entwickelt. Es
gibt zwei verschiedene PEAP-Methoden, wobei es sich bei
PEAPv0/EAP-MSCHAPv2 um die h?ufiger verwendete Methode handelt. In den
folgenden Ausf?hrungen wird der Begriff PEAP synonym f?r diese
EAP-Methode verwendet. PEAP ist nach EAP-TLS der am h?ufigsten
verwendete und am besten unterst?tzte EAP-Standard.

PEAP arbeitet ?hnlich wie EAP-TTLS: Es verwendet ein serverseitiges
Zertifikat, um einen verschl?sselten TLS-Tunnel zu erzeugen, ?ber den
die sichere Authentifizierung zwischen den Clients und dem
Authentifizierungsserver erfolgt. In Sachen Sicherheit unterscheiden
sich EAP-TTLS und PEAP allerdings: PEAP ?bertr?gt den Benutzernamen im
Klartext und verschl?sselt nur das Passwort, w?hrend EAP-TTLS sowohl den
Benutzernamen als auch das Passwort ?ber den TLS-Tunnel ?bertr?gt.

Um EAP-PEAP einzurichten, m?ssen Sie die Konfigurationsdatei
``/etc/wpa_supplicant.conf`` anpassen:

.. code:: programlisting

    network={
      ssid="freebsdap"
      proto=RSN
      key_mgmt=WPA-EAP
      eap=PEAP 
      identity="test" 
      password="test" 
      ca_cert="/etc/certs/cacert.pem" 
      phase1="peaplabel=0" 
      phase2="auth=MSCHAPV2" 
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-peap-eap>`__               | Die f?r die Verbindung verwendete    |
|                                      | EAP-Methode.                         |
+--------------------------------------+--------------------------------------+
| `|2| <#co-peap-id>`__                | Das ``identity``-Feld enth?lt den    |
|                                      | Identifizierungsstring f?r die       |
|                                      | innerhalb des verschl?sselten        |
|                                      | TLS-Tunnels erfolgende               |
|                                      | EAP-Authentifizierung.               |
+--------------------------------------+--------------------------------------+
| `|3| <#co-peap-passwd>`__            | Das Feld ``password`` enth?lt die    |
|                                      | Passphrase f?r die                   |
|                                      | EAP-Authentifizierung.               |
+--------------------------------------+--------------------------------------+
| `|4| <#co-peap-cacert>`__            | Das Feld ``ca_cert`` gibt den Pfad   |
|                                      | zum CA-Zertifikat an, das zur        |
|                                      | Verifizierung des Server-Zertifikats |
|                                      | ben?tigt wird.                       |
+--------------------------------------+--------------------------------------+
| `|5| <#co-peap-pha1>`__              | Dieses Feld enth?lt die Parameter    |
|                                      | f?r die erste Phase der              |
|                                      | Authentifizierung (also den          |
|                                      | TLS-Tunnel). Je nach dem, welchen    |
|                                      | Authentifizierungsserver Sie         |
|                                      | verwenden, m?ssen Sie hier einen     |
|                                      | unterschiedlichen Wert angeben. In   |
|                                      | den meisten F?llen wird dieses Feld  |
|                                      | den Wert „client EAP encryption“     |
|                                      | aufweisen, der durch die Angabe von  |
|                                      | ``peaplabel=0`` gesetzt wird.        |
|                                      | Weitere Informationen zur            |
|                                      | Konfiguration von PEAP finden Sie in |
|                                      | der Manualpage                       |
|                                      | `wpa\_supplicant.conf(5) <http://www |
|                                      | .FreeBSD.org/cgi/man.cgi?query=wpa_s |
|                                      | upplicant.conf&sektion=5>`__.        |
+--------------------------------------+--------------------------------------+
| `|6| <#co-peap-pha2>`__              | Das innerhalb des verschl?sselten    |
|                                      | TLS-Tunnels verwendete               |
|                                      | Authentifizierungsprotokoll. In      |
|                                      | unserem Beispiel handelt es sich     |
|                                      | dabei um ``auth=MSCHAPV2``.          |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Danach f?gen Sie die folgende Zeile in ``/etc/rc.conf`` ein:

.. code:: programlisting

    ifconfig_ath0="WPA DHCP"

Zuletzt m?ssen Sie die Netzwerkkarte noch aktivieren:

.. code:: screen

    # service netif start
    Starting wpa_supplicant.
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 7
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 15
    DHCPREQUEST on wlan0 to 255.255.255.255 port 67 interval 21
    DHCPACK from 192.168.0.20
    bound to 192.168.0.254 -- renewal in 300 seconds.
    wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.254 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet DS/11Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 MHz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode WPA2/802.11i privacy ON deftxkey UNDEF
          AES-CCM 3:128-bit txpower 21.5 bmiss 7 scanvalid 450 bgscan
          bgscanintvl 300 bgscanidle 250 roam:rssi 7 roam:rate 5 protmode CTS
          wme burst roaming MANUAL

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

33.3.3.1.4. WEP
'''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

WEP (Wired Equivalent Privacy) ist Teil des urspr?nglichen
802.11-Standards. Es enth?lt keinen Authentifzierungsmechanismus und
verf?gt lediglich ?ber eine schwache Zugriffskontrolle, die sehr leicht
umgangen werden kann.

WEP kann ?ber ``ifconfig`` aktiviert werden:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 inet 192.168.1.100 netmask 255.255.255.0 \
                ssid my_net wepmode on weptxkey 3 wepkey 3:0x3456789012

.. raw:: html

   <div class="itemizedlist">

-  Mit ``weptxkey`` geben Sie an, welcher WEP-Schl?ssel f?r f?r die
   Daten?bertragung verwendet wird (in unserem Beispiel ist dies der
   dritte Schl?ssel). Der gleiche Schl?ssel muss auch am Access Point
   eingestellt sein. Kennen Sie den vom Access Point verwendeten
   Schl?ssel nciht, sollten Sie zuerst den Wert ``1`` (d.h. den ersten
   Schl?ssel) f?r diese Variable verwenden.

-  Mit ``wepkey`` legen Sie den zu verwendenden WEP-Schl?ssel in der
   Form *``Nummer:Schl?ssel``* fest. Ist der Schl?ssel "Nummer" nicht
   vorhanden, wird automatisch Schl?ssel ``1`` verwendet. Die Angabe von
   "Nummer" ist zwingend n?tig, wenn Sie einen anderen als den ersten
   Schl?ssel verwenden wollen.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   In Ihrer Konfiguration m?ssen Sie ``0x3456789012`` durch den an Ihrem
   Access Point konfigurierten Schl?ssel ersetzen.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Weitere Informationen finden Sie in der Manualpage
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__.

Das Programm ``wpa_supplicant`` eignet sich ebenfalls dazu, WEP f?r Ihr
drahtloses Ger?t zu aktivieren. Obige Konfiguration l?sst sich dabei
durch die Aufnahme der folgenden Zeilen in die Datei
``/etc/wpa_supplicant.conf`` realisieren:

.. code:: programlisting

    network={
      ssid="my_net"
      key_mgmt=NONE
      wep_key3=3456789012
      wep_tx_keyidx=3
    }

Danach m?ssen Sie das Programm noch aufrufen:

.. code:: screen

    # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf
    Trying to associate with 00:13:46:49:41:76 (SSID='dlinkap' freq=2437 MHz)
    Associated with 00:13:46:49:41:76

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

33.3.4. Ad-hoc-Modus
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der IBSS-Modus (auch als Ad-hoc-Modus bezeichnet), ist f?r
Punkt-zu-Punkt-Verbindungen vorgesehen. Um beispielsweise eine
Ad-hoc-Verbindung zwischen den Rechnern ``A`` und ``B`` aufzubauen,
ben?tigen Sie lediglich zwei IP-Adressen und eine SSID.

Auf dem Rechner ``A`` geben Sie Folgendes ein:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0 wlanmode adhoc
    # ifconfig wlan0 inet 192.168.0.1 netmask 255.255.255.0 ssid freebsdap
    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:c3:0d:ac
          inet 192.168.0.1 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet autoselect mode 11g <adhoc>
          status: running
          ssid freebsdap channel 2 (2417 Mhz 11g) bssid 02:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy OFF txpower 21.5 scanvalid 60
          protmode CTS wme burst

Der ``adhoc``-Parameter gibt an, dass die Schnittstelle im IBSS-Modus
l?uft.

Rechner ``B`` sollte nun in der Lage sein, Rechner ``A`` zu finden:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0 wlanmode adhoc
    # ifconfig wlan0 up scan
      SSID/MESH ID    BSSID              CHAN RATE   S:N     INT CAPS
      freebsdap       02:11:95:c3:0d:ac    2   54M -64:-96  100 IS   WME

Der Wert ``I`` (Spalte CAPS) gibt an, dass sich Rechner ``A`` im
Ad-hoc-Modus befindet. Nun m?ssen Sie nur noch Rechner ``B`` eine
unterschiedliche IP-Adresse zuweisen:

.. code:: screen

    # ifconfig wlan0 inet 192.168.0.2 netmask 255.255.255.0 ssid freebsdap
    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.2 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet autoselect mode 11g <adhoc>
          status: running
          ssid freebsdap channel 2 (2417 Mhz 11g) bssid 02:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy OFF txpower 21.5 scanvalid 60
          protmode CTS wme burst

Damit sind die Rechner ``A`` und ``B`` bereit und k?nnen untereinander
Daten austauschen.

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

33.3.5. FreeBSD Host Access Points
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD kann als Access Point (AP) agieren. Dies verhindert, dass man
sich einen Hardware AP kaufen oder ein ad-hoc Netzwerk laufen lassen
muss. Dies kann sinnvoll sein, falls Ihre FreeBSD-Computer als Gateway
zu einem anderen Netzwerk (z.B. Internet) fungiert.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.5.1. Grundeinstellungen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie ihren FreeBSD-Computer als einen AP konfigurieren, muss der
Kernel mit dem f?r ihre Wireless-Karte entsprechenden Treibern
konfiguriert werden. Sie m?ssen ebenfalls die Sicherheitsprotokolle, die
Sie nutzen wollen, dem Kernel hinzuf?gen. F?r weitere Informationen
siehe: `Abschnitt?33.3.2,
„Basiskonfiguration“ <network-wireless.html#network-wireless-basic>`__.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Verwendung der NDIS und Windows? Treiber erlauben zur Zeit keinen
AP-Modus. Nur die nativen FreeBSD-Wireless-Treiber unterst?tzen den AP
Modus.

.. raw:: html

   </div>

Nachdem die Unterst?tzung f?r ihr drahtloses Netzwerk geladen ist,
k?nnen Sie ?berpr?fen, ob Ihr Wireless-Ger?t den hostbasierenden
Access-Point Modus (auch bekannt als hostap Modus) unterst?tzt:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 list caps
    drivercaps=6f85edc1<STA,FF,TURBOP,IBSS,HOSTAP,AHDEMO,TXPMGT,SHSLOT,SHPREAMBLE,MONITOR,MBSS,WPA1,WPA2,BURST,WME,WDS,BGSCAN,TXFRAG>
    cryptocaps=1f<WEP,TKIP,AES,AES_CCM,TKIPMIC>

Diese Ausgabe zeigt die M?glichkeiten der Karte. Das Wort ``HOSTAP``
best?tigt, dass diese Wireless-Karte als Access Point agieren kann. Die
verschiedenen unterst?tzten Algorithmen (z.B. WEP, TKIP, AES usw.)
werden ebenfalls angezeigt. Diese Informationen sind wichtig, wenn Sie
wissen wollen, welche Sicherheitsprotokolle auf diesem Access Point
verwendbar sind.

Das Wireless-Ger?t kann nur w?hrend der Erzeugung des Pseudo-Ger?ts in
den hostap-Modus gesetzt werden. Zuvor erstellte Pseudo-Ger?te m?ssen
also vorher zerst?rt werden:

.. code:: screen

    # ifconfig wlan0 destroy

Danach muss das Ger?t erneut erstellt werden, bevor die restlichen
Netzwerkparameter konfiguriert werden k?nnen:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0 wlanmode hostap
    # ifconfig wlan0 inet 192.168.0.1 netmask 255.255.255.0 ssid freebsdap mode 11g channel 1

Benutzen Sie danach erneut den Befehl ``ifconfig``, um den Status der
``wlan0``-Schnittstelle abzufragen:

.. code:: screen

    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:c3:0d:ac
          inet 192.168.0.1 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet autoselect mode 11g <hostap>
          status: running
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy OFF txpower 21.5 scanvalid 60
          protmode CTS wme burst dtimperiod 1 -dfs

Die ``hostap``-Parameter geben die Schnittstelle an, die im
hostbasierenden Access Point Modus l?uft.

Die Konfiguration der Schnittstelle kann durch Hinzuf?gen der folgenden
Zeilen in die Datei ``/etc/rc.conf`` automatisch w?hrend des
Bootvorganges erfolgen:

.. code:: programlisting

    wlans_ath0="wlan0"
    create_args_wlan0="wlanmode hostap"
    ifconfig_wlan0="inet 192.168.0.1 netmask 255.255.255.0 ssid freebsdap mode 11g channel 1"

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

33.3.5.2. Hostbasierender Access Point ohne Authentifizierung oder Verschl?sselung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Obwohl es nicht empfohlen wird, einen AP ohne jegliche Authentifizierung
oder Verschl?sselung laufen zu lassen, ist es eine einfache Art zu
testen, ob der AP funktioniert. Diese Konfiguration ist auch wichtig f?r
die Fehlersuche bei Client-Problemen.

Nachdem Sie den AP, wie oben beschrieben, konfiguriert haben, ist es
m?glich von einem anderen drahtlosen Computer eine Suche nach dem AP zu
starten:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 up scan
    SSID/MESH ID    BSSID              CHAN RATE   S:N     INT CAPS
    freebsdap       00:11:95:c3:0d:ac    1   54M -66:-96  100 ES   WME

Der Client-Rechner fand den Access Point und kann mit ihm verbunden
werden:

.. code:: screen

    # ifconfig wlan0 inet 192.168.0.2 netmask 255.255.255.0 ssid freebsdap
    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:d5:43:62
          inet 192.168.0.2 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet OFDM/54Mbps mode 11g
          status: associated
          ssid freebsdap channel 1 (2412 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy OFF txpower 21.5 bmiss 7
          scanvalid 60 bgscan bgscanintvl 300 bgscanidle 250 roam:rssi 7
          roam:rate 5 protmode CTS wme burst

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

33.3.5.3. WPA-basierender Host-Access Point
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt besch?ftigt sich mit dem Konfigurieren eines
FreeBSD-Access-Points mit dem WPA-Sicherheitsprotokoll. Weitere
Einzelheiten zu WPA und der Konfiguration von Clients mit WPA finden Sie
im `Abschnitt?33.3.3.1.3,
„WPA“ <network-wireless.html#network-wireless-wpa>`__.

Der hostapd-Dienst wird genutzt, um die Client-Authentifizierung und das
Schl?sselmanagement auf dem Access Point mit aktiviertem WPA zu nutzen.

In den folgenden Abschnitten werden allen Konfigurationen auf dem
FreeBSD-Computer ausgef?hrt, der als AP agiert. Nachdem der AP korrekt
arbeitet, sollte hostapd automatisch beim Booten durch folgende Zeile in
der ``/etc/rc.conf`` aktiviert werden:

.. code:: programlisting

    hostapd_enable="YES"

Bevor Sie versuchen hostapd zu konfigurieren, stellen Sie sicher, dass
die Grundeinstellungen, wie in `Abschnitt?33.3.5.1,
„Grundeinstellungen“ <network-wireless.html#network-wireless-ap-basic>`__
beschrieben, ausgef?hrt wurden.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.3.5.3.1. WPA-PSK
'''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

WPA-PSK ist f?r kleine Netzwerke gedacht, in denen die Verwendung eines
Authentifizierungs-Backend-Server nicht m?glich oder erw?nscht ist.

Die Konfiguration wird in ``/etc/hostapd.conf`` durchgef?hrt:

.. code:: programlisting

    interface=wlan0 
    debug=1 
    ctrl_interface=/var/run/hostapd 
    ctrl_interface_group=wheel 
    ssid=freebsdap 
    wpa=1 
    wpa_passphrase=freebsdmall 
    wpa_key_mgmt=WPA-PSK 
    wpa_pairwise=CCMP TKIP 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ap-wpapsk-iface>`__        | Dieses Feld zeigt die                |
|                                      | Wireless-Schnittstelle an, die f?r   |
|                                      | den Access Point verwendet wird an.  |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ap-wpapsk-dbug>`__         | Dieses Feld legt den debuglevel von  |
|                                      | hostapd w?hrend der Ausf?hrung fest. |
|                                      | Ein Wert von ``1`` ist der kleinste  |
|                                      | zul?ssige Wert.                      |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ap-wpapsk-ciface>`__       | Das ``ctrl_interface``-Feld gibt den |
|                                      | Pfadnamen des Verzeichnisses an, der |
|                                      | von hostapd dazu genutzt wird, um    |
|                                      | die domain socket Dateien zu         |
|                                      | speichern, die f?r die Kommunikation |
|                                      | mit externen Programmen, wie z.B.    |
|                                      | `hostapd\_cli(8) <http://www.FreeBSD |
|                                      | .org/cgi/man.cgi?query=hostapd_cli&s |
|                                      | ektion=8>`__,                        |
|                                      | benutzt werden. Hier wurden die      |
|                                      | Standardwerte benutzt.               |
+--------------------------------------+--------------------------------------+
| `|4| <#co-ap-wpapsk-cifacegrp>`__    | Die Zeile ``ctrl_interface_group``   |
|                                      | legt fest, welche Gruppe (hier ist   |
|                                      | es die ``wheel``-Gruppe) die         |
|                                      | Erlaubnis hat, die                   |
|                                      | Schnittstellendateien zu             |
|                                      | kontrollieren.                       |
+--------------------------------------+--------------------------------------+
| `|5| <#co-ap-wpapsk-ssid>`__         | Dieses Feld setzt den Netzwerknamen. |
+--------------------------------------+--------------------------------------+
| `|6| <#co-ap-wpapsk-wpa>`__          | Das ``wpa``-Feld aktiviert WPA und   |
|                                      | gibt an welches                      |
|                                      | WPA-Authentifizierungprotokoll       |
|                                      | ben?tigt wird. Ein Wert von ``1``    |
|                                      | konfiguriert den AP mit WPA-PSK.     |
+--------------------------------------+--------------------------------------+
| `|7| <#co-ap-wpapsk-pass>`__         | Das ``wpa_passphrase``-Feld          |
|                                      | beinhaltet das ASCII-Passwort f?r    |
|                                      | die WPA-Authentifikation.            |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="warning" xmlns="">    |
|                                      |                                      |
|                                      | Warnung:                             |
|                                      | ~~~~~~~~                             |
|                                      |                                      |
|                                      | Verwenden Sie immer sichere          |
|                                      | Passw?rter, die ausreichend lang     |
|                                      | sind und aus vielen                  |
|                                      | unterschiedlichen Zeichen bestehen,  |
|                                      | damit sie nicht erraten werden oder  |
|                                      | umgangen werden k?nnen.              |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|8| <#co-ap-wpapsk-kmgmt>`__        | Die ``wpa_key_mgmt`` Zeile bestimmt  |
|                                      | das Schl?sselmanagement-Protokoll,   |
|                                      | das benutzt wird. In unserem Fall    |
|                                      | ist es WPA-PSK.                      |
+--------------------------------------+--------------------------------------+
| `|9| <#co-ap-wpapsk-pwise>`__        | Das ``wpa_pairwise`` Feld zeigt die  |
|                                      | zul?ssigen                           |
|                                      | Verschl?sselungs-Algorithmen des     |
|                                      | Access Points. Hier werden beide,    |
|                                      | TKIP (WPA) und CCMP (WPA2),          |
|                                      | akzeptiert. CCMP-Verschl?sselung ist |
|                                      | eine Alternative zu TKIP und sollte  |
|                                      | wenn m?glich eingesetzt werden. TKIP |
|                                      | sollte nur da eingesetzt werden, wo  |
|                                      | kein CCMP m?glich ist.               |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Als n?chstes wird der hostapd gestartet:

.. code:: screen

    # service hostapd forcestart

.. code:: screen

    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2290
          inet 192.168.0.1 netmask 0xffffff00 broadcast 192.168.0.255
          inet6 fe80::211:95ff:fec3:dac%ath0 prefixlen 64 scopeid 0x4
          ether 00:11:95:c3:0d:ac
          media: IEEE 802.11 Wireless Ethernet autoselect mode 11g <hostap>
          status: associated
          ssid freebsdap channel 1 bssid 00:11:95:c3:0d:ac
          authmode WPA2/802.11i privacy MIXED deftxkey 2 TKIP 2:128-bit txpowmax 36 protmode CTS dtimperiod 1 bintval 100

Der Access Point l?uft nun, die Clients k?nnen mit ihm verbunden werden.
Weitere Informationen finden Sie im `Abschnitt?33.3.3.1.3,
„WPA“ <network-wireless.html#network-wireless-wpa>`__. Es ist m?glich zu
sehen, welche Stationen mit dem AP verbunden sind. Dazu geben Sie den
Befehl ``ifconfig wlan0 list           sta`` ein.

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

33.3.5.4. WEP hostbasierender Access Point
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist nicht empfehlenswert, einen Access Point mit WEP zu
konfigurieren, da es keine Authentifikationsmechanismen gibt und WEP
leicht zu knacken ist. Einige ?ltere WLAN-Karten unterst?tzen nur WEP
als Sicherheitsprotokoll. F?r solche Karten ist es notwendig den AP ohne
Authentifikation, Verschl?sselung oder mit dem WEP-Protokoll zu
konfigurieren.

Das Wireless-Ger?t kann nun in den hostap-Modus versetzt werden und mit
der korrekten SSID und IP-Adresse konfiguriert werden:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0 wlanmode hostap
    # ifconfig wlan0 inet 192.168.0.1 netmask 255.255.255.0 \
      ssid freebsdap wepmode on weptxkey 3 wepkey 3:0x3456789012 mode 11g

.. raw:: html

   <div class="itemizedlist">

-  Der ``weptxkey`` gibt an, welcher WEP-Schl?ssel bei der ?bertragung
   benutzt wird. Hier nutzen wir den 3. Schl?ssel (die Nummerierung der
   Schl?ssel beginnt bei ``1``). Dieses Parameter muss angegeben sein,
   damit die Daten wirklich verschl?sselt werden.

-  Der ``wepkey`` gibt den gew?hlten WEP-Schl?ssel an. Er sollte im
   folgenden Format *``index:key``* vorliegen. Wenn kein Index vorhanden
   ist, wird der Schl?ssel ``1`` benutzt. Das bedeutet wir brauchen
   einen Index, falls wir einen anderen Schl?ssel als den ersten nutzen
   wollen.

.. raw:: html

   </div>

Benutzen Sie den Befehl ``ifconfig`` noch einmal um den Status der
``wlan0``-Schnittstelle zu sehen:

.. code:: screen

    # ifconfig wlan0
      wlan0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
          ether 00:11:95:c3:0d:ac
          inet 192.168.0.1 netmask 0xffffff00 broadcast 192.168.0.255
          media: IEEE 802.11 Wireless Ethernet autoselect mode 11g <hostap>
          status: running
          ssid freebsdap channel 4 (2427 Mhz 11g) bssid 00:11:95:c3:0d:ac
          country US ecm authmode OPEN privacy ON deftxkey 3 wepkey 3:40-bit
          txpower 21.5 scanvalid 60 protmode CTS wme burst dtimperiod 1 -dfs

Es ist m?glich, von einem anderen drahtlosen Computer eine Suche nach
dem AP zu starten:

.. code:: screen

    # ifconfig wlan0 create wlandev ath0
    # ifconfig wlan0 up scan
    SSID            BSSID              CHAN RATE  S:N   INT CAPS
    freebsdap       00:11:95:c3:0d:ac    1   54M 22:1   100 EPS

Der Client-Rechner fand den Access Point und kann mit den korrekten
Parametern (Schl?ssel usw.) mit ihm verbunden werden. Weitere
Informationen gibt es in folgendem `Abschnitt?33.3.3.1.4,
„WEP“ <network-wireless.html#network-wireless-wep>`__

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

33.3.6. Benutzung von drahtgebundenen und drahtlosen Verbindungen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Verbindung per Kabel bietet eine bessere Leistung und eine h?here
Zuverl?ssigkeit, w?hrend die Wireless-Verbindung eine h?here
Flexibilit?t und Mobilit?t bietet. Benutzer von Laptops wollen
normalerweise beides nutzen und zwischen beiden hin und her schalten.

Unter FreeBSD ist es m?glich zwei oder mehr Netzwerkschnittstellen in
einem „failover“-Mode zu kombinieren, so dass automatisch die beste
verf?gbare Verbindung aus der Gruppe ausgew?hlt wird, sobald der
Linkstatus wechselt.

Wir behandeln Link-Aggregation und Failover in dem Kapitel
`Abschnitt?33.7, „Link-Aggregation und
Failover“ <network-aggregation.html>`__. Dort gibt es auch ein Beispiel
(`Beispiel?33.3, „Failover Modus zwischen Ethernet- und
Wireless-Schnittstellen“ <network-aggregation.html#networking-lagg-wired-and-wireless>`__)
f?r die Verwendung von sowohl kabelgebundenen wie auch drahtlosen
Verbindungen.

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

33.3.7. Problembehandlung
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden Auflistung zeigt, wie Sie einige h?ufig auftretende
Probleme bei der Einrichtung Ihres drahtlosen Netzwerks beheben k?nnen.

.. raw:: html

   <div class="itemizedlist">

-  Wird Ihr Access Point bei der Suche nicht gefunden, sollten Sie
   ?berpr?fen, ob Sie bei Konfiguration Ihres drahtlosen Ger?ts die
   Anzahl der Kan?le beschr?nkt haben.

-  Wenn Sie sich nicht mit Ihrem Access Point verbinden k?nnen, sollten
   Sie ?berpr?fen, ob die Konfiguration Ihrer Station auch der des
   Access Points entspricht. Achten Sie dabei speziell auf die
   Authentifzierungsmethode und die Sicherheitsprotokolle. Halten Sie
   Ihre Konfiguration so einfach wie m?glich. Verwenden Sie ein
   Sicherheitsprotokoll wie WPA oder WEP, sollten Sie testweise Ihren
   Access Point auf *offene Authentifizierung* und *keine Sicherheit*
   einstellen. Danach versuchen Sie sich erneut mit Ihren Access Point
   zu verbinden.

-  Nachdem Sie sich mit dem Access Point verbinden k?nnen, pr?fen Sie
   die Sicherheitseinstellungen, beginnend mit einfachen Werkzeugen wie
   `ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__.

   Das Programm ``wpa_supplicant`` kann Ihnen bei der Fehlersuche
   helfen. Dazu starten Sie es manuell mit der Option ``-dd`` und
   durchsuchen anschlie?end die Protokollinformationen nach eventuellen
   Fehlermeldungen.

-  Zus?tzlich gibt es auch zahlreiche Low-Level-Debugging-Werkzeuge. Die
   Ausgabe von Debugging-Informationen des 802.11 Protocol Support
   Layers lassen sich mit dem Programm ``wlandebug`` (das sich unter
   ``/usr/src/tools/tools/net80211`` befindet) aktivieren. Um
   beispielsweise w?hrend der Suche nach Access Points und des Aufbaus
   von 802.11-Verbindungen (*Handshake*) auftretende Systemmeldungen auf
   die Konsole auszugeben, verwenden Sie den folgenden Befehl:

   .. code:: screen

       # wlandebug -i ath0 +scan+auth+debug+assoc
         net.wlan.0.debug: 0 => 0xc80000<assoc,auth,scan>

   Der 802.11-Layer liefert umfangreiche Statistiken, die Sie mit dem
   Werkzeug ``wlanstats`` abrufen k?nnen. Diese Statistiken sollten alle
   Fehler identifizieren, die im 802.11-Layer auftreten. Beachten Sie
   aber, dass einige Fehler bereits im darunterliegenden Ger?tetreiber
   auftreten und daher in diesen Statistiken nicht enthalten sind. Wie
   Sie Probleme des Ger?tetreibers identifizieren, entnehmen Sie bitte
   der Dokumentation Ihres Ger?tetreibers.

.. raw:: html

   </div>

K?nnen Sie Ihr Problem durch diese Ma?nahmen nicht l?sen, sollten Sie
einen Problembericht (PR) erstellen und die Ausgabe der weiter oben
genannten Werkzeuge in den Bericht aufnehmen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+--------------------------------------------+----------------------------------------------+
| `Zur?ck <network-routing.html>`__?   | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <network-usb-tethering.html>`__   |
+--------------------------------------+--------------------------------------------+----------------------------------------------+
| 33.2. Gateways und Routen?           | `Zum Anfang <index.html>`__                | ?33.4. USB Tethering                         |
+--------------------------------------+--------------------------------------------+----------------------------------------------+

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
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |9| image:: ./imagelib/callouts/9.png
