==========================
FreeBSD 4.5-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.5-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.1.2.66 2002/05/20 22:27:52 bmah Exp $

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 4.5-RELEASE, containing
    significant information discovered after the release. This
    information includes security advisories, as well as news relating
    to the software or documentation that could affect its operation or
    usability. An up-to-date version of this document should always be
    consulted before installing this version of FreeBSD.

    This errata document for FreeBSD 4.5-RELEASE will be maintained
    until the release of FreeBSD 4.6-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This errata document contains \`\`late-breaking news'' about FreeBSD
4.5-RELEASE. Before installing this version, it is important to consult
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

A race condition existed whereby a file could be removed between a
`fstatfs(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fstatfs&sektion=2&manpath=FreeBSD+4.5-stable>`__
call and the point where the file is accessed, causing a kernel panic.
Only the
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+4.5-stable>`__
filesystem was known to be vulnerable to this attack. This bug was fixed
in FreeBSD 4.5-RELEASE, but the security advisory describing the bug was
issued after the release. For more information, including a workaround
and bug fix, see security advisory
`FreeBSD-SA-02:09 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:09.fstatfs.asc>`__.

An \`\`off-by-one'' bug has been fixed in **OpenSSH**'s multiplexing
code. This bug could have allowed an authenticated remote user to cause
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+4.5-stable>`__
to execute arbitrary code with superuser privileges, or allowed a
malicious SSH server to execute arbitrary code on the client system with
the privileges of the client user. Various workarounds and bugfixes, for
versions of **OpenSSH** in both the base system and Ports Collection,
can be found in security advisory
`FreeBSD-SA-02:13 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:13.openssh.asc>`__.

A programming error in **zlib** could result in attempts to free memory
multiple times. The
`malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3&manpath=FreeBSD+4.5-stable>`__/`free(3) <http://www.FreeBSD.org/cgi/man.cgi?query=free&sektion=3&manpath=FreeBSD+4.5-stable>`__
routines used in FreeBSD are not vulnerable to this error, but
applications receiving specially-crafted blocks of invalid compressed
data could be made to function incorrectly or abort. This **zlib** bug
has been fixed. For a workaround and solutions, see security advisory
`FreeBSD-SA-02:18 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:18.zlib.v1.2.asc>`__.

Bugs in the TCP SYN cache (\`\`syncache'') and SYN cookie
(\`\`syncookie'') implementations, which could cause legitimate TCP/IP
traffic to crash a machine, have been fixed. For a workaround and
patches, see security advisory
`FreeBSD-SA-02:20 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:20.syncache.asc>`__.

A routing table memory leak, which could allow a remote attacker to
exhaust the memory of a target machine, has been fixed. A workaround and
patches can be found in security advisory
`FreeBSD-SA-02:21 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:21.tcpip.asc>`__.

A bug with memory-mapped I/O, which could cause a system crash, has been
fixed. For more information about a solution, see security advisory
`FreeBSD-SA-02:22 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:22.mmap.asc>`__.

A security hole, in which SUID programs could be made to read from or
write to inappropriate files through manipulation of their standard I/O
file descriptors, has been fixed. Information regarding a solution can
be found in security advisory
`FreeBSD-SA-02:23 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:23.stdio.asc>`__.

Unlike
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1&manpath=FreeBSD+4.5-stable>`__,
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+4.5-stable>`__
does not require that an invoking user be a member of the ``wheel``
group when attempting to become the superuser. This could result in some
unexpected behavior. To avoid this situation,
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+4.5-stable>`__
is now installed non-SUID by default (effectively disabling it). More
information can be found in security advisory
`FreeBSD-SA-02:24 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:24.k5su.asc>`__.

Multiple vulnerabilities were found in the
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1&manpath=FreeBSD+4.5-stable>`__
utility, which could allow files to be overwritten without warning or
allow local users unintended access to files. These problems have been
corrected with a new import of **bzip2**. For more information, see
security advisory
`FreeBSD-SA-02:25 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:25.bzip2.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 System Update Information
===========================

Certain SSH clients, when attempting to connect to a FreeBSD 4.5-RELEASE
server, will unexpectedly present an **S/Key** prompt, even if
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8&manpath=FreeBSD+4.5-stable>`__
on the server has not been later explicitly configured for **S/Key**
authentication. This is due to the default settings of clients having
changed (e.g. use of SSH protocol version 2 where it was not used
before), or from a change from the client's old default authentication
sequence. There are a number of ways to disable this behavior:

-  On newer **OpenSSH** clients, add the following line to your
   ``~/.ssh/config`` file:

   .. code:: PROGRAMLISTING

           PreferredAuthentications publickey,password,keyboard-interactive

   | 

-  For **PuTTY** clients, the authentication sequence order cannot be
   changed, but keyboard-interactive authentication can be disabled in
   the settings.

-  To disable keyboard-interactive authentication in the server,
   uncomment the following line in the ``/etc/ssh/sshd_config`` file (on
   the server host):

   .. code:: PROGRAMLISTING

           ChallengeResponseAuthentication no

   | 

This problem has been corrected in FreeBSD 4.6-RC.
The release notes mentioned the new sbni device driver, but gave an
incorrect reference to the program in the FreeBSD Ports Collection used
to configure the driver. The correct filename for the port is
```sysutils/sbniconfig`` <http://www.FreeBSD.org/cgi/url.cgi?ports/sysutils/sbniconfig/pkg-descr>`__.

Linux emulation now requires ``options         SYSVSEM`` in the kernel
configuration. This dependency was introduced into FreeBSD before
4.5-RELEASE.

Packages containing some optional components of **KDE** were
accidentally omitted from the ISO images (and hence the official 4-CD
set). In prior releases, these packages could be installed using the
```x11/kde2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde2/pkg-descr>`__
package. These components can either be installed using the FreeBSD
Ports Collection or by downloading the binary packages from one of the
FreeBSD FTP servers. The affected ports are:
```games/kdegames2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/games/kdegames2/pkg-descr>`__,
```misc/kdeutils2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/misc/kdeutils2/pkg-descr>`__,
```editors/koffice`` <http://www.FreeBSD.org/cgi/url.cgi?ports/editors/koffice/pkg-descr>`__,
```net/kdenetwork2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/kdenetwork2/pkg-descr>`__,
```graphics/kdegraphics2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/graphics/kdegraphics2/pkg-descr>`__,
and
```audio/kdemultimedia2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/audio/kdemultimedia2/pkg-descr>`__.
Note that the
```x11/kdelibs2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kdelibs2/pkg-descr>`__
and
```x11/kdebase2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kdebase2/pkg-descr>`__
packages, which are frequently required by these other components, *are*
included on disk 1 of the official 4-CD set. `[1] <#FTN.AEN118>`__

A binary package containing **Samba** was accidentally omitted from the
ISO images. This software can either be installed using the
```net/samba`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/samba/pkg-descr>`__
port in the FreeBSD Ports Collection or by downloading and installing
its binary package from one of the FreeBSD FTP servers.

A bug has been fixed in soft updates that can cause occasional
filesystem corruption if the system is shut down immediately after
performing heavy filesystem activities, such as installing a new kernel
or other software. The system shutdown was unable to flush all buffers
on shutdown and would report this fact. The problem can be worked around
by running
`sync(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sync&sektion=8&manpath=FreeBSD+4.5-stable>`__
a few times before rebooting, or solved by updating to a recent FreeBSD
4.6-RC snapshot.

The ciss driver was inadvertently omitted from the FreeBSD 4.5-RELEASE
``GENERIC`` kernel, thus making it impossible (or at least very
difficult) to perform an initial install to disks attached to this
controller. This problem has been corrected in FreeBSD 4.6-RC.

.. raw:: html

   </div>

.. raw:: html

   </div>

Notes
~~~~~

+--------------------------------------+--------------------------------------+
| `[1] <#AEN118>`__                    | The complete FreeBSD package         |
|                                      | collection currently fills nine      |
|                                      | CDROMs. The official 4-CD set        |
|                                      | therefore only contains a subset of  |
|                                      | the available packages. Several      |
|                                      | FreeBSD vendors offer distributions  |
|                                      | that contain a more complete set of  |
|                                      | packages; a more complete collection |
|                                      | can also be found on the FreeBSD FTP |
|                                      | sites.                               |
+--------------------------------------+--------------------------------------+

--------------

This file, and other release-related documents, can be downloaded from
ftp://releng4.FreeBSD.org/pub/FreeBSD/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 4-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
