=========================
11.4. Maple™ installieren
=========================

.. raw:: html

   <div class="navheader">

11.4. Maple™ installieren
`Zur?ck <linuxemu-mathematica.html>`__?
Kapitel 11. Linux-Bin?rkompatibilit?t
?\ `Weiter <linuxemu-matlab.html>`__

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

11.4. Maple™ installieren
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Aaron Kaplan.

.. raw:: html

   </div>

.. raw:: html

   <div>

Mit Unterst?tzung durch Robert Getschmann.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Maple™ ist ein mit Mathematica? vergleichbares kommerzielles
Mathematikprogramm. Sie k?nnen dieses Programm unter
``http://www.maplesoft.com/`` kaufen und sich anschlie?end registrieren,
um eine Lizenz zu erhalten. Um dieses Programm unter FreeBSD zu
installieren, gehen Sie wie folgt vor:

.. raw:: html

   <div class="procedure">

#. F?hren Sie das ``INSTALL``-Shell-Skript der Softwaredistribution aus.
   W?hlen Sie die „RedHat“-Option aus, wenn Sie das
   Installationsprogramm danach fragt. Ein typisches
   Installationsverzeichnis w?re z.B. ``/usr/local/maple``.

#. Wenn Sie dies noch nicht gemacht haben, besorgen Sie sich nun eine
   Maple™-Lizenz von Maple Waterloo Software
   (``http://register.maplesoft.com``) und kopieren Sie diese nach
   ``/usr/local/maple/license/license.dat``.

#. Installieren Sie den FLEXlm-Lizenz-Manager, indem Sie das
   ``INSTALL_LIC``-Installations-Shellskript ausf?hren, das mit Maple™
   ausgeliefert wird. Geben Sie Ihren prim?ren Rechnernamen f?r den
   Lizenz-Server an.

#. Ver?ndern Sie ``/usr/local/maple/bin/maple.system.type`` wie folgt:

   .. code:: programlisting

          ----- snip ------------------
       *** maple.system.type.orig      Sun Jul  8 16:35:33 2001
       --- maple.system.type   Sun Jul  8 16:35:51 2001
       ***************
       *** 72,77 ****
       --- 72,78 ----
                 # the IBM RS/6000 AIX case
                 MAPLE_BIN="bin.IBM_RISC_UNIX"
                 ;;
       +     "FreeBSD"|\
             "Linux")
                 # the Linux/x86 case
               # We have two Linux implementations, one for Red Hat and
          ----- snip end of patch -----

   Bitte beachten Sie, dass nach ``"FreeBSD"|\`` kein anderes Zeichen
   eingef?gt werden darf.

   Dieser Patch weist Maple™ an, FreeBSD als „eine Art von Linux-System“
   zu erkennen. Das Shell-Skript ``bin/maple`` ruft das Shell-Skript
   ``bin/maple.system.type`` auf, welches wiederum ``uname -a``
   verwendet, um den Namen des Betriebssystems herauszufinden. Abh?ngig
   vom Betriebssystem wei? das System nun, welche Bin?rdateien verwendet
   werden sollen.

#. Starten Sie den Lizenz-Server.

   Das folgende, als ``/usr/local/etc/rc.d/lmgrd`` installierte
   Shell-Skript ist ein komfortabler Weg, um ``lmgrd`` zu starten:

   .. code:: programlisting

          ----- snip ------------

       #! /bin/sh
       PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin
       PATH=${PATH}:/usr/local/maple/bin:/usr/local/maple/FLEXlm/UNIX/LINUX
       export PATH

       LICENSE_FILE=/usr/local/maple/license/license.dat
       LOG=/var/log/lmgrd.log

       case "$1" in
       start)
           lmgrd -c ${LICENSE_FILE} 2>> ${LOG} 1>&2
           echo -n " lmgrd"
           ;;
       stop)
           lmgrd -c ${LICENSE_FILE} -x lmdown 2>> ${LOG} 1>&2
           ;;
       *)
           echo "Usage: `basename $0` {start|stop}" 1>&2
           exit 64
           ;;
       esac

       exit 0
          ----- snip ------------

#. Versuchen Sie, Maple™ zu starten:

   .. code:: screen

       % cd /usr/local/maple/bin
       % ./xmaple

   Nun sollte das Programm laufen und alles funktionieren. Falls ja,
   vergessen Sie nicht, an Maplesoft zu schreiben und sie wissen zu
   lassen, dass Sie gerne eine native FreeBSD-Version h?tten.

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

11.4.1. H?ufige Fehlerquellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  Der FLEXlm-Lizenzmanager kann schwierig zu bedienen sein. Zus?tzliche
   Dokumentation zu diesem Thema finden Sie unter
   ``http://www.globetrotter.com/``.

-  Es ist bekannt, dass ``lmgrd`` sehr pingelig ist, wenn es um die
   Lizenzdatei geht. Gibt es Probleme, f?hrt dies zu einem
   Speicherauszug (*core dump*). Ein korrekte Lizenzdatei sollte ?hnlich
   der folgenden aussehen:

   .. code:: programlisting

       # =======================================================
       # License File for UNIX Installations ("Pointer File")
       # =======================================================
       SERVER chillig ANY
       #USE_SERVER
       VENDOR maplelmg

       FEATURE Maple maplelmg 2000.0831 permanent 1 XXXXXXXXXXXX \
                PLATFORMS=i86_r ISSUER="Waterloo Maple Inc." \
                ISSUED=11-may-2000 NOTICE=" Technische Universitat Wien" \
                SN=XXXXXXXXX

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Seriennummer und Schl?ssel wurden durch mehrere ``X`` unkenntlich
   gemacht. ``chillig`` ist ein Rechnername.

   .. raw:: html

      </div>

   Ver?nderungen an der Lizenzdatei sind m?glich, solange Sie die
   ``FEATURE``-Zeile nicht ver?ndern (diese ist durch den
   Lizenzschl?ssel gesch?tzt).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------------+----------------------------------------+
| `Zur?ck <linuxemu-mathematica.html>`__?   | `Nach oben <linuxemu.html>`__   | ?\ `Weiter <linuxemu-matlab.html>`__   |
+-------------------------------------------+---------------------------------+----------------------------------------+
| 11.3. Mathematica? installieren?          | `Zum Anfang <index.html>`__     | ?11.5. MATLAB? installieren            |
+-------------------------------------------+---------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
