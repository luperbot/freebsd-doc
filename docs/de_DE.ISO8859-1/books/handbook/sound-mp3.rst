==============
8.3. MP3-Audio
==============

.. raw:: html

   <div class="navheader">

8.3. MP3-Audio
`Zur?ck <sound-setup.html>`__?
Kapitel 8. Multimedia
?\ `Weiter <video-playback.html>`__

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

8.3. MP3-Audio
--------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Ein Beitrag von Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedikt K?hler.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MP3 (MPEG Layer 3 Audio) erm?glicht eine Klangwiedergabe in CD-?hnlicher
Qualit?t, was Sie sich auf Ihrem FreeBSD-Rechner nicht entgehen lassen
sollten.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.3.1. MP3-Player
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

XMMS (X Multimedia System) ist bei weitem der beliebteste MP3-Player f?r
X11. WinAmp-Skins k?nnen auch mit XMMS genutzt werden, da die
Benutzerschnittstelle fast identisch mit der von Nullsofts WinAmp ist.
Daneben unterst?tzt XMMS auch eigene Plugins.

XMMS kann als
`multimedia/xmms <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xmms/pkg-descr>`__
Port oder Package installiert werden.

Die Benutzerschnittstelle von XMMS ist leicht zu erlernen und enth?lt
eine Playlist, einen graphischen Equalizer und vieles mehr. Diejenigen,
die mit WinAmp vertraut sind, werden XMMS sehr leicht zu benutzen
finden.

Der Port
`audio/mpg123 <http://www.freebsd.org/cgi/url.cgi?ports/audio/mpg123/pkg-descr>`__
ist ein alternativer, kommandozeilenorientierter MP3-Player.

mpg123 kann ausgef?hrt werden, indem man das zu benutzende Sound Device
und die abzuspielende MP3-Datei auf der Kommandozeile angibt. Wenn ihr
Sound Device beispielsweise ``/dev/dsp1.0`` lautet und Sie die MP3-Datei
*``Foobar-GreatestHits.mp3``* h?ren wollen, geben Sie Folgendes ein:

.. code:: screen

    # mpg123 -a /dev/dsp1.0 Foobar-GreatestHits.mp3
    High Performance MPEG 1.0/2.0/2.5 Audio Player for Layer 1, 2 and 3.
    Version 0.59r (1999/Jun/15).  Written and copyrights by Michael Hipp.
    Uses code from various people.  See 'README' for more!
    THIS SOFTWARE COMES WITH ABSOLUTELY NO WARRANTY! USE AT YOUR OWN RISK!





    Playing MPEG stream from Foobar-GreatestHits.mp3 ...
    MPEG 1.0 layer III, 128 kbit/s, 44100 Hz joint-stereo

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

8.3.2. CD-Audio Tracks rippen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor man eine ganze CD oder einen CD-Track in das MP3-Format umwandeln
kann, m?ssen die Audiodaten von der CD auf die Festplatte gerippt
werden. Dabei werden die CDDA (CD Digital Audio) Rohdaten in WAV-Dateien
kopiert.

Die Anwendung ``cdda2wav`` die im
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
Paket enthalten ist, kann zum Rippen der Audiodaten und anderen
Informationen von CDs genutzt werden.

Wenn die Audio CD in dem Laufwerk liegt, k?nnen Sie mit folgendem Befehl
(als ``root``) eine ganze CD in einzelne WAV-Dateien (eine Datei f?r
jeden Track) rippen:

.. code:: screen

    # cdda2wav -D 0,1,0 -B

cdda2wav unterst?tzt auch ATAPI (IDE) CD-ROM-Laufwerke. Um von einem
IDE-Laufwerk zu rippen, ?bergeben Sie auf der Kommandozeile statt der
SCSI-IDs den Ger?tenamen. Das folgende Kommando rippt den 7.?Track:

.. code:: screen

    # cdda2wav -D /dev/acd0 -t 7

Der Schalter ``-D       0,1,0`` bezieht sich auf das SCSI Device
``0,1,0``, das sich aus dem Ergebnis des Befehls ``cdrecord -scanbus``
ergibt.

Um einzelne Tracks zu rippen, benutzen Sie den ``-t`` Schalter wie
folgt:

.. code:: screen

    # cdda2wav -D 0,1,0 -t 7

Dieses Beispiel rippt den siebten Track der Audio CD-ROM. Um mehrere
Tracks zu rippen, zum Beispiel die Tracks eins bis sieben, k?nnen Sie
wie folgt einen Bereich angeben:

.. code:: screen

    # cdda2wav -D 0,1,0 -t 1+7

Mit `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
k?nnen Sie ebenfalls Audio-St?cke von ATAPI-Laufwerken kopieren. Dies
wird in `Abschnitt?19.6.5, „Kopieren von
Audio-CDs“ <creating-cds.html#duplicating-audiocds>`__ erl?utert.

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

8.3.3. MP3-Dateien kodieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Gegenw?rtig ist Lame der meistbenutzte MP3-Encoder. Lame finden Sie
unter
`audio/lame <http://www.freebsd.org/cgi/url.cgi?ports/audio/lame/pkg-descr>`__
im Ports-Verzeichnis.

Benutzen Sie die WAV-Dateien, die sie von CD gerippt haben, und wandeln
sie mit dem folgenden Befehl die Datei ``audio01.wav`` in
``audio01.mp3`` um:

.. code:: screen

    # lame -h -b 128 \
    --tt "Foo Liedtitel" \
    --ta "FooBar K?nstler" \
    --tl "FooBar Album" \
    --ty "2001" \
    --tc "Geripped und kodiert von Foo" \
    --tg "Musikrichtung" \
    audio01.wav audio01.mp3

128?kbits ist die gew?hnliche MP3-Bitrate. Viele bevorzugen mit 160 oder
192?kbits eine h?here Qualit?t. Je h?her die Bitrate ist, desto mehr
Speicherplatz ben?tigt die resultierende MP3-Datei, allerdings wird die
Qualit?t dadurch auch besser. Der Schalter ``-h`` verwendet den „higher
quality but a little slower“ (h?here Qualit?t, aber etwas langsamer)
Modus. Die Schalter, die mit ``--t`` beginnen, sind ID3-Tags, die in der
Regel Informationen ?ber das Lied enthalten und in die MP3-Datei
eingebettet sind. Weitere Optionen k?nnen in der Manualpage von Lame
nachgelesen werden.

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

8.3.4. MP3-Dateien dekodieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um aus MP3-Dateien eine Audio CD zu erstellen, m?ssen diese in ein nicht
komprimiertes WAV-Format umgewandelt werden. Sowohl XMMS als auch mpg123
unterst?tzen die Ausgabe der MP3-Dateien in unkomprimierte Dateiformate.

Dekodieren mit XMMS:

.. raw:: html

   <div class="procedure">

#. Starten Sie XMMS.

#. Klicken Sie mit der rechten Maustaste, um das XMMS-Menu zu ?ffnen.

#. W?hlen Sie ``Preference`` im Untermen? ``Options``.

#. ?ndern Sie das Output-Plugin in „Disk Writer Plugin“.

#. Dr?cken Sie ``Configure``.

#. Geben Sie ein Verzeichnis ein (oder w?hlen Sie browse), in das Sie
   die unkomprimierte Datei schreiben wollen.

#. Laden Sie die MP3-Datei wie gewohnt in XMMS mit einer Lautst?rke von
   100% und einem abgeschalteten EQ.

#. Dr?cken Sie ``Play`` und es wird so aussehen, als spiele XMMS die
   MP3-Datei ab, aber keine Musik ist zu h?ren. Der Player ?berspielt
   die MP3-Datei in eine Datei.

#. Vergessen Sie nicht, das Output-Plugin wieder in den Ausgangszustand
   zur?ckzusetzen um wieder MP3-Dateien anh?ren zu k?nnen.

.. raw:: html

   </div>

Mit mpg123 nach stdout schreiben:

.. raw:: html

   <div class="procedure">

-  Geben Sie ``mpg123 -s         audio01.mp3 >         audio01.pcm``
   ein.

.. raw:: html

   </div>

XMMS schreibt die Datei im WAV-Format aus w?hrend mpg123 die MP3-Datei
in rohe PCM-Audiodaten umwandelt. cdrecord kann mit beiden Formaten
Audio-CDs erstellen,
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8>`__
kann nur rohe PCM-Audiodaten verarbeiten. Der Dateikopf von WAV-Dateien
erzeugt am Anfang des St?cks ein Knacken. Sie k?nnen den Dateikopf mit
dem Werkzeug SoX, das sich als Paket oder aus dem Port
`audio/sox <http://www.freebsd.org/cgi/url.cgi?ports/audio/sox/pkg-descr>`__
installieren l?sst, entfernen:

.. code:: screen

    % sox -t wav -r 44100 -s -w -c 2 track.wav track.raw

Lesen Sie `Abschnitt?19.6, „CDs benutzen“ <creating-cds.html>`__ in
diesem Handbuch, um mehr Informationen zur Benutzung von CD-Brennern mit
FreeBSD zu erhalten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-----------------------------------+---------------------------------------+
| `Zur?ck <sound-setup.html>`__?   | `Nach oben <multimedia.html>`__   | ?\ `Weiter <video-playback.html>`__   |
+----------------------------------+-----------------------------------+---------------------------------------+
| 8.2. Soundkarten einrichten?     | `Zum Anfang <index.html>`__       | ?8.4. Videos wiedergeben              |
+----------------------------------+-----------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
