===============================
19.3. Hinzuf?gen von Laufwerken
===============================

.. raw:: html

   <div class="navheader">

19.3. Hinzuf?gen von Laufwerken
`Zur?ck <disks-naming.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <raid.html>`__

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

19.3. Hinzuf?gen von Laufwerken
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Im Original von David O'Brian.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der folgende Abschnitt beschreibt, wie Sie ein neues SCSI-Laufwerk zu
einer Maschine hinzuf?gen, die momentan nur ein Laufwerk hat. Dazu
schalten Sie zuerst den Rechner aus und installieren das Laufwerk
entsprechend der Anleitungen Ihres Rechners, Ihres Controllers und des
Laufwerkherstellers. Den genauen Ablauf k?nnen wir wegen der gro?en
Abweichungen leider nicht beschreiben.

Nachdem Sie das Laufwerk installiert haben, melden Sie sich als Benutzer
``root`` an und kontrollieren Sie ``/var/run/dmesg.boot``, um
sicherzustellen, dass das neue Laufwerk gefunden wurde. Das neue
Laufwerk wird, um das Beispiel fortzuf?hren, ``da1`` hei?en und soll
unter ``/1`` eingeh?ngt werden. F?gen Sie eine IDE-Platte hinzu, wird
diese den Namen ``ad1`` erhalten.

Da FreeBSD auf IBM-PC kompatiblen Rechnern l?uft, muss es die PC
BIOS-Partitionen, die verschieden von den traditionellen BSD-Partitionen
sind, ber?cksichtigen. Eine PC Platte kann bis zu vier BIOS-Partitionen
enthalten. Wenn die Platte ausschlie?lich f?r FreeBSD verwendet wird,
k?nnen Sie den *dedicated* Modus benutzen, ansonsten muss FreeBSD in
eine der BIOS-Partitionen installiert werden. In FreeBSD hei?en die PC
BIOS-Partitionen *Slices*, um sie nicht mit den traditionellen
BSD-Partitionen zu verwechseln. Sie k?nnen auch Slices auf einer Platte
verwenden, die ausschlie?lich von FreeBSD benutzt wird, sich aber in
einem Rechner befindet, der noch ein anderes Betriebssystem installiert
hat. Dadurch stellen Sie sicher, dass Sie ``fdisk`` des anderen
Betriebssystems noch benutzen k?nnen.

Im Fall von Slices wird die Platte als ``/dev/da1s1e`` hinzugef?gt. Das
hei?t: SCSI-Platte, Einheit 1 (die zweite SCSI-Platte), Slice 1 (PC
BIOS-Partition 1) und die ``e`` BSD-Partition. Wird die Platte
ausschlie?lich f?r FreeBSD verwendet („dangerously dedicated“), wird sie
einfach als ``/dev/da1e`` hinzugef?gt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Da
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
zum Speichern von Sektoren 32-Bit Integer verwendet, ist das Werkzeug in
den meisten F?llen auf 2^32-1 Sektoren pro Laufwerk oder 2?TB
beschr?nkt. In
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__
darf der Startsektor nicht gr??er als 2^32-1 sein und Partitionen sind
auf eine L?nge von 2^32-1 beschr?nkt. In den meisten F?llen beschr?nkt
dies die Gr??e einer Partition auf 2?TB und die maximale Gr??e eines
Laufwerks auf 4?TB. Das
`sunlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sunlabel&sektion=8>`__-Format
ist mit 2^32-1 Sektoren pro Partition und 8?Partitionen auf 16?TB
beschr?nkt. Mit gr??eren Laufwerken k?nnen
`gpt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpt&sektion=8>`__-Partitionen
benutzt werden, um GPT-Partitionen zu erstellen. GPT hat den
zus?tzlichen Vorteil, dass es nicht auf 4 Slices beschr?nkt ist.

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

19.3.1. Verwenden von `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. **Das sysinstall Men?**

   Um ein Laufwerk zu partitionieren und zu labeln, kann das
   men?gest?tzte ``sysinstall`` benutzt werden. Dazu melden Sie sich als
   ``root`` an oder benutzen ``su``, um ``root`` zu werden. Starten Sie
   ``sysinstall`` und w?hlen das ``Configure`` Men?, w?hlen Sie dort den
   Punkt ``Fdisk`` aus.

#. **Partitionieren mit fdisk**

   Innerhalb von fdisk geben Sie **A** ein, um die ganze Platte f?r
   FreeBSD zu benutzen. Beantworten Sie die Frage „remain cooperative
   with any future possible operating systems“ mit ``YES``. **W**
   schreibt die ?nderung auf die Platte, danach k?nnen Sie fdisk mit
   **Q** verlassen. Da Sie eine Platte zu einem schon laufenden System
   hinzugef?gt haben, beantworten Sie die Frage nach dem Master Boot
   Record mit ``None``.

#. **Disk-Label-Editor**

   Als n?chstes m?ssen Sie sysinstall verlassen und es erneut starten.
   Folgen Sie dazu bitte den Anweisungen von oben, aber w?hlen Sie
   dieses Mal die Option ``Label``, um in den ``Disk Label Editor`` zu
   gelangen. Hier werden die traditionellen BSD-Partitionen erstellt.
   Ein Laufwerk kann acht Partitionen, die mit den Buchstaben ``a-h``
   gekennzeichnet werden, besitzen. Einige Partitionen sind f?r
   spezielle Zwecke reserviert. Die ``a`` Partition ist f?r die
   Root-Partition (``/``) reserviert. Deshalb sollte nur das Laufwerk,
   von dem gebootet wird, eine ``a`` Partition besitzen. Die ``b``
   Partition wird f?r Swap-Partitionen benutzt, wobei Sie diese auf
   mehreren Platten benutzen d?rfen. Im „dangerously dedicated“ Modus
   spricht die ``c`` Partition die gesamte Platte an, werden Slices
   verwendet, wird damit die ganze Slice angesprochen. Die anderen
   Partitionen sind f?r allgemeine Zwecke verwendbar.

   Der Label Editor von sysinstall bevorzugt die ``e`` Partition f?r
   Partitionen, die weder Root-Partitionen noch Swap-Partitionen sind.
   Im Label Editor k?nnen Sie ein einzelnes Dateisystem mit **C**
   erstellen. W?hlen Sie ``FS``, wenn Sie gefragt werden, ob Sie ein FS
   (Dateisystem) oder Swap erstellen wollen, und geben Sie einen
   Mountpoint z.B. ``/mnt`` an. Wenn Sie nach einer FreeBSD-Installation
   ein Dateisystem mit sysinstall erzeugen, so werden die Eintr?ge in
   ``/etc/fstab`` nicht erzeugt, so dass die Angabe des Mountpoints
   nicht wichtig ist.

   Sie k?nnen nun das Label auf das Laufwerk schreiben und das
   Dateisystem erstellen, indem Sie **W** dr?cken. Ignorieren Sie die
   Meldung von sysinstall, dass die neue Partition nicht angehangen
   werden konnte, und verlassen Sie den Label Editor sowie sysinstall.

#. **Ende**

   Im letzten Schritt f?gen Sie noch in ``/etc/fstab`` den Eintrag f?r
   das neue Laufwerk ein.

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

19.3.2. Die Kommandozeile
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

19.3.2.1. Anlegen von Slices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit der folgenden Vorgehensweise wird eine Platte mit anderen
Betriebssystemen, die vielleicht auf Ihrem Rechner installiert sind,
zusammenarbeiten und nicht das ``fdisk`` Programm anderer
Betriebssysteme st?ren. Bitte benutzen Sie den ``dedicated`` Modus nur
dann, wenn Sie dazu einen guten Grund haben!

.. code:: screen

    # dd if=/dev/zero of=/dev/da1 bs=1k count=1
    # fdisk -BI da1 # Initialisieren der neuen Platte
    # bsdlabel -B -w da1s1 auto #Labeln.
    # bsdlabel -e da1s1 # Editieren des Disklabels und Hinzuf?gen von Partitionen
    # mkdir -p /1
    # newfs /dev/da1s1e # Wiederholen Sie diesen Schritt f?r jede Partition
    # mount /dev/da1s1e /1 # Anh?ngen der Partitionen
    # vi /etc/fstab # ?ndern Sie /etc/fstab entsprechend

Wenn Sie ein IDE-Laufwerk besitzen, ?ndern Sie ``da`` in ``ad``.

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

19.3.2.2. Dedicated
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn das neue Laufwerk nicht von anderen Betriebssystemen benutzt werden
soll, k?nnen Sie es im ``dedicated`` Modus betreiben. Beachten Sie
bitte, dass Microsoft-Betriebssysteme mit diesem Modus eventuell nicht
zurechtkommen, aber es entsteht kein Schaden am Laufwerk. Im Gegensatz
dazu wird IBMs OS/2? versuchen, jede ihm nicht bekannte Partition zu
reparieren.

.. code:: screen

    # dd if=/dev/zero of=/dev/da1 bs=1k count=1
    # bsdlabel -Bw da1 auto
    # bsdlabel -e da1  # Erstellen der `e' Partition
    # newfs /dev/da1e
    # mkdir -p /1
    # vi /etc/fstab # /dev/da1e hinzuf?gen
    # mount /1

Eine alternative Methode:

.. code:: screen

    # dd if=/dev/zero of=/dev/da1 count=2
    # bsdlabel /dev/da1 | bsdlabel -BR da1 /dev/stdin
    # newfs /dev/da1e
    # mkdir -p /1
    # vi /etc/fstab # /dev/da1e hinzuf?gen
    # mount /1

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+-----------------------------+
| `Zur?ck <disks-naming.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <raid.html>`__   |
+-----------------------------------+-------------------------------+-----------------------------+
| 19.2. Ger?tenamen?                | `Zum Anfang <index.html>`__   | ?19.4. RAID                 |
+-----------------------------------+-------------------------------+-----------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
