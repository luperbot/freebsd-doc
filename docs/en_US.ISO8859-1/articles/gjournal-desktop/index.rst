===========================================
Implementing UFS Journaling on a Desktop PC
===========================================

.. raw:: html

   <div class="navheader">

Implementing UFS Journaling on a Desktop PC
?
?
?\ `Next <understanding-journaling.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="en" lang="en">

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Manolis Kiagias
~~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<manolis@FreeBSD.org>``

.. raw:: html

   </div>

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

Copyright ? 2008 Manolis Kiagias

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

A journaling file system uses a log to record all transactions that take
place in the file system, and preserves its integrity in the event of a
system crash or power failure. Although it is still possible to lose
unsaved changes to files, journaling almost completely eliminates the
possibility of file system corruption caused by an unclean shutdown. It
also shortens to a minimum the time required for after-failure file
system checking. Although the UFS file system employed by FreeBSD does
not implement journaling itself, the new journal class of the GEOM
framework in FreeBSD?7.\ *``X``* can be used to provide file system
independent journaling. This article explains how to implement UFS
journaling on a typical desktop PC scenario.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

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

`1. Introduction <index.html#introduction>`__
`2. Understanding Journaling in
FreeBSD <understanding-journaling.html>`__
`3. Steps During the Installation of FreeBSD <reserve-space.html>`__
`4. Setting Up Journaling <configure-journal.html>`__
`5. Troubleshooting Journaling <troubleshooting-gjournal.html>`__
`6. Further Reading <further-reading.html>`__

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

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While professional servers are usually well protected from unforeseen
shutdowns, the typical desktop is at the mercy of power failures,
accidental resets, and other user related incidents that can lead to
unclean shutdowns. Soft Updates usually protect the file system
efficiently in such cases, although most of the times a lengthy
background check is required. On rare occasions, file system corruption
reaches a point where user intervention is required and data may be
lost.

The new journaling capability provided by GEOM can greatly assist in
such scenarios, by virtually eliminating the time required for file
system checking, and ensuring that the file system is quickly restored
to a consistent state.

This article describes a procedure for implementing UFS journaling on a
typical desktop PC scenario (one hard disk used for both operating
system and data). It should be followed during a fresh installation of
FreeBSD. The steps are simple enough and do not require overly complex
interaction with the command line.

After reading this article, you will know:

.. raw:: html

   <div class="itemizedlist">

-  How to reserve space for journaling during a new installation of
   FreeBSD.

-  How to load and enable the ``geom_journal`` module (or build support
   for it in your custom kernel).

-  How to convert your existing file systems to utilize journaling, and
   what options to use in ``/etc/fstab`` to mount them.

-  How to implement journaling in new (empty) partitions.

-  How to troubleshoot common problems associated with journaling.

.. raw:: html

   </div>

Before reading this article, you should be able to:

.. raw:: html

   <div class="itemizedlist">

-  Understand basic UNIX? and FreeBSD concepts.

-  Be familiar with the installation procedure of FreeBSD and the
   sysinstall utility.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

The procedure described here is intended for preparing a new
installation where no actual user data is stored on the disk yet. While
it is possible to modify and extend this procedure for systems already
in production, you should *backup* all important data before doing so.
Messing around with disks and partitions at a low level can lead to
fatal mistakes and data loss.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------------------------+
| ?   | ?   | ?\ `Next <understanding-journaling.html>`__   |
+-----+-----+-----------------------------------------------+
| ?   | ?   | ?2.?Understanding Journaling in FreeBSD       |
+-----+-----+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
