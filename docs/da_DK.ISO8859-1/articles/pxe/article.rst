=======================
FreeBSD kvikstart Guide
=======================

.. raw:: html

   <div class="article" lang="da" lang="da">

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

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Alfred Perlstein
~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<alfred@FreeBSD.org>``

.. raw:: html

   </div>

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

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Intel, Celeron, Centrino, Core, EtherExpress, i386, i486, Itanium,
Pentium, and Xeon are trademarks or registered trademarks of Intel
Corporation or its subsidiaries in the United States and other
countries.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

af .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Resum?

.. raw:: html

   </div>

Denne artikel viser metoden hvorved man kan f? maskiner til at
installere FreeBSD ved hj?lp af Intel? PXE metoden til at boote en
maskine over et netv?rk.

*Dansk version af Laust S. Jespersen ``<Laust@doc.freebsd.dk>``.*

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

Indholdsfortegnelse

.. raw:: html

   </div>

`1. Introduktion <#introduction>`__
`2. Server Konfiguration <#server-config>`__
`3. Bootstrap ops?tning <#bootstrap-config>`__
`4. Installations ops?tning <#install-setup>`__
`5. Tilpasset Post-Install Pakke <#custom-postinst-package>`__

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

1. Introduktion
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Advarsel:
~~~~~~~~~

Denne procedure vil g?re “Serveren” b?de usikker og farlig. Det er bedst
bare at holde “Serveren” p? sin egen hub og ikke p? nogen m?de
tilg?ngelig for andre maskiner end “klienterne”.

.. raw:: html

   </div>

Terminologi:

.. raw:: html

   <div class="informaltable">

+-----------+--------------------------------------------------------------+
| Server:   | Maskinen der tilbyder netboot og installations muligheder.   |
+-----------+--------------------------------------------------------------+
| Klient:   | Maskinen der skal have FreeBSD installeret p? sig.           |
+-----------+--------------------------------------------------------------+

.. raw:: html

   </div>

Kr?ver: Klienter der underst?tter Intel? PXE netboot muligheden, en
Ethernet forbindelse.

Lad mig gerne vide hvis du falder over noget du har problemer med, eller
forslag til yderligere dokumentation.

Hvis du skal bruge nogen til at tr?ne/implementere et specifikt
netinstallations system for dig, s? send mig venligst en e-mail s? vi
kan diskutere vilk?r.

Jeg vil ogs? gerne takke Paul Saab og John Baldwin for, at lave det
meste af programmeringsarbejdet p? pxeboot, interfacet til Intel? PXE
(netboot) systemet.

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

2. Server Konfiguration
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Install?r DHCP: Install?r
   `net/isc-dhcp3 <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3/pkg-descr>`__
   du kan bruge denne config fil ```dhcpd.conf`` <dhcpd.conf>`__, put
   den ind i ``/usr/local/etc/``.

#. Sl? tftp til:

   .. raw:: html

      <div class="procedure">

   #. Lav mappen ``/usr/tftpboot``

   #. Tilf?j denne linie til din ``/etc/inetd.conf``:

      .. code:: programlisting

          tftp    dgram   udp     wait    nobody  /usr/libexec/tftpd    tftpd /usr/tftpboot

   .. raw:: html

      </div>

#. Sl? NFS til:

   .. raw:: html

      <div class="procedure">

   #. Tilf?j dette til ``/etc/rc.conf``:

      .. code:: programlisting

          nfs_server_enable="YES"

   #. Tilf?j dette til ``/etc/exports``:

      .. code:: programlisting

          /usr -alldirs -ro

   .. raw:: html

      </div>

#. Genstart for at sl? de nye services til eller start dem manuelt.

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

3. Bootstrap ops?tning
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Download bootfiler: Download
   `kern.flp <ftp://snapshots.jp.freebsd.org/pub/FreeBSD/snapshots/i386/4-LATEST/floppies/kern.flp>`__
   og
   `mfsroot.flp <ftp://snapshots.jp.freebsd.org/pub/FreeBSD/snapshots/i386/4-LATEST/floppies/mfsroot.flp>`__
   floppy imagesne.

#. Ops?tning af ftp/pxe-boot mappen:

   .. raw:: html

      <div class="procedure">

   #. Put pxeboot i boot mappen:

      .. code:: screen

          # rm -rf /usr/obj/*
          # cd /usr/src/sys/boot
          # make
          # cp /usr/src/sys/boot/i386/pxeldr/pxeboot /usr/tftpboot

   #. Mount ``kern.flp`` filen ved hj?lp af vndevice og kopier dens
      indhold til ``/usr/tftpboot``:

      .. code:: screen

          # vnconfig vn0 kern.flp    # associer et vndevice med filen
          # mount /dev/vn0 /mnt      # mount det
          # cp -R /mnt /usr/tftpboot # kopier indholdet til /usr/tftpboot
          # umount /mnt              # unmount det
          # vnconfig -u vn0          # disassocier vndevicet fra filen

   .. raw:: html

      </div>

#. Kompiler en tilpasset kernel for klienterne (for at undg? device
   konfigurations sk?rmen ved boot) og put den i ``/usr/tftpboot``.

#. Lav en speciel ``loader.rc`` og installer det i
   ``/usr/tftpboot/boot/loader.rc`` s? den ikke prompter for den anden
   disk, her er `min <loader.rc>`__.

#. Pak installeren og hj?lpeprogrammerne fra mfsroot disken ud og
   dekomprimer dem, put dem ned i\ ``/usr/tftpboot`` ogs?:

   .. code:: screen

       # vnconfig vn0 mfsroot.flp         # associer et vndevice med filen
       # mount /dev/vn0 /mnt              # mount det
       # cp /mnt/mfsroot.gz /usr/tftpboot # kopier indholdet til /usr/tftpboot
       # umount /mnt                      # unmount det
       # vnconfig -u vn0                  # disassocier vndevicet fra filen
       # cd /usr/tftpboot                 # skift mappe til pxeboot mappen
       # gunzip mfsroot.gz                # dekomprimer mfsroot

#. Lav dit sysinstall script ``install.cfg``, du kan bruge
   `mit <install.cfg>`__ som en skabelon, men du er n?d til at editere
   det.

#. Kopier sysinstall scriptet ind i det udpakkede og dekomprimerede
   mfsroot image:

   .. code:: screen

       # cd /usr/tftpboot
       # vnconfig vn0 mfsroot
       # mount /dev/vn0 /mnt
       # cp install.cfg /mnt
       # umount /mnt
       # vnconfig -u vn0

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

4. Installations ops?tning
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Put installations filerne i en mappe der kan n?s via NFS p? Serveren.
   Lav en mappe der svarer til 'nfs' direktivet i ``install.cfg`` filen
   og lav et spejl af FreeBSD installations filerne der, du skal have
   det til at se ud nogenlunde s?dan her:

   .. code:: screen

       ABOUT.TXT       TROUBLE.TXT     compat20        floppies        ports
       ERRATA.TXT      UPGRADE.TXT     compat21        games           proflibs
       HARDWARE.TXT    XF86336         compat22        info            src
       INSTALL.TXT     bin             compat3x        kern.flp
       LAYOUT.TXT      catpages        crypto          manpages
       README.TXT      cdrom.inf       dict            mfsroot.flp
       RELNOTES.TXT    compat1x        doc             packages

#. Kopier de komprimerede pakker ind i packages/All mappen under
   ``nfs``.

#. V?r sikker p?, at du har en ``INDEX`` fil gjort klar i packages
   mappen. Du kan lave dine egne ``INDEX`` notater s?dan her:

   .. code:: programlisting

       alfred-1.0||/|Alfred install bootstrap||alfred@FreeBSD.org||||

   S? kan du installere tilpassede pakker, specielt din egen tilpassede
   post-install pakke.

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

5. Tilpasset Post-Install Pakke
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Du kan bruge scriptet ```pkgmaker.sh `` <pkgmaker.sh>`__ til at lave en
tilpasset pakke til post install. Ideen er at have den til at installere
og konfigurere de specielle ting du vil have gjort. ``pkgmaker`` K?res i
mappen ovenover den pakke du ?nsker at lave med det ene argument fra
pakken (f. eks mypkg) som s? vil lave en mypkg.tgz som du s? kan
inkludere i din sysinstall pakke.

Inde i din mappe med tilpassede pakker vil du have en fil kaldet
``PLIST`` som indeholder alle de filer du ?nsker at installere og f?
inkorporeret i din pakke.

Du vil ogs? ?nske dig at have nogle filer kaldet ```pre`` <pre>`__ og
```post`` <post>`__ i den mappe, disse er shell scripts som du vil
eksekverer f?r og efter din pakke er installeret.

Siden denne pakke er i din ``install.cfg`` fil burde den blive k?rt og
lave den sidste konfiguration for dig.

.. raw:: html

   </div>

.. raw:: html

   </div>
