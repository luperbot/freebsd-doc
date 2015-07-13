=================================
Chapter?6.?Special Considerations
=================================

.. raw:: html

   <div class="navheader">

Chapter?6.?Special Considerations
`Prev <install.html>`__?
?
?\ `Next <bundled-libs.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`6.1. Staging <special.html#staging>`__
`6.2. Bundled Libraries <bundled-libs.html>`__
`6.3. Shared Libraries <porting-shlibs.html>`__
`6.4. Ports with Distribution Restrictions or Legal
Concerns <porting-restrictions.html>`__
`6.5. Building Mechanisms <building.html>`__
`6.6. Using GNU Autotools <using-autotools.html>`__
`6.7. Using GNU ``gettext`` <using-gettext.html>`__
`6.8. Using Perl <using-perl.html>`__
`6.9. Using X11 <using-x11.html>`__
`6.10. Using GNOME <using-gnome.html>`__
`6.11. Using Qt <using-qt.html>`__
`6.12. Using KDE <using-kde.html>`__
`6.13. Using Java <using-java.html>`__
`6.14. Web Applications, Apache and PHP <using-php.html>`__
`6.15. Using Python <using-python.html>`__
`6.16. Using Tcl/Tk <using-tcl.html>`__
`6.17. Using Emacs <using-emacs.html>`__
`6.18. Using Ruby <using-ruby.html>`__
`6.19. Using SDL <using-sdl.html>`__
`6.20. Using wxWidgets <using-wx.html>`__
`6.21. Using Lua <using-lua.html>`__
`6.22. Using ``iconv`` <using-iconv.html>`__
`6.23. Using Xfce <using-xfce.html>`__
`6.24. Using Mozilla <using-mozilla.html>`__
`6.25. Using Databases <using-databases.html>`__
`6.26. Starting and Stopping Services (``rc``
Scripts) <rc-scripts.html>`__
`6.27. Adding Users and Groups <users-and-groups.html>`__
`6.28. Ports That Rely on Kernel
Sources <requiring-kernel-sources.html>`__

.. raw:: html

   </div>

This section explains the most common things to consider when creating a
port.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.1.?Staging
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``bsd.port.mk`` expects ports to work with a “stage directory”. This
means that a port must not install files directly to the regular
destination directories (that is, under ``PREFIX``, for example) but
instead into a separate directory from which the package is then built.
In many cases, this does not require root privileges, making it possible
to build packages as an unprivileged user. With staging, the port is
built and installed into the stage directory, ``STAGEDIR``. A package is
created from the stage directory and then installed on the system.
Automake tools refer to this concept as ``DESTDIR``, but in FreeBSD,
``DESTDIR`` has a different meaning (see `Section?9.4, “\ ``PREFIX`` and
``DESTDIR``\ ” <porting-prefix.html>`__).

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

No port *really* needs to be root. It can mostly be avoided by using
```USES=uidfix`` <uses.html#uses-uidfix>`__. If the port still runs
commands like
`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8>`__,
`chgrp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chgrp&sektion=1>`__,
or forces owner or group with
`install(1) <http://www.FreeBSD.org/cgi/man.cgi?query=install&sektion=1>`__
then use ```USES=fakeroot`` <uses.html#uses-fakeroot>`__ to fake those
calls. Sligh patching of the port's ``Makefiles`` will be needed.

.. raw:: html

   </div>

Meta ports, or ports that do not install files themselves but only
depend on other ports, must avoid needlessly extracting the
`mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8>`__
to the stage directory. This is the basic directory layout of the
package, and these empty directories will be seen as orphans. To prevent
`mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8>`__
extraction, add this line:

.. code:: programlisting

    NO_MTREE= yes

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

Metaports should use ```USES=metaport`` <uses.html#uses-metaport>`__. It
sets up defaults for ports that do not fetch, build, or install
anything.

.. raw:: html

   </div>

Staging is enabled by prepending ``STAGEDIR`` to paths used in the
``pre-install``, ``do-install``, and ``post-install`` targets (see the
examples through the book). Typically, this includes ``PREFIX``,
``ETCDIR``, ``DATADIR``, ``EXAMPLESDIR``, ``MANPREFIX``, ``DOCSDIR``,
and so on. Directories should be created as part of the ``post-install``
target. Avoid using absolute paths whenever possible.

When creating a symlink, ``STAGEDIR`` is prepended to the target path
only. For example:

.. code:: programlisting

    ${LN} -sf libfoo.so.42 ${STAGEDIR}${PREFIX}/lib/libfoo.so

The source path ``${PREFIX}/lib/libfoo.so.42`` looks fine but could, in
fact, be incorrect. Absolute paths can point to a wrong location, like
when a remote file system has been mounted with NFS under a non-root
mount point. Relative paths are less fragile, and often much shorter.

Ports that install kernel modules must prepend ``STAGEDIR`` to their
destination, by default ``/boot/modules``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+-----------------------------------+
| `Prev <install.html>`__?   | ?                       | ?\ `Next <bundled-libs.html>`__   |
+----------------------------+-------------------------+-----------------------------------+
| 5.15.?Installing Files?    | `Home <index.html>`__   | ?6.2.?Bundled Libraries           |
+----------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
