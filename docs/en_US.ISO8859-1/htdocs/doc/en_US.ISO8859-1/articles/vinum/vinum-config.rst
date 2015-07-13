====================
7.?Configuring vinum
====================

.. raw:: html

   <div class="navheader">

7.?Configuring ``vinum``
`Prev <vinum-object-naming.html>`__?
?
?\ `Next <vinum-root.html>`__

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

7.?Configuring ``vinum``
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``GENERIC`` kernel does not contain ``vinum``. It is possible to
build a custom kernel which includes ``vinum``, but this is not
recommended. The standard way to start ``vinum`` is as a kernel module.
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
is not needed because when
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
starts, it checks whether the module has been loaded, and if it is not,
it loads it automatically.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.1.?Startup
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``vinum`` stores configuration information on the disk slices in
essentially the same form as in the configuration files. When reading
from the configuration database, ``vinum`` recognizes a number of
keywords which are not allowed in the configuration files. For example,
a disk configuration might contain the following text:

.. code:: programlisting

    volume myvol state up
    volume bigraid state down
    plex name myvol.p0 state up org concat vol myvol
    plex name myvol.p1 state up org concat vol myvol
    plex name myvol.p2 state init org striped 512b vol myvol
    plex name bigraid.p0 state initializing org raid5 512b vol bigraid
    sd name myvol.p0.s0 drive a plex myvol.p0 state up len 1048576b driveoffset 265b plexoffset 0b
    sd name myvol.p0.s1 drive b plex myvol.p0 state up len 1048576b driveoffset 265b plexoffset 1048576b
    sd name myvol.p1.s0 drive c plex myvol.p1 state up len 1048576b driveoffset 265b plexoffset 0b
    sd name myvol.p1.s1 drive d plex myvol.p1 state up len 1048576b driveoffset 265b plexoffset 1048576b
    sd name myvol.p2.s0 drive a plex myvol.p2 state init len 524288b driveoffset 1048841b plexoffset 0b
    sd name myvol.p2.s1 drive b plex myvol.p2 state init len 524288b driveoffset 1048841b plexoffset 524288b
    sd name myvol.p2.s2 drive c plex myvol.p2 state init len 524288b driveoffset 1048841b plexoffset 1048576b
    sd name myvol.p2.s3 drive d plex myvol.p2 state init len 524288b driveoffset 1048841b plexoffset 1572864b
    sd name bigraid.p0.s0 drive a plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 0b
    sd name bigraid.p0.s1 drive b plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 4194304b
    sd name bigraid.p0.s2 drive c plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 8388608b
    sd name bigraid.p0.s3 drive d plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 12582912b
    sd name bigraid.p0.s4 drive e plex bigraid.p0 state initializing len 4194304b driveoff set 1573129b plexoffset 16777216b

The obvious differences here are the presence of explicit location
information and naming, both of which are allowed but discouraged, and
the information on the states. ``vinum`` does not store information
about drives in the configuration information. It finds the drives by
scanning the configured disk drives for partitions with a ``vinum``
label. This enables ``vinum`` to identify drives correctly even if they
have been assigned different UNIX? drive IDs.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.1.1.?Automatic Startup
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*Gvinum* always features an automatic startup once the kernel module is
loaded, via
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__.
To load the *Gvinum* module at boot time, add ``geom_vinum_load="YES"``
to ``/boot/loader.conf``.

When ``vinum`` is started with ``gvinum start``, ``vinum`` reads the
configuration database from one of the ``vinum`` drives. Under normal
circumstances, each drive contains an identical copy of the
configuration database, so it does not matter which drive is read. After
a crash, however, ``vinum`` must determine which drive was updated most
recently and read the configuration from this drive. It then updates the
configuration, if necessary, from progressively older drives.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+------------------------------------------------+
| `Prev <vinum-object-naming.html>`__?   | ?                       | ?\ `Next <vinum-root.html>`__                  |
+----------------------------------------+-------------------------+------------------------------------------------+
| 6.?Object Naming?                      | `Home <index.html>`__   | ?8.?Using ``vinum`` for the Root File System   |
+----------------------------------------+-------------------------+------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
