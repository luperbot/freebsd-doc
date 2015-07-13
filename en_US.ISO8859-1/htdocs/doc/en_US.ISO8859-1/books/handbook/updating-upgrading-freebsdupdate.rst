====================
24.2.?FreeBSD Update
====================

.. raw:: html

   <div class="navheader">

24.2.?FreeBSD Update
`Prev <updating-upgrading.html>`__?
Chapter?24.?Updating and Upgrading FreeBSD
?\ `Next <updating-upgrading-documentation.html>`__

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

24.2.?FreeBSD Update
--------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Based on notes provided by Colin Percival.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Applying security patches in a timely manner and upgrading to a newer
release of an operating system are important aspects of ongoing system
administration. FreeBSD includes a utility called ``freebsd-update``
which can be used to perform both these tasks.

This utility supports binary security and errata updates to FreeBSD,
without the need to manually compile and install the patch or a new
kernel. Binary updates are available for all architectures and releases
currently supported by the security team. The list of supported releases
and their estimated end-of-life dates are listed at
``http://www.FreeBSD.org/security/``.

This utility also supports operating system upgrades to minor point
releases as well as upgrades to another release branch. Before upgrading
to a new release, review its release announcement as it contains
important information pertinent to the release. Release announcements
are available from ``http://www.FreeBSD.org/releases/``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If a ``crontab`` utilizing the features of
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
exists, it must be disabled before upgrading the operating system.

.. raw:: html

   </div>

This section describes the configuration file used by
``freebsd-update``, demonstrates how to apply a security patch and how
to upgrade to a minor or major operating system release, and discusses
some of the considerations when upgrading the operating system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.1.?The Configuration File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The default configuration file for ``freebsd-update`` works as-is. Some
users may wish to tweak the default configuration in
``/etc/freebsd-update.conf``, allowing better control of the process.
The comments in this file explain the available options, but the
following may require a bit more explanation:

.. code:: programlisting

    # Components of the base system which should be kept updated.
    Components world kernel

This parameter controls which parts of FreeBSD will be kept up-to-date.
The default is to update the entire base system and the kernel.
Individual components can instead be specified, such as ``src/base`` or
``src/sys``. However, the best option is to leave this at the default as
changing it to include specific items requires every needed item to be
listed. Over time, this could have disastrous consequences as source
code and binaries may become out of sync.

.. code:: programlisting

    # Paths which start with anything matching an entry in an IgnorePaths
    # statement will be ignored.
    IgnorePaths /boot/kernel/linker.hints

To leave specified directories, such as ``/bin`` or ``/sbin``, untouched
during the update process, add their paths to this statement. This
option may be used to prevent ``freebsd-update`` from overwriting local
modifications.

.. code:: programlisting

    # Paths which start with anything matching an entry in an UpdateIfUnmodified
    # statement will only be updated if the contents of the file have not been
    # modified by the user (unless changes are merged; see below).
    UpdateIfUnmodified /etc/ /var/ /root/ /.cshrc /.profile

This option will only update unmodified configuration files in the
specified directories. Any changes made by the user will prevent the
automatic updating of these files. There is another option,
``KeepModifiedMetadata``, which will instruct ``freebsd-update`` to save
the changes during the merge.

.. code:: programlisting

    # When upgrading to a new FreeBSD release, files which match MergeChanges
    # will have any local changes merged into the version from the new release.
    MergeChanges /etc/ /var/named/etc/ /boot/device.hints

List of directories with configuration files that ``freebsd-update``
should attempt to merge. The file merge process is a series of
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
patches similar to
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__,
but with fewer options. Merges are either accepted, open an editor, or
cause ``freebsd-update`` to abort. When in doubt, backup ``/etc`` and
just accept the merges. See `Section?24.6.4, “Merging Configuration
Files” <makeworld.html#mergemaster>`__ for more information about
``mergemaster``.

.. code:: programlisting

    # Directory in which to store downloaded updates and temporary
    # files used by FreeBSD Update.
    # WorkDir /var/db/freebsd-update

This directory is where all patches and temporary files are placed. In
cases where the user is doing a version upgrade, this location should
have at least a gigabyte of disk space available.

.. code:: programlisting

    # When upgrading between releases, should the list of Components be
    # read strictly (StrictComponents yes) or merely as a list of components
    # which *might* be installed of which FreeBSD Update should figure out
    # which actually are installed and upgrade those (StrictComponents no)?
    # StrictComponents no

When this option is set to ``yes``, ``freebsd-update`` will assume that
the ``Components`` list is complete and will not attempt to make changes
outside of the list. Effectively, ``freebsd-update`` will attempt to
update every file which belongs to the ``Components`` list.

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

24.2.2.?Applying Security Patches
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The process of applying FreeBSD security patches has been simplified,
allowing an administrator to keep a system fully patched using
``freebsd-update``. More information about FreeBSD security advisories
can be found in `Section?14.11, “FreeBSD Security
Advisories” <security-advisories.html>`__.

FreeBSD security patches may be downloaded and installed using the
following commands. The first command will determine if any outstanding
patches are available, and if so, will list the files that will be
modifed if the patches are applied. The second command will apply the
patches.

.. code:: screen

    # freebsd-update fetch
    # freebsd-update install

If the update applies any kernel patches, the system will need a reboot
in order to boot into the patched kernel. If the patch was applied to
any running binaries, the affected applications should be restarted so
that the patched version of the binary is used.

The system can be configured to automatically check for updates once
every day by adding this entry to ``/etc/crontab``:

.. code:: programlisting

    @daily                                  root    freebsd-update cron

If patches exist, they will automatically be downloaded but will not be
applied. The ``root`` user will be sent an email so that the patches may
be reviewed and manually installed with ``freebsd-update install``.

If anything goes wrong, ``freebsd-update`` has the ability to roll back
the last set of changes with the following command:

.. code:: screen

    # freebsd-update rollback
    Uninstalling updates... done.

Again, the system should be restarted if the kernel or any kernel
modules were modified and any affected binaries should be restarted.

Only the ``GENERIC`` kernel can be automatically updated by
``freebsd-update``. If a custom kernel is installed, it will have to be
rebuilt and reinstalled after ``freebsd-update`` finishes installing the
updates. However, ``freebsd-update`` will detect and update the
``GENERIC`` kernel if ``/boot/GENERIC`` exists, even if it is not the
current running kernel of the system.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Always keep a copy of the ``GENERIC`` kernel in ``/boot/GENERIC``. It
will be helpful in diagnosing a variety of problems and in performing
version upgrades. Refer to either `Section?24.2.3.1, “Custom Kernels
with FreeBSD?9.X and
Later” <updating-upgrading-freebsdupdate.html#freebsd-update-custom-kernel-9x>`__
or `Section?24.2.3.2, “Custom Kernels with
FreeBSD?8.X” <updating-upgrading-freebsdupdate.html#freebsd-update-custom-kernel-8x>`__
for instructions on how to get a copy of the ``GENERIC`` kernel.

.. raw:: html

   </div>

Unless the default configuration in ``/etc/freebsd-update.conf`` has
been changed, ``freebsd-update`` will install the updated kernel sources
along with the rest of the updates. Rebuilding and reinstalling a new
custom kernel can then be performed in the usual way.

The updates distributed by ``freebsd-update`` do not always involve the
kernel. It is not necessary to rebuild a custom kernel if the kernel
sources have not been modified by ``freebsd-update install``. However,
``freebsd-update`` will always update ``/usr/src/sys/conf/newvers.sh``.
The current patch level, as indicated by the ``-p`` number reported by
``uname -r``, is obtained from this file. Rebuilding a custom kernel,
even if nothing else changed, allows ``uname`` to accurately report the
current patch level of the system. This is particularly helpful when
maintaining multiple systems, as it allows for a quick assessment of the
updates installed in each one.

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

24.2.3.?Performing Major and Minor Version Upgrades
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Upgrades from one minor version of FreeBSD to another, like from
FreeBSD?9.0 to FreeBSD?9.1, are called *minor version* upgrades. *Major
version* upgrades occur when FreeBSD is upgraded from one major version
to another, like from FreeBSD?9.X to FreeBSD?10.X. Both types of
upgrades can be performed by providing ``freebsd-update`` with a release
version target.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If the system is running a custom kernel, make sure that a copy of the
``GENERIC`` kernel exists in ``/boot/GENERIC`` before starting the
upgrade. Refer to either `Section?24.2.3.1, “Custom Kernels with
FreeBSD?9.X and
Later” <updating-upgrading-freebsdupdate.html#freebsd-update-custom-kernel-9x>`__
or `Section?24.2.3.2, “Custom Kernels with
FreeBSD?8.X” <updating-upgrading-freebsdupdate.html#freebsd-update-custom-kernel-8x>`__
for instructions on how to get a copy of the ``GENERIC`` kernel.

.. raw:: html

   </div>

The following command, when run on a FreeBSD?9.0 system, will upgrade it
to FreeBSD?9.1:

.. code:: screen

    # freebsd-update -r 9.1-RELEASE upgrade

After the command has been received, ``freebsd-update`` will evaluate
the configuration file and current system in an attempt to gather the
information necessary to perform the upgrade. A screen listing will
display which components have and have not been detected. For example:

.. code:: screen

    Looking up update.FreeBSD.org mirrors... 1 mirrors found.
    Fetching metadata signature for 9.0-RELEASE from update1.FreeBSD.org... done.
    Fetching metadata index... done.
    Inspecting system... done.

    The following components of FreeBSD seem to be installed:
    kernel/smp src/base src/bin src/contrib src/crypto src/etc src/games
    src/gnu src/include src/krb5 src/lib src/libexec src/release src/rescue
    src/sbin src/secure src/share src/sys src/tools src/ubin src/usbin
    world/base world/info world/lib32 world/manpages

    The following components of FreeBSD do not seem to be installed:
    kernel/generic world/catpages world/dict world/doc world/games
    world/proflibs

    Does this look reasonable (y/n)? y

At this point, ``freebsd-update`` will attempt to download all files
required for the upgrade. In some cases, the user may be prompted with
questions regarding what to install or how to proceed.

When using a custom kernel, the above step will produce a warning
similar to the following:

.. code:: screen

    WARNING: This system is running a "MYKERNEL" kernel, which is not a
    kernel configuration distributed as part of FreeBSD 9.0-RELEASE.
    This kernel will not be updated: you MUST update the kernel manually
    before running "/usr/sbin/freebsd-update install"

This warning may be safely ignored at this point. The updated
``GENERIC`` kernel will be used as an intermediate step in the upgrade
process.

Once all the patches have been downloaded to the local system, they will
be applied. This process may take a while, depending on the speed and
workload of the machine. Configuration files will then be merged. The
merging process requires some user intervention as a file may be merged
or an editor may appear on screen for a manual merge. The results of
every successful merge will be shown to the user as the process
continues. A failed or ignored merge will cause the process to abort.
Users may wish to make a backup of ``/etc`` and manually merge important
files, such as ``master.passwd`` or ``group`` at a later time.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The system is not being altered yet as all patching and merging is
happening in another directory. Once all patches have been applied
successfully, all configuration files have been merged and it seems the
process will go smoothly, the changes can be committed to disk by the
user using the following command:

.. code:: screen

    # freebsd-update install

.. raw:: html

   </div>

The kernel and kernel modules will be patched first. If the system is
running with a custom kernel, use
`nextboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nextboot&sektion=8>`__
to set the kernel for the next boot to the updated ``/boot/GENERIC``:

.. code:: screen

    # nextboot -k GENERIC

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Before rebooting with the ``GENERIC`` kernel, make sure it contains all
the drivers required for the system to boot properly and connect to the
network, if the machine being updated is accessed remotely. In
particular, if the running custom kernel contains built-in functionality
usually provided by kernel modules, make sure to temporarily load these
modules into the ``GENERIC`` kernel using the ``/boot/loader.conf``
facility. It is recommended to disable non-essential services as well as
any disk and network mounts until the upgrade process is complete.

.. raw:: html

   </div>

The machine should now be restarted with the updated kernel:

.. code:: screen

    # shutdown -r now

Once the system has come back online, restart ``freebsd-update`` using
the following command. Since the state of the process has been saved,
``freebsd-update`` will not start from the beginning, but will instead
move on to the next phase and remove all old shared libraries and object
files.

.. code:: screen

    # freebsd-update install

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Depending upon whether any library version numbers were bumped, there
may only be two install phases instead of three.

.. raw:: html

   </div>

The upgrade is now complete. If this was a major version upgrade,
reinstall all ports and packages as described in `Section?24.2.3.3,
“Upgrading Packages After a Major Version
Upgrade” <updating-upgrading-freebsdupdate.html#freebsdupdate-portsrebuild>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.3.1.?Custom Kernels with FreeBSD?9.X and Later
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before using ``freebsd-update``, ensure that a copy of the ``GENERIC``
kernel exists in ``/boot/GENERIC``. If a custom kernel has only been
built once, the kernel in ``/boot/kernel.old`` is the ``GENERIC``
kernel. Simply rename this directory to ``/boot/kernel``.

If a custom kernel has been built more than once or if it is unknown how
many times the custom kernel has been built, obtain a copy of the
``GENERIC`` kernel that matches the current version of the operating
system. If physical access to the system is available, a copy of the
``GENERIC`` kernel can be installed from the installation media:

.. code:: screen

    # mount /cdrom
    # cd /cdrom/usr/freebsd-dist
    # tar -C/ -xvf kernel.txz boot/kernel/kernel

Alternately, the ``GENERIC`` kernel may be rebuilt and installed from
source:

.. code:: screen

    # cd /usr/src
    # make kernel __MAKE_CONF=/dev/null SRCCONF=/dev/null

For this kernel to be identified as the ``GENERIC`` kernel by
``freebsd-update``, the ``GENERIC`` configuration file must not have
been modified in any way. It is also suggested that the kernel is built
without any other special options.

Rebooting into the ``GENERIC`` kernel is not required as
``freebsd-update`` only needs ``/boot/GENERIC`` to exist.

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

24.2.3.2.?Custom Kernels with FreeBSD?8.X
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

On an FreeBSD?8.X system, the instructions for obtaining or building a
``GENERIC`` kernel differ slightly.

Assuming physical access to the machine is possible, a copy of the
``GENERIC`` kernel can be installed from the installation media using
the following commands:

.. code:: screen

    # mount /cdrom
    # cd /cdrom/X.Y-RELEASE/kernels
    # ./install.sh GENERIC

Replace ``X.Y-RELEASE`` with the version of the release being used. The
``GENERIC`` kernel will be installed in ``/boot/GENERIC`` by default.

To instead build the ``GENERIC`` kernel from source:

.. code:: screen

    # cd /usr/src
    # env DESTDIR=/boot/GENERIC make kernel __MAKE_CONF=/dev/null SRCCONF=/dev/null
    # mv /boot/GENERIC/boot/kernel/* /boot/GENERIC
    # rm -rf /boot/GENERIC/boot

For this kernel to be picked up as ``GENERIC`` by ``freebsd-update``,
the ``GENERIC`` configuration file must not have been modified in any
way. It is also suggested that it is built without any other special
options.

Rebooting into the ``GENERIC`` kernel is not required.

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

24.2.3.3.?Upgrading Packages After a Major Version Upgrade
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Generally, installed applications will continue to work without problems
after minor version upgrades. Major versions use different Application
Binary Interfaces (ABIs), which will break most third-party
applications. After a major version upgrade, all installed packages and
ports need to be upgraded. Packages can be upgraded using
``pkg         upgrade``. To upgrade installed ports, use a utility such
as
`ports-mgmt/portmaster <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmaster/pkg-descr>`__.

A forced upgrade of all installed packages will replace the packages
with fresh versions from the repository even if the version number has
not increased. This is required because of the ABI version change when
upgrading between major versions of FreeBSD. The forced upgrade can be
accomplished by performing:

.. code:: screen

    # pkg-static upgrade -f

A rebuild of all installed applications can be accomplished with this
command:

.. code:: screen

    # portmaster -af

This command will display the configuration screens for each application
that has configurable options and wait for the user to interact with
those screens. To prevent this behavior, and use only the default
options, include ``-G`` in the above command.

Once the software upgrades are complete, finish the upgrade process with
a final call to ``freebsd-update`` in order to tie up all the loose ends
in the upgrade process:

.. code:: screen

    # freebsd-update install

If the ``GENERIC`` kernel was temporarily used, this is the time to
build and install a new custom kernel using the instructions in
`Chapter?9, *Configuring the FreeBSD Kernel* <kernelconfig.html>`__.

Reboot the machine into the new FreeBSD version. The upgrade process is
now complete.

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

24.2.4.?System State Comparison
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The state of the installed FreeBSD version against a known good copy can
be tested using ``freebsd-update IDS``. This command evaluates the
current version of system utilities, libraries, and configuration files
and can be used as a built-in Intrusion Detection System (IDS).

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

This command is not a replacement for a real IDS such as
`security/snort <http://www.freebsd.org/cgi/url.cgi?ports/security/snort/pkg-descr>`__.
As ``freebsd-update`` stores data on disk, the possibility of tampering
is evident. While this possibility may be reduced using
``kern.securelevel`` and by storing the ``freebsd-update`` data on a
read-only file system when not in use, a better solution would be to
compare the system against a secure disk, such as a DVD or securely
stored external USB disk device. An alternative method for providing IDS
functionality using a built-in utility is described in `Section?14.2.6,
“Binary Verification” <security-intro.html#security-ids>`__

.. raw:: html

   </div>

To begin the comparison, specify the output file to save the results to:

.. code:: screen

    # freebsd-update IDS >> outfile.ids

The system will now be inspected and a lengthy listing of files, along
with the SHA256 hash values for both the known value in the release and
the current installation, will be sent to the specified output file.

The entries in the listing are extremely long, but the output format may
be easily parsed. For instance, to obtain a list of all files which
differ from those in the release, issue the following command:

.. code:: screen

    # cat outfile.ids | awk '{ print $1 }' | more
    /etc/master.passwd
    /etc/motd
    /etc/passwd
    /etc/pf.conf

This sample output has been truncated as many more files exist. Some
files have natural modifications. For example, ``/etc/passwd`` will be
modified if users have been added to the system. Kernel modules may
differ as ``freebsd-update`` may have updated them. To exclude specific
files or directories, add them to the ``IDSIgnorePaths`` option in
``/etc/freebsd-update.conf``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+------------------------------------+-------------------------------------------------------+
| `Prev <updating-upgrading.html>`__?           | `Up <updating-upgrading.html>`__   | ?\ `Next <updating-upgrading-documentation.html>`__   |
+-----------------------------------------------+------------------------------------+-------------------------------------------------------+
| Chapter?24.?Updating and Upgrading FreeBSD?   | `Home <index.html>`__              | ?24.3.?Updating the Documentation Set                 |
+-----------------------------------------------+------------------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
