==================================
2.?When to Submit a Problem Report
==================================

.. raw:: html

   <div class="navheader">

2.?When to Submit a Problem Report
`Prev <index.html>`__?
?
?\ `Next <pr-prep.html>`__

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

2.?When to Submit a Problem Report
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are many types of problems, and not all of them should engender a
problem report. Of course, nobody is perfect, and there will be times
when what seems to be a bug in a program is, in fact, a misunderstanding
of the syntax for a command or a typographical error in a configuration
file (though that in itself may sometimes be indicative of poor
documentation or poor error handling in the application). There are
still many cases where submitting a problem report is clearly *not* the
right course of action, and will only serve to frustrate both the
submitter and the developers. Conversely, there are cases where it might
be appropriate to submit a problem report about something else than a
bug—an enhancement or a new feature, for instance.

So how does one determine what is a bug and what is not? As a simple
rule of thumb, the problem is *not* a bug if it can be expressed as a
question (usually of the form “How do I do X?” or “Where can I find
Y?”). It is not always quite so black and white, but the question rule
covers a large majority of cases. When looking for an answer, consider
posing the question to the `FreeBSD general questions mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__.

Consider these factors when submitting PRs about ports or other software
that is not part of FreeBSD itself:

.. raw:: html

   <div class="itemizedlist">

-  Please do not submit problem reports that simply state that a newer
   version of an application is available. Ports maintainers are
   automatically notified by portscout when a new version of an
   application becomes available. Actual patches to update a port to the
   latest version are welcome.

-  For unmaintained ports (``MAINTAINER`` is ``ports@FreeBSD.org``), a
   PR without an included patch is unlikely to get picked up by a
   committer. To become the maintainer of an unmaintained port, submit a
   PR with the request (patch preferred but not required).

-  In either case, following the process described in `Porter's
   Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook/port-upgrading.html>`__
   will yield the best results. (You might also wish to read
   `Contributing to the FreeBSD Ports
   Collection <../../../../doc/en_US.ISO8859-1/articles/contributing-ports/article.html>`__.)

.. raw:: html

   </div>

A bug that cannot be reproduced can rarely be fixed. If the bug only
occurred once and you can not reproduce it, and it does not seem to
happen to anybody else, chances are none of the developers will be able
to reproduce it or figure out what is wrong. That does not mean it did
not happen, but it does mean that the chances of your problem report
ever leading to a bug fix are very slim. To make matters worse, often
these kinds of bugs are actually caused by failing hard drives or
overheating processors — you should always try to rule out these causes,
whenever possible, before submitting a PR.

Next, to decide to whom you should file your problem report, you need to
understand that the software that makes up FreeBSD is composed of
several different elements:

.. raw:: html

   <div class="itemizedlist">

-  Code in the base system that is written and maintained by FreeBSD
   contributors, such as the kernel, the C library, and the device
   drivers (categorized as ``kern``); the binary utilities (``bin``);
   the manual pages and documentation (``docs``); and the web pages
   (``www``). All bugs in these areas should be reported to the FreeBSD
   developers.

-  Code in the base system that is written and maintained by others, and
   imported into FreeBSD and adapted. Examples include
   `clang(1) <http://www.FreeBSD.org/cgi/man.cgi?query=clang&sektion=1>`__,
   and
   `sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__.
   Most bugs in these areas should be reported to the FreeBSD
   developers; but in some cases they may need to be reported to the
   original authors instead if the problems are not FreeBSD-specific.

-  Individual applications that are not in the base system but are
   instead part of the FreeBSD Ports Collection (category ``ports``).
   Most of these applications are not written by FreeBSD developers;
   what FreeBSD provides is merely a framework for installing the
   application. Therefore, only report a problem to the FreeBSD
   developers when the problem is believed to be FreeBSD-specific;
   otherwise, report it to the authors of the software.

.. raw:: html

   </div>

Then, ascertain whether the problem is timely. There are few things that
will annoy a developer more than receiving a problem report about a bug
she has already fixed.

If the problem is in the base system, first read the FAQ section on
`FreeBSD
versions <../../../../doc/en_US.ISO8859-1/books/faq/introduction.html#LATEST-VERSION>`__,
if you are not already familiar with the topic. It is not possible for
FreeBSD to fix problems in anything other than certain recent branches
of the base system, so filing a bug report about an older version will
probably only result in a developer advising you to upgrade to a
supported version to see if the problem still recurs. The Security
Officer team maintains the `list of supported
versions <../../../../security/>`__.

If the problem is in a port, note that you must first upgrade to the
latest version of the Ports Collection and see if the problem still
applies. Due to the rapid pace of changes in these applications, it is
infeasible for FreeBSD to support anything other than the absolute
latest versions, and problems with older version of applications simply
cannot be fixed.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+------------------------------+
| `Prev <index.html>`__?             | ?                       | ?\ `Next <pr-prep.html>`__   |
+------------------------------------+-------------------------+------------------------------+
| Writing FreeBSD Problem Reports?   | `Home <index.html>`__   | ?3.?Preparations             |
+------------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
