=======================
3.?Problem Report State
=======================

.. raw:: html

   <div class="navheader">

3.?Problem Report State
`Prev <pr-lifecycle.html>`__?
?
?\ `Next <pr-types.html>`__

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

3.?Problem Report State
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is important to update the state of a PR when certain actions are
taken. The state should accurately reflect the current state of work on
the PR.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?1.?A small example on when to change PR state

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

When a PR has been worked on and the developer(s) responsible feel
comfortable about the fix, they will submit a followup to the PR and
change its state to “feedback”. At this point, the originator should
evaluate the fix in their context and respond indicating whether the
defect has indeed been remedied.

.. raw:: html

   </div>

.. raw:: html

   </div>

A Problem Report may be in one of the following states:

.. raw:: html

   <div class="glosslist">

open
    Initial state; the problem has been pointed out and it needs
    reviewing.

analyzed
    The problem has been reviewed and a solution is being sought.

feedback
    Further work requires additional information from the originator or
    the community; possibly information regarding the proposed solution.

patched
    A patch has been committed, but something (MFC, or maybe
    confirmation from originator) is still pending.

suspended
    The problem is not being worked on, due to lack of information or
    resources. This is a prime candidate for somebody who is looking for
    a project to take on. If the problem cannot be solved at all, it
    will be closed, rather than suspended. The documentation project
    uses “suspended” for “wish-list” items that entail a significant
    amount of work which no one currently has time for.

closed
    A problem report is closed when any changes have been integrated,
    documented, and tested, or when fixing the problem is abandoned.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The “patched” state is directly related to feedback, so you may go
directly to “closed” state if the originator cannot test the patch, and
it works in your own testing.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+--------------------------------+
| `Prev <pr-lifecycle.html>`__?   | ?                       | ?\ `Next <pr-types.html>`__    |
+---------------------------------+-------------------------+--------------------------------+
| 2.?Problem Report Life-cycle?   | `Home <index.html>`__   | ?4.?Types of Problem Reports   |
+---------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
