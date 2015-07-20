========================
5. Den Update Code bauen
========================

.. raw:: html

   <div class="navheader">

5. Den Update Code bauen
`Zur?ck <Configuration.html>`__?
?
?\ `Weiter <patch.html>`__

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

5. Den Update Code bauen
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der erste Schritt ist das Ausf?hren von ``scripts/make.sh``. Dieses
Skript baut einige Bin?rdateien, erstellt Verzeichnisse und einen RSA
Signaturschl?ssel f?r die Genehmigung des Bau. In diesem Schritt m?ssen
Sie auch eine Passphrase f?r die Erstellung des Signaturschl?ssels
angeben.

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

Anmerkung:
~~~~~~~~~~

Notieren Sie sich den Fingerabdruck des erzeugten Schl?ssels. Dieser
Wert wird in ``/etc/freebsd-update.conf`` f?r die bin?ren Updates
ben?tigt.

.. raw:: html

   </div>

An dieser Stelle sind wir bereit, den Bauprozess zu starten.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cd /usr/local/freebsd-update-server
    # sh scripts/init.sh amd64 7.2-RELEASE

.. raw:: html

   </div>

Hier folgt ein Beispiel f?r einen *ersten* Bauprozess.

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

Anschlie?end wird das Basissystem mit den dazugeh?rigen Patches erneut
gebaut. Eine detaillierte Erkl?rung dazu finden Sie in
``scripts/build.subr``.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

W?hrend der zweiten Bauphase wird der Network Time Protocol Dienst,
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__,
ausgeschaltet. Per Colin Percival, emeritierter Security Officer von
FreeBSD, "Der
`freebsd-update-server <http://svnweb.freebsd.org/base/user/cperciva/freebsd-update-build/>`__
Code muss Zeitstempel, welche in Dateien gespeichert sind,
identifizieren, sodass festgestellt werden kann, welche Dateien
aktualisiert werden m?ssen. Dies geschieht, indem zwei Builds erstellt
werden die 400 Tage auseinander liegen und anschlie?end die Ergebnisse
verglichen werden."

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

Schlussendlich wird der Bauprozess fertiggestellt.

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

Genehmigen Sie den Bau, wenn alles korrekt ist. Weitere Informationen
zur korrekten Bestimmung finden Sie in der Quelldatei namens ``USAGE``.
F?hren Sie, wie angegeben ``scripts/approve.sh`` aus. Dieser Schritt
unterschreibt das Release und verschiebt die Komponenten an einen
Sammelpunkt, wo sie f?r den Upload verwendet werden k?nnen.

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

Nachdem der Genehmigungsprozess abgeschlossen ist, kann der Upload
gestartet werden.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cd /usr/local/freebsd-update-server
    # sh scripts/upload.sh amd64 7.2-RELEASE

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn der Update-Code erneut hochgeladen werden muss, kann dies durch die
?nderung des ?ffentlichen Distributionsverzeichnisses f?r das
Ziel-Release und der Aktualisierung der Attribute f?r die *hochgeladene*
Datei geschehen.

.. raw:: html

   <div class="informalexample" xmlns="http://www.w3.org/1999/xhtml">

.. code:: screen

    # cd /usr/local/freebsd-update-server/pub/7.2-RELEASE/amd64
    # touch -t 200801010101.01 uploaded

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die Updates zu verteilen, m?ssen die hochgeladenen Dateien im
Document Root des Webservers liegen. Die genaue Konfiguration h?ngt von
dem verwendeten Webserver ab. F?r den Apache Webserver, beziehen Sie
sich bitte auf das Kapitel `Konfiguration des Apache
Servers <../../../../doc/de_DE.ISO8859-1/books/handbook/network-apache.html>`__
im Handbuch.

Aktualisieren Sie ``KeyPrint`` und ``ServerName`` in der
``/etc/freebsd-update.conf`` des Clients und f?hren Sie das Update, wie
im Kapitel `FreeBSD
Update <../../../../doc/de_DE.ISO8859-1/books/handbook/updating-upgrading-freebsdupdate.html>`__
des Handbuchs beschrieben, aus.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Damit FreeBSD Update Server ordnungsgem?? funktioniert, muss sowohl das
*current* Release als auch das Release *auf welches Sie aktualisieren
wollen* neu gebaut werden. Dies ist notwendig, um die Unterschiede von
Dateien zwischen den beiden Releases bestimmen zu k?nnen. Zum Beispiel
beim Upgrade eines FreeBSD Systems von 7.1-RELEASE auf 7.2-RELEASE,
m?ssen f?r beide Versionen Updates gebaut und auf den Webserver
hochgeladen werden.

.. raw:: html

   </div>

Als Referenz wird der gesamte Verlauf von ```init.sh`` <init.txt>`__
beigef?gt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <Configuration.html>`__?          | ?                             | ?\ `Weiter <patch.html>`__           |
+-------------------------------------------+-------------------------------+--------------------------------------+
| 4. Konfiguration: Installation & Setup?   | `Zum Anfang <index.html>`__   | ?6. Eine Fehlerkorrektur erstellen   |
+-------------------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
