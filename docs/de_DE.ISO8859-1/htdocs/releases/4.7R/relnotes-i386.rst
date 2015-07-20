======================================
FreeBSD/i386 4.7-RELEASE Release Notes
======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/i386 4.7-RELEASE Release Notes
======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 The FreeBSD Documentation Project

Copyright © 2002 The FreeBSD German Documentation Project

| $FreeBSD$

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Die Release Notes f?r FreeBSD 4.7-RELEASE enthalten eine ?bersicht ?ber
alle ?nderungen in FreeBSD seit der Version 4.6-RELEASE. Die Liste
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
2. `Neuerungen <#AEN24>`__
2.1. `?nderungen im Kernel <#KERNEL>`__
2.1.1. `Unterst?tzung f?r Prozessoren und Mainboards <#AEN64>`__
2.1.2. `?nderungen im Bootloader <#AEN69>`__
2.1.3. `Netzwerke und Netzwerkkarten <#AEN72>`__
2.1.4. `Netzwerk-Protokolle <#AEN82>`__
2.1.5. `Festplatten und Massenspeicher <#AEN126>`__
2.1.6. `Dateisystem <#AEN153>`__
2.1.7. `Unterst?tzung f?r PCCARD <#AEN156>`__
2.1.8. `Multimedia <#AEN159>`__
2.1.9. `Zus?tzliche Software <#AEN167>`__
2.2. `Sicherheit <#SECURITY>`__
2.3. `Benutzerprogramme <#USERLAND>`__
2.3.1. `Zus?tzliche Software <#AEN474>`__
2.3.2. `Ports/Packages Collection <#AEN556>`__
2.4. `Erzeugung von Releases und Integration <#AEN563>`__
3. `Aktualisierung einer ?lteren Version von FreeBSD <#AEN571>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Release Notes f?r FreeBSD 4.7-RELEASE auf
IA-32 Systemen. Es beschreibt die Komponenten von FreeBSD, die seit
4.6-RELEASE hinzugef?gt (oder ge?ndert) wurden. Au?erdem erhalten Sie
Hinweise f?r die Aktualisierung Ihres FreeBSD-Systems.

Diese Distribution von FreeBSD 4.7-RELEASE ist eine release
Distribution. Sie k?nnen Sie von ftp://ftp.FreeBSD.org/ und allen seinen
Mirrors erhalten. Weitere Informationen, wie Sie diese (oder andere)
release Distributionen von FreeBSD erhalten k?nnen, finden Sie im Anhang
`\`\`Obtaining
FreeBSD'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
des `FreeBSD
Handbuchs <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Neuerungen
-------------

Dieser Abschnitt beschreibt die f?r den Anwender offensichtlichsten
Neuerungen und ?nderungen in FreeBSD seit 4.6-RELEASE. Die Eintr?ge
dokumentieren neue Treiber bzw. Unterst?tzung f?r neue Hardware, neue
Befehle oder Optionen, die Behebung wichtiger Fehler, und
Aktualisierungen von Dritt-Software. Sicherheitshinweise, die nach dem
Erscheinen von 4.6-RELEASE herausgegeben wurden, sind ebenfalls
aufgef?hrt.

.. raw:: html

   <div class="SECT2">

--------------

2.1. ?nderungen im Kernel
~~~~~~~~~~~~~~~~~~~~~~~~~

`acct(2) <http://www.FreeBSD.org/cgi/man.cgi?query=acct&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
?ffnet die Datei mit den Accounting-Daten jetzt im Modus \`\`Anf?gen'',
damit das Accounting auch in diesem Fall mit
`accton(8) <http://www.FreeBSD.org/cgi/man.cgi?query=accton&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
eingeschaltet werden kann.

Mit dem neuen Ressource-Limit RLIMIT\_VMEM kann die maximale Gr??e des
von einem Prozess verwendeten virtuellen Speichers begrenzt werden,
davon ist auch via
`mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
angeforderter Speicher betroffen. Das Limit kann in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
mit der neuen Variable vmemoryuse konfiguriert werden.

In der Systemfunktion
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
wurde ein Fehler beseitigt, durch den die L?nger des Headers auf die
Dateigr??e angerechnet wurde.

Der neue Treiber
`ucom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ucom&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt USB Modems, serielle Schnittstellen und andere Programme,
die sich wie ein TTY verhalten sollen. Die beiden neuen Treiber
`uplcom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uplcom&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
und
`uvscom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvscom&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
bauen darauf auf und unterst?tzen den Prolific PL-2303 bzw. den Slipper
U VS-10U.

Der neue Treiber
`uvisor(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uvisor&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt via USB angeschlossene Handspring Visor.

.. raw:: html

   <div class="SECT3">

--------------

2.1.1. Unterst?tzung f?r Prozessoren und Mainboards
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der AMD Élan SC520 wird jetzt unterst?tzt, dazu mu? in der
Konfigurationsdatei f?r den angepa?ten Kernel die Zeile CPU\_ELAN
stehen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.2. ?nderungen im Bootloader
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.3. Netzwerke und Netzwerkkarten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der Treiber
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt auch die Intel 82545EM und 82545EP Chips?tze sowie
VLANs.

Der Treiber
`rp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=rp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
wurde auf Version 3.02 aktualisiert und kann jetzt auch als Modul
genutzt werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.4. Netzwerk-Protokolle
^^^^^^^^^^^^^^^^^^^^^^^^^^

Als Alternative zu den bekannten L?sungen steht jetzt mit \`\`IPFW2''
eine komplett ?berarbeitete Version von
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
zur Verf?gung. Sie legt ihre Regeln in variablen Bl?cken im Kernel ab,
?hnlich wie
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Anweisungen. Bis auf die neue Option, Regeln mit or zu kombinieren,
sollten die ?nderungen nicht nach au?en hin (also in
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__)
sichtbar sein. Die neue Version ist allerdings standardm??ig *nicht*
aktiviert. Zur Aktivierung sind die folgenden Schritte notwendig:

.. raw:: html

   <div class="PROCEDURE">

#. In der Konfigurationsdatei f?r den angepa?ten Kernel mu? der
   (undokumentierte) Eintrag options IPFW2 stehen.

#. Beim Compilieren und Installieren von ``libalias`` und
   `ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
   mu?
   `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
   mit der Option -DIPFW2 aufgerufen werden.

.. raw:: html

   </div>

Die neue Netgraph Node
`ng\_l2tp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2tp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
implementiert das Encapsulation Layer des L2TP Protokolls, wie in RFC
2661 beschrieben.

Der Timeout, nach dessen Ablauf
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
ein Paket erneut versendet, kann jetzt mit den beiden sysctl-Variablen
net.inet.tcp.rexmit\_min und net.inet.tcp.rexmit\_slop konfiguriert
werden. Der Standardwert wurde von einer Sekunde auf 200 Millisekunden
reduziert (?hnlich dem Default bei Linux), um besser auf Aussetzer bei
interaktiven Verbindungen und Ausf?lle bei unzuverl?ssigen schnellen
Verbindungen (drahtlose Netzwerke) reagieren zu k?nnen.

Das
`tcp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=tcp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Protokoll ist jetzt in der Lage, die Anzahl der ausstehenden Pakete
dynamisch anzupassen, um die Bandbreite der Verbindung optimal
auszunutzen und die Verz?gerungen zu minimieren. Diese Routinen werden
mit der Sysctl-Variable net.inet.tcp.inflight\_enable aktiviert.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.5. Festplatten und Massenspeicher
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der neue Treiber
`ahd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ahd&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt die Adaptec AIC7901, AIC7901A und AIC7902 Ultra320 PCI-X
SCSI Controller Chips.

Im Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
wurde ein Fehler behoben, durch den \`\`tagged queueing'' in einigen
F?llen nicht korrekt funktionierte.

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
berechnet die maximale Transfergr??e jetzt richtig, dadurch werden
zahlreiche Probleme beim Zugriff auf diverse ATA-Ger?te behoben, unter
anderem die diversen READ\_BIG Fehler.

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt die Sil 0680 und VIA 8233/8235 Controller.

Der neue Treiber mpt unterst?tzt die LSI Logic Fusion/MP architecture
Fiber Channel Controller.

Der neue Treiber pst unterst?tzt die Promise SuperTrak ATA RAID
Controller.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.6. Dateisystem
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.7. Unterst?tzung f?r PCCARD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.8. Multimedia
^^^^^^^^^^^^^^^^^

Es gibt jetzt einen spezialisierten Treiber f?r den VT8233 Audio
Controller, der alle bekannten Versionen des Chips unterst?tzt. Der
Treiber wird beim Start des Systems geladen, wenn in der
Konfigurationsdatei f?r den angepa?ten Kernel device pcm steht oder wenn
in ``/boot/loader.conf`` die Zeile snd\_via8233="YES" steht. Die f?r die
Entwicklung notwendige Dokumentation wurde von VIA zur Verf?gung
gestellt.

Der Audio-Treiber ich enth?lt jetzt minimalen Support f?r ich4 Audio.

Der neue Treiber uaudio unterst?tzt USB Audio Ger?te.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.9. Zus?tzliche Software
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**IPFilter** wurde auf Version 3.4.29 aktualisiert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. Sicherheit
~~~~~~~~~~~~~~~

Die Korrektur f?r den in SA-02:23 beschriebenen Fehler (der Nutzung von
Datei-Handles durch set-user-id und set-group-id Programme) ist
fehlerhaft. Der Fehler konnte immer noch auf Systemen ausgenutzt werden,
die
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
oder
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
verwenden. Die zweite Version des Korrektur finden Sie in
`FreeBSD-SA-02:23 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:23.stdio.asc>`__.

Im Resolver existierte ein Buffer-?berlauf, der von einem entsprechend
programmierten Domain Name Server oder durch passende DNS-Anfragen eines
Angreifers ausgenutzt werden konnte, dieser Fehler wurde entfernt.
Weitere Informationen finden Sie in
`FreeBSD-SA-02:28 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:28.resolv.asc>`__.

In
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
wurde ein Buffer Overflow beseitigt, der durch defekte NFS-Pakete
ausgenutzt werden konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:29 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:29.tcpdump.asc>`__.

Es ist nicht mehr m?glich,
`ktrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
zur Verfolgung des Ablaufs von Prozessen zu benutzen, wenn diese vorher
priveligiert waren. Falls ein Prozess sensitive Informationen erhalten
hat, bevor er die Privilegien abgegeben hat, k?nnen diese nicht mehr an
die Au?enwelt gelangen. Weitere Informationen finden Sie in
`FreeBSD-SA-02:30 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:30.ktrace.asc>`__.

In
`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
existierte eine Race Condition, durch die es m?glich war, die
Berechtigungen einer beliebigen Datei zu ?ndern, dieser Fehler wurde
korrigiert. Weitere Informationen finden Sie in
`FreeBSD-SA-02:32 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:32.pppd.asc>`__.

In **OpenSSL** wurden mehrere Buffer Overflows gefunden, die Fehler
wurden durch ein Update der von FreeBSD verwendeten Version von
**OpenSSL** beseitigt. Weitere Informationen finden Sie in
`FreeBSD-SA-02:33 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:33.openssl.asc>`__.

Ein Buffer Overflow im Heap des XDR Decoders wurde beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:34 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:34.rpc.asc>`__.

Ein Fehler, durch den ein Benutzer beliebige Bl?cke auf einem
FFS-Dateisystem lesen und schreiben konnte, wurde beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:35 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:35.ffs.asc>`__.

Im NFS Server wurde ein Fehler beseitigt, durch den es m?glich war, ?ber
das Netzwerk einen Denial-of-Service Angriff durchzuf?hren. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:36 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:36.nfs.asc>`__.

Im
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
System wurde ein Fehler beseitigt, durch den ein lokaler Benutzer einen
Systemabsturz herbeif?hren konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:37 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:37.kqueue.asc>`__.

Bei mehrere Systemfunktionen wurden Fehler bei der Pr?fung der Parameter
beseitigt, durch die gr??ere Teile des Kernel-Speichers an den Aufrufer
zur?ckgegeben werden konnten. Weitere Informationen finden Sie in
`FreeBSD-SA-02:38 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:38.signed-error.asc>`__.

In ``libkvm`` wurde ein Fehler beseitigt, durch den Applikationen
ungewollt sch?tzenswerte Datei-Handles nach au?en weiterleiten konnten.
Weitere Informationen finden Sie in
`FreeBSD-SA-02:39 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:39.libkvm.asc>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Benutzerprogramme
~~~~~~~~~~~~~~~~~~~~~~

`biff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=biff&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt die Option b f?r \`\`bell notification'' beim
Eintreffen von neuen Mails, bei dieser Variante wird der Terminal-Inhalt
nicht zerst?rt, wie das bei ``biff y`` passiert.

Wird bei
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
die nicht dem Standard entsprechende Option -n angegeben, fragt es nicht
mehr nach, ob eine Datei ?berschrieben werden soll; die Datei wird in
diesem Fall nicht ?berschrieben.

Mit
`daemon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
steht jetzt ein ?ber die Kommandozeile benutzbares Programm zur Nutzung
von
`daemon(3) <http://www.FreeBSD.org/cgi/man.cgi?query=daemon&sektion=3&manpath=FreeBSD+4.7-RELEASE>`__
zur Verf?gung. Das Programm l?st die Verbindung zum kontrollierenden
Terminal und startet dann das auf der Kommandozeile ?bergebene Programm.
Dadurch k?nnen Sie beliebige Programme als Daemon-Proze? laufen lassen.

Bei Verwendung der neuen Option -S gibt
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
nur die erwartete Gr??e des Dumps aus und beendet sich dann.

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt die Datei ``.pubkey``.

`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt die Option -g, mit der nur der Name des Benutzers aus
der GECOS Information ausgegeben wird.

Bei
`finger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=finger&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann mit den neuen Optionen -4 und -6 eine Adressfamilie f?r Anfragen
?ber das Netzwerk angegeben werden.

Das Programm
`fold(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fold&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt die Optionen -b und -s zum Umbruch an Byte- bzw.
Wortgrenzen.

Bei der Benutzung von
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann jetzt bei IPv4-Verbindungen mit ``epsv4`` zwischen den den neueren
Kommandos EPSV/EPRT und den ?lteren Kommandos PASV/PORT umgeschaltet
werden. Dadurch sollten sich die Probleme l?sen lassen, die bei der
Verwendung von
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
entstehen, falls **IPFilter** oder eine anderer Firewall ohne
Unterst?tzung f?r die neueren Kommandos benutzt wird.

Wird
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
mit der neuen Option -m aufgerufen, k?nnen G?ste existierende Dateien
?ndern, falls die Zugriffsrechte entsprechend gesetzt sind. Dies
erm?glicht es G?sten, unterbrochene Uploads fortzusetzen.

Wird
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
mit der neuen Option -M aufgerufen, k?nnen G?ste keine Verzeichnisse
mehr anlegen.

Wird
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
mit der neuen Option -W aufgerufen, werden FTP-Logins nicht mehr in
`wtmp(5) <http://www.FreeBSD.org/cgi/man.cgi?query=wtmp&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
vermerkt.

Bei
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
k?nnen die untersten 64 Bit jetzt automatisch mit dem Kommando eui64
eingetragen werden, dadurch wird prefix(8) ?berfl?ssig.

Bei
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
ist es mit dem neuen Kommando promisc m?glich, ein Interface in den
Promiscuous Mode zu setzen.

Bei
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
ist es jetzt m?glich, die maximale Anzahl simultaner Verbindungen von
einer bestimmten IP-Adresse zu einem Service zu begrenzen.

Wird
`lock(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lock&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
mit der neuen Option -v aufgerufen, wird zum einen das aktuelle VTY
gesperrt, zum anderen ist es nicht mehr m?glich, auf andere VTYs
umzuschalten, so lange das aktuelle Terminal gesperrt ist. Damit ist es
m?glich, die Konsole von einem einzigen Terminal aus komplett zu
sperren.

Bei
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
gibt es drei neue Optionen: -m listet die Dateien auf einer Seite auf,
-p erzwingt die Ausgabe / hinter einem Verzeichnisnamen, und -x f?hrt
dazu, da? die Dateinamen auf einer Seite formatiert werden.

Wird
`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
mit der neuen (nicht standardisierten) Option -n aufgerufen, wird bei
jede Frage, ob eine Datei ?berschrieben werden soll, immer die Antwort
\`\`no'' angenommen.

Bei
`nice(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nice&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann man jetzt mit -n angeben, mit welcher \`\`niceness'' das
aufgerufene Programm laufen soll.

`od(1) <http://www.FreeBSD.org/cgi/man.cgi?query=od&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt die Optionen -A zur Angabe der Basisadresse der
Eingabe, -N zur Angabe der Anzahl auszugebender Zeichen, -j zur Angabe
der zu ?berspringenden Zeichen, -s um vorzeichenbehaftete Dezimalzahlen
auszugeben und -t zur Festlegung des Ausgabeformates.

`pam\_opie(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opie&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
gibt keine falschen Aufforderungen mehr aus, wenn die Variable
no\_fake\_prompts gesetzt ist.

Das Modul
`pam\_opieaccess(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opieaccess&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
ist jetzt verf?gbar.

`pam\_radius(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_radius&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__,
`pam\_ssh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ssh&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
und
`pam\_tacplus(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_tacplus&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
wurden auf den Stand von FreeBSD -CURRENT vom 3. Juli 2002 gebracht.

`pam\_unix(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_unix&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
wurde auf den Stand von FreeBSD -CURRENT vom 9. M?rz 2002 gebracht
(pre-**OpenPAM**).

Bei
`pwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pwd&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann jetzt mit der Option -L das logische Arbeitsverzeichnis ausgegeben
werden.

Bei
`renice(8) <http://www.FreeBSD.org/cgi/man.cgi?query=renice&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
kann jetzt mit der Option -n angegeben werden, wie stark die Priorit?t
eines Prozesses angehoben werden soll.

Bei
`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann jetzt die Option -i angegeben werden, um Dateien direkt zu ?ndern.

Wird bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
die neue Option -C verwendet, k?nnen existierende Dateien nicht mehr
durch Ein-/Ausgabeumleitung ?berschrieben werden; die neue Option -u
erzeugt eine Fehlermeldung, wenn eine nicht gesetzte Variable expandiert
werden soll.

Bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt das interne Kommando ``cd`` jetzt die Optionen -L und -P zur
Aktivierung des logischen bzw. physikalischen Modus. Standardm??ig ist
der logische Modus aktiviert, dieser Default kann mit der internen
Variable physical ge?ndert werden.

Bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt das interne Kommando ``jobs`` jetzt die beiden Optionen -s
(gibt nur die PID aus) und -l (gibt die PID zus?tzlich aus).

Bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzen die internen Kommandos ``export`` und ``readonly`` jetzt
die Option -p, mit denen ihre Ausgaben auf ein \`\`portables'' Format
umgestellt werden.

Bei
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
ist es nicht mehr m?glich, illegale Ausdr?cke f?r
``command & && command``, ``&& command`` oder ``|| command`` zu
verwenden.

Bei
`split(1) <http://www.FreeBSD.org/cgi/man.cgi?query=split&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
kann mit der neuen Option -a festgelegt werden, wie viele Zeichen f?r
die Extension der Teile verwendet werden sollen.

`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt Kerberos V Authentifizierung.

`tr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tr&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
hat jetzt minimalen Support f?r die Listen ?quivalenter Zeichen, sofern
die jeweilige Locale diese Listen bereitstellt.

Bei
`unexpand(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unexpand&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
k?nnen die Tabulatorpositionen mit der neuen Option -t angegeben werden,
?hnlich wie bei
`expand(1) <http://www.FreeBSD.org/cgi/man.cgi?query=expand&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__.

`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt die Option -S, um das Umschalten zwischen
verschiedenen VTYs zu verhindern.

Bei
`who(1) <http://www.FreeBSD.org/cgi/man.cgi?query=who&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
stehen mehrere neue Optionen zur Verf?gung: -H erzeugt ?berschriften; -T
zeigt die Einstellung f?r
`mesg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mesg&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__;
-m bewirkt die gleiche Ausgabe wie am i; -u zeigt an, wie lange der
Benutzer unt?tig war; -q zeigt die Namen in Spalten an.

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt die Option -I replstr, die es dem Benutzer erlaubt,
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
die von stdin gelesen Daten an einen bestimmten Punkt der Kommandozeile
einf?gen zu lassen. (Die FreeBSD-spezifische Variante -J hat die gleiche
Wirkung, sollte aber nicht mehr verwendet werden).

`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
unterst?tzt jetzt die neue Option -L, um den Start des aufzurufenden
Programmes nach einer Anzahl Zeilen zu erzwingen.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1. Zus?tzliche Software
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**BIND** wurde auf Version 8.3.3 aktualisiert.

**Binutils** wurden auf Version 2.12.1 aktualisiert (um genau zu sein,
auf den Stand vom 20. Juli 2002, also einem Snapshot nach der Release).

**gcc** wurde auf eine Version aus dem GCC 2.95 CVS Archiv vom 20. M?rz
2002 aktualisiert. Diese Version tr?gt die inoffizielle Versionsnummer
2.95.4.

**libpcap** wurde auf Version 0.7.1 aktualisiert.

**Heimdal Kerberos** wurde auf eine pr?-0.5 Zwischenversion mit Stand
29. August 2002 aktualisiert.

Der von NetBSD genutzte FTP Dæmon **lukemftpd** 1.2 beta 1 steht jetzt
als
`lukemftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lukemftpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
zur Verf?gung.

Die von OpenBSD am 26. April 2002 genutzte Version von
`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
wurde importiert.

Die Programmsammlung **OPIE** (einmal verwendbare Pa?w?rter) wurde auf
Version 2.4 aktualisiert.

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

**OpenSSL** wurde auf Version 0.9.6g aktualisiert.

**sendmail** wurde von Version 8.12.3 auf Version 8.12.6 aktualisiert.

Die Version 1.4.5 der **smbfs** Benutzerprogramme wurde importiert.

**GNU tar** wurde auf Version 1.13.25. aktualisiert.

**tcsh** wurde auf Version 6.12 aktualisiert.

**texinfo** wurde auf Version 4.1 aktualisiert.

Die zur Verf?gung gestellte Version der **tcp\_wrappers** enth?lt jetzt
das Hilfsprogramm
`tcpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__.
Dieser wird zwar von einer FreeBSD Standardinstallation nicht ben?tigt,
da
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
diese Funktionalit?t bereits enth?lt; er kann aber f?r
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__-Alternativen
wie z.B. **xinetd** n?tzlich sein.

**tcpdump** wurde auf Version 3.7.1 aktualisiert.

**top** wurde auf Version 3.5b12 aktualisiert.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2. Ports/Packages Collection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Die im Package
```emulators/linux_base`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
enthaltenen Bibliotheken f?r die Linux Emulation entsprechen jetzt den
Bibliotheken von **Red Hat Linux** 7.1.

**XFree86** wurde auf Version 4.2.1 aktualisiert. Diese Version behebt
Sicherheitsprobleme und Fehler aus Version 4.2.0.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. Erzeugung von Releases und Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ein Fehler, durch den bei einer Neuinstallation Dateien in
``/usr/share/examples`` fehlten, wurde behoben.

Es ist jetzt m?glich, eine Release von FreeBSD 5-CURRENT auf einem
FreeBSD 4-STABLE System zu erzeugen, und umgekehrt. Es ist auch m?glich,
Releases f?r eine andere Architektur als die des Host-Systems zu
erzeugen. Details finden Sie in
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7&manpath=FreeBSD+4.7-RELEASE>`__.

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
ftp://ftp.FreeBSD.org/\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
