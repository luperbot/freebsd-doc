=====================
6.13. Python benutzen
=====================

.. raw:: html

   <div class="navheader">

6.13. Python benutzen
`Zur?ck <using-php.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-tcl.html>`__

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

6.13. Python benutzen
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Ports unterst?tzen parallele Installationen mehrerer
Python-Versionen. Ports sollten sicherstellen, dass der richtige
``python``-Interpreter verwendet wird?–?entsprechend der durch den
Benutzer definierbaren Variable ``PYTHON_VERSION``. H?ufig bedeutet
dies, dass der Pfad zum ``python``-Interpreter durch den Wert der
Variablen ``PYTHON_CMD`` ersetzt werden muss.

Ports, die Dateien unter ``PYTHON_SITELIBDIR`` installieren, sollten
``pyXY-`` als Pr?fix des Paketnamens haben, sodass in deren Paketname
die zugeh?rige Python Version aufgef?hrt wird.

.. code:: programlisting

    PKGNAMEPREFIX= ${PYTHON_PKGNAMEPREFIX}

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.20. N?tzliche Variablen f?r Ports, die Python verwenden

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PYTHON``                | Der Port ben?tigt Python. Die minimal ben?tigte Version kann durch Werte wie ``2.3+`` angegeben werden. Bereiche von Versionsnummern k?nnen durch Angabe der minimalen und maximalen Versionsnummer, getrennt durch einen Gedankenstrich, festgelegt werden, z.B.: ``2.1-2.3``                                        |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PYDISTUTILS``           | Verwende Python-distutils zum Konfigurieren, Kompilieren und Installieren. Dies ist erforderlich, falls der Port eine ``setup.py``-Datei beinhaltet. Dadurch werden die ``do-build`` und ``do-install``-Ziele und eventuell auch das ``do-configure``-Ziel ?bergangen, falls ``GNU_CONFIGURE`` nicht definiert ist.   |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYTHON_PKGNAMEPREFIX``      | Wird als ``PKGNAMEPREFIX`` verwendet, um Pakete f?r unterschiedliche Python-Versionen zu trennen. Beispiel: ``py24-``                                                                                                                                                                                                 |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYTHON_SITELIBDIR``         | Verzeichnis des site-Pakete Baums, der das Installationsverzeichnis von Python (?blicherweise ``LOCALBASE``) beinhaltet. Die ``PYTHON_SITELIBDIR``-Variable kann sehr n?tzlich bei der Installation von Python-Modulen sein.                                                                                          |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYTHONPREFIX_SITELIBDIR``   | Die pr?fix-freie Variante von ``PYTHON_SITELIBDIR``. Benutzen Sie immer ``%%PYTHON_SITELIBDIR%%`` in ``pkg-plist``, wenn m?glich. Der Standardwert von ``%%PYTHON_SITELIBDIR%%`` ist ``         lib/python%%PYTHON_VERSION%%/site-packages         ``                                                                 |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYTHON_CMD``                | Kommandozeilen-Interpreter f?r Python mit Versionsnummer.                                                                                                                                                                                                                                                             |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYNUMERIC``                 | Liste der Abh?ngigkeiten f?r numerische Erweiterungen.                                                                                                                                                                                                                                                                |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYNUMPY``                   | Liste der Abh?ngigkeiten f?r die neue numerische Erweiterung numpy. (``PYNUMERIC`` ist vom Anbieter als veraltet deklariert)                                                                                                                                                                                          |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYXML``                     | Liste der Abh?ngigkeiten f?r XML-Erweiterungen (wird ab Python 2.0 nicht mehr ben?tigt, da im Basispaket enthalten).                                                                                                                                                                                                  |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_TWISTED``               | Setzt die Abh?ngigkeit des Ports von twistedCore. Die Liste der erforderlichen Komponenten kann als Wert spezifiziert werden. Beispiel: ``web lore pair flow``                                                                                                                                                        |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_ZOPE``                  | Setzt Zope, eine Plattform f?r Webanwendungen, als Abh?ngigkeit des Ports. Setzt die Versionsabh?ngigkeit von Python auf 2.3. Setzt ``ZOPEBASEDIR`` auf das Verzeichnis, in welches Zope installiert wurde.                                                                                                           |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine vollst?ndige Liste aller verf?gbaren Variablen ist in
``/usr/ports/Mk/bsd.python.mk     `` zu finden.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+--------------------------------+----------------------------------+
| `Zur?ck <using-php.html>`__?            | `Nach oben <special.html>`__   | ?\ `Weiter <using-tcl.html>`__   |
+-----------------------------------------+--------------------------------+----------------------------------+
| 6.12. Webanwendungen, Apache und PHP?   | `Zum Anfang <index.html>`__    | ?6.14. Benutzung von Tcl/Tk      |
+-----------------------------------------+--------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
