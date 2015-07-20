===========================================
2.13. Eigene Installationsmedien herstellen
===========================================

.. raw:: html

   <div class="navheader">

2.13. Eigene Installationsmedien herstellen
`Zur?ck <install-advanced.html>`__?
Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
?\ `Weiter <bsdinstall.html>`__

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

2.13. Eigene Installationsmedien herstellen
-------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Im Folgenden ist mit „Installations-CD“ eine CD-ROM oder DVD gemeint,
die Sie gekauft oder selbst hergestellt haben.

.. raw:: html

   </div>

Oft m?ssen Sie eigene Installationsmedien erzeugen. Dies k?nnen
physische Medien wie B?nder sein oder Installationsquellen sein, aus
denen sysinstall Dateien herunterl?dt, beispielsweise ein lokaler
FTP-Server oder eine MS-DOS?-Partition.

Beispiele:

.. raw:: html

   <div class="itemizedlist">

-  Im lokalen Netzwerk befinden sich viele Maschinen, Sie besitzen
   allerdings nur eine Installations-CD. Den Inhalt der Installations-CD
   wollen Sie auf einem lokalem FTP-Server bereitstellen. Zur
   Installation wird der lokale FTP-Server anstelle eines
   Internet-Servers benutzt.

-  Sie haben eine Installations-CD, allerdings erkennt FreeBSD im
   Gegensatz zu MS-DOS?/Windows? das CD- oder DVD-Laufwerk nicht. Sie
   k?nnen die Installationsdateien auf eine MS-DOS?-Partition desselben
   Rechners kopieren und FreeBSD von der MS-DOS?-Partition installieren.

-  Der Rechner, auf dem Sie FreeBSD installieren wollen, besitzt kein
   CD- oder DVD-Laufwerk. Ein anderer Rechner, zu dem eine serielle oder
   parallele Verbindung besteht, besitzt allerdings ein CD- oder
   DVD-Laufwerk.

-  Sie wollen ein Band erzeugen, mit dem Sie FreeBSD installieren
   k?nnen.

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

2.13.1. Eine Installations-CD-ROM erzeugen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit jeder Release stellt das FreeBSD-Project f?r jede unterst?tzte
Architektur mindestens zwei CD-Abbilder („ISO-Images“) zur Verf?gung.
Wenn Sie einen CD-Brenner besitzen, k?nnen Sie diese Abbilder brennen
und damit FreeBSD installieren. Wenn Sie einen CD-Brenner besitzen und
?ber eine gute Internet-Verbindung verf?gen, ist das die preiswerteste
Art, FreeBSD zu installieren.

.. raw:: html

   <div class="procedure">

#. **Das richtige Abbild herunterladen**

   Die ISO-Abbilder f?r jedes Releases k?nnen Sie von
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/ISO-IMAGES-arch/version`` oder
   einem nahe gelegenen Spiegel herunterladen. Ersetzen Sie *``arch``*
   und *``version``* durch passende Werte.

   Das Verzeichnis enth?lt die folgenden Abbilder:

   .. raw:: html

      <div class="table">

   .. raw:: html

      <div class="table-title">

   Tabelle 2.4. FreeBSD?7.\ *``X``* und 8.\ *``X``* ISO-Abbilder

   .. raw:: html

      </div>

   .. raw:: html

      <div class="table-contents">

   +-------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Dateiname                                       | Inhalt                                                                                                                                                                                                                                                                                                                                                                                       |
   +=================================================+==============================================================================================================================================================================================================================================================================================================================================================================================+
   | ``FreeBSD-version-RELEASE-arch-bootonly.iso``   | Enth?lt alles, was Sie ben?tigen, um um den FreeBSD-Kernel zu laden und das Installationsprogramm zu starten. Die zu installierenden Dateien m?ssen allerdings ?ber FTP oder eine andere geeignete Quelle bezogen werden, da sie in diesem Abbild nicht enthalten sind.                                                                                                                      |
   +-------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version-RELEASE-arch-dvd1.iso.gz``    | Dieses DVD-Abbild enth?lt alle zur Installation von FreeBSD n?tigen Dateien, eine Auswahl an Paketen Dritter sowie die Dokumentation. Zus?tzlich erm?glicht es Ihnen dieses Abbild, einen „livefs“-basierten Rettungsmodus zu starten.                                                                                                                                                       |
   +-------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version-RELEASE-arch-memstick.img``   | Dieses Abbild kann auf einen USB-Stick geschrieben werden. Dieser kann danach als Installationsmedium verwendet werden (wenn Ihr System dies unterst?tzt). Zus?tzlich erm?glicht es Ihnen dieses Abbild, einen „livefs“-basierten Rettungsmodus zu starten. Die FreeBSD-Dokumentation ist ebenfalls enthalten, aber keine Pakete Dritter. Dieses Abbild ist erst ab FreeBSD?8.0 verf?gbar.   |
   +-------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version-RELEASE-arch-disc1.iso``      | Dieses CD-Abbild enth?lt alle f?r die Installation von FreeBSD n?tigen Dateien sowie die Dokumentation. Es sind allerdings keine Pakete Dritter enthalten.                                                                                                                                                                                                                                   |
   +-------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version-RELEASE-arch-disc2.iso``      | So viele Pakete Dritter, wie auf dem Installationsmedium Platz hatten. Dieses Abbild ist f?r FreeBSD?8.\ *``X``* nicht mehr verf?gbar.                                                                                                                                                                                                                                                       |
   +-------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version-RELEASE-arch-disc3.iso``      | Ein weiteres Abbild mit so vielen Paketen Dritter, wie auf dem Installationsmedium Platz hatten. Dieses Abbild ist f?r FreeBSD?8.\ *``X``* nicht mehr verf?gbar.                                                                                                                                                                                                                             |
   +-------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``version-RELEASE-arch-docs.iso``               | Die FreeBSD-Dokumentation.                                                                                                                                                                                                                                                                                                                                                                   |
   +-------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version-RELEASE-arch-livefs.iso``     | Dieses Abbild enth?t einen „livefs“-basierten Rettungsmodus. Eine Installation von FreeBSD ist mit diesem Abbild allerdings nicht m?glich.                                                                                                                                                                                                                                                   |
   +-------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Die Abbilder f?r FreeBSD?7.\ *``X``*-Releases vor FreeBSD?7.3 sowie
   f?r FreeBSD?8.0 wurden noch unterschiedlich benannt. Bei Ihnen fehlt
   die Bezeichnung ``FreeBSD-`` am Anfang des Abbildnamens.

   .. raw:: html

      </div>

   Sie ben?tigen nur eines der beiden Abbilder ``bootonly`` oder
   ``disc1``. Laden Sie bitte nicht beide Abbilder herunter, das
   ``disc1``-Abbild enth?lt alles, was das ``bootonly``-Abbild enth?lt.

   Benutzen Sie das ``bootonly``-Abbild, wenn Sie eine preiswerte
   Internet-Anbindung besitzen. Mit diesem Abbild k?nnen Sie FreeBSD
   installieren. Software Dritter k?nnen Sie anschlie?end mithilfe des
   Ports-Systems (`Kapitel?5, *Installieren von Anwendungen: Pakete und
   Ports* <ports.html>`__) herunterladen.

   Benutzen Sie das ``dvd1``-Abbild, wenn Sie FreeBSD installieren
   wollen und das Installationsmedium eine angemessene Auswahl an
   Software Dritter enthalten soll.

   Die zus?tzlichen Abbilder sind n?tzlich, aber nicht notwendig,
   insbesondere wenn Sie eine schnelle Internet-Verbindung besitzen.

#. **Die CDs brennen**

   Sie m?ssen die Abbilder auf eine CD brennen. Das Brennen von CDs
   unter FreeBSD wird in `Abschnitt?19.6, „CDs
   benutzen“ <creating-cds.html>`__ erl?utert (sehen Sie sich
   insbesondere `Abschnitt?19.6.3,
   „burncd“ <creating-cds.html#burncd>`__ und `Abschnitt?19.6.4,
   „cdrecord“ <creating-cds.html#cdrecord>`__ an).

   Wenn Sie die CDs unter einem anderen Betriebssystem erstellen,
   benutzen Sie die entsprechenden Werkzeuge des Betriebssystems. Die
   Abbilder sind Standard-ISO-Abbilder und k?nnen von vielen
   Brennprogrammen verarbeitet werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie eine angepasste Version von FreeBSD erstellen wollen, sollten
Sie den `Release Engineering
Article <../../../../doc/en_US.ISO8859-1/articles/releng>`__ lesen.

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

2.13.2. Einen lokalen FTP-Server einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Dateien auf der Installations-CD sind genauso angeordnet wie auf den
FreeBSD-FTP-Servern. Daher ist es einfach, einen lokalen FTP-Server f?r
die FreeBSD-Installation ?ber ein Netzwerk einzurichten.

.. raw:: html

   <div class="procedure">

#. H?ngen Sie auf dem FTP-Server die CD-ROM in das Verzeichnis
   ``/cdrom`` ein:

   .. code:: screen

       # mount /cdrom

#. Legen Sie ein Konto f?r Anonymous-FTP an. Dazu editieren Sie die
   Datei ``/etc/passwd`` mit dem Kommando
   `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__
   und f?gen die nachstehende Zeile hinzu:

   .. code:: programlisting

       ftp:*:99:99::0:0:FTP:/cdrom:/nonexistent

#. Stellen Sie sicher, dass der FTP-Dienst in der Datei
   ``/etc/inetd.conf`` aktiviert ist.

.. raw:: html

   </div>

Jeder, der Ihren Rechner ?ber das Netzwerk erreicht, kann nun FreeBSD
?ber FTP installieren. In sysinstall wird dazu FTP als
Installationsmedium w?hlt. Der FTP-Server wird durch die Auswahl Other
(andere als die vorgegebenen Server) und anschlie?ende Eingabe von
**``ftp://Ihr Rechner``** festgelegt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn die Version der f?r die FTP-Installation Ihrer Clients verwendeten
Bootmedien (normalerweise Disketten) nicht exakt der von Ihnen auf Ihrem
lokalen FTP-Server angebotenen Version entspricht, ist sysinstall nicht
in der Lage, die Installation abzuschlie?en. Sind die Versionsnummern
unterschiedlich, k?nnen Sie durch das Aufrufen des Punktes Options
sysinstall dazu zwingen, die Installation dennoch abzuschlie?en. Dazu
setzen Sie den Namen der Distribution auf any.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Diese Vorgehensweise ist in Ihrem lokalen Netzwerk, das durch eine
Firewall gesch?tzt ist, v?llig in Ordnung. Wenn Sie FTP f?r Rechner auf
dem Internet (und nicht f?r lokale Rechner) anbieten, zieht Ihr Server
die Aufmerksamkeit von Crackern und andere Unannehmlichkeiten auf sich.
Achten Sie in diesem Fall darauf, dass Sie gute Sicherheitsverfahren
anwenden.

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

2.13.3. Installationsdisketten erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie, was wir *nicht* empfehlen, von Disketten installieren m?ssen,
weil Disketten das einzig unterst?tzte Installationsmedium sind oder Sie
es sich einfach schwer machen wollen, m?ssen Sie zun?chst einige
Disketten vorbereiten.

Sie m?ssen mindestens den Inhalt des Verzeichnisses ``base`` auf 1.44?MB
Disketten kopieren. Wenn Sie die Disketten unter MS-DOS? erstellen,
*m?ssen* Sie die Disketten mit dem MS-DOS?-Kommando ``FORMAT``
formatieren. Unter Windows? k?nnen Sie Disketten mithilfe des Explorers
formatieren (klicken Sie mit der rechten Maustaste auf das
``A:``-Laufwerk und w?hlen Sie Format aus).

Vertrauen Sie vorformatierten Disketten nicht; formatieren Sie die
Disketten zur Sicherheit immer selbst. In der Vergangenheit waren
vorformatierte Disketten der Verursacher vieler Probleme.

Falls Sie die Disketten auf einer FreeBSD-Maschine erstellen, sollten
Sie immer noch formatieren. Allerdings brauchen Sie kein
MS-DOS?-Dateisystem auf den Disketten anzulegen. Mit den Kommandos
``bsdlabel`` und ``newfs`` k?nnen Sie das Dateisystem UFS verwenden, wie
im nachstehenden Beispiel f?r 3.5" 1.44?MB Disketten gezeigt:

.. code:: screen

    # fdformat -f 1440 fd0.1440
    # bsdlabel -w fd0.1440 floppy3
    # newfs -t 2 -u 18 -l 1 -i 65536 /dev/fd0

Anschlie?end k?nnen Sie die Disketten wie ein normales Dateisystem
einh?ngen und beschreiben.

Nachdem Sie die Disketten formatiert haben, kopieren Sie die Dateien der
Distribution auf die Disketten. Die Dateien der Distribution sind in
St?cke geteilt, sodass f?nf Dateien auf eine 1.44?MB Diskette passen.
Kopieren Sie die gew?nschten Distribution auf Disketten, wobei Sie so
viele Dateien wie m?glich auf eine Diskette kopieren. Jede Distribution
wird auf der Diskette in einem eigenen Verzeichnis abgelegt,
beispielsweise ``a:\base\base.aa``, ``a:\base\base.ab`` und so weiter.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Die Datei ``base.inf`` muss unbedingt auf die erste Diskette des
``base``-Diskettensatzes kopiert werden, damit das Installationsprogramm
feststellen kann, wie viele Disketten geladen werden m?ssen, um die
Distribution wieder zusammenzusetzen.

.. raw:: html

   </div>

Im Installationsprozess w?hlen Sie als Installationsmedium Floppy aus.
Folgen Sie dann den gegebenen Anweisungen.

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

2.13.4. Von einer MS-DOS?-Partition installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um eine Installation von einer MS-DOS?-Partition vorzubereiten, kopieren
Sie Dateien der Distributionen in das Verzeichnis ``freebsd`` direkt
unterhalb des Wurzelverzeichnisses (zum Beispiel ``c:\freebsd``). In
diesem Verzeichnis muss sich dieselbe Verzeichnisstruktur wie auf dem
Installationsmedium befinden. Wenn Sie die Dateien von einer
Installations-CD kopieren, empfehlen wir den MS-DOS?-Befehl ``xcopy``.
Das nachstehende Beispiel bereitet eine minimale Installation von
FreeBSD vor:

.. code:: screen

    C:\> md c:\freebsd
    C:\> xcopy e:\bin c:\freebsd\bin\ /s
    C:\> xcopy e:\manpages c:\freebsd\manpages\ /s

Im Beispiel wurde angenommen, dass auf Laufwerk ``C:`` ausreichend Platz
vorhanden ist und die CD-ROM Laufwerk ``E:`` ist.

Wenn Sie kein CD-Laufwerk besitzen, k?nnen Sie die Distributionen von
`ftp.FreeBSD.org <ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/10.1-RELEASE/>`__
herunterladen. Jede Distribution liegt in einem eigenen Verzeichnis.
Beispielsweise liegt die Base-Distribution im Verzeichnis
`10.1/base/ <ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/10.1-RELEASE/base/>`__.

Kopieren Sie jede Distribution, die Sie von einer MS-DOS?-Partition
installieren wollen (und f?r die Platz ist) in das Verzeichnis
``c:\freebsd``. F?r eine minimale Installation ben?tigen Sie nur die
Base-Distribution.

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

2.13.5. Ein Installationsband erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Sie nicht ?ber FTP oder von einer CD-ROM installieren k?nnen, ist
die Installation von Band wahrscheinlich die einfachste Methode. Das
Installationsprogramm erwartet, dass sich die Distributionen im
``tar``-Format auf dem Band befinden. Von den Distributions-Dateien
erstellen Sie das Installationsband einfach mit dem Kommando ``tar``:

.. code:: screen

    # cd /freebsd/distdir
    # tar cvf /dev/rwt0 dist1 ... dist2

Stellen Sie w?hrend der Installation sicher, dass Sie ?ber gen?gend
freien Platz in einem tempor?ren Verzeichnis (das Sie festlegen k?nnen)
verf?gen. Das tempor?re Verzeichnis muss den *gesamten* Inhalt des Bands
aufnehmen k?nnen. Da auf B?nder nicht wahlfrei zugegriffen werden kann,
ben?tigt diese Installationsmethode tempor?r sehr viel Platz.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das Band muss sich vor dem Neustart mit der Startdiskette im Laufwerk
befinden. Ansonsten wird das Band w?hrend der Ger?teerkennung vielleicht
nicht erkannt.

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

2.13.6. Eine Netzwerkinstallation vorbereiten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen drei Verbindungsarten f?r eine Netzwerkinstallation benutzen:
Eine Ethernet-Verbindung, eine serielle Verbindung (PPP), oder eine
parallele Verbindung (PLIP, Laplink-Kabel).

Die schnellste Netzwerkinstallation ist nat?rlich mit einer
Netzwerkkarte m?glich. FreeBSD unterst?tzt die meisten der ?blichen
Netzwerkkarten. Eine Liste der unterst?tzten Netzwerkkarten ist in den
Hardware-Notes jedes Releases enthalten. Wenn Sie eine unterst?tzte
PCMCIA-Netzwerkkarte benutzen, stellen Sie sicher, dass die Karte
eingesteckt ist, *bevor* der Laptop eingeschaltet wird. Leider
unterst?tzt FreeBSD das Einstecken von PCMCIA-Karten w?hrend der
Installation noch nicht.

F?r eine Netzwerkinstallation m?ssen Sie Ihre IP-Adresse, die
Netzwerkmaske und den Namen Ihres Rechner kennen. Wenn Sie ?ber eine
PPP-Verbindung installieren und keine feste IP-Adresse besitzen, braucht
Sie der vorgehende Satz nicht zu beunruhigen. Sie k?nnen eine IP-Adresse
dynamisch von Ihrem ISP beziehen. Fragen Sie Ihren Systemadministrator
nach den richtigen Netzwerkeinstellungen. Wenn Sie andere Rechner ?ber
Namen anstatt ?ber IP-Adressen erreichen wollen, brauchen Sie zudem
einen Nameserver und m?glicherweise die Adresse eines Gateways (mit PPP
ist das die Adresse des ISPs), ?ber den Sie den Nameserver erreichen.
Wenn Sie von einem FTP-Server ?ber einen HTTP-Proxy installieren wollen,
ben?tigen Sie au?erdem noch die Adresse des Proxy-Servers. Wenn Sie
nicht alle oder zumindest die meisten der ben?tigten Daten kennen,
sollten Sie wirklich *vor* der Installation mit Ihrem
Systemadministrator oder ISP reden!

Wenn Sie ein Modem benutzen, ist PPP ziemlich sicher die einzige Wahl.
Stellen Sie sicher, dass Sie die Daten Ihres Service Providers
bereitliegen haben, da Sie w?hrend der Installation die Daten fr?h
ben?tigen.

Wenn Sie PAP oder CHAP benutzen, um sich mit Ihrem ISP zu verbinden
(wenn Sie unter Windows? kein Skript ben?tigen, um die Verbindung
herzustellen), brauchen Sie an der ppp-Eingabeaufforderung nur das
Kommando ``dial`` abzusetzen. Ansonsten m?ssen Sie sich mit
Modem-spezifischen AT-Kommandos bei Ihrem ISP einw?hlen (PPP stellt nur
einen einfachen Terminal-Emulator zur Verf?gung). Weiteres ?ber PPP
erfahren Sie im Abschnitt `User-PPP <userppp.html>`__ des Handbuchs und
im
`PPP-Abschnitt <../../../../doc/de_DE.ISO8859-1/books/faq/ppp.html>`__
der FAQ. Bei Problemen k?nnen Sie mit dem Kommando ``set log local``
Meldungen auf den Bildschirm umleiten.

Wenn eine feste Verbindung zu einer anderen FreeBSD-Maschine besteht,
sollten Sie ein paralleles Laplink-Kabel in Betracht ziehen. ?ber eine
parallele Verbindung sind h?hrere Geschwindigkeiten als ?ber eine
serielle Verbindung (typischerweise bis zu 50?kByte/s) m?glich. Daher
ist die Installation ?ber eine parallele Verbindung schneller als eine
Installation ?ber eine serielle Verbindung.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.13.6.1. Eine NFS-Installation vorbereiten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine NFS-Installation ist unkompliziert. Kopieren Sie einfach die
Distributionen auf einen NFS-Server und w?hlen Sie NFS als
Installationsmedium aus.

Wenn der NFS-Server nur Verbindungen ?ber privilegierte Ports (Ports
kleiner 1024) annimmt, setzen Sie vor der Installation die Option
``NFS Secure`` im Men? Options.

Wenn Sie eine schlechte Netzwerkkarte besitzen, die sehr langsam ist,
w?hlen Sie die Option ``NFS Slow``.

Damit die NFS-Installation funktioniert, muss der NFS-Server auch
Unterverzeichnisse von exportierten Verzeichnissen zum Einh?ngen
freigeben. Wenn beispielsweise die Distribution von FreeBSD?10.1 unter
``ziggy:/usr/archive/stuff/FreeBSD`` liegt, muss der Rechner ``ziggy``
erlauben, das Verzeichnis ``/usr/archive/stuff/FreeBSD`` einzuh?ngen. Es
reicht nicht, dass ``ziggy`` erlaubt das Verzeichnis ``/usr`` oder
``/usr/archive/stuff`` einzuh?ngen.

Unter FreeBSD werden diese Freigaben in der Datei ``/etc/exports`` mit
der Option ``-alldirs`` eingestellt. Die n?tigen Einstellungen k?nnen
auf einem anderen NFS-Server unterschiedlich sein. Wenn Sie vom
NFS-Server die Fehlermeldung permission denied erhalten, dann haben Sie
wahrscheinlich die Freigaben nicht richtig konfiguriert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+--------------------------------+------------------------------------------------------------+
| `Zur?ck <install-advanced.html>`__?      | `Nach oben <install.html>`__   | ?\ `Weiter <bsdinstall.html>`__                            |
+------------------------------------------+--------------------------------+------------------------------------------------------------+
| 2.12. Anspruchsvollere Installationen?   | `Zum Anfang <index.html>`__    | ?Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren   |
+------------------------------------------+--------------------------------+------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
