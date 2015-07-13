====================
3.5.?Special Targets
====================

.. raw:: html

   <div class="navheader">

3.5.?Special Targets
`Prev <targetattr.html>`__?
Chapter?3.?Short-cuts and Other Nice Things
?\ `Next <modyvarex.html>`__

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

3.5.?Special Targets
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As there were in Make, so there are certain targets that have special
meaning to PMake. When you use one on a dependency line, it is the only
target that may appear on the left-hand-side of the operator. As for the
attributes and variables, all the special targets begin with a period
and consist of upper-case letters only. I will not describe them all in
detail because some of them are rather complex and I will describe them
in more detail than you will want in `Chapter?4, *PMake for
Gods* <gods.html>`__. The targets are as follows:

.. raw:: html

   <div class="informaltable">

+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.BEGIN``        | Any commands attached to this target are executed before anything else is done. You can use it for any initialization that needs doing.                                                                                                                                                                                                                                                                                                                                                                                                             |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.DEFAULT``      | This is sort of a ``.USE`` rule for any target (that was used only as a source) that PMake can not figure out any other way to create. It is only “sort of” a ``.USE`` rule because only the shell script attached to the ``.DEFAULT`` target is used. The ``.IMPSRC`` variable of a target that inherits ``.DEFAULT``'s commands is set to the target's own name.                                                                                                                                                                                  |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.END``          | This serves a function similar to ``.BEGIN``, in that commands attached to it are executed once everything has been re-created (so long as no errors occurred). It also serves the extra function of being a place on which PMake can hang commands you put off to the end. Thus the script for this target will be executed before any of the commands you save with the “...”.                                                                                                                                                                    |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.EXPORT``       | The sources for this target are passed to the exportation system compiled into PMake. Some systems will use these sources to configure themselves. You should ask your system administrator about this.                                                                                                                                                                                                                                                                                                                                             |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.IGNORE``       | This target marks each of its sources with the ``.IGNORE`` attribute. If you do not give it any sources, then it is like giving the ``-i`` flag when you invoke PMake – errors are ignored for all commands.                                                                                                                                                                                                                                                                                                                                        |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.INCLUDES``     | The sources for this target are taken to be suffixes that indicate a file that can be included in a program source file. The suffix must have already been declared with ``.SUFFIXES`` (see below). Any suffix so marked will have the directories on its search path (see ``.PATH``, below) placed in the ``.INCLUDES`` variable, each preceded by a ``-I`` flag. This variable can then be used as an argument for the compiler in the normal fashion. The ``.h`` suffix is already marked in this way in the system makefile. E.g. if you have   |
|                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|                   | .. code:: programlisting                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|                   |     .SUFFIXES       : .bitmap                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|                   |     .PATH.bitmap    : /usr/local/X/lib/bitmaps                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|                   |     .INCLUDES       : .bitmap                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|                   | PMake will place ``-I/usr/local/X/lib/bitmaps`` in the ``.INCLUDES`` variable and you can then say                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|                   | .. code:: programlisting                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|                   |     cc $(.INCLUDES) -c xprogram.c                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|                   | (Note: the ``.INCLUDES`` variable is not actually filled in until the entire makefile has been read.)                                                                                                                                                                                                                                                                                                                                                                                                                                               |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.INTERRUPT``    | When PMake is interrupted, it will execute the commands in the script for this target, if it exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.LIBS``         | This does for libraries what ``.INCLUDES`` does for include files, except the flag used is ``-L``, as required by those linkers that allow you to tell them where to find libraries. The variable used is ``.LIBS``. Be forewarned that PMake may not have been compiled to do this if the linker on your system does not accept the ``-L`` flag, though the ``.LIBS`` variable will always be defined once the makefile has been read.                                                                                                             |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.MAIN``         | If you did not give a target (or targets) to create when you invoked PMake, it will take the sources of this target as the targets to create.                                                                                                                                                                                                                                                                                                                                                                                                       |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.MAKEFLAGS``    | This target provides a way for you to always specify flags for PMake when the makefile is used. The flags are just as they would be typed to the shell (except you can not use shell variables unless they are in the environment), though the ``-f`` and ``-r`` flags have no effect.                                                                                                                                                                                                                                                              |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.NULL``         | This allows you to specify what suffix PMake should pretend a file has if, in fact, it has no known suffix. Only one suffix may be so designated. The last source on the dependency line is the suffix that is used (you should, however, only give one suffix...).                                                                                                                                                                                                                                                                                 |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.PATH``         | If you give sources for this target, PMake will take them as directories in which to search for files it cannot find in the current directory. If you give no sources, it will clear out any directories added to the search path before. Since the effects of this all get very complex, we will leave it till `Chapter?4, *PMake for Gods* <gods.html>`__ to give you a complete explanation.                                                                                                                                                     |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.PATHsuffix``   | This does a similar thing to ``.PATH``, but it does it only for files with the given suffix. The suffix must have been defined already. Look at Search Paths (`Section?4.1, “Search Paths” <gods.html#searchpaths>`__) for more information.                                                                                                                                                                                                                                                                                                        |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.PRECIOUS``     | Similar to ``.IGNORE``, this gives the ``.PRECIOUS`` attribute to each source on the dependency line, unless there are no sources, in which case the ``.PRECIOUS`` attribute is given to every target in the file.                                                                                                                                                                                                                                                                                                                                  |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.RECURSIVE``    | This target applies the ``.MAKE`` attribute to all its sources. It does nothing if you do not give it any sources.                                                                                                                                                                                                                                                                                                                                                                                                                                  |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.SHELL``        | PMake is not constrained to only using the Bourne shell to execute the commands you put in the makefile. You can tell it some other shell to use with this target. Check out “`A Shell is a Shell is a Shell <ashell.html>`__” (`Section?4.4, “A Shell is a Shell is a Shell” <ashell.html>`__) for more information.                                                                                                                                                                                                                               |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.SILENT``       | When you use ``.SILENT`` as a target, it applies the ``.SILENT`` attribute to each of its sources. If there are no sources on the dependency line, then it is as if you gave PMake the ``-s`` flag and no commands will be echoed.                                                                                                                                                                                                                                                                                                                  |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``.SUFFIXES``     | This is used to give new file suffixes for PMake to handle. Each source is a suffix PMake should recognize. If you give a ``.SUFFIXES`` dependency line with no sources, PMake will forget about all the suffixes it knew (this also nukes the null suffix). For those targets that need to have suffixes defined, this is how you do it.                                                                                                                                                                                                           |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

In addition to these targets, a line of the form:

.. code:: programlisting

    attribute : sources

applies the attribute to all the targets listed as sources.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+---------------------------+--------------------------------------+
| `Prev <targetattr.html>`__?   | `Up <shortcuts.html>`__   | ?\ `Next <modyvarex.html>`__         |
+-------------------------------+---------------------------+--------------------------------------+
| 3.4.?Target Attributes?       | `Home <index.html>`__     | ?3.6.?Modifying Variable Expansion   |
+-------------------------------+---------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
