======================
24.6.?Rebuilding World
======================

.. raw:: html

   <div class="navheader">

24.6.?Rebuilding World
`Prev <synching.html>`__?
Chapter?24.?Updating and Upgrading FreeBSD
?\ `Next <small-lan.html>`__

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

24.6.?Rebuilding World
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the local source tree is synchronized against a particular version
of FreeBSD such as FreeBSD-STABLE or FreeBSD-CURRENT, the source tree
can be used to rebuild the system. This process is known as rebuilding
world.

*Before* rebuilding world, be sure to perform the following tasks:

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?24.1.?Perform These Tasks *Before* Building World

.. raw:: html

   </div>

#. Backup all important data to another system or removable media,
   verify the integrity of the backup, and have a bootable installation
   media at hand. It cannot be stressed enough how important it is to
   make a backup of the system *before* rebuilding the system. While
   rebuilding world is an easy task, there will inevitably be times when
   mistakes in the source tree render the system unbootable. You will
   probably never have to use the backup, but it is better to be safe
   than sorry!

#. 

   Review the recent
   `freebsd-stable <http://lists.FreeBSD.org/mailman/listinfo/freebsd-stable>`__
   or
   `freebsd-current <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__
   entries, depending upon the branch being tracked. Be aware of any
   known problems and which systems are affected. If a known issue
   affects the version of synchronized code, wait for an “all clear”
   announcement to be posted stating that the problem has been solved.
   Resynchronize the sources to ensure that the local version of source
   has the needed fix.

#. Read ``/usr/src/UPDATING`` for any extra steps necessary for that
   version of the source. This file contains important information about
   potential problems and may specify the order to run certain commands.
   Many upgrades require specific additional steps such as renaming or
   deleting specific files prior to installing the new world. These will
   be listed at the end of this file where the currently recommended
   upgrade sequence is explicitly spelled out. If ``UPDATING``
   contradicts any steps in this chapter, the instructions in
   ``UPDATING`` take precedence and should be followed.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Do Not Use ``make world``:
~~~~~~~~~~~~~~~~~~~~~~~~~~

Some older documentation recommends using ``make       world``. However,
that command skips some important steps and should only be used by
experts. For almost all circumstances ``make world`` is the wrong thing
to do, and the procedure described here should be used instead.

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

24.6.1.?Overview of Process
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The build world process assumes an upgrade from an older FreeBSD version
using the source of a newer version that was obtained using the
instructions in `Section?24.5, “Synchronizing
Source” <synching.html>`__.

In FreeBSD, the term “world” includes the kernel, core system binaries,
libraries, programming files, and built-in compiler. The order in which
these components are built and installed is important.

For example, the old compiler might have a bug and not be able to
compile the new kernel. Since the new kernel should be built with the
new compiler, the new compiler must be built, but not necessarily
installed, before the new kernel is built.

The new world might rely on new kernel features, so the new kernel must
be installed before the new world is installed. The old world might not
run correctly on the new kernel, so the new world must be installed
immediately upon installing the new kernel.

Some configuration changes must be made before the new world is
installed, but others might break the old world. Hence, two different
configuration upgrade steps are used. For the most part, the update
process only replaces or adds files and existing old files are not
deleted. Since this can cause problems, ``/usr/src/UPDATING`` will
indicate if any files need to be manually deleted and at which step to
do so.

These concerns have led to the recommended upgrade sequence described in
the following procedure.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is a good idea to save the output from running ``make`` to a file. If
something goes wrong, a copy of the error message can be posted to one
of the FreeBSD mailing lists.

The easiest way to do this is to use ``script`` with a parameter that
specifies the name of the file to save all output to. Do not save the
output to ``/tmp`` as this directory may be cleared at next reboot. A
better place to save the file is ``/var/tmp``. Run this command
immediately before rebuilding the world, and then type **``exit``** when
the process has finished:

.. code:: screen

    # script /var/tmp/mw.out
    Script started, output file is /var/tmp/mw.out

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?24.2.?Overview of Build World Process

.. raw:: html

   </div>

The commands used in the build world process should be run in the order
specified here. This section summarizes the function of each command.

#. If the build world process has previously been run on this system, a
   copy of the previous build may still exist in ``/usr/obj``. To speed
   up the new build world process, and possibly save some dependency
   headaches, remove this directory if it already exists:

   .. code:: screen

       # chflags -R noschg /usr/obj/*
       # rm -rf /usr/obj

#. Compile the new compiler and a few related tools, then use the new
   compiler to compile the rest of the new world. The result is saved to
   ``/usr/obj``.

   .. code:: screen

       # cd /usr/src
       # make buildworld

#. Use the new compiler residing in ``/usr/obj`` to build the new
   kernel, in order to protect against compiler-kernel mismatches. This
   is necessary, as certain memory structures may have changed, and
   programs like ``ps`` and ``top`` will fail to work if the kernel and
   source code versions are not the same.

   .. code:: screen

       # make buildkernel

#. Install the new kernel and kernel modules, making it possible to boot
   with the newly updated kernel. If ``kern.securelevel`` has been
   raised above ``1`` *and* ``noschg`` or similar flags have been set on
   the kernel binary, drop the system into single-user mode first.
   Otherwise, this command can be run from multi-user mode without
   problems. See
   `init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
   for details about ``kern.securelevel`` and
   `chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__
   for details about the various file flags.

   .. code:: screen

       # make installkernel

#. Drop the system into single-user mode in order to minimize problems
   from updating any binaries that are already running. It also
   minimizes any problems from running the old world on a new kernel.

   .. code:: screen

       # shutdown now

   Once in single-user mode, run these commands if the system is
   formatted with UFS:

   .. code:: screen

       # mount -u /
       # mount -a -t ufs
       # swapon -a

   If the system is instead formatted with ZFS, run these two commands.
   This example assumes a zpool name of ``zroot``:

   .. code:: screen

       # zfs set readonly=off zroot
       # zfs mount -a

#. Optional: If a keyboard mapping other than the default US English is
   desired, it can be changed with
   `kbdmap(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmap&sektion=1>`__:

   .. code:: screen

       # kbdmap

#. Then, for either file system, if the CMOS clock is set to local time
   (this is true if the output of
   `date(1) <http://www.FreeBSD.org/cgi/man.cgi?query=date&sektion=1>`__
   does not show the correct time and zone), run:

   .. code:: screen

       # adjkerntz -i

#. Remaking the world will not update certain directories, such as
   ``/etc``, ``/var`` and ``/usr``, with new or changed configuration
   files. The next step is to perform some initial configuration file
   updates to ``/etc`` in preparation for the new world. The following
   command compares only those files that are essential for the success
   of ``installworld``. For instance, this step may add new groups,
   system accounts, or startup scripts which have been added to FreeBSD
   since the last update. This is necessary so that the ``installworld``
   step will be able to use any new system accounts, groups, and
   scripts. Refer to `Section?24.6.4, “Merging Configuration
   Files” <makeworld.html#mergemaster>`__ for more detailed instructions
   about this command:

   .. code:: screen

       # mergemaster -p

#. Install the new world and system binaries from ``/usr/obj``.

   .. code:: screen

       # cd /usr/src
       # make installworld

#. Update any remaining configuration files.

   .. code:: screen

       # mergemaster -iF

#. Delete any obsolete files. This is important as they may cause
   problems if left on the disk.

   .. code:: screen

       # make delete-old

#. A full reboot is now needed to load the new kernel and new world with
   the new configuration files.

   .. code:: screen

       # reboot

#. Make sure that all installed ports have first been rebuilt before old
   libraries are removed using the instructions in `Section?5.5.3,
   “Upgrading Ports” <ports-using.html#ports-upgrading>`__. When
   finished, remove any obsolete libraries to avoid conflicts with newer
   ones. For a more detailed description of this step, refer to
   `Section?24.6.5, “Deleting Obsolete Files and
   Libraries” <makeworld.html#make-delete-old>`__.

   .. code:: screen

       # make delete-old-libs

.. raw:: html

   </div>

If the system can have a window of down-time, consider compiling the
system in single-user mode instead of compiling the system in multi-user
mode, and then dropping into single-user mode for the installation.
Reinstalling the system touches a lot of important system files, all the
standard system binaries, libraries, and include files. Changing these
on a running system, particularly one with active users, is asking for
trouble.

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

24.6.2.?Configuration Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This build world process uses several configuration files.

The ``Makefile`` located in ``/usr/src`` describes how the programs that
comprise FreeBSD should be built and the order in which they should be
built.

The options available to ``make`` are described in
`make.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=make.conf&sektion=5>`__
and some common examples are included in
``/usr/share/examples/etc/make.conf``. Any options which are added to
``/etc/make.conf`` will control the how ``make`` runs and builds
programs. These options take effect every time ``make`` is used,
including compiling applications from the Ports Collection, compiling
custom C programs, or building the FreeBSD operating system. Changes to
some settings can have far-reaching and potentially surprising effects.
Read the comments in both locations and keep in mind that the defaults
have been chosen for a combination of performance and safety.

How the operating system is built from source code is controlled by
``/etc/src.conf``. Unlike ``/etc/make.conf``, the contents of
``/etc/src.conf`` only take effect when the FreeBSD operating system
itself is being built. Descriptions of the many options available for
this file are shown in
`src.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=src.conf&sektion=5>`__.
Be cautious about disabling seemingly unneeded kernel modules and build
options. Sometimes there are unexpected or subtle interactions.

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

24.6.3.?Variables and Targets
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The general format for using ``make`` is as follows:

.. code:: screen

    # make -x -DVARIABLE target

In this example, ``-x`` is an option passed to ``make``. Refer to
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
for examples of the available options.

To pass a variable, specify the variable name with ``-DVARIABLE``. The
behavior of the ``Makefile`` is controlled by variables. These can
either be set in ``/etc/make.conf`` or they can be specified when using
``make``. For example, this variable specifies that profiled libraries
should not be built:

.. code:: screen

    # make -DNO_PROFILE target

It corresponds with this setting in ``/etc/make.conf``:

.. code:: programlisting

    NO_PROFILE=    true     #    Avoid compiling profiled libraries

The *``target``* tells ``make`` what to do and the ``Makefile`` defines
the available targets. Some targets are used by the build process to
break out the steps necessary to rebuild the system into a number of
sub-steps.

Having separate options is useful for two reasons. First, it allows for
a build that does not affect any components of a running system. Because
of this, ``buildworld`` can be safely run on a machine running in
multi-user mode. It is still recommended that ``installworld`` be run in
part in single-user mode, though.

Secondly, it allows NFS mounts to be used to upgrade multiple machines
on a network, as described in `Section?24.7, “Tracking for Multiple
Machines” <small-lan.html>`__.

It is possible to specify ``-j`` which will cause ``make`` to spawn
several simultaneous processes. Since much of the compiling process is
I/O-bound rather than CPU-bound, this is useful on both single CPU and
multi-CPU machines.

On a single-CPU machine, run the following command to have up to 4
processes running at any one time. Empirical evidence posted to the
mailing lists shows this generally gives the best performance benefit.

.. code:: screen

    # make -j4 buildworld

On a multi-CPU machine, try values between ``6`` and ``10`` to see how
they speed things up.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If any variables were specified to ``make         buildworld``, specify
the same variables to ``make installworld``. However, ``-j`` must
*never* be used with ``installworld``.

For example, if this command was used:

.. code:: screen

    # make -DNO_PROFILE buildworld

Install the results with:

.. code:: screen

    # make -DNO_PROFILE installworld

Otherwise, the second command will try to install profiled libraries
that were not built during the ``make buildworld`` phase.

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

24.6.4.?Merging Configuration Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides the
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__
Bourne script to aid in determining the differences between the
configuration files in ``/etc``, and the configuration files in
``/usr/src/etc``. This is the recommended solution for keeping the
system configuration files up to date with those located in the source
tree.

Before using ``mergemaster``, it is recommended to first copy the
existing ``/etc`` somewhere safe. Include ``-R`` which does a recursive
copy and ``-p`` which preserves times and the ownerships on files:

.. code:: screen

    # cp -Rp /etc /etc.old

When run, ``mergemaster`` builds a temporary root environment, from
``/`` down, and populates it with various system configuration files.
Those files are then compared to the ones currently installed in the
system. Files that differ will be shown in
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
format, with the ``+`` sign representing added or modified lines, and
``-`` representing lines that will be either removed completely or
replaced with a new file. Refer to
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
for more information about how file differences are shown.

Next, ``mergemaster`` will display each file that differs, and present
options to: delete the new file, referred to as the temporary file,
install the temporary file in its unmodified state, merge the temporary
file with the currently installed file, or view the results again.

Choosing to delete the temporary file will tell ``mergemaster`` to keep
the current file unchanged and to delete the new version. This option is
not recommended. To get help at any time, type **?** at the
``mergemaster`` prompt. If the user chooses to skip a file, it will be
presented again after all other files have been dealt with.

Choosing to install the unmodified temporary file will replace the
current file with the new one. For most unmodified files, this is the
best option.

Choosing to merge the file will present a text editor, and the contents
of both files. The files can be merged by reviewing both files side by
side on the screen, and choosing parts from both to create a finished
product. When the files are compared side by side, **l** selects the
left contents and **r** selects contents from the right. The final
output will be a file consisting of both parts, which can then be
installed. This option is customarily used for files where settings have
been modified by the user.

Choosing to view the results again will redisplay the file differences.

After ``mergemaster`` is done with the system files, it will prompt for
other options. It may prompt to rebuild the password file and will
finish up with an option to remove left-over temporary files.

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

24.6.5.?Deleting Obsolete Files and Libraries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Based on notes provided by Anton Shterenlikht.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As a part of the FreeBSD development lifecycle, files and their contents
occasionally become obsolete. This may be because functionality is
implemented elsewhere, the version number of the library has changed, or
it was removed from the system entirely. These obsoleted files,
libraries, and directories should be removed when updating the system.
This ensures that the system is not cluttered with old files which take
up unnecessary space on the storage and backup media. Additionally, if
the old library has a security or stability issue, the system should be
updated to the newer library to keep it safe and to prevent crashes
caused by the old library. Files, directories, and libraries which are
considered obsolete are listed in ``/usr/src/ObsoleteFiles.inc``. The
following instructions should be used to remove obsolete files during
the system upgrade process.

After the ``make installworld`` and the subsequent ``mergemaster`` have
finished successfully, check for obsolete files and libraries:

.. code:: screen

    # cd /usr/src
    # make check-old

If any obsolete files are found, they can be deleted using the following
command:

.. code:: screen

    # make delete-old

A prompt is displayed before deleting each obsolete file. To skip the
prompt and let the system remove these files automatically, use
``BATCH_DELETE_OLD_FILES``:

.. code:: screen

    # make -DBATCH_DELETE_OLD_FILES delete-old

The same goal can be achieved by piping these commands through ``yes``:

.. code:: screen

    # yes|make delete-old

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Deleting obsolete files will break applications that still depend on
those obsolete files. This is especially true for old libraries. In most
cases, the programs, ports, or libraries that used the old library need
to be recompiled before ``make delete-old-libs`` is executed.

.. raw:: html

   </div>

Utilities for checking shared library dependencies include
`sysutils/libchk <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/libchk/pkg-descr>`__
and
`sysutils/bsdadminscripts <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/bsdadminscripts/pkg-descr>`__.

Obsolete shared libraries can conflict with newer libraries, causing
messages like these:

.. code:: screen

    /usr/bin/ld: warning: libz.so.4, needed by /usr/local/lib/libtiff.so, may conflict with libz.so.5
    /usr/bin/ld: warning: librpcsvc.so.4, needed by /usr/local/lib/libXext.so, may conflict with librpcsvc.so.5

To solve these problems, determine which port installed the library:

.. code:: screen

    # pkg which /usr/local/lib/libtiff.so
      /usr/local/lib/libtiff.so was installed by package tiff-3.9.4
    # pkg which /usr/local/lib/libXext.so
      /usr/local/lib/libXext.so was installed by package libXext-1.1.1,1

Then deinstall, rebuild, and reinstall the port. To automate this
process,
`ports-mgmt/portmaster <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmaster/pkg-descr>`__
can be used. After all ports are rebuilt and no longer use the old
libraries, delete the old libraries using the following command:

.. code:: screen

    # make delete-old-libs

If something goes wrong, it is easy to rebuild a particular piece of the
system. For example, if ``/etc/magic`` was accidentally deleted as part
of the upgrade or merge of ``/etc``, ``file`` will stop working. To fix
this, run:

.. code:: screen

    # cd /usr/src/usr.bin/file
    # make all install

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

24.6.6.?Common Questions
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

Do I need to re-make the world for every change?
    It depends upon the nature of the change. For example, if svn only
    shows the following files as being updated:

    .. code:: screen

        src/games/cribbage/instr.c
        src/games/sail/pl_main.c
        src/release/sysinstall/config.c
        src/release/sysinstall/media.c
        src/share/mk/bsd.port.mk

    it probably is not worth rebuilding the entire world. Instead, go
    into the appropriate sub-directories and run ``make all install``.
    But if something major changes, such as ``src/lib/libc/stdlib``,
    consider rebuilding world.

    Some users rebuild world every fortnight and let changes accumulate
    over that fortnight. Others only re-make those things that have
    changed and are careful to spot all the dependencies. It all depends
    on how often a user wants to upgrade and whether they are tracking
    FreeBSD-STABLE or FreeBSD-CURRENT.

What would cause a compile to fail with lots of signal 11 (or other
signal number) errors?
    This normally indicates a hardware problem. Building world is an
    effective way to stress test hardware, especially memory. A sure
    indicator of a hardware issue is when make is restarted and it dies
    at a different point in the process.

    To resolve this error, swap out the components in the machine,
    starting with RAM, to determine which component is failing.

Can ``/usr/obj`` be removed when finished?
    This directory contains all the object files that were produced
    during the compilation phase. Normally, one of the first steps in
    the ``make         buildworld`` process is to remove this directory
    and start afresh. Keeping ``/usr/obj`` around when finished makes
    little sense, and its removal frees up a approximately 2GB of disk
    space.

Can interrupted builds be resumed?
    This depends on how far into the process the problem occurs. In
    general, ``make         buildworld`` builds new copies of essential
    tools and the system libraries. These tools and libraries are then
    installed, used to rebuild themselves, and are installed again. The
    rest of the system is then rebuilt with the new system tools.

    During the last stage, it is fairly safe to run these commands as
    they will not undo the work of the previous ``make buildworld``:

    .. code:: screen

        # cd /usr/src
        # make -DNO_CLEAN all

    If this message appears:

    .. code:: screen

        --------------------------------------------------------------
        Building everything..
        --------------------------------------------------------------

    in the ``make buildworld`` output, it is probably fairly safe to do
    so.

    If that message is not displayed, it is always better to be safe
    than sorry and to restart the build from scratch.

Is it possible to speed up making the world?
    Several actions can speed up the build world process. For example,
    the entire process can be run from single-user mode. However, this
    will prevent users from having access to the system until the
    process is complete.

    Careful file system design or the use of ZFS datasets can make a
    difference. Consider putting ``/usr/src`` and ``/usr/obj`` on
    separate file systems. If possible, place the file systems on
    separate disks on separate disk controllers. When mounting
    ``/usr/src``, use ``noatime`` which prevents the file system from
    recording the file access time. If ``/usr/src`` is not on its own
    file system, consider remounting ``/usr`` with ``noatime``.

    The file system holding ``/usr/obj`` can be mounted or remounted
    with ``async`` so that disk writes happen asynchronously. The write
    completes immediately, and the data is written to the disk a few
    seconds later. This allows writes to be clustered together, and can
    provide a dramatic performance boost.

    .. raw:: html

       <div class="warning" xmlns="">

    Warning:
    ~~~~~~~~

    Keep in mind that this option makes the file system more fragile.
    With this option, there is an increased chance that, should power
    fail, the file system will be in an unrecoverable state when the
    machine restarts.

    If ``/usr/obj`` is the only directory on this file system, this is
    not a problem. If you have other, valuable data on the same file
    system, ensure that there are verified backups before enabling this
    option.

    .. raw:: html

       </div>

    Turn off profiling by setting “NO\_PROFILE=true” in
    ``/etc/make.conf``.

    Pass ``-jn`` to
    `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
    to run multiple processes in parallel. This usually helps on both
    single- and multi-processor machines.

What if something goes wrong?
    First, make absolutely sure that the environment has no extraneous
    cruft from earlier builds:

    .. code:: screen

        # chflags -R noschg /usr/obj/usr
        # rm -rf /usr/obj/usr
        # cd /usr/src
        # make cleandir
        # make cleandir

    Yes, ``make cleandir`` really should be run twice.

    Then, restart the whole process, starting with ``make buildworld``.

    If problems persist, send the error and the output of ``uname -a``
    to `FreeBSD general questions mailing
    list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__.
    Be prepared to answer other questions about the setup!

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+------------------------------------+-----------------------------------------+
| `Prev <synching.html>`__?     | `Up <updating-upgrading.html>`__   | ?\ `Next <small-lan.html>`__            |
+-------------------------------+------------------------------------+-----------------------------------------+
| 24.5.?Synchronizing Source?   | `Home <index.html>`__              | ?24.7.?Tracking for Multiple Machines   |
+-------------------------------+------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
