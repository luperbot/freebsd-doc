=================
1.8.?loader Stage
=================

.. raw:: html

   <div class="navheader">

1.8.?loader Stage
`Prev <boot2.html>`__?
Chapter?1.?Bootstrapping and Kernel Initialization
?\ `Next <boot-kernel.html>`__

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

1.8.?loader Stage
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

loader is a BTX client as well. I will not describe it here in detail,
there is a comprehensive manpage written by Mike Smith,
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__.
The underlying mechanisms and BTX were discussed above.

The main task for the loader is to boot the kernel. When the kernel is
loaded into memory, it is being called by the loader:

.. code:: programlisting

    sys/boot/common/boot.c:
        /* Call the exec handler from the loader matching the kernel */
        module_formats[km->m_loader]->l_exec(km);

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+----------------------------------+
| `Prev <boot2.html>`__?   | `Up <boot.html>`__      | ?\ `Next <boot-kernel.html>`__   |
+--------------------------+-------------------------+----------------------------------+
| 1.7.?boot2 Stage?        | `Home <index.html>`__   | ?1.9.?Kernel Initialization      |
+--------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
