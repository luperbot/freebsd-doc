=======================================
6.28.?Ports That Rely on Kernel Sources
=======================================

.. raw:: html

   <div class="navheader">

6.28.?Ports That Rely on Kernel Sources
`Prev <users-and-groups.html>`__?
Chapter?6.?Special Considerations
?\ `Next <plist.html>`__

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

6.28.?Ports That Rely on Kernel Sources
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some ports (such as kernel loadable modules) need the kernel source
files so that the port can compile. Here is the correct way to determine
if the user has them installed:

.. code:: programlisting

    USES=   kmod

Apart from this check, the ``kmod`` feature takes care of most items
that these ports need to take into account.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+------------------------------------------------+
| `Prev <users-and-groups.html>`__?   | `Up <special.html>`__   | ?\ `Next <plist.html>`__                       |
+-------------------------------------+-------------------------+------------------------------------------------+
| 6.27.?Adding Users and Groups?      | `Home <index.html>`__   | ?Chapter?7.?Advanced ``pkg-plist`` Practices   |
+-------------------------------------+-------------------------+------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
