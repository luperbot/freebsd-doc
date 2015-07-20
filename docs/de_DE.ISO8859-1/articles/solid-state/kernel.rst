=================
2. Kerneloptionen
=================

.. raw:: html

   <div class="navheader">

2. Kerneloptionen
`Zur?ck <index.html>`__?
?
?\ `Weiter <ro-fs.html>`__

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

2. Kerneloptionen
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein paar Kerneloptionen sind von besonderem Interesse f?r diejenigen,
welche diese eingebetteten FreeBSD-Systeme erstellen m?chten.

Alle eingebetteten FreeBSD-Systeme, die Flash-Speicher als Systemplatte
verwenden, sind interessant f?r Dateisysteme im Hauptspeicher und
RAM-Disks. Wegen der begrenzten Anzahl von Schreibzyklen, die auf
Flash-Speicher durchgef?hrt werden k?nnen, werden die Platte und die
Dateisysteme darauf mit grosser Wahrscheinlichkeit nur lesend eingeh?ngt
werden. In dieser Umgebung werden Dateisysteme wie ``/tmp`` und ``/var``
als RAM-Disks eingebunden, um dem System zu erlauben, Logdateien
anzulegen und Z?hler sowie tempor?re Dateien zu aktualisieren. RAM-Disks
sind eine kritische Komponente f?r eine erfolgreiche Solid State
Umsetzung in FreeBSD.

Sie sollten daf?r sorgen, dass die folgenden Zeilen in Ihrer
Kernelkonfigurationsdatei vorhanden sind:

.. code:: programlisting

    options         MFS             # Memory Filesystem
    options         MD_ROOT         # md device usable as a potential root device
    pseudo-device   md              # memory disk

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+-------------------------------------------------------+
| `Zur?ck <index.html>`__?          | ?                             | ?\ `Weiter <ro-fs.html>`__                            |
+-----------------------------------+-------------------------------+-------------------------------------------------------+
| FreeBSD und Solid State-Ger?te?   | `Zum Anfang <index.html>`__   | ?3. Die ``rc``-Subsysteme und nur-Lese Dateisysteme   |
+-----------------------------------+-------------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
