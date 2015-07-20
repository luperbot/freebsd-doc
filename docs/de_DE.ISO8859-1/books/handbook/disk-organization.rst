========================================
4.5. Festplatten, Slices und Partitionen
========================================

.. raw:: html

   <div class="navheader">

4.5. Festplatten, Slices und Partitionen
`Zur?ck <dirstructure.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <mount-unmount.html>`__

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

4.5. Festplatten, Slices und Partitionen
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD identifiziert Dateien anhand eines Dateinamens. In Dateinamen
wird zwischen Gro?- und Kleinschreibung unterschieden: ``readme.txt``
und ``README.TXT`` bezeichnen daher zwei verschiedene Dateien. FreeBSD
benutzt keine Dateiendungen wie ``.txt``, um den Typ der Datei (ein
Programm, ein Dokument oder andere Daten) zu bestimmen.

Dateien werden in Verzeichnissen gespeichert. In einem Verzeichnis
k?nnen sich keine oder hunderte Dateien befinden. Ein Verzeichnis kann
auch andere Verzeichnisse enthalten und so eine Hierarchie von
Verzeichnissen aufbauen, die Ihnen die Ablage von Daten erleichtert.

In Dateinamen werden Verzeichnisse durch einen Schr?gstrich (``/``,
*Slash*) getrennt. Wenn das Verzeichnis ``foo`` ein Verzeichnis ``bar``
enth?lt, in dem sich die Datei ``readme.txt`` befindet, lautet der
vollst?ndige Name der Datei (oder der *Pfad* zur Datei)
``foo/bar/readme.txt``.

Verzeichnisse und Dateien werden in einem Dateisystem gespeichert. Jedes
Dateisystem besitzt ein *Wurzelverzeichnis* (*Root-Directory*), das
weitere Verzeichnisse enthalten kann.

Dieses Konzept kennen Sie vielleicht von anderen Betriebssystemen, aber
es gibt einige Unterschiede: In MS-DOS? werden Datei- und
Verzeichnisnamen mit dem Zeichen ``\`` getrennt, Mac?OS? benutzt dazu
das Zeichen ``:``.

FreeBSD kennt keine Laufwerksbuchstaben und in Pfaden werden keine
Bezeichnungen f?r Laufwerke benutzt. Die Pfadangabe
``c:/foo/bar/readme.txt`` gibt es in FreeBSD nicht.

Stattdessen wird ein Dateisystem als Wurzeldateisystem (*root file
system*) ausgew?hlt. Das Wurzelverzeichnis dieses Dateisystems wird
``/`` genannt. Jedes andere Dateisystem wird unter dem Wurzeldateisystem
*eingehangen* (*mount*). Daher scheint jedes Verzeichnis, unabh?ngig von
der Anzahl der Platten, auf derselben Platte zu liegen.

Betrachten wir drei Dateisysteme ``A``, ``B`` und ``C``. Jedes
Dateisystem besitzt ein eigenes Wurzelverzeichnis, das zwei andere
Verzeichnisse enth?lt: ``A1``, ``A2``, ``B1``, ``B2``, ``C1`` und
``C2``.

Das Wurzeldateisystem soll ``A`` sein. Das Kommando ``ls`` zeigt darin
die beiden Verzeichnisse ``A1`` und ``A2`` an. Der Verzeichnisbaum sieht
wie folgt aus:

.. raw:: html

   <div class="mediaobject">

|image0|

.. raw:: html

   </div>

Ein Dateisystem wird in einem Verzeichnis eines anderen Dateisystems
eingehangen. Wir h?ngen nun das Dateisystem ``B`` in das Verzeichnis
``A1`` ein. Das Wurzelverzeichnis von ``B`` ersetzt nun das Verzeichnis
``A1`` und die Verzeichnisse des Dateisystems ``B`` werden sichtbar:

.. raw:: html

   <div class="mediaobject">

|image1|

.. raw:: html

   </div>

Jede Datei in den Verzeichnissen ``B1`` oder ``B2`` kann ?ber den Pfad
``/A1/B1`` oder ``/A1/B2`` erreicht werden. Dateien aus dem Verzeichnis
``/A1`` sind jetzt verborgen. Wenn das Dateisystem ``B`` wieder
*abgehangen* wird (*umount*), erscheinen die verborgenen Dateien wieder.

Wenn das Dateisystem ``B`` unter dem Verzeichnis ``A2`` eingehangen
w?rde, s?he der Verzeichnisbaum so aus:

.. raw:: html

   <div class="mediaobject">

|image2|

.. raw:: html

   </div>

Die Dateien des Dateisystems ``B`` w?ren unter den Pfaden ``/A2/B1`` und
``/A2/B2`` erreichbar.

Dateisysteme k?nnen ?bereinander eingehangen werden. Der folgende Baum
entsteht, wenn im letzten Beispiel das Dateisystem ``C`` in das
Verzeichnis ``B1`` des Dateisystems ``B`` eingehangen wird:

.. raw:: html

   <div class="mediaobject">

|image3|

.. raw:: html

   </div>

``C`` k?nnte auch im Verzeichnis ``A1`` eingehangen werden:

.. raw:: html

   <div class="mediaobject">

|image4|

.. raw:: html

   </div>

Der MS-DOS?-Befehl ``join`` kann ?hnliches bewirken.

Normalerweise m?ssen Sie sich nicht mit Dateisystemen besch?ftigen.
W?hrend der Installation werden die Dateisysteme und die Stellen, in der
sie eingehangen werden, festgelegt. Dateisysteme m?ssen Sie erst wieder
anlegen, wenn Sie eine neue Platte hinzuf?gen.

Sie k?nnen sogar mit nur einem gro?en Dateisystem auskommen. Dies hat
mehrere Nachteile und einen Vorteil.

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Vorteile mehrerer Dateisysteme

.. raw:: html

   </div>

-  Die Dateisysteme k?nnen mit unterschiedlichen Optionen (*mount
   options*) eingehangen werden. Bei sorgf?ltiger Planung k?nnen Sie
   beispielsweise das Wurzeldateisystem nur lesbar einh?ngen. Damit
   sch?tzen Sie sich vor dem unabsichtlichen L?schen oder Editieren
   kritischer Dateien. Von Benutzern beschreibbare Dateisysteme wie
   ``/home`` k?nnen Sie mit der Option *nosuid* einh?ngen, wenn sie von
   anderen Dateisystemen getrennt sind. Die *SUID*- und *GUID*-Bits
   verlieren auf solchen Dateisystemen ihre Wirkung und die Sicherheit
   des Systems kann dadurch erh?ht werden.

-  Die Lage von Dateien im Dateisystem wird, abh?ngig vom Gebrauch des
   Dateisystems, automatisch von FreeBSD optimiert. Ein Dateisystem mit
   vielen kleinen Dateien, die h?ufig geschrieben werden, wird anders
   behandelt als ein Dateisystem mit wenigen gro?en Dateien. Mit nur
   einem Dateisystem ist diese Optimierung unm?glich.

-  In der Regel ?bersteht ein FreeBSD-Dateisystem auch einen
   Stromausfall. Allerdings kann ein Stromausfall zu einem kritischen
   Zeitpunkt das Dateisystem besch?digen. Wenn die Daten ?ber mehrere
   Dateisysteme verteilt sind, l?sst sich das System mit hoher
   Wahrscheinlichkeit noch starten. Dies erleichtert das Zur?ckspielen
   von Datensicherungen.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Vorteil eines einzelnen Dateisystems

.. raw:: html

   </div>

-  Die Gr??e von Dateisystemen liegt fest. Es kann passieren, dass Sie
   eine Partition vergr??ern m?ssen. Dies ist nicht leicht: Sie m?ssen
   die Daten sichern, das Dateisystem vergr??ert anlegen und die
   gesicherten Daten zur?ckspielen.

   .. raw:: html

      <div class="important" xmlns="">

   Wichtig:
   ~~~~~~~~

   FreeBSD kennt den Befehl
   `growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8>`__,
   mit dem man Dateisysteme im laufenden Betrieb vergr??ern kann.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Dateisysteme befinden sich in Partitionen (damit sind nicht die normalen
MS-DOS?-Partitionen gemeint). Jede Partition wird mit einem Buchstaben
von ``a`` bis ``h`` bezeichnet und kann nur ein Dateisystem enthalten.
Dateisysteme k?nnen daher ?ber ihren Mount-Point, den Punkt an dem sie
eingehangen sind, oder den Buchstaben der Partition, in der sie liegen,
identifiziert werden.

FreeBSD benutzt einen Teil der Platte f?r den *Swap-Bereich*, der dem
Rechner *virtuellen Speicher* zur Verf?gung stellt. Dadurch kann der
Rechner Anwendungen mehr Speicher zur Verf?gung stellen als tats?chlich
eingebaut ist. Wenn der Speicher knapp wird, kann FreeBSD nicht benutzte
Daten in den Swap-Bereich auslagern. Die ausgelagerten Daten k?nnen
sp?ter wieder in den Speicher geholt werden (daf?r werden dann andere
Daten ausgelagert).

F?r einige Partitionen gelten besondere Konventionen:

.. raw:: html

   <div class="informaltable">

+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Partition   | Konvention                                                                                                                                                                                                                                                        |
+=============+===================================================================================================================================================================================================================================================================+
| ``a``       | Enth?lt normalerweise das Wurzeldateisystem                                                                                                                                                                                                                       |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``b``       | Enth?lt normalerweise den Swap-Bereich                                                                                                                                                                                                                            |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``c``       | Ist normalerweise genauso gro? wie die Slice in der die Partition liegt. Werkzeuge, die auf der kompletten Slice arbeiten, wie ein Bad-Block-Scanner, k?nnen so die ``c``-Partition benutzen. F?r gew?hnlich legen Sie in dieser Partition kein Dateisystem an.   |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``d``       | Fr?her hatte die ``d``-Partition eine besondere Bedeutung. Heute ist dies nicht mehr der Fall und die Partition ``d`` kann wie jede andere Partition auch verwendet werden.                                                                                       |
+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Jede Partition, die ein Dateisystem enth?lt, wird in einer *Slice*
angelegt. Slice ist der Begriff, den FreeBSD f?r MS-DOS?-Partitionen
verwendet. Slices werden von eins bis vier durchnummeriert.

Die Slice-Nummern werden mit vorgestelltem ``s`` hinter den Ger?tenamen
gestellt: „da0*s1*“ ist die erste Slice auf dem ersten SCSI-Laufwerk.
Auf einer Festplatte gibt es h?chstens vier Slices. In einer Slice des
passenden Typs kann es weitere logische Slices geben. Diese erweiterten
Slices werden ab f?nf durchnummeriert: „ad0*s5*“ ist die erste
erweiterte Slice auf einer IDE-Platte. Diese Ger?te werden von
Dateisystemen benutzt, die sich in einer kompletten Slice befinden
m?ssen.

Slices, „dangerously dedicated“-Festplatten und andere Platten enthalten
Partitionen, die mit Buchstaben von ``a`` bis ``h`` bezeichnet werden.
Der Buchstabe wird an den Ger?tenamen gehangen: „da0*a*“ ist die
``a``-Partition des ersten ``da``-Laufwerks. Dieses Laufwerk ist
„dangerously dedicated“. „ad1s3*e*“ ist die f?nfte Partition in der
dritten Slice der zweiten IDE-Platte.

Schlie?lich wird noch jede Festplatte des Systems eindeutig bezeichnet.
Der Name einer Festplatte beginnt mit einem Code, der den Typ der Platte
bezeichnet. Es folgt eine Nummer, die angibt, um welche Festplatte es
sich handelt. Anders als bei Slices werden Festplatten von Null
beginnend durchnummeriert. G?ngige Festplatten-Namen sind in
`Tabelle?4.1,
„Laufwerk-Codes“ <disk-organization.html#basics-dev-codes>`__
zusammengestellt.

Wenn Sie eine Partition angeben, erwartet FreeBSD, dass Sie auch die
Slice und die Platte angeben, in denen sich die Partition befindet. Wenn
Sie eine Slice angeben, m?ssen Sie auch die Platte der Slice angeben.
Setzen Sie den Namen aus dem Plattennamen gefolgt von einem ``s``, der
Slice-Nummer und dem Buchstaben der Partition zusammen. Einige Beispiele
finden Sie in `Beispiel?4.1, „Namen von Platten, Slices und
Partitionen“ <disk-organization.html#basics-disk-slice-part>`__.

Der Aufbau einer Festplatte wird in `Beispiel?4.2, „Aufteilung einer
Festplatte“ <disk-organization.html#basics-concept-disk-model>`__
dargestellt.

Um FreeBSD zu installieren, m?ssen Sie zuerst Slices auf den Festplatten
anlegen. Innerhalb der Slices, die Sie f?r FreeBSD verwenden wollen,
m?ssen Sie dann Partitionen anlegen. In den Partitionen wiederum werden
die Dateisysteme (oder der Auslagerungsbereich) angelegt. F?r
Dateisysteme m?ssen Sie schlie?lich noch festlegen, wo diese eingehangen
werden (Mount-Point).

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 4.1. Laufwerk-Codes

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------+--------------------------+
| Code      | Bedeutung                |
+===========+==========================+
| ``ad``    | ATAPI (IDE) Festplatte   |
+-----------+--------------------------+
| ``da``    | SCSI-Festplatte          |
+-----------+--------------------------+
| ``acd``   | ATAPI (IDE) CD-ROM       |
+-----------+--------------------------+
| ``cd``    | SCSI-CD-ROM              |
+-----------+--------------------------+
| ``fd``    | Disketten-Laufwerk       |
+-----------+--------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 4.1. Namen von Platten, Slices und Partitionen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. raw:: html

   <div class="informaltable">

+--------------+------------------------------------------------------------------------------------------------------+
| Name         | Bedeutung                                                                                            |
+==============+======================================================================================================+
| ``ad0s1a``   | Die erste Partition (``a``) in der ersten Slice (``s1``) der ersten IDE-Festplatte (``ad0``).        |
+--------------+------------------------------------------------------------------------------------------------------+
| ``da1s2e``   | Die f?nfte Partition (``e``) der zweiten Slice (``s2``) auf der zweiten SCSI-Festplatte (``da1``).   |
+--------------+------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 4.2. Aufteilung einer Festplatte

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Das folgende Diagramm zeigt die Sicht von FreeBSD auf die erste
IDE-Festplatte eines Rechners. Die Platte soll 4?GB gro? sein und zwei
Slices (MS-DOS?-Partitionen) mit je 2?GB besitzen. Die erste Slice
enth?lt ein MS-DOS?-Laufwerk (``C:``), die zweite Slice wird von FreeBSD
benutzt. Im Beispiel verwendet die FreeBSD-Installationen drei
Datenpartitionen und einen Auslagerungsbereich.

Jede der drei Partitionen enth?lt ein Dateisystem. Das Wurzeldateisystem
ist die ``a``-Partition. In der ``e``-Partition befindet sich der
``/var``-Verzeichnisbaum und in der ``f``-Partition befindet sich der
Verzeichnisbaum unterhalb von ``/usr``.

.. raw:: html

   <div class="mediaobject">

|image5|

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

+-----------------------------------+-------------------------------+-------------------------------------------------+
| `Zur?ck <dirstructure.html>`__?   | `Nach oben <basics.html>`__   | ?\ `Weiter <mount-unmount.html>`__              |
+-----------------------------------+-------------------------------+-------------------------------------------------+
| 4.4. Verzeichnis-Strukturen?      | `Zum Anfang <index.html>`__   | ?4.6. Anh?ngen und Abh?ngen von Dateisystemen   |
+-----------------------------------+-------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |image0| image:: install/example-dir1.png
.. |image1| image:: install/example-dir2.png
.. |image2| image:: install/example-dir3.png
.. |image3| image:: install/example-dir4.png
.. |image4| image:: install/example-dir5.png
.. |image5| image:: install/disk-layout.png
