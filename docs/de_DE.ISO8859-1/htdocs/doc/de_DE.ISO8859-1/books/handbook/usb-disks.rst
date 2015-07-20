========================
19.5. USB Speichermedien
========================

.. raw:: html

   <div class="navheader">

19.5. USB Speichermedien
`Zur?ck <raid.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <creating-cds.html>`__

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

19.5. USB Speichermedien
------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Universal Serial Bus (USB) wird heutzutage von vielen externen
Speichern benutzt: Festplatten, USB-Thumbdrives oder CD-Brennern, die
alle von FreeBSD unterst?tzt werden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.5.1. USB-Konfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

USB-Massenspeicher werden vom Treiber
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__
betrieben. Wenn Sie den ``GENERIC``-Kernel benutzen, brauchen Sie keine
Anpassungen vorzunehmen. Benutzen Sie einen angepassten Kernel, m?ssen
die nachstehenden Zeilen in der Kernelkonfigurationsdatei enthalten
sein:

.. code:: programlisting

    device scbus
    device da
    device pass
    device uhci
    device ohci
    device ehci
    device usb
    device umass

Der Treiber
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__
greift ?ber das SCSI-Subsystem auf die USB-Ger?te zu. Ihre USB-Ger?te
werden daher vom System als SCSI-Ger?te erkannt. Abh?ngig vom Chipsatz
Ihrer Systemplatine ben?tigen Sie in der Kernelkonfiguration entweder
die Option ``device uhci`` oder die Option ``device ohci`` f?r die
Unterst?tzung von USB 1.1. Die Kernelkonfiguration kann allerdings auch
beide Optionen enthalten. Unterst?tzung f?r USB 2.0 Controller wird
durch den
`ehci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ehci&sektion=4>`__-Treiber
geleistet (die ``device ehci`` Zeile). Vergessen Sie bitte nicht, einen
neuen Kernel zu bauen und zu installieren, wenn Sie die
Kernelkonfiguration ver?ndert haben.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn es sich bei Ihrem USB-Ger?t um einen CD-R- oder DVD-Brenner
handelt, m?ssen Sie den Treiber
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4>`__ f?r
SCSI-CD-ROMs in die Kernelkonfiguration aufnehmen:

.. code:: programlisting

    device cd

Da der Brenner als SCSI-Laufwerk erkannt wird, sollten Sie den Treiber
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4>`__
nicht benutzen.

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

19.5.2. Die USB-Konfiguration testen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen das USB-Ger?t nun testen. Schlie?en Sie das Ger?t an und
untersuchen Sie die Systemmeldungen
(`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__),
Sie sehen Ausgaben wie die folgende:

.. code:: screen

    umass0: USB Solid state disk, rev 1.10/1.00, addr 2
    GEOM: create disk da0 dp=0xc2d74850
    da0 at umass-sim0 bus 0 target 0 lun 0
    da0: <Generic Traveling Disk 1.11> Removable Direct Access SCSI-2 device
    da0: 1.000MB/s transfers
    da0: 126MB (258048 512 byte sectors: 64H 32S/T 126C)

Die Ausgaben, wie das erkannte Ger?t oder der Ger?tename (``da0``)
h?ngen nat?rlich von Ihrer Konfiguration ab.

Da ein USB-Ger?t als SCSI-Ger?t erkannt wird, k?nnen Sie
USB-Massenspeicher mit dem Befehl ``camcontrol`` anzeigen:

.. code:: screen

    # camcontrol devlist
    <Generic Traveling Disk 1.11>      at scbus0 target 0 lun 0 (da0,pass0)

Wenn auf dem Laufwerk ein Dateisystem eingerichtet ist, sollten Sie das
Dateisystem einh?ngen k?nnen. `Abschnitt?19.3, „Hinzuf?gen von
Laufwerken“ <disks-adding.html>`__ beschreibt, wie Sie USB-Laufwerke
formatieren und Partitionen einrichten.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Aus Sicherheitsgr?nden sollten Sie Benutzern, denen Sie nicht vertrauen,
das Einh?ngen (z.B. durch die unten beschriebene Aktivierung von
``vfs.usermount``) beliebiger Medien verbieten. Die meisten Dateisysteme
in FreeBSD wurden nicht entwickelt, um sich vor b?swilligen Ger?ten zu
sch?tzen.

.. raw:: html

   </div>

Damit auch normale Anwender (ohne ``root``-Rechte) USB-Laufwerke
einh?ngen k?nnen, m?ssen Sie Ihr System erst entsprechend konfigurieren.
Als erstes m?ssen Sie sicherstellen, dass diese Anwender auf die beim
Einh?ngen eines USB-Laufwerks dynamisch erzeugten Ger?tedateien
zugreifen d?rfen. Dazu k?nnen Sie beispielsweise mit
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ alle
potentiellen Benutzer dieser Ger?tedateien in die Gruppe ``operator``
aufnehmen. Au?erdem muss sichergestellt werden, dass Mitglieder der
Gruppe ``operator`` Schreib- und Lesezugriff auf diese Ger?tedateien
haben. Dazu f?gen Sie die folgenden Zeilen in die Konfigurationsdatei
``/etc/devfs.rules`` ein:

.. code:: programlisting

    [localrules=5]
    add path 'da*' mode 0660 group operator

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Verf?gt Ihr System auch ?ber SCSI-Laufwerke, gibt es eine Besonderheit.
Haben Sie beispielsweise die SCSI-Laufwerke ``da0`` bis ``da2``
installiert, so sieht die zweite Zeile wie folgt aus:

.. code:: programlisting

    add path 'da[3-9]*' mode 0660 group operator

Dadurch werden die bereits vorhandenen SCSI-Laufwerke nicht in die
Gruppe ``operator`` aufgenommen.

.. raw:: html

   </div>

Vergessen Sie nicht, die
`devfs.rules(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs.rules&sektion=5>`__-Regeln
in der Datei ``/etc/rc.conf`` zu aktivieren:

.. code:: programlisting

    devfs_system_ruleset="localrules"

Als n?chstes m?ssen Sie Ihre Kernelkonfiguration anpassen, damit auch
normale Benutzer Dateisysteme mounten d?rfen. Dazu f?gen Sie am besten
folgende Zeile in die Konfigurationsdatei ``/etc/sysctl.conf`` ein:

.. code:: programlisting

    vfs.usermount=1

Damit diese Einstellung wirksam wird, m?ssen Sie Ihr System neu starten.
Alternativ k?nnen Sie diese Variable auch mit
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
setzen.

Zuletzt m?ssen Sie noch ein Verzeichnis anlegen, in das das USB-Laufwerk
eingeh?ngt werden soll. Dieses Verzeichnis muss dem Benutzer geh?ren,
der das USB-Laufwerk in den Verzeichnisbaum einh?ngen will. Dazu legen
Sie als ``root`` ein Unterverzeichnis ``/mnt/username`` an (wobei Sie
*``username``* durch den Login des jeweiligen Benutzers sowie
*``usergroup``* durch die prim?re Gruppe des Benutzers ersetzen):

.. code:: screen

    # mkdir /mnt/username
     # chown username:usergroup /mnt/username

Wenn Sie nun beispielsweise einen USB-Stick anschlie?en, wird
automatisch die Ger?tedatei ``/dev/da0s1`` erzeugt. Da derartige Ger?te
in der Regel mit dem FAT-Dateisystem formatiert sind, k?nnen Sie sie
beispielsweise mit dem folgenden Befehl in den Verzeichnisbaum
einh?ngen:

.. code:: screen

    % mount -t msdosfs -o -m=644,-M=755 /dev/da0s1 /mnt/username

Wenn Sie das Ger?t entfernen (das Dateisystem m?ssen Sie vorher
abh?ngen), sehen Sie in den Systemmeldungen Eintr?ge wie die folgenden:

.. code:: screen

    umass0: at uhub0 port 1 (addr 2) disconnected
    (da0:umass-sim0:0:0:0): lost device
    (da0:umass-sim0:0:0:0): removing device entry
    GEOM: destroy disk da0 dp=0xc2d74850
    umass0: detached

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

19.5.3. Weiteres zu USB
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Neben den Abschnitten `Hinzuf?gen von Laufwerken <disks-adding.html>`__
und `Anh?ngen und Abh?ngen von Dateisystemen <mount-unmount.html>`__
lesen Sie bitte die Hilfeseiten
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__,
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__
f?r FreeBSD?8.X oder
`usbdevs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdevs&sektion=8>`__
bei vorherigen Versionen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <raid.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <creating-cds.html>`__   |
+---------------------------+-------------------------------+-------------------------------------+
| 19.4. RAID?               | `Zum Anfang <index.html>`__   | ?19.6. CDs benutzen                 |
+---------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
