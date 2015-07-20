=================================
Kapitel 3. Sicheres Programmieren
=================================

.. raw:: html

   <div class="navheader">

Kapitel 3. Sicheres Programmieren
`Zur?ck <tools-reading.html>`__?
Teil?I.?Grundlagen
?\ `Weiter <secure-philosophy.html>`__

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

Kapitel 3. Sicheres Programmieren
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Hagen K?hl.

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

`3.1. Zusammenfassung <secure.html#secure-synopsis>`__
`3.2. Methoden des sicheren Entwurfs <secure-philosophy.html>`__
`3.3. Puffer-?berl?ufe <secure-bufferov.html>`__
`3.4. SetUID-Themen <secure-setuid.html>`__
`3.5. Die Umgebung ihrer Programme einschr?nken <secure-chroot.html>`__
`3.6. Vertrauen <secure-trust.html>`__
`3.7. Race-Conditions <secure-race-conditions.html>`__

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

3.1. Zusammenfassung
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Kapitel beschreibt einige Sicherheitsprobleme, die
UNIX?-Programmierer seit Jahrzehnten qu?len, und inzwischen verf?gbare
Werkzeuge, die Programmierern helfen, Sicherheitsl?cken in ihrem
Quelltext zu vermeiden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+------------------------------------------+
| `Zur?ck <tools-reading.html>`__?   | `Nach oben <Basics.html>`__   | ?\ `Weiter <secure-philosophy.html>`__   |
+------------------------------------+-------------------------------+------------------------------------------+
| 2.8. Weiterf?hrende Literatur?     | `Zum Anfang <index.html>`__   | ?3.2. Methoden des sicheren Entwurfs     |
+------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
