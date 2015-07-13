==========
3.6.?Trust
==========

.. raw:: html

   <div class="navheader">

3.6.?Trust
`Prev <secure-chroot.html>`__?
Chapter?3.?Secure Programming
?\ `Next <secure-race-conditions.html>`__

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

3.6.?Trust
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An application should never assume that anything about the users
environment is sane. This includes (but is certainly not limited to):
user input, signals, environment variables, resources, IPC, mmaps, the
filesystem working directory, file descriptors, the # of open files,
etc.

You should never assume that you can catch all forms of invalid input
that a user might supply. Instead, your application should use positive
filtering to only allow a specific subset of inputs that you deem safe.
Improper data validation has been the cause of many exploits, especially
with CGI scripts on the world wide web. For filenames you need to be
extra careful about paths ("../", "/"), symbolic links, and shell escape
characters.

Perl has a really cool feature called "Taint" mode which can be used to
prevent scripts from using data derived outside the program in an unsafe
way. This mode will check command line arguments, environment variables,
locale information, the results of certain syscalls (``readdir()``,
``readlink()``, ``getpwxxx()``), and all file input.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------+---------------------------------------------+
| `Prev <secure-chroot.html>`__?              | `Up <secure.html>`__    | ?\ `Next <secure-race-conditions.html>`__   |
+---------------------------------------------+-------------------------+---------------------------------------------+
| 3.5.?Limiting your program's environment?   | `Home <index.html>`__   | ?3.7.?Race Conditions                       |
+---------------------------------------------+-------------------------+---------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
