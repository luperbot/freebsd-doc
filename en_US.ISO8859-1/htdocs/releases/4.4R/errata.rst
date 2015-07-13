==========================
FreeBSD 4.4-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.4-RELEASE Errata
==========================

The FreeBSD Project
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 by The FreeBSD Documentation Project

| $FreeBSD: src/release/doc/en\_US.ISO8859-1/errata/article.sgml,v
  1.1.2.43 2002/01/25 04:12:28 bmah Exp $

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    This document lists errata items for FreeBSD 4.4-RELEASE, containing
    significant information discovered after the release. This
    information includes security advisories, as well as news relating
    to the software or documentation that could affect its operation or
    usability. An up-to-date version of this document should always be
    consulted before installing this version of FreeBSD.

    This errata document for FreeBSD 4.4-RELEASE will be maintained
    until the release of FreeBSD 4.5-RELEASE.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1 Introduction
==============

This errata document contains \`\`late-breaking news'' about FreeBSD
4.4-RELEASE. Before installing this version, it is important to consult
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

Support for per-user ``~/.login_conf`` files (as documented in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5&manpath=FreeBSD+4.4-stable>`__)
was disabled due to incorrect merging of local and global settings. This
problem has been fixed in FreeBSD 4.5-RC.

A local root vulnerability in **UUCP** was corrected before the release
of FreeBSD 4.4-RELEASE and documented in security advisory
`FreeBSD-SA-01:62 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-01:62.uucp.asc>`__.
The release notes mentioned the correction, but not the security
advisory, which was issued after the release date of 4.4-RELEASE.

A security hole in **OpenSSH** could allow users to execute code with
arbitrary privileges if ``UseLogin yes`` was set, has been closed. Note
that the default value of this setting is ``UseLogin no``. For more
information, including workarounds and bugfixes, see security advisory
`FreeBSD-SA-01:63 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-01:63.openssh.asc>`__.

The use of an insecure temporary directory by
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.4-stable>`__
could permit a local attacker to modify the contents of binary packages
while they were being installed. This hole has been closed. For more
information, see security advisory
`FreeBSD-SA-02:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:01.pkg_add.asc>`__.

A race condition in
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8&manpath=FreeBSD+4.4-stable>`__,
which could expose the contents of ``/etc/master.passwd``, has been
eliminated. For more information, including workarounds and bugfixes,
see security advisory
`FreeBSD-SA-02:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:02.pw.asc>`__.

A bug in
`k5su(8) <http://www.FreeBSD.org/cgi/man.cgi?query=k5su&sektion=8&manpath=FreeBSD+4.4-stable>`__
could have allowed a process that had given up superuser privileges to
regain them. This bug has been fixed. (See security advisory
`FreeBSD-SA-02:07 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:07.k5su.asc>`__.)

A race condition in the
`exec(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exec&sektion=3&manpath=FreeBSD+4.4-stable>`__
system call, which could result in local users obtaining increased
privileges, has been fixed. For more information, including bugfixes,
see security advisory
`FreeBSD-SA-02:08 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:08.exec.asc>`__.)

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3 System Update Information
===========================

The handling of some types of comments in
`printcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=printcap&sektion=5&manpath=FreeBSD+4.4-stable>`__
files is faulty. If a comment line ends in ``:\`` (the characters
normally used to indicate the continuation of a printer definition), the
line following the comment will be parsed as a part of the previous
printer definition.

One of the release notes refers to the
``net.inet.tcp.tcp_seq_genscheme`` sysctl variable for enabling improved
compatability in TCP's initial sequence number generation algorithm.
This variable was rendered unnecessary by the adoption of an algorithm
based on RFC 1948, which restores proper operation in all cases while
maintaining a high level of unpredictability in initial sequence
numbers.

The ``tools/`` directory of a FreeBSD CDROM distribution typically
contains some DOS programs for i386 machines, such as ``fdimage.exe``
and ``fips.exe``. This directory was inadvertently omitted from the
initial 4.4-RELEASE ISO images generated by the FreeBSD Project.
Corrected versions of the ``4.4-install.iso`` and ``4.4-mini.iso`` ISO
images were regenerated on Saturday, 22 September 2001. For those who
need these DOS-mode tools and do not wish to re-fetch the ISO images,
the contents of the ``tools/`` directory are available by anonymous FTP
at ftp://ftp.FreeBSD.org/pub/FreeBSD/tools (many mirrors also have a
copy of this directory).

One of the items in the release notes gave a workaround for hangs during
PCCARD ejection, but gave the wrong syntax for the necessary command.
The correct command line is:

.. code:: SCREEN

        # pccardc power slot 0

On the i386, the minimum memory requirement for installing FreeBSD via
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.4-stable>`__
is 16MB, with 4-8MB required to run FreeBSD with a pared-down kernel.
The installation instructions in ``INSTALL.TXT`` (and other renditions
thereof) cited somewhat lower figures.

A release note mentioned the merging of two libraries used for password
authentication hashing, but listed their names incorrectly. The
libraries that were merged were ``libscrypt`` and ``libdescrypt``; the
new unified library is called ``libcrypt``.

A problem has been noted with an increasing number of device drivers
that make heavy use of and, in some cases, can overflow, the kernel
stack. This problem has an easily-identifable signature; processes
randomly receive a ``SIGPROF`` signal and may die with the message
\`\`\ ``Profiling time         alarm``''. For those users experiencing
this problem, a workaround is to edit ``/src/sys/i386/include/param.h``
and change the line which reads:

.. code:: PROGRAMLISTING

        #define UPAGES  2

to read:
.. code:: PROGRAMLISTING

        #define UPAGES  3

It will be necessary to recompile the kernel and reboot for the change
to take effect. This problem has been fixed in FreeBSD 4.5-RC.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

This file, and other release-related documents, can be downloaded from
ftp://stable.FreeBSD.org/pub/FreeBSD/.

For questions about FreeBSD, read the
`documentation <http://www.FreeBSD.org/docs.html>`__ before contacting
<questions@FreeBSD.org\ >.

All users of FreeBSD 4-STABLE should subscribe to the
<stable@FreeBSD.org\ > mailing list.

For questions about this documentation, e-mail <doc@FreeBSD.org\ >.

|
