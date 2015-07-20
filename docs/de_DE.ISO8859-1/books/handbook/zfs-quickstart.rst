===========================
21.2. Schnellstartanleitung
===========================

.. raw:: html

   <div class="navheader">

21.2. Schnellstartanleitung
`Zur?ck <zfs.html>`__?
Kapitel 21. Das Z-Dateisystem (ZFS)
?\ `Weiter <zfs-zpool.html>`__

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

21.2. Schnellstartanleitung
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es existiert ein Startmechanismus, der es FreeBSD erlaubt, ZFS-Pools
w?hrend der Systeminitialisierung einzubinden. Um diesen zu aktivieren,
f?gen Sie diese Zeile in ``/etc/rc.conf`` ein:

.. code:: programlisting

    zfs_enable="YES"

Starten Sie dann den Dienst:

.. code:: screen

    # service zfs start

Die Beispiele in diesem Abschnitt gehen von drei SCSI-Platten mit den
Ger?tenamen ``da0``, ``da1`` und ``da2`` aus. Nutzer von SATA-Hardware
sollten stattdessen die Bezeichnung ``ada`` als Ger?tenamen verwenden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

21.2.1. Pools mit einer Platte
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um einen einfachen, nicht-redundanten Pool mit einem einzigen Ger?t
anzulegen, geben Sie folgendes ein:

.. code:: screen

    # zpool create example /dev/da0

Um den neuen Pool anzuzeigen, pr?fen Sie die Ausgabe von ``df``:

.. code:: screen

    # df
    Filesystem  1K-blocks    Used    Avail Capacity  Mounted on
    /dev/ad0s1a   2026030  235230  1628718    13%    /
    devfs               1       1        0   100%    /dev
    /dev/ad0s1d  54098308 1032846 48737598     2%    /usr
    example      17547136       0 17547136     0%    /example

Diese Ausgabe zeigt, dass der ``example``-Pool erstellt und eingeh?ngt
wurde. Er ist nun als Dateisystem verf?gbar. Dateien k?nnen darauf
angelegt werden und Anwender k?nnen sich den Inhalt ansehen:

.. code:: screen

    # cd /example
    # ls
    # touch testfile
    # ls -al
    total 4
    drwxr-xr-x   2 root  wheel    3 Aug 29 23:15 .
    drwxr-xr-x  21 root  wheel  512 Aug 29 23:12 ..
    -rw-r--r--   1 root  wheel    0 Aug 29 23:15 testfile

Allerdings nutzt dieser Pool noch keine der Vorteile von ZFS. Um ein
Dataset auf diesem Pool mit aktivierter Komprimierung zu erzeugen, geben
Sie ein:

.. code:: screen

    # zfs create example/compressed
    # zfs set compression=gzip example/compressed

Das ``example/compressed``-Dataset ist nun ein komprimiertes
ZFS-Dateisystem. Versuchen Sie, ein paar gro?e Dateien auf
``/example/compressed`` zu kopieren.

Deaktivieren l?sst sich die Komprimierung durch:

.. code:: screen

    # zfs set compression=off example/compressed

Um ein Dateisystem abzuh?ngen, verwenden Sie ``zfs umount`` und
?berpr?fen Sie dies anschlie?end mit ``df``:

.. code:: screen

    # zfs umount example/compressed
    # df
    Filesystem  1K-blocks    Used    Avail Capacity  Mounted on
    /dev/ad0s1a   2026030  235232  1628716    13%    /
    devfs               1       1        0   100%    /dev
    /dev/ad0s1d  54098308 1032864 48737580     2%    /usr
    example      17547008       0 17547008     0%    /example

Um das Dateisystem wieder einzubinden und erneut verf?gbar zu machen,
verwenden Sie ``zfs mount`` und pr?fen Sie erneut mit ``df``:

.. code:: screen

    # zfs mount example/compressed
    # df
    Filesystem         1K-blocks    Used    Avail Capacity  Mounted on
    /dev/ad0s1a          2026030  235234  1628714    13%    /
    devfs                      1       1        0   100%    /dev
    /dev/ad0s1d         54098308 1032864 48737580     2%    /usr
    example             17547008       0 17547008     0%    /example
    example/compressed  17547008       0 17547008     0%    /example/compressed

Den Pool und die Dateisysteme k?nnen Sie auch ?ber die Ausgabe von
``mount`` pr?fen:

.. code:: screen

    # mount
    /dev/ad0s1a on / (ufs, local)
    devfs on /dev (devfs, local)
    /dev/ad0s1d on /usr (ufs, local, soft-updates)
    example on /example (zfs, local)
    example/compressed on /example/compressed (zfs, local)

Nach der Erstellung k?nnen ZFS-Datasets wie jedes andere Dateisystem
verwendet werden. Jedoch sind jede Menge andere Besonderheiten
verf?gbar, die individuell auf Dataset-Basis eingestellt sein k?nnen. Im
Beispiel unten wird ein neues Dateisystem namens ``data`` angelegt.
Wichtige Dateien werden dort abgespeichert, deshalb wird es so
konfiguriert, dass zwei Kopien jedes Datenblocks vorgehalten werden.

.. code:: screen

    # zfs create example/data
    # zfs set copies=2 example/data

Es ist jetzt m?glich, den Speicherplatzverbrauch der Daten durch die
Eingabe von ``df`` zu sehen:

.. code:: screen

    # df
    Filesystem         1K-blocks    Used    Avail Capacity  Mounted on
    /dev/ad0s1a          2026030  235234  1628714    13%    /
    devfs                      1       1        0   100%    /dev
    /dev/ad0s1d         54098308 1032864 48737580     2%    /usr
    example             17547008       0 17547008     0%    /example
    example/compressed  17547008       0 17547008     0%    /example/compressed
    example/data        17547008       0 17547008     0%    /example/data

Sie haben vermutlich bemerkt, dass jedes Dateisystem auf dem Pool die
gleiche Menge an verf?gbarem Speicherplatz besitzt. Das ist der Grund
daf?r, dass in diesen Beispielen ``df`` verwendet wird, um zu zeigen,
dass die Dateisysteme nur die Menge an Speicher verbrauchen, den sie
ben?tigen und alle den gleichen Pool verwenden. ZFS eliminiert Konzepte
wie Volumen und Partitionen und erlaubt es mehreren Dateisystemen den
gleichen Pool zu belegen.

Um das Dateisystem und anschlie?end den Pool zu zerst?ren, wenn dieser
nicht mehr ben?tigt wird, geben Sie ein:

.. code:: screen

    # zfs destroy example/compressed
    # zfs destroy example/data
    # zpool destroy example

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

21.2.2. RAID-Z
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Platten fallen aus. Eine Methode, um Datenverlust durch
Festplattenausfall zu vermeiden, ist die Verwendung von RAID. ZFS
unterst?tzt dies in seiner Poolgestaltung. Pools mit RAID-Z ben?tigen
drei oder mehr Platten, bieten aber auch mehr nutzbaren Speicher als
gespiegelte Pools.

Dieses Beispiel erstellt einen RAID-Z-Pool, indem es die Platten angibt,
die dem Pool hinzugef?gt werden sollen:

.. code:: screen

    # zpool create storage raidz da0 da1 da2

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sun™ empfiehlt, dass die Anzahl der Ger?te in einer RAID-Z Konfiguration
zwischen drei und neun betr?gt. F?r Umgebungen, die einen einzelnen Pool
ben?tigen, der aus 10 oder mehr Platten besteht, sollten Sie in Erw?gung
ziehen, diesen in kleinere RAID-Z-Gruppen aufzuteilen. Falls nur zwei
Platten verf?gbar sind und Redundanz ben?tigt wird, ziehen Sie die
Verwendung eines ZFS-Spiegels (mirror) in Betracht. Lesen Sie dazu
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__,
um weitere Details zu erhalten.

.. raw:: html

   </div>

Das vorherige Beispiel erstellte einen ZPool namens ``storage``. Dieses
Beispiel erzeugt ein neues Dateisystem, genannt ``home``, in diesem
Pool:

.. code:: screen

    # zfs create storage/home

Komprimierung und das Vorhalten von mehreren Kopien von Dateien und
Verzeichnissen kann aktiviert werden:

.. code:: screen

    # zfs set copies=2 storage/home
    # zfs set compression=gzip storage/home

Um dies als das neue Heimatverzeichnis f?r Anwender zu setzen, kopieren
Sie die Benutzerdaten in dieses Verzeichnis und erstellen passende
symbolische Verkn?pfungen:

.. code:: screen

    # cp -rp /home/* /storage/home
    # rm -rf /home /usr/home
    # ln -s /storage/home /home
    # ln -s /storage/home /usr/home

Daten von Anwendern werden nun auf dem frisch erstellten
``/storage/home`` abgelegt. ?berpr?fen Sie dies durch das Anlegen eines
neuen Benutzers und das anschlie?ende Anmelden als dieser Benutzer.

Versuchen Sie, einen Dateisystemschnappschuss anzulegen, den Sie sp?ter
wieder zur?ckrollen k?nnen:

.. code:: screen

    # zfs snapshot storage/home@08-30-08

Schnappsch?sse k?nnen nur auf einem Dateisystem angelegt werden, nicht
auf einem einzelnen Verzeichnis oder einer Datei.

Das Zeichen ``@`` ist der Trenner zwischen dem Dateisystem- oder dem
Volumennamen. Wenn ein wichtiges Verzeichnis aus Versehen gel?scht
wurde, kann das Dateisystem gesichert und dann zu einem fr?heren
Schnappschuss zur?ckgerollt werden, in welchem das Verzeichnis noch
existiert:

.. code:: screen

    # zfs rollback storage/home@08-30-08

Um all verf?gbaren Schnappsch?sse aufzulisten, geben Sie ``ls`` im
Verzeichnis ``.zfs/snapshot`` dieses Dateisystems ein. Beispielsweise
l?sst sich der zuvor angelegte Schnappschuss wie folgt anzeigen:

.. code:: screen

    # ls /storage/home/.zfs/snapshot

Es ist m?glich, ein Skript zu schreiben, um regelm??ig Schnappsch?sse
von Benutzerdaten anzufertigen. Allerdings verbrauchen Schnappsch?sse
?ber lange Zeit eine gro?e Menge an Speicherplatz. Der zuvor angelegte
Schnappschuss kann durch folgendes Kommando wieder entfernt werden:

.. code:: screen

    # zfs destroy storage/home@08-30-08

Nach erfolgreichen Tests kann ``/storage/home`` zum echten
``/home``-Verzeichnis werden, mittels:

.. code:: screen

    # zfs set mountpoint=/home storage/home

Pr?fen Sie mit ``df`` und ``mount``, um zu best?tigen, dass das System
das Dateisystem nun als ``/home`` verwendet:

.. code:: screen

    # mount
    /dev/ad0s1a on / (ufs, local)
    devfs on /dev (devfs, local)
    /dev/ad0s1d on /usr (ufs, local, soft-updates)
    storage on /storage (zfs, local)
    storage/home on /home (zfs, local)
    # df
    Filesystem   1K-blocks    Used    Avail Capacity  Mounted on
    /dev/ad0s1a    2026030  235240  1628708    13%    /
    devfs                1       1        0   100%    /dev
    /dev/ad0s1d   54098308 1032826 48737618     2%    /usr
    storage       26320512       0 26320512     0%    /storage
    storage/home  26320512       0 26320512     0%    /home

Damit ist die RAID-Z Konfiguration abgeschlossen. T?gliche Informationen
?ber den Status der erstellten Dateisysteme k?nnen als Teil des
n?chtlichen
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__-Berichts
generiert werden. F?gen Sie dazu die folgende Zeile in
``/etc/periodic.conf`` ein:

.. code:: programlisting

    daily_status_zfs_enable="YES"

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

21.2.3. RAID-Z wiederherstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jedes Software-RAID besitzt eine Methode, um den Zustand (``state``) zu
?berpr?fen. Der Status von RAID-Z Ger?ten wird mit diesem Befehl
angezeigt:

.. code:: screen

    # zpool status -x

Wenn alle Pools `Online <zfs-term.html#zfs-term-online>`__ sind und
alles normal ist, zeigt die Meldung folgendes an:

.. code:: screen

    all pools are healthy

Wenn es ein Problem gibt, wom?glich ist eine Platte im Zustand
`Offline <zfs-term.html#zfs-term-offline>`__, dann wird der Poolzustand
?hnlich wie dieser aussehen:

.. code:: screen

      pool: storage
     state: DEGRADED
    status: One or more devices has been taken offline by the administrator.
        Sufficient replicas exist for the pool to continue functioning in a
        degraded state.
    action: Online the device using 'zpool online' or replace the device with
        'zpool replace'.
     scrub: none requested
    config:

        NAME        STATE     READ WRITE CKSUM
        storage     DEGRADED     0     0     0
          raidz1    DEGRADED     0     0     0
            da0     ONLINE       0     0     0
            da1     OFFLINE      0     0     0
            da2     ONLINE       0     0     0

    errors: No known data errors

Dies zeigt an, dass das Ger?t zuvor vom Administrator mit diesem Befehl
abgeschaltet wurde:

.. code:: screen

    # zpool offline storage da1

Jetzt kann das System heruntergefahren werden, um ``da1`` zu ersetzen.
Wenn das System wieder eingeschaltet wird, kann die fehlerhafte Platte
im Pool ersetzt werden:

.. code:: screen

    # zpool replace storage da1

Von diesem Punkt an kann der Status erneut gepr?ft werden. Dieses Mal
ohne die Option ``-x``, damit alle Pools angezeigt werden:

.. code:: screen

    # zpool status storage
     pool: storage
     state: ONLINE
     scrub: resilver completed with 0 errors on Sat Aug 30 19:44:11 2008
    config:

        NAME        STATE     READ WRITE CKSUM
        storage     ONLINE       0     0     0
          raidz1    ONLINE       0     0     0
            da0     ONLINE       0     0     0
            da1     ONLINE       0     0     0
            da2     ONLINE       0     0     0

    errors: No known data errors

In diesem Beispiel ist alles normal.

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

21.2.4. Daten verifizieren
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ZFS verwendet Pr?fsummen, um die Integrit?t der gespeicherten Daten zu
gew?hrleisten. Dies wird automatisch beim Erstellen von Dateisystemen
aktiviert.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Pr?fsummen k?nnen deaktiviert werden, dies wird jedoch *nicht*
empfohlen! Pr?fsummen verbrauchen nur sehr wenig Speicherplatz und
sichern die Integrit?t der Daten. Viele Eigenschaften vom ZFS werden
nicht richtig funktionieren, wenn Pr?fsummen deaktiviert sind. Es gibt
keinen merklichen Geschwindigkeitsunterschied durch das Deaktivieren
dieser Pr?fsummen.

.. raw:: html

   </div>

Pr?fsummenverifikation ist unter der Bezeichnung *scrubbing* bekannt.
Verifizieren Sie die Integrit?t der Daten des ``storage``-Pools mit
diesem Befehl:

.. code:: screen

    # zpool scrub storage

Die Laufzeit einer ?berpr?fung h?ngt ab von der Menge an Daten, die
gespeichert sind. Gr??ere Mengen an Daten ben?tigen proportional mehr
Zeit zum ?berpr?fen. Diese ?berpr?fungen sind sehr I/O-intensiv und es
kann auch nur eine ?berpr?fung zur gleichen Zeit durchgef?hrt werden.
Nachdem eine Pr?fung beendet ist, kann der Status mit dem Unterkommando
``status`` angezeigt werden:

.. code:: screen

    # zpool status storage
     pool: storage
     state: ONLINE
     scrub: scrub completed with 0 errors on Sat Jan 26 19:57:37 2013
    config:

        NAME        STATE     READ WRITE CKSUM
        storage     ONLINE       0     0     0
          raidz1    ONLINE       0     0     0
            da0     ONLINE       0     0     0
            da1     ONLINE       0     0     0
            da2     ONLINE       0     0     0

    errors: No known data errors

Das Datum der letzten Pr?foperation wird angezeigt, um zu verfolgen,
wann die n?chste Pr?fung ben?tigt wird. Routinem?ssige ?berpr?fungen
helfen dabei, Daten vor stiller Korrumpierung zu sch?tzen und die
Integrit?t des Pools sicher zu stellen.

Lesen Sie
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__ und
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__,
um ?ber weitere ZFS-Optionen zu erfahren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+-----------------------------------+
| `Zur?ck <zfs.html>`__?                 | `Nach oben <zfs.html>`__      | ?\ `Weiter <zfs-zpool.html>`__    |
+----------------------------------------+-------------------------------+-----------------------------------+
| Kapitel 21. Das Z-Dateisystem (ZFS)?   | `Zum Anfang <index.html>`__   | ?21.3. ``zpool`` Administration   |
+----------------------------------------+-------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
