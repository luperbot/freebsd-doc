=================================
12.10. Ber?cksichtigen Sie CFLAGS
=================================

.. raw:: html

   <div class="navheader">

12.10. Ber?cksichtigen Sie ``CFLAGS``
`Zur?ck <dads-cc.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-pthread.html>`__

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

12.10. Ber?cksichtigen Sie ``CFLAGS``
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Port sollte die Variable ``CFLAGS`` ber?cksichtigen. Damit ist
gemeint, dass der Port den Wert dieser Variablen nicht absolut setzen
und damit existierende Werte ?berschreiben sollte; stattdessen sollte er
weitere Werte der Variablen durch Anh?ngen hinzuf?gen. Dadurch k?nnen
Build-Optionen, die alle Ports betreffen, global definiert werden.

Falls der Port diese Variablen nicht ber?cksichtigt, sollte
``NO_PACKAGE=ignores     cflags`` ins ``Makefile`` eingef?gt werden.

Im Folgenden wird ein Beispiel eines ``Makefile``\ s gezeigt, welches
die Variable ``CFLAGS`` ber?cksichtigt. Beachten Sie das ``+=``:

.. code:: programlisting

    CFLAGS+= -Wall -Werror

Nachfolgend finden Sie ein Beispiel, welches die ``CFLAGS``-Variable
nicht ber?cksichtigt:

.. code:: programlisting

    CFLAGS= -Wall -Werror

Die Variable ``CFLAGS`` wird auf FreeBSD-Systemen in ``/etc/make.conf``
definiert. Im ersten Beispiel werden weitere Flags an die Variable
``CFLAGS`` angeh?ngt und somit der bestehende Wert nicht gel?scht. Im
zweiten Beispiel wird die Variable ohne R?cksicht ?berschrieben.

Sie sollten Optimierungsflags aus ``Makefile``\ s Dritter entfernen. Die
``CFLAGS`` des Systems beinhalten systemweite Optimierungsflags. Ein
Beispiel eines unver?nderten ``Makefile``\ s:

.. code:: programlisting

    CFLAGS= -O3 -funroll-loops -DHAVE_SOUND

Werden nun systemweite Optimierungsflags verwendet so w?rde das
``Makefile`` in etwa folgenderma?en aussehen:

.. code:: programlisting

    CFLAGS+= -DHAVE_SOUND

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------+-------------------------------------+-------------------------------------+
| `Zur?ck <dads-cc.html>`__?                                  | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-pthread.html>`__   |
+-------------------------------------------------------------+-------------------------------------+-------------------------------------+
| 12.9. Ber?cksichtigen Sie sowohl ``CC`` als auch ``CXX``?   | `Zum Anfang <index.html>`__         | ?12.11. Threading-Bibliotheken      |
+-------------------------------------------------------------+-------------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
