==================
19.6. CDs benutzen
==================

.. raw:: html

   <div class="navheader">

19.6. CDs benutzen
`Zur?ck <usb-disks.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <creating-dvds.html>`__

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

19.6. CDs benutzen
------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigesteuert von Mike Meyer.

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

19.6.1. Einf?hrung
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CDs besitzen einige Eigenschaften, die sie von konventionellen
Laufwerken unterscheiden. Zuerst konnten sie nicht beschrieben werden.
Sie wurden so entworfen, dass sie ununterbrochen, ohne Verz?gerungen
durch Kopfbewegungen zwischen den Spuren, gelesen werden k?nnen. Sie
konnten fr?her auch leichter als vergleichbar gro?e Medien zwischen
Systemen bewegt werden.

CDs besitzen Spuren, aber damit ist der Teil Daten gemeint, der
ununterbrochen gelesen wird, und nicht eine physikalische Eigenschaft
der CD. Um eine CD mit FreeBSD zu erstellen, werden die Daten jeder Spur
der CD in Dateien vorbereitet und dann die Spuren auf die CD
geschrieben.

Das ISO 9660-Dateisystem wurde entworfen, um mit diesen Unterschieden
umzugehen. Leider hat es auch damals ?bliche Grenzen f?r Dateisysteme
implementiert. Gl?cklicherweise existiert ein Erweiterungsmechanismus,
der es korrekt geschriebenen CDs erlaubt, diese Grenzen zu ?berschreiten
und dennoch auf Systemen zu funktionieren, die diese Erweiterungen nicht
unterst?tzen.

Der Port
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
enth?lt das Programm
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__,
das eine Datei erstellt, die ein ISO 9660-Dateisystem enth?lt. Das
Programm hat Optionen, um verschiedene Erweiterungen zu unterst?tzen,
und wird unten beschrieben.

Welches Tool Sie zum Brennen von CDs benutzen, h?ngt davon ab, ob Ihr
CD-Brenner ein ATAPI-Ger?t ist oder nicht. Mit ATAPI-CD-Brennern wird
``burncd`` benutzt, das Teil des Basissystems ist. SCSI- und
USB-CD-Brenner werden mit ``     cdrecord`` aus
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
benutzt. Zus?tzlich ist es m?glich, ?ber das Modul
`ATAPI/CAM <creating-cds.html#atapicam>`__ SCSI-Werkzeuge wie
``cdrecord`` auch f?r ATAPI-Ger?te einzusetzen.

Wenn Sie eine Brennsoftware mit grafischer Benutzeroberfl?che ben?tigen,
sollten Sie sich X-CD-Roast oder K3b n?her ansehen. Diese Werkzeuge
k?nnen als Paket oder aus den Ports
(`sysutils/xcdroast <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/xcdroast/pkg-descr>`__
und
`sysutils/k3b <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/k3b/pkg-descr>`__)
installiert werden. Mit ATAPI-Hardware ben?tigt K3b das
`ATAPI/CAM-Modul <creating-cds.html#atapicam>`__.

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

19.6.2. mkisofs
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Programm
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
aus dem Port
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
erstellt ein ISO 9660-Dateisystem, das ein Abbild eines
Verzeichnisbaumes ist. Die einfachste Anwendung ist wie folgt:

.. code:: screen

    # mkisofs -o Imagedatei /path/to/tree

Dieses Kommando erstellt eine *``Imagedatei``*, die ein ISO
9660-Dateisystem enth?lt, das eine Kopie des Baumes unter
*``/path/to/tree``* ist. Dabei werden die Dateinamen auf Namen
abgebildet, die den Restriktionen des ISO 9660-Dateisystems entsprechen.
Dateien mit Namen, die im ISO 9660-Dateisystem nicht g?ltig sind,
bleiben unber?cksichtigt.

Es einige Optionen, um diese Beschr?nkungen zu ?berwinden. Die unter
UNIX? Systemen ?blichen Rock-Ridge-Erweiterungen werden durch ``-R``
aktiviert, ``-J`` aktiviert die von Microsoft Systemen benutzten
Joliet-Erweiterungen und ``-hfs`` dient dazu, um das von Mac?OS?
benutzte HFS zu erstellen.

F?r CDs, die nur auf FreeBSD-Systemen verwendet werden sollen, kann
``-U`` genutzt werden, um alle Beschr?nkungen f?r Dateinamen aufzuheben.
Zusammen mit ``-R`` wird ein Abbild des Dateisystems, ausgehend von dem
Startpunkt im FreeBSD-Dateibaum, erstellt, obwohl dies den ISO 9660
Standard verletzen kann.

Die letzte ?bliche Option ist ``-b``. Sie wird benutzt, um den Ort eines
Bootimages einer „El Torito“ bootbaren CD anzugeben. Das Argument zu
dieser Option ist der Pfad zu einem Bootimage ausgehend von der Wurzel
des Baumes, der auf die CD geschrieben werden soll. In der
Voreinstellung erzeugt
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
ein ISO-Image im „Diskettenemulations“-Modus. Dabei muss das Image genau
1200, 1440 oder 2880?KB gro? sein. Einige Bootloader, darunter der auf
den FreeBSD-Disks verwendete, kennen keinen Emulationsmodus. Daher
sollten Sie in diesen F?llen die Option ``-no-emul-boot`` verwenden.
Wenn ``/tmp/myboot`` ein bootbares FreeBSD-System enth?lt, dessen
Bootimage sich in ``/tmp/myboot/boot/cdboot`` befindet, k?nnen Sie ein
Abbild eines ISO 9660-Dateisystems in ``/tmp/bootable.iso`` wie folgt
erstellen:

.. code:: screen

    # mkisofs -R -no-emul-boot -b boot/cdboot -o /tmp/bootable.iso /tmp/myboot

Wenn Sie ``md`` in Ihrem Kernel konfiguriert haben, k?nnen Sie danach
das Dateisystem einh?ngen:

.. code:: screen

    # mdconfig -a -t vnode -f /tmp/bootable.iso -u 0
    # mount -t cd9660 /dev/md0 /mnt

Jetzt k?nnen Sie ?berpr?fen, dass ``/mnt`` und ``/tmp/myboot`` identisch
sind.

Sie k?nnen das Verhalten von
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
mit einer Vielzahl von Optionen beeinflussen. Insbesondere k?nnen Sie
das ISO 9660-Dateisystem modifizieren und Joliet- oder HFS-Dateisysteme
brennen. Details dazu entnehmen Sie bitte der Hilfeseite
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__.

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

19.6.3. burncd
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie einen ATAPI-CD-Brenner besitzen, k?nnen Sie ``burncd``
benutzen, um ein ISO-Image auf CD zu brennen. ``burncd`` ist Teil des
Basissystems und unter ``/usr/sbin/burncd`` installiert. Da es nicht
viele Optionen hat, ist es leicht zu benutzen:

.. code:: screen

    # burncd -f cddevice data imagefile.iso fixate

Dieses Kommando brennt eine Kopie von *``imagefile.iso``* auf das Ger?t
*``cddevice``*. In der Grundeinstellung wird das Ger?t ``/dev/acd0``
benutzt.
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8>`__
beschreibt, wie die Schreibgeschwindigkeit gesetzt wird, die CD
ausgeworfen wird und Audiodaten geschrieben werden.

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

19.6.4. cdrecord
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie keinen ATAPI-CD-Brenner besitzen, benutzen Sie ``cdrecord``, um
CDs zu brennen. ``cdrecord`` ist nicht Bestandteil des Basissystems. Sie
m?ssen es entweder aus den Ports in
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
oder dem passenden Paket installieren. ?nderungen im Basissystem k?nnen
Fehler im bin?ren Programm verursachen und f?hren m?glicherweise dazu,
dass Sie einen „Untersetzer“ brennen. Sie sollten daher den Port
aktualisieren, wenn Sie Ihr System aktualisieren bzw. wenn Sie `STABLE
verfolgen <current-stable.html#stable>`__, den Port aktualisieren, wenn
es eine neue Version gibt.

Obwohl ``cdrecord`` viele Optionen besitzt, ist die grundlegende
Anwendung einfacher als ``burncd``. Ein ISO 9660-Image erstellen Sie
mit:

.. code:: screen

    # cdrecord dev=device imagefile.iso

Der Knackpunkt in der Benutzung von ``cdrecord`` besteht darin, das
richtige Argument zu ``dev`` zu finden. Benutzen Sie dazu den Schalter
``-scanbus`` von ``cdrecord``, der eine ?hnliche Ausgabe wie die
folgende produziert:

.. code:: screen

    # cdrecord -scanbus
    Cdrecord 1.9 (i386-unknown-freebsd7.0) Copyright (C) 1995-2004 J?rg Schilling
    Using libscg version 'schily-0.1'
    scsibus0:
            0,0,0     0) 'SEAGATE ' 'ST39236LW       ' '0004' Disk
            0,1,0     1) 'SEAGATE ' 'ST39173W        ' '5958' Disk
            0,2,0     2) *
            0,3,0     3) 'iomega  ' 'jaz 1GB         ' 'J.86' Removable Disk
            0,4,0     4) 'NEC     ' 'CD-ROM DRIVE:466' '1.26' Removable CD-ROM
            0,5,0     5) *
            0,6,0     6) *
            0,7,0     7) *
    scsibus1:
            1,0,0   100) *
            1,1,0   101) *
            1,2,0   102) *
            1,3,0   103) *
            1,4,0   104) *
            1,5,0   105) 'YAMAHA  ' 'CRW4260         ' '1.0q' Removable CD-ROM
            1,6,0   106) 'ARTEC   ' 'AM12S           ' '1.06' Scanner
            1,7,0   107) *

F?r die aufgef?hrten Ger?te in der Liste wird das passende Argument zu
``dev`` gegeben. Benutzen Sie die drei durch Kommas separierten Zahlen,
die zu Ihrem CD-Brenner angegeben sind, als Argument f?r ``dev``. Im
Beispiel ist das CDRW-Ger?t 1,5,0, so dass die passende Eingabe
**``dev=1,5,0``** w?re. Einfachere Wege das Argument anzugeben, sind in
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1>`__
beschrieben. Dort sollten Sie auch nach Informationen ?ber Audiospuren,
das Einstellen der Geschwindigkeit und ?hnlichem suchen.

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

19.6.5. Kopieren von Audio-CDs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um eine Kopie einer Audio-CD zu erstellen, kopieren Sie die St?cke der
CD in einzelne Dateien und brennen diese Dateien dann auf eine leere CD.
Das genaue Verfahren h?ngt davon ab, ob Sie ATAPI- oder SCSI-Laufwerke
verwenden.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Prozedur 19.1. SCSI-Laufwerke

.. raw:: html

   </div>

#. Kopieren Sie die Audiodaten mit ``cdda2wav``:

   .. code:: screen

       % cdda2wav -vall -D2,0 -B -Owav

#. Die erzeugten ``.wav`` Dateien schreiben Sie mit ``cdrecord`` auf
   eine leere CD:

   .. code:: screen

       % cdrecord -v dev=2,0 -dao -useinfo  *.wav

   Das Argument von ``dev`` gibt das verwendete Ger?t an, das Sie, wie
   in `Abschnitt?19.6.4, „cdrecord“ <creating-cds.html#cdrecord>`__
   beschrieben, ermitteln k?nnen.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Prozedur 19.2. ATAPI-Laufwerke

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

?ber das Modul `ATAPI/CAM <creating-cds.html#atapicam>`__ kann
``cdda2wav`` auch mit ATAPI-Laufwerken verwendet werden. Diese Methode
ist f?r die meisten Anwender besser geeignet als die im folgenden
beschriebenen Methoden (Jitter-Korrektur, Big-/Little-Endian-Probleme
und anderes mehr spielen hierbei eine Rolle).

.. raw:: html

   </div>

#. Der ATAPI-CD-Treiber stellt die einzelnen St?cke der CD ?ber die
   Dateien ``/dev/acddtnn``, zur Verf?gung. *``d``* bezeichnet die
   Laufwerksnummer und *``nn``* ist die Nummer des St?cks. Die Nummer
   ist immer zweistellig, das hei?t es wird, wenn n?tig, eine f?hrende
   Null ausgegeben. Die Datei ``/dev/acd0t01`` ist also das erste St?ck
   des ersten CD-Laufwerks. ``/dev/acd0t02`` ist das zweite St?ck und
   ``/dev/acd0t03`` das dritte.

   ?berpr?fen Sie stets, ob die entsprechenden Dateien im Verzeichnis
   ``/dev`` auch angelegt werden. Sind die Eintr?ge nicht vorhanden,
   weisen Sie Ihr System an, das Medium erneut zu testen:

   .. code:: screen

       # dd if=/dev/acd0 of=/dev/null count=1

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Unter FreeBSD?4.X werden diese Eintr?ge nicht mit dem Wert Null
   vordefiniert. Falls die entsprechenden Eintr?ge unter ``/dev`` nicht
   vorhanden sind, m?ssen Sie diese hier von ``MAKEDEV`` anlegen lassen:

   .. code:: screen

       # cd /dev
       # sh MAKEDEV acd0t99

   .. raw:: html

      </div>

#. Die einzelnen St?cke kopieren Sie mit
   `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__.
   Sie m?ssen dazu eine spezielle Blockgr??e angeben:

   .. code:: screen

       # dd if=/dev/acd0t01 of=track1.cdr bs=2352
       # dd if=/dev/acd0t02 of=track2.cdr bs=2352
       ...

#. Die kopierten Dateien k?nnen Sie dann mit ``burncd`` brennen. Auf der
   Kommandozeile m?ssen Sie angeben, dass Sie Audio-Daten brennen wollen
   und dass das Medium fixiert werden soll:

   .. code:: screen

       # burncd -f /dev/acd0 audio track1.cdr track2.cdr ... fixate

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

19.6.6. Kopieren von Daten-CDs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen eine Daten-CD in eine Datei kopieren, die einem Image
entspricht, das mit
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
erstellt wurde. Mit Hilfe dieses Images k?nnen Sie jede Daten-CD
kopieren. Das folgende Beispiel verwendet ``acd0`` f?r das CD-ROM-Ger?t.
Wenn Sie ein anderes Laufwerk benutzen, setzen Sie bitte den richtigen
Namen ein.

.. code:: screen

    # dd if=/dev/acd0 of=file.iso bs=2048

Danach haben Sie ein Image, das Sie wie oben beschrieben, auf eine CD
brennen k?nnen.

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

19.6.7. Einh?ngen von Daten-CDs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie eine Daten-CD gebrannt haben, wollen Sie wahrscheinlich auch
die Daten auf der CD lesen. Dazu m?ssen Sie die CD in den Dateibaum
einh?ngen. Die Voreinstellung f?r den Typ des Dateisystems von
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
ist ``UFS``. Das System wird die Fehlermeldung Incorrect super block
ausgeben, wenn Sie versuchen, die CD mit dem folgenden Kommando
einzuh?ngen:

.. code:: screen

    # mount /dev/cd0 /mnt

Auf der CD befindet sich ja kein ``UFS`` Dateisystem, so dass der
Versuch, die CD einzuh?ngen fehlschl?gt. Sie m?ssen
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
sagen, dass es ein Dateisystem vom Typ ``ISO9660`` verwenden soll. Dies
erreichen Sie durch die Angabe von ``-t     cd9660`` auf der
Kommandozeile. Wenn Sie also die CD-ROM ``/dev/cd0`` in ``/mnt``
einh?ngen wollen, f?hren Sie folgenden Befehl aus:

.. code:: screen

    # mount -t cd9660 /dev/cd0c /mnt

Abh?ngig vom verwendeten CD-ROM kann der Ger?tename von dem im Beispiel
(``/dev/cd0``) abweichen. Die Angabe von ``-t cd9660`` f?hrt
`mount\_cd9660(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_cd9660&sektion=8>`__
aus, so dass das Beispiel verk?rzt werden kann:

.. code:: screen

    # mount_cd9660 /dev/cd0 /mnt

Auf diese Weise k?nnen Sie Daten-CDs von jedem Hersteller verwenden. Es
kann allerdings zu Problemen mit CDs kommen, die verschiedene
ISO9660-Erweiterungen benutzen. So speichern Joliet-CDs alle Dateinamen
unter Verwendung von zwei Byte langen Unicode-Zeichen. Zwar unterst?tzt
der FreeBSD-Kernel derzeit noch kein Unicode, der CD9660-Treiber erlaubt
es aber, zur Laufzeit eine Konvertierungstabelle zu laden. Tauchen bei
Ihnen also statt bestimmter Zeichen nur Fragezeichen auf, so m?ssen Sie
?ber die Option ``-C`` den ben?tigten Zeichensatz angeben. Weitere
Informationen zu diesem Problem finden Sie in der Manualpage
`mount\_cd9660(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_cd9660&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Damit der Kernel diese Zeichenkonvertierung (festgelegt durch die Option
``-C``) erkennt, m?ssen Sie das Kernelmodul ``cd9660_iconv.ko`` laden.
Dazu f?gen Sie folgende Zeile in die Datei ``loader.conf`` ein:

.. code:: programlisting

    cd9660_iconv_load="YES"

Danach m?ssen Sie allerdings Ihr System neu starten. Alternativ k?nnen
Sie das Kernelmodul auch direkt ?ber
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
laden.

.. raw:: html

   </div>

Manchmal werden Sie die Meldung Device not configured erhalten, wenn Sie
versuchen, eine CD-ROM einzuh?ngen. F?r gew?hnlich liegt das daran, dass
das Laufwerk meint es sei keine CD eingelegt, oder dass das Laufwerk auf
dem Bus nicht erkannt wird. Es kann einige Sekunden dauern, bevor das
Laufwerk merkt, dass eine CD eingelegt wurde. Seien Sie also geduldig.

Manchmal wird ein SCSI-CD-ROM nicht erkannt, weil es keine Zeit hatte,
auf das Zur?cksetzen des Busses zu antworten. Wenn Sie ein SCSI-CD-ROM
besitzen, sollten Sie die folgende Zeile in Ihre Kernelkonfiguration
aufnehmen und einen neuen `Kernel bauen <kernelconfig-building.html>`__:

.. code:: programlisting

    options SCSI_DELAY=15000

Die Zeile bewirkt, dass nach dem Zur?cksetzen des SCSI-Busses beim
Booten 15?Sekunden gewartet wird, um dem CD-ROM-Laufwerk gen?gend Zeit
zu geben, darauf zu antworten.

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

19.6.8. Brennen von rohen CDs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen eine Datei auch direkt auf eine CD brennen, ohne vorher auf
ihr ein ISO 9660-Dateisystem einzurichten. Einige Leute nutzen dies, um
Datensicherungen durchzuf?hren. Diese Vorgehensweise hat den Vorteil,
dass Sie schneller als das Brennen einer normalen CD ist.

.. code:: screen

    # burncd -f /dev/acd1 -s 12 data archive.tar.gz fixate

Wenn Sie die Daten von einer solchen CD wieder zur?ckbekommen wollen,
m?ssen Sie sie direkt von dem rohen Ger?t lesen:

.. code:: screen

    # tar xzvf /dev/acd1

Eine auf diese Weise gefertigte CD k?nnen Sie nicht in das Dateisystem
einh?ngen. Sie k?nnen Sie auch nicht auf einem anderen Betriebssystem
lesen. Wenn Sie die erstellten CDs in das Dateisystem einh?ngen oder mit
anderen Betriebssystemen austauschen wollen, m?ssen Sie
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
wie oben beschrieben benutzen.

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

19.6.9. Der ATAPI/CAM Treiber
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Mit diesem Treiber kann auf ATAPI-Ger?te (wie CD-ROM-, CD-RW- oder
DVD-Laufwerke) mithilfe des SCSI-Subsystems zugegriffen werden. Damit
k?nnen Sie SCSI-Werkzeuge, wie
`sysutils/cdrdao <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrdao/pkg-descr>`__
oder
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1>`__,
zusammen mit einem ATAPI-Ger?t benutzen.

Wenn Sie den Treiber benutzen wollen, f?gen Sie die folgende Zeile in
``/boot/loader.conf`` ein:

.. code:: programlisting

    atapicam_load="YES"

Danach m?ssen Sie Ihr System neu starten, um den Treiber zu aktivieren.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Alternativ k?nnen Sie die Unterst?tzung f?r
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4>`__
auch in Ihren Kernel kompilieren. Dazu f?gen Sie die folgende Zeile in
Ihre Kernelkonfigurationsdatei ein:

.. code:: programlisting

    device atapicam

Die folgenden Zeilen werden ebenfalls ben?tigt, sollten aber schon Teil
der Kernelkonfiguration sein:

.. code:: programlisting

    device ata
    device scbus
    device cd
    device pass

.. raw:: html

   </div>

?bersetzen und installieren Sie den neuen Kernel. Der CD-Brenner sollte
nun beim Neustart des Systems erkannt werden:

.. code:: screen

    acd0: CD-RW <MATSHITA CD-RW/DVD-ROM UJDA740> at ata1-master PIO4
    cd0 at ata1 bus 0 target 0 lun 0
    cd0: <MATSHITA CDRW/DVD UJDA740 1.00> Removable CD-ROM SCSI-0 device
    cd0: 16.000MB/s transfers
    cd0: Attempt to query device size failed: NOT READY, Medium not present - tray closed

?ber den Ger?tenamen ``/dev/cd0`` k?nnen Sie nun auf das Laufwerk
zugreifen. Wenn Sie beispielsweise eine CD-ROM in ``/mnt`` einh?ngen
wollen, benutzen Sie das nachstehende Kommando:

.. code:: screen

    # mount -t cd9660 /dev/cd0 /mnt

Die SCSI-Adresse des Brenners k?nnen Sie als ``root`` wie folgt
ermitteln:

.. code:: screen

    # camcontrol devlist
    <MATSHITA CDRW/DVD UJDA740 1.00>   at scbus1 target 0 lun 0 (pass0,cd0)

Die SCSI-Adresse ``1,0,0`` k?nnen Sie mit den SCSI-Werkzeugen, zum
Beispiel
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1>`__,
verwenden.

Weitere Informationen ?ber das ATAPI/CAM- und das SCSI-System erhalten
Sie in den Hilfeseiten
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4>`__
und `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <usb-disks.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <creating-dvds.html>`__   |
+--------------------------------+-------------------------------+--------------------------------------+
| 19.5. USB Speichermedien?      | `Zum Anfang <index.html>`__   | ?19.7. DVDs benutzen                 |
+--------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
