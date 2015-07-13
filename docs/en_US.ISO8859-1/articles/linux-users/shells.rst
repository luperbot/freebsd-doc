================
2.?Default Shell
================

.. raw:: html

   <div class="navheader">

2.?Default Shell
`Prev <index.html>`__?
?
?\ `Next <software.html>`__

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

2.?Default Shell
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux? users are often surprised to find that Bash is not the default
shell in FreeBSD. In fact, Bash is not included in the default
installation. Instead, FreeBSD uses
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__ as
the default root shell, and the Bourne shell-compatible
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ as the
default user shell.
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ is
very similar to Bash but with a much smaller feature-set. Generally
shell scripts written for
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ will
run in Bash, but the reverse is not always true.

However, Bash and other shells are available for installation using the
FreeBSD `Packages and Ports
Collection <../../../../doc/en_US.ISO8859-1/books/handbook/ports.html>`__.

After installing another shell, use
`chsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chsh&sektion=1>`__ to
change a user's default shell. It is recommended that the ``root``
user's default shell remain unchanged since shells which are not
included in the base distribution are installed to ``/usr/local/bin``.
In the event of a problem, the file system where ``/usr/local/bin`` is
located may not be mounted. In this case, ``root`` would not have access
to its default shell, preventing ``root`` from logging in and fixing the
problem.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+------------------------------------------------------+
| `Prev <index.html>`__?                       | ?                       | ?\ `Next <software.html>`__                          |
+----------------------------------------------+-------------------------+------------------------------------------------------+
| FreeBSD Quickstart Guide for Linux? Users?   | `Home <index.html>`__   | ?3.?Packages and Ports: Adding Software in FreeBSD   |
+----------------------------------------------+-------------------------+------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
