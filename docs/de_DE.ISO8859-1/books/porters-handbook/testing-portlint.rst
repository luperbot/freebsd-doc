=============
9.2. Portlint
=============

.. raw:: html

   <div class="navheader">

9.2. Portlint
`Zur?ck <testing.html>`__?
Kapitel 9. Ihren Port testen
?\ `Weiter <testing-porttools.html>`__

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

9.2. Portlint
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bitte ?berpr?fen Sie Ihre Arbeit stets mit
```portlint`` <porting-portlint.html>`__, bevor Sie diese einreichen
oder committen. ``portlint`` warnt Sie bei h?ufigen Fehlern, sowohl
funktionaler als auch stilistischer Natur. F?r einen neuen (oder
repokopierten) Port ist ``portlint -A`` die gr?ndlichste Variante; f?r
einen bereits existierenden Port ist ``portlint -C`` ausreichend.

Da ``portlint`` heuristische Methoden zur Fehlersuche benutzt, kann es
vorkommen, dass Warnungen f?r Fehler erzeugt werden, die keine sind.
Gelegentlich kann etwas, das als Problem angezeigt wird, aufgrund von
Einschr?nkungen im Port-System nicht anders gel?st werden. Wenn es
Zweifel gibt, fragen Sie am besten auf `FreeBSD
ports <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__ nach.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+--------------------------------+------------------------------------------+
| `Zur?ck <testing.html>`__?      | `Nach oben <testing.html>`__   | ?\ `Weiter <testing-porttools.html>`__   |
+---------------------------------+--------------------------------+------------------------------------------+
| Kapitel 9. Ihren Port testen?   | `Zum Anfang <index.html>`__    | ?9.3. Port Tools                         |
+---------------------------------+--------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
