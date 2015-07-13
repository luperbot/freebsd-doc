=================
6.3.?Introduction
=================

.. raw:: html

   <div class="navheader">

6.3.?Introduction
`Prev <mac-synopsis.html>`__?
Chapter?6.?The TrustedBSD MAC Framework
?\ `Next <mac-background.html>`__

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

6.3.?Introduction
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The TrustedBSD MAC framework provides a mechanism to allow the
compile-time or run-time extension of the kernel access control model.
New system policies may be implemented as kernel modules and linked to
the kernel; if multiple policy modules are present, their results will
be composed. The MAC Framework provides a variety of access control
infrastructure services to assist policy writers, including support for
transient and persistent policy-agnostic object security labels. This
support is currently considered experimental.

This chapter provides information appropriate for developers of policy
modules, as well as potential consumers of MAC-enabled environments, to
learn about how the MAC Framework supports access control extension of
the kernel.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+-------------------------------------+
| `Prev <mac-synopsis.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-background.html>`__   |
+---------------------------------+-------------------------+-------------------------------------+
| 6.2.?Synopsis?                  | `Home <index.html>`__   | ?6.4.?Policy Background             |
+---------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
