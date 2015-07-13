=============================================
FreeBSD 9.0-RELEASE Installation Instructions
=============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 9.0-RELEASE Installation Instructions
=============================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2012 The FreeBSD Documentation Project

| $FreeBSD:
  stable/9/release/doc/en\_US.ISO8859-1/installation/article.sgml 230001
  2012-01-12 03:52:53Z hrs $

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

SPARC, SPARC64, SPARCengine, and UltraSPARC are trademarks of SPARC
International, Inc in the United States and other countries. SPARC
International, Inc owns all of the SPARC trademarks and under licensing
agreements allows the proper use of these trademarks by its members.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “®” symbol.

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This article gives some brief instructions on installing FreeBSD
    9.0-RELEASE and upgrading the systems running earlier releases.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Installing FreeBSD
--------------------

The `“Installing
FreeBSD” <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/bsdinstall.html>`__
chapter of the `FreeBSD
Handbook <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__
provides more in-depth information about the installation program
itself, including a guided walk-through with screenshots.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Upgrading FreeBSD
-------------------

If you are upgrading from a previous release of FreeBSD, please read
`upgrading section in the Release
Notes <http://www.FreeBSD.org/releases/9.0R/relnotes-detailed.html#UPGRADE>`__
for notable incompatibilities carefully.

.. raw:: html

   <div class="SECT2">

--------------

2.1 Upgrading from Source
~~~~~~~~~~~~~~~~~~~~~~~~~

The procedure for doing a source code based update is described in
http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/synching.html
and
http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook//makeworld.html.

For SVN use the ``releng/9.0`` branch which will be where any upcoming
Security Advisories or Errata Notices will be applied. The branch tag to
use for updating the source is ``RELENG_9_0`` for CVS.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Upgrading Using “FreeBSD Update”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility supports binary upgrades of i386 and amd64 systems running
earlier FreeBSD releases. Systems running ``7.[34]-RELEASE``,
``8.[12]-RELEASE``, ``9.0-BETA[123]``, or ``9.0-RC[123]`` can upgrade as
follows:

First, ensure that your current system is up to date; a change was
recently made to
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
(Errata Notice
`FreeBSD-EN-12:01.freebsd-update <http://security.FreeBSD.org/advisories/FreeBSD-EN-12:01.freebsd-update.asc>`__)
which is needed in order to upgrade to FreeBSD 9.0-RELEASE.

.. code:: SCREEN

    # freebsd-update fetch
    # freebsd-update install

Now the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
utility can fetch bits belonging to 9.0-RELEASE. During this process
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
will ask for help in merging configuration files.

.. code:: SCREEN

    # freebsd-update upgrade -r 9.0-RELEASE

Due to changes in the way that FreeBSD is packaged on the release media,
two complications may arise in this process if upgrading from FreeBSD
7.x or 8.x:

#. The FreeBSD, which previously could appear in either ``/boot/kernel``
   or ``/boot/GENERIC``, now only appears as ``/boot/kernel``. As a
   result, any kernel appearing in ``/boot/GENERIC`` will be deleted.
   Please carefully read the output printed by
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   and confirm that an updated kernel will be placed into
   ``/boot/kernel`` before proceeding beyond this point.

#. The FreeBSD source tree in ``/usr/src`` (if present) will be deleted.
   (Normally the
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utility will update a source tree, but in this case the changes in
   release packaging result in the
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
   utility not recognizing that the source tree from the old release and
   the source tree from the new release correspond to the same part of
   FreeBSD.)

.. code:: SCREEN

    # freebsd-update install

The system must now be rebooted with the newly installed kernel before
the non-kernel components are updated.

.. code:: SCREEN

    # shutdown -r now

After rebooting,
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
needs to be run again to install the new userland components:

.. code:: SCREEN

    # freebsd-update install

At this point, users of systems being upgraded from FreeBSD 8.2-RELEASE
or earlier will be prompted by
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
to rebuild all third-party applications (e.g., ports installed from the
ports tree) due to updates in system libraries.

After updating installed third-party applications (and again, only if
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
printed a message indicating that this was necessary), run
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.0-RELEASE>`__
again so that it can delete the old (no longer used) system libraries:

.. code:: SCREEN

    # freebsd-update install

Finally, reboot into 9.0-RELEASE

.. code:: SCREEN

    # shutdown -r now

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

This file, and other release-related documents, can be downloaded from
http://www.FreeBSD.org/releases/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 9.0-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
