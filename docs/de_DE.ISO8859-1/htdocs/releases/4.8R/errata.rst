==========================
FreeBSD 4.8-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.8-RELEASE Errata
==========================

.. raw:: html

   <div class="AUTHORGROUP">

Das FreeBSD Projekt
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

Copyright © 2000, 2001, 2002, 2003 The FreeBSD Documentation Project

Copyright © 2001, 2002, 2003 The FreeBSD German Documentation Project

| $FreeBSD$

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    Dieses Dokument enth?lt die Errata f?r FreeBSD 4.8-RELEASE, also
    wichtige Informationen, die erst nach oder zu kurz vor der
    Ver?ffentlichung bekannt wurden und aus diesem Grund nicht in die
    dortige Dokumentation aufgenommen werden konnten. Dazu geh?hren
    Ratschl?ge zur Sicherheit sowie ?nderungen in der Software oder
    Dokumentation, die die Stabilit?t und die Nutzung beeintr?chtigen
    k?nnten. Sie sollten immer die aktuelle Version dieses Dokumentes
    lesen, bevor sie diese Version von FreeBSD installieren.

    Dieses Errata f?r FreeBSD 4.8-RELEASE wird bis zum Erscheinen von
    FreeBSD 4.9.1-RELEASE weiter aktualisiert werden.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einleitung
-------------

Dieses Errata enth?lt \`\`brandhei?e'' Informationen ?ber FreeBSD
4.8-RELEASE. Bevor Sie diese Version installieren, sollten Sie auf jeden
Fall dieses Dokument lesen, um ?ber Probleme informiert zu werden, die
erst nach der Ver?ffentlichung entdeckt (und vielleicht auch schon
behoben) wurden.

Die zusammen mit der Ver?ffentlichung erschienene Version dieses
Dokumentes (zum Beispiel die Version auf der CDROM) ist per Definition
veraltet. Allerdings sind im Internet aktualisierte Versionen verf?gbar,
die die \`\`aktuellen Errata'' f?r diese Version sind. Diese Versionen
sind bei http://www.FreeBSD.org/releases/ und allen aktuellen Mirrors
dieser Webseite verf?gbar.

Die Snapshots von FreeBSD 4-STABLE (sowohl die der Quelltexte als auch
die der ausf?hrbaren Programme) enthalten ebenfalls die zum Zeitpunkt
ihrer Ver?ffentlichung aktuelle Version dieses Dokumentes.

Die Liste der FreeBSD CERT security advisories finden Sie bei
http://www.FreeBSD.org/security/ oder
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Sicherheitshinweise
----------------------

Durch einen Buffer-?berlauf in den von ?lteren **sendmail**-Versionen
genutzten Routinen zum Parsen des Headers war es einen Angreifer m?glich
gewesen, eine speziell konstruierte Nachricht an
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
zu senden und so beliebige Programme ausf?hren zu lassen. Diese
Programme verf?gten ?ber die Rechte des Benutzer, unter dessen Kennung
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
lief, also typischerweise ``root``. Weitere Informationen und Verweise
auf Patches finden Sie in
`FreeBSD-SA-03:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:07.sendmail.asc>`__.
Dieser Fehler wurde in FreeBSD 4.8-RELEASE durch einen vom Hersteller
herausgegebenen Patch und in FreeBSD 4.9-RELEASE durch den Import einer
neuen **sendmail**-Version behoben. Allerdings wurden diese Tatsachen
nicht expilizit in der Dokumentation erw?hnt.

In den Routinen f?r die Funktionen
`realpath(3) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=3&manpath=FreeBSD+4.9-RELEASE>`__
konnte es zu einem Buffer-?berlauf von einem Byte kommen. Es nicht
v?llig klar, welche Auswirkungen dieser Fehler haben kann, dies h?ngt
unter anderem von dem Programm ab, das
`realpath(3) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=3&manpath=FreeBSD+4.9-RELEASE>`__
benutzt. Der Fehler wurde im Sicherheitszweig 4.8-RELEASE und im
Entwicklungszweig 4-STABLE behoben. Weitere Informationen finden Sie in
`FreeBSD-SA-03:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:08.realpath.asc>`__.

Durch einen Fehler im Kernel wurde nicht verhindert, da? der Kernel
versuchte, illegale Signale an Prozesse zu senden. Dadurch konnte es zu
einer Kernel Panic und in einigen F?llen zu einer ungewollten ?nderung
des Kernel-Speichers kommen. Dieser Fehler wurde im Entwicklungszweig
4-STABLE und im Sicherheitszweig 4.8-RELEASE behoben. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:09 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:09.signal.asc>`__.

Durch einen Fehler in der standardm??ig nicht aktivierten iBCS2
Emulation war m?glich, Einblick in den Kernel-Speicher zu erhalten.
Dieser Fehler wurde im Entwicklungszweig 4-STABLE und im
Sicherheitszweig 4.8-RELEASE behoben. Weitere Informationen finden Sie
in
`FreeBSD-SA-03:10 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:10.ibcs2.asc>`__.

Durch einen Programmierfehler konnte es bei der Nutzung der \`\`DNS
maps'' von **sendmail** zu Abst?rzen oder merkw?rdigen Verhalten von
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
kommen. Der Fehler wurde im Sicherheitszweig 4.8-RELEASE durch eine
?nderung in
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
korrigiert; im Entwicklungszweig 4-STABLE wurde er durch den Import
einer neueren **sendmail**-Version behoben. In den
Konfigurationsdateien, die bei FreeBSD mitgelifert werden, werden die
\`\`DNS maps'' NICHT verwendet. Weitere Informationen finden Sie in
`FreeBSD-SA-03:11 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:11.s%20endmail.asc>`__.

**OpenSSH** enth?lt einen Fehler im Bereich der Routinen zum
Buffer-Management, der zu einem Absturz f?hren kann. Dieser Fehler wurde
sowohl im Entwicklungszweig 4-STABLE als auch im Sicherheitszweig
4.8-RELEASE durch einen vom Hersteller bereitgestellten Patch behoben.
Weitere Informationen finden Sie in
`FreeBSD-SA-03:12 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:12.openssh.asc>`__.

**sendmail** enth?lt einen Buffer-?berlauf, der ?ber das Netzwerk
ausgenutzt werden kann. Dieser Fehler wurde im Entwicklungszweig
4-STABLE durch den Import einer neuen Version und im Sicherheitszweig
4.8-RELEASE durch einen vom Hersteller bereitgestellten Patch behoben.
Weitere Informationen finden Sie in
`FreeBSD-SA-03:13 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:13.sendmail.asc>`__.

Die ARP-Routinen in FreeBSD enthielten einen Fehler, durch den der
Kernel alle Ressourcen verbrauchen konnte, dadurch kam es zu einem
Totalabsturz. Dieser Fehler wurde sowohl im Entwicklungszweig 4-STABLE
als auch im Sicherheitszweig 4.8-RELEASE behoben. Weitere Informationen
finden Sie in
`FreeBSD-SA-03:14 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:14.arp.asc>`__.

**OpenSSH** enth?lt diverse Fehler in den Routinen zur Authentifizierung
via PAM, die zu den verschiedensten Symptomen f?hren k?nnen. Diese
Fehler wurden durch vom Hersteller bereitgestellte Patches korrigiert,
weitere Informationen finden Sie in
`FreeBSD-SA-03:15 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:15.openssh.asc>`__.

Die Implementierung der Systemfunktion
`readv(2) <http://www.FreeBSD.org/cgi/man.cgi?query=readv&sektion=2&manpath=FreeBSD+4.9-RELEASE>`__
enthielt einen Fehler, der zum Totalabsturz des Systems f?hren kann. Es
ist auch m?glich, da? ein Anwender durch diesen Fehler
Systemverwalterrechte erhalten kann. Der Fehler wurde sowohl im
Entwicklungszweig 4-STABLE als auch im Sicherheitszweig 4.8-RELEASE
behoben. Weitere Informationen finden Sie in
`FreeBSD-SA-03:16 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:16.filedesc.asc>`__.

Die Implementierung von
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.9-RELEASE>`__
und
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.9-RELEASE>`__
enth?lt einen Fehler, durch den man Einblick in den Kernel-Speicher
erhalten kann. Dieser Fehler wurde sowohl im Entwicklungszweig 4-STABLE
als auch im Sicherheitszweig 4.8-RELEASE behoben. Weitere Informationen
finden Sie in
`FreeBSD-SA-03:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:17.procfs.asc>`__.

**OpenSSL** enth?lt mehrere Fehler, durch die es m?glich ist, eine
**OpenSSL** nutzende Anwendung ?ber das Netz zum Absturz zu bringen oder
sie zur Ausf?hrung beliebiger Programme zu veranlassen, die dann ?ber
alle Rechte der originalen Anwendung verf?gen. Dieser Fehler wurde
sowohl im Entwicklungszweig 4-STABLE als auch im Sicherheitszweig
4.8-RELEASE durch einen vom Hersteller bereitgestellten Patch behoben.
Bitte beachten Sie, da? nur die Programme betroffen sind, die die von
**OpenSSL** bereitgestellten Routinen zur Nutzung von ASN.1 und X.509
verwenden. Zum Beispiel geh?rt **OpenSSH** NICHT zu den betroffenen
Programmen. Weitere Informationen finden Sie in
`FreeBSD-SA-03:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:18.openssl.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktuelle Informationen
-------------------------

Da kurz vor der Ver?ffentlichung noch Fehler in der neuen Version
gefunden wurden, mu?ten die ISO-Images und die Verzeichnisse f?r die
FTP-Installation von 4.8-RELEASE/i386 in letzter Sekunde neu erzeugt und
neu hochgeladen werden. Als Referenz hier die Pr?fsummen der endg?ltigen
ISO-Images, die mit
`md5(1) <http://www.FreeBSD.org/cgi/man.cgi?query=md5&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
ermittelt wurden:

.. code:: PROGRAMLISTING

    MD5 (4.8-RELEASE-i386-disc1.iso) = c4e34b6a6be5cd1977ca206bf821c7fc
    MD5 (4.8-RELEASE-i386-disc2.iso) = 93b09f97c01deead302557d7d24f87cb
    MD5 (4.8-RELEASE-i386-mini.iso) = 5f0d2576dbb56d6ec85d49ac9fa4bbf9

In der Dokumentation wird an einigen Stellen M?rz 2003 als Datum der
Ver?ffentlichung dieser Version genannt, das richtige Datum ist April
2003.

Seit FreeBSD 4.8-RELEASE ist es wieder m?glich, FreeBSD auf Ger?ten zu
installieren, f?r die der Treiber
`mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
ben?tigt wird, dies war seit FreeBSD 4.7-RELEASE nicht mehr m?glich.

Es kann vorkommen, da? der Standard-Zeichensatz f?r Terminal-Fenster
nach der Installation von **GNOME** zerhackt wirkt. Wenn dieser Fall
eintritt, m?ssen Sie den Port ``x11-fonts/bitstream-vera`` installieren
und **GNOME** neu starten. Die neuen Zeichens?tze sollten automatisch
aktiv werden. Wenn das nicht der Fall, m?ssen Sie das Profil f?r
gnome-terminal ?ndern und dort den Zeichensatz Bitstream Vera Sans Mono
w?hlen.

Aus Platzgr?nden wurde der Treiber
`awi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=awi&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
aus dem Kernel entfernt, der auf der 1.44 MByte gro?en Startdiskette
``kern.flp`` f?r i386 verwendet wird. Da es in FreeBSD 4.8-RELEASE kein
Modul f?r diesen Treiber gibt, ist nicht m?glich, FreeBSD ?ber eine
`awi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=awi&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
Netzwerkkarte zu installieren.

Aus Platzgr?nden mu?te die Unterst?tzung f?r ATAPI-Diskettenlaufwerk und
DEC AlphaServer 8200 und 8400 (\`\`TurboLaser'') von der f?r die Alpha
benutzten Startdiskette ``kern.flp`` entfernt werden.

Durch einen Fehler im f?r FreeBSD 4.8-RELEASE verwendeten Kernel ist es
nicht m?glich, diese Version auf Maschinen mit einem Intel 80386
Prozessor zu booten. Dieser Fehler wurde sowohl im f?r
sicherheitsrelevante Korrekturen vorgesehenen Zweig 4.8-RELEASE als auch
im Entwicklungszweig 4-STABLE behoben.

FreeBSD unterst?tzt eine kompilierte Version der Datenbank mit den
Login-Einstellungen, die in ``/etc/login.conf.db`` abgelegt wird. Diese
wird aus dem Inhalt der Textdatei ``/etc/login.conf`` erzeugt. Ist die
kompilierte Version vorhanden, wird sie von
`login(1) <http://www.FreeBSD.org/cgi/man.cgi?query=login&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
an Stelle der Textdatei benutzt. FreeBSD 4.8-RELEASE ist die erste
Version, bei der auf den Installationsmedien die Datei
``/etc/login.conf.db`` mitgeliefert wird. Anwender, die
``/etc/login.conf`` an ihr System anpassen, m?ssen also die kompilierte
Version der Datenbank mit
`cap\_mkdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cap_mkdb&sektion=1&manpath=FreeBSD+4.9-RELEASE>`__
aktualisieren, damit ihre ?nderungen wirksam werden. Anwender, die ?ber
den Sourcecode updaten, sind im Allgemeinen nicht von dieser ?nderung
betroffen, da
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
w?hrend der Aktualisierung anbietet, die kompilierte Version der
Datenbank neu erzeugen zu lassen. Weitere Informationen ?ber das Format
und die Benutzung der Datenbank mit den Login-Einstellungen finden Sie
in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5&manpath=FreeBSD+4.9-RELEASE>`__.

Wird die Ports-Kollektion mit
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.9-RELEASE>`__
installiert, sieht es so aus, als w?re der Name einer der Dateien im
Port ``multimedia/gstreamer-plugins`` abgeschnitten worden. Dies sollte
keine Auswirkungen auf die Benutzung dieses Ports oder die Installation
des entsprechenden Packages haben. Es ist trotzdem sinnvoll, den Namen
dieser Datei zu korrigieren, um Probleme bei einer zuk?nftigen
Aktualisierung der installieren Ports-Kollektion zu vermeiden:

.. code:: SCREEN

    # cd /usr/ports/multimedia/gstreamer-plugins/files
    # mv patch-gst-libs_ext_ffmpeg_ffmpeg_libavcodec_alpha_simple_i \
    patch-gst-libs_ext_ffmpeg_ffmpeg_libavcodec_alpha_simple_idct_alpha.c

Die Mailinglisten werden seit kurzen Zeit nicht mehr mit Majordomo,
sondern mit Mailman verwaltet. Weitere Informationen zur Benutzung der
neuen Mailinglisten finden Sie auf der `FreeBSD Mailman Info
Page <http://www.FreeBSD.org/mailman/listinfo/>`__.

Der Treiber
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.9-RELEASE>`__
arbeitet fehlerhaft, wenn er Daten ?ber eine Davicom DC9102 versenden
soll. Das Problem bestand schon seit FreeBSD 4.5-RELEASE und wurde in
FreeBSD 4.9-RELEASE behoben.

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
