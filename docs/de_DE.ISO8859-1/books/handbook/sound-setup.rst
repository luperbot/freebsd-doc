===========================
8.2. Soundkarten einrichten
===========================

.. raw:: html

   <div class="navheader">

8.2. Soundkarten einrichten
`Zur?ck <multimedia.html>`__?
Kapitel 8. Multimedia
?\ `Weiter <sound-mp3.html>`__

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

8.2. Soundkarten einrichten
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Von Moses Moore.

.. raw:: html

   </div>

.. raw:: html

   <div>

Aktualisiert von Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedikt K?hler und Uwe Pierau.

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

8.2.1. Den Soundtreiber einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zun?chst sollten Sie in Erfahrung bringen, welches Soundkartenmodell Sie
besitzen, welchen Chip die Karte benutzt und ob es sich um eine PCI-
oder ISA-Karte handelt. FreeBSD unterst?tzt eine Reihe von PCI- als auch
von ISA-Karten. Die
`Hardware-Notes <http://www.FreeBSD.org/releases/10.1R/hardware.html>`__
z?hlen alle unterst?tzten Karten und deren Treiber auf.

Um Ihre Soundkarte benutzen zu k?nnen, m?ssen Sie den richtigen
Ger?tetreiber laden. Sie haben zwei M?glichkeiten, den Treiber zu laden:
Am einfachsten ist es, das Modul mit
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
zu laden. Sie k?nnen dazu die Kommandozeile verwenden:

.. code:: screen

    # kldload snd_emu10k1

Alternativ k?nnen Sie auch einen Eintrag in der Datei
``/boot/loader.conf`` erstellen:

.. code:: programlisting

    snd_emu10k1_load="YES"

Beide Beispiele gelten f?r eine Creative SoundBlaster? Live! Soundkarte.
Weitere ladbare Soundmodule sind in der Datei
``/boot/defaults/loader.conf`` aufgef?hrt. Wenn Sie nicht sicher sind,
welchen Ger?tetreiber Sie laden m?ssen, laden Sie den Treiber
``snd_driver``:

.. code:: screen

    # kldload snd_driver

Der Treiber ``snd_driver`` ist ein Meta-Treiber, der alle gebr?uchlichen
Treiber l?dt und die Suche nach dem richtigen Treiber vereinfacht.
Weiterhin k?nnen alle Treiber ?ber ``/boot/loader.conf`` geladen werden.

Wollen Sie feststellen, welcher Treiber f?r Ihre Soundkarte vom
Metatreiber ``snd_driver`` geladen wurde, sollten Sie sich mit
``cat /dev/sndstat`` den Inhalt der Datei ``/dev/sndstat`` ansehen.

Alternativ k?nnen Sie die Unterst?tzung f?r die Soundkarte direkt in den
Kernel einkompilieren. Diese Methode im n?chsten Abschnitt beschrieben.
Weiteres ?ber den Bau eines Kernels erfahren Sie im Kapitel
`Kernelkonfiguration <kernelconfig.html>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.2.1.1. Soundkarten in der Kernelkonfiguration einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zuerst m?ssen Sie
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4>`__,
den Treiber f?r das Audio-Framework in die Kernelkonfiguration
aufnehmen. F?gen Sie dazu die folgende Zeile in die
Kernelkonfigurationsdatei ein:

.. code:: programlisting

    device sound

Als N?chstes m?ssen Sie den richtigen Treiber in die Kernelkonfiguration
einf?gen. Den Treiber entnehmen Sie bitte der Liste der unterst?tzen
Soundkarten aus den
`Hardware-Notes <http://www.FreeBSD.org/releases/10.1R/hardware.html>`__.
Zum Beispiel wird die Creative SoundBlaster? Live! Soundkarte vom
Treiber
`snd\_emu10k1(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_emu10k1&sektion=4>`__
unterst?tzt. F?r diese Karte verwenden Sie die nachstehende Zeile:

.. code:: programlisting

    device snd_emu10k1

Die richtige Syntax f?r die Zeile lesen Sie bitte in der Hilfeseite des
entsprechenden Treibers nach. Die korrekte Syntax f?r alle unterst?tzten
Treiber finden Sie au?erdem in der Datei ``/usr/src/sys/conf/NOTES``.

Nicht PnP-f?hige ISA-Soundkarten ben?tigen (wie alle anderen ISA-Karten
auch) weiterhin Angaben zu den Karteneinstellungen (wie IRQ und
I/O-Port). Die Karteneinstellungen tragen Sie in die Datei
``/boot/device.hints`` ein. W?hrend des Systemstarts liest der
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
diese Datei und reicht die Einstellungen an den Kernel weiter. F?r eine
alte Creative SoundBlaster? 16 ISA-Karte, die sowohl den
`snd\_sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_sbc&sektion=4>`__-
als auch den ``snd_sb16``-Treiber ben?tigt, f?gen Sie folgende Zeilen in
die Kernelkonfigurationsdatei ein:

.. code:: programlisting

    device snd_sbc
    device snd_sb16

In die Datei ``/boot/device.hints`` tragen Sie f?r diese Karte
zus?tzlich die folgenden Einstellungen ein:

.. code:: programlisting

    hint.sbc.0.at="isa"
    hint.sbc.0.port="0x220"
    hint.sbc.0.irq="5"
    hint.sbc.0.drq="1"
    hint.sbc.0.flags="0x15"

In diesem Beispiel benutzt die Karte den I/O-Port ``0x220`` und den IRQ
``5``.

Die Manualpage
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4>`__
sowie des jeweiligen Treibers beschreiben die Syntax der Eintr?ge in der
Datei ``/boot/device.hints``.

Das Beispiel verwendet die vorgegebenen Werte. Falls Ihre
Karteneinstellungen andere Werte vorgeben, m?ssen Sie die Werte in der
Kernelkonfiguration anpassen. Weitere Informationen zu dieser Soundkarte
entnehmen Sie bitte der Manualpage
`snd\_sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_sbc&sektion=4>`__.

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

8.2.2. Die Soundkarte testen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie den neuen Kernel gestartet oder das erforderliche Modul
geladen haben, sollte Ihre Soundkarte in den Systemmeldungen
(`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__)
auftauchen. Zum Beispiel:

.. code:: screen

    pcm0: <Intel ICH3 (82801CA)> port 0xdc80-0xdcbf,0xd800-0xd8ff irq 5 at device 31.5 on pci0
    pcm0: [GIANT-LOCKED]
    pcm0: <Cirrus Logic CS4205 AC97 Codec>

Den Status der Karte k?nnen Sie ?ber die Datei ``/dev/sndstat`` pr?fen:

.. code:: screen

    # cat /dev/sndstat
    FreeBSD Audio Driver (newpcm)
    Installed devices:
    pcm0: <Intel ICH3 (82801CA)> at io 0xd800, 0xdc80 irq 5 bufsz
    16384
    kld snd_ich (1p/2r/0v channels duplex default)

Die Ausgaben k?nnen auf Ihrem System anders aussehen. Wenn das Ger?t
``pcm`` nicht erscheint, pr?fen Sie bitte Ihre Konfiguration. Stellen
sie sicher, dass Sie den richtigen Treiber gew?hlt haben.
`Abschnitt?8.2.2.1, „H?ufige
Probleme“ <sound-setup.html#troubleshooting>`__ beschreibt h?ufig
auftretende Probleme.

Wenn alles glatt lief, haben Sie nun eine funktionierende Soundkarte.
Wenn ein CD-ROM oder DVD-ROM-Laufwerk an Ihrer Soundkarte angeschlossen
ist, k?nnen Sie jetzt mit
`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1>`__
eine CD abspielen:

.. code:: screen

    % cdcontrol -f /dev/acd0 play 1

Es gibt viele Anwendungen, wie
`audio/workman <http://www.freebsd.org/cgi/url.cgi?ports/audio/workman/pkg-descr>`__,
die eine bessere Benutzerschnittstelle besitzen. Um sich
MP3-Audiodateien anzuh?ren, k?nnen Sie eine Anwendung wie
`audio/mpg123 <http://www.freebsd.org/cgi/url.cgi?ports/audio/mpg123/pkg-descr>`__
installieren.

Eine weitere schnelle M?glichkeit die Karte zu pr?fen, ist es, Daten an
das Ger?t ``/dev/dsp`` zu senden:

.. code:: screen

    % cat Datei > /dev/dsp

F?r ``Datei`` k?nnen Sie eine beliebige Datei verwenden. Wenn Sie einige
Ger?usche h?ren, funktioniert die Soundkarte.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Ger?tedateien ``/dev/dsp*`` werden automatisch erzeugt, wenn sie das
erste Mal ben?tigt werden. Werden sie nicht verwendet, sind sie hingegen
nicht vorhanden und tauchen daher auch nicht in der Ausgabe von
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ auf.

.. raw:: html

   </div>

Die Einstellungen des Mixers k?nnen Sie mit dem Kommando
`mixer(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mixer&sektion=8>`__
ver?ndern. Weiteres lesen Sie bitte in der Hilfeseite
`mixer(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mixer&sektion=8>`__
nach.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.2.2.1. H?ufige Probleme
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Fehler                                     | L?sung                                                                                                                                                                            |
+============================================+===================================================================================================================================================================================+
| sb\_dspwr(XX) timed out                    | Der I/O Port ist nicht korrekt angegeben.                                                                                                                                         |
+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| bad irq XX                                 | Der IRQ ist falsch angegeben. Stellen Sie sicher, dass der angegebene IRQ mit dem Sound IRQ ?bereinstimmt.                                                                        |
+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| xxx: gus pcm not attached, out of memory   | Es ist nicht genug Speicher verf?gbar, um das Ger?t zu betreiben.                                                                                                                 |
+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| xxx: can't open /dev/dsp!                  | ?berpr?fen Sie mit ``fstat |                 grep dsp`` ob eine andere Anwendung das Ger?t ge?ffnet hat. H?ufige St?renfriede sind esound oder die Sound-Unterst?tzung von KDE.   |
+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Ein weiterer Fall ist der, dass moderne Graphikkarten oft auch ihre
eigenen Soundtreiber mit sich f?hren, um HDMI oder ?hnliches zu
verwenden. Diese Audioger?te werden manchmal vor der eigentlichen,
separaten Soundkarte aufgef?hrt und dadurch nicht als das Standardger?t
zum Abspielen von T?nen benutzt. Um zu pr?fen, ob das bei Ihnen der Fall
ist, f?hren Sie dmesg aus und suchen Sie nach der Zeichenfolge ``pcm``.
Die Ausgabe sieht in etwa so aus wie folgt:

.. code:: programlisting

    ...
    hdac0: HDA Driver Revision: 20100226_0142
    hdac1: HDA Driver Revision: 20100226_0142
    hdac0: HDA Codec #0: NVidia (Unknown)
    hdac0: HDA Codec #1: NVidia (Unknown)
    hdac0: HDA Codec #2: NVidia (Unknown)
    hdac0: HDA Codec #3: NVidia (Unknown)
    pcm0: <HDA NVidia (Unknown) PCM #0 DisplayPort> at cad 0 nid 1 on hdac0
    pcm1: <HDA NVidia (Unknown) PCM #0 DisplayPort> at cad 1 nid 1 on hdac0
    pcm2: <HDA NVidia (Unknown) PCM #0 DisplayPort> at cad 2 nid 1 on hdac0
    pcm3: <HDA NVidia (Unknown) PCM #0 DisplayPort> at cad 3 nid 1 on hdac0
    hdac1: HDA Codec #2: Realtek ALC889
    pcm4: <HDA Realtek ALC889 PCM #0 Analog> at cad 2 nid 1 on hdac1
    pcm5: <HDA Realtek ALC889 PCM #1 Analog> at cad 2 nid 1 on hdac1
    pcm6: <HDA Realtek ALC889 PCM #2 Digital> at cad 2 nid 1 on hdac1
    pcm7: <HDA Realtek ALC889 PCM #3 Digital> at cad 2 nid 1 on hdac1
    ...

Hier wurde die Graphikkarte (``NVidia``) vor der Soundkarte
(``Realtek ALC889``) aufgef?hrt. Um die Soundkarte als
Standardabspielger?t einzusetzen, ?ndern Sie ``hw.snd.default_unit`` auf
die Einheit, welche f?r das Abspielen benutzt werden soll, wie folgt:

.. code:: screen

    # sysctl hw.snd.default_unit=n

Hier repr?sentiert ``n`` die Nummer der Soundkarte, die verwendet werden
soll, in diesem Beispiel also ``4``. Sie k?nnen diese ?nderung dauerhaft
machen, indem Sie die folgende Zeile zu der ``/etc/sysctl.conf`` Datei
hinzuf?gen:

.. code:: programlisting

    hw.snd.default_unit=4

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

8.2.3. Mehrere Tonquellen abspielen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Munish Chopra.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Oft sollen mehrere Tonquellen gleichzeitig abgespielt werden, auch wenn
beispielsweise esound oder artsd das Audioger?t nicht mit einer anderen
Anwendung teilen k?nnen.

Unter FreeBSD k?nnen mit
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
*virtuelle Tonkan?le* eingerichtet werden. Virtuelle Kan?le mischen die
Tonquellen im Kernel (so k?nnen mehr Kan?le als von der Hardware
unterst?tzt benutzt werden).

Die Anzahl der virtuellen Kan?le k?nnen Sie als Benutzer ``root`` wie
folgt einstellen:

.. code:: screen

    # sysctl dev.pcm.0.play.vchans=4
    # sysctl dev.pcm.0.rec.vchans=4
    # sysctl hw.snd.maxautovchans=4

Im Beispiel werden vier virtuelle Kan?le eingerichtet, eine im
Normalfall ausreichende Anzahl. Sowohl ``dev.pcm.0.play.vchans=4`` und
``dev.pcm.0.rec.vchans=4`` sind die Anzahl der virtuellen Kan?le des
Ger?ts ``pcm0``, die f?rs Abspielen und Aufnehmen verwendet werden und
sie k?nnen konfiguriert werden, sobald das Ger?t existiert.
``hw.snd.maxautovchans`` ist die Anzahl der virtuellen Kan?le, die einem
Ger?t zugewiesen werden, wenn es durch
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
eingerichtet wird. Da das Modul ``pcm`` unabh?ngig von den
Hardware-Treibern geladen werden kann, gibt ``hw.snd.maxautovchans`` die
Anzahl der virtuellen Kan?le an, die sp?ter eingerichtete Ger?te
erhalten. Lesen Sie dazu
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4>`__ f?r
weitere Informationen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie k?nnen die Anzahl der virtuellen Kan?le nur ?ndern, wenn das Ger?t
nicht genutzt wird. Schlie?en Sie daher zuerst alle Programme (etwa
Musikabspielprogramme oder Sound-Daemonen), die auf dieses Ger?t
zugreifen.

.. raw:: html

   </div>

Die korrekte ``pcm``-Ger?tedatei wird automatisch zugeteilt, wenn ein
Programm das Ger?t ``/dev/dsp0`` anfordert.

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

8.2.4. Den Mixer einstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Josef El-Rayes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Voreinstellungen des Mixers sind im Treiber
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4>`__ fest
kodiert. Es gibt zwar viele Anwendungen und Dienste, die den Mixer
einstellen k?nnen und die eingestellten Werte bei jedem Start wieder
setzen, am einfachsten ist es allerdings, die Standardwerte f?r den
Mixer direkt im Treiber einzustellen. Der Mixer kann in der Datei
``/boot/device.hints`` eingestellt werden:

.. code:: programlisting

    hint.pcm.0.vol="50"

Die Zeile setzt die Lautst?rke des Mixers beim Laden des Moduls
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4>`__ auf
den Wert ``50``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-----------------------------------+----------------------------------+
| `Zur?ck <multimedia.html>`__?   | `Nach oben <multimedia.html>`__   | ?\ `Weiter <sound-mp3.html>`__   |
+---------------------------------+-----------------------------------+----------------------------------+
| Kapitel 8. Multimedia?          | `Zum Anfang <index.html>`__       | ?8.3. MP3-Audio                  |
+---------------------------------+-----------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
