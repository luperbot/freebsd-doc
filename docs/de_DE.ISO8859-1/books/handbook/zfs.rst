===================================
Kapitel 21. Das Z-Dateisystem (ZFS)
===================================

.. raw:: html

   <div class="navheader">

Kapitel 21. Das Z-Dateisystem (ZFS)
`Zur?ck <geom-gjournal.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <zfs-quickstart.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Kapitel 21. Das Z-Dateisystem (ZFS)
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes, Allan Jude, Benedict Reuschling und Warren
Block.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedict Reuschling.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`21.1. Was ZFS anders macht <zfs.html#zfs-differences>`__
`21.2. Schnellstartanleitung <zfs-quickstart.html>`__
`21.3. ``zpool`` Administration <zfs-zpool.html>`__
`21.4. ``zfs`` Administration <zfs-zfs.html>`__
`21.5. Delegierbare Administration <zfs-zfs-allow.html>`__
`21.6. Themen f?r Fortgeschrittene <zfs-advanced.html>`__
`21.7. Zus?tzliche Informationen <zfs-links.html>`__
`21.8. ZFS-Eigenschaften und Terminologie <zfs-term.html>`__

.. raw:: html

   </div>

Das *Z-Dateisystem*, oder kurz ZFS, ist ein fortgeschrittenes
Dateisystem, das entwickelt wurde, um viele der gro?en Probleme in
vorherigen Entwicklungen zu ?berwinden.

Urspr?nglich von Sun™ entworfen, wird die weitere Entwicklung von ZFS
heutzutage als Open Source vom `OpenZFS Projekt <http://open-zfs.org>`__
vorangetrieben.

ZFS hat drei gro?e Entwurfsziele:

.. raw:: html

   <div class="itemizedlist">

-  Datenintegrit?t: Alle Daten enthalten eine Pr?fsumme
   (`checksum <zfs-term.html#zfs-term-checksum>`__) der Daten. Wenn
   Daten geschrieben werden, wird die Pr?fsumme berechnet und zusammen
   mit den Daten gespeichert. Wenn diese Daten sp?ter wieder eingelesen
   werden, wird diese Pr?fsumme erneut berechnet. Falls die Pr?fsummen
   nicht ?bereinstimmen, wurde ein Datenfehler festgestellt. ZFS wird
   versuchen, diesen Fehler automatisch zu korrigieren, falls genug
   Datenredundanz vorhanden ist.

-  Gepoolter Speicher: physikalische Speichermedien werden zu einem Pool
   zusammengefasst und der Speicherplatz wird von diesem gemeinsam
   genutzten Pool allokiert. Der Speicherplatz steht allen Dateisystemen
   zur Verf?gung und kann durch das Hinzuf?gen von neuen Speichermedien
   vergr??ert werden.

-  Geschwindigkeit: mehrere Zwischenspeichermechanismen sorgen f?r
   erh?hte Geschwindigkeit. Der `ARC <zfs-term.html#zfs-term-arc>`__ ist
   ein weiterentwickelter, hauptspeicherbasierter Zwischenspeicher f?r
   Leseanfragen. Auf einer zweiten Stufe kann ein plattenbasierter
   `L2ARC <zfs-term.html#zfs-term-l2arc>`__-Lesezwischenspeicher
   hinzugef?gt werden. Zus?tzlich ist auch noch ein plattenbasierter,
   synchroner Schreibzwischenspeicher verf?gbar, der sog.
   `ZIL <zfs-term.html#zfs-term-zil>`__.

.. raw:: html

   </div>

Eine vollst?ndige Liste aller Eigenschaften und der dazugeh?rigen
Terminologie ist in `Abschnitt?21.8, „ZFS-Eigenschaften und
Terminologie“ <zfs-term.html>`__ zu sehen.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

21.1. Was ZFS anders macht
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ZFS ist signifikant unterschiedlich zu allen bisherigen Dateisystemen,
weil es mehr als nur ein Dateisystem ist. Durch die Kombination von
traditionell getrennten Rollen von Volumenmanager und Dateisystem ist
ZFS mit einzigartigen Vorteilen ausgestattet. Das Dateisystem besitzt
jetzt Kenntnis von der zugrundeliegenden Struktur der Speichermedien.
Traditionelle Dateisysteme konnten nur auf einer einzigen Platte
gleichzeitig angelegt werden. Falls es zwei Festplatten gab, mussten
auch zwei getrennte Dateisysteme erstellt werden. In einer
traditionellen Hardware-RAID-Konfiguration wurde dieses Problem
umgangen, indem dem Betriebssystem nur eine einzige logische Platte
angezeigt wurde, die sich aus dem Speicherplatz von der Anzahl an
physischen Platten zusammensetzte, auf dem dann das Betriebssystem ein
Dateisystem erstellte. Sogar im Fall von Software-RAID-L?sungen, wie
die, die von GEOM bereitgestellt werden, war das UFS-Dateisystem der
Ansicht, dass es auf nur einem einzigen Ger?t angelegt wurde. ZFS's
Kombination eines Volumenmanagers und eines Dateisystems l?st dies und
erlaubt das Erstellen von vielen Dateisystemen, die sich alle den
darunterliegenden Pool aus verf?gbarem Speicher teilen. Einer der
gr??ten Vorteile von ZFS's Kenntnis des physikalischen Layouts der
Platten ist, dass existierende Dateisysteme automatisch wachsen k?nnen,
wenn zus?tzliche Platten zum Pool hinzugef?gt werden. Dieser neue
Speicherplatz wird dann allen Dateisystemen zur Verf?gung gestellt. ZFS
besitzt ebenfalls eine Menge an unterschiedlichen Eigenschaften, die f?r
jedes Dateisystem angepasst werden k?nnen, was viele Vorteile bringt,
wenn man unterschiedliche Dateisysteme und Datasets anlegt, anstatt ein
einziges, monolithisches Dateisystem zu erzeugen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------------------------+---------------------------------------+
| `Zur?ck <geom-gjournal.html>`__?   | `Nach oben <system-administration.html>`__   | ?\ `Weiter <zfs-quickstart.html>`__   |
+------------------------------------+----------------------------------------------+---------------------------------------+
| 20.7. UFS Journaling in GEOM?      | `Zum Anfang <index.html>`__                  | ?21.2. Schnellstartanleitung          |
+------------------------------------+----------------------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
