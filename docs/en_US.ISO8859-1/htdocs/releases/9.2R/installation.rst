=============================================
FreeBSD 9.2-RELEASE Installation Instructions
=============================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 9.2-RELEASE Installation Instructions
=============================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2013 The FreeBSD Documentation Project

| $FreeBSD$

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
    9.2-RELEASE and upgrading the systems running earlier releases.

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

.. raw:: html

   <div class="SECT2">

--------------

2.1 Upgrading from Source
~~~~~~~~~~~~~~~~~~~~~~~~~

The procedure for doing a source code based update is described in
http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/synching.html
and
http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook//makeworld.html.

For SVN use the ``releng/9.2`` branch which will be where any upcoming
Security Advisories or Errata Notices will be applied.

Note that CVS is **not** supported.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2 Upgrading Using “FreeBSD Update”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
utility supports binary upgrades of i386 and amd64 systems running
earlier FreeBSD releases. Systems running ``8.[34]-RELEASE``,
``9.[01]-RELEASE``, ``9.2-BETA[123]``, or ``9.2-RC[1234]`` can upgrade
as follows:

.. code:: SCREEN

    # freebsd-update fetch
    # freebsd-update install

Now the
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
utility can fetch bits belonging to 9.2-RELEASE. During this process
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
will ask for help in merging configuration files.

.. code:: SCREEN

    # freebsd-update upgrade -r 9.2-RELEASE

Due to changes in the way that FreeBSD is packaged on the release media,
two complications may arise in this process if upgrading from FreeBSD
8.x:

#. The FreeBSD kernel, which previously could appear in either
   ``/boot/kernel`` or ``/boot/GENERIC``, now only appears as
   ``/boot/kernel``. As a result, any kernel appearing in
   ``/boot/GENERIC`` will be deleted. Please carefully read the output
   printed by
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
   and confirm that an updated kernel will be placed into
   ``/boot/kernel`` before proceeding beyond this point.

#. The FreeBSD source tree in ``/usr/src`` (if present) will be deleted.
   (Normally the
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
   utility will update a source tree, but in this case the changes in
   release packaging result in the
   `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
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
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
needs to be run again to install the new userland components:

.. code:: SCREEN

    # freebsd-update install

At this point, users of systems being upgraded from FreeBSD 8.4-RELEASE
or earlier will be prompted by
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
to rebuild all third-party applications (e.g., ports installed from the
ports tree) due to updates in system libraries.

After updating installed third-party applications (and again, only if
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
printed a message indicating that this was necessary), run
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8&manpath=FreeBSD+9.2-RELEASE>`__
again so that it can delete the old (no longer used) system libraries:

.. code:: SCREEN

    # freebsd-update install

Finally, reboot into 9.2-RELEASE

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

All users of FreeBSD 9.2-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.
