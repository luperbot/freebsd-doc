=====================================================================
12.14.?Marking a Port for Removal with DEPRECATED or EXPIRATION\_DATE
=====================================================================

.. raw:: html

   <div class="navheader">

12.14.?Marking a Port for Removal with ``DEPRECATED`` or
``EXPIRATION_DATE``
`Prev <dads-noinstall.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-dot-error.html>`__

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

12.14.?Marking a Port for Removal with ``DEPRECATED`` or ``EXPIRATION_DATE``
----------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Do remember that ``BROKEN`` and ``FORBIDDEN`` are to be used as a
temporary resort if a port is not working. Permanently broken ports will
be removed from the tree entirely.

When it makes sense to do so, users can be warned about a pending port
removal with ``DEPRECATED`` and ``EXPIRATION_DATE``. The former is a
string stating why the port is scheduled for removal; the latter is a
string in ISO 8601 format (YYYY-MM-DD). Both will be shown to the user.

It is possible to set ``DEPRECATED`` without an ``EXPIRATION_DATE`` (for
instance, recommending a newer version of the port), but the converse
does not make any sense.

There is no set policy on how much notice to give. Current practice
seems to be one month for security-related issues and two months for
build issues. This also gives any interested committers a little time to
fix the problems.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------------------------------------------+------------------------------+-------------------------------------------------+
| `Prev <dads-noinstall.html>`__?                                                        | `Up <porting-dads.html>`__   | ?\ `Next <dads-dot-error.html>`__               |
+----------------------------------------------------------------------------------------+------------------------------+-------------------------------------------------+
| 12.13.?Marking a Port Not Installable with ``BROKEN``, ``FORBIDDEN``, or ``IGNORE``?   | `Home <index.html>`__        | ?12.15.?Avoid Use of the ``.error`` Construct   |
+----------------------------------------------------------------------------------------+------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
