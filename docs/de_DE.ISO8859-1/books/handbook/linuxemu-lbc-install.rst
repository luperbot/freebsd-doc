==================
11.2. Installation
==================

.. raw:: html

   <div class="navheader">

11.2. Installation
`Zur?ck <linuxemu.html>`__?
Kapitel 11. Linux-Bin?rkompatibilit?t
?\ `Weiter <linuxemu-mathematica.html>`__

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

11.2. Installation
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Linux-Bin?rkompatibilit?t ist per Voreinstellung nicht aktiviert.
Der einfachste Weg, dies zu tun, ist das ``Linux`` KLD („Kernel LoaDable
object“) zu laden. Dies erreichen Sie durch die Eingabe des folgenden
Befehls:

.. code:: screen

    # kldload linux

Wollen Sie die Linux-Bin?rkompatibilit?t dauerhaft aktivieren, sollten
Sie die folgende Zeile in ``/etc/rc.conf`` einf?gen:

.. code:: programlisting

    linux_enable="YES"

Der
`kldstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldstat&sektion=8>`__-Befehl
kann benutzt werden, um festzustellen, ob KLD geladen wurde:

.. code:: screen

    % kldstat
    Id Refs Address    Size     Name
     1    2 0xc0100000 16bdb8   kernel
     7    1 0xc24db000 d000     linux.ko

Wenn Sie das KLD nicht laden k?nnen oder wollen, besteht auch die
M?glichkeit, die Linux-Bin?rkompatibilt?t statisch in den Kernel
einzubinden. Dazu f?gen Sie Ihrer Kernelkonfigurationsdatei den Eintrag
``options COMPAT_LINUX`` hinzu. Anschlie?end installieren Sie Ihren
neuen Kernel wie in `Kapitel?9, *Konfiguration des
FreeBSD-Kernels* <kernelconfig.html>`__ beschrieben.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.2.1. Linux-Laufzeitbibliotheken installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dies kann auf zwei Arten geschehen, entweder ?ber den
`linux\_base <linuxemu-lbc-install.html#linuxemu-libs-port>`__-Port oder
durch `manuelle
Installation <linuxemu-lbc-install.html#linuxemu-libs-manually>`__ der
Bibliotheken.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.2.1.1. Installation unter Verwendung des linux\_base-Ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dies ist die einfachste Methode, um die Laufzeitbibliotheken zu
installieren. Sie funktioniert genauso wie die Installation eines
beliebigen anderen Ports aus der
`Ports-Sammlung <file://localhost/usr/ports/>`__. Dazu machen Sie
einfach folgendes:

.. code:: screen

    # cd /usr/ports/emulators/linux_base-f10
    # make install distclean

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bei FreeBSD-Systemen vor FreeBSD?8.0 m?ssen Sie den Port
`emulators/linux\_base-fc4 <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base-fc4/pkg-descr>`__
anstatt
`emulators/linux\_base-f10 <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base-f10/pkg-descr>`__
installieren.

.. raw:: html

   </div>

Sie sollten nun ?ber eine funktionierende Linux-Bin?rkompatibilit?t
verf?gen. Einige Programme k?nnten sich zwar ?ber falsche
Unterversionsnummern der Systembibliotheken beschweren, dies ist im
Allgemeinen aber kein Problem.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Unter Umst?nden gibt es mehrere Versionen des Ports
`emulators/linux\_base <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__.
Die Ports entsprechen unterschiedlichen Versionen verschiedener
Linux-Distributionen Sie sollten den Port installieren, der am besten
die Anforderungen der Linux-Anwendung erf?llt.

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

11.2.1.2. Manuelle Installation der Bibliotheken
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die „Ports“-Sammlung nicht installiert haben, k?nnen Sie die
Bibliotheken auch manuell installieren. Dazu brauchen Sie die jeweiligen
Linux-Systembibliotheken, die das zu installierende Programm verwendet
sowie den Laufzeit-Linker. Zus?tzlich m?ssen Sie auf Ihrem
FreeBSD-System einen „virtuellen“ Verzeichnisbaum f?r die
Linux-Bibliotheken einrichten. Alle unter FreeBSD gestarteten
Linux-Programme suchen zuerst in diesem Verzeichnisbaum nach
Systembibliotheken. Wenn also ein Linuxprogramm beispielsweise
``/lib/libc.so`` l?dt, versucht FreeBSD zuerst,
``/compat/linux/lib/libc.so`` laden. Ist diese Datei nicht vorhanden,
wird ``/lib/libc.so`` geladen. Systembibliotheken sollten daher besser
in den „virtuellen“ Verzeichnisbaum ``/compat/linux/lib`` als in den vom
Linux-\ ``ld.so`` vorgeschlagenen installiert werden.

Im Allgemeinen m?ssen Sie nur zu Beginn nach den Systembibliotheken
suchen, die von Linuxprogrammen ben?tigt werden. Nach den ersten
Installationen von Linuxprogrammen auf Ihrem FreeBSD-System verf?gen Sie
?ber eine Sammlung von Linux-Systembibliotheken, die es Ihnen
erm?glichen wird, neue Linuxprogramme ohne Zusatzarbeit zu installieren.

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

11.2.1.3. Installation zus?tzlicher Systembibliotheken
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Was passiert, wenn Sie den ``linux_base``-Port installieren, und Ihr
Programm beschwert sich trotzdem ?ber fehlende Systembibliotheken? Woher
wissen Sie, welche Systembibliotheken von Linux-Bin?rprogrammen ben?tigt
werden, und wo Sie diese finden? Grunds?tzlich gibt es daf?r zwei
M?glichkeiten (um dieser Anleitung zu folgen, m?ssen Sie unter FreeBSD
als Benutzer ``root`` angemeldet sein):

Wenn Sie Zugriff auf ein Linux-System haben, k?nnen Sie dort nachsehen,
welche Systembibliotheken eine Anwendung ben?tigt, und diese auf Ihr
FreeBSD-System kopieren. Dazu folgendes Beispiel:

.. raw:: html

   <div class="informalexample">

Nehmen wir an, Sie haben FTP verwendet, um die Linux-Bin?rversion von
Doom zu bekommen und haben sie auf Ihrem Linux-System installiert. Nun
k?nnen Sie ?berpr?fen, welche Systembibliotheken das Programm ben?tigt,
indem Sie ``ldd linuxdoom`` eingeben. Das Resultat sieht dann so aus:

.. code:: screen

    % ldd linuxdoom
    libXt.so.3 (DLL Jump 3.1) => /usr/X11/lib/libXt.so.3.1.0
    libX11.so.3 (DLL Jump 3.1) => /usr/X11/lib/libX11.so.3.1.0
    libc.so.4 (DLL Jump 4.5pl26) => /lib/libc.so.4.6.29

Sie m?ssten nun alle Dateien aus der letzten Spalte kopieren und sie
unter ``/compat/linux`` speichern, wobei die Namen der ersten Spalte als
symbolische Links auf diese Dateien zeigen. Damit haben Sie schlie?lich
folgende Dateien auf Ihrem FreeBSD-System:

.. code:: screen

    /compat/linux/usr/X11/lib/libXt.so.3.1.0
    /compat/linux/usr/X11/lib/libXt.so.3 -> libXt.so.3.1.0
    /compat/linux/usr/X11/lib/libX11.so.3.1.0
    /compat/linux/usr/X11/lib/libX11.so.3 -> libX11.so.3.1.0
    /compat/linux/lib/libc.so.4.6.29
    /compat/linux/lib/libc.so.4 -> libc.so.4.6.29

.. raw:: html

   <div class="blockquote">

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    Beachten Sie, dass wenn Sie bereits eine Linux-Systembibliothek
    einer zur ersten Spalte passenden Hauptversionsnummer (laut
    ``ldd``-Ausgabe) besitzen, Sie die Datei aus der zweiten Spalte
    nicht mehr kopieren m?ssen, da die bereits vorhandene Version
    funktionieren sollte. Hat die Systembibliothek jedoch eine neuere
    Versionsnummer, sollten Sie sie dennoch kopieren. Sie k?nnen die
    alte Version l?schen, solange Sie einen symbolischen Link auf die
    neue Version anlegen. Wenn Sie also folgende Bibliotheken auf Ihrem
    System installiert haben:

    .. code:: screen

        /compat/linux/lib/libc.so.4.6.27
        /compat/linux/lib/libc.so.4 -> libc.so.4.6.27

    und Sie haben eine neue Bin?rdatei, die laut ``ldd`` eine neuere
    Bibliothek ben?tigt:

    .. code:: screen

        libc.so.4 (DLL Jump 4.5pl26) -> libc.so.4.6.29

    Wenn diese sich nur um ein oder zwei Stellen in der
    Unterversionsnummer unterscheiden, m?ssen Sie
    ``/lib/libc.so.4.6.29`` nicht auf Ihr System kopieren, da das
    Programm auch mit der etwas ?lteren Version ohne Probleme
    funktionieren sollte. Wenn Sie wollen, k?nnen Sie ``libc.so`` aber
    dennoch ersetzen (das hei?t aktualisieren), was dann zu folgender
    Ausgabe f?hrt:

    .. code:: screen

        /compat/linux/lib/libc.so.4.6.29
        /compat/linux/lib/libc.so.4 -> libc.so.4.6.29

    .. raw:: html

       </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="blockquote">

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    Der Mechanismus der symbolischen Links wird *nur* f?r
    Linux-Bin?rdateien ben?tigt. Der FreeBSD-Laufzeitlinker sucht sich
    die passenden Hauptversionsnummern selbst, das hei?t Sie m?ssen sich
    nicht darum k?mmern.

    .. raw:: html

       </div>

.. raw:: html

   </div>

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

11.2.2. Linux ELF-Bin?rdateien installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ELF-Bin?rdateien ben?tigen manchmal eine zus?tzliche „Kennzeichnung“.
Wenn Sie versuchen, eine nicht gekennzeichnete ELF-Bin?rdatei
auszuf?hren, werden Sie eine Fehlermeldung ?hnlich der folgenden
erhalten:

.. code:: screen

    % ./my-linux-elf-binary
    ELF binary type not known
    Abort

Damit der FreeBSD-Kernel eine Linux-ELF-Datei von einer
FreeBSD-ELF-Datei unterscheiden kann, gibt es das Werkzeug
`brandelf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=brandelf&sektion=1>`__.

.. code:: screen

    % brandelf -t Linux my-linux-elf-binary

Die GNU Werkzeuge schreiben nun automatisch die passende
Kennzeichnungsinformation in die ELF-Bin?rdateien, so dass Sie diesen
Schritt in Zukunft nur noch selten ben?tigen werden.

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

11.2.3. Installieren einer beliebigen RPM-basierten Linuxanwendung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD besitzt seine eigene Paketdatenbank und diese wird dazu
verwendet, um alle Ports (auch Linux?-Ports) zu verfolgen. Deshalb wird
die Linux? RPM-Datenbank nicht benutzt (fehlende Unterst?tzung).

Falls Sie jedoch eine beliebige RPM-basierte Linux?-Anwendung
installieren wollen, erreichen Sie das mittels:

.. code:: screen

    # cd /compat/linux
    # rpm2cpio -q < /path/to/linux.archive.rpm | cpio -id

Benutzen Sie dann brandelf auf die installierten ELF-Bin?rdateien (nicht
die Bibliotheken!). Sie werden keine saubere Deinstallation hinbekommen,
aber evtl. helfen ein paar Tests weiter.

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

11.2.4. Namensaufl?sung konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn DNS nicht funktioniert, oder Sie folgende Fehlermeldung erhalten:

.. code:: screen

    resolv+: "bind" is an invalid keyword resolv+:
    "hosts" is an invalid keyword

m?ssen sie ``/compat/linux/etc/host.conf`` wie folgt anlegen:

.. code:: programlisting

    order hosts, bind
    multi on

Diese Reihenfolge legt fest, dass zuerst ``/etc/hosts`` und anschlie?end
DNS durchsucht werden. Wenn ``/compat/linux/etc/host.conf`` nicht
vorhanden ist, finden Linux-Anwendungen FreeBSD's ``/etc/host.conf`` und
beschweren sich ?ber die inkompatible FreeBSD-Syntax. Wenn Sie keinen
Nameserver (in ``/etc/resolv.conf``) konfiguriert haben, sollten Sie den
Eintrag ``bind`` entfernen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------+---------------------------------------------+
| `Zur?ck <linuxemu.html>`__?              | `Nach oben <linuxemu.html>`__   | ?\ `Weiter <linuxemu-mathematica.html>`__   |
+------------------------------------------+---------------------------------+---------------------------------------------+
| Kapitel 11. Linux-Bin?rkompatibilit?t?   | `Zum Anfang <index.html>`__     | ?11.3. Mathematica? installieren            |
+------------------------------------------+---------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
