==============================
3.2.?Including Other Makefiles
==============================

.. raw:: html

   <div class="navheader">

3.2.?Including Other Makefiles
`Prev <shortcuts.html>`__?
Chapter?3.?Short-cuts and Other Nice Things
?\ `Next <savingcmds.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.?Including Other Makefiles
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Just as for programs, it is often useful to extract certain parts of a
makefile into another file and just include it in other makefiles
somehow. Many compilers allow you say something like:

.. code:: programlisting

    #include "defs.h"

to include the contents of ``defs.h`` in the source file. PMake allows
you to do the same thing for makefiles, with the added ability to use
variables in the filenames. An include directive in a makefile looks
either like this:

.. code:: programlisting

    #include <file>

or this:

.. code:: programlisting

    #include "file"

The difference between the two is where PMake searches for the file: the
first way, PMake will look for the file only in the system makefile
directory (or directories) (to find out what that directory is, give
PMake the ``-h`` flag). The system makefile directory search path can be
overridden via the ``-m`` option. For files in double-quotes, the search
is more complex:

.. raw:: html

   <div class="orderedlist">

#. The directory of the makefile that's including the file.

#. The current directory (the one in which you invoked PMake).

#. The directories given by you using ``-I`` flags, in the order in
   which you gave them.

#. Directories given by ``.PATH`` dependency lines (see `Chapter?4,
   *PMake for Gods* <gods.html>`__).

#. The system makefile directory.

.. raw:: html

   </div>

in that order.

You are free to use PMake variables in the filename – PMake will expand
them before searching for the file. You must specify the searching
method with either angle brackets or double-quotes outside of a variable
expansion. I.e. the following:

.. code:: programlisting

    SYSTEM    = <command.mk>

    #include $(SYSTEM)

will not work.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+---------------------------+---------------------------------+
| `Prev <shortcuts.html>`__?                     | `Up <shortcuts.html>`__   | ?\ `Next <savingcmds.html>`__   |
+------------------------------------------------+---------------------------+---------------------------------+
| Chapter?3.?Short-cuts and Other Nice Things?   | `Home <index.html>`__     | ?3.3.?Saving Commands           |
+------------------------------------------------+---------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
