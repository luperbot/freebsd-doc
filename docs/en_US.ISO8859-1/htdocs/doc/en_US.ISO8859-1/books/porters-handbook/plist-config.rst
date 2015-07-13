========================
7.3.?Configuration Files
========================

.. raw:: html

   <div class="navheader">

7.3.?Configuration Files
`Prev <plist-cleaning.html>`__?
Chapter?7.?Advanced ``pkg-plist`` Practices
?\ `Next <plist-dynamic.html>`__

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

7.3.?Configuration Files
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port installs configuration files to ``PREFIX/etc`` (or
elsewhere) do *not* list them in ``pkg-plist``. That will cause
``pkg delete`` to remove files that have been carefully edited by the
user, and a re-installation will wipe them out.

Instead, install sample files with a ``filename``.sample extension. The
``@sample`` macro automates this, see `Section?7.6.7, “\ ``@sample``
*``file``*\ ” <plist-keywords.html#plist-keywords-sample>`__ for what it
does exactly. For each sample file, add a line to ``pkg-plist``:

.. code:: programlisting

    @sample etc/orbit.conf.sample

If there is a very good reason not to install a working configuration
file by default, only list the sample filename in ``pkg-plist``, without
the ``@sample     `` part, and add a
`message <pkg-files.html#porting-message>`__ pointing out that the user
must copy and edit the file before the software will work.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

When a port installs its configuration in a subdirectory of
``${PREFIX}/etc``, use ``ETCDIR``, which defaults to
``${PREFIX}/etc/${PORTNAME}``, it can be overridden in the ports
``Makefile`` if there is a convention for the port to use some other
directory. The ``%%ETCDIR%%`` macro will be used in its stead in
``pkg-plist``.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The sample configuration files should always have the ``.sample``
suffix. If for some historical reason using the standard suffix is not
possible, use this construct:

.. code:: programlisting

    @unexec if cmp -s %D/etc/orbit.conf-dist %D/etc/orbit.conf; then rm -f %D/etc/orbit.conf; fi
    etc/orbit.conf-dist
    @exec if [ ! -f %D/etc/orbit.conf ] ; then cp -p %D/%F %B/orbit.conf; fi

The order of these lines is important. On deinstallation, the sample
file is compared to the actual configuration file. If these files are
identical, no changes have been made by the user and the actual file can
be safely deleted. Because the sample file must still exist for the
comparison, the ``@unexec`` line comes before the sample configuration
file name. On installation, if an actual configuration file is not
already present, the sample file is copied to the actual file. The
sample file must be present before it can be copied, so the ``@exec``
line comes after the sample configuration file name.

To debug any issues, temporarily remove the ``-s`` flag to
`cmp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cmp&sektion=1>`__ for
more output.

See
`pkg-create(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-create&sektion=8>`__
for more information on ``%D`` and related substitution markers.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+--------------------------------------------+
| `Prev <plist-cleaning.html>`__?   | `Up <plist.html>`__     | ?\ `Next <plist-dynamic.html>`__           |
+-----------------------------------+-------------------------+--------------------------------------------+
| 7.2.?Empty Directories?           | `Home <index.html>`__   | ?7.4.?Dynamic Versus Static Package List   |
+-----------------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
