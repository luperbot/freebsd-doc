========================================
FreeBSD 4.6-RELEASE/4.6.2-RELEASE Errata
========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.6-RELEASE/4.6.2-RELEASE Errata
========================================

.. raw:: html

   <div class="AUTHORGROUP">

Das FreeBSD Projekt
~~~~~~~~~~~~~~~~~~~

Deutsche ?bersetzung von Udo Erdelhoff

.. raw:: html

   </div>

Copyright © 2000, 2001, 2002 The FreeBSD Documentation Project

Copyright © 2001, 2002 The FreeBSD German Documentation Project

| $FreeBSD$

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    Dieses Dokument enth?lt die Errata f?r FreeBSD 4.6-RELEASE, also
    wichtige Informationen, die erst nach der Ver?ffentlichung bekannt
    wurden. Dazu geh?hren Ratschl?ge zur Sicherheit sowie ?nderungen in
    der Software oder Dokumentation, die die Stabilit?t und die Nutzung
    beeintr?chtigen k?nnten. Sie sollten immer die aktuelle Version
    dieses Dokumentes lesen, bevor sie diese Version von FreeBSD
    installieren.

    Wenn nicht anderes angegeben ist, treffen die hier genannten Punkte
    auch auf FreeBSD 4.6.2-RELEASE zu. Sinn und Zweck dieser Version
    ist, bestimmte Probleme 4.6-RELEASE zu behben (Details finden Sie in
    den Release Notes).

    Dieses Errata f?r FreeBSD 4.6-RELEASE wird bis zum Erscheinen von
    FreeBSD 4.8-RELEASE weiter aktualsiert werden.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einleitung
-------------

Dieses Errata enth?lt \`\`brandhei?e'' Informationen ?ber FreeBSD
4.6-RELEASE. Bevor Sie diese Version installieren, sollten Sie auf jeden
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

FreeBSD 4.6-RELEASE enth?lt eine Korrektur f?r den in SA-02:23
beschriebenen Fehler (der Nutzung von Datei-Handles durch set-user-id
und set-group-id Programme). Leider deckt diese Korrektur nicht alle
F?lle ab, der Fehler kann immer noch auf Systemen ausgenutzt werden, die
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
oder
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
verwenden. Die zweite Version des Korrektur finden Sie in
`FreeBSD-SA-02:23 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:23.stdio.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

Im Resolver existierte ein Buffer-?berlauf, der von einem entsprechend
programmierten Domain Name Server oder durch passende DNS-Anfragen eines
Angreifers ausgenutzt werden konnte, dieser Fehler wurde entfernt.
Weitere Informationen finden Sie in
`FreeBSD-SA-02:28 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:28.resolv.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

In
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
wurde ein Buffer Overflow beseitigt, der durch defekte NFS-Pakete
ausgenutzt werden konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:29 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:29.tcpdump.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

Es ist nicht mehr m?glich,
`ktrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
zur Verfolgung des Ablaufs von Prozessen zu benutzen, wenn diese vorher
priveligiert waren. Falls ein Prozess sensitive Informationen erhalten
hat, bevor er die Privilegien abgegeben hat, k?nnen diese nicht mehr an
die Au?enwelt gelangen. Weitere Informationen finden Sie in
`FreeBSD-SA-02:30 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:30.ktrace.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

In
`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
existierte eine Race Condition, durch die es m?glich war, die
Berechtigungen einer beliebigen Datei zu ?ndern, dieser Fehler wurde
korrigiert. Weitere Informationen finden Sie in
`FreeBSD-SA-02:32 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:32.pppd.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

In **OpenSSL** wurden mehrere Buffer Overflows gefunden, die Fehler
wurden durch ein Update der von FreeBSD verwendeten Version von
**OpenSSL** beseitigt. Weitere Informationen finden Sie in
`FreeBSD-SA-02:33 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:33.openssl.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

Ein Buffer Overflow im Heap des XDR Decoders wurde beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:34 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:34.rpc.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

Ein Fehler, durch den ein Benutzer beliebige Bl?cke auf einem
FFS-Dateisystem lesen und schreiben konnte, wurde beseitigt. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:35 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:35.ffs.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

Im NFS Server wurde ein Fehler beseitigt, durch den es m?glich war, ?ber
das Netzwerk einen Denial-of-Service Angriff durchzuf?hren. Weitere
Informationen finden Sie in
`FreeBSD-SA-02:36 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:36.nfs.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

Im
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+4.7-RELEASE>`__
System wurde ein Fehler beseitigt, durch den ein lokaler Benutzer einen
Systemabsturz herbeif?hren konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:37 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:37.kqueue.asc>`__.
Dieser Fehler wurde in FreeBSD 4.6.2-RELEASE behoben.

Bei mehrere Systemfunktionen wurden Fehler bei der Pr?fung der Parameter
beseitigt, durch die gr??ere Teile des Kernel-Speichers an den Aufrufer
zur?ckgegeben werden konnten. Weitere Informationen finden Sie in
`FreeBSD-SA-02:38 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:38.signed-error.asc>`__.
Dieser Fehler wurde kurz vor dem Erscheinen von FreeBSD 4.6.2-RELEASE
entdeckt und trifft auch diese Version nicht zu, auch wenn der
entsprechende Hinweis in den Release Notes fehlt.

In ``libkvm`` wurde ein Fehler beseitigt, durch den Applikationen
ungewollt sch?tzenswerte Datei-Handles nach au?en weiterleiten konnten.
Weitere Informationen finden Sie in
`FreeBSD-SA-02:39 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:39.libkvm.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktuelle Informationen
-------------------------

Bei FreeBSD 4.6-RELEASE wurde der Standardwert f?r die maximale
Fenstergr??e bei TCP von 65536 Byte auf 57334 Byte gesenkt, um die
Zusammenarbeit mit bestimmten Versionen von **IPFilter** zu verbessern.

Wird der Port ``archivers/zip`` auf einer Alpha benutzt, kann es bei der
Zusammenarbeit mit dem Kernel zu Fehlern kommen. Nach der
Ver?ffentlichung wurde eine entsprechende Korrektur in das FreeBSD Ports
Archiv integriert, der Fehler tritt nicht mehr auf, wenn Sie mindestens
Version 2.3\_1 des Ports ``archivers/zip`` verwenden.

Auf der Alpha mu?ten die Treiber
`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
und
`txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
aus dem Kernel aus der Bootdiskette entfernt werden, sie stehen jetzt
als Module auf der ``mfsroot`` Diskette zur Verf?gung. Diese ?nderung
war notwendig, damit der Kernel f?r die Alpha auf die Bootdiskette pa?t.
Diese ?nderung sollte keine Auswirkungen auf den Betrieb haben, da
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
automatisch alle Module l?dt, die es auf der ``mfsroot`` Diskette
findet.

Das Package ``x11-servers/XFree86-4-Server`` wurde in letzter Minute
mehrfach ge?ndert, damit die diversen Programme zur Konfiguration des X
Servers das von
`moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
bereitgestellte Ger?t ``sysmouse`` besser unterst?tzen k?nnen. Die
bin?ren Packages auf der CD und den FTP-Servern enthalten die
korrigierte Version mit der Versionsnummer 4.2.0\_3. Allerdings enth?lt
die mitgelieferte Ports Collection die Korrekturen nicht. Um eine
aktuellere Version zu erhalten, m?ssen Sie Ihre Kopie der Ports
Collection mit **CVSup** aktualisieren.

Einige Anwender von FreeBSD/i386 haben von Problemen bei der Benutzung
bestimmter ATAPI CD-ROMs berichtet. Dazu geh?ren unter anderem die
Ger?te AOpen 48x, 52x und 56x sowie das Mitsumi Slim CRMC-SR242S CDROM.
Ein typisches Symptom ist die folgende Fehlermeldung auf der Konsole
und/oder im
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
Speicher, die teilweise zum Systemabsturz f?hrt:

.. code:: SCREEN

    acd0: READ_BIG command timeout - resetting
    ata1: resetting devices .. done

In einigen F?llen verhindert dieser Fehler die Installation von FreeBSD
von einem betroffenen CD-ROM. Es kann dazu kommen, da? sich
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
beim Auspacken der Distributionsdateien auf CD \`\`aufh?ngt''.

In den meisten (aber leider nicht in allen) F?llen kann der Fehler in
zwei Schritten umgangen werden. Der erste Schritt mu? vor der
Installation von CD erfolgen:

.. raw:: html

   <div class="PROCEDURE">

#. Starten Sie den Rechner, w?hrend die FreeBSD Installation-CD im
   Laufwerk ist.

#. Warten Sie, bis die folgende Meldung erscheint:

   .. code:: SCREEN

       Hit [Enter] to boot immediately, or any other key for command prompt.
       Booting [kernel] in 9 seconds...

#. Dr?cken Sie jetz sofort auf die **Leertaste**, um Sie den
   Startvorgang zu unterbrechen.

#. Geben Sie an der Eingabeaufforderung (ok) die folgenden Befehle ein:

   .. code:: SCREEN

       ok set hw.ata.ata_dma="1"

   .. code:: SCREEN

       ok set hw.ata.atapi_dma="1"

   .. code:: SCREEN

       ok boot

#. Setzen Sie die Installation ganz normal fort.

.. raw:: html

   </div>

Der zweite Teil der Korrektur erfolgt, nachdem die Installation von CD
(oder eine Aktualisierung ?ber die Sourcen) erfolgreich abgeschlossen
wurde. Jetzt wird der Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
so konfiguriert, da? in Zukunft korrekt auf das CD-ROM zugegriffen
werden kann:

.. raw:: html

   <div class="PROCEDURE">

#. F?gen Sie die beiden folgenden Zeilen in die Datei
   ``/boot/loader.conf`` ein. Falls die Datei noch nicht existieren
   sollte, legen Sie sich einfach an):

   .. code:: PROGRAMLISTING

       hw.ata.ata_dma="1"
       hw.ata.atapi_dma="1"

#. Starten Sie den Rechner neu.

.. raw:: html

   </div>

Der Fehler wurde am 31. Juli 2002 in FreeBSD 4.7-RELEASE behoben, diese
Korrektur ist auch in FreeBSD 4.6.2-RELEASE enthalten.

Durch einen Fehler bei der Erzeugung der Release sind einige der
Verzeichnisse unterhalb ``/usr/share/examples`` leer (speziell
``/usr/share/examples/cvsup``). Dieses Problem kann teilweise durch die
Installation der Distribution ``sshare`` via
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
behoben werden. W?hlen Sie dazu im Hauptmen? den Punkt Configure, dann
Distributions, dann src und schlie?lich share. Die fehlenden Dateien
stehen dann in ``/usr/src/share/examples`` zur Verf?gung. Das Problem
wurde am 16. Juli 2002 in FreeBSD 4.7-RELEASE behoben, diese Korrektur
ist auch in FreeBSD 4.6.2-RELEASE enthalten.

Weil ein Eintrag vergessen wurde, kann es dazu kommen, da?
``pkg_add -r`` bei 4.6-RELEASE und 4.6.2-RELEASE versucht, f?r FreeBSD
-STABLE vorgesehene Packages zu kopieren, statt die f?r die jweilige
version vorgesehenen Packages zu verwenden. Um diesen Fehler zu umgehen,
m?ssen Sie die Variable PACKAGESITE auf den richtigen Wert setzen, bevor
Sie
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
aufrufen. Wenn Sie z.B. auf einem System mit 4.6.2-RELEASE und
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
arbeiten, m?ssen Sie den folgenden Befehl eingeben:

.. code:: PROGRAMLISTING

    % setenv PACKAGESITE
    \
    ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/i386/packages-4.6.2-release/
    Latest/

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
