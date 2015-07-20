=========================
22.2. Linux? Dateisysteme
=========================

.. raw:: html

   <div class="navheader">

22.2. Linux? Dateisysteme
`Zur?ck <filesystems.html>`__?
Kapitel 22. Dateisystemunterst?tzung
?\ `Weiter <vinum-vinum.html>`__

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

22.2. Linux? Dateisysteme
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD bietet integrierte Unterst?tzung f?r einige Linux?-Dateisysteme.
Dieser Abschnitt demonstriert, wie der Support aktiviert und die
unterst?tzten Linux?-Dateisysteme eingehangen werden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.2.1. ext2
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Seit FreeBSD?2.2 ist eine Kernel-Unterst?tzung f?r das ext2-Dateisystem
vorhanden. In FreeBSD?8.x und fr?heren Versionen wurde der Code noch
unter der GPL lizensiert. Der Code wurde neu geschrieben und steht seit
FreeBSD?9.0 unter der BSD-Lizenz.

Der
`ext2fs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ext2fs&sektion=5>`__-Treiber
erlaubt dem FreeBSD Kernel sowohl Lese-, als auch Schreibzugriffe auf
ext2-Dateisysteme.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dieser Treiber kann auch f?r den Zugriff auf ext3 und ext4 Dateisysteme
verwendet werden. Allerdings werden ext3-Journale, erweiterte Attribute
und Inodes gr??er 128 Byte nicht unterst?tzt. ext4 wird nur-lesend
unterst?tzt.

.. raw:: html

   </div>

Um auf ein ext-Dateisystem zuzugreifen, muss zuerst das entsprechende
Kernelmodul geladen werden:

.. code:: screen

    # kldload ext2fs

Mounten Sie anschlie?end das ext-Volume unter Angabe des FreeBSD
Partitionsnamens und eines existierenden Mountpunktes. Dieses Beispiel
h?ngt ``/dev/ad1s1`` nach ``/mnt`` ein:

.. code:: screen

    # mount -t ext2fs /dev/ad1s1 /mnt

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

22.2.2. ReiserFS
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD bietet Nur-Lese-Unterst?tzung f?r das Reiser-Dateisystem
ReiserFS.

Den Treiber f?r
`reiserfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=reiserfs&sektion=5>`__
laden Sie wie folgt:

.. code:: screen

    # kldload reiserfs

Mounten Sie anschlie?end das auf ``/dev/ad1s1`` befindliche
ReiserFS-Volume:

.. code:: screen

    # mount -t reiserfs /dev/ad1s1 /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+------------------------------------+-----------------------------------------+
| `Zur?ck <filesystems.html>`__?          | `Nach oben <filesystems.html>`__   | ?\ `Weiter <vinum-vinum.html>`__        |
+-----------------------------------------+------------------------------------+-----------------------------------------+
| Kapitel 22. Dateisystemunterst?tzung?   | `Zum Anfang <index.html>`__        | ?Kapitel 23. Der Vinum Volume Manager   |
+-----------------------------------------+------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
