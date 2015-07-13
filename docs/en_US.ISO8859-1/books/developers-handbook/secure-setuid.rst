==================
3.4.?SetUID issues
==================

.. raw:: html

   <div class="navheader">

3.4.?SetUID issues
`Prev <secure-bufferov.html>`__?
Chapter?3.?Secure Programming
?\ `Next <secure-chroot.html>`__

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

3.4.?SetUID issues
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are at least 6 different IDs associated with any given process.
Because of this you have to be very careful with the access that your
process has at any given time. In particular, all seteuid applications
should give up their privileges as soon as it is no longer required.

The real user ID can only be changed by a superuser process. The login
program sets this when a user initially logs in and it is seldom
changed.

The effective user ID is set by the ``exec()`` functions if a program
has its seteuid bit set. An application can call ``seteuid()`` at any
time to set the effective user ID to either the real user ID or the
saved set-user-ID. When the effective user ID is set by ``exec()``
functions, the previous value is saved in the saved set-user-ID.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+---------------------------------------------+
| `Prev <secure-bufferov.html>`__?   | `Up <secure.html>`__    | ?\ `Next <secure-chroot.html>`__            |
+------------------------------------+-------------------------+---------------------------------------------+
| 3.3.?Buffer Overflows?             | `Home <index.html>`__   | ?3.5.?Limiting your program's environment   |
+------------------------------------+-------------------------+---------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
