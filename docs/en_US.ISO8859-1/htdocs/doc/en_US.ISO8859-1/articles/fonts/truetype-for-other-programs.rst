==================================================
9.?Can TrueType fonts be used with other programs?
==================================================

.. raw:: html

   <div class="navheader">

9.?Can TrueType fonts be used with other programs?
`Prev <convert-truetype.html>`__?
?
?\ `Next <obtaining-additional-fonts.html>`__

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

9.?Can TrueType fonts be used with other programs?
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The TrueType font format is used by Windows, Windows 95, and Mac's. It
is quite popular and there are a great number of fonts available in this
format.

Unfortunately, there are few applications that I am aware of that can
use this format: Ghostscript and Povray come to mind. Ghostscript's
support, according to the documentation, is rudimentary and the results
are likely to be inferior to type 1 fonts. Povray version 3 also has the
ability to use TrueType fonts, but I rather doubt many people will be
creating documents as a series of raytraced pages :-).

This rather dismal situation may soon change. The `FreeType
Project <http://www.freetype.org/>`__ is currently developing a useful
set of FreeType tools:

.. raw:: html

   <div class="itemizedlist">

-  The ``xfsft`` font server for X11 can serve TrueType fonts in
   addition to regular fonts. Though currently in beta, it is said to be
   quite usable. See `Juliusz Chroboczek's
   page <http://www.dcs.ed.ac.uk/home/jec/programs/xfsft/>`__ for
   further information. Porting instructions for FreeBSD can be found at
   `Stephen Montgomery's software
   page <http://math.missouri.edu/~stephen/software/>`__.

-  xfstt is another font server for X11, available under
   ``      ftp://sunsite.unc.edu/pub/Linux/X11/fonts/``.

-  A program called ``ttf2bdf`` can produce BDF files suitable for use
   in an X environment from TrueType files. Linux binaries are said to
   be available from ``ftp://crl.nmsu.edu/CLR/multiling/General/``.

-  and others …

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------------------+-------------------------+-------------------------------------------------+
| `Prev <convert-truetype.html>`__?                                      | ?                       | ?\ `Next <obtaining-additional-fonts.html>`__   |
+------------------------------------------------------------------------+-------------------------+-------------------------------------------------+
| 8.?Converting TrueType fonts to a groff/PostScript format for groff?   | `Home <index.html>`__   | ?10.?Where can additional fonts be obtained?    |
+------------------------------------------------------------------------+-------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
