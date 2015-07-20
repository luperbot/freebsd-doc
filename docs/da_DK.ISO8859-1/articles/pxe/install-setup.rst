==========================
4. Installations ops?tning
==========================

.. raw:: html

   <div class="navheader">

4. Installations ops?tning
`forrige <bootstrap-config.html>`__?
?
?\ `n?ste <custom-postinst-package.html>`__

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

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+-----------------------------------------------+
| `forrige <bootstrap-config.html>`__?   | ?                       | ?\ `n?ste <custom-postinst-package.html>`__   |
+----------------------------------------+-------------------------+-----------------------------------------------+
| 3. Bootstrap ops?tning?                | `hjem <index.html>`__   | ?5. Tilpasset Post-Install Pakke              |
+----------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Dette og andre dokumenter kan downloades fra
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| For sp?rgsm?l om FreeBSD, l?s
  `documentationen <http://www.FreeBSD.org/docs.html>`__ f?r du
  kontakter <questions@FreeBSD.org\ >.
|  For sp?rgsm?l ang?ende denne dokumentation, e-mail
  <doc@FreeBSD.org\ >.
