============================
3.6.?Submitting the New Port
============================

.. raw:: html

   <div class="navheader">

3.6.?Submitting the New Port
`Prev <porting-portlint.html>`__?
Chapter?3.?Quick Porting
?\ `Next <slow-porting.html>`__

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

3.6.?Submitting the New Port
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before submitting the new port, read the `DOs and
DON'Ts <porting-dads.html>`__ section.

Once happy with the port, the only thing remaining is to put it in the
main FreeBSD ports tree and make everybody else happy about it too. We
do not need the ``work`` directory or the ``pkgname.tgz`` package, so
delete them now.

Next, build the
`shar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=shar&sektion=1>`__
file. Assuming the port is called ``oneko``, ``cd`` to the directory
above where the ``oneko`` directory is located, and then type:
``shar `find oneko` > oneko.shar``

To submit ``oneko.shar``, use the `bug submit
form <https://bugs.freebsd.org/submit/>`__ (category ``Ports Tree``).
Add a short description of the program to the Description field of the
PR (perhaps a short version of ``COMMENT``), and do not forget to add
``oneko.shar`` as an attachment.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Giving a good description in the summary of the problem report makes the
work of port committers a lot easier. We prefer something like “New
port: *``category``*/*``portname``*
*``short description of         the port``*” for new ports. Using this
scheme makes it easier and faster to begin the work of committing the
new port.

.. raw:: html

   </div>

One more time, *do not include the original source distfile, the
``work`` directory, or the package built with ``make package``*; and, do
use
`shar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=shar&sektion=1>`__
for new ports, not
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__.

After submitting the port, please be patient. The time needed to include
a new port in FreeBSD can vary from a few days to a few months. The list
of pending port PRs can be viewed at
http://www.FreeBSD.org/cgi/query-pr-summary.cgi?category=ports.

After looking at the new port, we will reply if necessary, and commit it
to the tree. The submitter's name will also be added to the list of
`Additional FreeBSD
Contributors <../../../../doc/en_US.ISO8859-1/articles/contributors/contrib-additional.html>`__
and other files.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------------+-----------------------------------+
| `Prev <porting-portlint.html>`__?           | `Up <quick-porting.html>`__   | ?\ `Next <slow-porting.html>`__   |
+---------------------------------------------+-------------------------------+-----------------------------------+
| 3.5.?Checking the Port with ``portlint``?   | `Home <index.html>`__         | ?Chapter?4.?Slow Porting          |
+---------------------------------------------+-------------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
