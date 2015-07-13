=======================
10.?Developer Relations
=======================

.. raw:: html

   <div class="navheader">

10.?Developer Relations
`Prev <tracking.license.grants.html>`__?
?
?\ `Next <if-in-doubt.html>`__

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

10.?Developer Relations
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you are working directly on your own code or on code which is already
well established as your responsibility, then there is probably little
need to check with other committers before jumping in with a commit. If
you see a bug in an area of the system which is clearly orphaned (and
there are a few such areas, to our shame), the same applies. If,
however, you are about to modify something which is clearly being
actively maintained by someone else (and it is only by watching the
``repository``-committers mailing list that you can really get a feel
for just what is and is not) then consider sending the change to them
instead, just as you would have before becoming a committer. For ports,
you should contact the listed ``MAINTAINER`` in the ``Makefile``. For
other parts of the repository, if you are unsure who the active
maintainer might be, it may help to scan the revision history to see who
has committed changes in the past. An example script that lists each
person who has committed to a given file along with the number of
commits each person has made can be found at on ``freefall`` at
``~eadler/bin/whodid``. If your queries go unanswered or the committer
otherwise indicates a lack of interest in the area affected, go ahead
and commit it.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Avoid sending private emails to maintainers. Other people might be
interested in the conversation, not just the final output.

.. raw:: html

   </div>

If you are unsure about a commit for any reason at all, have it reviewed
by ``-hackers`` before committing. Better to have it flamed then and
there rather than when it is part of the repository. If you do happen to
commit something which results in controversy erupting, you may also
wish to consider backing the change out again until the matter is
settled. Remember – with a version control system we can always change
it back.

Do not impugn the intentions of someone you disagree with. If they see a
different solution to a problem than you, or even a different problem,
it is not because they are stupid, because they have questionable
parentage, or because they are trying to destroy your hard work,
personal image, or FreeBSD, but simply because they have a different
outlook on the world. Different is good.

Disagree honestly. Argue your position from its merits, be honest about
any shortcomings it may have, and be open to seeing their solution, or
even their vision of the problem, with an open mind.

Accept correction. We are all fallible. When you have made a mistake,
apologize and get on with life. Do not beat up yourself, and certainly
do not beat up others for your mistake. Do not waste time on
embarrassment or recrimination, just fix the problem and move on.

Ask for help. Seek out (and give) peer reviews. One of the ways open
source software is supposed to excel is in the number of eyeballs
applied to it; this does not apply if nobody will review code.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------------------+-------------------------+----------------------------------+
| `Prev <tracking.license.grants.html>`__?                       | ?                       | ?\ `Next <if-in-doubt.html>`__   |
+----------------------------------------------------------------+-------------------------+----------------------------------+
| 9.?Keeping Track of Licenses Granted to the FreeBSD Project?   | `Home <index.html>`__   | ?11.?If in Doubt...              |
+----------------------------------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
