=======================
9.4.?PREFIX and DESTDIR
=======================

.. raw:: html

   <div class="navheader">

9.4.?\ ``PREFIX`` and ``DESTDIR``
`Prev <testing-porttools.html>`__?
Chapter?9.?Testing the Port
?\ `Next <testing-poudriere.html>`__

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

9.4.?\ ``PREFIX`` and ``DESTDIR``
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``PREFIX`` determines where the port will be installed. It defaults to
``/usr/local``, but can be set by the user to a custom path like
``/opt``. The port must respect the value of this variable.

``DESTDIR``, if set by the user, determines the complete alternative
environment, usually a jail or an installed system mounted somewhere
other than ``/``. A port will actually install into ``DESTDIR/PREFIX``,
and register with the package database in ``DESTDIR/var/db/pkg``. As
``DESTDIR`` is handled automatically by the ports infrastructure with
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__.
There is no need for modifications or any extra care to write
``DESTDIR``-compliant ports.

The value of ``PREFIX`` will be set to ``LOCALBASE`` (defaulting to
``/usr/local``). If ``USE_LINUX_PREFIX`` is set, ``PREFIX`` will be
``LINUXBASE`` (defaulting to ``/compat/linux``).

Avoiding hard-coded ``/usr/local`` paths in the source makes the port
much more flexible and able to cater to the needs of other sites. Often,
this can be accomplished by replacing occurrences of ``/usr/local`` in
the port's various ``Makefile``\ s with ``${PREFIX}``. This variable is
automatically passed down to every stage of the build and install
processes.

Make sure the application is not installing things in ``/usr/local``
instead of ``PREFIX``. A quick test for such hard-coded paths is:

.. code:: screen

    % make clean; make package PREFIX=/var/tmp/`make -V PORTNAME`

If anything is installed outside of ``PREFIX``, the package creation
process will complain that it cannot find the files.

In addition, it is worth checking the same with the stage directory
support (see `Section?6.1, “Staging” <special.html#staging>`__):

.. code:: screen

    % make stage && make check-plist && make stage-qa && make package

.. raw:: html

   <div class="itemizedlist">

-  ``check-plist`` checks for files missing from the plist, and files in
   the plist that are not installed by the port.

-  ``stage-qa`` checks for common problems like bad shebang, symlinks
   pointing outside the stage directory, setuid files, and non-stripped
   libraries...

.. raw:: html

   </div>

These tests will not find hard-coded paths inside the port's files, nor
will it verify that ``LOCALBASE`` is being used to correctly refer to
files from other ports. The temporarily-installed port in
``/var/tmp/`make -V PORTNAME``` must be tested for proper operation to
make sure there are no problems with paths.

``PREFIX`` must not be set explicitly in a port's ``Makefile``. Users
installing the port may have set ``PREFIX`` to a custom location, and
the port must respect that setting.

Refer to programs and files from other ports with the variables
mentioned above, not explicit pathnames. For instance, if the port
requires a macro ``PAGER`` to have the full pathname of ``less``, do not
use a literal path of ``/usr/local/bin/less``. Instead, use
``${LOCALBASE}``:

.. code:: programlisting

    -DPAGER=\"${LOCALBASE}/bin/less\"

The path with ``LOCALBASE`` is more likely to still work if the system
administrator has moved the whole ``/usr/local`` tree somewhere else.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

All these tests are done automatically when running
``poudriere testport`` or ``poudriere       bulk -t``. It is highly
recommended that every ports contributor install it, and tests all his
ports with it. See `Section?9.5, “Poudriere” <testing-poudriere.html>`__
for more information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+----------------------------------------+
| `Prev <testing-porttools.html>`__?   | `Up <testing.html>`__   | ?\ `Next <testing-poudriere.html>`__   |
+--------------------------------------+-------------------------+----------------------------------------+
| 9.3.?Port Tools?                     | `Home <index.html>`__   | ?9.5.?Poudriere                        |
+--------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
