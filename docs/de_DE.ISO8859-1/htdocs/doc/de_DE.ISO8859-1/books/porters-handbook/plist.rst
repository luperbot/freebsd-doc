==============================================
Kapitel 7. Fortgeschrittene pkg-plist-Methoden
==============================================

.. raw:: html

   <div class="navheader">

Kapitel 7. Fortgeschrittene ``pkg-plist``-Methoden
`Zur?ck <ch06s25.html>`__?
?
?\ `Weiter <plist-cleaning.html>`__

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

`7.1. ?nderungen an ``pkg-plist`` mit Hilfe von
make-Variablen <plist.html#plist-sub>`__
`7.2. Leere Verzeichnisse <plist-cleaning.html>`__
`7.3. Konfigurationsdateien <plist-config.html>`__
`7.4. Dynamische oder statische Paketliste <plist-dynamic.html>`__
`7.5. Automatisiertes Erstellen von
Paketlisten <plist-autoplist.html>`__

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

7.1. ?nderungen an ``pkg-plist`` mit Hilfe von make-Variablen
-------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Ports, insbesondere die ``p5-``-Ports, m?ssen, abh?ngig von ihren
Konfigurationsoptionen (oder im Falle der p5-Ports von der
``perl``-Version), die ``pkg-plist`` ver?ndern. Um dies zu vereinfachen,
werden f?r jeden Eintrag in ``pkg-plist`` die Variablen ``%%OSREL%%``,
``%%PERL_VER%%`` und ``%%PERL_VERSION%%`` durch die jeweiligen Werte
ersetzt. Der Wert von ``%%OSREL%%`` ist die Revisionsnummer des
Betriebssystems (z.B. ``4.9``). ``%%PERL_VERSION%%`` und
``%%PERL_VER%%`` geben die vollst?ndige Versionsnummer von ``perl``
(z.B. ``5.8.9``) an. Weitere, die Dokumentationsdateien des Ports
betreffende ``%%VARS%%``, werden im `entsprechenden
Abschnitt <install.html#install-documentation>`__ erl?utert.

Falls Sie weitere Ersetzungen von Variablen durchf?hren m?ssen, k?nnen
Sie in der Variable ``PLIST_SUB`` eine Liste von ``VAR=VALUE``-Paaren
angeben, wobei in der ``pkg-plist`` ``%%VAR%%`` durch *``VALUE``*
ersetzt wird.

Wenn Sie z.B. einen Port haben, der viele Dateien in ein
versionsspezifisches Unterverzeichnis installiert, dann k?nnen Sie etwas
wie

.. code:: programlisting

    OCTAVE_VERSION= 2.0.13
    PLIST_SUB=      OCTAVE_VERSION=${OCTAVE_VERSION}

in das ``Makefile`` schreiben und ``%%OCTAVE_VERSION%%`` verwenden,
unabh?ngig davon, wo die Variable in ``pkg-plist`` verwendet wird. In
diesem Fall m?ssen Sie bei einem Upgrade des Ports nicht dutzende (oder
manchmal sogar hunderte) Zeilen in ``pkg-plist`` anpassen.

Falls Ihr Port in Abh?ngigkeit von den ausgew?hlten Optionen Dateien
installiert, ist es ?blich, den entsprechenden Zeilen in der
``pkg-plist`` eine Zeichenfolge ``%%TAG%%`` voranzustellen, wobei der
Platzhalter ``TAG`` der Variablen ``PLIST_SUB`` im ``Makefile`` bei
gleichzeitiger Zuweisung des speziellen Werts ``@comment`` hinzugef?gt
wird, der die Paket-Werkzeuge die Zeile ignorieren l?sst:

.. code:: programlisting

    .if defined(WITH_X11)
    PLIST_SUB+= X11=""
    .else
    PLIST_SUB+= X11="@comment "
    .endif

und in der ``pkg-plist``:

.. code:: programlisting

    %%X11%%bin/foo-gui

Diese Ersetzung (ebenso wie das Hinzuf?gen weiterer
`Manualpages <makefile-manpages.html>`__) wird zwischen den
``pre-install``- und ``do-install``-Targets ausgef?hrt, indem aus
``PLIST`` gelesen und in ``TMPPLIST`` geschrieben wird (Standard:
``WRKDIR/.PLIST.mktmp``). Falls Ihr Port also ``PLIST`` w?hrend dem
Erstellen generiert, so sollte dies vor oder in ``pre-install``
geschehen. Muss Ihr Port die resultierende Datei ver?ndern, so sollte
dies in ``post-install`` mit der Ausgabedatei ``TMPPLIST`` erfolgen.

Eine weitere M?glichkeit, die Paketliste eines Ports zu ver?ndern,
besteht darin die Variablen ``PLIST_FILES`` und ``PLIST_DIRS`` zu
setzen. Der Wert jeder der beiden Variablen stellt eine Liste von
Pfadnamen dar, die zusammen mit dem Inhalt von ``PLIST`` in ``TMPPLIST``
geschrieben wird. Dabei unterliegen die Namen in ``PLIST_FILES`` und
``PLIST_DIRS`` der weiter oben beschriebenen Substitution von
``%%VAR%%``. Die Namen aus ``PLIST_FILES`` werden ansonsten unver?ndert
in die endg?ltige Paketliste ?bernommen, w?hrend den Namen aus
``PLIST_DIRS`` noch der Wert von ``@dirrm`` vorangestellt wird. Damit
die Verwendung von ``PLIST_FILES`` und ``PLIST_DIRS`` ?berhaupt m?glich
ist, m?ssen diese gesetzt werden, bevor ``TMPPLIST`` geschrieben
wird?–?z.B. in ``pre-install`` oder vorher.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <ch06s25.html>`__?                 | ?                             | ?\ `Weiter <plist-cleaning.html>`__   |
+--------------------------------------------+-------------------------------+---------------------------------------+
| 6.25. Von Kernelquellen abh?ngige Ports?   | `Zum Anfang <index.html>`__   | ?7.2. Leere Verzeichnisse             |
+--------------------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
