=======================
8.4. Videos wiedergeben
=======================

.. raw:: html

   <div class="navheader">

8.4. Videos wiedergeben
`Zur?ck <sound-mp3.html>`__?
Kapitel 8. Multimedia
?\ `Weiter <tvcard.html>`__

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

8.4. Videos wiedergeben
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Ross Lippert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Wiedergabe von Videos ist ein neues, sich schnell entwickelndes,
Anwendungsgebiet. Seien Sie geduldig, es wird nicht alles so glatt
laufen, wie bei den Audio-Anwendungen.

Bevor Sie beginnen, sollten Sie das Modell Ihrer Videokarte und den
benutzten Chip kennen. Obwohl Xorg viele Videokarten unterst?tzt, k?nnen
nur einige Karten Videos schnell genug wiedergeben. Eine Liste der
Erweiterungen, die der X-Server f?r eine Videokarte unterst?tzt,
erhalten Sie unter laufendem X11 mit dem Befehl
`xdpyinfo(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdpyinfo&sektion=1>`__.

Halten Sie eine kurze MPEG-Datei bereit, mit der Sie Wiedergabeprogramme
und deren Optionen testen k?nnen. Da einige DVD-Spieler in der
Voreinstellung das DVD-Ger?t mit ``/dev/dvd`` ansprechen oder diesen
Namen fest einkodiert haben, wollen Sie vielleicht symbolische Links auf
die richtigen Ger?te anlegen:

.. code:: screen

    # ln -sf /dev/acd0 /dev/dvd
    # ln -sf /dev/acd0 /dev/rdvd

Wegen
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
gehen gesondert angelegte Links wie diese bei einem Neustart des Systems
verloren. Damit die symbolischen Links automatisch beim Neustart des
Systems angelegt werden, f?gen Sie die folgenden Zeilen in
``/etc/devfs.conf`` ein:

.. code:: programlisting

    link acd0 dvd
    link acd0 rdvd

Zum Entschl?sseln von DVDs m?ssen bestimmte DVD-ROM-Funktionen
aufgerufen werden und schreibender Zugriff auf das DVD-Ger?t erlaubt
sein.

X11 benutzt Shared-Memory und Sie sollten die nachstehenden
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__-Variablen
auf die gezeigten Werte erh?hen:

.. code:: programlisting

    kern.ipc.shmmax=67108864
    kern.ipc.shmall=32768

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.1. Video-Schnittstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt einige M?glichkeiten, Videos unter X11 abzuspielen. Welche
M?glichkeit funktioniert, h?ngt stark von der verwendeten Hardware ab.
Ebenso h?ngt die erzielte Qualit?t von der Hardware ab. Die
Videowiedergabe unter X11 ist ein aktuelles Thema, sodass jede neue
Version von Xorg wahrscheinlich erhebliche Verbesserungen enth?lt.

Gebr?uchliche Video-Schnittstellen sind:

.. raw:: html

   <div class="orderedlist">

#. X11: normale X11-Ausgabe ?ber Shared-Memory.

#. XVideo: Eine Erweiterung der X11-Schnittstelle, die Videos in jedem
   X11-Drawable anzeigen kann.

#. SDL: Simple Directmedia Layer.

#. DGA: Direct Graphics Access.

#. SVGAlib: Eine Schnittstelle zur Grafikausgabe auf der Konsole.

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

8.4.1.1. XVideo
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Erweiterung *XVideo* (auch Xvideo, Xv oder xv) von Xorg erlaubt die
beschleunigte Wiedergabe von Videos in jedem Drawable. Diese Erweiterung
liefert auch auf weniger leistungsf?higen Systemen (beispielsweise einem
PIII?400?MHz Laptop) eine gute Wiedergabe.

Ob die Erweiterung l?uft, entnehmen Sie der Ausgabe von ``xvinfo``:

.. code:: screen

    % xvinfo

XVideo wird unterts?tzt, wenn die Ausgabe wie folgt aussieht:

.. code:: screen

    X-Video Extension version 2.2
    screen #0
      Adaptor #0: "Savage Streams Engine"
        number of ports: 1
        port base: 43
        operations supported: PutImage
        supported visuals:
          depth 16, visualID 0x22
          depth 16, visualID 0x23
        number of attributes: 5
          "XV_COLORKEY" (range 0 to 16777215)
                  client settable attribute
                  client gettable attribute (current value is 2110)
          "XV_BRIGHTNESS" (range -128 to 127)
                  client settable attribute
                  client gettable attribute (current value is 0)
          "XV_CONTRAST" (range 0 to 255)
                  client settable attribute
                  client gettable attribute (current value is 128)
          "XV_SATURATION" (range 0 to 255)
                  client settable attribute
                  client gettable attribute (current value is 128)
          "XV_HUE" (range -180 to 180)
                  client settable attribute
                  client gettable attribute (current value is 0)
        maximum XvImage size: 1024 x 1024
        Number of image formats: 7
          id: 0x32595559 (YUY2)
            guid: 59555932-0000-0010-8000-00aa00389b71
            bits per pixel: 16
            number of planes: 1
            type: YUV (packed)
          id: 0x32315659 (YV12)
            guid: 59563132-0000-0010-8000-00aa00389b71
            bits per pixel: 12
            number of planes: 3
            type: YUV (planar)
          id: 0x30323449 (I420)
            guid: 49343230-0000-0010-8000-00aa00389b71
            bits per pixel: 12
            number of planes: 3
            type: YUV (planar)
          id: 0x36315652 (RV16)
            guid: 52563135-0000-0000-0000-000000000000
            bits per pixel: 16
            number of planes: 1
            type: RGB (packed)
            depth: 0
            red, green, blue masks: 0x1f, 0x3e0, 0x7c00
          id: 0x35315652 (RV15)
            guid: 52563136-0000-0000-0000-000000000000
            bits per pixel: 16
            number of planes: 1
            type: RGB (packed)
            depth: 0
            red, green, blue masks: 0x1f, 0x7e0, 0xf800
          id: 0x31313259 (Y211)
            guid: 59323131-0000-0010-8000-00aa00389b71
            bits per pixel: 6
            number of planes: 3
            type: YUV (packed)
          id: 0x0
            guid: 00000000-0000-0000-0000-000000000000
            bits per pixel: 0
            number of planes: 0
            type: RGB (packed)
            depth: 1
            red, green, blue masks: 0x0, 0x0, 0x0

Einige der aufgef?hrten Formate (wie YUV2 oder YUV12) existieren in
machen XVideo-Implementierungen nicht. Dies kann zu Problemen mit
einigen Spielern f?hren.

XVideo wird wahrscheinlich von Ihrer Karte nicht unterst?tzt, wenn die
die Ausgabe wie folgt aussieht:

.. code:: screen

    X-Video Extension version 2.2
    screen #0
    no adaptors present

Wenn die XVideo-Erweiterung auf Ihrer Karte nicht l?uft, wird es nur
etwas schwieriger, die Anforderungen f?r die Wiedergabe von Videos zu
erf?llen. Abh?ngig von Ihrer Videokarte und Ihrem Prozessor k?nnen Sie
dennoch zufriedenstellende Ergebnisse erzielen. Sie sollten vielleicht
die weiterf?hrenden Quellen in `Abschnitt?8.4.3, „Weiterf?hrende
Quellen“ <video-playback.html#video-further-reading>`__ zu Rate ziehen,
um die Geschwindigkeit Ihres Systems zu steigern.

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

8.4.1.2. Simple Directmedia Layer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Simple Directmedia Layer, SDL, ist eine zwischen
Microsoft??Windows?, BeOS und UNIX? portable Schnittstelle. Mit dieser
Schnittstelle k?nnen Anwendungen plattformunabh?ngig und effizient Ton
und Grafik benutzen. SDL bietet eine hardwarenahe Schnittstelle, die
manchmal schneller als die X11-Schnittstelle sein kann.

SDL finden Sie in den Ports im Verzeichnis
`devel/sdl12 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl12/pkg-descr>`__.

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

8.4.1.3. Direct Graphics Access
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die X11-Erweiterung Direct Graphics Access (DGA) erlaubt es Anwendungen,
am X-Server vorbei direkt in den Framebuffer zu schreiben. Da die
Anwendung und der X-Server auf gemeinsame Speicherbereiche zugreifen,
m?ssen die Anwendungen unter dem Benutzer ``root`` laufen.

Die DGA-Erweiterung kann mit
`dga(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dga&sektion=1>`__
getestet werden. Das Kommando ``dga`` wechselt, jedes Mal wenn eine
Taste gedr?ckt wird, die Farben der Anzeige. Sie k?nnen das Programm mit
der Taste **q** verlassen.

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

8.4.2. Video-Anwendungen
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt behandelt Anwendungen aus der FreeBSD-Ports-Sammlung,
die Videos abspielen. An der Videowiedergabe wird derzeit aktiv
gearbeitet, sodass der Funktionsumfang der Anwendungen von dem hier
beschriebenen abweichen kann.

Viele unter FreeBSD laufende Videoanwendungen wurden unter Linux
entwickelt und befinden sich noch im Beta-Status. Der Betrieb dieser
Anwendungen unter FreeBSD st??t vielleicht auf einige der nachstehenden
Probleme:

.. raw:: html

   <div class="orderedlist">

#. Eine Anwendung kann eine Datei einer anderen Anwendung nicht
   abspielen.

#. Eine Anwendung kann eine selbst produzierte Datei nicht abspielen.

#. Wenn dieselbe Anwendung auf unterschiedlichen Maschinen gebaut wird,
   wird ein Video unterschiedlich wiedergegeben.

#. Ein vergleichsweise einfacher Filter, wie die Skalierung eines
   Bildes, f?hrt zu deutlichen Artefakten in der Darstellung.

#. Eine Anwendung st?rzt h?ufig ab.

#. Die Dokumentation wird bei der Installation des Ports nicht
   installiert. Sie befindet sich entweder auf dem Internet oder im
   Verzeichnis ``work`` des Ports.

.. raw:: html

   </div>

Viele Anwendungen sind zudem sehr „Linux-lastig“. Probleme entstehen
durch die Implementierung von Standard-Bibliotheken in
Linux-Distributionen oder dadurch, dass die Anwendung bestimmte
Linux-Kernelfunktionen voraussetzt. Diese Probleme werden nicht immer
vom Betreuer eines Ports bemerkt und umgangen. In der Praxis entstehen
dadurch folgende Probleme:

.. raw:: html

   <div class="orderedlist">

#. Eigenschaften des Prozessors werden ?ber ``/proc/cpuinfo`` ermittelt.

#. Die falsche Anwendung von Threads f?hrt dazu, dass sich ein Programm
   aufh?ngt statt sich zu beenden.

#. Die Anwendung h?ngt von anderen Anwendungen ab, die sich noch nicht
   in der FreeBSD-Ports-Sammlung befinden.

.. raw:: html

   </div>

Allerdings arbeiten die Anwendungsentwickler bislang mit den Betreuern
der Ports zusammen, sodass zus?tzlicher Portierungsaufwand minimiert
wird.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.2.1. MPlayer
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MPlayer ist ein k?rzlich entstandener und sich stark weiterentwickelnder
Video-Spieler. Das Hauptaugenmerk des MPlayer-Teams liegt auf
Geschwindigkeit und Flexibilit?t auf Linux und anderen UNIX? Systemen.
Das Projekt entstand weil der Gr?nder des Teams unzufrieden mit der
Geschwindigkeit bestehender Video-Spieler war. Kritiker behaupten, dass
die Benutzeroberfl?che der einfachen Gestaltung zum Opfer fiel. Wenn Sie
sich allerdings erstmal an die Kommandozeilenoptionen und die
Tastensteuerung gew?hnt haben, funktioniert die Anwendung sehr gut.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.2.1.1. MPlayer bauen
''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MPlayer finden Sie in der Ports-Sammlung unter
`multimedia/mplayer <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/mplayer/pkg-descr>`__.
Der Bau von MPlayer ber?cksichtigt die vorhandene Harware und erzeugt
ein Programm, das nicht auf ein anderes System ?bertragbar ist. Es ist
daher wichtig, dass Sie das Programm aus den Ports bauen und nicht das
fertige Paket installieren. Zus?tzlich k?nnen Sie auf der Kommandozeile
von ``make`` noch einige Optionen angeben, die im ``Makefile``
beschrieben sind und am die Anfang des Baus ausgegeben werden:

.. code:: screen

    # cd /usr/ports/multimedia/mplayer
    # make
    N - O - T - E

    Take a careful look into the Makefile in order
    to learn how to tune mplayer towards you personal preferences!
    For example,
    make WITH_GTK1
    builds MPlayer with GTK1-GUI support.
    If you want to use the GUI, you can either install
    /usr/ports/multimedia/mplayer-skins
    or download official skin collections from
    http://www.mplayerhq.hu/homepage/dload.html

F?r die meisten Benutzer sind die voreingestellten Option in Ordnung.
Wenn Sie den XviD-Codec ben?tigen, m?ssen Sie auf der Kommandozeile die
Option ``WITH_XVID`` angeben. Das DVD-Ger?t k?nnen Sie mit der Option
``WITH_DVD_DEVICE`` angeben. Wenn Sie die Option nicht angeben, wird
``/dev/acd0`` benutzt.

Als dieser Abschnitt verfasst wurde, baute der MPlayer-Port die
HTML-Dokumentation sowie die beiden Programme ``mplayer`` und
``mencoder``. Mit ``mencoder`` k?nnen Sie Videodateien umwandeln.

Die HTML-Dokumentation von MPlayer ist sehr lehrreich. Wenn Sie in
diesem Kapitel Informationen ?ber Video-Hardware oder Schnittstellen
vermissen, ist die MPlayer-Dokumentation eine ausgezeichnete Quelle.
Wenn Sie Informationen ?ber die Video-Unterst?tzung unter UNIX?
ben?tigen, sollten Sie die MPlayer-Dokumentation auf jeden Fall lesen.

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

8.4.2.1.2. MPlayer benutzen
'''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jeder Benutzer von MPlayer muss in seinem Heimatverzeichnis das
Verzeichnis ``.mplayer`` anlegen. Dieses Verzeichnis k?nnen Sie wie
folgt anlegen:

.. code:: screen

    % cd /usr/ports/multimedia/mplayer
    % make install-user

Die Kommandozeilenoptionen von ``mplayer`` sind in der Hilfeseite
aufgef?hrt. Eine genaue Beschreibung befindet sich in der
HTML-Dokumentation. In diesem Abschnitt wird nur der normale Gebrauch
von ``mplayer`` beschrieben.

Um eine Datei, wie ``testfile.avi``, unter verschiedenen
Video-Schnittstellen abzuspielen, benutzen Sie die Option ``-vo``:

.. code:: screen

    % mplayer -vo xv testfile.avi

.. code:: screen

    % mplayer -vo sdl testfile.avi

.. code:: screen

    % mplayer -vo x11 testfile.avi

.. code:: screen

    # mplayer -vo dga testfile.avi

.. code:: screen

    # mplayer -vo 'sdl:dga' testfile.avi

Es lohnt sich, alle Option zu testen. Die erzielte Geschwindigkeit h?ngt
von vielen Faktoren ab und variiert betr?chtlich je nach eingesetzter
Hardware.

Wenn Sie eine DVD abspielen wollen, ersetzen Sie ``testfile.avi`` durch
``-dvd://N`` *``Ger?t``*. *``N``* ist die Nummer des St?cks, das Sie
abspielen wollen und *``Ger?t``* gibt den Ger?tenamen des DVD-ROMs an.
Das nachstehende Kommando spielt das dritte St?ck von ``/dev/dvd``:

.. code:: screen

    # mplayer -vo dga -dvd://3 /dev/dvd

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das standardm??ig verwendete DVD-Laufwerk kann beim Bau des
MPlayer-Ports mit der Option ``WITH_DVD_DEVICE`` festgelegt werden. Die
Voreinstellung verwendet das Ger?t ``/dev/acd0``. Genaueres finden Sie
im ``Makefile`` des Ports.

.. raw:: html

   </div>

Die Tastenkombinationen zum Abbrechen, Anhalten und Weiterf?hren der
Wiedergabe entnehmen Sie bitte der Ausgabe von ``mplayer -h`` oder der
Hilfeseite.

Weitere n?tzliche Optionen f?r die Wiedergabe sind ``-fs -zoom`` zur
Wiedergabe im Vollbild-Modus und ``-framedrop`` zur Steigerung der
Geschwindigkeit.

Damit die Kommandozeile von ``mplayer`` kurz bleibt, kann ein Benutzer
Vorgaben in der Datei ``.mplayer/config`` hinterlegen:

.. code:: programlisting

    vo=xv
    fs=yes
    zoom=yes

Schlie?lich kann ``mplayer`` noch DVD-St?cke in ``.vob``-Dateien rippen.
Das zweite St?ck einer DVD wandeln Sie wie folgt in eine Datei um:

.. code:: screen

    # mplayer -dumpstream -dumpfile out.vob -dvd://2 /dev/dvd

Die Ausgabedatei ``out.vob`` wird im MPEG-Format abgespeichert und kann
mit anderen Werkzeugen aus diesem Abschnitt bearbeitet werden.

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

8.4.2.1.3. mencoder
'''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie sollten die HTML-Dokumentation lesen, bevor Sie ``mencoder``
benutzen. Es gibt zwar eine Hilfeseite, die aber ohne die
HTML-Dokumentation nur eingeschr?kt n?tzlich ist. Es gibt viele
M?glichkeiten die Qualit?t zu verbessern, die Bitrate zu verringern und
Formate zu konvertieren. Einige davon haben erhebliche Auswirkungen auf
die Geschwindigkeit der Wiedergabe. Zum Start finden Sie im Folgenden
einige Kommandozeilen. Die erste kopiert einfach eine Datei:

.. code:: screen

    % mencoder input.avi -oac copy -ovc copy -o output.avi

Falsche Kombinationen von Kommandozeilenparametern ergeben eventuell
Dateien, die selbst ``mplayer`` nicht mehr abspielen kann. Wenn Sie in
eine Datei rippen, sollten Sie daher auf jeden Fall die Option
``-dumpfile`` von ``mplayer`` verwenden.

Die nachstehende Kommandozeile wandelt die Datei ``input.avi`` nach
MPEG4 mit MPEG3 f?r den Ton um (hierf?r wird der Ports
`audio/lame <http://www.freebsd.org/cgi/url.cgi?ports/audio/lame/pkg-descr>`__
ben?tigt):

.. code:: screen

    % mencoder input.avi -oac mp3lame -lameopts br=192 \
         -ovc lavc -lavcopts vcodec=mpeg4:vhq -o output.avi

Die Ausgabedatei l?sst sowohl mit ``mplayer`` als auch ``xine``
abspielen.

Wenn Sie ``input.avi`` durch ``-dvd://1 /dev/dvd`` ersetzen und das
Kommando unter ``root`` laufen lassen, k?nnen Sie ein DVD-St?ck direkt
konvertieren. Da Sie wahrscheinlich beim ersten Mal unzufrieden mit den
Ergebnissen sind, sollten Sie das St?ck zuerst in eine Datei schreiben
und anschlie?end die Datei weiterverarbeiten.

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

8.4.2.2. Der Video-Spieler xine
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Video-Spieler xine ist ein Projekt mit gro?em Umfang. Das Projekt
will nicht nur ein Programm f?r alle Video-Anwendungen bieten, sondern
auch eine wiederverwendbare Bibliothek und ein Programm, das durch
Plugins erweiterbar ist. Das Programm steht als fertiges Paket oder als
Port unter
`multimedia/xine <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xine/pkg-descr>`__
zur Verf?gung.

Der
`multimedia/xine <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xine/pkg-descr>`__-Spieler
hat noch ein paar Ecken und Kanten, macht aber insgesamt einen guten
Eindruck. F?r einen reibungslosen Betrieb ben?tigt xine entweder eine
schnelle CPU oder die XVideo-Erweiterung. Das GUI ist etwas
schwerf?llig.

Zurzeit gibt es kein xine-Modul, das CSS-kodierte DVDs abspielen kann
und sich in der FreeBSD Ports-Sammlung befindet.

xine ist benutzerfreundlicher als MPlayer, bietet allerdings nicht
soviele M?glichkeiten. Am schnellsten l?uft xine mit der
XVideo-Erweiterung.

In der Voreinstellung startet xine eine grafische Benutzeroberfl?che.
?ber Men?s k?nnen Sie Dateien ?ffnen:

.. code:: screen

    % xine

Alternativ k?nnen Sie das Programm auch ohne GUI aufrufen und Dateien
direkt abspielen:

.. code:: screen

    % xine -g -p mymovie.avi

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

8.4.2.3. Die transcode-Werkzeuge
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

transcode ist kein Spieler, sondern eine Sammlung von Werkzeugen zur
Umwandlung von Video- und Sounddateien. transcode mischt Video-Dateien
und kann kaputte Video-Dateien reparieren. Die Werkzeuge werden als
Filter verwendet, das hei?t die Ein- und Ausgaben verwenden
``stdin/stdout``.

Beim Bau von transcode ?ber den Port
`multimedia/transcode <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/transcode/pkg-descr>`__
k?nnen zwar zahreiche Optionen angegeben werden. Empfehlenswert ist es
aber, den Bau mit folgendem Befehl zu starten:

.. code:: screen

    # make WITH_OPTIMIZED_CFLAGS=yes WITH_LIBA52=yes WITH_LAME=yes WITH_OGG=yes \
    WITH_MJPEG=yes -DWITH_XVID=yes

Diese Einstellungen sollen f?r die meisten Anwender ausreichend sein.

Um die F?higkeiten von ``transcode`` zu illustrieren, wird im folgenden
Beispiel eine DivX-Datei in eine PAL MPEG-1-Datei konvertiert:

.. code:: screen

    % transcode -i input.avi -V --export_prof vcd-pal -o output_vcd
    % mplex -f 1 -o output_vcd.mpg output_vcd.m1v output_vcd.mpa

Die daraus resultierende MPEG-Datei, ``output_vcd.mpg``, kann
beispielsweise mit MPlayer abgespielt werden. Sie k?nnen sie sogar als
Video-CD auf eine CD-R brennen. Wenn Sie diese Funktion ben?tigen,
m?ssen Sie zus?tzlich die beiden Programme
`multimedia/vcdimager <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/vcdimager/pkg-descr>`__
und
`sysutils/cdrdao <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrdao/pkg-descr>`__
installieren.

Zwar gibt es eine Manualpage zu ``transcode``, Sie sollen aber auf jeden
Fall auch die Informationen und Beispiele im
`transcode-Wiki <http://www.transcoding.org/cgi-bin/transcode>`__ lesen.

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

8.4.3. Weiterf?hrende Quellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Video-Software f?r FreeBSD entwickelt sich sehr schnell. Es ist
wahrscheinlich, dass die hier angesprochenen Probleme bald gel?st sind.
Bis dahin m?ssen Anwender, die das meiste aus den Audio- und
Video-F?higkeiten von FreeBSD machen wollen, Informationen aus mehreren
FAQs und Tutorien zusammensuchen und verschiedene Anwendungen
nebeneinander betreiben. Dieser Abschnitt weist auf weitere
Informationsquellen hin.

Die `MPlayer-Dokumentation <http://www.mplayerhq.hu/DOCS/>`__ ist sehr
aufschlussreich. Die Dokumente sollten wahrscheinlich von jedem gelesen
werden, der hohe Fachkenntnisse ?ber Video auf UNIX? Systemen erlangen
will. Die MPlayer-Mailinglisten reagiert feindselig auf Personen, die es
nicht f?r n?tig halten, die Dokumentation zu lesen. Wenn Sie
Fehlerberichte an die Liste schicken wollen, lesen Sie bitte vorher die
ausgezeichnete Dokumentation (RTFM).

Das `xine
HOWTO <http://dvd.sourceforge.net/xine-howto/en_GB/html/howto.html>`__
enth?lt allgemein g?ltige Hinweise zur Verbesserung der
Wiedergabegeschwindigkeit.

Schlie?lich gibt es noch weitere vielversprechende Anwendungen, die Sie
vielleicht ausprobieren wollen:

.. raw:: html

   <div class="itemizedlist">

-  `Avifile <http://avifile.sourceforge.net/>`__ gibt es schon als Port
   `multimedia/avifile <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/avifile/pkg-descr>`__.

-  `Ogle <http://www.dtek.chalmers.se/groups/dvd/>`__ wurde ebenfalls
   schon portiert:
   `multimedia/ogle <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/ogle/pkg-descr>`__.

-  `Xtheater <http://xtheater.sourceforge.net/>`__.

-  `multimedia/dvdauthor <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/dvdauthor/pkg-descr>`__,
   ist ein Open-Source-Paket, mit dem Sie DVDs erstellen k?nnen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-----------------------------------+-------------------------------+
| `Zur?ck <sound-mp3.html>`__?   | `Nach oben <multimedia.html>`__   | ?\ `Weiter <tvcard.html>`__   |
+--------------------------------+-----------------------------------+-------------------------------+
| 8.3. MP3-Audio?                | `Zum Anfang <index.html>`__       | ?8.5. TV-Karten einrichten    |
+--------------------------------+-----------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
