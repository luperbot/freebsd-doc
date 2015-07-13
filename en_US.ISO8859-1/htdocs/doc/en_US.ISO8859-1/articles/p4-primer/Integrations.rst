===============
6.?Integrations
===============

.. raw:: html

   <div class="navheader">

6.?Integrations
`Prev <branches.html>`__?
?
?\ `Next <submit.html>`__

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

6.?Integrations
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

“Integration” is the term used by Perforce to describe the action of
moving changes from one part of the depot to another. It is most
commonly done in conjunction with creating and maintaining branches. An
integration is done when you want to initially populate a branch, and it
is done when you want to move subsequent changes in the branch from the
parent to the child, or from the child to the parent. A common example
of this is periodically integrating changes from the vendor FreeBSD tree
to your child branch tree, allowing you to keep up to date with changes
in the FreeBSD tree. The Perforce server tracks the changes in each tree
and knows when there are changes that can be integrated from one tree to
another.

The common way to do an integration is with the following command:

.. code:: screen

    % p4 integrate -b branchname

*``branchname``* is the name given to a branch spec, as discussed in the
previous section. This command will instruct Perforce to look for
changes in the branch parent that are not yet in the child. From those
changes it will prepare a list of diffs to move. If the integration is
being done for the first time on a branch (for example doing an initial
population operation), then the parent files will simply be copied to
the child location on the local machine.

Once the integration operation is done, you must run ``p4 resolve`` to
accept the changes and resolve possible conflicts. Conflicts can arise
from overlapping changes that happened in both the parent and child copy
of a file. Usually, however, there are no conflicts, and Perforce can
quickly figure out how to merge the changes together. Use the following
commands to do a resolve operation:

.. code:: screen

    % p4 resolve -as
    % p4 resolve

The first invocation will instruct Perforce to automatically merge the
changes together and accept files that have no conflicts. The second
invocation will allow you to inspect each file that has a possible
conflict and resolve it by hand if needed.

Once all of the integrated files have been resolved, they need to be
committed back to the repository. This is done via ``p4 submit``,
explained in the next section.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+-----------------------------+
| `Prev <branches.html>`__?   | ?                       | ?\ `Next <submit.html>`__   |
+-----------------------------+-------------------------+-----------------------------+
| 5.?Branches?                | `Home <index.html>`__   | ?7.?Submit                  |
+-----------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
