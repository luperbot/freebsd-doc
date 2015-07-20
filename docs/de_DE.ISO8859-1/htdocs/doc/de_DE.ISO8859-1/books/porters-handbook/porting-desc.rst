=======================================
3.2. Die Beschreibungsdateien erstellen
=======================================

.. raw:: html

   <div class="navheader">

3.2. Die Beschreibungsdateien erstellen
`Zur?ck <quick-porting.html>`__?
Kapitel 3. Einen neuen Port erstellen
?\ `Weiter <porting-checksum.html>`__

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

3.2. Die Beschreibungsdateien erstellen
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei Beschreibungsdateien, die f?r jeden Port ben?tigt werden,
ob sie tats?chlich im Paket enthalten sind oder nicht. Dies sind
``pkg-descr`` und ``pkg-plist``. Der ``pkg-`` Pr?fix unterscheidet sie
von anderen Dateien.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1. ``pkg-descr``
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese enth?lt eine l?ngere Beschreibung des Ports. Einer oder mehrere
Abs?tze, die kurz und pr?gnant erkl?ren, was der Port macht, sind
ausreichend.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

``pkg-descr`` enth?lt *keine* Anleitung oder detaillierte Beschreibung
wie der Port benutzt oder kompiliert wird! *Bitte seien Sie vorsichtig,
wenn Sie aus dem ``README`` oder der Manualpage kopieren* ; Diese sind
oft keine pr?gnanten Beschreibungen des Ports oder sie sind in einem
ung?nstigen Format (Manualpages haben z.B. b?ndige Zwischenr?ume). Wenn
es f?r die portierte Software eine offizielle Webseite gibt, sollten Sie
diese hier angeben. F?gen Sie hierzu *eine* der Webseiten mit dem Pr?fix
``WWW:`` ein, damit automatische Werkzeuge korrekt arbeiten.

.. raw:: html

   </div>

Das folgende Beispiel zeigt wie Ihre ``pkg-descr`` aussehen sollte:

.. code:: programlisting

    This is a port of oneko, in which a cat chases a poor mouse all over
    the screen.
     :
    (etc.)

    WWW: http://www.oneko.org/

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

3.2.2. ``pkg-plist``
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Datei enth?lt eine Liste aller Dateien, die von diesem Port
installiert werden. Sie wird auch die „Packliste“ genannt, da das Paket
durch die hier aufgef?hrten Dateien erstellt wird. Die Pfadangaben sind
relativ zum Installationspr?fix (f?r gew?hnlich ``/usr/local`` oder
``/usr/X11R6``). Wenn Sie die ``MANn``-Variablen verwenden (was Sie auch
machen sollten), f?hren Sie hier keine Manualpages auf. Wenn der Port
w?hrend der Installation Verzeichnisse erstellt, stellen Sie sicher
entsprechende ``@dirrm``-Zeilen einzuf?gen, um die Verzeichnisse zu
entfernen, wenn das Paket gel?scht wird.

Hier ist ein kleines Beispiel:

.. code:: programlisting

    bin/oneko
    lib/X11/app-defaults/Oneko
    lib/X11/oneko/cat1.xpm
    lib/X11/oneko/cat2.xpm
    lib/X11/oneko/mouse.xpm
    @dirrm lib/X11/oneko

F?r weitere Details zur Packliste lesen Sie in der
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1>`__
Manualpage nach.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es wird empfohlen alle Dateinamen in dieser Datei alphabetisch sortiert
zu halten. Das erlaubt Ihnen die ?nderungen bei einem Upgrade Ihres
Ports deutlich einfacher zu ?berpr?fen.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Eine Packlist von Hand zu erzeugen kann eine sehr m?hsame Aufgabe sein.
Wenn der Port eine gro?e Anzahl Dateien installiert, kann es Zeit
sparen, `eine Packliste automatisch zu
erstellen <plist-autoplist.html>`__.

.. raw:: html

   </div>

Es gibt nur einen Fall, in dem ``pkg-plist`` weggelassen werden kann.
Wenn der Port nur eine handvoll Dateien und Verzeichnisse installiert,
k?nnen diese in den Variablen ``PLIST_FILES`` und ``PLIST_DIRS`` im
``Makefile`` aufgelistet werden. Zum Beispiel k?nnten wir im obigen
Beispiel ohne ``pkg-plist`` f?r den ``oneko``-Port auskommen, indem wir
die folgenden Zeilen ins ``Makefile`` einf?gen:

.. code:: programlisting

    PLIST_FILES=    bin/oneko \
                    lib/X11/app-defaults/Oneko \
                    lib/X11/oneko/cat1.xpm \
                    lib/X11/oneko/cat2.xpm \
                    lib/X11/oneko/mouse.xpm
    PLIST_DIRS=     lib/X11/oneko

Nat?rlich sollte ``PLIST_DIRS`` ungesetzt bleiben, wenn der Port keine
eigenen Verzeichnisse installiert.

Der Preis f?r diese Art die Dateien eines Ports anzugeben ist, dass man
keine Befehlsfolgen wie in
`pkg\_create(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_create&sektion=1>`__
nutzen kann. Deshalb ist es nur f?r einfache Ports geeignet und macht
diese noch einfacher. Gleichzeitig bringt es den Vorteil die Anzahl der
Dateien in der Ports-Sammlung zu reduzieren. Deshalb ziehen Sie bitte
diese Vorgehensweise in Erw?gung, bevor Sie ``pkg-plist`` benutzen.

Sp?ter werden wir uns ansehen, wie ``pkg-plist`` und ``PLIST_FILES``
benutzt werden k?nnen, um `anspruchsvollere Aufgaben <plist.html>`__ zu
erf?llen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+--------------------------------------+-----------------------------------------+
| `Zur?ck <quick-porting.html>`__?         | `Nach oben <quick-porting.html>`__   | ?\ `Weiter <porting-checksum.html>`__   |
+------------------------------------------+--------------------------------------+-----------------------------------------+
| Kapitel 3. Einen neuen Port erstellen?   | `Zum Anfang <index.html>`__          | ?3.3. Die Checksummendatei erzeugen     |
+------------------------------------------+--------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
