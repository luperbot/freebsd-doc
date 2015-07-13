=========================
5.3.?Contributed Software
=========================

.. raw:: html

   <div class="navheader">

5.3.?Contributed Software
`Prev <policies-maintainer.html>`__?
Chapter?5.?Source Tree Guidelines and Policies
?\ `Next <policies-encumbered.html>`__

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

5.3.?Contributed Software
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Poul-Henning Kamp, David O'Brien and Gavin Atkinson.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some parts of the FreeBSD distribution consist of software that is
actively being maintained outside the FreeBSD project. For historical
reasons, we call this *contributed* software. Some examples are
sendmail, gcc and patch.

Over the last couple of years, various methods have been used in dealing
with this type of software and all have some number of advantages and
drawbacks. No clear winner has emerged.

Since this is the case, after some debate one of these methods has been
selected as the “official” method and will be required for future
imports of software of this kind. Furthermore, it is strongly suggested
that existing contributed software converge on this model over time, as
it has significant advantages over the old method, including the ability
to easily obtain diffs relative to the “official” versions of the source
by everyone (even without direct repository access). This will make it
significantly easier to return changes to the primary developers of the
contributed software.

Ultimately, however, it comes down to the people actually doing the
work. If using this model is particularly unsuited to the package being
dealt with, exceptions to these rules may be granted only with the
approval of the core team and with the general consensus of the other
developers. The ability to maintain the package in the future will be a
key issue in the decisions.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Because it makes it harder to import future versions minor, trivial
and/or cosmetic changes are *strongly discouraged* on files that are
still tracking the vendor branch.

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

5.3.1.?Vendor Imports with SVN
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Dag-Erling Sm?rgrav.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes the vendor import procedure with Subversion in
details.

.. raw:: html

   <div class="procedure">

#. **Preparing the Tree**

   If this is your first import after the switch to SVN, you will have
   to flatten and clean up the vendor tree, and bootstrap merge history
   in the main tree. If not, you can safely omit this step.

   During the conversion from CVS to SVN, vendor branches were imported
   with the same layout as the main tree. For example, the foo vendor
   sources ended up in ``vendor/foo``/dist/contrib/*``foo``*, but it is
   pointless and rather inconvenient. What we really want is to have the
   vendor source directly in ``vendor/foo``/dist, like this:

   .. code:: screen

       % cd vendor/foo/dist/contrib/foo
       % svn move $(svn list) ../..
       % cd ../..
       % svn remove contrib
       % svn propdel -R svn:mergeinfo
       % svn commit

   Note that, the ``propdel`` bit is necessary because starting with
   1.5, Subversion will automatically add ``svn:mergeinfo`` to any
   directory you copy or move. In this case, you will not need this
   information, since you are not going to merge anything from the tree
   you deleted.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   You may want to flatten the tags as well. The procedure is exactly
   the same. If you do this, put off the commit until the end.

   .. raw:: html

      </div>

   Check the ``dist`` tree and perform any cleanup that is deemed to be
   necessary. You may want to disable keyword expansion, as it makes no
   sense on unmodified vendor code. In some cases, it can be even be
   harmful.

   .. code:: screen

       % svn propdel svn:keywords -R .
       % svn commit

   Bootstrapping of ``svn:mergeinfo`` on the target directory (in the
   main tree) to the revision that corresponds to the last change was
   made to the vendor tree prior to importing new sources is also
   needed:

   .. code:: screen

       % cd head/contrib/foo
       % svn merge --record-only svn_base/vendor/foo/dist@12345678 .
       % svn commit

   where *``svn_base``* is the base directory of your SVN repository,
   e.g. ``svn+ssh://svn.FreeBSD.org/base``.

#. **Importing New Sources**

   Prepare a full, clean tree of the vendor sources. With SVN, we can
   keep a full distribution in the vendor tree without bloating the main
   tree. Import everything but merge only what is needed.

   Note that you will need to add any files that were added since the
   last vendor import, and remove any that were removed. To facilitate
   this, you should prepare sorted lists of the contents of the vendor
   tree and of the sources you are about to import:

   .. code:: screen

       % cd vendor/foo/dist
       % svn list -R | grep -v '/$' | sort > ../old
       % cd ../foo-9.9
       % find . -type f | cut -c 3- | sort > ../new

   With these two files, the following command will list list removed
   files (files only in ``old``):

   .. code:: screen

       % comm -23 ../old ../new

   While the command below will list added files (files only in
   ``new``):

   .. code:: screen

       % comm -13 ../old ../new

   Let's put this together:

   .. code:: screen

       % cd vendor/foo/foo-9.9
       % tar cf - . | tar xf - -C ../dist
       % cd ../dist
       % comm -23 ../old ../new | xargs svn remove
       % comm -13 ../old ../new | xargs svn add

   .. raw:: html

      <div class="warning" xmlns="">

   Warning:
   ~~~~~~~~

   If there are new directories in the new distribution, the last
   command will fail. You will have to add the directories, and run it
   again. Conversely, if any directories were removed, you will have to
   remove them manually.

   .. raw:: html

      </div>

   Check properties on any new files:

   .. raw:: html

      <div class="itemizedlist">

   -  All text files should have ``svn:eol-style`` set to ``native``.

   -  All binary files should have ``svn:mime-type`` set to
      ``application/octet-stream``, unless there is a more appropriate
      media type.

   -  Executable files should have ``svn:executable`` set to ``*``.

   -  There should be no other properties on any file in the tree.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   You are ready to commit, but you should first check the output of
   ``svn stat`` and ``svn diff`` to make sure everything is in order.

   .. raw:: html

      </div>

   Once you have committed the new vendor release, you should tag it for
   future reference. The best and quickest way is to do it directly in
   the repository:

   .. code:: screen

       % svn copy svn_base/vendor/foo/dist svn_base/vendor/foo/9.9

   To get the new tag, you can update your working copy of
   ``vendor/foo``.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   If you choose to do the copy in the checkout instead, do not forget
   to remove the generated ``svn:mergeinfo`` as described above.

   .. raw:: html

      </div>

#. **Merging to *-HEAD***

   After you have prepared your import, it is time to merge. Option
   ``--accept=postpone`` tells SVN not to handle merge conflicts yet,
   because they will be taken care of manually:

   .. code:: screen

       % cd head/contrib/foo
       % svn update
       % svn merge --accept=postpone svn_base/vendor/foo/dist

   Resolve any conflicts, and make sure that any files that were added
   or removed in the vendor tree have been properly added or removed in
   the main tree. It is always a good idea to check differences against
   the vendor branch:

   .. code:: screen

       % svn diff --no-diff-deleted --old=svn_base/vendor/foo/dist --new=.

   The ``--no-diff-deleted`` option tells SVN not to check files that
   are in the vendor tree but not in the main tree.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   With SVN, there is no concept of on or off the vendor branch. If a
   file that previously had local modifications no longer does, just
   remove any left-over cruft, such as FreeBSD version tags, so it no
   longer shows up in diffs against the vendor tree.

   .. raw:: html

      </div>

   If any changes are required for the world to build with the new
   sources, make them now — and test until you are satisfied that
   everything build and runs correctly.

#. **Commit**

   Now, you are ready to commit. Make sure you get everything in one go.
   Ideally, you would have done all steps in a clean tree, in which case
   you can just commit from the top of that tree. That is the best way
   to avoid surprises. If you do it properly, the tree will move
   atomically from a consistent state with the old code to a consistent
   state with the new code.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+--------------------------+------------------------------------------+
| `Prev <policies-maintainer.html>`__?   | `Up <policies.html>`__   | ?\ `Next <policies-encumbered.html>`__   |
+----------------------------------------+--------------------------+------------------------------------------+
| 5.2.?\ ``MAINTAINER`` on Makefiles?    | `Home <index.html>`__    | ?5.4.?Encumbered Files                   |
+----------------------------------------+--------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
