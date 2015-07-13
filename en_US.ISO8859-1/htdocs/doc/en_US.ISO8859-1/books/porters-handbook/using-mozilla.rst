===================
6.24.?Using Mozilla
===================

.. raw:: html

   <div class="navheader">

6.24.?Using Mozilla
`Prev <using-xfce.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-databases.html>`__

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

6.24.?Using Mozilla
-------------------

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

Table?6.34.?Variables for Ports That Use Mozilla

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_GECKO``               | Gecko backend the port can handle. Possible values: ``libxul`` (``libxul.so``), ``seamonkey`` (``libgtkembedmoz.so``, deprecated, must not be used any more).                                             |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_FIREFOX``             | The port requires Firefox as a runtime dependency. Possible values: ``yes`` (get default version), ``40``, ``36``, ``35``. Default dependency is on version ``40``.                                       |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_FIREFOX_BUILD``       | The port requires Firefox as a buildtime dependency. Possible values: see USE\_FIREFOX. This automatically sets USE\_FIREFOX and assigns the same value.                                                  |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_SEAMONKEY``           | The port requires SeaMonkey as a runtime dependency. Possible values: ``yes`` (get default version), ``20``, ``11`` (deprecated, must not be used any more). Default dependency is on version ``20``.     |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_SEAMONKEY_BUILD``     | The port requires SeaMonkey as a buildtime dependency. Possible values: see USE\_SEAMONKEY. This automatically sets USE\_SEAMONKEY and assigns the same value.                                            |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_THUNDERBIRD``         | The port requires Thunderbird as a runtime dependency. Possible values: ``yes`` (get default version), ``31``, ``30`` (deprecated, must not be used any more). Default dependency is on version ``31``.   |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_THUNDERBIRD_BUILD``   | The port requires Thunderbird as a buildtime dependency. Possible values: see USE\_THUNDERBIRD. This automatically sets USE\_THUNDERBIRD and assigns the same value.                                      |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

A complete list of available variables can be found in
``/usr/ports/Mk/bsd.gecko.mk``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+--------------------------------------+
| `Prev <using-xfce.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-databases.html>`__   |
+-------------------------------+-------------------------+--------------------------------------+
| 6.23.?Using Xfce?             | `Home <index.html>`__   | ?6.25.?Using Databases               |
+-------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
