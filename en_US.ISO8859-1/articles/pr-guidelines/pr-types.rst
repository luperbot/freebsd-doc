===========================
4.?Types of Problem Reports
===========================

.. raw:: html

   <div class="navheader">

4.?Types of Problem Reports
`Prev <pr-states.html>`__?
?
?\ `Next <references.html>`__

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

-  `PRs not yet assigned to anyone. <pr-types.html#pr-unassigned>`__

-  `PRs already assigned to someone. <pr-types.html#pr-assigned>`__

-  `Duplicates of existing PRs. <pr-types.html#pr-dups>`__

-  `Stale PRs <pr-types.html#pr-stale>`__

-  `Non-Bug PRs <pr-types.html#pr-misfiled-notpr>`__

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

   <div class="navfooter">

--------------

+------------------------------+-------------------------+---------------------------------+
| `Prev <pr-states.html>`__?   | ?                       | ?\ `Next <references.html>`__   |
+------------------------------+-------------------------+---------------------------------+
| 3.?Problem Report State?     | `Home <index.html>`__   | ?5.?Further Reading             |
+------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
