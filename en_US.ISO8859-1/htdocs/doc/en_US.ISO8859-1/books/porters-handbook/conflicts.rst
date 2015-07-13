=======================
5.14.?Conflict Handling
=======================

.. raw:: html

   <div class="navheader">

5.14.?Conflict Handling
`Prev <makefile-wrkdir.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <install.html>`__

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

5.14.?Conflict Handling
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are three different variables to register a conflict between
packages and ports: ``CONFLICTS``, ``CONFLICTS_INSTALL`` and
``CONFLICTS_BUILD``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The conflict variables automatically set the variable ``IGNORE``, which
is more fully documented in `Section?12.13, “Marking a Port Not
Installable with ``BROKEN``, ``FORBIDDEN``, or
``IGNORE``\ ” <dads-noinstall.html>`__.

.. raw:: html

   </div>

When removing one of several conflicting ports, it is advisable to
retain ``CONFLICTS`` in those other ports for a few months to cater for
users who only update once in a while.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.14.1.?\ ``CONFLICTS_INSTALL``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the package cannot coexist with other packages (because of file
conflicts, runtime incompatibilities, etc.), list the other package
names in ``CONFLICTS_INSTALL``. Use shell globs like ``*`` and ``?``
here. Enumerate package names in there, not port names or origins.
Please make sure that ``CONFLICTS_INSTALL`` does not match this port's
package itself. Otherwise enforcing its installation with
``FORCE_PKG_REGISTER`` will no longer work. ``CONFLICTS_INSTALL`` check
is done after the build stage and prior to the install stage.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.14.2.?\ ``CONFLICTS_BUILD``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port cannot be built when other specific ports are already
installed, list the other port names in ``CONFLICTS_BUILD``. Use shell
globs like ``*`` and ``?`` here. Use package names, not port names or
origins. ``CONFLICTS_BUILD`` check is done prior to the build stage.
Build conflicts are not recorded in the resulting package.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.14.3.?\ ``CONFLICTS``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port cannot be built if a certain port is already installed and
the resulting package cannot coexist with the other package, list the
other package name in ``CONFLICTS``. use shell globs like ``*`` and
``?`` here. Enumerate package names in there, not port names or origins.
Please make sure that ``CONFLICTS`` does not match this port's package
itself. Otherwise enforcing its installation with ``FORCE_PKG_REGISTER``
will no longer work. ``CONFLICTS`` check is done prior to the build
stage and prior to the install stage.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------+------------------------------+
| `Prev <makefile-wrkdir.html>`__?          | `Up <makefiles.html>`__   | ?\ `Next <install.html>`__   |
+-------------------------------------------+---------------------------+------------------------------+
| 5.13.?Specifying the Working Directory?   | `Home <index.html>`__     | ?5.15.?Installing Files      |
+-------------------------------------------+---------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
