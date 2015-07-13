=============================================
FreeBSD 8.3-RELEASE Installation Instructions
=============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 8.3-RELEASE Installation Instructions
=============================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2012 The FreeBSD Documentation Project

| $FreeBSD:
  stable/8/release/doc/en\_US.ISO8859-1/installation/article.sgml 234413
  2012-04-18 08:15:55Z hrs $

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
    8.3-RELEASE and upgrading the systems running earlier releases.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Installing FreeBSD
--------------------

For instructions on installing FreeBSD, please see Chapter 2 of The
FreeBSD Handbook. It provides a complete installation walk-through for
users new to FreeBSD, and can be found online at:
http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/install.html

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Upgrading FreeBSD
-------------------

.. raw:: html

   <div class="SECT2">

2.1 Upgrading from Source
~~~~~~~~~~~~~~~~~~~~~~~~~

The procedure for doing a source code based update is described in
http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/synching.html
and
http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook//makeworld.html.

The branch tag to use for updating the source is ``RELENG_8_3`` for CVS.
For SVN use ``releng/8.3``.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Upgrading Using “FreeBSD Update”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
utility supports binary upgrades of i386 and amd64 systems running
earlier FreeBSD releases. Systems running ``7.[01234]-RELEASE``,
``8.[012]-RELEASE``, ``8.3-BETA1``, or ``8.3-RC[12]`` can upgrade as
follows:

.. code:: SCREEN

    # freebsd-update upgrade -r 8.3-RELEASE

During this process, FreeBSD Update may ask the user to help by merging
some configuration files or by confirming that the automatically
performed merging was done correctly.

.. code:: SCREEN

    # freebsd-update install

The system must be rebooted with the newly installed kernel before
continuing.

.. code:: SCREEN

    # shutdown -r now

After rebooting,
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
needs to be run again to install the new userland components:

.. code:: SCREEN

    # freebsd-update install

At this point, users of systems being upgraded from FreeBSD 7.4-RELEASE
or earlier will be prompted by freebsd-update to rebuild all third-party
applications (e.g., ports installed from the ports tree) due to updates
in system libraries.

After updating installed third-party applications (and again, only if
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
printed a message indicating that this was necessary), run
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+8.2-RELEASE>`__
again so that it can delete the old (no longer used) system libraries:

.. code:: SCREEN

    # freebsd-update install

Finally, reboot into 8.3-RELEASE

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
ftp://ftp.FreeBSD.org/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
