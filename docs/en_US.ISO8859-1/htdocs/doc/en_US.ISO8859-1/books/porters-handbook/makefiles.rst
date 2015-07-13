===================================
Chapter?5.?Configuring the Makefile
===================================

.. raw:: html

   <div class="navheader">

Chapter?5.?Configuring the Makefile
`Prev <slow-user-input.html>`__?
?
?\ `Next <makefile-naming.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`5.1. The Original Source <makefiles.html#makefile-source>`__
`5.2. Naming <makefile-naming.html>`__
`5.3. Categorization <makefile-categories.html>`__
`5.4. The Distribution Files <makefile-distfiles.html>`__
`5.5. ``MAINTAINER`` <makefile-maintainer.html>`__
`5.6. ``COMMENT`` <makefile-comment.html>`__
`5.7. ``PORTSCOUT`` <makefile-portscout.html>`__
`5.8. Dependencies <makefile-depend.html>`__
`5.9. ``MASTERDIR`` <makefile-masterdir.html>`__
`5.10. Man Pages <makefile-manpages.html>`__
`5.11. Info Files <makefile-info.html>`__
`5.12. Makefile Options <makefile-options.html>`__
`5.13. Specifying the Working Directory <makefile-wrkdir.html>`__
`5.14. Conflict Handling <conflicts.html>`__
`5.15. Installing Files <install.html>`__

.. raw:: html

   </div>

Configuring the ``Makefile`` is pretty simple, and again we suggest
looking at existing examples before starting. Also, there is a `sample
Makefile <porting-samplem.html>`__ in this handbook, so take a look and
please follow the ordering of variables and sections in that template to
make the port easier for others to read.

Consider these problems in sequence during the design of the new
``Makefile``:

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?The Original Source
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Does it live in ``DISTDIR`` as a standard ``gzip``\ ped tarball named
something like ``foozolix-1.2.tar.gz``? If so, go on to the next step.
If not, the distribution file format might require overriding one or
more of ``DISTVERSION``, ``DISTNAME``, ``EXTRACT_CMD``,
``EXTRACT_BEFORE_ARGS``, ``EXTRACT_AFTER_ARGS``, ``EXTRACT_SUFX``, or
``DISTFILES``.

In the worst case, create a custom ``do-extract`` target to override the
default. This is rarely, if ever, necessary.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+--------------------------------------+
| `Prev <slow-user-input.html>`__?   | ?                       | ?\ `Next <makefile-naming.html>`__   |
+------------------------------------+-------------------------+--------------------------------------+
| 4.6.?Handling User Input?          | `Home <index.html>`__   | ?5.2.?Naming                         |
+------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
