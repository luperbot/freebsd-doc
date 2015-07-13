==========================
FreeBSD 4.8-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.8-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.1.2.113 2003/10/06 04:21:21 bmah Exp $

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 4.8-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 4.8-RELEASE will be maintained
    until the release of FreeBSD 4.9-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This errata document contains \`\`late-breaking news'' about FreeBSD
4.8-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the \`\`current errata'' for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 4-STABLE also contain up-to-date
copies of this document (as of the time of the snapshot).

For a list of all FreeBSD CERT security advisories, see
http://www.FreeBSD.org/security/ or
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2 Security Advisories
=====================

A buffer overflow in header parsing exists in older versions of
**sendmail**. It could allow a remote attacker to create a
specially-crafted message that may cause
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.8-stable>`__
to execute arbitrary code with the privileges of the user running it,
typically ``root``. More information, including pointers to patches, can
be found in security advisory
`FreeBSD-SA-03:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:07.sendmail.asc>`__.
This problem was corrected for FreeBSD 4.8-RELEASE with a vendor patch
and was corrected for FreeBSD 4.9-RC with the import of a new version of
**sendmail**. However, these changes may not otherwise have been noted
in the release documentation.

The implementation of the
`realpath(3) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=3&manpath=FreeBSD+4.8-stable>`__
function contains a single-byte buffer overflow bug. This may have
various impacts, depending on the application using
`realpath(3) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=3&manpath=FreeBSD+4.8-stable>`__
and other factors. This bug has been fixed on the 4.8-RELEASE security
fix branch and the 4-STABLE development branch. For more information,
see security advisory
`FreeBSD-SA-03:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:08.realpath.asc>`__.

The kernel contains a bug that could allow it to attempt delivery of
invalid signals, leading to a kernel panic. This bug has been fixed on
the 4-STABLE development branch and the 4.8-RELEASE security fix branch.
For more information, see security advisory
`FreeBSD-SA-03:09 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:09.signal.asc>`__.

A bug in the iBCS2 emulation module could result in disclosing the
contents of kernel memory. (Note that this module is not enabled in
FreeBSD by default.) This bug has been fixed on the 4-STABLE development
branch and the 4.8-RELEASE security fix branch. More information can be
found in security advisory
`FreeBSD-SA-03:10 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:10.ibcs2.asc>`__.

A programming error in the **sendmail** implementation of its \`\`DNS
maps'' feature could lead to a
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.8-stable>`__
child process crashing or behaving incorrectly. This error has been
fixed with a patch on the 4.8-RELEASE security fix branch and with the
import of a new version of **sendmail** on the 4-STABLE development
branch. (Note that the DNS maps feature is not used by the default
configuration files shipped with FreeBSD.) More information can be found
in security advisory
`FreeBSD-SA-03:11 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:11.sendmail.asc>`__.

**OpenSSH** contains a bug in its buffer management code that could
potentially cause it to crash. This bug has been fixed via a
vendor-supplied patch on the 4-STABLE development branch and the
4.8-RELEASE security fix branch. For more details, refer to security
advisory
`FreeBSD-SA-03:12 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:12.openssh.asc>`__.

**sendmail** contains a remotely-exploitable buffer overflow. This bug
has been fixed via a vendor-supplied patch on the 4-STABLE development
branch and the 4.8-RELEASE security fix branch. More details can be
found in security advisory
`FreeBSD-SA-03:13 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:13.sendmail.asc>`__.

The FreeBSD ARP code contains a bug that could allow the kernel to cause
resource starvation which eventually results in a system panic. This bug
has been fixed on the 4-STABLE development branch and the 4.8-RELEASE
security fix branch. More information can be found in security advisory
`FreeBSD-SA-03:14 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:14.arp.asc>`__.

Several bugs in the **OpenSSH** PAM authentication code could have
impacts ranging from incorrect authentication to a stack corruption.
These have been corrected via vendor-supplied patches; details can be
found in security advisory
`FreeBSD-SA-03:15 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:15.openssh.asc>`__.

The implementation of the
`readv(2) <http://www.FreeBSD.org/cgi/man.cgi?query=readv&sektion=2&manpath=FreeBSD+4.8-stable>`__
system call contains a bug which could potentially cause a system crash
or privilege escalation. This bug has been fixed on the 4-STABLE
development branch and the 4.8-RELEASE security fix branch. More
information can be found in security advisory
`FreeBSD-SA-03:16 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:16.filedesc.asc>`__.

The implementation of the
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.8-stable>`__
and the
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.8-stable>`__
contain a bug that could result in disclosing the contents of kernel
memory. This bug has been fixed on the 4-STABLE development branch and
the 4.8-RELEASE security fix branch. More information can be found in
security advisory
`FreeBSD-SA-03:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:17.procfs.asc>`__.

**OpenSSL** contains several bugs which could allow a remote attacker to
crash an **OpenSSL**-using application or to execute arbitrary code with
the privileges of the application. These bugs have been fixed with the
import of a new version of **OpenSSL** on the 4-STABLE development
branch and with a vendor-supplied patch on the 4.8-RELEASE security fix
branch. Note that only applications that use **OpenSSL**'s ASN.1 or
X.509 handling code are affected (**OpenSSH** is unaffected, for
example). More information can be found in security advisory
`FreeBSD-SA-03:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:18.openssl.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Late-Breaking News
====================

Due to some problems discovered very late in the release cycle, the ISO
images and FTP install directories for FreeBSD 4.8-RELEASE/i386 needed
to be re-generated and re-uploaded to the FTP mirror sites. For
reference, the final ISO images have checksums computed via
`md5(1) <http://www.FreeBSD.org/cgi/man.cgi?query=md5&sektion=1&manpath=FreeBSD+4.8-stable>`__
as follows:

.. code:: PROGRAMLISTING

    MD5 (4.8-RELEASE-i386-disc1.iso) = c4e34b6a6be5cd1977ca206bf821c7fc
    MD5 (4.8-RELEASE-i386-disc2.iso) = 93b09f97c01deead302557d7d24f87cb
    MD5 (4.8-RELEASE-i386-mini.iso) = 5f0d2576dbb56d6ec85d49ac9fa4bbf9

Some parts of the documentation may incorrectly give the release date of
FreeBSD 4.8-RELEASE as March 2003, rather than April 2003.

FreeBSD 4.8-RELEASE restores the ability to install from the
installation media to a
`mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+4.8-stable>`__
device. (This capability was broken in FreeBSD 4.7-RELEASE.)

After installing **GNOME**, the default terminal font might be garbled.
If this is the case, install the ``x11-fonts/bitstream-vera`` port, then
restart **GNOME**. The new fonts should take effect automatically. If
they do not, edit the current gnome-terminal profile and select the
Bitstream Vera Sans Mono font.

Due to space limitations, the
`awi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=awi&sektion=4&manpath=FreeBSD+4.8-stable>`__
driver has been removed from the kernel used on the 1.44MB ``kern.flp``
i386 boot floppy. Because no module is available for this driver in
FreeBSD 4.8-RELEASE, this means that it is generally not possible to
install FreeBSD 4.8-RELEASE over an
`awi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=awi&sektion=4&manpath=FreeBSD+4.8-stable>`__
network.

Due to space limitations, support for ATAPI floppy disks and the DEC
AlphaServer 8200 and 8400 (\`\`TurboLaser'') machines has been removed
from the kernel used on the 1.44MB ``kern.flp`` alpha boot floppy.

A bug in the FreeBSD 4.8-RELEASE kernel prevents it from booting on an
Intel 80386 processor. This problem has been corrected on both the
4.8-RELEASE security fix branch and the 4-STABLE development branch.

FreeBSD supports a hashed form of the login capabilities database,
stored in ``/etc/login.conf.db``. This is generated from the
``/etc/login.conf`` text file. If the hashed database is present,
`login(1) <http://www.FreeBSD.org/cgi/man.cgi?query=login&sektion=1&manpath=FreeBSD+4.8-stable>`__
will use it in preference to the contents of the text file. FreeBSD
4.8-RELEASE is the first release that actually includes
``/etc/login.conf.db`` on the distribution media; thus, users modifying
``/etc/login.conf`` need to remember to regenerate the database, using
`cap\_mkdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cap_mkdb&sektion=1&manpath=FreeBSD+4.8-stable>`__.
Users performing source upgrades are generally not affected by this
change, because
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8&manpath=FreeBSD+4.8-stable>`__
offers the option to regenerate ``/etc/login.conf.db`` during upgrades.
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5&manpath=FreeBSD+4.8-stable>`__
has more details on the format and usage of the login capabilities
database.

A file that is a part of the ``multimedia/gstreamer-plugins`` port may
appear to have a corrupted filename when the ports collection is
installed using
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.8-stable>`__.
This should not affect building the port or installing the corresponding
package. However, it is recommended to rename the file in question, to
prevent problems during any future updates to the installed ports
collection:

.. code:: SCREEN

    # cd /usr/ports/multimedia/gstreamer-plugins/files
    # mv patch-gst-libs_ext_ffmpeg_ffmpeg_libavcodec_alpha_simple_i \
    patch-gst-libs_ext_ffmpeg_ffmpeg_libavcodec_alpha_simple_idct_alpha.c

Recently the mailing lists were changed from majordomo to the currently
used Mailman list server. More information about using the new mailing
lists can be found by visiting the `FreeBSD Mailman Info
Page <http://www.FreeBSD.org/mailman/listinfo/>`__.

The
`dc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dc&sektion=4&manpath=FreeBSD+4.8-stable>`__
driver does not properly transmit data through Davicom DC9102 cards.
This problem, which has been present since FreeBSD 4.5-RELEASE, has been
corrected for FreeBSD 4.9-RC.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

This file, and other release-related documents, can be downloaded from
http://snapshots.jp.FreeBSD.org/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 4-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
