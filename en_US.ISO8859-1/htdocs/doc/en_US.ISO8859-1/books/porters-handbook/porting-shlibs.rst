=====================
6.3.?Shared Libraries
=====================

.. raw:: html

   <div class="navheader">

6.3.?Shared Libraries
`Prev <bundled-libs.html>`__?
Chapter?6.?Special Considerations
?\ `Next <porting-restrictions.html>`__

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

6.3.?Shared Libraries
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port installs one or more shared libraries, define a
``USE_LDCONFIG`` make variable, which will instruct a ``bsd.port.mk`` to
run ``${LDCONFIG} -m`` on the directory where the new library is
installed (usually ``PREFIX/lib``) during ``post-install`` target to
register it into the shared library cache. This variable, when defined,
will also facilitate addition of an appropriate
``@exec /sbin/ldconfig -m`` and ``@unexec /sbin/ldconfig -R`` pair into
``pkg-plist``, so that a user who installed the package can start using
the shared library immediately and de-installation will not cause the
system to still believe the library is there.

.. code:: programlisting

    USE_LDCONFIG=  yes

The default directory can be overridden by setting ``USE_LDCONFIG`` to a
list of directories into which shared libraries are to be installed. For
example, if the port installs shared libraries into ``PREFIX/lib/foo``
and ``PREFIX/lib/bar`` use this in ``Makefile``:

.. code:: programlisting

    USE_LDCONFIG=  ${PREFIX}/lib/foo ${PREFIX}/lib/bar

Please double-check, often this is not necessary at all or can be
avoided through ``-rpath`` or setting ``LD_RUN_PATH`` during linking
(see
`lang/moscow\_ml <http://www.freebsd.org/cgi/url.cgi?ports/lang/moscow_ml/pkg-descr>`__
for an example), or through a shell-wrapper which sets
``LD_LIBRARY_PATH`` before invoking the binary, like
`www/seamonkey <http://www.freebsd.org/cgi/url.cgi?ports/www/seamonkey/pkg-descr>`__
does.

When installing 32-bit libraries on 64-bit system, use
``USE_LDCONFIG32`` instead.

If the software uses `autotools <using-autotools.html>`__, and
specifically ``libtool``, add
```USES=libtool`` <uses.html#uses-libtool>`__.

When the major library version number increments in the update to the
new port version, all other ports that link to the affected library must
have their ``PORTREVISION`` incremented, to force recompilation with the
new library version.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+----------------------------------------------------------------+
| `Prev <bundled-libs.html>`__?   | `Up <special.html>`__   | ?\ `Next <porting-restrictions.html>`__                        |
+---------------------------------+-------------------------+----------------------------------------------------------------+
| 6.2.?Bundled Libraries?         | `Home <index.html>`__   | ?6.4.?Ports with Distribution Restrictions or Legal Concerns   |
+---------------------------------+-------------------------+----------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
