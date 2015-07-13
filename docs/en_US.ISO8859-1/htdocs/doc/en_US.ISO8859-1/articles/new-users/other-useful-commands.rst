========================
6.?Other Useful Commands
========================

.. raw:: html

   <div class="navheader">

6.?Other Useful Commands
`Prev <editing-text.html>`__?
?
?\ `Next <next-steps.html>`__

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

6.?Other Useful Commands
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

``df``
    shows file space and mounted systems.

``ps aux``
    shows processes running. ``ps ax`` is a narrower form.

``rm filename``
    remove *``filename``*.

``rm -R dir``
    removes a directory *``dir``* and all subdirectories—careful!

``ls -R``
    lists files in the current directory and all subdirectories; I used
    a variant, ``ls -AFR >           where.txt``, to get a list of all
    the files in ``/`` and (separately) ``/usr`` before I found better
    ways to find files.

``passwd``
    to change user's password (or ``root``'s password)

``man hier``
    manual page on the UNIX? filesystem

.. raw:: html

   </div>

Use ``find`` to locate ``filename`` in ``/usr`` or any of its
subdirectories with

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % find /usr -name "filename"

.. raw:: html

   </div>

You can use ``*`` as a wildcard in *``"filename``*" (which should be in
quotes). If you tell ``find`` to search in ``/`` instead of ``/usr`` it
will look for the file(s) on all mounted filesystems, including the
CDROM and the DOS partition.

An excellent book that explains UNIX? commands and utilities is Abrahams
& Larson, *Unix for the Impatient* (2nd ed., Addison-Wesley, 1996).
There is also a lot of UNIX? information on the Internet.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+---------------------------------+
| `Prev <editing-text.html>`__?   | ?                       | ?\ `Next <next-steps.html>`__   |
+---------------------------------+-------------------------+---------------------------------+
| 5.?Editing Text?                | `Home <index.html>`__   | ?7.?Next Steps                  |
+---------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
