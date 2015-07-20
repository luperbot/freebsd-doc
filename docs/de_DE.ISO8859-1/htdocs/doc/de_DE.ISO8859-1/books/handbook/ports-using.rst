================================
5.5. Benutzen der Ports-Sammlung
================================

.. raw:: html

   <div class="navheader">

5.5. Benutzen der Ports-Sammlung
`Zur?ck <packages-using.html>`__?
Kapitel 5. Installieren von Anwendungen: Pakete und Ports
?\ `Weiter <ports-nextsteps.html>`__

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

5.5. Benutzen der Ports-Sammlung
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden Abschnitte stellen die grundlegenden Anweisungen vor, um
Anwendungen aus der Ports-Sammlung auf Ihren Rechner zu installieren
oder zu l?schen.
`ports(7) <http://www.FreeBSD.org/cgi/man.cgi?query=ports&sektion=7>`__
enth?lt eine Auflistung aller verf?gbaren ``make``-Targets und
Umgebungsvariablen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.5.1. Installation der Ports-Sammlung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie einen Port installieren k?nnen, m?ssen Sie zuerst die
Ports-Sammlung installieren, die aus Makefiles, Patches und
Beschreibungen besteht. Die Ports-Sammlung wird f?r gew?hnlich unter
``/usr/ports`` installiert.

Bei der FreeBSD-Installation hatten Sie in sysinstall die M?glichkeit,
die Ports-Sammlung zu installieren. Wenn Sie die Sammlung damals nicht
installiert haben, k?nnen Sie das mit den folgenden Anweisungen
nachholen:

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Prozedur 5.1. Installieren mit CVSup

.. raw:: html

   </div>

Dies ist eine schnelle Methode, um die Ports-Sammlung zu installieren
und zu aktualisieren. CVSup wird im Abschnitt `Benutzen von
CVSup <cvsup.html>`__ des Handbuchs beschrieben.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die im Basissystem enthaltene Variante des CVSup-Protokolls hei?t csup.

.. raw:: html

   </div>

Achten Sie darauf, dass das Verzeichnis ``/usr/ports`` leer ist, bevor
Sie csup das erste Mal ausf?hren! Haben Sie die Ports-Sammlung zuvor
schon aus einer anderen Quelle installiert, wird csup bereits aus dem
Repository entfernte Patches nicht aus der lokalen Kopie der
Ports-Sammlung l?schen.

#. Rufen Sie ``csup`` auf:

   .. code:: screen

       # csup -L 2 -h cvsup.FreeBSD.org /usr/share/examples/cvsup/ports-supfile

   Ersetzen Sie *``cvsup.FreeBSD.org``* durch einen CVSup-Server in
   Ihrer N?he. Eine vollst?ndige Liste der CVSup-Spiegel finden Sie im
   Abschnitt `CVSup-Server <cvsup.html#cvsup-mirrors>`__ des Handbuchs.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Sie sollten sich eine an Ihre Bed?rfnisse angepasste
   ``ports-supfile`` erstellen, um so beispielsweise zu vermeiden, dass
   Sie bei jedem Aufruf von CVSup wieder die Parameterliste ?bergeben
   m?ssen.

   .. raw:: html

      <div class="procedure" xmlns="http://www.w3.org/1999/xhtml">

   #. Dazu kopieren Sie zuerst als ``root`` die Datei
      ``/usr/share/examples/cvsup/ports-supfile`` nach ``/root`` oder in
      Ihr Heimatverzeichnis.

   #. Danach m?ssen Sie die Datei ``ports-supfile`` anpassen.

   #. Dazu ersetzen Sie *``cvsup.FreeBSD.org``* durch einen CVSup-Server
      in Ihrer N?he. Eine vollst?ndige Liste der CVSup-Spiegel finden
      Sie im Abschnitt `CVSup-Server <cvsup.html#cvsup-mirrors>`__ des
      Handbuchs.

   #. Nun k?nnen Sie ``csup`` mit folgender Syntax starten:

      .. code:: screen

          # csup -L 2 /root/ports-supfile

   .. raw:: html

      </div>

   .. raw:: html

      </div>

#. Mit
   `csup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csup&sektion=1>`__
   k?nnen Sie sp?ter auch die Ports-Sammlung aktualisieren. Die
   installierten Ports werden mit diesem Kommando allerdings nicht
   aktualisiert.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Prozedur 5.2. Installieren mit Portsnap

.. raw:: html

   </div>

Bei Portsnap handelt es sich um ein alternatives System zur Distribution
der Ports-Sammlung. Eine detaillierte Beschreibung von Portsnap finden
Sie im Abschnitt `Portsnap: Ein Werkzeug zur Aktualisierung der
Ports-Sammlung <updating-upgrading-portsnap.html>`__ des Handbuchs.

#. Laden Sie einen komprimierten Snapshot der Ports-Sammlung in das
   Verzeichnis ``/var/db/portsnap`` herunter. Danach k?nnen Sie die
   Internetverbindung trennen, wenn Sie dies w?nschen.

   .. code:: screen

       # portsnap fetch

#. Wenn Sie Portsnap das erste Mal verwenden, m?ssen Sie den Snapshot
   nach ``/usr/ports`` extrahieren:

   .. code:: screen

       # portsnap extract

   Ist die Ports-Sammlung bereits installiert, und Sie wollen diese nur
   aktualisieren, f?hren Sie stattdessen folgenden Befehl aus:

   .. code:: screen

       # portsnap update

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Prozedur 5.3. Installieren mit sysinstall

.. raw:: html

   </div>

Nicht zuletzt ist es auch m?glich, die Ports-Sammlung ?ber sysinstall zu
installieren. Beachten Sie dabei aber, dass bei dieser Methode nicht die
aktuellste Version der Ports-Sammlung, sondern die Version, die zum
Zeitpunkt der Ver?ffentlichung der installierten FreeBSD-Version aktuell
war, installiert wird. Haben Sie Zugriff auf das Internet, so sollten
Sie daher stets eine der weiter oben beschriebenen Methoden verwenden,
um die Ports-Sammlung zu installieren.

#. F?hren Sie als ``root`` ``sysinstall`` aus:

   .. code:: screen

       # sysinstall

#. W?hlen Sie den Punkt Configure aus und dr?cken Sie **Enter**.

#. W?hlen Sie dann Distributions aus und dr?cken Sie **Enter**.

#. In diesem Men? w?hlen Sie ports aus und dr?cken die **Leertaste**.

#. Danach w?hlen Sie ``Exit`` aus und dr?cken **Enter**.

#. Legen Sie nun ein geeignetes Installationsmedium, wie CD-ROM oder
   FTP, fest.

#. W?hlen Sie nun ``Exit`` aus und dr?cken **Enter**.

#. Verlassen Sie sysinstall mit **X**.

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

5.5.2. Ports installieren
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Was ist mit einem „Ger?st“ im Zusammenhang mit der Ports-Sammlung
gemeint? In aller K?rze: ein Ger?st eines Ports ist ein minimaler Satz
von Dateien, mit denen das FreeBSD-System eine Anwendung sauber
?bersetzen und installieren kann. Ein jeder Port beinhaltet:

.. raw:: html

   <div class="itemizedlist">

-  Eine Datei ``Makefile``. Das ``Makefile`` enth?lt verschiedene
   Anweisungen, die spezifizieren, wie eine Anwendung kompiliert wird
   und wo sie auf Ihrem System installiert werden sollte.

-  Eine Datei ``distinfo``. Diese enth?lt Informationen, welche Dateien
   heruntergeladen werden m?ssen sowie deren MD5-Pr?fsummen (die Sie mit
   `sha256(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sha256&sektion=1>`__
   ?berpr?fen k?nnen, um sicher zu gehen, dass diese Dateien w?hrend des
   Herunterladens nicht besch?digt wurden).

-  Ein ``files`` Verzeichnis. Hierin liegen Patches, welche das
   ?bersetzen und Installieren der Anwendung erm?glichen. Patches sind
   im Wesentlichen kleine Dateien, die ?nderungen an speziellen Dateien
   spezifizieren. Sie liegen als reiner Text vor und sagen ungef?hr:
   „L?sche Zeile 10“ oder „?ndere Zeile 26 zu ...“. Patches sind auch
   bekannt unter dem Namen „diffs“, weil Sie mit dem Programm
   `diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
   erstellt werden.

   Dieses Verzeichnis kann auch noch andere Dateien enthalten, welche
   zum Bauen des Ports benutzt werden.

-  Eine Datei ``pkg-descr``. Eine ausf?hrlichere, oft mehrzeilige
   Beschreibung der Anwendung.

-  Eine Datei ``pkg-plist``. Das ist eine Liste aller Dateien, die durch
   diesen Port installiert werden. Au?erdem sind hier Informationen
   enthalten, die zum Entfernen des Ports ben?tigt werden.

.. raw:: html

   </div>

Einige Ports besitzen noch andere Dateien, wie ``pkg-message``, die vom
Portsystem benutzt werden, um spezielle Situationen zu handhaben. Wenn
Sie mehr ?ber diese Dateien oder das Port-System erfahren sollen, lesen
Sie bitte das `FreeBSD Porter's
Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook/index.html>`__.

Ein Port enth?lt lediglich Anweisungen, wie der Quelltext zu bauen ist,
nicht aber den eigentlichen Quelltext. Den Quelltext erhalten Sie von
einer CD-ROM oder aus dem Internet. Quelltexte werden in einem Format
nach Wahl des jeweiligen Software-Autors ausgeliefert. H?ufig ist dies
ein gezipptes Tar-Archiv, aber es kann auch mit einem anderen Tool
komprimiert oder gar nicht komprimiert sein. Der Quelltext, in welcher
Form er auch immer vorliegen mag, wird „Distfile“ genannt. Die zwei
Methoden, mit denen ein Port installiert wird, werden unten besprochen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Zum Installieren von Ports m?ssen Sie als Benutzer ``root`` angemeldet
sein.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Stellen Sie sicher, dass die Ports-Sammlung aktuell ist, bevor Sie einen
Port installieren. Informieren Sie sich vorher zus?tzlich unter
``http://vuxml.FreeBSD.org/`` ?ber m?gliche Sicherheitsprobleme des zu
installierenden Ports.

Vor der Installation kann portaudit eine neue Anwendung automatisch auf
Sicherheitsl?cher pr?fen. Das Werkzeug befindet sich in der
Ports-Sammlung
(`ports-mgmt/portaudit <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portaudit/pkg-descr>`__).
Vor der Installation einer neuen Anwendung sollten Sie mit
``portaudit -F`` die Sicherheitsdatenbank aktualisieren. Die t?glich
laufende Sicherheitspr?fung des Systems aktualisiert die Datenbank und
pr?ft installierte Anwendungen auf vorhandene Sicherheitsl?cher.
Weiteres erfahren Sie in den Hilfeseiten
`portaudit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portaudit&sektion=1>`__
und
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__.

.. raw:: html

   </div>

Die Ports-Sammlung geht davon, dass Ihr System ?ber eine funktionierende
Internetverbindung verf?gt. Ist dies nicht der Fall, m?ssen Sie eine
Kopie des zu installierenden Distfiles manuell nach
``/usr/ports/distfiles`` kopieren.

Dazu wechseln Sie als erstes in das Verzeichnis des Ports, den Sie
installieren wollen:

.. code:: screen

    # cd /usr/ports/sysutils/lsof

Im Verzeichnis ``lsof`` kann man das Ger?st erkennen. Der n?chste
Schritt ist das ?bersetzen (auch Bauen genannt) des Ports durch die
Eingabe des Befehls ``make``:

.. code:: screen

    # make
    >> lsof_4.57D.freebsd.tar.gz doesn't seem to exist in /usr/ports/distfiles/.
    >> Attempting to fetch from ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/.
    ===>  Extracting for lsof-4.57
    ...
    [Ausgabe des Auspackens weggelassen]
    ...
    >> Checksum OK for lsof_4.57D.freebsd.tar.gz.
    ===>  Patching for lsof-4.57
    ===>  Applying FreeBSD patches for lsof-4.57
    ===>  Configuring for lsof-4.57
    ...
    [configure-Ausgabe weggelassen]
    ...
    ===>  Building for lsof-4.57
    ...
    [Ausgabe der ?bersetzung weggelassen]
    ...
    #

Ist die ?bersetzungsprozedur beendet, landen Sie wiederum in der
Kommandozeile und k?nnen das Programm im n?chsten Schritt installieren.
Dazu verwenden Sie den Befehl ``make       install``:

.. code:: screen

    # make install
    ===>  Installing for lsof-4.57
    ...
    [Ausgabe der Installation weggelassen]
    ...
    ===>   Generating temporary packing list
    ===>   Compressing manual pages for lsof-4.57
    ===>   Registering installation for lsof-4.57
    ===>  SECURITY NOTE:
          This port has installed the following binaries which execute with
          increased privileges.
    #

Nachdem die Installation abgeschlossen ist, k?nnen Sie die gerade
installierte Anwendung starten. Da ``lsof`` eine Anwendung ist, die mit
erh?hten Rechten l?uft, wird eine Sicherheitswarnung angezeigt. Sie
sollten alle Warnungen w?hrend des Baus und der Installation eines Ports
beachten.

Es ist eine gute Idee, das Unterverzeichnis ``work`` nach erfolgter
Installation wieder zu l?schen. Einerseits gewinnen Sie dadurch
Speicherplatz, andererseits k?nnte es sonst zu Problemen bei der
Aktualisierung des Ports auf eine neuere Version kommen.

.. code:: screen

    # make clean
    ===>  Cleaning for lsof-4.57
    #

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie k?nnen zwei Schritte sparen, wenn Sie gleich ``make install clean ``
anstelle von ``make``, ``make         install`` und
``make         clean`` eingeben.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Um die Suche nach Kommandos zu beschleunigen, speichern einige Shells
eine Liste der verf?gbaren Kommandos in den durch die Umgebungsvariable
``PATH`` gegebenen Verzeichnissen. Nach der Installation eines Ports
m?ssen Sie in einer solchen Shell vielleicht das Kommando ``rehash``
absetzen, um die neu installierten Kommandos benutzen zu k?nnen. Das
Kommando ``rehash`` gibt es in Shells wie der ``tcsh``. Unter Shells wie
der ``sh`` benutzen Sie das Kommando ``hash -r``. Weiteres entnehmen Sie
bitte der Dokumentation Ihrer Shell.

.. raw:: html

   </div>

Einige von Dritten angebotenen DVD-ROM-Produkte wie das FreeBSD Toolkit
von der `FreeBSD Mall <http://www.freebsdmall.com/>`__ enthalten auch
Distfiles (komprimierte Quellcodepakete). Diese lassen sich ?ber die
Ports-Sammlung installieren. Dazu h?ngen Sie die DVD-ROM unter
``/cdrom`` in den Verzeichnisbaum ein. Wenn Sie einen anderen Mountpunkt
verwenden, sollten Sie die make-Variable ``CD_MOUNTPTS`` setzen, damit
die auf der DVD-ROM enthaltenen Distfiles automatisch verwendet werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Beachten Sie bitte, dass die Lizenzen einiger Ports die Einbeziehung auf
der CD-ROM verbieten. Das kann verschiedene Gr?nde haben. Beispielsweise
eine Registrierung vor dem Herunterladen erforderlich oder die
Weiterverteilung ist verboten. Wenn Sie einen Port installieren wollen,
der nicht auf der CD-ROM enthalten ist, m?ssen Sie online sein.

.. raw:: html

   </div>

Die Ports-Sammlung benutzt zum Herunterladen von Dateien
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__,
das Umgebungsvariablen wie ``FTP_PASSIVE_MODE``, ``FTP_PROXY`` und
``FTP_PASSWORD`` ber?cksichtigt. Wenn Sie durch eine Firewall gesch?tzt
werden, m?ssen Sie vielleicht eine oder mehrere dieser
Umgebungsvariablen setzen, oder einen FTP oder HTTP Proxy verwenden.
Eine Liste der unterst?tzten Umgebungsvariablen finden Sie in
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__.

Benutzer ohne eine st?ndige Internet-Verbindung werden das Kommando
``make fetch`` zu sch?tzen wissen. Das Kommando l?dt alle ben?tigten
Dateien eines Ports herunter. Sie k?nnen das Kommando im Verzeichnis
``/usr/ports`` laufen lassen. In diesem Fall werden *alle* Dateien
heruntergeladen. Es ist auch m?glich, ``make       fetch`` nur in einem
Teil des Baums, wie ``/usr/ports/net``, aufzurufen. Die Dateien von
allen abh?ngigen Ports werden mit diesem Kommando allerdings nicht
heruntergeladen. Wenn Sie diese Dateien ebenfalls herunterladen wollen,
ersetzen Sie im Kommando ``fetch`` durch ``fetch-recursive``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Abh?ngig davon, in welchem Verzeichnis Sie ``make`` aufrufen, k?nnen Sie
analog zu ``make fetch`` die Ports einer Kategorie oder alle Ports
bauen. Beachten Sie allerdings, dass manche Ports nicht zusammen
installiert werden k?nnen. Weiterhin gibt es F?lle, in denen zwei Ports
unterschiedliche Inhalte in derselben Datei speichern wollen.

.. raw:: html

   </div>

Manchmal ist es erforderlich, die ben?tigten Dateien von einem anderen
Ort als den im Port vorgesehenen herunterzuladen. Der Ort wird durch die
Variable ``MASTER_SITES`` vorgegeben, die Sie wie folgt ?berschreiben
k?nnen:

.. code:: screen

    # cd /usr/ports/directory
    # make MASTER_SITE_OVERRIDE= \
    ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/distfiles/ fetch

Im Beispiel wurde ``MASTER_SITES`` mit dem Wert
``ftp.FreeBSD.org/pub/FreeBSD/ports/distfiles/`` ?berschrieben.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Einige Ports besitzen Optionen, mit denen Sie zus?tzliche Funktionen
oder Sicherheitsoptionen einstellen k?nnen (oder manchmal auch m?ssen).
Zus?tzliche Optionen k?nnen beispielsweise f?r
`www/firefox <http://www.freebsd.org/cgi/url.cgi?ports/www/firefox/pkg-descr>`__,
`security/gpgme <http://www.freebsd.org/cgi/url.cgi?ports/security/gpgme/pkg-descr>`__
und
`mail/sylpheed-claws <http://www.freebsd.org/cgi/url.cgi?ports/mail/sylpheed-claws/pkg-descr>`__
angegeben werden. Wenn ein Port ?ber zus?tzliche Optionen verf?gt,
werden diese beim Bau des Ports auf der Konsole ausgegeben.

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

5.5.2.1. Vorgabe-Verzeichnisse ?ndern
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal ist es n?tzlich (oder erforderlich), in anderen Verzeichnissen
zu arbeiten. Die Verzeichnisse k?nnen Sie mit den Variablen
``WRKDIRPREFIX`` und ``PREFIX`` einstellen. Die Variable
``WRKDIRPREFIX`` gibt das Bauverzeichnis an:

.. code:: screen

    # make WRKDIRPREFIX=/usr/home/example/ports install

Dieses Kommando baut den Port in ``/usr/home/example/ports`` und
installiert ihn unter ``/usr/local``.

Die Variable ``PREFIX`` legt das Installations-Verzeichnis fest:

.. code:: screen

    # make PREFIX=/usr/home/example/local install

In diesem Beispiel wird der Port unter ``/usr/ports`` gebaut und nach
``/usr/home/example/local`` installiert.

Sie k?nnen beide Variablen auch zusammen benutzen:

.. code:: screen

    # make WRKDIRPREFIX=../ports PREFIX=../local install

Die Kommandozeile ist zu lang, um sie hier komplett wiederzugeben, aber
Sie sollten die zugrunde liegende Idee erkennen.

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

5.5.2.2. Probleme mit ``imake``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Ports, welche
`imake(1) <http://www.FreeBSD.org/cgi/man.cgi?query=imake&sektion=1>`__
(Teil des X-Window-Systems) benutzen, funktionieren nicht gut mit
``PREFIX`` und bestehen darauf, unter ``/usr/X11R6`` installiert zu
werden. In ?hnlicher Weise verhalten sich einige Perl-Ports, die
``PREFIX`` ignorieren und sich in den Perl-Verzeichnisbaum installieren.
Zu erreichen, dass solche Ports ``PREFIX`` beachten, ist schwierig oder
sogar unm?glich.

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

5.5.2.3. Ports rekonfigurieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beim Bau einiger Ports erhalten Sie ein ncurses-basiertes Men?, ?ber
dessen Optionen Sie den Bau dieser Ports beeinflussen k?nnen. Es gibt
diverse M?glichkeiten, dieses Men? nach dem Bau eines Ports erneut
aufzurufen, um beispielsweise Optionen zu entfernen, hinzuzuf?gen oder
anzupassen. Sie k?nnen beispielsweise in das Verzeichnis des Ports
wechseln und dort den Befehl ``make`` ``config`` eingeben, wodurch das
Men? mit den urspr?nglichen gew?hlten Optionen erneut aufgerufen wird.
Eine andere M?glichkeit bietet der Befehl ``make`` ``showconfig``, mit
dem Sie eine Liste aller Konfigurationsoptionen dieses Ports aufrufen.
Eine weitere Alternative bietet der Befehl ``make`` ``rmconfig``, der
die von Ihnen urspr?nglich gew?hlten Optionen zur?cksetzt und es Ihnen
dadurch erm?glicht, die Konfiguration erneut zu beginnen. Die eben
erw?hnten Optionen (und viele andere) werden ausf?hrlich in der
Manualpage
`ports(7) <http://www.FreeBSD.org/cgi/man.cgi?query=ports&sektion=7>`__
beschrieben.

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

5.5.3. Entfernen installierter Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da Sie nun wissen, wie man einen Port installiert, wollen Sie sicher
auch wissen, wie man ein ?ber einen Port installiertes Programm wieder
deinstallieren kann. Ports werden analog zu Paketen mit
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__
deinstalliert (Lesen Sie sich den Abschnitt `Benutzen des
Paketsystems <packages-using.html>`__ des Handbuchs durch, wenn Sie
weitere Informationen ben?tigen.). F?r das vorhin installierte Programm
``lsof`` w?rden Sie dazu wie folgt vorgehen:

.. code:: screen

    # pkg_delete lsof-4.57

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

5.5.4. Ports aktualisieren
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als erstes sollten sie sich alle installierten Ports anzeigen lassen,
von denen eine aktuellere Version in der Ports-Sammlung existiert. Dazu
verwenden Sie den Befehl
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1>`__:

.. code:: screen

    # pkg_version -v

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.5.4.1. ``/usr/ports/UPDATING``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie die Ports-Sammlung auf den neusten Stand gebracht haben,
lesen Sie bitte zuerst die Datei ``/usr/ports/UPDATING``, bevor Sie
einen Port aktualisieren. In dieser Datei werden Probleme und zus?tzlich
durchzuf?hrende Schritte bei der Aktualisierung einzelner Ports
beschrieben. Dazu geh?ren solche Dinge wie ge?nderte Dateiformate,
verschobene Konfigurationsdateien, aber auch Inkompatibilit?ten zu einer
Vorg?ngerversion.

Sollte ``UPDATING`` etwas hier Gesagtem widersprechen, so gilt das in
``UPDATING`` Gesagte.

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

5.5.4.2. Ports mit Portupgrade aktualisieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

portupgrade wurde entwickelt, um die Aktualisierung von Ports zu
vereinfachen. Sie k?nnen portupgrade ?ber den Port
`ports-mgmt/portupgrade <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portupgrade/pkg-descr>`__
wie jeden anderen Port mit ``make install     clean`` installieren:

.. code:: screen

    # cd /usr/ports/ports-mgmt/portupgrade/
    # make install clean

Durchsuchen Sie regelm??ig (am besten vor jeder Aktualisierung) die
Liste der installierten Ports mit ``pkgdb -F`` und beheben Sie alle
gefundenen Probleme.

Wenn Sie ``portupgrade -a`` eingeben, beginnt portupgrade automatisch
mit der Aktualisierung aller veralteter Ports Ihres Systems. Verwenden
Sie den Schalter ``-i``, wenn Sie individuell entscheiden wollen, ob ein
Port aktualisiert werden soll:

.. code:: screen

    # portupgrade -ai

Wenn Sie nur eine einzelne Anwendung anstelle aller Anwendungen
aktualisieren wollen, verwenden Sie das Kommando
``portupgrade pkgname``. Geben Sie den Schalter ``-R`` an, wenn
portupgrade zuvor alle Ports aktualisieren soll, die von dem gegebenen
Paket abh?ngen.

Der Schalter ``-P`` verwendet zur Installation Pakete anstelle von
Ports. Mit dieser Option durchsucht portupgrade die in der
Umgebungsvariablen ``PKG_PATH`` aufgef?hrten Verzeichnisse nach Paketen.
Sind lokal keine Pakete vorhanden, versucht portupgrade die Pakete ?ber
das Netz herunterzuladen. Gibt es die Pakete weder lokal noch auf
entfernten Rechnern, werden die Ports verwendet. Um dies zu verhindern,
benutzen Sie die Option ``-PP``.

.. code:: screen

    # portupgrade -PP gnome2

Wenn Sie nur die Quelldateien des Ports (oder die Pakete mit ``-P``)
herunterladen m?chten, ohne die Anwendung zu bauen oder zu installieren,
geben Sie die Option ``-F`` an. Weitere M?glichkeiten lesen Sie bitte in
der Hilfeseite
`portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1>`__
nach.

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

5.5.4.3. Ports mit Portmanager aktualisieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Portmanager ist ein weiteres Werkzeug, das die Aktualisierung
installierter Ports erleichtert. Es kann ?ber den Port
`ports-mgmt/portmanager <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmanager/pkg-descr>`__
installiert werden:

.. code:: screen

    # cd /usr/ports/ports-mgmt/portmanager
    # make install clean

Alle installierten Ports k?nnen danach durch folgende Eingabe
aktualisiert werden:

.. code:: screen

    # portmanager -u

Wenn Sie zus?tzlich die Optionen ``-ui`` an Portmanager ?bergeben,
werden Sie bei jedem Schritt um eine Best?tigung gefragt. Portmanager
ist au?erdem in der Lage, neue Ports auf Ihrem System zu installieren.
Im Gegensatz zum bekannten ``make install clean`` aktualisiert es aber
vor dem Bau und der Installation eines Ports alle abh?ngigen Ports.

.. code:: screen

    # portmanager x11/gnome2

Treten bei den Abh?ngigkeiten des zu installierenden Ports Probleme auf,
ist Portmanager in der Lage, alle Abh?ngigkeiten in der korrekten
Reihenfolge neu zu bauen. Nachdem dieser Schritt abgeschlossen ist, wird
der problematische Port ebenfalls neu gebaut.

.. code:: screen

    # portmanager graphics/gimp -f

Weitere Informationen finden Sie in der Manualpage
`portmanager(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portmanager&sektion=1>`__.

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

5.5.4.4. Ports mit Portmaster aktualisieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei Portmaster handelt es sich um ein weiteres Werkzeug zum
Aktualisieren von Ports. Portmaster nutzt nur Werkzeuge, die bereits im
Basissystem vorhanden sind (ist also nicht von weiteren Ports abh?ngig).
Es verwendet Informationen in ``/var/db/pkg/``, um festzustellen, welche
Ports aktualisiert werden sollen. Sie k?nnen dieses Program ?ber den
Port
`ports-mgmt/portmaster <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmaster/pkg-descr>`__
installieren:

.. code:: screen

    # cd /usr/ports/ports-mgmt/portmaster
    # make install clean

Portmaster teilt Ports in vier Kategorien ein:

.. raw:: html

   <div class="itemizedlist">

-  Root ports (no dependencies, not depended on)

-  Trunk ports (no dependencies, are depended on)

-  Branch ports (have dependencies, are depended on)

-  Leaf ports (have dependencies, not depended on)

.. raw:: html

   </div>

Um eine Liste aller installierter Ports anzuzeigen (und nach neueren
Versionen zu suchen), verwenden Sie die Option ``-L``:

.. code:: screen

    # portmaster -L
    ===>>> Root ports (No dependencies, not depended on)
    ===>>> ispell-3.2.06_18
    ===>>> screen-4.0.3
            ===>>> New version available: screen-4.0.3_1
    ===>>> tcpflow-0.21_1
    ===>>> 7 root ports
    ...
    ===>>> Branch ports (Have dependencies, are depended on)
    ===>>> apache-2.2.3
            ===>>> New version available: apache-2.2.8
    ...
    ===>>> Leaf ports (Have dependencies, not depended on)
    ===>>> automake-1.9.6_2
    ===>>> bash-3.1.17
            ===>>> New version available: bash-3.2.33
    ...
    ===>>> 32 leaf ports

    ===>>> 137 total installed ports
            ===>>> 83 have new versions available
        

Um alle derzeit installierten Ports zu aktualisieren, verwenden Sie
einfach den folgenden Befehl:

.. code:: screen

    # portmaster -a

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

In der Voreinstellung erzeugt Portmaster eine Sicherheitskopie, bevor
ein installierter Port gel?scht wird. Ist die Installation der neuen
Version erfolgreich, wird dieses Backup wieder gel?scht. Wollen Sie das
Backup lieber manuell l?schen, verwenden Sie die Option ``-b`` beim
Aufruf von Portmaster. Durch die Verwendung der Option ``-i`` wird
Portmaster im interaktiven Modus gestartet und fragt bei jedem zu
aktualisierenden Port nach, wie Sie vorgehen wollen.

.. raw:: html

   </div>

Treten w?hrend der Aktualisierung Fehler auf, k?nnen Sie die Option
``-f`` verwenden, um alle Ports zu aktualisieren beziehungsweise neu zu
bauen:

.. code:: screen

    # portmaster -af

Portmaster ist auch in der Lage, neue Ports zu installieren, wobei zuvor
alle abh?ngigen Ports aktualisiert werden:

.. code:: screen

    # portmaster shells/bash

Weiterf?hrende Informationen finden Sie in der Manualpage
`portmaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portmaster&sektion=8>`__.

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

5.5.5. Platzbedarf von Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Ports-Sammlung kann sehr viel Plattenplatz verschlingen. F?hren Sie
nach dem Bau und der Installation eines Ports ``make     clean`` aus, um
die Arbeitsverzeichnisse zu l?schen. Dieser Befehl entfernt das
Verzeichnis ``work`` des gebauten Ports. Wollen Sie die gesamte
Ports-Sammlung aufr?umen, verwenden Sie folgenden Befehl:

.. code:: screen

    # portsclean -C

Im Laufe der Zeit werden sich zahlreiche Distfiles im Verzeichnis
``distfiles`` ansammeln. Sie k?nnen diese entweder h?ndisch l?schen,
oder Sie verwenden den folgenden Befehl, um alle Distfiles zu l?schen,
die nicht l?nger ben?tigt werden:

.. code:: screen

    # portsclean -D

Falls Sie nur alle Distfiles l?schen wollen, die von keinem derzeit
installierten Port referenziert werden:

.. code:: screen

    # portsclean -DD

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das Werkzeug ``portsclean`` wird automatisch bei der Installation von
portupgrade mit installiert.

.. raw:: html

   </div>

Denken Sie daran, installierte Ports wieder zu entfernen, wenn Sie diese
nicht mehr ben?tigen. Um diese Arbeit zu erleichtern, k?nnen Sie den
Port
`ports-mgmt/pkg\_cutleaves <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/pkg_cutleaves/pkg-descr>`__
installieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <packages-using.html>`__?   | `Nach oben <ports.html>`__    | ?\ `Weiter <ports-nextsteps.html>`__   |
+-------------------------------------+-------------------------------+----------------------------------------+
| 5.4. Benutzen des Paketsystems?     | `Zum Anfang <index.html>`__   | ?5.6. Nach der Installation            |
+-------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
