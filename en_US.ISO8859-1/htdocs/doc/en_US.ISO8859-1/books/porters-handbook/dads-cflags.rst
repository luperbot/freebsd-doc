====================
12.9.?Respect CFLAGS
====================

.. raw:: html

   <div class="navheader">

12.9.?Respect ``CFLAGS``
`Prev <dads-cc.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-feedback.html>`__

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

12.9.?Respect ``CFLAGS``
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The port must respect ``CFLAGS``. What we mean by this is that the port
must not set the value of this variable absolutely, overriding the
existing value. Instead, it may append whatever values it needs to the
existing value. This is so that build options that affect all ports can
be set globally.

If it does not, please add ``NO_PACKAGE=ignores cflags`` to the
``Makefile``.

Here is an example of a ``Makefile`` respecting ``CFLAGS``. Note the
``+=``:

.. code:: programlisting

    CFLAGS+= -Wall -Werror

Here is an example which does not respect ``CFLAGS``:

.. code:: programlisting

    CFLAGS= -Wall -Werror

``CFLAGS`` is defined on FreeBSD systems in ``/etc/make.conf``. The
first example appends additional flags to ``CFLAGS``, preserving any
system-wide definitions. The second example clobbers anything previously
defined.

Remove optimization flags from the third party ``Makefile``\ s. The
system ``CFLAGS`` contains system-wide optimization flags. An example
from an unmodified ``Makefile``:

.. code:: programlisting

    CFLAGS= -O3 -funroll-loops -DHAVE_SOUND

Using system optimization flags, the ``Makefile`` would look similar to
this example:

.. code:: programlisting

    CFLAGS+= -DHAVE_SOUND

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+------------------------------+------------------------------------+
| `Prev <dads-cc.html>`__?                 | `Up <porting-dads.html>`__   | ?\ `Next <dads-feedback.html>`__   |
+------------------------------------------+------------------------------+------------------------------------+
| 12.8.?Respect Both ``CC`` and ``CXX``?   | `Home <index.html>`__        | ?12.10.?Feedback                   |
+------------------------------------------+------------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
