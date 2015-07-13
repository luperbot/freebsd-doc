========================
6.6.?Using GNU Autotools
========================

.. raw:: html

   <div class="navheader">

6.6.?Using GNU Autotools
`Prev <building.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-gettext.html>`__

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

6.6.?Using GNU Autotools
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

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

6.6.1.?Introduction
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The various GNU autotools provide an abstraction mechanism for building
a piece of software over a wide variety of operating systems and machine
architectures. Within the Ports Collection, an individual port can make
use of these tools via a simple construct:

.. code:: programlisting

    USE_AUTOTOOLS=    tool[:env] ...

At the time of writing, *``tool``* can be one of ``autoconf``,
``autoheader``, ``automake``, ``aclocal``, ``libtoolize``. It can also
be one the older legacy of ``autoconf213``, ``autoheader213``,
``automake14``, ``aclocal14``.

*``env``* is used to specify that the environmental variables are
needed. It also adds a build dependency on the tool. The relevant tool
is *not* ran as part of the ``run-autotools`` target.

Multiple tools can be specified at once, either by including them all on
a single line, or using the ``+=`` Makefile construct.

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

6.6.2.?\ ``libtool`` and ``libtoolize``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ports shipping with their own copy of libtool (search for a file named
ltmain.sh) need to have ``USES=libtool``. If a port has
``USE_AUTOTOOLS=libtoolize`` it probably also needs ``USES=libtool``.
See the `USES=libtool <uses.html#uses-libtool>`__ section in
`Chapter?15, *Values of ``USES``* <uses.html>`__ for more details.

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

6.6.3.?\ ``libltdl.so``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some ports make use of the ``libltdl.so`` library package, which is part
of the ``libtool`` suite. Use of this library does not automatically
necessitate the use of ``libtool`` itself. If the port needs
``libltdl.so``, add a dependency on it:

.. code:: programlisting

    LIB_DEPENDS= libltdl.so:${PORTSDIR}/devel/libltdl

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

6.6.4.?\ ``autoconf`` and ``autoheader``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some ports do not contain a configure script, but do contain an autoconf
template in ``configure.ac``. Use these assignments to let ``autoconf``
create the configure script, and also have ``autoheader`` create
template headers for use by the configure script.

.. code:: programlisting

    USE_AUTOTOOLS=  autoconf[:env]

and

.. code:: programlisting

    USE_AUTOTOOLS=    autoheader

which also implies the use of ``autoconf``.

The additional optional variables ``AUTOCONF_ARGS`` and
``AUTOHEADER_ARGS`` can be overridden by the port ``Makefile`` if
specifically requested. Most ports are unlikely to need this. See
``bsd.autotools.mk`` for further details.

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

6.6.5.?\ ``automake`` and ``aclocal``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some packages only contain ``Makefile.am``. These have to be converted
into ``Makefile.in`` using ``automake``, and the further processed by
``configure`` to generate an actual ``Makefile``.

Similarly, packages occasionally do not ship with an included
``aclocal.m4``, again required to build the software. This can be
achieved with ``aclocal``, which scans ``configure.ac`` or
``configure.in``.

``aclocal`` has a similar relationship to ``automake`` as ``autoheader``
does to ``autoconf``, described in the previous section. ``aclocal``
implies the use of ``automake``, thus we have:

.. code:: programlisting

    USE_AUTOTOOLS=   automake[:env]

and

.. code:: programlisting

    USE_AUTOTOOLS=  aclocal

As with ``autoconf`` and ``autoheader``, both ``automake`` and
``aclocal`` have optional argument variables, ``AUTOMAKE_ARGS`` and
``ACLOCAL_ARGS`` respectively, which may be overridden by the port
``Makefile`` if required.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+------------------------------------+
| `Prev <building.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-gettext.html>`__   |
+-----------------------------+-------------------------+------------------------------------+
| 6.5.?Building Mechanisms?   | `Home <index.html>`__   | ?6.7.?Using GNU ``gettext``        |
+-----------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
