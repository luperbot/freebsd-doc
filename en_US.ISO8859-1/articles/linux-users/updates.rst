===================
7.?Updating FreeBSD
===================

.. raw:: html

   <div class="navheader">

7.?Updating FreeBSD
`Prev <firewall.html>`__?
?
?\ `Next <procfs.html>`__

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

7.?Updating FreeBSD
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two methods for updating a FreeBSD system: from source or
binary updates.

Updating from source is the most involved update method, but offers the
greatest amount of flexibility. The process involves synchronizing a
local copy of the FreeBSD source code with the FreeBSD Subversion
servers. Once the local source code is up-to-date, a new version of the
kernel and userland can be compiled.

Binary updates are similar to using ``yum`` or ``apt-get`` to update a
Linux? system. In FreeBSD,
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
can be used fetch new binary updates and install them. These updates can
be scheduled using
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When using
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__ to
schedule updates, use ``freebsd-update cron`` in the
`crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1>`__
to reduce the possibility of a large number of machines all pulling
updates at the same time:

.. code:: programlisting

    0 3 * * * root /usr/sbin/freebsd-update cron

.. raw:: html

   </div>

For more information on source and binary updates, refer to `the chapter
on
updating <../../../../doc/en_US.ISO8859-1/books/handbook/updating-upgrading.html>`__
in the FreeBSD Handbook.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+--------------------------------------+
| `Prev <firewall.html>`__?   | ?                       | ?\ `Next <procfs.html>`__            |
+-----------------------------+-------------------------+--------------------------------------+
| 6.?Firewall?                | `Home <index.html>`__   | ?8.?procfs: Gone But Not Forgotten   |
+-----------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
