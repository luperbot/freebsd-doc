====================
3.7. Race-Conditions
====================

.. raw:: html

   <div class="navheader">

3.7. Race-Conditions
`Zur?ck <secure-trust.html>`__?
Kapitel 3. Sicheres Programmieren
?\ `Weiter <l10n.html>`__

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

3.7. Race-Conditions
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Race-Condition ist ein unnormales Verhalten, das von einer
unerwarteten Abh?ngigkeit beim Timing von Ereignissen verursacht wird.
Mit anderen Worten hei?t das, ein Programmierer nimmt irrt?mlicher Weise
an, dass ein bestimmtes Ereignis immer vor einem anderen stattfindet.

Einige der h?ufigsten Ursachen f?r Race-Conditions sind Signale,
Zugriffspr?fungen und das ?ffnen von Dateien. Signale sind von Natur aus
asynchrone Ereignisse, deshalb ist besondere Vorsicht im Umgang damit
geboten. Das Pr?fen des Zugriffs mittels der Aufrufe ``access(2)``
gefolgt von ``open(2)`` ist offensichtlich nicht atomar. Benutzer k?nnen
zwischen den beiden Aufrufen Dateien verschieben. Stattdessen sollten
privilegierte Anwendungen ``seteuid()`` direkt gefolgt von ``open()``
aufrufen. Auf die gleiche Art sollte eine Anwendung immer eine korrekte
Umask vor dem Aufruf von ``open()`` setzen, um st?rende Aufrufe von
``chmod()`` zu umgehen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+-----------------------------------------------------------------------+
| `Zur?ck <secure-trust.html>`__?   | `Nach oben <secure.html>`__   | ?\ `Weiter <l10n.html>`__                                             |
+-----------------------------------+-------------------------------+-----------------------------------------------------------------------+
| 3.6. Vertrauen?                   | `Zum Anfang <index.html>`__   | ?Kapitel 4. Lokalisierung und Internationalisierung - L10N und I18N   |
+-----------------------------------+-------------------------------+-----------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
