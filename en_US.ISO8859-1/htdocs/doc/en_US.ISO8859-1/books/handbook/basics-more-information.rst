==================
4.12.?Manual Pages
==================

.. raw:: html

   <div class="navheader">

4.12.?Manual Pages
`Prev <basics-devices.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <ports.html>`__

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

4.12.?Manual Pages
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The most comprehensive documentation on FreeBSD is in the form of manual
pages. Nearly every program on the system comes with a short reference
manual explaining the basic operation and available arguments. These
manuals can be viewed using ``man``:

.. code:: screen

    % man command

where *``command``* is the name of the command to learn about. For
example, to learn more about
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__, type:

.. code:: screen

    % man ls

Manual pages are divided into sections which represent the type of
topic. In FreeBSD, the following sections are available:

.. raw:: html

   <div class="orderedlist">

#. User commands.

#. System calls and error numbers.

#. Functions in the C libraries.

#. Device drivers.

#. File formats.

#. Games and other diversions.

#. Miscellaneous information.

#. System maintenance and operation commands.

#. System kernel interfaces.

.. raw:: html

   </div>

In some cases, the same topic may appear in more than one section of the
online manual. For example, there is a ``chmod`` user command and a
``chmod()`` system call. To tell
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1>`__
which section to display, specify the section number:

.. code:: screen

    % man 1 chmod

This will display the manual page for the user command
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__.
References to a particular section of the online manual are
traditionally placed in parenthesis in written documentation, so
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
refers to the user command and
`chmod(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=2>`__
refers to the system call.

If the name of the manual page is unknown, use ``man     -k`` to search
for keywords in the manual page descriptions:

.. code:: screen

    % man -k mail

This command displays a list of commands that have the keyword “mail” in
their descriptions. This is equivalent to using
`apropos(1) <http://www.FreeBSD.org/cgi/man.cgi?query=apropos&sektion=1>`__.

To read the descriptions for all of the commands in ``/usr/bin``, type:

.. code:: screen

    % cd /usr/bin
    % man -f * | more

or

.. code:: screen

    % cd /usr/bin
    % whatis * |more

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.12.1.?GNU Info Files
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD includes several applications and utilities produced by the Free
Software Foundation (FSF). In addition to manual pages, these programs
may include hypertext documents called ``info`` files. These can be
viewed using
`info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=info&sektion=1>`__
or, if
`editors/emacs <http://www.freebsd.org/cgi/url.cgi?ports/editors/emacs/pkg-descr>`__
is installed, the info mode of emacs.

To use
`info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=info&sektion=1>`__,
type:

.. code:: screen

    % info

For a brief introduction, type ``h``. For a quick command reference,
type ``?``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+-----------------------------------------------------------+
| `Prev <basics-devices.html>`__?   | `Up <basics.html>`__    | ?\ `Next <ports.html>`__                                  |
+-----------------------------------+-------------------------+-----------------------------------------------------------+
| 4.11.?Devices and Device Nodes?   | `Home <index.html>`__   | ?Chapter?5.?Installing Applications: Packages and Ports   |
+-----------------------------------+-------------------------+-----------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
