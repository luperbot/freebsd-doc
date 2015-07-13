=============================
12.8.?Respect Both CC and CXX
=============================

.. raw:: html

   <div class="navheader">

12.8.?Respect Both ``CC`` and ``CXX``
`Prev <dads-rational.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-cflags.html>`__

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

12.8.?Respect Both ``CC`` and ``CXX``
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The port must respect both ``CC`` and ``CXX``. What we mean by this is
that the port must not set the values of these variables absolutely,
overriding existing values; instead, it may append whatever values it
needs to the existing values. This is so that build options that affect
all ports can be set globally.

If the port does not respect these variables, please add
``NO_PACKAGE=ignores either cc or cxx`` to the ``Makefile``.

Here is an example of a ``Makefile`` respecting both ``CC`` and ``CXX``.
Note the ``?=``:

.. code:: programlisting

    CC?= gcc

.. code:: programlisting

    CXX?= g++

Here is an example which respects neither ``CC`` nor ``CXX``:

.. code:: programlisting

    CC= gcc

.. code:: programlisting

    CXX= g++

Both ``CC`` and ``CXX`` can be defined on FreeBSD systems in
``/etc/make.conf``. The first example defines a value if it was not
previously set in ``/etc/make.conf``, preserving any system-wide
definitions. The second example clobbers anything previously defined.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+------------------------------+----------------------------------+
| `Prev <dads-rational.html>`__?   | `Up <porting-dads.html>`__   | ?\ `Next <dads-cflags.html>`__   |
+----------------------------------+------------------------------+----------------------------------+
| 12.7.?Do Things Rationally?      | `Home <index.html>`__        | ?12.9.?Respect ``CFLAGS``        |
+----------------------------------+------------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
