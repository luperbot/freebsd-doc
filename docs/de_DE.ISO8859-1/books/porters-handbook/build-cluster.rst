=======================================================================
14.4. Der Cluster zum Bauen von FreeBSD-Ports auf pointyhat.FreeBSD.org
=======================================================================

.. raw:: html

   <div class="navheader">

14.4. Der Cluster zum Bauen von FreeBSD-Ports auf
``pointyhat.FreeBSD.org``
`Zur?ck <ports-mailling-list.html>`__?
Kapitel 14. Auf dem Laufenden bleiben
?\ `Weiter <distfile-survey.html>`__

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

14.4. Der Cluster zum Bauen von FreeBSD-Ports auf ``pointyhat.FreeBSD.org``
---------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine der weniger bekannten St?rken von FreeBSD ist es, dass ein ganzer
Cluster von Maschinen nur daf?r reserviert ist, andauernd die
Ports-Sammlung zu bauen, und zwar f?r jedes gro?e FreeBSD Release und
jede Tier-1-Architektur. Die Ergebnisse k?nnen Sie unter `package
building logs and errors <http://pointyhat.FreeBSD.org/>`__ finden.

Alle Ports ausser denjenigen, die als ``IGNORE`` markiert sind, werden
gebaut. Ports, die als ``BROKEN`` markiert sind, werden dennoch
ausprobiert, um zu sehen, ob das zugrunde liegende Problem gel?st wurde
(Dies wird erreicht, indem ``TRYBROKEN`` an das ``Makefile`` des Ports
?bergeben wird).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-----------------------------------+---------------------------------------------+
| `Zur?ck <ports-mailling-list.html>`__?   | `Nach oben <keeping-up.html>`__   | ?\ `Weiter <distfile-survey.html>`__        |
+------------------------------------------+-----------------------------------+---------------------------------------------+
| 14.3. Die FreeBSD Ports-Mailingliste?    | `Zum Anfang <index.html>`__       | ?14.5. Der FreeBSD Ports-Distfile-Scanner   |
+------------------------------------------+-----------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
