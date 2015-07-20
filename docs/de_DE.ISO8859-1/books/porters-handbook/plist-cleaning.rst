========================
7.2. Leere Verzeichnisse
========================

.. raw:: html

   <div class="navheader">

7.2. Leere Verzeichnisse
`Zur?ck <plist.html>`__?
Kapitel 7. Fortgeschrittene ``pkg-plist``-Methoden
?\ `Weiter <plist-config.html>`__

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

7.2. Leere Verzeichnisse
------------------------

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

7.2.1. Aufr?umen leerer Verzeichnisse
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bitte sorgen Sie daf?r, dass ihre Ports bei der Deinstallation leere
Verzeichnisse l?schen. Dazu wird f?r jedes Verzeichnis, das der Port
erzeugt hat, eine ``@dirrm``-Zeile angegeben. Um ein Verzeichnis zu
l?schen m?ssen Sie zuerst dessen Unterverzeichnisse entfernen.

.. code:: programlisting

     :
    lib/X11/oneko/pixmaps/cat.xpm
    lib/X11/oneko/sounds/cat.au
     :
    @dirrm lib/X11/oneko/pixmaps
    @dirrm lib/X11/oneko/sounds
    @dirrm lib/X11/oneko

Es kann allerdings auch vorkommen, dass ``@dirrm`` Fehler ausgibt, da
andere Ports ein Verzeichnis ebenfalls nutzen. Deshalb k?nnen Sie
``@dirrmtry`` verwenden, um nur Verzeichnisse zu l?schen, die wirklich
leer sind, und damit Warnhinweise vermeiden.

.. code:: programlisting

    @dirrmtry share/doc/gimp

Dadurch wird es weder eine Fehlermeldung geben noch wird
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__
abnormal beendet werden - auch dann nicht, wenn
``${PREFIX}/share/doc/gimp`` nicht leer ist, da andere Ports hier
ebenfalls Dateien installiert haben.

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

7.2.2. Erstellen leerer Verzeichnisse
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um leere Verzeichnisse w?hrend der Installation eines Ports zu
erstellen, bedarf es etwas Aufmerksamkeit. Diese Verzeichnisse werden
nicht erstellt, wenn das Paket installiert wird, da Pakete nur die
Dateien speichern und
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
nur die Verzeichnisse erstellt, die daf?r ben?tigt werden. Um sicher zu
gehen, dass das leere Verzeichnis erstellt wird, wenn ein Paket
installiert wird, muss die folgende Zeile in ``pkg-plist`` ?ber der
entsprechenden ``@dirrm`` Zeile eingetragen werden:

.. code:: programlisting

    @exec mkdir -p %D/share/foo/templates

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <plist.html>`__?                              | `Nach oben <plist.html>`__    | ?\ `Weiter <plist-config.html>`__   |
+-------------------------------------------------------+-------------------------------+-------------------------------------+
| Kapitel 7. Fortgeschrittene ``pkg-plist``-Methoden?   | `Zum Anfang <index.html>`__   | ?7.3. Konfigurationsdateien         |
+-------------------------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
