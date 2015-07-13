================================
7.?Using type 1 fonts with Groff
================================

.. raw:: html

   <div class="navheader">

7.?Using type 1 fonts with Groff
`Prev <type1-fonts-ghostscript.html>`__?
?
?\ `Next <convert-truetype.html>`__

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

7.?Using type 1 fonts with Groff
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now that the new font can be used by both X11 and Ghostscript, how can
one use the new font with groff? First of all, since we are dealing with
type 1 PostScript? fonts, the groff device that is applicable is the
*ps* device. A font file must be created for each font that groff can
use. A groff font name is just a file in
``/usr/share/groff_font/devps``. With our example, the font file could
be ``/usr/share/groff_font/devps/SHOWBOAT``. The file must be created
using tools provided by groff.

The first tool is ``afmtodit``. This is not normally installed, so it
must be retrieved from the source distribution. I found I had to change
the first line of the file, so I did:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % cp /usr/src/gnu/usr.bin/groff/afmtodit/afmtodit.pl /tmp
    % ex /tmp/afmtodit.pl
    :1c
    #!/usr/bin/perl -P-
    .
    :wq

.. raw:: html

   </div>

This tool will create the groff font file from the metrics file
(``.afm`` suffix.) Continuing with our example:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    Many .afm files are in Mac format… ^M delimited lines
    We need to convert them to UNIX? style ^J delimited lines
    % cd /tmp
    % cat /usr/local/share/fonts/type1/showboat.afm |
        tr '\015' '\012' >showboat.afm

    Now create the groff font file
    % cd /usr/share/groff_font/devps
    % /tmp/afmtodit.pl -d DESC -e text.enc /tmp/showboat.afm generate/textmap SHOWBOAT

.. raw:: html

   </div>

The font can now be referenced with the name SHOWBOAT.

If Ghostscript is used to drive the printers on the system, then nothing
more needs to be done. However, if true PostScript? printers are used,
then the font must be down loaded to the printer in order for the font
to be used (unless the printer happens to have the showboat font built
in or on an accessible font disk.) The final step is to create a down
loadable font. The ``pfbtops`` tool is used to create the ``.pfa``
format of the font, and the ``download`` file is modified to reference
the new font. The ``download`` file must reference the internal name of
the font. This can easily be determined from the groff font file as
illustrated:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    Create the .pfa font file
    % pfbtops /usr/local/share/fonts/type1/showboat.pfb >showboat.pfa

.. raw:: html

   </div>

Of course, if the ``.pfa`` file is already available, just use a
symbolic link to reference it.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    Get the internal font name
    % fgrep internalname SHOWBOAT
    internalname Showboat

    Tell groff that the font must be down loaded
    % ex download
    :$a
    Showboat      showboat.pfa
    .
    :wq

.. raw:: html

   </div>

To test the font:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % cd /tmp
    % cat >example.t <<EOF
    .sp 5
    .ps 16
    This is an example of the Showboat font:
    .br
    .ps 48
    .vs (\n(.s+2)p
    .sp
    .ft SHOWBOAT
    ABCDEFGHI
    .br
    JKLMNOPQR
    .br
    STUVWXYZ
    .sp
    .ps 16
    .vs (\n(.s+2)p
    .fp 5 SHOWBOAT
    .ft R
    To use it for the first letter of a paragraph, it will look like:
    .sp 50p
    \s(48\f5H\s0\fRere is the first sentence of a paragraph that uses the
    showboat font as its first letter.
    Additional vertical space must be used to allow room for the larger
    letter.
    EOF
    % groff -Tps example.t >example.ps

    To use ghostscript/ghostview
    % ghostview example.ps

    To print it
    % lpr -Ppostscript example.ps

.. raw:: html

   </div>

References: ``/usr/src/gnu/usr.bin/groff/afmtodit/afmtodit.man``,
`groff\_font(5) <http://www.FreeBSD.org/cgi/man.cgi?query=groff_font&sektion=5>`__,
`groff\_char(7) <http://www.FreeBSD.org/cgi/man.cgi?query=groff_char&sektion=7>`__,
`pfbtops(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pfbtops&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------+------------------------------------------------------------------------+
| `Prev <type1-fonts-ghostscript.html>`__?   | ?                       | ?\ `Next <convert-truetype.html>`__                                    |
+--------------------------------------------+-------------------------+------------------------------------------------------------------------+
| 6.?Using type 1 fonts with Ghostscript?    | `Home <index.html>`__   | ?8.?Converting TrueType fonts to a groff/PostScript format for groff   |
+--------------------------------------------+-------------------------+------------------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
