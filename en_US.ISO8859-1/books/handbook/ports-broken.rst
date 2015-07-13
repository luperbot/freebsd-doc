==============================
5.8.?Dealing with Broken Ports
==============================

.. raw:: html

   <div class="navheader">

5.8.?Dealing with Broken Ports
`Prev <ports-nextsteps.html>`__?
Chapter?5.?Installing Applications: Packages and Ports
?\ `Next <x11.html>`__

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

5.8.?Dealing with Broken Ports
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When a port does not build or install, try the following:

.. raw:: html

   <div class="orderedlist">

#. Search to see if there is a fix pending for the port in the `Problem
   Report database <../../../../support.html>`__. If so, implementing
   the proposed fix may fix the issue.

#. Ask the maintainer of the port for help. Type ``make maintainer`` in
   the ports skeleton or read the port's ``Makefile`` to find the
   maintainer's email address. Remember to include the ``$FreeBSD:``
   line from the port's ``Makefile`` and the output leading up to the
   error in the email to the maintainer.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Some ports are not maintained by an individual but instead by a
   `mailing
   list <../../../../doc/en_US.ISO8859-1/articles/mailing-list-faq/article.html>`__.
   Many, but not all, of these addresses look like
   ``<freebsd-listname@FreeBSD.org>``. Take this into account when
   sending an email.

   In particular, ports shown as maintained by ``<ports@FreeBSD.org>``
   are not maintained by a specific individual. Instead, any fixes and
   support come from the general community who subscribe to that mailing
   list. More volunteers are always needed!

   .. raw:: html

      </div>

   If there is no response to the email, use Bugzilla to submit a bug
   report using the instructions in `Writing FreeBSD Problem
   Reports <../../../../doc/en_US.ISO8859-1/articles/problem-reports/article.html>`__.

#. Fix it! The `Porter's
   Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook/index.html>`__
   includes detailed information on the ports infrastructure so that you
   can fix the occasional broken port or even submit your own!

#. Install the package instead of the port using the instructions in
   `Section?5.4, “Using pkg for Binary Package
   Management” <pkgng-intro.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+-----------------------------------+
| `Prev <ports-nextsteps.html>`__?         | `Up <ports.html>`__     | ?\ `Next <x11.html>`__            |
+------------------------------------------+-------------------------+-----------------------------------+
| 5.7.?Post-Installation Considerations?   | `Home <index.html>`__   | ?Chapter?6.?The X Window System   |
+------------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
