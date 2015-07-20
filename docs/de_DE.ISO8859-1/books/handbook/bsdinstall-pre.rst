=========================
3.3. Vor der Installation
=========================

.. raw:: html

   <div class="navheader">

3.3. Vor der Installation
`Zur?ck <bsdinstall-hardware.html>`__?
Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren
?\ `Weiter <bsdinstall-start.html>`__

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

3.3. Vor der Installation
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

3.3.1. Sichern Sie Ihre Daten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sichern Sie alle wichtigen Daten auf dem Zielcomputer, auf dem FreeBSD
installiert werden soll. ?berpr?fen Sie diese Sicherungen, bevor Sie
fortfahren. Die FreeBSD Installation wird Sie vor ?nderungen an den
Platten danach fragen, jedoch kann dies nicht mehr r?ckg?ngig gemacht
werden, sobald der Prozess gestartet wurde.

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

3.3.2. Den Installationsort von FreeBSD festlegen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls FreeBSD das einzige installierte Betriebssystem sein wird und die
gesamte Platte dazu verwenden kann, kann der Rest dieses Abschnitts
?bersprungen werden. Sollten Sie allerdings die Platte mit anderen
Betriebssystemen teilen, ist ein Verst?ndnis des Plattenlayouts
hilfreich f?r die Installation.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.2.1. Festplattenlayout f?r FreeBSD/i386 und FreeBSD/amd64
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Festplatten k?nnen in mehrere verschiedene Bereiche aufgeteilt werden.
Diese Bereiche werden *Partitionen* genannt.

Es gibt zwei Arten, eine Festplatte in mehrere Partitionen einzuteilen.
Traditionell enth?lt ein *Master Boot Record* (MBR) eine
Partitionstabelle, welche bis zu vier *prim?re Partitionen* aufnehmen
kann (aus historischen Gr?nden werden diese prim?ren Partitionen in
FreeBSD *slices* genannt). Eine Begrenzung von nur vier Partitionen ist
f?r grosse Platten sehr beschr?nkt, so dass eine dieser prim?ren
Partitionen als *erweiterte Partition* eingesetzt wird. Mehrere
*logische Partitionen* k?nnen dann innerhalb der erweiterten Partition
angelegt werden. Dies mag etwas unhandlich erscheinen und das ist auch
der Fall.

Die *GUID-Partitionstabelle* (GPT) ist eine neuere und einfachere
Methode zur Partition einer Festplatte. GPT ist weitaus flexibler als
die traditionelle MBR-Partitionstabelle. Gel?ufige GPT-Implementierungen
erlauben bis zu 128 Partitionen pro Platte, was die Notwendigkeit von
umst?ndlichen Behelfen wie logische Partitionen eliminiert.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Manche ?lteren Betriebssysteme wie Windows??XP sind mit dem
GPT-Partitionsschema nicht kompatibel. Wenn sich FreeBSD die Platte mit
einem solchen Betriebssystem teilen soll, werden MBR Partitionen
ben?tigt.

.. raw:: html

   </div>

FreeBSDs Standard-Bootloader ben?tigt entweder eine prim?re oder eine
GPT-Partition (lesen Sie dazu `Kapitel?13, *FreeBSDs
Bootvorgang* <boot.html>`__ f?r weitere Informationen zum FreeBSD
Bootvorgang). Wenn alle der prim?ren oder GPT-Partitionen bereits in
Verwendung sind, muss eine davon f?r FreeBSD zur Verf?gung gestellt
werden.

Eine Minimalinstallation von FreeBSD braucht ungef?hr 1?GB Plattenplatz.
Dies ist jedoch eine *sehr* minimale Installation, die fast gar keinen
freien Speicherplatz ?brig l?sst. Eine etwas realistischere
Minimalangabe sind 3?GB ohne eine graphische Umgebung und 5?GB oder
mehr, falls eine graphische Benutzeroberfl?che verwendet werden soll.
Anwendungen von Drittanbietern ben?tigt sogar noch mehr Platz.

Eine Vielzahl `freier und kommerzieller Werkzeuge zur Ver?nderung der
Partitionsgr?ssen <http://en.wikipedia.org/wiki/List_of_disk_partitioning_software>`__
sind verf?gbar. `GParted
Live <http://gparted.sourceforge.net/livecd.php>`__ ist eine freie
Live-CD, die den GParted-Partitionseditor enth?lt. GParted ist auch in
einer Vielzahl von anderen Linux Live-CD Distributionen enthalten.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Anwendungen zur Festplattenpartition kann Daten zerst?ren. Erstellen Sie
eine Vollsicherung und ?berpr?fen Sie deren Integrit?t bevor Sie die
Partitionen auf der Platte ver?ndern.

.. raw:: html

   </div>

Die Ver?nderung der Gr?sse von Microsoft??Vista-Partitionen kann
schwierig sein. Eine Vista Installations-CD-ROM kann hilfreich sein,
wenn eine solche Aktion versucht wird.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 3.1. Eine existierende Partition ver?ndern

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Ein Windows?-Computer besitzt eine einzelne 40?GB Platte, die in zwei
20?GB Partitionen aufgeteilt wurde. Windows? nennt diese ``C:`` und
``D:``. Die ``C:`` Partition enth?lt 10?GB und the ``D:`` Partition 5?GB
an Daten.

Durch kopieren der Daten von ``D:`` nach ``C:`` macht die zweite
Partition frei, so dass FreeBSD sie benutzen kann.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 3.2. Verkleinern einer bestehenden Partition

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Ein Windows?-Computer besitzt eine einzelne 40?GB Platte und eine grosse
Partition, welche die gesamte Platte einnimmt. Windows? zeigt diese
40?GB Partition als einzelne ``C:`` Partition. 15?GB Plattenplatz wird
verwendet. Das Ziel ist, f?r Windows? eine 20?GB Partition einzurichten
und eine weitere 20?GB-Partition f?r FreeBSD bereitzustellen.

Es gibt zwei Wege, dieses Ziel zu erreichen.

.. raw:: html

   <div class="orderedlist">

#. Sichern Sie Ihre Windows?-Daten. Installieren Sie dann Windows? neu,
   indem Sie eine 20?GB-Partition w?hrend der Installation anlegen.

#. Verwenden Sie ein Werkzeug zur Ver?nderung einer Partition wie
   GParted, um die Windows?-Partition zu verkleinern und eine neue
   Partition im freigewordenen Plattenplatz f?r FreeBSD anzulegen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Festplattenpartitionen, die unterschiedliche Betriebssysteme enthalten,
erm?glichen es, jeweils eines dieser Systeme zu verwenden. Eine andere
Methode, die es erlaubt, mehrere Betriebssysteme gleichzeitig
einzusetzen, wird in `Kapitel?24,
*Virtualisierung* <virtualization.html>`__ behandelt.

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

3.3.3. Netzwerkparameter ermitteln
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manche FreeBSD Installationsarten ben?tigen eine Netzwerkverbindung, um
Dateien herunter zu laden. Um zu einem Ethernet-Netzwerk (bzw. Kabel
oder DSL-Modem mit einem Ethernet-Anschluss) eine Verbindung
herzustellen, wird das Installationsprogramm bestimmte Information zum
Netzwerk abfragen.

*DHCP* wird allgemein verwendet, um automatisch Netzwerkeinstellungen
vorzunehmen. Falls DHCP nicht verf?gbar ist, m?ssen diese
Netzwerkeinstellungen vom lokalen Netzwerkadministrator oder Provider
erfragt werden:

.. raw:: html

   <div class="orderedlist">

.. raw:: html

   <div class="orderedlist-title">

Informationen zum Netzwerk

.. raw:: html

   </div>

#. IP-Adresse

#. Subnetz-Maske

#. Default-Router IP-Adresse

#. Dom?nenname des lokalen Netzwerks

#. DNS-Server IP-Adresse(n)

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

3.3.4. Lesen Sie die FreeBSD-Errata
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Obwohl das FreeBSD?Projekt sich bem?ht, jede ver?ffentlichte Version von
FreeBSD so stabil wie m?glich zu machen, k?nnen sich doch gelegentlich
Fehler in den Ver?ffentlichungsprozess einschleichen. In sehr seltenen
F?llen betreffen diese Fehler den Installationsvorgang. Wenn diese
Probleme entdeckt und behoben sind, werden dazu Hinweise in der `FreeBSD
Errata <../../../../releases/9.0R/errata.html>`__ auf der FreeBSD
Webseite ver?ffentlicht. Pr?fen Sie die Errata vor der Installation, um
sicherzustellen, dass es keine Probleme gibt, welche die Installation
betreffen.

Informationen und Errata f?r all diese Ver?ffentlichungen k?nnen ?ber
den Abschnitt `release information <../../../../releases/index.html>`__
der `FreeBSD Webseite <../../../../index.html>`__ abgerufen werden.

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

3.3.5. Die Installationsmedien beschaffen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine FreeBSD-Installation wird durch das starten des Computers mit einer
eingelegten FreeBSD-Installations-CD/DVD oder eines USB-Sticks begonnen.
Das Installationsprogramm ist kein Programm das aus einem anderen
Betriebssystem heraus gestartet werden kann.

Zus?tzlich zum Standardinstallationsmedium, welches Kopien von allen
FreeBSD-Installationsdateien enth?lt, gibt es auch eine
*bootonly*-Variante. Ein solches Installationsmedium besitzt keine
Kopien der Installationsdateien, jedoch kann es diese w?hrend der
Installation aus dem Netzwerk nachladen. Die bootonly Installations-CD
ist dadurch viel kleiner und reduziert die ben?tigte Bandbreite w?hrend
der Installation durch herunterladen der allern?tigsten Dateien.

Kopien der FreeBSD-Installationsmedien sind auf der `FreeBSD
Webseite <../../../../where.html#download>`__ verf?gbar.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Falls Sie bereits eine Kopie von FreeBSD auf CD-ROM, DVD oder USB-Stick
besitzen, kann dieser Abschnitt ?bersprungen werden.

.. raw:: html

   </div>

CD und DVD-Images von FreeBSD sind startf?hige ISO-Dateien. Nur eine CD
oder DVD wird f?r eine Installation ben?tigt. Brennen Sie ein ISO-Image
auf eine startf?hige CD oder DVD mit Hilfe eines CD-Brennprogramms, das
f?r Ihr aktuelles Betriebssystem zur Verf?gung steht.

Um einen startf?higen USB-Stick zu erstellen, f?hren Sie die folgenden
Schritte durch:

.. raw:: html

   <div class="procedure">

#. **Das Image f?r den USB-Stick herunterladen**

   Das Image f?r FreeBSD?9.0-RELEASE und h?here kann von dem
   ``ISO-IMAGES/``-Verzeichnis unter
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/arch/arch/ISO-IMAGES/version/FreeBSD-version-RELEASE-arch-memstick.img``
   bezogen werden. Ersetzen Sie jeweils *``arch``* und *``version``* mit
   der Architektur und der Versionsnummer, die Sie installieren m?chten.
   Beispielsweise sind die USB-Stick Images f?r FreeBSD/i386?9.0-RELEASE
   verf?gbar unter
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/i386/ISO-IMAGES/9.0/FreeBSD-9.0-RELEASE-i386-memstick.img``.

   .. raw:: html

      <div class="tip" xmlns="">

   Tipp:
   ~~~~~

   F?r FreeBSD?8.\ *``X``* und fr?here Versionen wird ein anderer Pfad
   verwendet. Details f?r das Herunterladen und Installieren von
   FreeBSD?8.\ *``X``* und fr?here werden in `Kapitel?2,
   *FreeBSD?8.\ *``X``* (und ?lter) installieren* <install.html>`__
   behandelt.

   .. raw:: html

      </div>

   Das USB-Stick Image hat die Endung ``.img``. Das
   ``ISO-IMAGES/``-Verzeichnis enth?lt eine Vielzahl von verschiedenen
   Installations-Images und die jeweils ben?tigte Version von FreeBSD,
   sowie in manchen F?llen die Zielhardware.

   .. raw:: html

      <div class="important" xmlns="">

   Wichtig:
   ~~~~~~~~

   Bevor Sie fortfahren, *machen Sie Sicherungskopien* der Daten auf dem
   USB-Stick, da die folgende Prozedur alle Daten *l?scht*.

   .. raw:: html

      </div>

#. **Das Image auf den USB-Stick schreiben**

   .. raw:: html

      <div class="procedure">

   .. raw:: html

      <div class="procedure-title">

   Prozedur 3.1. Den USB-Stick unter FreeBSD vorbereiten

   .. raw:: html

      </div>

   .. raw:: html

      <div class="warning" xmlns="">

   Warnung:
   ~~~~~~~~

   Das Beispiel unten verwendet ``/dev/da0`` als das Zielger?t, auf
   welches das Image geschrieben werden soll. Seien Sie vorsichtig, dass
   das richtige Ger?t als das Ausgabe benutzt wird oder Sie zerst?ren
   wichtige Daten.

   .. raw:: html

      </div>

   -  **Das Image mit
      `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
      schreiben**

      Die ``.img``-Datei ist *keine* gew?hnliche Datei. Es ist ein
      *Image* des kompletten sp?teren Inhalts des USB-Sticks. Es kann
      *nicht* einfach wie eine gew?hnliche Datei kopiert werden, sondern
      muss direkt auf das Zielger?t mit
      `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
      geschrieben werden:

      .. code:: screen

          # dd if=FreeBSD-9.0-RELEASE-i386-memstick.img of=/dev/da0 bs=64k

   .. raw:: html

      </div>

   .. raw:: html

      <div class="procedure">

   .. raw:: html

      <div class="procedure-title">

   Prozedur 3.2. Das Image unter Windows? schreiben

   .. raw:: html

      </div>

   .. raw:: html

      <div class="warning" xmlns="">

   Warnung:
   ~~~~~~~~

   Versichern Sie sich, dass Sie den korrekten Laufwerksbuchstaben als
   Ausgabe angeben oder Sie ?berschreiben und zerst?ren bestehende
   Daten.

   .. raw:: html

      </div>

   #. **Image Writer f?r Windows? herunterladen**

      Image Writer f?r Windows? ist eine frei verf?gbare Anwendung,
      welche eine Imagedatei korrekt auf einen SB-Stick schreiben kann.
      Laden Sie diese von ``https://launchpad.net/win32-image-writer/``
      herunter und entpacken Sie sie in einen Ordner.

   #. **Das Image mit Image Writer auf den USB-Stick schreiben**

      Klicken Sie doppelt auf das Win32DiskImager-Icon, um das Programm
      zu starten. Pr?fen Sie dabei, dass der Laufwerksbuchstabe unter
      ``Device`` dem Ger?t entspricht, in dem sich der USB-Stick
      befindet. Klicken Sie auf das Ordnersymbol und w?hlen Sie das
      Image aus, welches auf den USB-Stick geschrieben werden soll. Um
      den Image-Dateinamen zu akzeptieren, klicken Sie auf [?Save?].
      ?berpr?fen Sie erneut, ob alles stimmt und dass keine Ordner auf
      dem USB-Stick in anderen Fenstern ge?ffnet sind. Sobald alles
      bereit ist, klicken Sie auf [?Write?], um die Imagedatei auf den
      USB-Stick zu schreiben.

   .. raw:: html

      </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Installation von Disketten wird nicht mehr unterst?tzt.

.. raw:: html

   </div>

Sie sind jetzt dazu bereit, mit der Installation von FreeBSD zu
beginnen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-----------------------------------+-----------------------------------------+
| `Zur?ck <bsdinstall-hardware.html>`__?   | `Nach oben <bsdinstall.html>`__   | ?\ `Weiter <bsdinstall-start.html>`__   |
+------------------------------------------+-----------------------------------+-----------------------------------------+
| 3.2. Hardware-Anforderungen?             | `Zum Anfang <index.html>`__       | ?3.4. Die Installation starten          |
+------------------------------------------+-----------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
