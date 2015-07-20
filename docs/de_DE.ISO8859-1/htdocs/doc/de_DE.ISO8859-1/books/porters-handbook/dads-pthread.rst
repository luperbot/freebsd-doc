=============================
12.11. Threading-Bibliotheken
=============================

.. raw:: html

   <div class="navheader">

12.11. Threading-Bibliotheken
`Zur?ck <dads-cflags.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-freedback.html>`__

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

12.11. Threading-Bibliotheken
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Threading-Bibliothek muss mit Hilfe eines speziellen Linker-Flags
``-pthread`` in die Bin?rdateien unter FreeBSD gebunden werden. Falls
ein Port auf ein direktes Verlinken gegen ``-lpthread`` oder ``-lc_r``
besteht, passen Sie den Port bitte so an, dass er die durch das
Port-Framework bereitgestellte Variable ``PTHREAD_LIBS`` verwendet.
Diese Variable hat ?blicherweise den Wert ``-pthread``, kann aber auf
einigen Architekturen und FreeBSD-Versionen abweichende Werte haben und
daher sollte nie ``-pthread`` direkt in Patches geschrieben werden,
sondern immer ``PTHREAD_LIBS``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Falls durch das Setzen von ``PTHREAD_LIBS`` der Bau des Ports mit der
Fehlermeldung ``unrecognized option       '-pthread'`` abbricht, kann
die Verwendung des ``gcc`` als Linker durch setzen von ``CONFIGURE_ENV``
auf ``LD=${CC}`` helfen. Die Option ``-pthread`` wird nicht direkt von
``ld`` unterst?tzt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------------------+---------------------------------------+
| `Zur?ck <dads-cflags.html>`__?           | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-freedback.html>`__   |
+------------------------------------------+-------------------------------------+---------------------------------------+
| 12.10. Ber?cksichtigen Sie ``CFLAGS``?   | `Zum Anfang <index.html>`__         | ?12.12. R?ckmeldungen                 |
+------------------------------------------+-------------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
