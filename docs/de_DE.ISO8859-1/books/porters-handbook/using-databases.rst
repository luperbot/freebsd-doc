===============================
6.22. Benutzung von Datenbanken
===============================

.. raw:: html

   <div class="navheader">

6.22. Benutzung von Datenbanken
`Zur?ck <using-mozilla.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <rc-scripts.html>`__

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

6.22. Benutzung von Datenbanken
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.43. Variablen f?r Ports, die Datenbanken benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable        | Bedeutung                                                                                                                                                                                                                                                                                                                                                                                                                                      |
+=================+================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| ``USE_BDB``     | Falls die Variable auf ``yes`` gesetzt ist, f?ge eine Abh?ngigkeit von `databases/db41 <http://www.freebsd.org/cgi/url.cgi?ports/databases/db41/pkg-descr>`__ hinzu. Die Variable kann auch folgende Werte annehmen: 40, 41, 42, 43, 44, 46, 47, 48 oder 51. Sie k?nnen eine Folge akzeptierter Werte angeben - ``USE_BDB``\ =42+ stellt die h?chste installierte Version fest und greift auf 42 zur?ck, falls sonst nichts installiert ist.   |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_MYSQL``   | Falls die Variable auf ``yes`` gesetzt ist, f?ge `databases/mysql55-server <http://www.freebsd.org/cgi/url.cgi?ports/databases/mysql55-server/pkg-descr>`__ als Abh?ngigkeit hinzu. Die damit verkn?pfte Variable ``WANT_MYSQL_VER`` kann Werte wie 323, 40, 41, 50, 51, 52, 55, oder 60 annehmen.                                                                                                                                             |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PGSQL``   | Falls die Variable auf ``yes`` gesetzt ist, f?ge eine Abh?ngigkeit von `databases/postgresql84 <http://www.freebsd.org/cgi/url.cgi?ports/databases/postgresql84/pkg-descr>`__ hinzu. Die damit verkn?pfte Variable ``WANT_PGSQL_VER`` kann Werte wie 73, 74, 80, 81, 82, 83, oder 90 annehmen.                                                                                                                                                 |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Weitere Informationen zu diesem Thema finden sich in der Datei
`bsd.database.mk <http://www.freebsd.org/cgi/cvsweb.cgi/ports/Mk/bsd.database.mk>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+--------------------------------+----------------------------------------------------------+
| `Zur?ck <using-mozilla.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <rc-scripts.html>`__                          |
+------------------------------------+--------------------------------+----------------------------------------------------------+
| 6.21. Mozilla verwenden?           | `Zum Anfang <index.html>`__    | ?6.23. Starten und Anhalten von Diensten (rc Skripten)   |
+------------------------------------+--------------------------------+----------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
