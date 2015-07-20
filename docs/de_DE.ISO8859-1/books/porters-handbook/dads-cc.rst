================================================
12.9. Ber?cksichtigen Sie sowohl CC als auch CXX
================================================

.. raw:: html

   <div class="navheader">

12.9. Ber?cksichtigen Sie sowohl ``CC`` als auch ``CXX``
`Zur?ck <dads-rational.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-cflags.html>`__

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

12.9. Ber?cksichtigen Sie sowohl ``CC`` als auch ``CXX``
--------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Port sollte sowohl die ``CC``- wie auch die ``CXX``-Variable
ber?cksichtigen. Damit ist gemeint, dass der Port diese Variablen nicht
ohne R?cksicht auf eventuell schon gesetzte Werte einfach ?berschreiben
sollte; stattdessen sollten neue Werte an schon existierende angeh?ngt
werden. Dadurch k?nnen Build-Optionen, die alle Ports betreffen, global
definiert werden.

Falls der Port diese Variablen nicht ber?cksichtigt, sollte
``NO_PACKAGE=ignores either     cc or cxx`` ins ``Makefile`` eingef?gt
werden.

Im Folgenden wird ein Beispiel eines ``Makefile``\ s gezeigt, welches
die beiden Variablen ``CC`` und ``CXX`` ber?cksichtigt. Beachten Sie das
``?=``:

.. code:: programlisting

    CC?= gcc

.. code:: programlisting

    CXX?= g++

Nachfolgend ein Beispiel, welches weder ``CC`` noch ``CXX``
ber?cksichtigt:

.. code:: programlisting

    CC= gcc

.. code:: programlisting

    CXX= g++

Die Variablen ``CC`` und ``CXX`` k?nnen auf FreeBSD-Systemen in
``/etc/make.conf`` definiert werden. Im ersten Beispiel wird ein Wert
nur dann gesetzt, falls dieser vorher noch nicht gesetzt war, um so
systemweite Definitionen zu ber?cksichtigen. Im zweiten Beispiel werden
die Variablen ohne R?cksicht ?berschrieben.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------------+------------------------------------------+
| `Zur?ck <dads-rational.html>`__?   | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-cflags.html>`__         |
+------------------------------------+-------------------------------------+------------------------------------------+
| 12.8. Aufgaben vern?nftig l?sen?   | `Zum Anfang <index.html>`__         | ?12.10. Ber?cksichtigen Sie ``CFLAGS``   |
+------------------------------------+-------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
