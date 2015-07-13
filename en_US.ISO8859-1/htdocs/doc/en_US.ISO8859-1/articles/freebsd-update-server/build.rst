=======================
5.?Building Update Code
=======================

.. raw:: html

   <div class="navheader">

5.?Building Update Code
`Prev <Configuration.html>`__?
?
?\ `Next <patch.html>`__

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

5.?Building Update Code
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first step is to run ``scripts/make.sh``. This will build some
binaries, create directories, and generate an RSA signing key used for
approving builds. In this step, a passphrase will have to be supplied
for the final creation of the signing key.

.. code:: screen

    # sh scripts/make.sh
    cc -O2 -fno-strict-aliasing -pipe   findstamps.c  -o findstamps
    findstamps.c: In function 'usage':
    findstamps.c:45: warning: incompatible implicit declaration of built-in function 'exit'
    cc -O2 -fno-strict-aliasing -pipe   unstamp.c  -o unstamp
    install findstamps ../bin
    install unstamp ../bin
    rm -f findstamps unstamp
    Generating RSA private key, 4096 bit long modulus
    ................................................................................++
    ...................++
    e is 65537 (0x10001)

    Public key fingerprint:
    27ef53e48dc869eea6c3136091cc6ab8589f967559824779e855d58a2294de9e

    Encrypting signing key for root
    enter aes-256-cbc encryption password:
    Verifying - enter aes-256-cbc encryption password:

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Keep a note of the generated key fingerprint. This value is required in
``/etc/freebsd-update.conf`` for binary updates.

.. raw:: html

   </div>

At this point, we are ready to stage a build.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cd /usr/local/freebsd-update-server
    # sh scripts/init.sh amd64 7.2-RELEASE

.. raw:: html

   </div>

What follows is a sample of an *initial* build run.

.. code:: screen

    # sh scripts/init.sh amd64 7.2-RELEASE
    Mon Aug 24 16:04:36 PDT 2009 Starting fetch for FreeBSD/amd64 7.2-RELEASE
    /usr/local/freebsd-update-server/work/7.2-RELE100% of  588 MB  359 kBps 00m00s
    Mon Aug 24 16:32:38 PDT 2009 Verifying disc1 hash for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 16:32:44 PDT 2009 Extracting components for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 16:34:05 PDT 2009 Constructing world+src image for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 16:35:57 PDT 2009 Extracting world+src for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 23:36:24 UTC 2009 Building world for FreeBSD/amd64 7.2-RELEASE
    Tue Aug 25 00:31:29 UTC 2009 Distributing world for FreeBSD/amd64 7.2-RELEASE
    Tue Aug 25 00:32:36 UTC 2009 Building and distributing kernels for FreeBSD/amd64 7.2-RELEASE
    Tue Aug 25 00:44:44 UTC 2009 Constructing world components for FreeBSD/amd64 7.2-RELEASE
    Tue Aug 25 00:44:56 UTC 2009 Distributing source for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 17:46:18 PDT 2009 Moving components into staging area for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 17:46:33 PDT 2009 Identifying extra documentation for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 17:47:13 PDT 2009 Extracting extra docs for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 17:47:18 PDT 2009 Indexing release for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 17:50:44 PDT 2009 Indexing world0 for FreeBSD/amd64 7.2-RELEASE

    Files built but not released:
    Files released but not built:
    Files which differ by more than contents:
    Files which differ between release and build:
    kernel|generic|/GENERIC/hptrr.ko
    kernel|generic|/GENERIC/kernel
    src|sys|/sys/conf/newvers.sh
    world|base|/boot/loader
    world|base|/boot/pxeboot
    world|base|/etc/mail/freebsd.cf
    world|base|/etc/mail/freebsd.submit.cf
    world|base|/etc/mail/sendmail.cf
    world|base|/etc/mail/submit.cf
    world|base|/lib/libcrypto.so.5
    world|base|/usr/bin/ntpq
    world|base|/usr/lib/libalias.a
    world|base|/usr/lib/libalias_cuseeme.a
    world|base|/usr/lib/libalias_dummy.a
    world|base|/usr/lib/libalias_ftp.a
    ...

Then the build of the world is performed again, with world patches. A
more detailed explanation may be found in ``scripts/build.subr``.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

During this second build cycle, the network time protocol daemon,
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__,
is turned off. Per Colin Percival ``<cperciva@FreeBSD.org>``, Security
Officer Emeritus of FreeBSD, "the
`freebsd-update-server <http://svnweb.freebsd.org/base/user/cperciva/freebsd-update-build/>`__
build code needs to identify timestamps which are stored in files so
that they can be ignored when comparing builds to determine which files
need to be updated. This timestamp-finding works by doing two builds 400
days apart and comparing the results."

.. raw:: html

   </div>

.. code:: screen

    Mon Aug 24 17:54:07 PDT 2009 Extracting world+src for FreeBSD/amd64 7.2-RELEASE
    Wed Sep 29 00:54:34 UTC 2010 Building world for FreeBSD/amd64 7.2-RELEASE
    Wed Sep 29 01:49:42 UTC 2010 Distributing world for FreeBSD/amd64 7.2-RELEASE
    Wed Sep 29 01:50:50 UTC 2010 Building and distributing kernels for FreeBSD/amd64 7.2-RELEASE
    Wed Sep 29 02:02:56 UTC 2010 Constructing world components for FreeBSD/amd64 7.2-RELEASE
    Wed Sep 29 02:03:08 UTC 2010 Distributing source for FreeBSD/amd64 7.2-RELEASE
    Tue Sep 28 19:04:31 PDT 2010 Moving components into staging area for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 19:04:46 PDT 2009 Extracting extra docs for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 19:04:51 PDT 2009 Indexing world1 for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 19:08:04 PDT 2009 Locating build stamps for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 19:10:19 PDT 2009 Cleaning staging area for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 19:10:19 PDT 2009 Preparing to copy files into staging area for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 19:10:20 PDT 2009 Copying data files into staging area for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 12:16:57 PDT 2009 Copying metadata files into staging area for FreeBSD/amd64 7.2-RELEASE
    Mon Aug 24 12:16:59 PDT 2009 Constructing metadata index and tag for FreeBSD/amd64 7.2-RELEASE

    Files found which include build stamps:
    kernel|generic|/GENERIC/hptrr.ko
    kernel|generic|/GENERIC/kernel
    world|base|/boot/loader
    world|base|/boot/pxeboot
    world|base|/etc/mail/freebsd.cf
    world|base|/etc/mail/freebsd.submit.cf
    world|base|/etc/mail/sendmail.cf
    world|base|/etc/mail/submit.cf
    world|base|/lib/libcrypto.so.5
    world|base|/usr/bin/ntpq
    world|base|/usr/include/osreldate.h
    world|base|/usr/lib/libalias.a
    world|base|/usr/lib/libalias_cuseeme.a
    world|base|/usr/lib/libalias_dummy.a
    world|base|/usr/lib/libalias_ftp.a
    ...

Finally, the build completes.

.. code:: screen

    Values of build stamps, excluding library archive headers:
    v1.2 (Aug 25 2009 00:40:36)
    v1.2 (Aug 25 2009 00:38:22)
    @(#)FreeBSD 7.2-RELEASE #0: Tue Aug 25 00:38:29 UTC 2009
    FreeBSD 7.2-RELEASE #0: Tue Aug 25 00:38:29 UTC 2009
        root@server.myhost.com:/usr/obj/usr/src/sys/GENERIC
    7.2-RELEASE
    Mon Aug 24 23:55:25 UTC 2009
    Mon Aug 24 23:55:25 UTC 2009
    ##### built by root@server.myhost.com on Tue Aug 25 00:16:15 UTC 2009
    ##### built by root@server.myhost.com on Tue Aug 25 00:16:15 UTC 2009
    ##### built by root@server.myhost.com on Tue Aug 25 00:16:15 UTC 2009
    ##### built by root@server.myhost.com on Tue Aug 25 00:16:15 UTC 2009
    Mon Aug 24 23:46:47 UTC 2009
    ntpq 4.2.4p5-a Mon Aug 24 23:55:53 UTC 2009 (1)
     * Copyright (c) 1992-2009 The FreeBSD Project.
    Mon Aug 24 23:46:47 UTC 2009
    Mon Aug 24 23:55:40 UTC 2009
    Aug 25 2009
    ntpd 4.2.4p5-a Mon Aug 24 23:55:52 UTC 2009 (1)
    ntpdate 4.2.4p5-a Mon Aug 24 23:55:53 UTC 2009 (1)
    ntpdc 4.2.4p5-a Mon Aug 24 23:55:53 UTC 2009 (1)
    Tue Aug 25 00:21:21 UTC 2009
    Tue Aug 25 00:21:21 UTC 2009
    Tue Aug 25 00:21:21 UTC 2009
    Mon Aug 24 23:46:47 UTC 2009

    FreeBSD/amd64 7.2-RELEASE initialization build complete.  Please
    review the list of build stamps printed above to confirm that
    they look sensible, then run
    # sh -e approve.sh amd64 7.2-RELEASE
    to sign the release.

Approve the build if everything is correct. More information on
determining this can be found in the distributed source file named
``USAGE``. Execute ``scripts/approve.sh``, as directed. This will sign
the release, and move components into a staging area suitable for
uploading.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cd /usr/local/freebsd-update-server
    # sh scripts/mountkey.sh

.. raw:: html

   </div>

.. code:: screen

    # sh -e scripts/approve.sh amd64 7.2-RELEASE
    Wed Aug 26 12:50:06 PDT 2009 Signing build for FreeBSD/amd64 7.2-RELEASE
    Wed Aug 26 12:50:06 PDT 2009 Copying files to patch source directories for FreeBSD/amd64 7.2-RELEASE
    Wed Aug 26 12:50:06 PDT 2009 Copying files to upload staging area for FreeBSD/amd64 7.2-RELEASE
    Wed Aug 26 12:50:07 PDT 2009 Updating databases for FreeBSD/amd64 7.2-RELEASE
    Wed Aug 26 12:50:07 PDT 2009 Cleaning staging area for FreeBSD/amd64 7.2-RELEASE

After the approval process is complete, the upload procedure may be
started.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cd /usr/local/freebsd-update-server
    # sh scripts/upload.sh amd64 7.2-RELEASE

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In the event update code needs to be re-uploaded, this may be done by
changing to the public distributions directory for the target release
and updating attributes of the *uploaded* file.

.. raw:: html

   <div class="informalexample" xmlns="http://www.w3.org/1999/xhtml">

.. code:: screen

    # cd /usr/local/freebsd-update-server/pub/7.2-RELEASE/amd64
    # touch -t 200801010101.01 uploaded

.. raw:: html

   </div>

.. raw:: html

   </div>

The uploaded files will need to be in the document root of the webserver
in order for updates to be distributed. The exact configuration will
vary depending on the web server used. For the Apache web server, please
refer to the `Configuration of Apache
servers <../../../../doc/en_US.ISO8859-1/books/handbook/network-apache.html>`__
section in the Handbook.

Update client's ``KeyPrint`` and ``ServerName`` in
``/etc/freebsd-update.conf``, and perform updates as instructed in the
`FreeBSD
Update <../../../../doc/en_US.ISO8859-1/books/handbook/updating-upgrading-freebsdupdate.html>`__
section of the Handbook.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

In order for FreeBSD Update Server to work properly, updates for both
the *current* release and the release *one wants to upgrade to* need to
be built. This is necessary for determining the differences of files
between releases. For example, when upgrading a FreeBSD system from
7.1-RELEASE to 7.2-RELEASE, updates will need to be built and uploaded
to your distribution server for both versions.

.. raw:: html

   </div>

For reference, the entire run of ```init.sh`` <init.txt>`__ is attached.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------+----------------------------+
| `Prev <Configuration.html>`__?            | ?                       | ?\ `Next <patch.html>`__   |
+-------------------------------------------+-------------------------+----------------------------+
| 4.?Configuration: Installation & Setup?   | `Home <index.html>`__   | ?6.?Building a Patch       |
+-------------------------------------------+-------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
