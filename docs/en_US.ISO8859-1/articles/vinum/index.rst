========================
The vinum Volume Manager
========================

.. raw:: html

   <div class="navheader">

The ``vinum`` Volume Manager
?
?
?\ `Next <vinum-access-bottlenecks.html>`__

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

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Greg Lehey
~~~~~~~~~~

Originally written by ?

.. raw:: html

   </div>

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

`1. Synopsis <index.html#vinum-synopsis>`__
`2. Access Bottlenecks <vinum-access-bottlenecks.html>`__
`3. Data Integrity <vinum-data-integrity.html>`__
`4. ``vinum`` Objects <vinum-objects.html>`__
`5. Some Examples <vinum-examples.html>`__
`6. Object Naming <vinum-object-naming.html>`__
`7. Configuring ``vinum`` <vinum-config.html>`__
`8. Using ``vinum`` for the Root File System <vinum-root.html>`__

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

1.?Synopsis
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

No matter the type of disks, there are always potential problems. The
disks can be too small, too slow, or too unreliable to meet the system's
requirements. While disks are getting bigger, so are data storage
requirements. Often a file system is needed that is bigger than a disk's
capacity. Various solutions to these problems have been proposed and
implemented.

One method is through the use of multiple, and sometimes redundant,
disks. In addition to supporting various cards and controllers for
hardware Redundant Array of Independent Disks RAID systems, the base
FreeBSD system includes the ``vinum`` volume manager, a block device
driver that implements virtual disk drives and addresses these three
problems. ``vinum`` provides more flexibility, performance, and
reliability than traditional disk storage and implements RAID-0, RAID-1,
and RAID-5 models, both individually and in combination.

This chapter provides an overview of potential problems with traditional
disk storage, and an introduction to the ``vinum`` volume manager.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Starting with FreeBSD?5, ``vinum`` has been rewritten in order to fit
into the `GEOM
architecture <../../../../doc/en_US.ISO8859-1/books/handbook/geom.html>`__,
while retaining the original ideas, terminology, and on-disk metadata.
This rewrite is called *gvinum* (for *GEOM vinum*). While this chapter
uses the term ``vinum``, any command invocations should be performed
with ``gvinum``. The name of the kernel module has changed from the
original ``vinum.ko`` to ``geom_vinum.ko``, and all device nodes reside
under ``/dev/gvinum`` instead of ``/dev/vinum``. As of FreeBSD?6, the
original ``vinum`` implementation is no longer available in the code
base.

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
| ?   | ?   | ?\ `Next <vinum-access-bottlenecks.html>`__   |
+-----+-----+-----------------------------------------------+
| ?   | ?   | ?2.?Access Bottlenecks                        |
+-----+-----+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
