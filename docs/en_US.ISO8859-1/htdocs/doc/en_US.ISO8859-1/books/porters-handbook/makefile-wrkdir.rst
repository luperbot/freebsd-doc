======================================
5.13.?Specifying the Working Directory
======================================

.. raw:: html

   <div class="navheader">

5.13.?Specifying the Working Directory
`Prev <makefile-options.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <conflicts.html>`__

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

5.13.?Specifying the Working Directory
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Each port is extracted into a working directory, which must be writable.
The ports system defaults to having ``DISTFILES`` unpack in to a
directory called ``${DISTNAME}``. In other words, if the ``Makefile``
has:

.. code:: programlisting

    PORTNAME=  foo
    PORTVERSION=    1.0

then the port's distribution files contain a top-level directory,
``foo-1.0``, and the rest of the files are located under that directory.

A number of variables can be overridden if that is not the case.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.13.1.?\ ``WRKSRC``
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The variable lists the name of the directory that is created when the
application's distfiles are extracted. If our previous example extracted
into a directory called ``foo`` (and not ``foo-1.0``) write:

.. code:: programlisting

    WRKSRC=    ${WRKDIR}/foo

or possibly

.. code:: programlisting

    WRKSRC=    ${WRKDIR}/${PORTNAME}

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.13.2.?\ ``WRKSRC_SUBDIR``
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the source files needed for the port are in a subdirectory of the
extracted distribution file, set ``WRKSRC_SUBDIR`` to that directory.

.. code:: programlisting

    WRKSRC_SUBDIR= src

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.13.3.?\ ``NO_WRKSUBDIR``
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port does not extract in to a subdirectory at all, then set
``NO_WRKSUBDIR`` to indicate that.

.. code:: programlisting

    NO_WRKSUBDIR= yes

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Because ``WRKDIR`` is the only directory that is supposed to be writable
during the build, and is used to store many files recording the status
of the build, it is always better to force extraction into a
subdirectory anyway.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+--------------------------------+
| `Prev <makefile-options.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <conflicts.html>`__   |
+-------------------------------------+---------------------------+--------------------------------+
| 5.12.?Makefile Options?             | `Home <index.html>`__     | ?5.14.?Conflict Handling       |
+-------------------------------------+---------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
