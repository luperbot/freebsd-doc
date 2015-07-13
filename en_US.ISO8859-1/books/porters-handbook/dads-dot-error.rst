========================================
12.15.?Avoid Use of the .error Construct
========================================

.. raw:: html

   <div class="navheader">

12.15.?Avoid Use of the ``.error`` Construct
`Prev <dads-deprecated.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-sysctl.html>`__

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

12.15.?Avoid Use of the ``.error`` Construct
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The correct way for a ``Makefile`` to signal that the port cannot be
installed due to some external factor (for instance, the user has
specified an illegal combination of build options) is to set a non-blank
value to ``IGNORE``. This value will be formatted and shown to the user
by ``make install``.

It is a common mistake to use ``.error`` for this purpose. The problem
with this is that many automated tools that work with the ports tree
will fail in this situation. The most common occurrence of this is seen
when trying to build ``/usr/ports/INDEX`` (see `Section?9.1, “Running
``make describe``\ ” <testing.html#make-describe>`__). However, even
more trivial commands such as ``make maintainer`` also fail in this
scenario. This is not acceptable.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?12.1.?How to Avoid Using ``.error``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

The first of the next two ``Makefile`` snippets will cause
``make index`` to fail, while the second one will not:

.. code:: programlisting

    .error "option is not supported"

.. code:: programlisting

    IGNORE=option is not supported

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------------------------+------------------------------+----------------------------------+
| `Prev <dads-deprecated.html>`__?                                                | `Up <porting-dads.html>`__   | ?\ `Next <dads-sysctl.html>`__   |
+---------------------------------------------------------------------------------+------------------------------+----------------------------------+
| 12.14.?Marking a Port for Removal with ``DEPRECATED`` or ``EXPIRATION_DATE``?   | `Home <index.html>`__        | ?12.16.?Usage of ``sysctl``      |
+---------------------------------------------------------------------------------+------------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
