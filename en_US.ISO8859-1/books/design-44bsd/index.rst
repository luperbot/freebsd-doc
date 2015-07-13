============================================================
The Design and Implementation of the 4.4BSD Operating System
============================================================

.. raw:: html

   <div class="navheader">

The Design and Implementation of the 4.4BSD Operating System
?
?
?\ `Next <overview.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Marshall Kirk McKusick
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Keith Bostic
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Michael J. Karels
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

John S. Quarterman
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1996 Addison-Wesley Longman, Inc

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <book.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`2. Design Overview of 4.4BSD <overview.html>`__
`2.1. 4.4BSD Facilities and the
Kernel <overview.html#overview-facilities>`__
`2.2. Kernel Organization <overview-kernel-organization.html>`__
`2.3. Kernel Services <overview-kernel-service.html>`__
`2.4. Process Management <overview-process-management.html>`__
`2.5. Memory Management <overview-memory-management.html>`__
`2.6. I/O System <overview-io-system.html>`__
`2.7. Filesystems <overview-filesystem.html>`__
`2.8. Filestores <overview-filestore.html>`__
`2.9. Network Filesystem <overview-nfs.html>`__
`2.10. Terminals <overview-terminal.html>`__
`2.11. Interprocess Communication <overview-ipc.html>`__
`2.12. Network Communication <overview-network-communication.html>`__
`2.13. Network Implementation <overview-network-implementation.html>`__
`2.14. System Operation <overview-operation.html>`__
`References <overview.html#references>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-figures">

.. raw:: html

   <div class="toc-title">

List of Figures

.. raw:: html

   </div>

2.1. `Process
lifecycle <overview-process-management.html#fig-process-lifecycle>`__
2.2. `A small filesystem <overview-filesystem.html#fig-small-fs>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-tables">

.. raw:: html

   <div class="toc-title">

List of Tables

.. raw:: html

   </div>

2.1. `Machine-independent software in the 4.4BSD
kernel <overview-kernel-organization.html#table-mach-indep>`__
2.2. `Machine-dependent software for the HP300 in the 4.4BSD
kernel <overview-kernel-organization.html#table-mach-dep>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------------------+
| ?   | ?   | ?\ `Next <overview.html>`__             |
+-----+-----+-----------------------------------------+
| ?   | ?   | ?Chapter?2.?Design Overview of 4.4BSD   |
+-----+-----+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
