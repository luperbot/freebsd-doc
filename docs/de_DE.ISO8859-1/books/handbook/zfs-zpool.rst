==========================
21.3. zpool Administration
==========================

.. raw:: html

   <div class="navheader">

21.3. ``zpool`` Administration
`Zur?ck <zfs-quickstart.html>`__?
Kapitel 21. Das Z-Dateisystem (ZFS)
?\ `Weiter <zfs-zfs.html>`__

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

21.3. ``zpool`` Administration
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Administration von ZFS ist unterteilt zwischen zwei Hauptkommandos. Das
``zpool``-Werkzeug steuert die Operationen des Pools und k?mmert sich um
das Hinzuf?gen, entfernen, ersetzen und verwalten von Platten. Mit dem
```zfs`` <zfs-zfs.html>`__-Befehl k?nnen Datasets erstellt, zerst?rt und
verwaltet werden, sowohl
`Dateisysteme <zfs-term.html#zfs-term-filesystem>`__ als auch
`Volumes <zfs-term.html#zfs-term-volume>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

21.3.1. Pools anlegen und zerst?ren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einen ZFS-Pool (*zpool*) anzulegen beinhaltet das Treffen von einer
Reihe von Entscheidungen, die relativ dauerhaft sind, weil die Struktur
des Pools nachdem er angelegt wurde, nicht mehr ge?ndert werden kann.
Die wichtigste Entscheidung ist, welche Arten von vdevs als physische
Platten zusammengefasst werden soll. Sehen Sie sich dazu die Liste von
`vdev-Arten <zfs-term.html#zfs-term-vdev>`__ an, um Details zu m?glichen
Optionen zu bekommen. Nachdem der Pool angelegt wurde, erlauben die
meisten vdev-Arten es nicht mehr, weitere Ger?te zu diesem vdev
hinzuzuf?gen. Die Ausnahme sind Spiegel, die das Hinzuf?gen von weiteren
Platten zum vdev gestatten, sowie stripes, die zu Spiegeln umgewandelt
werden k?nnen, indem man zus?tzliche Platten zum vdev anh?ngt. Obwohl
weitere vdevs eingef?gt werden k?nnen, um einen Pool zu vergr??ern, kann
das Layout des Pools nach dem Anlegen nicht mehr ver?ndert werden.
Stattdessen m?ssen die Daten gesichert, der Pool zerst?rt und danach neu
erstellt werden.

Erstellen eines einfachen gespiegelten Pools:

.. code:: screen

    # zpool create mypool mirror /dev/ada1 /dev/ada2
    # zpool status
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada1    ONLINE       0     0     0
                ada2    ONLINE       0     0     0

    errors: No known data errors

Mehrere vdevs k?nnen gleichzeitig angelegt werden. Geben Sie zus?tzliche
Gruppen von Platten, getrennt durch das vdev-Typ Schl?sselwort, in
diesem Beispiel ``mirror``, an:

.. code:: screen

    # zpool create mypool mirror /dev/ada1 /dev/ada2 mirror /dev/ada3 /dev/ada4
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada1    ONLINE       0     0     0
                ada2    ONLINE       0     0     0
              mirror-1  ONLINE       0     0     0
                ada3    ONLINE       0     0     0
                ada4    ONLINE       0     0     0

    errors: No known data errors

Pools lassen sich auch durch die Angabe von Partitionen anstatt von
ganzen Platten erzeugen. Durch die Verwendung von ZFS in einer separaten
Partition ist es m?glich, dass die gleiche Platte andere Partitionen f?r
andere Zwecke besitzen kann. Dies ist besonders von Interesse, wenn
Partitionen mit Bootcode und Dateisysteme, die zum starten ben?tigt
werden, hinzugef?gt werden k?nnen. Das erlaubt es, von Platten zu
booten, die auch Teil eines Pools sind. Es gibt keinen
Geschwindigkeitsnachteil unter FreeBSD wenn eine Partition anstatt einer
ganzen Platte verwendet wird. Durch den Einsatz von Partitionen kann der
Administrator die Platten *unter provisionieren*, indem weniger als die
volle Kapazit?t Verwendung findet. Wenn in Zukunft eine Ersatzfestplatte
mit der gleichen Gr??e als die Originalplatte eine kleinere Kapazit?t
aufweist, passt die kleinere Partition immer noch und die Ersatzplatte
kann immer noch verwendet werden.

Erstellen eines `RAID-Z2 <zfs-term.html#zfs-term-vdev-raidz>`__-Pools
mit Partitionen:

.. code:: screen

    # zpool create mypool raidz2 /dev/ada0p3 /dev/ada1p3 /dev/ada2p3 /dev/ada3p3 /dev/ada4p3 /dev/ada5p3
    # zpool status
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              raidz2-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0
                ada3p3  ONLINE       0     0     0
                ada4p3  ONLINE       0     0     0
                ada5p3  ONLINE       0     0     0

    errors: No known data errors

Ein Pool, der nicht l?nger ben?tigt wird, kann zerst?rt werden, so dass
die Platten f?r einen anderen Einsatzzweck Verwendung finden k?nnen. Um
einen Pool zu zerst?ren, m?ssen zuerst alle Datasets in diesem Pool
abgeh?ngt werden. Wenn die Datasets verwendet werden, wird das Abh?ngen
fehlschlagen und der Pool nicht zerst?rt. Die Zerst?rung des Pools kann
erzwungen werden durch die Angabe der Option ``-f``, jedoch kann dies
undefiniertes Verhalten in den Anwendungen ausl?sen, die noch offene
Dateien auf diesen Datasets hatten.

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

21.3.2. Hinzuf?gen und L?schen von Ger?ten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei F?lle f?r das Hinzuf?gen von Platten zu einem Pool:
einh?ngen einer Platte zu einem existierenden vdev mit ``zpool attach``
oder einbinden von vdevs zum Pool mit ``zpool add``. Nur manche
`vdev-Arten <zfs-term.html#zfs-term-vdev>`__ gestatten es, Platten zum
vdev hinzuzuf?gen, nachdem diese angelegt wurden.

Ein Pool mit nur einer einzigen Platte besitzt keine Redundanz.
Datenverf?lschung kann erkannt, aber nicht repariert werden, weil es
keine weiteren Kopien der Daten gibt. Die Eigenschaft
`copies <zfs-term.html#zfs-term-copies>`__ kann genutzt werden, um einen
geringen Fehler wie einen besch?digtem Sektor auszumerzen, enth?lt aber
nicht die gleiche Art von Schutz, die Spiegelung oder RAID-Z bieten.
Wenn man mit einem Pool startet, der nur aus einer einzigen vdev-Platte
besteht, kann mit dem Kommando ``zpool attach`` eine zust?tzliche Platte
dem vdev hinzugef?gt werden, um einen Spiegel zu erzeugen. Mit
``zpool attach`` k?nnen auch zus?tzliche Platten zu einer Spiegelgruppe
eingef?gt werden, was die Redundanz und Lesegeschwindigkeit steigert.
Wenn die Platten, aus denen der Pool besteht, partitioniert sind,
replizieren Sie das Layout der ersten Platte auf die Zweite. Verwenden
Sie dazu ``gpart backup`` und ``gpart restore``, um diesen Vorgang
einfacher zu gestalten.

Umwandeln eines (stripe) vdevs namens *``ada0p3``* mit einer einzelnen
Platte zu einem Spiegel durch das Einh?ngen von *``ada1p3``*:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              ada0p3    ONLINE       0     0     0

    errors: No known data errors
    # zpool attach mypool ada0p3 ada1p3
    Make sure to wait until resilver is done before rebooting.

    If you boot from pool 'mypool', you may need to update
    boot code on newly attached disk 'ada1p3'.

    Assuming you use GPT partitioning und 'da0' is your new boot disk
    you may use the following command:

            gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 da0
    # gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada1
    bootcode written to ada1
    # zpool status
      pool: mypool
     state: ONLINE
    status: One or more devices is currently being resilvered.  The pool will
            continue to function, possibly in a degraded state.
    action: Wait for the resilver to complete.
      scan: resilver in progress since Fri May 30 08:19:19 2014
            527M scanned out of 781M at 47.9M/s, 0h0m to go
            527M resilvered, 67.53% done
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0  (resilvering)

    errors: No known data errors
    # zpool status
      pool: mypool
     state: ONLINE
      scan: resilvered 781M in 0h0m with 0 errors on Fri May 30 08:15:58 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0

    errors: No known data errors

Wenn das Hinzuf?gen von Platten zu einem vdev keine Option wie f?r
RAID-Z ist, gibt es eine Alternative, n?mlich einen anderen vdev zum
Pool hinzuzuf?gen. Zus?tzliche vdevs bieten h?here Geschwindigkeit,
indem Schreibvorg?nge ?ber die vdevs verteilt werden. Jedes vdev ist
daf?r verantwortlich, seine eigene Redundanz sicherzustellen. Es ist
m?glich, aber nicht empfehlenswert, vdev-Arten zu mischen, wie zum
Beispiel ``mirror`` und ``RAID-Z``. Durch das Einf?gen eines
nicht-redundanten vdev zu einem gespiegelten Pool oder einem RAID-Z vdev
riskiert man die Daten des gesamten Pools. Schreibvorg?nge werden
verteilt, deshalb ist der Ausfall einer nicht-redundanten Platte mit dem
Verlust eines Teils von jedem Block verbunden, der auf den Pool
geschrieben wird.

Daten werden ?ber jedes vdev gestriped. Beispielsweise sind zwei
Spiegel-vdevs effektiv ein RAID 10, dass ?ber zwei Sets von Spiegeln die
Daten schreibt. Speicherplatz wird so allokiert, dass jedes vdev zur
gleichen Zeit vollgeschrieben wird. Es gibt einen
Geschwindigkeitsnachteil wenn die vdevs unterschiedliche Menge von
freiem Speicher aufweisen, wenn eine unproportionale Menge an Daten auf
das weniger volle vdev geschrieben wird.

Wenn zus?tzliche Ger?te zu einem Pool, von dem gebootet wird,
hinzugef?gt werden, muss der Bootcode aktualisiert werden.

Einbinden einer zweiten Spiegelgruppe (``ada2p3`` und ``ada3p3``) zu
einem bestehenden Spiegel:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: resilvered 781M in 0h0m with 0 errors on Fri May 30 08:19:35 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0

    errors: No known data errors
    # zpool add mypool mirror ada2p3 ada3p3
    # gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada2
    bootcode written to ada2
    # gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada3
    bootcode written to ada3
    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub repaired 0 in 0h0m with 0 errors on Fri May 30 08:29:51 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
              mirror-1  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0
                ada3p3  ONLINE       0     0     0

    errors: No known data errors

Momentan k?nnen vdevs nicht von einem Pool entfernt und Platten nur von
einem Spiegel ausgeh?ngt werden, wenn genug Redundanz ?brig bleibt. Wenn
auch nur eine Platte in einer Spiegelgruppe bestehen bleibt, h?rt der
Spiegel auf zu existieren und wird zu einem stripe, was den gesamten
Pool riskiert, falls diese letzte Platte ausf?llt.

Entfernen einer Platte aus einem Spiegel mit drei Platten:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub repaired 0 in 0h0m with 0 errors on Fri May 30 08:29:51 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0

    errors: No known data errors
    # zpool detach mypool ada2p3
    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub repaired 0 in 0h0m with 0 errors on Fri May 30 08:29:51 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0

    errors: No known data errors

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

21.3.3. Den Status eines Pools ?berpr?fen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Status eines Pools ist wichtig. Wenn ein Ger?t sich abschaltet oder
ein Lese-, Schreib- oder Pr?fsummenfehler festgestellt wird, wird der
dazugeh?rige Fehlerz?hler erh?ht. Die ``status``-Ausgabe zeigt die
Konfiguration und den Status von jedem Ger?t im Pool und den
Gesamtstatus des Pools. Aktionen, die durchgef?hrt werden sollten und
Details zum letzten ```scrub`` <zfs-zpool.html#zfs-zpool-scrub>`__
werden ebenfalls angezeigt.

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub repaired 0 in 2h25m with 0 errors on Sat Sep 14 04:25:50 2013
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              raidz2-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0
                ada3p3  ONLINE       0     0     0
                ada4p3  ONLINE       0     0     0
                ada5p3  ONLINE       0     0     0

    errors: No known data errors

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

21.3.4. Fehler beseitigen
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ein Fehler erkannt wurde, werden die Lese-, Schreib- oder
Pr?fsummenz?hler erh?ht. Die Fehlermeldung kann beseitigt und der Z?hler
mit ``zpool clear       mypool`` zur?ckgesetzt werden. Den Fehlerzustand
zur?ckzusetzen kann wichtig sein, wenn automatisierte Skripte ablaufen,
die den Administrator informieren, sobald der Pool Fehler anzeigt.
Weitere Fehler werden nicht gemeldet, wenn der alte Fehlerbericht nicht
entfernt wurde.

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

21.3.5. Ein funktionierendes Ger?t ersetzen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt eine Reihe von Situationen, in denen es n?tig ist, eine Platte
mit einer anderen auszutauschen. Wenn eine funktionierende Platte
ersetzt wird, h?lt der Prozess die alte Platte w?hrend des
Ersetzungsvorganges noch aktiv. Der Pool wird nie den Zustand
`degraded <zfs-term.html#zfs-term-degraded>`__ erhalten, was das Risiko
eines Datenverlustes minimiert. Alle Daten der alten Platte werden durch
das Kommando ``zpool replace`` auf die Neue ?bertragen. Nachdem die
Operation abgeschlossen ist, wird die alte Platte vom vdev getrennt.
Falls die neue Platte gr?sser ist als die alte Platte , ist es m?glich
den Pool zu vergr??ern, um den neuen Platz zu nutzen. Lesen Sie dazu
`Einen Pool vergr??ern <zfs-zpool.html#zfs-zpool-online>`__.

Ersetzen eines funktionierenden Ger?ts in einem Pool:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0

    errors: No known data errors
    # zpool replace mypool ada1p3 ada2p3
    Make sure to wait until resilver is done before rebooting.

    If you boot from pool 'zroot', you may need to update
    boot code on newly attached disk 'ada2p3'.

    Assuming you use GPT partitioning und 'da0' is your new boot disk
    you may use the following command:

            gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 da0
    # gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada2
    # zpool status
      pool: mypool
     state: ONLINE
    status: One or more devices is currently being resilvered.  The pool will
            continue to function, possibly in a degraded state.
    action: Wait for the resilver to complete.
      scan: resilver in progress since Mon Jun  2 14:21:35 2014
            604M scanned out of 781M at 46.5M/s, 0h0m to go
            604M resilvered, 77.39% done
    config:

            NAME             STATE     READ WRITE CKSUM
            mypool           ONLINE       0     0     0
              mirror-0       ONLINE       0     0     0
                ada0p3       ONLINE       0     0     0
                replacing-1  ONLINE       0     0     0
                  ada1p3     ONLINE       0     0     0
                  ada2p3     ONLINE       0     0     0  (resilvering)

    errors: No known data errors
    # zpool status
      pool: mypool
     state: ONLINE
      scan: resilvered 781M in 0h0m with 0 errors on Mon Jun  2 14:21:52 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0

    errors: No known data errors

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

21.3.6. Behandlung von fehlerhaften Ger?ten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn eine Platte in einem Pool ausf?llt, wird das vdev zu dem diese
Platte geh?rt, den Zustand
`degraded <zfs-term.html#zfs-term-degraded>`__ erhalten. Alle Daten sind
immer noch verf?gbar, jedoch wird die Geschwindigkeit m?glicherweise
reduziert, weil die fehlenden Daten aus der verf?gbaren Redundanz heraus
berechnet werden m?ssen. Um das vdev in einen funktionierenden Zustand
zur?ck zu versetzen, muss das physikalische Ger?t ersetzt werden. ZFS
wird dann angewiesen, den
`resilver <zfs-term.html#zfs-term-resilver>`__-Vorgang zu beginnen.
Daten, die sich auf dem defekten Ger?t befanden, werden neu aus der
vorhandenen Pr?fsumme berechnet und auf das Ersatzger?t geschrieben.
Nach Beendigung dieses Prozesses kehrt das vdev zum Status
`online <zfs-term.html#zfs-term-online>`__ zur?ck.

Falls das vdev keine Redundanz besitzt oder wenn mehrere Ger?te
ausgefallen sind und es nicht genug Redundanz gibt, um dies zu
kompensieren, geht der Pool in den Zustand
`faulted <zfs-term.html#zfs-term-faulted>`__ ?ber. Wenn keine
ausreichende Anzahl von Ger?ten wieder an den Pool angeschlossen wird,
f?llt der Pool aus und die Daten m?ssen von Sicherungen wieder
eingespielt werden.

Wenn eine defekte Platte ausgewechselt wird, wird der Name dieser
defekten Platte mit der GUID des Ger?ts ersetzt. Ein neuer Ger?tename
als Parameter f?r ``zpool replace`` wird nicht ben?tigt, falls das
Ersatzger?t den gleichen Ger?tenamen besitzt.

Ersetzen einer defekten Platte durch ``zpool replace``:

.. code:: screen

    # zpool status
      pool: mypool
     state: DEGRADED
    status: One or more devices could not be opened.  Sufficient replicas exist for
            the pool to continue functioning in a degraded state.
    action: Attach the missing device und online it using 'zpool online'.
       see: http://illumos.org/msg/ZFS-8000-2Q
      scan: none requested
    config:

            NAME                    STATE     READ WRITE CKSUM
            mypool                  DEGRADED     0     0     0
              mirror-0              DEGRADED     0     0     0
                ada0p3              ONLINE       0     0     0
                316502962686821739  UNAVAIL      0     0     0  was /dev/ada1p3

    errors: No known data errors
    # zpool replace mypool 316502962686821739 ada2p3
    # zpool status
      pool: mypool
     state: DEGRADED
    status: One or more devices is currently being resilvered.  The pool will
            continue to function, possibly in a degraded state.
    action: Wait for the resilver to complete.
      scan: resilver in progress since Mon Jun  2 14:52:21 2014
            641M scanned out of 781M at 49.3M/s, 0h0m to go
            640M resilvered, 82.04% done
    config:

            NAME                        STATE     READ WRITE CKSUM
            mypool                      DEGRADED     0     0     0
              mirror-0                  DEGRADED     0     0     0
                ada0p3                  ONLINE       0     0     0
                replacing-1             UNAVAIL      0     0     0
                  15732067398082357289  UNAVAIL      0     0     0  was /dev/ada1p3/old
                  ada2p3                ONLINE       0     0     0  (resilvering)

    errors: No known data errors
    # zpool status
      pool: mypool
     state: ONLINE
      scan: resilvered 781M in 0h0m with 0 errors on Mon Jun  2 14:52:38 2014
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0

    errors: No known data errors

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

21.3.7. Einen Pool ?berpr?fen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es wird empfohlen, dass Pools regelm??ig gepr?ft
(`scrubbed <zfs-term.html#zfs-term-scrub>`__) werden, idealerweise
mindestens einmal pro Monat. Der ``scrub``-Vorgang ist beansprucht die
Platte sehr und reduziert die Geschwindigkeit w?hrend er l?uft.
Vermeiden Sie Zeiten, in denen gro?er Bedarf besteht, wenn Sie ``scrub``
starten oder benutzen Sie
```vfs.zfs.scrub_delay`` <zfs-advanced.html#zfs-advanced-tuning-scrub_delay>`__,
um die relative Priorit?t vom ``scrub`` einzustellen, um zu verhindern,
dass es mit anderen Aufgaben kollidiert.

.. code:: screen

    # zpool scrub mypool
    # zpool status
      pool: mypool
     state: ONLINE
      scan: scrub in progress since Wed Feb 19 20:52:54 2014
            116G scanned out of 8.60T at 649M/s, 3h48m to go
            0 repaired, 1.32% done
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              raidz2-0  ONLINE       0     0     0
                ada0p3  ONLINE       0     0     0
                ada1p3  ONLINE       0     0     0
                ada2p3  ONLINE       0     0     0
                ada3p3  ONLINE       0     0     0
                ada4p3  ONLINE       0     0     0
                ada5p3  ONLINE       0     0     0

    errors: No known data errors

Falls eine ?berrp?faktion abgebrochen werden muss, geben Sie
``zpool scrub -s       mypool`` ein.

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

21.3.8. Selbstheilung
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Pr?fsummen, welche zusammen mit den Datenbl?cken gespeichert werden,
erm?glichen dem Dateisystem, sich *selbst zu heilen*. Diese Eigenschaft
wird automatisch Daten korrigieren, deren Pr?fsumme nicht mit der
Gespeicherten ?bereinstimmt, die auf einem anderen Ger?t, das Teil des
Pools ist, vorhanden ist. Beispielsweise bei einem Spiegel aus zwei
Platten, von denen eine anf?ngt, Fehler zu produzieren und nicht mehr
l?nger Daten speichern kann. Dieser Fall ist sogar noch schlimmer, wenn
auf die Daten seit einiger Zeit nicht mehr zugegriffen wurde, zum
Beispiel bei einem Langzeit-Archivspeicher. Traditionelle Dateisysteme
m?ssen dann Algorithmen wie
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
ablaufen lassen, welche die Daten ?berpr?fen und reparieren. Diese
Kommandos ben?tigen einige Zeit und in gravierenden F?llen muss ein
Administrator manuelle Entscheidungen treffen, welche Reparaturoperation
vorgenommen werden soll. Wenn ZFS einen defekten Datenblock mit einer
Pr?fsumme erkennt, die nicht ?bereinstimmt, versucht es die Daten von
der gespiegelten Platte zu lesen. Wenn diese Platte die korrekten Daten
liefern kann, wird nicht nur dieser Datenblock an die anfordernde
Applikation geschickt, sondern auch die falschen Daten auf der Disk
reparieren, welche die falsche Pr?fsumme erzeugt hat. Dies passiert
w?hrend des normalen Betriebs des Pools, ohne dass eine Interaktion vom
Systemadministrator notwendig w?re.

Das n?chste Beispiel demonstriert dieses Verhalten zur Selbstheilung.
Ein gespiegelter Pool mit den beiden Platten ``/dev/ada0`` und
``/dev/ada1`` wird angelegt.

.. code:: screen

    # zpool create healer mirror /dev/ada0 /dev/ada1
    # zpool status healer
      pool: healer
     state: ONLINE
      scan: none requested
    config:

        NAME        STATE     READ WRITE CKSUM
        healer      ONLINE       0     0     0
          mirror-0  ONLINE       0     0     0
           ada0     ONLINE       0     0     0
           ada1     ONLINE       0     0     0

    errors: No known data errors
    # zpool list
    NAME     SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
    healer   960M  92.5K   960M     0%  1.00x  ONLINE  -

Ein paar wichtige Daten, die es vor Datenfehlern mittels der
Selbstheilungsfunktion zu sch?tzen gilt, werden auf den Pool kopiert.
Eine Pr?fsumme wird zum sp?teren Vergleich berechnet.

.. code:: screen

    # cp /some/important/data /healer
    # zfs list
    NAME     SIZE  ALLOC   FREE    CAP  DEDUP  HEALTH  ALTROOT
    healer   960M  67.7M   892M     7%  1.00x  ONLINE  -
    # sha1 /healer > checksum.txt
    # cat checksum.txt
    SHA1 (/healer) = 2753eff56d77d9a536ece6694bf0a82740344d1f

Datenfehler werden durch das Schreiben von zuf?lligen Daten an den
Anfang einer Platte des Spiegels simuliert. Um ZFS daran zu hindern, die
Daten so schnell zu reparieren, wie es diese entdeckt, wird der Pool vor
der Ver?nderung exportiert und anschlie?end wieder importiert.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Dies ist eine gef?hrliche Operation, die wichtige Daten zerst?ren kann.
Es wird hier nur zu Demonstrationszwecken gezeigt und sollte nicht
w?hrend des normalen Betriebs des Pools versucht werden. Dieses
vors?tzliche Korrumpierungsbeispiel sollte auf gar keinen Fall auf einer
Platte mit einem anderen Dateisystem durchgef?hrt werden. Verwenden Sie
keine anderen Ger?tenamen als diejenigen, die hier gezeigt werden, die
Teil des Pools sind. Stellen Sie sicher, dass die passende Sicherungen
angefertigt haben, bevor Sie dieses Kommando ausf?hren!

.. raw:: html

   </div>

.. code:: screen

    # zpool export healer
    # dd if=/dev/random of=/dev/ada1 bs=1m count=200
    200+0 records in
    200+0 records out
    209715200 bytes transferred in 62.992162 secs (3329227 bytes/sec)
    # zpool import healer

Der Status des Pools zeigt an, dass bei einem Ger?t ein Fehler
aufgetreten ist. Wichtig zu wissen ist, dass Anwendungen, die Daten vom
Pool lesen keine ung?ltigen Daten erhalten haben. ZFS lieferte Daten vom
``ada0``-Ger?t mit der korrekten Pr?fsumme aus. Das Ger?t mit der
fehlerhaften Pr?fsumme kann sehr einfach gefunden werden, da die Spalte
``CKSUM`` einen Wert ungleich Null enth?lt.

.. code:: screen

    # zpool status healer
        pool: healer
       state: ONLINE
      status: One or more devices has experienced an unrecoverable error.  An
              attempt was made to correct the error.  Applications are unaffected.
      action: Determine if the device needs to be replaced, und clear the errors
              using 'zpool clear' or replace the device with 'zpool replace'.
         see: http://www.sun.com/msg/ZFS-8000-9P
        scan: none requested
      config:

          NAME        STATE     READ WRITE CKSUM
          healer      ONLINE       0     0     0
            mirror-0  ONLINE       0     0     0
             ada0     ONLINE       0     0     0
             ada1     ONLINE       0     0     1

    errors: No known data errors

Der Fehler wurde erkannt und korrigiert durch die vorhandene Redundanz,
welche aus der nicht betroffenen Platte ``ada0`` des Spiegels gewonnen
wurde. Ein Vergleich der Pr?fsumme mit dem Original wird zeigen, ob sich
der Pool wieder in einem konsistenten Zustand befindet.

.. code:: screen

    # sha1 /healer >> checksum.txt
    # cat checksum.txt
    SHA1 (/healer) = 2753eff56d77d9a536ece6694bf0a82740344d1f
    SHA1 (/healer) = 2753eff56d77d9a536ece6694bf0a82740344d1f

Die beiden Pr?fsummen, die vor und nach der vors?tzlichen Korrumpierung
der Daten des Pools angelegt wurden, stimmen immer noch ?berein. Dies
zeigt wie ZFS in der Lage ist, Fehler automatisch zu erkennen und zu
korrigieren, wenn die Pr?fsummen nicht ?bereinstimmen. Beachten Sie,
dass dies nur m?glich ist, wenn genug Redundanz im Pool vorhanden ist.
Ein Pool, der nur aus einer einzigen Platte besteht besitzt keine
Selbstheilungsfunktion. Dies ist auch der Grund warum Pr?fsummen bei ZFS
so wichtig sind und deshalb aus keinem Grund deaktiviert werden sollten.
Kein
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
ist n?tig, um diese Fehler zu erkennen und zu korrigieren und der Pool
war w?hrend der gesamten Zeit, in der das Problem bestand, verf?gbar.
Eine scrub-Aktion ist nun n?tig, um die fehlerhaften Daten auf ``ada1``
zu beheben.

.. code:: screen

    # zpool scrub healer
    # zpool status healer
      pool: healer
     state: ONLINE
    status: One or more devices has experienced an unrecoverable error.  An
                attempt was made to correct the error.  Applications are unaffected.
    action: Determine if the device needs to be replaced, und clear the errors
                using 'zpool clear' or replace the device with 'zpool replace'.
       see: http://www.sun.com/msg/ZFS-8000-9P
      scan: scrub in progress since Mon Dec 10 12:23:30 2012
            10.4M scanned out of 67.0M at 267K/s, 0h3m to go
            9.63M repaired, 15.56% done
    config:

        NAME        STATE     READ WRITE CKSUM
        healer      ONLINE       0     0     0
          mirror-0  ONLINE       0     0     0
           ada0     ONLINE       0     0     0
           ada1     ONLINE       0     0   627  (repairing)

    errors: No known data errors

Durch das scrub werden die Daten von ``ada0`` gelesen und alle Daten mit
einer falschen durch diejenigen mit der richtigen Pr?fsumme auf ``ada1``
ersetzt. Dies wird durch die Ausgabe ``(repairing)`` des Kommandos
``zpool status`` angezeigt. Nachdem die Operation abgeschlossen ist,
?ndert sich der Poolstatus zu:

.. code:: screen

    # zpool status healer
      pool: healer
     state: ONLINE
    status: One or more devices has experienced an unrecoverable error.  An
            attempt was made to correct the error.  Applications are unaffected.
    action: Determine if the device needs to be replaced, und clear the errors
                 using 'zpool clear' or replace the device with 'zpool replace'.
       see: http://www.sun.com/msg/ZFS-8000-9P
      scan: scrub repaired 66.5M in 0h2m with 0 errors on Mon Dec 10 12:26:25 2012
    config:

        NAME        STATE     READ WRITE CKSUM
        healer      ONLINE       0     0     0
          mirror-0  ONLINE       0     0     0
           ada0     ONLINE       0     0     0
           ada1     ONLINE       0     0 2.72K

    errors: No known data errors

Nach der scrub-Operation und der anschliessenden Synchronisation der
Daten von ``ada0`` nach ``ada1``, kann die Fehlermeldung vom Poolstatus
durch die Eingabe von ``zpool clear``
`bereinigt <zfs-zpool.html#zfs-zpool-clear>`__ werden.

.. code:: screen

    # zpool clear healer
    # zpool status healer
      pool: healer
     state: ONLINE
      scan: scrub repaired 66.5M in 0h2m with 0 errors on Mon Dec 10 12:26:25 2012
    config:

        NAME        STATE     READ WRITE CKSUM
        healer      ONLINE       0     0     0
          mirror-0  ONLINE       0     0     0
           ada0     ONLINE       0     0     0
           ada1     ONLINE       0     0     0

    errors: No known data errors

Der Pool ist jetzt wieder in einem voll funktionsf?higen Zustand
versetzt worden und alle Fehler wurden beseitigt.

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

21.3.9. Einen Pool vergr?ssern
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die verwendbare Gr??e eines redundant ausgelegten Pools ist durch die
Kapazit?t des kleinsten Ger?ts in jedem vdev begrenzt. Das kleinste
Ger?t kann durch ein gr??eres Ger?t ersetzt werden. Nachdem eine
`replace <zfs-zpool.html#zfs-zpool-replace>`__ oder
`resilver <zfs-term.html#zfs-term-resilver>`__-Operation abgeschlossen
wurde, kann der Pool anwachsen, um die Kapazit?t des neuen Ger?ts zu
nutzen. Nehmen wir als Beispiel einen Spiegel mit einer 1?TB und einer
2?TB Platte. Der verwendbare Plattenplatz betr?gt 1?TB. Wenn die 1?TB
Platte mit einer anderen 2?TB Platte ersetzt wird, kopiert der
resilver-Prozess die existierenden Daten auf die neue Platte. Da beide
Ger?te nun 2?TB Kapazit?t besitzen, kann auch der verf?gbare
Plattenplatz auf die Gr??e von 2?TB anwachsen.

Die Erweiterung wird durch das Kommando ``zpool online -e`` auf jedem
Ger?t ausgel?st. Nachdem alle Ger?te expandiert wurden, wird der
Speicher im Pool zur Verf?gung gestellt.

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

21.3.10. Importieren und Exportieren von Pools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Pools werden *exportiert* bevor diese an ein anderes System
angeschlossen werden. Alle Datasets werden abgeh?ngt und jedes Ger?t
wird als exportiert markiert, ist jedoch immer noch gesperrt, so dass es
nicht von anderen Festplattensubsystemen verwendet werden kann. Dadurch
k?nnen Pools auf anderen Maschinen *importiert* werden, die ZFS und
sogar andere Hardwarearchitekturen (bis auf ein paar Ausnahmen, siehe
`zpool(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zpool&sektion=8>`__)
unterst?tzen. Besitzt ein Dataset offene Dateien, kann
``zpool export -f`` den Export des Pools erzwingen. Verwenden Sie dies
mit Vorsicht. Die Datasets werden dadurch gewaltsam abgeh?ngt, was bei
Anwendungen, die noch offene Dateien auf diesem Dataset hatten,
m?glicherweise zu unerwartetem Verhalten f?hren kann.

Einen nichtverwendeten Pool exportieren:

.. code:: screen

    # zpool export mypool

Beim Importieren eines Pool werden auch automatisch alle Datasets
eingeh?ngt. Dies ist m?glicherweise nicht das bevorzugte Verhalten und
wird durch ``zpool import -N`` verhindert. Durch ``zpool import -o``
tempor?re Eigenschaften nur f?r diesen Import gesetzt. Mit dem Befehl
``zpool import altroot=`` ist es m?glich, einen Pool mit einem anderen
Basiseinh?ngepunkt anstatt der Wurzel des Dateisystems einzubinden. Wenn
der Pool zuletzt auf einem anderen System verwendet und nicht korrekt
exportiert wurde, muss unter Umst?nden ein Import erzwungen werden durch
``zpool import -f``. Alle Pools, die momentan nicht durch ein anderes
System verwendet werden, lassen sich mit ``zpool import -a``
importieren.

Alle zum Import verf?gbaren Pools auflisten:

.. code:: screen

    # zpool import
       pool: mypool
         id: 9930174748043525076
      state: ONLINE
     action: The pool can be imported using its name or numeric identifier.
     config:

            mypool      ONLINE
              ada2p3    ONLINE

Den Pool mit einem anderen Wurzelverzeichnis importieren:

.. code:: screen

    # zpool import -o altroot=/mnt mypool
    # zfs list
    zfs list
    NAME                 USED  AVAIL  REFER  MOUNTPOINT
    mypool               110K  47.0G    31K  /mnt/mypool

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

21.3.11. Einen Pool aktualisieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem FreeBSD aktualisiert wurde oder wenn der Pool von einem anderen
System, das eine ?ltere Version von ZFS einsetzt, l?sst sich der Pool
manuell auf den aktuellen Stand von ZFS bringen, um die neuesten
Eigenschaften zu unterst?tzen. Bedenken Sie, ob der Pool jemals wieder
von einem ?lteren System eingebunden werden muss, bevor Sie die
Aktualisierung durchf?hren. Das aktualisieren eines Pools ist ein nicht
umkehrbarer Prozess. ?ltere Pools lassen sich aktualisieren, jedoch
lassen sich Pools mit neueren Eigenschaften nicht wieder auf eine ?ltere
Version bringen.

Aktualisierung eines v28-Pools, um ``Feature Flags`` zu unterst?tzen:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
    status: The pool is formatted using a legacy on-disk format.  The pool can
            still be used, but some features are unavailable.
    action: Upgrade the pool using 'zpool upgrade'.  Once this is done, the
            pool will no longer be accessible on software that does not support feat
            flags.
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
            ada0    ONLINE       0     0     0
            ada1    ONLINE       0     0     0

    errors: No known data errors
    # zpool upgrade
    This system supports ZFS pool feature flags.

    The following pools are formatted with legacy version numbers und can
    be upgraded to use feature flags.  After being upgraded, these pools
    will no longer be accessible by software that does not support feature
    flags.

    VER  POOL
    ---  ------------
    28   mypool

    Use 'zpool upgrade -v' for a list of available legacy versions.
    Every feature flags pool has all supported features enabled.
    # zpool upgrade mypool
    This system supports ZFS pool feature flags.

    Successfully upgraded 'mypool' from version 28 to feature flags.
    Enabled the following features on 'mypool':
      async_destroy
      empty_bpobj
      lz4_compress
      multi_vdev_crash_dump

Die neueren Eigenschaften von ZFS werden nicht verf?gbar sein, bis
``zpool upgrade`` abgeschlossen ist. ``zpool upgrade -v`` kann verwendet
werden, um zu sehen, welche neuen Eigenschaften durch die Aktualisierung
bereitgestellt werden, genauso wie diejenigen, die momentan schon
verf?gbar sind.

Einen Pool um zus?tzliche Feature Flags erweitern:

.. code:: screen

    # zpool status
      pool: mypool
     state: ONLINE
    status: Some supported features are not enabled on the pool. The pool can
            still be used, but some features are unavailable.
    action: Enable all features using 'zpool upgrade'. Once this is done,
            the pool may no longer be accessible by software that does not support
            the features. See zpool-features(7) for details.
      scan: none requested
    config:

            NAME        STATE     READ WRITE CKSUM
            mypool      ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
            ada0    ONLINE       0     0     0
            ada1    ONLINE       0     0     0

    errors: No known data errors
    # zpool upgrade
    This system supports ZFS pool feature flags.

    All pools are formatted using feature flags.


    Some supported features are not enabled on the following pools. Once a
    feature is enabled the pool may become incompatible with software
    that does not support the feature. See zpool-features(7) for details.

    POOL  FEATURE
    ---------------
    zstore
          multi_vdev_crash_dump
          spacemap_histogram
          enabled_txg
          hole_birth
          extensible_dataset
          bookmarks
          filesystem_limits
    # zpool upgrade mypool
    This system supports ZFS pool feature flags.

    Enabled the following features on 'mypool':
      spacemap_histogram
      enabled_txg
      hole_birth
      extensible_dataset
      bookmarks
      filesystem_limits

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Der Bootcode muss auf Systemen, die von dem Pool starten, aktualisiert
werden, um diese neue Version zu unterst?tzen. Verwenden Sie
``gpart bootcode`` auf der Partition, die den Bootcode enth?lt. Lesen
Sie f?r weitere Informationen
`gpart(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpart&sektion=8>`__.

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

21.3.12. Aufgezeichnete Historie des Pools anzeigen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Befehle, die den Pool in irgendeiner Form ver?ndern, werden
aufgezeichnet. Diese Befehle beinhalten das Erstellen von Datasets,
ver?ndern von Eigenschaften oder das Ersetzen einer Platte. Diese
Historie ist n?tzlich um nachzuvollziehen, wie ein Pool aufgebaut ist
und welcher Benutzer eine bestimmte Aktion wann und wie get?tigt hat.
Die aufgezeichnete Historie wird nicht in einer Logdatei festgehalten,
sondern ist Teil des Pools selbst. Das Kommando zum darstellen dieser
Historie lautet passenderweise ``zpool history``:

.. code:: screen

    # zpool history
    History for 'tank':
    2013-02-26.23:02:35 zpool create tank mirror /dev/ada0 /dev/ada1
    2013-02-27.18:50:58 zfs set atime=off tank
    2013-02-27.18:51:09 zfs set checksum=fletcher4 tank
    2013-02-27.18:51:18 zfs create tank/backup

Die Ausgabe zeigt ``zpool`` und ``zfs``-Befehle, die ausgef?hrt wurden
zusammen mit einem Zeitstempel. Nur Befehle, die den Pool ver?ndern
werden aufgezeichnet. Befehle wie ``zfs list`` sind dabei nicht
enthalten. Wenn kein Name angegeben wird, erscheint die gesamte Historie
aller Pools.

Der Befehl ``zpool history`` kann sogar noch mehr Informationen
ausgeben, wenn die Optionen ``-i`` oder ``-l`` angegeben werden. Durch
``-i`` zeigt ZFS vom Benutzer eingegebene, als auch interne Ereignisse
an.

.. code:: screen

    # zpool history -i
    History for 'tank':
    2013-02-26.23:02:35 [internal pool create txg:5] pool spa 28; zfs spa 28; zpl 5;uts  9.1-RELEASE 901000 amd64
    2013-02-27.18:50:53 [internal property set txg:50] atime=0 dataset = 21
    2013-02-27.18:50:58 zfs set atime=off tank
    2013-02-27.18:51:04 [internal property set txg:53] checksum=7 dataset = 21
    2013-02-27.18:51:09 zfs set checksum=fletcher4 tank
    2013-02-27.18:51:13 [internal create txg:55] dataset = 39
    2013-02-27.18:51:18 zfs create tank/backup

Weitere Details lassen sich durch die Angabe von ``-l`` entlocken.
Historische Eintr?ge werden in einem langen Format ausgegeben,
einschlie?lich Informationen wie der Name des Benutzers, welcher das
Kommando eingegeben hat und der Hostname, auf dem die ?nderung erfolgte.

.. code:: screen

    # zpool history -l
    History for 'tank':
    2013-02-26.23:02:35 zpool create tank mirror /dev/ada0 /dev/ada1 [user 0 (root) on :global]
    2013-02-27.18:50:58 zfs set atime=off tank [user 0 (root) on myzfsbox:global]
    2013-02-27.18:51:09 zfs set checksum=fletcher4 tank [user 0 (root) on myzfsbox:global]
    2013-02-27.18:51:18 zfs create tank/backup [user 0 (root) on myzfsbox:global]

Die Ausgabe zeigt, dass der Benutzer ``root`` den gespiegelten Pool mit
den beiden Platten ``/dev/ada0`` und ``/dev/ada1`` angelegt hat. Der
Hostname ``myzfsbox`` wird ebenfalls in den Kommandos angezeigt, nachdem
der Pool erzeugt wurde. Die Anzeige des Hostnamens wird wichtig, sobald
der Pool von einem System exportiert und auf einem anderen importiert
wird. Die Befehle, welche auf dem anderen System verwendet werden,
k?nnen klar durch den Hostnamen, der bei jedem Kommando mit verzeichnet
wird, unterschieden werden.

Beide Optionen f?r ``zpool history`` lassen sich auch kombinieren, um
die meisten Details zur Historie eines Pools auszugeben. Die Pool
Historie liefert wertvolle Informationen, wenn Aktionen nachverfolgt
werden m?ssen oder zur Fehlerbeseitigung mehr Informationen gebraucht
werden.

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

21.3.13. Geschwindigkeits?berwachung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein eingebautes ?berwachungssystem kann I/O-Statistiken in Echtzeit
liefern. Es zeigt die Menge von freiem und belegtem Speicherplatz auf
dem Pool an, wieviele Lese- und Schreiboperationen pro Sekunde
durchgef?hrt werden und die aktuell verwendete I/O-Bandbreite.
Standardm??ig werden alle Pools in einem System ?berwacht und angezeigt.
Ein Poolname kann angegeben werden, um die Anzeige auf diesen Pool zu
beschr?nken. Ein einfaches Beispiel:

.. code:: screen

    # zpool iostat
                   capacity     operations    bundwidth
    pool        alloc   free   read  write   read  write
    ----------  -----  -----  -----  -----  -----  -----
    data         288G  1.53T      2     11  11.3K  57.1K

Um kontinuierlich die I/O-Aktivit?t zu ?berpr?fen, kann eine Zahl als
letzter Parameter angegeben werden, die ein Intervall in Sekunden
angibt, die zwischen den Aktualisierungen vergehen soll. Die n?chste
Zeile mit Statistikinformationen wird dann nach jedem Intervall
ausgegeben. Dr?cken Sie **Ctrl**+**C**, um diese kontinuierliche
?berwachung zu stoppen. Alternativ l?sst sich auch eine zweite Zahl nach
dem Intervall auf der Kommandozeile angeben, welche die Obergrenze von
Statistikausgaben darstellt, die angezeigt werden sollen.

Noch mehr Informationen zu I/O-Statistiken k?nnen durch Angabe der
Option ``-v`` angezeigt werden. Jedes Ger?t im Pool wird dann mit einer
eigenen Statistikzeile aufgef?hrt. Dies ist hilfreich um zu sehen,
wieviele Lese- und Schreiboperationen von jedem Ger?t durchgef?hrt
werden und kann bei der Diagnose eines langsamen Ger?ts, das den Pool
ausbremst, hilfreich sein. Dieses Beispiel zeigt einen gespiegelten Pool
mit zwei Ger?ten:

.. code:: screen

    # zpool iostat -v 
                                capacity     operations    bundwidth
    pool                     alloc   free   read  write   read  write
    -----------------------  -----  -----  -----  -----  -----  -----
    data                      288G  1.53T      2     12  9.23K  61.5K
      mirror                  288G  1.53T      2     12  9.23K  61.5K
        ada1                     -      -      0      4  5.61K  61.7K
        ada2                     -      -      1      4  5.04K  61.7K
    -----------------------  -----  -----  -----  -----  -----  -----

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

21.3.14. Einen Pool aufteilen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Pool, der aus einem oder mehreren gespiegelten vdevs besteht, kann
in zwei Pools aufgespalten werden. Falls nicht anders angegeben, wird
das letzte Mitglied eines Spiegels abgeh?ngt und dazu verwendet, einen
neuen Pool mit den gleichen Daten zu erstellen. Die Operation sollte
zuerst mit der Option ``-n`` versucht werden. Die Details der
vorgeschlagenen Option werden dargestellt, ohne die Aktion in
Wirklichkeit durchzuf?hren. Das hilft dabei zu best?tigen, ob die Aktion
das tut, was der Benutzer damit vor hatte.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+---------------------------------+
| `Zur?ck <zfs-quickstart.html>`__?   | `Nach oben <zfs.html>`__      | ?\ `Weiter <zfs-zfs.html>`__    |
+-------------------------------------+-------------------------------+---------------------------------+
| 21.2. Schnellstartanleitung?        | `Zum Anfang <index.html>`__   | ?21.4. ``zfs`` Administration   |
+-------------------------------------+-------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
