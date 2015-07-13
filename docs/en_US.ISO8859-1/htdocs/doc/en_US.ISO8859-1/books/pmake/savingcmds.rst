====================
3.3.?Saving Commands
====================

.. raw:: html

   <div class="navheader">

3.3.?Saving Commands
`Prev <including.html>`__?
Chapter?3.?Short-cuts and Other Nice Things
?\ `Next <targetattr.html>`__

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

3.3.?Saving Commands
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There may come a time when you will want to save certain commands to be
executed when everything else is done. For instance: you are making
several different libraries at one time and you want to create the
members in parallel. Problem is, ranlib is another one of those programs
that can not be run more than once in the same directory at the same
time (each one creates a file called ``__.SYMDEF`` into which it stuffs
information for the linker to use. Two of them running at once will
overwrite each other's file and the result will be garbage for both
parties). You might want a way to save the ranlib commands til the end
so they can be run one after the other, thus keeping them from trashing
each other's file. PMake allows you to do this by inserting an ellipsis
(“...”) as a command between commands to be run at once and those to be
run later.

So for the ranlib case above, you might do this:

.. code:: programlisting

    lib1.a          : $(LIB1OBJS)
        rm -f $(.TARGET)
        ar cr $(.TARGET) $(.ALLSRC)
        ...
        ranlib $(.TARGET)

    lib2.a          : $(LIB2OBJS)
        rm -f $(.TARGET)
        ar cr $(.TARGET) $(.ALLSRC)
        ...
        ranlib $(.TARGET)

This would save both

.. code:: programlisting

    ranlib $(.TARGET)

commands until the end, when they would run one after the other (using
the correct value for the ``.TARGET`` variable, of course).

Commands saved in this manner are only executed if PMake manages to
re-create everything without an error.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+---------------------------+---------------------------------+
| `Prev <including.html>`__?        | `Up <shortcuts.html>`__   | ?\ `Next <targetattr.html>`__   |
+-----------------------------------+---------------------------+---------------------------------+
| 3.2.?Including Other Makefiles?   | `Home <index.html>`__     | ?3.4.?Target Attributes         |
+-----------------------------------+---------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
