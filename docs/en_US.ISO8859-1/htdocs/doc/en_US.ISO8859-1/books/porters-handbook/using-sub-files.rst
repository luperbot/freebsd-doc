===========================================
8.5.?Making Use of SUB\_FILES and SUB\_LIST
===========================================

.. raw:: html

   <div class="navheader">

8.5.?Making Use of ``SUB_FILES`` and ``SUB_LIST``
`Prev <pkg-names.html>`__?
Chapter?8.?\ ``pkg-*``
?\ `Next <testing.html>`__

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

8.5.?Making Use of ``SUB_FILES`` and ``SUB_LIST``
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``SUB_FILES`` and ``SUB_LIST`` are useful for dynamic values in port
files, such as the installation ``PREFIX`` in ``pkg-message``.

``SUB_FILES`` specifies a list of files to be automatically modified.
Each ``file`` in the ``SUB_FILES`` list must have a corresponding
``file``.in present in ``FILESDIR``. A modified version will be created
as ``${WRKDIR}/file``. Files defined as a value of ``USE_RC_SUBR`` (or
the deprecated ``USE_RCORDER``) are automatically added to
``SUB_FILES``. For the files ``pkg-message``, ``pkg-install``, and
``pkg-deinstall``, the corresponding Makefile variable is automatically
set to point to the processed version.

``SUB_LIST`` is a list of ``VAR=VALUE`` pairs. For each pair,
``%%VAR%%`` will be replaced with ``VALUE`` in each file listed in
``SUB_FILES``. Several common pairs are automatically defined:
``PREFIX``, ``LOCALBASE``, ``DATADIR``, ``DOCSDIR``, ``EXAMPLESDIR``,
``WWWDIR``, and ``ETCDIR``. Any line beginning with ``@comment `` will
be deleted from resulting files after a variable substitution.

This example replaces ``%%ARCH%%`` with the system architecture in a
``pkg-message``:

.. code:: programlisting

    SUB_FILES=  pkg-message
    SUB_LIST=   ARCH=${ARCH}

Note that for this example, ``pkg-message.in`` must exist in
``FILESDIR``.

Example of a good ``pkg-message.in``:

.. code:: programlisting

    Now it is time to configure this package.
    Copy %%PREFIX%%/share/examples/putsy/%%ARCH%%.conf into your home directory
    as .putsy.conf and edit it.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------+--------------------------------+
| `Prev <pkg-names.html>`__?              | `Up <pkg-files.html>`__   | ?\ `Next <testing.html>`__     |
+-----------------------------------------+---------------------------+--------------------------------+
| 8.4.?Changing the Names of ``pkg-*``?   | `Home <index.html>`__     | ?Chapter?9.?Testing the Port   |
+-----------------------------------------+---------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
