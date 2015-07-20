===========================================
2.6. Plattenplatz f?r FreeBSD bereitstellen
===========================================

.. raw:: html

   <div class="navheader">

2.6. Plattenplatz f?r FreeBSD bereitstellen
`Zur?ck <using-sysinstall.html>`__?
Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
?\ `Weiter <install-choosing.html>`__

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

2.6. Plattenplatz f?r FreeBSD bereitstellen
-------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ihre erste Aufgabe ist, FreeBSD Plattenplatz bereitzustellen und den
Plattenplatz f?r sysinstall kenntlich zu machen (*label*). Sie m?ssen
daher wissen, wie FreeBSD mit Platten umgeht.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.6.1. Nummerierung der Laufwerke im BIOS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie FreeBSD installieren und konfigurieren, sollten Sie Sie einen
wichtigen Punkt beachten. Dies gilt insbesondere dann, wenn Sie mehrere
Festplatten besitzen.

In einem PC, der unter einem vom BIOS abh?ngigen Betriebssystem, wie
MS-DOS? oder Microsoft??Windows? l?uft, kann das BIOS die normale
Reihenfolge der Laufwerke ver?ndern und das Betriebssystem beachtet
diese ?nderung. Mit dieser Funktion kann der Rechner von einem anderen
Laufwerk als dem so genannten „prim?ren Laufwerk“ gestartet werden. Die
Funktion ist sehr zweckm??ig f?r Benutzer, die Datensicherungen auf
einer zweiten Platte erstellen und daf?r Werkzeuge wie Ghost oder xcopy
einsetzen. Wenn die erste Platte ausf?llt, von einem Virus befallen wird
oder durch einen Fehler des Betriebssystems verunstaltet wird, k?nnen
die Platten im BIOS logisch getauscht werden. Es sieht so aus, als w?ren
die Laufwerke, ohne ?ffnen des Geh?uses getauscht worden.

Teurere Systeme mit SCSI-Controllern haben oft BIOS-Erweiterungen, mit
denen die Reihenfolge von bis zu sieben SCSI-Platten in ?hnlicher Weise
ver?ndert werden kann.

Ein Benutzer, der es gewohnt ist, diese BIOS-Funktionen zu benutzen, mag
?berrascht sein, dass FreeBSD sich nicht wie erwartet verh?lt. FreeBSD
verwendet das BIOS nicht und wei? daher nichts von der logischen
Plattenordnung im BIOS. Dies kann zu sehr verwirrenden Situationen
f?hren, insbesondere wenn die Platten identische Geometrien besitzen und
Kopien voneinander sind.

Vor der Installation von FreeBSD sollte im BIOS die normale Nummerierung
der Laufwerke eingestellt und so belassen werden. Ist es n?tig, die
Reihenfolge der Laufwerke zu ver?ndern, so sollte das immer auf dem
schweren Weg, also durch ?ffnen des Geh?uses und Ver?ndern der Jumper
und Kabel, erfolgen.

.. raw:: html

   <div class="sidebar">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   <div class="-title" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bill macht aus einer ?lteren Wintel Kiste ein neues FreeBSD-System f?r
Fred. Auf einer SCSI-Platte, die er mit der SCSI-ID?0 konfiguriert,
installiert Bill FreeBSD.

Nachdem Fred das System einige Tage benutzt hat, bemerkt er, dass die
?ltere SCSI-Platte viele Fehler meldet und beschwert sich bei Bill.

Nach einigen Tagen entschlie?t sich Bill, die Sache in die Hand zu
nehmen. Er schnappt sich eine identische SCSI-Platte aus dem Lager im
Hinterzimmer und baut diese, nachdem Sie einen Oberfl?chenscan
?berstanden hat, mit der SCSI-ID?4 ein. Anschlie?end kopiert er die
Daten von der Platte mit der SCSI-ID?0 auf die Platte mit der SCSI-ID?4.
Da die neue Platte zufriedenstellend l?uft, stellt Bill im SCSI-BIOS die
Reihenfolge der Platten so um, dass das System von der neuen Platte
startet. Nach einem problemlosen Start von FreeBSD l?uft das System und
Fred ist zufrieden.

Nach einiger Zeit haben Bill und Fred Lust auf ein weiteres Abenteuer –
Sie wollen das System auf eine neue FreeBSD-Version aktualisieren. Bill
ersetzt die angeschlagene Platte mit der SCSI-ID?0 durch eine gleiche
Platte aus dem Lager. Auf der ausgetauschten Platte installiert er
problemlos mithilfe von Freds Startdisketten die neue Version von
FreeBSD.

Fred braucht ein paar Tage, um die neue FreeBSD-Version zu testen und
entscheidet, dass Sie f?r den produktiven Einsatz geeignet ist. Nun
m?ssen die Daten von der alten Platte (mit der SCSI-ID?4) kopiert
werden. Fred h?ngt dazu die alte Platte ein und stellt best?rzt fest,
dass alle Daten verschwunden sind.

Wo sind die Daten hin?

Bill kopierte die Daten von der Platte mit der SCSI-ID?0 auf die Platte
mit der SCSI-ID?4. Als Bill die Startreihenfolge im SCSI-BIOS ?nderte,
f?hrte er sich nur selbst an der Nase herum. FreeBSD lief weiterhin auf
der Platte mit der SCSI-ID?0. Durch die ?nderung der Startreihenfolge
wurde nur ein Teil des Boot- und Loader-Codes von der Platte mit der
SCSI-ID?4 geladen. Die Kernel-Treiber von FreeBSD ignorieren die
BIOS-Einstellungen und benutzen die normale Nummerierung. Das System
lief also weiterhin auf der Platte mit der SCSI-ID?0 und alle Daten von
Fred befanden sich auf dieser Platte. Es schien nur so, als w?rde das
System auf der Platte mit der SCSI-ID?4 laufen.

Wir sind erleichtert zu bemerken, dass keine Daten verloren gingen oder
ver?ndert wurden. Die alte Platte wurde im M?ll wiedergefunden und Freds
Daten konnten wiederhergestellt werden (Bill wei? jetzt, dass er noch
viel zu lernen hat).

Obwohl in diesem Beispiel SCSI-Platten verwendet wurden, gelten die
Konzepte gleicherma?en f?r IDE-Platten.

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

2.6.2. Slices mit Fdisk erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Zu diesem Zeitpunkt werden noch keine ?nderungen auf die Festplatte
ausgeschrieben. Sie k?nnen daher sysinstall jederzeit verlassen, und
erneut beginnen, wenn Sie denken, einen Fehler gemacht zu haben. Sie
k?nnen sysinstall ?ber die Men?s verlassen, die Taste **U** dr?cken oder
die Option Undo w?hlen. Wenn Sie einmal nicht wissen, wie Sie ein Men?
verlassen, k?nnen Sie den Rechner auch einfach ausschalten.

.. raw:: html

   </div>

Nachdem Sie in sysinstall die Standard-Installation ausgew?hlt haben,
werden Sie folgende Meldung sehen:

.. code:: screen

                                     Message
     In the next menu, you will need to set up a DOS-style ("fdisk")
     partitioning scheme for your hard disk. If you simply wish to devote
     all disk space to FreeBSD (overwriting anything else that might be on
     the disk(s) selected) then use the (A)ll command to select the default
     partitioning scheme followed by a (Q)uit. If you wish to allocate only
     free space to FreeBSD, move to a partition marked "unused" and use the
     (C)reate command.
                                    [  OK  ]

                          [ Press enter or space ]

Dr?cken Sie, wie angegeben, **Enter**. Im n?chsten Bildschirm werden
alle Festplatten angezeigt, die der Kernel w?hrend der Ger?teerkennung
gefunden hat. `Abbildung?2.13, „Ein Laufwerk f?r Fdisk
aussuchen“ <install-steps.html#sysinstall-fdisk-drive1>`__ zeigt ein
Beispiel von einem System mit zwei IDE-Platten, die als ``ad0`` und
``ad2`` erkannt wurden.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.13. Ein Laufwerk f?r Fdisk aussuchen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Ein Laufwerk f?r Fdisk aussuchen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie fragen sich vielleicht, warum ``ad1`` nicht angezeigt wird. Wurde
die Platte vielleicht nicht erkannt?

Stellen Sie sich ein System mit zwei IDE-Platten vor. Eine Platte ist
als Master am ersten Controller, die andere als Master am zweiten
Controller angeschlossen. Wenn FreeBSD die Platten in der Reihenfolge,
in der sie gefunden werden, nummerieren w?rde, hie?en die Platten
``ad0`` und ``ad1`` und alles w?rde funktionieren.

Wenn Sie nun am ersten IDE-Controller eine dritte Platte als Slave
anschlie?en w?rden, w?re diese Platte ``ad1``. Die vorher ``ad1``
genannte Platte w?rde nun ``ad2`` hei?en. Dateisysteme werden auf
Ger?ten wie ``ad1s1a`` angelegt. Daher k?nnte es passieren, dass auf
einmal Dateisysteme nicht mehr gefunden werden und Sie FreeBSD
umkonfigurieren m?ssten.

Um diese Probleme zu umgehen, kann der Kernel so eingestellt werden,
dass er Platten nach ihrem Anschlussort anstelle der gefundenen
Reihenfolge benennt. Nach diesem Schema ist die Master-Platte am zweiten
IDE-Controller *immer* ``ad2``, auch wenn es die Ger?te ``ad0`` oder
``ad1`` gar nicht gibt.

Dieses Verhalten ist in FreeBSD voreingestellt und der Grund warum im
Beispiel die Ger?te ``ad0`` und ``ad2`` angezeigt werden. Der Rechner,
von dem die gezeigte Ausgabe stammt, hatte zwei IDE-Platten, die beide
als Master konfiguriert waren, und keine Slave-Platten.

W?hlen Sie die Platte aus, auf die Sie FreeBSD installieren wollen und
dr?cken Sie [?OK?]. Anschlie?end startet Fdisk und zeigt einen
Bildschirm wie den in `Abbildung?2.14, „Typischer Fdisk-Bildschirm vor
dem Editieren“ <install-steps.html#sysinstall-fdisk1>`__.

Der Bildschirm von Fdisk ist in drei Abschnitte unterteilt.

Der erste Abschnitt umfasst die ersten beiden Zeilen der Anzeige. Er
enth?lt Einzelheiten ?ber die aktuell ausgew?hlte Platte, unter anderem
den FreeBSD-Ger?tenamen, die Plattengeometrie und die Kapazit?t der
Platte.

Der zweite Abschnitt zeigt die auf der Platte befindlichen Slices.
Angezeigt wird der Anfang und das Ende der Slice, die Gr??e der Slice,
der FreeBSD-Ger?tename, eine Beschreibung und der Subtyp. Im Beispiel
sehen Sie zwei unbenutzte Slices, die durch die Plattenbelegung auf PCs
entstehen. Weiterhin sehen Sie eine gro?e FAT-Slice, die ziemlich sicher
unter MS-DOS?/Windows? als Laufwerk ``C:`` auftaucht und eine erweiterte
Slice, die unter MS-DOS?/Windows? weitere Laufwerke enthalten kann.

Im dritten Abschnitt sind die Kommandos von Fdisk zusammengefasst.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.14. Typischer Fdisk-Bildschirm vor dem Editieren

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Typischer Fdisk-Bildschirm vor dem Editieren|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die n?chsten Schritte h?ngen von der beabsichtigten Einteilung der
Festplatte ab.

Wenn Sie die gesamte Festplatte f?r FreeBSD verwenden wollen, dr?cken
Sie die Taste **A** (entspricht dem Men?punkt Use Entire Disk). Sp?ter
im Installationsverlauf m?ssen Sie diese Auswahl best?tigen, danach
werden alle bisherigen Daten von der Festplatte gel?scht. Diese Auswahl
l?scht vorher vorhandene Slices und ersetzt sie durch einen kleinen
unbenutzten Bereich (der wieder durch das PC-Design bedingt ist) und
eine gro?e Slice f?r FreeBSD. W?hlen Sie dann die neu erstellte Slice
mit den Pfeiltasten aus und dr?cken Sie die Taste **S**, um die Slice
als startf?hig (bootbar) zu markieren. `Abbildung?2.15, „Eine Partition
?ber die gesamte Platte“ <install-steps.html#sysinstall-fdisk2>`__ zeigt
den Bildschirm zu diesem Zeitpunkt. Beachten Sie das ``A`` in der Spalte
``Flags``. Dies zeigt an, dass die Slice *aktiv* ist und das System von
dieser Slice starten wird.

Um Platz f?r FreeBSD zu schaffen, k?nnen Sie auch bestehende Slices
l?schen. Markieren Sie dazu die Slice mit den Pfeiltasten und dr?cken
Sie die Taste **D**. Danach legen Sie eine neue Slice mit der Taste
**C** an. Sie werden nach der Gr??e der zu erstellenden Slice gefragt;
der Vorgabewert entspricht der gr??ten Slice, die angelegt werden kann
(entspricht entweder dem gr??ten freien Bereich auf der Festplatte oder
der ganzen Festplatte).

Wenn Sie schon Platz f?r FreeBSD geschaffen haben (beispielsweise mit
PartitionMagic?), k?nnen Sie eine neue Slice direkt mit der Taste **C**
anlegen. Sie werden wieder nach der Gr??e der anzulegenden Slice
gefragt.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.15. Eine Partition ?ber die gesamte Platte

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Eine Partition ?ber die gesamte Platte|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dr?cken Sie die Taste **Q**, wenn Sie fertig sind. Sysinstall merkt sich
die ?nderungen, schreibt sie aber noch nicht auf die Festplatte.

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

2.6.3. Einen Boot-Manager installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen nun einen Boot-Manager installieren. Unter folgenden
Umst?nden sollten Sie den FreeBSD-Boot-Manager installieren:

.. raw:: html

   <div class="itemizedlist">

-  Das System besitzt mehr als ein Laufwerk und FreeBSD ist auf einem
   anderen Laufwerk als dem ersten Laufwerk installiert.

-  FreeBSD teilt sich das Laufwerk mit einem anderen Betriebssystem.
   Beim Systemstart wollen Sie ausw?hlen, welches Betriebssystem
   gestartet wird.

.. raw:: html

   </div>

Wird der Rechner ausschlie?lich mit FreeBSD betrieben und FreeBSD ist
auf dem ersten Laufwerk installiert, dann gen?gt der
Standard-Boot-Manager. Wenn Sie einen anderen Boot-Manager benutzen, der
FreeBSD starten kann, w?hlen Sie bitte None aus.

Nachdem Sie die Auswahl getroffen haben, dr?cken Sie die Taste
**Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.16. Sysinstall Boot-Manager-Men?

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Sysinstall Boot-Manager-Men?|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Hilfe, die Sie mit der Taste **F1** aufrufen, werden Probleme
beschrieben, die entstehen k?nnen, wenn sich zwei Betriebssysteme ein
Laufwerk teilen.

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

2.6.4. Slices auf einem anderen Laufwerk anlegen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn das System mehr als ein Laufwerk besitzt, kehrt die
Installationsprozedur nach der Auswahl des Boot-Managers zum Bildschirm
``Select Drives`` zur?ck. Sie k?nnen hier ein anderes Laufwerk ausw?hlen
und auf diesem Laufwerk mit Fdisk weitere Slices anlegen.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Wenn Sie FreeBSD auf einem anderen Laufwerk als dem ersten Laufwerk
installieren, m?ssen Sie den FreeBSD-Boot-Manager auf beiden Laufwerken
installieren.

.. raw:: html

   </div>

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.17. Die Laufwerksauswahl verlassen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Laufwerksauswahl verlassen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Taste **Tab** wechselt zwischen dem zuletzt ausgew?hlten Laufwerk
und den Schaltfl?chen [?OK?] und [?Cancel?].

Dr?cken Sie einmal die Taste **Tab**, um [?OK?] auszuw?hlen und dr?cken
Sie anschlie?end **Enter** um die Installation weiterzuf?hren.

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

2.6.5. Partitionen mit Bsdlabel anlegen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In jeder angelegten Slice m?ssen Sie Partitionen anlegen. Die
Partitionen werden mit Buchstaben von ``a`` bis ``h`` gekennzeichnet.
Die Buchstaben ``b``, ``c`` und ``d`` haben eine besondere Bedeutung,
die Sie beachten sollten.

Einige Anwendungen profitieren von einer besonderen Aufteilung der
Partitionen, insbesondere wenn das System mehr als ein Laufwerk besitzt.
Bei der ersten FreeBSD-Installation sollten Sie sich allerdings nicht zu
viele Gedanken ?ber die Partitionen machen. Wichtiger ist, dass Sie
FreeBSD installieren und benutzen. Wenn Sie mehr Erfahrung mit FreeBSD
gesammelt haben, k?nnen Sie FreeBSD jederzeit mit anderen Partitionen
installieren.

Das folgende Schema legt vier Partitionen an: Eine Partition f?r den
Auslagerungsbereich (*swap space*) und drei Partitionen f?r
Dateisysteme.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 2.2. Partitionen auf dem ersten Laufwerk

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------+---------------+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Partition   | Dateisystem   | Gr??e                                      | Beschreibung                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+=============+===============+============================================+==============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| ``a``       | ``/``         | 1?GB                                       | Das Root-Dateisystem. Jedes andere Dateisystem wird irgendwo unterhalb von diesem Dateisystem eingehangen. 1?GB ist eine vern?nftige Gr??e f?r dieses Dateisystem. Sie werden hier wenig Daten speichern und FreeBSD ben?tigt ungef?hr 128?MB Platz auf diesem Dateisystem. Der Rest ist f?r tempor?re Daten und die Reserve, falls k?nftige Versionen von FreeBSD mehr Platz in ``/`` ben?tigen.                                                                                                                                            |
+-------------+---------------+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``b``       | N/A           | 2-3 x RAM                                  | Der Auslagerungsbereich befindet sich auf der ``b``-Partition. Es ist schon fast eine Kunst, die Gr??e des Auslagerungsbereichs richtig zu bestimmen. Eine gute Daumenregel ist, den Auslagerungsbereich zwei bis dreimal gr??er als den Hauptspeicher (RAM) anzulegen. Sie sollten mindestens 64?MB f?r den Auslagerungsbereich vorsehen. Wenn das System also weniger als 32?MB Hauptspeicher besitzt, richten Sie einen 64?MB gro?en Auslagerungsbereich ein.                                                                             |
|             |               |                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|             |               |                                            | Besitzt das System mehr als ein Laufwerk, k?nnen Sie auf jedem Laufwerk Auslagerungsbereiche anlegen. Da FreeBSD alle Auslagerungsbereiche benutzt, wird der Vorgang des Auslagerns durch mehrere Bereiche beschleunigt. Berechnen Sie in diesem Fall die Gr??e des ben?tigten Auslagerungsbereichs, beispielsweise 128?MB, und teilen Sie die Gr??e durch die Anzahl der Laufwerke. Dies gibt die Gr??e des Auslagerungsbereichs auf jedem Laufwerk. Mit zwei Platten ergibt das in diesem Beispiel 64?MB Auslagerungsbereich pro Platte.   |
+-------------+---------------+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``e``       | ``/var``      | 512?MB bis 4096?MB                         | Das Verzeichnis ``/var`` enth?lt Dateien, die sich dauernd ?ndern (Protokolldateien und Dateien f?r Verwaltungszwecke) und auf die im Normalbetrieb oft zugegriffen wird. Liegen diese Dateien in einem gesonderten Dateisystem, kann FreeBSD den Zugriff auf die Dateien optimieren, ohne den Zugriff auf Dateien mit einem anderen Zugriffmuster zu st?ren.                                                                                                                                                                                |
+-------------+---------------+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``f``       | ``/usr``      | Der Rest des Laufwerks (mindestens 8?GB)   | Alle anderen Dateien werden normalerweise im Verzeichnis ``/usr`` oder einem Unterverzeichnis von ``/usr`` abgelegt.                                                                                                                                                                                                                                                                                                                                                                                                                         |
+-------------+---------------+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Die eben genannten Werte dienen nur als Beispiel und sollten nur von
erfahrenen Benutzern editiert werden. Wir empfehlen Ihnen, die vom
Partitionseditor vorgeschlagene Aufteilung (``Auto Defaults``) zu
verwenden.

.. raw:: html

   </div>

Wenn Sie FreeBSD auf mehr als einem Laufwerk installieren, m?ssen Sie
noch weitere Partitionen in den Slices auf den anderen Laufwerken
anlegen. Am einfachsten legen Sie pro Laufwerk zwei Partitionen an: eine
f?r den Auslagerungsbereich und eine andere f?r ein Dateisystem.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 2.3. Partitionen auf weiteren Laufwerken

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------+----------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Partition   | Dateisystem    | Gr??e                    | Beschreibung                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
+=============+================+==========================+========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| ``b``       | -              | -                        | Wie schon besprochen, k?nnen Sie den Auslagerungsbereich auf mehrere Platten verteilen. Auch wenn die ``a``-Partition frei ist, sollte der Auslagerungsbereich entsprechend der Konvention auf der ``b``-Partition angelegt werden.                                                                                                                                                                                                                                                                                                                                                                                    |
+-------------+----------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``e``       | /disk*``n``*   | Der Rest des Laufwerks   | Der Rest der Platte wird von einer gro?en Partition eingenommen. Sie k?nnten f?r diese Partition die ``a``-Partition anstelle der ``e``-Partition benutzen. Allerdings ist die ``a``-Partition per Konvention f?r das Root-Dateisystem (``/``) reserviert. Sie brauchen die Konvention nicht zu beachten, da aber sysinstall die Konvention beachtet, ist die Installation sauberer, wenn Sie das auch tun. Sie k?nnen das Dateisystem irgendwo einh?ngen. Das Beispiel schl?gt die Verzeichnisse ``/diskn`` vor, wobei *``n``* die Laufwerke nummeriert. Sie k?nnen ein anderes Schema verwenden, wenn Sie m?chten.   |
+-------------+----------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die Aufteilung der Partitionen festgelegt haben, k?nnen Sie die
Partitionen mit sysinstall anlegen. Es erscheint die nachstehende
Meldung:

.. code:: screen

                                     Message
     Now, you need to create BSD partitions inside of the fdisk
     partition(s) just created. If you have a reasonable amount of disk
     space (1GB or more) and don't have any special requirements, simply
     use the (A)uto command to allocate space automatically. If you have
     more specific needs or just don't care for the layout chosen by
     (A)uto, press F1 for more information on manual layout.

                                    [  OK  ]
                              [ Press enter or space ]

Dr?cken Sie **Enter**, um den FreeBSD-Partitionseditor, der Disklabel
hei?t, zu starten.

`Abbildung?2.18, „Sysinstall
Disklabel-Editor“ <install-steps.html#sysinstall-label>`__ zeigt den
Einstiegsbildschirm von Disklabel. Der Bildschirm ist in drei Bereiche
geteilt.

Die ersten Zeilen zeigen den Namen des Laufwerks, das Sie gerade
bearbeiten und die Slice, die die erstellten Partitionen enth?lt
(Disklabel spricht hier von Partitionen anstatt von Slices). Der freie
Platz einer Slice, der noch keiner Partition zugeordnet ist, wird
ebenfalls angezeigt.

In der Mitte des Bildschirms werden die angelegten Partitionen, der Name
des Dateisystems, das sich in der Partition befindet, dessen Gr??e und
die Optionen zum Erstellen des Dateisystems angezeigt.

Das untere Drittel des Bildschirms zeigt die in Disklabel g?ltigen
Tastenkombinationen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.18. Sysinstall Disklabel-Editor

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Sysinstall Disklabel-Editor|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Disklabel kann f?r Sie automatisch Partitionen mit vorgegebenen Gr??en
erstellen (diese Standardgr??en werden durch einen internen
Partitionierungsalgorithmus ermittelt, der auf der Plattengr??e beruht).
Probieren Sie das bitte jetzt aus und dr?cken Sie die Taste **A**. Der
Bildschirm sieht danach ?hnlich wie in `Abbildung?2.19, „Sysinstall
Disklabel-Editor mit automatischen
Vorgaben“ <install-steps.html#sysinstall-label2>`__ aus. Abh?ngig von
der Gr??e des Laufwerks k?nnen die Vorgabewerte richtig oder falsch
sein. Da Sie die Vorgaben nicht akzeptieren m?ssen, spielt das keine
Rolle.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

FreeBSD legt das Verzeichnis ``/tmp`` in einer eigenen Partition an.
Dies verhindert, dass sich die Root-Partition mit tempor?ren Dateien
f?llt.

.. raw:: html

   </div>

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.19. Sysinstall Disklabel-Editor mit automatischen Vorgaben

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Sysinstall Disklabel-Editor mit automatischen Vorgaben|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wollen Sie die vorgegebenen Partitionen nicht verwenden und durch eigene
ersetzen, markieren Sie mit den Pfeiltasten die erste Partition und
dr?cken Sie die Taste **D**, um die Partition zu l?schen. Wiederholen
Sie dies f?r alle vorgegebenen Partitionen.

Um die erste Partition (``a``), die als ``/`` eingehangen wird, zu
erstellen, dr?cken Sie die Taste **C**. Stellen Sie dabei sicher, dass
die richtige Slice im oberen Teil des Bildschirms markiert ist. Wie in
`Abbildung?2.20, „Die Gr??e einer Partition
festlegen“ <install-steps.html#sysinstall-label-add>`__, erscheint ein
Fenster, in dem Sie die Gr??e der Partition angeben m?ssen. Sie k?nnen
die Gr??e in Bl?cken oder einer Zahl gefolgt von ``M`` f?r Megabyte,
``G`` f?r Gigabyte oder ``C`` f?r Zylinder angeben.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.20. Die Gr??e einer Partition festlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Gr??e einer Partition festlegen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die vorgegebene Gr??e erstellt eine Partition, die den Rest der Slice
ausf?llt. Wenn Sie die Gr??en aus dem fr?heren Beispiel verwenden,
l?schen Sie die vorgeschlagene Gr??e mit der Taste **Backspace** und
tragen Sie **``512M``** ein, wie in `Abbildung?2.21, „Die Gr??e einer
Partition ?ndern“ <install-steps.html#sysinstall-label-add2>`__ gezeigt.
Dr?cken Sie anschlie?end [?OK?].

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.21. Die Gr??e einer Partition ?ndern

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Gr??e einer Partition ?ndern|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie die Gr??e der Partition festgelegt haben, werden Sie
gefragt, ob die Partition ein Dateisystem oder einen Auslagerungsbereich
enthalten soll (siehe `Abbildung?2.22, „Den Partitionstyp
festlegen“ <install-steps.html#sysinstall-label-type>`__). Die erste
Partition enth?lt ein Dateisystem, w?hlen Sie FS aus und dr?cken Sie die
Taste **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.22. Den Partitionstyp festlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Den Partitionstyp festlegen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Abschlie?end m?ssen Sie, weil Sie ein Dateisystem erstellen, angeben, wo
das Dateisystem eingehangen wird. Die Eingabe ist in `Abbildung?2.23,
„Den Mountpoint
festlegen“ <install-steps.html#sysinstall-label-mount>`__ dargestellt.
Das Root-Dateisystem wird in ``/`` eingehangen, geben Sie daher
**``/``** ein und dr?cken Sie die Taste **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.23. Den Mountpoint festlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Den Mountpoint festlegen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Auf dem Bildschirm wird jetzt die neu angelegte Partition angezeigt.
Wiederholen Sie diese Prozedur f?r die restlichen Partitionen. Beim
Anlegen des Auslagerungsbereichs werden Sie nicht nach einem Mountpoint
gefragt, da ein Auslagerungsbereich nie eingehangen wird. Wenn Sie die
letzte Partition anlegen, ``/usr``, k?nnen Sie die vorgeschlagene Gr??e
stehen lassen. Das Dateisystem wird dann den Rest der Slice einnehmen.

Der letzte Bildschirm von Disklabel sieht wie in `Abbildung?2.24,
„Sysinstall Disklabel-Editor“ <install-steps.html#sysinstall-label4>`__
aus (Ihre Werte werden von den gezeigten Werten abweichen). Dr?cken Sie
die Taste **Q**, um Disklabel zu verlassen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.24. Sysinstall Disklabel-Editor

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Sysinstall Disklabel-Editor|

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

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------------+-------------------------------------------+
| `Zur?ck <using-sysinstall.html>`__?   | `Nach oben <install.html>`__   | ?\ `Weiter <install-choosing.html>`__     |
+---------------------------------------+--------------------------------+-------------------------------------------+
| 2.5. Das Werkzeug sysinstall?         | `Zum Anfang <index.html>`__    | ?2.7. Den Installationsumfang bestimmen   |
+---------------------------------------+--------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Ein Laufwerk f?r Fdisk aussuchen| image:: install/fdisk-drive1.png
.. |Typischer Fdisk-Bildschirm vor dem Editieren| image:: install/fdisk-edit1.png
.. |Eine Partition ?ber die gesamte Platte| image:: install/fdisk-edit2.png
.. |Sysinstall Boot-Manager-Men?| image:: install/boot-mgr.png
.. |Die Laufwerksauswahl verlassen| image:: install/fdisk-drive2.png
.. |Sysinstall Disklabel-Editor| image:: install/disklabel-ed1.png
.. |Sysinstall Disklabel-Editor mit automatischen Vorgaben| image:: install/disklabel-auto.png
.. |Die Gr??e einer Partition festlegen| image:: install/disklabel-root1.png
.. |Die Gr??e einer Partition ?ndern| image:: install/disklabel-root2.png
.. |Den Partitionstyp festlegen| image:: install/disklabel-fs.png
.. |Den Mountpoint festlegen| image:: install/disklabel-root3.png
.. |Sysinstall Disklabel-Editor| image:: install/disklabel-ed2.png
