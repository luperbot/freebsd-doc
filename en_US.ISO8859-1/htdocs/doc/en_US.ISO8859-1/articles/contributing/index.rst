=======================
Contributing to FreeBSD
=======================

.. raw:: html

   <div class="navheader">

Contributing to FreeBSD
?
?
?\ `Next <contrib-how.html>`__

--------------

.. raw:: html

   </div>

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

Jordan Hubbard
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Sam Lawrance
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Mark Linimon
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

`Legal Notice <trademarks.html>`__

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

This article describes the different ways in which an individual or
organization may contribute to the FreeBSD Project.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

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

`1. What Is Needed <index.html#contrib-what>`__
`2. How to Contribute <contrib-how.html>`__
`3. Contributing to ports <ports-contributing.html>`__
`Index <ix01.html>`__

.. raw:: html

   </div>

So you want to contribute to FreeBSD? That is great! FreeBSD *relies* on
the contributions of its user base to survive. Your contributions are
not only appreciated, they are vital to FreeBSD's continued growth.

A large and growing number of international contributors, of greatly
varying ages and areas of technical expertise, develop FreeBSD. There is
always more work to be done than there are people available to do it,
and more help is always appreciated.

As a volunteer, what you do is limited only by what you want to do.
However, we do ask that you are aware of what other members of the
FreeBSD community will expect of you. You may want to take this into
account before deciding to volunteer.

The FreeBSD project is responsible for an entire operating system
environment, rather than just a kernel or a few scattered utilities. As
such, our ``TODO`` lists span a very wide range of tasks: from
documentation, beta testing and presentation, to the system installer
and highly specialized types of kernel development. People of any skill
level, in almost any area, can almost certainly help the project.

Commercial entities engaged in FreeBSD-related enterprises are also
encouraged to contact us. Do you need a special extension to make your
product work? You will find us receptive to your requests, given that
they are not too outlandish. Are you working on a value-added product?
Please let us know! We may be able to work cooperatively on some aspect
of it. The free software world is challenging many existing assumptions
about how software is developed, sold, and maintained, and we urge you
to at least give it a second look.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.?What Is Needed
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following list of tasks and sub-projects represents something of an
amalgam of various ``TODO`` lists and user requests.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.1.?Ongoing Non-Programmer Tasks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many people who are involved in FreeBSD are not programmers. The Project
includes documentation writers, Web designers, and support people. All
that these people need to contribute is an investment of time and a
willingness to learn.

.. raw:: html

   <div class="orderedlist">

#. Read through the FAQ and Handbook periodically. If anything is badly
   explained, out of date or even just completely wrong, let us know.
   Even better, send us a fix (Docbook is not difficult to learn, but
   there is no objection to ASCII submissions).

#. Help translate FreeBSD documentation into your native language. If
   documentation already exists for your language, you can help
   translate additional documents or verify that the translations are
   up-to-date. First take a look at the `Translations
   FAQ <../../../../doc/en_US.ISO8859-1/books/fdp-primer/translations.html>`__
   in the FreeBSD Documentation Project Primer. You are not committing
   yourself to translating every single FreeBSD document by doing this —
   as a volunteer, you can do as much or as little translation as you
   desire. Once someone begins translating, others almost always join
   the effort. If you only have the time or energy to translate one part
   of the documentation, please translate the installation instructions.

#. Read the `FreeBSD general questions mailing
   list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__
   occasionally (or even regularly). It can be very satisfying to share
   your expertise and help people solve their problems; sometimes you
   may even learn something new yourself! These forums can also be a
   source of ideas for things to work on.

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

1.2.?Ongoing Programmer Tasks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most of the tasks listed here require either a considerable investment
of time, or an in-depth knowledge of the FreeBSD kernel, or both.
However, there are also many useful tasks which are suitable for
“weekend hackers”.

.. raw:: html

   <div class="orderedlist">

#. If you run FreeBSD-CURRENT and have a good Internet connection, there
   is a machine ``current.FreeBSD.org`` which builds a full release once
   a day—every now and again, try to install the latest release from it
   and report any failures in the process.

#. Read the `FreeBSD problem reports mailing
   list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-bugs>`__.
   There might be a problem you can comment constructively on or with
   patches you can test. Or you could even try to fix one of the
   problems yourself.

#. If you know of any bug fixes which have been successfully applied to
   -CURRENT but have not been merged into -STABLE after a decent
   interval (normally a couple of weeks), send the committer a polite
   reminder.

#. Move contributed software to ``src/contrib`` in the source tree.

#. Make sure code in ``src/contrib`` is up to date.

#. Build the source tree (or just part of it) with extra warnings
   enabled and clean up the warnings.

#. Fix warnings for ports which do deprecated things like using
   ``gets()`` or including ``malloc.h``.

#. If you have contributed any ports and you had to make
   FreeBSD-specific changes, send your patches back to the original
   authors (this will make your life easier when they bring out the next
   version).

#. Get copies of formal standards like POSIX?. Compare FreeBSD's
   behavior to that required by the standard. If the behavior differs,
   particularly in subtle or obscure corners of the specification, send
   in a PR about it. If you are able, figure out how to fix it and
   include a patch in the PR. If you think the standard is wrong, ask
   the standards body to consider the question.

#. Suggest further tasks for this list!

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

1.3.?Work through the PR Database
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `FreeBSD PR list <https://bugs.FreeBSD.org/search/>`__ shows all the
current active problem reports and requests for enhancement that have
been submitted by FreeBSD users. The PR database includes both
programmer and non-programmer tasks. Look through the open PRs, and see
if anything there takes your interest. Some of these might be very
simple tasks that just need an extra pair of eyes to look over them and
confirm that the fix in the PR is a good one. Others might be much more
complex, or might not even have a fix included at all.

Start with the PRs that have not been assigned to anyone else. If a PR
is assigned to someone else, but it looks like something you can handle,
email the person it is assigned to and ask if you can work on it—they
might already have a patch ready to be tested, or further ideas that you
can discuss with them.

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

1.4.?Ongoing Ports Tasks
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Ports Collection is a perpetual work in progress. We want to provide
our users with an easy to use, up to date, high quality repository of
third party software. We need people to donate some of their time and
effort to help us achieve this goal.

Anyone can get involved, and there are lots of different ways to do so.
Contributing to ports is an excellent way to help “give?back” something
to the project. Whether you are looking for an ongoing role, or a fun
challenge for a rainy day, we would love to have your help!

There are a number of easy ways you can contribute to keeping the ports
tree up to date and in good working order:

.. raw:: html

   <div class="itemizedlist">

-  Find some cool or useful software and `create a
   port <../../../../doc/en_US.ISO8859-1/books/porters-handbook>`__ for
   it.

-  There are a large number of ports that have no maintainer. Become a
   maintainer and `adopt a port <ports-contributing.html#adopt-port>`__.

-  If you have created or adopted a port, be aware of `what you need to
   do as a maintainer <ports-contributing.html#maintain-port>`__.

-  When you are looking for a quick challenge you could `fix a bug or a
   broken port <ports-contributing.html#fix-broken>`__.

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

1.5.?Pick one of the items from the Ideas page
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `FreeBSD list of projects and ideas for
volunteers <http://wiki.freebsd.org/IdeasPage>`__ is also available for
people willing to contribute to the FreeBSD project. The list is being
regularly updated and contains items for both programmers and
non-programmers with information about each project.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+----------------------------------+
| ?   | ?   | ?\ `Next <contrib-how.html>`__   |
+-----+-----+----------------------------------+
| ?   | ?   | ?2.?How to Contribute            |
+-----+-----+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
