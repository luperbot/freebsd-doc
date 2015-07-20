=====================
Kapitel 8. Multimedia
=====================

.. raw:: html

   <div class="navheader">

Kapitel 8. Multimedia
`Zur?ck <desktop-summary.html>`__?
Teil?II.?Oft benutzte Funktionen
?\ `Weiter <sound-setup.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Kapitel 8. Multimedia
---------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?berarbeitet von Ross Lippert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`8.1. ?bersicht <multimedia.html#multimedia-synopsis>`__
`8.2. Soundkarten einrichten <sound-setup.html>`__
`8.3. MP3-Audio <sound-mp3.html>`__
`8.4. Videos wiedergeben <video-playback.html>`__
`8.5. TV-Karten einrichten <tvcard.html>`__
`8.6. MythTV <mythtv.html>`__
`8.7. Scanner <scanners.html>`__

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

8.1. ?bersicht
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD unterst?tzt viele unterschiedliche Soundkarten, die Ihnen den
Genuss von Highfidelity-Kl?ngen auf Ihrem Computer erm?glichen. Dazu
geh?rt unter anderem die M?glichkeit, Tonquellen in den Formaten MPEG
Audio Layer 3 (MP3), WAV, Ogg Vorbis und vielen weiteren Formaten
aufzunehmen und wiederzugeben. Dar?ber hinaus enth?lt die FreeBSD
Ports-Sammlung Anwendungen, die Ihnen das Bearbeiten Ihrer aufgenommenen
Tonspuren, das Hinzuf?gen von Klangeffekten und die Kontrolle der
angeschlossenen MIDI-Ger?te erlauben.

Wenn Sie etwas Zeit investieren, k?nnen Sie mit FreeBSD auch Videos und
DVDs abspielen. Im Vergleich zu Audio-Anwendungen gibt es weniger
Anwendungen zum Kodieren, Konvertieren und Abspielen von Video-Formaten.
Es gab, als dieses Kapitel geschrieben wurde, keine Anwendung, die
einzelne Video-Formate ?hnlich wie
`audio/sox <http://www.freebsd.org/cgi/url.cgi?ports/audio/sox/pkg-descr>`__
konvertieren konnte. Allerdings ?ndert sich die Software in diesem
Umfeld sehr schnell.

In diesem Kapitel wird das Einrichten von Soundkarten besprochen.
`Kapitel?6, *Das X-Window-System* <x11.html>`__ beschreibt die
Installation und Konfiguration von X11 und das Einrichten von
Videokarten. Hinweise zur Verbesserung der Wiedergabe finden sich in
diesem Kapitel.

Dieses Kapitel behandelt die folgenden Punkte:

.. raw:: html

   <div class="itemizedlist">

-  Die Konfiguration des Systems damit Ihre Soundkarte erkannt wird.

-  Wie Sie die Funktion einer Soundkarte testen k?nnen.

-  Wie Sie Fehler in den Einstellungen von Soundkarten finden.

-  Wie Sie MP3s und andere Audio-Formate wiedergeben und erzeugen.

-  Die Video-Unterst?tzung des X-Servers.

-  Gute Anwendungen, die Videos abspielen und kodieren.

-  Die Wiedergabe von DVDs, ``.mpg``- und ``.avi``-Dateien.

-  Wie Sie CDs und DVDs in Dateien rippen.

-  Die Konfiguration von TV-Karten.

-  Das Einrichten von Scannern.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  Wissen, wie Sie einen neuen Kernel konfigurieren und installieren
   (`Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Der Versuch eine Audio-CD mit
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
einzuh?ngen erzeugt mindestens einen Fehler; schlimmstenfalls kann es zu
einer Kernel-Panic kommen. Die Medien besitzen eine andere Kodierung als
normale ISO-Dateisysteme.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------------+------------------------------------+
| `Zur?ck <desktop-summary.html>`__?   | `Nach oben <common-tasks.html>`__   | ?\ `Weiter <sound-setup.html>`__   |
+--------------------------------------+-------------------------------------+------------------------------------+
| 7.6. Zusammenfassung?                | `Zum Anfang <index.html>`__         | ?8.2. Soundkarten einrichten       |
+--------------------------------------+-------------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
