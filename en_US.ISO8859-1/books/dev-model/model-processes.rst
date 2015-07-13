====================
Chapter?6.?Processes
====================

.. raw:: html

   <div class="navheader">

Chapter?6.?Processes
`Prev <proc-depend-hats.html>`__?
?
?\ `Next <committing.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`6.1. Adding new and removing old
committers <model-processes.html#proc-addrem-committer>`__
`6.2. Committing code <committing.html>`__
`6.3. Core election <process-core-election.html>`__
`6.4. Development of new features <new-features.html>`__
`6.5. Maintenance <model-maintenance.html>`__
`6.6. Problem reporting <model-pr.html>`__
`6.7. Reacting to misbehaviour <process-reactions.html>`__
`6.8. Release engineering <process-release-engineering.html>`__

.. raw:: html

   </div>

The following section will describe the defined project processes.
Issues that are not handled by these processes happen on an ad-hoc basis
based on what has been customary to do in similar cases.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.1.?Adding new and removing old committers
-------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Core team has the responsibility of giving and removing commit
privileges to contributors. This can only be done through a vote on the
core mailing list. The ports and documentation sub-projects can give
commit privileges to people working on these projects, but have to date
not removed such privileges.

Normally a contributor is recommended to core by a committer. For
contributors or outsiders to contact core asking to be a committer is
not well thought of and is usually rejected.

If the area of particular interest for the developer potentially
overlaps with other committers' area of maintainership, the opinion of
those maintainers is sought. However, it is frequently this committer
that recommends the developer.

When a contributor is given committer status, he is assigned a mentor.
The committer who recommended the new committer will, in the general
case, take it upon himself to be the new committers mentor.

When a contributor is given his commit bit, a
`PGP <tool-pgp.html>`__-signed email is sent from either `Core
Secretary <official-hats.html#role-core-secretary>`__, `Ports
Manager <official-hats.html#role-ports-manager>`__ or nik@freebsd.org to
both admins@freebsd.org, the assigned mentor, the new committer and core
confirming the approval of a new account. The mentor then gathers a
password line, `SSH 2 <tool-ssh2.html>`__ public key and PGP key from
the new committer and sends them to
`Admin <official-hats.html#role-admin>`__. When the new account is
created, the mentor activates the commit bit and guides the new
committer through the rest of the initial process.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?6.1.?Process summary: adding a new committer

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Process summary: adding a new committer|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

When a contributor sends a piece of code, the receiving committer may
choose to recommend that the contributor is given commit privileges. If
he recommends this to core, they will vote on this recommendation. If
they vote in favour, a mentor is assigned the new committer and the new
committer has to email his details to the administrators for an account
to be created. After this, the new committer is all set to make his
first commit. By tradition, this is by adding his name to the committers
list.

Recall that a committer is considered to be someone who has committed
code during the past 12 months. However, it is not until after 18 months
of inactivity have passed that commit privileges are eligible to be
revoked. [`FreeBSD,
2002H <bibliography.html#freebsd-expiration-policy>`__] There are,
however, no automatic procedures for doing this. For reactions
concerning commit privileges not triggered by time, see `section
1.5.8 <process-reactions.html>`__.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?6.2.?Process summary: removing a committer

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Process summary: removing a committer|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

When Core decides to clean up the committers list, they check who has
not made a commit for the past 18 months. Committers who have not done
so have their commit bits revoked.

It is also possible for committers to request that their commit bit be
retired if for some reason they are no longer going to be actively
committing to the project. In this case, it can also be restored at a
later time by core, should the committer ask.

Roles in this process:

.. raw:: html

   <div class="orderedlist">

#. `Core team <sect-hats.html#role-core>`__

#. `Contributor <sect-hats.html#role-contributor>`__

#. `Committer <sect-hats.html#role-committer>`__

#. `Maintainership <sect-hats.html#role-maintainer>`__

#. `Mentor <proc-depend-hats.html#role-mentor>`__

.. raw:: html

   </div>

[`FreeBSD, 2000A <bibliography.html#freebsd-bylaws>`__] [`FreeBSD,
2002H <bibliography.html#freebsd-expiration-policy>`__] [`FreeBSD,
2002I <bibliography.html#freebsd-new-account>`__]

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+---------------------------------+
| `Prev <proc-depend-hats.html>`__?   | ?                       | ?\ `Next <committing.html>`__   |
+-------------------------------------+-------------------------+---------------------------------+
| 5.3.?Process dependent hats?        | `Home <index.html>`__   | ?6.2.?Committing code           |
+-------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |Process summary: adding a new committer| image:: proc-add-committer.png
.. |Process summary: removing a committer| image:: proc-rm-committer.png
