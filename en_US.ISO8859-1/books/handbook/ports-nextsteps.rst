=====================================
5.7.?Post-Installation Considerations
=====================================

.. raw:: html

   <div class="navheader">

5.7.?Post-Installation Considerations
`Prev <ports-poudriere.html>`__?
Chapter?5.?Installing Applications: Packages and Ports
?\ `Next <ports-broken.html>`__

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

5.7.?Post-Installation Considerations
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Regardless of whether the software was installed from a binary package
or port, most third-party applications require some level of
configuration after installation. The following commands and locations
can be used to help determine what was installed with the application.

.. raw:: html

   <div class="itemizedlist">

-  Most applications install at least one default configuration file in
   ``/usr/local/etc``. In the case where an application has a large
   number of configuration files, a subdirectory will be created to hold
   them. Often, sample configuration files are installed which end with
   a suffix such as ``.sample``. The configuration files should be
   reviewed and possibly edited to meet the system's needs. To edit a
   sample file, first copy it without the ``.sample`` extension.

-  Applications which provide documentation will install it into
   ``/usr/local/share/doc`` and many applications also install manual
   pages. This documentation should be consulted before continuing.

-  Some applications run services which must be added to
   ``/etc/rc.conf`` before starting the application. These applications
   usually install a startup script in ``/usr/local/etc/rc.d``. See
   `Starting Services <configtuning-starting-services.html>`__ for more
   information.

-  Users of
   `csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__
   should run ``rehash`` to rebuild the known binary list in the shells
   ``PATH``.

-  Use ``pkg info`` to determine which files, man pages, and binaries
   were installed with the application.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+-----------------------------------+
| `Prev <ports-poudriere.html>`__?         | `Up <ports.html>`__     | ?\ `Next <ports-broken.html>`__   |
+------------------------------------------+-------------------------+-----------------------------------+
| 5.6.?Building Packages with Poudriere?   | `Home <index.html>`__   | ?5.8.?Dealing with Broken Ports   |
+------------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
