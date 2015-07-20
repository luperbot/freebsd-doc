========================================
FreeBSD/i386 4.6.2-RELEASE Release Notes
========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/i386 4.6.2-RELEASE Release Notes
========================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 The FreeBSD Documentation Project

Copyright © 2002 The FreeBSD German Documentation Project

| $FreeBSD: src/release/doc/de\_DE.ISO8859-1/relnotes/common/new.sgml,v
  1.1.2.5.2.2 2002/10/17 16:47:21 ue Exp $

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Die Release Notes f?r FreeBSD 4.6.2-RELEASE enthalten eine ?bersicht
?ber alle ?nderungen in FreeBSD seit der Version 4.5-RELEASE. Die Liste
umfa?t sowohl die ?nderungen des Kernels als auch ?nderungen der
Benutzerprogramme; dazu kommen alle Sicherheitshinweise, die seit der
letzten Version herausgegeben wurden. Einige kurze Anmerkungen zum Thema
Aktualisierung wurden ebenfalls aufgenommen.

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
1. `Einf?hrung <#AEN16>`__
2. `Neuerungen <#AEN26>`__
2.1. `?nderungen im Kernel <#KERNEL>`__
2.1.1. `Unterst?tzung f?r Prozessoren und Mainboards <#AEN58>`__
2.1.2. `?nderungen im Bootloader <#AEN64>`__
2.1.3. `Netzwerke und Netzwerkkarten <#AEN69>`__
2.1.4. `Netzwerk-Protokolle <#AEN133>`__
2.1.5. `Festplatten und Massenspeicher <#AEN150>`__
2.1.6. `Dateisystem <#AEN177>`__
2.1.7. `Unterst?tzung f?r PCCARD <#AEN180>`__
2.1.8. `Multimedia <#AEN185>`__
2.1.9. `Zus?tzliche Software <#AEN194>`__
2.2. `Sicherheit <#SECURITY>`__
2.3. `Benutzerprogramme <#USERLAND>`__
2.3.1. `Zus?tzliche Software <#AEN539>`__
2.3.2. `Ports/Packages Collection <#AEN623>`__
2.4. `Erzeugung von Releases und Integration <#AEN630>`__
3. `Aktualisierung einer ?lteren Version von FreeBSD <#AEN643>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Release Notes f?r FreeBSD 4.6.2-RELEASE auf
IA-32 Systemen. Es beschreibt die Komponenten von FreeBSD, die seit
4.5-RELEASE hinzugef?gt (oder ge?ndert) wurden. Au?erdem erhalten Sie
Hinweise f?r die Aktualisierung Ihres FreeBSD-Systems.

Diese Distribution von FreeBSD 4.6.2-RELEASE ist eine \`\`point
release'' Distribution, die einige Probleme (prim?r im Bereich
Sicherheit) behebt, die in FreeBSD 4.6-RELEASE aufgetreten sind. Diese
Distribution sollte eigentlich die Versionsnummer 4.6.1 tragen.
Allerdings wurden w?hrend der Vorbereitungen f?r die Ver?ffentlichung
weitere Probleme entdeckt, die zu Verz?gerungen f?hrten. Um Verwirrung
zu vermeiden, entschieden die f?r die Ver?ffentlichung und die
Sicherheit zust?ndigen Teams, f?r diese Distribution die Versionsnummer
4.6.2 zu verwenden.

Diese Distribution k?nnen Sie von
ftp://ftp.FreeBSD.org/pub/FreeBSD/releases und allen seinen Mirrors
erhalten. Weitere Informationen, wie Sie diese (oder andere) release
Distributionen von FreeBSD erhalten k?nnen, finden Sie im Anhang
`\`\`Obtaining
FreeBSD'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/handbook/mirrors.html>`__
des `FreeBSD
Handbuchs <http://www.FreeBSD.org/doc/en_US.ISO8859-1/handbook/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Neuerungen
-------------

Dieser Abschnitt beschreibt die f?r den Anwender offensichtlichsten
Neuerungen und ?nderungen in FreeBSD seit 4.5-RELEASE. Die Eintr?ge
dokumentieren neue Treiber bzw. Unterst?tzung f?r neue Hardware, neue
Befehle oder Optionen, die Behebung wichtiger Fehler, und
Aktualisierungen von Dritt-Software. Sicherheitshinweise, die nach dem
Erscheinen von 4.5-RELEASE herausgegeben wurden, sind ebenfalls
aufgef?hrt.

Eintr?ge, die nur f?r diese Version g?ltig sind, sind mit [4.6.2]
gekennzeichnet.

.. raw:: html

   <div class="SECT2">

--------------

2.1. ?nderungen im Kernel
~~~~~~~~~~~~~~~~~~~~~~~~~

Der neue Treiber
`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
(PCI \`\`Universal'' Communications) verbindet serielle Schnittstellen
auf PCI-Karten mit dem Treiber
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__.

Das Ger?t, auf dem der Kernel Dumps ablegt, kann jetzt mit der
Loader-Einstellung dumpdev festgelegt werden. Damit ist es jetzt
m?glich, schon in den letzten Phasen der Initialisierung des Kernels
(vor dem single user mode) einen Crash Dump zu erhalten.

Der Treiber
`snp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
ist nicht mehr statisch und kann jetzt als Modul verwendet werden.

Der neue Treiber
`spic(4) <http://www.FreeBSD.org/cgi/man.cgi?query=spic&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt den Zugriff auf das jog dial, das in einigen Sony Laptops
verwendet wird.
`moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt dieses Ger?t jetzt ebenfalls.

Der neue Treiber
`viapm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=viapm&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt die VIA SMBus Kontroller f?r Power Management.

.. raw:: html

   <div class="SECT3">

--------------

2.1.1. Unterst?tzung f?r Prozessoren und Mainboards
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Mit der neuen Kernel-Option CPU\_ATHLON\_SSE\_HACK versucht der Kernel,
da? SSE Feature Bit auf neueren Athlon CPUs zu aktivieren, wenn das vom
BIOS vergessen wurde.

Bei einigen Rechnern aktiviert das BIOS die I/O-Ports und den Speicher
der PCI-Karten nicht, die Karten waren daher nicht benutzbar. Mit der
Kernel-Option PCI\_ENABLE\_IO\_MODES aktiviert FreeBSD diese Karten und
macht sie dadurch nutzbar.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.2. ?nderungen im Bootloader
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``boot2`` unterst?tzt jetzt die Option -n, mit der man den Bootvorgang
nicht mehr mit einem Tastendruck abbrechen kann.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.3. Netzwerke und Netzwerkkarten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`an(4) <http://www.FreeBSD.org/cgi/man.cgi?query=an&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt auch Cisco LEAP und den WEP Schl?ssel \`\`Home''. Die
Aironet-Programme f?r Linux werden jetzt vom Emulator unterst?tzt.

Token-basierte ARCNET Netzwerke werden jetzt unterst?tzt.

Der neue Treiber cm unterst?tzt SMC COM90cx6 ARCNET Netzwerkkarten.

Der Treiber
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt VLANs.

Der Standardkernel (``GENERIC``) verwendet zur Unterst?tzung von Gigabit
Ethernet Karten von Intel jetzt den Treiber
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
und nicht mehr
`wx(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wx&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__.
Letzterer sollte seit FreeBSD 4.5-RELEASE nicht mehr verwendet werden.

Der neue Treiber my unterst?tzt Fast Ethernet und Gigabit Ethernet
Karten der Firma Myson.

Der Treiber
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt Netzwerkkarten mit dem Prism II und Prism 2.5.
104/128-bit WEP funktioniert jetzt auf Prism Karten.

Der Treiber
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt auch die Nutzung eines FreeBSD Systems als Wireless
Access Point. Diese Funktion kann mit der
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__-Option
mediaopt hostap aktiviert werden und funktioniert nur mit Wave-LAN
Karten mit Prism II Chipsatz.

Der Treiber
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt die **bsd-airtools**.

Der Treiber xe kann jetzt auch als Modul verwendet werden.

Einige Netzwerk-Treiber unterst?tzen jetzt den Modus semi-polling, durch
den die Systeme besser mit Angriffen und ?berlastungen umgehen k?nnen.
Um Polling zu aktivieren, m?ssen die folgenden Optionen in die
Konfigurationsdatei des angepa?ten Kernels eingetragen werden:

.. code:: PROGRAMLISTING

    options DEVICE_POLLING
    options HZ=1000 # nicht Pflicht, aber dringend empfohlen

Danach kann Polling mit der Sysctl-Variable kern.polling.enable
aktiviert; mit der Sysctl-Variable kern.polling.user\_frac wird der f?r
Benutzerprozesse zur Verf?gung stehende Anteil der CPU-Zeit eingestellt.
Die ersten Ger?te, die Polling unterst?tzen, sind
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__,
`fxp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fxp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__,
`rl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rl&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
und
`sis(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sis&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__.
Weitere Informationen finden Sie in der Onlinehilfe zu
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.4. Netzwerk-Protokolle
^^^^^^^^^^^^^^^^^^^^^^^^^^

Bei
`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
wurde die Unterst?tzung f?r Systemen mit mehreren komplett unabh?ngigen
Bridging-Clustern verbessert und die Stabilit?t bei dynamischen
?nderungen erh?ht. VLANs werden jetzt vollst?ndig unterst?tzt.

Bei der Behandlung von IPsec f?r IPv4 wurde ein Fehler beseitigt, der
dazu f?hrte, da? die ?berpr?fung von empfangenen SPDs nicht durchgef?hrt
wurde.

Die neue Netgraph Node ng\_eiface wird wie ein Ethernet-Interface
behandelt, liefert die Ethernet Rahmen aber an einen Netgraph-Anschlu?.

Die neue Netgraph Node
`ng\_etf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_etf&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
erlaubt es, Ethernet-Pakete nach Typ zu sortieren.

Im syncache des
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__-Stacks
wurde ein Fehler korrigiert, der zu Kernel Panics f?hren konnte.

Der TCP-Stack ignoriert jetzt Pakete, die an eine IP-Broadcast Adresse
gesendet wurden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.5. Festplatten und Massenspeicher
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der Treiber
`ahc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
wurde auf den Stand von FreeBSD -CURRENT vom 29. April 2002 gebracht.

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
wurde auf den Stand von FreeBSD -CURRENT vom 18. M?rz 2002 gebracht.

[4.6.2] Im Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
wurde ein Fehler behoben, durch den \`\`tagged queueing'' in einigen
F?llen nicht korrekt funktionierte.

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
kann jetzt ATA RAIDs erzeugen, l?schen, abfragen und regenerieren, zur
Steuerung dient
`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__.

[4.6.2] Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
berechnet die maximale Transfergr??e jetzt richtig, dadurch werden
zahlreiche Probleme beim Zugriff auf diverse ATA-Ger?te behoben, unter
anderem die diversen READ\_BIG Fehler.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.6. Dateisystem
^^^^^^^^^^^^^^^^^^

Bei den Soft Updates wurde ein Fehler korrigiert, durch den das
Dateisystem unter bestimmten Umst?nden inkonsistent werden konnte. Der
Fehler trat auf, wenn das System unmittelbar nach massiver Benutzung des
Dateisystems (z.B. der Installation eines neuen Kernels oder anderer
Software) heruntergefahren wurde.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.7. Unterst?tzung f?r PCCARD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[4.6.2] In den f?r die Spannungsversorgung zust?ndigen Routinen von
PCCARD wurde ein Fehler behoben, durch den sich einige Maschinen
(speziell Sony VAIO und Laptops von Toshiba) beim Systemstart oder bei
der ersten Verwendung einer PCCARD \`\`aufh?ngten''. Dadurch wurden auch
einige andere Probleme behoben, zum Beispiel k?nnen Toshiba-Laptops mit
ToPIC Chipsatz jetzt beide Steckpl?tze nutzen. Weiterhin sind einige der
bisher notwendigen \`\`Verrenkungen'' bei der Benutzung von PCI-Karten
mit PCCARD Steckpl?tzen nicht mehr notwendig.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.8. Multimedia
^^^^^^^^^^^^^^^^^

Der neue Treiber ufm unterst?tzt das D-Link DSB-R100 USB Radio.

Der Audio-Treiber f?r den via82c686 unterst?tzt jetzt auch den VIA
VT8233.

Der Audio-Treiber ich unterst?tzt jetzt auch den SiS 7012 Chipsatz.

Der Treiber
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
wurde auf den Stand von FreeBSD -CURRENT vom 22. April 2002 gebracht.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.9. Zus?tzliche Software
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <div class="SECT4">

2.1.9.1. IPFilter
'''''''''''''''''

**IPFilter** wurde auf Version 3.4.27 aktualisiert.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

2.1.9.2. isdn4bsd
'''''''''''''''''

Der neue Treiber
`ifpi2(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ifpi2&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt die AVM Fritz!Card PCI, Version 2.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. Sicherheit
~~~~~~~~~~~~~~~

In der Multiplexer-Routine von **OpenSSH** wurde ein \`\`off-by-one''
Fehler beseitigt. Durch diesen Fehler w?re ein authentifizierter
Benutzer in der Lage gewesen, auf dem Server beliebige Programme mit
root-Rechten ausf?hren zu lassen; ein Server w?re in der Lage gewesen,
auf dem Client beliebige Programme mit den Berechtigungen des Benutzers
auszuf?hren (siehe
`FreeBSD-SA-02:13 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:13.openssh.asc>`__).

Durch einen Fehler in **zlib** war es m?glich, da? Speicher doppelt
freigegeben wurde. Die
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+4.7-RELEASE>`__/`free(3) <http://www.FreeBSD.org/cgi/man.cgi?query=free&sektion=3&manpath=FreeBSD+4.7-RELEASE>`__
Routinen von FreeBSD sind von diesem Fehler nicht betroffen, einzelne
Anwendungen k?nnten aber durch entsprechend konstruierte Pakete mit
komprimierten Daten beeintr?chtigt oder zum Absturz gebracht werden. Der
Fehler in **zlib** wurde mittlerweile beseitigt. Informationen, wie Sie
dieses Problem umgehen bzw. beseitigen k?nnen, finden Sie in
`FreeBSD-SA-02:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:18.zlib.v1.2.asc>`__.

Durch Fehler in den TCP SYN Cache (\`\`syncache'') und SYN Cookie
(\`\`syncookie'') Routinen war es m?glich, da? normale TCP/IP
Datenpakete das System abst?rzen lie?en. Die Routinen wurden
mittlerweile beseitigt; Informationen, wie Sie die Problem umgehen bzw.
beseitigen k?nnen, finden Sie in
`FreeBSD-SA-02:20 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:20.syncache.asc>`__.

In den Routinen zur Behandlung der Routing-Tabelle wurde ein
Speicherleck gestopft, durch das ein Angreifer den gesamten Speicher
eines System verbrauchen konnte. Informationen, wie Sie die Problem
umgehen bzw. beseitigen k?nnen, finden Sie in
`FreeBSD-SA-02:21 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:21.tcpip.asc>`__.

Bei der Behandlung von memory-mapped I/O wurde ein Fehler beseitigt, der
zum Absturz des Systems f?hren konnte. Weitere Informationen finden Sie
in
`FreeBSD-SA-02:22 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:22.mmap.asc>`__.

SUID Programme konnten durch Manipulation Ihrer Standard-I/O
File-Descriptoren dazu gebracht werden, die falschen Dateien zu lesen
oder zu schreiben, dieser Fehler wurde behoben. Weitere Informatione
finden Sie in
`FreeBSD-SA-02:23 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:23.stdio.asc>`__.

[4.6.2] Die Korrektur f?r den in SA-02:23 beschriebenen Fehler (der
Nutzung von Datei-Handles durch set-user-id und set-group-id Programme)
ist fehlerhaft. Der Fehler konnte immer noch auf Systemen ausgenutzt
werden, die
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
oder
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
verwenden. Die zweite Version des Korrektur finden Sie in
`FreeBSD-SA-02:23 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:23.stdio.asc>`__.

Bei der Benutzung von
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
konnte es zu unerwarteten Seiteneffekten kommen, da ein Benutzer nicht
in der Gruppe ``wheel`` eingetragen sein mu?, um mit diesem Programm zum
Super-User zu werden (so wie das bei
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
der Fall ist). Um Probleme zu vermeiden, wird
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
standardm??ig nicht mehr SUID root installiert und damit wirkungslos
gemacht. Weitere Informationen finden Sie in
`FreeBSD-SA-02:24 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:24.k5su.asc>`__.

In
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
wurden mehrere Fehler entdeckt, durch die es m?glich war, da? Dateien
ohne Warnung ?berschrieben werden konnten; au?erdem war es m?glich, da?
lokale Benutzer Zugriff auf f?r sie eigentlich nicht zug?ngliche Dateien
erhielten. Diese Fehler wurden durch den Import einer neuen Version von
**bzip2** behoben. Weitere Informationen finden Sie in
`FreeBSD-SA-02:25 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:25.bzip2.asc>`__.

Ein Fehler in der Implementation des TCP SYN Cache (\`\`syncache'')
erlaubte es einem Angreifer, einen Denial-of-Service Angriff
durchzuf?hren, wenn
`accept\_filter(9) <http://www.FreeBSD.org/cgi/man.cgi?query=accept_filter&sektion=9&manpath=FreeBSD+4.7-RELEASE>`__
genutzt wurden. Dieser Fehler wurde beseitigt, weitere Informationen
finden Sie in
`FreeBSD-SA-02:26 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:26.accept.asc>`__.

Durch einen Fehler bei der Behandlung der Shell-Wildcards in
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
war es normalen Anwendern m?glich, beliebige Dateien zu l?schen, wenn
das Verzeichnis ``/tmp/.X11-unix`` nicht existierte und sie einen
Neustart des Systems erzwingen konnten. Dieser Fehler wurde beseitigt,
weitere Informationen finden Sie in
`FreeBSD-SA-02:27 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:27.rc.asc>`__).

[4.6.2] Im Resolver existierte ein Buffer-?berlauf, der von einem
entsprechend programmierten Domain Name Server oder durch passende
DNS-Anfragen eines Angreifers ausgenutzt werden konnte, dieser Fehler
wurde entfernt. Weitere Informationen finden Sie in
`FreeBSD-SA-02:28 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:28.resolv.asc>`__.

[4.6.2] In
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
wurde ein Buffer Overflow beseitigt, der durch defekte NFS-Pakete
ausgenutzt werden konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:29 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:29.tcpdump.asc>`__.

[4.6.2] Es ist nicht mehr m?glich,
`ktrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
zur Verfolgung des Ablaufs von Prozessen zu benutzen, wenn diese vorher
priveligiert waren. Falls ein Prozess sensitive Informationen erhalten
hat, bevor er die Privilegien abgegeben hat, k?nnen diese nicht mehr an
die Au?enwelt gelangen. Weitere Informationen finden Sie in
`FreeBSD-SA-02:30 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:30.ktrace.asc>`__.

[4.6.2] In
`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
existierte eine Race Condition, durch die es m?glich war, die
Berechtigungen einer beliebigen Datei zu ?ndern, dieser Fehler wurde
korrigiert. Weitere Informationen finden Sie in
`FreeBSD-SA-02:32 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:32.pppd.asc>`__.

[4.6.2] In **OpenSSL** wurden mehrere Buffer Overflows gefunden, die
Fehler wurden durch ein Update der von FreeBSD verwendeten Version von
**OpenSSL** beseitigt. Weitere Informationen finden Sie in
`FreeBSD-SA-02:33 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:33.openssl.asc>`__.

[4.6.2] Ein Buffer Overflow im Heap des XDR Decoders wurde beseitigt.
Weitere Informationen finden Sie in
`FreeBSD-SA-02:34 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:34.rpc.asc>`__.

[4.6.2] Ein Fehler, durch den ein Benutzer beliebige Bl?cke auf einem
FFS-Dateisystem lesen und schreiben konnte, wurde beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:35 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:35.ffs.asc>`__.

[4.6.2] Im NFS Server wurde ein Fehler beseitigt, durch den es m?glich
war, ?ber das Netzwerk einen Denial-of-Service Angriff durchzuf?hren.
Weitere Informationen finden Sie in
`FreeBSD-SA-02:36 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:36.nfs.asc>`__.

[4.6.2] Im
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
System wurde ein Fehler beseitigt, durch den ein lokaler Benutzer einen
Systemabsturz herbeif?hren konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:37 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:37.kqueue.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Benutzerprogramme
~~~~~~~~~~~~~~~~~~~~~~

Das neue Programm
`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
kann zur Konfiguration diversen Einstellungen des Treibers
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
genutzt werden.

Bei ATAPI CD-ROMs kann
`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
jetzt die maximal genutzte Geschwindigkeit mit dem Kommando speed
einstellen.

`ctags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ctags&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
erzeugt keine defektes Tag-Datei mehr, wenn in der Quelldatei Kommentare
mit // (C++-Stil) eingeleitet wurden.

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
nutzt seinen Eintrag in der Liste der Prozesse jetzt, um Informationen
?ber den Stand des Backups anzuzeigen, was bei der ?berwachung von
automatischen Backups n?tzlich ist.

``/etc/rc.firewall`` und ``/etc/rc.firewall6`` verwenden die in den
Skripten fest kodierten Regeln nicht mehr, wenn die Variable
firewall\_type den Namen einer Datei mit Regeln oder einen unbekannten
Firewall-Typ enth?lt. Damit soll vermieden werden, da? die Skripte
Annahmen ?ber die an einem Standort verwendeten Regelungen f?r Firewalls
machen. Zus?tzlich wurde daf?r gesorgt, da? der Firewall-Typ closed
genau das macht, was in der Onlinehilfe zu
`rc.firewall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.firewall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
dokumentiert ist.

Die Funktionalit?t von ``/etc/security`` wurde auf eine Gruppe von
Scripten im Verzeichnis ``/etc/periodic/security/`` verteilt, die die
von
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
bereitgestellte Umgebung nutzen. Dadurch wird es leichter, diese Scripte
auf das eigene System anzupassen und diese ?nderungen zu warten.

Bei
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
wurde die Adre?-Familie ether durch das allgemeinere link ersetzt. Die
Angabe von ether ist aber auch weiterhin m?glich, um Probleme mit
?lteren Programmen zu vermeiden.

Bei
`fsdb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsdb&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
kann mit dem neuen Befehl blocks die Liste der f?r eine bestimmte Inode
allozierten Bl?cke angezeigt werden.

Das Programm
`ispppcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ispppcontrol&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
wurde entfernt, seine Funktionen wurden von
`spppcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=spppcontrol&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
?bernommen.

`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
wird standardm??ig nicht mehr SUID ``root`` installiert. Wenn Sie dieses
Feature ben?tigen, m?ssen Sie die Dateiberechtigungen f?r
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
manuell ?ndern oder vor dem Update via Sourcecode die Zeile
ENABLE\_SUID\_K5SU=yes in ``/etc/make.conf`` eintragen.

`ldd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ldd&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann jetzt auch auf shared libraries und nicht nur auf Programme
angewendet werden.

``libstand`` unterst?tzt jetzt auch Dateisysteme, die mit **bzip2**
komprimierte Dateien enthalten.

``libusb`` wurde in ``libusbhid`` umbenannt und ?bernimmt damit die von
NetBSD genutzen Namen.

`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
hat zwei neue Optionen erhalten: -c protokolliert alle fehlgeschlagenen
Verbindungen via
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__,
und -W erlaubt Verbindungen von nicht privilegierten Ports.

Bei
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
kann in ``/etc/printcap`` jetzt auch die Option rc angegeben werden.
Wenn diese Option bei einer Drucker-Warteschlange f?r ein System im
Netzwerk gesetzt ist und der Benutzer mit ``lpr -#n`` mehrere Kopien
angefordert ist, schickt
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
die Daten einmal pro Kopie.

Wird bei
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
die neue Option -h zusammen mit -l verwendet, werden bei den Dateigr??en
maximal drei Ziffern und ein Pr?fix verwendet.

Das Programm
`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann jetzt #line Anweisungen f?r
`cpp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpp&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
erzeugen, dieses Verhalten wird mit der neuen Option -s aktiviert.

Es gibt zwei neue Optionen f?r
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__.
Mit -p wird der \`\`pre-buildworld'' Modus f?r die Dateien aktiviert,
von denen bekannt ist, da? sie Einflu? auf den Erfolg der Schritte
buildworld und installworld haben. Nach einem erfolgreichen Lauf von
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
kann -C genutzt werden, um die Einstellungen in ``/etc/rc.conf`` mit den
Standardwerten in ``/etc/defaults/rc.conf`` zu vergleichen.

`ngctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ngctl&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt das Kommando write, mit dem ein Datenpaket an einem
bestimmten Verbinder gesendet wird.

Bei
`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann jetzt die neue Option -i verwendet werden, um einen Patch aus einer
Datei und nicht von der Standardeingabe zu lesen.

[4.6.2]
`pam\_opie(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opie&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
gibt keine falschen Aufforderungen mehr aus, wenn die Variable
no\_fake\_prompts gesetzt ist.

[4.6.2] Das Modul
`pam\_opieaccess(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opieaccess&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
ist jetzt verf?gbar.

[4.6.2]
`pam\_radius(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_radius&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__,
`pam\_ssh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ssh&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
und
`pam\_tacplus(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_tacplus&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
wurden auf den Stand von FreeBSD -CURRENT vom 3. Juli 2002 gebracht.

Das neue PAM-Modul
`pam\_ssh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ssh&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
erlaubt die Authentifizierung durch SSH Kenns?tze und Schl?sselpaare.
Das Modul erledigt auch die Verwaltung der Sitzungen via
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__.

[4.6.2]
`pam\_unix(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_unix&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
wurde auf den Stand von FreeBSD -CURRENT vom 9. M?rz 2002 gebracht
(pre-**OpenPAM**).

Bei
`pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pr&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
k?nnen jetzt die Optionen -f und -p genutzt werden, um Ausgaben auf
einem Terminal anzuhalten.

Bei
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
war die Option -W (zur Abfrage von Informationen aus dem angegebenen
Swap) schon seit einer Zeit nutzlos, sie wurde daher entfernt.

Bei
`reboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=reboot&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
kann jetzt mit -k angegeben werden, welcher Kernel beim Neustart geladen
werden soll.

Wenn ein Benutzer S/Key nicht aktiviert hat, gibt
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
keine S/Key Anforderungen mehr aus. Das alte Verhalten f?hrte dazu, da?
Benutzer nach Einmal-Pa?worten gefragt wurden, wenn Sie f?r die
Verbindung zu einem FreeBSD System bestimmte neuere SSH Programm
verwendeten.

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
verf?gt jetzt ?ber minimale Unterst?tzung f?r die Behandlung mehrerer
Medien bei der Installation von Packages (z.B. f?r Distributionen auf
mehreren CDs).

`tftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tftp&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
und
`tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzen jetzt IPv6.

Mit dem neuen Programm
`usbhidctl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=usbhidctl&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
k?nnen USB Human Interface Devices konfiguriert werden.

Bei
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
und
`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann mit der neuen Option -o die Zieldatei angegeben werden. Wird bei
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
die neue Option -m verwendet, wird Base64-Encoding verwendet;
`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt dieses Format jetzt ebenfalls.

Bei
`watch(8) <http://www.FreeBSD.org/cgi/man.cgi?query=watch&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
kann das verwendete
`snp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Ger?t jetzt mit der Option -f angegeben werden.

Bei einem Teil der Locales wurden die Namen ge?ndert, aus \*.EUC wurde
\*.euc??. Zum Beispiel wurde ja\_JP.EUC in ja\_JP.eucJP umbenannt. Durch
diese ?nderung wurde die Kompatibilit?t der Namen mit FreeBSD CURRENT,
X11R6 und einigen anderen UNIX-Varianten verbessert.

Die Routinen zur unterst?tzung von Locales wurden auf den Stand von
FreeBSD-CURRENT gebracht. Damit steht jetzt Unterst?tzung f?r die
Kategorien LC\_NUMERIC, LC\_MONETARY und LC\_MESSAGES zur Verf?gung,
au?erdem gibt es Verbesserungen bei
`strftime(3) <http://www.FreeBSD.org/cgi/man.cgi?query=strftime&sektion=3&manpath=FreeBSD+4.7-RELEASE>`__,
ge?nderte Locales und Verbesserungen bei der Anpassung vieler
Systemprogramme.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1. Zus?tzliche Software
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**BIND** wurde auf Version 8.3.3 aktualisiert.

**bzip2** wurde auf Version 1.0.2 aktualisiert.

**Heimdal Kerberos** wurde auf Version 0.4e aktualisiert.

Der **ISC DHCP** Client wurde auf Version 3.0.1RC8 aktualisiert.

**OpenSSH** wurde auf Version 3.4p1 aktualisiert. Die wichtigsten
?nderungen sind:

-  Die ``*2`` Dateien werden nicht mehr ben?tigt (zum Beispiel kann
   ``~/.ssh/known_hosts`` jetzt den Inhalt von ``~/.ssh/known_hosts2``
   enthalten).

-  `ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
   kann Schl?ssel jetzt im SECSH Public Key File Format importieren und
   exportieren, um Schl?ssel mit diversen kommerziellen SSH-Version
   auszutauschen.

-  `ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
   wertet jetzt alle drei Standardschl?ssel aus.

-  `ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
   verwendet keinen Standardardtyp mehr, der Typ der Schl?ssels mu? mit
   der Option -t angegeben werden.

-  Das neue Feature \`\`privilege separation'' nutzt unprivilegierte
   Prozesse, um die Auswirkungen von Sicherheitsl?cken und
   Programmierfehlern einzuschr?nken und zu begrenzen.

-  Die Behebung diverser Fehler, dazu geh?rt eine Sicherheitsl?cke, die
   zu einem Integer-?berlauf und dadurch zu einer nicht gew?nschten
   Vererbung von Privilegien f?hren konnte.

-  Standardm??ig wird jetzt Version 2 des SSH Protokolls verwendet, bei
   Bedarf wird auf Version 1 zur?ckgeschaltet.

**texinfo** wurde auf Version 4.1 aktualisiert.

Die Datenbank der Zeitzonen wurde auf Version ``tzdata2002c``
aktualisiert.

.. raw:: html

   <div class="SECT4">

--------------

2.3.1.1. Sendmail
'''''''''''''''''

**sendmail** wurde auf Version 8.12.3 aktualisiert.
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
wird nicht mehr SUID ``root`` Programm installiert (jetzt SGID
``smmsp``). Weitere Informationen sind in
``/usr/src/contrib/sendmail/RELEASE_NOTES`` und ``/etc/mail/README``
verf?gbar.

Seit dieser Aktualisierung von **sendmail** startet
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
mehrere **sendmail** Daemonen (einige von Ihnen sind f?r den Versand von
Mails zust?ndig), auch wenn die Variable sendmail\_enable auf NO gesetzt
wurde. Um **sendmail** komplett zu deaktivieren, mu? sendmail\_enable
auf NONE. Auf Systemen, auf denen ein anderer MTA benutzt wird, kann
alternativ auch der Wert der Variablen mta\_start\_script ge?ndert
werden. Weitere Informationen finden Sie in der Manualpage
`rc.sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.sendmail&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__.

Wenn die von **sendmail** verwendeten Datenbanken alias und map mit
``/etc/mail/Makefile`` erzeugt werden, werden die Zugriffsrechte jetzt
standardm??ig auf 0640 gesetzt, um einen Denial-of-Service Angriff
mittels File Locking durch lokale Benutzer zu verhindern. Die
Zugriffsrechte k?nnen in ``make.conf`` mit der neuen Option
SENDMAIL\_MAP\_PERMS ge?ndert werden.

Die Zugriffsrechte f?r ``/var/log/sendmail.st``, die Datei mit den
**sendmail**-Statistiken, wurden von 0644 auf 0640 ge?ndert, um einen
Denial-of-Service Angriff mittels File Locking durch lokale Benutzer zu
verhindern.

[4.6.2] Bei der Nutzung der \`\`DNS Map'' konnte es zu einem ?berlauf
des f?r die Map genutzten Speichers kommen; diese Konfiguration wird
allerdings standardm??ig nicht genutzt. Dieser Fehler wurde beseitigt.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Dieser Fehler wurde in FreeBSD 4.6-STABLE durch den
    Import einer neueren Version von **sendmail** behoben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2. Ports/Packages Collection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die Infrastruktur f?r die Ports Collection benutzt jetzt standardm??ig
**XFree86** 4.2.0, um Abh?ngigkeiten zu erf?llen. Wenn Sie weiterhin
**XFree86** 3.3.6 verwenden wollen, m?ssen die folgende Zeile in die
Datei ``/etc/make.conf`` eintragen:

.. code:: PROGRAMLISTING

    XFREE86_VERSION=3

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. Erzeugung von Releases und Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
standardm??ig installierte Version des X Window System ist jetzt
**XFree86** 4.2.0. Au?erdem wird **XFree86** jetzt als ganz normales
Paket installiert und kann daher mit den ?blichen Programmen wie
`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
manipuliert werden.

[4.6.2] Ein Fehler, durch den bei einer Neuinstallation Dateien in
``/usr/share/examples`` fehlten, wurde behoben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktualisierung einer ?lteren Version von FreeBSD
---------------------------------------------------

Wenn Sie eine ?ltere Version von FreeBSD aktualisieren wollen, haben Sie
drei M?glichkeiten:

-  Die bin?re Aktualisierung mit
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__.
   Diese Variante ben?tigt die wenigste Zeit, allerdings geht sie davon
   aus, da? Sie keine Optionen zur Kompilierung von FreeBSD genutzt
   haben.

-  Die komplette Neuinstallation von FreeBSD. Dadurch f?hren Sie
   nat?rlich keine echte Aktualisierung durch und es ist auf jeden Fall
   nicht so bequem wie die bin?re Aktualisierung, da Sie ihre
   Konfigurationsdaten in ``/etc`` selbst sichern und wiederherstellen
   m?ssen. Dennoch kann diese Option sinnvoll sein, wenn Sie die
   Aufteilung der Partitionen ?ndern wollen oder m?ssen.

-  Mit dem Sourcecode in ``/usr/src``. Diese Variante ist flexibler,
   ben?tigt aber mehr Plattenplatz, Zeit, und Erfahrung. Weitere
   Informationen zu diesem Thema finden Sie im Kapitel `\`\`Using
   ``make world``'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/makeworld.html>`__
   des `FreeBSD
   Handbuchs <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.
   Eine Aktualisierung einer sehr alten Version von FreeBSD kann mit
   Problemen verbunden sein; in diesen F?llen ist es effektiver, eine
   bin?re Aktualisierung oder eine komplette Neuinstallation
   durchzuf?hren.

Bitte lesen Sie den Inhalt der Datei ``INSTALL.TXT``, um weitere
Informationen zu erhalten, und zwar *bevor* Sie mit der Aktualisierung
beginnen. Wenn Sie den Sourcecode zur Aktualisierung nutzen, sollten Sie
auf jeden Fall auch ``/usr/src/UPDATING`` lesen.

Zum guten Schlu?: Wenn Sie auf eine der m?glichen Arten die
FreeBSD-Entwicklungszweige -STABLE oder -CURRENT nutzen, sollten Sie auf
jeden Fall das Kapitel `\`\`-CURRENT vs.
-STABLE'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/current-stable.html>`__
im `FreeBSD
Handbuch <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__
lesen.

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
ftp://ftp.FreeBSD.org/pub/FreeBSD/releases\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
