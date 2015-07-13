============
7.5.?Finance
============

.. raw:: html

   <div class="navheader">

7.5.?Finance
`Prev <desktop-viewers.html>`__?
Chapter?7.?Desktop Applications
?\ `Next <multimedia.html>`__

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

7.5.?Finance
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For managing personal finances on a FreeBSD desktop, some powerful and
easy-to-use applications can be installed. Some are compatible with
widespread file formats, such as the formats used by Quicken and Excel.

This section covers these programs:

.. raw:: html

   <div class="informaltable">

+--------------------+--------------------+---------------------------+----------------------+
| Application Name   | Resources Needed   | Installation from Ports   | Major Dependencies   |
+====================+====================+===========================+======================+
| GnuCash            | light              | heavy                     | GNOME                |
+--------------------+--------------------+---------------------------+----------------------+
| Gnumeric           | light              | heavy                     | GNOME                |
+--------------------+--------------------+---------------------------+----------------------+
| KMyMoney           | light              | heavy                     | KDE                  |
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

7.5.1.?GnuCash
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GnuCash is part of the GNOME effort to provide user-friendly, yet
powerful, applications to end-users. GnuCash can be used to keep track
of income and expenses, bank accounts, and stocks. It features an
intuitive interface while remaining professional.

GnuCash provides a smart register, a hierarchical system of accounts,
and many keyboard accelerators and auto-completion methods. It can split
a single transaction into several more detailed pieces. GnuCash can
import and merge Quicken QIF files. It also handles most international
date and currency formats.

To install the GnuCash package:

.. code:: screen

    # pkg install gnucash

If the package is not available, use the Ports Collection:

.. code:: screen

    # cd /usr/ports/finance/gnucash
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

7.5.2.?Gnumeric
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Gnumeric is a spreadsheet program developed by the GNOME community. It
features convenient automatic guessing of user input according to the
cell format with an autofill system for many sequences. It can import
files in a number of popular formats, including Excel, Lotus 1-2-3, and
Quattro Pro. It has a large number of built-in functions and allows all
of the usual cell formats such as number, currency, date, time, and much
more.

To install Gnumeric as a package:

.. code:: screen

    # pkg install gnumeric

If the package is not available, use the Ports Collection:

.. code:: screen

    # cd /usr/ports/math/gnumeric
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

7.5.3.?KMyMoney
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

KMyMoney is a personal finance application created by the KDE community.
KMyMoney aims to provide the important features found in commercial
personal finance manager applications. It also highlights ease-of-use
and proper double-entry accounting among its features. KMyMoney imports
from standard Quicken QIF files, tracks investments, handles multiple
currencies, and provides a wealth of reports.

To install KMyMoney as a package:

.. code:: screen

    # pkg install kmymoney-kde4

If the package is not available, use the Ports Collection:

.. code:: screen

    # cd /usr/ports/finance/kmymoney-kde4
    # make install clean

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+---------------------------------+
| `Prev <desktop-viewers.html>`__?   | `Up <desktop.html>`__   | ?\ `Next <multimedia.html>`__   |
+------------------------------------+-------------------------+---------------------------------+
| 7.4.?Document Viewers?             | `Home <index.html>`__   | ?Chapter?8.?Multimedia          |
+------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
