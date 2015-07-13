===================
4.?Commit Bit Types
===================

.. raw:: html

   <div class="navheader">

4.?Commit Bit Types
`Prev <kerberos-ldap.html>`__?
?
?\ `Next <subversion-primer.html>`__

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

4.?Commit Bit Types
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD repository has a number of components which, when combined,
support the basic operating system source, documentation, third party
application ports infrastructure, and various maintained utilities. When
FreeBSD commit bits are allocated, the areas of the tree where the bit
may be used are specified. Generally, the areas associated with a bit
reflect who authorized the allocation of the commit bit. Additional
areas of authority may be added at a later date: when this occurs, the
committer should follow normal commit bit allocation procedures for that
area of the tree, seeking approval from the appropriate entity and
possibly getting a mentor for that area for some period of time.

.. raw:: html

   <div class="informaltable">

+--------------------+-----------------+--------------------------------------------+
| *Committer Type*   | *Responsible*   | *Tree Components*                          |
+--------------------+-----------------+--------------------------------------------+
| src                | core@           | src/, doc/ subject to appropriate review   |
+--------------------+-----------------+--------------------------------------------+
| doc                | doceng@         | doc/, ports/, src/ documentation           |
+--------------------+-----------------+--------------------------------------------+
| ports              | portmgr@        | ports/                                     |
+--------------------+-----------------+--------------------------------------------+

.. raw:: html

   </div>

Commit bits allocated prior to the development of the notion of areas of
authority may be appropriate for use in many parts of the tree. However,
common sense dictates that a committer who has not previously worked in
an area of the tree seek review prior to committing, seek approval from
the appropriate responsible party, and/or work with a mentor. Since the
rules regarding code maintenance differ by area of the tree, this is as
much for the benefit of the committer working in an area of less
familiarity as it is for others working on the tree.

Committers are encouraged to seek review for their work as part of the
normal development process, regardless of the area of the tree where the
work is occurring.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Policy for Committer Activity in Other Trees
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  All committers may modify ``base/head/share/misc/committers-*.dot``,
   ``base/head/usr.bin/calendar/calendars/calendar.freebsd``, and
   ``ports/head/astro/xearth/files``.

-  doc committers may commit documentation changes to ``src`` files,
   such as man pages, READMEs, fortune databases, calendar files, and
   comment fixes without approval from a src committer, subject to the
   normal care and tending of commits.

-  Any committer may make changes to any other tree with an "Approved
   by" from a non-mentored committer with the appropriate bit.

-  Committers can aquire an additional bit by the usual process of
   finding a mentor who will propose them to core, doceng, or portmgr,
   as appropriate. When approved, they will be added to 'access' and the
   normal mentoring period will ensue, which will involve a continuing
   of “Approved by” for some period.

-  "Approved by" is only acceptable from non-mentored src committers --
   mentored committers can provide a "Reviewed by" but not an "Approved
   by".

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------------+-------------------------+----------------------------------------+
| `Prev <kerberos-ldap.html>`__?                           | ?                       | ?\ `Next <subversion-primer.html>`__   |
+----------------------------------------------------------+-------------------------+----------------------------------------+
| 3.?Kerberos and LDAP web Password for FreeBSD Cluster?   | `Home <index.html>`__   | ?5.?Subversion Primer                  |
+----------------------------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
