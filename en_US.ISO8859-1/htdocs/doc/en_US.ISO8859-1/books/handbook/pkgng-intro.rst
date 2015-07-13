============================================
5.4.?Using pkg for Binary Package Management
============================================

.. raw:: html

   <div class="navheader">

5.4.?Using pkg for Binary Package Management
`Prev <ports-finding-applications.html>`__?
Chapter?5.?Installing Applications: Packages and Ports
?\ `Next <ports-using.html>`__

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

5.4.?Using pkg for Binary Package Management
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

pkg is the next generation replacement for the traditional FreeBSD
package management tools, offering many features that make dealing with
binary packages faster and easier.

pkg is not a replacement for port management tools like
`ports-mgmt/portmaster <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmaster/pkg-descr>`__
or
`ports-mgmt/portupgrade <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portupgrade/pkg-descr>`__.
These tools can be used to install third-party software from both binary
packages and the Ports Collection, while pkg installs only binary
packages.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.1.?Getting Started with pkg
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD?8.4 and later includes a bootstrap utility which can be used to
download and install pkg, along with its manual pages.

To bootstrap the system, run:

.. code:: screen

    # /usr/sbin/pkg

For earlier FreeBSD versions, pkg must instead be installed from the
Ports Collection or as a binary package.

To install the port, run:

.. code:: screen

    # cd /usr/ports/ports-mgmt/pkg
    # make
    # make install clean

When upgrading an existing system that originally used the older package
system, the database must be converted to the new format, so that the
new tools are aware of the already installed packages. Once pkg has been
installed, the package database must be converted from the traditional
format to the new format by running this command:

.. code:: screen

    # pkg2ng

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This step is not required for new installations that do not yet have any
third-party software installed.

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

This step is not reversible. Once the package database has been
converted to the pkg format, the traditional ``pkg_*`` tools should no
longer be used.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The package database conversion may emit errors as the contents are
converted to the new version. Generally, these errors can be safely
ignored. However, a list of third-party software that was not
successfully converted will be listed after ``pkg2ng`` has finished and
these applications must be manually reinstalled.

.. raw:: html

   </div>

To ensure that the FreeBSD?Ports Collection registers new software with
pkg, and not the traditional packages format, FreeBSD versions earlier
than 10.\ *``X``* require this line in ``/etc/make.conf``:

.. code:: programlisting

    WITH_PKGNG=    yes

By default pkg uses the FreeBSD package mirrors. For information about
building a custom package repository, see `Section?5.6, “Building
Packages with Poudriere” <ports-poudriere.html>`__

Additional pkg configuration options are described in
`pkg.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg.conf&sektion=5>`__.

Usage information for pkg is available in the
`pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__
manpage or by running ``pkg`` without additional arguments.

Each pkg command argument is documented in a command-specific manual
page. To read the manual page for ``pkg install``, for example, run
either of these commands:

.. code:: screen

    # pkg help install

.. code:: screen

    # man pkg-install

The rest of this section demonstrates common binary package management
tasks which can be performed using pkg. Each demonstrated command
provides many switches to customize its use. Refer to a command's help
or man page for details and more examples.

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

5.4.2.?Obtaining Information About Installed Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Information about the packages installed on a system can be viewed by
running ``pkg info`` which, when run without any switches, will list the
package version for either all installed packages or the specified
package.

For example, to see which version of pkg is installed, run:

.. code:: screen

    # pkg info pkg
    pkg-1.1.4_1

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

5.4.3.?Installing and Removing Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To install a binary package use the following command, where
*``packagename``* is the name of the package to install:

.. code:: screen

    # pkg install packagename

This command uses repository data to determine which version of the
software to install and if it has any uninstalled dependencies. For
example, to install curl:

.. code:: screen

    # pkg install curl
    Updating repository catalogue
    /usr/local/tmp/All/curl-7.31.0_1.txz          100% of 1181 kB 1380 kBps 00m01s

    /usr/local/tmp/All/ca_root_nss-3.15.1_1.txz   100% of  288 kB 1700 kBps 00m00s

    Updating repository catalogue
    The following 2 packages will be installed:

            Installing ca_root_nss: 3.15.1_1
            Installing curl: 7.31.0_1

    The installation will require 3 MB more space

    0 B to be downloaded

    Proceed with installing packages [y/N]: y
    Checking integrity... done
    [1/2] Installing ca_root_nss-3.15.5_1... done
    [2/2] Installing curl-7.31.0_1... done
    Cleaning up cache files...Done

The new package and any additional packages that were installed as
dependencies can be seen in the installed packages list:

.. code:: screen

    # pkg info
    ca_root_nss-3.15.5_1    The root certificate bundle from the Mozilla Project
    curl-7.31.0_1   Non-interactive tool to get files from FTP, GOPHER, HTTP(S) servers
    pkg-1.1.4_6 New generation package manager

Packages that are no longer needed can be removed with ``pkg delete``.
For example:

.. code:: screen

    # pkg delete curl
    The following packages will be deleted:

        curl-7.31.0_1

    The deletion will free 3 MB

    Proceed with deleting packages [y/N]: y
    [1/1] Deleting curl-7.31.0_1... done

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

5.4.4.?Upgrading Installed Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Installed packages can be upgraded to their latest versions by running:

.. code:: screen

    # pkg upgrade

This command will compare the installed versions with those available in
the repository catalogue and upgrade them from the repository.

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

5.4.5.?Auditing Installed Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Occasionally, software vulnerabilities may be discovered in third-party
applications. To address this, pkg includes a built-in auditing
mechanism. To determine if there are any known vulnerabilities for the
software installed on the system, run:

.. code:: screen

    # pkg audit -F

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

5.4.6.?Automatically Removing Leaf Dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Removing a package may leave behind dependencies which are no longer
required. Unneeded packages that were installed as dependencies can be
automatically detected and removed using:

.. code:: screen

    # pkg autoremove
    Packages to be autoremoved:
        ca_root_nss-3.13.5

    The autoremoval will free 723 kB

    Proceed with autoremoval of packages [y/N]: y
    Deinstalling ca_root_nss-3.15.1_1... done

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

5.4.7.?Restoring the Package Database
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unlike the traditional package management system, pkg includes its own
package database backup mechanism. This functionality is enabled by
default.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

To disable the periodic script from backing up the package database, set
``daily_backup_pkgdb_enable="NO"`` in
`periodic.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic.conf&sektion=5>`__.

.. raw:: html

   </div>

To restore the contents of a previous package database backup, run the
following command replacing *``/path/to/pkg.sql``* with the location of
the backup:

.. code:: screen

    # pkg backup -r /path/to/pkg.sql

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If restoring a backup taken by the periodic script, it must be
decompressed prior to being restored.

.. raw:: html

   </div>

To run a manual backup of the pkg database, run the following command,
replacing *``/path/to/pkg.sql``* with a suitable file name and location:

.. code:: screen

    # pkg backup -d /path/to/pkg.sql

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

5.4.8.?Removing Stale Packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, pkg stores binary packages in a cache directory defined by
``PKG_CACHEDIR`` in
`pkg.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg.conf&sektion=5>`__.
Only copies of the latest installed packages are kept. Older versions of
pkg kept all previous packages. To remove these outdated binary
packages, run:

.. code:: screen

    # pkg clean

The entire cache may be cleared by running:

.. code:: screen

    # pkg clean -a

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

5.4.9.?Modifying Package Metadata
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Software within the FreeBSD?Ports Collection can undergo major version
number changes. To address this, pkg has a built-in command to update
package origins. This can be useful, for example, if
`lang/php5 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5/pkg-descr>`__
is renamed to
`lang/php53 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php53/pkg-descr>`__
so that
`lang/php5 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5/pkg-descr>`__
can now represent version ``5.4``.

To change the package origin for the above example, run:

.. code:: screen

    # pkg set -o lang/php5:lang/php53

As another example, to update
`lang/ruby18 <http://www.freebsd.org/cgi/url.cgi?ports/lang/ruby18/pkg-descr>`__
to
`lang/ruby19 <http://www.freebsd.org/cgi/url.cgi?ports/lang/ruby19/pkg-descr>`__,
run:

.. code:: screen

    # pkg set -o lang/ruby18:lang/ruby19

As a final example, to change the origin of the ``libglut`` shared
libraries from
`graphics/libglut <http://www.freebsd.org/cgi/url.cgi?ports/graphics/libglut/pkg-descr>`__
to
`graphics/freeglut <http://www.freebsd.org/cgi/url.cgi?ports/graphics/freeglut/pkg-descr>`__,
run:

.. code:: screen

    # pkg set -o graphics/libglut:graphics/freeglut

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When changing package origins, it is important to reinstall packages
that are dependent on the package with the modified origin. To force a
reinstallation of dependent packages, run:

.. code:: screen

    # pkg install -Rf graphics/freeglut

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------+------------------------------------+
| `Prev <ports-finding-applications.html>`__?   | `Up <ports.html>`__     | ?\ `Next <ports-using.html>`__     |
+-----------------------------------------------+-------------------------+------------------------------------+
| 5.3.?Finding Software?                        | `Home <index.html>`__   | ?5.5.?Using the Ports Collection   |
+-----------------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
