============================
2.?Problem Report Life-cycle
============================

.. raw:: html

   <div class="navheader">

2.?Problem Report Life-cycle
`Prev <index.html>`__?
?
?\ `Next <pr-states.html>`__

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

2.?Problem Report Life-cycle
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  The Reporter submits a bug report on the website. The bug is in the
   ``Needs Triage`` state.

-  Jane Random BugBuster confirms that the bug report has sufficient
   information to be reproducible. If not, she goes back and forth with
   the reporter to obtain the needed information. At this point the bug
   is set to the ``Open`` state.

-  Joe Random Committer takes interest in the PR and assigns it to
   himself, or Jane Random BugBuster decides that Joe is best suited to
   handle it and assigns it to him. The bug should be set to the
   ``In       Discussion`` state.

-  Joe has a brief exchange with the originator (making sure it all goes
   into the audit trail) and determines the cause of the problem.

-  Joe pulls an all-nighter and whips up a patch that he thinks fixes
   the problem, and submits it in a follow-up, asking the originator to
   test it. He then sets the PRs state to ``Patch Ready``.

-  A couple of iterations later, both Joe and the originator are
   satisfied with the patch, and Joe commits it to ``-CURRENT`` (or
   directly to ``-STABLE`` if the problem does not exist in
   ``-CURRENT``), making sure to reference the Problem Report in his
   commit log (and credit the originator if they submitted all or part
   of the patch) and, if appropriate, start an MFC countdown. The bug is
   set to the ``Needs MFC`` state.

-  If the patch does not need MFCing, Joe then closes the PR as
   ``Issue Resolved``.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Many PRs are submitted with very little information about the problem,
and some are either very complex to solve, or just scratch the surface
of a larger problem; in these cases, it is very important to obtain all
the necessary information needed to solve the problem. If the problem
contained within cannot be solved, or has occurred again, it is
necessary to re-open the PR.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+--------------------------------+
| `Prev <index.html>`__?                | ?                       | ?\ `Next <pr-states.html>`__   |
+---------------------------------------+-------------------------+--------------------------------+
| Problem Report Handling Guidelines?   | `Home <index.html>`__   | ?3.?Problem Report State       |
+---------------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
