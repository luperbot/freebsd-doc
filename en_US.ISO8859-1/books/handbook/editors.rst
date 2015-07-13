==================
4.10.?Text Editors
==================

.. raw:: html

   <div class="navheader">

4.10.?Text Editors
`Prev <shells.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <basics-devices.html>`__

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

4.10.?Text Editors
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most FreeBSD configuration is done by editing text files. Because of
this, it is a good idea to become familiar with a text editor. FreeBSD
comes with a few as part of the base system, and many more are available
in the Ports Collection.

A simple editor to learn is
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1>`__, which
stands for easy editor. To start this editor, type ``ee     filename``
where *``filename``* is the name of the file to be edited. Once inside
the editor, all of the commands for manipulating the editor's functions
are listed at the top of the display. The caret (``^``) represents
**Ctrl**, so ``^e`` expands to **Ctrl**+**e**. To leave
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1>`__, press
**Esc**, then choose the “leave editor” option from the main menu. The
editor will prompt to save any changes if the file has been modified.

FreeBSD also comes with more powerful text editors, such as
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__, as
part of the base system. Other editors, like
`editors/emacs <http://www.freebsd.org/cgi/url.cgi?ports/editors/emacs/pkg-descr>`__
and
`editors/vim <http://www.freebsd.org/cgi/url.cgi?ports/editors/vim/pkg-descr>`__,
are part of the FreeBSD Ports Collection. These editors offer more
functionality at the expense of being more complicated to learn.
Learning a more powerful editor such as vim or Emacs can save more time
in the long run.

Many applications which modify files or require typed input will
automatically open a text editor. To change the default editor, set the
``EDITOR`` environment variable as described in `Section?4.9,
“Shells” <shells.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+-------------------------------------+
| `Prev <shells.html>`__?   | `Up <basics.html>`__    | ?\ `Next <basics-devices.html>`__   |
+---------------------------+-------------------------+-------------------------------------+
| 4.9.?Shells?              | `Home <index.html>`__   | ?4.11.?Devices and Device Nodes     |
+---------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
