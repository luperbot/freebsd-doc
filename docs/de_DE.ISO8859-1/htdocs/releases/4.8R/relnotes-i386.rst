======================================
FreeBSD/i386 4.8-RELEASE Release Notes
======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/i386 4.8-RELEASE Release Notes
======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 von The FreeBSD Documentation Project

Copyright © 2002, 2003 von The FreeBSD German Documentation Project

| $FreeBSD$

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Die Release Notes f?r FreeBSD 4.8-RELEASE enthalten eine ?bersicht ?ber
alle ?nderungen in FreeBSD seit der Version 4.7-RELEASE. Die Liste
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
1. `Einf?hrung <#AEN18>`__
2. `Neuerungen <#AEN26>`__
2.1. `?nderungen im Kernel <#KERNEL>`__
2.1.1. `Unterst?tzung f?r Prozessoren und Mainboards <#AEN54>`__
2.1.2. `?nderungen im Bootloader <#AEN62>`__
2.1.3. `Netzwerke und Netzwerkkarten <#AEN65>`__
2.1.4. `Netzwerk-Protokolle <#AEN75>`__
2.1.5. `Festplatten und Massenspeicher <#AEN100>`__
2.1.6. `Dateisystem <#AEN132>`__
2.1.7. `Unterst?tzung f?r PCCARD <#AEN135>`__
2.1.8. `Multimedia <#AEN138>`__
2.1.9. `Zus?tzliche Software <#AEN141>`__
2.2. `Sicherheit <#SECURITY>`__
2.3. `Benutzerprogramme <#USERLAND>`__
2.3.1. `Zus?tzliche Software <#AEN305>`__
2.3.2. `Infrastruktur f?r Ports und Packages <#AEN337>`__
2.4. `Erzeugung von Releases und Integration <#AEN342>`__
3. `Aktualisierung einer ?lteren Version von FreeBSD <#AEN350>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einf?hrung
=============

Dieses Dokument enth?lt die Release Notes f?r FreeBSD 4.8-RELEASE auf
i386 Systemen. Es beschreibt die Komponenten von FreeBSD, die seit
4.7-RELEASE hinzugef?gt (oder ge?ndert) wurden. Au?erdem erhalten Sie
Hinweise f?r die Aktualisierung Ihres FreeBSD-Systems.

Diese Distribution von FreeBSD 4.8-RELEASE ist eine release
Distribution. Sie k?nnen Sie von ftp://ftp.FreeBSD.org/ und allen seinen
Mirrors erhalten. Weitere Informationen, wie Sie diese (oder andere)
release Distributionen von FreeBSD erhalten k?nnen, finden Sie im Anhang
`\`\`Obtaining
FreeBSD'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/mirrors.html>`__
des `FreeBSD
Handbuchs <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Neuerungen
=============

Dieser Abschnitt beschreibt die f?r den Anwender offensichtlichsten
Neuerungen und ?nderungen in FreeBSD seit 4.7-RELEASE. Die Eintr?ge
dokumentieren neue Treiber bzw. Unterst?tzung f?r neue Hardware, neue
Befehle oder Optionen, die Behebung wichtiger Fehler, und
Aktualisierungen von Dritt-Software. Sicherheitshinweise, die nach dem
Erscheinen von 4.7-RELEASE herausgegeben wurden, sind ebenfalls
aufgef?hrt.

.. raw:: html

   <div class="SECT2">

--------------

2.1. ?nderungen im Kernel
-------------------------

Der Kernel wurde um eine von OpenBSD stammende Crypto-Infrastruktur
erg?nzt (siehe
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
und
`crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9&manpath=FreeBSD+4.8-RELEASE>`__).
Sie stellt dem Kernel eine konsistente Schnittstelle zu Hardware- und
Software-Varianten von Verschl?sselungsalgorithmen zur Verf?gung,
Benutzerprogramme erhalten Zugriff auf Verschl?sselungs-Hardware.
Treiber f?r Karten auf Basis von hifn
(`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__)
und Braodcom
(`ubsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubsec&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__)
stehen zur Verf?gung.

Es gibt jetzt minimale Unterst?tzung f?r Ger?te mit
FireWire-Schnittstellen (siehe
`firewire(4) <http://www.FreeBSD.org/cgi/man.cgi?query=firewire&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__).

Der neue Treiber ubsa unterst?tzt den Belkin F5U103 USB-nach-seriell
Konverter und kompatible Ger?te.

Der neue Treiber
`uftdi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uftdi&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
unterst?tzt USB nach Seriell Konverter von FTDI.

.. raw:: html

   <div class="SECT3">

--------------

2.1.1. Unterst?tzung f?r Prozessoren und Mainboards
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FreeBSD hat jetzt minimale Unterst?tzung f?r HyperThreading (HTT). SMP
Kernel, die mit der Option ``HTT`` erzeugt wurden, erkennen und
aktivieren die logischen Prozessoren auf HTT-Systemen. Die logischen
Prozessoren werden vom Scheduler wie zus?tzliche physikalische
Prozessoren behandelt.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.2. ?nderungen im Bootloader
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.3. Netzwerke und Netzwerkkarten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Der Treiber cm unterst?tzt jetzt IPX.

Der Treiber
`nge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=nge&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
unterst?tzt jetzt auch
`polling(4) <http://www.FreeBSD.org/cgi/man.cgi?query=polling&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.4. Netzwerk-Protokolle
~~~~~~~~~~~~~~~~~~~~~~~~~~

Wird in der Konfigurationsdatei f?r den angepa?ten die Option
``FAST_IPSEC`` verwendet, nutzt IPsec die
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__-Infrastruktur
des Kernels, inklusive der Unterst?tzung f?r Hardware-Verschl?sselung.
Weitere Informationen finden Sie in der Onlinehilfe zu
`fast\_ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=fast_ipsec&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Die gleichzeitige Verwendung von ``FAST_IPSEC`` und
    ``IPSEC`` ist nicht m?glich.

.. raw:: html

   </div>

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Zur Zeit kann ``FAST_IPSEC`` nicht zusammen mit IPv6
    oder der Option ``INET6`` verwendet werden.

.. raw:: html

   </div>

Der neue Treiber
`gre(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gre&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
unterst?tzt die Encapsulation von IP Paketen mt GRE (RFC 1701) und die
minimale IP Encapsulation f?r Mobile IP (RFC 2004).

In TCP NewReno wurde ein Fehler behoben, durch den der \`\`Fast
Recovery'' Modus zu fr?h beendet wurde, falls NewReno aktiviert war.

Die Routinen zum Zusammensetzen von fragmentierten IP-Paketen arbeiten
jetzt besser, wenn eine gro?e Anzahl Fragmente empfangen wird. Ziel der
?nderung war, eine bessere Resistenz gegen Denial-of-Service Angriffe
mit Paket-Fragmenten zu erreichen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.5. Festplatten und Massenspeicher
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
erlaubt es jetzt, ?ber die CAM-Schicht und -Treiber
(`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__,
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__,
`st(4) <http://www.FreeBSD.org/cgi/man.cgi?query=st&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
und
`pass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pass&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__)
auf ATA Ger?te zuzugreifen, und emuliert so SCSI-Ger?te. Um diese
M?glichkeit nutzen zu k?nnen, mu? in der Konfigurationsdatei f?r den
Kernel die Anweisung ``device atapicam`` stehen. Weitergehende
Informationen finden Sie in
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__.

Der Treiber
`matcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=matcd&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
wurde entfernt, weil es rechtliche Bedenken wegen der Lizenzbestimmungen
gab. Dieses Problem wird zur Zeit diskutiert und es ist denkbar, da? der
Treiber in einer sp?ter erscheinenden FreeBSD-Version wieder vef?gbar
sein wird. Der Treiber wurde schon in 4.7-RELEASE entfernt, diese
Information wurde aber versehentlich nicht in den Release Notes erw?hnt.

Der Treiber
`targ(4) <http://www.FreeBSD.org/cgi/man.cgi?query=targ&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
wurde komplett neu geschrieben. In ``/usr/share/examples/scsi_target``
steht jetzt ein neuer Benutzer-Modus zur Verf?gung, der ein Ger?t mit
direkten Zugriff emuliert.

Der neue Treiber trm unterst?tzt SCSI-Controller auf Basis des Tekram
TRM-S1040 SCSI Chipsatzes.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.6. Dateisystem
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.7. Unterst?tzung f?r PCCARD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.8. Multimedia
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.1.9. Zus?tzliche Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~

**IPFilter** steht jetzt in der Version 3.4.31 zur Verf?gung.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. Sicherheit
---------------

In kadmind(8) und k5admin wurden Puffer-?berl?ufe beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:40 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:40.kadmind.asc>`__.

Diverse kritische Fehler in **BIND** wurden korrigiert, weitere
Informationen finden Sie in
`FreeBSD-SA-02:43 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:43.bind.asc>`__.

In der Systemfunktion
`fpathconf(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fpathconf&sektion=2&manpath=FreeBSD+4.8-RELEASE>`__
wurde ein Fehler (Verlust von Datei-Handles) beseitigt, durch den ein
lokaler Benutzer das System zum Absturz bringen oder h?here Privilegien
erhalten konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:44 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:44.filedesc.asc>`__.

Ein ?ber das Netzwerk ausnutzbarer Fehler in **CVS** k?nnte dazu f?hren,
da? ein Angreifer beliebige Programme auf dem CVS Server ausf?hren kann.
Weitere Informationen finden Sie in
`FreeBSD-SA-03:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:01.cvs.asc>`__.

Durch Auswertung der Antwortzeiten von **OpenSSL** w?re es einem
Angreifer mit sehr viel Rechenleistung m?glich gewesen, unter bestimmten
Umst?nden den Klartext der ?bermittelten Daten zu erhalten. Dieser
Fehler durch die neue **OpenSSL** Version 0.9.7 behoben. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:02.openssl.asc>`__.

Die Sicherheit und Leistung der Erweiterung \`\`syncookies'' wurde
verbessert, damit Angreifer es schwerer haben, eine Verbindung zu
f?lschen. Weitere Informationen finden Sie in
`FreeBSD-SA-03:03 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:03.syncookies.asc>`__.

Ein ?ber das Netzwerk ausnutzbaren Puffer-?berlauf in **sendmail** wurde
durch die Aktualisierung von **sendmail** auf Version 8.12.8 behoben.
Weitere Information finden Sie in
`FreeBSD-SA-03:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:04.sendmail.asc>`__.

In der XDR-Implementation wurde ein Fehler behoben, der es einem
Angreifer m?glich machte, den Dienst abst?rzen zu lassen. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:05.xdr.asc>`__.

In **OpenSSL** wurden zwei vor kurzem ver?ffentlichte Schwachstellen
repariert. Weitere Informationen finden Sie in
`FreeBSD-SA-03:06 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:06.openssl.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.3. Benutzerprogramme
----------------------

Bei
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
kann bei ``-s`` jetzt der Wert ``max`` angegeben werden, um die maximal
m?gliche Geschwindigkeit zu nutzen.

Bei
`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
kann jetzt die Geschwindigkeit des CD-ROM-Zugriffs mit dem Kommando
``speed`` eingestellt werden. Wird der Wert ``max`` angegeben, wird die
h?chste m?gliche Geschwindigkeit verwendet.

Die Distribution ``compat4x`` enth?lt jetzt die in FreeBSD 4.7-RELEASE
enthaltenen Versionen der Bibliotheken ``libcrypto.so.2``,
``libgmp.so.3`` und ``libssl.so.2``.

Wird
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
mit der neuen Option ``-h`` aufgerufen, werden in den Server-Meldungen
keine Informationen ?ber das System (wie die
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
Versionsnummer oder der Systemname) angegeben.

Bei
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
kann jetzt mit der neuen Option ``-P`` angegeben werden, auf welchem
Port eingehende Verbindungen erwartet werden sollen. Die Portnummer f?r
den Daten-Port ist nicht mehr hart verdraht, sondern immer eins kleiner
als die des Ports f?r die Kommandos.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
unterst?tzt jetzt eine erweiterte Version der Datei ``/etc/ftpchroot``.
Weitere Informationen finden Sie in der ebenfalls neuen Online-Hilfe zu
`ftpchroot(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpchroot&sektion=5&manpath=FreeBSD+4.8-RELEASE>`__.

`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
unterst?tzt jetzt ein erweitertes Format f?r die Namen der
Home-Verzeichnis, das gleichzeitig ein Startverzeichnis f?r
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+4.8-RELEASE>`__
definiert; dieses Verzeichnis wird dann als Startpunkt f?r eine
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2&manpath=FreeBSD+4.8-RELEASE>`__-Umgebung
genutzt. Zu diesem Zweck wird die Sequenz ``/./`` genutzt, die auch von
anderen FTP-Servern f?r diesen Zweck genutzt wird. Diese Sequenz kann
sowohl in
`ftpchroot(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpchroot&sektion=5&manpath=FreeBSD+4.8-RELEASE>`__
als auch in
`passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5&manpath=FreeBSD+4.8-RELEASE>`__
genutzt werden.

Das neue Programm
`fwcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fwcontrol&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
ist ein Hilfsmittel zum Zugriff auf und die Kontrolle des
FireWire-Subsystems.

Mit dem neuen Hilfsprogramm
`getconf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getconf&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
k?nnen die Werte der in POSIX und X/Open angegebenen Variablen f?r die
Pfad- und Systemkonfiguration ausgegeben werden.

Die neuen
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__-Befehle
``enable`` und ``disable`` k?nnen zur Kontrolle verschiedener Aspekte
der
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__-Funktionalit?t
genutzt werden, bis hin zur Aktivierung und Deaktivierung der gesamten
Firewall. Im Vergleich mit den bereits existierenden sysctl-Variablen
ist dieses Interface einfacher zu bedienen und besser zug?nglich.

Wird
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
mit der neuen Option ``-C`` aufgerufen, wechselt es in das angegebene
Verzeichnis, bevor es mit der Arbeit beginnt.

Wird
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
mit der neuen Option ``-c`` aufgerufen, ruft es f?r UDP Mount Points
nicht mehr
`connect(2) <http://www.FreeBSD.org/cgi/man.cgi?query=connect&sektion=2&manpath=FreeBSD+4.8-RELEASE>`__
auf. Diese Option mu? gesetzt sein, wenn ein Server die Antworten nicht
vom Standardport 2049 verschickt oder die Antworten von einer anderen
IP-Adresse verschickt (dies kann bei Systemen mit mehreren
Netzwerkkarten auftreten). Wird die Sysctl-Variable
``vfs.nfs.nfs_ip_paranoia`` auf ``0`` gesetzt, ist diese Option
standardm??ig aktiv.

Wird bei
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
bei einem Eintrag (bzw. einer Gruppe von Eintr?gen, bei denen die Option
``G`` gesetzt ist) die neue Option ``W`` angeben, wird das Programm zur
Kompression des Logfiles erst gestartet, wenn er die vorher gestarteten
Packprogramme durchgelaufen sind. Dadurch soll verhindert werden, da?
Systeme durch die gleichzeitige Kompression mehrerer gro?er Logfiles
?berlastet werden.

Mit dem neuen Programm
`pathchk(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pathchk&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
k?nnen Pfadangaben auf ihre G?ltigkeit und Portabilit?t zwischen
POSIX-Systemen gepr?ft werden.

`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
kann jetzt auch User anlegen, deren Namen mit dem Zeichen ``$`` endet,
diese ?nderung dient zur Vereinfachung der Administration von **Samba**
Servern.

Bei
`rarpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rarpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
kann jetzt mit ``-t`` ein Verzeichnis angegeben werden, das statt
``/tftpboot`` genutzt wird.

Die Base64-Unterst?tzung von
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
und
`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
wird jetzt automatisch aktiviert, wenn die Programme als
`b64encode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64encode&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
bzw.
`b64decode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64decode&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
aufgerufen werden.

Die Definitionen von ``stdin``, ``stdout`` und ``stderr`` wurden
ge?ndert, um die bisher f?r die Compilierung notwendigen Konstanten
?berfl?ssig zu machen. Einige ?ltere Programme brauchen deswegen evtl.
neuere Versionen 3.X-Kompatibilit?tsbibliotheken. Um diese erzeugen,
m?ssen Sie bei einem buildword/installword ``COMPAT3X=yes`` setzen.

.. raw:: html

   <div class="SECT3">

--------------

2.3.1. Zus?tzliche Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~

**BIND** steht jetzt in der Version 8.3.4 zur Verf?gung.

Alle Anwendungen aus dem **bzip2** Paket sind jetzt im Basissystem
verf?gbar (dies betrifft speziell ``bzip2recover``, das jetzt erzeugt
und installiert wird).

**CVS** ist jetzt in der Version 1.11.5 verf?gbar.

**FILE** steht jetzt in der Version 3.41 zur Verf?gung.

**groff** und die dazu geh?renden Programme sind jetzt in der FSF
Version 1.18.1 verf?gbar.

**Heimdahl Kerberos** ist jetzt in der Version 0.5.1 verf?gbar.

Der **ISC DHCP** Client steht jetzt in der Version 3.0.1RC11 zur
Verf?gung.

**libz** steht jetzt in der Version 1.1.4 zur Verf?gung.

**OpenSSH** steht jetzt in der Version 3.5p1 zur Verf?gung.

**OpenSSL** steht jetzt in der Version 0.9.7a zur Verf?gung. Die
wichtigsten Neuerungen sind die Unterst?tzung f?r AES und
`crypto(4) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
Ger?te.

**sendmail** steht jetzt in der Version 8.12.8 zur Verf?gung.

**tcpdump** steht jetzt in der Version 3.7.2 zur Verf?gung.

Die Datenbank mit den Zeitzonen steht jetzt in der Version
``tzdata2002d`` zur Verf?gung.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.3.2. Infrastruktur f?r Ports und Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die nur eine Zeile langen ``pkg-comment`` Dateien wurden aus allen Ports
entfernt und in das ``Makefile`` des jeweiligen Ports integriert.
Dadurch sinken die Plattenbelegung und der Inode-Verbrauch der
Ports-Sammlung erheblich.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. Erzeugung von Releases und Integration
-------------------------------------------

**GNOME** steht jetzt in der Version 2.2 zur Verf?gung.

**KDE** steht jetzt in der Version 3.1 zur Verf?gung.

**XFree86** steht jetzt in der Version 4.3.0 zur Verf?gung.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktualisierung einer ?lteren Version von FreeBSD
===================================================

Wenn Sie eine ?ltere Version von FreeBSD aktualisieren wollen, haben Sie
drei M?glichkeiten:

-  Die bin?re Aktualisierung mit
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__.
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
   ``make             world``'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/makeworld.html>`__
   des `FreeBSD
   Handbuchs <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__.
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
-STABLE'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/current-stable.html>`__
im `FreeBSD
Handbuch <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__
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

Alle Anwender von FreeBSD 4-STABLE sollten sich in die Mailingliste
<stable@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
