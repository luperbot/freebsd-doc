======================================
FreeBSD/pc98 5.2-RELEASE Release Notes
======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/pc98 5.2-RELEASE Release Notes
======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 The FreeBSD Documentation Project

Copyright © 2002, 2003 The FreeBSD German Documentation Project

| $FreeBSD$

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Die Release Notes f?r FreeBSD 5.2-RELEASE enthalten eine ?bersicht ?ber
aktuelle ?nderungen in FreeBSD im Entwicklungszweig 5-CURRENT. Dieses
Dokument enth?lt die Liste aller Sicherheitshinweise, die seit der
letzten Version herausgegeben wurden, sowie eine ?bersicht ?ber die
wichtigsten ?nderungen am Kernel und an den Benutzerprogrammen. Einige
kurze Anmerkungen zum Thema Aktualisierung wurden ebenfalls aufgenommen.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="TOC">

**Inhaltsverzeichnis**
1. `Einf?hrung <#INTRO>`__
2. `Neuerungen <#NEW>`__
2.1. `Sicherheit <#SECURITY>`__
2.2. `?nderungen im Kernel <#KERNEL>`__
2.2.1. `Unterst?tzung f?r Plattfrom-spezifische Ger?te <#PROC>`__
2.2.2. `?nderungen im Bootloader <#BOOT>`__
2.2.3. `Netzwerke und Netzwerkkarten <#NET-IF>`__
2.2.4. `Netzwerk-Protokolle <#NET-PROTO>`__
2.2.5. `Festplatten und Massenspeicher <#DISKS>`__
2.2.6. `Dateisystem <#FS>`__
2.2.7. `Multimedia <#MM>`__
2.3. `Benutzerprogramme <#USERLAND>`__
2.4. `Zus?tzliche Software <#CONTRIB>`__
2.5. `Infrastruktur f?r Ports und Packages <#PORTS>`__
2.6. `Erzeugung von Releases und Integration <#RELENG>`__
2.7. `Dokumentation <#DOC>`__
3. `Aktualisierung einer ?lteren Version von FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Release Notes f?r FreeBSD 5.2-RELEASE auf
NEC PC-98x1 Systemen. Es beschreibt die Komponenten von FreeBSD, die in
letzter Zeit hinzugef?gt, ge?ndert, oder gel?scht wurden. Au?erdem
erhalten Sie Hinweise f?r die Aktualisierung Ihres FreeBSD-Systems.

Diese Distribution von FreeBSD 5.2-RELEASE ist eine release
Distribution. Sie k?nnen Sie von ftp://ftp.FreeBSD.org/ und allen seinen
Mirrors erhalten. Weitere Informationen, wie Sie diese (oder andere)
release Distributionen von FreeBSD erhalten k?nnen, finden Sie im Anhang
`\`\`Bezugsquellen f?r
FreeBSD'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/mirrors.html>`__
des `FreeBSD
Handbuchs <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__.

Anwender, die noch keine Erfahrung mit einer 5-CURRENT Version eines
FreeBSD release haben, sollten auf jeden Fall die \`\`Hinweise f?r die
ersten Anwender von FreeBSD 5.2-RELEASE'' lesen. Dieses Dokument sollte
?berall dort verf?gbar sein, wo auch die Release Notes verf?gbar sind;
entweder als Teil einer FreeBSD Distribution oder auf den FreeBSD
Webseiten. Es enth?lt wichtige Informationen ?ber die Vor- und Nachteile
des Betriebs von FreeBSD 5.2-RELEASE im Vergleich zum Betrieb eines
Systems auf der Basis der Entwicklungszweiges 4-STABLE.

Alle Anwender sollten vor der Installation von FreeBSD die Release Notes
lesen. Die Errata enthalten \`\`brandhei?e'' Informationen, die erst
kurz vor oder nach der Ver?ffentlichung bekannt wurden. Dies sind
typischerweise Informationen ?ber bekannte Probleme, Hinweise zum Thema
Sicherheit und Korrekturen der Dokumentation. Die jeweils aktuelle
Version der Errata zu FreeBSD 5.2-RELEASE finden Sie auf den FreeBSD
Webseiten.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Neuerungen
-------------

In diesem Artikel finden Sie viele der f?r den Anwender
offensichtlichsten Neuerungen und ?nderungen in FreeBSD seit
5.1-RELEASE. Dazu geh?ren sowohl die ?nderungen, die nur 5.1-RELEASE
betreffen, als auch ?nderungen in den anderen Entwicklungszweigen seit
FreeBSD 5.1-RELEASE. Letztere sind als [MERGED] gekennzeichnet.

Die Eintr?ge umfassen alle Sicherheitshinweise, die nach dem Erscheinen
von 5.1-RELEASE herausgegeben wurden, neue Treiber bzw. Unterst?tzung
f?r neue Hardware, neue Befehle oder Optionen, die Behebung wichtiger
Fehler, und Aktualisierungen von zus?tzlicher Software. Sie k?nnen
ebenfalls ?nderungen bei den wichtigeren Ports/Packages und bei der
Erzeugung der Releases dokumentieren. Es sollte offensichtlich sein, da?
die Release Notes nicht jede einzelne ?nderung in FreeBSD auff?hren
k?nnen; dieses Dokument konzentriert sich auf Sicherheitshinweise, f?r
den Anwender sichtbare ?nderungen und die wichtigsten Verbesserungen der
Infrastruktur.

.. raw:: html

   <div class="SECT2">

--------------

2.1. Sicherheit
~~~~~~~~~~~~~~~

In
`realpath(3) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=3&manpath=FreeBSD+5.2-RELEASE>`__
wurde ein Fehler behoben, durch den es zu einem Buffer-?berlauf von
einem Byte kommen konnte. Der Fehler wurde schon vor der
Ver?ffentlichung von FreeBSD 5.1-RELEASE behoben, allerdings wurde er
nicht in den Release Notes erw?hnt. Weitere Informationen finden Sie in
`FreeBSD-SA-03:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:08.realpath.asc>`__.
[MERGED]

Durch einen Fehler im Kernel war es m?glich, ihn zur Aussendung
illegaler Signale zu bewegen. Dadurch konnte es zu einer Kernel Panic
und in bestimmten F?llen zur ?nderung des Kernel-Speichers kommen.
Weitere Informationen finden Sie in
`FreeBSD-SA-03:09 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:09.signal.asc>`__.
[MERGED]

In der aktivierten iBCS2 Emulation wurde ein Fehler behoben, durch den
es m?glich war, Einblick in den Kernel-Speicher zu erhalten. Dieses
Modul wird standardm??ig nicht verwendet. Weitere Informationen finden
Sie in
`FreeBSD-SA-03:10 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:10.ibcs2.asc>`__.
[MERGED]

In den Routinen zum Buffer-Management innerhalb von **OpenSSH** wurde
ein Fehler behoben, der zu einem Absturz f?hren kann. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:12 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:12.openssh.asc>`__.
[MERGED]

In **sendmail** wurde ein Buffer-?berlauf beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:13 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:13.sendmail.asc>`__.
[MERGED]

In den Kernel-Routinen f?r den ARP Cache wurde ein Fehler beseitigt, der
zum Verbrauch aller Ressourcen und dadurch zum Komplettabsturz f?hren
konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-03:14 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:14.arp.asc>`__.
[MERGED]

Innerhalb der Routinen f?r PAM challenge/response Authentifizierung von
**OpenSSH** wurden diverse Fehler korrigiert. Details und Informationen
?ber die Auswirkungen der Fehler finden Sie in
`FreeBSD-SA-03:15 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:15.openssh.asc>`__.
[MERGED]

In
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.2-RELEASE>`__
und
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+5.2-RELEASE>`__
wurde ein Fehler beseitigt, durch den man Einblick in den Speicher des
Kernels erhalten konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-03:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:17.procfs.asc>`__.
[MERGED]

In **OpenSSL** wurden vier Fehler beseitigt, durch die ein Angreifer ein
**OpenSSL** nutzendes Programm abst?rzen lassen und/oder beliebige
Programme mit den Rechten einer auf **OpenSSL** aufsetzenden Anwendung
ausf?hren konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-03:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:18.openssl.asc>`__.
[MERGED]

In **BIND** wurde ein Fehler korrigiert, der einen Denial-of-Service
Angriff m?glich machte. Weitere Informationen finden Sie in
`FreeBSD-SA-03:19 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:19.bind.asc>`__.
[MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. ?nderungen im Kernel
~~~~~~~~~~~~~~~~~~~~~~~~~

Eine neue Version der Kernel-Module f?r DRM wurde mit Stand vom 12.
November 2003 aus dem DRI CVS importiert. Neben vielen anderen
?nderungen steht jetzt auch ein angepa?ter Treiber f?r SiS
300/305/540/630/730 zur Verf?gung.

Der neue Treiber
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
stellt lokale und entfernte Consolen zur Verf?gung. Er kann mit
`dcons\_crom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons_crom&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
?ber FireWire angesprochen werden. Anwender k?nnen mit
`dconschat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dconschat&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
auf
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Ger?te zugreifen.

Der Kernel enth?lt jetzt neue Routinen zur Umwandlung von
Multi-Byte-Zeichen, die mit der Kernel-Option LIBICONV aktiviert werden
k?nnen.

Der neue Treiber
`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt symmetrische Verschl?sselung auf Basis der 7955 und 7966
Chips?tze. [MERGED]

Der Treiber
`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
(PCI Universal Communications) unterst?tzt jetzt die Nutzung von
parallelen Schnittstellen in Zusammenarbeit mit dem Treiber
`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__.

Der neue Treiber
`safe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=safe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt Crypto-Beschleuniger mit SafeNet 1141 und 1741 Chipsatz.
[MERGED]

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Der Treiber ist noch im Experimentalstadium und
    sollte nur unter Beachtung der ?blichen Vorsichtsma?nahmen benutzt
    werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Public Keys werden nicht unterst?tzt.

.. raw:: html

   </div>

Der neue Treiber
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt diverse UART (Universal Asynchronous Receiver/Transmitter)
Chips. Er entspricht grob dem
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Treiber, unterst?tzt aber deutlich mehr verschiedene Ger?te. Nur mit
diesem Treiber k?nnen an der seriellen Schnittstelle angeschlossene
Ger?te auf Architekturen wie ia64 und sparc64 unterst?tzt werden.

Der Kernel wurde um eine ?berwachungsfunktion (Watchdog) in Software
erweitert, weitere Informationen finden Sie in
`watchdog(4) <http://www.FreeBSD.org/cgi/man.cgi?query=watchdog&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`watchdogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=watchdogd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__.

Die Routinen f?r den swap pager wurden ?berarbeitet. Die wichtigsten der
f?r den Anwender sichtbaren ?nderungen sind der neue Algoritmus f?r die
Belegung (abwechselnde Nutzung der verschiedenen Ger?te statt der bisher
verwendeten festen Bereiche) und der daraus resultierende h?here
Durchsatz; beliebig viele Ger?te ohne Neukompilierung und ein geringerer
Speicherverbrauch.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1. Unterst?tzung f?r Plattfrom-spezifische Ger?te
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die i386-spezifischen Routinen wurden massiv ?berarbeitet, um die
Zuweisung und Verarbeitung von Interrupts und die SMP-Unterst?tzung zu
verbessern.

Die Flie?komma-Emulation wurde aus dem Kernel entfernt.

Die Probleme mit einigen Pentium 4 und einigen ?lteren Pentium Pro und
Pentium II CPUs wurden gel?st. Die Probleme f?hrten in der Regel zu
ge?nderten Speicherinhalten und unerkl?rlichen Abst?rzen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.2. ?nderungen im Bootloader
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.3. Netzwerke und Netzwerkkarten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die neuen Treiber
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`ath\_hal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath_hal&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
bieten Unterst?tzung f?r 802.11a/b/g Ger?te auf Basis der AR5210, AR5211
und AR5212 Chips?tze.

Der neue Treiber
`bfe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bfe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt Fast Ethernet Karten mit Broadcom BCM4401 Chipsatz.

Der Treiber
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt jetzt auch Gigabit-Ethernetkarten auf Basis des Broadcom
5705 Chipsatzes. [MERGED]

Im Treiber
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
wurde ein Fehler beseitigt, durch den er bei 10 Mbps nicht korrekt
funktionierte.

Im Treiber
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
kann man jetzt die Interrupt-Verz?gerung mit sysctl einstellen; es ist
nicht mehr notwendig, den Treiber neu zu ?bersetzen.

Der neue Treiber
`fatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt bei NATM und NgATM ATM-Karten vom Typ Fore/Marconi PCA200.

Der neue Treiber
`harp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=harp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
stellt Verbindungen zu allen ATM NetGraph Schnittstellen her und bietet
so Zugriff auf die HARP Stacks dieser Schnittstellen.

Der neue Treiber
`hatm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hatm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt die Fore/Marconi HE155 und HE622 ATM Karten.

Der neue Treiber
`patm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=patm&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt ATM-Karten auf Basis des IDT77252 Chipsatzes.

Der neue Treiber
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt Fast Ethernet und Gigabit Ethernet Karten auf Basis der
folgenden Chips?tze: RealTek RTL8139C+, RTL8169, RTL8169S und RTL8110S.

Der Treiber
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt jetzt auch Gigabit Ethernet Karten auf Basis der Chips?tze
SK-9521 V2.0 and 3COM 3C940. [MERGED]

Der neue Treiber
`utopia(4) <http://www.FreeBSD.org/cgi/man.cgi?query=utopia&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt ATM-Verbindungen mit Geschwindigkeiten von 25 MBit/sec, 155
MBit/sec und 622MBit/sec auf der physikalischen Schicht sowie Status-
und Statistik-Informationen f?r die gebr?uchlichsten ATM-PHY Chips?tze.

Der Treiber
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt Suspend und Resume jetzt auch, wenn die zugeh?rige
Schnittstelle nicht aktiv (down) ist. [MERGED]

Der Treiber
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
sollte wieder korrekt mit 802.11b Netzwerkkarten von Lucent
zusammenarbeiten.

Die Unterst?tzungsschicht f?r 802.11 wurde neu implementiert, um
zus?tzliche Ger?te und Funktionen unterst?tzen zu k?nnen.

Der Treiber
`xe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt CE2, CEM28 und CEM33 Karten sowie
`multicast(4) <http://www.FreeBSD.org/cgi/man.cgi?query=multicast&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Pakete, zus?tzlich wurden diverse Fehler korrigiert.

Bei diversen Treiber f?r Netzwerkkarten konnten die Interrupt-Routinen
als MPSAFE markiert werden, d.h. sie brauchen den Giant Lock nicht mehr.
Dies betrifft:
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`ep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ep&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`sn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sn&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__,
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
und
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4. Netzwerk-Protokolle
^^^^^^^^^^^^^^^^^^^^^^^^^^

Im IPv4 Protokoll wurde die Erweiterung ip\_flow durch ip\_fastforward.
Sinn und Zweck von ip\_fastforward ist, einfache F?lle von Packet
Forwarding zu beschleunigen, indem das Packet direkt zum sendenden
Interface geschickt wird, statt erst durch die ?blichen Warteschlangen
und netisr zu m?ssen. Wenn es nichts mit einem Packet anfangen kann,
wird es an die normalen ip\_input Routinen weitergereicht. Um diese
Erweiterung zu aktivieren, mu? die Sysctl-Variable
net.inet.ip.fastforwarding auf 1 gesetzt werden.

Mit der neuen Option IP\_ONESBCAST ist es m?glich, ungerichtete
`ip(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ip&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Broadcasts an bestimmte Netzwerk-Interfaces zu senden.

Um die Kernel-Erweiterung options IPFILTER nutzen zu k?nnen, mu? jetzt
auch die Option options PFIL\_HOOKS gesetzt sein.

In den Routinen zur Auswertung von
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
limit Regeln wurde ein Fehler beseitigt, der zu diversen Abst?rzen
f?hren konnte. [MERGED]

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
versteht jetzt mit Kommata separierte Adre?listen (wie z.B. 1.2.3.4,
5.6.7.8/30, 9.10.11.12/22) und erlaubt die Verwendung eines Leerzeichens
hinter dem Komma, um die Listen besser lesbar zu machen. [MERGED]

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
versteht jetzt Kommentare im C++-Stil. Die Kommentare werden zusammen
mit den jeweiligen Regeln gespeichert und bei
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
show angezeigt. [MERGED]

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
erlaubt jetzt die ?nderung des
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Regelsatzes 31, der bisher nicht ver?ndert werden konnte und f?r die
Standardregeln genutzt wurde. Dieser Regelsatz kann jetzt mit
``ipfw delete set 31`` gel?scht werden, das normale ``ipfw flush``
l?scht ihn allerdings nicht. Durch diese ?nderung wird es einfacher,
\`\`persistente Regeln'' einzurichten. Weitere Informationen finden Sie
in
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__.
[MERGED]

Die neue NetGraph-Node
`ng\_atmpif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_atmpif&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
emuliert eine physikalische HARP-Schnittstelle und erlaubt so die
Nutzung des HARP ATM Stacks ohne die passende Hardware.

Der Kernel unterst?tzt jetzt Protocol Independent Multicast Routing
(man.pim.4;). [MERGED]

Bei IPv4 Paketen wird das Feld ip\_id nur noch gesetzt, wenn ein Paket
fragmentiert werden mu?. Dies tr?gt dazu bei, da? nur wirklich
notwendige Informationen nach au?en gelangen.

Die Bluetooth-Unterst?tzung von FreeBSD wurde in vielen Punkten
vergessert:

-  **libsdp** wurde neu implementiert und kann jetzt zu den Bedingungen
   der BSD-Lizenz genutzt werden. Die Linux BlueZ Routinen konnten nur
   zu den Bedingungen der GPL genutzt werden.

-  `hccontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hccontrol&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
   unterst?tzt vier neue Befehle: Read/Write\_Page\_Scan\_Mode und
   Read/Write\_Page\_Scan\_Period\_Mode.

-  Der Dæmon
   `hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
   speichert die Schl?ssel jetzt auf Platte. Es ist nicht mehr
   notwendig, die Vertrauensbeziehung zwischen den Ger?ten jedes Mal neu
   einzurichten.

-  In den NetGraph-Modulen
   `ng\_hci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hci&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   und
   `ng\_l2cap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2cap&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   wurden Timeout-Probleme korrigiert, die zu Zugriffen auf eigentlich
   schon freigegebene Datenstrukturen f?hren konnten.

-  Das Modul
   `ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
   konnte nicht auf FreeBSD 5.1-RELEASE compiliert werden, dieser Fehler
   wurde beseitigt.

-  `rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
   und
   `rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
   k?nnen jetzt den RFCOMM Kanal mit SDP beim Server erfragen. Wird der
   RFCOMM Kanal manuell gesetzt, wird dieser Mechanismus deaktiviert; in
   diesem Fall nutzen die beiden Programme SDP nicht.

-  Mit
   `sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
   steht jetzt ein ?hnliches Tool wie das auf Linux BlueZ SDP Paket
   bekannt sdptool zur Verf?gung.

Aus dem CVS Repository des KAME Projektes wurden diverse Korrekturen und
Verbesserungen der IPv6 und IPSec Routinen ?bernommen.

Die Unterst?tzung f?r die IPv6 Adavanced Sockets API entspricht jetzt
RFC 3542 (auch bekannt als RFC 2292bis) und nicht mehr RFC 2292. Alle
Anwendungen, die diese API nutzen, wurden aktualisiert.

Die Auswahl der Sender-Adresse nach RFC 3484 wird jetzt unterst?tzt. Die
Regeln zur Auswahl der Adresse k?nnen mit
`ip6addrctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ip6addrctl&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
konfiguriert werden.

Die TCP-Implementierung unterst?tzt jetzt tcp\_hostcache. Dadurch werden
bestimmte Einstellungen einer TCP-Verbindung gespeichert, um bei
weiteren Verbindung vom oder zum gleichen System sofort die besseren
Einstellungen nutzen zu k?nnen. ?hnliche Informationen wurden fr?her in
der Routingtabelle gespeichert, dies ist jetzt nicht mehr der Fall.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5. Festplatten und Massenspeicher
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der Treiber
`amr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=amr&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt jetzt Crashdumps. [MERGED]

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
wurde komplett ?berarbeitet. Eine der auff?lligsten ?nderungen ist, da?
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
jetzt nicht mehr innerhalb des Giant Lock des Kernels laufen mu?. Bitte
beachten Sie, da? Sie bei der Benutzung von ATA Software RAIDs jetzt in
der Konfigurationsdatei f?r Ihren angepa?ten Kernel die Zeile device
ataraid stehen mu?. Bei fr?heren Versionen war es ausreichend, nur
device atadisk anzugeben.

`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
kann jetzt auch Festplatten ohne Partionen oder Dateisysteme (raw disks)
und anderen
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Datenquellen nutzen.

Der Treiber
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
versucht nicht mehr, 6 Byte lange Befehle an USB- und FireWire-Ger?te zu
verschicken. Die Ausnahmeregeln (quirks) f?r diese Ger?te sollten jetzt
?berfl?ssig sein und wurden deaktiviert. Um sie zu reaktivieren, mu? in
der Konfigurationsdatei f?r den angepa?ten Kernel die Zeile options
DA\_OLD\_QUIRKS stehen. [MERGED]

Die folgenden
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
Module k?nnen jetzt als Kernel-Module geladen werden: ``geom_apple``,
``geom_bde``, ``geom_bsd``, ``geom_gpt``, ``geom_mbr``, ``geom_pc98``,
``geom_sunlabel``, ``geom_vol_ffs``.

Wenn ein Ger?t ?ber mehrere redundante Verbindungen angeschlossen ist,
k?nnen diese mit dem neuen Modul GEOM\_FOX erkannt und unter Ihnen
ausgew?hlt werden.

Der Treiber
`twe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twe&sektion=4&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt jetzt das generische ABI von 3ware. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6. Dateisystem
^^^^^^^^^^^^^^^^^^

Die Dateisysteme cd9660, msdosfs, ntfs und udf unterst?tzen jetzt die
Umwandlung von Multi-Byte-Zeichen, die entsprechenden Routinen k?nnen
mit den Kernel-Optionen CD9660\_ICONV, MSDOSFS\_ICONV, NTFS\_ICONV und
UDF\_ICONV aktiviert werden.

In smbfs wurden einige off-by-one Fehler korrigiert, durch die es
Probleme mit 15 Zeichen langen NETBIOS Namen gegeben hatte.

Die Gr??e einiger Eintr?ge der statfs Struktur wurde von 32 Bit auf 64
Bit erh?ht, um die Unterst?tzung f?r mehrere TeraByte gro?e Dateisysteme
zu verbessern.

-  Anwender, die ihr System mit Hilfe der Sourcen aktuell halten und
   diese ?nderung durchf?hren, m?ssen darauf achten, da? ihr Kernel zu
   ihren Anwenderprogrammen pa?t (und umgekehrt). Die dokumentierte
   Vorgehensweise f?r die Aktualisierung mu? eingehalten werden.

-  Es gibt eine r?ckw?rtskompatible Version des Systemaufrufs
   `statfs(2) <http://www.FreeBSD.org/cgi/man.cgi?query=statfs&sektion=2&manpath=FreeBSD+5.2-RELEASE>`__,
   allerdings nur, wenn die Option COMPAT\_FREEBSD4 im Kernel aktiv ist.
   Sie sollten diese Option auf jeden Fall in die Konfigurationsdatei
   f?r Ihren angepa?ten Kernel aufnehmen.

-  Alle Programme, die
   `statfs(2) <http://www.FreeBSD.org/cgi/man.cgi?query=statfs&sektion=2&manpath=FreeBSD+5.2-RELEASE>`__
   nutzen, m?sen neu ?bersetzt werden. Dazu geh?ren unter anderem die
   Ports
   ```devel/gnomevfs2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/devel/gnomevfs2/pkg-descr>`__,
   ```mail/postfix`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/postfix/pkg-descr>`__,
   and
   ```security/cfg`` <http://www.FreeBSD.org/cgi/url.cgi?ports/security/cfg/pkg-descr>`__
   .

NFSv4 wird jetzt unterst?tzt, Basis ist Citi NFSv4 Client der University
of Michigan. Weitere Informationen finden Sie in der Onlinehilfe zu
`mount\_nfs4(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs4&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
und
`idmapd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=idmapd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.7. Multimedia
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Benutzerprogramme
~~~~~~~~~~~~~~~~~~~~~~

Die Unterst?tzung f?r das nur auf i386 Systemen genutzten a.out Format
wurde entfernt.

Wird
`acpiconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpiconf&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
mit der neuen Option -i aufgerugen, gibt es Informationen ?ber den
Akkuzustand aus.

Mit
`acpidb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidb&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
steht jetzt ein ACPI DSDT Debugger zur Verf?gung.

Bei
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
kann man mit der neuen Option -i die Ausgabe der Anzeigeoperationen auf
die ARP-Eintr?ge eines einzigen Interfaces begrenzen. Die Erweiterung
ist speziell f?r Router mit vielen Netzwerk-Interfaces gedacht. [MERGED]

Mit dem neuen Programm
`asf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=asf&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
ist es m?glich, Symbolinformationen aus KLDs in eine
`gdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gdb&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
Sitzung zu importieren.

Mit dem neuen Programm
`atmconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atmconfig&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
k?nen die ATM-Treiber und IP-?ber-ATM Funktionen konfiguriert werden.

Bei
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
k?nnen jetzt mit den neuen Optionen -u, -g und -G der Benutzer, die
prim?re Gruppe und die Liste der Gruppen gesetzt werden, die innerhalb
der chroot-Umgebung genutzt werden sollen. [MERGED]

Die Bibliotheken in ``compat4x.i386`` sind jetzt auf dem Stand von
FreeBSD 4.9-RELEASE.

Das Programm dev\_mkdb wird nicht mehr ben?tigt, seit devfs fester
Bestandteil des System ist und wurde deshalb entfernt.

`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
pr?ft jetzt den Status der Schnittstellen und schickt DHCP Anfragen nur
?ber die Schnittstellen, die zur Zeit aktiv sind. Mit der neuen Option
-i kann festgelegt werden, in welchem Intervall diese Pr?fung
stattfindet.

Das Verzeichnis ``lost+found`` wird von
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
jetzt mit den Berechtigungen 0700 an Stelle der alten 01777 angelegt.
[MERGED]

`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
und
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
legen jetzt im obersten Verzeichnis jedes Dateisystems ein Verzeichnis
mit Namen ``.snap``, das der Gruppe ``operator`` geh?rt.
`fsck\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck_ffs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
und
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
nutzen dieses Verzeichnis, um ihre Snapshosts zu speichern. Durch diese
?nderung ist es nicht mehr notwendig, das oberste Verzeichnis eines
Dateisystems zu sperren, w?hrend ein Snapshot angelegt wird, au?erdem
wird es f?r normale Benutzer einfacher, Snapshots anzulegen.

`ffsinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ffsinfo&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzt jetzt auch UFS2 Dateisysteme und steht wieder zur Verf?gung.

Mit
`iasl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iasl&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
stehen jetzt Compiler und Decompiler f?r die ACPI Source Language (ASL)
und die ACPI Machine Language (AML) zur Verf?gung.

Wird bei
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
die neue Option staticarp angegeben, werden f?r dieses Interface keine
ARP Anfragen mehr versandt.

Nach der Korrektur eines Fehlers in der Bibliotheksfunktion
`initgroups(3) <http://www.FreeBSD.org/cgi/man.cgi?query=initgroups&sektion=3&manpath=FreeBSD+5.2-RELEASE>`__
schl?gt die Anmeldung jetzt fehl, wenn es nicht m?glich war, *alle*
Gruppen eines Benutzer in die Process Credentials aufzunehmen. Zur Zeit
ist die Anzahl der Gruppen im Kernel auf 16 beschr?nkt,
Systemadministratoren sollten daher sicherstellen, da? kein Benutzer in
mehr als 16 Gruppen ist, weil er sich sonst nicht anmelden kann.

Bei
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
list und show kann man jetzt Bereiche angeben. [MERGED]

Bei
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
kann jetzt mit der neuen Option -n die Syntax eines Kommandos getestet
werden, ohne ?nderungen an den aktiven Regeln vorzunehmen. [MERGED]

Wird
`kdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kdump&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
mit der neuen Option -p aufgerufen, zeigt es nur die Systemaufrufe eines
bestimmten Prozesses an. Mit der neuen Option -e wird die Ausgabe der
seit dem Start von
`kdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kdump&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
verstrichenen Zeit aktiviert.

Bei
`last(1) <http://www.FreeBSD.org/cgi/man.cgi?query=last&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
kann die Anzahl der ausgegebenen Zeilen jetzt mit -n eingestellt werden.

Die ``libalias`` Bibliothek sowie
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
und
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzen jetzt das Cisco Skinny Station Protokoll. Dieses Protokoll
wird von Cisco IP Telefonen f?r die Kommunikation mit dem Cisco Call
Manager gentutzt. Allerdings es ist zur Zeit nicht m?glich, den Call
Manager hinter dem NAT Gateway zu plazieren. [MERGED]

Die Bibliothek ``libcipher``, die bisher die Funktionen zur
DES-Verschl?sselung bereitstellte, wurde entfernt. Ihre Funktionalit?t
wurde vollst?ndig in die Bibliothek ``libcrypto`` ?berf?hrt. Alle
Programme im Basissystem, die bisher ``libcipher`` nutzten, nutzen jetzt
``libcrypto``.

Die Bibliothek ``libcipher``, die bisher die Funktionen zur
DES-Verschl?sselung bereitstellte, wurde entfernt. Ihre Funktionalit?t
wurde vollst?ndig in die Bibliothek ``libcrypto`` ?berf?hrt. Alle
Programme im Basissystem, die bisher ``libcipher`` nutzten, nutzen jetzt
``libcrypto``.

Die neue Bibliothek ``libkiconv`` bietet Unterst?tzung f?r nachladbare
Tabelle zur Umwandlung zwischen verschiedenen Zeichens?tzen innerhalb
des Kernels.

Sowohl ``libwrap`` als auch
`tcpdchk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdchk&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzen jetzt standardm??ig die erweiterte Syntax f?r
**tcp\_wrappers**.

Das Programm
`locale(1) <http://www.FreeBSD.org/cgi/man.cgi?query=locale&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
wurde neu geschrieben und entspricht jetzt dem POSIX-Standard. Die neue
Option -m zeigt die Liste aller verf?gbaren Codesets an.

Wird
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
mit der Option -v aufgerufen, zeigt es zus?tzlich zu den normalen
Informationen auch die Dateisystem-ID jedes Dateisystems an. Dieser Wert
kann jetzt auch als Argument an
`umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
?bergeben werden. Damit kann jetzt genau spezifiziert werden, welches
Dateisystem entfernt werden soll, auch wenn zwei oder mehr Dateisysteme
das gleiche Ger?t und den gleichen Mount Point nutzen.

Die Programme
`mount\_cd9660(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_cd9660&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
`mount\_ntfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_ntfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
und
`mount\_udf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_udf&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
unterst?tzen jetzt die Umwandlung von Dateinamen von Unicode in den
lokalen Zeichensatz, der mit der neuen Option -C angegeben wurde. Es ist
m?glich, Multi-Byte Zeichens?tze zu verwenden.

Bei
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
kann jetzt mit der neuen Option -M die maximale Berechtigung f?r
Verzeichnisse angegebene werden. [MERGED]

Bei
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
k?nnen jetzt mit -D die MS-DOS Codepage und mit -L der lokale
Zeichensatz angegeben werden, um die Dateinamen umzuwandeln. Die
Tabellen in ``/usr/libdata/msdosfs`` werden nicht mehr verwendet.

Die Programme
`mount\_nwfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nwfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__,
`mount\_portalfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_portalfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
und
`mount\_smbfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_smbfs&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
wurden von ``/sbin`` nach ``/usr/sbin`` verschoben.

`nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nologin&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
ist jetzt ein C-Programm und kein Shell Script mehr.

Die von
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
genutzte Variable ntpd\_flags in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.2-RELEASE>`__
enth?lt jetzt standardm??ig den Wert -f /var/db/ntpd.drift.

Das neue PAM Modul
`pam\_guest(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_guest&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
erlabut Logins von \`\`G?sten''. Es ersetzt das Modul pam\_ftp(8).

Werden
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
oder
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
mit der neuen Option -H aufgerufen, zeigen sie alle Threads an, die f?r
den Kernel sichtbar sind.

In
`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
wurde ein Fehler beseitigt, durch den entfernbare Netzwerkkarten nicht
erkannt wurden.

Wird
`repquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=repquota&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
mit der neuen Option -n aufgerufen, zeigt es nur die numerischen IDs der
Benutzer und Gruppen an.

In
`rtld(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rtld&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
ist jetzt standardm??ig \`\`libmap'' aktiviert. Die fr?her bei der
Compilierung ben?tigte Einstellung WITH\_LIBMAP ist nicht mehr
notwendig. Weitere Informationen finden Sie in
`libmap.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=libmap.conf&sektion=5&manpath=FreeBSD+5.2-RELEASE>`__.

Wird
`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
mit der neuen Option -C aufgerufen, zeigt es nur noch an, ob ein
coredump vorhanden ist.

Das Hilfsprogramm symorder wurde entfernt. Es wird nicht mehr ben?tigt,
da alle Kernel jetzt das ELF Format verwenden und da es keine Werkzeuge
mehr gibt, die Programme im a.out Format erzeugen k?nnen.

In
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
kann jetzt bei der Installation ein alternativer MTA ausgew?hlt werden.
Zur Zeit werden **exim** und **Postfix** unterst?tzt.

In
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
kann man nicht mehr zwischen verschiedenen \`\`security profiles''
ausw?hlen, daf?r ist es jetzt m?glich,
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
ein- bzw. auszuschalten und die Sicherheitsstufe des Systems zu w?hlen.

`systat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=systat&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
zeigt jetzt auch IPv6 und ICMPv6 Datenpakete an. [MERGED]

Wird
`uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1&manpath=FreeBSD+5.2-RELEASE>`__
mit der neuen Option -i aufgerufen, zeigt es die Identifikation des
Kernels an. Diese Information ist ebenfalls ?ber die Sysctl-Variable
kern.ident verf?gbar.

Einige der in ``/bin`` und ``/sbin`` verf?gbaren Programme sind jetzt im
einem statisch gelinkten, \`\`crunched'' Programm verf?gbar, das in
``/rescue`` liegt. Das von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
angelegte ``/stand`` Verzeichnis bietet eine ?hnliche Funktionalit?t,
allerdings bietet ``/rescue`` mehr M?glichkeiten und wird im Rahmen von
buildworld/installworld aktualisiert. Weitere Informationen finden Sie
in
`rescue(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rescue&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__

Die meisten Programme in ``/bin`` und ``/sbin`` sind jetzt dynamisch und
nicht mehr statisch gelinkt. Dadurch k?nnen Programme des
Standardsystems, die in diesen Verzeichnissen liegen, PAM und NSS Module
nachladen. Durch die Nutzung von Shared Libraries wird au?erdem der
Platzbedarf auf dem root-Dateisystem verringert. Um diese Erweiterung
abzuschalten, mu? w?hrend des buildworld Laufs die Makefile-Variable
NO\_DYNAMICROOT definiert sein. Statische gebundene Programme sind
weiterhin im Verzeichnis ``/rescue`` verf?gbar und k?nnen f?r die
Reparatur und Wiederherstellung des Systems genutzt werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. Zus?tzliche Software
~~~~~~~~~~~~~~~~~~~~~~~~~

Die **ACPI-CA** Routinen wurden von der Version 20030228 auf die Version
20030619 aktualisiert.

**amd** wurde von Version 6.0.7 auf Version 6.0.9 aktualisiert.

Das Bell Labs **awk** wurde von der Zwischenversion vom 14. M?rz 2003
auf die Zwischenversion vom 29. Juli 2003 aktualisiert.

**BIND** wurde von Version 8.3.4 auf Version 8.3.7 aktualisiert.
[MERGED]

**GCC** wurde von Version 3.2.2 auf einen Zwischenstand nach Version
3.3.3 aktualisiert.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** ?ltere **GCC**-Versionen erzeugten fehlerhafte
    Programme, wenn die Optimierung -march=pentium4 verwendet wurde.
    Dieser Fehler sollte behoben sein. Die Routinen f?r den Fall
    CPUTYPE=p4, mit denen dieser Fehler behoben werden sollte, wurden
    enfernt.

.. raw:: html

   </div>

**GNU Readline** wurde von Version 4.2 auf Version 4.3 aktualisiert.

**GNU Sort** wurde von der Version aus textutils 2.0.21 auf die Version
aus textutils 2.1 aktualisiert.

**Heimdal Kerberos** wurde von Version 0.5.1 auf Version 0.6
aktualisiert.

Der **ISC DHCP** Client wurde von der Version 3.0.1rc11 auf die Version
3.0.1rc12 aktualisiert.

**lukemftp** wurde von der Version 1.6beta2 auf eine
NetBSD-Zwischenversion vom 11. November 2003 aktualisiert.

**OpenSSL** wurde von der Version 0.9.7a auf die Version 0.9.7c
aktualisiert. [MERGED]

OpenPAM wurde von der Version \`\`Dianthus'' auf die Version
\`\`Dogwood'' aktualisiert.

**sendmail** wurde von Version 8.12.9 auf Version 8.12.10 aktualisiert.
[MERGED]

**texinfo** wurde von Version 4.5 auf die Version 4.6 aktualisiert.
[MERGED]

Die Datenbank f?r die Zeitzonen wurden von der Version ``tzdata2003a``
auf die Version ``tzdata2003d`` aktualisiert. [MERGED]

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5. Infrastruktur f?r Ports und Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wenn ``GNU_CONFIGURE`` definiert ist, werden alle in ``WRKDIR``
vorhandenen Kopien von ``config.guess`` und ``config.sub`` durch die
Master-Version aus ``PORTSDIR``/Template ersetzt. Dadurch k?nnen alte
Ports (mit alten Versionen dieser Scripte) auf neuen Architekturen wie
ia64 und amd64 genutzt werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6. Erzeugung von Releases und Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**GNOME** wurde von Version 2.2.1 auf Version 2.4 aktualisiert. [MERGED]

**KDE** wurde von Version 3.1.2 auf Version 3.1.4 aktualisiert. [MERGED]

Die auf CD 1 zur Verf?gung stehenden Versionen von **GNOME** und
**KDE**, die ?ber das
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
\`\`X Desktops'' Men? von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.2-RELEASE>`__
installiert werden k?nnen) sind jetzt \`\`Lite Edition'' Packages und
nicht mehr die vollst?ndigen Meta-Ports. Die abgespeckten Packages
stellen die wichtigsten Werkzeuge und Programme f?r jeden Desktop zur
Verf?gung, ohne CD 1 ?berlaufen zu lassen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.7. Dokumentation
~~~~~~~~~~~~~~~~~~

Bei den meisten Treibern wurden die Informationen ?ber die unterst?tzten
Ger?te von den Release Notes in die Onlinehilfe verschoben. Die
Informationen waren teilweise doppelt vorhanden und mu?ten an zwei
Stellen aktualisiert werden, was unn?tige Arbeit verursachte und zu
Inkonsistenzen f?hrte. Die Arbeiten sind noch nicht abgeschlossen.

Es gibt jetzt eine Gruppe, die an einer t?rkischen (tr\_TR.ISO8859-9)
Version der Dokumentation arbeitet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktualisierung einer ?lteren Version von FreeBSD
---------------------------------------------------

Anwender, die schon ein FreeBSD-System im Einsatz haben, sollten *auf
jeden Fall* die \`\`Hinweise f?r die ersten Anwender von FreeBSD
5.2-RELEASE'' lesen. Dieses Dokument ist auf den Distributionen in der
Regel in der Datei ``EARLY.TXT`` verf?gbar; ansonsten sollte es ?berall
dort verf?gbar sein, wo auch die anderen Dokumente der Release Notes
verf?gbar sind. Das Dokument enth?lt einige Tips f?r die Aktualisierung;
viel wichtiger ist aber die Analyse der beiden Optionen Wechsel zu
FreeBSD 5.X oder Weitere Verwendung von FreeBSD 4.X.

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Sie sollten vor der Aktualisierung von FreeBSD auf
    jeden Fall Sicherheitskopien *aller* Daten und Konfigurationsdateien
    anlegen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

Diese Datei und andere Dokumente zu dieser Version sind bei
ftp://ftp.FreeBSD.org/\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
