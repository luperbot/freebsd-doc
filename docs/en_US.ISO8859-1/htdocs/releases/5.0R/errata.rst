==========================
FreeBSD 5.0-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.0-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002, 2003 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v 1.38
  2003/04/29 20:39:38 hrs Exp $

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 5.0-RELEASE, containing
    significant information discovered after the release or too late in
    the release cycle to be otherwise included in the release
    documentation. This information includes security advisories, as
    well as news relating to the software or documentation that could
    affect its operation or usability. An up-to-date version of this
    document should always be consulted before installing this version
    of FreeBSD.

    This errata document for FreeBSD 5.0-RELEASE will be maintained
    until the release of FreeBSD 5.1-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This errata document contains \`\`late-breaking news'' about FreeBSD
5.0-RELEASE. Before installing this version, it is important to consult
this document to learn about any post-release discoveries or problems
that may already have been found and fixed.

Any version of this errata document actually distributed with the
release (for example, on a CDROM distribution) will be out of date by
definition, but other copies are kept updated on the Internet and should
be consulted as the \`\`current errata'' for this release. These other
copies of the errata are located at http://www.FreeBSD.org/releases/,
plus any sites which keep up-to-date mirrors of this location.

Source and binary snapshots of FreeBSD 5-CURRENT also contain up-to-date
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

Remotely exploitable vulnerabilities in **CVS** could allow an attacker
to execute arbitrary comands on a CVS server. More details can be found
in security advisory
`FreeBSD-SA-03:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:01.cvs.asc>`__.

A timing-based attack on **OpenSSL**, could allow a very powerful
attacker access to plaintext under certain circumstances. This problem
has been corrected in FreeBSD 5.0-CURRENT with an upgrade to **OpenSSL**
0.9.7. On supported security fix branches, this problem has been
corrected with the import of **OpenSSL** 0.9.6i. See security advisory
`FreeBSD-SA-03:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:02.openssl.asc>`__
for more details.

It may be possible to recover the shared secret key used by the
implementation of the \`\`syncookies'' feature. This reduces its
effectiveness in dealing with TCP SYN flood denial-of-service attacks.
Workaround information and fixes are given in security advisory
`FreeBSD-SA-03:03 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:03.syncookies.asc>`__.

Due to buffer overflows in header parsing in **sendmail**, a remote
attacker can create a specially-crafted message that may cause
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+5.0-current>`__
to execute arbitrary code with the privileges of the user running it,
typically ``root``. More information, including pointers to patches, can
be found in security advisories
`FreeBSD-SA-03:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:04.sendmail.asc>`__
and
`FreeBSD-SA-03:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:07.sendmail.asc>`__.

The XDR encoder/decoder does incorrect bounds-checking, which could
allow a remote attacker to cause a denial-of-service. For bugfix
information, see security advisory
`FreeBSD-SA-03:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:05.xdr.asc>`__.

**OpenSSL** has been found vulnerable to two recently-disclosed attacks.
Information on workarounds and patches for supported security branches
is contained in security advisory
`FreeBSD-SA-03:06 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:06.openssl.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Late-Breaking News
====================

GEOM
^^^^

The
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.0-current>`__-based
disk partitioning code in the kernel will not allow an open partition to
be overwritten. This usually prevents the use of ``disklabel -B`` to
update the boot blocks on a disk because the ``a`` partition overlaps
the space where the boot blocks are stored. A suggested workaround is to
boot from an alternate disk, a CDROM, or a fixit floppy.

\ `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When using disk media with sector sizes larger than 512 bytes (for
instance,
`gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4&manpath=FreeBSD+5.0-current>`__
encrypted disks), the
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8&manpath=FreeBSD+5.0-current>`__
program fails to respect the larger sector size and cannot dump the
partition. One possible workaround is to copy the entire file system in
raw format and dump the copy. It is, for instance, possible to dump a
file system stored in a regular file:

.. code:: SCREEN

    # dd if=/dev/ad0s1d.bde of=/junk/ad0.dd bs=1m
    # dump 0f - /junk/ad0.dd | ...

A simpler workaround is to use
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+5.0-current>`__
or
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1&manpath=FreeBSD+5.0-current>`__
to make backup copies.

\ `mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+5.0-current>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hangs were reported during FreeBSD 5.0 snapshot installations when
installing to
`mly(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mly&sektion=4&manpath=FreeBSD+5.0-current>`__-supported
RAID arrays, in hardware configurations that appear to work fine under
FreeBSD 4.7-RELEASE. These problems have been corrected in FreeBSD
5.0-CURRENT.

NETNCP/Netware File System Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

NETNCP and nwfs appear to be as-yet unadapted for KSE, and hence not
working. These have been fixed in FreeBSD 5.0-CURRENT.

\ `iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+5.0-current>`__ controller
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

During installation, the
`iir(4) <http://www.FreeBSD.org/cgi/man.cgi?query=iir&sektion=4&manpath=FreeBSD+5.0-current>`__
controller appears to probe correctly, but finds no disk devices.

\ `truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.0-current>`__ race condition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.0-current>`__
appears to contain a race condition during the start-up of debugging,
which can result in
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.0-current>`__
failing to attach to the process before it exists. The symptom is that
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.0-current>`__
reports that it cannot open the
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.0-current>`__
node supporting the process being debugged. A bug also appears to exist
wherein
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.0-current>`__
will hang if
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2&manpath=FreeBSD+5.0-current>`__
returns ``ENOENT`` A further race appears to exist in which
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1&manpath=FreeBSD+5.0-current>`__
will return \`\`\ ``PIOCWAIT: Input/output         error``''
occasionally on startup. The fix for this sufficiently changes process
execution handling that it has been deferred until after 5.0.

Disk Partitioning in Installer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Some bugs have been reported in
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
disk partitioning. One observed problem on the i386 is that
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+5.0-current>`__
cannot recalculate the free space left on a disk after changing the type
of an FDISK-type partition.

Stale Documentation
^^^^^^^^^^^^^^^^^^^

In some case, documentation (such as the FAQ or Handbook) has not been
updated to take into account FreeBSD 5.0-RELEASE features. Examples of
areas where documentation is still needed include
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8&manpath=FreeBSD+5.0-current>`__
and the new \`\`fast IPsec'' implementation.

SMB File System
^^^^^^^^^^^^^^^

Attempting to unmount smbfs shares may fail with \`\`\ ``Device busy``''
errors even when the mount-point is not really busy. A workaround is to
keep trying to unmount the share until it eventually succeeds. This bug
has been fixed in 5.0-CURRENT.

Forcefully unmounting (``umount         -f``) smbfs shares may cause a
kernel panic. This bug has been fixed in 5.0-CURRENT.

\ `fstat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fstat&sektion=2&manpath=FreeBSD+5.0-current>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When called on a connected socket file descriptor,
`fstat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fstat&sektion=2&manpath=FreeBSD+5.0-current>`__
is supposed to return the number of bytes available to read in the
``st_size`` member of ``struct stat``. However, ``st_size`` is always
erroneously reported as ``0`` on TCP sockets. This bug has been fixed in
5.0-CURRENT.

Kernel Event Queues
^^^^^^^^^^^^^^^^^^^

The
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+5.0-current>`__
``EVFILT_READ`` filter erroneously indicates that ``0`` bytes are
available to be read on TCP sockets, regardless of the number of bytes
that are actually available. The ``NOTE_LOWAT`` flag for ``EVFILT_READ``
is also broken on TCP sockets. This bug has been fixed in 5.0-CURRENT.

POSIX Named Semaphores
^^^^^^^^^^^^^^^^^^^^^^

FreeBSD 5.0-RELEASE introduced support for POSIX named semaphores but
the implementation contains a critical bug that causes
`sem\_open(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sem_open&sektion=3&manpath=FreeBSD+5.0-current>`__
to incorrectly handle the opening of the same semaphore multiple times
by the same process, and that causes
`sem\_close(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sem_close&sektion=3&manpath=FreeBSD+5.0-current>`__
to crash calling programs. This bug has been fixed in 5.0-CURRENT.

\ ``/dev/tty`` Permissions
^^^^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD 5.0-RELEASE has a minor bug in how the permissions of
``/dev/tty`` are handled. This can be triggered by logging in as a
non-\ ``root``, non-\ ``tty`` group user, and using
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+5.0-current>`__
to switch to a second non-\ ``root``, non-\ ``tty`` group user.
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1&manpath=FreeBSD+5.0-current>`__
will fail because it cannot open ``/dev/tty``. This bug has been fixed
in 5.0-CURRENT.

\ `growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8&manpath=FreeBSD+5.0-current>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8&manpath=FreeBSD+5.0-current>`__
no longer works on
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.0-current>`__
volumes (and presumably, on
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.0-current>`__
entities) since these subsystems no longer fake disklabels, but
`growfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=growfs&sektion=8&manpath=FreeBSD+5.0-current>`__
insists on examining a label.

IPFW
^^^^

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.0-current>`__
``skipto`` rules do not work when coupled with the ``log`` keyword.
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.0-current>`__
``uid`` rules also do not work properly. These bugs have been fixed in
5.0-CURRENT.

Passwords and `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8&manpath=FreeBSD+5.0-current>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8&manpath=FreeBSD+5.0-current>`__
does not correctly handle setting user passwords containing special
shell characters. This problem has been corrected in 5.0-CURRENT.

\ `xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.0-current>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The
`xl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=xl&sektion=4&manpath=FreeBSD+5.0-current>`__
driver has a timing bug that may cause a kernel panic (or other
problems) when attempting to configure an interface. This bug has been
fixed in 5.0-CURRENT.

ISC DHCP
^^^^^^^^

**ISC DHCP** was updated to 3.0.1rc11. This update was actually a part
of FreeBSD 5.0-RELEASE, but was not documented in the release notes.

\ `amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8&manpath=FreeBSD+5.0-current>`__ Interoperability
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

5.0-RELEASE contains some bugs in its non-blocking RPC code. The most
noticeable side-effect of these bugs was that
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8&manpath=FreeBSD+5.0-current>`__
users were not able to mount volumes from a 5.0-RELEASE server. This bug
has been fixed in 5.0-CURRENT.

nsswitch
^^^^^^^^

The release note documenting the addition of **nsswitch** support gave
an incorrect name for the old resolver configuration file. It should
have been listed as ``/etc/host.conf``.

Mailman
^^^^^^^

Recently the mailing lists were changed from majordomo to the currently
used Mailman list server. More information about using the new mailing
lists can be found by visiting the `FreeBSD Mailman Info
Page <http://www.FreeBSD.org/mailman/listinfo/>`__.

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

All users of FreeBSD 5-CURRENT should subscribe to the
<current@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
