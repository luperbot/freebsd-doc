=========================
2.3. Vor der Installation
=========================

.. raw:: html

   <div class="navheader">

2.3. Vor der Installation
`Zur?ck <install-hardware.html>`__?
Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
?\ `Weiter <install-start.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3. Vor der Installation
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.1. Erstellen Sie eine Ger?teliste
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie FreeBSD installieren, erfassen Sie die Komponenten Ihres
Rechners. Die FreeBSD-Installation wird die Komponenten (Festplatten,
Netzwerkkarten, CD-ROM-Laufwerke) zusammen mit der Modellbezeichnung und
des Herstellers anzeigen. FreeBSD wird auch versuchen, die richtige
Konfiguration der Ger?te zu ermitteln. Dazu geh?ren die benutzten
Interrupts (IRQ) und IO-Ports. Wegen der Unw?gbarkeiten von PC-Hardware
kann die Konfiguration der Ger?te allerdings fehlschlagen. In diesem
Fall m?ssen Sie die von FreeBSD ermittelte Konfiguration korrigieren.

Wenn Sie schon ein anderes Betriebssystem, wie Windows? oder Linux
installiert haben, k?nnen Sie die Hardware-Konfiguration mit den Mitteln
dieses Betriebssystems bestimmen. Wenn Sie nicht sicher sind, welche
Einstellungen eine Erweiterungskarte besitzt, sehen Sie auf der Karte
selbst nach. Manchmal sind die Einstellungen dort aufgedruckt.
Gebr?uchliche IRQs sind ``3``, ``5`` und ``7``. Die Adressen von
IO-Ports werden normalerweise hexadezimal, zum Beispiel ``0x330``,
angegeben.

Halten Sie die Ger?tekonfiguration vor der Installation in einer Tabelle
wie der nachstehenden fest:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 2.1. Ger?tekonfiguration

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------+-------+------------+-------------------------------------+
| Ger?t                   | IRQ   | IO-Ports   | Anmerkung                           |
+=========================+=======+============+=====================================+
| erste Festplatte        | -     | -          | 40?GB, Seagate, erster IDE-Master   |
+-------------------------+-------+------------+-------------------------------------+
| CD-ROM                  | -     | -          | erster IDE-Slave                    |
+-------------------------+-------+------------+-------------------------------------+
| zweite Festplatte       | -     | -          | 20?GB, IBM, zweiter IDE-Master      |
+-------------------------+-------+------------+-------------------------------------+
| erster IDE-Controller   | 14    | 0x1f0      | ?                                   |
+-------------------------+-------+------------+-------------------------------------+
| Netzwerkkarte           | -     | -          | Intel? 10/100                       |
+-------------------------+-------+------------+-------------------------------------+
| Modem                   | -     | -          | 3Com? 56K Faxmodem, an COM1         |
+-------------------------+-------+------------+-------------------------------------+
| …                       | ?     | ?          | ?                                   |
+-------------------------+-------+------------+-------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie wissen, ?ber welche Hardware Ihr Rechner verf?gt, m?ssen Sie
diese Informationen mit den Hardwareanforderungen der zu installierenden
FreeBSD-Version abgleichen.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.2. Sichern Sie Ihre Daten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn der Rechner, auf dem Sie FreeBSD installieren wollen, wichtige
Daten enth?lt, sichern Sie bitte diese Daten. Pr?fen Sie auch, dass Sie
die Daten aus der Sicherung wiederherstellen k?nnen, bevor Sie FreeBSD
installieren. Die FreeBSD-Installation fragt zwar nach, bevor Sie Daten
auf Ihre Festplatte schreibt, Ihre Daten sind allerdings unwiderruflich
verloren, wenn der Installationsvorgang einmal angelaufen ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.3. Den Installationsort von FreeBSD festlegen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die gesamte Festplatte f?r FreeBSD verwenden wollen, m?ssen Sie
sich an dieser Stelle keine weiteren Gedanken machen – lesen Sie bitte
im n?chsten Abschnitt weiter.

Wenn Sie allerdings FreeBSD neben anderen Betriebssystemen betreiben
wollen, m?ssen Sie wissen, wie Daten auf einer Festplatte abgelegt
werden und welche Auswirkungen dies hat.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.3.1. Platteneinteilung von FreeBSD/i386-Systemen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine PC-Festplatte wird in einzelne Bereiche unterteilt, die
*Partitionen* hei?en. FreeBSD verwendet intern ebenfalls Partitionen. Um
Verwechslungen und Unklarheiten zu vermeiden, werden diese
Plattenbereiche unter FreeBSD als Slices bezeichnet. So verwendet
beispielsweise das Werkzeug ``fdisk`` den Begriff Slices, um sich auf
PC-Partitionen zu beziehen. Auf einer PC-Festplatte k?nnen maximal vier
Partitionen, die *prim?re Partitionen* genannt werden, angelegt werden.
Eine *erweiterte Partition* hebt diese Beschr?nkung auf. Eine Festplatte
kann nur eine erweiterte Partition enthalten, die wiederum weitere so
genannte *logische Partitionen* enthalten kann.

Jede Partition besitzt eine *Partitions-ID* – eine Zahl, die den Typ der
Partition festlegt. FreeBSD-Partitionen tragen die Partitions-ID
``165``.

?blicherweise kennzeichnen Betriebssysteme Partitionen in einer
besonderen Art und Weise. Beispielsweise werden jeder prim?ren und
logischen Partition unter MS-DOS? und dem verwandten Windows?
Laufwerksbuchstaben beginnend mit ``C:`` zugewiesen.

FreeBSD muss auf einer prim?ren Partition installiert werden. In dieser
Partition h?lt FreeBSD alle Daten einschlie?lich der Dateien, die Sie
anlegen. Verf?gt das System ?ber mehrere Festplatten, k?nnen Sie auf
allen oder einigen Platten eine FreeBSD-Partition einrichten. Zur
Installation von FreeBSD ben?tigen Sie eine freie Partition: Dies kann
eine extra f?r die Installation eingerichtete Partition sein oder eine
existierende Partition, die nicht mehr ben?tigte Daten enth?lt.

Wenn auf allen Platten bereits s?mtliche Partitionen benutzt werden,
m?ssen Sie eine der Partitionen f?r FreeBSD frei machen. Benutzen Sie
dazu die Werkzeuge des eingesetzten Betriebssystems (``fdisk`` unter
MS-DOS? oder Windows?).

Verf?gt das System ?ber eine freie Partition, benutzen Sie diese
Partition. Es kann allerdings sein, dass Sie eine oder mehrere der
vorhandenen Partitionen vorher verkleinern m?ssen.

Eine minimale FreeBSD-Installation ben?tigt nur 100?MB Plattenplatz.
Diese Installation ist allerdings *sehr* begrenzt und l?sst wenig Platz
f?r Ihre eigenen Dateien. Realistischer sind 250?MB f?r FreeBSD ohne
graphische Benutzeroberfl?che und 350?MB f?r FreeBSD mit einer
graphischen Benutzeroberfl?che. Sie ben?tigen weiteren Platz f?r die
Installation zus?tzlicher Software.

Um die Partitionen zu verkleinern, k?nnen Sie beispielsweise das
kommerzielle PartitionMagic? oder das freie GParted benutzen. Sowohl
GParted als auch PartitionMagic? k?nnen auch NTFS-Partitionen ver?ndern.
GParted ist auf vielen Linux-Live-CDs, beispielsweise der
`SystemRescueCD <http://www.sysresccd.org/>`__, verf?gbar.

Bei der Ver?nderung von Microsoft? Vista-Partionen kommt es manchmal zu
Problemen. In einem solchen Fall ist es von Vorteil, wenn Sie eine
Vista-Installations-CD zur Verf?gung haben. Wie bei jeder ?nderung an
Ihrer Festplatte sollten Sie auch hier zuerst ein aktuelles Backup
anlegen.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Der falsche Gebrauch dieser Werkzeuge kann Daten auf der Festplatte
l?schen. Vor dem Einsatz dieser Werkzeuge stellen Sie bitte sicher, dass
Sie frische, funktionierende Datensicherungen besitzen.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 2.1. Eine bestehende Partition verwenden

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Nehmen wir an, Sie haben einen Rechner mit einer 4?GB Festplatte, auf
der schon eine Version von Windows? installiert ist. Weiterhin haben Sie
die Platte in zwei Laufwerke ``C:`` und ``D:`` unterteilt, die jeweils
2?GB gro? sind. Auf ``C:`` wird 1?GB benutzt und 0,5?GB von Laufwerk
``D:`` werden benutzt.

Sie haben also eine Festplatte mit zwei Partitionen und k?nnten alle
Daten von Laufwerk ``D:`` auf das Laufwerk ``C:`` kopieren. Damit w?re
die zweite Partition f?r FreeBSD frei.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 2.2. Eine bestehende Partition verkleinern

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Nehmen wir an, Sie haben einen Rechner mit einer 4?GB Festplatte auf der
schon eine Version von Windows? installiert ist. W?hrend der
Installation von Windows? haben sie eine gro?e Partition ``C:``
angelegt, die 4?GB gro? ist. Von den 4?GB werden 1,5?GB benutzt und Sie
wollen 2?GB f?r FreeBSD verwenden.

Sie haben zwei M?glichkeiten, FreeBSD zu installieren:

.. raw:: html

   <div class="orderedlist">

#. Sichern Sie die Daten der Windows?-Partition und installieren Sie
   Windows? erneut auf einer 2?GB gro?en Partition.

#. Verkleinern Sie die Windows?-Partition mit einem der oben
   aufgef?hrten Werkzeuge.

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

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.4. Netzwerkparameter ermitteln
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wird w?hrend der Installation ein Netzwerk ben?tigt (weil Sie ?ber FTP
oder von einem NFS-Server installieren wollen), m?ssen Sie die
Konfiguration des Netzwerks kennen. W?hrend der Installation werden
Netzwerkparameter abgefragt, damit sich FreeBSD mit dem Netzwerk
verbinden und die Installation abschlie?en kann.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.4.1. Verbindung ?ber Ethernet oder ein Kabel/DSL-Modem
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie sich mit einem Ethernet verbinden oder eine Internet-Verbindung
mit einem Ethernet-Adapter ?ber Kabel oder DSL herstellen, ben?tigen Sie
die nachstehenden Daten:

.. raw:: html

   <div class="orderedlist">

#. IP-Adresse

#. IP-Adresse des Default-Gateways

#. Hostname

#. IP-Adressen der DNS-Server

#. Subnetzmaske

.. raw:: html

   </div>

Wenn Sie die Daten nicht besitzen, fragen Sie bitte Ihren
Systemadministrator oder Ihren Service-Provider. K?nnen die Daten ?ber
*DHCP* bezogen werden, merken Sie sich diese Tatsache.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.4.2. Verbindung ?ber ein Modem
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Auch wenn Sie sich mit einem normalen Modem bei einem ISP einw?hlen,
k?nnen Sie FreeBSD aus dem Internet installieren. Die Installation ?ber
ein Modem dauert nur sehr lange.

Sie ben?tigen die nachstehenden Daten:

.. raw:: html

   <div class="orderedlist">

#. Die Telefonnummer des ISPs.

#. Die COM-Schnittstelle, an der das Modem angeschlossen ist.

#. Den Benutzernamen und das Passwort f?r Ihr Konto.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.5. Lesen Sie die FreeBSD-Errata
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Auch wenn das FreeBSD-Project bem?ht ist, ein Release so stabil wie
m?glich herzustellen, treten ab und an Fehler auf. In seltenen F?llen
betrifft ein Fehler die Installations-Prozedur. Die Fehler und deren
Behebungen werden in den
`FreeBSD-Errata <http://www.FreeBSD.org/releases/10.1R/errata.html>`__
festgehalten. Lesen Sie bitte die Errata, bevor Sie FreeBSD
installieren, damit Sie nicht in frisch entdeckte Probleme laufen.

Dokumentation zu jedem Release, inklusive der Errata zu jedem Release,
finden Sie im `Release-Bereich <../../../../de/releases/index.html>`__
des `FreeBSD Webauftritts <../../../../index.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.6. Die Installationsdateien beschaffen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD kann von Dateien aus irgendeiner der nachstehenden Quellen
installiert werden:

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Lokale Medien

.. raw:: html

   </div>

-  von einer CD-ROM oder einer DVD

-  von einem USB-Stick

-  von einer MS-DOS?-Partition auf demselben Rechner

-  von einem SCSI- oder QIC-Bandlaufwerk

-  von Disketten

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Netzwerk

.. raw:: html

   </div>

-  von einem FTP-Server, wenn erforderlich auch durch eine Firewall oder
   durch einen HTTP-Proxy

-  von einem NFS-Server

-  ?ber eine feste serielle oder eine feste parallele Verbindung

.. raw:: html

   </div>

Wenn Sie eine FreeBSD-CD oder FreeBSD-DVD gekauft haben, besitzen Sie
schon alles, was Sie zur Installation ben?tigen. Lesen Sie bitte im
n?chsten Abschnitt (`Abschnitt?2.3.7, „Das Startmedium
vorbereiten“ <install-pre.html#install-boot-media>`__) weiter.

Wenn Sie sich die FreeBSD-Installationsdateien noch nicht besorgt haben,
lesen Sie bitte zuerst den `Abschnitt?2.13, „Eigene Installationsmedien
herstellen“ <install-diff-media.html>`__. Dort werden die notwendigen
Vorbereitungen f?r eine Installation von den eben genannten Medien
beschrieben. Wenn Sie den Abschnitt durchgearbeitet haben, lesen Sie
bitte in `Abschnitt?2.3.7, „Das Startmedium
vorbereiten“ <install-pre.html#install-boot-media>`__ weiter.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.7. Das Startmedium vorbereiten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um FreeBSD zu installieren, m?ssen Sie Ihren Rechner mit einem
speziellen Startmedium hochfahren, das die Installationsroutine startet.
Sie k?nnen das Installationsprogramm nicht unter einem anderen
Betriebssystem ausf?hren. Ein Rechner startet normalerweise das auf der
Festplatte installierte Betriebssystem, er kann aber auch von Disketten
gestartet werden. Aktuelle Rechner k?nnen in der Regel auch von einer
CD-ROM oder von einem USB-Stick starten.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Wenn Sie eine FreeBSD CD-ROM oder DVD besitzen (gekauft oder selbst
erstellt) und Ihr Rechner von CD-ROM oder DVD starten kann
(?blicherweise k?nnen Sie das mit der BIOS-Option ``Boot Order``
einstellen), k?nnen Sie diesen Abschnitt ?berspringen. Eine FreeBSD
CD-ROM oder DVD l?sst sich direkt starten; Sie k?nnen damit FreeBSD ohne
weitere Vorbereitungen installieren.

.. raw:: html

   </div>

Um einen bootbaren USB-Stick zu erstellen, gehen Sie wie folgt vor:

.. raw:: html

   <div class="procedure">

#. **Das Speicherabbild f?r den USB-Stick herunterladen**

   Das Speicherabbild finden Sie auf dem FreeBSD-FTP-Server
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/arch/ISO-IMAGES/version/FreeBSD-version-RELEASE-arch-memstick.img``
   (oder einem Spiegelserver) im Verzeichnis ``ISO-IMAGES/``. Ersetzen
   Sie *``arch``* und *``version``* durch die von Ihnen verwendete
   Architektur und die FreeBSD-Version, die Sie einsetzen wollen. F?r
   FreeBSD/i386?10.1-RELEASE finden Sie das Speicherabbild f?r den
   USB-Stick beispielsweise unter folgenden Link:
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/ISO-IMAGES/10.1/FreeBSD-10.1-RELEASE-i386-memstick.img``.

   Das ben?tigte Speicherabbild hat den Dateityp ``.img``. Das
   Verzeichnis ``ISO-IMAGES/`` enth?lt verschiedene Speicherabbilder.
   Sie m?ssen also (basierend auf der zu installierenden FreeBSD-Version
   und/oder Ihrer Hardware) das f?r Sie passende Speicherabbild
   herunterladen.

   .. raw:: html

      <div class="important" xmlns="">

   Wichtig:
   ~~~~~~~~

   *Sichern Sie Ihre Daten*, bevor Sie fortfahren, da im n?chsten
   Schritt alle auf dem USB-Stick befindlichen Daten *gel?scht* werden.

   .. raw:: html

      </div>

#. **Den USB-Stick vorbereiten**

   .. raw:: html

      <div class="procedure">

   .. raw:: html

      <div class="procedure-title">

   Prozedur 2.1. Den USB-Stick unter FreeBSD vorbereiten

   .. raw:: html

      </div>

   .. raw:: html

      <div class="warning" xmlns="">

   Warnung:
   ~~~~~~~~

   Das Beispiel im n?chsten Schritt verwendet ``/dev/da0`` als die
   Ger?tedatei, ?ber die Sie den USB-Stick ansprechen. Achten Sie
   besonders darauf, dass Sie die richtige Ger?tedatei verwenden, da Sie
   ansonsten unbeabsichtigt Daten l?schen k?nnten.

   .. raw:: html

      </div>

   -  **Das Image mit
      `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
      auf den Stick schreiben**

      Bei der ``.img``-Datei handelt es sich *nicht* um eine normale
      Datei, die Sie einfach auf den Stick kopieren k?nnen. Vielmehr
      handelt es sich dabei um ein Image des kompletten Dateisystems,
      das Sie mit
      `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
      direkt auf den USB-Stick schreiben m?ssen:

      .. code:: screen

          # dd if=FreeBSD-10.1-RELEASE-i386-memstick.img of=/dev/da0 bs=64k

      Wird dabei die Fehlermeldung ``Operation not permitted``
      angezeigt, stellen Sie bitte sicher, dass das Zielger?t nicht
      verwendet, manuell eingeh?ngt oder von einem Systemprogramm
      automatisch eingeh?ngt wurde. Dann versuchen Sie es erneut.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="procedure">

   .. raw:: html

      <div class="procedure-title">

   Prozedur 2.2. Den USB-Stick unter Windows? vorbereiten

   .. raw:: html

      </div>

   .. raw:: html

      <div class="warning" xmlns="">

   Warnung:
   ~~~~~~~~

   Stellen Sie unbedingt sicher, dass Sie im folgenden Schritt den
   korrekten Laufwerkbuchstaben f?r Ihren USB-Stick angeben, da Sie
   ansonsten unbeabsichtigt Daten l?schen k?nnten.

   .. raw:: html

      </div>

   #. **Image Writer f?r Windows herunterladen**

      Image Writer f?r Windows ist ein frei verf?gbares Programm, mit
      dem Sie ein Image auf einen USB-Stick schreiben k?nnen. Laden Sie
      das Programm von ``https://launchpad.net/win32-image-writer/``
      herunter und entpacken Sie es in einen Ordner auf Ihrer
      Festplatte.

   #. **Das Image mit Image Writer auf den Stick schreiben**

      Klicken Sie doppelt auf das Symbol Win32DiskImager, um das
      Programm zu starten. Vergewissern Sie sich, dass es sich bei dem
      unter ``Device`` angezeigten Laufwerk um Ihren USB-Stick handelt.
      Danach klicken Sie auf das Ordnersymbol und w?hlen die zuvor
      heruntergeladene Image-Datei aus. Klicken Sie auf Save, um die
      Image-Datei zu laden. Nachdem Sie alle Eingaben nochmals gepr?ft
      haben, m?ssen Sie noch sicherstellen, dass kein anderes Programm
      auf den USB-Stick zugreift. Danach klicken Sie auf den Button
      Write, um das Image auf den USB-Stick zu schreiben.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Um Startdisketten zu erzeugen, benutzen Sie die nachstehende Anleitung:

.. raw:: html

   <div class="procedure">

#. **Abbilder der Startdisketten besorgen**

   .. raw:: html

      <div class="important" xmlns="">

   Wichtig:
   ~~~~~~~~

   Beachten Sie, dass ab FreeBSD?8.\ *``X``* Startdisketten nicht mehr
   unterst?tzt werden. Lesen Sie bitte weiter oben in diesem Kapitel,
   wie Sie FreeBSD von einer CD-ROM, einer DVD oder einem USB-Stick
   installieren k?nnen.

   .. raw:: html

      </div>

   Die Abbilder der Startdisketten befinden sich auf dem
   Installationsmedium im Verzeichnis ``floppies/``; sie k?nnen auch aus
   dem Internet heruntergeladen werden:
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/arch/version-RELEASE/floppies/``.
   Ersetzen Sie *``arch``* und *``version``* durch die passende
   Architektur und die passende Version. Beispielsweise stehen die
   Startdisketten von FreeBSD/i386?9.3-RELEASE unter
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/9.3-RELEASE/floppies/``.

   Die Abbilder besitzen die Dateinamenerweiterung ``.flp``. Im
   Verzeichnis ``floppies/`` befinden sich verschiedene Abbilder;
   welches Sie benutzen, h?ngt von der zu installierenden
   FreeBSD-Version und in einigen F?llen vom Zielrechner ab. In den
   meisten F?llen werden Sie vier Disketten ben?tigen: ``boot.flp``,
   ``kern1.flp``, ``kern2.flp`` sowie ``kern3.flp``. Lesen Sie bitte die
   Datei ``README.TXT`` im Verzeichnis ``floppies/``, sie enth?lt
   aktuelle Informationen zu den Abbildern.

   .. raw:: html

      <div class="important" xmlns="">

   Wichtig:
   ~~~~~~~~

   Wenn Sie die Abbilder aus dem Internet herunterladen, benutzen Sie
   bitte den *Bin?rmodus* des FTP-Programms. Einige Web-Browser
   verwenden den *Textmodus* (oder *ASCII*-Modus), was dazu f?hrt, dass
   sich die erstellten Disketten nicht starten lassen.

   .. raw:: html

      </div>

#. **Die Disketten vorbereiten**

   Pro Abbild ben?tigen Sie eine Diskette. Es ist wichtig, dass die
   verwendeten Disketten fehlerfrei sind. Sie k?nnen dies sicherstellen,
   indem Sie die Disketten selbst formatieren, verlassen Sie sich bitte
   nicht auf vorformatierte Disketten. Das Formatierprogramm von
   Windows? zeigt fehlerhafte Bl?cke nicht an, es markiert die Bl?cke
   einfach als fehlerhaft und ignoriert sie dann. Benutzen Sie neue
   Disketten, wenn Sie diese Installationsart verwenden.

   .. raw:: html

      <div class="important" xmlns="">

   Wichtig:
   ~~~~~~~~

   Wenn Sie FreeBSD installieren und das Installationsprogramm abst?rzt,
   einfriert oder sich merkw?rdig verh?lt, sind oft fehlerbehaftete
   Disketten die Ursache. Schreiben Sie die Abbilder auf neue Disketten
   und versuchen Sie, noch mal zu installieren.

   .. raw:: html

      </div>

#. **Die Abbilder auf Disketten schreiben**

   Die ``.flp``-Dateien sind *keine* normalen Dateien, die Sie auf eine
   Diskette kopieren. Sie k?nnen die Abbilder *nicht* von einem Laufwerk
   auf ein anderes Laufwerk kopieren. Die Abbilder werden mit einem
   speziellen Werkzeug direkt auf die Diskette geschrieben.

   Wenn Sie die Startdisketten unter MS-DOS? oder Windows? erstellen,
   k?nnen Sie das mitgelieferte Werkzeug ``fdimage`` verwenden.

   Wenn Sie die Abbilder auf der CD-ROM verwenden und das
   CD-ROM-Laufwerk den Laufwerksbuchstaben ``E:`` besitzt, f?hren Sie
   den nachstehenden Befehl aus:

   .. code:: screen

       E:\> tools\fdimage floppies\boot.flp A:

   F?hren Sie das Kommando f?r jede ``.flp``-Datei aus. Wechseln Sie
   bitte jedes Mal die Diskette und beschriften Sie die Diskette mit dem
   Namen der kopierten Datei. Falls Sie die Abbilder an anderer Stelle
   liegen haben, passen Sie bitte die Kommandozeile an. Wenn Sie keine
   CD-ROM besitzen, k?nnen Sie ``fdimage`` aus dem Verzeichnis
   ```tools`` <ftp://ftp.FreeBSD.org/pub/FreeBSD/tools/>`__ des
   FreeBSD-FTP-Servers herunterladen.

   Wenn Sie Startdisketten auf einem UNIX? System (zum Beispiel einem
   anderen FreeBSD System) erstellen, schreiben Sie die Abbilder mit dem
   Befehl
   `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
   direkt auf die Disketten. Auf einem FreeBSD-System lautet die
   Kommandozeile:

   .. code:: screen

       # dd if=boot.flp of=/dev/fd0

   Unter FreeBSD spricht ``/dev/fd0`` das erste Diskettenlaufwerk an
   (das Laufwerk ``A:``), ``/dev/fd1`` spricht das Laufwerk ``B:`` an.
   Andere UNIX? Varianten verwenden unter Umst?nden andere Ger?tenamen,
   die in der Dokumentation des jeweiligen Systems beschrieben sind.

.. raw:: html

   </div>

Nun ist alles f?r die FreeBSD-Installation vorbereitet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------------+--------------------------------------+
| `Zur?ck <install-hardware.html>`__?   | `Nach oben <install.html>`__   | ?\ `Weiter <install-start.html>`__   |
+---------------------------------------+--------------------------------+--------------------------------------+
| 2.2. Hardware-Anforderungen?          | `Zum Anfang <index.html>`__    | ?2.4. Die Installation starten       |
+---------------------------------------+--------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
