================
2.5.?Parallelism
================

.. raw:: html

   <div class="navheader">

2.5.?Parallelism
`Prev <comments.html>`__?
Chapter?2.?The Basics of PMake
?\ `Next <writeanddebug.html>`__

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

2.5.?Parallelism
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PMake was specifically designed to re-create several targets at once,
when possible. You do not have to do anything special to cause this to
happen (unless PMake was configured to not act in parallel, in which
case you will have to make use of the ``-L`` and ``-J`` flags (see
below)), but you do have to be careful at times.

There are several problems you are likely to encounter. One is that some
makefiles (and programs) are written in such a way that it is impossible
for two targets to be made at once. The program xstr, for example,
always modifies the files ``strings`` and ``x.c``. There is no way to
change it. Thus you cannot run two of them at once without something
being trashed. Similarly, if you have commands in the makefile that
always send output to the same file, you will not be able to make more
than one target at once unless you change the file you use. You can, for
instance, add a ``$$$$`` to the end of the file name to tack on the
process ID of the shell executing the command (each ``$$`` expands to a
single ``$``, thus giving you the shell variable ``$$``). Since only one
shell is used for all the commands, you will get the same file name for
each command in the script.

The other problem comes from improperly-specified dependencies that
worked in Make because of its sequential, depth-first way of examining
them. While I do not want to go into depth on how PMake works (look in
`Chapter?4, *PMake for Gods* <gods.html>`__ if you are interested), I
will warn you that files in two different levels of the dependency tree
may be examined in a different order in PMake than they were in Make.
For example, given the makefile:

.. code:: programlisting

    a               :

    b c b           : d

PMake will examine the targets in the order ``c``, ``d``, ``b``, ``a``.
If the makefile's author expected PMake to abort before making ``c`` if
an error occurred while making ``b``, or if ``b`` needed to exist before
``c`` was made, (s)he will be sorely disappointed. The dependencies are
incomplete, since in both these cases, ``c`` would depend on ``b``. So
watch out.

Another problem you may face is that, while PMake is set up to handle
the output from multiple jobs in a graceful fashion, the same is not so
for input. It has no way to regulate input to different jobs, so if you
use the redirection from ``/dev/tty`` I mentioned earlier, you must be
careful not to run two of the jobs at once.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+------------------------------------------+
| `Prev <comments.html>`__?   | `Up <basics.html>`__    | ?\ `Next <writeanddebug.html>`__         |
+-----------------------------+-------------------------+------------------------------------------+
| 2.4.?Comments?              | `Home <index.html>`__   | ?2.6.?Writing and Debugging a Makefile   |
+-----------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
