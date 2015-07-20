======================
20.3. RAID0 - Striping
======================

.. raw:: html

   <div class="navheader">

20.3. RAID0 - Striping
`Zur?ck <GEOM-intro.html>`__?
Kapitel 20. GEOM: Modulares Framework zur Plattentransformation
?\ `Weiter <GEOM-mirror.html>`__

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

20.3. RAID0 - Striping
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes und Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Striping (stripe = Streifen) ist eine Methode, um verschiedene Laufwerke
in einem einzigen Datentr?ger zusammenzufassen. In vielen F?llen wird
dies durch die Nutzung von Hardware-Controllern bewerkstelligt. Das
GEOM-Subsystem unterst?tzt Software-RAID0 (welches auch als Striping
bekannt ist).

In einem RAID0-System werden die Daten in einzelne Bl?cke aufgeteilt,
welche ?ber alle angeschlossenen Laufwerke in einem Datenfeld (Array)
geschrieben werden. Anstatt darauf warten zu m?ssen, dass 256K auf ein
einzelnes Laufwerk geschrieben werden, kann ein RAID0-System
gleichzeitig 64K auf jedes von 4 Laufwerken schreiben mit entsprechend
besserer I/O-Leistung. Dieser Durchsatz kann durch die Verwendung
mehrerer Controller noch zus?tzlich gesteigert werden.

Jedes Laufwerk in einem RAID0-Stripe muss die gleiche Gr??e haben, da
I/O-Anforderungen f?r das Lesen und Schreiben abwechselnd auf mehrere
Laufwerke parallel erfolgen.

.. raw:: html

   <div class="mediaobject" align="center">

|Disk Striping Illustration|

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Prozedur 20.1. Erzeugen eines Stripe von unformatierten ATA-Platten

.. raw:: html

   </div>

#. Laden Sie das ``geom_stripe.ko``-Modul:

   .. code:: screen

       # kldload geom_stripe

#. Stellen Sie sicher, dass ein geeigneter Mount-Punkt existiert. Falls
   dieser Datentr?ger eine Root-Partition werden soll, dann nutzen Sie
   zeitweise einen anderen Mount-Punkt, beispielsweise ``/mnt``:

   .. code:: screen

       # mkdir /mnt

#. Bestimmen Sie die Ger?tenamen derjenigen Platten, welche gestriped
   werden sollen, und erzeugen Sie ein neues Stripe-Ger?t. Das folgende
   Beispiel verwendet zwei unbenutzte und unpartitionierte ATA-Platten,
   die gestriped werden sollen. Lauten die Ger?tenamen ``/dev/ad2`` und
   ``/dev/ad3``, so verwenden Sie folgenden Befehl:

   .. code:: screen

       # gstripe label -v st0 /dev/ad2 /dev/ad3
       Metadata value stored on /dev/ad2.
       Metadata value stored on /dev/ad3.
       Done.

#. Schreiben Sie einen Standard-Label (auch als Partitions-Tabelle
   bekannt) auf den neuen Datentr?ger und installieren Sie den normalen
   Bootstrap-Code:

   .. code:: screen

       # bsdlabel -wB /dev/stripe/st0

#. Dieser Prozess sollte zwei weitere Ger?te im Verzeichnis
   ``/dev/stripe`` (zus?tzlich zum Ger?t ``st0``) erzeugt haben. Diese
   schliessen ``st0a`` und ``st0c`` ein. Nun kann ein Dateisystem auf
   dem Ger?t ``st0a`` mit dem ``newfs``-Dienstprogramm erzeugt werden:

   .. code:: screen

       # newfs -U /dev/stripe/st0a

   Viele Zahlen rauschen nun ?ber Ihren Bildschirm und nach ein paar
   Sekunden wird der Prozess abgeschlossen sein. Der Datentr?ger wurde
   erzeugt und kann in den Verzeichnisbaum eingeh?ngt werden.

.. raw:: html

   </div>

Um das erzeugte Stripe manuell zu mounten:

.. code:: screen

    # mount /dev/stripe/st0a /mnt

Um das erzeugte Dateisystem automatisch w?hrend des Startvorgangs zu
mounten, m?ssen Sie die Datentr?gerinformation in die Datei
``/etc/fstab`` schreiben. Dazu legen Sie einen permanenten Mountpunkt
namens ``stripe`` an:

.. code:: screen

    # mkdir /stripe
    # echo "/dev/stripe/st0a /stripe ufs rw 2 2" \
        >> /etc/fstab

Das ``geom_stripe.ko``-Modul muss ebenfalls automatisch beim Systemstart
geladen werden (durch die Aufnahme der folgenden Zeile in die Datei
``/boot/loader.conf``):

.. code:: screen

    # echo 'geom_stripe_load="YES"' >> /boot/loader.conf

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <GEOM-intro.html>`__?   | `Nach oben <GEOM.html>`__     | ?\ `Weiter <GEOM-mirror.html>`__   |
+---------------------------------+-------------------------------+------------------------------------+
| 20.2. Einf?hrung in GEOM?       | `Zum Anfang <index.html>`__   | ?20.4. RAID1 - Spiegelung          |
+---------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Disk Striping Illustration| image:: geom/striping.png
