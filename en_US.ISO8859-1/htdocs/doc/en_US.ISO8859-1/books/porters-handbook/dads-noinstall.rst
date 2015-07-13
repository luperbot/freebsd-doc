=======================================================================
12.13.?Marking a Port Not Installable with BROKEN, FORBIDDEN, or IGNORE
=======================================================================

.. raw:: html

   <div class="navheader">

12.13.?Marking a Port Not Installable with ``BROKEN``, ``FORBIDDEN``, or
``IGNORE``
`Prev <dads-arch-neutral.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-deprecated.html>`__

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

12.13.?Marking a Port Not Installable with ``BROKEN``, ``FORBIDDEN``, or ``IGNORE``
-----------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In certain cases, users must be prevented from installing a port. There
are several variables that can be used in a port's ``Makefile`` to tell
the user that the port cannot be installed. The value of these make
variables will be the reason that is shown to users for why the port
refuses to install itself. Please use the correct make variable. Each
variable conveys radically different meanings, both to users and to
automated systems that depend on ``Makefile``\ s, such as `the ports
build cluster <build-cluster.html>`__,
`FreshPorts <keeping-up.html#freshports>`__, and
`portsmon <portsmon.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.13.1.?Variables
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``BROKEN`` is reserved for ports that currently do not compile,
   install, deinstall, or run correctly. Use it for ports where the
   problem is believed to be temporary.

   If instructed, the build cluster will still attempt to try to build
   them to see if the underlying problem has been resolved. (However, in
   general, the cluster is run without this.)

   For instance, use ``BROKEN`` when a port:

   .. raw:: html

      <div class="itemizedlist">

   -  does not compile

   -  fails its configuration or installation process

   -  installs files outside of ``${PREFIX}``

   -  does not remove all its files cleanly upon deinstall (however, it
      may be acceptable, and desirable, for the port to leave
      user-modified files behind)

   -  has runtime issues on systems where it is supposed to run fine.

   .. raw:: html

      </div>

-  ``FORBIDDEN`` is used for ports that contain a security vulnerability
   or induce grave concern regarding the security of a FreeBSD system
   with a given port installed (for example, a reputably insecure
   program or a program that provides easily exploitable services). Mark
   ports as ``FORBIDDEN`` as soon as a particular piece of software has
   a vulnerability and there is no released upgrade. Ideally upgrade
   ports as soon as possible when a security vulnerability is discovered
   so as to reduce the number of vulnerable FreeBSD hosts (we like being
   known for being secure), however sometimes there is a noticeable time
   gap between disclosure of a vulnerability and an updated release of
   the vulnerable software. Do not mark a port ``FORBIDDEN`` for any
   reason other than security.

-  ``IGNORE`` is reserved for ports that must not be built for some
   other reason. Use it for ports where the problem is believed to be
   structural. The build cluster will not, under any circumstances,
   build ports marked as ``IGNORE``. For instance, use ``IGNORE`` when a
   port:

   .. raw:: html

      <div class="itemizedlist">

   -  does not work on the installed version of FreeBSD

   -  has a distfile which may not be automatically fetched due to
      licensing restrictions

   -  does not work with some other currently installed port (for
      instance, the port depends on
      `www/apache20 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache20/pkg-descr>`__
      but
      `www/apache22 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache22/pkg-descr>`__
      is installed)

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   If a port would conflict with a currently installed port (for
   example, if they install a file in the same place that performs a
   different function), `use ``CONFLICTS`` instead <conflicts.html>`__.
   ``CONFLICTS`` will set ``IGNORE`` by itself.

   .. raw:: html

      </div>

-  To mark a port as ``IGNORE``\ d only on certain architectures, there
   are two other convenience variables that will automatically set
   ``IGNORE``: ``ONLY_FOR_ARCHS`` and ``NOT_FOR_ARCHS``. Examples:

   .. code:: programlisting

       ONLY_FOR_ARCHS=   i386 amd64

   .. code:: programlisting

       NOT_FOR_ARCHS=  ia64 sparc64

   A custom ``IGNORE`` message can be set using
   ``ONLY_FOR_ARCHS_REASON`` and ``NOT_FOR_ARCHS_REASON``. Per
   architecture entries are possible with ``ONLY_FOR_ARCHS_REASON_ARCH``
   and ``NOT_FOR_ARCHS_REASON_ARCH``.

-  If a port fetches i386 binaries and installs them, set
   ``IA32_BINARY_PORT``. If this variable is set, ``/usr/lib32`` must be
   present for IA32 versions of libraries and the kernel must support
   IA32 compatibility. If one of these two dependencies is not
   satisfied, ``IGNORE`` will be set automatically.

.. raw:: html

   </div>

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

12.13.2.?Implementation Notes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Do not quote the values of ``BROKEN``, ``IGNORE``, and related
variables. Due to the way the information is shown to the user, the
wording of messages for each variable differ:

.. code:: programlisting

    BROKEN=   fails to link with base -lcrypto

.. code:: programlisting

    IGNORE=   unsupported on recent versions

resulting in this output from ``make describe``:

.. code:: programlisting

    ===>  foobar-0.1 is marked as broken: fails to link with base -lcrypto.

.. code:: programlisting

    ===>  foobar-0.1 is unsupported on recent versions.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+------------------------------+---------------------------------------------------------------------------------+
| `Prev <dads-arch-neutral.html>`__?               | `Up <porting-dads.html>`__   | ?\ `Next <dads-deprecated.html>`__                                              |
+--------------------------------------------------+------------------------------+---------------------------------------------------------------------------------+
| 12.12.?Marking a Port as Architecture Neutral?   | `Home <index.html>`__        | ?12.14.?Marking a Port for Removal with ``DEPRECATED`` or ``EXPIRATION_DATE``   |
+--------------------------------------------------+------------------------------+---------------------------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
