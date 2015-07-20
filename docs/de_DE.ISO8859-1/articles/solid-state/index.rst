==============================
FreeBSD und Solid State-Ger?te
==============================

.. raw:: html

   <div class="navheader">

FreeBSD und Solid State-Ger?te
?
?
?\ `Weiter <kernel.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

John Kozubik
~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<john@kozubik.com>``

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

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2001, 2009 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Dieser Artikel behandelt die Verwendung von Solid State Festplatten in
FreeBSD, um eingebettete Systeme zu erstellen.

Eingebettete Systeme haben den Vorteil, dass sie eine h?here Stabilit?t
aufgrund des fehlens von beweglichen Bauteilen (Festplatten) besitzen.
Es muss jedoch beachtet werden, dass generell weniger Speicherplatz zur
Verf?gung steht und die Lebensdauer des Speichermediums geringer ist.

Spezielle Themen die behandelt werden beinhalten die Typen und Attribute
von Solid State Datentr?gern, die in FreeBSD verwendet werden,
Kernel-Optionen die in solch einer Umgebung von Interesse sind, der
``rc.initdiskless``-Mechanismus, welcher die Initalisierung solcher
Systeme automatisiert, sowie die Notwendigkeit von
Nur-Lese-Dateisystemen und das Erstellen von Dateisystemen von Grund
auf. Der Artikel schliesst mit ein paar generellen Strategien f?r kleine
und Nur-Lese-FreeBSD Umgebungen.

*?bersetzt von Benedict Reuschling*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ einzelne Abschnitte / `komplettes Dokument <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. Solid State Festplattenger?te <index.html#intro>`__
`2. Kerneloptionen <kernel.html>`__
`3. Die ``rc``-Subsysteme und nur-Lese Dateisysteme <ro-fs.html>`__
`4. Ein Dateisystem von Grund auf neu erstellen <ar01s04.html>`__
`5. Systemstrategien f?r kleine und
Nur-Lese-Umgebungen <strategies.html>`__

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

1. Solid State Festplattenger?te
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Umfang des Artikels ist auf Solid State Ger?te beschr?nkt, die auf
Flash-Speicher basieren. Flash-Speicher ist ein Solid State Speicher
(keine beweglichen Teile), der nicht fl?chtig ist (der Speicher beh?lt
die Daten sogar nachdem alle Energiequellen ausgeschaltet wurden).
Flash-Speicher kann grossen physischen Schock aushalten und ist
vergleichsweise schnell (die Flash-Speicher L?sungen, die in diesem
Artikel behandelt werden, sind nur wenig langsamer als eine
EIDE-Festplatte in der Schreibgeschwindigkeit und viel schneller bei
Lese-Operationen). Ein sehr wichtiger Aspekt von Flash-Speichern, dessen
Auswirkungen sp?ter in diesem Artikel diskutiert werden, ist, dass jeder
Sektor eine begrenzte Kapazit?t zur Wiederbeschreibung besitzt. Man kann
nur eine bestimmte Anzahl von Schreib-, L?sch- und
Wiederbeschreibungsvorg?ngen durchf?hren, bevor der Sektor permanent
unbrauchbar wird. Obwohl viele Flash-Speicher Produkte automatisch
schlechte Bl?cke markieren und manche Ger?te Schreiboperationen
gleichm?ssig verteilen, bleibt weiterhin die Anzahl der durchf?hrbaren
Schreibvorg?nge begrenzt. Verschiedene Ger?teeinheiten besitzen zwischen
1,000,000 und 10,000,000 Schreibzyklen pro Sektor in ihren
Spezifikationen. Diese Zahlen variieren aufgrund der
Umgebungstemperatur.

Im Speziellen werden wir ATA-kompatible Compact-Flash-Karten betrachten,
welche als Speichermedien f?r Digitalkameras ziemlich popul?r sind. Von
besonderem Interesse ist der Umstand, dass diese direkt an den IDE-Bus
angeschlossen werden und kompatibel zu den ATA-Befehlen sind. Aus diesem
Grund k?nnen diese Ger?te mit einem einfachen und billigen Adapter
direkt an den IDE-Bus eines Computers angeschlossen werden. Auf diese
Weise sehen Betriebssysteme wie FreeBSD diese Ger?te dann als normale
(wenn auch sehr kleine) Festplatten an.

Andere Solid State Plattenl?sungen existieren, jedoch platzieren deren
Kosten, Obskurit?t und ihre Unhandlichkeit sie aussserhalb des Umfangs
dieses Artikels.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------+
| ?   | ?   | ?\ `Weiter <kernel.html>`__   |
+-----+-----+-------------------------------+
| ?   | ?   | ?2. Kerneloptionen            |
+-----+-----+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
