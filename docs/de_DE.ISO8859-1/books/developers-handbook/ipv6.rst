=========================
Kapitel 8. IPv6 Internals
=========================

.. raw:: html

   <div class="navheader">

Kapitel 8. IPv6 Internals
`Zur?ck <sockets.html>`__?
Teil?II.?Interprozess-Kommunikation
?\ `Weiter <kernel.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Kapitel 8. IPv6 Internals
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`8.1. IPv6/IPsec-Implementierung <ipv6.html#ipv6-implementation>`__

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

8.1. IPv6/IPsec-Implementierung
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Yoshinobu Inoue.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Michelle Wechter und J?rgen Dankoweit.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt erkl?rt die von der IPv6- und IPsec-Implementierung
abh?ngigen Internas. Die Funktionalit?ten wurden vom
`KAME-Projekt <http://www.kame.net/>`__ abgeleitet

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.1. IPv6
~~~~~~~~~~~

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

8.1.1.1. Konformit?t
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die IPv6 abh?ngigen Funktionen richten sich nach, oder versuchen sich
nach den neuesten IPv6-Spezifikationen zu richten. (*Achtung*: Dies ist
keine vollst?ndige Liste - es w?re zu aufw?ndig, diese zu pflegen...).

F?r weitere Details beachten sie bitte die entsprechenden Kapitel, RFCs,
manual pages, oder Kommentare in den Quelltexten.

Konformit?tspr?fungen wurden basierend auf KAME-STABLE-Kit des
TAHI-Projekts durchgef?hrt. Die Ergebnisse k?nnen unter
``http://www.tahi.org/report/KAME/`` eingesehen werden. In der
Vergangenheit begleiteten wir auch Tests mit unseren ?lteren "Snapshots"
an der Univ. of New Hampshire IOL (``http://www.iol.unh.edu/``).

.. raw:: html

   <div class="itemizedlist">

-  RFC1639: FTP Operation Over Big Address Records (FOOBAR)

   .. raw:: html

      <div class="itemizedlist">

   -  RFC2428 wird gegen?ber RFC1639 bevorzugt. FTP-Clients versuchen
      zuerst RFC2428, dann im Fehlerfall RFC1639.

   .. raw:: html

      </div>

-  RFC1886: DNS Extensions to support IPv6

-  RFC1933: Transition Mechanisms for IPv6 Hosts and Routers

   .. raw:: html

      <div class="itemizedlist">

   -  IPv4 kompatible Adressen werden nicht unterst?tzt.

   -  Automatisches Tunneln (beschrieben in 4.3 dieses RFC) wird nicht
      unterst?tzt.

   -  Die
      `gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__-Schnittstelle
      implementiert einen IPv[46]-over-IPv[46] Tunnel in einer
      allgemeinen Art und Weise und es umfa?t "configured tunnel" wie in
      der Spezifikation beschrieben. Siehe auch
      `23.5.1.5 <ipv6.html#gif>`__ in diese Dokument f?r weitere
      Details.

   .. raw:: html

      </div>

-  RFC1981: Path MTU Discovery for IPv6

-  RFC2080: RIPng for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  usr.sbin/route6d unterst?tzt dies.

   .. raw:: html

      </div>

-  RFC2292: Advanced Sockets API for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  Unterst?tzte Bibliotheksfunktionen bzw. Kernel-APIs, siehe auch
      ``sys/netinet6/ADVAPI``.

   .. raw:: html

      </div>

-  RFC2362: Protocol Independent Multicast-Sparse Mode (PIM-SM)

   .. raw:: html

      <div class="itemizedlist">

   -  RFC2362 definiert Paketformate f?r PIM-SM.
      ``draft-ietf-pim-ipv6-01.txt`` wurde basierend auf diesem RFC
      verfa?t.

   .. raw:: html

      </div>

-  RFC2373: IPv6 Addressing Architecture

   .. raw:: html

      <div class="itemizedlist">

   -  Unterst?tzt vom Knoten erforderliche Adressen und richtet sich
      nach den Erfordernissen des Bereichs.

   .. raw:: html

      </div>

-  RFC2374: An IPv6 Aggregatable Global Unicast Address Format

   .. raw:: html

      <div class="itemizedlist">

   -  Unterst?tzt die 64-Bit-Breite einer Interface ID.

   .. raw:: html

      </div>

-  RFC2375: IPv6 Multicast Address Assignments

   .. raw:: html

      <div class="itemizedlist">

   -  Userland-Applikationen nutzen die bekannten Adressen, die in den
      RFC festgelegt sind.

   .. raw:: html

      </div>

-  RFC2428: FTP Extensions for IPv6 and NATs

   .. raw:: html

      <div class="itemizedlist">

   -  RFC2428 wird gegen?ber RFC1639 bevorzugt. FTP-Clients versuchen
      zuerst RFC2428, dann im Fehlerfall RFC1639.

   .. raw:: html

      </div>

-  RFC2460: IPv6 specification

-  RFC2461: Neighbor discovery for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  Siehe auch `23.5.1.2 <ipv6.html#neighbor-discovery>`__ in diesem
      Dokument f?r weitere Details.

   .. raw:: html

      </div>

-  RFC2462: IPv6 Stateless Address Autoconfiguration

   .. raw:: html

      <div class="itemizedlist">

   -  Siehe auch `23.5.1.4 <ipv6.html#ipv6-pnp>`__ in diesem Dokument
      f?r weitere Details.

   .. raw:: html

      </div>

-  RFC2463: ICMPv6 for IPv6 specification

   .. raw:: html

      <div class="itemizedlist">

   -  Siehe auch `23.5.1.9 <ipv6.html#icmpv6>`__ in diesem Dokument f?r
      weitere Details.

   .. raw:: html

      </div>

-  RFC2464: Transmission of IPv6 Packets over Ethernet Networks

-  RFC2465: MIB for IPv6: Textual Conventions and General Group

   .. raw:: html

      <div class="itemizedlist">

   -  Notwendige Statistiken werden vom Kernel gesammelt. Die aktuelle
      IPv6-MIB-Unterst?tzung wird als Patch-Sammlung f?r ucd-snmp
      bereitgestellt.

   .. raw:: html

      </div>

-  RFC2466: MIB for IPv6: ICMPv6 group

   .. raw:: html

      <div class="itemizedlist">

   -  Notwendige Statistiken werden vom Kernel gesammelt. Die aktuelle
      IPv6-MIB-Unterst?tzung wird als Patch-Sammlung f?r ucd-snmp
      bereitgestellt.

   .. raw:: html

      </div>

-  RFC2467: Transmission of IPv6 Packets over FDDI Networks

-  RFC2497: Transmission of IPv6 packet over ARCnet Networks

-  RFC2553: Basic Socket Interface Extensions for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  IPv4 mapped address (3.7) and special behavior of IPv6 wildcard
      bind socket (3.8) are supported. See
      `23.5.1.12 <ipv6.html#ipv6-wildcard-socket>`__ in this document
      for details.

   .. raw:: html

      </div>

-  RFC2675: IPv6 Jumbogramms

   .. raw:: html

      <div class="itemizedlist">

   -  Siehe auch `23.5.1.7 <ipv6.html#ipv6-jumbo>`__ in diesem Dokument
      f?r weitere Details.

   .. raw:: html

      </div>

-  RFC2710: Multicast Listener Discovery for IPv6

-  RFC2711: IPv6 router alert option

-  ``draft-ietf-ipngwg-router-renum-08``: Router renumbering for IPv6

-  ``draft-ietf-ipngwg-icmp-namelookups-02``: IPv6 Name Lookups Through
   ICMP

-  ``draft-ietf-ipngwg-icmp-name-lookups-03``: IPv6 Name Lookups Through
   ICMP

-  ``draft-ietf-pim-ipv6-01.txt``: PIM for IPv6

   .. raw:: html

      <div class="itemizedlist">

   -  `pim6dd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pim6dd&sektion=8>`__
      implementiert dense mode.
      `pim6sd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pim6sd&sektion=8>`__
      implementiert sparse mode.

   .. raw:: html

      </div>

-  ``draft-itojun-ipv6-tcp-to-anycast-00``: Unterbrechen einer
   TCP-Verbindung toward IPv6 anycast address

-  ``draft-yamamoto-wideipv6-comm-model-00``

   .. raw:: html

      <div class="itemizedlist">

   -  Beachte `23.5.1.6 <ipv6.html#ipv6-sas>`__ in deisem Dokument f?r
      weitere Deatils.

   .. raw:: html

      </div>

-  ``draft-ietf-ipngwg-scopedaddr-format-00.txt           ``: Eine
   Erweiterung des Format for IPv6 Scoped Addresses

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

8.1.1.2. Neighbor Discovery
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Neighbor Discovery ist weitestgehend stabil. Zur Zeit werden
Addressaufl?sung, Duplicated Address Detection (DAD), und Neighbor
Unreachability Detection (NUD) unterst?tzt. In der n?heren Zukunft
werden wir Proxy Neighbor Advertisement Unterst?tzung in den Kernel
einbauen und Unsolicited Neighbor Advertisement ?bertragungskommandos
als Verwaltungsprogramm zur Verf?gung stellen.

Falls DAD versagt, wird die Adresse als "duplicated" markiert und eine
Nachricht wird erzeugt, die an Syslog gesandt wird (und f?r gew?hnlich
an die Konsole). Die "duplicated"-Markierung kann mit
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
?berpr?ft werden. Es liegt in der Verantwortung des Administrators, auf
DAD-Fehler zu achten und diese zu beheben. Dieses Verhalten sollte in
der n?heren Zukunft verbessert werden.

Manche Netzwerktreiber verbinden Multicast-Pakete mit sich selbst,
sogar, wenn es vorgeschrieben ist, es nicht zu tun (vor allem im
Promiscuous-Modus). In solchen F?llen k?nnte DAD versagen, weil die
DAD-Steuerung ein inbound NS packet sieht (eigentlich vom Knoten selber)
und betrachtet es als ein Duplikat. Sie k?nnten sich die #if-Bedingung
ansehen, die in sys/netinet6/nd6\_nbr.c:nd6\_dad\_timer() als
"Workaround" mit "heuristics" markiert ist (Beachte, dass das
Kodefragment im Abschnitt "heuristics" nicht der Spezifikation
entspricht).

Neighbor Discovery specification (RFC2461) kommuniziert in den folgenden
F?llen nicht ?ber neighbor cache handling:

.. raw:: html

   <div class="orderedlist">

#. Der Knoten empfing ein unverlangtes RS/NS/NA/redirect-Paket ohne
   Link-Layer-Adresse, wenn kein neighbor cache-Eintrag vorhanden ist.

#. neighbor cache handling bei Ger?ten ohne Link-Layer-Adresse (wir
   ben?tigen einen neighbor cache Eintrag f?r das IsRouter-Bit)

.. raw:: html

   </div>

Im ersten Fall implemenierten wir einen Workaround basierend auf
Diskussionen in der IETF-Ipngwg-Mailing-Liste. F?r weitere Details
beachten Sie die Kommentare im Quelltext und im Email-Thread, der bei
(IPng 7155) mit dem Datum vom 6. Feb 1999 gestartet wurde.

IPv6 on-link Erkennungsregel (RFC2461) ist recht unterschiedlich zu
?bernahmen im BSD-Netzwerkkode. Zur Zeit wird keine on-link
Erkennungsregel unterst?tzt, bei der die Defaultrouter-Liste leer ist
(RFC2461, Abschnitt 5.2, letzter Satz im zweiten Absatz - beachte, dass
die Spezifikation das Wort "host" und "Knoten" an mehreren Stellen im
Abschnitt mi?braucht).

Um m?gliche DoS-Attacken und unendliche Schleifen zu verhindern, werden
bis jetzt nur 10 Optionen bei ND-Paketen akzeptiert. Deshalb werden nur
die ersten 10 Pr?fixe ber?cksichtigt, wenn man 20-Pr?fixoptionen zu RA
hinzugef?gt hat. Falls das zu Schwierigkeiten f?hren sollte, dann sollte
in der FREEBSD-CURRENT-Mailing-Liste gefragt werden und/oder die
Variable nd6\_maxndopt in ``sys/netinet6/nd6.c`` modifizieren. Falls die
Nachfrage gro? genug ist, k?nnte man einen sysctl-Knopf f?r die Variable
vorsehen.

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

8.1.1.3. Bereichsindex
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPv6 benutzt Adressbereiche (Scoped Addresses). Deshalb ist es sehr
wichtig, mit einer IPv6-Adresse einen Bereichsindex anzugeben
(Schnittstellenindex f?r link-local-Adresse, oder einen Lageindex f?r
site-local-Adressen). Ohne einen Bereichsindex ist ein
IPv6-Adressbereich f?r den Kernel zweideutig und dem Kernel ist es nicht
m?glich, die Ausgabeschnittstelle f?r ein Paket festzustellen.

Gew?hnliche Userland-Anwendungen sollten die erweiterte
Programmierschnittstelle (RFC2292) benutzen, um den Bereichsindex oder
Schnittstellenindex festzulegen. F?r ?hnliche Zwecke wurde in RFC2553
sin6\_scope\_id member in der sockaddr\_in6-Struktur definiert. Wie auch
immer, die Semantik f?r sin6\_scope\_id ist ziemlich wage. Wenn man auf
Portierbarkeit der Anwendung achten mu?, dann schlagen wir vor, die
erweiterte Programmierschnittstelle anstelle von sin6\_scope\_id zu
benutzen.

Im Kernel ist ein Schnittstellenindex f?r link-local scoped-Adressen in
das zweite 16bit-Wort (drittes und viertes Byte) der IPv6-Adresse
eingebettet. Zum Beispiel sieht man folgendes

.. code:: screen

      fe80:1::200:f8ff:fe01:6317

in der Routing-Tabelle und in der Schnittstellenadress-Struktur
(structin6\_ifaddr). Oben genannte Adresse ist eine "link-local unicast
address" die zu einer Netzwerkschnittstelle geh?rt, deren
Schnittstellenbezeichner 1 (eins) ist. Der eingebettete Index erm?glicht
es, IPv6 link local-Adressen ?ber mehrere Schnittstellen hinweg effektiv
und mit wenig ?nderungen am Kode zu identifizieren.

Routing-D?monen und Konfigurationsprogramme wie
`route6d(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route6d&sektion=8>`__
und
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
werden den "eingebetteten" Bereichsindex ver?ndern m?ssen. Diese
Programme benutzen routing sockets und ioctls (wie SIOCGIFADDR\_IN6) und
die Kernel-Programmierschnittstelle wird IPv6-Adressen, dessen zweites
16-Bit-Word gesetzt ist, zur?ckgeben. Diese Programmierschnittstellen
dienen zur ?nderung der Kernel-internen Struktur. Programme, die diese
Programmierschnittstellen benutzen, m?ssen ohnehin auf Unterschiede in
den Kerneln vorbereitet sein.

Wenn man einen Adressbereich in der Kommandozeile angibt, schreibt man
niemals die eingebettete Form (so etwas wie ff02:1::1 or fe80:2::fedc).
Man erwartet nicht, dass es funktioniert. Man benutzt immer die
Standardform wie ff02::1 oder fe80::fedc, zusammen mit der
Kommandozeilenoption, die die Schnittstelle festlegt (wie
``ping6 -I ne0 ff02::1``). Allgemein gilt, wenn ein Kommando keine
Kommandozeilenoption hat, um die Ausgabeschnittstelle zu definieren, ist
dieses Kommando noch nicht f?r Adressbereiche bereit. Dies scheint der
Pr?misse von IPv6 entgegenzustehen. Wir glauben, dass die
Spezifikationen einige Verbesserungen ben?tigen.

Einige der Userland-Werkzeuge unterst?tzen die erweiterte numerische
IPv6-Syntax wie sie in ``draft-ietf-ipngwg-scopedaddr-format-00.txt``
beschrieben ist. Man kann die ausgehende Verbindung angeben, indem man
den Namen der ausgehenden Schnittstelle wie folgt benutzt:
"fe80::1%ne0". Auf diese Art und Weise ist man in der Lage, eine
link-local scoped Adresse ohne viele Schwierigkeiten anzugeben.

Um die Erweiterungen im eigenen Programm zu nutzen, muss man
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
und
`getnameinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnameinfo&sektion=3>`__
mit NI\_WITHSCOPEID verwenden. Die Implementierung setzt im Moment eine
1-zu-1 Beziehung zwischen einer Verbindung und einer Schnittstelle
voraus, die st?rker ist, als es die Spezifikationen beschreiben.

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

8.1.1.4. Plug and Play
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der gr?sste Teil der statuslosen IPv6-Adress-Autokonfiguration ist im
Kernel implementiert. Neighbor-Discovery-Funktionen sind als ganzes im
Kernel implementiert. Router-Advertisement (RA) Eingabe f?r Hosts ist im
Kernel implementiert. Router-Solicitation (RS) Ausgabe f?r Hosts,
RS-Eingabe f?r Router und RA-Ausgabe f?r Router ist im Userland
implementiert.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.1.4.1. Zuweisung von link-local und speziellen Adressen
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die IPv6 link-local-Adresse wird aus einer IEEE802-Adresse (Ethernet MAC
address) erzeugt. Jeder Schnittstelle wird automatisch eine IPv6
link-local-Adresse zugewiesen, sobald die Schnittstelle aktiv ist
(IFF\_UP). Ebenso wird eine direkte Route f?r die link-local-Adresse zur
Routing-Tabelle hinzugef?gt.

Hier ist eine Ausgabe des netstat-Kommandos:

.. code:: screen

    Internet6:
    Destination                   Gateway                   Flags      Netif Expire
    fe80:1::%ed0/64               link#1                    UC          ed0
    fe80:2::%ep0/64               link#2                    UC          ep0

Schnittstellen, die keine IEEE802-Adresse haben (Pseudo-Schnittstellen
wie Tunnel-Schnittstellen oder ppp-Schnittstellen), borgen sich eine
IEEE802-Adresse von anderen Schnittstellen wie Ethernet-Schnittstellen
aus, wann immer das m?glich ist. Wenn keine IEEE802-Ger?te eingebaut
sind, wird als letzte M?glichkeit eine Pseudo-Zufallszahl -
MD5(hostname) - als Quelle f?r eine link-local-Adresse benutzt. Falls
diese f?r den Einsatz nicht geeignet sein sollte, dann muss man eine
link-local-Adresse manuell konfigurieren.

Falls eine Schnittstelle nicht imstande ist, IPv6-Adressen zu handhaben
(wie fehlende Unterst?tzung des multicast), wird keine
link-local-Adresse der Schnittstelle zugewiesen. Siehe Abschnitt 2 f?r
weitere Details.

Jede Schnittstelle verbindet die solicited multicast Adresse und
link-local all-nodes multicast-Adressen (z.B. fe80::1:ff01:6317 und
ff02::1, jeweils zu der Verbindung, an die die Schnittstelle verbunden
ist). zus?tzlich zu einer link-local-Adresse wird eine loopback-Adresse
(::1) einer loopback-Schnittstelle zugewiesen. Au?erdem werden ::1/128
und ff01::/32 automatisch zur Routing-Tabelle hinzugef?gt und die
loopback-Schnittstelle verbindet sich mit der node-local multicast
Gruppe ff01::1.

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

8.1.1.4.2. Stateless address autoconfiguration beim Host
''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der IPv6-Spezifikation werden Knoten in zwei Kategorien unterteilt:
*Router* und *Hosts*. Router leiten Pakete, die an andere adressiert
sind, weiter, Hosts leiten Pakete nicht weiter. net.inet6.ip6.forwarding
definiert, ob dieser Knoten ein Router oder ein Host ist (Router falls
es 1 ist, Host, falls es 0 ist).

Sobald ein Host ein Router-Advertisement vom Router h?rt, kann er sich
selbst mit statusloser automatischer Adressen konfigurieren. Dieses
Verhalten kann mit net.inet6.ip6.accept\_rtadv (der Host konfiguriert
sich selber, wenn es auf 1 gesetzt ist) beeinflusst werden. Bei einer
automatischen Konfiguration wird das Netzwerkadresspr?fix f?r die
empfangende Schnittstelle (f?r gew?hnlich das globale Adresspr?fix)
hinzugef?gt. Die Standard-Route wird ebenso konfiguriert. Router
erzeugen periodisch Router-Advertisement-Pakete. Um einen benachbarten
Router aufzufordern, ein RA-Paket zu erzeugen, kann eine
Host-Router-Solicitation ?bertragen werden. Um jederzeit ein RS-Paket zu
erzeugen, benutzt man das *rtsol*-Kommando. Ein
`rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8>`__-D?mon
ist ebenso verf?gbar.
`rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8>`__
erzeugt Router-Solicitation, wann immer es notwendig ist und es
funktioniert gro?artig "bei normadischem Einsatz" (Notebooks/Laptops).
Falls jemand Router-Advertisements zu ignorieren w?nscht, setzt man mit
sysctl et.inet6.ip6.accept\_rtadv auf 0.

Um Router-Advertisement von einem Router aus zu erzeugen, benutzt man
den
`rtadvd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtadvd&sektion=8>`__-D?mon.

Beachte, dass die IPv6-Spezifikation von folgenden Punkte ausgeht und
nicht konforme F?lle werden als nicht spezifiziert ausgelassen:

.. raw:: html

   <div class="itemizedlist">

-  Nur Hosts h?ren auf Router-Angebote

-  Hosts haben eine einzige Netzwerk-Schnittstelle (au?er loopback)

.. raw:: html

   </div>

Deshalb ist es unklug, net.inet6.ip6.accept\_rtadv bei Routern oder bei
Hosts mit mehreren Schnittstellen einzuschalten. Ein falsch
konfigurierter Knoten kann sich seltsam verhalten (nicht konforme
Konfiguration ist f?r diejenigen erlaubt, die Experimente durchf?hren
m?chten).

Eine Zusammenfassung des sysctl-Angaben:

.. code:: screen

        accept_rtadv forwarding Rolle des Knotens
       ---     ---    ---
        0       0    Host (wird manuell konfiguriert)
        0       1    Router
        1       0    automatisch konfigurierter Host
                     (Die Spezifikation setzt voraus, dass der Host nur eine einzelne Schnittstelle hat, ein automatisch konfigurierter Host mit mehreren Schnittstellen ist au?erhalb der Betrachtung)
        1       1    ung?ltig, oder f?r Experimentierzwecke (au?erhalb der Spezifikation)

RFC2462 hat eine ?berpr?fungsregel gegen eingehende
RA-prefix-information-option, in 5.5.3 (e). Dies dient zum Schutz des
Hosts vor schlecht oder falsch konfigurierten Routern, die eine sehr
kurze Pr?fixlebenszeit ank?ndigen. Es gab Aktualisierungen von Jim Bound
in der ipngwg-Mailing-Liste (suche nach "(ipng 6712)" im Archive) und es
wurde Jims Aktualisierung implementiert.

Siehe auch `23.5.1.2 <ipv6.html#neighbor-discovery>`__ im Dokument f?r
das Verh?ltnis zwischen DAD und autoconfiguration.

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

8.1.1.5. Generische Tunnel-Schnittstelle
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GIF (Generische Schnittstelle) ist eine Pseudoschnittstelle f?r
konfigurierte Tunnel. Details sind in
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__
beschrieben. Im Moment sind

.. raw:: html

   <div class="itemizedlist">

-  v6 in v6

-  v6 in v4

-  v4 in v6

-  v4 in v4

.. raw:: html

   </div>

verf?gbar. Benutze
`gifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gifconfig&sektion=8>`__,
um die physikalische (au?erhalb liegende) Quelle und die Zieladresse den
gif-Schnittstellen zuzuweisen. Eine Konfiguration, die die selbe
Adressfamilie f?r innere und ?u?ere IP-Header (v4 in v4, oder v6 in v6)
benutzt, ist gef?hrlich. Es ist sehr leicht, Schnittstellen und
Routing-Tabellen so zu konfigurieren, dass eine unendliche Ebene von
Tunneln ausgef?hrt wird. *Seien Sie also gewarnt*.

gif kann ECN-freundlich konfiguriert werden. Beachte
`23.5.4.5 <ipv6.html#ipsec-ecn>`__ f?r eine ECN-Freundlichkeit von
Tunneln und
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__ wie
man sie konfiguriert.

Falls man einen IPv4-in-IPv6-Tunnel mit einer gif-Schnittstelle
konfigurieren m?chte, sollte man
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__
sorgf?ltig lesen. Man muss die IPv6 link-local Adresse, die automatisch
der gif-Schnittstelle zugewiesen wird, entfernen.

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

8.1.1.6. Source Address Selection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Moment ist die Regel zur Auswahl der Quelle bereichsorientiert (es
gibt einige Ausnahmen - siehe unten). F?r ein gegebenes Ziel wird eine
Quell-IPv6-Adresse durch folgende Regel ausgew?hlt:

.. raw:: html

   <div class="orderedlist">

#. Falls die Quelladresse explizit durch den Benutzer angegeben ist
   (z.B. ?ber das erweiterte API), dann wird die angegebene Adresse
   benutzt.

#. Falls eine Adresse der ausgehenden Schnittstelle zugewiesen wird, die
   den selben Bereich wie die Zieladresse hat (was normalerweise durch
   einen Blick in die Routing-Tabelle festgestellt werden kann), dann
   wird diese Adresse benutzt.

   Dies ist ein typischer Fall.

#. Falls keine Adresse der obigen Bedingung gen?gt, dann w?hlt man eine
   globale Adresse, die einer der Schnittstellen des sendenden Knotens
   zugewiesen ist.

#. Falls keine Adresse der obigen Bedingung gen?gt und die Zieladresse
   ist im site local-Bereich, dann w?hlt man eine eine site
   local-Adresse, die einer der Schnittstellen des sendenden Knotens
   zugewiesen ist.

#. Falls keine Adresse der obigen Bedingung gen?gt, dann w?hlt man eine
   Adresse, die mit einem Eintrag in der Routing-Tabelle f?r das Ziel
   verbunden ist. Dies ist die letzte M?glichkeit, die eine
   Bereichsverletzung verursachen k?nnte.

.. raw:: html

   </div>

Zum Beispiel, ::1 ist ausgew?hlt f?r ff01::1, fe80:1::200:f8ff:fe01:6317
f?r fe80:1::2a0:24ff:feab:839b (beachte den eingebetteten
Schnittstelleindex - beschrieben in
`23.5.1.3 <ipv6.html#ipv6-scope-index>`__ - er hilft uns, die richtige
Quelladresse auszuw?hlen. Diese eingebetteten Indexe werden nicht
?bertragen). Falls die ausgehende Schnittstelle mehrere Adressen f?r
einen Bereich hat, wird die Quelle gew?hlt, die die breiteste passende
Basis hat (Regel 3). Angenommen 2001:0DB8:808:1:200:f8ff:fe01:6317 und
2001:0DB8:9:124:200:f8ff:fe01:6317 sind einer ausgehenden Schnittstelle
zugewiesen. 2001:0DB8:808:1:200:f8ff:fe01:6317 wird als Quelle f?r das
Ziel 2001:0DB8:800::1 ausgew?hlt.

Beachte, dass obige Regel nicht in der IPv6-Spezifikation dokumentiert
ist. Es wird als "up to implementation"-Punkt betrachtet. Es gibt einige
F?lle, bei denen die obige Regel nicht benutzt werden soll. Ein Beispiel
ist die verbundene TCP-Sitzung und man benutzt die Adresse, die in tcb
als Quelle gehalten wird. Ein anderes Beispiel ist die Quelladresse f?r
Neighbor Advertisement. Laut Spezifikation (RFC2461 7.2.2) sollte die
Quelle des NA die Zieladresse des korrespondierenden Ziel des NS sein.
In diesem Fall folgen wir eher der Spezifikation, als der obigen
longest-match-Regel.

F?r neue Verbindungen werden (wenn Regel eins nicht zutrifft) abgelehnte
Adressen (Adressen mit bevorzugter Lebenszeit = 0) nicht ausgew?hlt,
wenn andere Auswahlm?glichkeiten bestehen. Wenn keine anderen
Auswahlm?glichkeiten bestehen, werden abgelehnte Adressen als letzte
M?glichkeit benutzt. Falls mehrere Auswahlm?glichkeiten f?r abgelehnte
Adressen bestehen, dann wird ogige Regel verwendet, um aus diesen
abgelehnten Adressen auszuw?hlen. Falls man aus bestimmten Gr?nden die
Benutzung abgelehnter Adressen unterbinden m?chte, dann setzt man
net.inet6.ip6.use\_deprecated auf 0. Der Punkt bez?glich der abgelehnten
Adressen ist in RFC2462 5.5.4 beschrieben (Beachte: Im Moment wird in
der IETF ipngwg dar?ber debatiert, wie angelehnte Adressen benutzt
werden sollen).

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

8.1.1.7. Jumbo Payload
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Jumbo-Payload hop-by-hop-Option ist implementiert und kann benutzt
werden, um IPv6-Pakete mit Datenpaketen gr??er als 65.535 Oktette. Aber
im Moment wird keine physikalische Schnittstelle unterst?tzt, deren MTU
gr??er ist als 65.536, so dass diese Datenpakete nur bei den
loopback-Schnittstellen zu finden sind (z.B. lo0).

Falls man die Jumbo Payloads testen m?chte, muss man zun?chst den Kernel
rekonfigurieren, so dass die MTU der loopback-Schnittstelle gr?sser
65.535 Bytes sein kann. F?ge folgende Zeile zur Kernel-Konfiguration
hinzu:

``       options       "LARGE_LOMTU"       #Um Jumbo Payload zu testen       ``

und dann kompiliere den Kernel neu.

Dann kann man die Jumbo-Payloads mittels
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8>`__-Kommando
mit den Optionen -b und -s testen. Die Option -b muss angegeben werden,
um die Gr??e des Socket-Puffers zu erh?n, und die Option -s gibt die
Gr??e des Pakets an, die gr??er als 65.535 sein sollte. Beispielsweise
gibt man folgendes ein:

.. code:: screen

    % ping6 -b 70000 -s 68000 ::1

Die IPv6-Spezifikation verlangt, dass die Jumbo-Payload-Option nicht in
einem Paket verwendet werden darf, das einen fragmentierten Header hat.
Falls diese Bedingung nicht zutrifft, dann muss eine
ICMPv6-Parameter-Problem-Nachricht an den Absender geschickt werden. Die
Spezifikation ist befolgt, aber man kann normalerweise nicht einen
ICMPv6-Fehler sehen, der durch diese Forderung hervorgerufen wird.

Wenn ein IPv6-Paket empfangen wird, dann wird die Rahmenl?nge gepr?ft
und sie wird mit der Gr??e verglichen, die im Datenfeld f?r die
Paketgr??e des IPv6-Headers oder im Wert f?r die Jumbo-Payload-Option
angegeben ist, sofern vorhanden. Falls ersterer kleiner als letzterer
ist, dann wird das Paket abgelehnt und die Statistiken werden erh?ht.
Man kann die Statistik als Ausgabe des
`netstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=8>`__-Kommandos
mit der \`-s -p ip6'-Option sehen:

.. code:: screen

    % netstat -s -p ip6
          ip6:
            (snip)
            1 with data size < data length

So, der Kernel sendet keinen ICMPv6-Fehler, au?er das fehlerhafte Paket
ist ein aktuelles Jumbo-Payload, dessen Paketgr??e gr??er als 65,535
Bytes ist. Wie oben beschrieben, gibt es momentan keine physikalische
Schnittstelle, die eine so riesige MTU unterst?tzt, daher gibt es so
selten einen ICMPv6-Fehler.

TCP/UDP over Jumbogramm wird im Moment nicht unterst?tzt. Dies kommt
daher, weil wir kein Medium (au?er loopback) haben, dies zu testen.
Melden Sie sich, falls Sie es ben?tigen.

IPsec funktioniert nicht mit Jumbogramm. Dies ist bedingt durch einige
?nderungen an der Spezifikation, welche die Unterst?tzung von AH mit
Jumbogramm betrifft (AH-Header-Gr??e beeinflusst die L?nge des
Datenpakets und das macht es richtig schwierig, ein eingehendes Paket
mit Jumbo-Payload-Option so gut zu authentifizieren wie ein AH).

Es gibt grundlegende Punkte in der \*BSD-Unterst?tzung f?r Jumbogramms.
Wir w?rden jene gerne ansprechen, aber wir ben?tigen mehr Zeit diese
fertig zu stellen. Um ein paar zu benennen:

.. raw:: html

   <div class="itemizedlist">

-  mbuf pkthdr.len-Feld ist in 4.4BSD typisiert als "int", so dass es
   kein Jumbogramm mit len > 2G bei 32Bit-Architekturen aufnehmen kann.
   Wenn wir Jumbogramme geeignet unterst?tzen wollten, dann muss das
   Feld erweitert werden, damit es 4G + IPv6-Header + link-layer-Header
   aufnehmen kann. Deshalb muss es schlie?lich auf int64\_t (u\_int32\_t
   ist NICHT genug) erweitert werden.

-  Irrigerweise benutzen wir "int" an vielen Stellen, um die Paketl?nge
   aufzunehmen. Wir m?ssen sie in einen gr??eren ganzzahligen Typ
   konvertieren. Es braucht gro?e Vorsicht, weil wir sonst einen
   ?berlauf w?hrend der Berechnung der Paketl?nge erleben k?nnen.

-  Irrigerweise pr?fen wir das ip6\_plen-Feld des IPv6-Header f?r packet
   payload length an verschiedenen Stellen. Wir sollten mbuf pkthdr.len
   stattdessen pr?fen. ip6\_input() wird bei der Eingabe eine Pr?fung
   der Jumbo -Payload-Option durchf?hren und wir k?nnen danach mbuf
   pkthdr.len sicher benutzen.

-  Nat?rlich braucht der TCP-Kode an einigen Stellen eine sorgf?ltige
   Aktualisierung.

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

8.1.1.8. Verhindern von Schleifen beim Verarbeiten von Headern
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die IPv6-Spezifikation erlaubt eine willk?rliche Zahl von
Erweiterungs-Headern, die in einem Paket platziert werden k?nnen. Wenn
wir IPv6-Kode f?r die Paketverarbeitung auf die Art und Weise
implementieren wie wir es beim BSD-IPv4-Kode geschehen ist, dann w?rde
wegen einer lange Kette von Funktionsaufrufen der Kernel-Stack
?berlaufen. sys/netinet6-Kode ist behutsam entwickelt wurden, um einen
?berlauf des Kernel-Stacks zu verhindern. Deswegen definiert der
sys/netinet6-Kode seine eigene Protocol-Switch-Struktur "struct
ip6protosw" (siehe auch ``netinet6/ip6protosw.h``). Aus Gr?nden der
Kompatibilit?t gibt es keine solche Aktualisierung im IPv4-Teil
(sys/netinet), aber eine kleine ?nderung ist zum pr\_input()-Prototyp
hinzugef?gt worden. So ist "struct ipprotosw" ebenso definiert. Deswegen
kann der Kernel-Stack sich aufbl?hen, wenn man ein IPsec-over-IPv4-Paket
mit einer massiven Zahl von IPSec-Header empf?ngt. IPsec-over-IPv6 ist
in Ordnung. (Nat?rlich muss f?r all diese zu verarbeitenden IPSec-Header
jeder einzelne IPSec-Header jede IPSec-Pr?fung durchlaufen. So wird es
einem anonymen Angreifer unm?glich gemacht eine Attacke durchzuf?hren.)

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

8.1.1.9. ICMPv6
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem RFC2463 ver?ffentlicht worden war, hat die IETF-ipngwg
beschlossen ICMPv6-Fehler-Pakete gegen ICMPv6 umzuleiten, um einen
ICMPv6-Sturm auf einem Netzwerkmedium zu unterbinden. Dies ist bereits
im Kernel implementiert.

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

8.1.1.10. Anwendungen
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?r Programmierung des Userland unterst?tzen wir das IPv6-Socket-API wie
es in RFC2553, RFC2292 und in aufkommenden Internet-Konzepten
beschrieben ist.

TCP/UDP ?ber IPv6 ist verf?gbar und ziemlich stabil. Man kann sich an
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__,
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1>`__,
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__,
`rsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsh&sektion=1>`__,
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__,
usw. erfreuen. Diese Anwendungen sind unabh?ngig vom Protokoll. Das
liegt daran, weil diese Programme automatisch IPv4 oder IPv6
entsprechend des DNS ausw?hlen.

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

8.1.1.11. Kernel Interna
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend ip\_forward() ip\_output() aufruft, ruft ip6\_forward() direkt
if\_output() auf, da Router IPv6-Pakete nicht in Fragmente teilen
d?rfen.

ICMPv6 sollte das original Paket so lang wie m?glich bis maximal 1280
halten. UDP6/IP6 port unreach, zum Beispiel, sollte alle
Erweiterungs-Header und die unver?nderten UDP6- und IP6-Header
enthalten. Um das originale Paket zu erhalten, konvertieren alle
IP6-Funktionen au?er TCP niemals Network-Byte-Order in Host-Byte-Order.

tcp\_input(), udp6\_input() und icmp6\_input() k?nnen nicht
voraussetzen, dass der IP6-Header vor dem Transport-Header, der zum
Extension-Header geh?rt, kommt. Deshalb wurde in6\_cksum()
implementiert, um Pakete, deren IP6-Header und Transport-Header nicht
fortlaufend ist, zu behandeln. Weder TCP/IP6- noch
UDP6/IP6-Header-Strukturen existieren, um eine Pr?summe zu bilden.

Um IP6-Header, Extension-Header und Transport-Headers leichter
verarbeiten zu k?nnen, werden nun Netzwerktreiber ben?tigt, die Pakete
in einem internen mbuf oder in einem oder mehreren externen mbuf
speichern k?nnen. Ein typischer alter Treiber legt zwei interne mbuf f?r
96 - 204 Bytes an Daten an, wie auch immer wird ein solches Paket jetzt
in einem externen mbuf gespeichert.

``netstat -s -p ip6`` ermittelt, ob der Treiber sich nach solchen
Erfordernissen richtet, oder nicht. Im folgenden Beispiel verletzt
"cce0" dies Erfordernisse (F?r weitere Informationen, siehe Abschnitt
2.).

.. code:: screen

    Mbuf statistics:
                    317 one mbuf
                    two or more mbuf::
                            lo0 = 8
                cce0 = 10
                    3282 one ext mbuf
                    0 two or more ext mbuf

Jede Eingabefunktion ruft IP6\_EXTHDR\_CHECK am Anfang auf, um zu
pr?fen, ob der Bereich zwischen IP6 und seinen Header durchgehend ist.
IP6\_EXTHDR\_CHECK ruft m\_pullup() nur dann auf, wenn mbuf das
M\_LOOP-Flag gestzt hat, weil das Paket von der Loopback-Schnittstelle
kommt. m\_pullup() wird niemals aufgerufen, wenn Pakete von
physikalischen Netzwerkschnittstellen kommen.

IP- und IP6-Reassemble-Funktionen rufen niemals m\_pullup() auf.

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

8.1.1.12. IPv4-Mapped-Address und IPv6-Wildcard-Socket
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

RFC2553 beschreibt IPv4-Mapped-Address (3.7) und die spezielle
Verhaltensweise des IPv6-Wildcard-Bind-Socket (3.8). Die Spezifikation
gestattet es:

.. raw:: html

   <div class="itemizedlist">

-  IPv4-Verbindungen von AF\_INET6-Wildcard-Bind-Socket zu erlauben.

-  IPv4-Pakete ?ber AF\_INET6-Socket zu transportieren, indem eine
   spezielle Form der Adresse wie ::ffff:10.1.1.1 benutzt wird.

.. raw:: html

   </div>

Aber die Spezifikation ist sehr kompliziert und spezifiziert nicht, wie
der Socket-Layer sich verhalten soll. Darauf Bezug nehmend nennen wir
hier ersteren "h?rende Seite" und letzteren "beginnende Seite".

Man kann einen Wildcard-Bind auf demselben Port bei beiden
Adressfamilien durchf?hren.

Die folgende Tabelle zeigt das Verhalten von FreeBSD 4.x.

.. code:: screen

    H?rende Seite          Beginnende Seite
                    (AF_INET6-Wildcard-      (Verbindung zu ::ffff:10.1.1.1)
                    Socket erreicht IPv4 Verb.)
                    ---                     ---
    FreeBSD 4.x     Konfigurierbar            unterst?tzt
                    Standard: erlaubt

Die folgende Abschnitte zeigen mehr Details und wie man das Verhalten
konfigurieren kann.

Kommentare auf der h?renden Seite:

Es sieht so aus, dass RFC2553 zu wenig zu den Punkten ?ber Wildcard-Bind
erl?utert, speziell zum Punkt ?ber Port-Space, Fehler-Modus und
Beziehung zwischen AF\_INET/INET6 wildcard bind. Es kann mehrere
unterschiedliche Interpretationen zu diesem RFC geben, die sich nach
diesen richten, aber sich unterschiedlich verhalten. Um eine portable
Anwendung zu implementieren, sollte man deshalb nicht ein bestimmtes
Verhalten des Kernels voraussetzen. Der Einsatz von
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
ist der sicherste Weg. Port number space und wildcard bind issues wurden
Mitte Mai 1999 detailliert in der Ipv6imp-Mailing-Liste diskutiert und
es sieht so aus, als ob es keinen konkreten Konsens gab (means, up to
implementers). Vielleicht sollte man die Archive der Mailing-Liste
pr?fen.

Wenn eine Server-Anwendung IPv4- und IPv6-Verbindungen annehmen m?chte,
dann gibt es zwei Alternativen.

Eine benutzt AF\_INET- und AF\_INET6-Socket (man ben?tigt zwei Sockets).
Benutze
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
mit gesetztem AI\_PASSIVE-Bit in ai\_flags,
`socket(2) <http://www.FreeBSD.org/cgi/man.cgi?query=socket&sektion=2>`__
und
`bind(2) <http://www.FreeBSD.org/cgi/man.cgi?query=bind&sektion=2>`__
f?r alle zur?ckgegebenen Adressen. Mit dem ?ffnen mehrerer Sockets kann
man Verbindungen an dem Socket mit der richtigen Adressfamilie annehmen.
IPv4-Verbindungen werden vom AF\_INET-Socket und IPv6-Verbindungen vom
AF\_INET6-Socket angenommen.

Ein anderer Weg ist einen AF\_INET6 wildcard bind-Socket zu verwenden.
Man benutzt
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
mit AI\_PASSIVE in ai\_flags, mit AF\_INET6 in ai\_family, man setzt das
erste Argument hostname auf NULL,
`socket(2) <http://www.FreeBSD.org/cgi/man.cgi?query=socket&sektion=2>`__
und
`bind(2) <http://www.FreeBSD.org/cgi/man.cgi?query=bind&sektion=2>`__
auf die zur?ckgegebene Adresse (es sollte eine unspezifizierte
IPv6-Adresse sein). Man kann IPv4- und IPv6-Paket ?ber diesen Socket
annehmen.

Um nur IPv6-Datenverkehr portabel an AF\_INET6 wildcard gebundenen
Socket zu unterst?tzen, pr?ft man, sobald die Verbindung Zustande
gekommen ist, immer die Peer-Adresse gegen den h?renden
AF\_INET6-Socket. Wenn die Adresse eine IPv4-Mapped-Adresse ist, dann
sollte man die Verbindung zur?ckweisen. Man kann die Bedingung mit dem
IN6\_IS\_ADDR\_V4MAPPED()-Makro pr?fen.

Um diesen Punkt leichter l?sen zu k?nnen, gibt es f?r
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2>`__
die System abh?ngige Option IPV6\_BINDV6ONLY, die wie folgt benutzt
wird.

.. code:: screen

     int on;

        setsockopt(s, IPPROTO_IPV6, IPV6_BINDV6ONLY,
               (char *)&on, sizeof (on)) < 0));

Wenn der Aufruf erfolgreich ist, dann empf?ngt dieser Socket nur
IPv6-Pakete.

Kommentare zur sendenden Seite:

Ratschlag an Anwendungsentwickler: um eine portable IPv6-Anwendung zu
implementieren (die mit verschiedenen IPv6-Kerneln funktioniert), ist
das Folgende der Schl?ssel zum Erfolg wie wir glauben:

.. raw:: html

   <div class="itemizedlist">

-  NIEMALS AF\_INET oder AF\_INET6 hart kodieren.

-  Benutze
   `getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
   und
   `getnameinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnameinfo&sektion=3>`__
   ?berall im System. Benutze niemals gethostby\*(), getaddrby\*(),
   inet\_\*() oder getipnodeby\*() (Um bestehende Applikationen leicht
   IPv6 f?hig zu machen, wird getipnodeby\*() manchmal n?tzlich sein.
   Falss es aber m?glich sein sollte, versuche den Kode neu zu schreiben
   und
   `getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
   und
   `getnameinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getnameinfo&sektion=3>`__
   zu benutzen)

-  Wenn man sich an ein Ziel verbinden m?chte, benutze
   `getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
   und versuche alle zur?ckgegebenen Ziele, wie
   `telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__
   es macht.

-  Einige IPv6-Stacks sind mit fehlerhafter
   `getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
   verschickt worden. Man verschickt als letzte M?glichkeit eine minimal
   arbeitende Version der Anwendung.

.. raw:: html

   </div>

Wenn man einen AF\_INET6-Socket f?r jeweils eine ausgehende IPv4- und
IPv6-Verbingung benutzen m?chte, dann muss man
`getipnodebyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getipnodebyname&sektion=3>`__
benutzen. Wenn man seine existierende Anwendung mit wenig Aufwand
IPv6-f?hig machen m?chte, dann sollte dieser Versuch gew?hlt werden.
Aber beachte bitte, dass dies eine tempor?re L?sung ist, weil
`getipnodebyname(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getipnodebyname&sektion=3>`__
selber noch zu empfehlen ist, da es noch keine Adressbereiche
verarbeitet. F?r eine IPv6-NAmensaufl?sung ist
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
das bevorzugte API. Deshalb sollte man seine Anwendung so umschreiben,
dass
`getaddrinfo(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getaddrinfo&sektion=3>`__
benutzt wird, wann man Zeit dazu hat.

Wenn man Anwendungen schreibt, die ausgehende Verbindungen herstellen,
wird die Geschichte viel einfacher, wenn man AF\_INET und AF\_INET6 als
total getrennte Adressfamilien behandelt. {set,get}sockopt funktioniert
viel einfacher, DNS-Angelegenheiten werden einfacher gemacht. Wir
empfehlen sich nicht auf IPv4-Mapped-Adressen zu verlassen.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.1.12.1. Einheitlicher TCP-und INPCB-Kode
''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD 4.x benutzt shared TCP-Kode zwischen IPv4 und IPv6 (von
sys/netinet/tcp\*) und separaten udp4/6-Kode. Es benutzt eine
vereinheitlichte inpcb-Struktur.

Die Plattform kann f?r eine Unterst?tzung von IPv4-mapped-Adressen
konfiguriert werden. Die Kernel-Konfiguration l??t sich wie folgt
zusammenfassen:

.. raw:: html

   <div class="itemizedlist">

-  By default, AF\_INET6 socket will grab IPv4 connections in certain
   condition, and can initiate connection to IPv4 destination embedded
   in IPv4 mapped IPv6 address.

-  Man kann es wie unten beschrieben abschalten.

   ``sysctl         net.inet6.ip6.mapped_addr=0``

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

8.1.1.12.1.1. H?rende Seite
                           

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jeder Socket kann f?r eine Unterst?tzung eines speziellen AF\_INET6
wildcard bind (Standardm??ig eingeschaltet) konfiguriert werden. Man
kann es auf Socket-Basis mit
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2>`__
wie unten beschrieben abschalten.

.. code:: screen

       int on;

        setsockopt(s, IPPROTO_IPV6, IPV6_BINDV6ONLY,
               (char *)&on, sizeof (on)) < 0));

Wildcard-AF\_INET6-Socket schnappt sich die IPv4-Verbindung, wenn, und
nur wenn folgende Bedingungen erf?llt sind::

.. raw:: html

   <div class="itemizedlist">

-  Es gibt keinen AF\_INET-Socket, der zu einer IPv4-Verbindung passt

-  Der AF\_INET6-Socket ist so konfiguriert, dass er IPv4-Datenverkehr
   akzeptiert, z.B. gibt getsockopt(IPV6\_BINDV6ONLY) 0 zur?ck.

.. raw:: html

   </div>

Es gibt kein Problem mit der ?ffnen/Schlie?en-Reihenfolge.

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

8.1.1.12.1.2. initiating side
                             

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD 4.x unterst?tzt ausgehende Verbindungen zu IPv4 mapped Adressen
(::ffff:10.1.1.1), falls der Knoten so konfiguriert ist, dass er IPv4
mapped Adressen unterst?tzt.

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

8.1.1.13. sockaddr\_storage
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als RFC2553 kurz vor der Vollendung stand, gab es eine Diskussion, wie
struct sockaddr\_storage Mitglieder benannt werden sollten. Ein
Vorschlag war "\_\_" den Mitgliedern (wie "\_\_ss\_len") voranzustellen
und es sollten sie nicht ver?ndert werden. Der andere Vorschlag war,
nichts voranzustellen (wie "ss\_len") also mu?ten wir solche Mitglieder
direkt ver?ndern. Es gab keinen klaren Konsens.

Als Ergebnis definiert RFC2553 die Struktur sockaddr\_storage wie folgt:

.. code:: screen

       struct sockaddr_storage {
            u_char  __ss_len;   /* address length */
            u_char  __ss_family;    /* address family */
            /* and bunch of padding */
        };

Im Gegensatz dazu definiert der XNET-Entwurf die Struktur wie folgt:

.. code:: screen

       struct sockaddr_storage {
            u_char  ss_len;     /* address length */
            u_char  ss_family;  /* address family */
            /* and bunch of padding */
        };

Im Dezember 1999 kam man ?berein, dass RFC2553bis letztere Definition
(XNET) aufnehmen sollte.

Die aktuelle Implementierung ist konform zur XNET-Definition basierend
auf der RFC2553bis Diskussion.

Wenn man mehrere IPv6-Implementierungen betrachtet, wird man beide
Definitionen sehen. F?r Userland-Programmierer ist der folgende Weg der
meist portable um damit umzugehen:

.. raw:: html

   <div class="orderedlist">

#. Man versichert sich, dass ss\_family und/oder ss\_len f?r die
   Plattform verf?gbar sind, indem man GNU autoconf verwendet,

#. Man benutzet -Dss\_family=\_\_ss\_family um alle Vorkommen
   (einschlie?lich der Header-Files) zu \_\_ss\_family zu
   vereinheitlichen, oder

#. Man benutzt niemals \_\_ss\_family. Man f?hre einen Typecast nach
   sockaddr \* durch und verwendet sa\_family wie folgt:

   .. code:: screen

         struct sockaddr_storage ss;
           family = ((struct sockaddr *)&ss)->sa_family

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

8.1.2. Netzwerktreiber
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die beiden folgenden Dinge m?ssen zwingend von Standardtreibern
unterst?tzt werden:

.. raw:: html

   <div class="orderedlist">

#. Mbuf-Clustering-Erfordernis. In diesem stabilen Release haben wir f?r
   alle Betriebssystem MINCLSIZE in MHLEN+1 ge?ndert, damit sich alle
   Treiber wie erwartet verhalten.

#. Multicast. Falls
   `ifmcstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifmcstat&sektion=8>`__
   keine Multicast-Gruppe f?r die Schnittstelle liefert, dann muss diese
   Schnittstelle ?berarbeitet werden.

.. raw:: html

   </div>

Falls keiner der Treiber die Erfordernisse erf?llt, dann k?nnen die
Treiber nicht f?r IPv6/IPSec-Kommunikation verwendet werden. Falls man
ein Problem beim Einsatz von IPv6/IPSec mit seiner Karte hat, dann melde
es bitte bei `FreeBSD problem
reports <http://lists.FreeBSD.org/mailman/listinfo/freebsd-bugs>`__.

(Beachte: In der Vergangenheit haben wir gefordert, dass alle
PCMCIA-Treiber einen Aufruf nach in6\_ifattach() haben. Inzwischen haben
wir keine solche Forderung mehr)

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

8.1.3. Translator
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wir kategorisieren einen IPv4/IPv6-Translator in 4 Typen:

.. raw:: html

   <div class="itemizedlist">

-  *Translator A* --- Er wird im fr?hen Stadium des ?bergangs benutzt um
   es zu erm?glichen, dass eine Verbindung von einem IPv6-Host auf einer
   IPv6-Insel zu einem IPv4-Host im IPv4-Ozean hergestellt wird.

-  *Translator B* --- Er wird im fr?hen Stadium des ?bergangs benutzt um
   es zu erm?glichen, dass eine Verbindung von einem IPv4-Host im
   IPv4-Ozean zu einem IPv6-Host auf einer IPv6-Insel hergestellt wird.

-  *Translator C* --- Er wird im fr?hen Stadium des ?bergangs benutzt um
   es zu erm?glichen, dass eine Verbindung von einem IPv4-Host auf einer
   IPv4-Insel zu einem IPv6-Host im IPv6-Ozean hergestellt wird.

-  *Translator D* --- Er wird im fr?hen Stadium des ?bergangs benutzt um
   es zu erm?glichen, dass eine Verbindung von einem IPv6-Host im
   IPv6-Ozean zu einem IPv4-Host auf einer IPv4-Insel hergestellt wird.

.. raw:: html

   </div>

Ein TCP-Relay-Translator der Kategorie A wird unterst?tzt. Er wird
"FAITH" genannt. Wir stellen ebenso einen IP-Header-Translator der
Kataegorie A zur Verf?gung (Letzterer ist noch nicht in FreeBSD 4.x
?bernommen).

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.3.1. FAITH TCP-Relay-Translator
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das FAITH-System benutzt mit Hilfe des Kernels den
`faithd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=faithd&sektion=8>`__
genannten TCP-Relay-Daemon. FAITH wird einen IPv6-Adress-Pr?fix
reservieren und eine TCP-Verbindungen an diesen Pr?fix zum IPv4-Ziel
weiterleiten.

Wenn beispielsweise der IPv6-Pr?fix 2001:0DB8:0200:ffff:: ist und das
IPv6-Ziel f?r TCP-Verbindungen 2001:0DB8:0200:ffff::163.221.202.12 ist,
dann wird die Verbindung an das IPv4-Ziel 163.221.202.12 weitergeleitet.

.. code:: screen

       IPv4-Ziel-Knoten (163.221.202.12)
          ^
          | IPv4 tcp toward 163.221.202.12
        FAITH-relay dual stack node
          ^
          | IPv6 TCP toward 2001:0DB8:0200:ffff::163.221.202.12
        source IPv6 node

`faithd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=faithd&sektion=8>`__
muss auf FAITH-relay dual stack node aufgerufen werden.

F?r weitere Details siehe ``src/usr.sbin/faithd/README``

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

8.1.4. IPsec
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPsec besteht haupts?chlich aus drei Komponenten.

.. raw:: html

   <div class="orderedlist">

#. Policy Management

#. Key Management

#. AH und ESP Behandlung

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

8.1.4.1. Regel Management
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Kernel ist experimenteller Kode f?r Regel-Management implementiert.
Es gibt zwei Wege eine Sicherheitsregel zu handhaben. Einer ist eine
Regel f?r jeden Socket mithilfe von
`setsockopt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setsockopt&sektion=2>`__
zu konfigurieren. F?r diesen Fall ist die Konfiguration der Regel in
`ipsec\_set\_policy(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec_set_policy&sektion=3>`__
beschrieben. Der andere Weg ist eine auf einem Kernel-Packet-Filter
basierende Regel mithilfe der PF\_KEY-Schnittstelle mittels
`setkey(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setkey&sektion=8>`__
zu konfigurieren.

Der Regeleintrag mit seinen Indices wird nicht sortiert, so dass es sehr
wichtig ist, wann ein Eintrag hinzugef?gt wird.

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

8.1.4.2. Key Management
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der in dieser Bibliothek (sys/netkey) implementierte Kode f?r das key
management ist eine Eigenentwicklung der PFKEYv2-Implementierung. Er ist
konform zu RFC2367.

Die Eigenentwicklung des IKE-Daemons "racoon" ist in der Bibliothek
(kame/kame/racoon) implementiert. Grunds?tzlich muss man racoon als
D?monprozess laufen lassen, dann setzt man eine Regel auf, die Schl?ssel
erwartet (?hnlich wie ``ping -P       'out ipsec esp/transport//use'``).
Der Kernel wird den racoon-D?mon wegen des notwendigen Austauschs der
Schl?ssel kontaktieren.

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

8.1.4.3. AH- und ESP-Handhabung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das IPsec-Modul ist als "hook" in die Standard-IPv4/IPv6-Verarbeitung
implementiert. Sobald ein Paket gesendet wird, pr?ft ip{,6\_output(), ob
eine ESP/AH-Verarbeitung notwendig ist. Es findet eine ?berpr?fung
statt, ob eine passende SPD (Security Policy Database) gefunden wurde.
Wenn ESP/AH ben?tigt wird, dann wird {esp,ah}{4,6}\_output() aufgerufen
und mbuf wird folglich aktualisiert. Wenn ein Paket empfangen wird, dann
wird {esp,ah}4\_input() basierend auf der Protokollnummer aufgerufen,
z.B. (\*inetsw[proto])(). {esp,ah}4\_input() entschl?sselt/pr?ft die
Authentizit?t des Pakets und entfernt den daisy-chained-Header und das
Padding des ESP/AH. Es ist sicherer den ESP/AH-Header beim Empfang zu
entfernen, weil man das empfangene Paket niemals so wie es ist benutzt.

Mit der Verwendung von ESP/AH wird die effektive
TCP4/6-Datensegmentgr??e durch weitere von ESP/AH eingef?gte
Daisy-chained-Headers beeinflu?t. Unser Kode ber?cksichtigt dies.

Grundlegende Crypto-Funktionen sind im Verzeichnis "sys/crypto" zu
finden. ESP/AH-Umformungen sind zusammen mit den Wrapper-Funktionen in
{esp,ah}\_core.c gelistet. Wenn man einige Algorithmen hinzuf?gen
m?chte, dann f?gt man in {esp,ah}\_core.c eine Wrapper-Funktion hinzu
und tr?gt seinen Crypto-Algorithmus in sys/crypto ein.

Der Tunnel-Modus wird in diesem Release teilweise mit den folgenden
Restriktionen unterst?tzt:

.. raw:: html

   <div class="itemizedlist">

-  Der IPsec-Tunnel ist nicht mit der generischen Tunnelschnittstelle
   kombiniert. Man muss sehr vorsichtig sein, weil man sonst eine
   Endlosschleife zwischen ip\_output() und tunnelifp->if\_output()
   aufbaut. Die Meinungen gehen auseinander, ob es besser ist dies zu
   vereinheitlichen, oder nicht.

-  Die Betrachtung von MTU und des "Don't Fragment"-Bits (IPv4) m?ssen
   mehr gepr?ft werden, aber grunds?tzlichen arbeiten sie gut.

-  Das Authentifizierungsmodel f?r einen AH-Tunnel muss ?berarbeitet
   werden. Man muss eventuell die "policy management engine"
   ?berarbeiten.

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

8.1.4.4. Konformit?t zu RFCs und IDs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der IPsec-Kode im Kernel ist konform (oder versucht konform zu sein) zu
den folgenden Standards:

Die "alte IPsec"-Spezifikation, die in ``rfc182[5-9].txt`` dokumentiert
ist

Die "neue IPsec"-Spezifikation, die ``rfc240[1-6].txt``,
``rfc241[01].txt``, ``rfc2451.txt`` und
``draft-mcdonald-simple-ipsec-api-01.txt`` (Der Entwurf ist erloschen,
aber man kann ihn sich von `ftp://ftp.kame.net/pub/internet
-drafts/ <ftp://ftp.kame.net/pub/internet-drafts/>`__ holen)
dokumentiert ist (Beachte: Die IKE-Spezifikationen ``rfc241[7-9].txt``
sind im Userland als "racoon"-IKE-Daemon implementiert).

Aktuell werden folgende Algorithmen unterst?tzt:

.. raw:: html

   <div class="itemizedlist">

-  altes IPsec-AH

   .. raw:: html

      <div class="itemizedlist">

   -  null crypto Pr?fsumme (Kein Dokument, nur f?r Debug-Zwecke)

   -  keyed MD5 mit 128bit crypto Pr?fsumme (``rfc1828.txt``)

   -  keyed SHA1 mit 128bit crypto Pr?fsumme (kein Document)

   -  HMAC MD5 mit 128bit crypto Pr?fsumme (``rfc2085.txt``)

   -  HMAC SHA1 mit 128bit crypto Pr?fsumme (kein Dokument)

   .. raw:: html

      </div>

-  altes IPsec-ESP

   .. raw:: html

      <div class="itemizedlist">

   -  null encryption (kein Dokument, ?hnlich zu ``rfc2410.txt``)

   -  DES-CBC-Modus (``rfc1829.txt``)

   .. raw:: html

      </div>

-  neues IPsec-AH

   .. raw:: html

      <div class="itemizedlist">

   -  null crypto Pr?fsumme (kein Dokument, nur f?r Debug-Zwecke)

   -  keyed MD5 mit 96bit crypto Pr?fsumme (kein Dokument)

   -  keyed SHA1 mit 96bit crypto Pr?fsumme (kein Dokument)

   -  HMAC MD5 mit 96bit crypto Pr?fsumme (``rfc2403.txt``)

   -  HMAC SHA1 mit 96bit crypto Pr?fsumme (``rfc2404.txt``)

   .. raw:: html

      </div>

-  neues IPsec-ESP

   .. raw:: html

      <div class="itemizedlist">

   -  null encryption (``rfc2410.txt``)

   -  DES-CBC mit abgeleiteter IV
      (``draft-ietf-ipsec-ciph-des-derived-01.txt``, Entwurf abgelaufen)

   -  DES-CBC mit expliziter IV (``rfc2405.txt``)

   -  3DES-CBC mit expliziter IV (``rfc2451.txt``)

   -  BLOWFISH CBC (``rfc2451.txt``)

   -  CAST128 CBC (``rfc2451.txt``)

   -  RC5 CBC (``rfc2451.txt``)

   -  Jeder Algorithmus kann kombiniert werden mit:

      .. raw:: html

         <div class="itemizedlist">

      -  ESP-Beglaubigung mit HMAC-MD5(96bit)

      -  ESP-Beglaubigung mit HMAC-SHA1(96bit)

      .. raw:: html

         </div>

   .. raw:: html

      </div>

.. raw:: html

   </div>

Die folgenden Algorithmen werden NICHT unterst?tzt:

.. raw:: html

   <div class="itemizedlist">

-  altes IPsec-AH

   .. raw:: html

      <div class="itemizedlist">

   -  HMAC MD5 mit 128bit crypto Pr?fsumme + 64bit replay prevention
      (``rfc2085.txt``)

   -  keyed SHA1 mit 160bit crypto Pr?fsumme + 32bit padding
      (``rfc1852.txt``)

   .. raw:: html

      </div>

.. raw:: html

   </div>

IPsec (im Kernel) und IKE (im Userland als "racoon") wurden bei
unterschiedlichen Interoperabilit?tstests gepr?ft und es ist bekannt,
dass es mit vielen anderen Implementierungen gut zusammenarbeitet.
Au?erdem wurde die IPsec-Implementierung sowie die breite Abdeckung mit
IPsec-Crypto-Algorithmen, die in den RFCs dokumentiert sind, gepr?ft (es
werden nur Algorithmen ohne intellektuelle Besitzanspr?che behandelt).

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

8.1.4.5. ECN-Betrachtung von IPsec-Tunneln
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ECN-freundliche IPsec-Tunnel werden unterst?tzt wie es in
``draft-ipsec-ecn-00.txt`` beschrieben ist.

Normale IPsec-Tunnel sind in RFC2401 beschrieben. F?r eine Kapselung
wird das IPv4-TOS-Feld (oder das IPv6-Traffic-Class-Feld) vom inneren in
den ?u?eren IP-Header kopiert. F?r eine Entkapselung wird der ?ssere
IP-Header einfach verworfen. Die Entkapselungsregel ist nicht mit ECN
kompatibel, sobald das ECN-Bit im ?u?eren IP-TOS/Traffic-Class-Feld
verloren geht.

Um einen IPsec-Tunnel ECN-freundlich zu machen, sollte man die
Kapselungs- und Entkapselungsprozeduren modifizieren. Dies ist in
http://www.aciri.org/floyd/papers/draft-ipsec-ecn-00.txt, Kapitel 3,
beschrieben.

Die IPsec-Tunnel-Implementierung kann drei Zust?nde annehmen, indem man
net.inet.ipsec.ecn (oder net.inet6.ipsec6.ecn) auf diese Werte setzt:

.. raw:: html

   <div class="itemizedlist">

-  RFC2401: Keine Betrachtung von ECN (Sysctl-Wert -1)

-  ECN verboten (Sysctl-Wert 0)

-  ECN erlaubt (Sysctl-Wert 1)

.. raw:: html

   </div>

Beachte, dass dieses Verhalten per-node konfigurierbar ist und nicht
per-SA (draft-ipsec-ecn-00 m?chte per-SA Konfiguration).

Das Verhalten ist wie folgt zusammengefa?t (man beachte auch den
Quelltext f?r weitere Details):

.. code:: screen

                    encapsulate                     decapsulate
                    ---                             ---
    RFC2401         kopiere alle TOS-Bits               l?sche TOS-Bits im ?u?eren
                    von innen nach au?en.            (benutze innere TOS-Bits so wie sie sind)

    ECN verboten   kopiere TOS-Bits au?er f?r ECN    l?sche TOS-Bits im ?u?eren
                    (maskiert mit 0xfc) von innen   (benutze innere TOS-Bits so wie sie sind)
                    nach au?en.  Setze ECN-Bits auf 0.

    ECN erlaubt     kopiere TOS-Bits au?er f?r ECN    benutze innere TOS-Bits mit einigen ?nderungen.
                    CE (maskiert mit 0xfe) von      Wenn das ?u?ere ECN-CE-Bit 1 ist,
                    innen nach au?en.                 setze das ECN-CE-Bit im
                    Setze ECN-CE-Bit auf 0.            Inneren.

Allgemeine Strategie zur Konfiguration:

.. raw:: html

   <div class="itemizedlist">

-  Wenn beide IPsec-Tunnel-Endpunkte ein ECN-freundliches Verhalten
   beherrschen, dann sollte man besser beide Endpunkte auf „ECN allowed“
   (Sysctl-Wert 1) setzen.

-  Wenn das andere Ende das TOS-Bit sehr strikt handhabt, dann benutzt
   man "RFC2401" (Sysctl-Wert -1).

-  in den anderen F?llen benutzt man "ECN verboten" (Sysctl-Wert 0).

.. raw:: html

   </div>

Der Standard ist "ECN verboten" (Sysctl-Wert 0).

F?r weitere Informationen siehe auch:

http://www.aciri.org/floyd/papers/draft-ipsec-ecn-00.txt, RFC2481
(Explicit Congestion Notification), src/sys/netinet6/{ah,esp}\_input.c

(Dank geb?hrt Kenjiro Cho ``<kjc@csl.sony.co.jp>`` f?r seine detailliert
Analyse)

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

8.1.4.6. Interoperabilit?t
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hier sind einige Plattformen angegeben, die in der Vergangenheit die
IPsec/IKE-Interoperabilit?t mit dem KAME-Kode getestet haben. Beachte,
dass beide Enden vielleicht ihre Implementierung ver?ndert haben,
deshalb sollte man folgende Liste nur f?r Referenzzwecke benutzen.

Altiga, Ashley-laurent (vpcom.com), Data Fellows (F-Secure), Ericsson
ACC, FreeS/WAN, HITACHI, IBM AIX?, IIJ, Intel, Microsoft? Windows?NT?,
NIST (linux IPsec + plutoplus), Netscreen, OpenBSD, RedCreek,
Routerware, SSH, Secure Computing, Soliton, Toshiba, VPNet, Yamaha
RT100i

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

+------------------------------+-------------------------------+-------------------------------+
| `Zur?ck <sockets.html>`__?   | `Nach oben <ipc.html>`__      | ?\ `Weiter <kernel.html>`__   |
+------------------------------+-------------------------------+-------------------------------+
| Kapitel 7. Sockets?          | `Zum Anfang <index.html>`__   | ?Teil?III.?Kernel             |
+------------------------------+-------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
