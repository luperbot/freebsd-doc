=========
10.?Diffs
=========

.. raw:: html

   <div class="navheader">

10.?Diffs
`Prev <changes.html>`__?
?
?\ `Next <add-rm-files.html>`__

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

10.?Diffs
---------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two methods of producing file diffs in Perforce, either
against local changes that have not been submitted yet, or between two
trees (or within a branch) in the depot. These are done with different
commands, ``diff`` and ``diff2``:

.. raw:: html

   <div class="variablelist">

``p4 diff``
    This generates a diff of the local changes to files in the edit
    state. The ``-du`` and ``-dc`` flags can be used to create unified
    or context diffs, respectively, or the ``P4DIFF`` environment
    variable can be set to a local diff command to be used instead. It
    is a very good idea to use this command to review your changes
    before submitting them.

``p4 diff2``
    This creates a diff between arbitrary files in the depot, or between
    files specified in a branch spec. The diff operation takes place on
    the server, so ``P4DIFF`` variable has no effect, though the ``-du``
    and ``-dc`` flags do work. The two forms of this command are:

    .. code:: screen

        % p4 diff2 -b branchname

    and

    .. code:: screen

        % p4 diff2 //depot/path1 //depot/path2

.. raw:: html

   </div>

In all cases the diff will be written to the standard output.
Unfortunately, Perforce produces a diff format that is slightly
incompatible with the traditional Unix diff and patch tools. Using the
``P4DIFF`` variable to point to the real
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
tool can help this, but only for ``p4 diff``. The output of ``diff2``
command must be post-processed to be useful (the ``-u`` flag of
``diff2`` will produce unified diffs that are somewhat compatible, but
it does not include files that have been added or deleted). There is a
post-processing script at:
``https://svnweb.freebsd.org/base/head/tools/tools/perforce/awkdiff?view=co``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+-----------------------------------+
| `Prev <changes.html>`__?                 | ?                       | ?\ `Next <add-rm-files.html>`__   |
+------------------------------------------+-------------------------+-----------------------------------+
| 9.?Changes, Descriptions, and History?   | `Home <index.html>`__   | ?11.?Adding and Removing Files    |
+------------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
