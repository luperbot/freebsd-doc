=============================================
17.?The FreeBSD Committers' Big List of Rules
=============================================

.. raw:: html

   <div class="navheader">

17.?The FreeBSD Committers' Big List of Rules
`Prev <coverity.html>`__?
?
?\ `Next <archs.html>`__

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

17.?The FreeBSD Committers' Big List of Rules
---------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. Respect other committers.

#. Respect other contributors.

#. Discuss any significant change *before* committing.

#. Respect existing maintainers (if listed in the ``MAINTAINER`` field
   in ``Makefile`` or in ``MAINTAINER`` in the top-level directory).

#. Any disputed change must be backed out pending resolution of the
   dispute if requested by a maintainer. Security related changes may
   override a maintainer's wishes at the Security Officer's discretion.

#. Changes go to FreeBSD-CURRENT before FreeBSD-STABLE unless
   specifically permitted by the release engineer or unless they are not
   applicable to FreeBSD-CURRENT. Any non-trivial or non-urgent change
   which is applicable should also be allowed to sit in FreeBSD-CURRENT
   for at least 3 days before merging so that it can be given sufficient
   testing. The release engineer has the same authority over the
   FreeBSD-STABLE branch as outlined for the maintainer in rule #5.

#. Do not fight in public with other committers; it looks bad. If you
   must “strongly disagree” about something, do so only in private.

#. Respect all code freezes and read the ``committers`` and
   ``developers`` mailing lists in a timely manner so you know when a
   code freeze is in effect.

#. When in doubt on any procedure, ask first!

#. Test your changes before committing them.

#. Do not commit to anything under the ``src/contrib``, ``src/crypto``,
   or ``src/sys/contrib`` trees without *explicit* approval from the
   respective maintainer(s).

.. raw:: html

   </div>

As noted, breaking some of these rules can be grounds for suspension or,
upon repeated offense, permanent removal of commit privileges.
Individual members of core have the power to temporarily suspend commit
privileges until core as a whole has the chance to review the issue. In
case of an “emergency” (a committer doing damage to the repository), a
temporary suspension may also be done by the repository meisters. Only a
2/3 majority of core has the authority to suspend commit privileges for
longer than a week or to remove them permanently. This rule does not
exist to set core up as a bunch of cruel dictators who can dispose of
committers as casually as empty soda cans, but to give the project a
kind of safety fuse. If someone is out of control, it is important to be
able to deal with this immediately rather than be paralyzed by debate.
In all cases, a committer whose privileges are suspended or revoked is
entitled to a “hearing” by core, the total duration of the suspension
being determined at that time. A committer whose privileges are
suspended may also request a review of the decision after 30 days and
every 30 days thereafter (unless the total suspension period is less
than 30 days). A committer whose privileges have been revoked entirely
may request a review after a period of 6 months has elapsed. This review
policy is *strictly informal* and, in all cases, core reserves the right
to either act on or disregard requests for review if they feel their
original decision to be the right one.

In all other aspects of project operation, core is a subset of
committers and is bound by the *same rules*. Just because someone is in
core this does not mean that they have special dispensation to step
outside any of the lines painted here; core's “special powers” only kick
in when it acts as a group, not on an individual basis. As individuals,
the core team members are all committers first and core second.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.1.?Details
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. Respect other committers.

   This means that you need to treat other committers as the peer-group
   developers that they are. Despite our occasional attempts to prove
   the contrary, one does not get to be a committer by being stupid and
   nothing rankles more than being treated that way by one of your
   peers. Whether we always feel respect for one another or not (and
   everyone has off days), we still have to *treat* other committers
   with respect at all times, on public forums and in private email.

   Being able to work together long term is this project's greatest
   asset, one far more important than any set of changes to the code,
   and turning arguments about code into issues that affect our
   long-term ability to work harmoniously together is just not worth the
   trade-off by any conceivable stretch of the imagination.

   To comply with this rule, do not send email when you are angry or
   otherwise behave in a manner which is likely to strike others as
   needlessly confrontational. First calm down, then think about how to
   communicate in the most effective fashion for convincing the other
   person(s) that your side of the argument is correct, do not just blow
   off some steam so you can feel better in the short term at the cost
   of a long-term flame war. Not only is this very bad “energy
   economics”, but repeated displays of public aggression which impair
   our ability to work well together will be dealt with severely by the
   project leadership and may result in suspension or termination of
   your commit privileges. The project leadership will take into account
   both public and private communications brought before it. It will not
   seek the disclosure of private communications, but it will take it
   into account if it is volunteered by the committers involved in the
   complaint.

   All of this is never an option which the project's leadership enjoys
   in the slightest, but unity comes first. No amount of code or good
   advice is worth trading that away.

#. Respect other contributors.

   You were not always a committer. At one time you were a contributor.
   Remember that at all times. Remember what it was like trying to get
   help and attention. Do not forget that your work as a contributor was
   very important to you. Remember what it was like. Do not discourage,
   belittle, or demean contributors. Treat them with respect. They are
   our committers in waiting. They are every bit as important to the
   project as committers. Their contributions are as valid and as
   important as your own. After all, you made many contributions before
   you became a committer. Always remember that.

   Consider the points raised under `1 <rules.html#respect>`__ and apply
   them also to contributors.

#. Discuss any significant change *before* committing.

   The repository is not where changes should be initially submitted for
   correctness or argued over, that should happen first in the mailing
   lists and the commit should only happen once something resembling
   consensus has been reached. This does not mean that you have to ask
   permission before correcting every obvious syntax error or manual
   page misspelling, simply that you should try to develop a feel for
   when a proposed change is not quite such a no-brainer and requires
   some feedback first. People really do not mind sweeping changes if
   the result is something clearly better than what they had before,
   they just do not like being *surprized* by those changes. The very
   best way of making sure that you are on the right track is to have
   your code reviewed by one or more other committers.

   When in doubt, ask for review!

#. Respect existing maintainers if listed.

   Many parts of FreeBSD are not “owned” in the sense that any specific
   individual will jump up and yell if you commit a change to “their”
   area, but it still pays to check first. One convention we use is to
   put a maintainer line in the ``Makefile`` for any package or subtree
   which is being actively maintained by one or more people; see
   `http://www.FreeBSD.org/doc/en\_US.ISO8859-1/books/developers-handbook/policies.html <../../../../doc/en_US.ISO8859-1/books/developers-handbook/policies.html>`__
   for documentation on this. Where sections of code have several
   maintainers, commits to affected areas by one maintainer need to be
   reviewed by at least one other maintainer. In cases where the
   “maintainer-ship” of something is not clear, you can also look at the
   repository logs for the file(s) in question and see if someone has
   been working recently or predominantly in that area.

   Other areas of FreeBSD fall under the control of someone who manages
   an overall category of FreeBSD evolution, such as
   internationalization or networking. See
   `http://www.FreeBSD.org/administration.html <../../../../administration.html>`__
   for more information on this.

#. Any disputed change must be backed out pending resolution of the
   dispute if requested by a maintainer. Security related changes may
   override a maintainer's wishes at the Security Officer's discretion.

   This may be hard to swallow in times of conflict (when each side is
   convinced that they are in the right, of course) but a version
   control system makes it unnecessary to have an ongoing dispute raging
   when it is far easier to simply reverse the disputed change, get
   everyone calmed down again and then try to figure out what is the
   best way to proceed. If the change turns out to be the best thing
   after all, it can be easily brought back. If it turns out not to be,
   then the users did not have to live with the bogus change in the tree
   while everyone was busily debating its merits. People *very* rarely
   call for back-outs in the repository since discussion generally
   exposes bad or controversial changes before the commit even happens,
   but on such rare occasions the back-out should be done without
   argument so that we can get immediately on to the topic of figuring
   out whether it was bogus or not.

#. Changes go to FreeBSD-CURRENT before FreeBSD-STABLE unless
   specifically permitted by the release engineer or unless they are not
   applicable to FreeBSD-CURRENT. Any non-trivial or non-urgent change
   which is applicable should also be allowed to sit in FreeBSD-CURRENT
   for at least 3 days before merging so that it can be given sufficient
   testing. The release engineer has the same authority over the
   FreeBSD-STABLE branch as outlined in rule #5.

   This is another “do not argue about it” issue since it is the release
   engineer who is ultimately responsible (and gets beaten up) if a
   change turns out to be bad. Please respect this and give the release
   engineer your full cooperation when it comes to the FreeBSD-STABLE
   branch. The management of FreeBSD-STABLE may frequently seem to be
   overly conservative to the casual observer, but also bear in mind the
   fact that conservatism is supposed to be the hallmark of
   FreeBSD-STABLE and different rules apply there than in
   FreeBSD-CURRENT. There is also really no point in having
   FreeBSD-CURRENT be a testing ground if changes are merged over to
   FreeBSD-STABLE immediately. Changes need a chance to be tested by the
   FreeBSD-CURRENT developers, so allow some time to elapse before
   merging unless the FreeBSD-STABLE fix is critical, time sensitive or
   so obvious as to make further testing unnecessary (spelling fixes to
   manual pages, obvious bug/typo fixes, etc.) In other words, apply
   common sense.

   Changes to the security branches (for example, ``releng/9.3``) must
   be approved by a member of the Security Officer Team
   ``<security-officer@FreeBSD.org>``, or in some cases, by a member of
   the Release Engineering Team ``<re@FreeBSD.org>``.

#. Do not fight in public with other committers; it looks bad. If you
   must “strongly disagree” about something, do so only in private.

   This project has a public image to uphold and that image is very
   important to all of us, especially if we are to continue to attract
   new members. There will be occasions when, despite everyone's very
   best attempts at self-control, tempers are lost and angry words are
   exchanged. The best thing that can be done in such cases is to
   minimize the effects of this until everyone has cooled back down.
   That means that you should not air your angry words in public and you
   should not forward private correspondence to public mailing lists or
   aliases. What people say one-to-one is often much less sugar-coated
   than what they would say in public, and such communications therefore
   have no place there - they only serve to inflame an already bad
   situation. If the person sending you a flame-o-gram at least had the
   grace to send it privately, then have the grace to keep it private
   yourself. If you feel you are being unfairly treated by another
   developer, and it is causing you anguish, bring the matter up with
   core rather than taking it public. Core will do its best to play
   peace makers and get things back to sanity. In cases where the
   dispute involves a change to the codebase and the participants do not
   appear to be reaching an amicable agreement, core may appoint a
   mutually-agreeable third party to resolve the dispute. All parties
   involved must then agree to be bound by the decision reached by this
   third party.

#. Respect all code freezes and read the ``committers`` and
   ``developers`` mailing list on a timely basis so you know when a code
   freeze is in effect.

   Committing unapproved changes during a code freeze is a really big
   mistake and committers are expected to keep up-to-date on what is
   going on before jumping in after a long absence and committing 10
   megabytes worth of accumulated stuff. People who abuse this on a
   regular basis will have their commit privileges suspended until they
   get back from the FreeBSD Happy Reeducation Camp we run in Greenland.

#. When in doubt on any procedure, ask first!

   Many mistakes are made because someone is in a hurry and just assumes
   they know the right way of doing something. If you have not done it
   before, chances are good that you do not actually know the way we do
   things and really need to ask first or you are going to completely
   embarrass yourself in public. There is no shame in asking “how in the
   heck do I do this?” We already know you are an intelligent person;
   otherwise, you would not be a committer.

#. Test your changes before committing them.

   This may sound obvious, but if it really were so obvious then we
   probably would not see so many cases of people clearly not doing
   this. If your changes are to the kernel, make sure you can still
   compile both GENERIC and LINT. If your changes are anywhere else,
   make sure you can still make world. If your changes are to a branch,
   make sure your testing occurs with a machine which is running that
   code. If you have a change which also may break another architecture,
   be sure and test on all supported architectures. Please refer to the
   `FreeBSD Internal Page <http://www.FreeBSD.org/internal/>`__ for a
   list of available resources. As other architectures are added to the
   FreeBSD supported platforms list, the appropriate shared testing
   resources will be made available.

#. Do not commit to anything under the ``src/contrib``, ``src/crypto``,
   and ``src/sys/contrib`` trees without *explicit* approval from the
   respective maintainer(s).

   The trees mentioned above are for contributed software usually
   imported onto a vendor branch. Committing something there, even if it
   does not take the file off the vendor branch, may cause unnecessary
   headaches for those responsible for maintaining that particular piece
   of software. Thus, unless you have *explicit* approval from the
   maintainer (or you are the maintainer), do *not* commit there!

   Please note that this does not mean you should not try to improve the
   software in question; you are still more than welcome to do so.
   Ideally, you should submit your patches to the vendor. If your
   changes are FreeBSD-specific, talk to the maintainer; they may be
   willing to apply them locally. But whatever you do, do *not* commit
   there by yourself!

   Contact the Core Team ``<core@FreeBSD.org>`` if you wish to take up
   maintainership of an unmaintained part of the tree.

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

17.2.?Policy on Multiple Architectures
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD has added several new architecture ports during recent release
cycles and is truly no longer an i386™ centric operating system. In an
effort to make it easier to keep FreeBSD portable across the platforms
we support, core has developed the following mandate:

.. raw:: html

   <div class="blockquote">

    Our 32-bit reference platform is i386, and our 64-bit reference
    platform is sparc64. Major design work (including major API and ABI
    changes) must prove itself on at least one 32-bit and at least one
    64-bit platform, preferably the primary reference platforms, before
    it may be committed to the source tree.

.. raw:: html

   </div>

The i386 and sparc64 platforms were chosen due to being more readily
available to developers and as representatives of more diverse processor
and system designs - big versus little endian, register file versus
register stack, different DMA and cache implementations, hardware page
tables versus software TLB management etc.

The ia64 platform has many of the same complications that sparc64 has,
but is still limited in availability to developers.

We will continue to re-evaluate this policy as cost and availability of
the 64-bit platforms change.

Developers should also be aware of our Tier Policy for the long term
support of hardware architectures. The rules here are intended to
provide guidance during the development process, and are distinct from
the requirements for features and architectures listed in that section.
The Tier rules for feature support on architectures at release-time are
more strict than the rules for changes during the development process.

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

17.3.?Other Suggestions
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When committing documentation changes, use a spell checker before
committing. For all XML docs, verify that the formatting directives are
correct by running ``make lint`` and
`textproc/igor <http://www.freebsd.org/cgi/url.cgi?ports/textproc/igor/pkg-descr>`__.

For manual pages, run
`sysutils/manck <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/manck/pkg-descr>`__
and
`textproc/igor <http://www.freebsd.org/cgi/url.cgi?ports/textproc/igor/pkg-descr>`__
over the manual page to verify all of the cross references and file
references are correct and that the man page has all of the appropriate
``MLINK``\ s installed.

Do not mix style fixes with new functionality. A style fix is any change
which does not modify the functionality of the code. Mixing the changes
obfuscates the functionality change when asking for differences between
revisions, which can hide any new bugs. Do not include whitespace
changes with content changes in commits to ``doc/`` . The extra clutter
in the diffs makes the translators' job much more difficult. Instead,
make any style or whitespace changes in separate commits that are
clearly labeled as such in the commit message.

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

17.4.?Deprecating Features
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When it is necessary to remove functionality from software in the base
system the following guidelines should be followed whenever possible:

.. raw:: html

   <div class="orderedlist">

#. Mention is made in the manual page and possibly the release notes
   that the option, utility, or interface is deprecated. Use of the
   deprecated feature generates a warning.

#. The option, utility, or interface is preserved until the next major
   (point zero) release.

#. The option, utility, or interface is removed and no longer
   documented. It is now obsolete. It is also generally a good idea to
   note its removal in the release notes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+-------------------------+-------------------------------------------+
| `Prev <coverity.html>`__?                            | ?                       | ?\ `Next <archs.html>`__                  |
+------------------------------------------------------+-------------------------+-------------------------------------------+
| 16.?Coverity? Availability for FreeBSD Committers?   | `Home <index.html>`__   | ?18.?Support for Multiple Architectures   |
+------------------------------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
