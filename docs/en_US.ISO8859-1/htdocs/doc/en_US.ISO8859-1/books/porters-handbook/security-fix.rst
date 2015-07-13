=====================================
11.2.?Fixing Security Vulnerabilities
=====================================

.. raw:: html

   <div class="navheader">

11.2.?Fixing Security Vulnerabilities
`Prev <security.html>`__?
Chapter?11.?Security
?\ `Next <security-notify.html>`__

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

11.2.?Fixing Security Vulnerabilities
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While on the subject of ports and packages, a security vulnerability may
initially appear in the original distribution or in the port files. In
the former case, the original software developer is likely to release a
patch or a new version instantly. Update the port promptly with respect
to the author's fix. If the fix is delayed for some reason, either `mark
the port as ``FORBIDDEN`` <dads-noinstall.html>`__ or introduce a patch
file to the port. In the case of a vulnerable port, just fix the port as
soon as possible. In either case, follow `the standard procedure for
submitting changes <port-upgrading.html>`__ unless having rights to
commit it directly to the ports tree.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Being a ports committer is not enough to commit to an arbitrary port.
Remember that ports usually have maintainers, must be respected.

.. raw:: html

   </div>

Please make sure that the port's revision is bumped as soon as the
vulnerability has been closed. That is how the users who upgrade
installed packages on a regular basis will see they need to run an
update. Besides, a new package will be built and distributed over FTP
and WWW mirrors, replacing the vulnerable one. Bump ``PORTREVISION``
unless ``PORTVERSION`` has changed in the course of correcting the
vulnerability. That is, bump ``PORTREVISION`` if adding a patch file to
the port, but do not bump it if updating the port to the latest software
version and thus already touched ``PORTVERSION``. Please refer to the
`corresponding
section <makefile-naming.html#makefile-naming-revepoch>`__ for more
information.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+--------------------------+-----------------------------------------+
| `Prev <security.html>`__?   | `Up <security.html>`__   | ?\ `Next <security-notify.html>`__      |
+-----------------------------+--------------------------+-----------------------------------------+
| Chapter?11.?Security?       | `Home <index.html>`__    | ?11.3.?Keeping the Community Informed   |
+-----------------------------+--------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
