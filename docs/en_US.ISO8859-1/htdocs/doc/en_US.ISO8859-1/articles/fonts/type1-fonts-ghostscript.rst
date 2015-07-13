======================================
6.?Using type 1 fonts with Ghostscript
======================================

.. raw:: html

   <div class="navheader">

6.?Using type 1 fonts with Ghostscript
`Prev <type1-fonts-x11.html>`__?
?
?\ `Next <type1-fonts-groff.html>`__

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

6.?Using type 1 fonts with Ghostscript
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ghostscript references a font via its ``Fontmap`` file. This must be
modified in a similar way to the X11 ``fonts.dir`` file. Ghostscript can
use either the ``.pfa`` or the ``.pfb`` format fonts. Using the font
from the previous example, here is how to use it with Ghostscript:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    Put the font in Ghostscript's font directory
    % cd /usr/local/share/ghostscript/fonts
    % ln -s /usr/local/share/fonts/type1/showboat.pfb .

    Edit Fontmap so Ghostscript knows about the font
    % cd /usr/local/share/ghostscript/4.01
    % ex Fontmap
    :$a
    /Showboat        (showboat.pfb) ; % From CICA /fonts/atm/showboat
    .
    :wq

    Use Ghostscript to examine the font
    % gs prfont.ps
    Aladdin Ghostscript 4.01 (1996-7-10)
    Copyright (C) 1996 Aladdin Enterprises, Menlo Park, CA.  All rights
    reserved.
    This software comes with NO WARRANTY: see the file PUBLIC for details.
    Loading Times-Roman font from /usr/local/share/ghostscript/fonts/tir_____.pfb...
     /1899520 581354 1300084 13826 0 done.
    GS>Showboat DoFont
    Loading Showboat font from /usr/local/share/ghostscript/fonts/showboat.pfb...
     1939688 565415 1300084 16901 0 done.
    >>showpage, press <return> to continue<<
    >>showpage, press <return> to continue<<
    >>showpage, press <return> to continue<<
    GS>quit

.. raw:: html

   </div>

References: ``fonts.txt`` in the Ghostscript 4.01 distribution

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+----------------------------------------+
| `Prev <type1-fonts-x11.html>`__?   | ?                       | ?\ `Next <type1-fonts-groff.html>`__   |
+------------------------------------+-------------------------+----------------------------------------+
| 5.?Using type 1 fonts with X11?    | `Home <index.html>`__   | ?7.?Using type 1 fonts with Groff      |
+------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
