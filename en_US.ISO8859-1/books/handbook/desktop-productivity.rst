=================
7.3.?Productivity
=================

.. raw:: html

   <div class="navheader">

7.3.?Productivity
`Prev <desktop-browsers.html>`__?
Chapter?7.?Desktop Applications
?\ `Next <desktop-viewers.html>`__

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

7.3.?Productivity
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When it comes to productivity, new users often look for an office suite
or an easy-to-use word processor. While some `desktop
environments <x11-wm.html>`__ like KDE provide an office suite, there is
no default productivity package. Several office suites and graphical
word processors are available for FreeBSD, regardless of the installed
window manager.

This section demonstrates how to install the following popular
productivity software and indicates if the application is
resource-heavy, takes time to compile from ports, or has any major
dependencies.

.. raw:: html

   <div class="informaltable">

+---------------------+--------------------+---------------------------+--------------------------------+
| Application Name    | Resources Needed   | Installation from Ports   | Major Dependencies             |
+=====================+====================+===========================+================================+
| Calligra            | light              | heavy                     | KDE                            |
+---------------------+--------------------+---------------------------+--------------------------------+
| AbiWord             | light              | light                     | Gtk+ or GNOME                  |
+---------------------+--------------------+---------------------------+--------------------------------+
| The Gimp            | light              | heavy                     | Gtk+                           |
+---------------------+--------------------+---------------------------+--------------------------------+
| Apache OpenOffice   | heavy              | huge                      | JDK™ and Mozilla               |
+---------------------+--------------------+---------------------------+--------------------------------+
| LibreOffice         | somewhat heavy     | huge                      | Gtk+, or KDE/ GNOME, or JDK™   |
+---------------------+--------------------+---------------------------+--------------------------------+

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

7.3.1.?Calligra
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The KDE desktop environment includes an office suite which can be
installed separately from KDE. Calligra includes standard components
that can be found in other office suites. Words is the word processor,
Sheets is the spreadsheet program, Stage manages slide presentations,
and Karbon is used to draw graphical documents.

In FreeBSD,
`editors/calligra <http://www.freebsd.org/cgi/url.cgi?ports/editors/calligra/pkg-descr>`__
can be installed as a package or a port. To install the package:

.. code:: screen

    # pkg install calligra

If the package is not available, use the Ports Collection instead:

.. code:: screen

    # cd /usr/ports/editors/calligra
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

7.3.2.?AbiWord
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

AbiWord is a free word processing program similar in look and feel to
Microsoft? Word. It is fast, contains many features, and is
user-friendly.

AbiWord can import or export many file formats, including some
proprietary ones like Microsoft? ``.rtf``.

To install the AbiWord package:

.. code:: screen

    # pkg install abiword

If the package is not available, it can be compiled from the Ports
Collection:

.. code:: screen

    # cd /usr/ports/editors/abiword
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

7.3.3.?The GIMP
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For image authoring or picture retouching, The GIMP provides a
sophisticated image manipulation program. It can be used as a simple
paint program or as a quality photo retouching suite. It supports a
large number of plugins and features a scripting interface. The GIMP can
read and write a wide range of file formats and supports interfaces with
scanners and tablets.

To install the package:

.. code:: screen

    # pkg install gimp

Alternately, use the Ports Collection:

.. code:: screen

    # cd /usr/ports/graphics/gimp
    # make install clean

The graphics category
(`freebsd.org/ports/graphics.html <http://www.FreeBSD.org/ports/graphics.html>`__)
of the Ports Collection contains several GIMP-related plugins, help
files, and user manuals.

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

7.3.4.?Apache OpenOffice
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Apache OpenOffice is an open source office suite which is developed
under the wing of the Apache Software Foundation's Incubator. It
includes all of the applications found in a complete office productivity
suite: a word processor, spreadsheet, presentation manager, and drawing
program. Its user interface is similar to other office suites, and it
can import and export in various popular file formats. It is available
in a number of different languages and internationalization has been
extended to interfaces, spell checkers, and dictionaries.

The word processor of Apache OpenOffice uses a native XML file format
for increased portability and flexibility. The spreadsheet program
features a macro language which can be interfaced with external
databases. Apache OpenOffice is stable and runs natively on Windows?,
Solaris™, Linux?, FreeBSD, and Mac?OS??X. More information about Apache
OpenOffice can be found at `openoffice.org <http://openoffice.org/>`__.
For FreeBSD specific information refer to
`porting.openoffice.org/freebsd/ <http://porting.openoffice.org/freebsd/>`__.

To install the Apache OpenOffice package:

.. code:: screen

    # pkg install apache-openoffice

Once the package is installed, type the following command to launch
Apache OpenOffice:

.. code:: screen

    % openoffice-X.Y.Z

where *``X.Y.Z``* is the version number of the installed version of
Apache OpenOffice. The first time Apache OpenOffice launches, some
questions will be asked and a ``.openoffice.org`` folder will be created
in the user's home directory.

If the desired Apache OpenOffice package is not available, compiling the
port is still an option. However, this requires a lot of disk space and
a fairly long time to compile:

.. code:: screen

    # cd /usr/ports/editors/openoffice-4
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

To build a localized version, replace the previous command with:

.. code:: screen

    # make LOCALIZED_LANG=your_language install clean

Replace *``your_language``* with the correct language ISO-code. A list
of supported language codes is available in
``files/Makefile.localized``, located in the port's directory.

.. raw:: html

   </div>

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

7.3.5.?LibreOffice
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

LibreOffice is a free software office suite developed by
`documentfoundation.org <http://www.documentfoundation.org/>`__. It is
compatible with other major office suites and available on a variety of
platforms. It is a rebranded fork of OpenOffice.org and includes
applications found in a complete office productivity suite: a word
processor, spreadsheet, presentation manager, drawing program, database
management program, and a tool for creating and editing mathematical
formul?. It is available in a number of different languages and
internationalization has been extended to interfaces, spell checkers,
and dictionaries.

The word processor of LibreOffice uses a native XML file format for
increased portability and flexibility. The spreadsheet program features
a macro language which can be interfaced with external databases.
LibreOffice is stable and runs natively on Windows?, Linux?, FreeBSD,
and Mac?OS??X. More information about LibreOffice can be found at
`libreoffice.org <http://www.libreoffice.org/>`__.

To install the English version of the LibreOffice package:

.. code:: screen

    # pkg install libreoffice

The editors category
(`freebsd.org/ports/editors.html <http://www.FreeBSD.org/ports/editors.html>`__)
of the Ports Collection contains several localizations for LibreOffice.
When installing a localized package, replace ``libreoffice`` with the
name of the localized package.

Once the package is installed, type the following command to run
LibreOffice:

.. code:: screen

    % libreoffice

During the first launch, some questions will be asked and a
``.libreoffice`` folder will be created in the user's home directory.

If the desired LibreOffice package is not available, compiling the port
is still an option. However, this requires a lot of disk space and a
fairly long time to compile. This example compiles the English version:

.. code:: screen

    # cd /usr/ports/editors/libreoffice
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

To build a localized version, ``cd`` into the port directory of the
desired language. Supported languages can be found in the editors
category
(`freebsd.org/ports/editors.html <http://www.FreeBSD.org/ports/editors.html>`__)
of the Ports Collection.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+--------------------------------------+
| `Prev <desktop-browsers.html>`__?   | `Up <desktop.html>`__   | ?\ `Next <desktop-viewers.html>`__   |
+-------------------------------------+-------------------------+--------------------------------------+
| 7.2.?Browsers?                      | `Home <index.html>`__   | ?7.4.?Document Viewers               |
+-------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
