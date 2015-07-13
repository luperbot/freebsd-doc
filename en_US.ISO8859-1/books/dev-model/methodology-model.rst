============================
Chapter?4.?Methodology model
============================

.. raw:: html

   <div class="navheader">

Chapter?4.?Methodology model
`Prev <model-orgstruct.html>`__?
?
?\ `Next <release-branches.html>`__

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

`4.1. Development model <methodology-model.html#development-model>`__
`4.2. Release branches <release-branches.html>`__
`4.3. Model summary <model-summary.html>`__

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

4.1.?Development model
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There is no defined model for how people write code in FreeBSD. However,
Niels J?rgenssen has suggested a model of how written code is integrated
into the project.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?4.1.?J?rgenssen's model for change integration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|J?rgenssen's model for change integration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

The “development release” is the FreeBSD-CURRENT ("-CURRENT") branch and
the “production release” is the FreeBSD-STABLE branch ("-STABLE")
[`J?rgensen, 2001 <bibliography.html#jorgensen2001>`__].

This is a model for one change, and shows that after coding, developers
seek community review and try integrating it with their own systems.
After integrating the change into the development release, called
FreeBSD-CURRENT, it is tested by many users and developers in the
FreeBSD community. After it has gone through enough testing, it is
merged into the production release, called FreeBSD-STABLE. Unless each
stage is finished successfully, the developer needs to go back and make
modifications in the code and restart the process. To integrate a change
with either -CURRENT or -STABLE is called making a commit.

J?rgensen found that most FreeBSD developers work individually, meaning
that this model is used in parallel by many developers on the different
ongoing development efforts. A developer can also be working on multiple
changes, so that while he is waiting for review or people to test one or
more of his changes, he may be writing another change.

As each commit represents an increment, this is a massively incremental
model. The commits are in fact so frequent that during one year
`:sup:`[3]` <#ftn.idp63849040>`__ , 85427 commits were made, making a
daily average of 233 commits.

Within the “code” bracket in J?rgensen's figure, each programmer has his
own working style and follows his own development models. The bracket
could very well have been called “development” as it includes
requirements gathering and analysis, system and detailed design,
implementation and verification. However, the only output from these
stages is the source code or system documentation.

From a stepwise model's perspective (such as the waterfall model), the
other brackets can be seen as further verification and system
integration. This system integration is also important to see if a
change is accepted by the community. Up until the code is committed, the
developer is free to choose how much to communicate about it to the rest
of the project. In order for -CURRENT to work as a buffer (so that
bright ideas that had some undiscovered drawbacks can be backed out) the
minimum time a commit should be in -CURRENT before merging it to -STABLE
is 3 days. Such a merge is referred to as an MFC (Merge From Current).

It is important to notice the word “change”. Most commits do not contain
radical new features, but are maintenance updates.

The only exceptions from this model are security fixes and changes to
features that are deprecated in the -CURRENT branch. In these cases,
changes can be committed directly to the -STABLE branch.

In addition to many people working on the project, there are many
related projects to the FreeBSD Project. These are either projects
developing brand new features, sub-projects or projects whose outcome is
incorporated into FreeBSD `:sup:`[4]` <#ftn.idp63875920>`__. These
projects fit into the FreeBSD Project just like regular development
efforts: they produce code that is integrated with the FreeBSD Project.
However, some of them (like Ports and Documentation) have the privilege
of being applicable to both branches or commit directly to both -CURRENT
and -STABLE.

There is no standards to how design should be done, nor is design
collected in a centralised repository. The main design is that of
4.4BSD. `:sup:`[5]` <#ftn.idp63878480>`__ As design is a part of the
“Code” bracket in J?rgenssen's model, it is up to every developer or
sub-project how this should be done. Even if the design should be stored
in a central repository, the output from the design stages would be of
limited use as the differences of methodologies would make them poorly
if at all interoperable. For the overall design of the project, the
project relies on the sub-projects to negotiate fit interfaces between
each other rather than to dictate interfacing.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp63849040" class="footnote">

`:sup:`[3]` <#idp63849040>`__ The period from January 1st, 2004 to
December 31st, 2004 was examined to find this number.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp63875920" class="footnote">

`:sup:`[4]` <#idp63875920>`__ For instance, the development of the
Bluetooth stack started as a sub-project until it was deemed stable
enough to be merged into the -CURRENT branch. Now it is a part of the
core FreeBSD system.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp63878480" class="footnote">

`:sup:`[5]` <#idp63878480>`__ According to Kirk McKusick, after 20 years
of developing UNIX operating systems, the interfaces are for the most
part figured out. There is therefore no need for much design. However,
new applications of the system and new hardware leads to some
implementations being more beneficial than those that used to be
preferred. One example is the introduction of web browsing that made the
normal TCP/IP connection a short burst of data rather than a steady
stream over a longer period of time.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+---------------------------------------+
| `Prev <model-orgstruct.html>`__?       | ?                       | ?\ `Next <release-branches.html>`__   |
+----------------------------------------+-------------------------+---------------------------------------+
| Chapter?3.?Organisational structure?   | `Home <index.html>`__   | ?4.2.?Release branches                |
+----------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |J?rgenssen's model for change integration| image:: maintenance.png
