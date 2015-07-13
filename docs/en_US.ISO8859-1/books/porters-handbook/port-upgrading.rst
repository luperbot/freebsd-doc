============================
Chapter?10.?Upgrading a Port
============================

.. raw:: html

   <div class="navheader">

Chapter?10.?Upgrading a Port
`Prev <testing-tinderbox.html>`__?
?
?\ `Next <moved-and-updating-files.html>`__

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

`10.1. Using Subversion to Make
Patches <port-upgrading.html#svn-diff>`__
`10.2. ``UPDATING`` and ``MOVED`` <moved-and-updating-files.html>`__

.. raw:: html

   </div>

When a port is not the most recent version available from the authors,
update the local working copy of ``/usr/ports``. The port might have
already been updated to the new version.

When working with more than a few ports, it will probably be easier to
use Subversion to keep the whole ports collection up-to-date, as
described in the
`Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__.
This will have the added benefit of tracking all the port's
dependencies.

The next step is to see if there is an update already pending. To do
this, there are two options. There is a searchable interface to the
`FreeBSD Problem Report (PR) or bug
database <https://bugs.freebsd.org/search/>`__. Select ``Ports Tree`` in
the ``Product`` dropdown, and enter the name of the port in the
``Summary`` field.

However, sometimes people forget to put the name of the port into the
Summary field in an unambiguous fashion. In that case, try searching in
the ``Comment`` field in the ``Detailled Bug Information`` section, or
try the `FreeBSD Ports Monitoring System <portsmon.html>`__ (also known
as ``portsmon``). This system attempts to classify port PRs by portname.
To search for PRs about a particular port, use the `Overview of One
Port <http://portsmon.FreeBSD.org/portoverview.py>`__.

If there is no pending PR, the next step is to send an email to the
port's maintainer, as shown by ``make maintainer``. That person may
already be working on an upgrade, or have a reason to not upgrade the
port right now (because of, for example, stability problems of the new
version), and there is no need to duplicate their work. Note that
unmaintained ports are listed with a maintainer of
``ports@FreeBSD.org``, which is just the general ports mailing list, so
sending mail there probably will not help in this case.

If the maintainer asks you to do the upgrade or there is no maintainer,
then help out FreeBSD by preparing the update! Please do this by using
the
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
command in the base system.

To create a suitable ``diff`` for a single patch, copy the file that
needs patching to ``something``.orig, save the changes to ``something``
and then create the patch:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % diff -u something.orig something > something.diff

.. raw:: html

   </div>

Otherwise, either use the ``svn diff`` method (`Section?10.1, “Using
Subversion to Make Patches” <port-upgrading.html#svn-diff>`__) or copy
the contents of the port to an entire different directory and use the
result of the recursive
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
output of the new and old ports directories (for example, if the
modified port directory is called ``superedit`` and the original is in
our tree as ``superedit.bak``, then save the result of
``diff -ruN superedit.bak superedit``). Either unified or context diff
is fine, but port committers generally prefer unified diffs. Note the
use of the ``-N`` option—this is the accepted way to force diff to
properly deal with the case of new files being added or old files being
deleted. Before sending us the diff, please examine the output to make
sure all the changes make sense. (In particular, make sure to first
clean out the work directories with ``make clean``).

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If some files have been added, copied, moved, or removed, add this
information to the problem report so that the committer picking up the
patch will know what
`svn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=svn&sektion=1>`__
commands to run.

.. raw:: html

   </div>

To simplify common operations with patch files, use ``make makepatch``
as described in `Section?4.4, “Patching” <slow-patch.html>`__. Other
tools exists, like ``/usr/ports/Tools/scripts/patchtool.py``. Before
using it, please read ``/usr/ports/Tools/scripts/README.patchtool``.

If the port is unmaintained, and you are actively using it, please
consider volunteering to become its maintainer. FreeBSD has over 4000
ports without maintainers, and this is an area where more volunteers are
always needed. (For a detailed description of the responsibilities of
maintainers, refer to the section in the `Developer's
Handbook <../../../../doc/en_US.ISO8859-1/books/developers-handbook/policies.html#POLICIES-MAINTAINER>`__.)

To submit the diff, use the `bug submit
form <https://bugs.freebsd.org/submit/>`__ (category ``Ports Tree``). If
the submitter is also maintaining the port, be sure to put
``[maintainer       update]`` at the beginning of the ``Summary`` line.
Please mention any added or deleted files in the message, as they have
to be explicitly specified to
`svn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=svn&sektion=1>`__ when
doing a commit. Do not compress or encode the diff.

Before submitting the bug, review the `Writing the problem
report <../../../../doc/en_US.ISO8859-1/articles/problem-reports/pr-writing.html>`__
section in the Problem Reports article. It contains far more information
about how to write useful problem reports.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

If the upgrade is motivated by security concerns or a serious fault in
the currently committed port, please notify the Ports Management Team
``<portmgr@FreeBSD.org>`` to request immediate rebuilding and
redistribution of the port's package. Unsuspecting users of ``pkg`` will
otherwise continue to install the old version via ``pkg install`` for
several weeks.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Once again, please use
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
and not
`shar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=shar&sektion=1>`__ to
send updates to existing ports! This helps ports committers understand
exactly what is being changed.

.. raw:: html

   </div>

Now that all of that is done, read about how to keep up-to-date in
`Chapter?14, *Keeping Up* <keeping-up.html>`__.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.1.?Using Subversion to Make Patches
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When possible, please submit a
`svn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=svn&sektion=1>`__
diff. They are easier to handle than diffs between “new and old”
directories. It is easier to see what has changed, and to update the
diff if something was modified in the Ports Collection since the work on
it began, or if the committer asks for something to be fixed. Also, a
patch generated with ``svn diff`` can be easily applied with
``svn patch`` and will save some time to the committer.

.. code:: screen

    % cd ~/my_wrkdir 
    % svn co https://svn0.us-west.FreeBSD.org/ports/head/dns/pdnsd 
    % cd ~/my_wrkdir/pdnsd

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#my-wrkdir>`__                 | This can be anywhere, of course.     |
|                                      | Building ports is not limited to     |
|                                      | within ``/usr/ports/``.              |
+--------------------------------------+--------------------------------------+
| `|2| <#svn-FreeBSD-org>`__           | `svn0.us-west.FreeBSD.org <https://s |
|                                      | vn0.us-west.FreeBSD.org/>`__         |
|                                      | is a public Subversion server.       |
|                                      | Select the closest mirror and verify |
|                                      | the mirror server certificate from   |
|                                      | the list of `Subversion mirror       |
|                                      | sites <../../../../doc/en_US.ISO8859 |
|                                      | -1/books/handbook/svn.html#svn-mirro |
|                                      | rs>`__.                              |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

While in the port directory, make any changes that are needed. If
adding, copying, moving, or removing a file, use ``svn`` to track these
changes:

.. code:: screen

    % svn add new_file
    % svn copy some_file file_copy
    % svn move old_name new_name
    % svn remove deleted_file

Make sure to check the port using the checklist in `Section?3.4,
“Testing the Port” <porting-testing.html>`__ and `Section?3.5, “Checking
the Port with ``portlint``\ ” <porting-portlint.html>`__.

.. code:: screen

    % svn status
    % svn update 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#svn-update>`__                | This will attempt to merge the       |
|                                      | differences between the patch and    |
|                                      | current repository version. Watch    |
|                                      | the output carefully. The letter in  |
|                                      | front of each file name indicates    |
|                                      | what was done with it. See           |
|                                      | `Table?10.1, “Subversion Update File |
|                                      | Prefixes” <port-upgrading.html#table |
|                                      | -svn-up>`__                          |
|                                      | for a complete list.                 |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?10.1.?Subversion Update File Prefixes

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----+------------------------------------------------------------------------------------------+
| U   | The file was updated without problems.                                                   |
+-----+------------------------------------------------------------------------------------------+
| G   | The file was updated without problems (only when working against a remote repository).   |
+-----+------------------------------------------------------------------------------------------+
| M   | The file had been modified, and was merged without conflicts.                            |
+-----+------------------------------------------------------------------------------------------+
| C   | The file had been modified, and was merged with conflicts.                               |
+-----+------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

If ``C`` is displayed as a result of ``svn update``, it means something
changed in the Subversion repository and
`svn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=svn&sektion=1>`__ was
not able to merge the local changes with those from the repository. It
is always a good idea to inspect the changes anyway, since
`svn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=svn&sektion=1>`__ does
not know anything about the structure of a port, so it might (and
probably will) merge things that do not make sense.

The last step is to make a unified
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__ of
the changes:

.. code:: screen

    % svn diff > ../`make -VPKGNAME`.diff

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If files have been added, copied, moved, or removed, include the
`svn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=svn&sektion=1>`__
``add``, ``copy``, ``move``, and ``remove`` commands that were used.
``svn move`` or ``svn copy`` must be run before the patch can be
applied. ``svn       add`` or ``svn remove`` must be run after the patch
is applied.

.. raw:: html

   </div>

Send the patch following the guidelines in `Chapter?10, *Upgrading a
Port* <port-upgrading.html>`__.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

The patch can be automatically generated and the PR pre-filled with the
contact information by using ``port submit``. See `Section?9.3, “Port
Tools” <testing-porttools.html>`__ for more details.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-----------------------------------------------+
| `Prev <testing-tinderbox.html>`__?   | ?                       | ?\ `Next <moved-and-updating-files.html>`__   |
+--------------------------------------+-------------------------+-----------------------------------------------+
| 9.6.?Tinderbox?                      | `Home <index.html>`__   | ?10.2.?\ ``UPDATING`` and ``MOVED``           |
+--------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
