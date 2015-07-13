====================================
6.?The origins of Linux and the LGPL
====================================

.. raw:: html

   <div class="navheader">

6.?The origins of Linux and the LGPL
`Prev <origins-gpl.html>`__?
?
?\ `Next <orphaning.html>`__

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

6.?The origins of Linux and the LGPL
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While the commercial Unix wars raged, the Linux kernel was developed as
a PC Unix clone. Linus Torvalds credits the existence of the GNU C
compiler and the associated GNU tools for the existence of Linux. He put
the Linux kernel under the GPL.

Remember that the GPL requires anything that statically links to any
code under the GPL also be placed under the GPL. The source for this
code must thus be made available to the user of the program. Dynamic
linking, however, is not considered a violation of the GPL. Pressure to
put proprietary applications on Linux became overwhelming. Such
applications often must link with system libraries. This resulted in a
modified version of the GPL called the
`LGPL <http://www.opensource.org/licenses/lgpl-license.php>`__
("Library", since renamed to "Lesser", GPL). The LGPL allows proprietary
code to be linked to the GNU C library, glibc. You do not have to
release the source to code which has been dynamically linked to an
LGPLed library.

If you statically link an application with glibc, such as is often
required in embedded systems, you cannot keep your application
proprietary, that is, the source must be released. Both the GPL and LGPL
require any modifications to the code directly under the license to be
released.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+------------------------------------------------------+
| `Prev <origins-gpl.html>`__?   | ?                       | ?\ `Next <orphaning.html>`__                         |
+--------------------------------+-------------------------+------------------------------------------------------+
| 5.?The origins of the GPL?     | `Home <index.html>`__   | ?7.?Open Source licenses and the Orphaning Problem   |
+--------------------------------+-------------------------+------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
