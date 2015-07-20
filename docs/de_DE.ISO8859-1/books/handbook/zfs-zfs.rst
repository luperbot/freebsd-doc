========================
21.4. zfs Administration
========================

.. raw:: html

   <div class="navheader">

21.4. ``zfs`` Administration
`Zur?ck <zfs-zpool.html>`__?
Kapitel 21. Das Z-Dateisystem (ZFS)
?\ `Weiter <zfs-zfs-allow.html>`__

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

21.4. ``zfs`` Administration
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ``zfs``-Werkzeug ist daf?r verantwortlich, alle ZFS Datasets
innerhalb eines Pools zu erstellen, zerst?ren und zu verwalten. Der Pool
selbst wird durch ```zpool`` <zfs-zpool.html>`__ verwaltet.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

21.4.1. Datasets erstellen und zerst?ren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Anders als in traditionellen Festplatten- und Volumenmanagern wird der
Plattenplatz in ZFS *nicht* vorher allokiert. Bei traditionellen
Dateisystemen gibt es, nachdem der Plattenplatz partitioniert und
zugeteilt wurde, keine M?glichkeit, ein zus?tzliches Dateisystem
hinzuzuf?gen, ohne eine neue Platte anzuschlie?en. Mit ZFS lassen sich
neue Dateisysteme zu jeder Zeit anlegen. Jedes
`*Dataset* <zfs-term.html#zfs-term-dataset>`__ besitzt Eigenschaften wie
Komprimierung, Deduplizierung, Zwischenspeicher (caching), Quotas,
genauso wie andere n?tzliche Einstellungen wie Schreibschutz,
Unterscheidung zwischen Gro?- und Kleinschreibung, Netzwerkfreigaben und
einen Einh?ngepunkt. Datasets k?nnen ineinander verschachtelt werden und
Kind-Datasets erben die Eigenschaften ihrer Eltern. Jedes Dataset kann
als eine Einheit verwaltet, `delegiert <zfs-zfs-allow.html>`__,
`repliziert <zfs-zfs.html#zfs-zfs-send>`__, `mit Schnappsch?ssen
versehen <zfs-zfs.html#zfs-zfs-snapshot>`__, `in Jails
gesteckt <zfs-zfs.html#zfs-zfs-jail>`__ und zerst?rt werden. Es gibt
viele Vorteile, ein separates Dataset f?r jede Art von Dateien
anzulegen. Der einzige Nachteil einer gro?en Menge an Datasets ist, dass
manche Befehle wie ``zfs list`` langsamer sind und dass das Einh?ngen
von hunderten oder hunderttausenden von Datasets de FreeBSD-Bootvorgang
verz?gert.

Erstellen eines neuen Datasets und aktivieren von `LZ4
Komprimierung <zfs-term.html#zfs-term-compression-lz4>`__:

.. code:: screen

    # zfs list
    NAME                  USED  AVAIL  REFER  MOUNTPOINT
    mypool                781M  93.2G   144K  none
    mypool/ROOT           777M  93.2G   144K  none
    mypool/ROOT/default   777M  93.2G   777M  /
    mypool/tmp            176K  93.2G   176K  /tmp
    mypool/usr            616K  93.2G   144K  /usr
    mypool/usr/home       184K  93.2G   184K  /usr/home
    mypool/usr/ports      144K  93.2G   144K  /usr/ports
    mypool/usr/src        144K  93.2G   144K  /usr/src
    mypool/var           1.20M  93.2G   608K  /var
    mypool/var/crash      148K  93.2G   148K  /var/crash
    mypool/var/log        178K  93.2G   178K  /var/log
    mypool/var/mail       144K  93.2G   144K  /var/mail
    mypool/var/tmp        152K  93.2G   152K  /var/tmp
    # zfs create -o compress=lz4 mypool/usr/mydataset
    # zfs list
    NAME                   USED  AVAIL  REFER  MOUNTPOINT
    mypool                 781M  93.2G   144K  none
    mypool/ROOT            777M  93.2G   144K  none
    mypool/ROOT/default    777M  93.2G   777M  /
    mypool/tmp             176K  93.2G   176K  /tmp
    mypool/usr             704K  93.2G   144K  /usr
    mypool/usr/home        184K  93.2G   184K  /usr/home
    mypool/usr/mydataset  87.5K  93.2G  87.5K  /usr/mydataset
    mypool/usr/ports       144K  93.2G   144K  /usr/ports
    mypool/usr/src         144K  93.2G   144K  /usr/src
    mypool/var            1.20M  93.2G   610K  /var
    mypool/var/crash       148K  93.2G   148K  /var/crash
    mypool/var/log         178K  93.2G   178K  /var/log
    mypool/var/mail        144K  93.2G   144K  /var/mail
    mypool/var/tmp         152K  93.2G   152K  /var/tmp

Ein Dataset zu zerst?ren ist viel schneller, als alle Dateien zu
l?schen, die sich in dem Dataset befindet, da es keinen Scan aller
Dateien und aktualisieren der dazugeh?rigen Metadaten erfordert.

Zerst?ren des zuvor angelegten Datasets:

.. code:: screen

    # zfs list
    NAME                   USED  AVAIL  REFER  MOUNTPOINT
    mypool                 880M  93.1G   144K  none
    mypool/ROOT            777M  93.1G   144K  none
    mypool/ROOT/default    777M  93.1G   777M  /
    mypool/tmp             176K  93.1G   176K  /tmp
    mypool/usr             101M  93.1G   144K  /usr
    mypool/usr/home        184K  93.1G   184K  /usr/home
    mypool/usr/mydataset   100M  93.1G   100M  /usr/mydataset
    mypool/usr/ports       144K  93.1G   144K  /usr/ports
    mypool/usr/src         144K  93.1G   144K  /usr/src
    mypool/var            1.20M  93.1G   610K  /var
    mypool/var/crash       148K  93.1G   148K  /var/crash
    mypool/var/log         178K  93.1G   178K  /var/log
    mypool/var/mail        144K  93.1G   144K  /var/mail
    mypool/var/tmp         152K  93.1G   152K  /var/tmp
    # zfs destroy mypool/usr/mydataset
    # zfs list
    NAME                  USED  AVAIL  REFER  MOUNTPOINT
    mypool                781M  93.2G   144K  none
    mypool/ROOT           777M  93.2G   144K  none
    mypool/ROOT/default   777M  93.2G   777M  /
    mypool/tmp            176K  93.2G   176K  /tmp
    mypool/usr            616K  93.2G   144K  /usr
    mypool/usr/home       184K  93.2G   184K  /usr/home
    mypool/usr/ports      144K  93.2G   144K  /usr/ports
    mypool/usr/src        144K  93.2G   144K  /usr/src
    mypool/var           1.21M  93.2G   612K  /var
    mypool/var/crash      148K  93.2G   148K  /var/crash
    mypool/var/log        178K  93.2G   178K  /var/log
    mypool/var/mail       144K  93.2G   144K  /var/mail
    mypool/var/tmp        152K  93.2G   152K  /var/tmp

In modernen Versionen von ZFS ist ``zfs destroy`` asynchron und der
freie Speicherplatz kann erst nach ein paar Minuten im Pool auftauchen.
Verwenden Sie ``zpool get freeing       poolname``, um die Eigenschaft
``freeing`` aufzulisten, die angibt, bei wievielen Datasets die Bl?cke
im Hintergrund freigegeben werden. Sollte es Kind-Datasets geben,
`Schnappsch?sse <zfs-term.html#zfs-term-snapshot>`__ oder andere
Datasets, dann l?sst sich der Elternknoten nicht zerst?ren. Um ein
Dataset und all seine Kinder zu zerst?ren, verwenden Sie die Option
``-r``, um das Dataset und all seine Kinder rekursiv zu entfernen.
Benutzen Sie die Option ``-n`` und ``-v``, um Datasets und Snapshots
anzuzeigen, die durch diese Aktion zerst?rt werden w?rden, dies jedoch
nur zu simulieren und nicht wirklich durchzuf?hren. Speicherplatz, der
dadurch freigegeben w?rde, wird ebenfalls angezeigt.

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

21.4.2. Volumes erstellen und zerst?ren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Volume ist ein spezieller Typ von Dataset. Anstatt dass es als
Dateisystem eingeh?ngt wird, stellt es ein Block-Ger?t unter
``/dev/zvol/poolname``/*``dataset``* dar. Dies erlaubt es, das Volume
f?r andere Dateisysteme zu verwenden, die Festplatten einer virtuellen
Maschine bereitzustellen oder ?ber Protokolle wie iSCSI oder HAST
exportiert zu werden.

Ein Volume kann mit einem beliebigen Dateisystem formatiert werden oder
auch ohne ein Dateisystem als reiner Datenspeicher fungieren. F?r den
Benutzer erscheint ein Volume als eine gew?hnliche Platte. Indem
gew?hnliche Dateisysteme auf diesen *zvols* angelegt werden, ist es
m?glich, diese mit Eigenschaften auszustatten, welche diese
normalerweise nicht besitzen. Beispielsweise wird durch Verwendung der
Komprimierungseigenschaft auf einem 250?MB Volume das Erstellen eines
komprimierten FAT Dateisystems m?glich.

.. code:: screen

    # zfs create -V 250m -o compression=on tank/fat32
    # zfs list tank
    NAME USED AVAIL REFER MOUNTPOINT
    tank 258M  670M   31K /tank
    # newfs_msdos -F32 /dev/zvol/tank/fat32
    # mount -t msdosfs /dev/zvol/tank/fat32 /mnt
    # df -h /mnt | grep fat32
    Filesystem           Size Used Avail Capacity Mounted on
    /dev/zvol/tank/fat32 249M  24k  249M     0%   /mnt
    # mount | grep fat32
    /dev/zvol/tank/fat32 on /mnt (msdosfs, local)

Ein Volume zu zerst?ren ist sehr ?hnlich wie ein herk?mmliches Dataset
zu entfernen. Die Operation wird beinahe sofort durchgef?hrt, jedoch
kann es mehrere Minuten dauern, bis der freie Speicherplatz im
Hintergrund wieder freigegeben ist.

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

21.4.3. Umbenennen eines Datasets
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Name eines Datasets l?sst sich durch ``zfs rename`` ?ndern. Das
Eltern-Dataset kann ebenfalls mit diesem Kommando umbenannt werden. Ein
Dataset unter einem anderen Elternteil umzubenennen wird den Wert dieser
Eigenschaft ver?ndern, die vom Elternteil vererbt wurden. Wird ein
Dataset umbenannt, wird es abgeh?ngt und dann erneut unter der neuen
Stelle eingeh?ngt (welche vom neuen Elternteil geerbt wird). Dieses
Verhalten kann durch die Option ``-u`` verhindert werden.

Ein Dataset umbenennen und unter einem anderen Elterndataset
verschieben:

.. code:: screen

    # zfs list
    NAME                   USED  AVAIL  REFER  MOUNTPOINT
    mypool                 780M  93.2G   144K  none
    mypool/ROOT            777M  93.2G   144K  none
    mypool/ROOT/default    777M  93.2G   777M  /
    mypool/tmp             176K  93.2G   176K  /tmp
    mypool/usr             704K  93.2G   144K  /usr
    mypool/usr/home        184K  93.2G   184K  /usr/home
    mypool/usr/mydataset  87.5K  93.2G  87.5K  /usr/mydataset
    mypool/usr/ports       144K  93.2G   144K  /usr/ports
    mypool/usr/src         144K  93.2G   144K  /usr/src
    mypool/var            1.21M  93.2G   614K  /var
    mypool/var/crash       148K  93.2G   148K  /var/crash
    mypool/var/log         178K  93.2G   178K  /var/log
    mypool/var/mail        144K  93.2G   144K  /var/mail
    mypool/var/tmp         152K  93.2G   152K  /var/tmp
    # zfs rename mypool/usr/mydataset mypool/var/newname
    # zfs list
    NAME                  USED  AVAIL  REFER  MOUNTPOINT
    mypool                780M  93.2G   144K  none
    mypool/ROOT           777M  93.2G   144K  none
    mypool/ROOT/default   777M  93.2G   777M  /
    mypool/tmp            176K  93.2G   176K  /tmp
    mypool/usr            616K  93.2G   144K  /usr
    mypool/usr/home       184K  93.2G   184K  /usr/home
    mypool/usr/ports      144K  93.2G   144K  /usr/ports
    mypool/usr/src        144K  93.2G   144K  /usr/src
    mypool/var           1.29M  93.2G   614K  /var
    mypool/var/crash      148K  93.2G   148K  /var/crash
    mypool/var/log        178K  93.2G   178K  /var/log
    mypool/var/mail       144K  93.2G   144K  /var/mail
    mypool/var/newname   87.5K  93.2G  87.5K  /var/newname
    mypool/var/tmp        152K  93.2G   152K  /var/tmp

Schnappsch?sse k?nnen auf diese Weise ebenfalls umbenannt werden.
Aufgrund der Art von Schnappsch?ssen k?nnen diese nicht unter einem
anderen Elterndataset eingeh?ngt werden. Um einen rekursiven
Schnappschuss umzubenennen, geben Sie die Option ``-r`` an, um alle
Schnappsch?sse mit dem gleichen Namen im Kind-Dataset ebenfalls
umzubenennen.

.. code:: screen

    # zfs list -t snapshot
    NAME                                USED  AVAIL  REFER  MOUNTPOINT
    mypool/var/newname@first_snapshot      0      -  87.5K  -
    # zfs rename mypool/var/newname@first_snapshot new_snapshot_name
    # zfs list -t snapshot
    NAME                                   USED  AVAIL  REFER  MOUNTPOINT
    mypool/var/newname@new_snapshot_name      0      -  87.5K  -

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

21.4.4. Festlegen von Dataset-Eigenschaften
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jedes ZFS-Dataset besitzt eine Menge von Eigenschaften, die sein
Verhalten beeinflussen. Die meisten Eigenschaften werden automatisch vom
Eltern-Dataset vererbt, k?nnen jedoch lokal ?berschrieben werden. Sie
legen eine Eigenschaft durch ``zfs set       property``\ =\ *``value``*
*``dataset``* fest. Die meisten Eigenschaften haben eine begrenzte Menge
von g?ltigen Werten. ``zfs get`` stellt diese dar und zeigt jede
m?gliche Eigenschaft und g?ltige Werte an. Die meisten Eigenschaften
k?nnen ?ber ``zfs inherit`` wieder auf ihren Ausgangswert zur?ckgesetzt
werden.

Benutzerdefinierte Eigenschaften lassen sich ebenfalls setzen. Diese
werden Teil der Konfiguration des Datasets und k?nnen dazu verwendet
werden, zus?tzliche Informationen ?ber das Dataset oder seine
Bestandteile zu speichern. Um diese benutzerdefinierten Eigenschaften
von den ZFS-eigenen zu unterscheiden, wird ein Doppelpunkt (``:``)
verwendet, um einen eigenen Namensraum f?r diese Eigenschaft zu
erstellen.

.. code:: screen

    # zfs set custom:costcenter=1234 tank
    # zfs get custom:costcenter tank
    NAME PROPERTY           VALUE SOURCE
    tank custom:costcenter  1234  local

Um eine selbstdefinierte Eigenschaft umzubenennen, verwenden Sie
``zfs inherit`` mit der Option ``-r``. Wenn die benutzerdefinierte
Eigenschaft nicht in einem der Eltern-Datasets definiert ist, wird diese
komplett entfernt (obwohl diese ?nderungen nat?rlich in der Historie des
Pools noch aufgezeichnet sind).

.. code:: screen

    # zfs inherit -r custom:costcenter tank
    # zfs get custom:costcenter tank
    NAME    PROPERTY           VALUE              SOURCE
    tank    custom:costcenter  -                  -
    # zfs get all tank | grep custom:costcenter
    #

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

21.4.5. Verwalten von Schnappsch?ssen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`Schnappsch?sse <zfs-term.html#zfs-term-snapshot>`__ sind eine der
m?chtigen Eigenschaften von ZFS. Ein Schnappschuss bietet einen nur-Lese
Zustand eines Datasets zu einem bestimmten Zeitpunkt. Mit
Kopieren-beim-Schreiben (Copy-On-Write COW), k?nnen Schnappsch?sse
schnell erstellt werden durch das Aufheben der ?lteren Version der Daten
auf der Platte. Falls kein Snapshot existiert, wird der Speicherplatz
wieder f?r zuk?nftige Verwendung freigegeben wenn Daten geschrieben oder
gel?scht werden. Schnappsch?sse sparen Speicherplatz, indem diese nur
die Unterschiede zwischen dem momentanen Dataset und der vorherigen
Version aufzeichnen. Schnappsch?sse sind nur auf ganzen Datasets
erlaubt, nicht auf individuellen Dateien oder Verzeichnissen. Wenn ein
Schnappschuss eines Datasets erstellt wird, wird alles was darin
enthalten ist, dupliziert. Das beinhaltet Dateisystemeigenschaften,
Dateien, Verzeichnisse, Rechte und so weiter. Schnappsch?sse ben?tigen
keinen zus?tzlichen Speicherplatz wenn diese erstmals angelegt werden,
nur wenn Bl?cke, die diese referenzieren, ge?ndert werden. Rekursive
Schnappsch?sse, die mit der Option ``-r`` erstellt, erzeugen einen mit
dem gleichen Namen des Datasets und all seinen Kindern, was eine
konsistente Momentaufnahme aller Dateisysteme darstellt. Dies kann
wichtig sein, wenn eine Anwendung Dateien auf mehreren Datasets ablegt,
die miteinander in Verbindung stehen oder voneinander abh?ngig sind.
Ohne Schnappsch?sse w?rde ein Backup Kopien dieser Dateien zu
unterschiedlichen Zeitpunkten enthalten.

Schnappsch?sse in ZFS bieten eine Vielzahl von Eigenschaften, die selbst
in anderen Dateisystemen mit Schnappschussfunktion nicht vorhanden sind.
Ein typisches Beispiel zur Verwendung von Schnappsch?ssen ist, den
momentanen Stand des Dateisystems zu sichern, wenn eine riskante Aktion
wie das Installieren von Software oder eine Systemaktualisierung
durchgef?hrt wird. Wenn diese Aktion fehlschl?gt, so kann der
Schnappschuss zur?ckgerollt werden und das System befindet sich wieder
in dem gleichen Zustand, wie zu dem, als der Schnappschuss erstellt
wurde. Wenn die Aktualisierung jedoch erfolgreich war, kann der
Schnappschuss gel?scht werden, um Speicherplatz frei zu geben. Ohne
Schnappsch?sse, wird durch ein fehlgeschlagenes Update eine
Wiederherstellung der Sicherung f?llig, was oft m?hsam und zeitaufw?ndig
ist, au?erdem ist w?hrenddessen das System nicht verwendbar.
Schnappsch?sse lassen sich schnell und mit wenig bis gar keiner
Ausfallzeit zur?ckrollen, selbst wenn das System im normalen Betrieb
l?uft. Die Zeitersparnis ist enorm, wenn mehrere Terabyte gro?e
Speichersysteme eingesetzt werden und viel Zeit f?r das Kopieren der
Daten vom Sicherungssystem ben?tigt wird. Schnappsch?sse sind jedoch
keine Ersatz f?r eine Vollsicherung des Pools, k?nnen jedoch als eine
schnelle und einfache Sicherungsmethode verwendet werden, um eine Kopie
eines Datasets zu einem bestimmten Zeitpunkt zu sichern.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

21.4.5.1. Schnappsch?sse erstellen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Schnappsch?sse werden durch das Kommando
``zfs snapshot         dataset``\ @\ *``snapshotname``* angelegt. Durch
Angabe der Option ``-r`` werden Schnappsch?sse rekursive angelegt, mit
dem gleichen Namen auf allen Datasets.

Einen rekursiven Schnappschuss des gesamten Pools erzeugen:

.. code:: screen

    # zfs list -t all
    NAME                                   USED  AVAIL  REFER  MOUNTPOINT
    mypool                                 780M  93.2G   144K  none
    mypool/ROOT                            777M  93.2G   144K  none
    mypool/ROOT/default                    777M  93.2G   777M  /
    mypool/tmp                             176K  93.2G   176K  /tmp
    mypool/usr                             616K  93.2G   144K  /usr
    mypool/usr/home                        184K  93.2G   184K  /usr/home
    mypool/usr/ports                       144K  93.2G   144K  /usr/ports
    mypool/usr/src                         144K  93.2G   144K  /usr/src
    mypool/var                            1.29M  93.2G   616K  /var
    mypool/var/crash                       148K  93.2G   148K  /var/crash
    mypool/var/log                         178K  93.2G   178K  /var/log
    mypool/var/mail                        144K  93.2G   144K  /var/mail
    mypool/var/newname                    87.5K  93.2G  87.5K  /var/newname
    mypool/var/newname@new_snapshot_name      0      -  87.5K  -
    mypool/var/tmp                         152K  93.2G   152K  /var/tmp
    # zfs snapshot -r mypool@my_recursive_snapshot
    # zfs list -t snapshot
    NAME                                        USED  AVAIL  REFER  MOUNTPOINT
    mypool@my_recursive_snapshot                   0      -   144K  -
    mypool/ROOT@my_recursive_snapshot              0      -   144K  -
    mypool/ROOT/default@my_recursive_snapshot      0      -   777M  -
    mypool/tmp@my_recursive_snapshot               0      -   176K  -
    mypool/usr@my_recursive_snapshot               0      -   144K  -
    mypool/usr/home@my_recursive_snapshot          0      -   184K  -
    mypool/usr/ports@my_recursive_snapshot         0      -   144K  -
    mypool/usr/src@my_recursive_snapshot           0      -   144K  -
    mypool/var@my_recursive_snapshot               0      -   616K  -
    mypool/var/crash@my_recursive_snapshot         0      -   148K  -
    mypool/var/log@my_recursive_snapshot           0      -   178K  -
    mypool/var/mail@my_recursive_snapshot          0      -   144K  -
    mypool/var/newname@new_snapshot_name           0      -  87.5K  -
    mypool/var/newname@my_recursive_snapshot       0      -  87.5K  -
    mypool/var/tmp@my_recursive_snapshot           0      -   152K  -

Schnappsch?sse werden nicht durch einen ``zfs list``-Befehl angezeigt.
Um Schnappsch?sse mit aufzulisten, muss ``-t snapshot`` an das Kommando
``zfs list`` angeh?ngt werden. Durch ``-t all`` werden sowohl
Dateisysteme als auch Schnappsch?sse nebeneinander angezeigt.

Schnappsch?sse werden nicht direkt eingeh?ngt, deshalb wird auch kein
Pfad in der Spalte ``MOUNTPOINT`` angezeigt. Ebenso wird kein freier
Speicherplatz in der Spalte ``AVAIL`` aufgelistet, da Schnappsch?sse
nicht mehr geschrieben werden k?nnen, nachdem diese angelegt wurden.
Vergleichen Sie den Schnappschuss mit dem urspr?nglichen Dataset von dem
es abstammt:

.. code:: screen

    # zfs list -rt all mypool/usr/home
    NAME                                    USED  AVAIL  REFER  MOUNTPOINT
    mypool/usr/home                         184K  93.2G   184K  /usr/home
    mypool/usr/home@my_recursive_snapshot      0      -   184K  -

Durch das Darstellen des Datasets und des Schnappschusses nebeneinander
zeigt deutlich, wie Schnappsch?sse in
`COW <zfs-term.html#zfs-term-cow>`__ Manier funktionieren. Sie zeichnen
nur die ?nderungen (*delta*) auf, die w?hrenddessen entstanden sind und
nicht noch einmal den gesamten Inhalt des Dateisystems. Das bedeutet,
dass Schnappsch?sse nur wenig Speicherplatz ben?tigen, wenn nur kleine
?nderungen vorgenommen werden. Der Speicherverbrauch kann sogar noch
deutlicher gemacht werden, wenn eine Datei auf das Dataset kopiert wird
und anschlie?end ein zweiter Schnappschuss angelegt wird:

.. code:: screen

    # cp /etc/passwd /var/tmp
    # zfs snapshot mypool/var/tmp@after_cp
    # zfs list -rt all mypool/var/tmp
    NAME                                   USED  AVAIL  REFER  MOUNTPOINT
    mypool/var/tmp                         206K  93.2G   118K  /var/tmp
    mypool/var/tmp@my_recursive_snapshot    88K      -   152K  -
    mypool/var/tmp@after_cp                   0      -   118K  -

Der zweite Schnappschuss enth?lt nur die ?nderungen am Dataset, die nach
der Kopieraktion gemacht wurden. Dies bedeutet enorme Einsparungen von
Speicherplatz. Beachten Sie, dass sich die Gr??e des Schnappschusses
*``mypool/var/tmp@my_recursive_snapshot``* in der Spalte ``USED``
ebenfalls ge?ndert hat, um die ?nderungen von sich selbst und dem
Schnappschuss, der im Anschluss angelegt wurde, anzuzeigen.

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

21.4.5.2. Schnappsch?sse vergleichen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ZFS enth?lt ein eingebautes Kommando, um die Unterschiede zwischen zwei
Schnappsch?ssen miteinander zu vergleichen. Das ist hilfreich, wenn
viele Schnappsch?sse ?ber l?ngere Zeit angelegt wurden und der Benutzer
sehen will, wie sich das Dateisystem ?ber diesen Zeitraum ver?ndert hat.
Beispielsweise kann ``zfs diff`` den letzten Schnappschuss finden, der
noch eine Datei enth?lt, die aus Versehen gel?scht wurde. Wenn dies f?r
die letzten beiden Schnappsch?sse aus dem vorherigen Abschnitt
durchgef?hrt wird, ergibt sich folgende Ausgabe:

.. code:: screen

    # zfs list -rt all mypool/var/tmp
    NAME                                   USED  AVAIL  REFER  MOUNTPOINT
    mypool/var/tmp                         206K  93.2G   118K  /var/tmp
    mypool/var/tmp@my_recursive_snapshot    88K      -   152K  -
    mypool/var/tmp@after_cp                   0      -   118K  -
    # zfs diff mypool/var/tmp@my_recursive_snapshot
    M       /var/tmp/
    +       /var/tmp/passwd

Das Kommando zeigt alle ?nderungen zwischen dem angegebenen
Schnappschuss (in diesem Fall ``mypool/var/tmp@my_recursive_snapshot``)
und dem momentan aktuellen Dateisystem. Die erste Spalte zeigt die Art
der ?nderung an:

.. raw:: html

   <div class="informaltable">

+-----+-----------------------------------------------------+
| +   | Das Verzeichnis oder die Datei wurde hinzugef?gt.   |
+-----+-----------------------------------------------------+
| -   | Das Verzeichnis oder die Datei wurde gel?scht.      |
+-----+-----------------------------------------------------+
| M   | Das Verzeichnis oder die Datei wurde ge?ndert.      |
+-----+-----------------------------------------------------+
| R   | Das Verzeichnis oder die Datei wurde umbenannt.     |
+-----+-----------------------------------------------------+

.. raw:: html

   </div>

Vergleicht man die Ausgabe mit der Tabelle, wird klar, dass ``passwd``
hinzugef?gt wurde, nachdem der Schnappschuss
``mypool/var/tmp@my_recursive_snapshot`` erstellt wurde. Das resultierte
ebenfalls in einer ?nderung am dar?berliegenden Verzeichnis, das unter
``/var/tmp`` eingeh?ngt ist.

Zwei Schnappsch?sse zu vergleichen ist hilfreich, wenn die
Replikationseigenschaft von ZFS verwendet wird, um ein Dataset auf einen
anderen Host zu Sicherungszwecken ?bertragen.

Zwei Schnappsch?sse durch die Angabe des kompletten Namens des Datasets
und dem Namen des Schnappschusses beider Datasets vergleichen:

.. code:: screen

    # cp /var/tmp/passwd /var/tmp/passwd.copy
    # zfs snapshot mypool/var/tmp@diff_snapshot
    # zfs diff mypool/var/tmp@my_recursive_snapshot mypool/var/tmp@diff_snapshot
    M       /var/tmp/
    +       /var/tmp/passwd
    +       /var/tmp/passwd.copy
    # zfs diff mypool/var/tmp@my_recursive_snapshot mypool/var/tmp@after_cp
    M       /var/tmp/
    +       /var/tmp/passwd

Ein Administrator, der f?r die Sicherung zust?ndig ist, kann zwei
Schnappsch?sse miteinander vergleichen, die vom sendenden Host empfangen
wurden, um festzustellen, welche ?nderungen am Dataset vorgenommen
wurden. Lesen Sie dazu den Abschnitt
`Replication <zfs-zfs.html#zfs-zfs-send>`__ um weitere Informationen zu
erhalten.

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

21.4.5.3. Schnappsch?sse zur?ckrollen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn zumindest ein Schnappschuss vorhanden ist, kann dieser zu einem
beliebigen Zeitpunkt zur?ckgerollt werden. In den meisten F?llen
passiert dies, wenn der aktuelle Zustand des Datasets nicht mehr
ben?tigt wird und eine ?ltere Version bevorzugt wird. Szenarien wie
lokale Entwicklungstests, die fehlgeschlagen sind, defekte
Systemaktualisierungen, welche die Funktionalit?t des Gesamtsystems
einschr?nken oder die Anforderung, versehentlich gel?schte Dateien oder
Verzeichnisse wiederherzustellen, sind allgegenw?rtig. Gl?cklicherweise
ist das zur?ckrollen eines Schnappschusses so leicht wie die Eingabe von
``zfs rollback         snapshotname``. Abh?ngig davon, wie viele
?nderungen betroffen sind, wird diese Operation innerhalb einer gewissen
Zeit abgeschlossen sein. W?hrend dieser Zeit bleibt das Dataset in einem
konsistenten Zustand, sehr ?hnlich den ACID-Prinzipien, die eine
Datenbank beim Zur?ckrollen entspricht. W?hrend all dies passiert, ist
das Dataset immer noch aktiv und erreichbar ohne dass eine Ausfallzeit
n?tig w?re. Sobald der Schnappschuss zur?ckgerollt wurde, besitzt das
Dataset den gleichen Zustand, den es besa?, als der Schnappschuss
angelegt wurde. Alle anderen Daten in diesem Dataset, die nicht Teil des
Schnappschusses sind, werden verworfen. Einen Schnappschuss des
aktuellen Zustandes des Datasets vor dem Zur?ckrollen anzulegen ist eine
gute Idee, wenn hinterher noch Daten ben?tigt werden. Auf diese Weise
kann der Benutzer vor und zur?ck zwischen den Schnappsch?ssen springen,
ohne wertvolle Daten zu verlieren.

Im ersten Beispiel wird ein Schnappschuss aufgrund eines unvorsichtigen
``rm``-Befehls zur?ckgerollt, der mehr Daten gel?scht hat, als
vorgesehen.

.. code:: screen

    # zfs list -rt all mypool/var/tmp
    NAME                                   USED  AVAIL  REFER  MOUNTPOINT
    mypool/var/tmp                         262K  93.2G   120K  /var/tmp
    mypool/var/tmp@my_recursive_snapshot    88K      -   152K  -
    mypool/var/tmp@after_cp               53.5K      -   118K  -
    mypool/var/tmp@diff_snapshot              0      -   120K  -
    % ls /var/tmp
    passwd          passwd.copy
    % rm /var/tmp/passwd*
    % ls /var/tmp
    vi.recover
    %

Zu diesem Zeitpunkt bemerkt der Benutzer, dass zuviele Dateien gel?scht
wurden und m?chte diese zur?ck haben. ZFS bietet eine einfache
M?glichkeit, diese durch zur?ckrollen zur?ck zu bekommen, allerdings
nur, wenn Schnappsch?sse von wichtigen Daten regelm??ig angelegt werden.
Um die Dateien zur?ckzuerhalten und vom letzten Schnappschuss wieder zu
beginnen, geben Sie ein:

.. code:: screen

    # zfs rollback mypool/var/tmp@diff_snapshot
    % ls /var/tmp
    passwd          passwd.copy     vi.recover

Die Operation zum Zur?ckrollen versetzt das Dataset in den Zustand des
letzten Schnappschusses zur?ck. Es ist ebenfalls m?glich, zu einem
Schnappschuss zur?ckzurollen, der viel fr?her angelegt wurde und es noch
Schnappsch?sse nach diesem gibt. Wenn Sie dies versuchen, gibt ZFS die
folgende Warnung aus:

.. code:: screen

    # zfs list -rt snapshot mypool/var/tmp
    AME                                   USED  AVAIL  REFER  MOUNTPOINT
    mypool/var/tmp@my_recursive_snapshot    88K      -   152K  -
    mypool/var/tmp@after_cp               53.5K      -   118K  -
    mypool/var/tmp@diff_snapshot              0      -   120K  -
    # zfs rollback mypool/var/tmp@my_recursive_snapshot
    cannot rollback to 'mypool/var/tmp@my_recursive_snapshot': more recent snapshots exist
    use '-r' to force deletion of the following snapshots:
    mypool/var/tmp@after_cp
    mypool/var/tmp@diff_snapshot

Diese Warnung bedeutet, dass noch Schnappsch?sse zwischen dem momentanen
Stand des Datasets und dem Schnappschuss, zu dem der Benutzer
zur?ckrollen m?chte, existieren. Um das Zur?ckrollen durchzuf?hren,
m?ssen die Schnappsch?sse gel?scht werden. ZFS kann nicht alle
?nderungen zwischen verschiedenen Zust?nden eines Datasets verfolgen, da
Schnappsch?sse nur gelesen werden k?nnen. ZFS wird nicht die betroffenen
Schnappsch?sse l?schen, es sei denn, der Benutzer verwendet die Option
``-r``, um anzugeben, dass dies die gew?nschte Aktion ist. Falls dies
der Fall ist und die Konsequenzen alle dazwischenliegenden
Schnappsch?sse zu verlieren verstanden wurden, kann der Befehl abgesetzt
werden:

.. code:: screen

    # zfs rollback -r mypool/var/tmp@my_recursive_snapshot
    # zfs list -rt snapshot mypool/var/tmp
    NAME                                   USED  AVAIL  REFER  MOUNTPOINT
    mypool/var/tmp@my_recursive_snapshot     8K      -   152K  -
    % ls /var/tmp
    vi.recover

Die Ausgabe von ``zfs list -t snapshot`` best?tigt, dass die
dazwischenliegenden Schnappsch?sse als Ergebnis von ``zfs rollback -r``
entfernt wurden.

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

21.4.5.4. Individuelle Dateien aus Schnappsch?ssen wiederherstellen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Schnappsch?sse sind unter einem versteckten Verzeichnis unter dem
Eltern-Dataset eingeh?ngt: ``.zfs/snapshots/snapshotname``.
Standardm??ig werden diese Verzeichnisse nicht von einem gew?hnlichen
``ls -a`` angezeigt. Obwohl diese Verzeichnisse nicht angezeigt werden,
sind diese trotzdem vorhanden und der Zugriff darauf erfolgt wie auf
jedes andere Verzeichnis. Die Eigenschaft ``snapdir`` steuert, ob diese
Verzeichnisse beim Auflisten eines Verzeichnisses angezeigt werden oder
nicht. Das Einstellen der Eigenschaft auf den Wert ``visible`` erlaubt
es, diese in der Ausgabe von ``ls`` und anderen Kommandos, die mit
Verzeichnisinhalten umgehen k?nnen, anzuzeigen.

.. code:: screen

    # zfs get snapdir mypool/var/tmp
    NAME            PROPERTY  VALUE    SOURCE
    mypool/var/tmp  snapdir   hidden   default
    % ls -a /var/tmp
    .               ..              passwd          vi.recover
    # zfs set snapdir=visible mypool/var/tmp
    % ls -a /var/tmp
    .               ..              .zfs            passwd          vi.recover

Einzelne Dateien lassen sich einfach auf einen vorherigen Stand
wiederherstellen, indem diese aus dem Schnappschuss zur?ck in das
Eltern-Dataset kopiert werden. Die Verzeichnisstruktur unterhalb von
``.zfs/snapshot`` enth?lt ein Verzeichnis, das exakt wie der
Schnappschuss benannt ist, der zuvor angelegt wurde, um es einfacher zu
machen, diese zu identifizieren. Im n?chsten Beispiel wird angenommen,
dass eine Datei aus dem versteckten ``.zfs`` Verzeichnis durch kopieren
aus dem Schnappschuss, der die letzte Version dieser Datei enthielt,
wiederhergestellt wird:

.. code:: screen

    # rm /var/tmp/passwd
    % ls -a /var/tmp
    .               ..              .zfs            vi.recover
    # ls /var/tmp/.zfs/snapshot
    after_cp                my_recursive_snapshot
    # ls /var/tmp/.zfs/snapshot/after_cp
    passwd          vi.recover
    # cp /var/tmp/.zfs/snapshot/after_cp/passwd /var/tmp

Als ``ls .zfs/snapshot`` ausgef?hrt wurde, war die
``snapdir``-Eigenschaft m?glicherweise nicht auf hidden gesetzt,
trotzdem ist es immer noch m?glich, den Inhalt dieses Verzeichnisses
aufzulisten. Es liegt am Administrator zu entscheiden, ob diese
Verzeichnisse angezeigt werden soll. Es ist m?glich, diese f?r bestimmte
Datasets anzuzeigen und f?r andere zu verstecken. Das Kopieren von
Dateien oder Verzeichnissen aus diesem versteckten ``.zfs/snapshot``
Verzeichnis ist einfach genug. Jedoch f?hrt der umgekehrte Weg zu einem
Fehler:

.. code:: screen

    # cp /etc/rc.conf /var/tmp/.zfs/snapshot/after_cp/
    cp: /var/tmp/.zfs/snapshot/after_cp/rc.conf: Read-only file system

Der Fehler erinnert den Benutzer daran, dass Schnappsch?sse nur gelesen
aber nicht mehr ge?ndert werden k?nnen, nachdem diese angelegt wurden.
Es k?nnen keine Dateien in diese Schnappschuss-Verzeichnisse kopiert
oder daraus gel?scht werden, da dies sonst den Zustand des Datasets
ver?ndern w?rde, den sie repr?sentieren.

Schnappsch?sse verbrauchen Speicherplatz basierend auf der Menge an
?nderungen, die am Eltern-Dataset durchgef?hrt wurden, seit der Zeit als
der Schnappschuss erstellt wurde. Die Eigenschaft ``written`` eines
Schnappschusses verfolgt, wieviel Speicherplatz vom Schnappschuss belegt
wird.

Schnappsch?sse werden zerst?rt und der belegte Platz wieder freigegeben
durch den Befehl ``zfs destroy         dataset``\ @\ *``snapshot``*.
Durch hinzuf?gen von ``-r`` werden alle Schnappsch?sse rekursiv
gel?scht, die den gleichen Namen wie das Eltern-Dataset besitzen. Mit
der Option ``-n -v`` wird eine Liste von Schnappsch?ssen, die gel?scht
werden w?rden, zusammen mit einer gesch?tzten Menge an zur?ckgewonnenem
Speicherplatz angezeigt, ohne die eigentliche Zerst?roperation wirklich
durchzuf?hren.

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

21.4.6. Klone verwalten
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Klon ist eine Kopie eines Schnappschusses, der mehr wie ein
regul?res Dataset behandelt wird. Im Gegensatz zu Schnappsch?ssen kann
man von einem Klon nicht nur lesen, er ist eingeh?ngt und kann seine
eigenen Eigenschaften haben. Sobald ein Klon mittels ``zfs clone``
erstellt wurde, l?sst sich der zugrundeliegende Schnappschuss nicht mehr
zerst?ren. Die Eltern-/Kindbeziehung zwischen dem Klon und dem
Schnappschuss kann ?ber ``zfs promote`` aufgel?st werden. Nachdem ein
Klon auf diese Weise bef?rdert wurde, wird der Schnappschuss zum Kind
des Klons, anstatt des urspr?nglichen Datasets. Dies wird die Art und
Weise, wie der Speicherplatz berechnet wird, ver?ndern, jedoch nicht den
bereits belegten Speicher anpassen. Der Klon kann an einem beliebigen
Punkt innerhalb der ZFS-Dateisystemhierarchie eingeh?ngt werden, nur
nicht unterhalb der urspr?nglichen Stelle des Schnappschusses.

Um diese Klon-Funktionalit?t zu demonstrieren, wird dieses
Beispiel-Dataset verwendet:

.. code:: screen

    # zfs list -rt all camino/home/joe
    NAME                    USED  AVAIL  REFER  MOUNTPOINT
    camino/home/joe         108K   1.3G    87K  /usr/home/joe
    camino/home/joe@plans    21K      -  85.5K  -
    camino/home/joe@backup    0K      -    87K  -

Ein typischer Einsatzzweck f?r Klone ist das experimentieren mit einem
bestimmten Dataset, w?hrend der Schnappschuss beibehalten wird f?r den
Fall, dass etwas schiefgeht. Da Schnappsch?sse nicht ver?ndert werden
k?nnen, wird ein Lese-/Schreibklon des Schnappschusses angelegt. Nachdem
das gew?nschte Ergebnis im Klon erreicht wurde, kann der Klon zu einem
Dataset ernannt und das alte Dateisystem entfernt werden. Streng
genommen ist das nicht n?tig, da der Klon und das Dataset ohne Probleme
miteinander koexistieren k?nnen.

.. code:: screen

    # zfs clone camino/home/joe@backup camino/home/joenew
    # ls /usr/home/joe*
    /usr/home/joe:
    backup.txz     plans.txt

    /usr/home/joenew:
    backup.txz     plans.txt
    # df -h /usr/home
    Filesystem          Size    Used   Avail Capacity  Mounted on
    usr/home/joe        1.3G     31k    1.3G     0%    /usr/home/joe
    usr/home/joenew     1.3G     31k    1.3G     0%    /usr/home/joenew

Nachdem ein Klon erstellt wurde, stellt er eine exakte Kopie des
Datasets zu dem Zeitpunkt dar, als der Schnappschuss angelegt wurde. Der
Klon kann nun unabh?ngig vom urspr?nglichen Dataset ge?ndert werden. Die
einzige Verbindung zwischen den beiden ist der Schnappschuss. ZFS
zeichnet diese Verbindung in der Eigenschaft namens ``origin`` auf.
Sobald die Abh?ngigkeit zwischen dem Schnappschuss und dem Klon durch
das Bef?rdern des Klons mittels ``zfs promote`` entfernt wurde, wird
auch die ``origin``-Eigenschaft des Klons entfernt, da es sich nun um
ein eigenst?ndiges Dataset handelt. Dieses Beispiel demonstriert dies:

.. code:: screen

    # zfs get origin camino/home/joenew
    NAME                  PROPERTY  VALUE                     SOURCE
    camino/home/joenew    origin    camino/home/joe@backup    -
    # zfs promote camino/home/joenew
    # zfs get origin camino/home/joenew
    NAME                  PROPERTY  VALUE   SOURCE
    camino/home/joenew    origin    -       -

Nachdem ein paar ?nderungen, wie beispielsweise das Kopieren von
``loader.conf`` auf den bef?rderten Klon vorgenommen wurden, wird das
alte Verzeichnis in diesem Fall ?berfl?ssig. Stattdessen kann der
bef?rderte Klon diesen ersetzen. Dies kann durch zwei
aufeinanderfolgende Befehl geschehen: ``zfs       destroy`` auf dem
alten Dataset und ``zfs       rename`` auf dem Klon, um diesen genauso
wie das alte Dataset zu benennen (es kann auch einen ganz anderen Namen
erhalten).

.. code:: screen

    # cp /boot/defaults/loader.conf /usr/home/joenew
    # zfs destroy -f camino/home/joe
    # zfs rename camino/home/joenew camino/home/joe
    # ls /usr/home/joe
    backup.txz     loader.conf     plans.txt
    # df -h /usr/home
    Filesystem          Size    Used   Avail Capacity  Mounted on
    usr/home/joe        1.3G    128k    1.3G     0%    /usr/home/joe

Der geklonte Schnappschuss wird jetzt wie ein gew?hnliches Dataset
behandelt. Es enth?lt alle Daten aus dem urspr?nglichen Schnappschuss
inklusive der Dateien, die anschlie?end hinzugef?gt wurden, wie
``loader.conf``. Klone k?nnen in unterschiedlichen Szenarien eingesetzt
werden, um n?tzliche Eigenschaften f?r ZFS-Anwender zur Verf?gung zu
stellen. Zum Beispiel k?nnen Jails als Schnappsch?sse bereitgestellt
werden, die verschiedene Arten von installierten Anwendungen anbieten.
Anwender k?nnen diese Schnappsch?sse klonen und ihre eigenen Anwendungen
nach Belieben hinzuf?gen. Sobald sie mit den ?nderungen zufrieden sind,
k?nnen die Klone zu vollst?ndigen Datasets ernannt werden und dem
Anwender zur Verf?gung gestellt werden, als w?rde es sich um echte
Datasets handeln. Das spart Zeit und Administrationsaufwand, wenn diese
Jails auf diese Weise zur Verf?gung gestellt werden.

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

21.4.7. Replikation
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Daten auf einem einzigen Pool an einem Platz aufzubewahren, setzt diese
dem Risiko aus, gestohlen oder Opfer von Naturgewalten zu werden, sowie
menschlichem Versagen auszusetzen. Regelm??ige Sicherungen des gesamten
Pools ist daher unerl?sslich. ZFS bietet eine Reihe von eingebauten
Serialisierungsfunktionen an, die in der Lage ist, eine Repr?sentation
der Daten als Datenstrom auf die Standardausgabe zu schreiben. Mit
dieser Methode ist es nicht nur m?glich, die Daten auf einen anderen
Pool zu schicken, der an das lokale System angeschlossen ist, sondern
ihn auch ?ber ein Netzwerk an ein anderes System zu senden.
Schnappsch?sse stellen daf?r die Replikationsbasis bereit (lesen Sie
dazu den Abschnitt zu `ZFS
snapshots <zfs-zfs.html#zfs-zfs-snapshot>`__). Die Befehle, die f?r die
Replikation verwendet werden, sind ``zfs send`` und ``zfs receive``.

Diese Beispiele demonstrieren die Replikation von ZFS anhand dieser
beiden Pools:

.. code:: screen

    # zpool list
    NAME    SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
    backup  960M    77K   896M     0%  1.00x  ONLINE  -
    mypool  984M  43.7M   940M     4%  1.00x  ONLINE  -

Der Pool namens *``mypool``* ist der prim?re Pool, auf den regelm??ig
Daten geschrieben und auch wieder gelesen werden. Ein zweiter Pool,
genannt *``backup``* wird verwendet, um als Reserve zu dienen im Falle,
dass der prim?re Pool nicht zur Verf?gung steht. Beachten Sie, dass
diese Ausfallsicherung nicht automatisch von ZFS durchgef?hrt wird,
sondern manuell von einem Systemadministrator bei Bedarf eingerichtet
werden muss. Ein Schnappschuss wird verwendet, um einen konsistenten
Zustand des Dateisystems, das repliziert werden soll, zu erzeugen.
Sobald ein Schnappschuss von *``mypool``* angelegt wurde, kann er auf
den *``backup``*-Pool abgelegt werden. Nur Schnappsch?sse lassen sich
auf diese Weise replizieren. ?nderungen, die seit dem letzten
Schnappschuss entstanden sind, werden nicht mit repliziert.

.. code:: screen

    # zfs snapshot mypool@backup1
    # zfs list -t snapshot
    NAME                    USED  AVAIL  REFER  MOUNTPOINT
    mypool@backup1             0      -  43.6M  -

Da nun ein Schnappschuss existiert, kann mit ``zfs send`` ein
Datenstrom, der den Inhalt des Schnappschusses repr?sentiert, erstellt
werden. Dieser Datenstrom kann als Datei gespeichert oder von einem
anderen Pool empfangen werden. Der Datenstrom wird auf die
Standardausgabe geschrieben, muss jedoch in eine Datei oder in eine Pipe
umgeleitet werden, sonst wird ein Fehler produziert:

.. code:: screen

    # zfs send mypool@backup1
    Error: Stream can not be written to a terminal.
    You must redirect standard output.

Um ein Dataset mit ``zfs send`` zu replizieren, leiten Sie dieses in
eine Datei auf dem eingeh?ngten Backup-Pool um. Stellen Sie sicher, dass
der Pool genug freien Speicherplatz besitzt, um die Gr??e des gesendeten
Schnappschusses aufzunehmen. Das beinhaltet alle Daten im Schnappschuss,
nicht nur die ?nderungen zum vorherigen Schnappschuss.

.. code:: screen

    # zfs send mypool@backup1 > /backup/backup1
    # zpool list
    NAME    SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
    backup  960M  63.7M   896M     6%  1.00x  ONLINE  -
    mypool  984M  43.7M   940M     4%  1.00x  ONLINE  -

Das Kommando ``zfs send`` transferierte alle Daten im
*``backup1``*-Schnappschuss auf den Pool namens *``backup``*. Erstellen
und senden eines Schnappschusses kann automatisch von
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
durchgef?hrt werden.

Anstatt die Sicherungen als Archivdateien zu speichern, kann ZFS diese
auch als aktives Dateisystem empfangen, was es erlaubt, direkt auf die
gesicherten Daten zuzugreifen. Um an die eigentlichen Daten in diesem
Strom zu gelangen, wird ``zfs receive`` benutzt, um den Strom wieder in
Dateien und Verzeichnisse umzuwandeln. Das Beispiel unten kombiniert
``zfs send`` und ``zfs receive`` durch eine Pipe, um die Daten von einem
Pool auf den anderen zu kopieren. Die Daten k?nnen direkt auf dem
empfangenden Pool verwendet werden, nachdem der Transfer abgeschlossen
ist. Ein Dataset kann nur auf ein leeres Dataset repliziert werden.

.. code:: screen

    # zfs snapshot mypool@replica1
    # zfs send -v mypool@replica1 | zfs receive backup/mypool
    send from @ to mypool@replica1 estimated size is 50.1M
    total estimated size is 50.1M
    TIME        SENT   SNAPSHOT

    # zpool list
    NAME    SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
    backup  960M  63.7M   896M     6%  1.00x  ONLINE  -
    mypool  984M  43.7M   940M     4%  1.00x  ONLINE  -

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

21.4.7.1. Inkrementelle Sicherungen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Unterschiede zwischen zwei Schnappsch?ssen kann ``zfs send``
ebenfalls erkennen und nur diese ?bertragen. Dies spart Speicherplatz
und ?bertragungszeit. Beispielsweise:

.. code:: screen

    # zfs snapshot mypool@replica2
    # zfs list -t snapshot
    NAME                    USED  AVAIL  REFER  MOUNTPOINT
    mypool@replica1         5.72M      -  43.6M  -
    mypool@replica2             0      -  44.1M  -
    # zpool list
    NAME    SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
    backup  960M  61.7M   898M     6%  1.00x  ONLINE  -
    mypool  960M  50.2M   910M     5%  1.00x  ONLINE  -

Ein zweiter Schnappschuss genannt *``replica2``* wurde angelegt. Dieser
zweite Schnappschuss enth?lt nur die ?nderungen, die zwischen dem
jetzigen Stand des Dateisystems und dem vorherigen Schnappschuss,
*``replica1``*, vorgenommen wurden. Durch ``zfs send -i`` und die Angabe
des Schnappschusspaares wird ein inkrementeller Replikationsstrom
erzeugt, welcher nur die Daten enth?lt, die sich ge?ndert haben. Das
kann nur erfolgreich sein, wenn der initiale Schnappschuss bereits auf
der Empf?ngerseite vorhanden ist.

.. code:: screen

    # zfs send -v -i mypool@replica1 mypool@replica2 | zfs receive /backup/mypool
    send from @replica1 to mypool@replica2 estimated size is 5.02M
    total estimated size is 5.02M
    TIME        SENT   SNAPSHOT

    # zpool list
    NAME    SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
    backup  960M  80.8M   879M     8%  1.00x  ONLINE  -
    mypool  960M  50.2M   910M     5%  1.00x  ONLINE  -

    # zfs list
    NAME                         USED  AVAIL  REFER  MOUNTPOINT
    backup                      55.4M   240G   152K  /backup
    backup/mypool               55.3M   240G  55.2M  /backup/mypool
    mypool                      55.6M  11.6G  55.0M  /mypool

    # zfs list -t snapshot
    NAME                                         USED  AVAIL  REFER  MOUNTPOINT
    backup/mypool@replica1                       104K      -  50.2M  -
    backup/mypool@replica2                          0      -  55.2M  -
    mypool@replica1                             29.9K      -  50.0M  -
    mypool@replica2                                 0      -  55.0M  -

Der inkrementelle Datenstrom wurde erfolgreich ?bertragen. Nur die
Daten, die ver?ndert wurden, sind ?bertragen worden, anstatt das
komplette *``replica1``*. Nur die Unterschiede wurden gesendet, was
weniger Zeit und Speicherplatz in Anspruch genommen hat, statt jedesmal
den gesamten Pool zu kopieren. Das ist hilfreich wenn langsame Netzwerke
oder Kosten f?r die ?bertragene Menge Bytes in Erw?gung gezogen werden
m?ssen.

Ein neues Dateisystem, *``backup/mypool``*, ist mit allen Dateien und
Daten vom Pool *``mypool``* verf?gbar. Wenn die Option ``-P`` angegeben
wird, werden die Eigenschaften des Datasets kopiert, einschlie?lich der
Komprimierungseinstellungen, Quotas und Einh?ngepunkte. Wird die Option
``-R`` verwendet, so werden alle Kind-Datasets des angegebenen Datasets
kopiert, zusammen mit ihren Eigenschaften. Senden und Empfangen kann
automatisiert werden, so dass regelm??ig Sicherungen auf dem zweiten
Pool angelegt werden.

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

21.4.7.2. Verschl?sselte Sicherungen ?ber SSH senden
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Datenstr?me ?ber das Netzwerk zu schicken ist eine gute Methode, um
Sicherungen au?erhalb des Systems anzulegen. Jedoch ist dies auch mit
einem Nachteil verbunden. Daten, die ?ber die Leitung verschickt werden,
sind nicht verschl?sselt, was es jedem erlaubt, die Daten abzufangen und
die Str?me wieder zur?ck in Daten umzuwandeln, ohne dass der sendende
Benutzer davon etwas merkt. Dies ist eine unerw?nschte Situation,
besonders wenn die Datenstr?me ?ber das Internet auf ein entferntes
System gesendet werden. SSH kann benutzt werden, um durch
Verschl?sselung gesch?tzte Daten ?ber eine Netzwerkverbindung zu
?bertragen. Da ZFS nur die Anforderung hat, dass der Strom von der
Standardausgabe umgeleitet wird, ist es relativ einfach, diesen durch
SSH zu leiten. Um den Inhalt des Dateisystems w?hrend der ?bertragung
und auf dem entfernten System weiterhin verschl?sselt zu lassen, denken
Sie ?ber den Einsatz von `PEFS <http://wiki.freebsd.org/PEFS>`__ nach.

Ein paar Einstellungen und Sicherheitsvorkehrungen m?ssen zuvor
abgeschlossen sein. Es werden hier nur die n?tigen Schritte f?r die
``zfs send``-Aktion gezeigt. Weiterf?hrende Informationen zu SSH, gibt
es im Kapitel `Abschnitt?15.10, „OpenSSH“ <openssh.html>`__.

Die folgende Konfiguration wird ben?tigt:

.. raw:: html

   <div class="itemizedlist">

-  Passwortloser SSH-Zugang zwischen dem sendenden und dem empfangenden
   Host durch den Einsatz von SSH-Schl?sseln.

-  Normalerweise werden die Privilegien des ``root``-Benutzers
   gebraucht, um Strom zu senden und zu empfangen. Das beinhaltet das
   Anmelden auf dem empfangenden System als ``root``. Allerdings ist das
   Anmelden als ``root`` aus Sicherheitsgr?nden standardm??ig
   deaktiviert. Mit `ZFS Delegation <zfs-zfs-allow.html>`__ lassen sich
   nicht-\ ``root``-Benutzer auf jedem System einrichten, welche die
   n?tigen Rechte besitzen, um die Sende- und Empfangsoperation
   durchzuf?hren.

-  Auf dem sendenden System:

   .. code:: screen

       # zfs allow -u someuser send,snapshot mypool

-  Um den Pool einzuh?ngen, muss der unprivilegierte Benutzer das
   Verzeichnis besitzen und gew?hnliche Benutzern muss die Erlaubnis
   gegeben werden, das Dateisystem einzuh?ngen. Auf dem empfangenden
   System nehmen Sie dazu die folgenden Einstellungen vor:

   .. code:: screen

       # sysctl vfs.usermount=1
       vfs.usermount: 0 -> 1
       # echo vfs.usermount=1 >> /etc/sysctl.conf
       # zfs create recvpool/backup
       # zfs allow -u someuser create,mount,receive recvpool/backup
       # chown someuser /recvpool/backup

.. raw:: html

   </div>

Der unprivilegierte Benutzer hat jetzt die F?higkeit, Datasets zu
empfangen und einzuh?ngen und das *``home``*-Dataset auf das entfernte
System zu replizieren:

.. code:: screen

    % zfs snapshot -r mypool/home@monday
    % zfs send -R mypool/home@monday | ssh someuser@backuphost zfs recv -dvu recvpool/backup

Ein rekursiver Schnappschuss namens *``monday``* wird aus dem Dataset
*``home``* erstellt, dass auf dem Pool *``mypool``* liegt. Es wird dann
mit ``zfs send -R`` gesendet, um das Dataset, alle seine Kinder,
Schnappsch?sse, Klone und Einstellungen in den Strom mit aufzunehmen.
Die Ausgabe wird an das wartende System *``backuphost``* mittels
``zfs receive`` durch SSH umgeleitet. Die Verwendung des Fully Qulified
Dom?nennamens oder der IP-Adresse wird empfohlen. Die empfangende
Maschine schreibt die Daten auf das *``backup``*-Dataset im
*``recvpool``*-Pool. Hinzuf?gen der Option ``-d`` zu ``zfs recv``
?berschreibt den Namen des Pools auf der empfangenden Seite mit dem
Namen des Schnappschusses. Durch Angabe von ``-u`` wird das Dateisystem
nicht auf der Empf?ngerseite eingeh?ngt. Wenn ``-v`` enthalten ist,
werden mehr Details zum Transfer angezeigt werden, einschlie?lich der
vergangenen Zeit und der Menge an ?bertragenen Daten.

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

21.4.8. Dataset-, Benutzer- und Gruppenquotas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`Dataset-Quotas <zfs-term.html#zfs-term-quota>`__ werden eingesetzt, um
den Speicherplatz einzuschr?nken, den ein bestimmtes Dataset verbrauchen
kann. `Referenz-Quotas <zfs-term.html#zfs-term-refquota>`__
funktionieren auf eine ?hnliche Weise, jedoch wird dabei der
Speicherplatz des Datasets selbst gez?hlt, wobei Schnappsch?sse und
Kind-Datasets dabei ausgenommen sind. ?hnlich dazu werden
`Benutzer <zfs-term.html#zfs-term-userquota>`__- und
`Gruppen <zfs-term.html#zfs-term-groupquota>`__-Quotas dazu verwendet,
um Benutzer oder Gruppen daran zu hindern, den gesamten Speicherplatz im
Pool oder auf dem Dataset zu verbrauchen.

Um ein 10?GB gro?es Quota auf dem Dataset ``storage/home/bob`` zu
erzwingen, verwenden Sie folgenden Befehl:

.. code:: screen

    # zfs set quota=10G storage/home/bob

Um ein Referenzquota von 10?GB f?r ``storage/home/bob`` festzulegen,
geben Sie ein:

.. code:: screen

    # zfs set refquota=10G storage/home/bob

Um das Quota f?r ``storage/home/bob`` wieder zu entfernen:

.. code:: screen

    # zfs set quota=none storage/home/bob

Das generelle Format ist ``userquota@user``\ =\ *``size``* und der Name
des Benutzers muss in einem der folgenden Formate vorliegen:

.. raw:: html

   <div class="itemizedlist">

-  POSIX-kompatibler Name wie *``joe``*.

-  POSIX-numerische ID wie *``789``*.

-  SID-Name wie *``joe.bloggs@example.com``*.

-  SID-numerische ID wie *``S-1-123-456-789``*.

.. raw:: html

   </div>

Um beispielsweise ein Benutzerquota von 50?GB f?r den Benutzer names
*``joe``* zu erzwingen:

.. code:: screen

    # zfs set userquota@joe=50G

Um jegliche Quotas zu entfernen:

.. code:: screen

    # zfs set userquota@joe=none

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Benutzerquota-Eigenschaften werden nicht von ``zfs get all``
dargestellt. Nicht-\ ``root``-Benutzer k?nnen nur ihre eigenen Quotas
sehen, ausser ihnen wurde das ``userquota``-Privileg zugeteilt. Benutzer
mit diesem Privileg sind in der Lage, jedermanns Quota zu sehen und zu
ver?ndern.

.. raw:: html

   </div>

Das generelle Format zum Festlegen einer Gruppenquota lautet:
``groupquota@group``\ =\ *``size``*.

Um ein Quota f?r die Gruppe *``firstgroup``* von 50?GB zu setzen, geben
Sie ein:

.. code:: screen

    # zfs set groupquota@firstgroup=50G

Um eine Quota f?r die Gruppe *``firstgroup``*\ zu setzen oder
sicherzustellen, dass diese nicht gesetzt ist, verwenden Sie
stattdessen:

.. code:: screen

    # zfs set groupquota@firstgroup=none

Genau wie mit der Gruppenquota-Eigenschaft, werden
nicht-\ ``root``-Benutzer nur die Quotas sehen, die den Gruppen
zugeordnet ist, in denen Sie Mitglied sind. Allerdings ist ``root`` oder
ein Benutzer mit dem ``groupquota``-Privileg in der Lage, die Quotas
aller Gruppen zu sehen und festzusetzen.

Um die Menge an Speicherplatz zusammen mit der Quota anzuzeigen, die von
jedem Benutzer auf dem Dateisystem oder Schnappschuss verbraucht wird,
verwenden Sie ``zfs userspace``. F?r Gruppeninformationen, nutzen Sie
``zfs groupspace``. F?r weitere Informationen zu unterst?tzten Optionen
oder wie sich nur bestimmte Optionen anzeigen lassen, lesen Sie
`zfs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=1>`__.

Benutzer mit ausreichenden Rechten sowie ``root`` k?nnen das Quota f?r
``storage/home/bob`` anzeigen lassen:

.. code:: screen

    # zfs get quota storage/home/bob

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

21.4.9. Reservierungen
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`Reservierungen <zfs-term.html#zfs-term-reservation>`__ garantieren ein
Minimum an Speicherplatz, der immer auf dem Dataset verf?gbar sein wird.
Der reservierte Platz wird nicht f?r andere Datasets zur Verf?gung
stehen. Diese Eigenschaft kann besonders n?tzlich sein, um zu
gew?hrleisten, dass freier Speicherplatz f?r ein wichtiges Dataset oder
f?r Logdateien bereit steht.

Das generelle Format der ``reservation``-Eigenschaft ist
``reservation=size``. Um also eine Reservierung von 10?GB auf
``storage/home/bob`` festzulegen, geben Sie Folgendes ein:

.. code:: screen

    # zfs set reservation=10G storage/home/bob

Um die Reservierung zu beseitigen:

.. code:: screen

    # zfs set reservation=none storage/home/bob

Das gleiche Prinzip kann auf die ``refreservation``-Eigenschaft
angewendet werden, um eine
`Referenzreservierung <zfs-term.html#zfs-term-refreservation>`__ mit dem
generellen Format ``refreservation=size`` festzulegen.

Dieser Befehl zeigt die Reservierungen oder Referenzreservierungen an,
die auf ``storage/home/bob`` existieren:

.. code:: screen

    # zfs get reservation storage/home/bob
    # zfs get refreservation storage/home/bob

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

21.4.10. Komprimierung
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ZFS bietet transparente Komprimierung. Datenkomprimierung auf Blockebene
w?hrend diese gerade geschrieben werden, spart nicht nur Plattenplatz
ein, sondern kann auch den Durchsatz der Platte steigern. Falls Daten zu
25% komprimiert sind, jedoch die komprimierten Daten im gleichen Tempo
wie ihre unkomprimierte Version, resultiert das in einer effektiven
Schreibgeschwindigkeit von 125%. Komprimierung kann auch eine
Alternative zu `Deduplizierung <zfs-zfs.html#zfs-zfs-deduplication>`__
darstellen, da es viel weniger zus?tzlichen Hauptspeicher ben?tigt.

ZFS bietet mehrere verschiedene Kompressionsalgorithmen an, jede mit
unterschiedlichen Kompromissen. Mit der Einf?hrung von LZ4-Komprimierung
in ZFS v5000, ist es m?glich, Komprimierung f?r den gesamten Pool zu
aktivieren, ohne die gro?en Geschwindigkeitseinbu?en der anderen
Algorithmen. Der gr??te Vorteil von LZ4 ist die Eigenschaft *fr?her
Abbruch*. Wenn LZ4 nicht mindestens 12,5% Komprimierung im ersten Teil
der Daten erreicht, wird der Block unkomprimiert geschrieben, um die
Verschwendung von CPU-Zyklen zu vermeiden, weil die Daten entweder
bereits komprimiert sind oder sich nicht komprimieren lassen. F?r
Details zu den verschiedenen verf?gbaren Komprimierungsalgorithmen in
ZFS, lesen Sie den Eintrag
`Komprimierung <zfs-term.html#zfs-term-compression>`__ im Abschnitt
Terminologie

Der Administrator kann die Effektivit?t der Komprimierung ?ber eine
Reihe von Dataset-Eigenschaften ?berwachen.

.. code:: screen

    # zfs get used,compressratio,compression,logicalused mypool/compressed_dataset
    NAME        PROPERTY          VALUE     SOURCE
    mypool/compressed_dataset  used              449G      -
    mypool/compressed_dataset  compressratio     1.11x     -
    mypool/compressed_dataset  compression       lz4       local
    mypool/compressed_dataset  logicalused       496G      -

Dieses Dataset verwendet gerade 449?GB Plattenplatz (used-Eigenschaft.
Ohne Komprimierung w?rde es stattdessen 496?GB Plattenplatz belegen
(``logicalused``). Das ergibt eine Kompressionsrate von 1,11:1.

Komprimierung kann einen unerwarteten Nebeneffekt haben, wenn diese mit
`Benutzerquotas <zfs-term.html#zfs-term-userquota>`__ kombiniert wird.
Benutzerquotas beschr?nken, wieviel Speicherplatz ein Benutzer auf einem
Dataset verbrauchen kann. Jedoch basieren die Berechnungen darauf,
wieviel Speicherplatz *nach der Komprimierung* belegt ist. Wenn also ein
Benutzer eine Quota von10?GB besitzt und 10?GB von komprimierbaren Daten
schreibt, wird dieser immer noch in der Lage sein, zus?tzliche Daten zu
speichern. Wenn sp?ter eine Datei aktualisiert wird, beispielsweise eine
Datenbank, mit mehr oder weniger komprimierbaren Daten, wird sich die
Menge an verf?gbarem Speicherplatz ?ndern. Das kann in einer
merkw?rdigen Situation resultieren, in welcher der Benutzer nicht die
eigentliche Menge an Daten (die Eigenschaft ``logicalused``)
?berschreitet, jedoch die ?nderung in der Komprimierung dazu f?hrt, dass
das Quota-Limit erreicht ist.

Kompression kann ebenso unerwartet mit Sicherungen interagieren. Quotas
werden oft verwendet, um einzuschr?nken, wieviele Daten gespeichert
werden k?nnen um sicherzustellen, dass ausreichend Speicherplatz f?r die
Sicherung vorhanden ist. Wenn jedoch Quotas Komprimierung nicht
ber?cksichtigen, werden wom?glich mehr Daten geschrieben als in der
unkomprimierten Sicherung Platz ist.

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

21.4.11. Deduplizierung
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn aktiviert, verwendet
`Deduplizierung <zfs-term.html#zfs-term-deduplication>`__ die Pr?fsumme
jedes Blocks, um Duplikate dieses Blocks zu ermitteln. Sollte ein neuer
Block ein Duplikat eines existierenden Blocks sein, dann schreibt ZFS
eine zus?tzliche Referenz auf die existierenden Daten anstatt des
kompletten duplizierten Blocks. Gewaltige Speicherplatzeinsparungen sind
m?glich wenn die Daten viele Duplikate von Dateien oder wiederholte
Informationen enthalten. Seien Sie gewarnt: Deduplizierung ben?tigt eine
extrem gro?e Menge an Hauptspeicher und die meistens Einsparungen k?nnen
stattdessen durch das Aktivieren von Komprimierung erreicht werden.

Um Deduplizierung zu aktivieren, setzen Sie die ``dedup``-Eigenschaft
auf dem Zielpool:

.. code:: screen

    # zfs set dedup=on pool

Nur neu auf den Pool geschriebene Daten werden dedupliziert. Daten, die
bereits auf den Pool geschrieben wurden, werden nicht durch das
Aktivieren dieser Option dedupliziert. Ein Pool mit einer gerade
aktivierten Deduplizierung wird wie in diesem Beispiel aussehen:

.. code:: screen

    # zpool list
    NAME  SIZE ALLOC  FREE CAP DEDUP HEALTH ALTROOT
    pool 2.84G 2.19M 2.83G  0% 1.00x ONLINE -

Die Spalte ``DEDUP`` zeigt das aktuelle Verh?ltnis der Deduplizierung
f?r diesen Pool an. Ein Wert von ``1.00x`` zeigt an, dass die Daten noch
nicht dedupliziert wurden. Im n?chsten Beispiel wird die Ports-Sammlung
dreimal in verschiedene Verzeichnisse auf dem deduplizierten Pool
kopiert.

.. code:: screen

    # zpool list
    for d in dir1 dir2 dir3; do
    for> mkdir $d && cp -R /usr/ports $d &
    for> done

Redundante Daten werden erkannt und dedupliziert:

.. code:: screen

    # zpool list
    NAME SIZE  ALLOC FREE CAP DEDUP HEALTH ALTROOT
    pool 2.84G 20.9M 2.82G 0% 3.00x ONLINE -

Die ``DEDUP``-Spalte zeigt einen Faktor von ``3.00x``. Mehrere Kopien
der Ports-Sammlung wurden erkannt und dedupliziert, was nur ein Drittel
des Speicherplatzes ben?tigt. Das Potential f?r Einsparungen beim
Speicherplatz ist enorm, wird jedoch damit erkauft, dass gen?gend
Speicher zur Verf?gung stehen muss, um die deduplizierten Bl?cke zu
verwalten.

Deduplizierung ist nicht immer gewinnbringend, besonders wenn die Daten
auf dem Pool nicht redundant sind. ZFS kann potentielle
Speicherplatzeinsparungen durch Deduplizierung auf einem Pool
simulieren:

.. code:: screen

    # zdb -S pool
    Simulated DDT histogram:

    bucket              allocated                       referenced
    ______   ______________________________   ______________________________
    refcnt   blocks   LSIZE   PSIZE   DSIZE   blocks   LSIZE   PSIZE   DSIZE
    ------   ------   -----   -----   -----   ------   -----   -----   -----
         1    2.58M    289G    264G    264G    2.58M    289G    264G    264G
         2     206K   12.6G   10.4G   10.4G     430K   26.4G   21.6G   21.6G
         4    37.6K    692M    276M    276M     170K   3.04G   1.26G   1.26G
         8    2.18K   45.2M   19.4M   19.4M    20.0K    425M    176M    176M
        16      174   2.83M   1.20M   1.20M    3.33K   48.4M   20.4M   20.4M
        32       40   2.17M    222K    222K    1.70K   97.2M   9.91M   9.91M
        64        9     56K   10.5K   10.5K      865   4.96M    948K    948K
       128        2   9.50K      2K      2K      419   2.11M    438K    438K
       256        5   61.5K     12K     12K    1.90K   23.0M   4.47M   4.47M
        1K        2      1K      1K      1K    2.98K   1.49M   1.49M   1.49M
     Total    2.82M    303G    275G    275G    3.20M    319G    287G    287G

    dedup = 1.05, compress = 1.11, copies = 1.00, dedup * compress / copies = 1.16

Nachdem ``zdb -S`` die Analyse des Pool abgeschlossen hat, zeigt es die
Speicherplatzeinsparungen, die durch aktivierte Deduplizierung
erreichbar sind, an. In diesem Fall ist ``1.16`` ein sehr schlechter
Faktor, der gr??tenteils von Einsparungen durch Komprimierung
beeinflusst wird. Aktivierung von Deduplizierung auf diesem Pool w?rde
also keine signifikante Menge an Speicherplatz einsparen und ist daher
nicht die Menge an Speicher wert, die n?tig sind, um zu deduplizieren.
?ber die Formel *ratio = dedup \* compress / copies* kann ein
Systemadministrator die Speicherplatzbelegung planen und entscheiden, ob
es sich lohnt, den zus?tzlichen Hauptspeicher f?r die Deduplizierung
anhand des sp?teren Workloads aufzuwenden. Wenn sich die Daten
verh?ltnism??ig gut komprimieren lassen, sind die
Speicherplatzeinsparungen sehr gut. Es wird empfohlen, in dieser
Situation zuerst die Komprimierung zu aktivieren, da diese auch erh?hte
Geschwindigkeit mit sich bringt. Aktivieren Sie Deduplizierung nur in
solchen F?llen, bei denen die Einsparungen betr?chtlich sind und genug
Hauptspeicher zur Verf?gung steht, um die
`DDT <zfs-term.html#zfs-term-deduplication>`__ aufzunehmen.

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

21.4.12. ZFS und Jails
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um ein ZFS-Dataset einem `Jail <jails.html>`__ zuzuweisen, wird der
Befehl ``zfs jail`` und die dazugeh?rige Eigenschaft ``jailed``
verwendet. Durch Angabe von ``zfs jail jailid`` wird ein Dataset dem
spezifizierten Jail zugewiesen und kann mit ``zfs unjail`` wieder
abgeh?ngt werden. Damit das Dataset innerhalb der Jail kontrolliert
werden kann, muss die Eigenschaft ``jailed`` gesetzt sein. Sobald ein
Dataset sich im Jail befindet, kann es nicht mehr l?nger auf dem
Hostsystem eingeh?ngt werden, da es Einh?ngepunkte aufweisen k?nnte,
welche die Sicherheit des Systems gef?hrden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <zfs-zpool.html>`__?      | `Nach oben <zfs.html>`__      | ?\ `Weiter <zfs-zfs-allow.html>`__   |
+-----------------------------------+-------------------------------+--------------------------------------+
| 21.3. ``zpool`` Administration?   | `Zum Anfang <index.html>`__   | ?21.5. Delegierbare Administration   |
+-----------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
