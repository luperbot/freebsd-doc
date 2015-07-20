========================
20.4. RAID1 - Spiegelung
========================

.. raw:: html

   <div class="navheader">

20.4. RAID1 - Spiegelung
`Zur?ck <GEOM-striping.html>`__?
Kapitel 20. GEOM: Modulares Framework zur Plattentransformation
?\ `Weiter <geom-ggate.html>`__

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

20.4. RAID1 - Spiegelung
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Spiegelung (Mirroring) ist eine Technik, welche von vielen Firmen und
Heimnutzern eingesetzt wird, um Daten ohne Unterbrechung zu sichern.
Wenn ein Spiegel existiert, dann bedeutet dies einfach nur, dass PlatteB
die PlatteA dupliziert. Oder PlatteC+D duplizieren PlatteA+A. Der
wichtigste Aspekt ist, dass Daten einer Platte oder Partition dupliziert
werden, unabh?ngig von der Konfiguration der Platte. Dadurch kann sp?ter
diese Information leichter wiederhergestellt, ohne Zugriffsunterbrechung
gesichert oder sogar physisch in einem Datentresor gelagert werden.

Stellen Sie zu Beginn sicher, dass ihr System zwei Platten mit
identischer Gr??e aufweist. In dieser ?bung gehen wir davon aus, dass es
direkt zug?ngliche
(`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4>`__)
SCSI-Platten sind.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

20.4.1. Die prim?re Platte spiegeln
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Angenommen, FreeBSD wurde auf der ersten Platte ``da0`` installiert,
dann sollte
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
angewiesen werden, seine prim?ren Daten auf dieser Platte zu speichern.

Bevor Sie den Spiegel aufbauen, sollten Sie die maximale Protokollierung
aktivieren und den Zugang zum Ger?t gestatten. Dazu setzen Sie die
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__-Option
``kern.geom.debugflags`` auf den folgenden Wert:

.. code:: screen

    # sysctl kern.geom.debugflags=17

Nun k?nnen Sie den Spiegel aufbauen. Beginnen Sie den Prozess, indem Sie
die Metadaten-Informationen auf das Ger?t der prim?ren Platte speichern.
Konkret erzeugen Sie dabei das Ger?t ``/dev/mirror/gm``, indem Sie den
folgenden Befehl ausf?hren:

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Die Spiegelung der Bootplatte kann zu Datenverlust f?hren, wenn Sie
Daten im letzten Sektor der Platte gespeichert haben. Dieses Risiko
l?sst sich minimieren, wenn Sie den Spiegel unmittelbar nach der
Installation von FreeBSD aufsetzen. Die im folgenden beschriebene
Vorgehensweise ist ebenfalls nicht kompatibel mit den
Standard-Installationseinstellungen von FreeBSD?9.\ *``X``*, die das
neue GPT-Partitionsschema verwenden. GEOM wird GPT-Metadaten
?berschreiben, was zu Datenverlust und einem m?glicherweise nicht
bootbarem System f?hrt.

.. raw:: html

   </div>

.. code:: screen

    # gmirror label -vb round-robin gm0 /dev/da0

Ihr System sollte wie folgt antworten:

.. code:: screen

    Metadata value stored on /dev/da0.
    Done.

Initialisieren Sie GEOM. Dadurch wird das Kernelmodul
``/boot/kernel/geom_mirror.ko`` geladen:

.. code:: screen

    # gmirror load

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn dieser Befehl erfolgreich ausgef?hrt wurde, wird die Ger?tedatei
``gm0`` im Verzeichnis ``/dev/mirror`` erzeugt.

.. raw:: html

   </div>

Stellen Sie sicher, dass das Kernelmodul ``geom_mirror.ko`` beim
Systemstart automatisch geladen wird:

.. code:: screen

    # echo 'geom_mirror_load="YES"' >> /boot/loader.conf

Bearbeiten Sie die Datei ``/etc/fstab`` und ersetzen Sie alle Verweise
auf die alte Ger?tedatei ``da0`` durch die neue Ger?tedatei ``gm0`` des
Plattenspiegels. Um die Datei ``/etc/fstab`` bearbeiten zu k?nnen,
m?ssen Sie als Benutzer ``root`` am System angemeldet sein.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sollte `vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__
ihr bevorzugter Texteditor sein, kouml;nnen Sie diese ?nderungen ganz
einfach wie folgt durchf?hren:

.. code:: screen

    # vi /etc/fstab

Bevor Sie die Datei bearbeiten, sollten Sie ein Backup anlegen. Haben
Sie die Datei mit
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__
ge?ffnet, k?nnen Sie durch die Eingabe von **``:w /etc/fstab.bak``**
eine Sicherungskopie der Datei anlegen. Danach ersetzen Sie alle alten
Referenzen auf ``da0`` durch ``gm0``, indem Sie
**``:%s/da/mirror\/gm/g``** eingeben.

.. raw:: html

   </div>

Die ge?nderte ``fstab`` sollte nun ?hnlich wie im folgenden Beispiel
aussehen. Es spielt dabei keine Rolle, ob Sie SCSI- oder ATA-Platten
verwenden. Das RAID-Ger?t hei?t in jedem Fall ``gm``.

.. code:: programlisting

    # Device                Mountpoint      FStype  Options         Dump    Pass#
    /dev/mirror/gm0s1b                      none            swap    sw              0       0
    /dev/mirror/gm0s1a                      /               ufs     rw              1       1
    /dev/mirror/gm0s1d              /usr        ufs rw      0   0
    /dev/mirror/gm0s1f              /home       ufs rw      2   2
    #/dev/mirror/gm0s2d                     /store          ufs     rw              2       2
    /dev/mirror/gm0s1e                      /var            ufs     rw              2       2
    /dev/acd0               /cdrom          cd9660  ro,noauto       0       0

F?hren Sie einen Systemneustart durch:

.. code:: screen

    # shutdown -r now

Wenn das System gestartet wird, sollten Sie nun nur noch ``gm0``-Ger?te
anstatt der bisherigen ``da0``-Ger?te sehen. Nachdem das System
vollst?ndig initialisiert wurde, k?nnen Sie die neue Konfiguration
testen, indem Sie den Befehl ``mount`` ausf?hren:

.. code:: screen

    # mount
    Filesystem         1K-blocks    Used    Avail Capacity  Mounted on
    /dev/mirror/gm0s1a   1012974  224604   707334    24%    /
    devfs                      1       1        0   100%    /dev
    /dev/mirror/gm0s1f  45970182   28596 42263972     0%    /home
    /dev/mirror/gm0s1d   6090094 1348356  4254532    24%    /usr
    /dev/mirror/gm0s1e   3045006 2241420   559986    80%    /var
    devfs                      1       1        0   100%    /var/named/dev

Hier ist alles in Ordnung. Alle Werte sehen aus wie erwartet. Um die
Synchronisierung zu beginnen, integrieren Sie nun die Platte ``da1`` in
den Spiegel, indem Sie den folgenden Befehl eingeben:

.. code:: screen

    # gmirror insert gm0 /dev/da1

W?hrend die Platten gespiegelt werden, k?nnen Sie den Fortschritt durch
die Eingabe des folgenden Befehls ?berpr?fen:

.. code:: screen

    # gmirror status

Nachdem die Plattenspiegelung erfolgreich abgeschlossen wurde (und alle
Daten synchronisiert wurden), sollte Sie eine Ausgabe ?hnlich der
folgenden erhalten, wenn Sie den Befehl erneut ausf?hren:

.. code:: screen

          Name    Status  Components
    mirror/gm0  COMPLETE  da0
                          da1

Sollten Probleme aufgetreten oder sollte die Synchronisierung noch nicht
abgeschlossen sein, w?re der Status ``DEGRADED`` anstatt ``COMPLETE``.

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

20.4.2. Fehlerbehebung
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

20.4.2.1. Das System weigert sich zu starten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls das System startet und eine Eingabeaufforderung ?hnlich der
folgenden erscheint:

.. code:: programlisting

    ffs_mountroot: can't find rootvp
    Root mount failed: 6
    mountroot>

Starten Sie den Rechner neu mit der Power- oder Resettaste. W?hlen Sie
im Startmen? Option sechs (6). Dadurch erscheint eine
Eingabeaufforderung f?r
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__.
Laden Sie nun das Kernelmodul h?ndisch:

.. code:: screen

    OK? load geom_mirror
    OK? boot

Falls dies funktioniert, wurde das Modul (aus welchen Gr?nden auch
immer) nicht richtig geladen. Pr?fen Sie, ob Ihr Eintrag in der Datei
``/boot/loader.conf`` korrekt ist. Sollte das Problem weiterhin
bestehen, nehmen Sie die Zeile

.. code:: programlisting

    options   GEOM_MIRROR

in die Konfigurationsdatei des Kernels auf und f?hren Sie einen Rebuild
und eine erneute Installation durch. Dies sollte das Problem beseitigen.

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

20.4.3. Wiederherstellung des Systems nach einem Plattenausfall
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Sch?ne an der Plattenspiegelung ist, dass eine kaputte Platte
ersetzt werden kann, ohne dass Sie dabei Daten verlieren.

Basierend auf der vorhin besprochenen RAID1-Konfiguration, nehmen wir
nun an, dass die Platte ``da1`` ausgefallen ist und daher ersetzt werden
muss. Um dies zu tun, m?ssen Sie feststellen, welche Platte ausgefallen
ist und das System herunterfahren. Nun k?nnen Sie die kaputte Platte
gegen eine neue Platte austauschen und das System wieder starten.
Nachdem der Systemstart abgeschlossen ist, verwenden Sie die folgenden
Befehle, um die Plattenspiegelung wieder zu reaktivieren:

.. code:: screen

    # gmirror forget gm0

.. code:: screen

    # gmirror insert gm0 /dev/da1

Der Befehl ``gmirror`` ``status`` erlaubt es Ihnen, den Fortschritt bei
der Wiederherstellung der Plattenspiegelung zu beobachten. Das ist
alles, was Sie tun m?ssen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+-----------------------------------+
| `Zur?ck <GEOM-striping.html>`__?   | `Nach oben <GEOM.html>`__     | ?\ `Weiter <geom-ggate.html>`__   |
+------------------------------------+-------------------------------+-----------------------------------+
| 20.3. RAID0 - Striping?            | `Zum Anfang <index.html>`__   | ?20.5. GEOM Gate Netzwerkger?te   |
+------------------------------------+-------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
