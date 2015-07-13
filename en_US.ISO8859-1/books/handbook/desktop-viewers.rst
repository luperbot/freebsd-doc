=====================
7.4.?Document Viewers
=====================

.. raw:: html

   <div class="navheader">

7.4.?Document Viewers
`Prev <desktop-productivity.html>`__?
Chapter?7.?Desktop Applications
?\ `Next <desktop-finance.html>`__

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

7.4.?Document Viewers
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some new document formats have gained popularity since the advent of
UNIX? and the viewers they require may not be available in the base
system. This section demonstrates how to install the following document
viewers:

.. raw:: html

   <div class="informaltable">

+--------------------+--------------------+---------------------------+----------------------+
| Application Name   | Resources Needed   | Installation from Ports   | Major Dependencies   |
+====================+====================+===========================+======================+
| Xpdf               | light              | light                     | FreeType             |
+--------------------+--------------------+---------------------------+----------------------+
| gv                 | light              | light                     | Xaw3d                |
+--------------------+--------------------+---------------------------+----------------------+
| GQview             | light              | light                     | Gtk+ or GNOME        |
+--------------------+--------------------+---------------------------+----------------------+
| ePDFView           | light              | light                     | Gtk+                 |
+--------------------+--------------------+---------------------------+----------------------+
| Okular             | light              | heavy                     | KDE                  |
+--------------------+--------------------+---------------------------+----------------------+

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

7.4.1.?Xpdf
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For users that prefer a small FreeBSD PDF viewer, Xpdf provides a
light-weight and efficient viewer which requires few resources. It uses
the standard X fonts and does not require any additional toolkits.

To install the Xpdf package:

.. code:: screen

    # pkg install xpdf

If the package is not available, use the Ports Collection:

.. code:: screen

    # cd /usr/ports/graphics/xpdf
    # make install clean

Once the installation is complete, launch ``xpdf`` and use the right
mouse button to activate the menu.

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

7.4.2.?gv
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

gv is a PostScript? and PDF viewer. It is based on ghostview, but has a
nicer look as it is based on the Xaw3d widget toolkit. gv has many
configurable features, such as orientation, paper size, scale, and
anti-aliasing. Almost any operation can be performed with either the
keyboard or the mouse.

To install gv as a package:

.. code:: screen

    # pkg install gv

If a package is unavailable, use the Ports Collection:

.. code:: screen

    # cd /usr/ports/print/gv
    # make install clean

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

7.4.3.?GQview
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GQview is an image manager which supports viewing a file with a single
click, launching an external editor, and thumbnail previews. It also
features a slideshow mode and some basic file operations, making it easy
to manage image collections and to find duplicate files. GQview supports
full screen viewing and internationalization.

To install the GQview package:

.. code:: screen

    # pkg install gqview

If the package is not available, use the Ports Collection:

.. code:: screen

    # cd /usr/ports/graphics/gqview
    # make install clean

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

7.4.4.?ePDFView
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ePDFView is a lightweight PDF document viewer that only uses the Gtk+
and Poppler libraries. It is currently under development, but already
opens most PDF files (even encrypted), save copies of documents, and has
support for printing using CUPS.

To install ePDFView as a package:

.. code:: screen

    # pkg install epdfview

If a package is unavailable, use the Ports Collection:

.. code:: screen

    # cd /usr/ports/graphics/epdfview
    # make install clean

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

7.4.5.?Okular
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Okular is a universal document viewer based on KPDF for KDE. It can open
many document formats, including PDF, PostScript?, DjVu, CHM, XPS, and
ePub.

To install Okular as a package:

.. code:: screen

    # pkg install okular

If a package is unavailable, use the Ports Collection:

.. code:: screen

    # cd /usr/ports/graphics/okular
    # make install clean

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+--------------------------------------+
| `Prev <desktop-productivity.html>`__?   | `Up <desktop.html>`__   | ?\ `Next <desktop-finance.html>`__   |
+-----------------------------------------+-------------------------+--------------------------------------+
| 7.3.?Productivity?                      | `Home <index.html>`__   | ?7.5.?Finance                        |
+-----------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
