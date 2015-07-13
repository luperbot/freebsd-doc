=====================
6.25.?Using Databases
=====================

.. raw:: html

   <div class="navheader">

6.25.?Using Databases
`Prev <using-mozilla.html>`__?
Chapter?6.?Special Considerations
?\ `Next <rc-scripts.html>`__

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

6.25.?Using Databases
---------------------

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

Table?6.35.?Variables for Ports Using Databases

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable         | Means                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+==================+===========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| ``USE_BDB``      | If variable is set to ``yes``, add dependency on `databases/db5 <http://www.freebsd.org/cgi/url.cgi?ports/databases/db5/pkg-descr>`__ port. The variable may also be set to values: 48, 5 or 6. It is possible to declare a range of acceptable values, ``USE_BDB``\ =48+ will find the highest installed version, and fall back to 4.8 if nothing else is installed. ``WANT_BDB_VER`` will always build this port with a specific version of the Berkely DB. ``INVALID_BDB_VER`` can be used to specify a version that cannot be used.   |
+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_MYSQL``    | If the variable is set to ``yes``, add a dependency on the `databases/mysql56-client <http://www.freebsd.org/cgi/url.cgi?ports/databases/mysql56-client/pkg-descr>`__ port. An associated variable, ``WANT_MYSQL_VER``, may be set to values such as 51, 55, or 60. Additionally to specify use of Percona, use 56p, or for MariaDB, use 53m, 55m or 100m.                                                                                                                                                                                |
+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PGSQL``    | If set to ``yes``, add dependency on `databases/postgresql93-client <http://www.freebsd.org/cgi/url.cgi?ports/databases/postgresql93-client/pkg-descr>`__ port. An associated variable, ``WANT_PGSQL_VER``, may be set to values such as 84, 90, 91, 92, 93 or 94. It is possible to declare a minimum or maximum value; ``WANT_PGSQL_VER``\ = ``           90+`` will cause the port to depend on a minimum version of 9.0.                                                                                                              |
+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_SQLITE``   | If set to ``yes``, add dependency on `databases/sqlite3 <http://www.freebsd.org/cgi/url.cgi?ports/databases/sqlite3/pkg-descr>`__ port. The variable may also be set to 3 or 2, to add a dependency on 3.x or 2.x, respectively.                                                                                                                                                                                                                                                                                                          |
+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

More details are available in
`bsd.database.mk <http://svnweb.FreeBSD.org/ports/head/Mk/bsd.database.mk?view=markup>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+----------------------------------------------------------+
| `Prev <using-mozilla.html>`__?   | `Up <special.html>`__   | ?\ `Next <rc-scripts.html>`__                            |
+----------------------------------+-------------------------+----------------------------------------------------------+
| 6.24.?Using Mozilla?             | `Home <index.html>`__   | ?6.26.?Starting and Stopping Services (``rc`` Scripts)   |
+----------------------------------+-------------------------+----------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
