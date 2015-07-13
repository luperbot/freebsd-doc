===============
3.?Preparations
===============

.. raw:: html

   <div class="navheader">

3.?Preparations
`Prev <pr-when.html>`__?
?
?\ `Next <pr-writing.html>`__

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

3.?Preparations
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A good rule to follow is to always do a background search before
submitting a problem report. Maybe the problem has already been
reported; maybe it is being discussed on the mailing lists, or recently
was; it may even already be fixed in a newer version than what you are
running. You should therefore check all the obvious places before
submitting your problem report. For FreeBSD, this means:

.. raw:: html

   <div class="itemizedlist">

-  The FreeBSD `Frequently Asked
   Questions <../../../../doc/en_US.ISO8859-1/books/faq/index.html>`__
   (FAQ) list. The FAQ attempts to provide answers for a wide range of
   questions, such as those concerning `hardware
   compatibility <../../../../doc/en_US.ISO8859-1/books/faq/hardware.html>`__,
   `user
   applications <../../../../doc/en_US.ISO8859-1/books/faq/applications.html>`__,
   and `kernel
   configuration <../../../../doc/en_US.ISO8859-1/books/faq/kernelconfig.html>`__.

-  The `mailing
   lists <../../../../doc/en_US.ISO8859-1/books/handbook/eresources.html#ERESOURCES-MAIL>`__—if
   you are not subscribed, use `the searchable
   archives <http://www.FreeBSD.org/search/search.html#mailinglists>`__
   on the FreeBSD web site. If the problem has not been discussed on the
   lists, you might try posting a message about it and waiting a few
   days to see if someone can spot something that has been overlooked.

-  Optionally, the entire web—use your favorite search engine to locate
   any references to the problem. You may even get hits from archived
   mailing lists or newsgroups you did not know of or had not thought to
   search through.

-  Next, the searchable `FreeBSD PR
   database <https://bugs.freebsd.org/bugzilla/query.cgi>`__ (Bugzilla).
   Unless the problem is recent or obscure, there is a fair chance it
   has already been reported.

-  Most importantly, attempt to see if existing documentation in the
   source base addresses your problem.

   For the base FreeBSD code, you should carefully study the contents of
   ``/usr/src/UPDATING`` on your system or the latest version at
   ``http://svnweb.freebsd.org/base/head/UPDATING?view=log``. (This is
   vital information if you are upgrading from one version to
   another—especially if you are upgrading to the FreeBSD-CURRENT
   branch).

   However, if the problem is in something that was installed as a part
   of the FreeBSD Ports Collection, you should refer to
   ``/usr/ports/UPDATING`` (for individual ports) or
   ``/usr/ports/CHANGES`` (for changes that affect the entire Ports
   Collection).
   ``http://svnweb.freebsd.org/ports/head/UPDATING?view=log`` and
   ``http://svnweb.freebsd.org/ports/head/CHANGES?view=log`` are also
   available via svnweb.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+----------------------------------+
| `Prev <pr-when.html>`__?              | ?                       | ?\ `Next <pr-writing.html>`__    |
+---------------------------------------+-------------------------+----------------------------------+
| 2.?When to Submit a Problem Report?   | `Home <index.html>`__   | ?4.?Writing the Problem Report   |
+---------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
