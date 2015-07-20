==================================
9.6. Die Kernelkonfigurationsdatei
==================================

.. raw:: html

   <div class="navheader">

9.6. Die Kernelkonfigurationsdatei
`Zur?ck <kernelconfig-building.html>`__?
Kapitel 9. Konfiguration des FreeBSD-Kernels
?\ `Weiter <kernelconfig-trouble.html>`__

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

9.6. Die Kernelkonfigurationsdatei
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Aktualisiert von Joel Dahl.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Format der Konfigurationsdatei ist recht einfach. Jede Zeile enth?lt
ein Schl?sselwort und ein oder mehrere Argumente. Eine Zeile, die von
einen ``#`` eingeleitet wird, gilt als Kommentar und wird ignoriert. Die
folgenden Abschnitte beschreiben jedes Schl?sselwort in der Reihenfolge,
in der es in ``GENERIC`` auftaucht. Eine ausf?hrliche Liste aller
Optionen mit detaillierten Erkl?rungen finden Sie in der
Konfigurationsdatei ``NOTES``, die sich in demselben Verzeichnis wie die
Datei ``GENERIC`` befindet. Von der Architektur unabh?ngige Optionen
sind in der Datei ``/usr/src/sys/conf/NOTES`` aufgef?hrt.

Es ist m?glich, eine ``include``-Anweisung in die
Kernelkonfigurationsdatei aufzunehmen. Diese erlaubt das lokale Einf?gen
von anderen Konfigurationsdateien in die aktuelle, was es einfacher
macht, kleinere ?nderungen an einer existierenden Datei zu vollziehen.
Wenn Sie beispielsweise einen ``GENERIC``-Kernel mit nur einer kleinen
Anzahl von zus?tzlichen Optionen und Treibern ben?tigen, brauchen Sie
mit den folgenden Zeilen nur ein kleines Delta im Vergleich zu GENERIC
anpassen:

.. code:: programlisting

    include GENERIC
    ident MYKERNEL

    options         IPFIREWALL
    options         DUMMYNET
    options         IPFIREWALL_DEFAULT_TO_ACCEPT
    options         IPDIVERT

F?r viele Administratoren bietet dieses Modell entscheidende Vorteile
?ber das bisherige Erstellen von Konfigurationsdateien von Grund auf:
die lokalen Konfigurationdateien enthalten auch nur die lokalen
Unterschiede zu einem ``GENERIC``-Kernel und sobald Aktulaisierungen
durchgef?hrt werden, k?nnen neue Eigenschaften, die zu ``GENERIC``
hinzugef?gt werden, auch dem lokalen Kernel angeh?ngt werden, es sei
denn, es wird durch ``nooptions`` oder ``nodevice`` verhindert. Der
?brige Teil dieses Kapitels behandelt die Inhalte einer typischen
Konfigurationsdatei und die Rolle, die unterschiedliche Optionen und
Ger?te dabei spielen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Um einen Kernel mit allen m?glichen Optionen zu bauen beispielsweise f?r
Testzwecke), f?hren Sie als ``root`` die folgenden Befehle aus:

.. code:: screen

    # cd /usr/src/sys/i386/conf && make LINT

.. raw:: html

   </div>

Das folgende Beispiel zeigt eine ``GENERIC`` Konfigurationsdatei, die,
wo notwendig, zus?tzliche Kommentare enth?lt. Sie sollte der Datei
``/usr/src/sys/i386/conf/GENERIC`` auf Ihrem System sehr ?hnlich sein.

.. code:: programlisting

    machine      i386

Gibt die Architektur der Maschine an und muss entweder ``amd64``,
``i386``, ``ia64``, ``pc98``, ``powerpc`` oder ``sparc64`` sein.

.. code:: programlisting

    cpu          I486_CPU
    cpu          I586_CPU
    cpu          I686_CPU

Die vorigen Zeilen geben den Typ der CPU Ihres Systems an. Sie k?nnen
mehrere CPU Typen angeben, wenn Sie sich zum Beispiel nicht sicher sind,
ob Sie ``I586_CPU`` oder ``I686_CPU`` benutzen sollen. F?r einen
angepassten Kernel ist es aber am besten, wenn Sie nur die CPU angeben,
die sich in der Maschine befindet. Der CPU-Typ wird in den
Boot-Meldungen ausgegeben, die in der Datei ``/var/run/dmesg.boot``
gespeichert sind.

.. code:: programlisting

    ident          GENERIC

Gibt den Namen Ihres Kernels an. Hier sollten Sie den Namen einsetzen,
den Sie Ihrer Konfigurationsdatei gegeben haben. In unserem Beispiel ist
das ``MYKERNEL``. Der Wert, den Sie ``ident`` zuweisen, wird beim Booten
des neuen Kernels ausgegeben. Wenn Sie den Kernel von Ihrem normal
verwendeten Kernel unterscheiden wollen, weil Sie zum Beispiel einen
Kernel zum Testen bauen, ist es n?tzlich, hier einen anderen Namen
anzugeben.

.. code:: programlisting

    #To statically compile in device wiring instead of /boot/device.hints
    #hints          "GENERIC.hints"         # Default places to look for devices.

Unter FreeBSD werden Ger?te mit
`device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5>`__
konfiguriert. In der Voreinstellung ?berpr?ft
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
beim Systemstart die Datei ``/boot/device.hints``. Die Option ``hints``
erlaubt es, die Ger?tekonfiguration statisch in den Kernel einzubinden,
sodass die Datei ``device.hints`` in ``/boot`` nicht ben?tigt wird.

.. code:: programlisting

    makeoptions     DEBUG=-g          # Build kernel with gdb(1) debug symbols

Der normale Bauprozess von FreeBSD erstellt nur dann einen Kernel, der
Debugging-Informationen enth?lt, wenn Sie die Option ``-g`` von
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__
aktivieren.

.. code:: programlisting

    options          SCHED_ULE        # ULE scheduler

Der voreingestellte Scheduler von FreeBSD. ?ndern Sie diesen Wert nicht!

.. code:: programlisting

    options          PREEMPTION        # Enable kernel thread preemption

Erlaubt es Kernelthreads, vor Threads eigentlich h?herer Priorit?lt
ausgef?hrt zu werden. Die Interaktivit?lt des Systems wird dadurch
erh?lt. Interrupt-Threads werden dabei bevorzugt ausgef?hrt.

.. code:: programlisting

    options          INET              # InterNETworking

Netzwerkunterst?tzung. Auch wenn Sie nicht planen, den Rechner mit einem
Netzwerk zu verbinden, sollten Sie diese Option aktiviert lassen. Die
meisten Programme sind mindestens auf die Loopback Unterst?tzung
(Verbindungen mit sich selbst) angewiesen. Damit ist diese Option im
Endeffekt notwendig.

.. code:: programlisting

    options          INET6             # IPv6 communications protocols

Aktiviert die Unterst?tzung f?r das IPv6 Protokoll.

.. code:: programlisting

    options          FFS               # Berkeley Fast Filesystem

Das Dateisystem f?r Festplatten. Wenn Sie von einer Festplatte booten
wollen, lassen Sie diese Option aktiviert.

.. code:: programlisting

    options          SOFTUPDATES       # Enable FFS Soft Updates support

Mit dieser Option wird die Unterst?tzung f?r Soft Updates, die
Schreibzugriffe beschleunigen, in den Kernel eingebunden. Auch wenn die
Funktion im Kernel ist, muss sie f?r einzelne Dateisysteme explizit
aktiviert werden. ?berpr?fen Sie mit
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__,
ob die Dateisysteme Soft Updates benutzen. Wenn die Option
``soft-updates`` nicht aktiviert ist, k?nnen Sie die Option nachtr?glich
mit
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
aktivieren. F?r neue Dateisysteme k?nnen Sie Option beim Anlegen mit
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
aktivieren.

.. code:: programlisting

    options          UFS_ACL           # Support for access control lists

Diese Option aktiviert die Unterst?tzung f?r Zugriffskontrolllisten
(ACL). Die ACLs h?ngen von erweiterten Attributen und UFS2 ab, eine
genaue Beschreibung finden Sie in `Abschnitt?15.11,
„Zugriffskontrolllisten f?r Dateisysteme“ <fs-acl.html>`__. Die
Zugriffskontrolllisten sind in der Voreinstellung aktiviert und sollten
auch nicht deaktiviert werden, wenn Sie schon einmal auf einem
Dateisystem verwendet wurden, da dies die Zugriffsrechte auf Dateien in
unvorhersehbarer Art und Weise ?ndern kann.

.. code:: programlisting

    options          UFS_DIRHASH       # Improve performance on big directories

Diese Option steigert die Geschwindigkeit von Plattenzugriffen auf
gro?en Verzeichnissen. Dadurch verbraucht das System etwas mehr Speicher
als vorher. F?r stark besch?ftigte Server oder Arbeitsplatzrechner
sollten Sie diese Option aktiviert lassen. Auf kleineren Systemen, bei
denen Speicher eine kostbare Ressource darstellt oder Systemen, auf
denen die Geschwindigkeit der Plattenzugriffe nicht wichtig ist, wie
Firewalls, k?nnen Sie diese Option abstellen.

.. code:: programlisting

    options          MD_ROOT           # MD is a potential root device

Diese Option aktiviert die Unterst?ztung f?r ein Root-Dateisystem auf
einem speicherbasierten Laufwerk (RAM-Disk).

.. code:: programlisting

    options          NFSCLIENT         # Network Filesystem Client
    options          NFSSERVER         # Network Filesystem Server
    options          NFS_ROOT          # NFS usable as /, requires NFSCLIENT

Das Network Filesystem. Wenn Sie keine Partitionen von einem UNIX?
File-Server ?ber TCP/IP einh?ngen wollen, k?nnen Sie diese Zeile
auskommentieren.

.. code:: programlisting

    options          MSDOSFS           # MSDOS Filesystem

Das MS-DOS? Dateisystem. Sie k?nnen diese Zeile auskommentieren, wenn
Sie nicht vorhaben, eine DOS-Partition beim Booten einzuh?ngen. Das
n?tige Modul wird ansonsten automatisch geladen, wenn Sie das erste Mal
eine DOS-Partition einh?ngen. Au?erdem k?nnen Sie mit den
ausgezeichneten
`emulators/mtools <http://www.freebsd.org/cgi/url.cgi?ports/emulators/mtools/pkg-descr>`__
aus der Ports-Sammlung auf DOS-Floppies zugreifen, ohne diese an- und
abh?ngen zu m?ssen (``MSDOSFS`` wird in diesem Fall nicht ben?tigt).

.. code:: programlisting

    options          CD9660            # ISO 9660 Filesystem

Das ISO 9660 Dateisystem f?r CD-ROMs. Sie k?nnen diese Zeile
auskommentieren, wenn Sie kein CD-ROM-Laufwerk besitzen oder nur ab und
an CDs einh?ngen. Das Modul wird automatisch geladen, sobald Sie das
erste Mal eine CD einh?ngen. F?r Audio-CDs ben?tigen Sie dieses
Dateisystem nicht.

.. code:: programlisting

    options          PROCFS            # Process filesystem (requires PSEUDOFS)

Das Prozessdateisystem. Dies ist ein Pseudo-Dateisystem, das auf
``/proc`` eingehangen wird und es Programmen wie
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
erlaubt, mehr Informationen ?ber laufende Prozesse auszugeben.
``PROCFS`` sollte von FreeBSD nicht mehr ben?tigt werden, da die meisten
Debug- und ?berwachungs-Werkzeuge nicht mehr darauf angewiesen sind.
Daher wird das Prozessdateisystem auch nicht mehr automatisch in das
System eingebunden.

.. code:: programlisting

    options          PSEUDOFS          # Pseudo-filesystem framework

Kernel, die ``PROCFS`` verwenden, m?ssen auch die Option ``PSEUDOFS``
verwenden.

.. code:: programlisting

    options          GEOM_PART_GPT          # GUID Partition Tables.

F?gt Unterst?tzung f?r `GUID Partition
Tables <http://en.wikipedia.org/wiki/GUID_Partition_Table>`__ hinzu. GPT
bietet die M?glichkeit, eine grosse Anzahl von Partitionen pro Platte,
128 in der Standardkonfiguration, zu haben.

.. code:: programlisting

    options          COMPAT_43         # Compatible with BSD 4.3 [KEEP THIS!]

Stellt die Kompatibilit?t zu 4.3BSD sicher. Belassen Sie diese Option,
da sich manche Programme recht sonderbar verhalten werden, wenn Sie
diese auskommentieren.

.. code:: programlisting

    options          COMPAT_FREEBSD4   # Compatible with FreeBSD4

Diese Option stellt sicher, dass Anwendungen, die auf ?lteren FreeBSD
Versionen ?bersetzt wurden und alte Systemaufrufe verwenden, noch
lauff?hig sind. Wir empfehlen, diese Option auf allen i386™-Systemen zu
verwenden, auf denen vielleicht noch ?ltere Anwendungen laufen sollen.
Auf Plattformen, die erst ab FreeBSD?5.0 unterst?tzt werden (wie ia64
und SPARC?), wird diese Option nicht ben?tigt.

.. code:: programlisting

    options          COMPAT_FREEBSD5   # Compatible with FreeBSD5

Diese Option wird ab FreeBSD?6.X ben?tigt, um Programme, die unter
FreeBSD?5.X-Versionen mit FreeBSD?5.X-Systemaufrufen kompiliert wurden,
unter FreeBSD?6.X ausf?hren zu k?nnen.

.. code:: programlisting

    options          COMPAT_FREEBSD6   # Compatible with FreeBSD6

Diese Option wird ab FreeBSD?7.X ben?tigt, um Programme, die unter
FreeBSD?6.X-Versionen mit FreeBSD?6.X-Systemaufrufen kompiliert wurden,
unter FreeBSD?7.X ausf?hren zu k?nnen.

.. code:: programlisting

    options          COMPAT_FREEBSD7   # Compatible with FreeBSD7

Diese Option wird ab FreeBSD?8.X ben?tigt, um Programme, die unter
FreeBSD?7.X-Versionen mit FreeBSD?7.X-Systemaufrufen kompiliert wurden,
unter FreeBSD?8.X ausf?hren zu k?nnen.

.. code:: programlisting

    options          SCSI_DELAY=5000  # Delay (in ms) before probing SCSI

Dies weist den Kernel an, 5?Sekunden zu warten, bevor er anf?ngt nach
SCSI-Ger?ten auf dem System zu suchen. Wenn Sie nur IDE-Ger?te besitzen,
k?nnen Sie die Anweisung ignorieren. Sie k?nnen versuchen, den Wert zu
senken, um den Startvorgang zu beschleunigen. Wenn FreeBSD dann
Schwierigkeiten hat, Ihre SCSI-Ger?te zu erkennen, sollten Sie den Wert
nat?rlich wieder erh?hen.

.. code:: programlisting

    options          KTRACE            # ktrace(1) support

Dies schaltet die Kernel-Prozessverfolgung (engl. *kernel process
tracing*) ein, die sehr n?tzlich bei der Fehlersuche ist.

.. code:: programlisting

    options          SYSVSHM           # SYSV-style shared memory

Diese Option aktiviert die Unterst?tzung f?r System?V Shared-Memory. Die
XSHM-Erweiterung von X ben?tigt diese Option und viele Graphik-Programme
werden die Erweiterung automatisch benutzen und schneller laufen. Wenn
Sie X benutzen, sollten Sie diese Option auf jeden Fall aktivieren.

.. code:: programlisting

    options          SYSVMSG           # SYSV-style message queues

Unterst?tzung f?r System?V Messages. Diese Option vergr??ert den Kernel
nur um einige hundert Bytes.

.. code:: programlisting

    options          SYSVSEM           # SYSV-style semaphores

Unterst?tzung f?r System?V Semaphoren. Dies wird selten gebraucht,
vergr??ert aber den Kernel nur um einige hundert Bytes.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Option ``-p`` des Kommandos
`ipcs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ipcs&sektion=1>`__
zeigt Programme an, die diese System?V Erweiterungen benutzen.

.. raw:: html

   </div>

.. code:: programlisting

    options         _KPOSIX_PRIORITY_SCHEDULING # POSIX P1003_1B real-time extensions

Echtzeit-Erweiterungen, die 1993 zu POSIX? hinzugef?gt wurden. Bestimmte
Programme wie StarOffice™ benutzen diese Erweiterungen.

.. code:: programlisting

    options          KBD_INSTALL_CDEV  # install a CDEV entry in /dev

Diese Option erstellt f?r die Tastatur einen Eintrag im Verzeichnis
``/dev``.

.. code:: programlisting

    options          ADAPTIVE_GIANT    # Giant mutex is adaptive.

Giant ist der Name einer Sperre (Mutex) die viele Kernel-Ressourcen
sch?tzt. Heutzutage ist Giant ein unannehmbarer Engpass, der die
Leistung eines Systems beeintr?chtigt. Daher wird Giant durch Sperren
ersetzt, die einzelne Ressourcen sch?tzen. Die Option ``ADAPTIVE_GIANT``
f?gt Giant zu den Sperren hinzu, auf die gewartet werden kann. Ein
Thread, der die Sperre Giant von einem anderen Thread benutzt vorfindet,
kann nun weiterlaufen und auf die Sperre Giant warten. Fr?her w?re der
Prozess in den schlafenden Zustand (*sleep*) gewechselt und h?tte darauf
warten m?ssen, dass er wieder laufen kann. Wenn Sie sich nicht sicher
sind, belassen Sie diese Option.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Beachten Sie, dass ab FreeBSD 8.0-RELEASE und neuer alle Mutexe in der
Voreinstellung adaptiv sein werden, es sei denn, Sie werden durch das
Setzen der Option ``NO_ADAPTIVE_MUTEXES`` explizit als nichtadaptiv
deklariert. Als Folge dessen ist Giant nun in in der Voreinstellung
ebenfalls adaptiv, daher ist in diesen Versionen die Kerneloption
``ADAPTIVE_GIANT`` nicht mehr in der Kernelkonfigurationsdatei
enthalten.

.. raw:: html

   </div>

.. code:: programlisting

    device          apic               # I/O APIC

Das apic-Ger?lt erm?glicht die Benutzung des I/O APIC f?r die
Interrupt-Auslieferung. Das apic-Ger?lt kann mit Kerneln f?r
Einprozessorsysteme und Mehrprozessorsysteme benutzt werden. Kernel f?r
Mehrprozessorsysteme ben?tigen diese Option zwingend. Die Unterst?tzung
f?r Mehrprozessorsysteme aktivieren Sie mit der Option ``options SMP``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das apic-Ger?t existiert nur unter der i386-Architektur, daher ist es
sinnlos, diese Zeile unter einer anderen Architektur in Ihre
Kernelkonfigurationsdatei aufzunehmen.

.. raw:: html

   </div>

.. code:: programlisting

    device          eisa

F?gen Sie diese Zeile ein, wenn Sie ein EISA-Motherboard besitzen. Dies
aktiviert die Erkennung und Konfiguration von allen Ger?ten auf dem EISA
Bus.

.. code:: programlisting

    device          pci

Wenn Sie ein PCI-Motherboard besitzen, f?gen Sie diese Zeile ein. Dies
aktiviert die Erkennung von PCI-Karten und die PCI-ISA bridge.

.. code:: programlisting

    # Floppy drives
    device          fdc

Der Floppy-Controller.

.. code:: programlisting

    # ATA and ATAPI devices
    device          ata

Dieser Treiber unterst?tzt alle ATA und ATAPI Ger?te. Eine
``device ata`` Zeile reicht aus und der Kernel wird auf modernen
Maschinen alle PCI ATA/ATAPI Ger?te entdecken.

.. code:: programlisting

    device          atadisk                 # ATA disk drives

F?r ATA-Plattenlaufwerke brauchen Sie diese Zeile zusammen mit
``device ata``.

.. code:: programlisting

    device          ataraid                 # ATA RAID drives

F?r ATA-RAID brauchen Sie diese Zeile zusammen mit ``device ata``.

.. code:: programlisting

    device          atapicd                 # ATAPI CDROM drives

Zusammen mit ``device ata`` wird dies f?r ATAPI CD-ROM Laufwerke
ben?tigt.

.. code:: programlisting

    device          atapifd                 # ATAPI floppy drives

Zusammen mit ``device ata`` wird dies f?r ATAPI Floppy Laufwerke
ben?tigt.

.. code:: programlisting

    device          atapist                 # ATAPI tape drives

Zusammen mit ``device ata`` wird dies f?r ATAPI Bandlaufwerke ben?tigt.

.. code:: programlisting

    options         ATA_STATIC_ID           # Static device numbering

Erzwingt eine statische Ger?tenummer f?r den Controller; ohne diese
Option werden die Nummern dynamisch zugeteilt.

.. code:: programlisting

    # SCSI Controllers
    device          ahb        # EISA AHA1742 family
    device          ahc        # AHA2940 and onboard AIC7xxx devices
    options         AHC_REG_PRETTY_PRINT     # Print register bitfields in debug
                                             # output.  Adds ~128k to driver.
    device          ahd        # AHA39320/29320 and onboard AIC79xx devices
    options         AHD_REG_PRETTY_PRINT     # Print register bitfields in debug
                                             # output.  Adds ~215k to driver.
    device          amd        # AMD 53C974 (Teckram DC-390(T))
    device          isp        # Qlogic family
    #device         ispfw      # Firmware for QLogic HBAs- normally a module
    device          mpt        # LSI-Logic MPT-Fusion
    #device         ncr        # NCR/Symbios Logic
    device          sym        # NCR/Symbios Logic (newer chipsets + those of `ncr'))
    device          trm        # Tekram DC395U/UW/F DC315U adapters

    device          adv        # Advansys SCSI adapters
    device          adw        # Advansys wide SCSI adapters
    device          aha        # Adaptec 154x SCSI adapters
    device          aic        # Adaptec 15[012]x SCSI adapters, AIC-6[23]60.
    device          bt         # Buslogic/Mylex MultiMaster SCSI adapters

    device          ncv        # NCR 53C500
    device          nsp        # Workbit Ninja SCSI-3
    device          stg        # TMC 18C30/18C50

SCSI-Controller. Kommentieren Sie alle Controller aus, die sich nicht in
Ihrem System befinden. Wenn Sie ein IDE-System besitzen, k?nnen Sie alle
Eintr?ge entfernen. Die Zeilen mit den ``*_REG_PRETTY_PRINT``-Eintr?gen
aktivieren Debugging-Optionen f?r die jeweiligen Treiber.

.. code:: programlisting

    # SCSI peripherals
    device          scbus      # SCSI bus (required for SCSI)
    device          ch         # SCSI media changers
    device          da         # Direct Access (disks)
    device          sa         # Sequential Access (tape etc)
    device          cd         # CD
    device          pass       # Passthrough device (direct SCSI access)
    device          ses        # SCSI Environmental Services (and SAF-TE)

SCSI Peripherieger?te. Kommentieren Sie wieder alle Ger?te aus, die Sie
nicht besitzen. Besitzer von IDE-Systemen k?nnen alle Eintr?ge
entfernen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Der
USB-\ `umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__-Treiber
und einige andere Treiber benutzen das SCSI-Subsystem obwohl sie keine
SCSI-Ger?te sind. Belassen Sie die SCSI-Unterst?tzung im Kernel, wenn
Sie solche Treiber verwenden.

.. raw:: html

   </div>

.. code:: programlisting

    # RAID controllers interfaced to the SCSI subsystem
    device          amr        # AMI MegaRAID
    device          arcmsr     # Areca SATA II RAID
    device          asr        # DPT SmartRAID V, VI and Adaptec SCSI RAID
    device          ciss       # Compaq Smart RAID 5*
    device          dpt        # DPT Smartcache III, IV - See NOTES for options
    device          hptmv      # Highpoint RocketRAID 182x
    device          hptrr      # Highpoint RocketRAID 17xx, 22xx, 23xx, 25xx
    device          iir        # Intel Integrated RAID
    device          ips        # IBM (Adaptec) ServeRAID
    device          mly        # Mylex AcceleRAID/eXtremeRAID
    device          twa        # 3ware 9000 series PATA/SATA RAID

    # RAID controllers
    device          aac        # Adaptec FSA RAID
    device          aacp       # SCSI passthrough for aac (requires CAM)
    device          ida        # Compaq Smart RAID
    device          mfi        # LSI MegaRAID SAS
    device          mlx        # Mylex DAC960 family
    device          pst        # Promise Supertrak SX6000
    device          twe        # 3ware ATA RAID

Unterst?tzte RAID Controller. Wenn Sie keinen der aufgef?hrten
Controller besitzen, kommentieren Sie die Eintr?ge aus oder entfernen
sie.

.. code:: programlisting

    # atkbdc0 controls both the keyboard and the PS/2 mouse
    device          atkbdc     # AT keyboard controller

Der Tastatur-Controller (``atkbdc``) ist f?r die Ein- und Ausgabe von
AT-Tastaturen und PS/2 Zeigeger?ten (z.B. einer Maus) verantwortlich.
Dieser Controller wird vom Tastaturtreiber (``atkbd``) und dem PS/2
Ger?tetreiber (``psm``) ben?tigt.

.. code:: programlisting

    device          atkbd      # AT keyboard

Zusammen mit dem ``atkbdc`` Controller bietet der ``atkbd`` Treiber
Zugriff auf AT-Tastaturen.

.. code:: programlisting

    device          psm        # PS/2 mouse

Benutzen Sie dieses Ger?t, wenn Sie eine Maus mit PS/2 Anschluss
besitzen.

.. code:: programlisting

    device          kbdmux        # keyboard multiplexer

Basisunterst?tzung f?r Tastaturmultiplexer. Verwenden Sie nur eine
einzige Tastatur, k?nnen Sie diese Zeile aus Ihrer
Kernelkonfigurationsdatei entfernen.

.. code:: programlisting

    device          vga        # VGA video card driver

Der Grafikkartentreiber.

.. code:: programlisting

    device          splash     # Splash screen and screen saver support

Zeigt einen „Splash Screen“ beim Booten. Diese Zeile wird auch von den
Bildschirmschonern ben?tigt.

.. code:: programlisting

    # syscons is the default console driver, resembling an SCO console
    device          sc

``sc`` ist in der Voreinstellung der Treiber f?r die Konsole, die der
SCO-Konsole ?hnelt. Da die meisten bildschirmorientierten Programme auf
die Konsole mit Hilfe einer Datenbank wie ``termcap`` zugreifen, sollte
es keine Rolle spielen, ob Sie diesen Treiber oder ``vt``, den ``VT220``
kompatiblen Konsolentreiber einsetzen. Wenn Sie Probleme mit
bildschirmorientierten Anwendungen unter dieser Konsole haben, setzen
Sie beim Anmelden die Variable ``TERM`` auf den Wert ``VT220``.

.. code:: programlisting

    # Enable this for the pcvt (VT220 compatible) console driver
    #device          vt
    #options         XSERVER          # support for X server on a vt console
    #options         FAT_CURSOR       # start with block cursor

Der VT220 kompatible Konsolentreiber ist kompatibel zu VT100/102. Auf
einigen Laptops, die aufgrund der Hardware inkompatibel zum ``sc``
Treiber sind, funktioniert dieser Treiber gut. Beim Anmelden sollten Sie
die Variable ``TERM`` auf den Wert ``vt100`` setzen. Dieser Treiber kann
sich als n?tzlich erweisen, wenn Sie sich ?ber das Netzwerk auf vielen
verschiedenen Maschinen anmelden, da dort oft Eintr?ge in ``termcap``
oder ``terminfo`` f?r das ``sc`` Ger?t fehlen. Dagegen sollte ``vt100``
auf jeder Plattform unterst?tzt werden.

.. code:: programlisting

    device          agp

F?gen Sie diese Zeile ein, wenn Sie eine AGP-Karte besitzen. Damit
werden Motherboards mit AGP und AGP GART unterst?tzt.

.. code:: programlisting

    # Power management support (see NOTES for more options)
    #device          apm

Unterst?tzung zur Energieverwaltung. Diese Option ist n?tzlich f?r
Laptops, allerdings ist sie in ``GENERIC`` deaktiviert.

.. code:: programlisting

    # Add suspend/resume support for the i8254.
    device           pmtimer

Zeitgeber f?r Ereignisse der Energieverwaltung (APM und ACPI).

.. code:: programlisting

    # PCCARD (PCMCIA) support
    # PCMCIA and cardbus bridge support
    device          cbb               # cardbus (yenta) bridge
    device          pccard            # PC Card (16-bit) bus
    device          cardbus           # CardBus (32-bit) bus

PCMCIA Unterst?tzung. Wenn Sie einen Laptop benutzen, brauchen Sie diese
Zeile.

.. code:: programlisting

    # Serial (COM) ports
    device          sio               # 8250, 16[45]50 based serial ports

Die seriellen Schnittstellen, die in der MS-DOS?- und Windows?-Welt
``COM`` genannt werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie ein internes Modem, das ``COM4`` benutzt, besitzen und eine
serielle Schnittstelle haben, die auf ``COM2`` liegt, m?ssen Sie den IRQ
des Modems auf 2 setzen (wegen undurchsichtigen technischen Gr?nden ist
IRQ2 gleich IRQ9). Wenn Sie eine serielle Multiport-Karte besitzen,
entnehmen Sie bitte die Werte, die Sie in die Datei
``/boot/device.hints`` einf?gen m?ssen, der Hilfeseite
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__.
Einige Graphikkarten, besonders die auf S3-Chips basierten, benutzen
IO-Adressen der Form ``0x*2e8`` und manche billige serielle Karten
dekodieren den 16-Bit IO-Adressraum nicht sauber. Dies f?hrt zu
Konflikten und blockiert dann die ``COM4``-Schnittstelle.

Jeder seriellen Schnittstelle muss ein eigener IRQ zugewiesen werden
(wenn Sie eine Multiport-Karte verwenden, bei der das Teilen von
Interrupts unterst?tzt wird, muss das nicht der Fall sein), daher k?nnen
in der Voreinstellung ``COM3`` und ``COM4`` nicht benutzt werden.

.. raw:: html

   </div>

.. code:: programlisting

    # Parallel port
    device          ppc

Die parallele Schnittstelle auf dem ISA Bus.

.. code:: programlisting

    device          ppbus      # Parallel port bus (required)

Unterst?tzung f?r den Bus auf der parallelen Schnittstelle.

.. code:: programlisting

    device          lpt        # Printer

Unterst?tzung f?r Drucker ?ber die parallele Schnittstelle.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie brauchen jede der drei Zeilen, um die Unterst?tzung f?r einen
Drucker an der parallelen Schnittstelle zu aktivieren.

.. raw:: html

   </div>

.. code:: programlisting

    device          ppi        # Parallel port interface device

Allgemeine I/O („geek port“) und IEEE1284 I/O Unterst?tzung.

.. code:: programlisting

    #device         vpo        # Requires scbus and da

Dies aktiviert den Treiber f?r ein Iomega Zip Laufwerk. Zus?tzlich
ben?tigen Sie noch die Unterst?tzung f?r ``scbus`` und ``da``. Die beste
Performance erzielen Sie, wenn Sie die Schnittstelle im EPP 1.9 Modus
betreiben.

.. code:: programlisting

    #device         puc

Aktivieren Sie diesen Treiber, wenn Sie eine serielle oder parallele
PCI-Karte besitzen, die vom Treiber
`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4>`__
unterst?tzt wird.

.. code:: programlisting

    # PCI Ethernet NICs.
    device          de         # DEC/Intel DC21x4x („Tulip“)
    device          em         # Intel PRO/1000 adapter Gigabit Ethernet Card
    device          ixgb       # Intel PRO/10GbE Ethernet Card
    device          txp        # 3Com 3cR990 („Typhoon“)
    device          vx         # 3Com 3c590, 3c595 („Vortex“)

Verschiedene Treiber f?r PCI-Netzwerkkarten. Ger?te, die sich nicht in
Ihrem System befinden, k?nnen Sie entfernen oder auskommentieren.

.. code:: programlisting

    # PCI Ethernet NICs that use the common MII bus controller code.
    # NOTE: Be sure to keep the 'device miibus' line in order to use these NICs!
    device          miibus     # MII bus support

Einige PCI 10/100 Ethernet Netzwerkkarten, besonders die, die MII-f?hige
Transceiver verwenden oder Transceiver-Steuerungen implementieren, die
?hnlich wie MII funktionieren, ben?tigen die Unterst?tzung f?r den
MII-Bus. Die Zeile ``device miibus`` f?gt dem Kernel die Unterst?tzung
f?r das allgemeine miibus API und allen PHY-Treibern hinzu.

.. code:: programlisting

    device          bce        # Broadcom BCM5706/BCM5708 Gigabit Ethernet
    device          bfe        # Broadcom BCM440x 10/100 Ethernet
    device          bge        # Broadcom BCM570xx Gigabit Ethernet
    device          dc         # DEC/Intel 21143 and various workalikes
    device          fxp        # Intel EtherExpress PRO/100B (82557, 82558)
    device          lge        # Level 1 LXT1001 gigabit ethernet
    device          msk        # Marvell/SysKonnect Yukon II Gigabit Ethernet
    device          nge        # NatSemi DP83820 gigabit ethernet
    device          nve        # nVidia nForce MCP on-board Ethernet Networking
    device          pcn        # AMD Am79C97x PCI 10/100 (precedence over 'lnc')
    device          re         # RealTek 8139C+/8169/8169S/8110S
    device          rl         # RealTek 8129/8139
    device          sf         # Adaptec AIC-6915 („Starfire“)
    device          sis        # Silicon Integrated Systems SiS 900/SiS 7016
    device          sk         # SysKonnect SK-984x & SK-982x gigabit Ethernet
    device          ste        # Sundance ST201 (D-Link DFE-550TX)
    device          stge       # Sundance/Tamarack TC9021 gigabit Ethernet
    device          ti         # Alteon Networks Tigon I/II gigabit Ethernet
    device          tl         # Texas Instruments ThunderLAN
    device          tx         # SMC EtherPower II (83c170 „EPIC“)
    device          vge        # VIA VT612x gigabit ethernet
    device          vr         # VIA Rhine, Rhine II
    device          wb         # Winbond W89C840F
    device          xl         # 3Com 3c90x („Boomerang“, „Cyclone“)

Treiber, die den MII Bus Controller Code benutzen.

.. code:: programlisting

    # ISA Ethernet NICs.  pccard NICs included.
    device          cs         # Crystal Semiconductor CS89x0 NIC
    # 'device ed' requires 'device miibus'
    device          ed         # NE[12]000, SMC Ultra, 3c503, DS8390 cards
    device          ex         # Intel EtherExpress Pro/10 and Pro/10+
    device          ep         # Etherlink III based cards
    device          fe         # Fujitsu MB8696x based cards
    device          ie         # EtherExpress 8/16, 3C507, StarLAN 10 etc.
    device          lnc        # NE2100, NE32-VL Lance Ethernet cards
    device          sn         # SMC's 9000 series of Ethernet chips
    device          xe         # Xircom pccard Ethernet

    # ISA devices that use the old ISA shims
    #device         le

Treiber f?r ISA Ethernet Karten. Schauen Sie in
``/usr/src/sys/i386/conf/NOTES`` nach, um zu sehen, welche Karte von
welchem Treiber unterst?tzt wird.

.. code:: programlisting

    # Wireless NIC cards
    device          wlan       # 802.11 support

Generische 802.11-Unterst?tzung. Diese Zeile wird unbedingt ben?tigt,
wenn Sie WLAN nutzen wollen.

.. code:: programlisting

    device          wlan_wep        # 802.11 WEP support
    device          wlan_ccmp       # 802.11 CCMP support
    device          wlan_tkip       # 802.11 TKIP support

Krypto-Unterst?tzung f?r 802.11-Ger?te. Sie ben?tigen diese Zeilen, wenn
Sie Ihr drahtloses Netzwerk verschl?sseln und die
802.11-Sicherheitsprotokolle einsetzen wollen.

.. code:: programlisting

    device          an              # Aironet 4500/4800 802.11 wireless NICs
    device          ath             # Atheros pci/cardbus NIC's
    device          ath_hal         # Atheros HAL (Hardware Access Layer)
    device          ath_rate_sample # SampleRate tx rate control for ath
    device          awi        # BayStack 660 and others
    device          ral        # Ralink Technology RT2500 wireless NICs.
    device          wi         # WaveLAN/Intersil/Symbol 802.11 wireless NICs.
    #device         wl         # Older non 802.11 Wavelan wireless NIC.

Treiber f?r drahtlose Netzwerkkarten (WLAN).

.. code:: programlisting

    # Pseudo devices
    device   loop          # Network loopback

Das TCP/IP Loopback Device. Wenn Sie eine Telnet oder FTP Verbindung zu
``localhost`` (alias ``127.0.0.1``) aufbauen, erstellen Sie eine
Verbindung zu sich selbst durch dieses Device. Die Angabe dieser Option
ist *verpflichtend*.

.. code:: programlisting

    device   random        # Entropy device

Kryptographisch sicherer Zufallszahlengenerator.

.. code:: programlisting

    device   ether         # Ethernet support

``ether`` brauchen Sie nur, wenn Sie eine Ethernet-Karte besitzen. Der
Treiber unterst?tzt das Ethernet-Protokoll.

.. code:: programlisting

    device   sl            # Kernel SLIP

``sl`` aktiviert die SLIP-Unterst?tzung. SLIP ist fast vollst?ndig von
PPP verdr?ngt worden, da letzteres leichter zu konfigurieren, besser
geeignet f?r Modem zu Modem Kommunikation und m?chtiger ist.

.. code:: programlisting

    device   ppp           # Kernel PPP

Dies ist Kernel Unterst?tzung f?r PPP-W?hlverbindungen. Es existiert
auch eine PPP-Version im Userland, die den ``tun`` Treiber benutzt. Die
Userland-Version ist flexibler und bietet mehr Option wie die Wahl auf
Anforderung.

.. code:: programlisting

    device   tun           # Packet tunnel.

Dies wird vom der Userland PPP benutzt. Die *``Zahl``* hinter ``tun``
gibt die Anzahl der unterst?tzten gleichzeitigen Verbindungen an.
Weitere Informationen erhalten Sie im Abschnitt `PPP <userppp.html>`__
dieses Handbuchs.

.. code:: programlisting

    device   pty           # Pseudo-ttys (telnet etc)

Dies ist ein „Pseudo-Terminal“ oder simulierter Login-Terminal. Er wird
von einkommenden ``telnet`` und ``rlogin`` Verbindungen, xterm und
anderen Anwendungen wie Emacs benutzt.

.. code:: programlisting

    device   md            # Memory „disks“

Pseudo-Ger?t f?r Speicher-Laufwerke.

.. code:: programlisting

    device   gif           # IPv6 and IPv4 tunneling

Dieses Ger?t tunnelt IPv6 ?ber IPv4, IPv4 ?ber IPv6, IPv4 ?ber IPv4 oder
IPv6 ?ber IPv6. Das Ger?t ``gif`` kann die Anzahl der ben?tigten Ger?te
automatisch bestimmen („auto-cloning“).

.. code:: programlisting

    device   faith         # IPv6-to-IPv4 relaying (translation)

Dieses Pseudo-Ger?t f?ngt zu ihm gesendete Pakete ab und leitet Sie zu
einem D?mon weiter, der Verkehr zwischen IPv4 und IPv6 vermittelt.

.. code:: programlisting

    # The `bpf' device enables the Berkeley Packet Filter.
    # Be aware of the administrative consequences of enabling this!
    # Note that 'bpf' is required for DHCP.
    device   bpf           # Berkeley packet filter

Das ist der Berkeley Paketfilter. Dieses Pseudo-Ger?t kann
Netzwerkkarten in den „promiscuous“ Modus setzen und erlaubt es damit,
Pakete auf einem Broadcast Netzwerk (z.B. einem Ethernet) einzufangen.
Die Pakete k?nnen auf der Festplatte gespeichert und mit
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__
untersucht werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__-Ger?t
wird von
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
genutzt, um die IP-Adresse des Default-Routers zu bekommen. Wenn Sie
DHCP benutzen, lassen Sie diese Option bitte aktiviert.

.. raw:: html

   </div>

.. code:: programlisting

    # USB support
    device          uhci          # UHCI PCI->USB interface
    device          ohci          # OHCI PCI->USB interface
    device          ehci          # EHCI PCI->USB interface (USB 2.0)
    device          usb           # USB Bus (required)
    #device         udbp          # USB Double Bulk Pipe devices
    device          ugen          # Generic
    device          uhid          # „Human Interface Devices“
    device          ukbd          # Keyboard
    device          ulpt          # Printer
    device          umass         # Disks/Mass storage - Requires scbus and da
    device          ums           # Mouse
    device          ural          # Ralink Technology RT2500USB wireless NICs
    device          urio          # Diamond Rio 500 MP3 player
    device          uscanner      # Scanners
    # USB Ethernet, requires mii
    device          aue           # ADMtek USB Ethernet
    device          axe           # ASIX Electronics USB Ethernet
    device          cdce          # Generic USB over Ethernet
    device          cue           # CATC USB Ethernet
    device          kue           # Kawasaki LSI USB Ethernet
    device          rue           # RealTek RTL8150 USB Ethernet

Unterst?tzung f?r verschiedene USB Ger?te.

.. code:: programlisting

    # FireWire support
    device          firewire      # FireWire bus code
    device          sbp           # SCSI over FireWire (Requires scbus and da)
    device          fwe           # Ethernet over FireWire (non-standard!)

Verschiedene Firewire-Ger?te.

Mehr Informationen und weitere von FreeBSD unterst?tzte Ger?te entnehmen
Sie bitte ``/usr/src/sys/i386/conf/NOTES``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.6.1. Hohe Speicheranforderungen (PAE)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Systeme mit hohen Speicheranforderungen ben?tigen mehr Speicher als den
auf 4?Gigabyte beschr?nkten User- und Kernel-Adressraum (KVA). Mit dem
Pentium??Pro und neueren CPUs hat Intel den Adressraum auf 36-Bit
erweitert.

Die Physical-Address-Extension (PAE) von Intel?s Pentium??Pro und
neueren Prozessoren unterst?tzt bis zu 64?Gigabyte Speicher. FreeBSD
kann diesen Speicher mit der Option ``PAE`` in der Kernelkonfiguration
nutzen. Die Option gibt es in allen aktuellen FreeBSD-Versionen. Wegen
Beschr?kungen der Intel-Speicherarchitektur wird keine Unterscheidung
zwischen Speicher oberhalb oder unterhalb von 4?Gigabyte getroffen.
Speicher ?ber 4?Gigabyte wird einfach dem zur Verf?gung stehenden
Speicher zugeschlagen.

Sie aktivieren PAE im Kernel, indem Sie die folgende Zeile in die
Kernelkonfigurationsdatei einf?gen:

.. code:: programlisting

    options            PAE

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

FreeBSD unterst?tzt PAE nur auf IA-32 Prozessoren. Die PAE-Unterst?tzung
wurde zudem noch nicht hinreichend getestet und befindet sich im
Vergleich zu anderen Komponenten von FreeBSD noch im Beta-Stadium.

.. raw:: html

   </div>

Die PAE-Unterst?tzung in FreeBSD ist mit den nachstehenden
Einschr?nkungen verbunden:

.. raw:: html

   <div class="itemizedlist">

-  Ein Prozess kann nicht mehr als 4?Gigabyte virtuellen Speicher
   benutzen.

-  Ger?tetreiber, die nicht die
   `bus\_dma(9) <http://www.FreeBSD.org/cgi/man.cgi?query=bus_dma&sektion=9>`__-Schnittstelle
   benutzen, f?hren zusammen mit einem PAE-Kernel zu Datenverlusten.
   Diese Treiber sollen nicht mit einem PAE-Kernel verwendet werden.
   Daher gibt es unter FreeBSD eine zus?tzliche
   PAE-Kernelkonfigurationsdatei, die alle Treiber enth?lt, die mit
   einem PAE-Kernel funktionieren.

-  Einige Systemvariablen werden abh?ngig von der Speichergr??e
   eingestellt. In einem PAE-System mit viel Speicher k?nnen die Werte
   daher zu hoch eingestellt sein. Ein Beispiel ist die sysctl-Variable
   ``kern.maxvnodes``, die die maximale Anzahl von vnodes im Kernel
   bestimmt. Solche Variablen sollten auf einen angemessenen Wert
   eingestellt werden.

-  Es kann erforderlich sein, den virtuellen Adressraum des Kernels
   (KVA) zu vergr??ern oder, wie oben beschrieben, den Wert einer h?ufig
   gebrauchten Kernelvariablen zu verringern. Dies verhindert einen
   ?berlauf des KVAs. Der Adressraum des Kernels kann mit der
   Kerneloption ``KVA_PAGES`` vergr??ert werden.

.. raw:: html

   </div>

Hinweise zur Leistungssteigerung und Stabilit?t entnehmen Sie bitte der
Hilfeseite
`tuning(7) <http://www.FreeBSD.org/cgi/man.cgi?query=tuning&sektion=7>`__.
Die PAE-Unterst?tzung von FreeBSD wird in der Hilfeseite
`pae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pae&sektion=4>`__
beschrieben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------------+-------------------------------------+---------------------------------------------+
| `Zur?ck <kernelconfig-building.html>`__?                     | `Nach oben <kernelconfig.html>`__   | ?\ `Weiter <kernelconfig-trouble.html>`__   |
+--------------------------------------------------------------+-------------------------------------+---------------------------------------------+
| 9.5. Erstellen und Installation eines angepassten Kernels?   | `Zum Anfang <index.html>`__         | ?9.7. Wenn etwas schiefgeht                 |
+--------------------------------------------------------------+-------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
