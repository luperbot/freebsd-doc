==================================
Problem Report Handling Guidelines
==================================

.. raw:: html

   <div class="article" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Dag-Erling Sm?rgrav
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Hiten Pandya
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

These guidelines describe recommended handling practices for FreeBSD
Problem Reports (PRs). Whilst developed for the FreeBSD PR Database
Maintenance Team ``<freebsd-bugbusters@FreeBSD.org>``, these guidelines
should be followed by anyone working with FreeBSD PRs.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Introduction <#intro>`__
`2. Problem Report Life-cycle <#pr-lifecycle>`__
`3. Problem Report State <#pr-states>`__
`4. Types of Problem Reports <#pr-types>`__
`5. Further Reading <#references>`__

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

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bugzilla is an issue management system used by the FreeBSD Project. As
accurate tracking of outstanding software defects is important to
FreeBSD's quality, the correct use of the software is essential to the
forward progress of the Project.

Access to Bugzilla is available to the entire FreeBSD community. In
order to maintain consistency within the database and provide a
consistent user experience, guidelines have been established covering
common aspects of bug management such as presenting followup, handling
close requests, and so forth.

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

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.?Types of Problem Reports
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While handling problem reports, either as a developer who has direct
access to the Problem Reports database or as a contributor who browses
the database and submits followups with patches, comments, suggestions
or change requests, you will come across several different types of PRs.

.. raw:: html

   <div class="itemizedlist">

-  `PRs not yet assigned to anyone. <#pr-unassigned>`__

-  `PRs already assigned to someone. <#pr-assigned>`__

-  `Duplicates of existing PRs. <#pr-dups>`__

-  `Stale PRs <#pr-stale>`__

-  `Non-Bug PRs <#pr-misfiled-notpr>`__

.. raw:: html

   </div>

The following sections describe what each different type of PRs is used
for, when a PR belongs to one of these types, and what treatment each
different type receives.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Unassigned PRs
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When PRs arrive, they are initially assigned to a generic (placeholder)
assignee. These are always prepended with ``freebsd-``. The exact value
for this default depends on the category; in most cases, it corresponds
to a specific FreeBSD mailing list. Here is the current list, with the
most common ones listed first:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?1.?Default Assignees — most common

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------------------------+---------------------------------------------------+------------------------+
| Type                                     | Categories                                        | Default Assignee       |
+==========================================+===================================================+========================+
| base system                              | bin, conf, gnu, kern, misc                        | freebsd-bugs           |
+------------------------------------------+---------------------------------------------------+------------------------+
| architecture-specific                    | alpha, amd64, arm, i386, ia64, powerpc, sparc64   | freebsd-\ *``arch``*   |
+------------------------------------------+---------------------------------------------------+------------------------+
| ports collection                         | ports                                             | freebsd-ports-bugs     |
+------------------------------------------+---------------------------------------------------+------------------------+
| documentation shipped with the system    | docs                                              | freebsd-doc            |
+------------------------------------------+---------------------------------------------------+------------------------+
| FreeBSD web pages (not including docs)   | Website                                           | freebsd-www            |
+------------------------------------------+---------------------------------------------------+------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?2.?Default Assignees — other

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------------------------------------------------------------------+--------------+---------------------+
| Type                                                                            | Categories   | Default Assignee    |
+=================================================================================+==============+=====================+
| advocacy efforts                                                                | advocacy     | freebsd-advocacy    |
+---------------------------------------------------------------------------------+--------------+---------------------+
| Java Virtual Machine™ problems                                                  | java         | freebsd-java        |
+---------------------------------------------------------------------------------+--------------+---------------------+
| standards compliance                                                            | standards    | freebsd-standards   |
+---------------------------------------------------------------------------------+--------------+---------------------+
| threading libraries                                                             | threads      | freebsd-threads     |
+---------------------------------------------------------------------------------+--------------+---------------------+
| `usb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=usb&sektion=4>`__ subsystem   | usb          | freebsd-usb         |
+---------------------------------------------------------------------------------+--------------+---------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Do not be surprised to find that the submitter of the PR has assigned it
to the wrong category. If you fix the category, do not forget to fix the
assignment as well. (In particular, our submitters seem to have a hard
time understanding that just because their problem manifested on an i386
system, that it might be generic to all of FreeBSD, and thus be more
appropriate for ``kern``. The converse is also true, of course.)

Certain PRs may be reassigned away from these generic assignees by
anyone. There are several types of assignees: specialized mailing lists;
mail aliases (used for certain limited-interest items); and individuals.

For assignees which are mailing lists, please use the long form when
making the assignment (e.g., ``freebsd-foo`` instead of ``foo``); this
will avoid duplicate emails sent to the mailing list.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Since the list of individuals who have volunteered to be the default
assignee for certain types of PRs changes so often, it is much more
suitable for `the FreeBSD
wiki <http://wiki.freebsd.org/AssigningPRs>`__.

.. raw:: html

   </div>

Here is a sample list of such entities; it is probably not complete.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?3.?Common Assignees — base system

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| Type                                                                                                                                                                                  | Suggested Category   | Suggested Assignee       | Assignee Type   |
+=======================================================================================================================================================================================+======================+==========================+=================+
| problem specific to the ARM? architecture                                                                                                                                             | arm                  | freebsd-arm              | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem specific to the MIPS? architecture                                                                                                                                            | kern                 | freebsd-mips             | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem specific to the PowerPC? architecture                                                                                                                                         | kern                 | freebsd-ppc              | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with Advanced Configuration and Power Management (`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__)                                                      | kern                 | freebsd-acpi             | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with Asynchronous Transfer Mode (ATM) drivers                                                                                                                                 | kern                 | freebsd-atm              | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with embedded or small-footprint FreeBSD systems (e.g., NanoBSD/PicoBSD/FreeBSD-arm)                                                                                          | kern                 | freebsd-embedded         | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with FireWire? drivers                                                                                                                                                        | kern                 | freebsd-firewire         | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with the filesystem code                                                                                                                                                      | kern                 | freebsd-fs               | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with the `geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4>`__ subsystem                                                                                      | kern                 | freebsd-geom             | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with the `ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4>`__ subsystem                                                                                      | kern                 | freebsd-ipfw             | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with Integrated Services Digital Network (ISDN) drivers                                                                                                                       | kern                 | freebsd-isdn             | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__ subsystem                                                                                                       | kern                 | freebsd-jail             | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with Linux? or SVR4 emulation                                                                                                                                                 | kern                 | freebsd-emulation        | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with the networking stack                                                                                                                                                     | kern                 | freebsd-net              | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with the `pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4>`__ subsystem                                                                                          | kern                 | freebsd-pf               | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with the `scsi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=scsi&sektion=4>`__ subsystem                                                                                      | kern                 | freebsd-scsi             | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with the `sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4>`__ subsystem                                                                                    | kern                 | freebsd-multimedia       | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problems with the `wlan(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wlan&sektion=4>`__ subsystem and wireless drivers                                                                | kern                 | freebsd-wireless         | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__ or `bsdinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdinstall&sektion=8>`__   | bin                  | freebsd-sysinstall       | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with the system startup scripts (`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__)                                                                           | kern                 | freebsd-rc               | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with VIMAGE or VNET functionality and related code                                                                                                                            | kern                 | freebsd-virtualization   | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+
| problem with Xen emulation                                                                                                                                                            | kern                 | freebsd-xen              | mailing list    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+--------------------------+-----------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?4.?Common Assignees — Ports Collection

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| Type                                                                | Suggested Category   | Suggested Assignee   | Assignee Type   |
+=====================================================================+======================+======================+=================+
| problem with the ports framework (*not* with an individual port!)   | ports                | portmgr              | alias           |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by apache@FreeBSD.org                      | ports                | apache               | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by autotools@FreeBSD.org                   | ports                | autotools            | alias           |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by doceng@FreeBSD.org                      | ports                | doceng               | alias           |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by eclipse@FreeBSD.org                     | ports                | freebsd-eclipse      | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by gecko@FreeBSD.org                       | ports                | gecko                | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by gnome@FreeBSD.org                       | ports                | gnome                | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by hamradio@FreeBSD.org                    | ports                | hamradio             | alias           |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by haskell@FreeBSD.org                     | ports                | haskell              | alias           |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by java@FreeBSD.org                        | ports                | freebsd-java         | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by kde@FreeBSD.org                         | ports                | kde                  | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by mono@FreeBSD.org                        | ports                | mono                 | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by office@FreeBSD.org                      | ports                | freebsd-office       | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by perl@FreeBSD.org                        | ports                | perl                 | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by python@FreeBSD.org                      | ports                | freebsd-python       | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by ruby@FreeBSD.org                        | ports                | freebsd-ruby         | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by secteam@FreeBSD.org                     | ports                | secteam              | alias           |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by vbox@FreeBSD.org                        | ports                | vbox                 | alias           |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+
| port which is maintained by x11@FreeBSD.org                         | ports                | freebsd-x11          | mailing list    |
+---------------------------------------------------------------------+----------------------+----------------------+-----------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Ports PRs which have a maintainer who is a ports committer may be
reassigned by anyone (but note that not every FreeBSD committer is
necessarily a ports committer, so you cannot simply go by the email
address alone.)

For other PRs, please do not reassign them to individuals (other than
yourself) unless you are certain that the assignee really wants to track
the PR. This will help to avoid the case where no one looks at fixing a
particular problem because everyone assumes that the assignee is already
working on it.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?5.?Common Assignees — Other

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------------------------------------------------------------+----------------------+----------------------+-----------------+
| Type                                                                     | Suggested Category   | Suggested Assignee   | Assignee Type   |
+==========================================================================+======================+======================+=================+
| problem with PR database                                                 | bin                  | bugmeister           | alias           |
+--------------------------------------------------------------------------+----------------------+----------------------+-----------------+
| problem with Bugzilla `web form <https://bugs.freebsd.org/submit/>`__.   | doc                  | bugmeister           | alias           |
+--------------------------------------------------------------------------+----------------------+----------------------+-----------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

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

4.2.?Assigned PRs
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If a PR has the ``responsible`` field set to the username of a FreeBSD
developer, it means that the PR has been handed over to that particular
person for further work.

Assigned PRs should not be touched by anyone but the assignee or
bugmeister. If you have comments, submit a followup. If for some reason
you think the PR should change state or be reassigned, send a message to
the assignee. If the assignee does not respond within two weeks,
unassign the PR and do as you please.

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

4.3.?Duplicate PRs
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you find more than one PR that describe the same issue, choose the
one that contains the largest amount of useful information and close the
others, stating clearly the number of the superseding PR. If several PRs
contain non-overlapping useful information, submit all the missing
information to one in a followup, including references to the others;
then close the other PRs (which are now completely superseded).

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

4.4.?Stale PRs
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A PR is considered stale if it has not been modified in more than six
months. Apply the following procedure to deal with stale PRs:

.. raw:: html

   <div class="itemizedlist">

-  If the PR contains sufficient detail, try to reproduce the problem in
   ``-CURRENT`` and ``-STABLE``. If you succeed, submit a followup
   detailing your findings and try to find someone to assign it to. Set
   the state to “analyzed” if appropriate.

-  If the PR describes an issue which you know is the result of a usage
   error (incorrect configuration or otherwise), submit a followup
   explaining what the originator did wrong, then close the PR with the
   reason “User error” or “Configuration error”.

-  If the PR describes an error which you know has been corrected in
   both ``-CURRENT`` and ``-STABLE``, close it with a message stating
   when it was fixed in each branch.

-  If the PR describes an error which you know has been corrected in
   ``-CURRENT``, but not in ``-STABLE``, try to find out when the person
   who corrected it is planning to MFC it, or try to find someone else
   (maybe yourself?) to do it. Set the state to “patched” and assign it
   to whomever will do the MFC.

-  In other cases, ask the originator to confirm if the problem still
   exists in newer versions. If the originator does not reply within a
   month, close the PR with the notation “Feedback timeout”.

.. raw:: html

   </div>

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

4.5.?Non-Bug PRs
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Developers that come across PRs that look like they should have been
posted to
`freebsd-bugs <http://lists.FreeBSD.org/mailman/listinfo/freebsd-bugs>`__
or some other list should close the PR, informing the submitter in a
comment why this is not really a PR and where the message should be
posted.

The email addresses that Bugzilla listens to for incoming PRs have been
published as part of the FreeBSD documentation, have been announced and
listed on the web-site. This means that spammers found them.

Whenever you close one of these PRs, please do the following:

.. raw:: html

   <div class="itemizedlist">

-  Set the component to ``junk`` (under ``Supporting Services``.

-  Set Responsible to ``nobody@FreeBSD.org``.

-  Set State to ``Issue Resolved``.

.. raw:: html

   </div>

Setting the category to ``junk`` makes it obvious that there is no
useful content within the PR, and helps to reduce the clutter within the
main categories.

.. raw:: html

   </div>

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

5.?Further Reading
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is a list of resources relevant to the proper writing and
processing of problem reports. It is by no means complete.

.. raw:: html

   <div class="itemizedlist">

-  `How to Write FreeBSD Problem
   Reports <../../../../doc/en_US.ISO8859-1/articles/problem-reports/article.html>`__—guidelines
   for PR originators.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>
