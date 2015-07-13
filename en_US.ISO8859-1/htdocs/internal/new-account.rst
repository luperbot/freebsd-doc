==============================
New Account Creation Procedure
==============================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Header And Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

.. raw:: html

   <div class="frontdonateroundbox">

.. raw:: html

   <div class="frontdonatetop">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatecontent">

`Donate to FreeBSD <https://www.FreeBSDFoundation.org/donate/>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatebot">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Peripheral Links
----------------

.. raw:: html

   <div id="searchnav">

.. raw:: html

   </div>

.. raw:: html

   <div id="search">

Search
------

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Site Navigation
---------------

.. raw:: html

   <div id="menu">

-  `Home <../>`__

-  `About <../about.html>`__

   -  `Introduction <../projects/newbies.html>`__
   -  `Features <../features.html>`__
   -  `Advocacy <../advocacy/>`__
   -  `Marketing <../marketing/>`__
   -  `Privacy Policy <../privacy.html>`__

-  `Get FreeBSD <../where.html>`__

   -  `Release Information <../releases/>`__
   -  `Release Engineering <../releng/>`__

-  `Documentation <../docs.html>`__

   -  `FAQ <../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../docs/books.html>`__

-  `Community <../community.html>`__

   -  `Mailing Lists <../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../usergroups.html>`__
   -  `Events <../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../support.html>`__

   -  `Vendors <../commercial/commercial.html>`__
   -  `Security Information <../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../donations/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `Documentation <../docs.html>`__
-  `FAQ <../doc/en_US.ISO8859-1/books/faq/>`__
-  `Handbook <../doc/en_US.ISO8859-1/books/handbook/>`__
-  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
-  `Books and Articles Online <../docs/books.html>`__
-  `Publications <../publish.html>`__
-  `Web Resources <../docs/webresources.html>`__
-  `For Newbies <../projects/newbies.html>`__
-  `Documentation Project <../docproj/>`__
-  `Archive <https://docs.freebsd.org/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

New Account Creation Procedure
==============================

Proposing a new committer
-------------------------

If you want to propose a new committer, you should send the following
information to the appropriate entity:

-  Information on what established (FreeBSD) track record the nominee
   has. This is *not* optional.
-  Who has volunteered to become the mentor for the new committer.
-  The email address of the nominee (remarkably often this is omitted).

Any commit bit requests that do not follow the guidelines outlined above
will be delayed (at best) or earn you negative vibrations from the
respective team / team secretary. For some guidelines on how the
proposal itself should be written, please see `a brief
summary <proposing-committers.html>`__.

Responsible party for this procedure is:

-  src --> core@
-  doc --> doceng@
-  ports --> portmgr@

You will get ACK after the message is seen, and core@, doceng@ and
portmgr@ will give you a response after voting is finished or when the
timeout is hit. The timeout for core@ and portmgr@ is set to 7 days
while for doceng@ it is 14 days, however, as indicated, this is just a
worst case and team members may finish voting earlier.

Authorizing A New Account
-------------------------

Someone from the list below sends a PGP-signed email to accounts@, the
person assigned as the mentor to the new committer, and copied to
core@FreeBSD.org confirming the approval of the new account. This email
should include a link to this document so the mentor/mentee know what is
expected of them.

New account approvals are only valid from these PGP entities:

-  core-secretary (for src commit bits)

-  portmgr-secretary (for ports commit bits)

-  doceng (for doc commit bits)

*NOTE: New account requests from anyone other than these entities or
requests signed with PGP keys other than from these entities will not be
acted upon. No exceptions. In case of a new ports or doc committer the
account request email should be CC:-ed to core.*

Information Needed From The Mentor
----------------------------------

The person assigned as the new committers' mentor needs to collect and
send the following information to accounts@:

-  username (lowercase a-z and 0-9)

-  Full Name (as would go in a GECOS field)

-  optional additional GECOS information (phone, location etc)

-  shell (sh, csh/tcsh, bash, zsh are available)

-  ssh V2 public key (**version 2 ONLY**)

Any non-ASCII characters for the *Full Name* field should be encoded in
UTF-8. Be aware that we have very limited support for this and caution
that they are likely to be frequently corrupted. The number of
characters should kept to a minimum.

The mentor is responsible for obtaining this information from the new
committer in a secure fashion, and providing it to accounts@ in a secure
fashion. PGP-signed email, with the mentor's public key already
committed to the Handbook, is the preferred method for the mentor to
send the information to accounts@. If this is impossible for some reason
an acceptable substitute is for the mentor to place the account
information in their home directory on freefall and then tell accounts@
where to find it. We need to be sure the account information really is
coming from the Mentor and unsigned email is not sufficient for this
these days. Since accounts@ has no way to verify anything from the new
Committer this information needs to be sent to accounts@ by the Mentor,
not the new Committer.

accounts@ Creates New Account
-----------------------------

accounts@ creates the new account with the above information on the
FreeBSD.org cluster and notifies the mentor and the new committer.

Mentor Activates New Committer's Commit Bit
-------------------------------------------

After the new committer confirms that the account works, the mentor adds
the new committer to the correct ``access`` file, using an appropriate
commit message. The commit message should at least contain the
committer's full name and username, the mentor's name and what area the
new committer will start to work in. An entry should also be added to
the ``mentors`` file in the respective Subversion repository to indicate
the mentor relationship. Having done all that, the new committer and
mentor jointly go through the first commit operations.

Reading the `Committer's
Guide <../doc/en_US.ISO8859-1/articles/committers-guide/index.html>`__
is considered a good first step for new committers, especially the
`Conventions and
Traditions <../doc/en_US.ISO8859-1/articles/committers-guide/conventions.html>`__
section.

End Of Mentorship
-----------------

There is no pre-set duration for a mentorship. Once the mentor feels the
mentee is ready to 'fly solo' the mentor notifies the developer
community by removing the entry from the ``mentors`` file in SVN.

Transfer Of Mentorship
----------------------

Should a need arise to transfer mentorship for a committer please email
the responsible party, as described for a new account proposal.
Typically this request is rubberstamped as-is. In Subversion, the
``mentors`` file should be updated.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../search/index-site.html>`__ \| `Legal
Notices <../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../layout/images/logo-red.png
   :target: ..
