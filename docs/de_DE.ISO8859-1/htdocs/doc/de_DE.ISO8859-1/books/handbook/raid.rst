==========
19.4. RAID
==========

.. raw:: html

   <div class="navheader">

19.4. RAID
`Zur?ck <disks-adding.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <usb-disks.html>`__

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

19.4. RAID
----------

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

19.4.1. Software-RAID
~~~~~~~~~~~~~~~~~~~~~

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

19.4.1.1. Concatenated-Disk (CCD) konfigurieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div>

Original von Christopher Shumway.

.. raw:: html

   </div>

.. raw:: html

   <div>

?berarbeitet von Jim Brown.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die wichtigsten Faktoren bei der Auswahl von Massenspeichern sind
Geschwindigkeit, Zuverl?ssigkeit und Preis. Selten findet sich eine
ausgewogene Mischung aller drei Faktoren. Schnelle und zuverl?ssige
Massenspeicher sind f?r gew?hnlich teuer. Um die Kosten zu senken, muss
entweder an der Geschwindigkeit oder an der Zuverl?ssigkeit gespart
werden.

Das unten beschriebene System sollte vor allem preiswert sein. Der
n?chst wichtige Faktor war die Geschwindigkeit gefolgt von der
Zuverl?ssigkeit. Die Geschwindigkeit war nicht so wichtig, da ?ber das
Netzwerk auf das System zugegriffen wird. Da alle Daten schon auf CD-Rs
gesichert sind, war die Zuverl?ssigkeit, obwohl wichtig, ebenfalls nicht
von entscheidender Bedeutung.

Die Bewertung der einzelnen Faktoren ist der erste Schritt bei der
Auswahl von Massenspeichern. Wenn Sie vor allem ein schnelles und
zuverl?ssiges Medium ben?tigen und der Preis nicht wichtig ist, werden
Sie ein anderes System als das hier beschriebene zusammenstellen.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.4.1.1.1. Installation der Hardware
'''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Neben der IDE-Systemplatte besteht das System aus drei Western Digital
IDE-Festplatten mit 5400?RPM und einer Kapazit?t von je 30?GB. Insgesamt
stehen also 90?GB Speicherplatz zur Verf?gung. Im Idealfall sollte jede
Festplatte an einen eigenen Controller angeschlossen werden. Um Kosten
zu sparen, wurde bei diesem System darauf verzichtet und an jeden
IDE-Controller eine Master- und eine Slave-Platte angeschlossen.

Beim Reboot wurde das BIOS so konfiguriert, dass es die angeschlossenen
Platten automatisch erkennt und FreeBSD erkannte die Platten ebenfalls:

.. code:: programlisting

    ad0: 19574MB <WDC WD205BA> [39770/16/63] at ata0-master UDMA33
    ad1: 29333MB <WDC WD307AA> [59598/16/63] at ata0-slave UDMA33
    ad2: 29333MB <WDC WD307AA> [59598/16/63] at ata1-master UDMA33
    ad3: 29333MB <WDC WD307AA> [59598/16/63] at ata1-slave UDMA33

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn FreeBSD die Platten nicht erkennt, ?berpr?fen Sie, ob die Jumper
korrekt konfiguriert sind. Die meisten IDE-Festplatten verf?gen ?ber
einen „Cable Select“-Jumper. Die Master- und Slave-Platten werden mit
einem anderen Jumper konfiguriert. Bestimmen Sie den richtigen Jumper
mithilfe der Dokumentation Ihrer Festplatte.

.. raw:: html

   </div>

Als n?chstes sollten Sie ?berlegen, auf welche Art der Speicher zur
Verf?gung gestellt werden soll. Schauen Sie sich dazu
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4>`__
(`Kapitel?23, *Der Vinum Volume Manager* <vinum-vinum.html>`__) und
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ an.
Im hier beschriebenen System wird
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
eingesetzt.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.4.1.1.2. Konfiguration von CCD
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit `ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
k?nnen mehrere gleiche Platten zu einem logischen Dateisystem
zusammengefasst werden. Um
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ zu
benutzen, muss der Kernel mit der entsprechenden Unterst?tzung ?bersetzt
werden. Erg?nzen Sie die Kernelkonfiguration um die nachstehende Zeile.
Anschlie?end m?ssen Sie den Kernel neu ?bersetzen und installieren.

.. code:: programlisting

    pseudo-device   ccd

Alternativ kann
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ auch
als Kernelmodul geladen werden.

Um `ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
zu benutzen, m?ssen die Laufwerke zuerst mit einem Label versehen
werden. Die Label werden mit
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
erstellt:

.. code:: programlisting

    bsdlabel -w ad1 auto
    bsdlabel -w ad2 auto
    bsdlabel -w ad3 auto

Damit wurden die Label ``ad1c``, ``ad2c`` und ``ad3c`` erstellt, die
jeweils das gesamte Laufwerk umfassen.

Im n?chsten Schritt muss der Typ des Labels ge?ndert werden. Die Labels
k?nnen Sie mit
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
editieren:

.. code:: programlisting

    bsdlabel -e ad1
    bsdlabel -e ad2
    bsdlabel -e ad3

F?r jedes Label startet dies den durch ``EDITOR`` gegebenen Editor,
typischerweise
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__.

Ein unver?ndertes Label sieht zum Beispiel wie folgt aus:

.. code:: programlisting

    8 partitions:
    #        size   offset    fstype   [fsize bsize bps/cpg]
      c: 60074784        0    unused        0     0     0   # (Cyl.    0 - 59597)

Erstellen Sie eine ``e``-Partition f?r
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__.
Dazu k?nnen Sie normalerweise die Zeile der ``c``-Partition kopieren,
allerdings muss ``fstype`` auf **``4.2BSD``** gesetzt werden. Das
Ergebnis sollte wie folgt aussehen:

.. code:: programlisting

    8 partitions:
    #        size   offset    fstype   [fsize bsize bps/cpg]
      c: 60074784        0    unused        0     0     0   # (Cyl.    0 - 59597)
      e: 60074784        0    4.2BSD        0     0     0   # (Cyl.    0 - 59597)

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.4.1.1.3. Erstellen des Dateisystems
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem alle Platten ein Label haben, kann das
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__-RAID
aufgebaut werden. Dies geschieht mit
`ccdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ccdconfig&sektion=8>`__:

.. code:: programlisting

    ccdconfig ccd0 32 0 /dev/ad1e /dev/ad2e /dev/ad3e

Die folgende Aufstellung erkl?rt die verwendeten
Kommandozeilenargumente:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ccd-dev>`__                | Das erste Argument gibt das zu       |
|                                      | konfigurierende Ger?t, hier          |
|                                      | ``/dev/ccd0c``, an. Die Angabe von   |
|                                      | ``/dev/`` ist dabei optional.        |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ccd-interleave>`__         | Der Interleave f?r das Dateisystem.  |
|                                      | Der Interleave definiert die Gr??e   |
|                                      | eines Streifens in Bl?cken, die      |
|                                      | normal 512?Bytes gro? sind. Ein      |
|                                      | Interleave von 32 ist demnach        |
|                                      | 16384?Bytes gro?.                    |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ccd-flags>`__              | Weitere Argumente f?r                |
|                                      | `ccdconfig(8) <http://www.FreeBSD.or |
|                                      | g/cgi/man.cgi?query=ccdconfig&sektio |
|                                      | n=8>`__.                             |
|                                      | Wenn Sie spiegeln wollen, k?nnen Sie |
|                                      | das hier angeben. Die gezeigte       |
|                                      | Konfiguration verwendet keine        |
|                                      | Spiegel, sodass der Wert ``0``       |
|                                      | angegeben ist.                       |
+--------------------------------------+--------------------------------------+
| `|4| <#co-ccd-devs>`__               | Das letzte Argument gibt die Ger?te  |
|                                      | des Plattenverbundes an. Benutzen    |
|                                      | Sie f?r jedes Ger?t den kompletten   |
|                                      | Pfadnamen.                           |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Nach Abschlu? von
`ccdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ccdconfig&sektion=8>`__
ist der Plattenverbund konfiguriert und es k?nnen Dateisysteme auf dem
Plattenverbund angelegt werden. Das Anlegen von Dateisystemen wird in
der Hilfeseite
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
beschrieben. F?r das Beispiel gen?gt der folgende Befehl:

.. code:: programlisting

    newfs /dev/ccd0c

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.4.1.1.4. Automatisierung
'''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ beim
Start automatisch aktiviert wird, ist die Datei ``/etc/ccd.conf`` mit
dem folgenden Kommando zu erstellen:

.. code:: programlisting

    ccdconfig -g > /etc/ccd.conf

Wenn ``/etc/ccd.conf`` existiert, wird beim Reboot ``ccdconfig -C`` von
``/etc/rc`` aufgerufen. Damit wird
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
eingerichtet und die darauf befindlichen Dateisysteme k?nnen angeh?ngt
werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie in den Single-User Modus booten, m?ssen Sie den Verbund erst
konfigurieren, bevor Sie darauf befindliche Dateisysteme anh?ngen
k?nnen:

.. code:: programlisting

    ccdconfig -C

.. raw:: html

   </div>

In ``/etc/fstab`` ist noch ein Eintrag f?r das auf dem Verbund
befindliche Dateisystem zu erstellen, damit dieses beim Start des
Systems immer angeh?ngt wird:

.. code:: programlisting

    /dev/ccd0c              /media       ufs     rw      2       2

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

19.4.1.2. Der Vinum-Volume-Manager
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Vinum Volume Manager ist ein Block-Ger?tetreiber, der virtuelle
Platten zur Verf?gung stellt. Er trennt die Verbindung zwischen der
Festplatte und dem zugeh?rigen Block-Ger?t auf. Im Gegensatz zur
konventionellen Aufteilung einer Platte in Slices lassen sich dadurch
Daten flexibler, leistungsf?higer und zuverl?ssiger verwalten.
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4>`__
stellt RAID-0, RAID-1 und RAID-5 sowohl einzeln wie auch in Kombination
zur Verf?gung.

Mehr Informationen ?ber
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4>`__
erhalten Sie in `Kapitel?23, *Der Vinum Volume
Manager* <vinum-vinum.html>`__.

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

19.4.2. Hardware-RAID
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD unterst?tzt eine Reihe von RAID-Controllern. Diese Ger?te
verwalten einen Plattenverbund; zus?tzliche Software wird nicht
ben?tigt.

Der Controller steuert mithilfe eines BIOS auf der Karte die
Plattenoperationen. Wie ein RAID System eingerichtet wird, sei kurz am
Beispiel des Promise IDE RAID-Controllers gezeigt. Nachdem die Karte
eingebaut ist und der Rechner neu gestartet wurde, erscheint eine
Eingabeaufforderung. Wenn Sie den Anweisungen auf dem Bildschirm folgen,
gelangen Sie in eine Maske, in der Sie mit den vorhandenen Festplatten
ein RAID-System aufbauen k?nnen. FreeBSD behandelt das RAID-System wie
eine einzelne Festplatte.

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

19.4.3. Wiederherstellen eines ATA-RAID-1 Verbunds
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit FreeBSD k?nnen Sie eine ausgefallene Platte in einem RAID-Verbund
w?hrend des Betriebs auswechseln, vorausgesetzt Sie bemerken den Ausfall
vor einem Neustart.

Einen Ausfall erkennen Sie, wenn in der Datei ``/var/log/messages`` oder
in der Ausgabe von
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
Meldungen wie die folgenden auftauchen:

.. code:: programlisting

    ad6 on monster1 suffered a hard error.
    ad6: READ command timeout tag=0 serv=0 - resetting
    ad6: trying fallback to PIO mode
    ata3: resetting devices .. done
    ad6: hard error reading fsbn 1116119 of 0-7 (ad6 bn 1116119; cn 1107 tn 4 sn 11)\\
    status=59 error=40
    ar0: WARNING - mirror lost

?berpr?fen Sie den RAID-Verbund mit
`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8>`__:

.. code:: screen

    # atacontrol list
    ATA channel 0:
        Master:      no device present
        Slave:   acd0 <HL-DT-ST CD-ROM GCR-8520B/1.00> ATA/ATAPI rev 0

    ATA channel 1:
        Master:      no device present
        Slave:       no device present

    ATA channel 2:
        Master:  ad4 <MAXTOR 6L080J4/A93.0500> ATA/ATAPI rev 5
        Slave:       no device present

    ATA channel 3:
        Master:  ad6 <MAXTOR 6L080J4/A93.0500> ATA/ATAPI rev 5
        Slave:       no device present

    # atacontrol status ar0
    ar0: ATA RAID1 subdisks: ad4 ad6 status: DEGRADED

.. raw:: html

   <div class="procedure">

#. Damit Sie die Platte ausbauen k?nnen, muss zuerst der ATA-Channel der
   ausgefallenen Platte aus dem Verbund entfernt werden:

   .. code:: screen

       # atacontrol detach ata3

#. Ersetzen Sie dann die Platte.

#. Nun aktivieren Sie den ATA-Channel wieder:

   .. code:: screen

       # atacontrol attach ata3
       Master:  ad6 <MAXTOR 6L080J4/A93.0500> ATA/ATAPI rev 5
       Slave:   no device present

#. Nehmen Sie die neue Platte in den Verbund auf:

   .. code:: screen

       # atacontrol addspare ar0 ad6

#. Stellen Sie die Organisation des Verbunds wieder her:

   .. code:: screen

       # atacontrol rebuild ar0

#. Sie k?nnen den Fortschritt des Prozesses durch folgende Befehle
   kontrollieren:

   .. code:: screen

       # dmesg | tail -10
       [output removed]
       ad6: removed from configuration
       ad6: deleted from ar0 disk1
       ad6: inserted into ar0 disk1 as spare

       # atacontrol status ar0
       ar0: ATA RAID1 subdisks: ad4 ad6 status: REBUILDING 0% completed

#. Warten Sie bis die Wiederherstellung beendet ist.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+----------------------------------+
| `Zur?ck <disks-adding.html>`__?    | `Nach oben <disks.html>`__    | ?\ `Weiter <usb-disks.html>`__   |
+------------------------------------+-------------------------------+----------------------------------+
| 19.3. Hinzuf?gen von Laufwerken?   | `Zum Anfang <index.html>`__   | ?19.5. USB Speichermedien        |
+------------------------------------+-------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
