======================
6.4. X11 konfigurieren
======================

.. raw:: html

   <div class="navheader">

6.4. X11 konfigurieren
`Zur?ck <x-install.html>`__?
Kapitel 6. Das X-Window-System
?\ `Weiter <x-fonts.html>`__

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

6.4. X11 konfigurieren
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Christopher Shumway.

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

6.4.1. Vorarbeiten
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie X11 konfigurieren, ben?tigen Sie folgende Informationen:

.. raw:: html

   <div class="itemizedlist">

-  die Spezifikationen des Monitors

-  den Chipset des Grafikadapters

-  die Speichergr??e des Grafikadapters

.. raw:: html

   </div>

Aus den Spezifikationen des Monitors ermittelt X11 die Aufl?sung und die
Wiederholrate f?r den Betrieb des X-Servers. Die Spezifikationen
entnehmen Sie der Dokumentation des Monitors oder der Webseite des
Herstellers. Sie ben?tigen die horizontale und die vertikale
Synchronisationsfrequenz.

Der Chipsatz der Grafikkarte bestimmt den Treiber, den X11 verwendet.
Die meisten Chips?tze werden automatisch erkannt, Sie brauchen die
Information jedoch, wenn die Erkennung fehlschl?gt.

Die Speichergr??e der Grafikkarte bestimmt die maximal m?gliche
Aufl?sung und Farbtiefe.

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

6.4.2. X11 konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xorg verwendet HAL, um Tastaturen und M?use automatisch zu erkennen. Die
Ports
`sysutils/hal <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/hal/pkg-descr>`__
und
`devel/dbus <http://www.freebsd.org/cgi/url.cgi?ports/devel/dbus/pkg-descr>`__
werden als Abh?ngigkeiten von
`x11/xorg <http://www.freebsd.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__
installiert, m?ssen aber durch die folgenden Eintr?ge in
``/etc/rc.conf`` aktiviert werden:

.. code:: programlisting

    hald_enable="YES"
    dbus_enable="YES"

Diese Dienste sollten (entweder manuell oder durch einen Neustart)
gestartet werden, bevor mit der weiteren Konfiguration oder Verwendung
von Xorg begonnen wird.

Xorg kann oft schon ohne weitere Konfigurationsschritte laufen, indem am
Prompt folgendes eingegeben wird:

.. code:: screen

    % startx

Die automatische Konfiguration kann mit bestimmter Hardware fehlschlagen
oder gewisse Dinge nicht so einrichten, wie gew?nscht. In diesen F?llen
ist eine manuelle Konfiguration notwendig.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Grafische Oberfl?chen wie GNOME, KDE oder Xfce besitzen eigene
Werkzeuge, die es dem Benutzer erlauben, auf einfache Art und Weise die
Bildschirmparameter wie die Aufl?sung zu ?ndern. Falls die
Standardkonfiguration f?r Sie nicht akzeptabel ist und die Installation
einer grafischen Oberfl?che geplant ist, fahren Sie damit fort und
benutzen Sie dann das entsprechende Werkzeug f?r die
Bildschirmeinstellungen.

.. raw:: html

   </div>

Die X11 Konfiguration spielt sich in mehreren Schritten ab. Dazu
erstellen Sie als erstes eine Vorgabe f?r die Konfigurationsdatei.
Setzen Sie dazu als ``root`` den folgenden Befehl ab:

.. code:: screen

    # Xorg -configure

Die Vorgabe-Konfiguration wird dann unter dem Namen ``xorg.conf.new`` im
Verzeichnis ``/root`` gespeichert (das verwendete Verzeichnis wird durch
die Umgebungsvariable ``$HOME`` bestimmt und h?ngt davon ab, wie Sie zu
``root`` gewechselt sind). X11 hat in diesem Schritt versucht, die
Grafik-Hardware des Systems zu erkennen und eine Konfigurationsdatei
ausgeschrieben, die zur Hardware passende Treiber l?dt.

Im n?chsten Schritt wird gepr?ft, ob Xorg die Grafik-Hardware des
Systems verwenden kann. Setzen Sie dazu den folgenden Befehl ab:

.. code:: screen

    # Xorg -config xorg.conf.new -retro

Wenn jetzt ein graues Raster und der X-Mauszeiger erscheinen, war die
Konfiguration erfolgreich. Beenden Sie den Test, indem Sie auf die
virtuelle Konsole wechseln, die Sie verwendet haben, um den Test zu
starten, durch gleichzeitiges dr?cken von
**Ctrl**+**Alt**+**F\ *``n``*** (**F1** f?r die erste virtuelle Konsole)
und dr?cken anschliessend **Ctrl**+**C**.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Tastenkombination **Ctrl**+**Alt**+**Backspace** kann verwendet
werden, um Xorg zu beenden. Um diese zu aktivieren, f?gen geben Sie
entweder den folgenden Befehl von einem X-Terminalemulator ein:

.. code:: screen

    % setxkbmap -option terminate:ctrl_alt_bksp

oder erstellen Sie eine Tastaturkonfigurationsdatei f?r hald,
``x11-input.fdi`` genannt, und legen Sie diese im Verzeichnis
``/usr/local/etc/hal/fdi/policy`` ab. Diese Datei sollte die folgenden
Zeilen enthalten:

.. code:: programlisting

    <?xml version="1.0" encoding="iso-8859-1"?>
    <deviceinfo version="0.2">
       <device>
         <match key="info.capabilities" contains="input.keyboard">
               <merge key="input.x11_XkbOptions" type="string">terminate:ctrl_alt_bksp</merge>
         </match>
       </device>
    </deviceinfo>

Sie m?ssen anschliessend ihren Computer neu starten, um hald zu zwingen,
diese Datei einzulesen.

Die folgende Zeile muss ebenfalls zu ``xorg.conf.new`` hinzugef?gt
werden, entweder in den Abschnitt ``ServerLayout`` oder ``ServerFlags``:

.. code:: programlisting

    Option  "DontZap"       "off"

.. raw:: html

   </div>

Wenn die Maus nicht funktioniert, pr?fen Sie, ob die Maus konfiguriert
wurde. Die Mauskonfiguration wird in `Abschnitt?2.10.10, „Die Maus
konfigurieren“ <install-post.html#mouse>`__ im
FreeBSD-Installationskapitel beschrieben. In neueren Xorg-Versionen
werden die ``InputDevice``-Abschnitte in ``xorg.conf`` ignoriert, um
stattdessen die automatisch erkannten Ger?te zu verwenden. Um das alte
Verhalten wiederherzustellen, f?gen Sie die folgende Zeile zum
``ServerLayout``- oder dem ``ServerFlags``-Abschnitt dieser Datei hinzu:

.. code:: programlisting

    Option "AutoAddDevices" "false"

Eingabeger?te k?nnen dann wie in den vorherigen Versionen konfiguriert
werden, zusammen mit anderen ben?tigen Optionen (z.B. wechseln des
Tastaturlayouts).

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wie zuvor erw?hnt, wird standardm?ssig der hald-Dienst automatisch Ihre
Tastatur erkennen. Es kann passieren, dass ihr Tastaturlayout oder das
Modell nicht korrekt erkannt wird. Grafische Oberfl?chen wie GNOME, KDE
oder Xfce stellen Werkzeuge f?r die Konfiguration der Tastatur bereit.
Es ist allerdings auch m?glich, die Tastatureigenschaften direkt zu
setzen, entweder mit Hilfe von
`setxkbmap(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setxkbmap&sektion=1>`__
oder mit einer Konfigurationsregel von hald.

Wenn Sie zum Beispiel eine PC 102-Tasten Tastatur mit franz?sischem
Layout verwenden m?chten, m?ssen Sie eine Tastaturkonfigurationsdatei
f?r hald, genannt ``x11-input.fdi``, im Verzeichnis
``/usr/local/etc/hal/fdi/policy`` ablegen. Diese Datei sollte die
folgenden Zeilen enthalten:

.. code:: programlisting

    <?xml version="1.0" encoding="iso-8859-1"?>
    <deviceinfo version="0.2">
       <device>
         <match key="info.capabilities" contains="input.keyboard">
               <merge key="input.x11_options.XkbModel" type="string">pc102</merge>
               <merge key="input.x11_options.XkbLayout" type="string">fr</merge>
         </match>
       </device>
    </deviceinfo>

Wenn diese Datei bereits existiert, kopieren Sie nur die Zeilen in diese
Datei, welche die Tastaturkonfiguration betreffen.

Sie m?ssen Ihren Computer neu starten, um hald zu zwingen, diese Datei
einzulesen.

Es ist m?glich, die gleiche Konfiguration von einem X-Terminal oder
einem Skript ?ber den folgenden Befehl heraus zu t?tigen:

.. code:: screen

    % setxkbmap -model pc102 -layout fr

Die Datei ``/usr/local/share/X11/xkb/rules/base.lst`` listet die
verschiedenen Tastatur- und Layoutoptionen auf, die Ihnen zur Verf?gung
stehen.

.. raw:: html

   </div>

Als N?chstes passen Sie ``xorg.conf.new`` an. ?ffnen Sie die Datei in
einem Editor, wie
`emacs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=emacs&sektion=1>`__
oder `ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1>`__
und f?gen Sie die Synchronisationsfrequenzen des Monitors ein. Die
Frequenzen werden im Abschnitt ``"Monitor"`` eingetragen:

.. code:: programlisting

    Section "Monitor"
            Identifier   "Monitor0"
            VendorName   "Monitor Vendor"
            ModelName    "Monitor Model"
            HorizSync    30-107
            VertRefresh  48-120
    EndSection

Unter Umst?nden fehlen die Schl?sselw?rter ``HorizSync`` und
``VertRefresh``, die Sie dann nachtragen m?ssen. Geben Sie, wie im
Beispiel gezeigt, die horizontale Synchronisationsfrequenz hinter
``HorizSync`` und die vertikale Synchronisationsfrequenz hinter
``VertRefresh`` an.

X unterst?tzt die Energiesparfunktionen (DPMS, Energy Star) Ihres
Monitors. Mit
`xset(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xset&sektion=1>`__
k?nnen Sie Zeitschranken f?r die DPMS-Modi „standby“, „suspend“, „off“
vorgeben, oder diese zwingend aktivieren. Die DPMS-Funktionen k?nnen Sie
mit der nachstehenden Zeile im ``"Monitor"``-Abschnitt aktivieren:

.. code:: programlisting

    Option       "DPMS"

Die gew?nschte Aufl?sung und Farbtiefe stellen Sie im Abschnitt
``"Screen"`` ein:

.. code:: programlisting

    Section "Screen"
            Identifier "Screen0"
            Device     "Card0"
            Monitor    "Monitor0"
            DefaultDepth 24
            SubSection "Display"
                    Viewport  0 0
                    Depth     24
                    Modes     "1024x768"
            EndSubSection
    EndSection

Mit ``DefaultDepth`` wird die Farbtiefe des X-Servers vorgegeben. Mit
der Option ``-depth`` von
`Xorg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=Xorg&sektion=1>`__
l?sst sich die vorgegebene Farbtiefe ?berschreiben. ``Modes`` gibt die
Aufl?sung f?r die angegebene Farbtiefe an. Die Farbtiefe im Beispiel
betr?gt 24?Bits pro Pixel, die zugeh?rige Aufl?sung ist 1024x768?Pixel.
Beachten Sie, dass in der Voreinstellung nur Standard-VESA-Modi der
Grafikkarte angegeben werden k?nnen.

Sichern Sie die Konfigurationsdatei und testen Sie die Konfiguration wie
oben beschrieben.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bei der Fehlersuche sind Ihnen die Protokolle des X11-Servers
behilflich. In den Protokollen wird die gefundene Graphik-Hardware
protokolliert. Die Protokolle von Xorg hei?en ``/var/log/Xorg.0.log``.
Die Dateinamen enthalten eine laufende Nummer, der Name variiert daher
von ``Xorg.0.log`` zu ``Xorg.8.log``.

.. raw:: html

   </div>

Wenn alles funktioniert hat, installieren Sie die Datei an einen Ort, an
dem
`Xorg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=Xorg&sektion=1>`__
sie findet. Normalerweise wird die Konfigurationsdatei unter
``/etc/X11/xorg.conf`` oder ``/usr/local/etc/X11/xorg.conf``
gespeichert:

.. code:: screen

    # cp xorg.conf.new /etc/X11/xorg.conf

Damit ist die X11-Konfiguration beendet und Xorg kann nun mithilfe von
`startx(1) <http://www.FreeBSD.org/cgi/man.cgi?query=startx&sektion=1>`__
gestartet werden. Alternativ k?nnen Sie X11 auch mit
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__
starten.

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

6.4.3. Spezielle Konfigurationen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

6.4.3.1. Konfiguration des Intel? i810 Graphics Chipsets
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Intel? i810-Chipset ben?tigt den Treiber ``agpgart``, die
AGP-Schnittstelle von X11. Weitere Informationen finden sich in
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4>`__.

Ab jetzt kann die Hardware wie jede andere Grafikkarte auch konfiguriert
werden. Der Treiber
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4>`__ kann
nicht nachtr?glich mit
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
in einen laufenden Kernel geladen werden. Er muss entweder fest im
Kernel eingebunden sein oder beim Systemstart ?ber ``/boot/loader.conf``
geladen werden.

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

6.4.3.2. Einen Widescreen-Monitor einsetzen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt geht ?ber die normalen Konfigurationsarbeiten hinaus
und setzt einiges an Vorwissen voraus. Selbst wenn die Standardwerkzeuge
zur X-Konfiguration bei diesen Ger?ten nicht zum Erfolg f?hren, sollten
sich in den Logdateien genug Informationen finden, mit denen Sie
letztlich doch einen funktionierenden X-Server konfigurieren k?nnen.
Alles, was Sie dazu noch ben?tigen, ist ein Texteditor.

Aktuelle Widescreen-Formate (wie WSXGA, WSXGA+, WUXGA, WXGA, WXGA+, und
andere mehr) unterst?tzen Seitenverh?ltnisse wie 16:10 oder 10:9, die
unter X Probleme verursachen k?nnen. Bei einem Seitenverh?ltnis von
16:10 sind beispielsweise folgende Aufl?sungen m?glich:

.. raw:: html

   <div class="itemizedlist">

-  2560x1600

-  1920x1200

-  1680x1050

-  1440x900

-  1280x800

.. raw:: html

   </div>

Diese Konfiguration k?nnte so einfach sein wie das zus?tzliche Anlegen
eines Eintrags einer dieser Aufl?sungen als ein m?glicher ``Mode`` in
``Section "Screen"``:

.. code:: programlisting

    Section "Screen"
    Identifier "Screen0"
    Device     "Card0"
    Monitor    "Monitor0"
    DefaultDepth 24
    SubSection "Display"
        Viewport  0 0
        Depth     24
        Modes     "1680x1050"
    EndSubSection
    EndSection

Xorg ist normalerweise intelligent genug, um die Informationen zu den
erlaubten Aufl?sungen ?ber I2C/DDC zu beziehen, und wei? daher, welche
Aufl?sungen und Frequenzen Ihr Widescreen-Monitor unterst?tzt.

Wenn diese ``ModeLines`` in den Treiberdateien nicht vorhanden sind,
kann es sein, dass Sie Xorg beim Finden der korrekten Werte unterst?tzen
m?ssen. Dazu extrahieren Sie die ben?tigten Informationen aus der Datei
``/var/log/Xorg.0.log`` und erzeugen daraus eine funktionierende
``ModeLine``. Dazu suchen Sie in dieser Datei nach Zeilen ?hnlich den
folgenden:

.. code:: programlisting

    (II) MGA(0): Supported additional Video Mode:
    (II) MGA(0): clock: 146.2 MHz   Image Size:  433 x 271 mm
    (II) MGA(0): h_active: 1680  h_sync: 1784  h_sync_end 1960 h_blank_end 2240 h_border: 0
    (II) MGA(0): v_active: 1050  v_sync: 1053  v_sync_end 1059 v_blanking: 1089 v_border: 0
    (II) MGA(0): Ranges: V min: 48  V max: 85 Hz, H min: 30  H max: 94 kHz, PixClock max 170 MHz

Diese Informationen werden auch als EDID-Informationen bezeichnet. Um
daraus eine funktionierende ``ModeLine`` zu erzeugen, m?ssen Sie
lediglich die Zahlen in die korrekte Reihenfolge bringen:

.. code:: programlisting

    ModeLine <name> <clock> <4 horiz. timings> <4 vert. timings>

Die korrekte ``ModeLine`` in ``Section "Monitor"`` w?rde f?r dieses
Beispiel folgenderma?en aussehen:

.. code:: programlisting

    Section "Monitor"
    Identifier      "Monitor1"
    VendorName      "Bigname"
    ModelName       "BestModel"
    ModeLine        "1680x1050" 146.2 1680 1784 1960 2240 1050 1053 1059 1089
    Option          "DPMS"
    EndSection

Nachdem diese ?derungen durchgef?hrt sind, sollte X auch auf Ihrem neuen
Widescreen-Monitor starten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <x-install.html>`__?   | `Nach oben <x11.html>`__      | ?\ `Weiter <x-fonts.html>`__         |
+--------------------------------+-------------------------------+--------------------------------------+
| 6.3. X11 installieren?         | `Zum Anfang <index.html>`__   | ?6.5. Schriftarten in X11 benutzen   |
+--------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
