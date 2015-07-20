=========================================
33.10. IPv6 – Internet Protocol Version 6
=========================================

.. raw:: html

   <div class="navheader">

33.10. IPv6 – Internet Protocol Version 6
`Zur?ck <network-isdn.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <carp.html>`__

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

33.10. IPv6 – Internet Protocol Version 6
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Aaron Kaplan.

.. raw:: html

   </div>

.. raw:: html

   <div>

?berarbeitet und erweitert von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Erweitert von Brad Davis.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei IPv6 (auch als IPng oder *IP next generation* bekannt) handelt es
sich um die neueste Version des bekannten IP-Protokolls (das auch als
IPv4 bezeichnet wird). FreeBSD enth?lt, genauso wie die anderen frei
erh?ltlichen BSD-Systeme, die IPv6-Referenzimplementation von KAME.
FreeBSD erf?llt damit bereits alle f?r die Nutzung von IPv6 n?tigen
Voraussetzungen. Dieser Abschnitt konzentriert sich daher auf die
Konfiguration und den Betrieb von IPv6.

Anfang der 90er Jahre wurde man auf den stark steigenden Verbrauch von
IPv4-Adressen aufmerksam. Im Hinblick auf das Wachstums des Internets
gab es zwei Hauptsorgen:

.. raw:: html

   <div class="itemizedlist">

-  Die drohende Knappheit von IPv4-Adressen. Dieses Problem konnte durch
   die Einf?hrung von privaten Adressr?umen gem?? RFC1918 (mit Adressen
   wie ``10.0.0.0/8``, ``172.16.0.0/12``, oder ``192.168.0.0/16``) sowie
   der Entwicklung von *Network Address Translation* (NAT) weitestgehend
   entsch?rft werden.

-  Die immer gr??er werdenden Eintr?ge in Router-Tabellen. Dieses
   Problem ist auch heute noch aktuell.

.. raw:: html

   </div>

IPv6 ist in der Lage, diese, aber auch viele andere Probleme zu l?sen:

.. raw:: html

   <div class="itemizedlist">

-  IPv6 hat einen 128?Bit gro?en Adressraum. Es sind also theoretisch
   340.282.366.920.938.463.463.374.607.431.768.211.456 Adressen
   verf?gbar. In anderen Worten: F?r jeden Quadratmeter der
   Erdoberfl?che sind etwa 6,67?\*?10^27 IPv6-Adressen verf?gbar.

-  Router speichern nur noch Netzwerk-Aggregationsadressen in Ihren
   Routingtabellen. Dadurch reduziert sich die durchschnittliche Gr??e
   einer Routingtabelle auf 8192?Eintr?ge.

.. raw:: html

   </div>

Weitere n?tzliche Eigenschaften von IPv6 sind:

.. raw:: html

   <div class="itemizedlist">

-  Die automatische Konfiguration von Adressen, die im
   `RFC2462 <http://www.ietf.org/rfc/rfc2462.txt>`__ beschrieben wird.

-  Anycast-Adressen („eine-von-vielen“)

-  Verpflichtende Multicast-Adressen

-  Die Unterst?tzung von IPsec (IP-Security)

-  Eine vereinfachte Headerstruktur

-  Mobile IP-Adressen

-  Die Umwandlung von IPv4- in IPv6-Adressen

.. raw:: html

   </div>

Weitere Informationsquellen:

.. raw:: html

   <div class="itemizedlist">

-  Beschreibung von IPv6 auf
   `playground.sun.com <http://playground.sun.com/pub/ipng/html/ipng-main.html>`__

-  `KAME.net <http://www.kame.net>`__

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

33.10.1. Hintergrundinformationen zu IPv6-Adressen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt verschiedene Arten von IPv6-Adressen: Unicast-, Anycast- und
Multicast-Adressen.

Unicast-Adressen sind die herk?mmlichen Adressen. Ein Paket, das an eine
Unicast-Adresse gesendet wird, kommt nur an der Schnittstelle an, die
dieser Adresse zugeordnet ist.

Anycast-Adressen unterscheiden sich in ihrer Syntax nicht von
Unicast-Adressen, sie w?hlen allerdings aus mehreren Schnittstellen eine
Schnittstelle aus. Ein f?r eine Anycast-Adresse bestimmtes Paket kommt
an der n?chstgelegenen (entsprechend der Router-Metrik) Schnittstelle
an. Anycast-Adressen werden nur von Routern verwendet.

Multicast-Adressen bestimmen Gruppen, denen mehrere Schnittstellen
angeh?ren. Ein Paket, das an eine Multicast-Adresse geschickt wird,
kommt an allen Schnittstellen an, die zur Multicast-Gruppe geh?ren.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die von IPv4 bekannte Broadcast-Adresse (normalerweise
``xxx.xxx.xxx.255``) wird bei IPv6 durch Multicast-Adressen
verwirklicht.

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 33.1. Reservierte IPv6-Adressen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------------+---------------+------------------------------------------+---------------------------------------------------------------------------------------------------------------+
| IPv6-Adresse              | Pr?fixl?nge   | Beschreibung                             | Anmerkungen                                                                                                   |
+===========================+===============+==========================================+===============================================================================================================+
| ``::``                    | 128 Bit       | nicht festgelegt                         | entspricht ``0.0.0.0`` bei IPv4                                                                               |
+---------------------------+---------------+------------------------------------------+---------------------------------------------------------------------------------------------------------------+
| ``::1``                   | 128 Bit       | Loopback-Adresse                         | entspricht ``127.0.0.1`` bei IPv4                                                                             |
+---------------------------+---------------+------------------------------------------+---------------------------------------------------------------------------------------------------------------+
| ``::00:xx:xx:xx:xx``      | 96 Bit        | Eingebettete IPv4-Adresse                | Die niedrigen 32?Bit entsprechen der IPv4-Adresse. Wird auch als „IPv4-kompatible IPv6-Adresse bezeichnet“.   |
+---------------------------+---------------+------------------------------------------+---------------------------------------------------------------------------------------------------------------+
| ``::ff:xx:xx:xx:xx``      | 96 Bit        | Eine auf IPv6 abgebildete IPv4-Adresse   | Die niedrigen 32?Bit entsprechen der IPv4-Adresse. Notwendig f?r Rechner, die IPv6 nicht unterst?tzen.        |
+---------------------------+---------------+------------------------------------------+---------------------------------------------------------------------------------------------------------------+
| ``fe80::`` - ``feb::``    | 10 Bit        | *link-local*                             | Entspricht der Loopback-Adresse bei IPv4                                                                      |
+---------------------------+---------------+------------------------------------------+---------------------------------------------------------------------------------------------------------------+
| ``fec0::`` - ``fef::``    | 10 Bit        | *site-local*                             | ?                                                                                                             |
+---------------------------+---------------+------------------------------------------+---------------------------------------------------------------------------------------------------------------+
| ``ff::``                  | 8 Bit         | Multicast                                | ?                                                                                                             |
+---------------------------+---------------+------------------------------------------+---------------------------------------------------------------------------------------------------------------+
| ``001`` (im Dualsystem)   | 3 Bit         | Globaler Unicast                         | Alle globalen Unicastadressen stammen aus diesem Pool. Die ersten 3?Bit lauten „001“.                         |
+---------------------------+---------------+------------------------------------------+---------------------------------------------------------------------------------------------------------------+

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

33.10.2. IPv6-Adressen verstehen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die kanonische Form von IPv6-Adressen lautet ``x:x:x:x:x:x:x:x``, jedes
„x“ steht dabei f?r einen 16-Bit-Hexadezimalwert. Ein Beispiel f?r eine
IPv6-Adresse w?re etwa ``FEBC:A574:382B:23C1:AA49:4592:4EFE:9982``.

Eine IPv6-Adresse enth?lt oft Teilzeichenfolgen aus lauter Nullen. Eine
solche Zeichenfolge kann zu „::“ verk?rzt werden. Bis zu drei f?hrende
Nullen eines Hexquads k?nnen ebenfalls weggelassen werden. ``fe80::1``
entspricht also der Adresse ``fe80:0000:0000:0000:0000:0000:0000:0001``.

Eine weitere M?glichkeit ist die Darstellung der letzten 32?Bit in der
bekannten (dezimalen) IPv4-Darstellung, bei der Punkte („.“) zur
Trennung verwendet werden. ``2002::10.0.0.1`` ist also nur eine andere
Schreibweise f?r die (hexadezimale) kanonische Form
``2002:0000:0000:0000:0000:0000:0a00:0001``, die wiederum der Adresse
``2002::a00:1`` entspricht.

Sie sollten nun in der Lage sein, die folgende Ausgabe zu verstehen:

.. code:: screen

    # ifconfig
    rl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
             inet 10.0.0.10 netmask 0xffffff00 broadcast 10.0.0.255
             inet6 fe80::200:21ff:fe03:8e1%rl0 prefixlen 64 scopeid 0x1
             ether 00:00:21:03:08:e1
             media: Ethernet autoselect (100baseTX )
             status: active

Bei ``fe80::200:21ff:fe03:8e1%rl0`` handelt es sich um eine automatisch
konfigurierte *link-local*-Adresse. Sie wird im Rahmen der automatischen
Konfiguration aus der MAC-Adresse erzeugt.

Weitere Informationen zum Aufbau von IPv6-Adressen finden Sie im
`RFC3513 <http://www.ietf.org/rfc/rfc3513.txt>`__.

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

33.10.3. Eine IPv6-Verbindung herstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt derzeit vier M?glichkeiten, sich mit anderen IPv6-Rechnern oder
Netzwerken zu verbinden:

.. raw:: html

   <div class="itemizedlist">

-  Fragen Sie Ihren Internetprovider, ob er IPv6 bereits unterst?tzt.

-  `SixXS <http://www.sixxs.net>`__ bietet weltweit
   IPv6-Tunnelverbindungen an.

-  Die Verwendung eines 6-nach-4-Tunnels
   (`RFC3068 <http://www.ietf.org/rfc/rfc3068.txt>`__).

-  Die Verwendung des Ports ``/usr/ports/net/freenet6`` bei der Einwahl
   ins Internet.

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

33.10.4. DNS in der IPv6-Welt
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Urspr?nglich gab es zwei verschiedene DNS-Eintr?ge f?r IPv6. Da
A6-Eintr?ge von der IETF f?r obsolet erkl?rt wurden, sind AAAA-Eintr?ge
nun Standard.

Weisen Sie die erhaltene IPv6-Adresse Ihrem Rechnernamen zu, indem Sie
den Eintrag

.. code:: programlisting

    MYHOSTNAME           AAAA    MYIPv6ADDR

in Ihre prim?re DNS-Zonendatei einf?gen. Falls Sie nicht f?r Ihre
DNS-Zone verantwortlich sind, bitten Sie den daf?r Zust?ndigen, diese
?nderung durchzuf?hren. Die aktuellen Versionen von bind (Version?8.3
oder 9) sowie
`dns/djbdns <http://www.freebsd.org/cgi/url.cgi?ports/dns/djbdns/pkg-descr>`__
(bei Verwendung des IPv6-Patches) unterst?tzen AAAA-Eintr?ge.

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

33.10.5. ``/etc/rc.conf`` f?r die Nutzung von IPv6 anpassen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

33.10.5.1. Einen Client unter IPv6 einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt die Konfiguration eines Rechners, der in
Ihrem LAN als Client, aber nicht als Router verwendet wird. Um die
Schnittstelle w?hrend des Systemstarts mit
`rtsol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsol&sektion=8>`__
automatisch einzurichten, f?gen Sie folgende Zeile f?r
FreeBSD?9.\ *``x``* (und neuer) in ``/etc/rc.conf`` ein:

.. code:: programlisting

    ipv6_prefer="YES"

F?r FreeBSD?8.\ *``x``* (und ?lter) f?gen Sie stattdessen folgende Zeile
hinzu:

.. code:: programlisting

    ipv6_enable="YES"

Unter FreeBSD?9.\ *``x``* weisen Sie druch die folgende Zeile Ihrer
Schnittstelle ``fxp0`` die statische IP-Adresse
``2001:471:1f11:251:290:27ff:fee0:2093`` zu:

.. code:: programlisting

    ifconfig_fxp0_ipv6="inet6
    2001:471:1f11:251:290:27ff:fee0:2093 prefixlen
    64"

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Achten Sie darauf, *``prefixlen       64``* auf den entsprechenden Wert
f?r das Subnetz zu ?ndern, mit dem der Computer vernetzt ist.

.. raw:: html

   </div>

F?r FreeBSD?8.\ *``x``* f?gen Sie dagegen folgende Zeile hinzu:

.. code:: programlisting

    ipv6_ifconfig_fxp0="2001:471:1f11:251:290:27ff:fee0:2093"

Um ``2001:471:1f11:251::1`` als Standardrouter festzulegen, f?gen Sie
folgende Zeile in ``/etc/rc.conf`` ein:

.. code:: programlisting

    ipv6_defaultrouter="2001:471:1f11:251::1"

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

33.10.5.2. Gateways und Router unter IPv6 einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, wie Sie Ihren Rechner mit Hilfe der von
Ihrem Tunnel-Anbieter erhaltenen Anweisungen dauerhaft f?r die Nutzung
von IPv6 einrichten. Um den Tunnel beim Systemstart wiederherzustellen,
passen Sie ``/etc/rc.conf`` wie folgt an:

Listen Sie die einzurichtenden Tunnelschnittstellen (hier ``gif0``) auf:

.. code:: programlisting

    gif_interfaces="gif0"

Um den lokalen Endpunkt *``MY_IPv4_ADDR``* ?ber diese Schnittstelle mit
dem entfernten Endpunkt *``REMOTE_IPv4_ADDR``* zu verbinden, verwenden
Sie folgende Zeile:

.. code:: programlisting

    gifconfig_gif0="MY_IPv4_ADDR REMOTE_IPv4_ADDR"

Um die Ihnen zugewiesene IPv6-Adresse als Endpunkt Ihres IPv6-Tunnels zu
verwenden, f?gen Sie folgende Zeile f?r FreeBSD?9.\ *``x``* (und neuer)
ein:

.. code:: programlisting

    ifconfig_gif0_ipv6="inet6
    MY_ASSIGNED_IPv6_TUNNEL_ENDPOINT_ADDR"

F?r FreeBSD?8.\ *``x``* (und ?lter) f?gen Sie folgende Zeile ein:

.. code:: programlisting

    ipv6_ifconfig_gif0="
    MY_ASSIGNED_IPv6_TUNNEL_ENDPOINT_ADDR"

Nun m?ssen Sie nur noch die IPv6-Standardroute angeben. Diese legt das
andere Ende des IPv6-Tunnels fest.

.. code:: programlisting

    ipv6_defaultrouter="MY_IPv6_REMOTE_TUNNEL_ENDPOINT_ADDR"

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

33.10.5.3. Einen IPv6-Tunnel einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Server IPv6-Verkehr zwischen Ihrem Netzwerk und der Au?enwelt
routen muss, ben?tigen Sie zus?tzlich die folgenden Zeilen in Ihrer
``/etc/rc.conf``:

.. code:: programlisting

    ipv6_gateway_enable="YES"

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

33.10.6. Bekanntmachung von Routen und automatische Rechnerkonfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt die Einrichtung von
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__,
das Sie bei der Bekanntmachung der IPv6-Standardroute unterst?tzt.

Um
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__
zu aktivieren, f?gen Sie folgende Zeile in ``/etc/rc.conf`` ein:

.. code:: programlisting

    rtadvd_enable="YES"

Es ist wichtig, die Schnittstelle anzugeben, ?ber die IPv6-Routen
bekanntgemacht werden sollen. Soll
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__
``fxp0`` verwenden, ist folgender Eintrag n?tig:

.. code:: programlisting

    rtadvd_interfaces="fxp0"

Danach erzeugen Sie die Konfigurationsdatei ``/etc/rtadvd.conf``. Dazu
ein Beispiel:

.. code:: programlisting

    fxp0:\
        :addrs#1:addr="2001:471:1f11:246::":prefixlen#64:tc=ether:

Ersetzen Sie dabei ``fxp0`` durch die zu verwendende Schnittstelle.

Anschlie?end ersetzen Sie ``2001:471:1f11:246::`` durch das Pr?fix der
Ihnen zugewiesenen Verbindung.

Wenn Sie eine ``/64``-Netzmaske verwenden, m?ssen Sie keine weiteren
Anpassungen vornehmen. Anderenfalls m?ssen Sie ``prefixlen#`` auf den
korrekten Wert setzen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------+--------------------------------------------+-----------------------------------------------------+
| `Zur?ck <network-isdn.html>`__?                         | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <carp.html>`__                           |
+---------------------------------------------------------+--------------------------------------------+-----------------------------------------------------+
| 33.9. ISDN – dienstintegrierendes digitales Netzwerk?   | `Zum Anfang <index.html>`__                | ?33.11. CARP - Common Address Redundancy Protocol   |
+---------------------------------------------------------+--------------------------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
