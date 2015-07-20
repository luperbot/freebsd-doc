===================
19.7. DVDs benutzen
===================

.. raw:: html

   <div class="navheader">

19.7. DVDs benutzen
`Zur?ck <creating-cds.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <floppies.html>`__

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

19.7. DVDs benutzen
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   <div>

Mit Beitr?gen von Andy Polyakov.

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

19.7.1. Einf?hrung
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nach der CD ist die DVD die n?chste Generation optischer Speichermedien.
Auf einer DVD k?nnen mehr Daten als auf einer CD gespeichert werden.
DVDs werden heutzutage als Standardmedium f?r Videos verwendet.

F?r beschreibbare DVDs existieren f?nf Medienformate:

.. raw:: html

   <div class="itemizedlist">

-  DVD-R: Dies war das erste verf?gbare Format. Das Format wurde vom
   `DVD-Forum <http://www.dvdforum.com/forum.shtml>`__ festgelegt. Die
   Medien sind nur einmal beschreibbar.

-  DVD-RW: Dies ist die wiederbeschreibbare Version des DVD-R Standards.
   Eine DVD-RW kann ungef?hr 1000?Mal beschrieben werden.

-  DVD-RAM: Dies ist ebenfalls ein wiederbeschreibbares Format, das vom
   DVD-Forum unterst?tzt wird. Eine DVD-RAM verh?lt sich wie eine
   Wechselplatte. Allerdings sind die Medien nicht kompatibel zu den
   meisten DVD-ROM-Laufwerken und DVD-Video-Spielern. DVD-RAM wird nur
   von wenigen Brennern unterst?tzt. Wollen Sie DVD-RAM einsetzen,
   sollten Sie `Abschnitt?19.7.9,
   „DVD-RAM“ <creating-dvds.html#creating-dvd-ram>`__ lesen.

-  DVD+RW: Ist ein wiederbeschreibbares Format, das von der `DVD+RW
   Alliance <http://www.dvdrw.com/>`__ festgelegt wurde. Eine DVD+RW
   kann ungef?hr 1000?Mal beschrieben werden.

-  DVD+R: Dieses Format ist die nur einmal beschreibbare Variante des
   DVD+RW Formats.

.. raw:: html

   </div>

Auf einer einfach beschichteten DVD k?nnen 4.700.000.000?Bytes
gespeichert werden. Das sind 4,38?GB oder 4485?MB (1?Kilobyte sind
1024?Bytes).

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die physischen Medien sind unabh?ngig von der Anwendung. Ein DVD-Video
ist eine spezielle Anordnung von Dateien, die auf irgendein Medium (zum
Beispiel DVD-R, DVD+R oder DVD-RW) geschrieben werden kann. Bevor Sie
ein Medium ausw?hlen, m?ssen Sie sicherstellen, dass der Brenner und der
DVD-Spieler (ein Einzelger?t oder ein DVD-ROM-Laufwerk eines Rechners)
mit dem Medium umgehen k?nnen.

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

19.7.2. Konfiguration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Programm
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
beschreibt DVDs. Das Kommando ist Teil der Anwendung dvd+rw-tools
(`sysutils/dvd+rw-tools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/dvd+rw-tools/pkg-descr>`__).
dvd+rw-tools kann mit allen DVD-Medien umgehen.

Um die Ger?te anzusprechen, brauchen die Werkzeuge das SCSI-Subsystem.
Daher muss der Kernel den
`ATAPI/CAM-Treiber <creating-cds.html#atapicam>`__ zur Verf?gung
stellen. Der Treiber ist mit USB-Brennern nutzlos; die Konfiguration von
USB-Ger?ten behandelt `Abschnitt?19.5, „USB
Speichermedien“ <usb-disks.html>`__.

F?r ATAPI-Ger?te m?ssen Sie ebenfalls DMA-Zugriffe aktivieren. F?gen Sie
dazu die nachstehende Zeile in die Datei ``/boot/loader.conf`` ein:

.. code:: programlisting

    hw.ata.atapi_dma="1"

Bevor Sie dvd+rw-tools mit Ihrem DVD-Brenner benutzen, lesen Sie bitte
die Hardware-Informationen auf der Seite `dvd+rw-tools' hardware
compatibility
notes <http://fy.chalmers.se/~appro/linux/DVD+RW/hcn.html>`__.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie eine grafische Oberfl?che bevorzugen, schauen Sie sich bitte
den Port
`sysutils/k3b <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/k3b/pkg-descr>`__
an. Der Port bietet eine leicht zu bedienende Schnittstelle zu
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
und vielen anderen Werkzeugen.

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

19.7.3. Daten-DVDs brennen
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
erstellt mit dem Programm `mkisofs <creating-cds.html#mkisofs>`__ das
Dateisystem und brennt anschlie?end die DVD. Vor dem Brennen brauchen
Sie daher kein Abbild der Daten zu erstellen.

Wenn Sie von den Daten im Verzeichnis ``/path/to/data`` eine DVD+R oder
eine DVD-R brennen wollen, benutzen Sie das nachstehende Kommando:

.. code:: screen

    # growisofs -dvd-compat -Z /dev/cd0 -J -R /path/to/data

Die Optionen ``-J -R`` werden an
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
durchgereicht und dienen zum Erstellen des Dateisystems (hier: ein
ISO-9660-Dateisystem mit Joliet- und Rock-Ridge-Erweiterungen). Weiteres
entnehmen Sie bitte der Hilfeseite
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__.

Die Option ``-Z`` wird f?r die erste Aufnahme einer Session ben?tigt,
egal ob Sie eine Multi-Session-DVD brennen oder nicht. F?r
*``/dev/cd0``* m?ssen Sie den Ger?tenamen Ihres Brenners einsetzen. Die
Option ``-dvd-compat`` schlie?t das Medium, weitere Daten k?nnen danach
nicht mehr angeh?ngt werden. Durch die Angabe dieser Option kann das
Medium von mehr DVD-ROM-Laufwerken gelesen werden.

Sie k?nnen auch ein vorher erstelltes Abbild der Daten brennen. Die
nachstehende Kommandozeile brennt das Abbild in der Datei
*``imagefile.iso``*:

.. code:: screen

    # growisofs -dvd-compat -Z /dev/cd0=imagefile.iso

Die Schreibgeschwindigkeit h?ngt von den verwendeten Medium sowie dem
verwendeten Ger?t ab und sollte automatisch gesetzt werden. Falls Sie
die Schreibgeschwindigkeit vorgeben m?chten, verwenden Sie den Parameter
``-speed=``. Weiteres erfahren Sie in der Hilfeseite
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Um gr?ssere Dateien als 4.38GB in ihre Sammlung aufzunehmen, ist es
notwendig ein UDF/ISO-9660 Hybrid-Dateisystem zu erstellen. Dieses
Dateisystem muss mit zus?tzlichen Parametern ``-udf -iso-level 3`` bei
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
und allen relevanten Programmen (z.B.
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__)
erzeugt werden. Dies ist nur notwendig wenn Sie ein ISO-Image erstellen
oder direkt auf eine DVD schreiben wollen. DVDs, die in dieser Weise
hergestellt worden sind, m?ssen als UDF-Dateisystem mit
`mount\_udf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_udf&sektion=8>`__
eingehangen werden. Sie sind nur auf Betriebssystemen, die UDF
unterst?tzen brauchbar, ansonsten sieht es so aus, als ob sie kaputte
Dateien enthalten w?rden.

Um so eine ISO Datei zu bauen, geben Sie den folgenden Befehl ein:

.. code:: screen

    % mkisofs -R -J -udf -iso-level 3 -o imagefile.iso /path/to/data

Um Daten direkt auf eine DVD zu brennen, geben Sie den folgenden Befehl
ein:

.. code:: screen

    # growisofs -dvd-compat -udf -iso-level 3 -Z /dev/cd0 -J -R /path/to/data

Wenn Sie ein ISO-Image haben das bereits grosse Dateien enth?lt, sind
keine weiteren zus?tzlichen Optionen f?r
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
notwendig, um das Image auf die DVD zu brennen.

Beachten Sie noch, dass Sie die aktuelle Version von
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
haben (welche
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
enth?lt), da die ?lteren Versionen nicht den Support f?r grosse Dateien
enthalten. Wenn Sie Probleme haben sollten, k?nnen Sie auch das
Entwicklerpaket von
`sysutils/cdrtools-devel <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools-devel/pkg-descr>`__
einsetzen und lesen Sie die
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
Manualpage.

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

19.7.4. DVD-Videos brennen
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein DVD-Video ist eine spezielle Anordnung von Dateien, die auf den
ISO-9660 und den micro-UDF (M-UDF) Spezifikationen beruht. Ein DVD-Video
ist auf eine bestimmte Datei-Hierarchie angewiesen. Daher m?ssen Sie
DVDs mit speziellen Programmen wie
`multimedia/dvdauthor <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/dvdauthor/pkg-descr>`__
erstellen.

Wenn Sie schon ein Abbild des Dateisystems eines DVD-Videos haben,
brennen Sie das Abbild wie jedes andere auch. Eine passende
Kommandozeile finden Sie im vorigen Abschnitt. Wenn Sie die DVD im
Verzeichnis ``/path/to/video`` zusammengestellt haben, erstellen Sie das
DVD-Video mit dem nachstehenden Kommando:

.. code:: screen

    # growisofs -Z /dev/cd0 -dvd-video /path/to/video

Die Option ``-dvd-video`` wird an
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
weitergereicht. Dadurch erstellt
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
die Datei-Hierarchie f?r ein DVD-Video. Weiterhin bewirkt die Angabe von
``-dvd-video``, dass
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
mit der Option ``-dvd-compat`` aufgerufen wird.

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

19.7.5. DVD+RW-Medien benutzen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Gegensatz zu CD-RW-Medien m?ssen Sie DVD+RW-Medien erst formatieren,
bevor Sie die Medien benutzen. Sie sollten
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
einzetzen, da das Programm Medien automatisch formatiert, wenn es
erforderlich ist. Sie k?nnen eine DVD+RW aber auch mit dem Kommando
``dvd+rw-format`` formatieren:

.. code:: screen

    # dvd+rw-format /dev/cd0

Sie m?ssen das Kommando nur einmal mit neuen Medien laufen lassen.
Anschlie?end k?nnen Sie DVD+RWs, wie in den vorigen Abschnitten
beschrieben, brennen.

Wenn Sie auf einer DVD+RW ein neues Dateisystem erstellen wollen,
brauchen Sie die DVD+RW vorher nicht zu l?schen. ?berschreiben Sie
einfach das vorige Dateisystem indem Sie eine neue Session anlegen:

.. code:: screen

    # growisofs -Z /dev/cd0 -J -R /path/to/newdata

Mit dem DVD+RW-Format ist es leicht, Daten an eine vorherige Aufnahme
anzuh?ngen. Dazu wird eine neue Session mit der schon bestehenden
zusammengef?hrt. Es wird keine Multi-Session geschrieben, sondern
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
*vergr??ert* das ISO-9660-Dateisystem auf dem Medium.

Das folgende Kommando f?gt weitere Daten zu einer vorher erstellten
DVD+RW hinzu:

.. code:: screen

    # growisofs -M /dev/cd0 -J -R /path/to/nextdata

Wenn Sie eine DVD+RW erweitern, verwenden Sie dieselben
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__-Optionen
wie beim Erstellen der DVD+RW.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Um die Kompatibilit?t mit DVD-ROM-Laufwerken zu gew?hrleisten, wollen
Sie vielleicht die Option ``-dvd-compat`` einsetzen. Zu einem
DVD+RW-Medium k?nnen Sie mit dieser Option auch weiterhin Daten
hinzuf?gen.

.. raw:: html

   </div>

Wenn Sie das Medium aus irgendwelchen Gr?nden doch l?schen m?ssen,
verwenden Sie den nachstehenden Befehl:

.. code:: screen

    # growisofs -Z /dev/cd0=/dev/zero

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

19.7.6. DVD-RW-Medien benutzen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine DVD-RW kann mit zwei Methoden beschrieben werden:
*Sequential-Recording* oder *Restricted-Overwrite*. Voreingestellt ist
Sequential-Recording.

Eine neue DVD-RW kann direkt beschrieben werden; sie muss nicht vorher
formatiert werden. Allerdings muss eine DVD-RW, die mit
Sequential-Recording aufgenommen wurde, zuerst gel?scht werden, bevor
eine neue Session aufgenommen werden kann.

Der folgende Befehl l?scht eine DVD-RW im Sequential-Recording-Modus:

.. code:: screen

    # dvd+rw-format -blank=full /dev/cd0

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das vollst?ndige L?schen (``-blank=full``) dauert mit einem 1x?Medium
ungef?hr eine Stunde. Wenn die DVD-RW im Disk-At-Once-Modus (DAO)
aufgenommen wurde, kann Sie mit der Option ``-blank`` schneller gel?scht
werden. Um eine DVD-RW im DAO-Modus zu brennen, benutzen Sie das
folgende Kommando:

.. code:: screen

    # growisofs -use-the-force-luke=dao -Z /dev/cd0=imagefile.iso

Die Option ``-use-the-force-luke=dao`` sollte nicht erforderlich sein,
da
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
den DAO-Modus erkennt.

Der Restricted-Overwrite-Modus sollte mit jeder DVD-RW verwendet werden,
da er flexibler als der voreingestellte Sequential-Recording-Modus ist.

.. raw:: html

   </div>

Um Daten auf eine DVD-RW im Sequential-Recording-Modus zu schreiben,
benutzen Sie dasselbe Kommando wie f?r die anderen DVD-Formate:

.. code:: screen

    # growisofs -Z /dev/cd0 -J -R /path/to/data

Wenn Sie weitere Daten zu einer Aufnahme hinzuf?gen wollen, benutzen Sie
die Option ``-M`` von
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__.
Werden die Daten im Sequential-Recording-Modus hinzugef?gt, wird eine
neue Session erstellt. Das Ergebnis ist ein Multi-Session-Medium.

Eine DVD-RW im Restricted-Overwrite-Modus muss nicht gel?scht werden, um
eine neue Session aufzunehmen. Sie k?nnen das Medium einfach mit der
Option ``-Z`` ?berschreiben, ?hnlich wie bei DVD+RW. Mit der Option
``-M`` k?nnen Sie das ISO-9660-Dateisystem, wie mit einer DVD+RW,
vergr??ern. Die DVD enth?lt danach eine Session.

Benutzen sie das nachstehende Kommando, um den
Restricted-Overwrite-Modus einzustellen:

.. code:: screen

    # dvd+rw-format /dev/cd0

Das folgende Kommando stellt den Modus wieder auf Sequential-Recording
zur?ck:

.. code:: screen

    # dvd+rw-format -blank=full /dev/cd0

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

19.7.7. Multi-Session
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nur wenige DVD-ROM-Laufwerke k?nnen Multi-Session-DVDs lesen. Meist
lesen die Spieler nur die erste Session. Mehrere Sessions werden von
DVD+R, DVD-R und DVD-RW im Sequential-Recording-Modus unterst?tzt. Im
Modus Restricted-Overwrite gibt es nur eine Session.

Wenn das Medium noch nicht geschlossen ist, erstellt das nachstehende
Kommando eine neue Session auf einer DVD+R, DVD-R oder DVD-RW im
Sequential-Recording-Modus:

.. code:: screen

    # growisofs -M /dev/cd0 -J -R /path/to/nextdata

Wird diese Kommandozeile mit DVD+RW- oder DVD-RW-Medien im
Restricted-Overwrite-Modus benutzt, werden die neuen Daten mit den Daten
der bestehenden Session zusammengef?hrt. Das Medium enth?lt danach eine
Session. Auf diesem Weg werden neue Daten zu einer bestehenden Session
hinzugef?gt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

F?r den Anfang und das Ende einer Session wird auf dem Medium
zus?tzlicher Platz verbraucht. Um den Speicherplatz auf dem Medium
optimal auszunutzen, sollten Sie daher Sessions mit vielen Daten
hinzuf?gen. Auf ein DVD+R-Medium passen maximal 154?Sessions,
2000?Sessions auf ein DVD-R-Medium und 127?Sessions auf eine DVD+R
Double Layer.

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

19.7.8. Weiterf?hrendes
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Kommando ``dvd+rw-mediainfo     /dev/cd0`` zeigt Informationen ?ber
eine im Laufwerk liegende DVD an.

Weiteres zu den dvd+rw-tools lesen Sie bitte in der Hilfeseite
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__,
auf der `dvd+rw-tools
Web-Seite <http://fy.chalmers.se/~appro/linux/DVD+RW/>`__ oder in den
Archiven der
`cdwrite-Mailingliste <http://lists.debian.org/cdwrite/>`__.

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

19.7.9. DVD-RAM
~~~~~~~~~~~~~~~

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

19.7.9.1. Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DVD-RAM-f?hige Brenner werden sowohl mit SCSI- als auch mit
ATAPI-Schnittstelle angeboten. Verwenden Sie ein ATAPI-Ger?t, m?ssen Sie
den DMA-Modus aktivieren. Dazu f?gen Sie die folgende Zeile in
``/boot/loader.conf`` ein:

.. code:: programlisting

    hw.ata.atapi_dma="1"

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

19.7.9.2. Das Medium vorbereiten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie weiter oben in diesem Kapitel bereits erw?hnt, kann man eine DVD-RAM
mit einer Wechselplatte vergleichen. Wie diese muss auch eine DVD-RAM
vor dem ersten Einsatz „vorbereitet“ werden. In unserem Beispiel wird
das gesamte Medium mit dem Standard-UFS2-Dateisystem formatiert.

Dazu geben Sie als ``root`` bei eingelegter DVD-RAM die folgenden
Befehle ein:

.. code:: screen

    # dd if=/dev/zero of=/dev/acd0 bs=2k count=1
    # bsdlabel -Bw acd0
    # newfs /dev/acd0

Denken Sie dabei daran, dass Sie gegebenenfalls die Ger?tedatei (hier
``acd0``) an Ihre Konfiguration anpassen m?ssen.

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

19.7.9.3. Das Medium einsetzen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie das Medium vorbereitet haben, k?nnen Sie das DVD-RAM-Medium
in Ihren Verzeichnisbaum einh?ngen:

.. code:: screen

    # mount /dev/acd0 /mnt

Danach k?nnen Sie schreibend und lesend auf das Medium zugreifen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+---------------------------------+
| `Zur?ck <creating-cds.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <floppies.html>`__   |
+-----------------------------------+-------------------------------+---------------------------------+
| 19.6. CDs benutzen?               | `Zum Anfang <index.html>`__   | ?19.8. Disketten benutzen       |
+-----------------------------------+-------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
