=============
9.2.?Portlint
=============

.. raw:: html

   <div class="navheader">

9.2.?Portlint
`Prev <testing.html>`__?
Chapter?9.?Testing the Port
?\ `Next <testing-porttools.html>`__

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

9.2.?Portlint
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Do check the port with ```portlint`` <porting-portlint.html>`__ before
submitting or committing it. ``portlint`` warns about many common
errors, both functional and stylistic. For a new (or repocopied) port,
``portlint -A`` is the most thorough; for an existing port,
``portlint -C`` is sufficient.

Since ``portlint`` uses heuristics to try to figure out errors, it can
produce false positive warnings. In addition, occasionally something
that is flagged as a problem really cannot be done in any other way due
to limitations in the ports framework. When in doubt, the best thing to
do is ask on `FreeBSD ports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+----------------------------------------+
| `Prev <testing.html>`__?       | `Up <testing.html>`__   | ?\ `Next <testing-porttools.html>`__   |
+--------------------------------+-------------------------+----------------------------------------+
| Chapter?9.?Testing the Port?   | `Home <index.html>`__   | ?9.3.?Port Tools                       |
+--------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
