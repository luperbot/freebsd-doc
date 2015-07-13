==========================
13.2.?FreeBSD Boot Process
==========================

.. raw:: html

   <div class="navheader">

13.2.?FreeBSD Boot Process
`Prev <boot.html>`__?
Chapter?13.?The FreeBSD Booting Process
?\ `Next <boot-splash.html>`__

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

13.2.?FreeBSD Boot Process
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Turning on a computer and starting the operating system poses an
interesting dilemma. By definition, the computer does not know how to do
anything until the operating system is started. This includes running
programs from the disk. If the computer can not run a program from the
disk without the operating system, and the operating system programs are
on the disk, how is the operating system started?

This problem parallels one in the book *The Adventures of Baron
Munchausen*. A character had fallen part way down a manhole, and pulled
himself out by grabbing his bootstraps and lifting. In the early days of
computing, the term *bootstrap* was applied to the mechanism used to
load the operating system. It has since become shortened to “booting”.

On x86 hardware, the Basic Input/Output System (BIOS) is responsible for
loading the operating system. The BIOS looks on the hard disk for the
Master Boot Record (MBR), which must be located in a specific place on
the disk. The BIOS has enough knowledge to load and run the MBR, and
assumes that the MBR can then carry out the rest of the tasks involved
in loading the operating system, possibly with the help of the BIOS.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

FreeBSD provides for booting from both the older MBR standard, and the
newer GUID Partition Table (GPT). GPT partitioning is often found on
computers with the Unified Extensible Firmware Interface (UEFI).
However, FreeBSD can boot from GPT partitions even on machines with only
a legacy BIOS with
`gptboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gptboot&sektion=8>`__.
Work is under way to provide direct UEFI booting.

.. raw:: html

   </div>

The code within the MBR is typically referred to as a *boot manager*,
especially when it interacts with the user. The boot manager usually has
more code in the first track of the disk or within the file system.
Examples of boot managers include the standard FreeBSD boot manager
boot0, also called Boot Easy, and Grub, which is used by many Linux?
distributions.

If only one operating system is installed, the MBR searches for the
first bootable (active) slice on the disk, and then runs the code on
that slice to load the remainder of the operating system. When multiple
operating systems are present, a different boot manager can be installed
to display a list of operating systems so the user can select one to
boot.

The remainder of the FreeBSD bootstrap system is divided into three
stages. The first stage knows just enough to get the computer into a
specific state and run the second stage. The second stage can do a
little bit more, before running the third stage. The third stage
finishes the task of loading the operating system. The work is split
into three stages because the MBR puts limits on the size of the
programs that can be run at stages one and two. Chaining the tasks
together allows FreeBSD to provide a more flexible loader.

The kernel is then started and begins to probe for devices and
initialize them for use. Once the kernel boot process is finished, the
kernel passes control to the user process
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__,
which makes sure the disks are in a usable state, starts the user-level
resource configuration which mounts file systems, sets up network cards
to communicate on the network, and starts the processes which have been
configured to run at startup.

This section describes these stages in more detail and demonstrates how
to interact with the FreeBSD boot process.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.2.1.?The Boot Manager
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The boot manager code in the MBR is sometimes referred to as *stage
zero* of the boot process. By default, FreeBSD uses the boot0 boot
manager.

The MBR installed by the FreeBSD installer is based on ``/boot/boot0``.
The size and capability of boot0 is restricted to 446 bytes due to the
slice table and ``0x55AA`` identifier at the end of the MBR. If boot0
and multiple operating systems are installed, a message similar to this
example will be displayed at boot time:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?13.1.?\ ``boot0`` Screenshot

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    F1 Win
    F2 FreeBSD

    Default: F2

.. raw:: html

   </div>

.. raw:: html

   </div>

Other operating systems will overwrite an existing MBR if they are
installed after FreeBSD. If this happens, or to replace the existing MBR
with the FreeBSD MBR, use the following command:

.. code:: screen

    # fdisk -B -b /boot/boot0 device

where *``device``* is the boot disk, such as ``ad0`` for the first IDE
disk, ``ad2`` for the first IDE disk on a second IDE controller, or
``da0`` for the first SCSI disk. To create a custom configuration of the
MBR, refer to
`boot0cfg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot0cfg&sektion=8>`__.

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

13.2.2.?Stage One and Stage Two
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Conceptually, the first and second stages are part of the same program
on the same area of the disk. Because of space constraints, they have
been split into two, but are always installed together. They are copied
from the combined ``/boot/boot`` by the FreeBSD installer or
``bsdlabel``.

These two stages are located outside file systems, in the first track of
the boot slice, starting with the first sector. This is where boot0, or
any other boot manager, expects to find a program to run which will
continue the boot process.

The first stage, ``boot1``, is very simple, since it can only be 512
bytes in size. It knows just enough about the FreeBSD *bsdlabel*, which
stores information about the slice, to find and execute ``boot2``.

Stage two, ``boot2``, is slightly more sophisticated, and understands
the FreeBSD file system enough to find files. It can provide a simple
interface to choose the kernel or loader to run. It runs loader, which
is much more sophisticated and provides a boot configuration file. If
the boot process is interrupted at stage two, the following interactive
screen is displayed:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?13.2.?\ ``boot2`` Screenshot

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    >> FreeBSD/i386 BOOT
    Default: 0:ad(0,a)/boot/loader
    boot:

.. raw:: html

   </div>

.. raw:: html

   </div>

To replace the installed ``boot1`` and ``boot2``, use ``bsdlabel``,
where *``diskslice``* is the disk and slice to boot from, such as
``ad0s1`` for the first slice on the first IDE disk:

.. code:: screen

    # bsdlabel -B diskslice

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

If just the disk name is used, such as ``ad0``, ``bsdlabel`` will create
the disk in “dangerously dedicated mode”, without slices. This is
probably not the desired action, so double check the *``diskslice``*
before pressing **Return**.

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

13.2.3.?Stage Three
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The loader is the final stage of the three-stage bootstrap process. It
is located on the file system, usually as ``/boot/loader``.

The loader is intended as an interactive method for configuration, using
a built-in command set, backed up by a more powerful interpreter which
has a more complex command set.

During initialization, loader will probe for a console and for disks,
and figure out which disk it is booting from. It will set variables
accordingly, and an interpreter is started where user commands can be
passed from a script or interactively.

The loader will then read ``/boot/loader.rc``, which by default reads in
``/boot/defaults/loader.conf`` which sets reasonable defaults for
variables and reads ``/boot/loader.conf`` for local changes to those
variables. ``loader.rc`` then acts on these variables, loading whichever
modules and kernel are selected.

Finally, by default, loader issues a 10 second wait for key presses, and
boots the kernel if it is not interrupted. If interrupted, the user is
presented with a prompt which understands the command set, where the
user may adjust variables, unload all modules, load modules, and then
finally boot or reboot. `Table?13.1, “Loader Built-In
Commands” <boot-introduction.html#boot-loader-commands>`__ lists the
most commonly used loader commands. For a complete discussion of all
available commands, refer to
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?13.1.?Loader Built-In Commands

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable                                                 | Description                                                                                                                                                                                                                                                                                                                                    |
+==========================================================+================================================================================================================================================================================================================================================================================================================================================+
| autoboot *``seconds``*                                   | Proceeds to boot the kernel if not interrupted within the time span given, in seconds. It displays a countdown, and the default time span is 10 seconds.                                                                                                                                                                                       |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| boot [*``-options``*] [*``kernelname``*]                 | Immediately proceeds to boot the kernel, with any specified options or kernel name. Providing a kernel name on the command-line is only applicable after an ``unload`` has been issued. Otherwise, the previously-loaded kernel will be used. If *kernelname* is not qualified it will be searched under */boot/kernel* and */boot/modules*.   |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| boot-conf                                                | Goes through the same automatic configuration of modules based on specified variables, most commonly ``kernel``. This only makes sense if ``unload`` is used first, before changing some variables.                                                                                                                                            |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| help [*``topic``*]                                       | Shows help messages read from ``/boot/loader.help``. If the topic given is ``index``, the list of available topics is displayed.                                                                                                                                                                                                               |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| include *``filename``* …                                 | Reads the specified file and interprets it line by line. An error immediately stops the ``include``.                                                                                                                                                                                                                                           |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| load [-t *``type``*] *``filename``*                      | Loads the kernel, kernel module, or file of the type given, with the specified filename. Any arguments after *``filename``* are passed to the file. If *filename* is not qualified it will be searched under */boot/kernel* and */boot/modules*.                                                                                               |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ls [-l] [*``path``*]                                     | Displays a listing of files in the given path, or the root directory, if the path is not specified. If ``-l`` is specified, file sizes will also be shown.                                                                                                                                                                                     |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| lsdev [-v]                                               | Lists all of the devices from which it may be possible to load modules. If ``-v`` is specified, more details are printed.                                                                                                                                                                                                                      |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| lsmod [-v]                                               | Displays loaded modules. If ``-v`` is specified, more details are shown.                                                                                                                                                                                                                                                                       |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| more *``filename``*                                      | Displays the files specified, with a pause at each ``LINES`` displayed.                                                                                                                                                                                                                                                                        |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| reboot                                                   | Immediately reboots the system.                                                                                                                                                                                                                                                                                                                |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| set *``variable``*, set *``variable``*\ =\ *``value``*   | Sets the specified environment variables.                                                                                                                                                                                                                                                                                                      |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| unload                                                   | Removes all loaded modules.                                                                                                                                                                                                                                                                                                                    |
+----------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Here are some practical examples of loader usage. To boot the usual
kernel in single-user mode :

.. code:: screen

    boot -s

To unload the usual kernel and modules and then load the previous or
another, specified kernel:

.. code:: screen

    unload
    load kernel.old

Use ``kernel.GENERIC`` to refer to the default kernel that comes with an
installation, or ``kernel.old``, to refer to the previously installed
kernel before a system upgrade or before configuring a custom kernel.

Use the following to load the usual modules with another kernel:

.. code:: screen

    unload
    set kernel="kernel.old"
    boot-conf

To load an automated kernel configuration script:

.. code:: screen

    load -t userconfig_script /boot/kernel.conf

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

13.2.4.?Last Stage
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the kernel is loaded by either loader or by boot2, which bypasses
loader, it examines any boot flags and adjusts its behavior as
necessary. `Table?13.2, “Kernel Interaction During
Boot” <boot-introduction.html#boot-kernel>`__ lists the commonly used
boot flags. Refer to
`boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8>`__
for more information on the other boot flags.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?13.2.?Kernel Interaction During Boot

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------+--------------------------------------------------------------------------------------+
| Option   | Description                                                                          |
+==========+======================================================================================+
| ``-a``   | During kernel initialization, ask for the device to mount as the root file system.   |
+----------+--------------------------------------------------------------------------------------+
| ``-C``   | Boot the root file system from a CDROM.                                              |
+----------+--------------------------------------------------------------------------------------+
| ``-s``   | Boot into single-user mode.                                                          |
+----------+--------------------------------------------------------------------------------------+
| ``-v``   | Be more verbose during kernel startup.                                               |
+----------+--------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the kernel has finished booting, it passes control to the user
process
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__,
which is located at ``/sbin/init``, or the program path specified in the
``init_path`` variable in ``loader``. This is the last stage of the boot
process.

The boot sequence makes sure that the file systems available on the
system are consistent. If a UFS file system is not, and ``fsck`` cannot
fix the inconsistencies, init drops the system into single-user mode so
that the system administrator can resolve the problem directly.
Otherwise, the system boots into multi-user mode.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.2.4.1.?Single-User Mode
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A user can specify this mode by booting with ``-s`` or by setting the
``boot_single`` variable in loader. It can also be reached by running
``shutdown now`` from multi-user mode. Single-user mode begins with this
message:

.. code:: programlisting

    Enter full pathname of shell or RETURN for /bin/sh:

If the user presses **Enter**, the system will enter the default Bourne
shell. To specify a different shell, input the full path to the shell.

Single-user mode is usually used to repair a system that will not boot
due to an inconsistent file system or an error in a boot configuration
file. It can also be used to reset the ``root`` password when it is
unknown. These actions are possible as the single-user mode prompt gives
full, local access to the system and its configuration files. There is
no networking in this mode.

While single-user mode is useful for repairing a system, it poses a
security risk unless the system is in a physically secure location. By
default, any user who can gain physical access to a system will have
full control of that system after booting into single-user mode.

If the system ``console`` is changed to ``insecure`` in ``/etc/ttys``,
the system will first prompt for the ``root`` password before initiating
single-user mode. This adds a measure of security while removing the
ability to reset the ``root`` password when it is unknown.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?13.3.?Configuring an Insecure Console in ``/etc/ttys``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    # name  getty                           type    status          comments
    #
    # If console is marked "insecure", then init will ask for the root password
    # when going to single-user mode.
    console none                            unknown off insecure

.. raw:: html

   </div>

.. raw:: html

   </div>

An ``insecure`` console means that physical security to the console is
considered to be insecure, so only someone who knows the ``root``
password may use single-user mode.

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

13.2.4.2.?Multi-User Mode
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If init finds the file systems to be in order, or once the user has
finished their commands in single-user mode and has typed ``exit`` to
leave single-user mode, the system enters multi-user mode, in which it
starts the resource configuration of the system.

The resource configuration system reads in configuration defaults from
``/etc/defaults/rc.conf`` and system-specific details from
``/etc/rc.conf``. It then proceeds to mount the system file systems
listed in ``/etc/fstab``. It starts up networking services,
miscellaneous system daemons, then the startup scripts of locally
installed packages.

To learn more about the resource configuration system, refer to
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ and
examine the scripts located in ``/etc/rc.d``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------+-----------------------------------------------+
| `Prev <boot.html>`__?                      | `Up <boot.html>`__      | ?\ `Next <boot-splash.html>`__                |
+--------------------------------------------+-------------------------+-----------------------------------------------+
| Chapter?13.?The FreeBSD Booting Process?   | `Home <index.html>`__   | ?13.3.?Configuring Boot Time Splash Screens   |
+--------------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
