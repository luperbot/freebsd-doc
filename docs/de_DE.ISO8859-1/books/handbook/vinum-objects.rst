===================
23.5. Vinum-Objekte
===================

.. raw:: html

   <div class="navheader">

23.5. Vinum-Objekte
`Zur?ck <vinum-data-integrity.html>`__?
Kapitel 23. Der Vinum Volume Manager
?\ `Weiter <vinum-examples.html>`__

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

23.5. Vinum-Objekte
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die in den vorigen Abschnitte besprochenen Probleme zu l?sen,
verwendet Vinum eine vierstufige Objekthierarchie:

.. raw:: html

   <div class="itemizedlist">

-  Das auff?lligste Objekt ist die virtuelle Platte, die *Volume*
   genannt wird. Volumes haben im Wesentlichen die gleichen
   Eigenschaften wie ein UNIX?-Laufwerk, obwohl es ein paar kleine
   Unterschiede gibt. So existieren f?r Volumes beispielsweise keine
   Gr??enbeschr?nkungen.

-  Volumes bestehen aus einem oder mehreren *Plexus*, von denen jeder
   den gesamten Adressraum eines Datentr?gers repr?sentiert. Diese
   Hierarchieebene ist f?r die ben?tigte Redundanz der Daten
   erforderlich. Stellen Sie sich die Plexus als eigenst?ndige Platten
   in einem gespiegelten Array vor, von denen jede die gleichen Daten
   enth?lt.

-  Da Vinum im UNIX?-Plattenspeicher-Framework arbeitet, w?re es
   m?glich, als Grundbaustein f?r Multiplatten-Plexus UNIX?-Partitionen
   zu verwenden. In der Praxis ist dieser Ansatz aber zu unflexibel, da
   UNIX?-Platten nur eine begrenzte Anzahl von Partitionen haben k?nnen.
   Daher unterteilt Vinum stattdessen eine einzige UNIX?-Partition (die
   *Platte*) in zusammenh?ngende Bereiche, die als *Subdisks* bezeichnet
   werden und als Grundbausteine f?r einen Plexus benutzt werden.

-  Subdisks befinden sich auf Vinum-*Platten*, eigentlich
   UNIX?-Partitionen. Vinum-Platten k?nnen eine beliebige Anzahl von
   Subdisks haben und den gesamten Speicher der Platte mit Ausnahme
   eines kleinen Bereiches am Anfang der Platte (welcher zur Speicherung
   von Konfigurations- und Statusinformationen verwenden wird)
   verwenden.

.. raw:: html

   </div>

Der folgende Abschnitt beschreibt, wie diese Objekte die von Vinum
ben?tigten Funktionen zur Verf?gung stellen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.5.1. ?berlegungungen zur Gr??e eines Volumes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Plexus k?nnen mehrere Subdisks beinhalten, die ?ber alle Platten der
Vinum-Konfiguration verteilt sind. Daraus folgt, dass die Gr??e einer
Platte nicht die Gr??e eines Plexus (und damit eines Volumes) limitiert.

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

23.5.2. Redundante Datenspeicherung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vinum implementiert die Datenspiegelung, indem es ein Volume auf mehrere
Plexus verteilt. Jeder Plexus ist dabei die Repr?sentation der Daten
eines Volumes. Ein Volume kann aus bis zu acht Plexus bestehen.

Obwohl ein Plexus die gesamten Daten eines Volumes repr?sentiert, ist es
m?glich, dass Teile der Repr?sentation physisch fehlen, entweder
aufgrund des Designs (etwa durch nicht definierte Subdisks f?r Teile des
Plexus) oder durch Zufall (als ein Ergebnis eines Plattenfehlers).
Solange wenigstens ein Plexus die gesamten Daten f?r den kompletten
Adressbereich des Volumes zur Verf?gung stellen kann, ist das Volume
voll funktionsf?hig.

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

23.5.3. ?berlegungen zur Leistung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sowohl Konkatenation als auch Striping werden von Vinum auf der
Plexus-Ebene realisiert:

.. raw:: html

   <div class="itemizedlist">

-  Ein *konkatenierter Plexus* benutzt abwechselnd den Adressraum jeder
   Subdisk.

-  Ein *gestripter Plexus* striped die Daten ?ber jede Subdisk. Die
   Subdisks m?ssen alle die gleiche Gr??e haben, und es muss mindestens
   zwei Subdisks in Reihenfolge geben, um ihn von einem konkatenierten
   Plexus unterscheiden zu k?nnen.

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

23.5.4. Wie ist ein Plexus aufgebaut?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Version von Vinum, welche von FreeBSD-10.1 bereitgestellt wird,
implementiert zwei Arten von Plexus:

.. raw:: html

   <div class="itemizedlist">

-  Konkatenierte Plexus sind die flexibelsten: Sie k?nnen aus einer
   beliebigen Anzahl von Subdisks unterschiedlicher Gr??e bestehen. Der
   Plexus kann erweitert werden, indem man zus?tzliche Subdisks
   hinzuf?gt. Sie brauchen weniger CPU-Zeit als gestripte Plexus, obwohl
   der Unterschied des CPU-Overheads nicht messbar ist. Auf der anderen
   Seite sind sie aber sehr anf?llig f?r das Entstehen von "hot spots",
   wobei eine Platte sehr aktiv ist, andere hingegen nahezu ungenutzt
   sind.

-  Der gr??te Vorteil eines gestripten Plexus (RAID-0) ist die
   Verringerung von "hot spots". Dies wird durch die Auswahl eines
   Stripes optimaler Gr??e (etwa 256?kB) erreicht, wodurch die Last
   gleichm??ig auf die Platten verteilt werden kann. Nachteile dieser
   Vorgehensweise sind ein (geringf?gig) komplexerer Code sowie einige
   Restriktionen f?r die Subdisks: Diese m?ssen alle die gleiche Gr??e
   haben, und das Erweitern eines Plexus durch das Hinzuf?gen neuer
   Subdisks ist so kompliziert, dass es von Vinum derzeit nicht
   unterst?tzt wird. Vinum fordert noch eine weitere triviale
   Beschr?nkung: Ein gestripter Plexus muss aus mindestens zwei Subdisks
   bestehen, da er ansonsten nicht von einem konkatenierten Plexus
   unterscheidbar ist.

.. raw:: html

   </div>

`Tabelle?23.1, „Vinum-Plexus -
Aufbau“ <vinum-objects.html#vinum-comparison>`__ fasst die Vor- und
Nachteile jedes Plexus-Aufbaus zusammen.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 23.1. Vinum-Plexus - Aufbau

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------+------------------------+-----------------------------+----------------------------------+--------------------------------------------------------------------------------------+
| Plexus-Typ     | Minimum an Subdisks?   | Kann Subdisks hinzuf?gen?   | M?ssen die gleiche Gr??e haben   | Applikation                                                                          |
+================+========================+=============================+==================================+======================================================================================+
| konkateniert   | 1                      | ja                          | nein                             | Gro?er Datenspeicher mit maximaler Platzierungsflexibilit?t und moderater Leistung   |
+----------------+------------------------+-----------------------------+----------------------------------+--------------------------------------------------------------------------------------+
| gestriped      | 2                      | nein                        | ja                               | Hohe Leistung in Kombination mit gleichzeitigem Zugriff                              |
+----------------+------------------------+-----------------------------+----------------------------------+--------------------------------------------------------------------------------------+

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

+-------------------------------------------+------------------------------------+---------------------------------------+
| `Zur?ck <vinum-data-integrity.html>`__?   | `Nach oben <vinum-vinum.html>`__   | ?\ `Weiter <vinum-examples.html>`__   |
+-------------------------------------------+------------------------------------+---------------------------------------+
| 23.4. Datenintegrit?t?                    | `Zum Anfang <index.html>`__        | ?23.6. Einige Beispiele               |
+-------------------------------------------+------------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
