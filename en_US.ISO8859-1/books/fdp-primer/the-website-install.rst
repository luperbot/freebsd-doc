==========================
6.2.?Install the Web Pages
==========================

.. raw:: html

   <div class="navheader">

6.2.?Install the Web Pages
`Prev <the-website.html>`__?
Chapter?6.?The Website
?\ `Next <the-website-env.html>`__

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

6.2.?Install the Web Pages
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Run ``make install``, setting ``DESTDIR`` to the target directory for
the web site files. The files will be installed in ``$DESTDIR/data``,
which is expected to be the web server's document root.

This installation is run as the ``root`` user because the permissions on
the web server directory will not allow files to be installed by an
unprivileged user. In this example, the web site files were built by
user ``jru`` in their home directory, ``/usr/home/jru/doc``.

.. code:: screen

    # cd /home/jru/doc/en_US.ISO8859-1/htdocs
    # env DESTDIR=/usr/local/www make install

The install process will not delete any old or outdated files that
existed previously in the same directory. If a new copy of the site is
built and installed every day, this command will find and delete all
files that have not been updated in three days.

.. code:: screen

    # find /usr/local/www -ctime 3 -delete

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-----------------------------+--------------------------------------+
| `Prev <the-website.html>`__?   | `Up <the-website.html>`__   | ?\ `Next <the-website-env.html>`__   |
+--------------------------------+-----------------------------+--------------------------------------+
| Chapter?6.?The Website?        | `Home <index.html>`__       | ?6.3.?Environment Variables          |
+--------------------------------+-----------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
