============
8.7. Scanner
============

.. raw:: html

   <div class="navheader">

8.7. Scanner
`Zur?ck <mythtv.html>`__?
Kapitel 8. Multimedia
?\ `Weiter <kernelconfig.html>`__

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

8.7. Scanner
------------

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

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.7.1. Einf?hrung
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unter FreeBSD stellt SANE (Scanner Access Now Easy) aus der
Ports-Sammlung eine einheitliche Schnittstelle (API) f?r den Zugriff auf
Scanner bereit. SANE wiederum greift auf Scanner mithilfe einiger
FreeBSD-Treiber zu.

FreeBSD unterst?tzt sowohl SCSI- als auch USB-Scanner. Pr?fen Sie vor
der Konfiguration mithilfe der `Liste der unterst?tzten
Ger?te <http://www.sane-project.org/sane-supported-devices.html>`__ ob
Ihr Scanner von SANE unterst?tzt wird. Bei Systemen vor FreeBSD?8.X
z?hlt die Hilfeseite
`uscanner(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uscanner&sektion=4>`__
ebenfalls die unterst?tzten USB-Scanner auf.

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

8.7.2. Den Kernel f?r Scanner einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da sowohl SCSI- als auch USB-Scanner unterst?tzt werden, werden abh?ngig
von der Schnittstelle unterschiedliche Treiber ben?tigt.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.7.2.1. USB-Scanner
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im ``GENERIC``-Kernel sind schon alle, f?r einen USB-Scanner
notwendigen, Treiber enthalten. Wenn Sie einen angepassten Kernel
benutzen, pr?fen Sie, dass die Kernelkonfiguration die nachstehenden
Zeilen enth?lt:

.. code:: programlisting

    device usb
    device uhci
    device ohci
    device ehci

Bei Systemen vor FreeBSD?8.X wird ausserdem noch die folgende Zeile
ben?tigt:

.. code:: programlisting

    device uscanner

Bei diesen FreeBSD-Versionen liefert das
`uscanner(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uscanner&sektion=4>`__-Ger?t
die Unterst?tzung f?r USB-Scanner. Seit FreeBSD?8.0 ist diese
Unterst?tzung direkt in der
`libusb(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libusb&sektion=3>`__-Bibliothek
enthalten.

Nachdem Sie das System mit dem richtigen Kernel neu gestartet haben,
stecken Sie den USB-Scanner ein. Danach sollte in den Systemmeldungen
(die Sie mit
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
betrachten k?nnen) eine Zeile ?hnlich der folgenden erscheinen:

.. code:: screen

    ugen0.2: <EPSON> at usbus0

bzw. auf einem FreeBSD?7.X System:

.. code:: screen

    uscanner0: EPSON EPSON Scanner, rev 1.10/3.02, addr 2

Diese Meldung besagt, dass der Scanner entweder die Ger?tedatei
``/dev/ugen0.2`` oder ``/dev/uscanner0`` benutzt, je nachdem, welche
FreeBSD-Version eingesetzt wird. In diesem Beispiel wurde ein EPSON
Perfection??1650 USB-Scanner verwendet.

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

8.7.2.2. SCSI-Scanner
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Scanner eine SCSI-Schnittstelle besitzt, ist die
Kernelkonfiguration abh?ngig vom verwendeten SCSI-Controller. Der
``GENERIC``-Kernel unterst?tzt die gebr?uchlichen SCSI-Controller. Den
richtigen Treiber finden Sie in der Datei ``NOTES``. Neben dem Treiber
muss Ihre Kernelkonfiguration noch die nachstehenden Zeilen enthalten:

.. code:: programlisting

    device scbus
    device pass

Nachdem Sie einen Kernel gebaut und installiert haben, sollte der
Scanner beim Neustart in den Systemmeldungen erscheinen:

.. code:: screen

    pass2 at aic0 bus 0 target 2 lun 0
    pass2: <AGFA SNAPSCAN 600 1.10> Fixed Scanner SCSI-2 device
    pass2: 3.300MB/s transfers

Wenn der Scanner w?hrend des Systemstarts ausgeschaltet war, k?nnen Sie
die Ger?teerkennung erzwingen, indem Sie den SCSI-Bus erneut absuchen.
Verwenden Sie dazu das Kommando
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__:

.. code:: screen

    # camcontrol rescan all
    Re-scan of bus 0 was successful
    Re-scan of bus 1 was successful
    Re-scan of bus 2 was successful
    Re-scan of bus 3 was successful

Der Scanner wird anschlie?end in der SCSI-Ger?teliste angezeigt:

.. code:: screen

    # camcontrol devlist
    <IBM DDRS-34560 S97B>              at scbus0 target 5 lun 0 (pass0,da0)
    <IBM DDRS-34560 S97B>              at scbus0 target 6 lun 0 (pass1,da1)
    <AGFA SNAPSCAN 600 1.10>           at scbus1 target 2 lun 0 (pass3)
    <PHILIPS CDD3610 CD-R/RW 1.00>     at scbus2 target 0 lun 0 (pass2,cd0)

Weiteres ?ber SCSI-Ger?te lesen Sie bitte in den Hilfeseiten
`scsi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=scsi&sektion=4>`__
und
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__
nach.

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

8.7.3. SANE konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SANE besteht aus zwei Teilen, den Backends
(`graphics/sane-backends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-backends/pkg-descr>`__)
und den Frontends
(`graphics/sane-frontends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-frontends/pkg-descr>`__).
Das Backend greift auf den Scanner zu. Welches Backend welchen Scanner
unterst?tzt, entnehmen Sie der `Liste der unterst?tzten
Ger?te <http://www.sane-project.org/sane-supported-devices.html>`__. Der
Betrieb eines Scanners ist nur mit dem richtigen Backend m?glich. Die
Frontends sind die Anwendungen, mit denen gescannt wird (xscanimage).

Installieren Sie zuerst den Port oder das Paket
`graphics/sane-backends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-backends/pkg-descr>`__.
Anschlie?end k?nnen Sie mit dem Befehl ``sane-find-scanner`` pr?fen, ob
SANE Ihren Scanner erkennt:

.. code:: screen

    # sane-find-scanner -q
    found SCSI scanner "AGFA SNAPSCAN 600 1.10" at /dev/pass3

Die Ausgabe zeigt die Schnittstelle und die verwendete Ger?tedatei des
Scanners. Der Hersteller und das Modell k?nnen in der Ausgabe fehlen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bei einigen USB-Scannern m?ssen Sie die Firmware aktualisieren, dies
wird in der Hilfeseite des Backends erkl?rt. Lesen Sie bitte auch die
Hilfeseiten
`sane-find-scanner(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sane-find-scanner&sektion=1>`__
und
`sane(7) <http://www.FreeBSD.org/cgi/man.cgi?query=sane&sektion=7>`__.

.. raw:: html

   </div>

Als n?chstes m?ssen Sie pr?fen, ob der Scanner vom Frontend erkannt
wird. Die SANE-Backends werden mit dem Kommandozeilenwerkzeug
`scanimage(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scanimage&sektion=1>`__
geliefert. Mit diesem Werkzeug k?nnen Sie sich Scanner anzeigen lassen
und den Scan-Prozess von der Kommandozeile starten. Die Option ``-L``
zeigt die Scanner an:

.. code:: screen

    # scanimage -L
    device `snapscan:/dev/pass3' is a AGFA SNAPSCAN 600 flatbed scanner

Oder, f?r das Beispiel mit dem USB-Scanner in `Abschnitt?8.7.2.1,
„USB-Scanner“ <scanners.html#scanners-kernel-usb>`__:

.. code:: screen

    # scanimage -L
    device 'epson2:libusb:/dev/usb:/dev/ugen0.2' is a Epson GT-8200 flatbed scanner

Diese Ausgabe stammt von einem FreeBSD?8.X System, die Zeile
``'epson2:libusb:/dev/usb:/dev/ugen0.2'`` nennt das Backend (``epson2``)
und die Ger?tedatei (``/dev/ugen0.2``), die der Scanner verwendet.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Erscheint die Meldung, dass kein Scanner gefunden wurde oder wird gar
keine Ausgabe erzeugt, konnte
`scanimage(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scanimage&sektion=1>`__
keinen Scanner erkennen. In diesem Fall m?ssen Sie in der
Konfigurationsdatei des Backends das zu benutzende Ger?t eintragen. Die
Konfigurationsdateien der Backends befinden sich im Verzeichnis
``/usr/local/etc/sane.d/``. Erkennungsprobleme treten bei bestimmten
USB-Scannern auf.

Mit dem USB-Scanner aus `Abschnitt?8.7.2.1,
„USB-Scanner“ <scanners.html#scanners-kernel-usb>`__ zeigt
``sane-find-scanner`` unter FreeBSD?8.X die folgende Ausgabe:

.. code:: screen

    # sane-find-scanner -q
    found USB scanner (UNKNOWN vendor and product) at device /dev/uscanner0

Der Scanner wurde richtig erkennt, er benutzt eine USB-Schnittstelle und
verwendet die Ger?tedatei ``/dev/uscanner0``. Ob der Scanner vom
Frontend erkannt wird, zeigt das nachstehende Kommando:

.. code:: screen

    # scanimage -L

    No scanners were identified. If you were expecting something different,
    check that the scanner is plugged in, turned on and detected by the
    sane-find-scanner tool (if appropriate). Please read the documentation
    which came with this software (README, FAQ, manpages).

Da der Scanner nicht erkannt wurde, muss die Datei
``/usr/local/etc/sane.d/epson2.conf`` editiert werden. Der verwendete
Scanner war ein EPSON Perfection??1650, daher wird das
``epson2``-Backend benutzt. Lesen Sie bitte alle Kommentare in der
Konfigurationsdatei des Backends. Die durchzuf?hrenden ?nderungen sind
einfach. Kommentieren Sie zun?chst alle Zeilen mit der falschen
Schnittstelle aus. Da der Scanner eine USB-Schnittstelle besitzt, wurden
im Beispiel alle Zeilen, die mit ``scsi`` anfingen, auskommentiert.
F?gen Sie dann die Schnittstelle und den Ger?tenamen am Ende der Datei
ein. In diesem Beispiel wurde die nachstehende Zeile eingef?gt:

.. code:: programlisting

    usb /dev/uscanner0

Weitere Hinweise entnehmen Sie bitte der Hilfeseite des Backends. Jetzt
k?nnen Sie pr?fen, ob der Scanner richtig erkannt wird:

.. code:: screen

    # scanimage -L
    device `epson:/dev/uscanner0' is a Epson GT-8200 flatbed scanner

Der Scanner wurde nun erkannt. Es ist nicht wichtig, ob der Hersteller
oder das Modell Ihres Scanners korrekt angezeigt werden. Wichtig ist nur
die Ausgabe ```epson:/dev/uscanner0'``, die das richtige Backend und den
richtigen Ger?tenamen anzeigt.

.. raw:: html

   </div>

Wenn ``scanimage -L`` den Scanner erkannt hat, ist der Scanner
eingerichtet und bereit, zu scannen.

Obwohl wir mit
`scanimage(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scanimage&sektion=1>`__
von der Kommandozeile scannen k?nnen, ist eine graphische Anwendung zum
Scannen besser geeignet. SANE bietet ein einfaches und effizientes
Werkzeug: xscanimage
(`graphics/sane-frontends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-frontends/pkg-descr>`__).

Xsane
(`graphics/xsane <http://www.freebsd.org/cgi/url.cgi?ports/graphics/xsane/pkg-descr>`__)
ist eine weitere beliebte graphische Anwendung. Dieses Frontend besitzt
erweiterte Funktionen wie den Scan-Modus (beispielsweise Photo, Fax),
eine Farbkorrektur und Batch-Scans. Beide Anwendungen lassen sich als
GIMP-Plugin verwenden.

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

8.7.4. Den Scanner f?r Benutzerkonten freigeben
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zuvor wurden alle T?tigkeiten mit ``root``-Rechten ausgef?hrt. Wenn
andere Benutzer den Scanner benutzen sollen, m?ssen sie Lese- und
Schreibrechte auf die Ger?tedatei des Scanners besitzen. Im Beispiel
wird die Datei ``/dev/ugen0.2`` verwendet, die faktisch nur ein Symlink
auf die echte Ger?tedatei, ``/dev/usb/0.2.0`` genannt, darstellt (ein
kurzer Blick auf das ``/dev``-Verzeichnis best?tigt dies). Sowohl der
Symlink als auch die Ger?tedatei sind jeweils im Besitz der Gruppen
``wheel`` und ``operator``. Damit der Benutzer ``joe`` auf den Scanner
zugreifen kann, muss das Konto in die Gruppe ``operator`` aufgenommen
werden. Allerdings sollten Sie, aus Sicherheitsgr?nden, genau ?berlegen,
welche Benutzer Sie zu welcher Gruppe hinzuf?gen, besonders bei der
Gruppe ``wheel``. Eine bessere L?sung ist es, eine spezielle Gruppe f?r
den Zugriff auf USB-Ger?te anzulegen und den Scanner f?r Mitglieder
dieser Gruppe zug?nglich zu machen.

Beispielsweise kann man eine ``usb``-Gruppe verwenden. Der erste Schritt
dazu ist das erstellen der Gruppe mit Hilfe des
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__-Kommandos:

.. code:: screen

    # pw groupadd usb

Anschliessend muss der ``/dev/ugen0.2``-Symlink und der Ger?tename
``/dev/usb/0.2.0`` f?r die ``usb``-Gruppe mit den richtigen
Schreibrechten (``0660`` oder ``0664``) ausgestattet werden, denn
standardm?ssig kann nur der Besitzer dieser Dateien (``root``) darauf
schreiben. All dies kann durch das Hinzuf?gen der folgenden Zeile in die
``/etc/devfs.rules``-Datei erreicht werden:

.. code:: programlisting

    [system=5]
    add path ugen0.2 mode 0660 group usb
    add path usb/0.2.0 mode 0660 group usb

FreeBSD?7.X-Anwender ben?tigen unter Umst?nden die folgenden Zeilen mit
der korrekten Ger?tedatei ``/dev/uscanner0``:

.. code:: programlisting

    [system=5]
    add path uscanner0 mode 660 group usb

In die Datei ``/etc/rc.conf`` f?gen Sie noch die folgende Zeile ein:

.. code:: programlisting

    devfs_system_ruleset="system"

Starten Sie anschlie?end Ihr System neu.

Weitere Informationen finden Sie in
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8>`__.

Jetzt braucht man nur noch Benutzer der Gruppe ``usb`` hinzuf?gen, um
ihnen Zugriff auf den Scanner zu erlauben:

.. code:: screen

    #pw groupmod usb -m joe

Weitere Details k?nnen Sie in der
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__-Manualpage
nachlesen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-----------------------------------+-------------------------------------------------+
| `Zur?ck <mythtv.html>`__?   | `Nach oben <multimedia.html>`__   | ?\ `Weiter <kernelconfig.html>`__               |
+-----------------------------+-----------------------------------+-------------------------------------------------+
| 8.6. MythTV?                | `Zum Anfang <index.html>`__       | ?Kapitel 9. Konfiguration des FreeBSD-Kernels   |
+-----------------------------+-----------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
