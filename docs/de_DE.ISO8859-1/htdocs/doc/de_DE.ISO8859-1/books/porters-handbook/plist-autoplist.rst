==============================================
7.5. Automatisiertes Erstellen von Paketlisten
==============================================

.. raw:: html

   <div class="navheader">

7.5. Automatisiertes Erstellen von Paketlisten
`Zur?ck <plist-dynamic.html>`__?
Kapitel 7. Fortgeschrittene ``pkg-plist``-Methoden
?\ `Weiter <pkg-files.html>`__

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

7.5. Automatisiertes Erstellen von Paketlisten
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als Erstes sollten Sie sich vergewissern, dass der Port bis auf
``pkg-plist`` vollst?ndig ist.

Als N?chstes erstellen Sie einen tempor?ren Verzeichnisbaum, in welchem
Ihr Port installiert werden kann, und installieren Sie alle
Abh?ngigkeiten.

.. code:: screen

    # mkdir /var/tmp/`make -V PORTNAME`
    # mtree -U -f `make -V MTREE_FILE` -d -e -p /var/tmp/`make -V PORTNAME`
    # make depends PREFIX=/var/tmp/`make -V PORTNAME`

Speichern Sie die Verzeichnisstruktur in einer neuen Datei.

.. code:: screen

    # (cd /var/tmp/`make -V PORTNAME` && find -d * -type d) | sort > OLD-DIRS

Erstellen Sie eine leere ``pkg-plist``-Datei:

.. code:: screen

    # :>pkg-plist

Wenn Ihr Port auf ``PREFIX`` achtet (was er machen sollte), so kann der
Port nun installiert und die Paketliste erstellt werden.

.. code:: screen

    # make install PREFIX=/var/tmp/`make -V PORTNAME`
    # (cd /var/tmp/`make -V PORTNAME` && find -d * \! -type d) | sort > pkg-plist

Sie m?ssen auch alle neu erstellten Verzeichnisse in die Paketliste
aufnehmen.

.. code:: screen

    # (cd /var/tmp/`make -V PORTNAME` && find -d * -type d) | sort | comm -13 OLD-DIRS - | sort -r | sed -e 's#^#@dirrm #' >> pkg-plist

Zu guter Letzt muss die Paketliste noch manuell aufger?umt werden - es
funktioniert eben nicht *alles* automatisch. Manualpages sollten im
``Makefile`` des Ports unter ``MANn`` aufgef?hrt sein und nicht in der
Paketliste. Konfigurationsdateien des Benutzers sollten entfernt oder
als ``filename.sample`` installiert werden. Die ``info/dir``-Datei
sollte nicht aufgef?hrt sein und die zugeh?rigen ``install-info``-Zeilen
sollten hinzugef?gt werden, wie im `info
files <makefile-info.html>`__-Abschnitt beschrieben. Alle Bibliotheken,
die der Port installiert, sollten aufgelistet werden, wie es im `Shared
Libraries <special.html#porting-shlibs>`__-Abschnitt festgelegt ist.

Alternativ dazu k?nnen Sie das ``plist``-Skript in
``/usr/ports/Tools/scripts/`` verwenden, um die Paketliste automatisch
zu erstellen. Das ``plist``-Skript ist ein Ruby-Skript, das die meisten
der in den vorangehenden Abs?tzen kurz dargestellten manuellen Schritte
automatisiert.

Der erste Schritt ist derselbe wie oben: Nehmen Sie die ersten drei
Zeilen, also ``mkdir``, ``mtree`` und ``make depends``. Installieren und
bauen Sie dann den Port:

.. code:: screen

    # make install PREFIX=/var/tmp/`make -V PORTNAME`

Und lassen Sie ``plist`` die ``pkg-plist``-Datei erstellen:

.. code:: screen

    # /usr/ports/Tools/scripts/plist -Md -m `make -V MTREE_FILE` /var/tmp/`make -V PORTNAME` > pkg-plist

Die Paketliste muss immer noch von Hand aufger?umt werden, wie es oben
erkl?rt wurde.

Ein weiteres Werkzeug zur Erzeugung einer ersten ``pkg-plist``-Datei ist
`ports-mgmt/genplist <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/genplist/pkg-descr>`__.
Wie bei jedem automatisierten Hilfswerkzeug, sollte die erzeugte
``pkg-plist``-Datei ?berpr?ft und bei Bedarf von Hand nachbearbeitet
werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <plist-dynamic.html>`__?             | `Nach oben <plist.html>`__    | ?\ `Weiter <pkg-files.html>`__      |
+----------------------------------------------+-------------------------------+-------------------------------------+
| 7.4. Dynamische oder statische Paketliste?   | `Zum Anfang <index.html>`__   | ?Kapitel 8. Die ``pkg-*`` Dateien   |
+----------------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
