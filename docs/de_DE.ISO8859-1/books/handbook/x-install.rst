=====================
6.3. X11 installieren
=====================

.. raw:: html

   <div class="navheader">

6.3. X11 installieren
`Zur?ck <x-understanding.html>`__?
Kapitel 6. Das X-Window-System
?\ `Weiter <x-config.html>`__

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

6.3. X11 installieren
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xorg ist der Standard-X-Server unter FreeBSD. Xorg ist der von der X.Org
Foundation herausgegebene X-Server des Open-Source X?Window Systems.
Xorg beruht auf XFree86™?4.4RC2 und X11R6.6. Derzeit ist die Version 7.7
von Xorg in der Ports-Sammlung vorhanden.

Die nachstehenden Kommandos bauen und installieren Xorg aus der
Ports-Sammlung:

.. code:: screen

    # cd /usr/ports/x11/xorg
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Der komplette Bau von Xorg ben?tigt mindestens 4?GB freien Plattenplatz.

.. raw:: html

   </div>

Mit
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
k?nnen Sie X11 direkt von fertigen Paketen installieren. Wenn
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
die Pakete herunterl?dt, lassen Sie die Versionsnummer aus.
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
holt automatisch die aktuelle Version eines Pakets.

Das Xorg-Paket holen und installieren Sie wie folgt:

.. code:: screen

    # pkg_add -r xorg

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die obigen Beispiele installieren die vollst?ndige X11-Distribution, die
unter anderem Server, Clients und Fonts enth?lt. F?r die einzelnen Teile
der Distribution gibt es ebenfalls separate Pakete.

Alternativ k?nnen Sie
`x11/xorg-minimal <http://www.freebsd.org/cgi/url.cgi?ports/x11/xorg-minimal/pkg-descr>`__
verwenden, um eine minimale X11-Distribution zu installieren.

.. raw:: html

   </div>

Der Rest dieses Kapitels erkl?rt, wie Sie X11 konfigurieren und sich
eine Arbeitsumgebung einrichten.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+---------------------------------+
| `Zur?ck <x-understanding.html>`__?   | `Nach oben <x11.html>`__      | ?\ `Weiter <x-config.html>`__   |
+--------------------------------------+-------------------------------+---------------------------------+
| 6.2. X-Grundlagen?                   | `Zum Anfang <index.html>`__   | ?6.4. X11 konfigurieren         |
+--------------------------------------+-------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
