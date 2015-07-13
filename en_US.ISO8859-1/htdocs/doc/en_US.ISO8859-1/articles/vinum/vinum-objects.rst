================
4.?vinum Objects
================

.. raw:: html

   <div class="navheader">

4.?\ ``vinum`` Objects
`Prev <vinum-data-integrity.html>`__?
?
?\ `Next <vinum-examples.html>`__

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

4.?\ ``vinum`` Objects
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to address these problems, ``vinum`` implements a four-level
hierarchy of objects:

.. raw:: html

   <div class="itemizedlist">

-  The most visible object is the virtual disk, called a *volume*.
   Volumes have essentially the same properties as a UNIX? disk drive,
   though there are some minor differences. For one, they have no size
   limitations.

-  Volumes are composed of *plexes*, each of which represent the total
   address space of a volume. This level in the hierarchy provides
   redundancy. Think of plexes as individual disks in a mirrored array,
   each containing the same data.

-  Since ``vinum`` exists within the UNIX? disk storage framework, it
   would be possible to use UNIX? partitions as the building block for
   multi-disk plexes. In fact, this turns out to be too inflexible as
   UNIX? disks can have only a limited number of partitions. Instead,
   ``vinum`` subdivides a single UNIX? partition, the *drive*, into
   contiguous areas called *subdisks*, which are used as building blocks
   for plexes.

-  Subdisks reside on ``vinum`` *drives*, currently UNIX? partitions.
   ``vinum`` drives can contain any number of subdisks. With the
   exception of a small area at the beginning of the drive, which is
   used for storing configuration and state information, the entire
   drive is available for data storage.

.. raw:: html

   </div>

The following sections describe the way these objects provide the
functionality required of ``vinum``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Volume Size Considerations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Plexes can include multiple subdisks spread over all drives in the
``vinum`` configuration. As a result, the size of an individual drive
does not limit the size of a plex or a volume.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.?Redundant Data Storage
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``vinum`` implements mirroring by attaching multiple plexes to a volume.
Each plex is a representation of the data in a volume. A volume may
contain between one and eight plexes.

Although a plex represents the complete data of a volume, it is possible
for parts of the representation to be physically missing, either by
design (by not defining a subdisk for parts of the plex) or by accident
(as a result of the failure of a drive). As long as at least one plex
can provide the data for the complete address range of the volume, the
volume is fully functional.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.?Which Plex Organization?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``vinum`` implements both concatenation and striping at the plex level:

.. raw:: html

   <div class="itemizedlist">

-  A *concatenated plex* uses the address space of each subdisk in turn.
   Concatenated plexes are the most flexible as they can contain any
   number of subdisks, and the subdisks may be of different length. The
   plex may be extended by adding additional subdisks. They require less
   CPU time than striped plexes, though the difference in CPU overhead
   is not measurable. On the other hand, they are most susceptible to
   hot spots, where one disk is very active and others are idle.

-  A *striped plex* stripes the data across each subdisk. The subdisks
   must all be the same size and there must be at least two subdisks in
   order to distinguish it from a concatenated plex. The greatest
   advantage of striped plexes is that they reduce hot spots. By
   choosing an optimum sized stripe, about 256?kB, the load can be
   evened out on the component drives. Extending a plex by adding new
   subdisks is so complicated that ``vinum`` does not implement it.

.. raw:: html

   </div>

`Table?1, “\ ``vinum`` Plex
Organizations” <vinum-objects.html#vinum-comparison>`__ summarizes the
advantages and disadvantages of each plex organization.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?1.?\ ``vinum`` Plex Organizations

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------+--------------------+--------------------+----------------------+----------------------------------------------------------------------------------+
| Plex type      | Minimum subdisks   | Can add subdisks   | Must be equal size   | Application                                                                      |
+================+====================+====================+======================+==================================================================================+
| concatenated   | 1                  | yes                | no                   | Large data storage with maximum placement flexibility and moderate performance   |
+----------------+--------------------+--------------------+----------------------+----------------------------------------------------------------------------------+
| striped        | 2                  | no                 | yes                  | High performance in combination with highly concurrent access                    |
+----------------+--------------------+--------------------+----------------------+----------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+-------------------------------------+
| `Prev <vinum-data-integrity.html>`__?   | ?                       | ?\ `Next <vinum-examples.html>`__   |
+-----------------------------------------+-------------------------+-------------------------------------+
| 3.?Data Integrity?                      | `Home <index.html>`__   | ?5.?Some Examples                   |
+-----------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
