==================
12.3. WRKDIRPREFIX
==================

.. raw:: html

   <div class="navheader">

12.3. ``WRKDIRPREFIX``
`Zur?ck <porting-wrkdir.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <porting-versions.html>`__

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

12.3. ``WRKDIRPREFIX``
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vergewissern Sie sich, dass Ihr Port ``WRKDIRPREFIX`` beachtet. Die
meisten Ports sollten sich dar?ber keine Sorgen machen. Beachten Sie
bitte, falls auf ``WRKDIR`` eines anderen Ports verwiesen wird, dass die
korrekte Position ``WRKDIRPREFIXPORTSDIR/subdir/name/work``, und nicht
etwa ``PORTSDIR/subdir/name/work``, ``.CURDIR/../../subdir/name/work``
oder ?hnliches ist.

Falls Sie ``WRKDIR`` selbst definieren, sollten Sie sicherstellen, dass
Sie ``${WRKDIRPREFIX}${.CURDIR}`` am Anfang anf?gen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------------+-----------------------------------------------------------------------+
| `Zur?ck <porting-wrkdir.html>`__?   | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <porting-versions.html>`__                                 |
+-------------------------------------+-------------------------------------+-----------------------------------------------------------------------+
| 12.2. ``WRKDIR``?                   | `Zum Anfang <index.html>`__         | ?12.4. Unterschiedliche Betriebssysteme und Betriebssystemversionen   |
+-------------------------------------+-------------------------------------+-----------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
