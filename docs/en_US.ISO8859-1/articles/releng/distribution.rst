===============
4.?Distribution
===============

.. raw:: html

   <div class="navheader">

4.?Distribution
`Prev <release-build.html>`__?
?
?\ `Next <extensibility.html>`__

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

4.?Distribution
---------------

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

4.1.?FTP Sites
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When the release has been thoroughly tested and packaged for
distribution, the master FTP site must be updated. The official FreeBSD
public FTP sites are all mirrors of a master server that is open only to
other FTP sites. This site is known as ``ftp-master``. When the release
is ready, the following files must be modified on ``ftp-master``:

.. raw:: html

   <div class="variablelist">

``/pub/FreeBSD/releases/arch``/*``X.Y``*-RELEASE/
    The installable FTP directory as output from
    ``make           release``.

``/pub/FreeBSD/ports/arch``/packages-*``X.Y``*-release/
    The complete package build for this release.

``/pub/FreeBSD/releases/arch``/*``X.Y``*-RELEASE/tools
    A symlink to ``../../../tools``.

``/pub/FreeBSD/releases/arch``/*``X.Y``*-RELEASE/packages
    A symlink to ``../../../ports/arch``/packages-*``X.Y``*-release.

``/pub/FreeBSD/releases/arch``/ISO-IMAGES/*``X.Y``*/*``X.Y``*-RELEASE-*``arch``*-\*.iso
    The ISO images. The “\*” is ``disc1``, ``disc2``, etc. Only if there
    is a ``disc1`` and there is an alternative first installation CD
    (for example a stripped-down install with no windowing system) there
    may be a ``mini`` as well.

.. raw:: html

   </div>

For more information about the distribution mirror architecture of the
FreeBSD FTP sites, please see the `Mirroring
FreeBSD <../../../../doc/en_US.ISO8859-1/articles/hubs/>`__ article.

It may take many hours to two days after updating ``ftp-master`` before
a majority of the Tier-1 FTP sites have the new software depending on
whether or not a package set got loaded at the same time. It is
imperative that the release engineers coordinate with the `FreeBSD
mirror site
administrators <http://lists.FreeBSD.org/mailman/listinfo/mirror-announce>`__
before announcing the general availability of new software on the FTP
sites. Ideally the release package set should be loaded at least four
days prior to release day. The release bits should be loaded between 24
and 48 hours before the planned release time with “other” file
permissions turned off. This will allow the mirror sites to download it
but the general public will not be able to download it from the mirror
sites. Mail should be sent to `FreeBSD mirror site
administrators <http://lists.FreeBSD.org/mailman/listinfo/mirror-announce>`__
at the time the release bits get posted saying the release has been
staged and giving the time that the mirror sites should begin allowing
access. Be sure to include a time zone with the time, for example make
it relative to GMT.

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

4.2.?CD-ROM Replication
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Coming soon: Tips for sending FreeBSD ISOs to a replicator and quality
assurance measures to be taken.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+------------------------------------+
| `Prev <release-build.html>`__?   | ?                       | ?\ `Next <extensibility.html>`__   |
+----------------------------------+-------------------------+------------------------------------+
| 3.?Release Building?             | `Home <index.html>`__   | ?5.?Extensibility                  |
+----------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
