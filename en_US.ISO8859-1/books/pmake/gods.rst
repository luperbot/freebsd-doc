=========================
Chapter?4.?PMake for Gods
=========================

.. raw:: html

   <div class="navheader">

Chapter?4.?PMake for Gods
`Prev <moreexercises.html>`__?
?
?\ `Next <archivesandlibraries.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`4.1. Search Paths <gods.html#searchpaths>`__
`4.2. Archives and Libraries <archivesandlibraries.html>`__
`4.3. On the Condition... <condition.html>`__
`4.4. A Shell is a Shell is a Shell <ashell.html>`__
`4.5. Compatibility <compatibility.html>`__
`4.6. DEFCON 3 – Variable Expansion <defcon3.html>`__
`4.7. DEFCON 2 – The Number of the Beast <defcon2.html>`__
`4.8. DEFCON 1 – Imitation is the Not the Highest Form of
Flattery <defcon1.html>`__
`4.9. The Way Things Work <theway.html>`__

.. raw:: html

   </div>

This chapter is devoted to those facilities in PMake that allow you to
do a great deal in a makefile with very little work, as well as do some
things you could not do in Make without a great deal of work (and
perhaps the use of other programs). The problem with these features, is
they must be handled with care, or you will end up with a mess.

Once more, I assume a greater familiarity with UNIX? or Sprite than I
did in the previous two chapters.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Search Paths
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PMake supports the dispersal of files into multiple directories by
allowing you to specify places to look for sources with ``.PATH``
targets in the makefile. The directories you give as sources for these
targets make up a “search path”. Only those files used exclusively as
sources are actually sought on a search path, the assumption being that
anything listed as a target in the makefile can be created by the
makefile and thus should be in the current directory.

There are two types of search paths in PMake: one is used for all types
of files (including included makefiles) and is specified with a plain
``.PATH`` target (e.g. ``.PATH       : RCS``), while the other is
specific to a certain type of file, as indicated by the file's suffix. A
specific search path is indicated by immediately following the ``.PATH``
with the suffix of the file. For instance:

.. code:: programlisting

    .PATH.h         : /sprite/lib/include /sprite/att/lib/include

would tell PMake to look in the directories ``/sprite/lib/include`` and
``/sprite/att/lib/include`` for any files whose suffix is ``.h``.

The current directory is always consulted first to see if a file exists.
Only if it cannot be found there are the directories in the specific
search path, followed by those in the general search path, consulted.

A search path is also used when expanding wildcard characters. If the
pattern has a recognizable suffix on it, the path for that suffix will
be used for the expansion. Otherwise the default search path is
employed.

When a file is found in some directory other than the current one, all
local variables that would have contained the target's name
(``.ALLSRC``, and ``.IMPSRC``) will instead contain the path to the
file, as found by PMake. Thus if you have a file ``../lib/mumble.c`` and
a makefile like this:

.. code:: programlisting

    .PATH.c         : ../lib
    mumble          : mumble.c
        $(CC) -o $(.TARGET) $(.ALLSRC)

the command executed to create mumble would be
``cc -o mumble ../lib/mumble.c.`` (as an aside, the command in this case
is not strictly necessary, since it will be found using transformation
rules if it is not given. This is because ``.out`` is the null suffix by
default and a transformation exists from ``.c`` to ``.out``. Just
thought I would throw that in). If a file exists in two directories on
the same search path, the file in the first directory on the path will
be the one PMake uses. So if you have a large system spread over many
directories, it would behoove you to follow a naming convention that
avoids such conflicts.

Something you should know about the way search paths are implemented is
that each directory is read, and its contents cached, exactly once –
when it is first encountered – so any changes to the directories while
PMake is running will not be noted when searching for implicit sources,
nor will they be found when PMake attempts to discover when the file was
last modified, unless the file was created in the current directory.
While people have suggested that PMake should read the directories each
time, my experience suggests that the caching seldom causes problems. In
addition, not caching the directories slows things down enormously
because of PMake's attempts to apply transformation rules through
non-existent files – the number of extra file-system searches is truly
staggering, especially if many files without suffixes are used and the
null suffix is not changed from ``.out``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-------------------------------------------+
| `Prev <moreexercises.html>`__?   | ?                       | ?\ `Next <archivesandlibraries.html>`__   |
+----------------------------------+-------------------------+-------------------------------------------+
| 3.7.?More Exercises?             | `Home <index.html>`__   | ?4.2.?Archives and Libraries              |
+----------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
