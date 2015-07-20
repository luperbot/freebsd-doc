==================================================
FreeBSD/alpha 4.6.2-RELEASE Installationsanleitung
==================================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/alpha 4.6.2-RELEASE Installationsanleitung
==================================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 The FreeBSD Documentation Project

Copyright © 2002 The FreeBSD German Documentation Project

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    Dieser Artikel enth?lt eine kurze Anleitung f?r die Installation von
    FreeBSD/alpha 4.6.2-RELEASE, dabei wird besonderen Wert auf den
    Bezug einer FreeBSD gelegt. Au?erdem enth?lt er einige Tips zur
    Fehlersuche sowie Antworten zu einigen h?ufig gestellten Fragen.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Wie installiere ich FreeBSD
------------------------------

In diesem Kapitel erfahren Sie, wie Sie FreeBSD installieren. Der
Schwerpunkt liegt dabei auf dem Bezug der FreeBSD 4.6.2-RELEASE
Distribution und dem Start der Installation. Im Kapitel `\`\`Installing
FreeBSD'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/install.html>`__
des `FreeBSD
Handbuch <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__
finden Sie genauere Informationen ?ber das Installationsprogramm,
einschlie?lich einer ausf?hrlichen, bebilderten Installationsleitung.

Wenn Sie eine ?ltere Version von FreeBSD aktualisieren wollen, sollten
Sie `Abschnitt 3 <#UPGRADING>`__, Aktualisierung von FreeBSD, lesen.

.. raw:: html

   <div class="SECT2">

--------------

1.1. Der Einstieg
~~~~~~~~~~~~~~~~~

Bevor Sie mit der Installation beginnen, sollten Sie auf jeden Fall alle
Anleitungen, die Sie zusammen mit FreeBSD erhalten haben. Eine ?bersicht
der zu dieser FreeBSD-Version geh?renden Dokumente finden Sie in
``README.TXT``, die sich normalerweise an der gleichen Stelle wie diese
Datei befindet. Die meisten der dort erw?hnten Dokumente, wie die
Release Notes und Liste der unterst?tzten Ger?te, stehen auch im Men?
Dokumentation des Installationsprogramms zur Verf?gung.

Die elektronischen Versionen des FreeBSD
`FAQ <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/faq/>`__ und des
`Handbuchs <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__
sind auch auf der `FreeBSD Project Web site <http://www.FreeBSD.org/>`__
erh?ltlich, wenn Sie einen Internet-Zugang haben.

Der Umfang der Dokumentation schreckt zwar im ersten Moment etwas ab,
aber die Zeit, die Sie f?r die Lekt?re brauchen, wird sich lohnen.
Au?erdem ist es vorteilhaft, die zur Verf?gung stehenden Ressourcen zu
kennen, wenn w?hrend der Installation ein Problem auftreten sollte.

Irgend etwas kann immer schiefgehen und wenn Ihnen das passiert, sollten
Sie einen Blick in `Abschnitt 4 <#TROUBLE>`__ werfen, wo Sie hilfreiche
Informationen finden k?nnen. Sie sollten ebenfalls einen Blick auf die
aktuelle Version von ``ERRATA.TXT`` werfen, bevor Sie mit der
Installation beginnen, da Sie dort Informationen ?ber alle die Probleme
finden, die seit der Ver?ffentlichung gefunden wurden.

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Das Installationsprogramm f?r FreeBSD tut sein
    m?glichstes, um Sie vor Datenverlusten zu bewahren, trotzdem ist es
    denkbar, da? Sie Ihre *gesamte Festplatte l?schen*, wenn Sie einen
    Fehler machen. Stellen Sie sicher, da? Sie ein brauchbares Backup
    haben, bevor Sie die Installation durchf?hren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.2. Hardware-Anforderungen
~~~~~~~~~~~~~~~~~~~~~~~~~~~

FreeBSD f?r Alpha/AXP unterst?tzt die in ``HARDWARE.TXT`` genannten
Systeme.

Sie ben?tigen auf jeden Fall eine eigene Festplatte f?r FreeBSD/alpha.
Zum jetzigen Zeitpunkt ist es nicht m?glich, eine Festplatte mit einem
anderen Betriebssystem zu teilen. Diese Festplatte mu? an einen SCSI
Controller angeschlossen werden, der vom System Ressource Manager (SRM)
unterst?tzt wird. Sie k?nnen auch eine IDE Festplatte verwenden, wenn
der SRM in Ihrer Maschine in der Lage ist, davon zu booten.

Damit Sie von einer Festplatte booten k?nnen, mu? sich das Root
Dateisystem in der ersten Partition (Partition a) befinden.

Sie ben?tigen auf jeden Fall die Firmware f?r die SRM Konsole f?r Ihr
System. In einigen F?llen ist es m?glich, zwischen AlphaBIOS (oder ARC)
und SRM umzuschalten. In anderen F?llen ist es notwendig, die neue
Firmware von der Webseite des Herstellers zu beziehen.

Wenn Sie noch nie Ger?te f?r FreeBSD konfiguriert haben, sollten Sie auf
jeden Fall einen Blick in die Datei ``HARDWARE.TXT`` werfen, hier finden
Sie Informationen, welche Ger?te von FreeBSD unterst?tzt werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.3. Erzeugung der Bootdisketten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In einigen F?llen m?ssen Sie einen Satz Disketten erstellen, um FreeBSD
installieren zu k?nnen. In diesem Kapitel finden Sie die notwendigen
Informationen, um diese Disketten erstellen zu k?nnen. Die notwendigen
Daten finden Sie auf der FreeBSD CDROM oder im Internet. Wenn Ihr System
in der Lage ist, von CDROM zu booten (was heute die Regel ist) und Sie
FreeBSD von CD installieren, ist dieser Schritt nicht notwendig.

F?r eine Standard-Installation von CDROM oder ?ber ein Netzwerk m?ssen
Sie nur zwei Dateien aus dem Verzeichnis ``floppies/`` auf Disketten
?bertragen, dabei handelt es sich um die Disketten-Images ``kern.flp``
und ``mfsroot.flp``, die f?r 1.44 MByte Diskettenlaufwerke gedacht sind.

Wenn Sie diese Images ?ber das Internet beziehen wollen, brauchen Sie
nur Dateien release\ ``/floppies/kern.flp`` und
release\ ``/floppies/mfsroot.flp`` von
ftp://ftp.FreeBSD.org/pub/FreeBSD/releases oder einem der vielen Mirrors
beziehen. Eine Liste aller Mirrors finden Sie im Kapitel `FTP
Sites <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html>`__
des Handbuchs oder auf dem Server http://www.freebsdmirrors.org/.

Sie ben?tigen zwei leere, formatierte Disketten und ?bertragen Sie das
Image ``kern.flp`` auf die erste und das Image ``mfsroot.flp`` auf die
zweite Diskette. Diese Images sind *keine* DOS Dateien. Sie k?nnen Sie
nicht ganz normal auf eine DOS- oder UFS-Diskette kopieren, sondern
m?ssen ein spezielles Programm verwenden. Wenn Sie DOS benutzen,
brauchen Sie das Programm ``fdimage.exe``, das Sie im Verzeichnis
``tools`` der CDROM bzw. auf dem FreeBSD FTP Server finden. Wenn Sie
UNIX benutzen, brauchen Sie
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__.

Ein Beispiel: Wenn Sie das Image der Kernel-Diskette ?bertragen wollen
und DOS benutzen, m?ssen Sie den folgenden Befehl verwenden:

.. code:: SCREEN

    C> fdimage kern.flp a:

Dazu m?ssen Sie ``fdimage.exe`` und ``kern.flp`` in ein Verzeichnis
kopiert haben. Logischerweise m?ssen Sie die Prozedur f?r
``mfsroot.flp`` wiederholen.

Wenn Sie die Bootdisketten auf einem UNIX System erzeugen wollen,
sollte:

.. code:: SCREEN

    # dd if=floppies/kern.flp of=/dev/rfd0

oder

.. code:: SCREEN

    # dd if=floppies/kern.flp of=/dev/floppy

funktionieren; dies h?ngt allerdings vom jeweiligen System und der
UNIX-Variante ab (die Namen f?r die Diskettenlaufwerke sind nicht
standardisiert).

Wenn Sie FreeBSD auf einer Alpha installieren, welche die
Disketten-Images ?ber das Netzwerk booten kann; oder auf einem x86
System installieren, das entweder ?ber ein 2.88 MByte Diskettenlaufwerk
oder ?ber eine LS-120 Superfloppy verf?gt, k?nnen Sie auch ``boot.flp``
verwenden. Dieses Image enth?lt den Inhalt von ``kern.flp`` und
``mfsroot.flp``, deswegen ist es auch doppelt so gro?. Wenn Sie eine
bootf?hige CD im \`\`El Torito'' Format erstellen wollen, mu? diese
Datei als Boot-Image verwendet werden. Weitere Informationen zu diesem
Thema finden Sie in der Onlinehilfe zu
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8&manpath=FreeBSD+Ports>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.4. FreeBSD-Installation von CD oder via Internet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Die einfachste Variante ist die Installation von CD. Wenn Sie die
FreeBSD Installations-CD und ein unterst?tztes CDROM haben, k?nnen Sie
FreeBSD einfach von der CD starten. Legen Sie CD in das Laufwerk ein und
geben Sie den folgenden Befehl ein, um die Installation zu beginnen (den
Namen des CDROM Laufwerks m?ssen Sie eventuell anpassen):

.. code:: SCREEN

    >>>boot dka0

Sie k?nnen das Installationsprogramm auch von Disketten starten. Dazu
m?ssen Sie die FreeBSD Bootdisketten aus den Dateien
``floppies/kern.flp`` und ``floppies/mfsroot.flp`` erzeugen, wie in
`Abschnitt 1.3 <#FLOPPIES>`__ beschrieben. Legen Sie die Diskette mit
dem Inhalt von ``kern.flp`` ein und geben Sie an der Eingabeaufforderung
des SRM (>>>) den folgenden Befehl ein, um mit der Installation zu
beginnen:

.. code:: SCREEN

    >>>boot dva0

Legen Sie die Diskette mit ``mfsroot.flp`` ein, wenn Sie dazu
aufgefordert werden. Nach einiger Zeit sehen den ersten Bildschirm des
Installationsprogramms.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.5. Details zu den Installationsarten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wenn Sie die erste Meldung des Installationsprogramms vor sich haben,
k?nnen Sie sich einfach die diversen Men?s ansehen und Ihren eigenen Weg
finden. Wenn Sie FreeBSD noch nie installiert haben, sollten Sie auf
jeden Fall einen Blick in die Texte werfen, die im Submen? Dokumentation
zur Verf?gung stehen. Das gleiche gilt f?r die allgemeinen
Informationen, die im Hauptmen? unter \`\`Usage'' zu finden sind.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Wenn Sie ein Problem haben, dr?cken Sie einfach
    **F1**, um sich die Onlinehilfe f?r die jeweilige Situation
    anzusehen.

.. raw:: html

   </div>

Unabh?ngig davon, ob Sie schon einmal FreeBSD installiert haben,
empfehlen wir Ihnen die Benutzung der \`\`Standard'' Installation. Damit
ist sichergestellt, da? Sie alle wichtigen Einstellungen treffen k?nnen
und nichts vergessen. Wenn Sie schon mehr Erfahrung mit der Installation
von FreeBSD haben und *genau* wissen, was Sie tun, k?nnen Sie auch die
Men?punkte \`\`Express'' oder \`\`Custom'' w?hlen. Wenn Sie ein
bestehendes System aktualisieren wollen, sollten Sie den Men?punkt
\`\`Upgrade'' nutzen.

Das Installationsprogramm von FreeBSD unterst?tzt die folgenden
Installationsmedien: Disketten, DOS-Partitionen, Bandlaufwerke, CDROM,
FTP, NFS und UFS Partitionen. In den n?chsten Kapiteln finden Sie
Informationen, was Sie bei der Installation von diesen Medien beachten
m?ssen.

Wenn die Installation abgeschlossen ist, k?nnen Sie FreeBSD/alpha
starten, indem Sie den folgenden Befehl an der Eingabeaufforderung des
SRM eingeben:

.. code:: SCREEN

    >>>boot dkc0

Damit booten Sie Ihr System von der angegebenen Festplatte. Mit dem
Befehl show device k?nnen Sie herausfinden, welche Namen der SRM f?r die
Festplatten in Ihrem System benutzt:

.. code:: SCREEN

    >>>show device
    dka0.0.0.4.0               DKA0           TOSHIBA CD-ROM XM-57  3476
    dkc0.0.0.1009.0            DKC0                       RZ1BB-BS  0658
    dkc100.1.0.1009.0          DKC100             SEAGATE ST34501W  0015
    dva0.0.0.0.1               DVA0
    ewa0.0.0.3.0               EWA0              00-00-F8-75-6D-01
    pkc0.7.0.1009.0            PKC0                  SCSI Bus ID 7  5.27
    pqa0.0.0.4.0               PQA0                       PCI EIDE
    pqb0.0.1.4.0               PQB0                       PCI EIDE

Die Ausgabe stammt von einer Digital Personal Workstation 433au und
zeigt die drei an das System angeschlossenen Ger?te. Das erste Ger?t ist
ein CDROM mit dem Namen ``dka0``, die anderen beiden sind Festplatten
mit den Namen ``dkc0`` und ``dkc100``.

Mit den Schaltern -file und -flags k?nnen Sie angeben, welcher Kernel
gebootet und welche Optionen gesetzt werden sollen:

.. code:: SCREEN

    >>> boot -file kernel.old -flags s

Wenn FreeBSD/alpha automatisch starten soll, m?ssen Sie die folgenden
Befehle eingeben:

.. code:: SCREEN

    >>> set boot_osflags a
    >>> set bootdef_dev dkc0
    >>> set auto_action BOOT

.. raw:: html

   <div class="SECT3">

--------------

1.5.1. Installation von einem CDROM im Netzwerk
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wenn Sie von einem lokalen CDROM installieren wollen, sollten Sie nicht
dieses Kapitel lesen, sondern `Abschnitt 1.4 <#START-INSTALLATION>`__.
Wenn in Ihrem System kein CDROM vorhanden ist und Sie eine FreeBSD CD
benutzen wollen, die in einem CDROM Laufwerk eines anderen Systems liegt
und Sie dieses System ?ber ein Netzwerk erreichen k?nnen, dann gibt es
mehrere M?glichkeiten:

-  Wenn Sie bei der Installation von FreeBSD die Daten direkt per FTP
   vom CDROM eines anderen FreeBSD Systems beziehen wollen, ist das sehr
   einfach: Benutzen Sie
   `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__,
   um die folgende Zeile in die Pa?wortdatei des anderen Systems
   einzuf?gen:

   .. code:: SCREEN

       ftp:*:99:99::0:0:FTP:/cdrom:/sbin/nologin

   Auf der Maschine, auf der das Installationsprogramm l?uft, wechseln
   Sie in das Men? Options, um die Einstellung Release Name auf den Wert
   any zu ?ndern. Danach k?nnen Sie Media Type auf den Wert FTP setzen.
   In der Auswahl der FTP-Server w?hlen Sie den Punkt \`\`URL'' und
   geben als Wert ``ftp://machine`` an.

   .. raw:: html

      <div class="WARNING">

       **Warnung:** Durch diese ?nderung kann jedes System im lokalen
       Netzwerk oder sogar im Internet eine \`\`anonymous FTP''
       Verbindung zu dem System mit dem CDROM aufbauen, was nicht
       unbedingt erw?nscht ist.

   .. raw:: html

      </div>

-  Alternativ k?nnen Sie NFS benutzen, um den Inhalt des CDROM direkt
   f?r die Maschine, auf der Sie installieren wollen, zu exportieren.
   Dazu mu? auf dem System mit dem CDROM die Datei ``/etc/exports`` um
   einen Eintrag erweitert werden. Dieser Eintrag erlaubt zum Beispiel
   der Maschine ``ziggy.foo.com``, das CDROM w?hrend der Installation
   direkt per NFS zu mounten:

   .. code:: SCREEN

       /cdrom          -ro             ziggy.foo.com

   Das System mit dem CDROM mu? nat?rlich als NFS Server konfiguriert
   sein. Wenn Sie nicht wissen, wie man das System so konfiguriert,
   sollten Sie vielleicht eine andere Variante benutzen, falls Sie nicht
   bereit sind, die Onlinehilfe zu
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+4.7-RELEASE>`__
   zu lesen und das System entsprechend zu konfigurieren. Wenn das
   gelingt, sollten Sie in der Lage sein, ``cdrom-system:/cdrom`` als
   Pfad f?r die NFS Installation anzugeben, also z.B. ``wiggy:/cdrom``.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

1.5.2. Installation von Disketten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wenn Sie wirklich von Diskette installieren wollen, weil Ihre Hardware
nicht unterst?tzt wird oder Sie es vorziehen, Dinge auf die harte Tour
zu erledigen, m?ssen Sie zun?chst einmal die Disketten f?r die
Installation vorbereiten.

Der erste Schritt ist die Erstellung der Bootdisketten, wie in
`Abschnitt 1.3 <#FLOPPIES>`__ beschrieben.

Der zweite Schritt ist, einen Blick in `Abschnitt 2 <#LAYOUT>`__ zu
werfen. Das Kapitel \`\`Distribution Format'' ist besonders wichtig, da
Sie hier erfahren, welche Dateien Sie auf Diskette ?bertragen m?ssen und
welche Sie ignorieren k?nnen.

Danach brauchen Sie so mindestens so viele 1.44 MByte Disketten, da? Sie
alle Dateien im Verzeichnis ``bin`` (binary distribution) auf Disketten
unterbringen k?nnen. Wenn Sie Disketten mit DOS vorbereiten, *m?ssen*
Sie sie mit dem MS-DOS Befehl ``FORMAT`` formatieren. Wenn Sie Windows
benutzen, benutzen Sie die Option Formatieren des Dateimanagers.

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Neue Disketten sind in der Regel \`\`vorformatiert''.
    Das ist zwar eine sehr angenehme Variante, allerdings haben ?ber
    Jahre viele F?lle erlebt, in denen es Probleme mit diesen
    vorformatierten Disketten gab. Im Zweifelsfalle sollten Sie auch
    diese Disketten selbst formatieren, um wirklich sicher zu gehen.

.. raw:: html

   </div>

Wenn Sie die Disketten auf einem anderen FreeBSD System erzeugen, kann
eine Formatierung nicht schaden, obwohl die Disketten kein
DOS-Dateisystem enthalten m?ssen. Sie k?nnen die Programme
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
and
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
benutzen, um auf den Disketten ein UFS Dateisystem anzulegen. Dazu sind
die folgenden Befehle notwendig:

.. code:: SCREEN

    # fdformat -f 1440 fd0.1440
    # disklabel -w -r fd0.1440 floppy3
    # newfs -t 2 -u 18 -l 1 -i 65536 /dev/fd0

Nachdem Sie die Disketten formatiert haben, m?ssen Sie die Dateien auf
die Disketten kopieren. Die Dateien der einzelnen Distributionen sind so
aufgeteilt worden, da? f?nf von Ihnen auf eine normale 1.44 MByte
Diskette passen. Nehmen Sie sich ihren Diskettenstapel, kopieren Sie so
viele Dateien wie m?glich auf jede Diskette, bis Sie alle gew?nschten
Distributionen auf die Disketten verteilt haben. Dabei sollten jede
Distribution in ein eigenes Verzeichnis auf der Diskette haben, also
z.B. ``a:\bin\bin.inf``, ``a:\bin\bin.aa``, ``a:\bin\bin.ab``, ...

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Die Datei ``bin.inf`` mu? auf der ersten Diskette des
    ``bin`` Satzes liegen, da das Installationsprogramm sie auswertet,
    um die Anzahl der Dateien f?r diese Distribution zu erfahren. Wenn
    Sie andere Distributionen auf Diskette kopieren, *mu?* die Datei
    ``distname.inf`` immer auf der ersten Diskette des jeweiligen
    Diskettensatzes liegen. Dies wird auch in ``README.TXT`` erkl?rt.

.. raw:: html

   </div>

Wenn Sie bei der Installation den Dialog Medien erreicht haben, w?hlen
Sie Punkt \`\`Floppy'' aus und folgen Sie danach den Anweisungen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

1.5.4. Installation von einem QIC/SCSI Bandlaufwerk
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wenn Sie vom Band installieren, erwartet das Installationsprogramm, da?
die Dateien im tar-Format auf dem Band liegen. Um ein solches Band
anzulegen, m?ssen Sie sich zun?chst alle Dateien f?r die Distributionen
besorgen, die Sie installieren wollen und sie dann mit
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
auf Band schreiben, ungef?hr so:

.. code:: SCREEN

    # cd /where/you/have/your/dists
    # tar cvf /dev/rsa0 dist1 .. dist2

Bei der eigentlichen Installation m?ssen Sie darauf achten, da? Sie in
einem tempor?ren Verzeichnis (das Sie selbst bestimmen k?nnen) genug
Platz f?r den *gesamten* Inhalt des Bandes lassen. Da man nicht beliebig
auf den Inhalt eines Bandes zugreifen kann, braucht diese Art der
Installation eine Menge tempor?ren Speicherplatz. Sie sollten davon
ausgehen, da? Sie die gleiche Menge tempor?ren Speicherplatz ben?tigen,
wie Sie vorher auf das Band geschrieben haben.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Bei dieser Art der Installation m?ssen sich das Band
    im Laufwerk befinden, *bevor* Sie von den Disketten booten.
    Andernfalls kann es sein, da? die Installation das Laufwerk nicht
    \`\`erkennt''.

.. raw:: html

   </div>

Der letzte Schritt ist die Erzeugung der Bootdisketten, siehe `Abschnitt
1.3 <#FLOPPIES>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

1.5.5. Netzwerk-Installation mit FTP oder NFS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wenn Sie die Bootdisketten erzeugt haben, wie in `Abschnitt
1.3 <#FLOPPIES>`__ beschrieben, k?nnen Sie die restliche Installation
?ber eine Netzwerk-Verbindung durchf?hren, wobei drei Arten von
Netzwerkverbindungen unterst?tzt werden: seriell, parallel, oder
Ethernet.

.. raw:: html

   <div class="SECT4">

--------------

1.5.5.1. Serielle Schnittstelle
'''''''''''''''''''''''''''''''

Die Unterst?tzung f?r SLIP ist sehr rudiment?r und auf feste
Verbindungen, wie ein Nullmodemkabel zwischen zwei Rechnern, beschr?nkt.
Der Grund f?r die Einschr?nkung ist, da? Sie bei SLIP keine
W?hlverbindung aufbauen k?nnen. Wenn Sie sich einw?hlen m?ssen oder
sonst in irgendeiner Form die Verbindung aufbauen m?ssen, sollten Sie
PPP verwenden.

Wenn Sie PPP verwenden, m?ssen Sie die IP-Adresse und die
DNS-Informationen f?r Ihres Internet-Providers kennen, da Sie diese im
ersten Teil des Installationsvorgangs ben?tigen. Es kann auch sein, da?
Sie Ihre eigene IP-Adresse kennen m?ssen, allerdings unterst?tzt PPP
dynamisch zugewiesene IP-Adressen und sollte daher in der Lage sein,
diese Information selbst herauszufinden, sofern Ihr Internet-Provider
dies unterst?tzt.

Weiterhin m?ssen Sie die notwendigen \`\`AT Befehle'' f?r die Anwahl
kennen, da sich die Unterst?tzung f?r die Anwahl auf eine einfache
Terminalemulation beschr?nkt.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

1.5.5.2. Parallele Schnittstelle
''''''''''''''''''''''''''''''''

Falls Sie ?ber eine feste Verbindung zu einem anderen FreeBSD oder Linux
System verf?gen, sollten Sie eine Installation ?ber ein \`\`Laplink''
Kabel an den parallelen Schnittstellen in Betracht ziehen. Die
?bertragungsgeschwindigkeit der parallelen Schnittstelle liegt deutlich
?ber dem Maximum einer seriellen Schnittstelle (bis zu 50 KByte/sec),
was die Installation deutlich beschleunigt. Im Normalfall ist es auch
nicht notwendig, \`\`echte'' IP Adressen zu benutzen, wenn Sie eine
Punkt-zu-Punkt Verbindung ?ber ein paralleles Kabel verwenden, verwenden
Sie einfach die in RFC1918 definierten Adre?bereiche f?r die beiden
Seiten der Verbindung (z.B. ``10.0.0.1``, ``10.0.0.2``, etc).

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Wenn Sie statt einem FreeBSD System einen Linux-Rechner
    am anderen Ende der Leitung haben, m?ssen Sie im Dialog TCP/IP setup
    im Feld \`\`extra options for ifconfig'' den Wert link0 angeben, da
    Linux eine leicht abweichende Variante des PLIP-Protokolls benutzt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

1.5.5.3. Ethernet
'''''''''''''''''

FreeBSD unterst?tzt viele h?ufig verwendete Netzwerkkarten, eine
?bersicht ist Teil der FreeBSD Hardware Notes. Diese finden Sie in der
Datei ``HARDWARE.TXT`` im Men? Dokumentation des Installationsprogramms
und auf der CD. Wenn Sie eine der unterst?tzten PCMCIA-Netzwerkkarten
benutzen, sollten Sie diese einstecken, *bevor* Sie den Laptop
einschalten. Der Wechsel der Karten im Betrieb wird w?hrend der
Installation leider zur Zeit nicht unterst?tzt.

Sie m?ssen Sie den Namen und die IP-Adresse Ihres Systems sowie die
Netzmaske f?r Ihr Netzwerk kennen. Diese Angaben k?nnen Sie von Ihrem
Systemadministrator erhalten. Wenn Sie andere System mit deren Namen und
nicht mit ihren IP-Adressen ansprechen wollen, brauchen Sie zus?tzlich
die Adresse eines Nameservers und unter Umst?nden auch die Adresse des
Gateways, das Sie ansprechen m?ssen, um den Nameserver abzufragen (wenn
Sie PPP verwenden, ist das die IP-Adresse Ihres Internet-Providers).
Wenn Sie einen HTTP-Proxy f?r FTP (Details dazu finden Sie weiter unten)
verwenden wollen, brauchen Sie auch die Adresse des Proxies.

Wenn Sie die Antworten auf diese Fragen nicht kennen, sollten Sie auf
jeden Fall mit Ihrem Systemadministrator reden, *bevor* Sie diese
Installationsart ausprobieren. Wenn Sie in einem aktiven Netzwerk
einfach irgendeine IP-Adresse oder Netzmaske nutzen, ist ein Fehlschlag
so gut wie sicher; au?erdem k?nnen Sie sich schonmal auf einem Anschi?
durch Ihren Systemadministrator einstellen.

Wenn die Netzwerkverbindung erst einmal steht, k?nnen Sie die
Installation ?ber NFS oder FTP fortsetzen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

1.5.5.4. Tips zur Installation ?ber NFS
'''''''''''''''''''''''''''''''''''''''

Die Installation ?ber NFS ist einfach: Kopieren Sie die Daten aus der
FreeBSD Distribution auf irgendeinen Server und geben Sie diesen als als
Installationsmedium an.

Wenn dieser Server nur Verbindungen von einem \`\`privileged port''
erlaubt (die Standardeinstellung f?r Sun und Linux Workstations), m?ssen
Sie im Men? Option diese Einstellung aktivieren, bevor Sie mit der
Installation fortfahren.

Wenn Sie eine schlechte Netzwerkanbindung und daher unter niedrigen
?bertragungsraten leiden, sollten Sie die Einstellung \`\`NFS Slow''
aktivieren.

Eine weitere Voraussetzung f?r die Installation ?ber NFS ist, da? der
Server \`\`subdir mounts'' unterst?tzen mu?. Wenn die FreeBSD
Distribution zum Beispiel im Verzeichnis
``wiggy:/usr/archive/stuff/FreeBSD``, dann mu? ``wiggy`` den direkten
Zugriff auf ``/usr/archive/stuff/FreeBSD`` erlauben, nicht nur ``/usr``
oder ``/usr/archive/stuff``.

Bei FreeBSD erlauben Sie diese Art des Zugriffs durch die Angabe der
Option -alldirs in der Datei ``/etc/exports``. Bei anderen NFS Servern
gibt es ?hnliche Konventionen. Wenn Sie die Meldung Permission Denied
erhalten, liegt es meistens daran, da? diese Einstellung nicht richtig
ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

1.5.5.5. Tips zur Installation ?ber FTP
'''''''''''''''''''''''''''''''''''''''

Wenn Sie ?ber FTP installieren, k?nnen Sie jeden Server benutzen, auf
dem eine aktuelle Version von FreeBSD verf?gbar. Eine Liste passender
Server f?r fast jeden Ort der Welt wird Ihnen w?hrend der Installation
angezeigt.

Wenn Sie von einem Server installieren wollen, der nicht in dieser Liste
steht oder wenn Sie Problem mit dem DNS haben, k?nnen Sie auch eine URL
angeben, wenn Sie den Punkt \`\`URL'' aus der Liste ausw?hlen. Da eine
URL sowohl einen Hostname als auch eine Adresse enthalten kann, k?nnen
Sie eine URL dieser Art verwenden, wenn Sie keinen Zugriff auf einen
Nameserver haben:

.. code:: SCREEN

    ftp://216.66.64.162/pub/FreeBSD/releases/alpha/4.2-RELEASE

Sie k?nnen eine dieser drei Varianten der FTP-Installation nutzen:

-  FTP: Diese Variante nutzt bei der Daten?bertragung den \`\`aktiven''
   Modus, bei dem der Server eine Verbindung zum Client aufbaut. Diese
   Variante funktioniert meistens nicht, wenn ein Firewall im Spiel ist;
   allerdings unterst?tzen ?tere Server meistens nur diese Methode. Wenn
   Ihre Verbindungen im passiven Modus steckenbleiben, sollten Sie diese
   Variante versuchen.

-  FTP Passive: Diese Variante nutzt den FTP-Modus "Passive", damit der
   Server keine Verbindungen zum Client aufbaut. Sie sollten diese
   Variante verwenden, wenn Ihr Netzwerk durch eine Firewall abgesichert
   ist, da die meisten Firewalls die vom Server ausgehenden Verbindungen
   nicht erlauben.

-  FTP via an HTTP proxy: Mit dieser Option weisen Sie FreeBSD an, eine
   HTTP-Verbindung zu einem Proxy aufzubauen, wenn es Daten per FTP
   ?bertragen will. Der Proxy ?bersetzt die Anforderungen und schickt
   Sie zum eigentlichen FTP Server. Diese Methode sollten Sie verwenden,
   wenn ein Firewall FTP vollst?ndig verbietet, daf?r aber einen HTTP
   Proxy zur Verf?gung stellt. Bei dieser Variante m?ssen Sie nicht nur
   den FTP-Server, sondern auch den Namen des Proxy-Servers angeben.

   Falls Sie einen echten FTP Proxy benutzen, der nicht auf HTTP
   aufsetzt, sollten Sie die folgende URL wie folgt angeben:

   .. code:: SCREEN

       ftp://foo.bar.com:port/pub/FreeBSD

   Dabei m?ssen Sie f?r port die Portnummer des FTP-Proxy-Servers
   eingeben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

1.5.6. Hinweise zur seriellen Konsole
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wenn Sie bei der Installation von FreeBSD nur die serielle Schnittstelle
benutzen wollen (weil Sie keine Graphikkarte haben oder benutzen
wollen), m?ssen Sie wie folgt vorgehen:

.. raw:: html

   <div class="PROCEDURE">

#. Schlie?en Sie ein ANSI (vt100) kompatibles Terminal oder
   Terminalprogramm an die ``COM1`` Schnittstelle des Systems an, auf
   dem Sie FreeBSD installieren wollen.

#. Ziehen Sie das Tastaturkabel ab (ja, das haben Sie richtig gelesen)
   und versuchen Sie, von der Bootdiskette oder der Installations-CD zu
   booten, w?hrend die Tastatur nicht angeschlossen ist.

#. Wenn Sie keine Meldungen auf Ihrer seriellen Konsole sehen, m?ssen
   Sie die Tastatur wieder einstecken und auf ein Tonsignal warten. Wenn
   Sie von CD booten, machen Sie bei `Schritt 5 <#HITSPACE>`__ weiter,
   wenn Sie das Tonsignal h?ren..

#. Wenn Sie von den Disketten booten, ist das erste Tonsignal die
   Aufforderung, die Diskette mit ``kern.flp`` zu entfernen, die
   Diskette mit ``mfsroot.flp`` einzulegen, auf **Enter** zu dr?cken und
   auf das n?chste Tonsignal zu warten.

#. 

   Dr?cken Sie die Leertaste und geben Sie

   .. code:: SCREEN

       boot -h

   ein, danach sollte die serielle Konsole zum Leben erwachen. Wenn sich
   immer noch nichts tut, sollten Sie das Kabel und die Einstellungen
   Ihres Terminals bzw. Terminalprogramms ?berpr?fen. Diese sollten auf
   9600 Baud, 8 Bit, keine Parit?t eingestellt sein.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.6. Fragen und Antworten f?r Benutzer von Alpha/AXP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="QANDASET">

1.6.1. `Kann ich von der ARC oder Alpha BIOS Console
booten? <#Q1.6.1.>`__
1.6.2. `Hilfe! Ich habe keinen freien Platz! Mu? ich alles andere
l?schen? <#Q1.6.2.>`__
1.6.3. `Kann ich auf die erweiterten Compaq Tru64 oder VMS Partitionen
zugreifen? <#Q1.6.3.>`__
1.6.4. `Laufen Compaq Tru64 (OSF/1) Programme? <#Q1.6.4.>`__
1.6.5. `Wie sieht es mit der Unterst?tzung f?r Linux Programme
aus? <#Q1.6.5.>`__
1.6.6. `Wie sieht es mit der Unterst?tzung f?r NT Alpha
Programme? <#Q1.6.6.>`__

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **1.6.1.** Kann ich von der ARC oder Alpha BIOS Console booten?

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Nein. Wie Compaq Tru64 und VMS kann FreeBSD nur von der SRM
Konsole booten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **1.6.2.** Hilfe! Ich habe keinen freien Platz! Mu? ich alles andere
l?schen?

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Leider ja.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **1.6.3.** Kann ich auf die erweiterten Compaq Tru64 oder VMS
Partitionen zugreifen?

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Nein, zur Zeit noch nicht.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **1.6.4.** Laufen Compaq Tru64 (OSF/1) Programme?

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Wenn Sie den Port oder das Package
```emulators/osf1_base`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/osf1_base/pkg-descr>`__
installieren, k?nnen Sie Tru64 Programme problemlos unter FreeBSD
verwenden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **1.6.5.** Wie sieht es mit der Unterst?tzung f?r Linux Programme aus?

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ AlphaLinux Programm k?nnen in FreeBSD benutzt werden, wenn sie den
Port/das Package
```emulators/linux_base`` <http://www.FreeBSD.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
installiert werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **1.6.6.** Wie sieht es mit der Unterst?tzung f?r NT Alpha Programme?

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ FreeBSD kann keine NT Programme ausf?hren, allerdings kann es auf
NT Partitionen zugreifen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Format der Distribution
--------------------------

Ein Verzeichnis mit einer typischen FreeBSD Distribution sieht ungef?hr
so aus:

.. code:: SCREEN

    ERRATA.HTM      README.TXT      compat1x        dict            manpages
    ERRATA.TXT      RELNOTES.HTM    compat20        doc             packages
    HARDWARE.HTM    RELNOTES.TXT    compat21        docbook.css     ports
    HARDWARE.TXT    XF86336         compat22        floppies        proflibs
    INSTALL.HTM     bin             compat3x        games           src
    INSTALL.TXT     catpages        compat4x        info            tools
    README.HTM      cdrom.inf       crypto          kernel

Wenn Sie dieses Verzeichnis f?r eine CD-, FTP- oder NFS-Installation
nutzen wollen, brauchen Sie nur die beiden 1.44 MByte gro?en
Bootdisketten zu erstellen (wie das geht, ist in `Abschnitt
1.3 <#FLOPPIES>`__ beschrieben), von diesen zu booten, und dann den
Anweisungen zu folgen. Alle anderen Dateien, die f?r die Installation
notwendig sind, werden auf der Grundlage Ihrer Angaben automatisch
geholt. Wenn Sie FreeBSD noch nie installiert haben, sollten Sie dieses
Dokument (die Installationsanleitung) komplett durchlesen.

Wenn Sie eine der anderen Varianten der Installation nutzen oder einfach
nur wissen wollen, wie eine Distribution aufgebaut ist, finden Sie hier
weitere Informationen zu dem Thema.

#. Die ``*.TXT`` und ``*.HTM`` Dateien enthalten Dokumentationen (dieses
   Dokument ist zum Beispiels in ``INSTALL.TXT`` und ``INSTALL.HTM``
   enthalten), die Sie vor der Installation lesen sollten. Die ``*.TXT``
   Dateien enthalten normaler Text, die ``*.HTM`` Dateien enthalten HTML
   und k?nnen mit fast jedem Web Browser gelesen werden. Einige
   Distributionen stellen die Dokumentationen auch in anderen Formaten
   bereit, z.B. PDF oder PostScript.

#. ``docbook.css`` ist ein Cascading Style Sheet (CSS), der von einigen
   Browsern zur Formatierung der HTML Dokumentation benutzt wird.

#. Das Verzeichnis ``XF86336`` enth?lt die Release 3.3.6 des XFree86
   Projekt. In dem Verzeichnis finden Sie mehrere komprimierte
   Archivdateien, die die einzelnen Komponenten der XFree86 Distribution
   enthalten.

#. Die Verzeichnisse ``bin``, ``catpages``, ``crypto``, ``dict``,
   ``doc``, ``games``, ``info``, ``manpages``, ``proflibs``, und ``src``
   enthalten die Hauptkomponenten der FreeBSD Distribution. Diese sind
   auf kleine Dateien aufgeteilt wurden, damit sie (zur Not) auch auf
   Disketten passen.

#. Die Verzeichnisse ``compat1x``, ``compat20``, ``compat21``,
   ``compat22``, ``compat3x``, und ``compat4x`` enthalten Dateien, die
   zur Ausf?hrung von Programmen f?r ?lteren FreeBSD Versionen notwendig
   sind. Auch diese Dateien liegen im ``.tar.gz`` Format vor und k?nnen
   direkt bei der Installation installiert werden. Falls Sie sie
   nachtr?glich installieren wollen, nutzen Sie das ``install.sh``
   Script in dem jeweiligen Verzeichnis.

#. Das Verzeichnis ``floppies/`` enth?lt die Images der Bootdisketten.
   Informationen, wie man diese Images benutzt, finden Sie in `Abschnitt
   1.3 <#FLOPPIES>`__.

#. Die Verzeichnisse ``packages`` und ``ports`` enthalten die FreeBSD
   Packages bzw. Ports Collection. Sie k?nnen Packages aus diesem
   Verzeichnis installieren, indem Sie den folgenden Befehl eingeben:

   .. code:: SCREEN

       #/stand/sysinstall configPackages

   Alternativ k?nnen Sie auch die Namen einzelner Dateien aus
   ``packages`` an das Programm
   `pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
   ?bergeben.

   Die Ports Collection kann wie jede andere Distribution installiert
   werden und belegt dann rund 100 MByte Plattenplatz. Weitere
   Informationen ?ber die Ports Collection finden Sie auf
   http://www.FreeBSD.org/ports/. Wenn Sie die ``doc`` Distribution
   installiert haben, sind diese Informationen auch unter
   ``/usr/share/doc/handbook`` verf?gbar.

#. Zum guten Schlu?: Das Verzeichnis ``tools`` enth?lt diverse
   DOS-Programme zur Ermittlung der Plattengeometrie, zur Installation
   von Bootmanager, und so weiter. Sie brauchen diese Programme nicht
   unbedingt, sie werden nur mitgeliefert, um Ihnen das Leben etwas
   einfacher zu machen.

Das Verzeichnisses einer typischen Distribution (in diesem Fall
``info``) enth?lt die folgenden Dateien:

.. code:: SCREEN

    CHECKSUM.MD5    info.ab         info.ad         info.inf        install.sh
    info.aa         info.ac         info.ae         info.mtree

Die Datei ``CHECKSUM.MD5`` enth?lt MD5 Pr?fsummen f?r die anderen
Dateien. Sie wird nur gebraucht, falls Sie vermuten, da? eine Datei
besch?digt wurde. Diese Datei wird vom Installationsprogramm nicht
verwendet und mu? auch nicht zusammen mit den anderen Dateien dieser
Distribution kopiert werden. Die Dateien mit den Namen ``info.a*`` sind
Teile eines einzigen .tar.gz Archiv, dessen Inhalt Sie sich mit dem
folgenden Befehl anzeigen lassen k?nnen:

.. code:: SCREEN

    # cat info.a* | tar tvzf -

W?hrend der Installation werden diese Dateien automatisch
zusammengesetzt und ausgepackt.

Die Datei ``info.inf`` wird vom Installationsprogramm genutzt, um die
Anzahl der Dateiteile zu ermitteln, die es beschaffen und zusammensetzen
mu?. Wenn Sie eine Distribution auf Diskette kopieren, *m?ssen* Sie die
``.inf`` Datei auf die erste Diskette kopieren.

Die Datei ``info.mtree`` ist ebenfalls optional und als Information f?r
den Benutzer gedacht. Sie enth?lt die MD5 Pr?fsummen der *ungepackten*
Dateien in der Distribution und kann sp?ter vom Programm
`mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
genutzt werden, um ?nderungen an den Datei oder Dateirechten
aufzusp?ren. Wenn Sie das bei der ``bin`` Distribution machen, haben Sie
eine sehr wirksame Methode, um Ihr System auf trojanische Pferde zu
untersuchen.

Zum guten Schlu?: Mit der Datei ``install.sh`` k?nnen Sie eine
Distribution nachtr?glich installieren. Wenn Sie zum Beispiel die info
Distribution nachtr?glich von CD installieren wollen, kommen Sie mit den
folgenden Befehlen zum Ziel:

.. code:: SCREEN

    # cd /cdrom/info
    # sh install.sh

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktualisierung einer FreeBSD-Installation
--------------------------------------------

In diesem Abschnitt erfahren Sie, wie Sie Ihre FreeBSD-Installation
aktualisieren k?nnen, ohne den Quellcode zu verwenden.

.. raw:: html

   <div class="WARNING">

    **Warnung:** Die Programme, die zur Aktualisierung von FreeBSD
    verwendet werden, treffen alle m?glichen Vorkehrungen, um
    Datenverluste zu vermeiden. Allerdings ist es immer noch m?glich,
    da? Sie bei diesem Schritte *den kompletten Festplatteninhalt*
    verlieren. Sie sollten die letzte Sicherheitsabfrage nicht
    best?tigen, bevor Sie ein ad?quates Backup aller Daten angelegt
    haben.

.. raw:: html

   </div>

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Diese Anleitung geht davon aus, da? Sie das
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__-Programm
    der *NEUEN* FreeBSD-Version zur Aktualisierung verwenden. Die
    Verwendung der falschen
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__-Version
    f?hrt zu Problemen und hat in der Vergangenheit schon System
    unbrauchbar gemacht. Ein typischer Fehler ist die Verwendung des
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__-Programms
    des installierten Systems, um das System auf eine neuere
    FreeBSD-Version zu aktualisieren. Sie sollten das *nicht* versuchen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.1. Einf?hrung
~~~~~~~~~~~~~~~

Bei der Aktualisierung werden die vom Benutzer ausgew?hlten
Distributionen durch die entsprechenden Distributionen der neuen
FreeBSD-Version ersetzt. Die normalen Konfigurationsdateien des Systems,
Benutzerdaten, installierte Packages und andere Software werden nicht
aktualisiert.

Systemadministratoren, die eine Aktualisierung planen, sollten dieses
Kapitel komplett lesen, bevor sie die Aktualisierung durchf?hren, um das
Risiko eines Fehlschlags oder Datenverlustes zu vermeiden.

.. raw:: html

   <div class="SECT3">

--------------

3.1.1. ?bersicht
^^^^^^^^^^^^^^^^

Um eine Distribution zu aktualisieren, wird die neue Version dieser
Komponente ?ber die alte Version kopiert. Die zur alten Version
geh?renden Dateien werden nicht gel?scht.

Die Systemkonfiguration bleibt erhalten, da die urspr?nglichen Versionen
der nachfolgend aufgef?hrten Dateien gesichert und zur?ckgespielt
werden:

``Xaccel.ini``, ``XF86Config``, ``adduser.conf``, ``aliases``,
``aliases.db``, ``amd.map``, ``crontab``, ``csh.cshrc``, ``csh.login``,
``csh.logout``, ``cvsupfile``, ``dhclient.conf``, ``disktab``,
``dm.conf``, ``dumpdates``, ``exports``, ``fbtab``, ``fstab``,
``ftpusers``, ``gettytab``, ``gnats``, ``group``, ``hosts``,
``hosts.allow``, ``hosts.equiv``, ``hosts.lpd``, ``inetd.conf``,
``kerberosIV``, ``localtime``, ``login.access``, ``login.conf``,
``mail``, ``mail.rc``, ``make.conf``, ``manpath.config``,
``master.passwd``, ``modems``, ``motd``, ``namedb``, ``networks``,
``newsyslog.conf``, ``nsmb.conf``, ``host.conf``, ``pam.conf``,
``passwd``, ``periodic``, ``ppp``, ``printcap``, ``profile``,
``pwd.db``, ``rc.conf``, ``rc.conf.local``, ``rc.firewall``,
``rc.local``, ``remote``, ``resolv.conf``, ``rmt``, ``sendmail.cf``,
``sendmail.cw``, ``services``, ``shells``, ``skeykeys``, ``spwd.db``,
``ssh``, ``syslog.conf``, ``ttys``, ``uucp``

Die zur neuen Version geh?renden Versionen dieser Dateien werden im
Verzeichnis ``/etc/upgrade/`` abgelegt. Sie sollten einen Blick auf
diese Dateien werfen und ggfs. die Neuerungen in das bestehende System
einarbeiten. Allerdings gibt es viele Wechselwirkungen zwischen den
einzelnen Dateien; daher empfehlen wir Ihnen, alle lokalen Anpassungen
in die neuen Dateien einzutragen und dann diese zu verwenden.

W?hrend der Aktualisierung werden Sie gebeten, ein Verzeichnis
anzugeben, in dem Kopien aller Dateien aus dem Verzeichnis ``/etc/``
abgelegt werden. Falls Sie ?nderungen in anderen Dateien vorgenommen
haben, k?nnen Sie diese aus diesem Verzeichnis restaurieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2. Vorgehensweise
~~~~~~~~~~~~~~~~~~~

In diesem Abschnitt finden Sie Details zur Vorgehensweise bei der
Aktualisierung, dabei wird ein besonderes Augenmerk auf die Punkte
gelegt, bei denen besonders stark vor einer normalen Installation
abgewichen wird.

.. raw:: html

   <div class="SECT3">

--------------

3.2.1. Datensicherung
^^^^^^^^^^^^^^^^^^^^^

Sie sollten Kopien der Benutzerdaten und Konfigurationsdateien anlegen,
bevor Sie das System aktualisieren. Das Programm zur Aktualisierung
versucht, Fehler und Fehlbedienungen so weit wie m?glich zu verhindern,
aber es ist immer noch m?glich, da? Daten oder
Konfigurationsinformationen teilweise oder vollst?ndig gel?scht werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

3.2.2. Mounten der Dateisysteme
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Im disklabel editor werden die vorhandenen Dateisysteme aufgef?hrt. Sie
sollten vor dem Beginn der Aktualisierung eine Liste der vorhandenen
Ger?tenamen und der dazugeh?rigen Mountpoints anlegen. Die Namen der
Mountpoints m?ssen hier angegeben werden. Sie d?rfen das \`\`newfs
flag'' f?r die Dateisysteme *auf gar keinen Fall* aktivieren, da Sie
sonst Daten verlieren werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

3.2.3. Auswahl der Distributionen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Es gibt keine Einschr?nkungen bei der Auswahl der zu aktualisierenden
Distributionen. Allerdings sollten Sie die Distribution bin auf jeden
Fall aktualisieren; wenn Sie die Onlinehilfe installiert hatten, sollte
auch die Distribution man aktualisieren. Wenn Sie zus?tzliche
Funktionalit?t hinzuf?gen wollen, k?nnen Sie auch Distributionen
ausw?hlen, die bisher noch nicht installiert waren.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

3.2.4. Nach der Installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Sobald die Installation abgeschlossen ist, werden Sie aufgefordert, die
neuen Konfigurationsdatei zu pr?fen. Zu diesem Zeitpunkt sollten Sie
?berpr?fen, ob die neue Konfiguration korrekt ist. Dabei sollten Sie
besonders auf die Inhalte der Dateien ``/etc/rc.conf`` und
``/etc/fstab`` achten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.3. Aktualisierung ?ber den Quellcode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wenn Sie an einer flexibleren und ausgefeilteren M?glichkeit zur
Aktualisierung Ihres Systems interessiert sind, sollten Sie einen Blick
in das Kapitel `The Cutting
Edge <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/cutting-edge.html>`__
des FreeBSD Handbuchs werfen. Bei dieser Variante erzeugen Sie FreeBSD
aus dem Quellcode komplett neu. Diese Variante braucht eine verl??liche
Netzwerkverbindung, mehr Plattenplatz und mehr Zeit, bietet aber
Vorteile f?r Netzwerke und andere komplexe Installationen. Sie
entspricht ungef?hr der Vorgehensweise, die f?r die Entwicklungszweige
-STABLE und -CURRENT verwendet wird.

``/usr/src/UPDATING`` enth?lt wichtige Informationen, wenn Sie ein
FreeBSD System mit Hilfe des Quellcodes aktualisieren m?chten. Hier
finden Sie eine Liste aller Probleme, die durch ?nderungen in FreeBSD
auftreten k?nnen und die Aktualisierung beeinflussen k?nnten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4. Erste Hilfe
--------------

.. raw:: html

   <div class="SECT2">

4.1. Reparatur einer FreeBSD Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bei FreeBSD gibt es im Hauptmen? des Installationsprogramms den Punkt
\`\`Fixit''. Wenn Sie diese Option benutzen wollen, brauchen Sie
entweder eine Diskette, die Sie aus dem Image ``fixit.flp`` erzeugt
haben; oder die CD mit dem \`\`live filesystem'', das ist normalerweise
die zweite CD der FreeBSD Distribution.

Um fixit zu benutzen, m?ssen Sie zuerst von der ``kern.flp`` Diskette
booten, dann die Option \`\`Fixit'' ausw?hlen und dann die Fixit
Diskette oder CD einlegen, wenn Sie dazu aufgefordert werden. Danach
wird eine Shell gestartet, in der viele Programme zur ?berpr?fung,
Reparatur und Analyse von Dateisystem und ihren Inhalten zur Verf?gung
stehen. Sie finden diese Programme in den Verzeichnissen ``/stand`` und
``/mnt2/stand``. Allerdings *brauchen* Sie Erfahrung mit der
Administration von Unix-Systemen, um diese Option sinnvoll einsetzen zu
k?nnen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

4.2. Typische Probleme bei der Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="QANDASET">

4.2.1. `Wenn ich das System nach der FreeBSD-Installation zum ersten von
der Festplatte starte, wird der Kernel geladen und sucht nach Hardware,
aber danach kommt eine Meldung wie: <#Q4.2.1.>`__
4.2.2. `Wenn ich nach der FreeBSD-Installation zum ersten Mal von der
Festplatte booten will, komme ich nur bis zum F? Prompt des
Bootmanagers. <#Q4.2.2.>`__

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.2.1.** Wenn ich das System nach der FreeBSD-Installation zum
ersten von der Festplatte starte, wird der Kernel geladen und sucht nach
Hardware, aber danach kommt eine Meldung wie:

.. code:: SCREEN

    changing root device to wd1s1a panic: cannot mount root

Was l?uft falsch? Was kann ich tun?

Was bedeutet diese bios\_drive:interface(unit,partition)kernel\_name
Meldung, die mir beim Booten als Hilfe angezeigt wird?

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Es kann zu Problemen kommen, wenn die Festplatte, von der Sie
booten, nicht die erste Festplatte des Systems ist. Leider sind sich das
BIOS und FreeBSD nicht immer einig, wie die Festplatte numeriert werden
sollen. Die richtige Zuordnung zu finden, ist nicht einfach; daher kommt
es hier immer wieder zu Problemen.

Wenn die Festplatte, von der Sie booten, nicht die erste Platte des
Systems ist, braucht FreeBSD in manchen F?llen etwas Hilfe. Es gibt zwei
typische Ursachen f?r dieses Problem und in beiden F?llen m?ssen Sie
FreeBSD sagen, wo das root filesystem liegt. Dazu m?ssen Sie die vom
BIOS verwendete Nummer der Festplatte, den Typ der Festplatte, und die
von FreeBSD verwendete Nummer der Festplatte dieses Typs angeben.

Eine typische Ursache ist ein System mit zwei IDE Platten, die beide als
Master Ihres IDE Kanals konfiguriert sind und auf dem Sie FreeBSD von
der zweiten Platte booten wollen. Das BIOS verwendet f?r die beiden
Platten die Nummern 0 und 1, w?hrend FreeBSD ``wd0`` und ``wd2``
verwendet.

FreeBSD liegt auf BIOS Platte 1, der Typ der Platte ist wd, und FreeBSD
vergibt die Nummer 2. In diesem Fall m?ssen Sie folgendes eingeben:

.. code:: SCREEN

    1:wd(2,a)kernel

Bitte beachten Sie, da? Sie dies nicht eingeben m?ssen, wenn sich auf
dem prim?ren IDE Kanal ein weiteres Ger?t befindet (um genau zu, w?re es
sogar falsch).

Die andere typische Ursache ist ein System mit IDE und SCSI Platten, bei
dem Sie von der SCSI Platte booten wollen. In diesem Fall vergibt
FreeBSD eine niedrigere Nummer als das BIOS. Wenn Sie neben der
SCSI-Festplatte noch zwei IDE-Platten haben, vergibt das BIOS f?r die
SCSI Festplatte die Nummer 2, w?hrend FreeBSD die Nummer 0 vergibt. Da
die Platte von Typ da ist, lautet die L?sung:

.. code:: SCREEN

    2:da(0,a)kernel

Damit teilen Sie FreeBSD mit, da? von der BIOS Festplatte Nummer 2
booten wollen, die die erste SCSI-Festplatte des System ist. Wenn Sie
nur eine IDE-Festplatten h?tten, w?rden Sie 1: verwenden.

Wenn Sie den korrekten Wert herausgefunden haben, k?nnen Sie ihn mit
einem normalen Editor in die Datei ``/boot.config`` eintragen. FreeBSD
nutzt den Inhalt dieser Datei, um den Standardwert f?r die Antwort auf
die Anforderung boot: zu bestimmen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.2.2.** Wenn ich nach der FreeBSD-Installation zum ersten Mal von
der Festplatte booten will, komme ich nur bis zum F? Prompt des
Bootmanagers.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Sie haben bei der FreeBSD-Installation eine falsche Geometrie f?r
Ihre Festplatte angeben. Sie m?ssen im Partitionseditor die richtige
Geometrie eingeben und FreeBSD mit der richtigen Geometrie komplett neu
installieren.

Wenn Sie die korrekte Geometrie Ihrer Festplatte nicht ermitteln k?nnen,
k?nnen Sie den folgenden Trick verwenden: Legen Sie eine am Anfang der
Festplatte eine kleine DOS-Partition an und installieren Sie danach
FreeBSD. Das Installationsprogramm wird die DOS-Partition finden und
daraus die korrekte Geometrie berechnen, was normalerweise funktioniert.

Es gibt eine weitere M?glichkeit, die nicht mehr empfohlen wird und der
Vollst?ndigkeit halber erw?hnt wird:

    Wenn Sie einen Server oder eine Workstation installieren, auf der
    ausschlie?lich FreeBSD laufen soll und Ihnen die (zuk?nftige)
    Kompatibilit?t mit DOS, Linux oder anderen Betriebssystemen egal
    ist, k?nnen Sie auch die gesamte Platte verwenden (Taste \`A' im
    Partitions-Editor). Dadurch verwendet FreeBSD die gesamte Festplatte
    vom ersten bis zum letzten Sektor, wodurch alle Probleme mit der
    Geometrie hinf?llig werden. Allerdings k?nnen Sie auf dieser
    Festplatte nur FreeBSD benutzen, was Sie evtl. einschr?nkt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

4.3. Typische Hardware-Probleme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Please send hardware tips for this section to Jordan
    K. Hubbard ``<jkh@FreeBSD.org>``.

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDASET">

4.3.1. `Der mcd(4) Treiber glaubt, der habe ein Ger?t gefunden, dadurch
funktioniert meine Intel EtherExpress Netzwerkkarte nicht. <#Q4.3.1.>`__
4.3.2. `FreeBSD unterst?tzt angeblich 3Com PCMCIA Karten, aber meine
Karte wird nicht erkannt, wenn Sie in meinem Laptop
steckt. <#Q4.3.2.>`__
4.3.3. `FreeBSD erkennt meine PCMCIA Netzwerkkarte, aber obwohl sie
funktionieren soll, werden keine Pakete verwendet. <#Q4.3.3.>`__
4.3.4. `Das System erkennt meine ed(4) Netzwerkkarte, aber ich erhalte
st?ndig die Meldung device timeout. <#Q4.3.4.>`__
4.3.5. `Ich habe ein CDROM von Matsushita/Panasonic, das nicht erkannt
wird. <#Q4.3.5.>`__
4.3.6. `Ich habe meinen IBM ThinkPad (tm) Laptop von der
Installationsdiskette gebootet, und die Tastaturbelegung ist v?llig
konfus. <#Q4.3.6.>`__
4.3.7. `Wenn ich von der Installationsdiskette boote, erhalte ich nur
die folgende Meldung, danach passiert nichts mehr. Ich kann auch keine
Tastatureingaben machen. <#Q4.3.7.>`__
4.3.8. `Ich habe ein Matsushita/Panasonic CR-522, ein
Matsushita/Panasonic CR-523 oder ein TEAC CD55a CDROM, aber es wird
nicht korrekt erkannt, selbst wenn ich den richtigen I/O-Port
angebe. <#Q4.3.8.>`__
4.3.9. `Ich versuche, von Band zu installieren, aber ich erhalte nur die
folgende Meldung: <#Q4.3.9.>`__
4.3.10. `Ich habe FreeBSD auf meinem Rechner installiert, aber beim
Neustart bleibt das System stehen. Die letzte Meldung
ist: <#Q4.3.10.>`__
4.3.11. `Meine Intel EtherExpress 16 wird nicht erkannt. <#Q4.3.11.>`__
4.3.12. `Wenn ich FreeBSD auf meinem EISA HP Netserver installiere, wird
der eingebaute AIC-7xxx SCSI Controller nicht erkannt. <#Q4.3.12.>`__
4.3.13. `Mein Panasonic AL-N1 oder Rios Chandler Pentium Rechner h?ngt
sich auf, obwohl das Installationsprogramm noch gar nicht gestartet
ist. <#Q4.3.13.>`__
4.3.14. `Ich habe diesen CMD640 IDE Controller, der angeblich
\`\`broken'' ist. <#Q4.3.14.>`__
4.3.15. `Auf meinem Compaq Aero Notebook erhalte ich die Meldung \`\`No
floppy devices found! Please check ...'', wenn ich von Diskette
installieren will. <#Q4.3.15.>`__
4.3.16. `Wenn ich das erste Mal von meinem neuen Board mit Intel AL440LX
Chipsatz (\`\`Atlanta'') boote, bricht der Startvorgang mit der Meldung
Read Error ab. <#Q4.3.16.>`__
4.3.17. `Wenn ich FreeBSD auf einem Dell Poweredge XE installiere, wird
der Dell-eigene RAID Controller DSA (Dell SCSI Array) nicht
erkannt. <#Q4.3.17.>`__
4.3.18. `Meine Netzwerkkarte wird als AMD PCnet-FAST (oder ?hnliche)
erkannt, funktioniert aber nicht (betrifft u.a. die eingebauten
Netzwerkkarten in den IBM Netfinity 5xxx oder 7xxx
Systemen) <#Q4.3.18.>`__
4.3.19. `Ich verwende eine Netzwerkkarte vom Typ IBM EtherJet PCI, die
zwar vom Treiber fxp(4) korrekt erkannt wird, aber trotzdem leuchten die
Kontroll-LEDs nicht auf und ich habe auch keine Verbindung zum
Netzwerk. <#Q4.3.19.>`__
4.3.20. `Wenn ich w?hrend einer Installation auf einer IBM Netfinity
3500 das Netzwerk konfiguriere, h?ngt sich das System
auf. <#Q4.3.20.>`__
4.3.21. `Wenn ich FreeBSD auf einer Festplatte konfiguriere, die an
einem Mylex PCI RAID Controller abgeschlossen ist, kann ich das System
nicht neu starten (Abbruch mit der Meldung read error). <#Q4.3.21.>`__

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.1.** Der mcd(4) Treiber glaubt, der habe ein Ger?t gefunden,
dadurch funktioniert meine Intel EtherExpress Netzwerkkarte nicht.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Benutzen Sie UserConfig (wie, steht in ``HARDWARE.TXT``) und
schalten die Erkennung der Ger?te ``mcd0`` und ``mcd1`` ab. Es ist immer
besser, wenn Sie nur die Treiber aktiv lassen, f?r die Sie auch passende
Ger?te haben, alle anderen Treiber sollten Sie aus dem Kernel entfernen
oder deaktivieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.2.** FreeBSD unterst?tzt angeblich 3Com PCMCIA Karten, aber
meine Karte wird nicht erkannt, wenn Sie in meinem Laptop steckt.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Es gibt mehrere m?gliche Ursachen. Ersten werden Kombikarten nicht
von FreeBSD unterst?tzt. Wenn Sie eine Karte mit Ethernet und Modem
haben (wie die 3C562), haben Sie ein Problem. Zweitens braucht der
Treiber f?r die 3C589 wie alle anderen Treiber f?r FreeBSD auch die
Informationen aus dem NVRAM der Karte. Sie m?ssen die Werte f?r IRQ,
Port und IOMEM richtig einstellen, damit Sie mit den Werten
?bereinstimmen, die im NVRAM stehen.

Leider ist das von 3COM mitgelieferte DOS-Programm das einzige Programm,
das diese Werte auslesen kann. Das Programm mu? auf einem nackten System
(es darf kein anderer Treiber installiert sein) ausgef?hrt werden, wird
sich ?ber die fehlenden CARD Services beschweren, aber es macht weiter.
Nur so k?nnen die Werte aus dem NVRAM ausgelesen werden. Sie brauchen
die Werte IRQ, Port und IOMEM (letztere werden von 3COM CIS tuple
genannt). Die ersten beiden Werte k?nnen mit dem Programm ge?ndert
werden, der dritte kann nicht ge?ndert, sondern nur gelesen werden.
Sobald Sie die Werte haben, benutzen Sie sie in UserConfig und Ihre
Karte wird erkannt werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.3.** FreeBSD erkennt meine PCMCIA Netzwerkkarte, aber obwohl sie
funktionieren soll, werden keine Pakete verwendet.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Viele PCMCIA Karten k?nnen entweder den 10-Base2 (BNC) oder den
10-BaseT Anschlu? f?r die Verbindung zum Netzwerk benutzen. Der Treiber
kann den richtigen Anschlu? nicht automatisch ausw?hlen, daher m?ssen
Sie ihm mitteilen, welchen Anschlu? er benutzen soll. F?r diese Auswahl
m?ssen die Link-Flags setzen. Je nach Karte wird -link0 link1 oder
-link0 -link1 den richtigen Anschlu? aktivieren. In
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
k?nnen Sie diese Werte im Feld Extra options to ifconfig: im Dialog
network setup angeben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.4.** Das System erkennt meine ed(4) Netzwerkkarte, aber ich
erhalte st?ndig die Meldung device timeout.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Ihre Karte nutzt wahrscheinlich einen anderen IRQ als den, der in
der Kernel-Konfiguration angegeben ist. Der ed Treiber benutzt die
\`soft' Konfiguration (die sie in DOS mit EZSETUP eingestellt haben)
normalerweise nicht. Wenn er das tun soll, m?ssen Sie bei der
Kernelkonfiguration f?r den IRQ den Wert ? angeben.

Sie sollten entweder eine der festverdrahteten Einstellungen benutzen
(und ggfs. die Einstellungen des Kernels anpassen), oder in UserConfig
f?r den IRQ den Wert -1 eingeben. Damit teilen Sie dem Kernel mit, da?
er die \`soft' Konfiguration benutzen soll.

Eine andere m?gliche Ursache ist, da? Ihre Karte IRQ9 verwendet. IRQ 9
wird immer mit IRQ 2 geteilt, was immer wieder Probleme macht
(besonders, wenn Sie eine VGA-Karte haben, die IRQ 2 benutzt!) Wenn
m?glich, sollten Sie IRQ 9 und IRQ 2 nicht benutzen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.5.** Ich habe ein CDROM von Matsushita/Panasonic, das nicht
erkannt wird.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Pr?fen Sie, ob der
`matcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=matcd&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
Treiber auf den f?r Ihre Adapterkarte richtigen I/O-Port eingestellt
ist. Einige DOS-Treiber f?r den Soundblaster melden einen 0x10 zu
kleinen Wert f?r den I/O-Port des CDROMs.

Wenn Sie weder auf der Karte noch in der Dokumentation den richtigen
Wert finden, sollten Sie in UserConfig bei Port den Wert angeben und das
System starten. Der Treiber versucht nun der Reihe nach verschiedene
I/O-Ports, die von den diversen Herstellern f?r den
Matsushita/Panasonic/Creative CDROM Anschlu? benutzt wurden. Sobald der
Treiber die richtige Adresse gefunden hat, sollten Sie diese in
UserConfig eintragen. Wenn Sie weiterhin den Wert -1 f?r den Port
verwenden, sucht der Treiber bei jedem Start des Systems erneut, was die
Dinge unn?tig in L?nge zieht. Au?erdem kann es dadurch zu Problemen mit
anderen Ger?ten kommen.

Der Treiber unterst?tzt nur die beiden Laufwerke Matsushita CR-562 und
CR-563.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.6.** Ich habe meinen IBM ThinkPad (tm) Laptop von der
Installationsdiskette gebootet, und die Tastaturbelegung ist v?llig
konfus.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****?ltere IBM Laptops verwenden nicht den normalen Tastaturcontroller,
daher m?ssen Sie dem Tastaturtreiber (atkbd0) in einen speziellen
ThinkPad-Modus schalten. ?ndern Sie in UserConfig die 'Flags' f?r atkbd0
auf 0x4 und das Problem sollte gel?st sein. Die Einstellung finden Sie
im Men? Input.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.7.** Wenn ich von der Installationsdiskette boote, erhalte ich
nur die folgende Meldung, danach passiert nichts mehr. Ich kann auch
keine Tastatureingaben machen.

.. code:: SCREEN

    Keyboard: no

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Aus Platzgr?nden mu?te der Support f?r XT/AT Tastaturen (mit 84
Tasten) aus den Bootblocks entfernt werden. Diese Art der Tastatur wird
auch von einigen Laptops verwendet. Wenn Sie noch eine solche Tastatur
verwenden, erhalten Sie die oben aufgef?hrte Meldung, wenn Sie von der
CD oder der Installationsdiskette booten.

Wenn Sie diese Meldung erhalten, m?ssen Sie die Leertaste dr?cken,
danach erhalten Sie die folgende Meldung:

.. code:: SCREEN

    >> FreeBSD/i386 BOOT
    Default: x:xx(x,x)/boot/loader 
    boot:

Wenn Sie jetzt -Dh eingeben, sollte die Installation normal
weiterlaufen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.8.** Ich habe ein Matsushita/Panasonic CR-522, ein
Matsushita/Panasonic CR-523 oder ein TEAC CD55a CDROM, aber es wird
nicht korrekt erkannt, selbst wenn ich den richtigen I/O-Port angebe.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Diese CDROM Laufwerke werden nicht von FreeBSD unterst?tzt, da die
Befehle zur Ansteuerung dieser Laufwerke sind nicht mit denen f?r die
Double-Speed Laufwerke CR-562 and CR-563 identisch sind.

Die single-speed Laufwerke CR-522 und CR-523 brauchen einen CD-Caddy.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.9.** Ich versuche, von Band zu installieren, aber ich erhalte
nur die folgende Meldung:

.. code:: SCREEN

    sa0(aha0:1:0) NOT READY csi 40,0,0,0

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Wenn Sie in der aktuellen Version von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
ein Bandlaufwerk nutzen wollen, dann *mu?* das Band bereits im Laufwerk
liegen, wenn
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
gestartet wird; andernfalls wird es nicht erkannt. Starten Sie
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
neu, nachdem Sie das Band eingelegt haben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.10.** Ich habe FreeBSD auf meinem Rechner installiert, aber beim
Neustart bleibt das System stehen. Die letzte Meldung ist:

.. code:: SCREEN

    Changing root to /dev/da0a

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Dieses Problem tritt gelegentlich auf, wenn Sie eine 3com 3c509
Netzwerkkarte verwenden. Der Treiber
`ep(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ep&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
mag es scheinbar ?berhaupt nicht, wenn andere Treiber testweise auf die
Adresse 0x300 zugreifen. Um das Problem zu beheben, m?ssen Sie Ihrer
Rechner aus- und wieder einschalten. Sobald Sie die Meldung Boot:
erhalten, m?ssen Sie -c eingeben. Damit starten Sie UserConfig (siehe
`Abschnitt 4.1 <#REPAIRING>`__ weiter oben). Benutzen Sie den Befehl
disable, um alle anderen Treiber abzuschalten, die auch auf die Adresse
0x300 zugreifen. Danach sollte FreeBSD problemlos starten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.11.** Meine Intel EtherExpress 16 wird nicht erkannt.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Sie m?ssen die Intel EtherExpress 16 so konfigurieren, da? 32K
Speicher an der Adresse 0xD0000 eingeblendet werden. Benutzen Sie dazu
das von Intel mitgelieferte Programm ``softset.exe``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.12.** Wenn ich FreeBSD auf meinem EISA HP Netserver installiere,
wird der eingebaute AIC-7xxx SCSI Controller nicht erkannt.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Dieses Problem ist bekannt, und wird hoffentlich bald gel?st
werden. Damit Sie FreeBSD installieren k?nnen, m?ssen Sie mit der Option
-c booten, um UserConfig zu starten. Sie brauchen den CLI-Modus, *nicht*
den Visual Modus (auch wenn er sch?ner aussieht). Geben Sie den
folgenden Befehl ein:

.. code:: SCREEN

    eisa 12
    quit

Statt \`quit' k?nnen Sie auch \`visual' eingeben, um die restliche
Konfigurationsarbeit in diesem Modus erledigen. Die Erzeugung eines
angepa?ten Kernels wird zwar immer noch empfohlen, allerdings hat dset
gelernt, diesen Wert zu speichern.

Eine Erkl?rung der Ursachen dieses Problems und weitere Informationen
finden Sie im FAQ. Wenn Sie die Distribution \`doc' installiert haben,
finden Sie den FAQ im Verzeichnis /usr/share/doc/FAQ auf Ihrer
Festplatte.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.13.** Mein Panasonic AL-N1 oder Rios Chandler Pentium Rechner
h?ngt sich auf, obwohl das Installationsprogramm noch gar nicht
gestartet ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Aus unerfindlichen Gr?nden vertragen diese Rechner die neuen
Anweisungen i586\_copyout und i586\_copyin nicht. Damit diese
Anweisungen nicht verwendet werden, m?ssen Sie von der Bootdiskette
booten. Im ersten Men? (die Frage, ob Sie UserConfig starten wollen oder
nicht) w?hlen Sie den Punkt command-line interface (\`\`expert mode'').
Geben Sie den folgenden Befehl ein:

.. code:: SCREEN

    flags npx0 1

Danach k?nnen Sie den Systemstart normal fortsetzen. Die Einstellung
wird in Ihrem Kernel gespeichert, Sie m?ssen Sie also nur einmal machen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.14.** Ich habe diesen CMD640 IDE Controller, der angeblich
\`\`broken'' ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Das stimmt. FreeBSD unterst?tzt diesen Controller nicht mehr,
au?er im nicht mehr gepflegten wdc Treiber.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.15.** Auf meinem Compaq Aero Notebook erhalte ich die Meldung
\`\`No floppy devices found! Please check ...'', wenn ich von Diskette
installieren will.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Compaq ist immer etwas anders als andere und sah daher keinen
Grund, das Diskettenlaufwerk im CMOS RAM der Aero Notebooks einzutragen.
Da sich der Treiber auf diese Angaben verl??t, nimmt er an, da? kein
Diskettenlaufwerk vorhanden ist. Starten Sie UserConfig und stellen Sie
bei fdc0 unter flags den Wert 0x1 ein. Damit teilen Sie dem Treiber mit,
da? ein 1.44 MByte Diskettenlaufwerk vorhanden ist, und da? er die Werte
im CMOS ignorieren soll.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.16.** Wenn ich das erste Mal von meinem neuen Board mit Intel
AL440LX Chipsatz (\`\`Atlanta'') boote, bricht der Startvorgang mit der
Meldung Read Error ab.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Das BIOS einiger dieser Mainboards scheint einen Fehler zu
enthalten, der das FreeBSD Startprogramm annehmen l??t, da? es von
Diskette bootet. Das Problem tritt nur auf, wenn Sie BootEasy nicht
verwenden. Wenn Sie den Fehler umgehen wollen, sollten Sie Ihre
Festplatte im DD Modus partitionieren oder eine neuere BIOS-Version
einspielen (Details dazu finden Sie auf den Webseiten von Intel).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.17.** Wenn ich FreeBSD auf einem Dell Poweredge XE installiere,
wird der Dell-eigene RAID Controller DSA (Dell SCSI Array) nicht
erkannt.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Benutzen Sie das EISA Konfigurationsprogramm, um den DSA auf
AHA-1540 Emulation umzustellen. Danach wird er von FreeBSD als Adaptec
AHA-1540 SCSI Controller auf IRQ 11 und Port 340 erkannt. In diesem
Modus k?nnen Sie das RAID des DSA nutzen, lediglich die DSA-spezifischen
Funktionen wie die RAID-?berwachung stehen nicht zur Verf?gung.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.18.** Meine Netzwerkkarte wird als AMD PCnet-FAST (oder
?hnliche) erkannt, funktioniert aber nicht (betrifft u.a. die
eingebauten Netzwerkkarten in den IBM Netfinity 5xxx oder 7xxx Systemen)

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Der Treiber
`lnc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lnc&sektion=4&manpath=FreeBSD+4.7-RELEASE>`__
ist zur Zeit fehlerhaft und arbeitet oft nicht korrekt mit den
PCnet-FAST und PCnet-FAST+ Karten zusammen. Sie m?ssen eine andere
Netzwerkkarte verwenden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.19.** Ich verwende eine Netzwerkkarte vom Typ IBM EtherJet PCI,
die zwar vom Treiber fxp(4) korrekt erkannt wird, aber trotzdem leuchten
die Kontroll-LEDs nicht auf und ich habe auch keine Verbindung zum
Netzwerk.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Wir wissen nicht, was die Ursache dieses Problems ist. IBM hat das
gleiche Problem (wir haben sie gefragt). Diese Netzwerkkarte ist eine
ganz normale Intel EtherExpress Pro/100 mit einem IBM-Aufkleber, und
diese Netzwerkkarten machen normalerweise gar keine Probleme. Das
Problem tritt auch nur in einigen IBM Netfinity Servern auf. Die einzige
L?sung ist, eine andere Netzwerkkarte zu verwenden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.20.** Wenn ich w?hrend einer Installation auf einer IBM
Netfinity 3500 das Netzwerk konfiguriere, h?ngt sich das System auf.

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Es gibt Probleme mit der eingebauten Netzwerkkarte der IBM
Netfinity 3500, die wir noch nicht genau einkreisen konnten. Die Ursache
des Problems k?nnte eine falsche Konfiguration der SMP Unterst?tzung auf
diesen Systemen sein. Sie m?ssen eine andere Netzwerkkarte verwenden und
Sie d?rfen die eingebaute Netzwerkkarte werden benutzen noch
konfigurieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="QANDAENTRY">

.. raw:: html

   <div class="QUESTION">

\ **4.3.21.** Wenn ich FreeBSD auf einer Festplatte konfiguriere, die an
einem Mylex PCI RAID Controller abgeschlossen ist, kann ich das System
nicht neu starten (Abbruch mit der Meldung read error).

.. raw:: html

   </div>

.. raw:: html

   <div class="ANSWER">

****\ Ein Fehler im Mylex Treiber sorgt daf?r, da? er die
BIOS-Einstellung \`\`8GB'' Geometrie ignoriert. Verwenden Sie den 2 GB
Modus.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

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
