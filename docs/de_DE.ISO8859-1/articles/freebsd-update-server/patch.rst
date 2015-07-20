=================================
6. Eine Fehlerkorrektur erstellen
=================================

.. raw:: html

   <div class="navheader">

6. Eine Fehlerkorrektur erstellen
`Zur?ck <build.html>`__?
?
?\ `Weiter <tips.html>`__

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

   <div class="navfooter">

--------------

+-----------------------------+-------------------------------+-----------------------------+
| `Zur?ck <build.html>`__?    | ?                             | ?\ `Weiter <tips.html>`__   |
+-----------------------------+-------------------------------+-----------------------------+
| 5. Den Update Code bauen?   | `Zum Anfang <index.html>`__   | ?7. Tipps                   |
+-----------------------------+-------------------------------+-----------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
