============================
Chapter?10.?Kernel Debugging
============================

.. raw:: html

   <div class="navheader">

Chapter?10.?Kernel Debugging
`Prev <kernelbuild-new.html>`__?
Part?III.?Kernel
?\ `Next <kerneldebug-gdb.html>`__

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

Chapter?10.?Kernel Debugging
----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Paul Richards, J?rg Wunsch and Robert Watson.

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

`10.1. Obtaining a Kernel Crash
Dump <kerneldebug.html#kerneldebug-obtain>`__
`10.2. Debugging a Kernel Crash Dump with
``kgdb`` <kerneldebug-gdb.html>`__
`10.3. Debugging a Crash Dump with DDD <kerneldebug-ddd.html>`__
`10.4. On-Line Kernel Debugging Using
DDB <kerneldebug-online-ddb.html>`__
`10.5. On-Line Kernel Debugging Using Remote
GDB <kerneldebug-online-gdb.html>`__
`10.6. Debugging a Console Driver <kerneldebug-console.html>`__
`10.7. Debugging Deadlocks <kerneldebug-deadlocks.html>`__
`10.8. Kernel debugging with Dcons <kerneldebug-dcons.html>`__
`10.9. Glossary of Kernel Options for
Debugging <kerneldebug-options.html>`__

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

10.1.?Obtaining a Kernel Crash Dump
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When running a development kernel (e.g., FreeBSD-CURRENT), such as a
kernel under extreme conditions (e.g., very high load averages, tens of
thousands of connections, exceedingly high number of concurrent users,
hundreds of
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__\ s,
etc.), or using a new feature or device driver on FreeBSD-STABLE (e.g.,
PAE), sometimes a kernel will panic. In the event that it does, this
chapter will demonstrate how to extract useful information out of a
crash.

A system reboot is inevitable once a kernel panics. Once a system is
rebooted, the contents of a system's physical memory (RAM) is lost, as
well as any bits that are on the swap device before the panic. To
preserve the bits in physical memory, the kernel makes use of the swap
device as a temporary place to store the bits that are in RAM across a
reboot after a crash. In doing this, when FreeBSD boots after a crash, a
kernel image can now be extracted and debugging can take place.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

A swap device that has been configured as a dump device still acts as a
swap device. Dumps to non-swap devices (such as tapes or CDRWs, for
example) are not supported at this time. A “swap device” is synonymous
with a “swap partition.”

.. raw:: html

   </div>

Several types of kernel crash dumps are available: full memory dumps,
which hold the complete contents of physical memory, minidumps, which
hold only memory pages in use by the kernel (FreeBSD? 6.2 and higher),
and textdumps, which hold captured scripted or interactive debugger
output (FreeBSD?7.1 and higher). Minidumps are the default dump type as
of FreeBSD?7.0, and in most cases will capture all necessary information
present in a full memory dump, as most problems can be isolated only
using kernel state.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.1.1.?Configuring the Dump Device
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before the kernel will dump the contents of its physical memory to a
dump device, a dump device must be configured. A dump device is
specified by using the
`dumpon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dumpon&sektion=8>`__
command to tell the kernel where to save kernel crash dumps. The
`dumpon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dumpon&sektion=8>`__
program must be called after the swap partition has been configured with
`swapon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=8>`__.
This is normally handled by setting the ``dumpdev`` variable in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
to the path of the swap device (the recommended way to extract a kernel
dump) or ``AUTO`` to use the first configured swap device. The default
for ``dumpdev`` is ``AUTO`` in HEAD, and changed to ``NO`` on RELENG\_\*
branches (except for RELENG\_7, which was left set to ``AUTO``). On
FreeBSD?9.0-RELEASE and later versions, bsdinstall will ask whether
crash dumps should be enabled on the target system during the install
process.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

Check ``/etc/fstab`` or
`swapinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapinfo&sektion=8>`__
for a list of swap devices.

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Make sure the ``dumpdir`` specified in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
exists before a kernel crash!

.. code:: screen

    # mkdir /var/crash
    # chmod 700 /var/crash

Also, remember that the contents of ``/var/crash`` is sensitive and very
likely contains confidential information such as passwords.

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

10.1.2.?Extracting a Kernel Dump
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once a dump has been written to a dump device, the dump must be
extracted before the swap device is mounted. To extract a dump from a
dump device, use the
`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8>`__
program. If ``dumpdev`` has been set in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__,
`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8>`__
will be called automatically on the first multi-user boot after the
crash and before the swap device is mounted. The location of the
extracted core is placed in the
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
value ``dumpdir``, by default ``/var/crash`` and will be named
``vmcore.0``.

In the event that there is already a file called ``vmcore.0`` in
``/var/crash`` (or whatever ``dumpdir`` is set to), the kernel will
increment the trailing number for every crash to avoid overwriting an
existing ``vmcore`` (e.g., ``vmcore.1``). While debugging, it is highly
likely that you will want to use the highest version ``vmcore`` in
``/var/crash`` when searching for the right ``vmcore``.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

If you are testing a new kernel but need to boot a different one in
order to get your system up and running again, boot it only into single
user mode using the ``-s`` flag at the boot prompt, and then perform the
following steps:

.. code:: screen

    # fsck -p
    # mount -a -t ufs       # make sure /var/crash is writable
    # savecore /var/crash /dev/ad0s1b
    # exit                  # exit to multi-user

This instructs
`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8>`__
to extract a kernel dump from ``/dev/ad0s1b`` and place the contents in
``/var/crash``. Do not forget to make sure the destination directory
``/var/crash`` has enough space for the dump. Also, do not forget to
specify the correct path to your swap device as it is likely different
than ``/dev/ad0s1b``!

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+------------------------------------------------------+
| `Prev <kernelbuild-new.html>`__?        | `Up <kernel.html>`__    | ?\ `Next <kerneldebug-gdb.html>`__                   |
+-----------------------------------------+-------------------------+------------------------------------------------------+
| 9.2.?Building a Kernel the “New” Way?   | `Home <index.html>`__   | ?10.2.?Debugging a Kernel Crash Dump with ``kgdb``   |
+-----------------------------------------+-------------------------+------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
