===================================
24.4.?Tracking a Development Branch
===================================

.. raw:: html

   <div class="navheader">

24.4.?Tracking a Development Branch
`Prev <updating-upgrading-documentation.html>`__?
Chapter?24.?Updating and Upgrading FreeBSD
?\ `Next <synching.html>`__

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

24.4.?Tracking a Development Branch
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD has two development branches: FreeBSD-CURRENT and
FreeBSD-STABLE.

This section provides an explanation of each branch and its intended
audience, as well as how to keep a system up-to-date with each
respective branch.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.4.1.?Using FreeBSD-CURRENT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD-CURRENT is the “bleeding edge” of FreeBSD development and
FreeBSD-CURRENT users are expected to have a high degree of technical
skill. Less technical users who wish to track a development branch
should track FreeBSD-STABLE instead.

FreeBSD-CURRENT is the very latest source code for FreeBSD and includes
works in progress, experimental changes, and transitional mechanisms
that might or might not be present in the next official release. While
many FreeBSD developers compile the FreeBSD-CURRENT source code daily,
there are short periods of time when the source may not be buildable.
These problems are resolved as quickly as possible, but whether or not
FreeBSD-CURRENT brings disaster or new functionality can be a matter of
when the source code was synced.

FreeBSD-CURRENT is made available for three primary interest groups:

.. raw:: html

   <div class="orderedlist">

#. Members of the FreeBSD community who are actively working on some
   part of the source tree.

#. Members of the FreeBSD community who are active testers. They are
   willing to spend time solving problems, making topical suggestions on
   changes and the general direction of FreeBSD, and submitting patches.

#. Users who wish to keep an eye on things, use the current source for
   reference purposes, or make the occasional comment or code
   contribution.

.. raw:: html

   </div>

FreeBSD-CURRENT should *not* be considered a fast-track to getting new
features before the next release as pre-release features are not yet
fully tested and most likely contain bugs. It is not a quick way of
getting bug fixes as any given commit is just as likely to introduce new
bugs as to fix existing ones. FreeBSD-CURRENT is not in any way
“officially supported”.

To track FreeBSD-CURRENT:

.. raw:: html

   <div class="orderedlist">

#. Join the
   `freebsd-current <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__
   and the
   `svn-src-head <http://lists.FreeBSD.org/mailman/listinfo/svn-src-head>`__
   lists. This is *essential* in order to see the comments that people
   are making about the current state of the system and to receive
   important bulletins about the current state of FreeBSD-CURRENT.

   The
   `svn-src-head <http://lists.FreeBSD.org/mailman/listinfo/svn-src-head>`__
   list records the commit log entry for each change as it is made,
   along with any pertinent information on possible side effects.

   To join these lists, go to http://lists.FreeBSD.org/mailman/listinfo,
   click on the list to subscribe to, and follow the instructions. In
   order to track changes to the whole source tree, not just the changes
   to FreeBSD-CURRENT, subscribe to the
   `svn-src-all <http://lists.FreeBSD.org/mailman/listinfo/svn-src-all>`__
   list.

#. Synchronize with the FreeBSD-CURRENT sources. Typically,
   `svn <svn.html>`__ is used to check out the -CURRENT code from the
   ``head`` branch of one of the Subversion mirror sites listed in
   `Section?A.4.4, “Subversion Mirror Sites” <svn.html#svn-mirrors>`__.

   Users with very slow or limited Internet connectivity can instead use
   CTM as described in `Section?A.3, “Using CTM” <ctm.html>`__, but it
   is not as reliable as svn and svn is the recommended method for
   synchronizing source.

#. Due to the size of the repository, some users choose to only
   synchronize the sections of source that interest them or which they
   are contributing patches to. However, users that plan to compile the
   operating system from source must download *all* of FreeBSD-CURRENT,
   not just selected portions.

   Before compiling FreeBSD-CURRENT , read ``/usr/src/Makefile`` very
   carefully and follow the instructions in `Section?24.6, “Rebuilding
   World” <makeworld.html>`__. Read the `FreeBSD-CURRENT mailing
   list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__
   and ``/usr/src/UPDATING`` to stay up-to-date on other bootstrapping
   procedures that sometimes become necessary on the road to the next
   release.

#. Be active! FreeBSD-CURRENT users are encouraged to submit their
   suggestions for enhancements or bug fixes. Suggestions with
   accompanying code are always welcome.

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

24.4.2.?Using FreeBSD-STABLE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD-STABLE is the development branch from which major releases are
made. Changes go into this branch at a slower pace and with the general
assumption that they have first been tested in FreeBSD-CURRENT. This is
*still* a development branch and, at any given time, the sources for
FreeBSD-STABLE may or may not be suitable for general use. It is simply
another engineering development track, not a resource for end-users.
Users who do not have the resources to perform testing should instead
run the most recent release of FreeBSD.

Those interested in tracking or contributing to the FreeBSD development
process, especially as it relates to the next release of FreeBSD, should
consider following FreeBSD-STABLE.

While the FreeBSD-STABLE branch should compile and run at all times,
this cannot be guaranteed. Since more people run FreeBSD-STABLE than
FreeBSD-CURRENT, it is inevitable that bugs and corner cases will
sometimes be found in FreeBSD-STABLE that were not apparent in
FreeBSD-CURRENT. For this reason, one should not blindly track
FreeBSD-STABLE. It is particularly important *not* to update any
production servers to FreeBSD-STABLE without thoroughly testing the code
in a development or testing environment.

To track FreeBSD-STABLE:

.. raw:: html

   <div class="orderedlist">

#. Join the
   `freebsd-stable <http://lists.FreeBSD.org/mailman/listinfo/freebsd-stable>`__
   list in order to stay informed of build dependencies that may appear
   in FreeBSD-STABLE or any other issues requiring special attention.
   Developers will also make announcements in this mailing list when
   they are contemplating some controversial fix or update, giving the
   users a chance to respond if they have any issues to raise concerning
   the proposed change.

   Join the relevant svn list for the branch being tracked. For example,
   users tracking the 9-STABLE branch should join the
   `svn-src-stable-9 <http://lists.FreeBSD.org/mailman/listinfo/svn-src-stable-9>`__
   list. This list records the commit log entry for each change as it is
   made, along with any pertinent information on possible side effects.

   To join these lists, go to http://lists.FreeBSD.org/mailman/listinfo,
   click on the list to subscribe to, and follow the instructions. In
   order to track changes for the whole source tree, subscribe to
   `svn-src-all <http://lists.FreeBSD.org/mailman/listinfo/svn-src-all>`__.

#. To install a new FreeBSD-STABLE system, install the most recent
   FreeBSD-STABLE release from the `FreeBSD mirror
   sites <mirrors.html>`__ or use a monthly snapshot built from
   FreeBSD-STABLE. Refer to
   `www.freebsd.org/snapshots <../../../../snapshots/>`__ for more
   information about snapshots.

   To compile or upgrade to an existing FreeBSD system to
   FreeBSD-STABLE, use `svn <svn.html>`__ to check out the source for
   the desired branch. Branch names, such as ``stable/9``, are listed at
   `www.freebsd.org/releng <../../../../releng/>`__. CTM (`Section?A.3,
   “Using CTM” <ctm.html>`__) can be used if a reliable Internet
   connection is not available.

#. Before compiling or upgrading to FreeBSD-STABLE , read
   ``/usr/src/Makefile`` carefully and follow the instructions in
   `Section?24.6, “Rebuilding World” <makeworld.html>`__. Read
   `FreeBSD-STABLE mailing
   list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-stable>`__
   and ``/usr/src/UPDATING`` to keep up-to-date on other bootstrapping
   procedures that sometimes become necessary on the road to the next
   release.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+------------------------------------+-------------------------------+
| `Prev <updating-upgrading-documentation.html>`__?   | `Up <updating-upgrading.html>`__   | ?\ `Next <synching.html>`__   |
+-----------------------------------------------------+------------------------------------+-------------------------------+
| 24.3.?Updating the Documentation Set?               | `Home <index.html>`__              | ?24.5.?Synchronizing Source   |
+-----------------------------------------------------+------------------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
