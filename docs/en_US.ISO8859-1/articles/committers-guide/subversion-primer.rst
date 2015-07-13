====================
5.?Subversion Primer
====================

.. raw:: html

   <div class="navheader">

5.?Subversion Primer
`Prev <committer.types.html>`__?
?
?\ `Next <conventions.html>`__

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

5.?Subversion Primer
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is assumed that you are already familiar with the basic operation of
Subversion. If not, start by reading the `Subversion
Book <http://svnbook.red-bean.com/>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?Introduction
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD source repository switched from CVS to Subversion on May
31st, 2008. The first real SVN commit is *r179447*.

The FreeBSD ``doc/www`` repository switched from CVS to Subversion on
May 19th, 2012. The first real SVN commit is *r38821*.

The FreeBSD ``ports`` repository switched from CVS to Subversion on July
14th, 2012. The first real SVN commit is *r300894*.

Subversion can be installed from the FreeBSD Ports Collection by issuing
these commands:

.. code:: screen

    # pkg install subversion

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

5.2.?Getting Started
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are a few ways to obtain a working copy of the tree from
Subversion. This section will explain them.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.1.?Direct Checkout
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first is to check out directly from the main repository. For the
``src`` tree, use:

.. code:: screen

    % svn checkout svn+ssh://svn.freebsd.org/base/head /usr/src

For the ``doc`` tree, use:

.. code:: screen

    % svn checkout svn+ssh://svn.freebsd.org/doc/head /usr/doc

For the ``ports`` tree, use:

.. code:: screen

    % svn checkout svn+ssh://svn.freebsd.org/ports/head /usr/ports

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Though the remaining examples in this document are written with the
workflow of working with the ``src`` tree in mind, the underlying
concepts are the same for working with the ``doc`` and the ``ports``
tree. Ports related Subversion operations are listed in `Section?19,
“Ports Specific FAQ” <ports.html>`__.

.. raw:: html

   </div>

The above command will check out a ``CURRENT`` source tree as
``/usr/src/``, which can be any target directory on the local
filesystem. Omitting the final argument of that command causes the
working copy, in this case, to be named “head”, but that can be renamed
safely.

``svn+ssh`` means the SVN protocol tunnelled over SSH. The name of the
server is ``svn.freebsd.org``, ``base`` is the path to the repository,
and ``head`` is the subdirectory within the repository.

If your FreeBSD login name is different from your login name on your
local machine, you must either include it in the URL (for example
``svn+ssh://jarjar@svn.freebsd.org/base/head``), or add an entry to your
``~/.ssh/config`` in the form:

.. code:: programlisting

    Host svn.freebsd.org
        User jarjar

This is the simplest method, but it is hard to tell just yet how much
load it will place on the repository.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The ``svn diff`` does not require access to the server as SVN stores a
reference copy of every file in the working copy. This, however, means
that Subversion working copies are very large in size.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.2.?Checkout from a Mirror
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Check out a working copy from a mirror by substituting the mirror's URL
for ``svn+ssh://svn.freebsd.org/base``. This can be an official mirror
or a mirror maintained by using ``svnsync``.

There is a serious disadvantage to this method: every time something is
to be committed, a ``svn relocate`` to the master repository has to be
done, remembering to ``svn relocate`` back to the mirror after the
commit. Also, since ``svn relocate`` only works between repositories
that have the same UUID, some hacking of the local repository's UUID has
to occur before it is possible to start using it.

The hassle of a local ``svnsync`` mirror probably is not worth it unless
the network connectivity situation or other factors demand it. If it is
needed, see the end of this chapter for information on how to set one
up.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.3.?\ ``RELENG_*`` Branches and General Layout
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In ``svn+ssh://svn.freebsd.org/base``, *base* refers to the source tree.
Similarly, *ports* refers to the ports tree, and so on. These are
separate repositories with their own change number sequences, access
controls and commit mail.

For the base repository, HEAD refers to the -CURRENT tree. For example,
``head/bin/ls`` is what would go into ``/usr/src/bin/ls`` in a release.
Some key locations are:

.. raw:: html

   <div class="itemizedlist">

-  */head/* which corresponds to ``HEAD``, also known as ``-CURRENT``.

-  */stable/*``n``** which corresponds to ``RELENG_n``.

-  */releng/*``n.n``** which corresponds to ``RELENG_n_n``.

-  */release/*``n.n.n``** which corresponds to
   ``RELENG_n_n_n``\ \_RELEASE.

-  */vendor\** is the vendor branch import work area. This directory
   itself does not contain branches, however its subdirectories do. This
   contrasts with the *stable*, *releng* and *release* directories.

-  */projects* and */user* feature a branch work area, like in Perforce.
   As above, the */user* directory does not contain branches itself.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.4.?FreeBSD Documentation Project Branches and Layout
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In ``svn+ssh://svn.freebsd.org/doc``, *doc* refers to the repository
root of the source tree.

In general, most FreeBSD Documentation Project work will be done within
the ``head/`` branch of the documentation source tree.

FreeBSD documentation is written and/or translated to various languages,
each in a separate directory in the ``head/`` branch.

Each translation set contains several subdirectories for the various
parts of the FreeBSD Documentation Project. A few noteworthy directories
are:

.. raw:: html

   <div class="itemizedlist">

-  */articles/* contains the source code for articles written by various
   FreeBSD contributors.

-  */books/* contains the source code for the different books, such as
   the FreeBSD?Handbook.

-  */htdocs/* contains the source code for the FreeBSD?website.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.5.?FreeBSD Ports Tree Branches and Layout
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In ``svn+ssh://svn.freebsd.org/ports``, *ports* refers to the repository
root of the ports tree.

In general, most FreeBSD port work will be done within the ``head/``
branch of the ports tree which is the actual ports tree used to install
software. Some other key locations are:

.. raw:: html

   <div class="itemizedlist">

-  */branches/RELENG\_*``n_n_n``** which corresponds to ``RELENG_n_n_n``
   is used to merge back security updates in preparation for a release.

-  */tags/RELEASE\_*``n_n_n``** which corresponds to ``RELEASE_n_n_n``
   represents a release tag of the ports tree.

-  */tags/RELEASE\_*``n``*\ \_EOL* represents the end of life tag of a
   specific FreeBSD branch.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

5.3.?Daily Use
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section will explain how to perform common day-to-day operations
with Subversion.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.1.?Help
^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SVN has built in help documentation. It can be accessed by typing the
following command:

.. code:: screen

    % svn help

Additional information can be found in the `Subversion
Book <http://svnbook.red-bean.com/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.2.?Checkout
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As seen earlier, to check out the FreeBSD head branch:

.. code:: screen

    % svn checkout svn+ssh://svn.freebsd.org/base/head /usr/src

At some point, more than just ``HEAD`` will probably be useful, for
instance when merging changes to stable/7. Therefore, it may be useful
to have a partial checkout of the complete tree (a full checkout would
be very painful).

To do this, first check out the root of the repository:

.. code:: screen

    % svn checkout --depth=immediates svn+ssh://svn.freebsd.org/base

This will give ``base`` with all the files it contains (at the time of
writing, just ``ROADMAP.txt``) and empty subdirectories for ``head``,
``stable``, ``vendor`` and so on.

Expanding the working copy is possible. Just change the depth of the
various subdirectories:

.. code:: screen

    % svn up --set-depth=infinity base/head
    % svn up --set-depth=immediates base/release base/releng base/stable

The above command will pull down a full copy of ``head``, plus empty
copies of every ``release`` tag, every ``releng`` branch, and every
``stable`` branch.

If at a later date merging to ``7-STABLE`` is required, expand the
working copy:

.. code:: screen

    % svn up --set-depth=infinity base/stable/7

Subtrees do not have to be expanded completely. For instance, expanding
only ``stable/7/sys`` and then later expand the rest of ``stable/7``:

.. code:: screen

    % svn up --set-depth=infinity base/stable/7/sys
    % svn up --set-depth=infinity base/stable/7

Updating the tree with ``svn update`` will only update what was
previously asked for (in this case, ``head`` and ``stable/7``; it will
not pull down the whole tree.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Decreasing the depth of a working copy is not possible.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.3.?Anonymous Checkout
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is possible to anonymously check out the FreeBSD repository with
Subversion. This will give access to a read-only tree that can be
updated, but not committed back to the main repository. To do this, use
the following command:

.. code:: screen

    % svn co https://svn0.us-west.FreeBSD.org/base/head /usr/src

Select the closest mirror and verify the mirror server certificate from
the list of `Subversion mirror
sites <../../../../doc/en_US.ISO8859-1/books/handbook/svn.html#svn-mirrors>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.4.?Updating the Tree
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To update a working copy to either the latest revision, or a specific
revision:

.. code:: screen

    % svn update
    % svn update -r12345

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.5.?Status
^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To view the local changes that have been made to the working copy:

.. code:: screen

    % svn status

To show local changes and files that are out-of-date do:

.. code:: screen

    % svn status --show-updates

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.6.?Editing and Committing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unlike Perforce, SVN does not need to be told in advance about file
editing.

To commit all changes in the current directory and all subdirectories:

.. code:: screen

    % svn commit

To commit all changes in, for example, ``lib/libfetch/`` and
``usr/bin/fetch/`` in a single operation:

.. code:: screen

    % svn commit lib/libfetch usr/bin/fetch

There is also a commit wrapper for the ports tree to handle the
properties and sanity checking your changes:

.. code:: screen

    % /usr/ports/Tools/scripts/psvn commit

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.7.?Adding and Removing Files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Before adding files, get a copy of
`auto-props.txt <http://people.freebsd.org/~peter/auto-props.txt>`__
(there is also a `ports tree specific
version <http://people.freebsd.org/~beat/cvs2svn/auto-props.txt>`__) and
add it to ``~/.subversion/config`` according to the instructions in the
file. If you added something before reading this, use
``svn rm --keep-local`` for just added files, fix your config file and
re-add them again. The initial config file is created when you first run
a svn command, even something as simple as ``svn help``.

.. raw:: html

   </div>

Files are added to a SVN repository with ``svn         add``. To add a
file named *foo*, edit it, then:

.. code:: screen

    % svn add foo

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Most new source files should include a ``$FreeBSD$`` string near the
start of the file. On commit, ``svn`` will expand the ``$FreeBSD$``
string, adding the file path, revision number, date and time of commit,
and the username of the committer. Files which cannot be modified may be
committed without the ``$FreeBSD$`` string.

.. raw:: html

   </div>

Files can be removed with ``svn         remove``:

.. code:: screen

    % svn remove foo

Subversion does not require deleting the file before using ``svn rm``,
and indeed complains if that happens.

It is possible to add directories with ``svn add``:

.. code:: screen

    % mkdir bar
    % svn add bar

Although ``svn mkdir`` makes this easier by combining the creation of
the directory and the adding of it:

.. code:: screen

    % svn mkdir bar

Like files, directories are removed with ``svn rm``. There is no
separate command specifically for removing directories.

.. code:: screen

    % svn rm bar

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.8.?Copying and Moving Files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This command creates a copy of ``foo.c`` named ``bar.c``, with the new
file also under version control:

.. code:: screen

    % svn copy foo.c bar.c

The example above is equivalent to:

.. code:: screen

    % cp foo.c bar.c
    % svn add bar.c

To move and rename a file:

.. code:: screen

    % svn move foo.c bar.c

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.9.?Log and Annotate
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``svn log`` shows revisions and commit messages, most recent first, for
files or directories. When used on a directory, all revisions that
affected the directory and files within that directory are shown.

``svn annotate``, or equally ``svn         praise`` or ``svn blame``,
shows the most recent revision number and who committed that revision
for each line of a file.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.10.?Diffs
^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``svn diff`` displays changes to the working copy. Diffs generated by
SVN are unified and include new files by default in the diff output.

``svn diff`` can show the changes between two revisions of the same
file:

.. code:: screen

    % svn diff -r179453:179454 ROADMAP.txt

It can also show all changes for a specific changeset. The following
will show what changes were made to the current directory and all
subdirectories in changeset 179454:

.. code:: screen

    % svn diff -c179454 .

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.11.?Reverting
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Local changes (including additions and deletions) can be reverted using
``svn revert``. It does not update out-of-date files, but just replaces
them with pristine copies of the original version.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.12.?Conflicts
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If an ``svn update`` resulted in a merge conflict, Subversion will
remember which files have conflicts and refuse to commit any changes to
those files until explicitly told that the conflicts have been resolved.
The simple, not yet deprecated procedure is the following:

.. code:: screen

    % svn resolved foo

However, the preferred procedure is:

.. code:: screen

    % svn resolve --accept=working foo

The two examples are equivalent. Possible values for ``--accept`` are:

.. raw:: html

   <div class="itemizedlist">

-  ``working``: use the version in your working directory (which one
   presumes has been edited to resolve the conflicts).

-  ``base``: use a pristine copy of the version you had before
   ``svn update``, discarding your own changes, the conflicting changes,
   and possibly other intervening changes as well.

-  ``mine-full``: use what you had before ``svn update``, including your
   own changes, but discarding the conflicting changes, and possibly
   other intervening changes as well.

-  ``theirs-full``: use the version that was retrieved when you did
   ``svn update``, discarding your own changes.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

5.4.?Advanced Use
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.1.?Sparse Checkouts
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SVN allows *sparse*, or partial checkouts of a directory by adding
``--depth`` to a ``svn checkout``.

Valid arguments to ``--depth`` are:

.. raw:: html

   <div class="itemizedlist">

-  ``empty``: the directory itself without any of its contents.

-  ``files``: the directory and any files it contains.

-  ``immediates``: the directory and any files and directories it
   contains, but none of the subdirectories' contents.

-  ``infinity``: anything.

.. raw:: html

   </div>

The ``--depth`` option applies to many other commands, including
``svn commit``, ``svn revert``, and ``svn         diff``.

Since ``--depth`` is sticky, there is a ``--set-depth`` option for
``svn         update`` that will change the selected depth. Thus, given
the working copy produced by the previous example:

.. code:: screen

    % cd ~/freebsd
    % svn update --set-depth=immediates .

The above command will populate the working copy in *``~/freebsd``* with
``ROADMAP.txt`` and empty subdirectories, and nothing will happen when
``svn update`` is executed on the subdirectories. However, the following
command will set the depth for *``head``* (in this case) to infinity,
and fully populate it:

.. code:: screen

    % svn update --set-depth=infinity head

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.2.?Direct Operation
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Certain operations can be performed directly on the repository without
touching the working copy. Specifically, this applies to any operation
that does not require editing a file, including:

.. raw:: html

   <div class="itemizedlist">

-  ``log``, ``diff``

-  ``mkdir``

-  ``remove``, ``copy``, ``rename``

-  ``propset``, ``propedit``, ``propdel``

-  ``merge``

.. raw:: html

   </div>

Branching is very fast. The following command would be used to branch
``RELENG_8``:

.. code:: screen

    % svn copy svn+ssh://svn.freebsd.org/base/head svn+ssh://svn.freebsd.org/base/stable/8

This is equivalent to the following set of commands which take minutes
and hours as opposed to seconds, depending on your network connection:

.. code:: screen

    % svn checkout --depth=immediates svn+ssh://svn.freebsd.org/base
    % cd base
    % svn update --set-depth=infinity head
    % svn copy head stable/8
    % svn commit stable/8

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.?Merging with SVN
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section deals with merging code from one branch to another
(typically, from head to a stable branch).

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In all examples below, ``$FSVN`` refers to the location of the FreeBSD
Subversion repository, ``svn+ssh://svn.freebsd.org/base/``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.1.?About Merge Tracking
'''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

From the user's perspective, merge tracking information (or mergeinfo)
is stored in a property called ``svn:mergeinfo``, which is a
comma-separated list of revisions and ranges of revisions that have been
merged. When set on a file, it applies only to that file. When set on a
directory, it applies to that directory and its descendants (files and
directories) except for those that have their own ``svn:mergeinfo``.

It is *not* inherited. For instance, ``stable/6/contrib/openpam/`` does
not implicitly inherit mergeinfo from ``stable/6/``, or
``stable/6/contrib/``. Doing so would make partial checkouts very hard
to manage. Instead, mergeinfo is explicitly propagated down the tree.
For merging something into ``branch/foo/bar/``, the following rules
apply:

.. raw:: html

   <div class="orderedlist">

#. If ``branch/foo/bar/`` does not already have a mergeinfo record, but
   a direct ancestor (for instance, ``branch/foo/``) does, then that
   record will be propagated down to ``branch/foo/bar/`` before
   information about the current merge is recorded.

#. Information about the current merge will *not* be propagated back up
   that ancestor.

#. If a direct descendant of ``branch/foo/bar/`` (for instance,
   ``branch/foo/bar/baz/``) already has a mergeinfo record, information
   about the current merge will be propagated down to it.

.. raw:: html

   </div>

If you consider the case where a revision changes several separate parts
of the tree (for example, ``branch/foo/bar/`` and ``branch/foo/quux/``),
but you only want to merge some of it (for example,
``branch/foo/bar/``), you will see that these rules make sense. If
mergeinfo was propagated up, it would seem like that revision had also
been merged to ``branch/foo/quux/``, when in fact it had not been.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.2.?Selecting the Source and Target for ``stable/10`` and Newer
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Starting with the ``stable/10`` branch, all merges should be merged to
and committed from the root of the branch. All merges should look like:

.. code:: screen

    % svn merge -c r123456 ^/head/ checkout
    % svn commit checkout

Note that *``checkout``* should be a complete checkout of the branch to
which the merge occurs.

Merges to ``releng/`` branches should always originate from the
corresponding ``stable/`` branch. For example:

.. code:: screen

    % svn merge -c r123456 ^/stable/10 releng/10.0

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.3.?Selecting the Source and Target for ``stable/9`` and Older
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For ``stable/9`` and earlier, a different strategy was used,
distributing mergeinfo around the tree so that merges could be performed
without a complete checkout. This procedure proved extremely
error-prone, with the convenience of partial checkouts for merges
significantly outweighed by the complexity of picking mergeinfo targets.
The below describes this now-obsoleted procedure, which should be used
*only for merges prior to ``stable/10``*.

Because of mergeinfo propagation, it is important to choose the source
and target for the merge carefully to minimise property changes on
unrelated directories.

The rules for selecting the merge target (the directory that you will
merge the changes to) can be summarized as follows:

.. raw:: html

   <div class="orderedlist">

#. Never merge directly to a file.

#. Never, ever merge directly to a file.

#. *Never, ever, ever* merge directly to a file.

#. Changes to kernel code should be merged to ``sys/``. For instance, a
   change to the
   `ichwd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ichwd&sektion=4>`__
   driver should be merged to ``sys/``, not ``sys/dev/ichwd/``.
   Likewise, a change to the TCP/IP stack should be merged to ``sys/``,
   not ``sys/netinet/``.

#. Changes to code under ``etc/`` should be merged at ``etc/``, not
   below it.

#. Changes to vendor code (code in ``contrib/``, ``crypto/`` and so on)
   should be merged to the directory where vendor imports happen. For
   instance, a change to ``crypto/openssl/util/`` should be merged to
   ``crypto/openssl/``. This is rarely an issue, however, since changes
   to vendor code are usually merged wholesale.

#. Changes to userland programs should as a general rule be merged to
   the directory that contains the Makefile for that program. For
   instance, a change to ``usr.bin/xlint/arch/i386/`` should be merged
   to ``usr.bin/xlint/``.

#. Changes to userland libraries should as a general rule be merged to
   the directory that contains the Makefile for that library. For
   instance, a change to ``lib/libc/gen/`` should be merged to
   ``lib/libc/``.

#. There may be cases where it makes sense to deviate from the rules for
   userland programs and libraries. For instance, everything under
   ``lib/libpam/`` is merged to ``lib/libpam/``, even though the library
   itself and all of the modules each have their own Makefile.

#. Changes to manual pages should be merged to ``share/man/manN``/, for
   the appropriate value of ``N``.

#. Other changes to ``share/`` should be merged to the appropriate
   subdirectory and not to ``share/`` directly.

#. Changes to a top-level file in the source tree such as ``UPDATING``
   or ``Makefile.inc1`` should be merged directly to that file rather
   than to the root of the whole tree. Yes, this is an exception to the
   first three rules.

#. When in doubt, ask.

.. raw:: html

   </div>

If you need to merge changes to several places at once (for instance,
changing a kernel interface and every userland program that uses it),
merge each target separately, then commit them together. For instance,
if you merge a revision that changed a kernel API and updated all the
userland bits that used that API, you would merge the kernel change to
sys, and the userland bits to the appropriate userland directories, then
commit all of these in one go.

The source will almost invariably be the same as the target. For
instance, you will always merge ``stable/7/lib/libc/`` from
``head/lib/libc/``. The only exception would be when merging changes to
code that has moved in the source branch but not in the parent branch.
For instance, a change to
`pkill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkill&sektion=1>`__
would be merged from ``bin/pkill/`` in head to ``usr.bin/pkill/`` in
stable/7.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.4.?Preparing the Merge Target
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Because of the mergeinfo propagation issues described earlier, it is
very important that you never merge changes into a sparse working copy.
You must always have a full checkout of the branch you will merge into.
For instance, when merging from HEAD to 7, you must have a full checkout
of stable/7:

.. code:: screen

    % cd stable/7
    % svn up --set-depth=infinity

The target directory must also be up-to-date and must not contain any
uncommitted changes or stray files.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.5.?Identifying Revisions
''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Identifying revisions to be merged is a must. If the target already has
complete mergeinfo, ask SVN for a list:

.. code:: screen

    % cd stable/6/contrib/openpam
    % svn mergeinfo --show-revs=eligible $FSVN/head/contrib/openpam

If the target does not have complete mergeinfo, check the log for the
merge source.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.6.?Merging
''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now, let us start merging!

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.6.1.?The Principles
                         

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Say you would like to merge:

.. raw:: html

   <div class="itemizedlist">

-  revision ``$R``

-  in directory $target in stable branch $B

-  from directory $source in head

-  $FSVN is ``svn+ssh://svn.freebsd.org/base``

.. raw:: html

   </div>

Assuming that revisions $P and $Q have already been merged, and that the
current directory is an up-to-date working copy of stable/$B, the
existing mergeinfo looks like this:

.. code:: screen

    % svn propget svn:mergeinfo -R $target
    $target - /head/$source:$P,$Q

Merging is done like so:

.. code:: screen

    % svn merge -c$R $FSVN/head/$source $target

Checking the results of this is possible with ``svn diff``.

The svn:mergeinfo now looks like:

.. code:: screen

    % svn propget svn:mergeinfo -R $target
    $target - head/$source:$P,$Q,$R

If the results are not exactly as shown, assistance may be required
before committing as mistakes may have been made, or there may be
something wrong with the existing mergeinfo, or there may be a bug in
Subversion.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.6.2.?Practical Example
                            

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As a practical example, consider the following scenario. The changes to
``netmap.4`` in r238987 are to be merged from CURRENT to 9-STABLE. The
file resides in ``head/share/man/man4``. According to `Section?5.4.3,
“Merging with SVN” <subversion-primer.html#svn-advanced-use-merging>`__,
this is also where to do the merge. Note that in this example all paths
are relative to the top of the svn repository. For more information on
the directory layout, see `Section?5.2.3, “\ ``RELENG_*`` Branches and
General
Layout” <subversion-primer.html#svn-getting-started-base-layout>`__.

The first step is to inspect the existing mergeinfo.

.. code:: screen

    % svn propget svn:mergeinfo -R stable/9/share/man/man4

Take a quick note of how it looks before moving on to the next step;
doing the actual merge:

.. code:: screen

    % svn merge -c r238987 svn+ssh://svn.freebsd.org/base/head/share/man/man4 stable/9/share/man/man4
    --- Merging r238987 into 'stable/9/share/man/man4':
    U    stable/9/share/man/man4/netmap.4
    --- Recording mergeinfo for merge of r238987 into
    'stable/9/share/man/man4':
     U   stable/9/share/man/man4

Check that the revision number of the merged revision has been added.
Once this is verified, the only thing left is the actual commit.

.. code:: screen

    % svn commit stable/9/share/man/man4

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.6.3.?Merging into the Kernel (``sys/``)
                                             

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As stated above, merging into the kernel is different from merging in
the rest of the tree. In many ways merging to the kernel is simpler
because there is always the same merge target (``sys/``).

Once ``svn merge`` has been executed, ``svn diff`` has to be run on the
directory to check the changes. This may show some unrelated property
changes, but these can be ignored. Next, build and test the kernel, and,
once the tests are complete, commit the code as normal, making sure that
the commit message starts with “Merge *``r226222``* from head”, or
similar.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.7.?Precautions Before Committing
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As always, build world (or appropriate parts of it).

Check the changes with ``svn diff`` and ``svn stat``. Make sure all the
files that should have been added or deleted were in fact added or
deleted.

Take a closer look at any property change (marked by a ``M`` in the
second column of ``svn           stat``). Normally, no svn:mergeinfo
properties should be anywhere except the target directory (or
directories).

If something looks fishy, ask for help.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.3.8.?Committing
'''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Make sure to commit a top level directory to have the mergeinfo included
as well. Do not specify individual files on the command line. For more
information about committing files in general, see the relevant section
of this primer.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.?Vendor Imports with SVN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Please read this entire section before starting a vendor import.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Patches to vendor code fall into two categories:

.. raw:: html

   <div class="itemizedlist" xmlns="http://www.w3.org/1999/xhtml">

-  Vendor patches: these are patches that have been issued by the
   vendor, or that have been extracted from the vendor's version control
   system, which address issues which in your opinion cannot wait until
   the next vendor release.

-  FreeBSD patches: these are patches that modify the vendor code to
   address FreeBSD-specific issues.

.. raw:: html

   </div>

The nature of a patch dictates where it should be committed:

.. raw:: html

   <div class="itemizedlist" xmlns="http://www.w3.org/1999/xhtml">

-  Vendor patches should be committed to the vendor branch, and merged
   from there to head. If the patch addresses an issue in a new release
   that is currently being imported, it *must not* be committed along
   with the new release: the release must be imported and tagged first,
   then the patch can be applied and committed. There is no need to
   re-tag the vendor sources after committing the patch.

-  FreeBSD patches should be committed directly to head.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.1.?Preparing the Tree
'''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If importing for the first time after the switch to Subversion,
flattening and cleaning up the vendor tree is necessary, as well as
bootstrapping the merge history in the main tree.

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.1.1.?Flattening
                     

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

During the conversion from CVS to Subversion, vendor branches were
imported with the same layout as the main tree. This means that the
``pf`` vendor sources ended up in ``vendor/pf/dist/contrib/pf``. The
vendor source is best directly in ``vendor/pf/dist``.

To flatten the ``pf`` tree:

.. code:: screen

    % cd vendor/pf/dist/contrib/pf
    % svn mv $(svn list) ../..
    % cd ../..
    % svn rm contrib
    % svn propdel -R svn:mergeinfo .
    % svn commit

The ``propdel`` bit is necessary because starting with 1.5, Subversion
will automatically add ``svn:mergeinfo`` to any directory that is copied
or moved. In this case, as nothing is being merged from the deleted
tree, they just get in the way.

Tags may be flattened as well (3, 4, 3.5 etc.); the procedure is exactly
the same, only changing ``dist`` to ``3.5`` or similar, and putting the
``svn commit`` off until the end of the process.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.1.2.?Cleaning Up
                      

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``dist`` tree can be cleaned up as necessary. Disabling keyword
expansion is recommended, as it makes no sense on unmodified vendor code
and in some cases it can even be harmful. OpenSSH, for example, includes
two files that originated with FreeBSD and still contain the original
version tags. To do this:

.. code:: screen

    % svn propdel svn:keywords -R .
    % svn commit

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.1.3.?Bootstrapping Merge History
                                      

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If importing for the first time after the switch to Subversion,
bootstrap ``svn:mergeinfo`` on the target directory in the main tree to
the revision that corresponds to the last related change to the vendor
tree, prior to importing new sources:

.. code:: screen

    % cd head/contrib/pf
    % svn merge --record-only svn+ssh://svn.freebsd.org/base/vendor/pf/dist@180876 .
    % svn commit

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.2.?Importing New Sources
''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With two commits—one for the import itself and one for the tag—this step
can optionally be repeated for every upstream release between the last
import and the current import.

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.2.1.?Preparing the Vendor Sources
                                       

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unlike in CVS where only the needed parts were imported into the vendor
tree to avoid bloating the main tree, Subversion is able to store a full
distribution in the vendor tree. So, import everything, but merge only
what is required.

A ``svn add`` is required to add any files that were added since the
last vendor import, and ``svn rm`` is required to remove any that were
removed since. Preparing sorted lists of the contents of the vendor tree
and of the sources that are about to be imported is recommended, to
facilitate the process.

.. code:: screen

    % cd vendor/pf/dist
    % svn list -R | grep -v '/$' | sort >../old
    % cd ../pf-4.3
    % find . -type f | cut -c 3- | sort >../new

With these two files, ``comm -23 ../old ../new`` will list removed files
(files only in ``old``), while ``comm -13 ../old ../new`` will list
added files only in ``new``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.2.2.?Importing into the Vendor Tree
                                         

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now, the sources must be copied into ``dist`` and the ``svn add`` and
``svn rm`` commands should be used as needed:

.. code:: screen

    % cd vendor/pf/pf-4.3
    % tar cf - . | tar xf - -C ../dist
    % cd ../dist
    % comm -23 ../old ../new | xargs svn rm
    % comm -13 ../old ../new | xargs svn --parents add

If any directories were removed, they will have to be ``svn rm``\ ed
manually. Nothing will break if they are not, but they will remain in
the tree.

Check properties on any new files. All text files should have
``svn:eol-style`` set to ``native``. All binary files should have
``svn:mime-type`` set to ``application/octet-stream`` unless there is a
more appropriate media type. Executable files should have
``svn:executable`` set to ``*``. No other properties should exist on any
file in the tree.

Committing is now possible, however it is good practice to make sure
that everything is OK by using the ``svn stat`` and ``svn diff``
commands.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.2.3.?Tagging
                  

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once committed, vendor releases should be tagged for future reference.
The best and quickest way to do this is directly in the repository:

.. code:: screen

    % svn cp svn+ssh://svn.freebsd.org/base/vendor/pf/dist svn+ssh://svn.freebsd.org/base/vendor/pf/4.3

Once that is complete, ``svn up`` the working copy of ``vendor/pf`` to
get the new tag, although this is rarely needed.

If creating the tag in the working copy of the tree, ``svn:mergeinfo``
results must be removed:

.. code:: screen

    % cd  vendor/pf
    % svn cp dist 4.3
    % svn propdel svn:mergeinfo -R 4.3

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.3.?Merging to Head
''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: screen

    % cd head/contrib/pf
    % svn up
    % svn merge --accept=postpone svn+ssh://svn.freebsd.org/base/vendor/pf/dist .

The ``--accept=postpone`` tells Subversion that it should not complain
because merge conflicts will be taken care of manually.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

The ``cvs2svn`` changeover occurred on June 3, 2008. When performing
vendor merges for packages which were already present and converted by
the ``cvs2svn`` process, the command used to merge
``/vendor/package_name``/dist to ``/head/package_location`` (for
example, ``head/contrib/sendmail``) must use ``-c REV`` to indicate the
revision to merge from the ``/vendor`` tree. For example:

.. code:: screen

    % svn checkout svn+ssh://svn.freebsd.org/base/head/contrib/sendmail
    % cd sendmail
    % svn merge -c r261190 ^/vendor/sendmail/dist .

``^`` is an alias for the repository path.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If using the Zsh shell, the ``^`` must be escaped with ``\``. This means
``^/head`` should be ``\^/head``.

.. raw:: html

   </div>

It is necessary to resolve any merge conflicts.

Make sure that any files that were added or removed in the vendor tree
have been properly added or removed in the main tree. To check diffs
against the vendor branch:

.. code:: screen

    % svn diff --no-diff-deleted --old=svn+ssh://svn.freebsd.org/base/vendor/pf/dist --new=.

The ``--no-diff-deleted`` tells Subversion not to complain about files
that are in the vendor tree but not in the main tree, i.e., things that
would have previously been removed before the vendor import, like for
example the vendor's makefiles and configure scripts.

Using CVS, once a file was off the vendor branch, it was not able to be
put back. With Subversion, there is no concept of on or off the vendor
branch. If a file that previously had local modifications, to make it
not show up in diffs in the vendor tree, all that has to be done is
remove any left-over cruft like FreeBSD version tags, which is much
easier.

If any changes are required for the world to build with the new sources,
make them now, and keep testing until everything builds and runs
perfectly.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.4.?Committing the Vendor Import
'''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Committing is now possible! Everything must be committed in one go. If
done properly, the tree will move from a consistent state with old code,
to a consistent state with new code.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.5.?From Scratch
'''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.5.1.?Importing into the Vendor Tree
                                         

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section is an example of importing and tagging byacc into ``head``.

First, prepare the directory in ``vendor``:

.. code:: screen

    % svn co --depth immediates $FSVN/vendor
    % cd vendor
    % svn mkdir byacc
    % svn mkdir byacc/dist

Now, import the sources into the ``dist`` directory. Once the files are
in place, ``svn add`` the new ones, then ``svn commit`` and tag the
imported version. To save time and bandwidth, direct remote committing
and tagging is possible:

.. code:: screen

    % svn cp -m "Tag byacc 20120115" $FSVN/vendor/byacc/dist $FSVN/vendor/byacc/20120115

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.4.5.2.?Merging to ``head``
                              

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Due to this being a new file, copy it for the merge:

.. code:: screen

    % svn cp -m "Import byacc to contrib" $FSVN/vendor/byacc/dist $FSVN/head/contrib/byacc

Working normally on newly imported sources is still possible.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.5.?Reverting a Commit
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Reverting a commit to a previous version is fairly easy:

.. code:: screen

    % svn merge -r179454:179453 ROADMAP.txt
    % svn commit

Change number syntax, with negative meaning a reverse change, can also
be used:

.. code:: screen

    % svn merge -c -179454 ROADMAP.txt
    % svn commit

This can also be done directly in the repository:

.. code:: screen

    % svn merge -r179454:179453 svn+ssh://svn.freebsd.org/base/ROADMAP.txt

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is important to ensure that the mergeinfo is correct when reverting a
file in order to permit ``svn mergeinfo --eligible`` to work as
expected.

.. raw:: html

   </div>

Reverting the deletion of a file is slightly different. Copying the
version of the file that predates the deletion is required. For example,
to restore a file that was deleted in revision N, restore version N-1:

.. code:: screen

    % svn copy svn+ssh://svn.freebsd.org/base/ROADMAP.txt@179454
    % svn commit

or, equally:

.. code:: screen

    % svn copy svn+ssh://svn.freebsd.org/base/ROADMAP.txt@179454 svn+ssh://svn.freebsd.org/base

Do *not* simply recreate the file manually and ``svn add`` it—this will
cause history to be lost.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.6.?Fixing Mistakes
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While we can do surgery in an emergency, do not plan on having mistakes
fixed behind the scenes. Plan on mistakes remaining in the logs forever.
Be sure to check the output of ``svn status`` and ``svn         diff``
before committing.

Mistakes will happen but, they can generally be fixed without
disruption.

Take a case of adding a file in the wrong location. The right thing to
do is to ``svn move`` the file to the correct location and commit. This
causes just a couple of lines of metadata in the repository journal, and
the logs are all linked up correctly.

The wrong thing to do is to delete the file and then ``svn add`` an
independent copy in the correct location. Instead of a couple of lines
of text, the repository journal grows an entire new copy of the file.
This is a waste.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.7.?Setting up a svnsync Mirror
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

You probably do not want to do this unless there is a good reason for
it. Such reasons might be to support many multiple local read-only
client machines, or if your network bandwidth is limited. Starting a
fresh mirror from empty would take a very long time. Expect a minimum of
10 hours for high speed connectivity. If you have international links,
expect this to take 4 to 10 times longer.

A far better option is to grab a seed file. It is large (~1GB) but will
consume less network traffic and take less time to fetch than a svnsync
will. This is possible in one of the following three ways:

.. code:: screen

    % rsync -va --partial --progress freefall:/home/peter/svnmirror-base-r179637.tbz2 .

.. code:: screen

    % rsync -va --partial --progress rsync://repoman.freebsd.org:50873/svnseed/svnmirror-base-r215629.tar.xz .

.. code:: screen

    % fetch ftp://ftp.freebsd.org/pub/FreeBSD/development/subversion/svnmirror-base-r221445.tar.xz

Once you have the file, extract it to somewhere like
``home/svnmirror/base/``. Then, update it, so that it fetches changes
since the last revision in the archive:

.. code:: screen

    % svnsync sync file:///home/svnmirror/base

You can then set that up to run from
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__,
do checkouts locally, set up a svnserve server for your local machines
to talk to, etc.

The seed mirror is set to fetch from ``svn://svn.freebsd.org/base``. The
configuration for the mirror is stored in ``revprop 0`` on the local
mirror. To see the configuration, try:

.. code:: screen

    % svn proplist -v --revprop -r 0 file:///home/svnmirror/base

Use ``propset`` to change things.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.8.?Committing High-ASCII Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Files that have high-ASCII bits are considered binary files in SVN, so
the pre-commit checks fail and indicate that the ``mime-type`` property
should be set to ``application/octet-stream``. However, the use of this
is discouraged, so please do not set it. The best way is always avoiding
high-ASCII data, so that it can be read everywhere with any text editor
but if it is not avoidable, instead of changing the mime-type, set the
``fbsd:notbinary`` property with ``propset``:

.. code:: screen

    % svn propset fbsd:notbinary yes foo.data

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.9.?Maintaining a Project Branch
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A project branch is one that is synced to head (or another branch) is
used to develop a project then commit it back to head. In SVN, “dolphin”
branching is used for this. A “dolphin” branch is one that diverges for
a while and is finally committed back to the original branch. During
development code migration in one direction (from head to the branch
only). No code is committed back to head until the end. Once you commit
back at the end, the branch is dead (although you can have a new branch
with the same name after you delete the branch if you want).

As per http://people.freebsd.org/~peter/svn_notes.txt, work that is
intended to be merged back into HEAD should be in ``base/projects/``. If
you are doing work that is beneficial to the FreeBSD community in some
way but not intended to be merged directly back into HEAD then the
proper location is ``base/user/your-name``/. `This
page <http://svnweb.freebsd.org/base/projects/GUIDELINES.txt>`__
contains further details.

To create a project branch:

.. code:: screen

    % svn copy svn+ssh://svn.freebsd.org/base/head svn+ssh://svn.freebsd.org/base/projects/spif

To merge changes from HEAD back into the project branch:

.. code:: screen

    % cd copy_of_spif
    % svn merge svn+ssh://svn.freebsd.org/base/head
    % svn commit

It is important to resolve any merge conflicts before committing.

.. raw:: html

   </div>

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

5.5.?Some Tips
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In commit logs etc., “rev 179872” should be spelled “r179872” as per
convention.

Speeding up svn is possible by adding the following to
``~/.ssh/config``:

.. code:: screen

    Host *
    ControlPath ~/.ssh/sockets/master-%l-%r@%h:%p
    ControlMaster auto
    ControlPersist yes

and then typing

.. code:: screen

    mkdir ~/.ssh/sockets

Checking out a working copy with a stock Subversion client without
FreeBSD-specific patches (``OPTIONS_SET=FREEBSD_TEMPLATE``) will mean
that ``$FreeBSD$`` tags will not be expanded. Once the correct version
has been installed, trick Subversion into expanding them like so:

.. code:: screen

    % svn propdel -R svn:keywords .
    % svn revert -R .

This will wipe out uncommitted patches.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+------------------------------------------+
| `Prev <committer.types.html>`__?   | ?                       | ?\ `Next <conventions.html>`__           |
+------------------------------------+-------------------------+------------------------------------------+
| 4.?Commit Bit Types?               | `Home <index.html>`__   | ?6.?Setup, Conventions, and Traditions   |
+------------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
