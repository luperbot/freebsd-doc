==========================
1.2. Willkommen zu FreeBSD
==========================

.. raw:: html

   <div class="navheader">

1.2. Willkommen zu FreeBSD
`Zur?ck <introduction.html>`__?
Kapitel 1. Einleitung
?\ `Weiter <history.html>`__

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

1.2. Willkommen zu FreeBSD
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD ist ein auf 4.4BSD-Lite basierendes Betriebssystem f?r Intel
(x86 und Itanium?), AMD64 und Sun UltraSPARC? Rechner. An Portierungen
zu anderen Architekturen wird derzeit gearbeitet. Mehr zur Geschichte
von FreeBSD erfahren Sie in `die Geschichte von
FreeBSD <history.html>`__ oder aus den `aktuellen
Release-Informationen <history.html#relnotes>`__. Falls Sie das FreeBSD
Projekt unterst?tzen wollen (z.B. mit Quellcode, Hardware- oder
Geldspenden), lesen Sie den `FreeBSD
unterst?tzen <../../../../doc/de_DE.ISO8859-1/articles/contributing/index.html>`__
Artikel.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.2.1. Was kann FreeBSD?
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD hat zahlreiche bemerkenswerte Eigenschaften. Um nur einige zu
nennen:

.. raw:: html

   <div class="itemizedlist">

-  *Pr?emptives Multitasking* mit dynamischer Priorit?tsanpassung zum
   reibungslosen und ausgeglichenen Teilen der Systemressourcen zwischen
   Anwendungen und Anwendern, selbst unter schwerster Last.

-  *Mehrbenutzerbetrieb* erlaubt es, viele FreeBSD-Anwender gleichzeitig
   am System mit verschiedenen Aufgaben arbeiten zu lassen.
   Beispielsweise k?nnen Ger?te wie Drucker oder Bandlaufwerke, die sich
   nur schwerlich unter allen Anwendern des Systems oder im Netzwerk
   teilen lassen, durch setzen von Beschr?nkungen auf Benutzer oder
   Gruppen wichtige Systemressourcen vor ?berbeanspruchung gesch?tzt
   werden.

-  Starke*TCP/IP-Netzwerkf?higkeit* mit Unterst?tzung von
   Industriestandards wie SCTP, DHCP, NFS, NIS, PPP, SLIP, IPsec und
   IPv6. Das bedeutet, Ihr FreeBSD-System kann in einfachster Weise mit
   anderen Systemen interagieren. Zudem kann es als Server-System im
   Unternehmen wichtige Aufgaben ?bernehmen, beispielsweise als NFS-
   oder E-Mail-Server oder es kann Ihren Betrieb durch HTTP- und
   FTP-Server beziehungsweise durch Routing und Firewalling
   Internetf?hig machen.

-  *Speicherschutz* stellt sicher, dass Anwendungen (oder Anwender) sich
   nicht gegenseitig st?ren. St?rzt eine Anwendung ab, hat das keine
   Auswirkung auf andere Prozesse.

-  Der Industriestandard *X-Window-System* (X11R7) als Industriestandard
   bietet eine grafische Benutzeroberfl?che (GUI). Minimale
   Voraussetzung zur Verwendung ist lediglich eine Grafikkarte und ein
   Bildschirm, die beide den VGA-Modus unterst?tzen.

-   *Bin?rkompatibilit?t* mit vielen auf anderen Betriebssystemen
   erstellten Programmen wie Linux, SCO, SVR4, BSDI und NetBSD.

-  Tausende zus?tzliche *leicht zu portierende* Anwendungen sind ?ber
   die FreeBSD *Ports* und *Paket*-Sammlung verf?gbar. Warum m?hselig im
   Netz nach Software suchen, wenn diese bereits vorhanden ist?

-  Tausende zus?tzliche *leicht zu portierende* Anwendungen sind ?ber
   das Internet zu beziehen. FreeBSD ist Quellcode-kompatibel mit den
   meisten kommerziellen UNIX? Systemen. Daher bed?rfen Anwendungen
   h?ufig nur geringer oder gar keiner Anpassung, um auf einem
   FreeBSD-System zu kompilieren.

-  Seitenweise anforderbarer *virtueller Speicher* und „merged VM/buffer
   cache“ -Entwurf bedient effektiv den gro?en Speicherhunger mancher
   Anwendungen bei gleichzeitigem Aufrechterhalten der Bedienbarkeit des
   Systems f?r weitere Benutzer.

-  *SMP*-Unterst?tzung f?r Systeme mit mehreren CPUs.

-   Ein voller Satz von *C* und *C++* Entwicklungswerkzeugen. Viele
   zus?tzliche Programmiersprachen f?r h?here Wissenschaft und
   Entwicklung sind in der Ports- und Packages-Sammlung verf?gbar.

-  *Quellcode* f?r das gesamte System bedeutet gr??tm?gliche Kontrolle
   ?ber Ihre Umgebung. Warum sollte man sich durch propriet?re L?sungen
   knebeln und sich auf Gedeih und Verderb der Gnade eines Herstellers
   ausliefern, wenn man doch ein wahrhaft offenes System haben kann?

-  Umfangreiche *Online-Dokumentation*.

-  *und viele weitere!*

.. raw:: html

   </div>

FreeBSD basiert auf dem 4.4BSD-Lite-Release der Computer Systems
Research Group (CSRG) der Universit?t vn Kalifornien in Berkeley und
f?hrt die namhafte Tradition der Entwicklung von BSD-Systemen fort.
Zus?tzlich zu der herausragenden Arbeit der CSRG hat das FreeBSD Projekt
tausende weitere Arbeitsstunden investiert, um das System zu verfeinern
und maximale Leistung und Zuverl?ssigkeit bei Alltagslast zu bieten.
W?hrend viele kommerzielle Riesen Probleme damit haben,
PC-Betriebssysteme mit derartigen Funktionen, Leistungspotential und
Zuverl?ssigkeit anzubieten, kann FreeBSD damit schon jetzt aufwarten!

Die Anwendungsm?glichkeiten von FreeBSD werden nur durch Ihre
Vorstellungskraft begrenzt. Von Software-Entwicklung bis zu
Produktionsautomatisierung, von Lagerverwaltung ?ber
Abweichungskorrektur bei Satelliten; Falls etwas mit kommerziellen UNIX?
Produkten machbar ist, dann ist es h?chstwahrscheinlich auch mit FreeBSD
m?glich. FreeBSD profitiert stark von tausenden hochwertigen Anwendungen
aus wissenschaftlichen Instituten und Universit?ten in aller Welt.
H?ufig sind diese f?r wenig Geld oder sogar kostenlos zu bekommen.
Kommerzielle Anwendungen sind ebenso verf?gbar und es werden t?glich
mehr.

Durch den freien Zugang zum Quellcode von FreeBSD ist es in
unvergleichbarer Weise m?glich, das System f?r spezielle Anwendungen
oder Projekte anzupassen. Dies ist mit den meisten kommerziellen
Betriebssystemen einfach nicht m?glich. Beispiele f?r Anwendungen, die
unter FreeBSD laufen, sind:

.. raw:: html

   <div class="itemizedlist">

-  *Internet-Dienste:* Die robuste TCP/IP-Implementierung in FreeBSD
   macht es zu einer idealen Plattform f?r verschiedenste
   Internet-Dienste, wie zum Beispiel:

   .. raw:: html

      <div class="itemizedlist">

   -  HTTP-Server (Standard oder mit SSL-Verschl?sselung)

   -  IPv4- und IPv6-Routing

   -  Firewall NAT („IP-Masquerading“)-Gateways

   -  FTP-Server

   -   E-Mail-Server

   -  Und mehr...

   .. raw:: html

      </div>

-  *Bildung:* Sind Sie Informatikstudent oder Student eines verwandten
   Studiengangs? Die praktischen Einblicke in FreeBSD sind die beste
   M?glichkeit etwas ?ber Betriebssysteme, Rechnerarchitektur und
   Netzwerke zu lernen. Einige frei erh?ltliche CAD-, mathematische und
   grafische Anwendungen sind sehr n?tzlich, gerade f?r diejenigen,
   deren Hauptinteresse in einem Computer darin besteht, *andere* Arbeit
   zu erledigen!

-  *Forschung:* Mit dem frei verf?gbaren Quellcode f?r das gesamte
   System bildet FreeBSD ein exzellentes Studienobjekt in der Disziplin
   der Betriebssysteme, wie auch in anderen Zweigen der Informatik. Es
   ist beispielsweise denkbar, das r?umlich getrennte Gruppen gemeinsam
   an einer Idee oder Entwicklung arbeiten. Das Konzept der freien
   Verf?gbarkeit und -nutzung von FreeBSD erm?glicht so die freie
   Verwendung, ohne sich gross Gedanken ?ber Lizenzbedingungen zu machen
   oder aufgrund von Beschr?nkungen evtl. in einem offenen Forum
   bestimmte Dinge nicht diskutieren zu d?rfen.

-  *Netzwerkf?higkeit:* Brauchen Sie einen neuen Router? Oder einen
   Name-Server (DNS)? Eine Firewall zum Schutze Ihres Intranets vor
   Fremdzugriff? FreeBSD macht aus dem in der Ecke verstaubenden 386-
   oder 486-PC im Handumdrehen einen leistungsf?higen Router mit
   anspruchsvollen Paketfilter-Funktionen.

-  *Embedded:* FreeBSD ist eine exzellente Plattform, um auf embedded
   Systemen aufzubauen. Mit der Unterst?tzung f?r die ARM?-, MIPS?- und
   PowerPC?-Plattformen, verbunden mit dem robusten Netzwerkstack,
   aktuellen Neuerungen und der freiz?gigen
   `BSD-Lizenz <../../../../doc/de_DE.ISO8859-1/books/faq/introduction.html#bsd-license-restrictions>`__
   stellt FreeBSD eine ausgezeichnete Basis f?r embedded Router,
   Firewalls und andere Ger?te dar.

-   *Desktop:* FreeBSD ist eine gute Wahl f?r kosteng?nstige X-Terminals
   mit dem frei verf?gbaren X11-Server. FreeBSD bietet die Auswahl aus
   vielen Open Source Desktop Umgebungen, dazu geh?ren auch die GNOME
   und KDE GUIs. FreeBSD kann sogar „plattenlos“ booten, was einzelne
   Workstations sogar noch g?nstiger macht und die Verwaltung
   erleichtert.

-  *Software-Entwicklung:* Das Standard-FreeBSD-System wird mit einem
   kompletten Satz an Entwicklungswerkzeugen bereitgestellt, unter
   anderem einem vollst?ndigen C/C++-Compiler und -Debugger.
   Entwicklungswerkzeugen. Viele zus?tzliche Programmiersprachen f?r
   Wissenschaft und Entwicklung sind aus der Ports- und
   Packages-Sammlung zu haben.

.. raw:: html

   </div>

FreeBSD ist sowohl in Form von Quellcode als auch in Bin?rform auf
CD-ROM, DVD und ?ber Anonymus FTP erh?ltlich. Lesen Sie dazu `Anhang?A,
*Bezugsquellen f?r FreeBSD* <mirrors.html>`__, um weitere Informationen
zum Bezug von FreeBSD zu erhalten.

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

1.2.2. Wer verwendet FreeBSD?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSDs fortgeschrittene Eigenschaften, bew?hrte Sicherheit und
vorhersehbare Release-Zyklen, genauso wie seine tolerante Lizenz haben
dazu gef?hrt, dass es als Plattform zum Aufbau vieler kommerzieller und
quelloffener Ger?te und Produkte verwendet wird, dazu geh?ren ein paar
der weltgr?ssten IT-Unternehmen:

.. raw:: html

   <div class="itemizedlist">

-  `Apache <http://www.apache.org/>`__ - Die Apache Software Foundation
   l?sst den Grossteil seiner der ?ffentlichkeit zug?nglichen
   Infrastruktur, inklusive des m?glicherweise gr?ssten SVN-Repositories
   der Welt mit ?ber 1,4 Millionen Commits, auf FreeBSD laufen.

-  `Apple <http://www.apple.com/>`__ - OS X verwendet viel von FreeBSDs
   eigenem Netzwerkstack, virtuellem Dateisystem und den
   Benutzerumgebungskomponenten f?r sein eigenes System. Apple iOS nutzt
   ebenso Elemente, die es von FreeBSD ?bernommen hat

-  `Cisco <http://www.cisco.com/>`__ - IronPort Network Sicherheits- und
   Anti-Spam-Appliance verwendet einen modifizierten FreeBSD-Kernel.

-  `Citrix <http://www.citrix.com/>`__ - Die NetScaler Reihe von
   Sicherheits-Appliances bietet auf den Schichten 4-7 Load-Balancing,
   Content Caching, Anwendungsfirewall, gesichertes VPN und mobilen
   Cloud-Netzwerkzugriff, gepaart mit der M?chtigkeit der FreeBSD-Shell.

-  `Dell KACE <http://www.dell.com/KACE>`__ - Die KACE
   Systemmanagement-Appliances nutzen FreeBSD wegen seiner
   Zuverl?ssigkeit, Skalierbarkeit und Gemeinschaft, welche deren
   zuk?nftige Weiterentwicklung f?rdert.

-  `Experts Exchange <http://www.experts-exchange.com/>`__ - Alle
   ?ffentlich zug?nglichen Webserver werden von FreeBSD betrieben und
   machen starken Gebrauch von Jails, ohne den ?berhang von
   Virtualisierung, um Entwicklungs- und Testumgebung voneinander zu
   isolieren.

-  `Isilon <http://www.isilon.com/>`__ - Isilons
   Unternehmens-Speicherappliances basieren auf FreeBSD. Die extrem
   liberale FreeBSD-Lizenz erlaubt Isilon ihr intellektuelles Eigentum
   durch den gesamten Kernel zu integrieren und kann sich so auf das
   Erstellen ihres Produktes und nicht des Betriebssystems fokussieren.

-  `iXsystems <http://www.ixsystems.com/>`__ - Die TrueNAS-Linie von
   vereinheitlichten Speicherappliances beruht auf FreeBSD. Zus?tzlich
   zu deren kommerziellen Produkten, managed iXsystems auch noch die
   beiden Open Source Projekte PC-BSD und FreeNAS.

-  `Juniper <http://www.juniper.net/>`__ - Das JunOS Betriebssystem,
   welches alle Juniper Netzwerkger?te (inklusive Router, Switche,
   Sicherheits- und Netzwerkappliances) antreibt, verwendet FreeBSD
   Juniper ist einer der vielen Hersteller, welcher das symbolische
   Verh?ltnis zwischen dem Projekt und dem Hersteller von kommerziellen
   Produkten darstellt. Verbesserungen, die Juniper entwickelt hat,
   werden ebenso in FreeBSD aufgenommen, um die Komplexit?t der
   Integration neuer Eigenschaften von FreeBSD zur?ck in zuk?nftige
   JunOS Versionen zu vereinfachen.

-  `McAfee <http://www.mcafee.com/>`__ - SecurOS, die Basis von McAfee
   Enterprise-Firewallprodukten inkl. Sidewinder basiert auf FreeBSD.

-  `NetApp <http://www.netapp.com/>`__ - Die Data ONTAP GX Reihe von
   Speicherappliances basieren auf FreeBSD. Zus?tzlich hat NetApp viele
   Neuheiten beigesteuert, inklusive des neuen BSD-lizensierten
   Hypervisors bhyve.

-  `Netflix <http://www.netflix.com/>`__ - Die OpenConnect-Appliance,
   die Netflix verwendet, um Filme zu seinen Kunden zu streamen basiert
   auf FreeBSD. Netflix hat weitreichende Beitr?ge zum Quellcode von
   FreeBSD beigetragen und arbeitet daran, ein m?glichst geringes Delta
   zur normalen Version beizubehalten. Netflix OpenConnect-Appliances
   sind f?r mehr als 32% vom gesamten Internetverkehr in Nordamerika
   verantwortlich.

-  `Sandvine <http://www.sandvine.com/>`__ - Sandvine nutzt FreeBSD as
   die Basis f?r deren Echtzeit Hochgeschwindigkeits-Netzwerkplattform,
   welche den Kern deren intelligenter Netzwerkpolicy-Kontrollprodukte
   darstellt.

-  `Sony <http://www.sony.com/>`__ - Sowohl die PlayStation 3 und
   PlayStation 4 Spielekonsolen verwenden modifizierte Versionen von
   FreeBSD.

-  `Sophos <http://www.sophos.com/>`__ - Das Sophos Email-Appliance
   Produkt basiert auf einem abgesicherten FreeBSD und scannt eingehende
   E-Mail auf Spam und Viren, w?hrend es gleichzeitig ausgehende Mail
   auf Schadsoftware und versehentlichen Versand von vertraulichen
   Informationen ?berwacht.

-  `Spectra Logic <http://www.spectralogic.com/>`__ - Die nTier Reihe
   von archivspeicherf?higen Appliances nutzt FreeBSD und OpenZFS.

-  `The Weather Channel <http://www.weather.com/>`__ - Die IntelliStar
   Appliance, welche am Kopfende eines jeden Kabelversorgers installiert
   ist und f?r das Einspeisen von lokalen Wettervorhersagen in das
   Kabelfernsehprogramm verantwortlich ist, l?uft auf FreeBSD.

-  `Verisign <http://www.verisign.com/>`__ - Verisign ist f?r den
   Betrieb der .com und .net Root-Domainregistries genauso
   verantwortlich wie f?r die dazugeh?rige DNS-Infrastruktur. Sie
   verlassen sich auf einen Reihe von verschiedenen
   Netzwerkbetriebssystemen inklusive FreeBSD, um zu gew?hrleisten, dass
   es keine gemeinsame Fehlerstelle in deren Infrastruktur gibt.

-  `WhatsApp <http://www.whatsapp.com/>`__ - Als WhatsApp eine Plattform
   ben?tigte, die in der Lage ist, mehr als 1 Million gleichzeitiger
   TCP-Verbindungen pro Server abzuarbeiten, entschied man sich f?r
   FreeBSD. Anschliessend fuhren Sie damit fort, auf 2,5 Millionen
   Verbindungen pro Server hochzuskalieren.

-  `Wheel Systems <http://wheelsystems.com/en/>`__ - Die FUDO
   Sicherheitsappliance erlaubt es Unternehmen, Vertragspartner und
   Administratoren, die anderen Systemen arbeiten durchf?hren, zu
   ?berwachen, zu kontrollieren, aufzuzeichnen und zu begutachten. Dies
   basiert auf all den besten Sicherheitseigenschaften von FreeBSD,
   inklusive ZFS, GELI, Capsicum, HAST und auditdistd.

.. raw:: html

   </div>

FreeBSD hat ebenfalls eine Reihe von verwandten Open Source Projekten
hervorgebracht:

.. raw:: html

   <div class="itemizedlist">

-  `BSD Router <http://bsdrp.net/>`__ - Einen FreeBSD-basierten Ersatz
   f?r grosse Unternehmensrouter, der entwickelt wurde, um auf Standard
   PC-Hardware zu laufen.

-  `FreeNAS <http://www.freenas.org/>`__ - Ein eigens daf?r entworfenes
   FreeBSD f?r den Zweck als Netzwerk-Dateiserver Appliance zu
   fungieren. Es enth?lt eine Python-basierte Webschnittstelle, um das
   Management von sowohl UFS- als auch ZFS-Systemen zu vereinfachen.
   Enthalten sind NFS, SMB/CIFS, AFP, FTP und iSCSI. Ebenfalls enthalten
   ist ein erweiterteres Plugin-System basierend auf FreeBSD-Jails.

-  `GhostBSD <http://www.ghostbsd.org/>`__ - Eine auf den
   Desktop-Einsatz orientierte Distribution von FreeBSD, welche mit
   einer Gnome-Desktop-Umgebung ausgeliefert wird.

-  `mfsBSD <http://mfsbsd.vx.sk/>`__ - Eine Sammlung von Werkzeugen zum
   Erstellen von FreeBSD-Systemimages, welches ausschliesslich im
   Hauptspeicher l?uft.

-  `NAS4Free <http://www.nas4free.org/>`__ - Eine
   Dateiserverdistribution basierend auf FreeBSD mit einer von
   PHP-getriebenen Webschnittstelle.

-  `PC-BSD <http://www.pcbsd.org/>`__ - Eine massgeschneiderte Version
   von FreeBSD, die sich an Desktop-Benutzern mit graphischen
   Oberfl?chenwerkzeugen orientiert, um die M?chtigkeit von FreeBSD
   allen Benutzern zur Verf?gung zu stellen. Entwickelt wurde sie mit
   dem Ziel, den ?bergang von Windows- und OS X-Benutzern zu
   erleichtern.

-  `pfSense <http://www.pfsense.org/>`__ - Eine Firewalldistribution
   basierend auf FreeBSD mit eine grossen Menge von F?higkeiten und
   ausgedehnter IPv6-Unterst?tzung.

-  `m0n0wall <http://m0n0.ch/wall/>`__ - Eine abgespeckt Version von
   FreeBSD, die zusammen mit einem Webserver und PHP ausgeliefert wird.
   Entwickelt als eine eingebettete Firewall-Appliance mit einem
   Verbrauch von weniger als 12?MB.

-  `ZRouter <http://zrouter.org/>`__ - Eine Open Source
   Firmware-Alternative f?r eingebettete Ger?te, die auf FreeBSD
   basiert. Entwickelt wurde sie, um die propriet?re Firmware von
   Standard-Routern zu ersetzen.

.. raw:: html

   </div>

FreeBSD wird auch dazu eingesetzt, um einige der gr?ssten Webseiten des
Internets zu betreiben. Dazu geh?ren:

.. raw:: html

   <div class="itemizedlist">

-  `Yahoo! <http://www.yahoo.com/>`__

-  `Yandex <http://www.yandex.ru/>`__

-  `Rambler <http://www.rambler.ru/>`__

-  `Sina <http://www.sina.com/>`__

-  `Pair Networks <http://www.pair.com/>`__

-  `Sony Japan <http://www.sony.co.jp/>`__

-  `Netcraft <http://www.netcraft.com/>`__

-  `Netflix <https://signup.netflix.com/openconnect>`__

-  `NetEase <http://www.163.com/>`__

-  `Weathernews <http://www.weathernews.com/>`__

-  `TELEHOUSE America <http://www.telehouse.com/>`__

.. raw:: html

   </div>

und viele weitere. Wikipedia pflegt eine `Liste von Produkten, die auf
FreeBSD
basieren. <http://en.wikipedia.org/wiki/List_of_products_based_on_FreeBSD>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------------+----------------------------------+
| `Zur?ck <introduction.html>`__?   | `Nach oben <introduction.html>`__   | ?\ `Weiter <history.html>`__     |
+-----------------------------------+-------------------------------------+----------------------------------+
| Kapitel 1. Einleitung?            | `Zum Anfang <index.html>`__         | ?1.3. ?ber das FreeBSD Projekt   |
+-----------------------------------+-------------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
