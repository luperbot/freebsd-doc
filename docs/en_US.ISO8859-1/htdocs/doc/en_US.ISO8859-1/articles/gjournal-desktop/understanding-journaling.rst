======================================
2.?Understanding Journaling in FreeBSD
======================================

.. raw:: html

   <div class="navheader">

2.?Understanding Journaling in FreeBSD
`Prev <index.html>`__?
?
?\ `Next <reserve-space.html>`__

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

2.?Understanding Journaling in FreeBSD
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The journaling provided by GEOM in FreeBSD?7.\ *``X``* is not file
system specific (unlike for example the ext3 file system in Linux?) but
is functioning at the block level. Though this means it can be applied
to different file systems, for FreeBSD?7.0-RELEASE, it can only be used
on UFS2.

This functionality is provided by loading the ``geom_journal.ko`` module
into the kernel (or building it into a custom kernel) and using the
``gjournal`` command to configure the file systems. In general, you
would like to journal large file systems, like ``/usr``. You will need
however (see the following section) to reserve some free disk space.

When a file system is journaled, some disk space is needed to keep the
journal itself. The disk space that holds the actual data is referred to
as the *data provider*, while the one that holds the journal is referred
to as the *journal provider*. The data and journal providers need to be
on different partitions when journaling an existing (non-empty)
partition. When journaling a new partition, you have the option to use a
single provider for both data and journal. In any case, the ``gjournal``
command combines both providers to create the final journaled file
system. For example:

.. raw:: html

   <div class="itemizedlist">

-  You wish to journal your ``/usr`` file system, stored in
   ``/dev/ad0s1f`` (which already contains data).

-  You reserved some free disk space in a partition in ``/dev/ad0s1g``.

-  Using ``gjournal``, a new ``/dev/ad0s1f.journal`` device is created
   where ``/dev/ad0s1f`` is the data provider, and ``/dev/ad0s1g`` is
   the journal provider. This new device is then used for all subsequent
   file operations.

.. raw:: html

   </div>

The amount of disk space you need to reserve for the journal provider
depends on the usage load of the file system and not on the size of the
data provider. For example on a typical office desktop, a 1?GB journal
provider for the ``/usr`` file system will suffice, while a machine that
deals with heavy disk I/O (i.e. video editing) may need more. A kernel
panic will occur if the journal space is exhausted before it has a
chance to be committed.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The journal sizes suggested here, are highly unlikely to cause problems
in typical desktop use (such as web browsing, word processing and
playback of media files). If your workload includes intense disk
activity, use the following rule for maximum reliability: Your RAM size
should fit in 30% of the journal provider's space. For example, if your
system has 1?GB RAM, create an approximately 3.3?GB journal provider.
(Multiply your RAM size with 3.3 to obtain the size of the journal).

.. raw:: html

   </div>

For more information about journaling, please read the manual page of
`gjournal(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gjournal&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+-------------------------+------------------------------------------------+
| `Prev <index.html>`__?                         | ?                       | ?\ `Next <reserve-space.html>`__               |
+------------------------------------------------+-------------------------+------------------------------------------------+
| Implementing UFS Journaling on a Desktop PC?   | `Home <index.html>`__   | ?3.?Steps During the Installation of FreeBSD   |
+------------------------------------------------+-------------------------+------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
