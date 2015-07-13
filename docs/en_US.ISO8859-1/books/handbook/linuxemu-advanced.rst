=====================
11.3.?Advanced Topics
=====================

.. raw:: html

   <div class="navheader">

11.3.?Advanced Topics
`Prev <linuxemu-lbc-install.html>`__?
Chapter?11.?Linux? Binary Compatibility
?\ `Next <system-administration.html>`__

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

11.3.?Advanced Topics
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes how Linux? binary compatibility works and is
based on an email written to `FreeBSD chat mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-chat>`__ by
Terry Lambert ``<tlambert@primenet.com>`` (Message ID:
``<199906020108.SAA07001@usr09.primenet.com>``).

FreeBSD has an abstraction called an “execution class loader”. This is a
wedge into the
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
system call.

Historically, the UNIX? loader examined the magic number (generally the
first 4 or 8 bytes of the file) to see if it was a binary known to the
system, and if so, invoked the binary loader.

If it was not the binary type for the system, the
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
call returned a failure, and the shell attempted to start executing it
as shell commands. The assumption was a default of “whatever the current
shell is”.

Later, a hack was made for
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ to
examine the first two characters, and if they were ``:\n``, it invoked
the `csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__
shell instead.

FreeBSD has a list of loaders, instead of a single loader, with a
fallback to the ``#!`` loader for running shell interpreters or shell
scripts.

For the Linux? ABI support, FreeBSD sees the magic number as an ELF
binary. The ELF loader looks for a specialized *brand*, which is a
comment section in the ELF image, and which is not present on
SVR4/Solaris™ ELF binaries.

For Linux? binaries to function, they must be *branded* as type
``Linux`` using
`brandelf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=brandelf&sektion=1>`__:

.. code:: screen

    # brandelf -t Linux file

When the ELF loader sees the ``Linux`` brand, the loader replaces a
pointer in the ``proc`` structure. All system calls are indexed through
this pointer. In addition, the process is flagged for special handling
of the trap vector for the signal trampoline code, and several other
(minor) fix-ups that are handled by the Linux? kernel module.

The Linux? system call vector contains, among other things, a list of
``sysent[]`` entries whose addresses reside in the kernel module.

When a system call is called by the Linux? binary, the trap code
dereferences the system call function pointer off the ``proc``
structure, and gets the Linux?, not the FreeBSD, system call entry
points.

Linux? mode dynamically *reroots* lookups. This is, in effect,
equivalent to the ``union`` option to file system mounts. First, an
attempt is made to lookup the file in ``/compat/linux/original-path``.
If that fails, the lookup is done in ``/original-path``. This makes sure
that binaries that require other binaries can run. For example, the
Linux? toolchain can all run under Linux? ABI support. It also means
that the Linux? binaries can load and execute FreeBSD binaries, if there
are no corresponding Linux? binaries present, and that a
`uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1>`__
command can be placed in the ``/compat/linux`` directory tree to ensure
that the Linux? binaries can not tell they are not running on Linux?.

In effect, there is a Linux? kernel in the FreeBSD kernel. The various
underlying functions that implement all of the services provided by the
kernel are identical to both the FreeBSD system call table entries, and
the Linux? system call table entries: file system operations, virtual
memory operations, signal delivery, and System V IPC. The only
difference is that FreeBSD binaries get the FreeBSD *glue* functions,
and Linux? binaries get the Linux? *glue* functions. The FreeBSD *glue*
functions are statically linked into the kernel, and the Linux? *glue*
functions can be statically linked, or they can be accessed via a kernel
module.

Technically, this is not really emulation, it is an ABI implementation.
It is sometimes called “Linux? emulation” because the implementation was
done at a time when there was no other word to describe what was going
on. Saying that FreeBSD ran Linux? binaries was not true, since the code
was not compiled in.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+--------------------------+--------------------------------------------+
| `Prev <linuxemu-lbc-install.html>`__?            | `Up <linuxemu.html>`__   | ?\ `Next <system-administration.html>`__   |
+--------------------------------------------------+--------------------------+--------------------------------------------+
| 11.2.?Configuring Linux? Binary Compatibility?   | `Home <index.html>`__    | ?Part?III.?System Administration           |
+--------------------------------------------------+--------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
