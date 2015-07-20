=======================
23.3. M?gliche Engp?sse
=======================

.. raw:: html

   <div class="navheader">

23.3. M?gliche Engp?sse
`Zur?ck <vinum-intro.html>`__?
Kapitel 23. Der Vinum Volume Manager
?\ `Weiter <vinum-data-integrity.html>`__

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

23.3. M?gliche Engp?sse
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Moderne Systeme m?ssen h?ufig parallel auf Daten zugreifen. Gro?e FTP-
und HTTP-Server k?nnen beispielsweise Tausende von parallelen Sitzungen
verwalten und haben mehrere 100?MBit/s-Verbindungen zur Au?enwelt. Diese
Bandbreite ?berschreitet die durchschnittliche Transferrate der meisten
Platten bei weitem.

Aktuelle Plattenlaufwerke k?nnen Daten mit bis zu 70?MB/s sequentiell
?bertragen, wobei dieser Wert in einer Umgebung, in der viele
unabh?ngige Prozesse auf eine gemeinsame Platte zugreifen, die jeweils
nur einen Bruchteil dieses Wertes erreichen, von geringer Aussagekraft
ist. In solchen F?llen ist es interessanter, das Problem vom Blickwinkel
des Platten-Subsystems aus zu betrachten. Der wichtigste Parameter ist
dabei die Last, die eine ?bertragung auf dem Subsystem verursacht. Unter
Last versteht man dabei die Zeit, in der die Platte mit der ?bertragung
der Daten besch?ftigt ist.

Bei jedem Plattenzugriff muss das Laufwerk zuerst die K?pfe
positionieren und auf den ersten Sektor warten, bis er den Lesekopf
passiert. Dann wird die ?bertragung gestartet. Diese Aktionen k?nnen als
atomar betrachtet werden, da es keinen Sinn macht, diese zu
unterbrechen.

Nehmen wir beispielsweise an, dass wir 10?kB transferieren wollen.
Aktuelle hochperformante Platten k?nnen die K?pfe im Durchschnitt in
3,5?ms positionieren und drehen sich mit maximal 15.000?U/min. Daher
betr?gt die durchschnittliche Rotationslatenz (eine halbe Umdrehung)
2?ms. Bei einer Transferrate von 70?MB/s dauert die eigentliche
?bertragung von 10?kB etwa 150?μs, fast nichts im Vergleich zur
Positionierungszeit. In einem solchen Fall betr?gt die effektive
Transferrate nur etwas mehr als 1?MB/s. Die Tranferrate ist also stark
von der Gr??e der zu tranferierenden Daten abh?ngig.

Die traditionelle und offensichtliche L?sung zur Beseitigung dieses
Flaschenhalses sind „mehr Spindeln“. Statt einer einzigen gro?en Platte
werden mehrere kleinere Platten mit demselben Gesamtspeicherplatz
benutzt. Jede Platte ist in der Lage, unabh?ngig zu positionieren und zu
transferieren, weshalb der effektive Durchsatz um einen Faktor nahe der
Zahl der eingesetzten Platten steigt.

Obwohl die Platten Daten parallel transferieren k?nnen, ist es nicht
m?glich, Anfragen gleichm??ig auf die einzelnen Platten zu verteilen.
Daher wird die Last auf bestimmten Laufwerken immer h?her sein als auf
anderen Laufwerken. Daraus ergibt sich auch, dass die exakte
Verbesserung des Datendurchsatzes immer kleiner ist als die Anzahl der
involvierten Platten.

Die gleichm??ige Verteilung der Last auf die einzelnen Platten ist stark
abh?ngig von der Art, wie die Daten auf die Laufwerke aufgeteilt werden.
In den folgenden Ausf?hrungen wird eine Platte als eine gro?e Anzahl von
Datensektoren dargestellt, die durch Zahlen adressierbar sind (?hnlich
den Seiten eines Buches). Die naheliegendste Methode ist es, die
virtuelle Platte (wieder analog den Seiten eines Buches) in Gruppen
aufeinanderfolgender Sektoren zu unterteilen, die jeweils der Gr??e der
einzelnen physischen Platten entsprechen. Diese Vorgehensweise wird als
*Konkatenation* bezeichnet und hat den Vorteil, dass die Platten keine
spezielle Gr??enbeziehung haben m?ssen. Sie funktioniert gut, solange
der Zugriff gleichm??ig auf den Adressraum der virtuellen Platte
verteilt wird. Wenn sich der Zugriff allerdings auf einen kleinen
Bereich konzentriert, ist die Verbesserung vernachl?ssigbar klein.
`Abbildung?23.1, „Konkatenierte
Anordnung“ <vinum-access-bottlenecks.html#vinum-concat>`__ verdeutlicht
die Verteilung der Speichereinheiten in einer konkatenierten Anordnung.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 23.1. Konkatenierte Anordnung

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Konkatenierte Anordnung|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

Ein alternatives Mapping unterteilt den Adressraum in kleinere, gleich
gro?e Komponenten und speichert diese sequentiell auf verschiedenen
Ger?ten. Zum Beispiel werden die ersten 256 Sektoren auf der ersten
Platte, die n?chsten 256 Sektoren auf der zweiten Platte gespeichert und
so weiter. Nachdem die letzte Platte beschrieben wurde, wird dieser
Vorgang solange wiederholt, bis die Platten voll sind. Dieses Mapping
nennt man *Striping* oder RAID-0. `:sup:`[13]` <#ftn.idp84096464>`__

Striping erfordert einen etwas gr??eren Aufwand, um die Daten zu
lokalisieren, und kann zus?tzliche E/A-Last verursachen, wenn eine
?bertragung ?ber mehrere Platten verteilt ist. Auf der anderen Seite
erlaubt es aber eine gleichm??igere Verteilung der Last auf die
einzelnen Platten. `Abbildung?23.2,
„Striped-Anordnung“ <vinum-access-bottlenecks.html#vinum-striped>`__
veranschaulicht die Abfolge, in der Speichereinheiten in einer
striped-Anordnung alloziert werden.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 23.2. Striped-Anordnung

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Striped-Anordnung|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp84096464" class="footnote">

`:sup:`[13]` <#idp84096464>`__\ RAID steht f?r *Redundant Array of
Inexpensive Disks* und bietet verschiedene Formen der Fehlertorleranz,
obwohl der letzte Begriff etwas irref?hrend ist, da RAID keine Redundanz
bietet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+------------------------------------+---------------------------------------------+
| `Zur?ck <vinum-intro.html>`__?       | `Nach oben <vinum-vinum.html>`__   | ?\ `Weiter <vinum-data-integrity.html>`__   |
+--------------------------------------+------------------------------------+---------------------------------------------+
| 23.2. Ihre Platten sind zu klein.?   | `Zum Anfang <index.html>`__        | ?23.4. Datenintegrit?t                      |
+--------------------------------------+------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Konkatenierte Anordnung| image:: vinum/vinum-concat.png
.. |Striped-Anordnung| image:: vinum/vinum-striped.png
