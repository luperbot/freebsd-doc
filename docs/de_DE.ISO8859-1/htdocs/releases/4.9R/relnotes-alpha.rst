=======================================
FreeBSD/alpha 4.9-RELEASE Release Notes
=======================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 4.9-RELEASE Release Notes
=======================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 The FreeBSD Documentation Project

Copyright © 2002, 2003 The FreeBSD German Documentation Project

| $FreeBSD$

.. raw:: html

   <div>

.. raw:: html

   <div class="ABSTRACT">

Die Release Notes f?r FreeBSD 4.9-RELEASE enthalten eine ?bersicht ?ber
alle ?nderungen in FreeBSD seit der Version 4.8-RELEASE. Die Liste
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
1. `Einf?hrung <#INTRO>`__
2. `Neuerungen <#NEW>`__
2.1. `Sicherheit <#SECURITY>`__
2.2. `?nderungen im Kernel <#KERNEL>`__
2.2.1. `Unterst?tzung f?r Prozessoren und Mainboards <#PROC>`__
2.2.2. `?nderungen im Bootloader <#BOOT>`__
2.2.3. `Netzwerke und Netzwerkkarten <#NET-IF>`__
2.2.4. `Netzwerk-Protokolle <#NET-PROTO>`__
2.2.5. `Festplatten und Massenspeicher <#DISKS>`__
2.2.6. `Dateisystem <#FS>`__
2.2.7. `Unterst?tzung f?r PCCARD <#PCCARD>`__
2.2.8. `Multimedia <#MM>`__
2.3. `Benutzerprogramme <#USERLAND>`__
2.4. `Zus?tzliche Software <#CONTRIB>`__
2.5. `Infrastruktur f?r Ports und Packages <#PORTS>`__
2.6. `Erzeugung von Releases und Integration <#RELENG>`__
3. `Aktualisierung einer ?lteren Version von FreeBSD <#UPGRADE>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

1. Einf?hrung
-------------

Dieses Dokument enth?lt die Release Notes f?r FreeBSD 4.9-RELEASE auf
Alpha/AXP Systemen. Es beschreibt die Komponenten von FreeBSD, die seit
4.8-RELEASE hinzugef?gt (oder ge?ndert) wurden. Au?erdem erhalten Sie
Hinweise f?r die Aktualisierung Ihres FreeBSD-Systems.

Diese Distribution von FreeBSD 4.9-RELEASE ist eine release
Distribution. Sie k?nnen Sie von ftp://ftp.FreeBSD.org/ und allen seinen
Mirrors erhalten. Weitere Informationen, wie Sie diese (oder andere)
release Distributionen von FreeBSD erhalten k?nnen, finden Sie im Anhang
`\`\`Bezugsquellen f?r
FreeBSD'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/mirrors.html>`__
des `FreeBSD
Handbuchs <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Neuerungen
-------------

Dieser Abschnitt beschreibt die f?r den Anwender offensichtlichsten
Neuerungen und ?nderungen in FreeBSD seit 4.8-RELEASE. Die Eintr?ge
dokumentieren neue Treiber bzw. Unterst?tzung f?r neue Hardware, neue
Befehle oder Optionen, die Behebung wichtiger Fehler, und
Aktualisierungen von Dritt-Software. Sicherheitshinweise, die nach dem
Erscheinen von 4.8-RELEASE herausgegeben wurden, sind ebenfalls
aufgef?hrt.

.. raw:: html

   <div class="SECT2">

--------------

2.1. Sicherheit
~~~~~~~~~~~~~~~

In **sendmail** wurde ein ?ber das Netzwerk ausnutzbarer Puffer-?berlauf
beseitigt. Weitere Informationen finden Sie in
`FreeBSD-SA-03:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:07.sendmail.asc>`__.
Dieser Fehler wurde in FreeBSD 4.8-RELEASE durch einen vom Hersteller
herausgegebenen Patch und in FreeBSD 4.9-RELEASE durch den Import einer
neuen **sendmail**-Version behoben. Allerdings wurden diese Tatsachen
nicht explizit in der Dokumentation erw?hnt.

In
`realpath(3) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=3&manpath=FreeBSD+4.9-RELEASE>`__
wurde ein Fehler behoben, durch den es zu einem Buffer-?berlauf von
einem Byte kommen konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-03:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:08.realpath.asc>`__.

Durch einen Fehler im Kernel war es m?glich, ihn zur Aussendung
illegaler Signale zu bewegen. Dadurch konnte es zu einer Kernel Panic
kommen. Weitere Informationen finden Sie in
`FreeBSD-SA-03:09 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:09.signal.asc>`__.

In der iBCS2 Emulation wurde ein Fehler behoben, durch den es m?glich
war, Einblick in den Kernel-Speicher zu erhalten. Dieses Modul wird
standardm??ig nicht verwendet. Weitere Informationen finden Sie in
`FreeBSD-SA-03:10 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:10.ibcs2.asc>`__.

Ein Programmierfehler in den \`\`DNS maps'' von **sendmail** wurde durch
den Import einer neueren **sendmail**-Version behoben. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:11 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:11.sendmail.asc>`__.
In den Konfigurationsdateien, die bei FreeBSD mitgelifert werden, werden
die \`\`DNS maps'' NICHT verwendet.

In den Routinen zum Buffer-Management innerhalb von **OpenSSH** wurde
ein Fehler behoben, der zu einem Absturz f?hren kann. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:12 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:12.openssh.asc>`__.

In **sendmail** wurde ein Buffer-?berlauf beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:13 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:13.sendmail.asc>`__.

In den Kernel-Routinen f?r den ARP Cache wurde ein Fehler beseitigt, der
zum Verbrauch aller Ressourcen und dadurch zum Komplettabsturz f?hren
konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-03:14 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:14.arp.asc>`__.

Innerhalb der Routinen f?r PAM challenge/response Authentifizierung von
**OpenSSH** wurden diverse Fehler korrigiert. Details und Informationen
?ber die Auswirkungen der Fehler finden Sie in
`FreeBSD-SA-03:15 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:15.openssh.asc>`__.

In der Systemfunktion
`readv(2) <http://www.FreeBSD.org/cgi/man.cgi?query=readv&sektion=2&manpath=FreeBSD+4.9-RELEASE>`__
wurde einen Fehler behoben, der zum Totalabsturz des Systems f?hren
konnte. Es war auch m?glich, da? ein Anwender durch diesen Fehler
Systemverwalterrechte erhalten konnte. Weitere Informationen finden Sie
in
`FreeBSD-SA-03:16 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:16.filedesc.asc>`__.

In
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.9-RELEASE>`__
und
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.9-RELEASE>`__
wurde ein Fehler beseitigt, durch den man Einblick in den Speicher des
Kernels erhalten konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-03:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:17.procfs.asc>`__.

In **OpenSSL** wurden vier Fehler beseitigt, durch die ein Angreifer ein
**OpenSSL** nutzendes Programm abst?rzen lassen und/oder beliebige
Programme mit den Rechten einer auf **OpenSSL** aufsetzenden Anwendung
ausf?hren konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-03:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:18.openssl.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. ?nderungen im Kernel
~~~~~~~~~~~~~~~~~~~~~~~~~

Der neue Treiber
`hifn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=hifn&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
unterst?tzt symmetrische Verschl?sselung auf Basis der 7955 und 7966
Chips?tze.

.. raw:: html

   <div class="SECT3">

--------------

2.2.1. Unterst?tzung f?r Prozessoren und Mainboards
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

Der Treiber
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
unterst?tzt jetzt auch Gigabit-Ethernetkarten auf Basis des Broadcom
5705 Chipsatzes.

Im Treiber
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
wurde ein Fehler beim Versand von Paketen ?ber Netzwerkkarten mit
Davicom DC9102 Chipsatz beseitigt.

Der neue Treiber proatm unterst?tzt ProATM-Karten der Firma ProSum auf
Basis des IDT77252 Chipsatzes. Dieser Treiber entspricht dem
patm-Treiber in FreeBSD-CURRENT.

Der Treiber
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
unterst?tzt jetzt auch Gigabit Ethernet Karten auf Basis der Chips?tze
SK-9521 V2.0 und 3COM 3C940.

Der Treiber
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
unterst?tzt Suspend und Resume jetzt auch, wenn die zugeh?rige
Schnittstelle nicht aktiv (down) ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.4. Netzwerk-Protokolle
^^^^^^^^^^^^^^^^^^^^^^^^^^

In den Routinen zur Auswertung von
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
limit Regeln wurde ein Fehler beseitigt, der zu diversen Abst?rzen
f?hren konnte.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
versteht jetzt mit Kommata separierte Adre?listen (wie z.B. 1.2.3.4,
5.6.7.8/30, 9.10.11.12/22) und erlaubt die Verwendung eines Leerzeichens
hinter dem Komma, um die Listen besser lesbar zu machen.

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
versteht jetzt Kommentare im C++-Stil. Die Kommentare werden zusammen
mit den jeweiligen Regeln gespeichert und bei
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
show angezeigt.

`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
erlaubt jetzt die ?nderung des
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Regelsatzes 31, der bisher nicht ver?ndert werden konnte und f?r die
Standardregeln genutzt wurde. Dieser Regelsatz kann jetzt mit
``ipfw delete set 31`` gel?scht werden, das normale ``ipfw flush``
l?scht ihn allerdings nicht. Durch diese ?nderung wird es einfacher,
\`\`persistente Regeln'' einzurichten. Weitere Informationen finden Sie
in
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__.

Der Kernel unterst?tzt jetzt Protocol Independent Multicast Routing.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.5. Festplatten und Massenspeicher
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der Treiber
`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
versucht nicht mehr, 6 Byte lange Befehle an USB- und Firewire-Ger?te zu
verschicken. Die Ausnahmeregeln (quirks) f?r USB-Ger?te sollten jetzt
?berfl?ssig sein und wurden deaktiviert. Um sie zu reaktivieren, mu? in
der Konfigurationsdatei f?r den angepa?ten Kernel die Zeile options
DA\_OLD\_QUIRKS stehen.

Der Treiber
`twe(4) <http://www.FreeBSD.org/cgi/man.cgi?query=twe&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
unterst?tzt jetzt das generische ABI von 3ware.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.6. Dateisystem
^^^^^^^^^^^^^^^^^^

Mit der neuen Kernel-Option DIRECTIO ist es m?glich, Daten direkt (unter
Umgehung des Buffer Cache im Kernel) in den Speicherbereich eines
Programms zu lesen. Um diese Erweiterung nutzen zu k?nnen, mu? bei dem
entsprechenden Dateideskriptor das Flag O\_DIRECT gesetzt sein, au?erdem
m?ssen sowohl der Offset als auch die L?nge der Leseoperation ein
ganzzahliges Vielfaches der physikalischen Sektorgr??e sein.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.7. Unterst?tzung f?r PCCARD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

2.2.8. Multimedia
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

Bei
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
kann man mit der neuen Option -i die Ausgabe der Anzeigeoperationen auf
die ARP-Eintr?ge eines einzigen Interfaces begrenzen. Die Erweiterung
ist speziell f?r Router mit vielen Netzwerk-Interfaces gedacht.

Bei
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
k?nnen jetzt mit den neuen Optionen -u, -g und -G der Benutzer, die
prim?re Gruppe und die Liste der Gruppen gesetzt werden, die innerhalb
der chroot-Umgebung genutzt werden sollen.

Bei
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
list und show kann man jetzt Bereiche angeben.

Bei
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
kann jetzt mit der neuen Option -n die Syntax eines Kommandos getestet
werden, ohne ?nderungen an den aktiven Regeln vorzunehmen.

Bei
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
kann jetzt mit der neuen Option -M die maximale Berechtigung f?r
Verzeichnisse angegeben werden.

`systat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=systat&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
zeigt jetzt auch IPv6 und ICMPv6 Datenpakete an.

Der neue Parameter -r von
`uudecode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uudecode&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
und
`b64decode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=b64decode&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
erlaubt es, auch unvollst?ndige oder defekte Dateien zu bearbeiten, bei
denen der Vorspann oder auch die letzten Zeilen fehlen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.4. Zus?tzliche Software
~~~~~~~~~~~~~~~~~~~~~~~~~

**groff** wurde von Version 1.18.1 auf Version 1.19 aktualisiert.

**lukemftp** wurde von der Version 1.2beta1 auf eine Zwischenversion vom
5. Januar 2003 aktualisiert.

**OpenSSL** wurde von der Version 0.9.7a auf die Version 0.9.7c
aktualisiert.

**sendmail** steht jetzt in der Version 8.12.9 zur Verf?gung.

**texinfo** wurde von Version 4.5 auf Version 4.6 aktualisiert.

Die Datenbank der Zeitzonen wurde von der Version ``tzdata2003a`` auf
die Version ``tzdata2003d`` aktualisiert.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.5. Infrastruktur f?r Ports und Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bei
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
kann jetzt mit -C eine Liste von Packages definiert werden, die nicht zu
diesem Package kompatibel sind. Ist eines dieser Pakete bereits
installiert, weigert sich
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__,
das Paket zu installieren. Wenn das Paket trotzdem installiert werden
soll, mu?
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
mit dem Parameter -f aufgerufen werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.6. Erzeugung von Releases und Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**GNOME** wurde von Version 2.2 auf Version 2.4 aktualisiert.

**KDE** wurde von Version 3.1 auf Version 3.1.4 aktualisiert.

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
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__.
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
   Informationen zu diesem Thema finden Sie im Kapitel `\`\`Bau mit
   ``make world``'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/makeworld.html>`__
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

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
