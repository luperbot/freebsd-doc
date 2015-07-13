==============================================
FreeBSD 10.1-RELEASE Installation Instructions
==============================================

.. raw:: html

   <div class="article">

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

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2014 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

SPARC, SPARC64, and UltraSPARC are trademarks of SPARC International,
Inc in the United States and other countries. SPARC International, Inc
owns all of the SPARC trademarks and under licensing agreements allows
the proper use of these trademarks by its members.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

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

This article gives some brief instructions on installing FreeBSD
10.1-RELEASE and upgrading the systems running earlier releases.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

`1. Installing FreeBSD <#install>`__
`2. Upgrading FreeBSD <#upgrade>`__

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

1.?Installing FreeBSD
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``Installing       FreeBSD`` chapter of the ``FreeBSD     Handbook``
provides more in-depth information about the installation program
itself, including a guided walk-through with screenshots.

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

2.?Upgrading FreeBSD
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you are upgrading from a previous release of FreeBSD, please read
``upgrading       section in the Release Notes`` for notable
incompatibilities carefully.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Upgrading from Source
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The procedure for doing a source code based update is described in
``Synchronizing Source`` and ``Rebuilding world``.

For SVN use the ``releng/10.1`` branch which will be where any upcoming
Security Advisories or Errata Notices will be applied.

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

2.2.?Upgrading Using “FreeBSD Update”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
utility supports binary upgrades of i386 and amd64 systems running
earlier FreeBSD releases. Systems running ``8.[4]-RELEASE``,
``9.[123]-RELEASE``, ``10.0-RELEASE``, ``10.1-RC[1234]`` can upgrade as
follows:

.. code:: screen

    # freebsd-update fetch
    # freebsd-update install

Now the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
utility can fetch bits belonging to 10.1-RELEASE. During this process
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
will ask for help in merging configuration files.

.. code:: screen

    # freebsd-update upgrade -r 10.1-RELEASE

Due to changes in the way that FreeBSD is packaged on the release media,
two complications may arise in this process if upgrading from FreeBSD
8.x or 9.x:

.. raw:: html

   <div class="orderedlist">

#. The FreeBSD, which previously could appear in either ``/boot/kernel``
   or ``/boot/GENERIC``, now only appears as ``/boot/kernel``. As a
   result, any kernel appearing in ``/boot/GENERIC`` will be deleted.
   Please carefully read the output printed by
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
   and confirm that an updated kernel will be placed into
   ``/boot/kernel`` before proceeding beyond this point.

#. The FreeBSD source tree in ``/usr/src`` (if present) will be deleted.
   (Normally the
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
   utility will update a source tree, but in this case the changes in
   release packaging result in the
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
   utility not recognizing that the source tree from the old release and
   the source tree from the new release correspond to the same part of
   FreeBSD.)

.. raw:: html

   </div>

.. code:: screen

    # freebsd-update install

The system must now be rebooted with the newly installed kernel before
the non-kernel components are updated.

.. code:: screen

    # shutdown -r now

After rebooting,
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
needs to be run again to install the new userland components:

.. code:: screen

    # freebsd-update install

At this point, users of systems being upgraded from FreeBSD 9.3-RELEASE
or earlier will be prompted by
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
to rebuild all third-party applications (e.g., ports installed from the
ports tree) due to updates in system libraries.

After updating installed third-party applications (and again, only if
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
printed a message indicating that this was necessary), run
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
again so that it can delete the old (no longer used) system libraries:

.. code:: screen

    # freebsd-update install

Finally, reboot into 10.1-RELEASE

.. code:: screen

    # shutdown -r now

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This file, and other release-related documents, can be downloaded from
http://www.FreeBSD.org/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD release should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
