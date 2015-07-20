=================================
12.2. Vorbereitende Konfiguration
=================================

.. raw:: html

   <div class="navheader">

12.2. Vorbereitende Konfiguration
`Zur?ck <config-tuning.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-core-configuration.html>`__

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

12.2. Vorbereitende Konfiguration
---------------------------------

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

12.2.1. Layout von Partitionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.2.1.1. Partitionen
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie Dateisysteme mit
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
oder
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
anlegen, sollten Sie beachten, dass Festplatten auf Daten in den ?u?eren
Spuren schneller zugreifen k?nnen als auf Daten in den inneren Spuren.
Daher sollten die kleineren oft benutzten Dateisysteme, wie das
Root-Dateisystem oder die Swap-Partition, an den ?u?eren Rand der Platte
gelegt werden. Die gr??eren Partitionen wie ``/usr`` sollten in die
inneren Bereiche gelegt werden. Es empfiehlt sich, die Partitionen in
einer ?hnlichen Reihenfolge wie Root-Partition, Swap, ``/var`` und
``/usr`` anzulegen.

Die Gr??e der ``/var``-Partition ist abh?ngig vom Zweck der Maschine.
Das ``/var``-Dateisystem enth?lt haupts?chlich Postf?cher, den
Spoolbereich zum Drucken und Logdateien. Abh?ngig von der Anzahl der
Systembenutzer und der Aufbewahrungszeit f?r Logdateien, k?nnen gerade
die Postf?cher und Logdateien zu ungeahnten Gr??en wachsen. Die meisten
Benutzer werden selten mehr als etwa ein Gigabyte in ``/var`` ben?tigen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ein paar Mal wird es vorkommen, dass viel Festplattenspeicher in
``/var/tmp`` gebraucht wird. Wenn neue Software mit
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
installiert wird, extrahieren die Paketwerkzeuge eine vor?bergehende
Kopie der Pakete unter ``/var/tmp``. Die Installation grosser
Softwarepakete wie Firefox, Openoffice oder LibreOffice kann sich wegen
zu wenig Speicherplatz in ``/var/tmp`` als trickreich herausstellen.

.. raw:: html

   </div>

Die ``/usr``-Partition enth?lt viele der Hauptbestandteile des Systems,
dazu geh?hren die
`ports(7) <http://www.FreeBSD.org/cgi/man.cgi?query=ports&sektion=7>`__-Sammlung
(empfohlen) und die Quellen (optional). Sowohl die Ports als auch die
Quellen des Basissystems sind zum Zeitpunkt der Installation optional,
trotzdem sollten Sie mindestens zwei?Gigabyte f?r diese Partition
vorsehen.

Wenn Sie die Gr??e der Partitionen festlegen, beachten Sie bitte das
Wachstum Ihres Systems. Wenn Sie den Platz auf einer Partition
vollst?ndig aufgebraucht haben, eine andere Partition aber kaum
benutzen, kann die Handhabung des Systems schwierig werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die automatische Partitionierung von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
mit ``Auto-defaults`` legt manchmal zu kleine ``/`` und
``/var``-Partition an. Partitionieren Sie weise und gro?z?gig.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.2.1.2. Swap Partition
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als Daumenregel sollten Sie doppelt soviel Speicher f?r die
Swap-Partition vorsehen, als Sie Hauptspeicher haben. Verf?gt die
Maschine beispielsweise ?ber 128?Megabyte Hauptspeicher, sollten Sie
256?Megabyte f?r den Swap-Bereich vorsehen. Systeme mit weniger Speicher
werden wahrscheinlich mit viel mehr Swap mehr leisten. Es wird nicht
empfohlen, weniger als 256?Megabyte Swap einzurichten. Au?erdem sollten
Sie k?nftige Speichererweiterungen beachten, wenn Sie die Swap-Partition
einrichten. Die VM-Paging-Algorithmen im Kernel sind so eingestellt,
dass Sie am besten laufen, wenn die Swap-Partition mindestens doppelt so
gro? wie der Hauptspeicher ist. Zu wenig Swap kann zu einer
Leistungsverminderung im *VM page scanning* Code f?hren, sowie Probleme
verursachen, wenn Sie sp?ter mehr Speicher in Ihre Maschine bauen.

Auf gr??eren Systemen mit mehreren SCSI-Laufwerken (oder mehreren
IDE-Laufwerken an unterschiedlichen Controllern) empfehlen wir Ihnen,
Swap-Bereiche auf bis zu vier Laufwerken einzurichten. Diese
Swap-Partitionen sollten ungef?hr dieselbe Gr??e haben. Der Kernel kann
zwar mit beliebigen Gr??en umgehen, aber die internen Datenstrukturen
skalieren bis zur vierfachen Gr??e der gr??ten Partition. Ungef?hr
gleich gro?e Swap-Partitionen erlauben es dem Kernel, den Swap-Bereich
optimal ?ber die Laufwerke zu verteilen. Gro?e Swap-Bereiche, auch wenn
sie nicht oft gebraucht werden, sind n?tzlich, da sich ein
speicherfressendes Programm unter Umst?nden auch ohne einen Neustart des
Systems beenden l?sst.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.2.1.3. Warum partitionieren?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Gegen eine einzelne Partition sprechen mehrere Gr?nde. Jede Partition
hat im Betrieb unterschiedliche Eigenschaften und die Trennung der
Partitionen erlaubt es, die Dateisysteme an diese Eigenschaften
anzupassen. Die Root- und ``/usr``-Partitionen weisen meist nur lesende
Zugriffe auf, w?hrend ``/var`` und ``/var/tmp`` haupts?chlich
beschrieben werden.

Indem Sie ein System richtig partitionieren, verhindern Sie, dass eine
Fragmentierung in den h?ufig beschriebenen Partitionen auf die meist nur
gelesenen Partitionen ?bergreift. Wenn Sie die h?ufig beschriebenen
Partitionen an den Rand der Platte, legen, dann wird die I/O-Leistung
diesen Partitionen steigen. Die I/O-Leistung ist nat?rlich auch f?r
gro?e Partitionen wichtig, doch erzielen Sie eine gr??ere
Leistungssteigerung, wenn Sie ``/var`` an den Rand der Platte legen.
Schlie?lich sollten Sie noch die Stabilit?t des Systems beachten. Eine
kleine Root-Partition, auf die meist nur lesend zugegriffen wird,
?berlebt einen schlimmen Absturz wahrscheinlich eher als eine gro?e
Partition.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+--------------------------------------+--------------------------------------------------------+
| `Zur?ck <config-tuning.html>`__?        | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-core-configuration.html>`__   |
+-----------------------------------------+--------------------------------------+--------------------------------------------------------+
| Kapitel 12. Konfiguration und Tuning?   | `Zum Anfang <index.html>`__          | ?12.3. Basiskonfiguration                              |
+-----------------------------------------+--------------------------------------+--------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
