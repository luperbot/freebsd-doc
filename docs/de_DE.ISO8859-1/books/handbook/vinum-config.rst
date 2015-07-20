=========================
23.8. Vinum konfigurieren
=========================

.. raw:: html

   <div class="navheader">

23.8. Vinum konfigurieren
`Zur?ck <vinum-object-naming.html>`__?
Kapitel 23. Der Vinum Volume Manager
?\ `Weiter <vinum-root.html>`__

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

23.8. Vinum konfigurieren
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der ``GENERIC``-Kernel enth?t kein Vinum. Es ist zwar m?glich, einen
speziellen Kernel zu bauen, der Vinum beinhaltet, empfohlen wird aber,
Vinum als ein Kernelmodul (?ber kld) zu laden. Dazu m?ssen Sie nicht
einmal
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
benutzen, da beim Start von
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
automatisch ?berpr?ft wird, ob das Modul bereits geladen wurde. Falls
das Modul noch nicht geladen wurde, wird es daraufhin geladen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.8.1. Inbetriebnahme
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vinum speichert seine Konfigurationsinformationen auf den Platten-Slices
im Wesentlichen genauso ab wie in den Konfigurationsdateien. Beim Lesen
der Konfigurationsdatenbank erkennt Vinum eine Anzahl von
Schl?sselw?rtern, die in den Konfigurationsdateien nicht erlaubt sind.
Zum Beispiel k?nnte eine Platten-Konfiguration den folgenden Text
enthalten:

.. code:: programlisting

    volume myvol state up
    volume bigraid state down
    plex name myvol.p0 state up org concat vol myvol
    plex name myvol.p1 state up org concat vol myvol
    plex name myvol.p2 state init org striped 512b vol myvol
    plex name bigraid.p0 state initializing org raid5 512b vol bigraid
    sd name myvol.p0.s0 drive a plex myvol.p0 state up len 1048576b driveoffset 265b plexoffset 0b
    sd name myvol.p0.s1 drive b plex myvol.p0 state up len 1048576b driveoffset 265b plexoffset 1048576b
    sd name myvol.p1.s0 drive c plex myvol.p1 state up len 1048576b driveoffset 265b plexoffset 0b
    sd name myvol.p1.s1 drive d plex myvol.p1 state up len 1048576b driveoffset 265b plexoffset 1048576b
    sd name myvol.p2.s0 drive a plex myvol.p2 state init len 524288b driveoffset 1048841b plexoffset 0b
    sd name myvol.p2.s1 drive b plex myvol.p2 state init len 524288b driveoffset 1048841b plexoffset 524288b
    sd name myvol.p2.s2 drive c plex myvol.p2 state init len 524288b driveoffset 1048841b plexoffset 1048576b
    sd name myvol.p2.s3 drive d plex myvol.p2 state init len 524288b driveoffset 1048841b plexoffset 1572864b
    sd name bigraid.p0.s0 drive a plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 0b
    sd name bigraid.p0.s1 drive b plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 4194304b
    sd name bigraid.p0.s2 drive c plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 8388608b
    sd name bigraid.p0.s3 drive d plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 12582912b
    sd name bigraid.p0.s4 drive e plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 16777216b

Die offensichtlichen Unterschiede sind hier die Anwesenheit von
Informationen ?ber explizite Speicherorte und Benennungen (beides ist
zwar erlaubt, aber es wird dem Benutzer davon abgeraten, es zu benutzen)
und Informationen ?ber die Zust?nde (welche f?r den Benutzer nicht zur
Verf?gung stehen). Vinum speichert keine Informationen ?ber Platten in
den Konfigurationsinformationen, es findet die Platten durch Scannen
nach Vinum-Markierungen auf den eingerichteten Laufwerken. Dies
erm?glicht es, Vinum-Platten auch dann noch korrekt zu identifizieren,
wenn sie schon andere UNIX?-Platten-IDs zugewiesen bekommen haben.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.8.1.1. Automatische Inbetriebnahme
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

*Gvinum* unterst?tzt eine automatische Inbetriebnahme immer, wenn das
Kernelmodul ?ber
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
geladen ist. Um das *Gvinum* Modul beim Hochfahren des Systems zu laden,
f?gen Sie die Zeile ``geom_vinum_load="YES"`` in ``/boot/loader.conf``
ein.

.. raw:: html

   </div>

Beim starten von Vinum durch den Befehl ``vinum       start`` liest
Vinum die Konfigurationsdatenbank von einer der Vinum-Platten. Unter
normalen Umst?nden enth?lt jede Platte eine identische Kopie der
Konfigurationsdatenbank, so dass es keine Rolle spielt, von welcher der
Platten diese eingelesen wird. Nach einem Plattencrash muss Vinum
allerdings zun?chst feststellen, welche der Platten zuletzt aktualisiert
wurde und dann die Konfiguration von dieser Platte lesen. Danach werden
(falls n?tig) die Konfigurationen der "alten" Platten aktualisiert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+------------------------------------+--------------------------------------------------+
| `Zur?ck <vinum-object-naming.html>`__?   | `Nach oben <vinum-vinum.html>`__   | ?\ `Weiter <vinum-root.html>`__                  |
+------------------------------------------+------------------------------------+--------------------------------------------------+
| 23.7. Objektbenennung?                   | `Zum Anfang <index.html>`__        | ?23.9. Vinum f?r das Root-Dateisystem benutzen   |
+------------------------------------------+------------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
