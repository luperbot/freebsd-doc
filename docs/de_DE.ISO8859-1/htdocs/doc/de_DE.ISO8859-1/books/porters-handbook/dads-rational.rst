===============================
12.8. Aufgaben vern?nftig l?sen
===============================

.. raw:: html

   <div class="navheader">

12.8. Aufgaben vern?nftig l?sen
`Zur?ck <dads-sh-exec.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-cc.html>`__

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

12.8. Aufgaben vern?nftig l?sen
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ``Makefile`` sollte die n?tigen Schritte einfach und vern?nftig
durchf?hren. Wenn Sie ein einige Zeilen einsparen oder die Lesbarkeit
verbessern k?nnen, dann machen Sie dies bitte. Beispiele sind: Ein
make-Konstrukt ``.if`` anstatt eines Shellkonstrukt ``if`` zu verwenden,
anstatt ``do-extract`` neu zu definieren, dies mit ``EXTRACT*`` machen,
oder ``GNU_CONFIGURE`` anstelle von
``CONFIGURE_ARGS += --prefix=${PREFIX}`` zu verwenden.

Falls Sie sich in einer Situation wiederfinden, in der Sie viel Code neu
schreiben m?ssen, um etwas zu testen, sollten Sie zuerst ``bsd.port.mk``
erneut konsultieren und nachpr?fen ob es nicht bereits eine L?sung f?r
Ihr Problem enth?lt. Es ist zwar schwer zu lesen, beinhaltet jedoch eine
Menge kurzer L?sungen f?r viele scheinbar schwierige Probleme.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------------+-------------------------------------+-------------------------------------------------------------+
| `Zur?ck <dads-sh-exec.html>`__?                                  | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-cc.html>`__                                |
+------------------------------------------------------------------+-------------------------------------+-------------------------------------------------------------+
| 12.7. Benutzen Sie die ``exec``-Anweisung in Wrapper-Skripten?   | `Zum Anfang <index.html>`__         | ?12.9. Ber?cksichtigen Sie sowohl ``CC`` als auch ``CXX``   |
+------------------------------------------------------------------+-------------------------------------+-------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
