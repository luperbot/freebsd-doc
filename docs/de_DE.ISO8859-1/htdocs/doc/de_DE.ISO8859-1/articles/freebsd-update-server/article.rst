=========================================
Einen eigenen FreeBSD Update Server bauen
=========================================

.. raw:: html

   <div class="article" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Jason Helfman
~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

Jason?Helfman

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2009-2011, 2013 Jason Helfman

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD ist ein eingetragenes Warenzeichen der FreeBSD Foundation.

Viele Produktbezeichnungen von Herstellern und Verk?ufern sind
Warenzeichen. Soweit dem FreeBSD Project das Warenzeichen bekannt ist,
werden die in diesem Dokument vorkommenden Bezeichnungen mit dem Symbol
„™“ oder dem Symbol „?“ gekennzeichnet.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium und Xeon sind
Warenzeichen oder eingetragene Warenzeichen der Intel Corporation oder
ihrer Gesellschaften in den Vereinigten Staaten und in anderen L?ndern.

AMD, AMD Athlon, AMD Opteron, ?lan und PCnet sind eingetragene
Warenzeichen von Advanced Micro Devices, Inc.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Dieser Artikel beschreibt den Bau eines internen FreeBSD Update Server.
Die
`freebsd-update-server <http://svnweb.freebsd.org/base/user/cperciva/freebsd-update-build/>`__
Software wurde von Colin Percival, emeritierter Security Officer von
FreeBSD, geschrieben. Benutzer, die es als vorteilhaft ansehen ihre
Systeme ?ber einen offiziellen Update-Server zu aktualisieren, k?nnen
mit Hilfe eines selbst erstellten FreeBSD Update Server die
Funktionalit?t ?ber manuell optimierte FreeBSD Releases oder ?ber
Bereitstellung eines lokalen Mirror, welcher schnellere Updates
erm?glicht, erweitern.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. Danksagung <#acknowledgments>`__
`2. Einf?hrung <#introduction>`__
`3. Voraussetzungen <#prerequisites>`__
`4. Konfiguration: Installation & Setup <#Configuration>`__
`5. Den Update Code bauen <#build>`__
`6. Eine Fehlerkorrektur erstellen <#patch>`__
`7. Tipps <#tips>`__

.. raw:: html

   </div>

*?bersetzt von Bj?rn Heidotting*.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1. Danksagung
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Artikel wurde anschlie?end im `BSD
Magazine <http://bsdmag.org/magazine/1021-bsd-as-a-desktop>`__ gedruckt.

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

2. Einf?hrung
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Erfahrene Benutzer oder Administratoren sind h?ufig f?r etliche
Maschinen oder Umgebungen verantwortlich. Sie verstehen die schwierigen
Anforderungen und Herausforderungen der Aufrechterhaltung einer solchen
Infrastruktur. Ein FreeBSD Update Server macht es einfacher,
Sicherheits- und Software-Korrekturen f?r ausgew?hlte Test-Maschinen
bereitzustellen, bevor diese dann auf den Produktionssystemen ausgerollt
werden. Es bedeutet auch, dass eine Reihe von Systemen ?ber das lokale
Netzwerk, anstatt ?ber eine langsame Internet-Verbindung, aktualisiert
werden k?nnen. Dieser Artikel beschreibt die Vorgehensweise zum
Erstellen eines eigenen FreeBSD Update Server.

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

3. Voraussetzungen
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?r den Bau eines internen FreeBSD Update Server sollten einige
Anforderungen erf?llt werden.

.. raw:: html

   <div class="itemizedlist">

-  Ein laufendes FreeBSD System.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Als Minimum, muss das zu verteilende Ziel-Release auf einer gleichen,
   oder h?heren FreeBSD Version gebaut werden.

   .. raw:: html

      </div>

-  Ein Benutzerkonto mit mindestens 4?GB freiem Speicherplatz. Dies
   erlaubt die Erstellung der Updates f?r 7.1 und 7.2. Der genaue
   Platzbedarf kann sich aber von Version zu Version ?ndern.

-  Ein
   `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
   Konto auf einem entfernten System, um die sp?ter zu verteilenden
   Updates hochzuladen.

-  Einen Webserver, wie
   `Apache <../../../../doc/de_DE.ISO8859-1/books/handbook/network-apache.html>`__,
   wobei ?ber die H?lfte des Platzes f?r den Bau ben?tigt wird. Als
   Beispiel ben?tigt der Bau von 7.1 und 7.2 insgesamt 4?GB. Der
   Speicherplatz, den der Webserver f?r die Verteilung dieser Updates
   ben?tigt, w?rde 2.6?GB betragen.

-  Grundlegende Kenntnisse im Shell Skripting mit der Bourne Shell,
   `sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__.

.. raw:: html

   </div>

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

4. Konfiguration: Installation & Setup
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Laden Sie
die\ `freebsd-update-server <http://svnweb.freebsd.org/base/user/cperciva/freebsd-update-build/>`__
Software durch die Installation von
`devel/subversion <http://www.freebsd.org/cgi/url.cgi?ports/devel/subversion%20/pkg-descr>`__,
und starten Sie:

.. code:: screen

    % svn co http://svn.freebsd.org/base/user/cperciva/freebsd-update-build freebsd-update-server

Passen Sie ``scripts/build.conf`` an Ihre Bed?rfnisse an. Diese Datei
wird bei jedem Bau mit einbezogen.

Hier ist die Standardeinstellung f?r ``build.conf``, welche Sie f?r Ihre
Umgebung anpassen sollten.

.. raw:: html

   <div class="informalexample">

.. code:: programlisting


    # Main configuration file for FreeBSD Update builds.  The
    # release-specific configuration data is lower down in
    # the scripts tree.

    # Location from which to fetch releases
    export FTP=ftp://ftp2.freebsd.org/pub/FreeBSD/releases

    # Host platform
    export HOSTPLATFORM=`uname -m`

    # Host name to use inside jails
    export BUILDHOSTNAME=${HOSTPLATFORM}-builder.daemonology.net

    # Location of SSH key
    export SSHKEY=/root/.ssh/id_dsa

    # SSH account into which files are uploaded
    MASTERACCT=builder@wadham.daemonology.net

    # Directory into which files are uploaded
    MASTERDIR=update-master.freebsd.org

.. raw:: html

   </div>

Parameter, die zu ber?cksichtigen sind:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#ftp-id>`__                    | Dies ist der Ort, von dem die ISO    |
|                                      | Abbilder (?ber die ``fetchiso()`` in |
|                                      | ``scripts/build.subr``)              |
|                                      | heruntergeladen werden. Der Ort ist  |
|                                      | nicht auf FTP URIs beschr?nkt. Jedes |
|                                      | URI-Schema, welches von              |
|                                      | `fetch(1) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=fetch&sektion=1>`__  |
|                                      | unterst?tzt wird, sollte hier gut    |
|                                      | funktionieren.                       |
|                                      |                                      |
|                                      | Anpassungen am ``fetchiso()`` Code   |
|                                      | k?nnen Sie vornehmen, indem Sie das  |
|                                      | Standardskript ``build.subr`` in den |
|                                      | Release- und                         |
|                                      | Architektur-spezifischen Bereich in  |
|                                      | ``scripts/RELEASE/ARCHITECTURE/build |
|                                      | .subr``                              |
|                                      | kopieren und dort lokale ?nderungen  |
|                                      | vornehmen.                           |
+--------------------------------------+--------------------------------------+
| `|2| <#buildhost-id>`__              | Der Name des Build-Hosts. Auf        |
|                                      | aktualisierten Systemen k?nnen Sie   |
|                                      | diese Information wie folgt          |
|                                      | ausgeben:                            |
|                                      |                                      |
|                                      | .. code:: screen                     |
|                                      |                                      |
|                                      |     % uname -v                       |
+--------------------------------------+--------------------------------------+
| `|3| <#sshkey-id>`__                 | Der SSH Schl?ssel f?r das Hochladen  |
|                                      | der Dateien auf den Update Server.   |
|                                      | Ein Schl?sselpaar kann durch die     |
|                                      | Eingabe von ``ssh-keygen -t dsa``    |
|                                      | erstellt werden. Dieser Parameter    |
|                                      | ist jedoch optional; Standard        |
|                                      | Password Authentifizierung wird als  |
|                                      | Fallback-Methode benutzt wenn        |
|                                      | ``SSHKEY`` nicht definiert ist.      |
|                                      |                                      |
|                                      | Die                                  |
|                                      | `ssh-keygen(1) <http://www.FreeBSD.o |
|                                      | rg/cgi/man.cgi?query=ssh-keygen&sekt |
|                                      | ion=1>`__                            |
|                                      | Manualpage enth?lt detaillierte      |
|                                      | Informationen zu SSH und die         |
|                                      | entsprechenden Schritte zur          |
|                                      | Erstellung und Verwendung von        |
|                                      | Schl?sseln.                          |
+--------------------------------------+--------------------------------------+
| `|4| <#mstacct-id>`__                | Benutzerkonto zum Hochladen von      |
|                                      | Dateien auf den Update-Server.       |
+--------------------------------------+--------------------------------------+
| `|5| <#mstdir-id>`__                 | Verzeichnis auf dem Update-Server,   |
|                                      | in welches die Dateien hochgeladen   |
|                                      | werden.                              |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Die Standard ``build.conf``, die mit den freebsd-update-server Quellen
ausgeliefert wird ist geeignet um i386 Releases von FreeBSD zu bauen.
Als Beispiel f?r den Aufbau eines Update-Servers f?r andere
Architekturen beschreiben die folgenden Schritte die Konfiguration f?r
amd64:

.. raw:: html

   <div class="procedure">

#. Erstellen Sie eine Bau-Umgebung f?r amd64:

   .. raw:: html

      <div class="informalexample">

   .. code:: screen

       % mkdir -p /usr/local/freebsd-update-server/scripts/7.2-RELEASE/amd64

   .. raw:: html

      </div>

#. Installieren Sie eine ``build.conf`` in das neu erstellte
   Verzeichnis. Die Konfigurationsoptionen f?r FreeBSD 7.2-RELEASE auf
   amd64 sollten ?hnlich wie die folgenden sein:

   .. raw:: html

      <div class="informalexample">

   .. code:: programlisting

       # SHA256 hash of RELEASE disc1.iso image.
       export RELH=1ea1f6f652d7c5f5eab7ef9f8edbed50cb664b08ed761850f95f48e86cc71ef5

       # Components of the world, source, and kernels
       export WORLDPARTS="base catpages dict doc games info manpages proflibs lib32"
       export SOURCEPARTS="base bin contrib crypto etc games gnu include krb5  \
                       lib libexec release rescue sbin secure share sys tools  \
                       ubin usbin cddl"
       export KERNELPARTS="generic"

       # EOL date
       export EOL=1275289200

   .. raw:: html

      </div>

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | `|1| <#sha256-id>`__                 | Der                                  |
   |                                      | `sha256(1) <http://www.FreeBSD.org/c |
   |                                      | gi/man.cgi?query=sha256&sektion=1>`_ |
   |                                      | _                                    |
   |                                      | Fingerabdruck f?r die gew?nschte     |
   |                                      | Version wird innerhalb der           |
   |                                      | jeweiligen                           |
   |                                      | `Release-Ank?ndigung <../../../../re |
   |                                      | leases/>`__                          |
   |                                      | ver?ffentlicht.                      |
   +--------------------------------------+--------------------------------------+
   | `|2| <#eol-id>`__                    | Um die "End of Life" Nummer f?r die  |
   |                                      | ``build.conf``\ zu generieren,       |
   |                                      | beziehen Sie sich bitte auf          |
   |                                      | "Estimated EOL" auf der `FreeBSD     |
   |                                      | Security                             |
   |                                      | Webseite <../../../../security/secur |
   |                                      | ity.html>`__.                        |
   |                                      | Der Wert f?r ``EOL`` kann aus dem    |
   |                                      | Datum, das auf der Webseite          |
   |                                      | ver?ffentlicht ist, abgeleitet       |
   |                                      | werden. Benutzen Sie daf?r das       |
   |                                      | Werkzeug                             |
   |                                      | `date(1) <http://www.FreeBSD.org/cgi |
   |                                      | /man.cgi?query=date&sektion=1>`__.   |
   |                                      | Dazu ein Beispiel:                   |
   |                                      |                                      |
   |                                      | .. code:: screen                     |
   |                                      |                                      |
   |                                      |     % date -j -f '%Y%m%d-%H%M%S' '20 |
   |                                      | 090401-000000' '+%s'                 |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

.. raw:: html

   </div>

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

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6. Eine Fehlerkorrektur erstellen
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jedes Mal, wenn ein
`Sicherheits-Hinweis <../../../../security/advisories.html>`__ oder ein
`Fehler-Hinweis <../../../../security/notices.html>`__ angek?ndigt wird,
kann eine Fehlerkorrektur gebaut werden.

F?r dieses Beispiel wird 7.1-RELEASE benutzt.

F?r den Bau eines anderen Release werden ein paar Annahmen getroffen:

.. raw:: html

   <div class="itemizedlist">

-  Richten Sie die korrekte Verzeichnisstruktur f?r den ersten Bau ein.

-  F?hren Sie einen ersten Bau f?r 7.1-RELEASE aus.

.. raw:: html

   </div>

Erstellen Sie das Korrekturverzeichnis des jeweiligen Releases unter
``/usr/local/freebsd-update-server/patches/``.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % mkdir -p /usr/local/freebsd-update-server/patches/7.1-RELEASE/
    % cd /usr/local/freebsd-update-server/patches/7.1-RELEASE

.. raw:: html

   </div>

Als Beispiel nehmen Sie die Korrektur f?r
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__.
Lesen Sie den Hinweis und laden Sie die erforderliche Datei von `FreeBSD
Sicherheits-Hinweise <../../../../security/advisories.html>`__ herunter.
Weitere Informationen zur Interpretation der Sicherheitshinweise finden
Sie im `FreeBSD
Handbuch <../../../../doc/de_DE.ISO8859-1/books/handbook/security-advisories.html>`__.

In der `Sicherheits
Anweisung <http://security.freebsd.org/advisories/FreeBSD-SA-09:12.bind.asc>`__,
nennt sich dieser Hinweis ``SA-09:12.bind``. Nach dem Herunterladen der
Datei, ist es erforderlich, die Datei auf einen geeigneten Patch-Level
umzubenennen. Es steht Ihnen frei den Namen frei zu w?hlen, es wird
jedoch nahegelegt, diesen im Einklang mit dem offiziellen FreeBSD
Patch-Level zu halten. F?r diesen Bau folgen wir der derzeit g?ngigen
Praxis von FreeBSD und benennen sie ``p7``. Benennen Sie die Datei um:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % cd /usr/local/freebsd-update-server/patches/7.1-RELEASE/; mv bind.patch 7-SA-09:12.bind 

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn ein Patch-Level gebaut wird, wird davon ausgegangen, dass die
bisherigen Korrekturen bereits vorhanden sind. Wenn der Bau l?uft,
werden alle Korrekturen aus dem Patchverzeichnis mit gebaut.

Es k?nnen auch selbsterstellte Korrekturen zum Bau hinzugef?gt werden.
Benutzen Sie die Zahl Null, oder jede andere Zahl.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Es liegt in der Verantwortung des Administrators des FreeBSD Update
Server geeignete Ma?nahmen zu treffen, um die Authentizit?t jeder
Fehlerkorrektur zu ?berpr?fen.

.. raw:: html

   </div>

An dieser Stelle sind wir bereit, einen *Diff* zu bauen. Die Software
pr?ft zun?chst, ob ``scripts/init.sh`` f?r das jeweilige Release
gelaufen ist, bevor mit dem Bau des Diff begonnen wird.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cd /usr/local/freebsd-update-server
    # sh scripts/diff.sh amd64 7.1-RELEASE 7

.. raw:: html

   </div>

Es folgt ein Beispiel f?r einen *Diff* Bauprozess.

.. code:: screen

    # sh -e scripts/diff.sh amd64 7.1-RELEASE 7
    Wed Aug 26 10:09:59 PDT 2009 Extracting world+src for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 17:10:25 UTC 2009 Building world for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 18:05:11 UTC 2009 Distributing world for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 18:06:16 UTC 2009 Building and distributing kernels for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 18:17:50 UTC 2009 Constructing world components for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 18:18:02 UTC 2009 Distributing source for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 11:19:23 PDT 2009 Moving components into staging area for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 11:19:37 PDT 2009 Extracting extra docs for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 11:19:42 PDT 2009 Indexing world0 for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 11:23:02 PDT 2009 Extracting world+src for FreeBSD/amd64 7.1-RELEASE-p7
    Thu Sep 30 18:23:29 UTC 2010 Building world for FreeBSD/amd64 7.1-RELEASE-p7
    Thu Sep 30 19:18:15 UTC 2010 Distributing world for FreeBSD/amd64 7.1-RELEASE-p7
    Thu Sep 30 19:19:18 UTC 2010 Building and distributing kernels for FreeBSD/amd64 7.1-RELEASE-p7
    Thu Sep 30 19:30:52 UTC 2010 Constructing world components for FreeBSD/amd64 7.1-RELEASE-p7
    Thu Sep 30 19:31:03 UTC 2010 Distributing source for FreeBSD/amd64 7.1-RELEASE-p7
    Thu Sep 30 12:32:25 PDT 2010 Moving components into staging area for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 12:32:39 PDT 2009 Extracting extra docs for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 12:32:43 PDT 2009 Indexing world1 for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 12:35:54 PDT 2009 Locating build stamps for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 12:36:58 PDT 2009 Reverting changes due to build stamps for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 12:37:14 PDT 2009 Cleaning staging area for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 12:37:14 PDT 2009 Preparing to copy files into staging area for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 12:37:15 PDT 2009 Copying data files into staging area for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 12:43:23 PDT 2009 Copying metadata files into staging area for FreeBSD/amd64 7.1-RELEASE-p7
    Wed Aug 26 12:43:25 PDT 2009 Constructing metadata index and tag for FreeBSD/amd64 7.1-RELEASE-p7
    ...
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
    Values of build stamps, excluding library archive headers:
    v1.2 (Aug 26 2009 18:13:46)
    v1.2 (Aug 26 2009 18:11:44)
    @(#)FreeBSD 7.1-RELEASE-p7 #0: Wed Aug 26 18:11:50 UTC 2009
    FreeBSD 7.1-RELEASE-p7 #0: Wed Aug 26 18:11:50 UTC 2009
        root@server.myhost.com:/usr/obj/usr/src/sys/GENERIC
    7.1-RELEASE-p7
    Wed Aug 26 17:29:15 UTC 2009
    Wed Aug 26 17:29:15 UTC 2009
    ##### built by root@server.myhost.com on Wed Aug 26 17:49:58 UTC 2009
    ##### built by root@server.myhost.com on Wed Aug 26 17:49:58 UTC 2009
    ##### built by root@server.myhost.com on Wed Aug 26 17:49:58 UTC 2009
    ##### built by root@server.myhost.com on Wed Aug 26 17:49:58 UTC 2009
    Wed Aug 26 17:20:39 UTC 2009
    ntpq 4.2.4p5-a Wed Aug 26 17:29:42 UTC 2009 (1)
     * Copyright (c) 1992-2009 The FreeBSD Project.
    Wed Aug 26 17:20:39 UTC 2009
    Wed Aug 26 17:29:30 UTC 2009
    Aug 26 2009
    ntpd 4.2.4p5-a Wed Aug 26 17:29:41 UTC 2009 (1)
    ntpdate 4.2.4p5-a Wed Aug 26 17:29:42 UTC 2009 (1)
    ntpdc 4.2.4p5-a Wed Aug 26 17:29:42 UTC 2009 (1)
    Wed Aug 26 17:55:02 UTC 2009
    Wed Aug 26 17:55:02 UTC 2009
    Wed Aug 26 17:55:02 UTC 2009
    Wed Aug 26 17:20:39 UTC 2009
    ...

Die Updates werden angezeigt und warten auf Genehmigung.

.. code:: screen

    New updates:
    kernel|generic|/GENERIC/kernel.symbols|f|0|0|0555|0|7c8dc176763f96ced0a57fc04e7c1b8d793f27e006dd13e0b499e1474ac47e10|
    kernel|generic|/GENERIC/kernel|f|0|0|0555|0|33197e8cf15bbbac263d17f39c153c9d489348c2c534f7ca1120a1183dec67b1|
    kernel|generic|/|d|0|0|0755|0||
    src|base|/|d|0|0|0755|0||
    src|bin|/|d|0|0|0755|0||
    src|cddl|/|d|0|0|0755|0||
    src|contrib|/contrib/bind9/bin/named/update.c|f|0|10000|0644|0|4d434abf0983df9bc47435670d307fa882ef4b348ed8ca90928d250f42ea0757|
    src|contrib|/contrib/bind9/lib/dns/openssldsa_link.c|f|0|10000|0644|0|c6805c39f3da2a06dd3f163f26c314a4692d4cd9a2d929c0acc88d736324f550|
    src|contrib|/contrib/bind9/lib/dns/opensslrsa_link.c|f|0|10000|0644|0|fa0f7417ee9da42cc8d0fd96ad24e7a34125e05b5ae075bd6e3238f1c022a712|
    ...
    FreeBSD/amd64 7.1-RELEASE update build complete.  Please review
    the list of build stamps printed above and the list of updated
    files to confirm that they look sensible, then run
    # sh -e approve.sh amd64 7.1-RELEASE
    to sign the build.

Folgen Sie dem zuvor erw?hnten Verfahren f?r die Genehmigung des
Bauprozesses:

.. code:: screen

    # sh -e scripts/approve.sh amd64 7.1-RELEASE
    Wed Aug 26 12:50:06 PDT 2009 Signing build for FreeBSD/amd64 7.1-RELEASE
    Wed Aug 26 12:50:06 PDT 2009 Copying files to patch source directories for FreeBSD/amd64 7.1-RELEASE
    Wed Aug 26 12:50:06 PDT 2009 Copying files to upload staging area for FreeBSD/amd64 7.1-RELEASE
    Wed Aug 26 12:50:07 PDT 2009 Updating databases for FreeBSD/amd64 7.1-RELEASE
    Wed Aug 26 12:50:07 PDT 2009 Cleaning staging area for FreeBSD/amd64 7.1-RELEASE

    The FreeBSD/amd64 7.1-RELEASE update build has been signed and is
    ready to be uploaded.  Remember to run
    # sh -e umountkey.sh
    to unmount the decrypted key once you have finished signing all
    the new builds.

Nachdem Sie den Bau genehmigt haben, starten Sie den Upload der
Software:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cd /usr/local/freebsd-update-server
    # sh scripts/upload.sh amd64 7.1-RELEASE

.. raw:: html

   </div>

Als Referenz wird der gesamte Verlauf von ```diff.sh`` <diff.txt>`__
beigef?gt.

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

7. Tipps
--------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  Wenn Sie ein selbst erstelltes Release ?ber die native
   ``make release``
   `Prozedur <../../../../doc/de_DE.ISO8859-1/articles/releng/release-build.html>`__
   bauen, wir der freebsd-update-server Code Ihr Release unterst?tzen.
   Als Beispiel k?nnen Sie ein Release ohne Ports oder Dokumentation
   bauen, indem Sie betreffende Funktionalit?t der Subroutinen
   `` findextradocs         ()``, ``addextradocs ()`` entfernen und eine
   Ver?nderung des Download-Verzeichnisses in ``fetchiso ()``, in
   ``scripts/build.subr``. Als letzten Schritt ?ndern Sie den
   `sha256(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sha256&sektion=1>`__
   Hash in ``build.conf`` f?r Ihr jeweiliges Release und Architektur
   damit Sie bereit sind, Ihr benutzerdefiniertes Release zu bauen.

   .. code:: screen

       # Compare ${WORKDIR}/release and ${WORKDIR}/$1, identify which parts
           # of the world|doc subcomponent are missing from the latter, and
           # build a tarball out of them.
           findextradocs () {
           }

           # Add extra docs to ${WORKDIR}/$1
           addextradocs () {
           }
           

-  Durch das Hinzuf?gen von ``-j         NUMMER`` zu den ``buildworld``
   und ``obj`` Zielen in ``scripts/build.subr`` kann die Verarbeitung,
   abh?ngig von der eingesetzten Hardware, beschleunigt werden. Die
   Benutzung dieser Optionen auf andere Ziele wird jedoch nicht
   empfohlen, da sie den Bau unzuverl?ssig machen k?nnen.

   .. code:: screen

                      # Build the world
                  log "Building world"
                  cd /usr/src &&
                  make -j 2 ${COMPATFLAGS} buildworld 2>&1

               # Distribute the world
                  log "Distributing world"
                  cd /usr/src/release &&
                  make -j 2 obj &&
                  make ${COMPATFLAGS} release.1 release.2 2>&1

-  Erstellen Sie einen geeigneten
   `DNS <../../../../doc/de_DE.ISO8859-1/books/handbook/network-dns.html>`__
   SRV Datensatz f?r den Update-Server, und f?gen Sie weitere Server mit
   verschiedenen Gewichtungen hinzu. Sie k?nnen diese M?glichkeit nutzen
   um Update-Mirror hinzuzuf?gen. Dieser Tipp ist jedoch nicht notwendig
   solange Sie keinen redundanten Service anbieten m?chten.

   .. code:: screen

        _http._tcp.update.myserver.com.                  IN SRV   0 2 80   host1.myserver.com.
                                        SRV   0 1 80   host2.myserver.com.
                                        SRV   0 0 80   host3.myserver.com.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
