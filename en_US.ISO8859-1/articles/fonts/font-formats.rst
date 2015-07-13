===============================
3.?What font formats can I use?
===============================

.. raw:: html

   <div class="navheader">

3.?What font formats can I use?
`Prev <terminology.html>`__?
?
?\ `Next <virtual-console.html>`__

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

3.?What font formats can I use?
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Which font file format is useful depends on the application being used.
FreeBSD by itself uses no fonts. Application programs and/or drivers may
make use of the font files. Here is a small cross reference of
application/driver to the font type suffixes:

.. raw:: html

   <div class="variablelist">

Driver
    .. raw:: html

       <div class="variablelist">

    vt
        ``.hex``

    syscons
        ``.fnt``

    .. raw:: html

       </div>

Application
    .. raw:: html

       <div class="variablelist">

    Ghostscript
        ``.pfa``, ``.pfb``, ``.ttf``

    X11
        ``.pfa``, ``.pfb``

    Groff
        ``.pfa``, ``.afm``

    Povray
        ``.ttf``

    .. raw:: html

       </div>

.. raw:: html

   </div>

The ``.fnt`` suffix is used quite frequently. I suspect that whenever
someone wanted to create a specialized font file for their application,
more often than not they chose this suffix. Therefore, it is likely that
files with this suffix are not all the same format; specifically, the
``.fnt`` files used by syscons under FreeBSD may not be the same format
as a ``.fnt`` file one encounters in the MS-DOS?/Windows? environment. I
have not made any attempt at using other ``.fnt`` files other than those
provided with FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+----------------------------------------------------+
| `Prev <terminology.html>`__?   | ?                       | ?\ `Next <virtual-console.html>`__                 |
+--------------------------------+-------------------------+----------------------------------------------------+
| 2.?Basic terminology?          | `Home <index.html>`__   | ?4.?Setting a virtual console to 80x60 line mode   |
+--------------------------------+-------------------------+----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
