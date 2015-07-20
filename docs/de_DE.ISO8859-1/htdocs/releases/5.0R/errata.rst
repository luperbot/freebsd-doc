==========================
FreeBSD 5.0-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.0-RELEASE Errata
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

    Dieses Dokument enth?lt die Errata f?r FreeBSD 5.0-RELEASE, also
    wichtige Informationen, die kurz vor bzw. erst nach der
    Ver?ffentlichung bekannt wurden. Dazu geh?ren Ratschl?ge zur
    Sicherheit sowie ?nderungen in der Software oder Dokumentation,
    welche die Stabilit?t und die Nutzung beeintr?chtigen k?nnten. Sie
    sollten immer die aktuelle Version dieses Dokumentes lesen, bevor
    sie diese Version von FreeBSD installieren.

    Diese Errata f?r FreeBSD 5.0-RELEASE werden bis zum Erscheinen von
    FreeBSD 5.1-RELEASE weiter aktualisiert werden.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einleitung
-------------

Diese Errata enthalten \`\`brandhei?e'' Informationen ?ber FreeBSD
5.0-RELEASE. Bevor Sie diese Version installieren, sollten Sie auf jeden
Fall dieses Dokument lesen, um ?ber Probleme informiert zu werden, die
erst nach der Ver?ffentlichung entdeckt (und vielleicht auch schon
behoben) wurden.

Die zusammen mit der Ver?ffentlichung erschienene Version dieses
Dokumentes (zum Beispiel die Version auf der CDROM) ist per Definition
veraltet. Allerdings sind im Internet aktualisierte Versionen verf?gbar,
die die \`\`aktuellen Errata'' f?r diese Version sind. Diese Versionen
sind bei http://www.FreeBSD.org/releases/ und allen aktuellen Mirrors
dieser Webseite verf?gbar.

Die Snapshots von FreeBSD 5-CURRENT (sowohl die der Quelltexte als auch
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

Ein ?ber das Netzwerk nutzbarer Fehler in **CVS** k?nnte dazu f?hren,
da? ein Angreifer beliebige Programme auf dem CVS Server ausf?hren kann.
Weitere Informationen finden Sie in
`FreeBSD-SA-03:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:01.cvs.asc>`__.

Durch Auswertung der Antwortzeiten von **OpenSSL** w?re es einem
Angreifer mit sehr viel Rechenleistung m?glich gewesen, unter bestimmten
Umst?nden den Klartext der ?bermittelten Daten zu erhalten. Dieser
Fehler wurde in FreeBSD 5.1-RELEASE durch die neue **OpenSSL** Version
0.9.7 behoben. Auf den f?r Sicherheitsprobleme unterst?tzten
Entwicklungszweigen wurde der Fehler durch die neue **OpenSSL** Version
0.9.6i behoben. Weitere Informationen finden Sie in
`FreeBSD-SA-03:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:02.openssl.asc>`__

Es ist theoretisch m?glich, da? ein Angreifer den geheimen Schl?ssel
ermittelt, der von der Erweiterung \`\`syncookies'' genutzt wird.
Dadurch sinkt deren Effektivit?t beim Schutz vor TCP SYN Flood
Denial-of-Service Angriffen. Hinweise, wie sie das Problem umgehen
k?nnen und weitere Informationen finden Sie in
`FreeBSD-SA-03:03 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:03.syncookies.asc>`__.

Durch diverse Puffer-?berl?ufe in den von **sendmail** genutzten
Routinen zum Parsen des Headers war es einen Angreifer m?glich, eine
speziell konstruierte Nachricht an
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+5.1-release>`__
zu senden und so beliebige Programme ausf?hren zu lassen. Diese
Programme verf?gten ?ber die Rechte des Benutzers, unter dessen Kennung
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+5.1-release>`__
lief, also typischerweise ``root``. Weitere Informationen und Verweise
auf Patches finden Sie in
`FreeBSD-SA-03:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:04.sendmail.asc>`__
und
`FreeBSD-SA-03:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:07.sendmail.asc>`__.

Durch einen Puffer-?berlauf im XDR Kodierer/Dekodierer war es einem
Angreifer m?glich, den Service zum Absturz zu bringen. Informationen,
wie Sie den Fehler beheben, finden Sie in
`FreeBSD-SA-03:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:05.xdr.asc>`__.

**OpenSSL** enth?lt zwei Schwachstellen, die erst vor kurzer Zeit
bekannt gemacht wurden. Informationen, wie Sie die Probleme umgehen
k?nnen und weitere Informationen finden Sie in
`FreeBSD-SA-03:06 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:06.openssl.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktuelle Informationen
-------------------------

GEOM
^^^^

Die auf
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.1-release>`__
basierenden Routinen des Kernel zur Partitionierung erlauben es nicht,
eine aktive Partition zu ?berschreiben. Mit anderen Worten, es ist in
der Regel nicht m?glich, den Bootsektor einer Festplatte mit
``disklabel -B`` zu aktualisieren, da die Partition a auch den Bereich
enth?lt, in dem die Bootsektoren gespeichert sind. Um dieses Problem zu
umgehen, sollten Sie von einer anderen Platte, einer CD oder der
Fixit-Diskette booten.

\ `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.1-release>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Werden Festplatten und ?hnliche Medien mit einer Blockgr??e von mehr als
512 Byte benutzt (zum Beispiel mit
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.1-release>`__
verschl?sselte Partitionen), behandelt
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.1-release>`__
die gr??eren Sektoren nicht korrekt und kann daher das Dateisystem nicht
dumpen. Eine M?glichkeit, das Problem zu umgehen, ist die Erzeugung
einer \`\`rohen'' Kopie des gesamten Dateisystems, die dann als
Eingabedatei f?r
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.1-release>`__
dient. Es ist m?glich, ein komplettes Dateisystem in einer normalen
Datei zu speichern:

.. code:: SCREEN

    # dd if=/dev/ad0s1d.bde of=/junk/ad0.dd bs=1m
    # dump 0f - /junk/ad0.dd | ...

Eine etwas einfachere L?sung ist,
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+5.1-release>`__
oder
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+5.1-release>`__
zur Erzeugung des Backups zu verwende.

\ `mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+5.1-release>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Es gibt Berichte, da? sich Systeme bei der Installation von FreeBSD 5.0
Snapshots auf RAIDs an
`mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+5.1-release>`__-kompatiblen
Controller aufgeh?ngt haben, obwohl die Systeme problemlos mit
4.7-RELEASE zusammenarbeiten. Dieser Fehler wurde in FreeBSD 5.1-RELEASE
bereits behoben.

NETNCP/Unterst?tzung des Dateisystems
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

NETNCP und nwfs sind offenbar noch nicht an KSE angepa?t worden und
funktionieren daher nicht. Dieser Fehler wurde in FreeBSD 5.1-RELEASE
bereits behoben.

\ `iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+5.1-release>`__ Controller
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Bei der Installation scheinen
`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+5.1-release>`__-Controller
korrekt erkannt zu werden, allerdings finden Sie keine der
angeschlossenen Festplatten.

Timing-Probleme in `truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.1-release>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Es scheint ein Timing-Problem beim Start des Debuggings mit
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.1-release>`__
zu geben, durch das
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.1-release>`__
manchmal nicht in der Lage ist, eine Verbindung zu einem Proze?
aufzubauen, bevor er gestartet wird. In diesem Fall meldet
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.1-release>`__,
da? es die
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.1-release>`__
Node f?r den zu debuggenden Proze? nicht ?ffnen kann. Es scheint einen
weiteren Fehler zu geben, durch den
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.1-release>`__
sich aufh?ngt, wenn
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2&manpath=FreeBSD+5.1-release>`__
den Wert ENOENT zur?ckgibt. Ein weiteres Timing-Problem f?hrt dazu, da?
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.1-release>`__
beim Start manchmal \`\`\ ``PIOCWAIT: Input/output error``'' meldet. Es
existieren zwar Korrekturen f?r diese Probleme, da diese aber zu sehr in
die Routinen zur Ausf?hrung von Prozessen eingreifen, werden sie erst
nach dem Erscheinen von 5.0 ins System aufgenommen.

Partitionierung von Festplatten durch das Installationsprogramm
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Es gibt einige Meldungen ?ber Fehler bei der Partitionierung von
Festplatten mit
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__.
Eines der Probleme ist, da?
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__
den freien Platz auf einer Festplatten nicht neu berechnen kann, nachdem
der Typ einer FDISK-Partition ge?ndert wurde.

Veraltete Dokumentation
^^^^^^^^^^^^^^^^^^^^^^^

In einigen F?llen wurde die Dokumentation (wie zum Beispiel die FAQ und
das Handbuch) nicht aktualisiert und geht nicht auf die Neuerungen in
FreeBSD 5.0-RELEASE ein. Zum Beispiel fehlt noch Dokumentation zu
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8&manpath=FreeBSD+5.1-release>`__
und den neuen \`\`fast IPsec'' Routinen.

SMB Dateisystem
^^^^^^^^^^^^^^^

Ab und zu kommt beim Versuch, die Verbindung zu einem SMBFS Share zu
trennen, die Meldung \`\`\ ``Device busy``'', obwohl das Share nicht
benutzt wird. Die einzige L?sung f?r dieses Problem ist, die Operation
so lange zu wiederholen, bis die Verbindung getrennt wird. Dieser Fehler
wurde in 5.1-RELEASE bereits behoben.

Der Versuch, die Trennung der Verbindung zu einem SMBFS Share mit
``umount -f`` zu erzwingen, kann zu einer Kernel Panic f?hren. Dieser
Fehler wurde in 5.1-RELEASE bereits behoben.

\ `fstat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fstat&sektion=2&manpath=FreeBSD+5.1-release>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wird
`fstat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fstat&sektion=2&manpath=FreeBSD+5.1-release>`__
auf einen Socket angewendet, f?r den bereits eine Verbindung besteht,
sollte es die Anzahl der zum Lesen verf?gbaren Zeichen in dem Feld
st\_size der Struktur struct stat zur?ckgeben. Leider wird bei TCP
Sockets immer ein st\_size von 0 gemeldet. Dieser Fehler wurde in
5.1-RELEASE bereits behoben.

Kernel Event Queues
^^^^^^^^^^^^^^^^^^^

Der zu
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+5.1-release>`__
geh?rende Filter EVFILT\_READ meldet f?lschlicherweise immer, da? an
einem TCP Socket 0 Zeichen zum Lesen bereitstehen, auch wenn in
Wirklichkeit Zeichen zum Lesen verf?gbar sind. Die bei EVFILT\_READ
verf?gbare Option NOTE\_LOWAT arbeitet bei TCP Sockets ebenfalls
fehlerhaft. Dieser Fehler wurde in 5.1-RELEASE bereits behoben.

POSIX Named Semaphores
^^^^^^^^^^^^^^^^^^^^^^

Eine der Neuerungen in FreeBSD 5.0-RELEASE ist die Unterst?tzung f?r
Named Semaphores nach POSIX. Die Routinen enthalten leider einen Fehler,
durch den sich
`sem\_open(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sem_open&sektion=3&manpath=FreeBSD+5.1-release>`__
falsch verhalten kann, wenn eine Semaphore von einem Proze? mehrfach
ge?ffnet wird und durch den
`sem\_close(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sem_close&sektion=3&manpath=FreeBSD+5.1-release>`__
zum Absturz des Programms f?hren kann. Dieser Fehler wurde in
5.1-RELEASE bereits behoben.

Zugriffsrechte f?r ``/dev/tty``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD 5.0-RELEASE enth?lt einen kleinen Fehler im Bereich der
Berechtigungen von ``/dev/tty``. Dieser Fehler tritt auf, wenn sich ein
Benutzer einloggt, der weder ``root`` noch Mitglied der Gruppe ``tty``
ist. Wechselt dieser Benutzer nun mit
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.1-release>`__
zu einer anderen Benutzerkennung, die ebenfalls weder ``root`` noch
Mitglied der Gruppe ``tty`` ist, kann er
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1&manpath=FreeBSD+5.1-release>`__
nicht nutzen, da es ``/dev/tty`` nicht ?ffnen kann. Dieser Fehler wurde
in 5.1-RELEASE bereits behoben.

\ `growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8&manpath=FreeBSD+5.1-release>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8&manpath=FreeBSD+5.1-release>`__
funktioniert auf
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.1-release>`__
Partitionen nicht mehr, da auf ihnen kein Disklabel mehr emuliert wird
und
`growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8&manpath=FreeBSD+5.1-release>`__
das Disklabel analysieren will. Das Problem betrifft wahrscheinlich auch
alle anderen Massenspeicher, f?r die
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.1-release>`__
benutzt wird.

IPFW
^^^^

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.1-release>`__
skipto Regeln funktionieren nicht, wenn gleichzeitig das Schl?sselwort
log verwendet wird. Auch die uid funktionieren nicht richtig. Diese
Fehler wurden in 5.1-RELEASE bereits behoben.

 `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8&manpath=FreeBSD+5.1-release>`__ und Pa?w?rter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8&manpath=FreeBSD+5.1-release>`__
kann das Pa?wort eines neu angelegten Benutzers nicht setzen, wenn
dieses Sonderzeichen der Shell enth?lt. Dieser Fehler wurde in
5.1-RELEASE bereits behoben.

\ `xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.1-release>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der Treiber
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.1-release>`__
enth?lt einen Fehler, der zu einem Absturz des Systems mit der Meldung
\`\`\ ``kernel panic``'' und anderen Problemen f?hren kann, wenn man
versucht, ein Netzwerk-Interface zu konfigurieren. Dieser Fehler wurde
in 5.1-RELEASE bereits behoben.

ISC DHCP
^^^^^^^^

**ISC DHCP** steht jetzt in der Version 3.0.1rc11 zur Verf?gung. Diese
Aktualisierung erfolgte bereits in FreeBSD 5.0-RELEASE, wurde aber nicht
in den Release Notes dokumentiert.

Kompatibilit?tsprobleme bei `amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8&manpath=FreeBSD+5.1-release>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der nicht-blockierende Teil der RPC-Routinen in 5.0-RELEASE ist
fehlerhaft. Einer der auff?lligsten Effekte dieser Fehler ist, da?
Anwender von
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8&manpath=FreeBSD+5.1-release>`__
nicht in der Lage sind, Dateisysteme von einem 5.0-RELEASE Server zu
mounten. Dieser Fehler wurde in 5.1-RELEASE bereits behoben.

nsswitch
^^^^^^^^

Im Eintrag f?r **nsswitch** in den Release Notes wurde ein falscher Name
f?r die bisher genutzte Konfigurationsdatei genannt. Die bisher genutzte
Konfigurationsdatei ist ``/etc/host.conf``.

Mailman
^^^^^^^

Die FreeBSD Mailinglisten werden jetzt mit Mailman und nicht mehr mit
Majordomo verwaltet. Weitere Informationen finden sie auf der `FreeBSD
Mailman Info Page <http://www.FreeBSD.org/mailman/listinfo/>`__.

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

Alle Anwender von FreeBSD 5-CURRENT sollten sich in die Mailingliste
<current@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
