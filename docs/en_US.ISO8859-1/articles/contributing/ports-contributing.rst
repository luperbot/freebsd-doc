========================
3.?Contributing to ports
========================

.. raw:: html

   <div class="navheader">

3.?Contributing to ports
`Prev <contrib-how.html>`__?
?
?\ `Next <ix01.html>`__

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

3.?Contributing to ports
------------------------

.. raw:: html

   </div>

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

3.1.?Adopting an unmaintained port
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.1.?Choosing an unmaintained port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Taking over maintainership of ports that are unmaintained is a great way
to get involved. Unmaintained ports are only updated and fixed when
somebody volunteers to work on them. There are a large number of
unmaintained ports. It is a good idea to start with adopting a port that
you use regularly.

Unmaintained ports have their ``MAINTAINER`` set to
``ports@FreeBSD.org``. A list of unmaintained ports and their current
errors and problem reports can be seen at the `FreeBSD Ports Monitoring
System <http://portsmon.FreeBSD.org/portsconcordanceformaintainer.py?maintainer=ports%40FreeBSD.org>`__.

Some ports affect a large number of others due to dependencies and slave
port relationships. Generally, we want people to have some experience
before they maintain such ports.

You can find out whether or not a port has dependencies or slave ports
by looking at a master index of ports called ``INDEX``. (The name of the
file varies by release of FreeBSD; for instance, ``INDEX-8``.) Some
ports have conditional dependencies that are not included in a default
``INDEX`` build. We expect you to be able to recognize such ports by
looking through other ports' ``Makefile``\ s.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.2.?How to adopt the port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First make sure you understand your `responsibilities as a
maintainer <ports-contributing.html#maintain-port>`__. Also read the
`Porter's
Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook>`__.
*Please do not commit yourself to more than you feel you can comfortably
handle.*

You may request maintainership of any unmaintained port as soon as you
wish. Simply set ``MAINTAINER`` to your own email address and send a PR
(Problem Report) with the change. If the port has build errors or needs
updating, you may wish to include any other changes in the same PR. This
will help because many committers are less willing to assign
maintainership to someone who does not have a known track record with
FreeBSD. Submitting PRs that fix build errors or update ports are the
best ways to establish one.

File your PR with category ``ports`` and class ``change-request``. A
committer will examine your PR, commit the changes, and finally close
the PR. Sometimes this process can take a little while (committers are
volunteers, too :).

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

3.2.?The challenge for port maintainers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section will give you an idea of why ports need to be maintained
and outline the responsibilities of a port maintainer.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.?Why ports require maintenance
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Creating a port is a once-off task. Ensuring that a port is up to date
and continues to build and run requires an ongoing maintenance effort.
Maintainers are the people who dedicate some of their time to meeting
these goals.

The foremost reason ports need maintenance is to bring the latest and
greatest in third party software to the FreeBSD community. An additional
challenge is to keep individual ports working within the Ports
Collection framework as it evolves.

As a maintainer, you will need to manage the following challenges:

.. raw:: html

   <div class="itemizedlist">

-  New software versions and updates.?New versions and updates of
   existing ported software become available all the time, and these
   need to be incorporated into the Ports Collection in order to provide
   up-to-date software.

-  Changes to dependencies.?If significant changes are made to the
   dependencies of your port, it may need to be updated so that it will
   continue to work correctly.

-  Changes affecting dependent ports.?If other ports depend on a port
   that you maintain, changes to your port may require coordination with
   other maintainers.

-  Interaction with other users, maintainers and developers.?Part of
   being a maintainer is taking on a support role. You are not expected
   to provide general support (but we welcome it if you choose to do
   so). What you should provide is a point of coordination for
   FreeBSD-specific issues regarding your ports.

-  Bug hunting.?A port may be affected by bugs which are specific to
   FreeBSD. You will need to investigate, find, and fix these bugs when
   they are reported. Thoroughly testing a port to identify problems
   before they make their way into the Ports Collection is even better.

-  Changes to ports infrastructure and policy.?Occasionally the systems
   that are used to build ports and packages are updated or a new
   recommendation affecting the infrastructure is made. You should be
   aware of these changes in case your ports are affected and require
   updating.

-  Changes to the base system.?FreeBSD is under constant development.
   Changes to software, libraries, the kernel or even policy changes can
   cause flow-on change requirements to ports.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.2.?Maintainer responsibilities
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.2.1.?Keep your ports up to date
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section outlines the process to follow to keep your ports up to
date.

This is an overview. More information about upgrading a port is
available in the `Porter's
Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook>`__.

.. raw:: html

   <div class="procedure">

#. **Watch for updates**

   Monitor the upstream vendor for new versions, updates and security
   fixes for the software. Announcement mailing lists or news web pages
   are useful for doing this. Sometimes users will contact you and ask
   when your port will be updated. If you are busy with other things or
   for any reason just cannot update it at the moment, ask if they will
   help you by submitting an update.

   You may also receive automated email from the
   ``FreeBSD Ports Version Check`` informing you that a newer version of
   your port's distfile is available. More information about that system
   (including how to stop future emails) will be provided in the
   message.

#. **Incorporate changes**

   When they become available, incorporate the changes into the port.
   You need to be able to generate a patch between the original port and
   your updated port.

#. **Review and test**

   Thoroughly review and test your changes:

   .. raw:: html

      <div class="itemizedlist">

   -  Build, install and test your port on as many platforms and
      architectures as you can. It is common for a port to work on one
      branch or platform and fail on another.

   -  Make sure your port's dependencies are complete. The recommended
      way of doing this is by installing your own ports tinderbox. See
      `resources <ports-contributing.html#resources>`__ for more
      information.

   -  Check that the packing list is up to date. This involves adding in
      any new files and directories and removing unused entries.

   -  Verify your port using
      `portlint(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portlint&sektion=1>`__
      as a guide. See `resources <ports-contributing.html#resources>`__
      for important information about using portlint.

   -  Consider whether changes to your port might cause any other ports
      to break. If this is the case, coordinate the changes with the
      maintainers of those ports. This is especially important if your
      update changes the shared library version; in this case, at the
      very least, the dependent ports will need to get a
      ``PORTREVISION`` bump so that they will automatically be upgraded
      by automated tools such as portmaster or
      `portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1>`__.

   .. raw:: html

      </div>

#. **Submit changes**

   Send your update by submitting a PR with an explanation of the
   changes and a patch containing the differences between the original
   port and the updated one. Please refer to `Writing FreeBSD Problem
   Reports <../../../../doc/en_US.ISO8859-1/articles/problem-reports>`__
   for information on how to write a really good PR.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Please do not submit a
   `shar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=shar&sektion=1>`__
   archive of the entire port; instead, use
   `diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
   ``-ruN``. In this way, committers can much more easily see exactly
   what changes are being made. The Porter's Handbook section on
   `Upgrading <../../../../doc/en_US.ISO8859-1/books/porters-handbook/port-upgrading.html>`__
   has more information.

   .. raw:: html

      </div>

#. **Wait**

   At some stage a committer will deal with your PR. It may take
   minutes, or it may take weeks — so please be patient.

#. **Give feedback**

   If a committer finds a problem with your changes, they will most
   likely refer it back to you. A prompt response will help get your PR
   committed faster, and is better for maintaining a thread of
   conversation when trying to resolve any problems.

#. **And Finally**

   Your changes will be committed and your port will have been updated.
   The PR will then be closed by the committer. That's it!

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.2.2.?Ensure your ports continue to build correctly
''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section is about discovering and fixing problems that stop your
ports from building correctly.

FreeBSD only guarantees that the Ports Collection works on the
``-STABLE`` branches. In theory, you should be able to get by with
running the latest release of each stable branch (since the ABIs are not
supposed to change) but if you can run the branch, that is even better.

Since the majority of FreeBSD installations run on PC-compatible
machines (what is termed the ``i386`` architecture), we expect you to
keep the port working on that architecture. We prefer that ports also
work on the ``amd64`` architecture running native. It is completely fair
to ask for help if you do not have one of these machines.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The usual failure modes for non-\ ``x86`` machines are that the original
programmers assumed that, for instance, pointers are ``int``\ s, or that
a relatively lax older gcc compiler was being used. More and more,
application authors are reworking their code to remove these assumptions
— but if the author is not actively maintaining their code, you may need
to do this yourself.

.. raw:: html

   </div>

These are the tasks you need to perform to ensure your port is able to
be built:

.. raw:: html

   <div class="procedure">

#. **Watch for build failures**

   Check your mail for mail from ``pkg-fallout@FreeBSD.org`` and the
   `distfiles scanner <http://portscout.FreeBSD.org>`__ to see if any of
   the port which are failing to build are out of date.

#. **Collect information**

   Once you are aware of a problem, collect information to help you fix
   it. Build errors reported by ``pkg-fallout`` are accompanied by logs
   which will show you where the build failed. If the failure was
   reported to you by a user, ask them to send you information which may
   help in diagnosing the problem, such as:

   .. raw:: html

      <div class="itemizedlist">

   -  Build logs

   -  The commands and options used to build the port (including options
      set in ``/etc/make.conf``)

   -  A list of packages installed on their system as shown by
      `pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1>`__

   -  The version of FreeBSD they are running as shown by
      `uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1>`__\ `` -a``

   -  When their ports collection was last updated

   -  When their ports tree amd ``INDEX`` was last updated

   .. raw:: html

      </div>

#. **Investigate and find a solution**

   Unfortunately there is no straightforward process to follow to do
   this. Remember, though: if you are stuck, ask for help! The `FreeBSD
   ports mailing
   list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__ is
   a good place to start, and the upstream developers are often very
   helpful.

#. **Submit changes**

   Just as with updating a port, you should now incorporate changes,
   review and test, submit your changes in a PR, and provide feedback if
   required.

#. **Send patches to upstream authors**

   In some cases, you will have to make patches to the port to make it
   run on FreeBSD. Some (but not all) upstream authors will accept such
   patches back into their code for the next release. If so, this may
   even help their users on other BSD-based systems as well and perhaps
   save duplicated effort. Please consider sending any applicable
   patches to the authors as a courtesy.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.2.3.?Investigate bug reports and PRs related to your port
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section is about discovering and fixing bugs.

FreeBSD-specific bugs are generally caused by assumptions about the
build and runtime environments that do not apply to FreeBSD. You are
less likely to encounter a problem of this type, but it can be more
subtle and difficult to diagnose.

These are the tasks you need to perform to ensure your port continues to
work as intended:

.. raw:: html

   <div class="procedure">

#. **Respond to bug reports**

   Bugs may be reported to you through email via the `Problem Report
   database <https://bugs.FreeBSD.org/search/>`__. Bugs may also be
   reported directly to you by users.

   You should respond to PRs and other reports within 14 days, but
   please try not to take that long. Try to respond as soon as possible,
   even if it is just to say you need some more time before you can work
   on the PR.

   If you have not responded after 14 days, any committer may commit
   from a PR that you have not responded to via a
   ``maintainer-timeout``.

#. **Collect information**

   If the person reporting the bug has not also provided a fix, you need
   to collect the information that will allow you to generate one.

   If the bug is reproducible, you can collect most of the required
   information yourself. If not, ask the person who reported the bug to
   collect the information for you, such as:

   .. raw:: html

      <div class="itemizedlist">

   -  A detailed description of their actions, expected program behavior
      and actual behavior

   -  Copies of input data used to trigger the bug

   -  Information about their build and execution environment — for
      example, a list of installed packages and the output of
      `env(1) <http://www.FreeBSD.org/cgi/man.cgi?query=env&sektion=1>`__

   -  Core dumps

   -  Stack traces

   .. raw:: html

      </div>

#. **Eliminate incorrect reports**

   Some bug reports may be incorrect. For example, the user may have
   simply misused the program; or their installed packages may be out of
   date and require updating. Sometimes a reported bug is not specific
   to FreeBSD. In this case report the bug to the upstream developers.
   If the bug is within your capabilities to fix, you can also patch the
   port so that the fix is applied before the next upstream release.

#. **Find a solution**

   As with build errors, you will need to sort out a fix to the problem.
   Again, remember to ask if you are stuck!

#. **Submit or approve changes**

   Just as with updating a port, you should now incorporate changes,
   review and test, and submit your changes in a PR (or send a follow-up
   if a PR already exists for the problem). If another user has
   submitted changes in the PR, you can also send a follow-up saying
   whether or not you approve the changes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.2.4.?Providing support
''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Part of being a maintainer is providing support — not for the software
in general — but for the port and any FreeBSD-specific quirks and
problems. Users may contact you with questions, suggestions, problems
and patches. Most of the time their correspondence will be specific to
FreeBSD.

Occasionally you may have to invoke your skills in diplomacy, and kindly
point users seeking general support to the appropriate resources. Less
frequently you will encounter a person asking why the ``RPM``\ s are not
up to date or how can they get the software to run under Foo Linux. Take
the opportunity to tell them that your port is up to date (if it is, of
course!), and suggest that they try FreeBSD.

Sometimes users and developers will decide that you are a busy person
whose time is valuable and do some of the work for you. For example,
they might:

.. raw:: html

   <div class="itemizedlist">

-  submit a PR or send you patches to update your port,

-  investigate and perhaps provide a fix to a PR, or

-  otherwise submit changes to your port.

.. raw:: html

   </div>

In these cases your main obligation is to respond in a timely manner.
Again, the timeout for non-responsive maintainers is 14 days. After this
period changes may be committed unapproved. They have taken the trouble
to do this for you; so please try to at least respond promptly. Then
review, approve, modify or discuss their changes with them as soon as
possible.

If you can make them feel that their contribution is appreciated (and it
should be) you will have a better chance persuading them to do more
things for you in the future :-).

.. raw:: html

   </div>

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

3.3.?Finding and fixing a broken port
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two really good places to find a port that needs some
attention.

You can use the `web interface <http://bugs.freebsd.org/search>`__ to
the Problem Report database to search through and view unresolved PRs.
The majority of ports PRs are updates, but with a little searching and
skimming over synopses you should be able to find something interesting
to work on (the ``sw-bug`` class is a good place to start).

The other place is the `FreeBSD Ports Monitoring
System <http://portsmon.FreeBSD.org/>`__. In particular look for
unmaintained ports with build errors and ports that are marked
``BROKEN``. It is OK to send changes for a maintained port as well, but
remember to ask the maintainer in case they are already working on the
problem.

Once you have found a bug or problem, collect information, investigate
and fix! If there is an existing PR, follow up to that. Otherwise create
a new PR. Your changes will be reviewed and, if everything checks out,
committed.

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

3.4.?When to call it quits
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As your interests and commitments change, you may find that you no
longer have time to continue some (or all) of your ports contributions.
That is fine! Please let us know if you are no longer using a port or
have otherwise lost time or interest in being a maintainer. In this way
we can go ahead and allow other people to try to work on existing
problems with the port without waiting for your response. Remember,
FreeBSD is a volunteer project, so if maintaining a port is no fun
anymore, it is probably time to let someone else do it!

In any case, the Ports Management Team (``portmgr``) reserves the right
to reset your maintainership if you have not actively maintained your
port in some time. (Currently, this is set to 3 months.) By this, we
mean that there are unresolved problems or pending updates that have not
been worked on during that time.

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

3.5.?Resources for ports maintainers and contributors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `Porter's
Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook>`__ is
your hitchhiker's guide to the ports system. Keep it handy!

`Writing FreeBSD Problem
Reports <../../../../doc/en_US.ISO8859-1/articles/problem-reports>`__
describes how to best formulate and submit a PR. In 2005 more than
eleven thousand ports PRs were submitted! Following this article will
greatly assist us in reducing the time needed to handle your PRs.

The `Problem Report
database <http://www.FreeBSD.org/cgi/query-pr-summary.cgi?query>`__.

The `FreeBSD Ports Monitoring System <http://portsmon.FreeBSD.org/>`__
can show you cross-referenced information about ports such as build
errors and problem reports. If you are a maintainer you can use it to
check on the build status of your ports. As a contributor you can use it
to find broken and unmaintained ports that need to be fixed.

The `FreeBSD Ports distfile scanner <http://portscout.FreeBSD.org>`__
can show you ports for which the distfiles are not fetchable. You can
check on your own ports or use it to find ports that need their
``MASTER_SITES`` updated.

`ports-mgmt/poudriere <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/poudriere/pkg-descr>`__
is the most thorough way to test a port through the entire cycle of
installation, packaging, and deinstallation. documentation is located at
the `poudriere home page <https://fossil.etoilebsd.net/poudriere/>`__

`portlint(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portlint&sektion=1>`__
is an application which can be used to verify that your port conforms to
many important stylistic and functional guidelines. portlint is a simple
heuristic application, so you should use it *only as a guide*. If
portlint suggests changes which seem unreasonable, consult the `Porter's
Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook>`__ or
ask for advice.

The `FreeBSD ports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__ is for
general ports-related discussion. It is a good place to ask for help.
You can `subscribe, or read and search the list
archives <http://lists.freebsd.org/mailman/listinfo>`__. Reading the
archives of the `FreeBSD ports bugs mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports-bugs>`__
and the `FreeBSD CVS ports commit
list <http://lists.FreeBSD.org/mailman/listinfo/cvs-ports>`__ may also
be of interest.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+---------------------------+
| `Prev <contrib-how.html>`__?   | ?                       | ?\ `Next <ix01.html>`__   |
+--------------------------------+-------------------------+---------------------------+
| 2.?How to Contribute?          | `Home <index.html>`__   | ?Index                    |
+--------------------------------+-------------------------+---------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
