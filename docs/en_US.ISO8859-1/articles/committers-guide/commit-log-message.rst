======================
7.?Commit Log Messages
======================

.. raw:: html

   <div class="navheader">

7.?Commit Log Messages
`Prev <conventions.html>`__?
?
?\ `Next <pref-license.html>`__

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

7.?Commit Log Messages
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section contains some suggestions and traditions for how commit
logs are formatted.

As well as including an informative message with each commit you may
need to include some additional information.

This information consists of one or more lines containing the key word
or phrase, a colon, tabs for formatting, and then the additional
information.

The key words or phrases are:

.. raw:: html

   <div class="informaltable">

+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PR:``                      | The problem report (if any) which is affected (typically, by being closed) by this commit. Only include one PR per line as the automated scripts which parse this line cannot understand more than one.                                                                                                                                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Differential Revision:``   | The full URL of the Phabricator review. For example: ``https://reviews.freebsd.org/D1708``.                                                                                                                                                                                                                                                                                      |
+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Submitted by:``            | The name and e-mail address of the person that submitted the fix; for developers, just the username on the FreeBSD cluster.                                                                                                                                                                                                                                                      |
|                              |                                                                                                                                                                                                                                                                                                                                                                                  |
|                              | If the submitter is the maintainer of the port to which you are committing, include "(maintainer)" after the email address.                                                                                                                                                                                                                                                      |
|                              |                                                                                                                                                                                                                                                                                                                                                                                  |
|                              | Avoid obfuscating the email address of the submitter as this adds additional work when searching logs.                                                                                                                                                                                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Reviewed by:``             | The name and e-mail address of the person or people that reviewed the change; for developers, just the username on the FreeBSD cluster. If a patch was submitted to a mailing list for review, and the review was favorable, then just include the list name.                                                                                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Approved by:``             | The name and e-mail address of the person or people that approved the change; for developers, just the username on the FreeBSD cluster. It is customary to get prior approval for a commit if it is to an area of the tree to which you do not usually commit. In addition, during the run up to a new release all commits *must* be approved by the release engineering team.   |
|                              |                                                                                                                                                                                                                                                                                                                                                                                  |
|                              | If these are your first commits then you should have passed them past your mentor first, and you should list your mentor, as in \`\`\ *``username-of-mentor``* ``(mentor)``''.                                                                                                                                                                                                   |
|                              |                                                                                                                                                                                                                                                                                                                                                                                  |
|                              | If a team approved these commits then include the team name followed by the username of the approver in parentheses. For example: \`\`\ *``re@         (username)``*\ \`\`                                                                                                                                                                                                       |
+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Obtained from:``           | The name of the project (if any) from which the code was obtained. Do not use this line for the name of an individual person.                                                                                                                                                                                                                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``MFC after:``               | If you wish to receive an e-mail reminder to MFC at a later date, specify the number of days, weeks, or months after which an MFC is planned.                                                                                                                                                                                                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Relnotes:``                | If the change is a candidate for inclusion in the release notes for the next release from the branch, set to ``yes``.                                                                                                                                                                                                                                                            |
+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Security:``                | If the change is related to a security vulnerability or security exposure, include one or more references or a description of the issue. If possible, include a VuXML URL or a CVE ID.                                                                                                                                                                                           |
+------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?1.?Commit Log for a Commit Based on a PR

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

You want to commit a change based on a PR submitted by John Smith
containing a patch. The end of the commit message should look something
like this.

.. code:: programlisting

    ...

            PR:                    12345
            Submitted by:      John Smith <John.Smith@example.com>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?2.?Commit Log for a Commit Needing Review

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

You want to change the virtual memory system. You have posted patches to
the appropriate mailing list (in this case, ``freebsd-arch``) and the
changes have been approved.

.. code:: programlisting

    ...

            Reviewed by:       -arch

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?3.?Commit Log for a Commit Needing Approval

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

You want to commit a port. You have collaborated with the listed
MAINTAINER, who has told you to go ahead and commit.

.. code:: programlisting

    ...

            Approved by:        abc (maintainer)

Where *``abc``* is the account name of the person who approved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.?Commit Log for a Commit Bringing in Code from OpenBSD

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

You want to commit some code based on work done in the OpenBSD project.

.. code:: programlisting

    ...

            Obtained from:      OpenBSD

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.?Commit Log for a Change to FreeBSD-CURRENT with a Planned
Commit to FreeBSD-STABLE to Follow at a Later Date.

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

You want to commit some code which will be merged from FreeBSD-CURRENT
into the FreeBSD-STABLE branch after two weeks.

.. code:: programlisting

    ...

    MFC after:      2 weeks

Where *``2``* is the number of days, weeks, or months after which an MFC
is planned. The *``weeks``* option may be ``day``, ``days``, ``week``,
``weeks``, ``month``, ``months``.

.. raw:: html

   </div>

.. raw:: html

   </div>

In many cases you may need to combine some of these.

Consider the situation where a user has submitted a PR containing code
from the NetBSD project. You are looking at the PR, but it is not an
area of the tree you normally work in, so you have decided to get the
change reviewed by the ``arch`` mailing list. Since the change is
complex, you opt to MFC after one month to allow adequate testing.

The extra information to include in the commit would look something like

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.?Example Combined Commit Log

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    PR:                 54321
    Submitted by:       John Smith <John.Smith@example.com>
    Reviewed by:        -arch
    Obtained from:      NetBSD
    MFC after:          1 month
    Relnotes:           yes

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+---------------------------------------+
| `Prev <conventions.html>`__?             | ?                       | ?\ `Next <pref-license.html>`__       |
+------------------------------------------+-------------------------+---------------------------------------+
| 6.?Setup, Conventions, and Traditions?   | `Home <index.html>`__   | ?8.?Preferred License for New Files   |
+------------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
