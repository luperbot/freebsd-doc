=============
6.2.?Synopsis
=============

.. raw:: html

   <div class="navheader">

6.2.?Synopsis
`Prev <mac.html>`__?
Chapter?6.?The TrustedBSD MAC Framework
?\ `Next <mac-introduction.html>`__

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

6.2.?Synopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD includes experimental support for several mandatory access
control policies, as well as a framework for kernel security
extensibility, the TrustedBSD MAC Framework. The MAC Framework is a
pluggable access control framework, permitting new security policies to
be easily linked into the kernel, loaded at boot, or loaded dynamically
at run-time. The framework provides a variety of features to make it
easier to implement new security policies, including the ability to
easily tag security labels (such as confidentiality information) onto
system objects.

This chapter introduces the MAC policy framework and provides
documentation for a sample MAC policy module.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------+---------------------------------------+
| `Prev <mac.html>`__?                       | `Up <mac.html>`__       | ?\ `Next <mac-introduction.html>`__   |
+--------------------------------------------+-------------------------+---------------------------------------+
| Chapter?6.?The TrustedBSD MAC Framework?   | `Home <index.html>`__   | ?6.3.?Introduction                    |
+--------------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
