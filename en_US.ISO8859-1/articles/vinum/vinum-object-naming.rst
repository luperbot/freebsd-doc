================
6.?Object Naming
================

.. raw:: html

   <div class="navheader">

6.?Object Naming
`Prev <vinum-examples.html>`__?
?
?\ `Next <vinum-config.html>`__

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

6.?Object Naming
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``vinum`` assigns default names to plexes and subdisks, although they
may be overridden. Overriding the default names is not recommended as it
does not bring a significant advantage and it can cause confusion.

Names may contain any non-blank character, but it is recommended to
restrict them to letters, digits and the underscore characters. The
names of volumes, plexes, and subdisks may be up to 64 characters long,
and the names of drives may be up to 32 characters long.

``vinum`` objects are assigned device nodes in the hierarchy
``/dev/gvinum``. The configuration shown above would cause ``vinum`` to
create the following device nodes:

.. raw:: html

   <div class="itemizedlist">

-  Device entries for each volume. These are the main devices used by
   ``vinum``. The configuration above would include the devices
   ``/dev/gvinum/myvol``, ``/dev/gvinum/mirror``,
   ``/dev/gvinum/striped``, ``/dev/gvinum/raid5`` and
   ``/dev/gvinum/raid10``.

-  All volumes get direct entries under ``/dev/gvinum/``.

-  The directories ``/dev/gvinum/plex``, and ``/dev/gvinum/sd``, which
   contain device nodes for each plex and for each subdisk,
   respectively.

.. raw:: html

   </div>

For example, consider the following configuration file:

.. code:: programlisting

     drive drive1 device /dev/sd1h
        drive drive2 device /dev/sd2h
        drive drive3 device /dev/sd3h
        drive drive4 device /dev/sd4h
        volume s64 setupstate
          plex org striped 64k
            sd length 100m drive drive1
            sd length 100m drive drive2
            sd length 100m drive drive3
            sd length 100m drive drive4

After processing this file,
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
creates the following structure in ``/dev/gvinum``:

.. code:: programlisting

     drwxr-xr-x  2 root  wheel       512 Apr 13
    16:46 plex
        crwxr-xr--  1 root  wheel   91,   2 Apr 13 16:46 s64
        drwxr-xr-x  2 root  wheel       512 Apr 13 16:46 sd

        /dev/vinum/plex:
        total 0
        crwxr-xr--  1 root  wheel   25, 0x10000002 Apr 13 16:46 s64.p0

        /dev/vinum/sd:
        total 0
        crwxr-xr--  1 root  wheel   91, 0x20000002 Apr 13 16:46 s64.p0.s0
        crwxr-xr--  1 root  wheel   91, 0x20100002 Apr 13 16:46 s64.p0.s1
        crwxr-xr--  1 root  wheel   91, 0x20200002 Apr 13 16:46 s64.p0.s2
        crwxr-xr--  1 root  wheel   91, 0x20300002 Apr 13 16:46 s64.p0.s3

Although it is recommended that plexes and subdisks should not be
allocated specific names, ``vinum`` drives must be named. This makes it
possible to move a drive to a different location and still recognize it
automatically. Drive names may be up to 32 characters long.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.1.?Creating File Systems
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Volumes appear to the system to be identical to disks, with one
exception. Unlike UNIX? drives, ``vinum`` does not partition volumes,
which thus do not contain a partition table. This has required
modification to some disk utilities, notably
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__,
so that it does not try to interpret the last letter of a ``vinum``
volume name as a partition identifier. For example, a disk drive may
have a name like ``/dev/ad0a`` or ``/dev/da2h``. These names represent
the first partition (``a``) on the first (0) IDE disk (``ad``) and the
eighth partition (``h``) on the third (2) SCSI disk (``da``)
respectively. By contrast, a ``vinum`` volume might be called
``/dev/gvinum/concat``, which has no relationship with a partition name.

In order to create a file system on this volume, use
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__:

.. code:: screen

    # newfs /dev/gvinum/concat

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+-----------------------------------+
| `Prev <vinum-examples.html>`__?   | ?                       | ?\ `Next <vinum-config.html>`__   |
+-----------------------------------+-------------------------+-----------------------------------+
| 5.?Some Examples?                 | `Home <index.html>`__   | ?7.?Configuring ``vinum``         |
+-----------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
