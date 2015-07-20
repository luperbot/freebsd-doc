====================================================
33.9. ISDN – dienstintegrierendes digitales Netzwerk
====================================================

.. raw:: html

   <div class="navheader">

33.9. ISDN – dienstintegrierendes digitales Netzwerk
`Zur?ck <network-diskless.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <network-ipv6.html>`__

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

33.9. ISDN – dienstintegrierendes digitales Netzwerk
----------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine gute Quelle f?r Informationen zu ISDN ist die
`ISDN-Seite <http://www.alumni.caltech.edu/~dank/isdn/>`__ von Dan
Kegel.

Welche Informationen finden Sie in diesem Abschnitt?

.. raw:: html

   <div class="itemizedlist">

-  Wenn Sie in Europa leben, k?nnte der Abschnitt ?ber ISDN-Karten f?r
   Sie interessant sein.

-  Wenn Sie ISDN haupts?chlich dazu verwenden wollen, um sich ?ber einen
   Anbieter ins Internet einzuw?hlen, sollten Sie den Abschnitt ?ber
   Terminaladapter lesen. Dies ist die flexibelste Methode, die auch die
   wenigsten Probleme verursacht.

-  Wenn Sie zwei Netzwerke miteinander verbinden, oder sich ?ber eine
   ISDN-Standleitung mit dem Internet verbinden wollen, finden Sie
   entsprechende Informationen im Abschnitt ?ber Router und Bridges.

.. raw:: html

   </div>

Bei der Wahl der gew?nschten L?sung sind die entstehenden Kosten ein
entscheidender Faktor. Die folgenden Beschreibungen reichen von der
billigsten bis zur teuersten Variante.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.9.1. ISDN-Karten
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Hellmuth Michaelis.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ISDN-Subsystem von FreeBSD unterst?tzt den DSS1/Q.931- (oder
Euro-ISDN)-Standard nur f?r passive Karten. Zus?tzlich werden aber auch
einige aktive Karten unterst?tzt, bei denen die Firmware auch andere
Signalprotokolle unterst?tzt; dies schlie?t auch die erste ISDN-Karte
mit Prim?rmultiplex-Unterst?tzung mit ein.

isdn4bsd erm?glicht es Ihnen, sich unter Nutzung von *IP over raw HDLC*
oder *synchronem PPP* mit anderen ISDN-Routern zu verbinden. Dazu
verwenden Sie entweder
Kernel-\ `ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
(via ``isppp``, einem modifizierten sppp-Treiber), oder Sie benutzen
User-\ `ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__.
Wenn Sie
User-\ `ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
verwenden, k?nnen Sie zwei oder mehrere ISDN-B-Kan?le b?ndeln. Im Paket
enthalten ist auch ein Programm mit Anrufbeantworterfunktion sowie
verschiedene Werkzeuge, wie ein Softwaremodem, das 300?Baud unterst?tzt.

FreeBSD unterst?tzt eine st?ndig wachsende Anzahl von PC-ISDN-Karten,
die weltweit erfolgreich eingesetzt werden.

Von FreeBSD unterst?tzte passive ISDN-Karten enthalten fast immer den
ISAC/HSCX/IPAC ISDN-Chipsatz von Infineon (ehemals Siemens). Unterst?tzt
werden aber auch Karten mit Cologne Chip (diese allerdings nur f?r den
ISA-Bus), PCI-Karten mit Winbond W6692 Chipsatz, einige Karten mit dem
Tiger 300/320/ISAC Chipsatz sowie einige Karten mit einem
herstellerspezifischen Chipsatz, wie beispielsweise die Fritz!Card PCI
V.1.0 und die Fritz!Card PnP von AVM.

An aktiven ISDN-Karten werden derzeit die AVM B1 BRI-Karten (ISA und
PCI-Version) sowie die AVM T1 PRI-Karten (PCI-Version) unterst?tzt.

Informationen zu isdn4bsd finden Sie auf der
`Internetseite <http://www.freebsd-support.de/i4b/>`__ von isdn4bsd.
Dort finden Sie auch Verweise zu Tipps, Korrekturen, sowie weiteren
Informationen, wie dem
`isdn4bsd-Handbuch <http://people.FreeBSD.org/~hm/>`__.

Falls Sie an der Unterst?tzung eines zus?tzlichen ISDN-Protokolls, einer
weiteren ISDN-Karte oder an einer anderen Erweiterung von isdn4bsd
interessiert sind, wenden Sie sich bitte an Hellmuth Michaelis.

F?r Fragen zur Installation, Konfiguration und zu sonstigen Problemen
von isdn4bsd gibt es die Mailingliste
`freebsd-isdn <http://lists.FreeBSD.org/mailman/listinfo/freebsd-isdn>`__.

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

33.9.2. ISDN-Terminaladapter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Terminaladapter (TA) sind f?r ISDN, was Modems f?r analoge
Telefonleitungen sind.

Die meisten Terminaladapter verwenden den Standardbefehlssatz f?r Modems
von Hayes (AT-Kommandos) und k?nnen daher als Modemersatz verwendet
werden.

Ein Terminaladapter funktioniert prinzipiell wie ein Modem, allerdings
erfolgt der Verbindungsaufbau um einiges schneller. Die Konfiguration
von `PPP <ppp.html>`__ entspricht dabei exakt der eines Modems. Stellen
Sie dabei allerdings die serielle Geschwindigkeit so hoch wie m?glich
ein.

Der Hauptvorteil bei der Verwendung eines Terminaladapters zur
Verbindung mit einem Internetanbieter ist die M?glichkeit zur Nutzung
von dynamischem PPP. Da IP-Adressen immer knapper werden, vergeben die
meisten Provider keine statischen IP-Adressen mehr. Die meisten Router
unterst?tzen allerdings keine dynamische Zuweisung von IP-Adressen.

Der PPP-Daemon bestimmt die Stabilit?t und Eigenschaften der Verbindung,
wenn Sie einen Terminaladapter verwenden. Daher k?nnen Sie unter FreeBSD
einfach von einer Modemverbindung auf eine ISDN-Verbindung wechseln,
wenn Sie PPP bereits konfiguriert haben. Allerdings bedeutet dies auch,
das bereits bestehende Probleme mit PPP auch unter ISDN auftreten
werden.

Wenn Sie an maximaler Stabilit?t interessiert sind, verwenden Sie
Kernel-\ `PPP <ppp.html>`__, und nicht das `User-PPP <userppp.html>`__.

Folgende Terminaladapter werden von FreeBSD unterst?tzt:

.. raw:: html

   <div class="itemizedlist">

-  Motorola BitSurfer und Bitsurfer Pro

-  Adtran

.. raw:: html

   </div>

Die meisten anderen Terminaladapter werden wahrscheinlich ebenfalls
funktionieren, da die Hersteller von Terminaladaptern darauf achten,
dass ihre Produkte den Standardbefehlssatz m?glichst gut unterst?tzen.

Das wirkliche Problem mit einem externen Terminaladapter ist, dass,
?hnlich wie bei Modems, eine gute serielle Karte eine Grundvoraussetzung
ist.

Sie sollten sich die `Anleitung f?r die Nutzung serieller Ger?te unter
FreeBSD <../../../../doc/en_US.ISO8859-1/articles/serial-uart/index.html>`__
ansehen, wenn Sie detaillierte Informationen ?ber serielle Ger?te und
die Unterschiede zwischen asynchronen und synchronen seriellen Ports
ben?tigen.

Ein Terminaladapter, der an einem (asynchronen) seriellen Standardport
angeschlossen ist, beschr?nkt Sie auf 115,2?Kbs. Dies selbst dann, wenn
Sie eine Verbindung mit 128?Kbs haben. Um die volle Leistungsf?higkeit
von ISDN (128?Kbs) nutzen zu k?nnen, m?ssen Sie den Terminaladapter
daher an eine synchrone serielle Karte anschlie?en.

Kaufen Sie keinen internen Terminaladapter in der Hoffnung, damit das
synchron/asynchron-Problem vermeiden zu k?nnen. Interne Terminaladapter
haben einen (asynchronen) seriellen Standardportchip eingebaut. Der
einzige Vorteil interner Terminaladapter ist es, dass Sie ein serielles
sowie ein Stromkabel weniger ben?tigen.

Eine synchrone Karte mit einem Terminaladapter ist mindestens so schnell
wie ein autonomer ISDN-Router, und, in Kombination mit einem einfachen
386-FreeBSD-System, wahrscheinlich flexibler.

Die Entscheidung zwischen synchroner Karte/Terminaladapter und einem
autonomen ISDN-Router ist beinahe eine religi?se Angelegenheit. Zu
diesem Thema gibt es viele Diskussionen in den Mailinglisten. Suchen Sie
in den `Archiven <../../../../search/index.html>`__ danach, wenn Sie an
der kompletten Diskussion interessiert sind.

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

33.9.3. ISDN-Bridges und Router
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ISDN-Bridges und Router sind keine Eigenheit von FreeBSD oder eines
anderen Betriebssystems. F?r eine vollst?ndigere Beschreibung von
Routing und Netzwerkkopplungen mit einer Bridge informieren Sie sich
bitte durch weiterf?hrende Literatur.

In diesem Abschnitt werden die Begriffe Router und Bridge synonym
verwendet.

ISDN-Router und Bridges werden immer g?nstiger und damit auch immer
beliebter. Ein ISDN-Router ist eine kleine Box, die direkt an Ihr
lokales Ethernet-Netzwerk angeschlossen wird und sich mit einem Router
oder einer Bridge verbindet. Die eingebaute Software erm?glicht die
Kommunikation ?ber PPP oder andere beliebte Protokolle.

Ein Router erm?glicht einen deutlich h?heren Datendurchsatz als ein
herk?mmlicher Terminaladapter, da er eine vollsynchrone ISDN-Verbindung
nutzt.

Das Hauptproblem mit ISDN-Routern und Bridges ist, dass die
Zusammenarbeit zwischen Ger?ten verschiedener Hersteller nach wie vor
ein Problem ist. Wenn Sie sich auf diese Weise mit einem
Internetanbieter verbinden wollen, kl?ren Sie daher vorher ab, welche
Anforderungen Ihre Ger?te erf?llen m?ssen.

Eine ISDN-Bridge ist eine einfache und wartungsarme L?sung, zwei Netze,
beispielsweise Ihr privates Netz und Ihr Firmennetz, miteinander zu
verbinden. Da Sie die technische Ausstattung f?r beide Seiten kaufen
m?ssen, ist sichergestellt, dass die Verbindung funktionieren wird.

Um beispielsweise einen privaten Computer oder eine Zweigstelle mit dem
Hauptnetzwerk zu verbinden, k?nnte folgende Konfiguration verwendet
werden:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 33.4. Kleines Netzwerk (Privatnetz)

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Das Netzwerk basiert auf der Bustopologie mit 10base2 Ethernet
(„Thinnet“). Falls n?tig, stellen Sie die Verbindung zwischen Router und
Netzwerkkabel mit einem AUI/10BT-Transceiver her.

.. raw:: html

   <div class="mediaobject">

|10Base2 - Ethernet|

.. raw:: html

   </div>

Wenn Sie nur einen einzelnen Rechner verbinden wollen, k?nnen Sie auch
ein Twisted-Pair-Kabel (Cross-Over) verwenden, das direkt an den Router
angeschlossen wird.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 33.5. Gro?es Netzwerk (Firmennetz)

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Dieses Netzwerk basiert auf der Sterntopologie und 10baseT Ethernet
(„Twisted Pair“).

.. raw:: html

   <div class="mediaobject">

|ISDN Netzwerkdiagramm|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein gro?er Vorteil der meisten Router und Bridges ist es, dass man
*gleichzeitig* zwei *unabh?ngige* PPP-Verbindungen zu zwei verschiedenen
Zielen aufbauen kann. Diese Funktion bieten die meisten Terminaladapter
nicht. Die Ausnahme sind spezielle (meist teure) Modelle, die ?ber zwei
getrennte serielle Ports verf?gen. Verwechseln Sie dies aber nicht mit
Kanalb?ndelung oder MPP.

Dies kann sehr n?tzlich sein, wenn Sie eine ISDN-Standleitung in Ihrem
B?ro haben, die sie aufteilen wollen, ohne eine zus?tzliche ISDN-Leitung
zu installieren. Ein ISDN-Router kann ?ber einen B-Kanal (64?Kbps) eine
dedizierte Verbindung ins Internet aufbauen, und gleichzeitig den
anderen B-Kanal f?r eine separate Datenverbindung nutzen. Der zweite
B-Kanal kann beispielsweise f?r ein- oder ausgehende Verbindungen
verwendet werden. Sie k?nnen ihn aber auch dynamisch mit dem ersten
B-Kanal b?ndeln, um Ihre Bandbreite zu erh?hen.

Eine Ethernet-Bridge kann Daten nicht nur im IP-Protokoll, sondern auch
in beliebigen anderen Protokollen versenden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------------------------+----------------------------------------------+
| `Zur?ck <network-diskless.html>`__?   | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <network-ipv6.html>`__            |
+---------------------------------------+--------------------------------------------+----------------------------------------------+
| 33.8. Plattenloser Betrieb mit PXE?   | `Zum Anfang <index.html>`__                | ?33.10. IPv6 – Internet Protocol Version 6   |
+---------------------------------------+--------------------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |10Base2 - Ethernet| image:: advanced-networking/isdn-bus.png
.. |ISDN Netzwerkdiagramm| image:: advanced-networking/isdn-twisted-pair.png
