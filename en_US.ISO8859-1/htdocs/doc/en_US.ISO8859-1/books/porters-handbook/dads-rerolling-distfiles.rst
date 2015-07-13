==========================
12.17.?Rerolling Distfiles
==========================

.. raw:: html

   <div class="navheader">

12.17.?Rerolling Distfiles
`Prev <dads-sysctl.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-avoiding-linuxisms.html>`__

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

12.17.?Rerolling Distfiles
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sometimes the authors of software change the content of released
distfiles without changing the file's name. Verify that the changes are
official and have been performed by the author. It has happened in the
past that the distfile was silently altered on the download servers with
the intent to cause harm or compromise end user security.

Put the old distfile aside, download the new one, unpack them and
compare the content with
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__.
If there is nothing suspicious, update ``distinfo``. Be sure to
summarize the differences in the PR or commit log, so that other people
know that nothing bad has happened.

Contact the authors of the software and confirm the changes with them.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+------------------------------+----------------------------------------------+
| `Prev <dads-sysctl.html>`__?   | `Up <porting-dads.html>`__   | ?\ `Next <dads-avoiding-linuxisms.html>`__   |
+--------------------------------+------------------------------+----------------------------------------------+
| 12.16.?Usage of ``sysctl``?    | `Home <index.html>`__        | ?12.18.?Avoiding Linuxisms                   |
+--------------------------------+------------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
