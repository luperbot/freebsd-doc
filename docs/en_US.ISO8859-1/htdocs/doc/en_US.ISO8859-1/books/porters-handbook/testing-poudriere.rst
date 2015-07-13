==============
9.5.?Poudriere
==============

.. raw:: html

   <div class="navheader">

9.5.?Poudriere
`Prev <porting-prefix.html>`__?
Chapter?9.?Testing the Port
?\ `Next <testing-tinderbox.html>`__

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

9.5.?Poudriere
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For a ports contributor, Poudriere is one of the most important and
helpful testing and build tools. Its main features include:

.. raw:: html

   <div class="itemizedlist">

-  Bulk building of the entire ports tree, specific subsets of the ports
   tree, or a single port including its dependencies

-  Automatic packaging of build results

-  Generation of build log files per port

-  Providing a signed
   `pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__
   repository

-  Testing of port builds before submitting a patch to the FreeBSD bug
   tracker or committing to the ports tree

-  Testing for successful ports builds using different options

.. raw:: html

   </div>

Because Poudriere performs its building in a clean
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
environment and uses
`zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
features, it has several advantages over traditional testing on the host
system:

.. raw:: html

   <div class="itemizedlist">

-  No pollution of the host environment: No leftover files, no
   accidental removals, no changes of existing configuration files.

-  Verify ``pkg-plist`` for missing or superfluous entries

-  Ports committers sometimes ask for a Poudriere log alongside a patch
   submission to assess whether the patch is ready for integration into
   the ports tree

.. raw:: html

   </div>

It is also quite straightforward to set up and use, has no dependencies,
and will run on any supported FreeBSD release. This section shows how to
install, configure, and run Poudriere as part of the normal workflow of
a ports contributor.

The examples in this section show a default file layout, as standard in
FreeBSD. Substitute any local changes accordingly. The ports tree,
represented by ``${PORTSDIR}``, is located in ``/usr/ports``. Both
``${LOCALBASE}`` and ``${PREFIX}`` are ``/usr/local`` by default.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.5.1.?Installing Poudriere
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Poudriere is available in the ports tree in
`ports-mgmt/poudriere <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/poudriere/pkg-descr>`__.
It can be installed using
`pkg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg&sektion=8>`__ or
from ports:

.. code:: screen

    # pkg install poudriere

or

.. code:: screen

    # make -C /usr/ports/ports-mgmt/poudriere install clean

There is also a work-in-progress version of Poudriere which will
eventually become the next release. It is available in
`ports-mgmt/poudriere-devel <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/poudriere-devel/pkg-descr>`__.
This development version is used for the official FreeBSD package
builds, so it is well tested. It often has newer interesting features. A
ports committer will want to use the development version because it is
what is used in production, and has all the new features that will make
sure everything is exactly right. A contributor will not necessarily
need those as the most important fixes are backported to released
version. The main reason for the use of the development version to build
the official package is because it is faster, in a way that will shorten
a full build from 18 hours to 17 hours when using a high end 32 CPU
server with 128GB of RAM. Those optimizations will not matter a lot when
building ports on a desktop machine.

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

9.5.2.?Setting Up Poudriere
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The port installs a default configuration file,
``/usr/local/etc/poudriere.conf``. Each parameter is documented in the
configuration file and in
`poudriere(8) <http://www.FreeBSD.org/cgi/man.cgi?query=poudriere&sektion=8>`__.
Here is a minimal example config file:

.. code:: programlisting

    ZPOOL=tank
    ZROOTFS=/poudriere
    BASEFS=/poudriere
    DISTFILES_CACHE=/usr/ports/distfiles
    RESOLV_CONF=/etc/resolv.conf
    FREEBSD_HOST=ftp://ftp.freebsd.org
    SVN_HOST=svn0.eu.FreeBSD.org

.. raw:: html

   <div class="variablelist">

``ZPOOL``
    The name of the ZFS storage pool which Poudriere shall use. Must be
    listed in the output of ``zpool         status``.

``ZROOTFS``
    The root of Poudriere-managed file systems. This entry will cause
    Poudriere to create
    `zfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=zfs&sektion=8>`__
    file systems under ``tank/poudriere``.

``BASEFS``
    The root mount point for Poudriere file systems. This entry will
    cause Poudriere to mount ``tank/poudriere`` to ``/poudriere``.

``DISTFILES_CACHE``
    Defines where distfiles are stored. In this example, Poudriere and
    the host share the distfiles storage directory. This avoids
    downloading tarballs which are already present on the system.

``RESOLV_CONF``
    Use the host ``/etc/resolv.conf`` inside jails for DNS. This is
    needed so jails can resolve the URLs of distfiles when downloading.
    It is not needed when using a proxy. Refer to the default
    configuration file for proxy configuration.

``FREEBSD_HOST``
    The FTP/HTTP server to use when the jails are installed from FreeBSD
    releases and updated with
    `freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__.
    Choose a server location which is close, for example if the machine
    is located in Australia, use ``ftp.au.freebsd.org``.

``SVN_HOST``
    The server from where jails are installed and updated when using
    Subversion. Also used for ports tree when not using
    `portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__.
    Again, choose a nearby location. A list of official Subversion
    mirrors can be found in the `FreeBSD Handbook Subversion
    section <../../../../doc/en_US.ISO8859-1/books/handbook/svn.html#svn-mirrors>`__.

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

9.5.3.?Creating Poudriere Jails
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Create the base jails which Poudriere will use for building:

.. code:: screen

    # poudriere jail -c -j 93Ramd64 -v 9.3-RELEASE -a amd64

Fetch a ``9.3-RELEASE`` for ``amd64`` from the FTP server given by
``FREEBSD_HOST`` in ``poudriere.conf``, create the zfs file system
``tank/poudriere/jails/93Ramd64``, mount it on
``/poudriere/jails/93Ramd64`` and extract the ``9.3-RELEASE`` tarballs
into this file system.

.. code:: screen

    # poudriere jail -c -j 10i386 -v stable/10 -a i386 -m svn+https

Create ``tank/poudriere/jails/10i386``, mount it on
``/poudriere/jails/10i386``, then check out the tip of the Subversion
branch of ``FreeBSD-10-STABLE`` from ``SVN_HOST`` in ``poudriere.conf``
into ``/poudriere/jails/10i386/usr/src``, then complete a ``buildworld``
and install it into ``/poudriere/jails/10i386``.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

If a specific Subversion revision is needed, append it to the version
string. For example:

.. code:: screen

    # poudriere jail -c -j 10i386 -v stable/10@123456 -a i386 -m svn+https

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

While it is possible to build a newer version of FreeBSD on an older
version, most of the time it will not run. For example, if a
``stable/10`` jail is needed, the host will have to run ``stable/10``
too. Running ``10.0-RELEASE`` is not enough.

.. raw:: html

   </div>

.. raw:: html

   <div class="caution" xmlns="">

Caution:
~~~~~~~~

The default ``svn`` protocol works but is not very secure. Using
``svn+https`` along with verifying the remote server's SSL fingerprint
is advised. It will ensure that the files used for building the jail are
from a trusted source.

.. raw:: html

   </div>

A list of jails currently known to Poudriere can be shown with
``poudriere jail -l``:

.. code:: screen

    # poudriere jail -l
    JAILNAME             VERSION              ARCH    METHOD
    93Ramd64             9.3-RELEASE          amd64   ftp
    10i386               10.0-STABLE          i386    svn+https

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

9.5.4.?Keeping Poudriere Jails Updated
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Managing updates is very straightforward. The command:

.. code:: screen

    # poudriere jail -u -j JAILNAME

updates the specified jail to the latest version available. For FreeBSD
releases, update to the latest patchlevel with
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__.
For FreeBSD versions built from source, update to the latest Subversion
revision in the branch.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

For jails employing a ``svn+*`` method, it is helpful to add
``-J         NumberOfParallelBuildJobs`` to speed up the build by
increasing the number of parallel compile jobs used. For example, if the
building machine has 6 CPUs, use:

.. code:: screen

    # poudriere jail -u -J 6 -j JAILNAME

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

9.5.5.?Setting Up Ports Trees for Use with Poudriere
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are multiple ways to use ports trees in Poudriere. The most
straightforward way is to have Poudriere create a default ports tree for
itself:

.. code:: screen

    # poudriere ports -c

This command creates ``tank/poudriere/ports/default``, mount it on
``/poudriere/ports/default``, and populate it using
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__.
Afterward it is included in the list of known ports trees:

.. code:: screen

    # poudriere ports -l
    PORTSTREE      METHOD     PATH
    default        portsnap   /poudriere/ports/default

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Note that the “default” ports tree is special. Each of the build
commands explained later will implicitly use this ports tree unless
specifically specified otherwise. To use another tree, add
``-p         treename`` to the commands.

.. raw:: html

   </div>

While useful for regular bulk builds, having this default ports tree
with the
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__
method may not be the best way to deal with local modifications for a
ports contributor. As with the creation of jails, it is possible to use
a different method for creating the ports tree. To add an additional
ports tree for testing local modifications and ports development,
checking out the tree via Subversion is possible:

.. code:: screen

    # poudriere ports -c -m svn+https -p subversive

Creates ``tank/poudriere/ports/subversive`` and mounts it on
``/poudriere/ports/subversive``. It is then populated using Subversion.
Finally, it is added to the list of known ports trees:

.. code:: screen

    # poudriere ports -l
    PORTSTREE            METHOD     PATH
    default              portsnap   /poudriere/ports/default
    subversive           svn+https  /poudriere/ports/subversive

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

The ``svn`` method allows extra qualifiers to tell Subversion exactly
how to fetch data. This is explained in
`poudriere(8) <http://www.FreeBSD.org/cgi/man.cgi?query=poudriere&sektion=8>`__.
For instance, ``poudriere ports         -c -m svn+ssh -p subversive``
uses SSH for the checkout.

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

9.5.6.?Using Manually Managed Ports Trees with Poudriere
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Depending on the workflow, it can be extremely helpful to use ports
trees which are maintained manually. For instance, if there is a local
copy of the ports tree in ``/work/ports``, point Poudriere to the
location:

.. code:: screen

    # poudriere ports -c -F -f none -M /work/ports -p development

This will be listed in the table of known trees:

.. code:: screen

    # poudriere ports -l
    PORTSTREE    METHOD   PATH
    development  -        /work/ports

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The dash in the ``METHOD`` column means that Poudriere will not update
or change this ports tree, ever. It is completely up to the user to
maintain this tree, including all local modifications that may be used
for testing new ports and submitting patches.

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

9.5.7.?Keeping Poudriere Ports Trees Updated
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As straightforward as with jails described earlier:

.. code:: screen

    # poudriere ports -u -p PORTSTREE

Will update the given *``PORTSTREE``*, one tree given by the output of
``poudriere -l``, to the latest revision available on the official
servers.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Ports trees without a method, see `Section?9.5.6, “Using Manually
Managed Ports Trees with
Poudriere” <testing-poudriere.html#testing-poudriere-ports-tree-manual>`__,
cannot be updated like this. They must be updated manually by the
porter.

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

9.5.8.?Testing Ports
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After jails and ports trees have been set up, the result of a
contributor's modifications to the ports tree can be tested.

For example, local modifications to the
`www/firefox <http://www.freebsd.org/cgi/url.cgi?ports/www/firefox/pkg-descr>`__
port located in ``/work/ports/www/firefox`` can be tested in the
previously created 9.3-RELEASE jail:

.. code:: screen

    # poudriere testport -j 93Ramd64 -p development -o www/firefox

This will build all dependencies of Firefox. If a dependency has been
built previously and is still up-to-date, the pre-built package is
installed. If a dependency has no up-to-date package, one will be built
with default options in a jail. Then Firefox itself is built.

The complete build of every port is logged to
``/poudriere/data/logs/bulk/93Ri386-development/build-time``/logs.

The directory name ``93Ri386-development`` is derived from the arguments
to ``-j`` and ``-p``, respectively. For convenience, a symbolic link
``/poudriere/data/logs/bulk/93Ri386-development/latest`` is also
maintained. The link points to the latest *``build-time``* directory.
Also in this directory is an ``index.html`` for observing the build
process with a web browser.

By default, Poudriere cleans up the jails and leaves log files in the
directories mentioned above. To ease investigation, jails can be kept
running after the build by adding ``-i`` to ``testport``:

.. code:: screen

    # poudriere testport -j 93Ramd64 -p development -i -o www/firefox

After the build completes, and regardless of whether it was successful,
a shell is provided within the jail. The shell is used to investigate
further. Poudriere can be told to leave the jail running after the build
finishes with ``-I``. Poudriere will show the command to run when the
jail is no longer needed. It is then possible to
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
into it:

.. code:: screen

    # poudriere testport -j 93Ramd64 -p development -I -o www/firefox
    [...]
    ====>> Installing local Pkg repository to /usr/local/etc/pkg/repos
    ====>> Leaving jail 93Ramd64-development-n running, mounted at /poudriere/data/.m/93Ramd64-development/ref for interactive run testing
    ====>> To enter jail: jexec 93Ramd64-development-n env -i TERM=$TERM /usr/bin/login -fp root
    ====>> To stop jail: poudriere jail -k -j 93Ramd64 -p development
    # jexec 93Ramd64-development-n env -i TERM=$TERM /usr/bin/login -fp root
    # [do some stuff in the jail]
    # exit
    # poudriere jail -k -j 93Ramd64 -p development
    ====>> Umounting file systems

An integral part of the FreeBSD ports build infrastructure is the
ability to tweak ports to personal preferences with options. These can
be tested with Poudriere as well. Adding the ``-c``:

.. code:: screen

    # poudriere testport -c -o www/firefox

Presents the port configuration dialog before the port is built. The
ports given after ``-o`` in the format ``category``/*``portname``* will
use the specified options, all dependencies will use the default
options. Testing dependent ports with non-default options can be
accomplished using sets, see `Section?9.5.9, “Using
Sets” <testing-poudriere.html#testing-poudriere-sets>`__.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

When testing ports where ``pkg-plist`` is altered during build depending
on the selected options, it is recommended to perform a test run with
all options selected *and* one with all options deselected.

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

9.5.9.?Using Sets
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For all actions involving builds, a so-called *set* can be specified
using ``-z       setname``. A set refers to a fully independent build.
This allows, for instance, usage of ``testport`` with non-standard
options for the dependent ports.

To use sets, Poudriere expects an existing directory structure similar
to ``PORT_DBDIR``, defaults to ``/var/db/ports`` in its configuration
directory. This directory is then nullfs-mounted into the jails where
the ports and their dependencies are built. Usually a suitable starting
point can be obtained by recursively copying the existing ``PORT_DBDIR``
to
``/usr/local/etc/poudriere.d/jailname``-*``portname``*-*``setname``*-options.
This is described in detail in
`poudriere(8) <http://www.FreeBSD.org/cgi/man.cgi?query=poudriere&sektion=8>`__.
For instance, testing
`www/firefox <http://www.freebsd.org/cgi/url.cgi?ports/www/firefox/pkg-descr>`__
in a specific set named ``devset``, add the ``-z devset`` parameter to
the testport command:

.. code:: screen

    # poudriere testport -j 93Ramd64 -p development -z devset -o www/firefox

This will look for the existence of these directories in this order:

.. raw:: html

   <div class="itemizedlist">

-  ``/usr/local/etc/poudriere.d/93Ramd64-development-devset-options``

-  ``/usr/local/etc/poudriere.d/93Ramd64-devset-options``

-  ``/usr/local/etc/poudriere.d/93Ramd64-development-options``

-  ``/usr/local/etc/poudriere.d/devset-options``

-  ``/usr/local/etc/poudriere.d/development-options``

-  ``/usr/local/etc/poudriere.d/93Ramd64-options``

-  ``/usr/local/etc/poudriere.d/options``

.. raw:: html

   </div>

From this list, Poudriere nullfs-mounts the *first existing* directory
tree into the ``/var/db/ports`` directory of the build jails. Hence, all
custom options are used for all the ports during this run of
``testport``.

After the directory structure for a set is provided, the options for a
particular port can be altered. For example:

.. code:: screen

    # poudriere options -c www/firefox -z devset

The configuration dialog for
`www/firefox <http://www.freebsd.org/cgi/url.cgi?ports/www/firefox/pkg-descr>`__
is shown, and options can be edited. The selected options are saved to
the ``devset`` set.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Poudriere is very flexible in the option configuration. They can be set
for particular jails, ports trees, and for multiple ports by one
command. Refer to
`poudriere(8) <http://www.FreeBSD.org/cgi/man.cgi?query=poudriere&sektion=8>`__
for details.

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

9.5.10.?Providing a Custom ``make.conf`` File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Similar to using sets, Poudriere will also use a custom ``make.conf`` if
it is provided. No special command line argument is necessary. Instead,
Poudriere looks for existing files matching a name scheme derived from
the command line. For instance:

.. code:: screen

    # poudriere testport -j 93Ramd64 -p development -z devset -o www/firefox

causes Poudriere to check for the existence of these files in this
order:

.. raw:: html

   <div class="itemizedlist">

-  ``/usr/local/etc/poudriere.d/make.conf``

-  ``/usr/local/etc/poudriere.d/devset-make.conf``

-  ``/usr/local/etc/poudriere.d/development-make.conf``

-  ``/usr/local/etc/poudriere.d/93Ramd64-make.conf``

-  ``/usr/local/etc/poudriere.d/93Ramd64-development-make.conf``

-  ``/usr/local/etc/poudriere.d/93Ramd64-devset-make.conf``

-  ``/usr/local/etc/poudriere.d/93Ramd64-development-devset-make.conf``

.. raw:: html

   </div>

Unlike with sets, all of the found files will be appended, *in that
order*, into one ``make.conf`` inside the build jails. It is hence
possible to have general make variables, intended to affect all builds
in ``/usr/local/etc/poudriere.d/make.conf``. Special variables, intended
to affect only certain jails or sets can be set in specialised
``make.conf`` files, such as
``/usr/local/etc/poudriere.d/93Ramd64-development-devset-make.conf``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.1.?Using ``make.conf`` to Change Default Perl

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

To build a set with a non default Perl version, for example, ``5.20``,
using a set named ``perl5-20``, create a ``perl5-20-make.conf`` with
this line:

.. code:: programlisting

    DEFAULT_VERSIONS+= perl=5.20

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Note the use of ``+=`` so that if the variable is already set in the
default ``make.conf`` its content will not be overwritten.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

9.5.11.?Pruning no Longer Needed Distfiles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Poudriere comes with a built-in mechanism to remove outdated distfiles
that are no longer used by any port of a given tree. The command

.. code:: screen

    # poudriere distclean -p portstree

will scan the distfiles folder, ``DISTFILES_CACHE`` in
``poudriere.conf``, versus the ports tree given by the
``-p       portstree`` argument and prompt for removal of those
distfiles. To skip the prompt and remove all unused files
unconditionally, the ``-y`` argument can be added:

.. code:: screen

    # poudriere distclean -p portstree -y

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+----------------------------------------+
| `Prev <porting-prefix.html>`__?      | `Up <testing.html>`__   | ?\ `Next <testing-tinderbox.html>`__   |
+--------------------------------------+-------------------------+----------------------------------------+
| 9.4.?\ ``PREFIX`` and ``DESTDIR``?   | `Home <index.html>`__   | ?9.6.?Tinderbox                        |
+--------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
