==================
6.16.?Using Tcl/Tk
==================

.. raw:: html

   <div class="navheader">

6.16.?Using Tcl/Tk
`Prev <using-python.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-emacs.html>`__

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

6.16.?Using Tcl/Tk
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Ports Collection supports parallel installation of multiple Tcl/Tk
versions. Ports should try to support at least the default Tcl/Tk
version and higher with ``USES=tcl``. It is possible to specify the
desired version of ``tcl`` by appending ``:xx``, for example,
``USES=tcl:85``.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.20.?The Most Useful Read-Only Variables for Ports That Use
Tcl/Tk

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------+-------------------------------------+
| ``TCL_VER``          | chosen major.minor version of Tcl   |
+----------------------+-------------------------------------+
| ``TCLSH``            | full path of the Tcl interpreter    |
+----------------------+-------------------------------------+
| ``TCL_LIBDIR``       | path of the Tcl libraries           |
+----------------------+-------------------------------------+
| ``TCL_INCLUDEDIR``   | path of the Tcl C header files      |
+----------------------+-------------------------------------+
| ``TK_VER``           | chosen major.minor version of Tk    |
+----------------------+-------------------------------------+
| ``WISH``             | full path of the Tk interpreter     |
+----------------------+-------------------------------------+
| ``TK_LIBDIR``        | path of the Tk libraries            |
+----------------------+-------------------------------------+
| ``TK_INCLUDEDIR``    | path of the Tk C header files       |
+----------------------+-------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

See the ```USES=tcl`` <uses.html#uses-tcl>`__ and
```USES=tk`` <uses.html#uses-tk>`__ of `Chapter?15, *Values of
``USES``* <uses.html#uses-values>`__ for a full description of those
variables. A complete list of those variables is available in
``/usr/ports/Mk/Uses/tcl.mk``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+----------------------------------+
| `Prev <using-python.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-emacs.html>`__   |
+---------------------------------+-------------------------+----------------------------------+
| 6.15.?Using Python?             | `Home <index.html>`__   | ?6.17.?Using Emacs               |
+---------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
