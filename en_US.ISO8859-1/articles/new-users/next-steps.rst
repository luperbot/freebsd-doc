=============
7.?Next Steps
=============

.. raw:: html

   <div class="navheader">

7.?Next Steps
`Prev <other-useful-commands.html>`__?
?
?\ `Next <your-working-environment.html>`__

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

7.?Next Steps
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

You should now have the tools you need to get around and edit files, so
you can get everything up and running. There is a great deal of
information in the FreeBSD handbook (which is probably on your hard
drive) and `FreeBSD's web site <../../../../index.html>`__. A wide
variety of packages and ports are on the CDROM as well as the web site.
The handbook tells you more about how to use them (get the package if it
exists, with ``pkg_add       /cdrom/packages/All/packagename``, where
*``packagename``* is the filename of the package). The CDROM has lists
of the packages and ports with brief descriptions in
``cdrom/packages/index``, ``cdrom/packages/index.txt``, and
``cdrom/ports/index``, with fuller descriptions in
``/cdrom/ports/*/*/pkg/DESCR``, where the ``*``\ s represent
subdirectories of kinds of programs and program names respectively.

If you find the handbook too sophisticated (what with ``lndir`` and all)
on installing ports from the CDROM, here is what usually works:

Find the port you want, say ``kermit``. There will be a directory for it
on the CDROM. Copy the subdirectory to ``/usr/local`` (a good place for
software you add that should be available to all users) with:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cp -R /cdrom/ports/comm/kermit /usr/local

.. raw:: html

   </div>

This should result in a ``/usr/local/kermit`` subdirectory that has all
the files that the ``kermit`` subdirectory on the CDROM has.

Next, create the directory ``/usr/ports/distfiles`` if it does not
already exist using ``mkdir``. Now check ``/cdrom/ports/distfiles`` for
a file with a name that indicates it is the port you want. Copy that
file to ``/usr/ports/distfiles``; in recent versions you can skip this
step, as FreeBSD will do it for you. In the case of ``kermit``, there is
no distfile.

Then ``cd`` to the subdirectory of ``/usr/local/kermit`` that has the
file ``Makefile``. Type

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # make all install

.. raw:: html

   </div>

During this process the port will FTP to get any compressed files it
needs that it did not find on the CDROM or in ``/usr/ports/distfiles``.
If you do not have your network running yet and there was no file for
the port in ``/cdrom/ports/distfiles``, you will have to get the
distfile using another machine and copy it to ``/usr/ports/distfiles``.
Read ``Makefile`` (with ``cat`` or ``more`` or ``view``) to find out
where to go (the master distribution site) to get the file and what its
name is. (Use binary file transfers!) Then go back to
``/usr/local/kermit``, find the directory with ``Makefile``, and type
``make all install``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+-----------------------------------------------+
| `Prev <other-useful-commands.html>`__?   | ?                       | ?\ `Next <your-working-environment.html>`__   |
+------------------------------------------+-------------------------+-----------------------------------------------+
| 6.?Other Useful Commands?                | `Home <index.html>`__   | ?8.?Your Working Environment                  |
+------------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
