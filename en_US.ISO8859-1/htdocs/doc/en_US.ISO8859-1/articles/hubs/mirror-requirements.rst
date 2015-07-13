===================================
2.?Requirements for FreeBSD mirrors
===================================

.. raw:: html

   <div class="navheader">

2.?Requirements for FreeBSD mirrors
`Prev <index.html>`__?
?
?\ `Next <mirror-howto.html>`__

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

2.?Requirements for FreeBSD mirrors
-----------------------------------

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

2.1.?Disk Space
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Disk space is one of the most important requirements. Depending on the
set of releases, architectures, and degree of completeness you want to
mirror, a huge amount of disk space may be consumed. Also keep in mind
that *official* mirrors are probably required to be complete. The web
pages should always be mirrored completely. Also note that the numbers
stated here are reflecting the current state (at
9.3-RELEASE/10.1-RELEASE). Further development and releases will only
increase the required amount. Also make sure to keep some (ca. 10-20%)
extra space around just to be sure. Here are some approximate figures:

.. raw:: html

   <div class="itemizedlist">

-  Full FTP Distribution: 1.4 TB

-  CTM deltas: 10 GB

-  Web pages: 1GB

.. raw:: html

   </div>

The current disk usage of FTP Distribution can be found at
ftp://ftp.FreeBSD.org/pub/FreeBSD/dir.sizes.

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

2.2.?Network Connection/Bandwidth
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Of course, you need to be connected to the Internet. The required
bandwidth depends on your intended use of the mirror. If you just want
to mirror some parts of FreeBSD for local use at your site/intranet, the
demand may be much smaller than if you want to make the files publicly
available. If you intend to become an official mirror, the bandwidth
required will be even higher. We can only give rough estimates here:

.. raw:: html

   <div class="itemizedlist">

-  Local site, no public access: basically no minimum, but < 2 Mbps
   could make syncing too slow.

-  Unofficial public site: 34 Mbps is probably a good start.

-  Official site: > 100 Mbps is recommended, and your host should be
   connected as close as possible to your border router.

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

2.3.?System Requirements, CPU, RAM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One thing this depends on the expected number of clients, which is
determined by the server's policy. It is also affected by the types of
services you want to offer. Plain FTP or HTTP services may not require a
huge amount of resources. Watch out if you provide rsync. This can have
a huge impact on CPU and memory requirements as it is considered a
memory hog. The following are just examples to give you a very rough
hint.

For a moderately visited site that offers rsync, you might consider a
current CPU with around 800MHz - 1 GHz, and at least 512MB RAM. This is
probably the minimum you want for an *official* site.

For a frequently used site you definitely need more RAM (consider 2GB as
a good start) and possibly more CPU, which could also mean that you need
to go for a SMP system.

You also want to consider a fast disk subsystem. Operations on the SVN
repository require a fast disk subsystem (RAID is highly advised). A
SCSI controller that has a cache of its own can also speed up things
since most of these services incur a large number of small modifications
to the disk.

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

2.4.?Services to offer
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Every mirror site is required to have a set of core services available.
In addition to these required services, there are a number of optional
services that server administrators may choose to offer. This section
explains which services you can provide and how to go about implementing
them.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.1.?FTP (required for FTP fileset)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is one of the most basic services, and it is required for each
mirror offering public FTP distributions. FTP access must be anonymous,
and no upload/download ratios are allowed (a ridiculous thing anyway).
Upload capability is not required (and *must* never be allowed for the
FreeBSD file space). Also the FreeBSD archive should be available under
the path ``/pub/FreeBSD``.

There is a lot of software available which can be set up to allow
anonymous FTP (in alphabetical order).

.. raw:: html

   <div class="itemizedlist">

-  ``/usr/libexec/ftpd``: FreeBSD's own ftpd can be used. Be sure to
   read
   `ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8>`__.

-  `ftp/ncftpd <http://www.freebsd.org/cgi/url.cgi?ports/ftp/ncftpd/pkg-descr>`__:
   A commercial package, free for educational use.

-  `ftp/oftpd <http://www.freebsd.org/cgi/url.cgi?ports/ftp/oftpd/pkg-descr>`__:
   An ftpd designed with security as a main focus.

-  `ftp/proftpd <http://www.freebsd.org/cgi/url.cgi?ports/ftp/proftpd/pkg-descr>`__:
   A modular and very flexible ftpd.

-  `ftp/pure-ftpd <http://www.freebsd.org/cgi/url.cgi?ports/ftp/pure-ftpd/pkg-descr>`__:
   Another ftpd developed with security in mind.

-  `ftp/twoftpd <http://www.freebsd.org/cgi/url.cgi?ports/ftp/twoftpd/pkg-descr>`__:
   As above.

-  `ftp/vsftpd <http://www.freebsd.org/cgi/url.cgi?ports/ftp/vsftpd/pkg-descr>`__:
   The “very secure” ftpd.

.. raw:: html

   </div>

FreeBSD's ftpd, proftpd and maybe ncftpd are among the most commonly
used FTPds. The others do not have a large userbase among mirror sites.
One thing to consider is that you may need flexibility in limiting how
many simultaneous connections are allowed, thus limiting how much
network bandwidth and system resources are consumed.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.2.?Rsync (optional for FTP fileset)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Rsync is often offered for access to the contents of the FTP area of
FreeBSD, so other mirror sites can use your system as their source. The
protocol is different from FTP in many ways. It is much more bandwidth
friendly, as only differences between files are transferred instead of
whole files when they change. Rsync does require a significant amount of
memory for each instance. The size depends on the size of the synced
module in terms of the number of directories and files. Rsync can use
``rsh`` and ``ssh`` (now default) as a transport, or use its own
protocol for stand-alone access (this is the preferred method for public
rsync servers). Authentication, connection limits, and other
restrictions may be applied. There is just one software package
available:

.. raw:: html

   <div class="itemizedlist">

-  `net/rsync <http://www.freebsd.org/cgi/url.cgi?ports/net/rsync/pkg-descr>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.3.?HTTP (required for web pages, optional for FTP fileset)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you want to offer the FreeBSD web pages, you will need to install a
web server. You may optionally offer the FTP fileset via HTTP. The
choice of web server software is left up to the mirror administrator.
Some of the most popular choices are:

.. raw:: html

   <div class="itemizedlist">

-  `www/apache22 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache22/pkg-descr>`__:
   Apache is the most widely deployed web server on the Internet. It is
   used extensively by the FreeBSD Project.

-  `www/thttpd <http://www.freebsd.org/cgi/url.cgi?ports/www/thttpd/pkg-descr>`__:
   If you are going to be serving a large amount of static content you
   may find that using an application such as thttpd is more efficient
   than Apache. It is optimized for excellent performance on FreeBSD.

-  `www/boa <http://www.freebsd.org/cgi/url.cgi?ports/www/boa/pkg-descr>`__:
   Boa is another alternative to thttpd and Apache. It should provide
   considerably better performance than Apache for purely static
   content. It does not, at the time of this writing, contain the same
   set of optimizations for FreeBSD that are found in thttpd.

-  `www/nginx <http://www.freebsd.org/cgi/url.cgi?ports/www/nginx/pkg-descr>`__:
   Nginx is a high performance edge web server with a low memory
   footprint and key features to build a modern and efficient web
   infrastructure. Features include a HTTP server, HTTP and mail reverse
   proxy, caching, load balancing, compression, request throttling,
   connection multiplexing and reuse, SSL offload and HTTP media
   streaming.

.. raw:: html

   </div>

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
| `Prev <index.html>`__?   | ?                       | ?\ `Next <mirror-howto.html>`__   |
+--------------------------+-------------------------+-----------------------------------+
| Mirroring FreeBSD?       | `Home <index.html>`__   | ?3.?How to Mirror FreeBSD         |
+--------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
