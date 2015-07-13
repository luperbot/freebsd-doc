================
5.?Some Examples
================

.. raw:: html

   <div class="navheader">

5.?Some Examples
`Prev <vinum-objects.html>`__?
?
?\ `Next <vinum-object-naming.html>`__

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

5.?Some Examples
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``vinum`` maintains a *configuration database* which describes the
objects known to an individual system. Initially, the user creates the
configuration database from one or more configuration files using
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__.
``vinum`` stores a copy of its configuration database on each disk
*device* under its control. This database is updated on each state
change, so that a restart accurately restores the state of each
``vinum`` object.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?The Configuration File
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The configuration file describes individual ``vinum`` objects. The
definition of a simple volume might be:

.. code:: programlisting

        drive a device /dev/da3h
        volume myvol
          plex org concat
            sd length 512m drive a

This file describes four ``vinum`` objects:

.. raw:: html

   <div class="itemizedlist">

-  The *drive* line describes a disk partition (*drive*) and its
   location relative to the underlying hardware. It is given the
   symbolic name *a*. This separation of symbolic names from device
   names allows disks to be moved from one location to another without
   confusion.

-  The *volume* line describes a volume. The only required attribute is
   the name, in this case *myvol*.

-  The *plex* line defines a plex. The only required parameter is the
   organization, in this case *concat*. No name is necessary as the
   system automatically generates a name from the volume name by adding
   the suffix *.p**x*, where *x* is the number of the plex in the
   volume. Thus this plex will be called *myvol.p0*.

-  The *sd* line describes a subdisk. The minimum specifications are the
   name of a drive on which to store it, and the length of the subdisk.
   No name is necessary as the system automatically assigns names
   derived from the plex name by adding the suffix *.s**x*, where *x* is
   the number of the subdisk in the plex. Thus ``vinum`` gives this
   subdisk the name *myvol.p0.s0*.

.. raw:: html

   </div>

After processing this file,
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
produces the following output:

.. code:: programlisting

          # gvinum -> create config1
          Configuration summary
          Drives:         1 (4 configured)
          Volumes:        1 (4 configured)
          Plexes:         1 (8 configured)
          Subdisks:       1 (16 configured)

        D a                     State: up       Device /dev/da3h      Avail: 2061/2573 MB (80%)

        V myvol                 State: up       Plexes:       1 Size:      512 MB

        P myvol.p0            C State: up       Subdisks:     1 Size:      512 MB

        S myvol.p0.s0           State: up       PO:        0  B Size:      512 MB

This output shows the brief listing format of
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__.
It is represented graphically in `Figure?4, “A Simple ``vinum``
Volume” <vinum-examples.html#vinum-simple-vol>`__.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?4.?A Simple ``vinum`` Volume

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|A Simple vinum Volume|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

This figure, and the ones which follow, represent a volume, which
contains the plexes, which in turn contains the subdisks. In this
example, the volume contains one plex, and the plex contains one
subdisk.

This particular volume has no specific advantage over a conventional
disk partition. It contains a single plex, so it is not redundant. The
plex contains a single subdisk, so there is no difference in storage
allocation from a conventional disk partition. The following sections
illustrate various more interesting configuration methods.

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

5.2.?Increased Resilience: Mirroring
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The resilience of a volume can be increased by mirroring. When laying
out a mirrored volume, it is important to ensure that the subdisks of
each plex are on different drives, so that a drive failure will not take
down both plexes. The following configuration mirrors a volume:

.. code:: programlisting

       drive b device /dev/da4h
        volume mirror
          plex org concat
            sd length 512m drive a
          plex org concat
            sd length 512m drive b

In this example, it was not necessary to specify a definition of drive
*a* again, since ``vinum`` keeps track of all objects in its
configuration database. After processing this definition, the
configuration looks like:

.. code:: programlisting

        Drives:         2 (4 configured)
        Volumes:        2 (4 configured)
        Plexes:         3 (8 configured)
        Subdisks:       3 (16 configured)

        D a                     State: up       Device /dev/da3h       Avail: 1549/2573 MB (60%)
        D b                     State: up       Device /dev/da4h       Avail: 2061/2573 MB (80%)

        V myvol                 State: up       Plexes:       1 Size:        512 MB
        V mirror                State: up       Plexes:       2 Size:        512 MB

        P myvol.p0            C State: up       Subdisks:     1 Size:        512 MB
        P mirror.p0           C State: up       Subdisks:     1 Size:        512 MB
        P mirror.p1           C State: initializing     Subdisks:     1 Size:        512 MB

        S myvol.p0.s0           State: up       PO:        0  B Size:        512 MB
        S mirror.p0.s0          State: up       PO:        0  B Size:        512 MB
        S mirror.p1.s0          State: empty    PO:        0  B Size:        512 MB

`Figure?5, “A Mirrored ``vinum``
Volume” <vinum-examples.html#vinum-mirrored-vol>`__ shows the structure
graphically.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?5.?A Mirrored ``vinum`` Volume

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|A Mirrored vinum Volume|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

In this example, each plex contains the full 512?MB of address space. As
in the previous example, each plex contains only a single subdisk.

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

5.3.?Optimizing Performance
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The mirrored volume in the previous example is more resistant to failure
than an unmirrored volume, but its performance is less as each write to
the volume requires a write to both drives, using up a greater
proportion of the total disk bandwidth. Performance considerations
demand a different approach: instead of mirroring, the data is striped
across as many disk drives as possible. The following configuration
shows a volume with a plex striped across four disk drives:

.. code:: programlisting

            drive c device /dev/da5h
        drive d device /dev/da6h
        volume stripe
        plex org striped 512k
          sd length 128m drive a
          sd length 128m drive b
          sd length 128m drive c
          sd length 128m drive d

As before, it is not necessary to define the drives which are already
known to ``vinum``. After processing this definition, the configuration
looks like:

.. code:: programlisting

        Drives:         4 (4 configured)
        Volumes:        3 (4 configured)
        Plexes:         4 (8 configured)
        Subdisks:       7 (16 configured)

        D a                     State: up       Device /dev/da3h        Avail: 1421/2573 MB (55%)
        D b                     State: up       Device /dev/da4h        Avail: 1933/2573 MB (75%)
        D c                     State: up       Device /dev/da5h        Avail: 2445/2573 MB (95%)
        D d                     State: up       Device /dev/da6h        Avail: 2445/2573 MB (95%)

        V myvol                 State: up       Plexes:       1 Size:        512 MB
        V mirror                State: up       Plexes:       2 Size:        512 MB
        V striped               State: up       Plexes:       1 Size:        512 MB

        P myvol.p0            C State: up       Subdisks:     1 Size:        512 MB
        P mirror.p0           C State: up       Subdisks:     1 Size:        512 MB
        P mirror.p1           C State: initializing     Subdisks:     1 Size:        512 MB
        P striped.p1            State: up       Subdisks:     1 Size:        512 MB

        S myvol.p0.s0           State: up       PO:        0  B Size:        512 MB
        S mirror.p0.s0          State: up       PO:        0  B Size:        512 MB
        S mirror.p1.s0          State: empty    PO:        0  B Size:        512 MB
        S striped.p0.s0         State: up       PO:        0  B Size:        128 MB
        S striped.p0.s1         State: up       PO:      512 kB Size:        128 MB
        S striped.p0.s2         State: up       PO:     1024 kB Size:        128 MB
        S striped.p0.s3         State: up       PO:     1536 kB Size:        128 MB

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?6.?A Striped ``vinum`` Volume

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|A Striped vinum Volume|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

This volume is represented in `Figure?6, “A Striped ``vinum``
Volume” <vinum-examples.html#vinum-striped-vol>`__. The darkness of the
stripes indicates the position within the plex address space, where the
lightest stripes come first and the darkest last.

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

5.4.?Resilience and Performance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With sufficient hardware, it is possible to build volumes which show
both increased resilience and increased performance compared to standard
UNIX? partitions. A typical configuration file might be:

.. code:: programlisting

     volume raid10
          plex org striped 512k
            sd length 102480k drive a
            sd length 102480k drive b
            sd length 102480k drive c
            sd length 102480k drive d
            sd length 102480k drive e
          plex org striped 512k
            sd length 102480k drive c
            sd length 102480k drive d
            sd length 102480k drive e
            sd length 102480k drive a
            sd length 102480k drive b

The subdisks of the second plex are offset by two drives from those of
the first plex. This helps to ensure that writes do not go to the same
subdisks even if a transfer goes over two drives.

`Figure?7, “A Mirrored, Striped ``vinum``
Volume” <vinum-examples.html#vinum-raid10-vol>`__ represents the
structure of this volume.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?7.?A Mirrored, Striped ``vinum`` Volume

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|A Mirrored, Striped vinum Volume|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+------------------------------------------+
| `Prev <vinum-objects.html>`__?   | ?                       | ?\ `Next <vinum-object-naming.html>`__   |
+----------------------------------+-------------------------+------------------------------------------+
| 4.?\ ``vinum`` Objects?          | `Home <index.html>`__   | ?6.?Object Naming                        |
+----------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |A Simple vinum Volume| image:: vinum-simple-vol.png
.. |A Mirrored vinum Volume| image:: vinum-mirrored-vol.png
.. |A Striped vinum Volume| image:: vinum-striped-vol.png
.. |A Mirrored, Striped vinum Volume| image:: vinum-raid10-vol.png
