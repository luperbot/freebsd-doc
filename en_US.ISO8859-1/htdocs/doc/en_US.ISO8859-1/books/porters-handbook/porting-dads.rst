==========================
Chapter?12.?Dos and Don'ts
==========================

.. raw:: html

   <div class="navheader">

Chapter?12.?Dos and Don'ts
`Prev <security-notify.html>`__?
?
?\ `Next <porting-wrkdir.html>`__

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

`12.1. Introduction <porting-dads.html#dads-intro>`__
`12.2. ``WRKDIR`` <porting-wrkdir.html>`__
`12.3. ``WRKDIRPREFIX`` <porting-wrkdirprefix.html>`__
`12.4. Differentiating Operating Systems and OS
Versions <porting-versions.html>`__
`12.5. Writing Something After
``bsd.port.mk`` <dads-after-port-mk.html>`__
`12.6. Use the ``exec`` Statement in Wrapper
Scripts <dads-sh-exec.html>`__
`12.7. Do Things Rationally <dads-rational.html>`__
`12.8. Respect Both ``CC`` and ``CXX`` <dads-cc.html>`__
`12.9. Respect ``CFLAGS`` <dads-cflags.html>`__
`12.10. Feedback <dads-feedback.html>`__
`12.11. ``README.html`` <dads-readme.html>`__
`12.12. Marking a Port as Architecture
Neutral <dads-arch-neutral.html>`__
`12.13. Marking a Port Not Installable with ``BROKEN``, ``FORBIDDEN``,
or ``IGNORE`` <dads-noinstall.html>`__
`12.14. Marking a Port for Removal with ``DEPRECATED`` or
``EXPIRATION_DATE`` <dads-deprecated.html>`__
`12.15. Avoid Use of the ``.error`` Construct <dads-dot-error.html>`__
`12.16. Usage of ``sysctl`` <dads-sysctl.html>`__
`12.17. Rerolling Distfiles <dads-rerolling-distfiles.html>`__
`12.18. Avoiding Linuxisms <dads-avoiding-linuxisms.html>`__
`12.19. Miscellanea <dads-misc.html>`__

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

12.1.?Introduction
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here is a list of common dos and don'ts that are encountered during the
porting process. Check the port against this list, but also check ports
in the `PR database <https://bugs.FreeBSD.org/search/>`__ that others
have submitted. Submit any comments on ports as described in `Bug
Reports and General
Commentary <../../../../doc/en_US.ISO8859-1/articles/contributing/contrib-how.html#CONTRIB-GENERAL>`__.
Checking ports in the PR database will both make it faster for us to
commit them, and prove that you know what you are doing.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+-------------------------------------+
| `Prev <security-notify.html>`__?        | ?                       | ?\ `Next <porting-wrkdir.html>`__   |
+-----------------------------------------+-------------------------+-------------------------------------+
| 11.3.?Keeping the Community Informed?   | `Home <index.html>`__   | ?12.2.?\ ``WRKDIR``                 |
+-----------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
