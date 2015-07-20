===============================
3.7. Plattenplatz bereitstellen
===============================

.. raw:: html

   <div class="navheader">

3.7. Plattenplatz bereitstellen
`Zur?ck <bsdinstall-netinstall.html>`__?
Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren
?\ `Weiter <bsdinstall-final-warning.html>`__

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

3.7. Plattenplatz bereitstellen
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt drei Arten, Plattenplatz f?r FreeBSD zur Verf?gung zu stellen.
*Gef?hrte* Partitionierung richtet Partitionen automatisch ein, w?hrend
*manuelle* Partitionierung es fortgeschrittenen Anwendern erlaubt,
selbstgew?hlte Partitionen zu erzeugen. Schliesslich gbt es noch die
Option eine Shell zu starten, auf der Kommandozeilenprogramme wie
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8>`__,
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__
und
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
direkt ausgef?hrt werden k?nnen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.10. Gef?hrte oder manuelle Partitionierung ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Gef?hrte oder manuelle Partitionierung ausw?hlen|

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

3.7.1. Gef?hrte Partitionierung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sollten mehrere Platten angeschlossen sein, w?hlen Sie diejenige aus,
auf der FreeBSD installiert werden soll.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.11. Aus mehreren Platten eine ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Aus mehreren Platten eine ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die gesamte Festplatte oder nur ein Teil davon kann f?r FreeBSD
verwendet werden. Ein allgemeines Partitionslayout, das die gesamte
Platte einnimmt wird erstellt, wenn [?Entire?Disk?] ausgew?hlt wird.
Durch die Wahl von [?Partition?] wird ein Partitionslayout im
unbenutzten Speicherplatz der Platte eingerichtet.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.12. Auswahl der gesamten Platte oder einer Partition

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Auswahl der gesamten Platte oder einer Partition|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem das Partitionslayout nun erstellt wurde, sollten Sie es danach
noch einmal auf Korrektheit pr?fen. Sollten Sie einen Fehler gemacht
haben, k?nnen Sie durch Auswahl von [?Revert?] wieder die urspr?nglichen
Partitionen setzen oder durch [?Auto?] die automatischen FreeBSD
Partitionen wiederherstellen. Partitionen k?nnen manuell erstellt,
ge?ndert oder gel?scht werden. Sollte die Partitionierung richtig sein,
w?hlen Sie [?Finish?] aus, um mit der Installation fortzufahren.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.13. ?berpr?fen der erstellen Partitionen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|?berpr?fen der erstellen Partitionen|

.. raw:: html

   </div>

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

3.7.2. Manuelle Partitionierung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manuelle Partitionierung f?hrt Sie direkt zum Partitionseditor.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.14. Partitionen manuell erstellen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Partitionen manuell erstellen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Durch hervorheben einer Platte (in diesem Fall ``ada0``) und die Auswahl
von [?Create?], wird ein Men? zur Wahl des *Partitionierungsschemas*
angezeigt.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.15. Partitionen manuell anlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Partitionen manuell anlegen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GPT-Partitionierung ist normalerweise die passendste Auswahl f?r
PC-kompatible Rechner. ?ltere PC Betriebssysteme, die nicht mit GPT
kompatibel und ben?tigen stattdessen MBR-Partitionen. Die anderen
Partitionsschemata werden f?r gew?hnlich f?r ?ltere Computersysteme
benutzt.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 3.1. Partitionierungsschemas

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Abk?rzung   | Beschreibung                                                                                                                                                                   |
+=============+================================================================================================================================================================================+
| APM         | `Apple Partition Map, von PowerPC? Macintosh? verwendet. <http://support.apple.com/kb/TA21692>`__                                                                              |
+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| BSD         | BSD-Labels ohne einen MBR, manchmal auch "dangerously dedicated mode" genannt. Lesen Sie dazu `bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__.   |
+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GPT         | `GUID Partition Table. <http://en.wikipedia.org/wiki/GUID_Partition_Table>`__                                                                                                  |
+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| MBR         | `Master Boot Record. <http://en.wikipedia.org/wiki/Master_boot_record>`__                                                                                                      |
+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| PC98        | `MBR-Variante, verwendet von NEC PC-98 Computern. <http://en.wikipedia.org/wiki/Pc9801>`__                                                                                     |
+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| VTOC8       | Volume Table Of Contents, von Sun SPARC64 und UltraSPARC Computern verwendet.                                                                                                  |
+-------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem das Partitionierungsschema ausgew?hlt und erstellt wurde, werden
durch erneute Auswahl von [?Create?] neue Partitionen erzeugt.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.16. Partitionen manuell erzeugen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Partitionen manuell erzeugen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine FreeBSD-Standardinstallation mit GPT legt mindestens die folgenden
drei Partitionen an:

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Standard-FreeBSD GPT-Partitionen

.. raw:: html

   </div>

-  ``freebsd-boot`` - FreeBSD-Bootcode. Diese Partition muss die erste
   auf der Festplatte sein.

-  ``freebsd-ufs`` - Ein FreeBSD UFS-Dateisystem.

-  ``freebsd-swap`` - FreeBSD Auslagerungsbereich (swap space).

.. raw:: html

   </div>

Mehere Dateisystempartitionen k?nnen benutzt werden und manche Leute
ziehen es vor, ein traditionelles Layout mit getrennten Partitionen f?r
die Dateisysteme ``/``, ``/var``, ``/tmp`` und ``/usr`` zu erstellen.
Lesen Sie dazu `Beispiel?3.3, „Ein traditionelles, partitioniertes
Dateisystem
erstellen“ <bsdinstall-partitioning.html#bsdinstall-part-manual-splitfs>`__,
um ein Beispiel zu erhalten.

Lesen Sie
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8>`__
f?r eine vollst?ndige Liste von verf?gbaren GPT-Partitionstypen.

Gr?ssenangaben k?nnen mit g?ngigen Abk?rzungen eingegeben werden: *K*
f?r Kilobytes, *M* f?r Megabytes oder *G* f?r Gigabytes.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Korrekte Sektorausrichtung erm?glicht gr?sstm?gliche Geschwindigkeit und
das Anlegen von Partitionsgr?ssen als vielfaches von 4K-Bytes hilft, die
passende Ausrichtung auf Platten mit entweder 512-Bytes oder 4K-Bytes
Sektorgr?ssen, festzulegen. Generell sollte die Verwendung von
Partitionsgr?ssen, die sogar vielfache von 1M oder 1G sind, den
einfachsten Weg darstellen, um sicher zu stellen, dass jede Partition an
einem vielfachen von 4K beginnt. Eine Ausnahme gibt es: momentan sollte
die *freebsd-boot*-Partition aufgrund von Beschr?nkungen im Bootcode
nicht gr?sser sein als 512K.

.. raw:: html

   </div>

Ein Einh?gepunkt wird ben?tigt, falls diese Partition ein Dateisystem
enth?lt. Falls nur eine einzelne UFS-Partition erstellt wird, sollte der
Einh?ngepunkt ``/`` lauten.

Ein *label* wird ebenfalls ben?tigt. Ein Label ist ein Name, durch den
diese Partition angesprochen wird. Festplattennamen oder -nummern k?nnen
sich ?ndern, falls die Platte einmal an einem anderen Controller oder
Port angeschlossen sein sollte, doch das Partitionslabel ?ndert sich
dadurch nicht. Anstatt auf Plattennamen und Partitionsnummern in Dateien
wie ``/etc/fstab`` zu verweisen, sorgen Labels daf?r, dass das System
Hardw?re?nderungen eher toleriert. GPT-Labels erscheinen in
``/dev/gpt/``, wenn eine Platte angeschlossen wird. Andere
Partitionierungsschemas besitzen unterschiedliche F?higkeiten, Labels zu
verwenden und diese erscheinen in anderen ``/dev/``-Verzeichnissen.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Vergeben Sie ein einzigartiges Label auf jedem Dateisystem um Konflikte
mit identischen Labels zu verhindern. Ein paar Buchstaben des
Computernamens, dessen Verwendungszweck oder Ortes kann dem Label
hinzugef?gt werden. Beispielsweise "labroot" oder "rootfs-lab" f?r die
UFS root-Partition auf einem Laborrechner.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 3.3. Ein traditionelles, partitioniertes Dateisystem erstellen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

F?r ein traditionelles Partitionslayout, in dem sich ``/``, ``/var``,
``/tmp`` und ``/usr`` in getrennten Partitionen befinden sollen,
erstellen Sie ein GPT-Partitionsschema und anschliessend die Partitionen
selbst. Die gezeigten Partitionsgr?ssen sind typisch f?r eine Festplatte
von 20?G. Falls mehr Platz verf?gbar ist, sind gr?ssere Swap oder
``/var``-Partitionen n?tzlich. Den hier gezeigten Beschreibungen sind
``bsp`` f?r "Beispiel" vorangestellt, jedoch sollten Sie andere,
einzigartige Beschreibungen verwenden, wie oben beschrieben.

.. raw:: html

   <div class="informaltable">

+--------------------+---------------------------------------------------------------+------------------+-----------------+
| Partitionstyp      | Gr?sse                                                        | Eingeh?ngt als   | Beschreibung    |
+====================+===============================================================+==================+=================+
| ``freebsd-boot``   | ``512K``                                                      | ?                | ?               |
+--------------------+---------------------------------------------------------------+------------------+-----------------+
| ``freebsd-ufs``    | ``2G``                                                        | ``/``            | ``bsprootfs``   |
+--------------------+---------------------------------------------------------------+------------------+-----------------+
| ``freebsd-swap``   | ``4G``                                                        | ?                | ``bspswap``     |
+--------------------+---------------------------------------------------------------+------------------+-----------------+
| ``freebsd-ufs``    | ``2G``                                                        | ``/var``         | ``bspvarfs``    |
+--------------------+---------------------------------------------------------------+------------------+-----------------+
| ``freebsd-ufs``    | ``1G``                                                        | ``/tmp``         | ``bsptmpfs``    |
+--------------------+---------------------------------------------------------------+------------------+-----------------+
| ``freebsd-ufs``    | Akzeptieren Sie die Standardeinstellungen (Rest der Platte)   | ``/usr``         | ``bspusrfs``    |
+--------------------+---------------------------------------------------------------+------------------+-----------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem die selbstgew?hlten Partitionen erzeugt wurden, w?hlen Sie
[?Finish?], um mit der Installation fortzusetzen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-----------------------------------+-------------------------------------------------+
| `Zur?ck <bsdinstall-netinstall.html>`__?   | `Nach oben <bsdinstall.html>`__   | ?\ `Weiter <bsdinstall-final-warning.html>`__   |
+--------------------------------------------+-----------------------------------+-------------------------------------------------+
| 3.6. Installation aus dem Netzwerk?        | `Zum Anfang <index.html>`__       | ?3.8. Die Installation festschreiben            |
+--------------------------------------------+-----------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Gef?hrte oder manuelle Partitionierung ausw?hlen| image:: bsdinstall/bsdinstall-part-guided-manual.png
.. |Aus mehreren Platten eine ausw?hlen| image:: bsdinstall/bsdinstall-part-guided-disk.png
.. |Auswahl der gesamten Platte oder einer Partition| image:: bsdinstall/bsdinstall-part-entire-part.png
.. |?berpr?fen der erstellen Partitionen| image:: bsdinstall/bsdinstall-part-review.png
.. |Partitionen manuell erstellen| image:: bsdinstall/bsdinstall-part-manual-create.png
.. |Partitionen manuell anlegen| image:: bsdinstall/bsdinstall-part-manual-partscheme.png
.. |Partitionen manuell erzeugen| image:: bsdinstall/bsdinstall-part-manual-addpart.png
