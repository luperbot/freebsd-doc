======================
3. Bootstrap ops?tning
======================

.. raw:: html

   <div class="navheader">

3. Bootstrap ops?tning
`forrige <server-config.html>`__?
?
?\ `n?ste <install-setup.html>`__

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

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+-------------------------------------+
| `forrige <server-config.html>`__?   | ?                       | ?\ `n?ste <install-setup.html>`__   |
+-------------------------------------+-------------------------+-------------------------------------+
| 2. Server Konfiguration?            | `hjem <index.html>`__   | ?4. Installations ops?tning         |
+-------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

Dette og andre dokumenter kan downloades fra
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| For sp?rgsm?l om FreeBSD, l?s
  `documentationen <http://www.FreeBSD.org/docs.html>`__ f?r du
  kontakter <questions@FreeBSD.org\ >.
|  For sp?rgsm?l ang?ende denne dokumentation, e-mail
  <doc@FreeBSD.org\ >.
