============================
5.2.?MAINTAINER on Makefiles
============================

.. raw:: html

   <div class="navheader">

5.2.?\ ``MAINTAINER`` on Makefiles
`Prev <policies.html>`__?
Chapter?5.?Source Tree Guidelines and Policies
?\ `Next <policies-contributed.html>`__

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

5.2.?\ ``MAINTAINER`` on Makefiles
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If a particular portion of the FreeBSD ``src/`` distribution is being
maintained by a person or group of persons, this is communicated through
an entry in the ``src/MAINTAINERS`` file. Maintainers of ports within
the Ports Collection express their maintainership to the world by adding
a ``MAINTAINER`` line to the ``Makefile`` of the port in question:

.. code:: programlisting

    MAINTAINER= email-addresses

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

For other parts of the repository, or for sections not listed as having
a maintainer, or when you are unsure who the active maintainer is, try
looking at the recent commit history of the relevant parts of the source
tree. It is quite often the case that a maintainer is not explicitly
named, but the people who are actively working in a part of the source
tree for, say, the last couple of years are interested in reviewing
changes. Even if this is not specifically mentioned in the documentation
or the source itself, asking for a review as a form of courtesy is a
very reasonable thing to do.

.. raw:: html

   </div>

The role of the maintainer is as follows:

.. raw:: html

   <div class="itemizedlist">

-  The maintainer owns and is responsible for that code. This means that
   he or she is responsible for fixing bugs and answering problem
   reports pertaining to that piece of the code, and in the case of
   contributed software, for tracking new versions, as appropriate.

-  Changes to directories which have a maintainer defined shall be sent
   to the maintainer for review before being committed. Only if the
   maintainer does not respond for an unacceptable period of time, to
   several emails, will it be acceptable to commit changes without
   review by the maintainer. However, it is suggested that you try to
   have the changes reviewed by someone else if at all possible.

-  It is of course not acceptable to add a person or group as maintainer
   unless they agree to assume this duty. On the other hand it does not
   have to be a committer and it can easily be a group of people.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+--------------------------+-------------------------------------------+
| `Prev <policies.html>`__?                         | `Up <policies.html>`__   | ?\ `Next <policies-contributed.html>`__   |
+---------------------------------------------------+--------------------------+-------------------------------------------+
| Chapter?5.?Source Tree Guidelines and Policies?   | `Home <index.html>`__    | ?5.3.?Contributed Software                |
+---------------------------------------------------+--------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
