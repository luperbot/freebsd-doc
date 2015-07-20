===============================================
FreeBSD/ia64 5.1-RELEASE Installationsanleitung
===============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD/ia64 5.1-RELEASE Installationsanleitung
===============================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 von The FreeBSD Documentation Project

Copyright © 2002, 2003 von The FreeBSD German Documentation Project

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    Dieser Artikel enth?lt eine kurze Anleitung f?r die Installation von
    FreeBSD/ia64 5.1-RELEASE, dabei wird besonderen Wert auf den Bezug
    einer FreeBSD gelegt. Au?erdem enth?lt er einige Tips zur
    Fehlersuche sowie Antworten zu einigen h?ufig gestellten Fragen.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Wie installiere ich FreeBSD
==============================

In diesem Kapitel erfahren Sie, wie Sie FreeBSD installieren. Der
Schwerpunkt liegt dabei auf dem Bezug der FreeBSD 5.1-RELEASE
Distribution und dem Start der Installation. Im Kapitel `\`\`Installing
FreeBSD'' <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/install.html>`__
des `FreeBSD
Handbuch <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__
finden Sie genauere Informationen ?ber das Installationsprogramm,
einschlie?lich einer ausf?hrlichen, bebilderten Installationsleitung.

Wenn Sie eine ?ltere Version von FreeBSD aktualisieren wollen, sollten
Sie `Abschnitt 3 <#UPGRADING>`__, Aktualisierung von FreeBSD, lesen.

.. raw:: html

   <div class="SECT2">

--------------

1.1. Der Einstieg
-----------------

Bevor Sie mit der Installation beginnen, sollten Sie auf jeden Fall alle
Anleitungen, die Sie zusammen mit FreeBSD erhalten haben. Eine ?bersicht
der zu dieser FreeBSD-Version geh?renden Dokumente finden Sie in
``README.TXT``, die sich normalerweise an der gleichen Stelle wie diese
Datei befindet. Die meisten der dort erw?hnten Dokumente, wie die
Release Notes und Liste der unterst?tzten Ger?te, stehen auch im Men?
Dokumentation des Installationsprogramms zur Verf?gung.

Die elektronischen Versionen des FreeBSD
`FAQ <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/faq/>`__ und des
`Handbuchs <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/>`__
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
---------------------------

Wenn Sie noch nie Ger?te f?r FreeBSD konfiguriert haben, sollten Sie auf
jeden Fall einen Blick in die Datei ``HARDWARE.TXT`` werfen, hier finden
Sie Informationen, welche Ger?te von FreeBSD unterst?tzt werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.3. Erzeugung der Bootdisketten
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.4. FreeBSD-Installation von CD oder via Internet
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.5. Details zu den Installationsarten
--------------------------------------

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

.. raw:: html

   <div class="SECT3">

--------------

1.5.1. Installation von einem CDROM im Netzwerk
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wenn Sie von einem lokalen CDROM installieren wollen, sollten Sie nicht
dieses Kapitel lesen, sondern `Abschnitt 1.4 <#START-INSTALLATION>`__.
Wenn in Ihrem System kein CDROM vorhanden ist und Sie eine FreeBSD CD
benutzen wollen, die in einem CDROM Laufwerk eines anderen Systems liegt
und Sie dieses System ?ber ein Netzwerk erreichen k?nnen, dann gibt es
mehrere M?glichkeiten:

-  Wenn Sie bei der Installation von FreeBSD die Daten direkt per FTP
   vom CDROM eines anderen FreeBSD Systems beziehen wollen, ist das sehr
   einfach: Benutzen Sie
   `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8&manpath=FreeBSD+5.1-release>`__,
   um die folgende Zeile in die Pa?wortdatei des anderen Systems
   einzuf?gen:

   .. code:: SCREEN

       ftp:*:99:99::0:0:FTP:/cdrom:/sbin/nologin

   Auf der Maschine, auf der das Installationsprogramm l?uft, wechseln
   Sie in das Men? Options, um die Einstellung Release Name auf den Wert
   ``any`` zu ?ndern. Danach k?nnen Sie ``Media Type`` auf den Wert
   ``FTP`` setzen. In der Auswahl der FTP-Server w?hlen Sie den Punkt
   \`\`URL'' und geben als Wert ``ftp://machine`` an.

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
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5&manpath=FreeBSD+5.1-release>`__
   zu lesen und das System entsprechend zu konfigurieren. Wenn das
   gelingt, sollten Sie in der Lage sein, ``cdrom-system``:/cdrom als
   Pfad f?r die NFS Installation anzugeben, also z.B. ``wiggy:/cdrom``.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

1.5.2. Installation von Disketten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
    Das ist zwar eine sehr angenehme Variante, allerdings haben uns
    viele Anwender von F?llen berichtet, in denen es Probleme mit diesen
    vorformatierten Disketten gab. Im Zweifelsfalle sollten Sie auch
    diese Disketten selbst formatieren, um wirklich sicher zu gehen.

.. raw:: html

   </div>

Wenn Sie die Disketten auf einem anderen FreeBSD System erzeugen, kann
eine Formatierung nicht schaden, obwohl die Disketten kein
DOS-Dateisystem enthalten m?ssen. Sie k?nnen die Programme
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8&manpath=FreeBSD+5.1-release>`__
und
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8&manpath=FreeBSD+5.1-release>`__
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wenn Sie vom Band installieren, erwartet das Installationsprogramm, da?
die Dateien im tar-Format auf dem Band liegen. Um ein solches Band
anzulegen, m?ssen Sie sich zun?chst alle Dateien f?r die Distributionen
besorgen, die Sie installieren wollen und sie dann mit
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+5.1-release>`__
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wenn Sie die Bootdisketten erzeugt haben, wie in `Abschnitt
1.3 <#FLOPPIES>`__ beschrieben, k?nnen Sie die restliche Installation
?ber eine Netzwerk-Verbindung durchf?hren, wobei drei Arten von
Netzwerkverbindungen unterst?tzt werden: seriell, parallel, oder
Ethernet.

.. raw:: html

   <div class="SECT4">

--------------

1.5.5.1. Serielle Schnittstelle
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
    im Feld \`\`extra options for ifconfig'' den Wert ``link0`` angeben,
    da Linux eine leicht abweichende Variante des PLIP-Protokolls
    benutzt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

1.5.5.3. Ethernet
^^^^^^^^^^^^^^^^^

FreeBSD unterst?tzt viele h?ufig verwendete Netzwerkkarten, eine
?bersicht ist Teil der FreeBSD Hardware Notes. Diese finden Sie in der
Datei ``HARDWARE.TXT`` im Men? Dokumentation des Installationsprogramms
und auf der CD. Wenn Sie eine der unterst?tzten PCMCIA-Netzwerkkarten
benutzen, sollten Sie diese einstecken, *bevor* Sie den Laptop
einschalten. Der Wechsel der Karten im Betrieb wird w?hrend der
Installation leider zur Zeit nicht unterst?tzt.

Sie m?ssen Sie den Namen und die IP-Adresse Ihres Systems sowie die
``Netzmaske`` f?r Ihr Netzwerk kennen. Diese Angaben k?nnen Sie von
Ihrem Systemadministrator erhalten. Wenn Sie andere System mit deren
Namen und nicht mit ihren IP-Adressen ansprechen wollen, brauchen Sie
zus?tzlich die Adresse eines Nameservers und unter Umst?nden auch die
Adresse des Gateways, das Sie ansprechen m?ssen, um den Nameserver
abzufragen (wenn Sie PPP verwenden, ist das die IP-Adresse Ihres
Internet-Providers). Wenn Sie einen HTTP-Proxy f?r FTP (Details dazu
finden Sie weiter unten) verwenden wollen, brauchen Sie auch die Adresse
des Proxies.

Wenn Sie die Antworten auf diese Fragen nicht kennen, sollten Sie auf
jeden Fall mit Ihrem Systemadministrator reden, *bevor* Sie diese
Installationsart ausprobieren. Wenn Sie in einem aktiven Netzwerk
einfach irgendeine IP-Adresse oder Netzmaske nutzen, ist ein Fehlschlag
so gut wie sicher; au?erdem k?nnen Sie sich schon mal auf einem Anschi?
durch Ihren Systemadministrator einstellen.

Wenn die Netzwerkverbindung erst einmal steht, k?nnen Sie die
Installation ?ber NFS oder FTP fortsetzen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

1.5.5.4. Tips zur Installation ?ber NFS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
Option ``-alldirs`` in der Datei ``/etc/exports``. Bei anderen NFS
Servern gibt es ?hnliche Konventionen. Wenn Sie die Meldung
``Permission               Denied`` erhalten, liegt es meistens daran,
da? diese Einstellung nicht richtig ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT4">

--------------

1.5.5.5. Tips zur Installation ?ber FTP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

    ftp://216.66.64.162/pub/FreeBSD/releases/ia64/4.2-RELEASE

Sie k?nnen eine dieser drei Varianten der FTP-Installation nutzen:

-  FTP: Diese Variante nutzt bei der Daten?bertragung den \`\`aktiven''
   Modus, bei dem der Server eine Verbindung zum Client aufbaut. Diese
   Variante funktioniert meistens nicht, wenn ein Firewall im Spiel ist;
   allerdings unterst?tzen ?ltere Server meistens nur diese Methode.
   Wenn Ihre Verbindungen im passiven Modus steckenbleiben, sollten Sie
   diese Variante versuchen.

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

   Dabei m?ssen Sie f?r ``port`` die Portnummer des FTP-Proxy-Servers
   eingeben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.6. Fragen und Antworten f?r Benutzer von IA-64
------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Format der Distribution
==========================

Ein Verzeichnis mit einer typischen FreeBSD Distribution sieht ungef?hr
so aus (das exakte Aussehen h?ngt von der jeweiligen Version,
Architektur und andere Faktoren ab):

.. code:: SCREEN

    ERRATA.HTM      README.TXT      compat1x        dict            kernel
    ERRATA.TXT      RELNOTES.HTM    compat20        doc             manpages
    HARDWARE.HTM    RELNOTES.TXT    compat21        docbook.css     packages
    HARDWARE.TXT    base            compat22        filename.txt    ports
    INSTALL.HTM     boot            compat3x        floppies        proflibs
    INSTALL.TXT     catpages        compat4x        games           src
    README.HTM      cdrom.inf       crypto          info            tools

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
weitere Informationen zum Inhalt einiger der Verzeichnisse:

#. Die ``*.TXT`` und ``*.HTM`` Dateien enthalten Dokumentationen (dieses
   Dokument ist zum Beispiels in ``INSTALL.TXT`` und ``INSTALL.HTM``
   enthalten), die Sie vor der Installation lesen sollten. Die ``*.TXT``
   Dateien enthalten normaler Text, die ``*.HTM`` Dateien enthalten HTML
   und k?nnen mit fast jedem Web Browser gelesen werden. Einige
   Distributionen stellen die Dokumentationen auch in anderen Formaten
   bereit, z.B. PDF oder PostScript.

#. ``docbook.css`` ist ein Cascading Style Sheet (CSS), der von einigen
   Browsern zur Formatierung der HTML Dokumentation benutzt wird.

#. Die Verzeichnisse ``base``, ``catpages``, ``crypto``, ``dict``,
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
   `pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+5.1-release>`__
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
`mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8&manpath=FreeBSD+5.1-release>`__
genutzt werden, um ?nderungen an den Datei oder Dateirechten
aufzusp?ren. Wenn Sie das bei der ``base`` Distribution machen, haben
Sie eine sehr wirksame Methode, um Ihr System auf trojanische Pferde zu
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
============================================

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
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__-Programm
    der *NEUEN* FreeBSD-Version zur Aktualisierung verwenden. Die
    Verwendung der falschen
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__-Version
    f?hrt zu Problemen und hat in der Vergangenheit schon System
    unbrauchbar gemacht. Ein typischer Fehler ist die Verwendung des
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__-Programms
    des installierten Systems, um das System auf eine neuere
    FreeBSD-Version zu aktualisieren. Sie sollten das *nicht* versuchen.

.. raw:: html

   </div>

.. raw:: html

   <div class="WARNING">

    **Warnung:** Sie sollten nicht versuchen, Ihr System mit der
    Upgrade-Funktion von
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.1-release>`__
    von FreeBSD 4-STABLE auf FreeBSD 5.1-RELEASE zu aktualisieren.
    Einige in FreeBSD 4-STABLE vorhandene Dateien f?hren zu Problemen,
    sie werden aber bei dieser Art der Aktualisierung nicht entfernt.
    Ein drastisches Beispiel ist ein veraltetes ``/usr/include/g++``,
    das dazu f?hren kann, da? C++ Programme nicht korrekt (oder gar
    nicht) ?bersetzt werden.

    Diese Anleitung zur Aktualisierung ist nur f?r Benutzer gedacht, die
    schon einen halbwegs aktuellen FreeBSD 5-CURRENT Snapshot
    installiert haben.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.1. Einf?hrung
---------------

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
~~~~~~~~~~~~~~~~

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
``localtime``, ``login.access``, ``login.conf``, ``mail``, ``mail.rc``,
``make.conf``, ``manpath.config``, ``master.passwd``, ``motd``,
``namedb``, ``networks``, ``newsyslog.conf``, ``nsmb.conf``,
``nsswitch.conf``, ``pam.conf``, ``passwd``, ``periodic``, ``ppp``,
``printcap``, ``profile``, ``pwd.db``, ``rc.conf``, ``rc.conf.local``,
``rc.firewall``, ``rc.local``, ``remote``, ``resolv.conf``, ``rmt``,
``sendmail.cf``, ``sendmail.cw``, ``services``, ``shells``,
``skeykeys``, ``spwd.db``, ``ssh``, ``syslog.conf``, ``ttys``, ``uucp``

Die zur neuen Version geh?renden Versionen dieser Dateien werden im
Verzeichnis ``/etc/upgrade/`` abgelegt. Sie sollten einen Blick auf
diese Dateien werfen und gegebenenfalls die Neuerungen in das bestehende
System einarbeiten. Allerdings gibt es viele Wechselwirkungen zwischen
den einzelnen Dateien; daher empfehlen wir Ihnen, alle lokalen
Anpassungen in die neuen Dateien einzutragen und dann diese zu
verwenden.

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
-------------------

In diesem Abschnitt finden Sie Details zur Vorgehensweise bei der
Aktualisierung, dabei wird ein besonderes Augenmerk auf die Punkte
gelegt, bei denen besonders stark vor einer normalen Installation
abgewichen wird.

.. raw:: html

   <div class="SECT3">

--------------

3.2.1. Datensicherung
~~~~~~~~~~~~~~~~~~~~~

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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Im ``disklabel editor`` werden die vorhandenen Dateisysteme aufgef?hrt.
Sie sollten vor dem Beginn der Aktualisierung eine Liste der vorhandenen
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Es gibt keine Einschr?nkungen bei der Auswahl der zu aktualisierenden
Distributionen. Allerdings sollten Sie die Distribution ``base`` auf
jeden Fall aktualisieren; wenn Sie die Onlinehilfe installiert hatten,
sollte auch die Distribution ``man`` aktualisieren. Wenn Sie zus?tzliche
Funktionalit?t hinzuf?gen wollen, k?nnen Sie auch Distributionen
ausw?hlen, die bisher noch nicht installiert waren.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT3">

--------------

3.2.4. Nach der Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
--------------------------------------

Wenn Sie an einer flexibleren und ausgefeilteren M?glichkeit zur
Aktualisierung Ihres Systems interessiert sind, sollten Sie einen Blick
in das Kapitel `The Cutting
Edge <http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/cutting-edge.html>`__
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
==============

.. raw:: html

   <div class="SECT2">

4.1. Reparatur einer FreeBSD Installation
-----------------------------------------

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

4.2. Typische Probleme bei der Installation auf IA-64 Systemen
--------------------------------------------------------------

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

Alle Anwender von FreeBSD 5-CURRENT sollten sich in die Mailingliste
<current@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
