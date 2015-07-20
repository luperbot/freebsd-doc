==========================
6.14. Benutzung von Tcl/Tk
==========================

.. raw:: html

   <div class="navheader">

6.14. Benutzung von Tcl/Tk
`Zur?ck <using-python.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-emacs.html>`__

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

6.14. Benutzung von Tcl/Tk
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Ports-Sammlung unterst?tzt die parallele Installation mehrerer
Tcl/Tk-Versionen. Ports sollten mindestens die vorgegebene
Tcl/Tk-Version oder h?her zu unterst?tzen versuchen anhand der Variablen
``USE_TCL`` und ``USE_TK``. Es ist m?glich, die gew?nschte Version von
``tcl`` mit der Variable ``WITH_TCL_VER`` vorzuschreiben.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.21. ?u?erst n?tzliche Variablen f?r Ports, die Tcl/Tk benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_TCL``                      | Der Port ben?tigt die Tcl-Bibliothek (nicht die Shell). Eine notwendige Mindestversion kann mit Werten wie 84+ angegeben werden. Einzelne nicht unterst?tzte Versionen k?nnen mit der Variable ``INVALID_TCL_VER`` festgelegt werden.                                                              |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_TCL_BUILD``                | Der Port ben?tigt Tcl nur w?hrend der Zeit, in der er gebaut wird.                                                                                                                                                                                                                                 |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_TCL_WRAPPER``              | Ports, welche zwar die Tcl-Shell, aber nicht eine bestimmte Version von ``tclsh`` verlangen, sollten diese neue Variable verwenden. Ein Wrapperskript f?r ``tclsh`` wird auf dem System installiert. Der Benutzer kann festlegen, welche ``tcl``-Shell gew?nscht ist bzw. verwendet werden soll.   |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WITH_TCL_VER``                 | Benutzerdefinierte Variable, welche die gew?nschte Tcl-Version bestimmt.                                                                                                                                                                                                                           |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PORTNAME``\ \_WITH\_TCL\_VER   | Gleich wie ``WITH_TCL_VER``, nur portspezifisch.                                                                                                                                                                                                                                                   |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_TCL_THREADS``              | Fordere threadf?higes Tcl/Tk.                                                                                                                                                                                                                                                                      |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_TK``                       | Der Port ben?tigt die Tk-Bibliothek (nicht die Wish-Shell). Impliziert ``USE_TCL`` mit dem gleichen Wert. F?r weitere Informationen siehe die Beschreibung der Variable ``USE_TCL``.                                                                                                               |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_TK_BUILD``                 | Analog zur Variable ``USE_TCL_BUILD``.                                                                                                                                                                                                                                                             |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_TK_WRAPPER``               | Analog zur Variable ``USE_TCL_WRAPPER``.                                                                                                                                                                                                                                                           |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WITH_TK_VER``                  | Analog zur Variable ``WITH_TCL_VER`` und impliziert ``WITH_TCL_VER`` mit dem gleichen Wert.                                                                                                                                                                                                        |
+----------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine vollst?ndige Liste der zur Verf?gung stehenden Variablen befindet
sich in ``/usr/ports/Mk/bsd.tcl.mk``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+--------------------------------+------------------------------------+
| `Zur?ck <using-python.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-emacs.html>`__   |
+-----------------------------------+--------------------------------+------------------------------------+
| 6.13. Python benutzen?            | `Zum Anfang <index.html>`__    | ?6.15. Emacs benutzen              |
+-----------------------------------+--------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
