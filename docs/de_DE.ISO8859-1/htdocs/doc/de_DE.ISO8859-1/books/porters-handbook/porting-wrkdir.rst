============
12.2. WRKDIR
============

.. raw:: html

   <div class="navheader">

12.2. ``WRKDIR``
`Zur?ck <porting-dads.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <porting-wrkdirprefix.html>`__

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

12.2. ``WRKDIR``
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Schreiben Sie in keine Dateien au?erhalb von ``WRKDIR``. ``WRKDIR`` ist
der einzige Ort, welcher w?hrend des Erstellen des Ports garantiert
beschreibbar ist (siehe `Ports Installieren von
CDROM <../../../../doc/de_DE.ISO8859-1/books/handbook/ports-using.html#PORTS-CD>`__
f?r ein Beispiel, um Ports in einem schreibgesch?tzen Zweig zu
erstellen). Wenn Sie eine der ``pkg-*`` Dateien modifizieren m?ssen,
sollten Sie `eine Variable erneut
definieren <pkg-names.html#porting-pkgfiles>`__, anstatt die Datei zu
?berschreiben.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------+-------------------------------------+---------------------------------------------+
| `Zur?ck <porting-dads.html>`__?                           | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <porting-wrkdirprefix.html>`__   |
+-----------------------------------------------------------+-------------------------------------+---------------------------------------------+
| Kapitel 12. Was man machen respektive vermeiden sollte?   | `Zum Anfang <index.html>`__         | ?12.3. ``WRKDIRPREFIX``                     |
+-----------------------------------------------------------+-------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
