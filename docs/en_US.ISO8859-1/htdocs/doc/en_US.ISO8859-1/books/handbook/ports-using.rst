===============================
5.5.?Using the Ports Collection
===============================

.. raw:: html

   <div class="navheader">

5.5.?Using the Ports Collection
`Prev <pkgng-intro.html>`__?
Chapter?5.?Installing Applications: Packages and Ports
?\ `Next <ports-poudriere.html>`__

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

5.5.?Using the Ports Collection
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Ports Collection is a set of ``Makefiles``, patches, and description
files stored in ``/usr/ports``. This set of files is used to compile and
install applications on FreeBSD. Before an application can be compiled
using a port, the Ports Collection must first be installed. If it was
not installed during the installation of FreeBSD, use one of the
following methods to install it:

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?5.1.?Portsnap Method

.. raw:: html

   </div>

The base system of FreeBSD includes Portsnap. This is a fast and
user-friendly tool for retrieving the Ports Collection and is the
recommended choice for most users. This utility connects to a FreeBSD
site, verifies the secure key, and downloads a new copy of the Ports
Collection. The key is used to verify the integrity of all downloaded
files.

#. To download a compressed snapshot of the Ports Collection into
   ``/var/db/portsnap``:

   .. code:: screen

       # portsnap fetch

#. When running Portsnap for the first time, extract the snapshot into
   ``/usr/ports``:

   .. code:: screen

       # portsnap extract

#. After the first use of Portsnap has been completed as shown above,
   ``/usr/ports`` can be updated as needed by running:

   .. code:: screen

       # portsnap fetch
       # portsnap update

   When using ``fetch``, the ``extract`` or the ``update`` operation may
   be run consecutively, like so:

   .. code:: screen

       # portsnap fetch update

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?5.2.?Subversion Method

.. raw:: html

   </div>

If more control over the ports tree is needed or if local changes need
to be maintained, Subversion can be used to obtain the Ports Collection.
Refer to `the Subversion
Primer <../../../../doc/en_US.ISO8859-1/articles/committers-guide/subversion-primer.html>`__
for a detailed description of Subversion.

#. Subversion must be installed before it can be used to check out the
   ports tree. If a copy of the ports tree is already present, install
   Subversion like this:

   .. code:: screen

       # cd /usr/ports/devel/subversion
       # make install clean

   If the ports tree is not available, or pkg is being used to manage
   packages, Subversion can be installed as a package:

   .. code:: screen

       # pkg install subversion

#. Check out a copy of the ports tree. For better performance, replace
   *``svn0.us-east.FreeBSD.org``* with a `Subversion
   mirror <svn.html#svn-mirrors>`__ close to your geographic location:

   .. code:: screen

       # svn checkout https://svn0.us-east.FreeBSD.org/ports/head /usr/ports

#. As needed, update ``/usr/ports`` after the initial Subversion
   checkout:

   .. code:: screen

       # svn update /usr/ports

.. raw:: html

   </div>

The Ports Collection installs a series of directories representing
software categories with each category having a subdirectory for each
application. Each subdirectory, also referred to as a ports skeleton,
contains a set of files that tell FreeBSD how to compile and install
that program. Each port skeleton includes these files and directories:

.. raw:: html

   <div class="itemizedlist">

-  ``Makefile``: contains statements that specify how the application
   should be compiled and where its components should be installed.

-  ``distinfo``: contains the names and checksums of the files that must
   be downloaded to build the port.

-  ``files/``: this directory contains any patches needed for the
   program to compile and install on FreeBSD. This directory may also
   contain other files used to build the port.

-  ``pkg-descr``: provides a more detailed description of the program.

-  ``pkg-plist``: a list of all the files that will be installed by the
   port. It also tells the ports system which files to remove upon
   deinstallation.

.. raw:: html

   </div>

Some ports include ``pkg-message`` or other files to handle special
situations. For more details on these files, and on ports in general,
refer to the `FreeBSD Porter's
Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook/index.html>`__.

The port does not include the actual source code, also known as a
``distfile``. The extract portion of building a port will automatically
save the downloaded source to ``/usr/ports/distfiles``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.5.1.?Installing Ports
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section provides basic instructions on using the Ports Collection
to install or remove software. The detailed description of available
``make`` targets and environment variables is available in
`ports(7) <http://www.FreeBSD.org/cgi/man.cgi?query=ports&sektion=7>`__.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Before compiling any port, be sure to update the Ports Collection as
described in the previous section. Since the installation of any
third-party software can introduce security vulnerabilities, it is
recommended to first check http://vuxml.freebsd.org/ for known security
issues related to the port. Alternately, run ``pkg audit -F`` before
installing a new port. This command can be configured to automatically
perform a security audit and an update of the vulnerability database
during the daily security system check. For more information, refer to
`pkg-audit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-audit&sektion=8>`__
and
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__.

.. raw:: html

   </div>

Using the Ports Collection assumes a working Internet connection. It
also requires superuser privilege.

To compile and install the port, change to the directory of the port to
be installed, then type ``make       install`` at the prompt. Messages
will indicate the progress:

.. code:: screen

    # cd /usr/ports/sysutils/lsof
    # make install
    >> lsof_4.88D.freebsd.tar.gz doesn't seem to exist in /usr/ports/distfiles/.
    >> Attempting to fetch from ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/.
    ===>  Extracting for lsof-4.88
    ...
    [extraction output snipped]
    ...
    >> Checksum OK for lsof_4.88D.freebsd.tar.gz.
    ===>  Patching for lsof-4.88.d,8
    ===>  Applying FreeBSD patches for lsof-4.88.d,8
    ===>  Configuring for lsof-4.88.d,8
    ...
    [configure output snipped]
    ...
    ===>  Building for lsof-4.88.d,8
    ...
    [compilation output snipped]
    ...

    ===>  Installing for lsof-4.88.d,8
    ...
    [installation output snipped]
    ...
    ===>   Generating temporary packing list
    ===>   Compressing manual pages for lsof-4.88.d,8
    ===>   Registering installation for lsof-4.88.d,8
    ===>  SECURITY NOTE:
          This port has installed the following binaries which execute with
          increased privileges.
    /usr/local/sbin/lsof
    #

Since ``lsof`` is a program that runs with increased privileges, a
security warning is displayed as it is installed. Once the installation
is complete, the prompt will be returned.

Some shells keep a cache of the commands that are available in the
directories listed in the ``PATH`` environment variable, to speed up
lookup operations for the executable file of these commands. Users of
the ``tcsh`` shell should type ``rehash`` so that a newly installed
command can be used without specifying its full path. Use ``hash -r``
instead for the ``sh`` shell. Refer to the documentation for the shell
for more information.

During installation, a working subdirectory is created which contains
all the temporary files used during compilation. Removing this directory
saves disk space and minimizes the chance of problems later when
upgrading to the newer version of the port:

.. code:: screen

    # make clean
    ===>  Cleaning for lsof-88.d,8
    #

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

To save this extra step, instead use ``make         install clean`` when
compiling the port.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.5.1.1.?Customizing Ports Installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some ports provide build options which can be used to enable or disable
application components, provide security options, or allow for other
customizations. Examples include
`www/firefox <http://www.freebsd.org/cgi/url.cgi?ports/www/firefox/pkg-descr>`__,
`security/gpgme <http://www.freebsd.org/cgi/url.cgi?ports/security/gpgme/pkg-descr>`__,
and
`mail/sylpheed-claws <http://www.freebsd.org/cgi/url.cgi?ports/mail/sylpheed-claws/pkg-descr>`__.
If the port depends upon other ports which have configurable options, it
may pause several times for user interaction as the default behavior is
to prompt the user to select options from a menu. To avoid this, run
``make         config-recursive`` within the port skeleton to do this
configuration in one batch. Then, run ``make         install [clean]``
to compile and install the port.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

When using ``config-recursive``, the list of ports to configure are
gathered by the ``all-depends-list`` target. It is recommended to run
``make           config-recursive`` until all dependent ports options
have been defined, and ports options screens no longer appear, to be
certain that all dependency options have been configured.

.. raw:: html

   </div>

There are several ways to revisit a port's build options menu in order
to add, remove, or change these options after a port has been built. One
method is to ``cd`` into the directory containing the port and type
``make config``. Another option is to use ``make showconfig``. Another
option is to execute ``make         rmconfig`` which will remove all
selected options and allow you to start over. All of these options, and
others, are explained in great detail in
`ports(7) <http://www.FreeBSD.org/cgi/man.cgi?query=ports&sektion=7>`__.

The ports system uses
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1>`__
to download the source files, which supports various environment
variables. The ``FTP_PASSIVE_MODE``, ``FTP_PROXY``, and ``FTP_PASSWORD``
variables may need to be set if the FreeBSD system is behind a firewall
or FTP/HTTP proxy. See
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__
for the complete list of supported variables.

For users who cannot be connected to the Internet all the time,
``make fetch`` can be run within ``/usr/ports``, to fetch all distfiles,
or within a category, such as ``/usr/ports/net``, or within the specific
port skeleton. Note that if a port has any dependencies, running this
command in a category or ports skeleton will *not* fetch the distfiles
of ports from another category. Instead, use
``make         fetch-recursive`` to also fetch the distfiles for all the
dependencies of a port.

In rare cases, such as when an organization has a local distfiles
repository, the ``MASTER_SITES`` variable can be used to override the
download locations specified in the ``Makefile``. When using, specify
the alternate location:

.. code:: screen

    # cd /usr/ports/directory
    # make MASTER_SITE_OVERRIDE= \
    ftp://ftp.organization.org/pub/FreeBSD/ports/distfiles/ fetch

The ``WRKDIRPREFIX`` and ``PREFIX`` variables can override the default
working and target directories. For example:

.. code:: screen

    # make WRKDIRPREFIX=/usr/home/example/ports install

will compile the port in ``/usr/home/example/ports`` and install
everything under ``/usr/local``.

.. code:: screen

    # make PREFIX=/usr/home/example/local install

will compile the port in ``/usr/ports`` and install it in
``/usr/home/example/local``. And:

.. code:: screen

    # make WRKDIRPREFIX=../ports PREFIX=../local install

will combine the two.

These can also be set as environmental variables. Refer to the manual
page for your shell for instructions on how to set an environmental
variable.

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

5.5.2.?Removing Installed Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Installed ports can be uninstalled using ``pkg       delete``. Examples
for using this command can be found in the
`pkg-delete(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-delete&sektion=8>`__
manpage.

Alternately, ``make deinstall`` can be run in the port's directory:

.. code:: screen

    # cd /usr/ports/sysutils/lsof
    make deinstall
    ===>  Deinstalling for sysutils/lsof
    ===>   Deinstalling
    Deinstallation has been requested for the following 1 packages:

        lsof-4.88.d,8

    The deinstallation will free 229 kB
    [1/1] Deleting lsof-4.88.d,8... done

It is recommended to read the messages as the port is uninstalled. If
the port has any applications that depend upon it, this information will
be displayed but the uninstallation will proceed. In such cases, it may
be better to reinstall the application in order to prevent broken
dependencies.

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

5.5.3.?Upgrading Ports
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Over time, newer versions of software become available in the Ports
Collection. This section describes how to determine which software can
be upgraded and how to perform the upgrade.

To determine if newer versions of installed ports are available, ensure
that the latest version of the ports tree is installed, using the
updating command described in either `Procedure?5.1, “Portsnap
Method” <ports-using.html#ports-using-portsnap-method>`__ or
`Procedure?5.2, “Subversion
Method” <ports-using.html#ports-using-subversion-method>`__. On FreeBSD
10 and later, or if the system has been converted to pkg, the following
command will list the installed ports which are out of date:

.. code:: screen

    # pkg version -l "<"

For FreeBSD 9.\ *``X``* and lower, the following command will list the
installed ports that are out of date:

.. code:: screen

    # pkg_version -l "<"

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Before attempting an upgrade, read ``/usr/ports/UPDATING`` from the top
of the file to the date closest to the last time ports were upgraded or
the system was installed. This file describes various issues and
additional steps users may encounter and need to perform when updating a
port, including such things as file format changes, changes in locations
of configuration files, or any incompatibilities with previous versions.
Make note of any instructions which match any of the ports that need
upgrading and follow these instructions when performing the upgrade.

.. raw:: html

   </div>

To perform the actual upgrade, use either Portmaster or Portupgrade.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.5.3.1.?Upgrading Ports Using Portmaster
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`ports-mgmt/portmaster <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmaster/pkg-descr>`__
package or port is the recommended tool for upgrading installed ports as
it is designed to use the tools installed with FreeBSD without depending
upon other ports. It uses the information in ``/var/db/pkg/`` to
determine which ports to upgrade. To install this utility as a port:

.. code:: screen

    # cd /usr/ports/ports-mgmt/portmaster
    # make install clean

Portmaster defines four categories of ports:

.. raw:: html

   <div class="itemizedlist">

-  Root port: has no dependencies and is not a dependency of any other
   ports.

-  Trunk port: has no dependencies, but other ports depend upon it.

-  Branch port: has dependencies and other ports depend upon it.

-  Leaf port: has dependencies but no other ports depend upon it.

.. raw:: html

   </div>

To list these categories and search for updates:

.. code:: screen

    # portmaster -L
    ===>>> Root ports (No dependencies, not depended on)
    ===>>> ispell-3.2.06_18
    ===>>> screen-4.0.3
            ===>>> New version available: screen-4.0.3_1
    ===>>> tcpflow-0.21_1
    ===>>> 7 root ports
    ...
    ===>>> Branch ports (Have dependencies, are depended on)
    ===>>> apache22-2.2.3
            ===>>> New version available: apache22-2.2.8
    ...
    ===>>> Leaf ports (Have dependencies, not depended on)
    ===>>> automake-1.9.6_2
    ===>>> bash-3.1.17
            ===>>> New version available: bash-3.2.33
    ...
    ===>>> 32 leaf ports

    ===>>> 137 total installed ports
            ===>>> 83 have new versions available

This command is used to upgrade all outdated ports:

.. code:: screen

    # portmaster -a

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

By default, Portmaster will make a backup package before deleting the
existing port. If the installation of the new version is successful,
Portmaster will delete the backup. Using ``-b`` will instruct Portmaster
not to automatically delete the backup. Adding ``-i`` will start
Portmaster in interactive mode, prompting for confirmation before
upgrading each port. Many other options are available. Read through the
manual page for portmaster(8) for details regarding their usage.

.. raw:: html

   </div>

If errors are encountered during the upgrade process, add ``-f`` to
upgrade and rebuild all ports:

.. code:: screen

    # portmaster -af

Portmaster can also be used to install new ports on the system,
upgrading all dependencies before building and installing the new port.
To use this function, specify the location of the port in the Ports
Collection:

.. code:: screen

    # portmaster shells/bash

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.5.3.2.?Upgrading Ports Using Portupgrade
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Another utility that can be used to upgrade ports is Portupgrade, which
is available as the
`ports-mgmt/portupgrade <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portupgrade/pkg-descr>`__
package or port. This utility installs a suite of applications which can
be used to manage ports. However, it is dependent upon Ruby. To install
the port:

.. code:: screen

    # cd /usr/ports/ports-mgmt/portupgrade
    # make install clean

Before performing an upgrade using this utility, it is recommended to
scan the list of installed ports using ``pkgdb -F`` and to fix all the
inconsistencies it reports.

To upgrade all the outdated ports installed on the system, use
``portupgrade -a``. Alternately, include ``-i`` to be asked for
confirmation of every individual upgrade:

.. code:: screen

    # portupgrade -ai

To upgrade only a specified application instead of all available ports,
use ``portupgrade         pkgname``. It is very important to include
``-R`` to first upgrade all the ports required by the given application:

.. code:: screen

    # portupgrade -R firefox

If ``-P`` is included, Portupgrade searches for available packages in
the local directories listed in ``PKG_PATH``. If none are available
locally, it then fetches packages from a remote site. If packages can
not be found locally or fetched remotely, Portupgrade will use ports. To
avoid using ports entirely, specify ``-PP``. This last set of options
tells Portupgrade to abort if no packages are available:

.. code:: screen

    # portupgrade -PP gnome2

To just fetch the port distfiles, or packages, if ``-P`` is specified,
without building or installing anything, use ``-F``. For further
information on all of the available switches, refer to the manual page
for ``portupgrade``.

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

5.5.4.?Ports and Disk Space
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Using the Ports Collection will use up disk space over time. After
building and installing a port, running ``make clean`` within the ports
skeleton will clean up the temporary ``work`` directory. If Portmaster
is used to install a port, it will automatically remove this directory
unless ``-K`` is specified. If Portupgrade is installed, this command
will remove all ``work`` directories found within the local copy of the
Ports Collection:

.. code:: screen

    # portsclean -C

In addition, a lot of out-dated source distribution files will collect
in ``/usr/ports/distfiles`` over time. If Portupgrade is installed, this
command will delete all the distfiles that are no longer referenced by
any ports:

.. code:: screen

    # portsclean -D

To use Portupgrade to remove all distfiles not referenced by any port
currently installed on the system:

.. code:: screen

    # portsclean -DD

If Portmaster is installed, use:

.. code:: screen

    # portmaster --clean-distfiles

By default, this command is interactive and will prompt the user to
confirm if a distfile should be deleted.

In addition to these commands, the
`ports-mgmt/pkg\_cutleaves <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/pkg_cutleaves/pkg-descr>`__
package or port automates the task of removing installed ports that are
no longer needed.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+-------------------------+------------------------------------------+
| `Prev <pkgng-intro.html>`__?                    | `Up <ports.html>`__     | ?\ `Next <ports-poudriere.html>`__       |
+-------------------------------------------------+-------------------------+------------------------------------------+
| 5.4.?Using pkg for Binary Package Management?   | `Home <index.html>`__   | ?5.6.?Building Packages with Poudriere   |
+-------------------------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
