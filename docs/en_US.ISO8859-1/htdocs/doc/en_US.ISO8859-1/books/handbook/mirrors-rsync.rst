================
A.5.?Using rsync
================

.. raw:: html

   <div class="navheader">

A.5.?Using rsync
`Prev <svn.html>`__?
Appendix?A.?Obtaining FreeBSD
?\ `Next <bibliography.html>`__

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

A.5.?Using rsync
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following sites make FreeBSD available through the rsync protocol.
The rsync utility works in much the same way as the
`rcp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rcp&sektion=1>`__
command, but has more options and uses the rsync remote-update protocol
which transfers only the differences between two sets of files, thus
greatly speeding up the synchronization over the network. This is most
useful if you are a mirror site for the FreeBSD FTP server, or the CVS
repository. The rsync suite is available for many operating systems, on
FreeBSD, see the
`net/rsync <http://www.freebsd.org/cgi/url.cgi?ports/net/rsync/pkg-descr>`__
port or use the package.

.. raw:: html

   <div class="variablelist">

Czech Republic
    rsync://ftp.cz.FreeBSD.org/

    Available collections:

    .. raw:: html

       <div class="itemizedlist">

    -  ftp: A partial mirror of the FreeBSD FTP server.

    -  FreeBSD: A full mirror of the FreeBSD FTP server.

    .. raw:: html

       </div>

Netherlands
    rsync://ftp.nl.FreeBSD.org/

    Available collections:

    .. raw:: html

       <div class="itemizedlist">

    -  FreeBSD: A full mirror of the FreeBSD FTP server.

    .. raw:: html

       </div>

Russia
    rsync://ftp.mtu.ru/

    Available collections:

    .. raw:: html

       <div class="itemizedlist">

    -  FreeBSD: A full mirror of the FreeBSD FTP server.

    -  FreeBSD-Archive: The mirror of FreeBSD Archive FTP server.

    .. raw:: html

       </div>

Sweden
    rsync://ftp4.se.freebsd.org/

    Available collections:

    .. raw:: html

       <div class="itemizedlist">

    -  FreeBSD: A full mirror of the FreeBSD FTP server.

    .. raw:: html

       </div>

Taiwan
    rsync://ftp.tw.FreeBSD.org/

    rsync://ftp2.tw.FreeBSD.org/

    rsync://ftp6.tw.FreeBSD.org/

    Available collections:

    .. raw:: html

       <div class="itemizedlist">

    -  FreeBSD: A full mirror of the FreeBSD FTP server.

    .. raw:: html

       </div>

United Kingdom
    rsync://rsync.mirrorservice.org/

    Available collections:

    .. raw:: html

       <div class="itemizedlist">

    -  ftp.freebsd.org: A full mirror of the FreeBSD FTP server.

    .. raw:: html

       </div>

United States of America
    rsync://ftp-master.FreeBSD.org/

    This server may only be used by FreeBSD primary mirror sites.

    Available collections:

    .. raw:: html

       <div class="itemizedlist">

    -  FreeBSD: The master archive of the FreeBSD FTP server.

    -  acl: The FreeBSD master ACL list.

    .. raw:: html

       </div>

    rsync://ftp13.FreeBSD.org/

    Available collections:

    .. raw:: html

       <div class="itemizedlist">

    -  FreeBSD: A full mirror of the FreeBSD FTP server.

    .. raw:: html

       </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+-----------------------------------+
| `Prev <svn.html>`__?     | `Up <mirrors.html>`__   | ?\ `Next <bibliography.html>`__   |
+--------------------------+-------------------------+-----------------------------------+
| A.4.?Using Subversion?   | `Home <index.html>`__   | ?Appendix?B.?Bibliography         |
+--------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
