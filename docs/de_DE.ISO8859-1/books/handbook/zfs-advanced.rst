=================================
21.6. Themen f?r Fortgeschrittene
=================================

.. raw:: html

   <div class="navheader">

21.6. Themen f?r Fortgeschrittene
`Zur?ck <zfs-zfs-allow.html>`__?
Kapitel 21. Das Z-Dateisystem (ZFS)
?\ `Weiter <zfs-links.html>`__

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

21.6. Themen f?r Fortgeschrittene
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

21.6.1. Anpassungen
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Reihe von Anpassungen k?nnen vorgenommen werden, um ZFS unter
verschiedenen Belastungen w?hrend des Betriebs bestm?glich einzustellen.

.. raw:: html

   <div class="itemizedlist">

-  *``vfs.zfs.arc_max``* - Maximale Gr??e des
   `ARC <zfs-term.html#zfs-term-arc>`__. Die Voreinstellung ist der
   gesamte RAM weniger 1?GB oder die H?lfte vom RAM, je nachdem, was
   mehr ist. Allerdings sollte ein niedriger Wert verwendet werden, wenn
   das System weitere Dienste oder Prozesse laufen l?sst, welche
   Hauptspeicher ben?tigen. Dieser Wert kann nur zur Bootzeit
   eingestellt werden und wird in ``/boot/loader.conf`` festgelegt.

-  *``vfs.zfs.arc_meta_limit``* - Schr?nkt die Menge des
   `ARC <zfs-term.html#zfs-term-arc>`__ ein, welche f?r die Speicherung
   von Metadaten verwendet wird. Die Voreinstellung ist ein Viertel von
   ``vfs.zfs.arc_max``. Diesen Wert zu erh?hen steigert die
   Geschwindigkeit, wenn die Arbeitslast Operationen auf einer gro?en
   Menge an Dateien und Verzeichnissen oder h?ufigen
   Metadatenoperationen beinhaltet. Jedoch bedeutet dies auch weniger
   Dateidaten, die in den `ARC <zfs-term.html#zfs-term-arc>`__ passen.
   Dieser Wert kann nur zur Bootzeit angepasst werden und wird in
   ``/boot/loader.conf`` gesetzt.

-  *``vfs.zfs.arc_min``* - Minimale Gr??e des
   `ARC <zfs-term.html#zfs-term-arc>`__. Der Standard betr?gt die H?lfte
   von ``vfs.zfs.arc_meta_limit``. Passen Sie diesen Wert an, um zu
   verhindern, dass andere Anwendungen den gesamten
   `ARC <zfs-term.html#zfs-term-arc>`__ verdr?ngen. Dieser Wert kann nur
   zur Bootzeit ge?ndert und muss in ``/boot/loader.conf`` festgelegt
   werden.

-  *``vfs.zfs.vdev.cache.size``* - Eine vorallokierte Menge von
   Speicher, die als Cache f?r jedes Ger?t im Pool reserviert wird. Die
   Gesamtgr??e von verwendetem Speicher ist dieser Wert multipliziert
   mit der Anzahl an Ger?ten. Nur zur Bootzeit kann dieser Wert
   angepasst werden und wird in ``/boot/loader.conf`` eingestellt.

-  *``vfs.zfs.min_auto_ashift``* - Minimaler ``ashift``-Wert
   (Sektorgr??e), welche zur Erstellungszeit des Pools automatisch
   verwendet wird. Der Wert ist ein Vielfaches zur Basis Zwei. Der
   Standardwert von ``9`` repr?sentiert ``2^9 = 512``, eine Sektorgr??e
   von 512 Bytes. Um *write amplification* zu vermeiden und die
   bestm?gliche Geschwindigkeit zu erhalten, setzen Sie diesen Wert auf
   die gr??te Sektorgr??e, die bei einem Ger?t im Pool vorhanden ist.

   Viele Ger?te besitzen 4?KB gro?e Sektoren. Die Verwendung der
   Voreinstellung ``9`` bei ``ashift`` mit diesen Ger?ten resultiert in
   einer write amplification auf diesen Ger?ten. Daten, welche in einem
   einzelnen 4?KB Schreibvorgang Platz finden w?rden, m?ssen stattdessen
   in acht 512-byte Schreibvorg?nge aufgeteilt werden. ZFS versucht, die
   allen Ger?ten zugrundeliegende Sektorgr??e w?hrend der Poolerstellung
   zu lesen, jedoch melden viele Ger?te mit 4?KB Sektoren, dass ihre
   Sektoren aus Kompatibilit?tsgr?nden 512 Bytes betragen. Durch das
   Setzen von ``vfs.zfs.min_auto_ashift`` auf ``12`` (``2^12 = 4096``)
   bevor der Pool erstellt wird, zwingt ZFS dazu, f?r diese Ger?te 4?KB
   Bl?cke f?r bessere Geschwindigkeit zu nutzen.

   Erzwingen von 4?KB Bl?cken ist ebenfalls hilfreich auf Pools bei
   denen Plattenaufr?stungen geplant sind. Zuk?nftige Platten werden
   wahrscheinlich 4?KB gro?e Sektoren und der Wert von ``ashift`` l?sst
   sich nach dem Erstellen des Pools nicht mehr ?ndern.

   In besonderen F?llen ist die kleinere Blockgr??e von 512-Byte
   vorzuziehen. Weniger Daten werden bei kleinen, zuf?lligen
   Leseoperationen ?bertragen, was besonders bei 512-Byte gro?en Platten
   f?r Datenbanken oder Plattenplatz f?r virtuelle Maschinen der Fall
   ist. Dies kann bessere Geschwindigkeit bringen, ganz besonders wenn
   eine kleinere ZFS record size verwendet wird.

-  *``vfs.zfs.prefetch_disable``* - Prefetch deaktivieren. Ein Wert von
   ``0`` bedeutet aktiviert und ``1`` hei?t deaktiviert. Die
   Voreinstellung ist ``0``, au?er, das System besitzt weniger als 4?GB
   RAM. Prefetch funktioniert durch das Lesen von gr?sseren Bl?cken in
   den `ARC <zfs-term.html#zfs-term-arc>`__ als angefordert wurden, in
   der Hoffnung, dass diese Daten ebenfalls bald ben?tigt werden. Wenn
   die I/O-Last viele gro?e Mengen von zuf?lligen Leseoperationen
   beinhaltet, ist das Deaktivieren von prefetch eine
   Geschwindigkeitssteigerung durch die Reduzierung von unn?tigen
   Leseoperationen. Dieser Wert kann zu jeder Zeit ?ber
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   angepasst werden.

-  *``vfs.zfs.vdev.trim_on_init``* - Steuert, ob neue Ger?te, die dem
   Pool hinzugef?gt werden, das ``TRIM``-Kommando ausf?hren sollen. Das
   beinhaltet die beste Geschwindigkeit und Langlebigkeit f?r SSDs,
   ben?tigt jedoch zus?tzliche Zeit. Wenn das Ger?t bereits sicher
   gel?scht wurde, kann durch deaktivieren dieser Option das Hinzuf?gen
   neuer Ger?te schneller geschehen. ?ber
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   l?sst sich dieser Wert jederzeit einstellen.

-  *``vfs.zfs.vdev.max_pending``* - Begrenzt die Menge von ausstehenden
   I/O-Anfragen pro Ger?t. Ein gr??erer Wert wird die
   Ger?tewarteschlange f?r Befehle gef?llt lassen und m?glicherweise
   besseren Durchsatz erzeugen. Ein niedrigerer Wert reduziert die
   Latenz. Jederzeit kann dieser Wert ?ber
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   angepasst werden.

-  *``vfs.zfs.top_maxinflight``* - Maximale Anzahl von ausstehenden I/Os
   pro dar?berliegendem `vdev <zfs-term.html#zfs-term-vdev>`__. Begrenzt
   die Tiefe Kommandowarteschlange, um hohe Latenzen zu vermeiden. Das
   Limit ist pro dar?berliegendem vdev, was bedeutet, dass das Limit f?r
   jeden `mirror <zfs-term.html#zfs-term-vdev-mirror>`__,
   `RAID-Z <zfs-term.html#zfs-term-vdev-raidz>`__, oder anderes vdev
   unabh?ngig gilt. Mit
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   kann dieser Wert jederzeit angepasst werden.

-  *``vfs.zfs.l2arc_write_max``* - Begrenzt die Menge an Daten, die pro
   Sekunde in den `L2ARC <zfs-term.html#zfs-term-l2arc>`__ geschrieben
   wird. Durch diese Einstellung l?sst sich die Lebensdauer von SSDs
   erh?hen, indem die Menge an Daten beschr?nkt wird, die auf das Ger?t
   geschrieben wird. Dieser Wert ist ?ber
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   zu einem beliebigen Zeitpunkt ?nderbar.

-  *``vfs.zfs.l2arc_write_boost``* - Der Wert dieser Einstellung wird zu
   ```vfs.zfs.l2arc_write_max`` <zfs-advanced.html#zfs-advanced-tuning-l2arc_write_max>`__
   addiert und erh?ht die Schreibgeschwindigkeit auf die SSD bis der
   erste Block aus dem `L2ARC <zfs-term.html#zfs-term-l2arc>`__
   verdr?ngt wurde. Diese „Turbo Warmup Phase“ wurde entwickelt, um den
   Geschwindigkeitsverlust eines leeren
   `L2ARC <zfs-term.html#zfs-term-l2arc>`__ nach einem Neustart zu
   reduzieren. Jederzeit kann dieser Wert mit
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   ge?ndert werden.

-  *``vfs.zfs.scrub_delay``* - Anzahl von Ticks an Verz?gerung zwischen
   jedem I/O w?hrend eines ```scrub`` <zfs-term.html#zfs-term-scrub>`__.
   Um zu gew?hrleisten, dass ein ``scrub`` nicht mit die normalen
   Vorg?nge eines Pools beeintr?chtigt. Wenn w?hrenddessen andere I/Os
   durchgef?hrt werden, wird der ``scrub`` zwischen jedem Befehl
   verz?gert. Dieser Wert regelt die Gesamtmenge von IOPS (I/Os Per
   Second), die von ``scrub`` generiert werden. Die Granularit?t der
   Einstellung ist bestimmt durch den Wert von ``kern.hz``, welcher
   standardm??ig auf auf 1000 Ticks pro Sekunde eingestellt ist. Diese
   Einstellung kann ge?ndert werden, was in einer unterschiedlich
   effektiven Limitierung der IOPS resultiert. Der Standardwert ist
   ``4``, was ein Limit von 1000?ticks/sec / 4 = 250?IOPS ergibt. Ein
   Wert von *``20``* w?rde ein Limit von 1000?ticks/sec / 20 = 50?IOPS
   ergeben. Die ``scrub``-Geschwindigkeit ist nur begrenzt, wenn es
   k?rzlich Aktivit?t auf dem Pool gab, wie der Wert von
   ```vfs.zfs.scan_idle`` <zfs-advanced.html#zfs-advanced-tuning-scan_idle>`__
   verr?t. Zu einem beliebigen Zeitpunkt kann ?ber
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   eine ?nderung an diesem Wert erfolgen.

-  *``vfs.zfs.resilver_delay``* - Anzahl an Millisekunden Verz?gerung,
   die zwischen jedem I/O w?hrend eines
   `resilver <zfs-term.html#zfs-term-resilver>`__ eingef?gt wird. Um zu
   versichern, dass ein resilver nicht die normalen Vorg?nge auf dem
   Pool st?rt, wird dieser zwischen jedem Kommando verz?gert, wenn
   andere I/Os auf dem Pool passieren. Dieser Wert steuert das Limit der
   Gesamt-IOPS (I/Os Pro Sekunde), die vom resilver erzeugt werden. Die
   Granularit?t der Einstellung wird durch den Wert von ``kern.hz``
   bestimmt, welcher standardm??ig 1000 Ticks pro Sekunde betr?gt. Diese
   Einstellung l?sst sich ?ndern, was in einem unterschiedlich
   effizienten IOPS-Limit resultiert. Die Voreinstellung ist 2, was ein
   Limit von 1000?ticks/sec / 2 = 500?IOPS betr?gt. Einen Pool wieder in
   den Zustand `Online <zfs-term.html#zfs-term-online>`__ zu versetzen
   ist m?glicherweise wichtiger wenn eine andere Platte den Pool in den
   `Fault <zfs-term.html#zfs-term-faulted>`__-Zustand versetzt, was
   Datenverlust zur Folge hat. Ein Wert von 0 wird der
   resilver-Operation die gleiche Priorit?t wie anderen Operationen
   geben, was den Heilungsprozess beschleunigt. Die Geschwindigkeit des
   resilver wird nur begrenzt, wenn es k?rzlich andere Aktivit?ten auf
   dem Pool gab, wie von
   ```vfs.zfs.scan_idle`` <zfs-advanced.html#zfs-advanced-tuning-scan_idle>`__
   festgestellt wird. Dieser Wert kann zu jeder Zeit ?ber.
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   eingestellt werden.

-  *``vfs.zfs.scan_idle``* - Anzahl an Millisekunden seit der letzten
   Operation bevor der Pool als im Leerlauf befindlich deklariert wird.
   Wenn sich der Pool im Leerlauf befindet, wird die Begrenzung f?r
   ```scrub`` <zfs-term.html#zfs-term-scrub>`__ und
   `resilver <zfs-term.html#zfs-term-resilver>`__ deaktiviert. Dieser
   Wert kann mittels
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   jederzeit angepasst werden.

-  *``vfs.zfs.txg.timeout``* - Maximale Anzahl von Sekunden zwischen
   `Transaktionsgruppen <zfs-term.html#zfs-term-txg>`__ (transaction
   group). Die momentane Transaktionsgruppe wird auf den Pool
   geschrieben und eine frische Transaktionsgruppe begonnen, wenn diese
   Menge an Zeit seit der vorherigen Transaktionsgruppe abgelaufen ist.
   Eine Transaktionsgruppe kann verfr?ht ausgel?st werden, wenn genug
   Daten geschrieben werden. Der Standardwert betr?gt 5 Sekunden. Ein
   gr??erer Wert kann die Lesegeschwindigkeit durch verz?gern von
   asynchronen Schreibvorg?ngen verbessern, allerdings kann dies
   ungleiche Geschwindigkeiten hervorrufen, wenn eine Transaktionsgruppe
   geschrieben wird. Dieser Wert kann zu einem beliebigen Zeitpunkt mit
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   ge?ndert werden.

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

21.6.2. ZFS auf i386
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manche der Eigenschaften, die von ZFS bereitgestellt werden, sind
speicherintensiv und ben?tigen Anpassungen f?r die maximale Effizienz
auf Systemen mit begrenztem RAM.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

21.6.2.1. Hauptspeicher
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als absolutes Minimum sollte der gesamte verf?gbare Hauptspeicher
mindestens ein Gigabyte betragen. Die vorgeschlagene Menge an RAM ist
bedingt durch die Poolgr??e und welche Eigenschaften von ZFS verwendet
werden. Eine Faustregel besagt, dass 1?GB RAM f?r jedes 1?TB Storage
vorgesehen werden sollte. Wenn Deduplizierung zum Einsatz kommt, besagt
die Regel, dass 5?GB RAM pro TB an Speicher, der dedupliziert werden
soll, bereitgestellt sein muss. Obwohl manche Anwender ZFS mit weniger
RAM einsetzen, st?rzen Systeme h?ufiger wegen unzureichendem
Hauptspeicher ab. Weitere Anpassungen sind unter Umst?nden n?tig f?r
Systeme mit weniger als die vorgeschlagene Menge an RAM.

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

21.6.2.2. Kernel-Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wegen des begrenzten Addressraumes der i386™-Plattform m?ssen
ZFS-Anwendern auf der i386™-Architektur diese Option der
Kernelkonfigurationsdatei hinzuf?gen, den Kernel erneut bauen und das
System neu starten:

.. code:: programlisting

    options        KVA_PAGES=512

Dies erweitert den Addressraum des Kernels, was es erlaubt, die
Einstellung ``vm.kvm_size`` hinter die momentan vorgegebene Grenze von
1?GB oder das Limit von 2?GB f?r PAE zu bringen. Um den passenden Wert
f?r diese Option zu finden, teilen Sie den gew?nschten Addressraum in
Megabyte durch vier. In diesem Beispiel betr?gt sie ``512`` f?r 2?GB.

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

21.6.2.3. Loader-Anpassungen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der ``kmem``-Addressraum kann auf allen FreeBSD-Architekturen erh?ht
werden. Auf einem Testsystem mit 1?GB physischen Speichers wurden mit
diesen Optionen in ``/boot/loader.conf`` und einem anschlie?enden
Systemneustart Erfolge erzielt:

.. code:: programlisting

    vm.kmem_size="330M"
    vm.kmem_size_max="330M"
    vfs.zfs.arc_max="40M"
    vfs.zfs.vdev.cache.size="5M"

F?r eine detailliertere Liste an Empfehlungen f?r ZFS-bezogene
Einstellungen, lesen Sie http://wiki.freebsd.org/ZFSTuningGuide.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <zfs-zfs-allow.html>`__?     | `Nach oben <zfs.html>`__      | ?\ `Weiter <zfs-links.html>`__     |
+--------------------------------------+-------------------------------+------------------------------------+
| 21.5. Delegierbare Administration?   | `Zum Anfang <index.html>`__   | ?21.7. Zus?tzliche Informationen   |
+--------------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
