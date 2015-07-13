========================================
FreeBSD 4.6-RELEASE/4.6.2-RELEASE Errata
========================================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.6-RELEASE/4.6.2-RELEASE Errata
========================================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.1.2.82 2002/09/16 23:08:45 bmah Exp $

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 4.6-RELEASE, containing
    significant information discovered after the release. This
    information includes security advisories, as well as news relating
    to the software or documentation that could affect its operation or
    usability. An up-to-date version of this document should always be
    consulted before installing this version of FreeBSD.

    Unless otherwise noted, items listed here also pertain to FreeBSD
    4.6.2-RELEASE, which was designed to fix certain, specific problems
    in 4.6-RELEASE (see the release notes for more details).

    This errata document for FreeBSD 4.6-RELEASE will be maintained
    until the release of FreeBSD 4.7-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This errata document contains \`\`late-breaking news'' about FreeBSD
4.6-RELEASE. Before installing this version, it is important to consult
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

FreeBSD 4.6-RELEASE contains a fix for a bug described in security
advisory SA-02:23 (which addressed the use of file descriptors by
set-user-id or set-group-id programs). An error has been discovered in
the bugfix; it is still possible for systems using
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.6-stable>`__
or
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+4.6-stable>`__
to be exploited. A revised version of security advisory
`FreeBSD-SA-02:23 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:23.stdio.asc>`__
contains a corrected bugfix. This problem was corrected in FreeBSD
4.6.2-RELEASE.

A buffer overflow in the resolver could be exploited by a malicious
domain name server or an attacker forging DNS messages. This could
potentially be used to force arbitrary code to run on a client machine
with the privileges of a resolver-using application. See security
advisory
`FreeBSD-SA-02:28 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:28.resolv.asc>`__
for more information and a fix. This problem was corrected in FreeBSD
4.6.2-RELEASE.

Badly-formed NFS packets could trigger a buffer overflow in
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1&manpath=FreeBSD+4.6-stable>`__.
For a fix to this problem, see security advisory
`FreeBSD-SA-02:29 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:29.tcpdump.asc>`__.
This problem was corrected in FreeBSD 4.6.2-RELEASE.

`ktrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=1&manpath=FreeBSD+4.6-stable>`__
can be used to trace the operation of formerly-privileged processes.
This is undesirable, as it is then possible to leak information obtained
while these processes had elevated privileges. See security advisory
`FreeBSD-SA-02:30 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:30.ktrace.asc>`__
for a workaround and a fix. This problem was corrected in FreeBSD
4.6.2-RELEASE.

A race condition in
`pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppd&sektion=8&manpath=FreeBSD+4.6-stable>`__
can be used to change the permissions of an arbitrary file. For more
details, a workaround, and bugfix information, see security advisory
`FreeBSD-SA-02:32 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:32.pppd.asc>`__.
This problem was corrected in FreeBSD 4.6.2-RELEASE.

Multiple buffer overflows have been discovered in **OpenSSL**. More
details (including workarounds and bugfixes) can be found in security
advisory
`FreeBSD-SA-02:33 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:33.openssl.asc>`__.
This problem was corrected in FreeBSD 4.6.2-RELEASE.

A bug in the XDR decoder (used by Sun RPC) could result in a heap buffer
overflow. Security advisory
`FreeBSD-SA-02:34 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:34.rpc.asc>`__
contains workaround and bugfix information. This problem was corrected
in FreeBSD 4.6.2-RELEASE.

Local users can, under certain circumstances, read and write arbitrary
blocks on an FFS filesystem has been corrected. More details can be
found in security advisory
`FreeBSD-SA-02:35 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:35.ffs.asc>`__,
which contains a workaround and bugfix information. This problem was
corrected in FreeBSD 4.6.2-RELEASE.

A bug in the NFS server code could allow a remote denial of service
attack. Security advisory
`FreeBSD-SA-02:36 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:36.nfs.asc>`__
has information on a fix and a workaround. This problem was corrected in
FreeBSD 4.6.2-RELEASE.

A bug in
`kqueue(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kqueue&sektion=2&manpath=FreeBSD+4.6-stable>`__
could allow local users to panic a system. Correction information is
contained in security advisory
`FreeBSD-SA-02:37 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:37.kqueue.asc>`__.
This problem was corrected in FreeBSD 4.6.2-RELEASE.

Several bounds-checking bugs in system calls could result in some system
calls returning a large portion of kernel memory. More details can be
found in security advisory
`FreeBSD-SA-02:38 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:38.signed-error.asc>`__.
This problem was corrected in time for FreeBSD 4.6.2-RELEASE, although
not mentioned in the accompanying release documentation.

A bug in ``libkvm`` could result in some applications leaking file
descriptors with access to potentially sensitive information. More
details, as well as a bugfix and a workaround, can be found in security
advisory
`FreeBSD-SA-02:39 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:39.libkvm.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 Late-Breaking News
====================

In FreeBSD 4.6-RELEASE, the default maximum TCP window size was lowered
from 65536 bytes to 57334 bytes, for better compatability with some
versions of **IPFilter**.

A recently-discovered interaction between the FreeBSD kernel and the
``archivers/zip`` port can result in some errors on the alpha platform.
A post-release fix has been committed to the FreeBSD ports tree;
versions of the ``archivers/zip`` port beginning with 2.3\_1 will
function correctly.

On the alpha platform, the
`de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4&manpath=FreeBSD+4.6-stable>`__
and
`txp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=txp&sektion=4&manpath=FreeBSD+4.6-stable>`__
drivers were moved from the boot kernel on the floppy images to modules
on the ``mfsroot`` floppy. This change was made in order to get the
alpha kernel to fit onto the boot floppy. It should be transparent to
all users, as
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.6-stable>`__
will automatically load any kernel modules it finds on the ``mfsroot``
floppy.

Several last-minute patches were made to the
``x11-servers/XFree86-4-Server`` package. These allow the various server
configuration programs to give better support for the ``sysmouse``
device supported by
`moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8&manpath=FreeBSD+4.6-stable>`__.
The binary packages on the CDROMs and the FTP sites incoporate this
patch and bear the version number 4.2.0\_3. However, the ports
collection included in the distribution does not contain this patch. To
get an updated version, use **CVSup** to obtain a more recent ports
collection.

Some FreeBSD/i386 users have experienced difficulties reading from
certain ATA CDROM drives. Specific models on which this problem has been
observed include the AOpen 48x, 52x, and 56x CDROM drives, as well as
the Mitsumi Slim CRMC-SR242S CDROM drive. A typical symptom is the
following error message on the console and/or
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8&manpath=FreeBSD+4.6-stable>`__
buffer (sometimes accompanied by a kernel panic):

.. code:: SCREEN

        acd0: READ_BIG command timeout - resetting
        ata1: resetting devices .. done

In some cases, this bug can prevent installation of FreeBSD from an
affected CDROM drive. It can cause
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.6-stable>`__
to hang while extracting distribution files from CD media.

A two-part workaround listed here has shown to be helpful in some (but
not necessarily all) cases. First, to allow a CDROM installation, it is
necessary to modify the normal CDROM installation procedure:

.. raw:: html

   <div class="PROCEDURE">

#. Start the computer with a FreeBSD installation CDROM in the drive.

#. Wait for a console message similar to:

   .. code:: SCREEN

           Hit [Enter] to boot immediately, or any other key for command prompt.
           Booting [kernel] in 9 seconds...

#. Immediately interrupt the boot process by pressing the **Space** bar
   on the keyboard.

#. Enter the following three lines at the ``ok`` prompt:

   .. code:: SCREEN

           ok set hw.ata.ata_dma="1"

   .. code:: SCREEN

           ok set hw.ata.atapi_dma="1"

   .. code:: SCREEN

           ok boot

#. Continue the installation as normal.

.. raw:: html

   </div>

The second part of the workaround takes place after completing the CDROM
installation (or a successful source upgrade). It consists of
configuring the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.6-stable>`__
driver so that future CDROM reads work correctly:

.. raw:: html

   <div class="PROCEDURE">

#. Add the following two lines to ``/boot/loader.conf`` (creating this
   file if it does not already exist):

   .. code:: PROGRAMLISTING

           hw.ata.ata_dma="1"
           hw.ata.atapi_dma="1"

#. Reboot the machine.

.. raw:: html

   </div>

This problem was fixed in FreeBSD 4.7-PRERELEASE on 31 July 2002, as
well as FreeBSD 4.6.2-RELEASE.

Due to a bug in the release generation process, some of the directories
under ``/usr/share/examples`` are empty (most notably
``/usr/share/examples/cvsup``). A partial workaround is to install the
``sshare`` distribution via
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.6-stable>`__
(from the main menu, choose Configure, Distributions, src, then share).
``/usr/src/share/examples`` will then contain the missing files. This
problem was corrected in FreeBSD 4.7-PRERELEASE on 16 July 2002, as well
as FreeBSD 4.6.2-RELEASE.

The item in the \`\`Filesystems'' section of the release notes contains
a small grammatical error. It should read: \`\`A bug has been fixed in
soft updates that could cause occasional filesystem corruption if the
system is shut down immediately after performing heavy filesystem
activities, such as installing a new kernel or other software.''

Due to an omission, ``pkg_add -r`` on 4.6-RELEASE or 4.6.2-RELEASE may
attempt to fetch packages built for FreeBSD -STABLE, rather than for the
appropriate release. As a workaround, set the ``PACKAGESITE``
environment variable appropriately before invoking
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.6-stable>`__.
For example, a
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1&manpath=FreeBSD+4.6-stable>`__
user on 4.6.2-RELEASE could use:

.. code:: PROGRAMLISTING

        % setenv PACKAGESITE \
        ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/i386/packages-4.6.2-release/Latest/

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
