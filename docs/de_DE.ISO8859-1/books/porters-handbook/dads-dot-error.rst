========================================================
12.16. Vermeiden Sie den Gebrauch des .error-Konstruktes
========================================================

.. raw:: html

   <div class="navheader">

12.16. Vermeiden Sie den Gebrauch des ``.error``-Konstruktes
`Zur?ck <dads-deprecated.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-sysctl.html>`__

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

12.16. Vermeiden Sie den Gebrauch des ``.error``-Konstruktes
------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der korrekte Weg eines ``Makefile`` anzuzeigen, dass der Port aufgrund
eines externen Grundes nicht installiert werden kann (zum Beispiel, weil
der Benutzer eine ung?ltige Kombination von Build-Optionen angegeben
hat), ist ``IGNORE`` auf einen nicht leeren Wert zu setzen. Dieser wird
dann formatiert und dem Benutzer von ``make install`` ausgegeben.

Es ist ein verbreiteter Fehler ``.error`` f?r diesem Zweck zu verwenden.
Das Problem dabei ist, dass viele automatisierte Werkzeuge, die mit dem
Ports-Baum arbeiten, in dieser Situation fehlschlagen. Am H?ufigsten
tritt das Problem beim Versuch ``/usr/ports/INDEX`` zu bauen auf (siehe
`Abschnitt?9.1, „\ ``make describe``
ausf?hren“ <testing.html#make-describe>`__). Jedoch schlagen auch
trivialere Befehle wie ``make maintainer`` in diesem Fall fehl. Dies ist
nicht akzeptabel!

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 12.1. Wie vermeidet man die Verwendung von ``.error``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Nehmen Sie an, dass die Zeile

.. code:: programlisting

    USE_POINTYHAT=yes

in ``make.conf`` enthalten ist. Der erste der folgenden zwei
``Makefile``-Schnipsel l?sst ``make index`` fehlschlagen, w?hrend der
zweite dies nicht tut.

.. code:: programlisting

    .if USE_POINTYHAT
    .error "POINTYHAT is not supported"
    .endif

.. code:: programlisting

    .if USE_POINTYHAT
    IGNORE=POINTYHAT is not supported
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------------------------------------------+-------------------------------------+-------------------------------------+
| `Zur?ck <dads-deprecated.html>`__?                                                              | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-sysctl.html>`__    |
+-------------------------------------------------------------------------------------------------+-------------------------------------+-------------------------------------+
| 12.15. Kennzeichnen eines Ports zur Entfernung durch ``DEPRECATED`` oder ``EXPIRATION_DATE``?   | `Zum Anfang <index.html>`__         | ?12.17. Verwendung von ``sysctl``   |
+-------------------------------------------------------------------------------------------------+-------------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
