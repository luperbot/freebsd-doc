==================================
13.3. Boot-Manager und Boot-Phasen
==================================

.. raw:: html

   <div class="navheader">

13.3. Boot-Manager und Boot-Phasen
`Zur?ck <boot-introduction.html>`__?
Kapitel 13. FreeBSDs Bootvorgang
?\ `Weiter <boot-kernel.html>`__

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

13.3. Boot-Manager und Boot-Phasen
----------------------------------

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

13.3.1. Der Boot-Manager
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Code im MBR oder im Boot-Manager wird manchmal auch als *stage zero*
des Boot-Prozesses bezeichnet. Dieser Abschnitt beschreibt zwei der
weiter oben erw?hnten Boot-Manager: boot0 sowie LILO.

Der boot0 Boot-Manager:?Der vom FreeBSD-Installationsprogramm oder
`boot0cfg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot0cfg&sektion=8>`__
in der Voreinstelung installierte Master Boot Record (MBR) basiert auf
``/boot/boot0``. Bei boot0 handelt es sich um ein sehr einfaches
Programm, da im MBR lediglich 446?Bytes verf?gbar sind, weil der
restliche Platz f?r die Partitionstabelle sowie den
``0x55AA``-Identifier am Ende des MBRs ben?tigt wird. Falls Sie boot0
verwenden und mehrere Betriebssysteme auf Ihrer Festplatte installiert
haben, werden Sie beim Starten des Computers eine Anzeige ?hnlich der
folgenden sehen:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 13.1. ``boot0``-Screenshot

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    F1 DOS
    F2 FreeBSD
    F3 Linux
    F4 ??
    F5 Drive 1

    Default: F2

.. raw:: html

   </div>

.. raw:: html

   </div>

Diverse Betriebssysteme, insbesondere Windows?, ?berschreiben den MBR
ungefragt mit ihrem eigenen. Falls einem dies passiert sein sollte, kann
man mit folgendem Kommando den momentanen MBR durch den FreeBSD-MBR
ersetzen:

.. code:: screen

    # fdisk -B -b /boot/boot0 Ger?t

Bei *``Ger?t``* handelt es sich um das Ger?t, von dem gebootet wird,
also beispielsweise ``ad0`` f?r die erste IDE-Festplatte, ``ad2`` f?r
die erste IDE-Festplatte am zweiten IDE-Controller, ``da0`` f?r die
erste SCSI-Festplatte, usw. Diese Einstellungen k?nnen aber ?ber
`boot0cfg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot0cfg&sektion=8>`__
angepasst werden.

Der LILO-Boot-Manager:?Damit dieser Boot-Manager auch FreeBSD booten
kann, starten Sie zuerst Linux und f?gen danach folgende Zeilen in die
Konfigurationsdatei ``/etc/lilo.conf`` ein:

.. code:: programlisting

    other=/dev/hdXY
    table=/dev/hdX
    loader=/boot/chain.b
    label=FreeBSD

Dabei m?ssen Sie die prim?re Partition von FreeBSD sowie dessen Platte
im Linux-Format angeben. Dazu ersetzen Sie *``X``* durch die
Linux-Bezeichnung der Platte und *``Y``* durch die von Linux verwendete
Partitionsnummer. Wenn Sie ein SCSI-Laufwerk verwenden, m?ssen Sie
*``/dev/sd``* anstelle von *``/dev/hd``* verwenden. Die Zeile
``loader=/boot/chain.b`` kann weggelassen werden, wenn beide
Betriebssysteme auf der gleichen Platte installiert sind. Geben Sie
danach ``/sbin/lilo?-v`` ein, um Ihre ?nderungen zu ?bernehmen. Achtung
Sie dabei besonders auf etwaige Fehlermeldungen.

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

13.3.2. Phase Eins, ``/boot/boot1`` und Phase Zwei, ``/boot/boot2``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Prinzip sind die erste und die zweite Phase Teile desselben
Programms, im selben Bereich auf der Festplatte. Aufgrund von
Speicherplatz-Beschr?nkungen wurden sie aufgeteilt, aber man installiert
sie eigentlich generell zusammen. Beide werden entweder vom Installer
oder von bsdlabel aus der kombinierten Datei ``/boot/boot`` kopiert.

Beide Phasen befinden sich au?erhalb des Dateisystems im Bootsektor des
Boot-Slices, wo `boot0 <boot-blocks.html#boot-boot0>`__ oder ein anderer
Boot-Manager ein Programm erwarten, das den weiteren Bootvorgang
durchf?hren kann. Die Anzahl der dabei verwendeten Sektoren wird durch
die Gr??e von ``/boot/boot`` bestimmt.

``boot1`` ist ein sehr einfaches Programm, da es nur 512?Bytes gro? sein
darf, und es besitzt gerade genug Funktionalit?t, um FreeBSDs
*bsdlabel*, das Informationen ?ber den Slice enth?lt, auszulesen, und um
``boot2`` zu finden und auszuf?hren.

``boot2`` ist schon ein wenig umfangreicher und besitzt gen?gend
Funktionalit?t, um Dateien in FreeBSDs Dateisystem zu finden. Au?erdem
hat es eine einfache Schnittstelle, die es erm?glicht, den zu ladenden
Kernel oder Loader auszuw?hlen.

Da der `Loader <boot-blocks.html#boot-loader>`__ einen weitaus gr??eren
Funktionsumfang hat und eine sch?ne und einfach zu bedienende
Boot-Konfigurations-Schnittstelle zur Verf?gung stellt, wird er
gew?hnlich von ``boot2`` anstatt des Kernels gestartet. Fr?her war es
jedoch dazu da den Kernel direkt zu starten.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 13.2. ``boot2``-Screenshot

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    >> FreeBSD/i386 BOOT
    Default: 0:ad(0,a)/boot/loader
    boot:

.. raw:: html

   </div>

.. raw:: html

   </div>

Um das installierte ``boot1`` und ``boot2`` zu ersetzen, benutzt man
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__:

.. code:: screen

    # bsdlabel -B diskslice

Wobei *``Slice``* das Laufwerk und die Slice darstellt, von dem gebootet
wird, beispielsweise ``ad0s1`` f?r die erste Slice auf der ersten
IDE-Festplatte.

.. raw:: html

   <div class="warning" xmlns="">

Dangerously Dedicated Mode:
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wenn man nur den Festplatten-Namen, also z.B. ``ad0``, in
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
benutzt wird eine "dangerously dedicated disk" erstellt, ohne Slices.
Das ist ein Zustand, den man meistens nicht hervorrufen m?chte. Aus
diesem Grund sollte man ein
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__-Kommando
noch einmal pr?fen, bevor man **Return** bet?tigt.

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

13.3.3. Phase drei, ``/boot/loader``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der boot-loader ist der letzte von drei Schritten im Bootstrap-Prozess
und kann im Dateisystem normalerweise unter ``/boot/loader`` gefunden
werden.

Der Loader soll eine benutzerfreundliche Konfigurations-Schnittstelle
sein mit einem einfach zu bedienenden eingebauten Befehlssatz, erg?nzt
durch einen umfangreichen Interpreter mit einem komplexeren Befehlssatz.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.3.3.1. Loader Ablauf
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Loader sucht w?hrend seiner Initialisierung nach Konsolen und
Laufwerken, findet heraus, von welchem Laufwerk er gerade bootet, und
setzt dementsprechend bestimmte Variablen. Dann wird ein Interpreter
gestartet, der Befehle interaktiv oder von einem Skript empfangen kann.

Danach liest der Loader die Datei ``/boot/loader.rc`` aus, welche ihn
standardm??ig anweist ``/boot/defaults/loader.conf`` zu lesen, wo
sinnvolle Standardeinstellungen f?r diverse Variablen festgelegt werden
und wiederum ``/boot/loader.conf`` f?r lokale ?nderungen an diesen
Variablen ausgelesen wird. Anschlie?end arbeitet dann ``loader.rc``
entsprechend dieser Variablen und l?dt die ausgew?hlten Module und den
gew?nschten Kernel.

In der Voreinstellung wartet der Loader 10?Sekunden lang auf eine
Tastatureingabe und bootet den Kernel, falls keine Taste bet?tigt wurde.
Falls doch eine Taste bet?tigt wurde wird dem Benutzer eine
Eingabeaufforderung angezeigt. Sie nimmt einen einfach zu bedienenden
Befehlssatz entgegen, der es dem Benutzer erlaubt, ?nderungen an
Variablen vorzunehmen, Module zu laden, alle Module zu entladen oder
schlie?lich zu booten bzw. neu zu booten.

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

13.3.3.2. Die eingebauten Befehle des Loaders
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hier werden nur die gebr?uchlichsten Befehle bearbeitet. F?r eine
ersch?pfende Diskussion aller verf?gbaren Befehle konsultieren Sie bitte
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__.

.. raw:: html

   <div class="variablelist">

autoboot *``Sekunden``*
    Es wird mit dem Booten des Kernels fortgefahren, falls keine Taste
    in der gegebenen Zeitspanne bet?tigt wurde. In der gegebenen
    Zeitspanne, Vorgabe sind 10?Sekunden, wird ein Countdown angezeigt.

boot [-options] [Kernelname]
    Bewirkt das sofortige Booten des Kernels mit den gegebenen Optionen,
    falls welche angegeben wurden, und mit den angegebenen Kernel, falls
    denn einer angegeben wurde. Das ?bergeben eines Kernelnamens ist nur
    nach einem *unload*-Befehl anwendbar, andernfalls wird der zuvor
    verwendete Kernel benutzt.

boot-conf
    Bewirkt die automatische Konfiguration der Module, abh?ngig von den
    entsprechenden Variablen. Dieser Vorgang ist identisch zu dem
    Vorgang, den der Bootloader ausf?hrt und daher nur sinnvoll, wenn
    zuvor ``unload`` benutzt wurde und Variablen (gew?hnlich ``kernel``)
    ver?ndert wurden.

help [Thema]
    Zeigt die Hilfe an, die zuvor aus der Datei ``/boot/loader.help``
    gelesen wird. Falls ``index`` als Thema angegeben wird, wird die
    Liste der zur Verf?gung stehenden Hilfe-Themen angezeigt.

include *``Dateiname``* …
    Verarbeitet die angegebene Datei. Das Einlesen und Interpretieren
    geschieht Zeile f?r Zeile und wird im Falle eines Fehlers umgehend
    unterbrochen.

load [-t Typ] *``Dateiname``*
    L?dt den Kernel, das Kernel-Modul, oder die Datei des angegebenen
    Typs. Optionen, die auf den Dateinamen folgen, werden der Datei
    ?bergeben.

ls [-l] [Pfad]
    Listet die Dateien im angegebenen Pfad auf, oder das
    root-Verzeichnis(/), falls kein Pfad angegeben wurde. Die Option
    ``-l`` bewirkt, dass die Dateigr?ssen ebenfalls angezeigt werden.

lsdev [-v]
    Listet alle Ger?te auf, f?r die Module geladen werden k?nnen. Die
    Option ``-v`` bewirkt eine detailreichere Ausgabe.

lsmod [-v]
    Listet alle geladenen Module auf. Die Option ``-v`` bewirkt eine
    detailreichere Ausgabe.

more *``Dateiname``*
    Zeigt den Dateinhalt der angegebenen Datei an, wobei eine Pause alle
    ``LINES`` Zeilen gemacht wird.

reboot
    Bewirkt einen umgehenden Neustart des Systems.

set *``Variable``*, set *``Variable``*\ =\ *``Wert``*
    Setzt die Umgebungsvariablen des Loaders.

unload
    Entl?dt s?mtliche geladenen Module.

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

13.3.3.3. Beispiele f?r die Loader Bedienung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hier ein paar praktische Beispiele f?r die Bedienung des Loaders.

.. raw:: html

   <div class="itemizedlist">

-  Um den gew?hnlichen Kernel im Single-User Modus zu starten:

   .. code:: screen

       boot -s

-  Um alle gew?hnlichen Kernelmodule zu entladen und dann nur den alten
   (oder jeden beliebigen anderen) Kernel zu laden:

   .. code:: screen

       unload
       load kernel.old

   Es kann ``kernel.GENERIC`` verwendet werden, um den allgemeinen
   Kernel zu bezeichnen, der vorinstalliert wird. ``kernel.old``\ 
   bezeichnet den Kernel, der vor dem aktuellen installiert war (falls
   man einen neuen Kernel kompiliert und installiert hat zum Beispiel).

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Der folgende Befehl l?dt die gew?hnlichen Module mit einem anderen
   Kernel:

   .. code:: screen

       unload
       set kernel="kernel.old"
       boot-conf

   .. raw:: html

      </div>

-  Folgendes l?dt ein Kernelkonfigurations-Skript (ein automatisiertes
   Skript, dass dasselbe tut, was der Benutzer normalerweise von Hand an
   der Eingabeaufforderung durchf?hren w?rde):

   .. code:: screen

       load -t userconfig_script /boot/kernel.conf

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

13.3.3.4. Willkommmensbildschirme w?hrend des Bootvorgangs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Joseph J. Barbish.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedict Reuschling.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Willkommmensbildschirme erzeugen einen visuell viel ansprechenderen
Bootvorgang im Vergleich zu den herk?mmlichen Bootmeldungen. Diese
Bildschirme werden entweder bis zu einem Konsolen-Login-Prompt oder dem
eines X-Display Managers angezeigt.

Es existieren zwei grundlegende Umgebungen in FreeBSD. Die erste ist die
altbekannte, auf virtuellen Konsolen basierte Kommandozeile. Nachdem das
System den Bootvorgang abgeschlossen hat, wird ein Anmeldebildschirm auf
der Konsole anzeigt. Die zweite Umgebung ist die graphische X11-Desktop
Umgebung. Nachdem `X11 <x-install.html>`__ und eine der `Graphischen
Oberfl?chen <x11-wm.html>`__, wie GNOME, KDE, oder XFce installiert
wurden, kann der X11-Desktop ?ber das Kommando ``startx`` gestartet
werden.

Manche Benutzer ziehen den graphischen Anmeldebildschirm von X11 dem
traditionellen, textbasierten Anmeldeprompt vor. Display-Manager wie XDM
f?r Xorg, gdm f?r GNOME und kdm f?r KDE (und viele weitere aus der
Ports-Sammlung) bieten einen graphischen statt dem konsolenbasierten
Anmeldebildschirm. Nach einer erfolgreichen Anmeldung kann der Benutzer
die graphische Oberfl?che verwenden.

In der Kommandozeilen-Umgebung w?rde der Willkommensbildschirm alle
Erkennungsmeldungen des Bootvorgangs und die Startmeldungen von Diensten
verstecken, bevor der Anmeldebildschirm erscheint. In der X11-Umgebung
erhalten die Anwender einen klareren visuellen Eindruck des
Startvorgangs, ?hnlich zu dem, den Microsoft? Windows? (oder ein
nicht-Unix-artiger Systemtyp) zur Verf?gung stellt.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.3.3.4.1. Willkommensbildschirm-Funktionalit?t
''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Willkommensbildschirm-Funktionalit?t unterst?tzt nur 256-Farben
Bitmaps (``.bmp``), ZSoft PCX (``.pcx``) oder TheDraw (``.bin``)
Dateien. Zus?tzlich muss die Willkommensbildschirm-Datei eine Aufl?sung
von 320 mal 200 Pixeln oder weniger besitzen, damit Standard-VGA Ger?te
damit arbeiten k?nnen.

Um gr?ssere Bilder bis zu einer maximalen Aufl?sung von 1024 mal 768
Pixeln zu verwenden, muss Unterst?tzung f?r VESA in FreeBSD enthalten
sein. Dies kann durch das Laden des VESA-Moduls w?hrend des Systemstarts
geschehen, oder durch Hinzuf?gen der ``VESA``-Kernelkonfigurationsoption
und anschliessendem Bau des Kernels (Lesen Sie dazu `Kapitel?9,
*Konfiguration des FreeBSD-Kernels* <kernelconfig.html>`__). Die
VESA-Unterst?tzung erm?glicht es den Benutzern, Willkommensbildschirme
als Vollbild anzuzeigen, die den gesamten Bildschirm ausf?llen.

Wenn der Willkommensbildschirm beim Bootvorgang angezeigt wird, kann
dieser jederzeit mit einem beliebigen Tastendruck ausgeschaltet werden.

Der Willkommensbildschirm ist standardm?ssig so eingestellt, dass er als
Bildschirmschoner ausserhalb von X11 verwendet wird. Nach einer
bestimmten Zeit der Unt?tigkeit wird der Willkommensbildschirm angezeigt
und wechselt durch verschiedene Stufen der Intensit?t von hell zu einem
sehr dunklen Bild und wieder zur?ck. Dieses Verhalten des
Standard-Willkommensbildschirms (Screen-Saver) kann durch hinzuf?gen
einer ``saver=``-Zeile in ``/etc/rc.conf`` ge?ndert werden. Die Option
``saver=`` besitzt mehrere eingebaute Screen-Saver, aus denen man w?hlen
kann, und deren komplette Liste in der
`splash(4) <http://www.FreeBSD.org/cgi/man.cgi?query=splash&sektion=4>`__-Manualpage
enthalten ist. Der Standard-Screen-Saver ist „warp“. Beachten Sie, dass
sich die ``saver=``-Option in ``/etc/rc.conf`` nur auf virtuelle
Konsolen bezieht. Sie hat keinen Effekt auf X11-Display-Manager.

Ein paar Nachrichten des Bootloaders und ganz besonders das Men? mit den
Bootoptionen und dem Warte-Countdown werden zur Bootzeit angezeigt,
selbst wenn der Willkommensbildschirm aktiviert ist.

Dateien mit Beispiel-Willkommensbildschirmen k?nnen von der Galerie auf
`http://artwork.freebsdgr.orgb <http://artwork.freebsdgr.org/node/3/>`__
heruntergeladen werden. Durch die Installation des Ports
`sysutils/bsd-splash-changer <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/bsd-splash-changer/pkg-descr>`__
k?nnen Willkommensbildschirme von einer zuf?llig ausgew?hlten Sammlung
von Bildern bei jedem Neustart angezeigt werden.

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

13.3.3.4.2. Aktivieren der Willkommensbildschirm-Funktionalit?t
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Willkommensbildschirm-Datei (``.bmp``, oder ``.pcx``) muss im
Wurzelverzeichnis, z.B. ``/boot`` abgelegt werden.

F?r die Standard-Aufl?sung (256-Farben, 320 mal 200 Pixel oder weniger)
beim Booten bearbeiten Sie die Datei ``/boot/loader.conf``, so dass
diese die folgenden Zeilen enth?lt:

.. code:: programlisting

    splash_bmp_load="YES"
    bitmap_load="YES"
    bitmap_name="/boot/splash.bmp"

F?r gr?ssere Video-Aufl?sungen bis zum Maximum von 1024 mal 768 Pixeln
?ndern Sie die Datei ``/boot/loader.conf``, damit diese die folgenden
Zeilen enth?lt:

.. code:: programlisting

    vesa_load="YES"
    splash_bmp_load="YES"
    bitmap_load="YES"
    bitmap_name="/boot/splash.bmp"

Das Beispiel oben nimmt an, dass ``/boot/splash.bmp`` als
Willkommensbildschirm verwendet wird. Wenn eine PCX-Datei verwendet
werden soll, benutzen Sie die folgenden Zeilen, inklusive der
``vesa_load="YES"``-Zeile, abh?ngig von der Aufl?sung.

.. code:: programlisting

    splash_pcx_load="YES"
    bitmap_load="YES"
    bitmap_name="/boot/splash.pcx"

Der Dateiname ist nicht, wie im obigen Beispiel gezeigt, auf „splash“
beschr?nkt. Es darf ein beliebiger Name sein, solange die Datei vom Typ
BMP oder PCX ist, wie beispielsweise ``splash_640x400``.bmp oder
``blue_wave``.pcx.

Weitere interessante Optionen f?r ``loader.conf`` sind:

.. raw:: html

   <div class="variablelist">

``beastie_disable="YES"``
    Diese Option verhindert die Anzeige des Men?s mit den Bootoptionen,
    aber der Countdown ist immer noch aktiv. Selbst wenn das Bootmen?
    deaktiviert ist, kann w?hrend des Countdowns eine der
    korrespondierenden Optionen ausgew?hlt werden.

``loader_logo="beastie"``
    Dies ersetzt die Standardanzeige des Wortes „FreeBSD“. Stattdessen
    wird wie in der Vergangenheit auf der rechten Seite des Bootmen?s
    das bunte Beastie-Logo angezeigt.

.. raw:: html

   </div>

F?r weitere Informationen lesen Sie die Manualpages
`splash(4) <http://www.FreeBSD.org/cgi/man.cgi?query=splash&sektion=4>`__,
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
und `vga(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vga&sektion=4>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+-------------------------------------------------------+
| `Zur?ck <boot-introduction.html>`__?   | `Nach oben <boot.html>`__     | ?\ `Weiter <boot-kernel.html>`__                      |
+----------------------------------------+-------------------------------+-------------------------------------------------------+
| 13.2. Das Problem des Bootens?         | `Zum Anfang <index.html>`__   | ?13.4. Kernel Interaktion w?hrend des Bootprozesses   |
+----------------------------------------+-------------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
