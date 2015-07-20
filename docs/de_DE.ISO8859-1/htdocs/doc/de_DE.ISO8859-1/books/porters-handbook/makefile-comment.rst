============
5.6. COMMENT
============

.. raw:: html

   <div class="navheader">

5.6. ``COMMENT``
`Zur?ck <makefile-maintainer.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <makefile-depend.html>`__

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

5.6. ``COMMENT``
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dies ist eine einzeilige Beschreibung des Ports. *Bitte* f?gen Sie nicht
den Paketnamen (oder die Version der Software) in den Kommentar ein. Der
Kommentar soll mit einem Gro?buchstaben beginnen und ohne Punkt enden.
Hier ist ein Beispiel:

.. code:: programlisting

    COMMENT=       A cat chasing a mouse all over the screen

Die COMMENT-Variable soll unmittelbar nach der MAINTAINER-Variable im
``Makefile`` stehen.

Bitte versuchen Sie die COMMENT-Zeile auf weniger als 70 Zeichen zu
begrenzen, da
`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1>`__
diese zur Anzeige einer kurzen, einzeiligen Zusammenfassung des Ports
verwendet.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------+----------------------------------------+
| `Zur?ck <makefile-maintainer.html>`__?   | `Nach oben <makefile.html>`__   | ?\ `Weiter <makefile-depend.html>`__   |
+------------------------------------------+---------------------------------+----------------------------------------+
| 5.5. ``MAINTAINER``?                     | `Zum Anfang <index.html>`__     | ?5.7. Abh?ngigkeiten (dependencies)    |
+------------------------------------------+---------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
