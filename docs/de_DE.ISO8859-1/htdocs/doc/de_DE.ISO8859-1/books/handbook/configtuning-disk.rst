============================
12.13. Tuning von Laufwerken
============================

.. raw:: html

   <div class="navheader">

12.13. Tuning von Laufwerken
`Zur?ck <configtuning-sysctl.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-kernel-limits.html>`__

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

12.13. Tuning von Laufwerken
----------------------------

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

12.13.1. Sysctl Variablen
~~~~~~~~~~~~~~~~~~~~~~~~~

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

12.13.1.1. ``vfs.vmiodirenable``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Variable ``vfs.vmiodirenable`` besitzt in der Voreinstellung den
Wert 1. Die Variable kann auf den Wert 0 (ausgeschaltet) oder 1
(angeschaltet) gesetzt werden. Sie steuert, wie Verzeichnisse vom System
zwischengespeichert werden. Die meisten Verzeichnisse sind klein und
benutzen nur ein einzelnes Fragment, typischerweise 1?kB, im
Dateisystem. Im Buffer-Cache verbrauchen sie mit 512?Bytes noch weniger
Platz. Ist die Variable ausgeschaltet (auf 0) wird der Buffer-Cache nur
eine limitierte Anzahl Verzeichnisse zwischenspeichern, auch wenn das
System ?ber sehr viel Speicher verf?gt. Ist die Variable aktiviert (auf
1), kann der Buffer-Cache den VM-Page-Cache benutzen, um Verzeichnisse
zwischenzuspeichern. Der ganze Speicher steht damit zum
Zwischenspeichern von Verzeichnissen zur Verf?gung. Der Nachteil bei
dieser Vorgehensweise ist, dass zum Zwischenspeichern eines
Verzeichnisses mindestens eine physikalische Seite im Speicher, die
normalerweise 4?kB gro? ist, anstelle von 512?Bytes gebraucht wird. Wir
empfehlen, diese Option aktiviert zu lassen, wenn Sie Dienste zur
Verf?gung stellen, die viele Dateien manipulieren. Beispiele f?r solche
Dienste sind Web-Caches, gro?e Mail-Systeme oder Netnews. Die aktivierte
Variable vermindert, trotz des verschwendeten Speichers, in aller Regel
nicht die Leistung des Systems, obwohl Sie das nachpr?fen sollten.

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

12.13.1.2. ``vfs.write_behind``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Voreinstellung besitzt die Variable ``vfs.write_behind`` den Wert
``1`` (aktiviert). Mit dieser Einstellung schreibt das Dateisystem
anfallende vollst?ndige Cluster, die besonders beim sequentiellen
Schreiben gro?er Dateien auftreten, direkt auf das Medium aus. Dies
verhindert, dass sich im Buffer-Cache ver?nderte Puffer (*dirty
buffers*) ansammeln, die die I/O-Verarbeitung nicht mehr beschleunigen
w?rden. Unter bestimmten Umst?nden blockiert diese Funktion allerdings
Prozesse. Setzen Sie in diesem Fall die Variable ``vfs.write_behind``
auf den Wert ``0``.

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

12.13.1.3. ``vfs.hirunningspace``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Variable ``vfs.hirunningspace`` bestimmt systemweit die Menge
ausstehender Schreiboperationen, die dem Platten-Controller zu jedem
beliebigen Zeitpunkt ?bergeben werden k?nnen. Normalerweise k?nnen Sie
den Vorgabewert verwenden. Auf Systemen mit vielen Platten kann der Wert
aber auf 4 bis 5?*Megabyte* erh?ht werden. Beachten Sie, dass ein zu
hoher Wert (gr??er als der Schreib-Schwellwert des Buffer-Caches) zu
Leistungverlusten f?hren kann. Setzen Sie den Wert daher nicht zu hoch!
Hohe Werte k?nnen auch Leseoperationen verz?gern, die gleichzeitig mit
Schreiboperationen ausgef?hrt werden.

Es gibt weitere Variablen, mit denen Sie den Buffer-Cache und den
VM-Page-Cache beeinflussen k?nnen. Wir raten Ihnen allerdings davon ab,
diese Variablen zu ver?ndern, da das VM-System den virtuellen Speicher
selbst sehr gut verwaltet.

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

12.13.1.4. ``vm.swap_idle_enabled``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Variable ``vm.swap_idle_enabled`` ist f?r gro?e Mehrbenutzer-Systeme
gedacht, auf denen sich viele Benutzer an- und abmelden und auf denen es
viele Prozesse im Leerlauf (*idle*) gibt. Solche Systeme fragen
kontinuierlich freien Speicher an. Wenn Sie die Variable
``vm.swap_idle_enabled`` aktivieren, k?nnen Sie die
Auslagerungs-Hysterese von Seiten mit den Variablen
``vm.swap_idle_threshold1`` und ``vm.swap_idle_threshold2`` einstellen.
Die Schwellwerte beider Variablen geben die Zeit in Sekunden an, in
denen sich ein Prozess im Leerlauf befinden muss. Wenn die Werte so
eingestellt sind, dass Seiten fr?her als nach dem normalen Algorithmus
ausgelagert werden, verschafft das dem Auslagerungs-Prozess mehr Luft.
Aktivieren Sie diese Funktion nur, wenn Sie sie wirklich ben?tigen: Die
Speicherseiten werden eher fr?her als sp?ter ausgelagert. Der Platz im
Swap-Bereich wird dadurch schneller verbraucht und die
Plattenaktivit?ten steigen an. Auf kleinen Systemen hat diese Funktion
sp?rbare Auswirkungen. Auf gro?en Systemen, die sowieso schon Seiten
auslagern m?ssen, k?nnen ganze Prozesse leichter in den Speicher geladen
oder ausgelagert werden.

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

12.13.1.5. ``hw.ata.wc``
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD?4.3 wurde versucht, den IDE-Schreib-Zwischenspeicher
abzustellen. Obwohl dies die Bandbreite zum Schreiben auf IDE-Platten
verringerte, wurde es aus Gr?nden der Datenkonsistenz als notwenig
angesehen. Der Kern des Problems ist, dass IDE-Platten keine
zuverl?ssige Aussage ?ber das Ende eines Schreibvorgangs treffen. Wenn
der Schreib-Zwischenspeicher aktiviert ist, werden die Daten nicht in
der Reihenfolge ihres Eintreffens geschrieben. Es kann sogar passieren,
dass das Schreiben mancher Bl?cke im Fall von starker Plattenaktivit?t
auf unbefristete Zeit verz?gert wird. Ein Absturz oder Stromausfall zu
dieser Zeit kann die Dateisysteme erheblich besch?digen. Wir entschieden
uns daher f?r die sichere Variante und stellten den
Schreib-Zwischenspeicher ab. Leider war damit auch ein gro?er
Leistungsverlust verbunden, so dass wir die Variable nach dem Release
wieder aktiviert haben. Sie sollten den Wert der Variable ``hw.ata.wc``
auf Ihrem System ?berpr?fen. Wenn der Schreib-Zwischenspeicher
abgestellt ist, k?nnen Sie ihn aktivieren, indem Sie die Variable auf
den Wert 1 setzen. Dies muss zum Zeitpunkt des Systemstarts im
Boot-Loader geschehen. Eine ?nderung der Variable, nachdem der Kernel
gestartet ist, hat keine Auswirkungen.

Weitere Informationen finden Sie in
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4>`__.

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

12.13.1.6. ``SCSI_DELAY`` (``kern.cam.scsi_delay``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit der Kerneloption ``SCSI_DELAY`` kann die Dauer des Systemstarts
verringert werden. Der Vorgabewert ist recht hoch und er verz?gert den
Systemstart um 15 oder mehr Sekunden. Normalerweise kann dieser Wert,
insbesondere mit modernen Laufwerken, auf 5?Sekunden heruntergesetzt
werden (durch Setzen der ``sysctl``-Variable ``kern.cam.scsi_delay``).
Die Variable sowie die Kerneloption verwenden f?r die Zeitangabe
Millisekunden und *nicht* Sekunden.

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

12.13.2. Soft Updates
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
lassen sich Feineinstellungen an Dateisystemen vornehmen. Das Programm
hat verschiedene Optionen, von denen hier nur Soft Updates betrachtet
werden. Soft Updates werden wie folgt ein- und ausgeschaltet:

.. code:: screen

    # tunefs -n enable /filesystem
    # tunefs -n disable /filesystem

Ein eingeh?ngtes Dateisystem kann nicht mit
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
modifiziert werden. Soft Updates werden am besten im Single-User Modus
aktiviert, bevor Partitionen eingehangen sind.

Durch Einsatz eines Zwischenspeichers wird die Performance im Bereich
der Metadaten, vorwiegend beim Anlegen und L?schen von Dateien,
gesteigert. Wir empfehlen, Soft Updates auf allen Dateisystemen zu
aktivieren. Allerdings sollten Sie sich ?ber die zwei Nachteile von Soft
Updates bewusst sein: Erstens garantieren Soft Updates zwar die
Konsistenz der Daten im Fall eines Absturzes, aber es kann leicht
passieren, dass das Dateisystem ?ber mehrere Sekunden oder gar eine
Minute nicht synchronisiert wurde. Im Fall eines Absturzes verlieren Sie
mit Soft Updates unter Umst?nden mehr Daten als ohne. Zweitens verz?gern
Soft Updates die Freigabe von Datenbl?cken. Eine gr??ere Aktualisierung
eines fast vollen Dateisystems, wie dem Root-Dateisystem, z.B. w?hrend
eines ``make installworld``, kann das Dateisystem vollaufen lassen.
Dadurch w?rde die Aktualisierung fehlschlagen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.13.2.1. Details ?ber Soft Updates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei klassische Herangehensweisen, wie man die Metadaten des
Dateisystems (also Daten ?ber Dateien, wie inode Bereiche oder
Verzeichniseintr?ge) aktualisiert auf die Platte zur?ckschreibt:

Das historisch ?bliche Verfahren waren synchrone Updates der Metadaten,
d. h. wenn eine ?nderung an einem Verzeichnis n?tig war, wurde
anschlie?end gewartet, bis diese ?nderung tats?chlich auf die Platte
zur?ckgeschrieben worden war. Der *Inhalt* der Dateien wurde im „Buffer
Cache“ zwischengespeichert und asynchron irgendwann sp?ter auf die
Platte geschrieben. Der Vorteil dieser Implementierung ist, dass sie
sicher funktioniert. Wenn w?hrend eines Updates ein Ausfall erfolgt,
haben die Metadaten immer einen konsistenten Zustand. Eine Datei ist
entweder komplett angelegt oder gar nicht. Wenn die Datenbl?cke einer
Datei im Fall eines Absturzes noch nicht den Weg aus dem „Buffer Cache“
auf die Platte gefunden haben, kann
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
das Dateisystem reparieren, indem es die Dateil?nge einfach auf 0 setzt.
Au?erdem ist die Implementierung einfach und ?berschaubar. Der Nachteil
ist, dass ?nderungen der Metadaten sehr langsam vor sich gehen. Ein
``rm -r`` beispielsweise fasst alle Dateien eines Verzeichnisses der
Reihe nach an, aber jede dieser ?nderungen am Verzeichnis (L?schen einer
Datei) wird einzeln synchron auf die Platte geschrieben. Gleiches beim
Auspacken gro?er Hierarchien (``tar -x``).

Der zweite Fall sind asynchrone Metadaten-Updates. Das ist z. B. der
Standard bei Linux/ext2fs oder die Variante ``mount -o async`` f?r \*BSD
UFS. Man schickt die Updates der Metadaten einfach auch noch ?ber den
„Buffer Cache“, sie werden also zwischen die Updates der normalen Daten
eingeschoben. Vorteil ist, dass man nun nicht mehr auf jeden Update
warten muss, Operationen, die zahlreiche Metadaten ?ndern, werden also
viel schneller. Auch hier ist die Implementierung sehr einfach und wenig
anf?llig f?r Fehler. Nachteil ist, dass keinerlei Konsistenz des
Dateisystems mehr gesichert ist. Wenn mitten in einer Operation, die
viele Metadaten ?ndert, ein Ausfall erfolgt (Stromausfall, dr?cken des
Reset-Tasters), dann ist das Dateisystem anschlie?end in einem
unbestimmten Zustand. Niemand kann genau sagen, was noch geschrieben
worden ist und was nicht mehr; die Datenbl?cke einer Datei k?nnen schon
auf der Platte stehen, w?hrend die inode Tabelle oder das zugeh?rige
Verzeichnis nicht mehr aktualisiert worden ist. Man kann praktisch kein
``fsck`` mehr implementieren, das diesen Zustand wieder reparieren kann,
da die dazu n?tigen Informationen einfach auf der Platte fehlen. Wenn
ein Dateisystem derart besch?digt worden ist, kann man es nur neu
erzeugen
(`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__)
und die Daten vom Backup zur?ckspielen.

Der historische Ausweg aus diesem Dilemma war ein *dirty region logging*
(auch als *Journalling* bezeichnet, wenngleich dieser Begriff nicht
immer gleich benutzt und manchmal auch f?r andere Formen von
Transaktionsprotokollen gebraucht wird). Man schreibt die
Metadaten-Updates zwar synchron, aber nur in einen kleinen
Plattenbereich, die *logging area*. Von da aus werden sie dann asynchron
auf ihre eigentlichen Bereiche verteilt. Da die *logging area* ein
kleines zusammenh?ngendes St?ckchen ist, haben die Schreibk?pfe der
Platte bei massiven Operationen auf Metadaten keine allzu gro?en Wege
zur?ckzulegen, so dass alles ein ganzes St?ck schneller geht als bei
klassischen synchronen Updates. Die Komplexit?t der Implementierung h?lt
sich ebenfalls in Grenzen, somit auch die Anf?lligkeit f?r Fehler. Als
Nachteil ergibt sich, dass Metadaten zweimal auf die Platte geschrieben
werden m?ssen (einmal in die *logging area*, einmal an die richtige
Stelle), so dass das im Falle regul?rer Arbeit (also keine geh?uften
Metadatenoperationen) eine „Pessimisierung“ des Falls der synchronen
Updates eintritt, es wird alles langsamer. Daf?r hat man als Vorteil,
dass im Falle eines Crashes der konsistente Zustand dadurch erzielbar
ist, dass die angefangenen Operationen aus dem *dirty region log*
entweder zu Ende ausgef?hrt oder komplett verworfen werden, wodurch das
Dateisystem schnell wieder zur Verf?gung steht.

Die L?sung von Kirk McKusick, dem Sch?pfer von Berkeley FFS, waren *Soft
Updates*: die notwendigen Updates der Metadaten werden im Speicher
gehalten und dann sortiert auf die Platte geschrieben („ordered metadata
updates“). Dadurch hat man den Effekt, dass im Falle massiver
Metadaten-?nderungen sp?tere Operationen die vorhergehenden, noch nicht
auf die Platte geschriebenen Updates desselben Elements im Speicher
„einholen“. Alle Operationen, auf ein Verzeichnis beispielsweise, werden
also in der Regel noch im Speicher abgewickelt, bevor der Update
?berhaupt auf die Platte geschrieben wird (die dazugeh?rigen Datenbl?cke
werden nat?rlich auch so sortiert, dass sie nicht vor ihren Metadaten
auf der Platte sind). Im Fall eines Absturzes hat man ein implizites
„log rewind“: alle Operationen, die noch nicht den Weg auf die Platte
gefunden haben, sehen danach so aus, als h?tten sie nie stattgefunden.
Man hat so also den konsistenten Zustand von ca. 30 bis 60?Sekunden
fr?her sichergestellt. Der verwendete Algorithmus garantiert dabei, dass
alle tats?chlich benutzten Ressourcen auch in den entsprechenden Bitmaps
(Block- und inode Tabellen) als belegt markiert sind. Der einzige
Fehler, der auftreten kann, ist, dass Ressourcen noch als „belegt“
markiert sind, die tats?chlich „frei“ sind.
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
erkennt dies und korrigiert diese nicht mehr belegten Ressourcen. Die
Notwendigkeit eines Dateisystem-Checks darf aus diesem Grunde auch
ignoriert und das Dateisystem mittels ``mount -f`` zwangsweise
eingebunden werden. Um noch allozierte Ressourcen freizugeben muss
sp?ter ein
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
nachgeholt werden. Das ist dann auch die Idee des *background fsck*:
beim Starten des Systems wird lediglich ein *Schnappschuss* des
Filesystems gemacht, mit dem
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
dann sp?ter arbeiten kann. Alle Dateisysteme d?rfen „unsauber“
eingebunden werden und das System kann sofort in den Multiuser-Modus
gehen. Danach wird ein Hintergrund-\ ``fsck`` f?r die Dateisysteme
gestartet, die dies ben?tigen, um m?glicherweise irrt?mlich belegte
Ressourcen freizugeben. (Dateisysteme ohne *Soft Updates* ben?tigen
nat?rlich immer noch den ?blichen (Vordergrund-)``fsck``, bevor sie
eingebunden werden k?nnen.)

Der Vorteil ist, dass die Metadaten-Operationen beinahe so schnell
ablaufen wie im asynchronen Fall (also durchaus auch schneller als beim
„logging“, das ja die Metadaten immer zweimal schreiben muss). Als
Nachteil stehen dem die Komplexit?t des Codes (mit einer erh?hten
Fehlerwahrscheinlichkeit in einem bez?glich Datenverlust hoch sensiblen
Bereich) und ein erh?hter Speicherverbrauch entgegen. Au?erdem muss man
sich an einige Eigenheiten gew?hnen: Nach einem Absturz ist ein etwas
?lterer Stand auf der Platte – statt einer leeren, aber bereits
angelegten Datei (wie nach einem herk?mmlichen ``fsck`` Lauf) ist auf
einem Dateisystem mit *Soft Updates* keine Spur der entsprechenden Datei
mehr zu sehen, da weder die Metadaten noch der Dateiinhalt je auf die
Platte geschrieben wurden. Weiterhin kann der Platz nach einem ``rm -r``
nicht sofort wieder als verf?gbar markiert werden, sondern erst dann,
wenn der Update auch auf die Platte vermittelt worden ist. Dies kann
besonders dann Probleme bereiten, wenn gro?e Datenmengen in einem
Dateisystem ersetzt werden, das nicht gen?gend Platz hat, um alle
Dateien zweimal unterzubringen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+--------------------------------------+---------------------------------------------------+
| `Zur?ck <configtuning-sysctl.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-kernel-limits.html>`__   |
+------------------------------------------+--------------------------------------+---------------------------------------------------+
| 12.12. Einstellungen mit sysctl(8)?      | `Zum Anfang <index.html>`__          | ?12.14. Einstellungen von Kernel Limits           |
+------------------------------------------+--------------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
