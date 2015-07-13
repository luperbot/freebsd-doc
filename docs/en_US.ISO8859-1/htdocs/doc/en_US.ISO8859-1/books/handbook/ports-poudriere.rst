=====================================
5.6.?Building Packages with Poudriere
=====================================

.. raw:: html

   <div class="navheader">

5.6.?Building Packages with Poudriere
`Prev <ports-using.html>`__?
Chapter?5.?Installing Applications: Packages and Ports
?\ `Next <ports-nextsteps.html>`__

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

5.6.?Building Packages with Poudriere
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Poudriere is a BSD-licensed utility for creating and testing FreeBSD
packages. It uses FreeBSD jails to set up isolated compilation
environments. These jails can be used to build packages for versions of
FreeBSD that are different from the system on which it is installed, and
also to build packages for i386 if the host is an amd64 system. Once the
packages are built, they are in a layout identical to the official
mirrors. These packages are usable by
`pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__ and
other package management tools.

Poudriere is installed using the
`ports-mgmt/poudriere <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/poudriere/pkg-descr>`__
package or port. The installation includes a sample configuration file
``/usr/local/etc/poudriere.conf.sample``. Copy this file to
``/usr/local/etc/poudriere.conf``. Edit the copied file to suit the
local configuration.

While ZFS is not required on the system running poudriere, it is
beneficial. When ZFS is used, ``ZPOOL`` must be specified in
``/usr/local/etc/poudriere.conf`` and ``FREEBSD_HOST`` should be set to
a nearby mirror. Defining ``CCACHE_DIR`` enables the use of
`devel/ccache <http://www.freebsd.org/cgi/url.cgi?ports/devel/ccache/pkg-descr>`__
to cache compilation and reduce build times for frequently-compiled
code. It may be convenient to put poudriere datasets in an isolated tree
mounted at ``/poudriere``. Defaults for the other configuration values
are adequate.

The number of processor cores detected is used to define how many builds
should run in parallel. Supply enough virtual memory, either with RAM or
swap space. If virtual memory runs out, compiling jails will stop and be
torn down, resulting in weird error messages.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.6.1.?Initialize Jails and Port Trees
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After configuration, initialize poudriere so that it installs a jail
with the required FreeBSD tree and a ports tree. Specify a name for the
jail using ``-j`` and the FreeBSD version with ``-v``. On systems
running FreeBSD/amd64, the architecture can be set with ``-a`` to either
``i386`` or ``amd64``. The default is the architecture shown by
``uname``.

.. code:: screen

    # poudriere jail -c -j 10amd64 -v 10.0-RELEASE
    ====>> Creating 10amd64 fs... done
    ====>> Fetching base.txz for FreeBSD 10.0-RELEASE amd64
    /poudriere/jails/10amd64/fromftp/base.txz      100% of   59 MB 1470 kBps 00m42s
    ====>> Extracting base.txz... done
    ====>> Fetching src.txz for FreeBSD 10.0-RELEASE amd64
    /poudriere/jails/10amd64/fromftp/src.txz       100% of  107 MB 1476 kBps 01m14s
    ====>> Extracting src.txz... done
    ====>> Fetching games.txz for FreeBSD 10.0-RELEASE amd64
    /poudriere/jails/10amd64/fromftp/games.txz     100% of  865 kB  734 kBps 00m01s
    ====>> Extracting games.txz... done
    ====>> Fetching lib32.txz for FreeBSD 10.0-RELEASE amd64
    /poudriere/jails/10amd64/fromftp/lib32.txz     100% of   14 MB 1316 kBps 00m12s
    ====>> Extracting lib32.txz... done
    ====>> Cleaning up... done
    ====>> Jail 10amd64 10.0-RELEASE amd64 is ready to be used

.. code:: screen

    # poudriere ports -c -p local
    ====>> Creating local fs... done
    ====>> Extracting portstree "local"...
    Looking up portsnap.FreeBSD.org mirrors... 7 mirrors found.
    Fetching public key from ec2-eu-west-1.portsnap.freebsd.org... done.
    Fetching snapshot tag from ec2-eu-west-1.portsnap.freebsd.org... done.
    Fetching snapshot metadata... done.
    Fetching snapshot generated at Tue Feb 11 01:07:15 CET 2014:
    94a3431f0ce567f6452ffde4fd3d7d3c6e1da143efec76100% of   69 MB 1246 kBps 00m57s
    Extracting snapshot... done.
    Verifying snapshot integrity... done.
    Fetching snapshot tag from ec2-eu-west-1.portsnap.freebsd.org... done.
    Fetching snapshot metadata... done.
    Updating from Tue Feb 11 01:07:15 CET 2014 to Tue Feb 11 16:05:20 CET 2014.
    Fetching 4 metadata patches... done.
    Applying metadata patches... done.
    Fetching 0 metadata files... done.
    Fetching 48 patches.
    (48/48) 100.00%  done.
    done.
    Applying patches...
    done.
    Fetching 1 new ports or files... done.
    /poudriere/ports/tester/CHANGES
    /poudriere/ports/tester/COPYRIGHT

    [...]

    Building new INDEX files... done.

On a single computer, poudriere can build ports with multiple
configurations, in multiple jails, and from different port trees. Custom
configurations for these combinations are called *sets*. See the
CUSTOMIZATION section of
`poudriere(8) <http://www.FreeBSD.org/cgi/man.cgi?query=poudriere&sektion=8>`__
for details after
`ports-mgmt/poudriere <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/poudriere/pkg-descr>`__
or
`ports-mgmt/poudriere-devel <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/poudriere-devel/pkg-descr>`__
is installed.

The basic configuration shown here puts a single jail-, port-, and
set-specific ``make.conf`` in ``/usr/local/etc/poudriere.d``. The
filename in this example is created by combining the jail name, port
name, and set name: ``10amd64-local-workstation``-make.conf. The system
``make.conf`` and this new file are combined at build time to create the
``make.conf`` used by the build jail.

Packages to be built are entered in
``10amd64-local-workstation``-pkglist:

.. code:: programlisting

    editors/emacs
    devel/git
    ports-mgmt/pkg
    ...

Options and dependencies for the specified ports are configured:

.. code:: screen

    # poudriere options -j 10amd64 -p local -z workstation -f 10amd64-local-workstation-pkglist

Finally, packages are built and a package repository is created:

.. code:: screen

    # poudriere bulk -j 10amd64 -p local -z workstation -f 10amd64-local-workstation-pkglist

**Ctrl**+**t** displays the current state of the build. Poudriere also
builds files in ``/poudriere/logs/bulk/jailname`` that can be used with
a web server to display build information.

Packages are now available for installation from the poudriere
repository.

For more information on using poudriere, see
`poudriere(8) <http://www.FreeBSD.org/cgi/man.cgi?query=poudriere&sektion=8>`__
and the main web site, https://github.com/freebsd/poudriere/wiki.

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

5.6.2.?Configuring pkg Clients to Use a Poudriere Repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While it is possible to use both a custom repository along side of the
official repository, sometimes it is useful to disable the official
repository. This is done by creating a configuration file that overrides
and disables the official configuration file. Create
``/usr/local/etc/pkg/repos/FreeBSD.conf`` that contains the following:

.. code:: screen

    FreeBSD: {
        enabled: no
    }

Usually it is easiest to serve a poudriere repository to the client
machines via HTTP. Setup a webserver to serve up the package directory,
usually something like: ``/usr/local/poudriere/data/packages/10amd64``.
Where ``10amd64`` is the name of the build.

If the URL to the package repository is:
``http://pkg.example.com/10amd64``, then the repository configuration
file in ``/usr/local/etc/pkg/repos/custom.conf`` would look like:

.. code:: screen

    custom: {
        url: "http://pkg.example.com/10amd64",
        mirror_type: "http",
        enabled: yes,
    }

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+------------------------------------------+
| `Prev <ports-using.html>`__?       | `Up <ports.html>`__     | ?\ `Next <ports-nextsteps.html>`__       |
+------------------------------------+-------------------------+------------------------------------------+
| 5.5.?Using the Ports Collection?   | `Home <index.html>`__   | ?5.7.?Post-Installation Considerations   |
+------------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
