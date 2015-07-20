====================================
12.15. Hinzuf?gen von Swap-Bereichen
====================================

.. raw:: html

   <div class="navheader">

12.15. Hinzuf?gen von Swap-Bereichen
`Zur?ck <configtuning-kernel-limits.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <acpi-overview.html>`__

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

12.15. Hinzuf?gen von Swap-Bereichen
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Egal wie vorausschauend Sie planen, manchmal entspricht ein System
einfach nicht Ihren Erwartungen. Es ist leicht, mehr Swap-Bereiche
hinzuzuf?gen. Dazu stehen Ihnen drei Wege offen: Sie k?nnen eine neue
Platte einbauen, den Swap-Bereich ?ber NFS ansprechen oder eine
Swap-Datei auf einer existierenden Partition einrichten.

F?r Informationen zur Verschl?sselung von Swap-Partitionen, zu den dabei
m?glichen Optionen sowie zu den Gr?nden f?r eine Verschl?sselung des
Auslagerungsspeichers lesen Sie bitte `Abschnitt?19.17, „Den
Auslagerungsspeicher verschl?sseln“ <swap-encrypting.html>`__ des
Handbuchs.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.15.1. Swap auf einer neuen oder existierenden Festplatte
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Hinzuf?gen einer neuen Festplatte f?r Swap-Bereich bietet eine
bessere Leistung, als das Hinzuf?gen einer Partition auf einem
vorhandenem Laufwerk. Die Einrichtung von Partitionen und Laufwerken
wird in `Abschnitt?19.3, „Hinzuf?gen von
Laufwerken“ <disks-adding.html>`__ beschrieben. `Abschnitt?12.2,
„Vorbereitende Konfiguration“ <configtuning-initial.html>`__ diskutiert
Aspekte ?ber die Anordnung und Gr??e von Swap-Bereichen.

Benutzen Sie
`swapon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=8>`__
um eine Swap-Partition zum System hinzuzuf?gen. Zum Beispiel:

.. code:: screen

    # swapon
    /dev/ada1s1b

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Sie k?nnen jede Partition verwenden, sofern sie nicht schon eingehangen
ist. Das gilt auch dann, wenn die Partition bereits Daten enth?lt. Wird
`swapon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=8>`__
auf einer Partition ausgef?hrt die noch Daten enth?lt, werden die
vorhandenen Daten ?berschrieben und sind unweigerlich verloren. Stellen
Sie sicher, das die Partition, die Sie als Swap-Bereich hinzuf?gen
m?chten, wirklich die gew?nschte Partition ist, bevor sie
`swapon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=8>`__
ausf?hren.

.. raw:: html

   </div>

Um diese Swap-Partition automatisch beim Systemstart hinzuzuf?gen, f?gen
Sie einen Eintrag f?r die Partition in ``/etc/fstab`` hinzu:

.. code:: programlisting

    /dev/ada1s1b   none    swap    sw  0   0

Die einzelnen Eintr?ge von ``/etc/fstab`` werden in
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
erl?utert.

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

12.15.2. Swap-Bereiche ?ber NFS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Swap-Bereiche ?ber NFS sollten Sie nur dann einsetzen, wenn Sie ?ber
keine lokale Platte verf?gen, da es durch die zur Verf?gung stehende
Bandbreite limitiert wird und au?erdem den NFS-Server zus?tzlich
belastet.

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

12.15.3. Swap-Dateien
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen eine Datei festgelegter Gr??e als Swap-Bereich nutzen. Im
folgenden Beispiel werden wir eine 64?MB gro?e Datei mit Namen
``/usr/swap0`` benutzen, Sie k?nnen nat?rlich einen beliebigen Namen f?r
den Swap-Bereich benutzen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 12.1. Erstellen einer Swap-Datei

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. raw:: html

   <div class="orderedlist">

#. Der ``GENERIC``-Kernel unterst?tzt bereits RAM-Disks
   (`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__),
   welche f?r diese Aktion ben?tigt werden. Wenn Sie einen eigenen
   Kernel erstellen, vergewissern Sie sicher, dass die folgende Zeile in
   ihrer Kernel-Konfigurationsdatei enthalten ist:

   .. code:: programlisting

       device   md

   Informationen, wie man einen eigenen Kernel erstellen kann, erhalten
   Sie in `Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__.

#. Legen Sie die Swap-Datei ``/usr/swap0`` an:

   .. code:: screen

       # dd if=/dev/zero of=/usr/swap0 bs=1024k count=64

#. Setzen Sie die richtigen Berechtigungen f?r ``/usr/swap0``:

   .. code:: screen

       # chmod 0600 /usr/swap0

#. Aktivieren Sie die Swap-Datei ``/etc/rc.conf``:

   .. code:: programlisting

       swapfile="/usr/swap0"   # Set to name of swapfile if aux swapfile desired.

#. Um die Swap-Datei zu aktivieren, f?hren Sie entweder einen Neustart
   durch oder geben das folgende Kommando ein:

   .. code:: screen

       # mdconfig -a -t vnode -f /usr/swap0 -u 0 && swapon /dev/md0

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

   <div class="navfooter">

--------------

+-------------------------------------------------+--------------------------------------+---------------------------------------------+
| `Zur?ck <configtuning-kernel-limits.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <acpi-overview.html>`__          |
+-------------------------------------------------+--------------------------------------+---------------------------------------------+
| 12.14. Einstellungen von Kernel Limits?         | `Zum Anfang <index.html>`__          | ?12.16. Energie- und Ressourcenverwaltung   |
+-------------------------------------------------+--------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
