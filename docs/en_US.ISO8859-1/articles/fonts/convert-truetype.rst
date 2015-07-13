===================================================================
8.?Converting TrueType fonts to a groff/PostScript format for groff
===================================================================

.. raw:: html

   <div class="navheader">

8.?Converting TrueType fonts to a groff/PostScript format for groff
`Prev <type1-fonts-groff.html>`__?
?
?\ `Next <truetype-for-other-programs.html>`__

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

8.?Converting TrueType fonts to a groff/PostScript format for groff
-------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This potentially requires a bit of work, simply because it depends on
some utilities that are not installed as part of the base system. They
are:

.. raw:: html

   <div class="variablelist">

``ttf2pf``
    TrueType to PostScript conversion utilities. This allows conversion
    of a TrueType font to an ascii font metric (``.afm``) file.

    Currently available at
    ``http://sunsite.icm.edu.pl/pub/GUST/contrib/BachoTeX98/ttf2pf/``.
    Note: These files are PostScript programs and must be downloaded to
    disk by holding down the **Shift** key when clicking on the link.
    Otherwise, your browser may try to launch ghostview to view them.

    The files of interest are:

    .. raw:: html

       <div class="itemizedlist">

    -  ``GS_TTF.PS``

    -  ``PF2AFM.PS``

    -  ``ttf2pf.ps``

    .. raw:: html

       </div>

    The funny upper/lower case is due to their being intended also for
    DOS shells. ``ttf2pf.ps`` makes use of the others as upper case, so
    any renaming must be consistent with this. (Actually, ``GS_TTF.PS``
    and ``PFS2AFM.PS`` are supposedly part of the Ghostscript
    distribution, but it is just as easy to use these as an isolated
    utility. FreeBSD does not seem to include the latter.) You also may
    want to have these installed to
    ``/usr/local/share/groff_font/devps``\ (?).

``afmtodit``
    Creates font files for use with groff from ascii font metrics file.
    This usually resides in the directory,
    ``/usr/src/contrib/groff/afmtodit``, and requires some work to get
    going.

    .. raw:: html

       <div class="note" xmlns="">

    Note:
    ~~~~~

    If you are paranoid about working in the ``/usr/src`` tree, simply
    copy the contents of the above directory to a work location.

    .. raw:: html

       </div>

    In the work area, you will need to make the utility. Just type:

    .. code:: screen

        # make -f Makefile.sub afmtodit
              

    You may also need to copy
    ``/usr/contrib/groff/devps/generate/textmap`` to
    ``/usr/share/groff_font/devps/generate`` if it does not already
    exist.

.. raw:: html

   </div>

Once all these utilities are in place, you are ready to commence:

.. raw:: html

   <div class="orderedlist">

#. Create the ``.afm`` file by typing:

   .. code:: screen

       % gs -dNODISPLAY -q -- ttf2pf.ps TTF_name PS_font_name AFM_name
           

   Where, *``TTF_name``* is your TrueType font file, *``PS_font_name``*
   is the file name for the ``.pfa`` file, *``AFM_name``* is the name
   you wish for the ``.afm`` file. If you do not specify output file
   names for the ``.pfa`` or ``.afm`` files, then default names will be
   generated from the TrueType font file name.

   This also produces a ``.pfa`` file, the ascii PostScript font metrics
   file (``.pfb`` is for the binary form). This will not be needed, but
   could (I think) be useful for a fontserver.

   For example, to convert the 30f9 Barcode font using the default file
   names, use the following command:

   .. code:: screen

       % gs -dNODISPLAY -- ttf2pf.ps 3of9.ttf
       Aladdin Ghostscript 5.10 (1997-11-23)
       Copyright (C) 1997 Aladdin Enterprises, Menlo Park, CA.  All rights reserved.
       This software comes with NO WARRANTY: see the file PUBLIC for details.
       Converting 3of9.ttf to 3of9.pfa and 3of9.afm.
           

   If you want the converted fonts to be stored in ``A.pfa`` and
   ``B.afm``, then use this command:

   .. code:: screen

       % gs -dNODISPLAY -- ttf2pf.ps 3of9.ttf A B
       Aladdin Ghostscript 5.10 (1997-11-23)
       Copyright (C) 1997 Aladdin Enterprises, Menlo Park, CA.  All rights reserved.
       This software comes with NO WARRANTY: see the file PUBLIC for details.
       Converting 3of9.ttf to A.pfa and B.afm.
           

#. Create the groff PostScript file:

   Change directories to ``/usr/share/groff_font/devps`` so as to make
   the following command easier to execute. You will probably need root
   privileges for this. (Or, if you are paranoid about working there,
   make sure you reference the files ``DESC``, ``text.enc`` and
   ``generate/textmap`` as being in this directory.)

   .. code:: screen

       % afmtodit -d DESC -e text.enc file.afm \
               generate/textmap PS_font_name
           

   Where, ``file.afm`` is the *``AFM_name``* created by ``ttf2pf.ps``
   above, and *``PS_font_name``* is the font name used from that
   command, as well as the name that
   `groff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=groff&sektion=1>`__
   will use for references to this font. For example, assuming you used
   the first ``tiff2pf.ps`` command above, then the 3of9 Barcode font
   can be created using the command:

   .. code:: screen

       % afmtodit -d DESC -e text.enc 3of9.afm \
                        generate/textmap 3of9
           

   Ensure that the resulting *``PS_font_name``* file (e.g., ``3of9`` in
   the example above) is located in the directory
   ``/usr/share/groff_font/devps`` by copying or moving it there.

   Note that if ``ttf2pf.ps`` assigns a font name using the one it finds
   in the TrueType font file and you want to use a different name, you
   must edit the ``.afm`` file prior to running ``afmtodit``. This name
   must also match the one used in the Fontmap file if you wish to pipe
   `groff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=groff&sektion=1>`__
   into
   `gs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gs&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-------------------------------------------------------+
| `Prev <type1-fonts-groff.html>`__?   | ?                       | ?\ `Next <truetype-for-other-programs.html>`__        |
+--------------------------------------+-------------------------+-------------------------------------------------------+
| 7.?Using type 1 fonts with Groff?    | `Home <index.html>`__   | ?9.?Can TrueType fonts be used with other programs?   |
+--------------------------------------+-------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
