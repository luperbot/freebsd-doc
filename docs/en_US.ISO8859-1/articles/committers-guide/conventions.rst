=====================================
6.?Setup, Conventions, and Traditions
=====================================

.. raw:: html

   <div class="navheader">

6.?Setup, Conventions, and Traditions
`Prev <subversion-primer.html>`__?
?
?\ `Next <commit-log-message.html>`__

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

6.?Setup, Conventions, and Traditions
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are a number of things to do as a new developer. The first set of
steps is specific to committers only. These steps must be done by a
mentor for those who are not committers.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.1.?For New Committers
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Those who have been given commit rights to the FreeBSD repositories must
follow these steps.

.. raw:: html

   <div class="itemizedlist">

-  Get mentor approval before committing each of these changes!

-  The ``.ent`` and ``.xml`` files mentioned below exist in the FreeBSD
   Documentation Project SVN repository at
   ```svn.FreeBSD.org/doc/`` <svn.FreeBSD.org/doc/>`__.

-  New files that do not have the ``FreeBSD=%H`` ``svn:keywords``
   property will be rejected when attempting to commit them to the
   repository. Be sure to read `Section?5.3.7, “Adding and Removing
   Files” <subversion-primer.html#svn-daily-use-adding-and-removing>`__
   regarding adding and removing files. Verify that
   ``~/.subversion/config`` contains the necessary “auto-props” entries
   from ``auto-props.txt`` mentioned there.

-  All ``src`` commits should go to FreeBSD-CURRENT first before being
   merged to FreeBSD-STABLE. The FreeBSD-STABLE branch must maintain ABI
   and API compatibility with earlier versions of that branch. Do not
   merge changes that break this compatibility.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?1.?Steps for New Committers

.. raw:: html

   </div>

#. **Add an Author Entity**

   ``doc/head/share/xml/authors.ent`` — Add an author entity. Later
   steps depend on this entity, and missing this step will cause the
   ``doc/`` build to fail. This is a relatively easy task, but remains a
   good first test of version control skills.

#. **Update the List of Developers and Contributors**

   ``doc/head/en_US.ISO8859-1/articles/contributors/contrib.committers.xml``
   — Add an entry to the “Developers” section of the `Contributors
   List <../../../../doc/en_US.ISO8859-1/articles/contributors/staff-committers.html>`__.
   Entries are sorted by last name.

   ``doc/head/en_US.ISO8859-1/articles/contributors/contrib.additional.xml``
   — Remove the entry from the “Additional Contributors” section.
   Entries are sorted by last name.

#. **Add a News Item**

   ``doc/head/share/xml/news.xml`` — Add an entry. Look for the other
   entries that announce new committers and follow the format. Use the
   date from the commit bit approval email from ``<core@FreeBSD.org>``.

#. **Add a PGP Key**

   ``doc/head/share/pgpkeys/pgpkeys.ent`` and
   ``doc/head/share/pgpkeys/pgpkeys-developers.xml`` - Add your PGP or
   GnuPG key. Those who do not yet have a key should see `Section?2.1,
   “Creating a Key” <pgpkeys.html#pgpkeys-creating>`__.

   Dag-Erling C. Sm?rgrav ``<des@FreeBSD.org>`` has written a shell
   script (``doc/head/share/pgpkeys/addkey.sh``) to make this easier.
   See the
   `README <http://svnweb.FreeBSD.org/doc/head/share/pgpkeys/README>`__
   file for more information.

   Use ``doc/head/share/pgpkeys/checkkey.sh`` to verify that keys meet
   minimal best-practices standards.

   After adding and checking a key, add both updated files to source
   control and then commit them. Entries in this file are sorted by last
   name.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   It is very important to have a current PGP/GnuPG key in the
   repository. The key may be required for positive identification of a
   committer. For example, the FreeBSD Administrators
   ``<admins@FreeBSD.org>`` might need it for account recovery. A
   complete keyring of ``FreeBSD.org`` users is available for download
   from
   `http://www.FreeBSD.org/doc/pgpkeyring.txt <../../../../doc/pgpkeyring.txt>`__.

   .. raw:: html

      </div>

#. **Update Mentor and Mentee Information**

   ``base/head/share/misc/committers-repository``.dot — Add an entry to
   the current committers section, where *``repository``* is ``doc``,
   ``ports``, or ``src``, depending on the commit privileges granted.

   Add an entry for each additional mentor/mentee relationship in the
   bottom section.

#. **Generate a Kerberos Password**

   See `Section?3, “Kerberos and LDAP web Password for FreeBSD
   Cluster” <kerberos-ldap.html>`__ to generate or set a Kerberos for
   use with other FreeBSD services like the bug tracking database.

#. **Optional: Enable Wiki Account**

   `FreeBSD Wiki <http://wiki.freebsd.org>`__ Account — A wiki account
   allows sharing projects and ideas. Those who do not yet have an
   account can contact ``<clusteradm@FreeBSD.org>`` to obtain one.

#. **Optional: Update Wiki Information**

   Wiki Information - After gaining access to the wiki, some people add
   entries to the `How We Got
   Here <http://wiki.freebsd.org/HowWeGotHere>`__, `Irc
   Nicks <http://wiki.freebsd.org/IrcNicks>`__, and `Dogs of
   FreeBSD <https://wiki.freebsd.org/DogsOfFreeBSD>`__ pages.

#. **Optional: Update Ports with Personal Information**

   ``ports/astro/xearth/files/freebsd.committers.markers`` and
   ``src/usr.bin/calendar/calendars/calendar.freebsd`` - Some people add
   entries for themselves to these files to show where they are located
   or the date of their birthday.

#. **Optional: Prevent Duplicate Mailings**

   Subscribers to
   `svn-src-all <http://lists.FreeBSD.org/mailman/listinfo/svn-src-all>`__,
   `svn-ports-all <http://lists.FreeBSD.org/mailman/listinfo/svn-ports-all>`__
   or
   `svn-doc-all <http://lists.FreeBSD.org/mailman/listinfo/svn-doc-all>`__
   might wish to unsubscribe to avoid receiving duplicate copies of
   commit messages and followups.

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

6.2.?For Everyone
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Introduce yourself to the other developers, otherwise no one will
   have any idea who you are or what you are working on. The
   introduction need not be a comprehensive biography, just write a
   paragraph or two about who you are, what you plan to be working on as
   a developer in FreeBSD, and who will be your mentor. Email this to
   the FreeBSD developers mailing list and you will be on your way!

#. Log into ``freefall.FreeBSD.org`` and create a ``/var/forward/user``
   (where *``user``* is your username) file containing the e-mail
   address where you want mail addressed to
   *``yourusername``*\ @FreeBSD.org to be forwarded. This includes all
   of the commit messages as well as any other mail addressed to the
   FreeBSD committer's mailing list and the FreeBSD developers mailing
   list. Really large mailboxes which have taken up permanent residence
   on ``hub`` often get “accidentally” truncated without warning, so
   forward it or read it and you will not lose it.

   Due to the severe load dealing with SPAM places on the central mail
   servers that do the mailing list processing the front-end server does
   do some basic checks and will drop some messages based on these
   checks. At the moment proper DNS information for the connecting host
   is the only check in place but that may change. Some people blame
   these checks for bouncing valid email. If you want these checks
   turned off for your email you can place a file named ``.spam_lover``
   in your home directory on ``freefall.FreeBSD.org`` to disable the
   checks for your email.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Those who are developers but not committers will not be subscribed to
the committers or developers mailing lists. The subscriptions are
derived from the access rights.

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

6.3.?Mentors
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All new developers have a mentor assigned to them for the first few
months. A mentor is responsible for teaching the mentee the rules and
conventions of the project and guiding their first steps in the
developer community. The mentor is also personally responsible for the
mentee's actions during this initial period.

For committers: do not commit anything without first getting mentor
approval. Document that approval with an ``Approved by:`` line in the
commit message.

When the mentor decides that a mentee has learned the ropes and is ready
to commit on their own, the mentor announces it with a commit to
``mentors``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-----------------------------------------+
| `Prev <subversion-primer.html>`__?   | ?                       | ?\ `Next <commit-log-message.html>`__   |
+--------------------------------------+-------------------------+-----------------------------------------+
| 5.?Subversion Primer?                | `Home <index.html>`__   | ?7.?Commit Log Messages                 |
+--------------------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
