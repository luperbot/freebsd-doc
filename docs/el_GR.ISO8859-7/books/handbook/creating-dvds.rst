==================================
19.6. Creating and Using DVD Media
==================================

.. raw:: html

   <div class="navheader">

19.6. Creating and Using DVD Media
`????? <creating-cds.html>`__?
???????? 19. ???????????? ????
?\ `??????? <floppies.html>`__

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

19.6. Creating and Using DVD Media
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   <div>

With inputs from Andy Polyakov.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

19.6.1. Introduction
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Compared to the CD, the DVD is the next generation of optical media
storage technology. The DVD can hold more data than any CD and is the
standard for video publishing.

Five physical recordable formats can be defined for a recordable DVD:

.. raw:: html

   <div class="itemizedlist">

-  DVD-R: This was the first DVD recordable format available. The DVD-R
   standard is defined by the `DVD
   Forum <http://www.dvdforum.com/forum.shtml>`__. This format is write
   once.

-  DVD-RW: This is the rewritable version of the DVD-R standard. A
   DVD-RW can be rewritten about 1000 times.

-  DVD-RAM: This is a rewritable format which can be seen as a removable
   hard drive. However, this media is not compatible with most DVD-ROM
   drives and DVD-Video players as only a few DVD writers support the
   DVD-RAM format. Refer to `??????19.6.9, ?Using a
   DVD-RAM? <creating-dvds.html#creating-dvd-ram>`__ for more
   information on DVD-RAM use.

-  DVD+RW: This is a rewritable format defined by the `DVD+RW
   Alliance <http://www.dvdrw.com/>`__. A DVD+RW can be rewritten about
   1000 times.

-  DVD+R: This format is the write once variation of the DVD+RW format.

.. raw:: html

   </div>

A single layer recordable DVD can hold up to 4,700,000,000?bytes which
is actually 4.38?GB or 4485?MB as 1 kilobyte is 1024 bytes.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

A distinction must be made between the physical media and the
application. For example, a DVD-Video is a specific file layout that can
be written on any recordable DVD physical media such as DVD-R, DVD+R, or
DVD-RW. Before choosing the type of media, ensure that both the burner
and the DVD-Video player are compatible with the media under
consideration.

.. raw:: html

   </div>

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

19.6.2. Configuration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To perform DVD recording, use
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__.
This command is part of the
`sysutils/dvd+rw-tools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/dvd+rw-tools/pkg-descr>`__
utilities which support all DVD media types.

These tools use the SCSI subsystem to access the devices, therefore
`ATAPI/CAM support <creating-cds.html#atapicam>`__ must be loaded or
statically compiled into the kernel. This support is not needed if the
burner uses the USB interface. Refer to `??????19.4, ?USB Storage
Devices? <usb-disks.html>`__ for more details on USB device
configuration.

DMA access must also be enabled for ATAPI devices, by adding the
following line to ``/boot/loader.conf``:

.. code:: programlisting

    hw.ata.atapi_dma="1"

Before attempting to use dvd+rw-tools, consult the `Hardware
Compatibility
Notes <http://fy.chalmers.se/~appro/linux/DVD+RW/hcn.html>`__.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

For a graphical user interface, consider using
`sysutils/k3b <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/k3b/pkg-descr>`__
which provides a user friendly interface to
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
and many other burning tools.

.. raw:: html

   </div>

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

19.6.3. Burning Data DVDs
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
is a front-end to `mkisofs <creating-cds.html#mkisofs>`__, it will
invoke
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
to create the file system layout and perform the write on the DVD. This
means that an image of the data does not need to be created before the
burning process.

To burn to a DVD+R or a DVD-R the data in ``/path/to/data``, use the
following command:

.. code:: screen

    # growisofs -dvd-compat -Z /dev/cd0 -J -R /path/to/data

In this example, ``-J -R`` is passed to
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
to create an ISO 9660 file system with Joliet and Rock Ridge extensions.
Refer to
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
for more details.

For the initial session recording, ``-Z`` is used for both single and
multiple sessions. Replace *``/dev/cd0``*, with the name of the DVD
device. Using ``-dvd-compat`` indicates that the disk will be closed and
that the recording will be unappendable. This should also provide better
media compatibility with DVD-ROM drives.

To burn a pre-mastered image, such as *``imagefile.iso``*, use:

.. code:: screen

    # growisofs -dvd-compat -Z /dev/cd0=imagefile.iso

The write speed should be detected and automatically set according to
the media and the drive being used. To force the write speed, use
``-speed=``. Refer to
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
for example usage.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

In order to support working files larger than 4.38GB, an UDF/ISO-9660
hybrid filesystem must be created by passing ``-udf -iso-level 3`` to
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
and all related programs, such as
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__.
This is required only when creating an ISO image file or when writing
files directly to a disk. Since a disk created this way must be mounted
as an UDF filesystem with
`mount\_udf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_udf&sektion=8>`__,
it will be usable only on an UDF aware operating system. Otherwise it
will look as if it contains corrupted files.

To create this type of ISO file:

.. code:: screen

    % mkisofs -R -J -udf -iso-level 3 -o imagefile.iso /path/to/data

To burn files directly to a disk:

.. code:: screen

    # growisofs -dvd-compat -udf -iso-level 3 -Z /dev/cd0 -J -R /path/to/data

When an ISO image already contains large files, no additional options
are required for
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
to burn that image on a disk.

Be sure to use an up-to-date version of
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__,
which contains
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__,
as an older version may not contain large files support. If the latest
version does not work, install
`sysutils/cdrtools-devel <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools-devel/pkg-descr>`__
and read its
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__.

.. raw:: html

   </div>

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

19.6.4. Burning a DVD-Video
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A DVD-Video is a specific file layout based on the ISO 9660 and
micro-UDF (M-UDF) specifications. Since DVD-Video presents a specific
data structure hierarchy, a particular program such as
`multimedia/dvdauthor <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/dvdauthor/pkg-descr>`__
is needed to author the DVD.

If an image of the DVD-Video file system already exists, it can be
burned in the same way as any other image. If ``dvdauthor`` was used to
make the DVD and the result is in ``/path/to/video``, the following
command should be used to burn the DVD-Video:

.. code:: screen

    # growisofs -Z /dev/cd0 -dvd-video /path/to/video

``-dvd-video`` is passed to
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
to instruct it to create a DVD-Video file system layout. This option
implies the ``-dvd-compat``
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
option.

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

19.6.5. Using a DVD+RW
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unlike CD-RW, a virgin DVD+RW needs to be formatted before first use. It
is *recommended* to let
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
take care of this automatically whenever appropriate. However, it is
possible to use ``dvd+rw-format`` to format the DVD+RW:

.. code:: screen

    # dvd+rw-format /dev/cd0

Only perform this operation once and keep in mind that only virgin
DVD+RW medias need to be formatted. Once formatted, the DVD+RW can be
burned as usual.

To burn a totally new file system and not just append some data onto a
DVD+RW, the media does not need to be blanked first. Instead, write over
the previous recording like this:

.. code:: screen

    # growisofs -Z /dev/cd0 -J -R /path/to/newdata

The DVD+RW format supports appending data to a previous recording. This
operation consists of merging a new session to the existing one as it is
not considered to be multi-session writing.
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
will *grow* the ISO 9660 file system present on the media.

For example, to append data to a DVD+RW, use the following:

.. code:: screen

    # growisofs -M /dev/cd0 -J -R /path/to/nextdata

The same
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
options used to burn the initial session should be used during next
writes.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Use ``-dvd-compat`` for better media compatibility with DVD-ROM drives.
When using DVD+RW, this option will not prevent the addition of data.

.. raw:: html

   </div>

To blank the media, use:

.. code:: screen

    # growisofs -Z /dev/cd0=/dev/zero

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

19.6.6. Using a DVD-RW
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A DVD-RW accepts two disc formats: incremental sequential and restricted
overwrite. By default, DVD-RW discs are in sequential format.

A virgin DVD-RW can be directly written without being formatted.
However, a non-virgin DVD-RW in sequential format needs to be blanked
before writing a new initial session.

To blank a DVD-RW in sequential mode:

.. code:: screen

    # dvd+rw-format -blank=full /dev/cd0

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

A full blanking using ``-blank=full`` will take about one hour on a 1x
media. A fast blanking can be performed using ``-blank``, if the DVD-RW
will be recorded in Disk-At-Once (DAO) mode. To burn the DVD-RW in DAO
mode, use the command:

.. code:: screen

    # growisofs -use-the-force-luke=dao -Z /dev/cd0=imagefile.iso

Since
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__
automatically attempts to detect fast blanked media and engage DAO
write, ``-use-the-force-luke=dao`` should not be required.

One should instead use restricted overwrite mode with any DVD-RW as this
format is more flexible than the default of incremental sequential.

.. raw:: html

   </div>

To write data on a sequential DVD-RW, use the same instructions as for
the other DVD formats:

.. code:: screen

    # growisofs -Z /dev/cd0 -J -R /path/to/data

To append some data to a previous recording, use ``-M`` with
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__.
However, if data is appended on a DVD-RW in incremental sequential mode,
a new session will be created on the disc and the result will be a
multi-session disc.

A DVD-RW in restricted overwrite format does not need to be blanked
before a new initial session. Instead, overwrite the disc with ``-Z``.
It is also possible to grow an existing ISO 9660 file system written on
the disc with ``-M``. The result will be a one-session DVD.

To put a DVD-RW in restricted overwrite format, the following command
must be used:

.. code:: screen

    # dvd+rw-format /dev/cd0

To change back to sequential format, use:

.. code:: screen

    # dvd+rw-format -blank=full /dev/cd0

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

19.6.7. Multi-Session
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Few DVD-ROM drives support multi-session DVDs and most of the time only
read the first session. DVD+R, DVD-R and DVD-RW in sequential format can
accept multiple sessions. The notion of multiple sessions does not exist
for the DVD+RW and the DVD-RW restricted overwrite formats.

Using the following command after an initial non-closed session on a
DVD+R, DVD-R, or DVD-RW in sequential format, will add a new session to
the disc:

.. code:: screen

    # growisofs -M /dev/cd0 -J -R /path/to/nextdata

Using this command with a DVD+RW or a DVD-RW in restricted overwrite
mode will append data while merging the new session to the existing one.
The result will be a single-session disc. Use this method to add data
after an initial write on these types of media.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Since some space on the media is used between each session to mark the
end and start of sessions, one should add sessions with a large amount
of data to optimize media space. The number of sessions is limited to
154 for a DVD+R, about 2000 for a DVD-R, and 127 for a DVD+R Double
Layer.

.. raw:: html

   </div>

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

19.6.8. For More Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To obtain more information about a DVD, use
``dvd+rw-mediainfo       /dev/cd0`` while the disc in the specified
drive.

More information about dvd+rw-tools can be found in
`growisofs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=growisofs&sektion=1>`__,
on the `dvd+rw-tools web
site <http://fy.chalmers.se/~appro/linux/DVD+RW/>`__, and in the
`cdwrite mailing list <http://lists.debian.org/cdwrite/>`__ archives.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

When creating a problem report related to the use of dvd+rw-tools,
always include the output of ``dvd+rw-mediainfo``.

.. raw:: html

   </div>

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

19.6.9. Using a DVD-RAM
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.6.9.1. Configuration
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DVD-RAM writers can use either a SCSI or ATAPI interface. For ATAPI
devices, DMA access has to be enabled by adding the following line to
``/boot/loader.conf``:

.. code:: programlisting

    hw.ata.atapi_dma="1"

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.6.9.2. Preparing the Media
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A DVD-RAM can be seen as a removable hard drive. Like any other hard
drive, the DVD-RAM must be formatted before it can be used. In this
example, the whole disk space will be formatted with a standard UFS2
file system:

.. code:: screen

    # dd if=/dev/zero of=/dev/acd0 bs=2k count=1
    # bsdlabel -Bw acd0
    # newfs /dev/acd0

The DVD device, ``acd0``, must be changed according to the
configuration.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.6.9.3. Using the Media
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the DVD-RAM has been formatted, it can be mounted as a normal hard
drive:

.. code:: screen

    # mount /dev/acd0 /mnt

Once mounted, the DVD-RAM will be both readable and writeable.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+------------------------------------------+
| `????? <creating-cds.html>`__?       | `???? <disks.html>`__   | ?\ `??????? <floppies.html>`__           |
+--------------------------------------+-------------------------+------------------------------------------+
| 19.5. Creating and Using CD Media?   | `???? <index.html>`__   | ?19.7. Creating and Using Floppy Disks   |
+--------------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
