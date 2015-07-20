==========================================================
19.13. Netzwerk-, speicher- und dateibasierte Dateisysteme
==========================================================

.. raw:: html

   <div class="navheader">

19.13. Netzwerk-, speicher- und dateibasierte Dateisysteme
`Zur?ck <backup-basics.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <snapshots.html>`__

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

19.13. Netzwerk-, speicher- und dateibasierte Dateisysteme
----------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Verbessert und neu strukturiert von Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Neben Laufwerken, die sich physikalisch im Rechner befinden wie
Diskettenlaufwerke, CDs, Festplatten usw., kann FreeBSD auch mit anderen
Laufwerken, den *virtuellen Laufwerken*, umgehen.

Dazu z?hlen Netzwerkdateisysteme wie `Network
Filesystem <network-nfs.html>`__ und Coda, speicher- und dateibasierte
Dateisysteme.

Abh?ngig von der verwendeten FreeBSD Version werden speicher- und
dateibasierte Dateisysteme mit unterschiedlichen Werkzeugen angelegt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ger?tedateien werden unter FreeBSD automatisch von
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
angelegt.

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

19.13.1. Dateibasierte Laufwerke unter FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unter FreeBSD werden virtuelle Laufwerke
(`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__) mit
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
erzeugt. Dazu muss das Modul
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
geladen sein oder das entsprechende Ger?t in der Kernelkonfiguration
aktiviert sein:

.. code:: programlisting

    device md

Mit
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
k?nnen drei verschiedene virtuelle Laufwerke angelegt werden:
speicherbasierte Laufwerke, deren Speicher von
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
zur Verf?gung gestellt wird, oder dateibasierte Laufwerke, deren
Speicher von einer Datei oder dem Swap-Bereich zur Verf?gung gestellt
wird. Eine m?gliche Anwendung ist das Einh?ngen von Dateien, die
Abbilder von CD-ROMs oder Disketten enthalten.

Das Abbild eines Dateisystems wird wie folgt eingehangen:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 19.3. Einh?ngen eines existierenden Abbildes unter FreeBSD

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # mdconfig -a -t vnode -f diskimage -u 0
    # mount /dev/md0 /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein neues Dateisystem-Abbild erstellen Sie mit
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
wie folgt:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 19.4. Erstellen eines dateibasierten Laufwerks mit ``mdconfig``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # dd if=/dev/zero of=newimage bs=1k count=5k
    5120+0 records in
    5120+0 records out
    # mdconfig -a -t vnode -f newimage -u 0
    # bsdlabel -w md0 auto
    # newfs md0a
    /dev/md0a: 5.0MB (10224 sectors) block size 16384, fragment size 2048
            using 4 cylinder groups of 1.25MB, 80 blks, 192 inodes.
    super-block backups (for fsck -b #) at:
     160, 2720, 5280, 7840
    # mount /dev/md0a /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md0a       4710    4  4330     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie keine Ger?tenummer mit dem Schalter ``-u`` angeben, wird von
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
automatisch eine ungenutzte Ger?tenummer zugewiesen. Das zugewiesene
Ger?t wird auf der Standardausgabe ausgegeben (zum Beispiel ``md4``).
Weitere Informationen entnehmen Sie bitte der Hilfeseite
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__.

Das Werkzeug
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
ist sehr n?tzlich, doch muss man viele Kommandos absetzen, um ein
dateibasiertes Dateisystem zu erstellen. FreeBSD enth?lt das Werkzeug
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__,
das die notwendigen Schritte in einem Befehl zusammenfasst. Es
konfiguriert mit
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
ein
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__-Laufwerk,
erstellt darauf mit
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
ein Dateisystem und h?ngt es anschlie?end mit
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
ein. Das virtuelle Laufwerk aus dem obigen Beispiel kann somit einfach
mit den nachstehenden Befehlen erstellt werden:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 19.5. Mit ``mdmfs`` ein dateibasiertes Dateisystem erstellen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # dd if=/dev/zero of=newimage bs=1k count=5k
    5120+0 records in
    5120+0 records out
    # mdmfs -F newimage -s 5m md0 /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md0        4718    4  4338     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn sie die Option ``md`` ohne Ger?tenummer verwenden, w?hlt
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
automatisch ein ungenutztes Ger?t aus. Weitere Einzelheiten entnehmen
Sie bitte der Hilfeseite
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__.

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

19.13.2. Speicherbasierte Laufwerke unter FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Verwenden Sie ein speicherbasiertes Dateisystem, sollten Sie die Option
„swap backing“ aktivieren. Setzen Sie diese Option, hei?t dies
allerdings nicht, dass das speicherbasierte Laufwerk automatisch auf
ihre Festplatte ausgelagert wird, vielmehr wird der Speicherplatz danach
aus einem Speicherpool angefordert, der bei Bedarf auf die Platte
ausgelagert werden kann. Zus?tzlich ist es m?glich,
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__-gest?tzte
speicherbasierte Laufwerke zu erstellen. Das Anlegen solcher Laufwerke
kann allerdings zu einer System-Panic f?hren, wenn der Kernel danach
?ber zu wenig Speicher verf?gt.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 19.6. Erstellen eines speicherbasierten Laufwerks mit
``mdconfig``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # mdconfig -a -t swap -s 5m -u 1
    # newfs -U md1
    /dev/md1: 5.0MB (10240 sectors) block size 16384, fragment size 2048
            using 4 cylinder groups of 1.27MB, 81 blks, 192 inodes.
            with soft updates
    super-block backups (for fsck -b #) at:
     160, 2752, 5344, 7936
    # mount /dev/md1 /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md1        4718    4  4338     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 19.7. Erstellen eines speicherbasierten Laufwerks mit ``mdmfs``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # mdmfs -s 5m md2 /mnt
    # df /mnt

    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md2        4846    2  4458     0%    /mnt

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

19.13.3. Virtuelle Laufwerke freigeben
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ein virtuelles Laufwerk nicht mehr gebraucht wird, sollten Sie dem
System die belegten Ressourcen zur?ckgeben. H?ngen Sie dazu zuerst das
Dateisystem ab und geben Sie dann die benutzten Ressourcen mit
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
frei.

Alle von ``/dev/md4`` belegten Ressourcen werden mit dem nachstehenden
Kommando freigegeben:

.. code:: screen

    # mdconfig -d -u 4

Eingerichtete
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__-Ger?te
werden mit dem Befehl ``mdconfig -l`` angezeigt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+--------------------------------------------+
| `Zur?ck <backup-basics.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <snapshots.html>`__             |
+------------------------------------+-------------------------------+--------------------------------------------+
| 19.12. Datensicherung?             | `Zum Anfang <index.html>`__   | ?19.14. Schnappsch?sse von Dateisystemen   |
+------------------------------------+-------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
