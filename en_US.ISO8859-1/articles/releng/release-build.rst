===================
3.?Release Building
===================

.. raw:: html

   <div class="navheader">

3.?Release Building
`Prev <release-proc.html>`__?
?
?\ `Next <distribution.html>`__

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

3.?Release Building
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD “releases” can be built by anyone with a fast machine and access
to a source repository. (That should be everyone, since we offer
Subversion access ! See the `Subversion section in the
Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/svn.html>`__
for details.) The *only* special requirement is that the
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ device
must be available. If the device is not loaded into your kernel, then
the kernel module should be automatically loaded when
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
is executed during the boot media creation phase. All of the tools
necessary to build a release are available from the Subversion
repository in ``src/release``. These tools aim to provide a consistent
way to build FreeBSD releases. A complete release can actually be built
with only a single command, including the creation of ISO images
suitable for burning to CDROM or DVD, and an FTP install directory.
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7>`__
fully documents the ``src/release/generate-release.sh`` script which is
used to build a release. ``generate-release.sh`` is a wrapper around the
Makefile target: ``make release``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Building a Release
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7>`__
documents the exact commands required to build a FreeBSD release. The
following sequences of commands can build an 9.2.0 release:

.. code:: screen

    # cd /usr/src/release

.. code:: screen

    # sh generate-release.sh release/9.2.0 /local3/release

After running these commands, all prepared release files are available
in ``/local3/release/R`` directory.

The release ``Makefile`` can be broken down into several distinct steps.

.. raw:: html

   <div class="itemizedlist">

-  Creation of a sanitized system environment in a separate directory
   hierarchy with “``make     installworld``”.

-  Checkout from Subversion of a clean version of the system source,
   documentation, and ports into the release build hierarchy.

-  Population of ``/etc`` and ``/dev`` in the chrooted environment.

-  chroot into the release build hierarchy, to make it harder for the
   outside environment to taint this build.

-  ``make world`` in the chrooted environment.

-  Build of Kerberos-related binaries.

-  Build ``GENERIC`` kernel.

-  Creation of a staging directory tree where the binary distributions
   will be built and packaged.

-  Build and installation of the documentation toolchain needed to
   convert the documentation source (SGML) into HTML and text documents
   that will accompany the release.

-  Build and installation of the actual documentation (user manuals,
   tutorials, release notes, hardware compatibility lists, and so on.)

-  Package up distribution tarballs of the binaries and sources.

-  Create FTP installation hierarchy.

-  *(optionally)* Create ISO images for CDROM/DVD media.

.. raw:: html

   </div>

For more information about the release build infrastructure, please see
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is important to remove any site-specific settings from
``/etc/make.conf``. For example, it would be unwise to distribute
binaries that were built on a system with ``CPUTYPE`` set to a specific
processor.

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

3.2.?Contributed Software (“ports”)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `FreeBSD Ports collection <http://www.FreeBSD.org/ports>`__ is a
collection of over 24,000 third-party software packages available for
FreeBSD. The Ports Management Team ``<portmgr@FreeBSD.org>`` is
responsible for maintaining a consistent ports tree that can be used to
create the binary packages that accompany official FreeBSD releases.

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

3.3.?Release ISOs
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Starting with FreeBSD?4.4, the FreeBSD Project decided to release all
four ISO images that were previously sold on the *BSDi/Wind River
Systems/FreeBSD Mall* “official” CDROM distributions. Each of the four
discs must contain a ``README.TXT`` file that explains the contents of
the disc, a ``CDROM.INF`` file that provides meta-data for the disc so
that
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
can validate and use the contents, and a ``filename.txt`` file that
provides a manifest for the disc. This *manifest* can be created with a
simple command:

.. code:: screen

    /stage/cdrom# find . -type f | sed -e 's/^\.\///' | sort > filename.txt

The specific requirements of each CD are outlined below.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.1.?Disc 1
^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first disc is almost completely created by ``make         release``.
The only changes that should be made to the ``disc1`` directory are the
addition of a ``tools`` directory, and as many popular third party
software packages as will fit on the disc. The ``tools`` directory
contains software that allow users to create installation floppies from
other operating systems. This disc should be made bootable so that users
of modern PCs do not need to create installation floppy disks.

If a custom kernel of FreeBSD is to be included, then
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
and
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7>`__
must be updated to include installation instructions. The relevant code
is contained in ``src/release`` and ``src/usr.sbin/sysinstall``.
Specifically, the file ``src/release/Makefile``, and ``dist.c``,
``dist.h``, ``menus.c``, ``install.c``, and ``Makefile`` will need to be
updated under ``src/usr.sbin/sysinstall``. Optionally, you may choose to
update ``sysinstall.8``.

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

3.3.2.?Disc 2
^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The second disc is also largely created by ``make         release``.
This disc contains a “live filesystem” that can be used from
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
to troubleshoot a FreeBSD installation. This disc should be bootable and
should also contain a compressed copy of the CVS repository in the
``CVSROOT`` directory and commercial software demos in the ``commerce``
directory.

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

3.3.3.?Multi-volume support
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sysinstall supports multiple volume package installations. This requires
that each disc have an ``INDEX`` file containing all of the packages on
all volumes of a set, along with an extra field that indicates which
volume that particular package is on. Each volume in the set must also
have the ``CD_VOLUME`` variable set in the ``cdrom.inf`` file so that
sysinstall can tell which volume is which. When a user attempts to
install a package that is not on the current disc, sysinstall will
prompt the user to insert the appropriate one.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+-----------------------------------+
| `Prev <release-proc.html>`__?   | ?                       | ?\ `Next <distribution.html>`__   |
+---------------------------------+-------------------------+-----------------------------------+
| 2.?Release Process?             | `Home <index.html>`__   | ?4.?Distribution                  |
+---------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
