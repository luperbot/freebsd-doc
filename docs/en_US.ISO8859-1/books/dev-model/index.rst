=======================================
A project model for the FreeBSD Project
=======================================

.. raw:: html

   <div class="navheader">

A project model for the FreeBSD Project
?
?
?\ `Next <foreword.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="en" lang="en">

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Niklas Saers
~~~~~~~~~~~~

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

Copyright ? 2002-2005 Niklas Saers

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="revhistory" xmlns="http://www.w3.org/1999/xhtml">

**Revision History**
Revision 1.5
October, 2014
Remove mention of GNATS which is no longer used by the project.
Revision 1.4
September, 2013
Remove mention of CVS and CVSup which are no longer used by the project.
Revision 1.3
October, 2012
Remove hats held by specific people, these are documented elsewhere.
Revision 1.2
April, 2005
Update one year of changes, replace statistics with those of 2004
Revision 1.1
July, 2004
First update within the FreeBSD tree
Revision 1.0
December 4th, 2003
Ready for commit to FreeBSD Documentation
Revision 0.7
April 7th, 2003
Release for review by the Documentation team
Revision 0.6
March 1st, 2003
Incorporated corrections noted by interviewees and reviewers
Revision 0.5
February 1st, 2003
Initial review by interviewees

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <book.html>`__ ]

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

`Foreword <foreword.html>`__
`1. Overview <overview.html>`__
`2. Definitions <definitions.html>`__
`2.1. Activity <definitions.html#ref-activity>`__
`2.2. Process <def-process.html>`__
`2.3. Hat <ref-hat.html>`__
`2.4. Outcome <ref-outcome.html>`__
`2.5. FreeBSD <ref-freebsd.html>`__
`3. Organisational structure <model-orgstruct.html>`__
`4. Methodology model <methodology-model.html>`__
`4.1. Development model <methodology-model.html#development-model>`__
`4.2. Release branches <release-branches.html>`__
`4.3. Model summary <model-summary.html>`__
`5. Hats <sect-hats.html>`__
`5.1. General Hats <sect-hats.html#general-hats>`__
`5.2. Official Hats <official-hats.html>`__
`5.3. Process dependent hats <proc-depend-hats.html>`__
`6. Processes <model-processes.html>`__
`6.1. Adding new and removing old
committers <model-processes.html#proc-addrem-committer>`__
`6.2. Committing code <committing.html>`__
`6.3. Core election <process-core-election.html>`__
`6.4. Development of new features <new-features.html>`__
`6.5. Maintenance <model-maintenance.html>`__
`6.6. Problem reporting <model-pr.html>`__
`6.7. Reacting to misbehaviour <process-reactions.html>`__
`6.8. Release engineering <process-release-engineering.html>`__
`7. Tools <tools.html>`__
`7.1. Subversion (SVN) <tools.html#tool-svn>`__
`7.2. Bugzilla <tool-bugzilla.html>`__
`7.3. Mailman <model-mailman.html>`__
`7.4. Perforce <tool-perforce.html>`__
`7.5. Pretty Good Privacy <tool-pgp.html>`__
`7.6. Secure Shell <tool-ssh2.html>`__
`8. Sub-projects <sub-projects.html>`__
`8.1. The Ports Subproject <sub-projects.html#sub-project-ports>`__
`8.2. The FreeBSD Documentation
Project <sub-project-documentation.html>`__
`References <bibliography.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-figures">

.. raw:: html

   <div class="toc-title">

List of Figures

.. raw:: html

   </div>

3.1. `The FreeBSD Project's
structure <model-orgstruct.html#idp63597136>`__
3.2. `The FreeBSD Project's structure with committers in
categories <model-orgstruct.html#idp63607376>`__
4.1. `J?rgenssen's model for change
integration <methodology-model.html#idp63636432>`__
4.2. `The FreeBSD release tree <release-branches.html#idp63682000>`__
4.3. `The overall development model <model-summary.html#idp63711312>`__
5.1. `Overview of official hats <official-hats.html#idp63772752>`__
6.1. `Process summary: adding a new
committer <model-processes.html#idp63953616>`__
6.2. `Process summary: removing a
committer <model-processes.html#idp63962192>`__
6.3. `Process summary: A committer commits
code <committing.html#idp64022608>`__
6.4. `Process summary: A contributor commits
code <committing.html#idp64026960>`__
6.5. `Process summary: Core
elections <process-core-election.html#idp64070096>`__
6.6. `J?rgenssen's model for change
integration <model-maintenance.html#idp64122576>`__
6.7. `Process summary: problem reporting <model-pr.html#idp64157648>`__
6.8. `Process summary: release
engineering <process-release-engineering.html#idp64244048>`__
8.1. `Number of ports added between 1996 and
2005 <sub-projects.html#fig-ports>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------+
| ?   | ?   | ?\ `Next <foreword.html>`__   |
+-----+-----+-------------------------------+
| ?   | ?   | ?Foreword                     |
+-----+-----+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
