======================
19.?Ports Specific FAQ
======================

.. raw:: html

   <div class="navheader">

19.?Ports Specific FAQ
`Prev <archs.html>`__?
?
?\ `Next <non-committers.html>`__

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

19.?Ports Specific FAQ
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="qandaset">

19.1. `Adding a New Port <ports.html#ports-qa-adding>`__
19.1.1. `How do I add a new port? <ports.html#ports-qa-add-new>`__
19.1.2. `Any other things I need to know when I add a new
port? <ports.html#ports-qa-add-new-extra>`__
19.2. `Removing an Existing Port <ports.html#ports-qa-removing>`__
19.2.1. `How do I remove an existing
port? <ports.html#ports-qa-remove-one>`__
19.3. `Re-adding a Deleted Port <ports.html#ports-qa-re-adding>`__
19.3.1. `How do I re-add a deleted
port? <ports.html#ports-qa-resurrect>`__
19.4. `Repository Copies <ports.html#ports-qa-repocopies>`__
19.4.1. `When do we need a repository
copy? <ports.html#ports-qa-repocopy-when>`__
19.4.2. `What do I need to do? <ports.html#ports-qa-repocopy-how>`__
19.5. `Ports Freeze <ports.html#ports-qa-freeze>`__
19.5.1. `What is a “ports freeze”? <ports.html#ports-qa-freeze-what>`__
19.6. `Creating a New Category <ports.html#ports-qa-new-category>`__
19.6.1. `What is the procedure for creating a new
category? <ports.html#ports-qa-new-category-how>`__
19.6.2. `What do I need to do to implement a new physical
category? <ports.html#ports-qa-new-category-physical>`__
19.6.3. `What do I need to do to implement a new virtual
category? <ports.html#ports-qa-new-category-virtual>`__
19.7. `Miscellaneous Questions <ports.html#ports-qa-misc-questions>`__
19.7.1. `How do I know if my port is building correctly or
not? <ports.html#ports-qa-misc-correctly-building>`__
19.7.2. `I added a new port. Do I need to add it to the
INDEX? <ports.html#ports-qa-misc-INDEX>`__
19.7.3. `Are there any other files I am not allowed to
touch? <ports.html#ports-qa-misc-no-touch>`__
19.7.4. `What is the proper procedure for updating the checksum for a
port's distfile when the file changes without a version
change? <ports.html#ports-qa-misc-updated-distfile>`__
19.7.5. `What is the procedure to request authorization for merging a
commit to the quarterly
branch? <ports.html#ports-qa-misc-request-mfh>`__
19.1. Adding a New Port
^^^^^^^^^^^^^^^^^^^^^^^

19.1.1. `How do I add a new port? <ports.html#ports-qa-add-new>`__
19.1.2. `Any other things I need to know when I add a new
port? <ports.html#ports-qa-add-new-extra>`__
**19.1.1.**

How do I add a new port?

First, please read the section about repository copies.

The easiest way to add a new port is the ``addport`` script located in
the ``ports/Tools/scripts`` directory. It adds a port from the directory
specified, determining the category automatically from the port
``Makefile``. It also adds an entry to the port's category ``Makefile``.
It was written by Michael Haro ``<mharo@FreeBSD.org>``, Will Andrews
``<will@FreeBSD.org>``, and Renato Botelho ``<garga@FreeBSD.org>``. When
sending questions about this script to the `FreeBSD ports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__,
please also CC Chris Rees ``<crees@FreeBSD.org>``, the current
maintainer.

**19.1.2.**

Any other things I need to know when I add a new port?

Check the port, preferably to make sure it compiles and packages
correctly. This is the recommended sequence:

.. code:: screen

    # make install
    # make package
    # make deinstall
    # pkg add package you built above
    # make deinstall
    # make reinstall
    # make package

The `Porters
Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook/index.html>`__
contains more detailed instructions.

Use
`portlint(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portlint&sektion=1>`__
to check the syntax of the port. You do not necessarily have to
eliminate all warnings but make sure you have fixed the simple ones.

If the port came from a submitter who has not contributed to the Project
before, add that person's name to the `Additional
Contributors <../../../../doc/en_US.ISO8859-1/articles/contributors/contrib-additional.html>`__
section of the FreeBSD Contributors List.

Close the PR if the port came in as a PR. To close a PR, change the
state to ``Issue           Resolved`` and the resolution as ``Fixed``.

19.2. Removing an Existing Port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

19.2.1. `How do I remove an existing
port? <ports.html#ports-qa-remove-one>`__
**19.2.1.**

How do I remove an existing port?

First, please read the section about repository copies. Before you
remove the port, you have to verify there are no other ports depending
on it.

.. raw:: html

   <div class="itemizedlist">

-  Make sure there is no dependency on the port in the ports collection:

   .. raw:: html

      <div class="itemizedlist">

   -  The port's PKGNAME should appear in exactly one line in a recent
      INDEX file.

   -  No other ports should contain any reference to the port's
      directory or PKGNAME in their Makefiles

   .. raw:: html

      </div>

-  Then, remove the port:

   .. raw:: html

      <div class="procedure">

   #. Remove the port's files and directory with ``svn remove``.

   #. Remove the ``SUBDIR`` listing of the port in the parent directory
      ``Makefile``.

   #. Add an entry to ``ports/MOVED``.

   #. Remove the port from ``ports/LEGAL`` if it is there.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Alternatively, you can use the ``rmport`` script, from
``ports/Tools/scripts``. This script was written by Vasil Dimov
``<vd@FreeBSD.org>``. When sending questions about this script to the
`FreeBSD ports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__,
please also CC Chris Rees ``<crees@FreeBSD.org>``, the current
maintainer.

19.3. Re-adding a Deleted Port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

19.3.1. `How do I re-add a deleted
port? <ports.html#ports-qa-resurrect>`__
**19.3.1.**

How do I re-add a deleted port?

This is essentially the reverse of deleting a port.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Do not use ``svn add`` to add the port. Follow these steps. If they are
unclear, or are not working, ask for help, do not just ``svn add`` the
port.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Figure out when the port was removed. Use this
   `list <http://people.freebsd.org/~crees/removed_ports/index.xml>`__,
   or look for the port on `freshports <http://www.freshports.org/>`__,
   and then copy the last living revision of the port:

   .. code:: screen

       % cd /usr/ports/category
       % svn cp 'svn+ssh://svn.freebsd.org/ports/head/category/portname/@XXXXXX' portname

   Pick the revision that is just before the removal. For example, if
   the revision where it was removed is ``269874``, use ``269873``.

   It is also possible to specify a date. In that case, pick a date that
   is before the removal but after the last commit to the port.

   .. code:: screen

       % cd /usr/ports/category
       % svn cp 'svn+ssh://svn.freebsd.org/ports/head/category/portname/@{YYYY-MM-DD}' portname

#. Make the changes necessary to get the port working again. If it was
   deleted because the distfiles are no longer available, either
   volunteer to host the distfiles, or find someone else to do so.

#. If some files have been added, or were removed during the
   resurrection process, use ``svn             add`` or ``svn remove``
   to make sure all the files in the port will be committed.

#. Restore the ``SUBDIR`` listing of the port in the parent directory
   ``Makefile``, keeping the entries sorted.

#. Delete the port entry from ``ports/MOVED``.

#. If the port had an entry in ``ports/LEGAL``, restore it.

#. ``svn commit`` these changes, preferably in one step.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

The ``addport`` script mentioned in `Q & A?19.1, “Adding a New
Port” <ports.html#ports-qa-adding>`__ now detects when the port to add
has previously existed, and attempts to handle all except the
``ports/LEGAL`` step automatically.

.. raw:: html

   </div>

19.4. Repository Copies
^^^^^^^^^^^^^^^^^^^^^^^

19.4.1. `When do we need a repository
copy? <ports.html#ports-qa-repocopy-when>`__
19.4.2. `What do I need to do? <ports.html#ports-qa-repocopy-how>`__
**19.4.1.**

When do we need a repository copy?

When you want to add a port that is related to any port that is already
in the tree in a separate directory, you have to do a repository copy.
Here *related* means it is a different version or a slightly modified
version. Examples are ``print/ghostscript*`` (different versions) and
``x11-wm/windowmaker*`` (English-only and internationalized version).

Another example is when a port is moved from one subdirectory to
another, or when you want to change the name of a directory because the
author(s) renamed their software even though it is a descendant of a
port already in a tree.

**19.4.2.**

What do I need to do?

With Subversion, a repo copy can be done by any committer:

.. raw:: html

   <div class="itemizedlist">

-  Doing a repo copy:

   .. raw:: html

      <div class="procedure">

   #. Verify that the target directory does not exist.

   #. Use ``svn up`` to make certain the original files, directories,
      and checkout information is current.

   #. Use ``svn move`` or ``svn copy`` to do the repo copy.

   #. Upgrade the copied port to the new version. Remember to add or
      change the ``PKGNAMEPREFIX`` or ``PKGNAMESUFFIX`` so there are no
      duplicate ports with the same name. In some rare cases it may be
      necessary to change the ``PORTNAME`` instead of adding
      ``PKGNAMEPREFIX`` or ``PKGNAMESUFFIX``, but this should only be
      done when it is really needed — e.g., using an existing port as
      the base for a very similar program with a different name, or
      upgrading a port to a new upstream version which actually changes
      the distribution name, like the transition from
      ``textproc/libxml`` to ``textproc/libxml2``. In most cases, adding
      or changing ``PKGNAMEPREFIX`` or ``PKGNAMESUFFIX`` should suffice.

   #. Add the new subdirectory to the ``SUBDIR`` listing in the parent
      directory ``Makefile``. You can run ``make checksubdirs`` in the
      parent directory to check this.

   #. If the port changed categories, modify the ``CATEGORIES`` line of
      the port's ``Makefile`` accordingly

   #. Add an entry to ``ports/MOVED``, if you remove the original port.

   #. Commit all changes on one commit.

   .. raw:: html

      </div>

-  When removing a port:

   .. raw:: html

      <div class="procedure">

   #. Perform a thorough check of the ports collection for any
      dependencies on the old port location/name, and update them.
      Running ``grep`` on ``INDEX`` is not enough because some ports
      have dependencies enabled by compile-time options. A full
      ``grep -r`` of the ports collection is recommended.

   #. Remove the old port and the old ``SUBDIR`` entry.

   #. Add an entry to ``ports/MOVED``.

   .. raw:: html

      </div>

-  After repo moves (“rename” operations where a port is copied and the
   old location is removed):

   .. raw:: html

      <div class="procedure">

   -  Follow the same steps that are outlined in the previous two
      entries, to activate the new location of the port and remove the
      old one.

   .. raw:: html

      </div>

.. raw:: html

   </div>

19.5. Ports Freeze
^^^^^^^^^^^^^^^^^^

19.5.1. `What is a “ports freeze”? <ports.html#ports-qa-freeze-what>`__
**19.5.1.**

What is a “ports freeze”?

A “ports freeze” was a restricted state the ports tree was put in before
a release. It was used to ensure a higher quality for the packages
shipped with a release. It usually lasted a couple of weeks. During that
time, build problems were fixed, and the release packages were built.
This practice is no longer used, as the packages for the releases are
built from the current stable, quarterly branch. For more information on
how to merge commits to the quarterly branch, see
`Q:?19.7.5 <ports.html#ports-qa-misc-request-mfh>`__.

19.6. Creating a New Category
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

19.6.1. `What is the procedure for creating a new
category? <ports.html#ports-qa-new-category-how>`__
19.6.2. `What do I need to do to implement a new physical
category? <ports.html#ports-qa-new-category-physical>`__
19.6.3. `What do I need to do to implement a new virtual
category? <ports.html#ports-qa-new-category-virtual>`__
**19.6.1.**

What is the procedure for creating a new category?

Please see `Proposing a New
Category <../../../../doc/en_US.ISO8859-1/books/porters-handbook/makefile-categories.html#PROPOSING-CATEGORIES>`__
in the Porter's Handbook. Once that procedure has been followed and the
PR has been assigned to Ports Management Team ``<portmgr@FreeBSD.org>``,
it is their decision whether or not to approve it. If they do, it is
their responsibility to do the following:

.. raw:: html

   <div class="procedure">

#. Perform any needed moves. (This only applies to physical categories.)

#. Update the ``VALID_CATEGORIES`` definition in
   ``ports/Mk/bsd.port.mk``.

#. Assign the PR back to you.

.. raw:: html

   </div>

**19.6.2.**

What do I need to do to implement a new physical category?

.. raw:: html

   <div class="procedure">

#. Upgrade each moved port's ``Makefile``. Do not connect the new
   category to the build yet.

   To do this, you will need to:

   .. raw:: html

      <div class="procedure">

   #. Change the port's ``CATEGORIES`` (this was the point of the
      exercise, remember?) The new category should be listed *first*.
      This will help to ensure that the ``PKGORIGIN`` is correct.

   #. Run a ``make describe``. Since the top-level ``make index`` that
      you will be running in a few steps is an iteration of
      ``make describe`` over the entire ports hierarchy, catching any
      errors here will save you having to re-run that step later on.

   #. If you want to be really thorough, now might be a good time to run
      `portlint(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portlint&sektion=1>`__.

   .. raw:: html

      </div>

#. Check that the ``PKGORIGIN``\ s are correct. The ports system uses
   each port's ``CATEGORIES`` entry to create its ``PKGORIGIN``, which
   is used to connect installed packages to the port directory they were
   built from. If this entry is wrong, common port tools like
   `pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1>`__
   and
   `portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1>`__
   fail.

   To do this, use the ``chkorigin.sh`` tool, as follows:
   ``env           PORTSDIR=/path/to/ports`` sh -e
   *``/path/to/ports``*/Tools/scripts/chkorigin.sh. This will check
   *every* port in the ports tree, even those not connected to the
   build, so you can run it directly after the move operation. Hint: do
   not forget to look at the ``PKGORIGIN``\ s of any slave ports of the
   ports you just moved!

#. On your own local system, test the proposed changes: first, comment
   out the ``SUBDIR`` entries in the old ports' categories'
   ``Makefile``\ s; then enable building the new category in
   ``ports/Makefile``. Run ``make checksubdirs`` in the affected
   category directories to check the ``SUBDIR`` entries. Next, in the
   ``ports/`` directory, run ``make index``. This can take over 40
   minutes on even modern systems; however, it is a necessary step to
   prevent problems for other people.

#. Once this is done, you can commit the updated ``ports/Makefile`` to
   connect the new category to the build and also commit the
   ``Makefile`` changes for the old category or categories.

#. Add appropriate entries to ``ports/MOVED``.

#. Update the documentation by modifying the following:

   .. raw:: html

      <div class="itemizedlist">

   -  the `list of
      categories <../../../../doc/en_US.ISO8859-1/books/porters-handbook/makefile-categories.html#PORTING-CATEGORIES>`__
      in the Porter's Handbook

   -  ``doc/en_US.ISO8859-1/htdocs/ports``. Note that these are now
      displayed by sub-groups, as specified in
      ``doc/en_US.ISO8859-1/htdocs/ports/categories.descriptions``.

   .. raw:: html

      </div>

   (Note: these are in the docs, not the ports, repository). If you are
   not a docs committer, you will need to submit a PR for this.

#. Only once all the above have been done, and no one is any longer
   reporting problems with the new ports, should the old ports be
   deleted from their previous locations in the repository.

.. raw:: html

   </div>

It is not necessary to manually update the `ports web
pages <../../../../ports/index.html>`__ to reflect the new category.
This is done automatically via the change to
``en_US.ISO8859-1/htdocs/ports/categories`` and the automated rebuild of
``INDEX``.

**19.6.3.**

What do I need to do to implement a new virtual category?

This is much simpler than a physical category. You only need to modify
the following:

.. raw:: html

   <div class="itemizedlist">

-  the `list of
   categories <../../../../doc/en_US.ISO8859-1/books/porters-handbook/makefile-categories.html#PORTING-CATEGORIES>`__
   in the Porter's Handbook

-  ``en_US.ISO8859-1/htdocs/ports/categories``

.. raw:: html

   </div>

19.7. Miscellaneous Questions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

19.7.1. `How do I know if my port is building correctly or
not? <ports.html#ports-qa-misc-correctly-building>`__
19.7.2. `I added a new port. Do I need to add it to the
INDEX? <ports.html#ports-qa-misc-INDEX>`__
19.7.3. `Are there any other files I am not allowed to
touch? <ports.html#ports-qa-misc-no-touch>`__
19.7.4. `What is the proper procedure for updating the checksum for a
port's distfile when the file changes without a version
change? <ports.html#ports-qa-misc-updated-distfile>`__
19.7.5. `What is the procedure to request authorization for merging a
commit to the quarterly
branch? <ports.html#ports-qa-misc-request-mfh>`__
**19.7.1.**

How do I know if my port is building correctly or not?

The packages are built multiple times each week. If a port fails, the
maintainer will receive an email from ``pkg-fallout@FreeBSD.org``.

Reports for all the package builds (official, experimental, and
non-regression) are aggregated at
`pkg-status.FreeBSD.org <https://pkg-status.freebsd.org/>`__.

**19.7.2.**

I added a new port. Do I need to add it to the ``INDEX``?

No. The file can either be generated by running ``make index``, or a
pre-generated version can be downloaded with ``make fetchindex``.

**19.7.3.**

Are there any other files I am not allowed to touch?

Any file directly under ``ports/``, or any file under a subdirectory
that starts with an uppercase letter (``Mk/``, ``Tools/``, etc.). In
particular, the Ports Management Team ``<portmgr@FreeBSD.org>`` is very
protective of ``ports/Mk/bsd.port*.mk`` so do not commit changes to
those files unless you want to face their wra(i)th.

**19.7.4.**

What is the proper procedure for updating the checksum for a port's
distfile when the file changes without a version change?

When the checksum for a port's distfile is updated due to the author
updating the file without changing the port's revision, the commit
message should include a summary of the relevant diffs between the
original and new distfile to ensure that the distfile has not been
corrupted or maliciously altered. If the current version of the port has
been in the ports tree for a while, a copy of the old distfile will
usually be available on the ftp servers; otherwise the author or
maintainer should be contacted to find out why the distfile has changed.

**19.7.5.**

What is the procedure to request authorization for merging a commit to
the quarterly branch?

When doing the commit, add the branch name to the ``MFH:`` line, for
example:

.. code:: programlisting

    MFH:  2014Q1

It will automatically notify Ports Security Team
``<ports-secteam@FreeBSD.org>`` and Ports Management Team
``<portmgr@FreeBSD.org>``. They will then decide if the commit can be
merged and answer with the procedure.

If the commit has already been made, send an email to Ports Security
Team ``<ports-secteam@FreeBSD.org>`` and Ports Management Team
``<portmgr@FreeBSD.org>`` with the revision number and a small
description of why the commit needs to be merged.

A script is provided to automate merging a specific commit:
``ports/Tools/scripts/mfh``. It is used as follows:

.. code:: screen

    % /usr/ports/Tools/scripts/mfh 2015Q1 380362
     U   2015Q1
    Checked out revision 380443.
    A    2015Q1/security
    Updating '2015Q1/security/rubygem-sshkit':
    A    2015Q1/security/rubygem-sshkit
    A    2015Q1/security/rubygem-sshkit/Makefile
    A    2015Q1/security/rubygem-sshkit/distinfo
    A    2015Q1/security/rubygem-sshkit/pkg-descr
    Updated to revision 380443.
    --- Merging r380362 into '2015Q1':
    U    2015Q1/security/rubygem-sshkit/Makefile
    U    2015Q1/security/rubygem-sshkit/distinfo
    --- Recording mergeinfo for merge of r380362 into '2015Q1':
     U   2015Q1
    --- Recording mergeinfo for merge of r380362 into '2015Q1/security':
     G   2015Q1/security
    --- Eliding mergeinfo from '2015Q1/security':
     U   2015Q1/security
    --- Recording mergeinfo for merge of r380362 into '2015Q1/security/rubygem-sshkit':
     G   2015Q1/security/rubygem-sshkit
    --- Eliding mergeinfo from '2015Q1/security/rubygem-sshkit':
     U   2015Q1/security/rubygem-sshkit
     M      2015Q1
    M       2015Q1/security/rubygem-sshkit/Makefile
    M       2015Q1/security/rubygem-sshkit/distinfo
    Index: 2015Q1/security/rubygem-sshkit/Makefile
    ===================================================================
    --- 2015Q1/security/rubygem-sshkit/Makefile     (revision 380443)
    +++ 2015Q1/security/rubygem-sshkit/Makefile     (working copy)
    @@ -2,7 +2,7 @@
     # $FreeBSD$

     PORTNAME=      sshkit
    -PORTVERSION=   1.6.1
    +PORTVERSION=   1.7.0
     CATEGORIES=    security rubygems
     MASTER_SITES=  RG

    Index: 2015Q1/security/rubygem-sshkit/distinfo
    ===================================================================
    --- 2015Q1/security/rubygem-sshkit/distinfo     (revision 380443)
    +++ 2015Q1/security/rubygem-sshkit/distinfo     (working copy)
    @@ -1,2 +1,2 @@
    -SHA256 (rubygem/sshkit-1.6.1.gem) = 8ca67e46bb4ea50fdb0553cda77552f3e41b17a5aa919877d93875dfa22c03a7
    -SIZE (rubygem/sshkit-1.6.1.gem) = 135680
    +SHA256 (rubygem/sshkit-1.7.0.gem) = 90effd1813363bae7355f4a45ebc8335a8ca74acc8d0933ba6ee6d40f281a2cf
    +SIZE (rubygem/sshkit-1.7.0.gem) = 136192
    Index: 2015Q1
    ===================================================================
    --- 2015Q1      (revision 380443)
    +++ 2015Q1      (working copy)

    Property changes on: 2015Q1
    ___________________________________________________________________
    Modified: svn:mergeinfo
       Merged /head:r380362
    Do you want to commit? (no = start a shell) [y/n]

At that point, the script will either open a shell for you to fix
things, or open your text editor with the commit message all prepared
and then commit the merge.

The script assumes that you can connect to ``svn.FreeBSD.org`` with SSH
directly, so if your local login name is different than your FreeBSD
cluster account, you need a few lines in your ``~/.ssh/config``:

.. code:: programlisting

    Host svn.freebsd.org # Can be *.freebsd.org
        User freebsd-login

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------+-------------------------------------------------------------+
| `Prev <archs.html>`__?                    | ?                       | ?\ `Next <non-committers.html>`__                           |
+-------------------------------------------+-------------------------+-------------------------------------------------------------+
| 18.?Support for Multiple Architectures?   | `Home <index.html>`__   | ?20.?Issues Specific to Developers Who Are Not Committers   |
+-------------------------------------------+-------------------------+-------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
