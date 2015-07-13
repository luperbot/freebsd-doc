========================================
10.4.?On-Line Kernel Debugging Using DDB
========================================

.. raw:: html

   <div class="navheader">

10.4.?On-Line Kernel Debugging Using DDB
`Prev <kerneldebug-ddd.html>`__?
Chapter?10.?Kernel Debugging
?\ `Next <kerneldebug-online-gdb.html>`__

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

10.4.?On-Line Kernel Debugging Using DDB
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While ``kgdb`` as an off-line debugger provides a very high level of
user interface, there are some things it cannot do. The most important
ones being breakpointing and single-stepping kernel code.

If you need to do low-level debugging on your kernel, there is an
on-line debugger available called DDB. It allows setting of breakpoints,
single-stepping kernel functions, examining and changing kernel
variables, etc. However, it cannot access kernel source files, and only
has access to the global and static symbols, not to the full debug
information like ``gdb`` does.

To configure your kernel to include DDB, add the options

.. code:: programlisting

    options KDB

.. code:: programlisting

    options DDB

to your config file, and rebuild. (See `The FreeBSD
Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/index.html>`__
for details on configuring the FreeBSD kernel).

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If you have an older version of the boot blocks, your debugger symbols
might not be loaded at all. Update the boot blocks; the recent ones load
the DDB symbols automatically.

.. raw:: html

   </div>

Once your DDB kernel is running, there are several ways to enter DDB.
The first, and earliest way is to type the boot flag ``-d`` right at the
boot prompt. The kernel will start up in debug mode and enter DDB prior
to any device probing. Hence you can even debug the device probe/attach
functions. Users of FreeBSD-CURRENT will need to use the boot menu
option, six, to escape to a command prompt.

The second scenario is to drop to the debugger once the system has
booted. There are two simple ways to accomplish this. If you would like
to break to the debugger from the command prompt, simply type the
command:

.. code:: screen

    # sysctl debug.kdb.enter=1

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

To force a panic on the fly, issue the following command:

.. code:: screen

    # sysctl debug.kdb.panic=1

.. raw:: html

   </div>

Alternatively, if you are at the system console, you may use a hot-key
on the keyboard. The default break-to-debugger sequence is
**Ctrl**+**Alt**+**ESC**. For syscons, this sequence can be remapped and
some of the distributed maps out there do this, so check to make sure
you know the right sequence to use. There is an option available for
serial consoles that allows the use of a serial line BREAK on the
console line to enter DDB (``options BREAK_TO_DEBUGGER`` in the kernel
config file). It is not the default since there are a lot of serial
adapters around that gratuitously generate a BREAK condition, for
example when pulling the cable.

The third way is that any panic condition will branch to DDB if the
kernel is configured to use it. For this reason, it is not wise to
configure a kernel with DDB for a machine running unattended.

To obtain the unattended functionality, add:

.. code:: programlisting

    options   KDB_UNATTENDED

to the kernel configuration file and rebuild/reinstall.

The DDB commands roughly resemble some ``gdb`` commands. The first thing
you probably need to do is to set a breakpoint:

.. code:: screen

    break function-name address

Numbers are taken hexadecimal by default, but to make them distinct from
symbol names; hexadecimal numbers starting with the letters ``a-f`` need
to be preceded with ``0x`` (this is optional for other numbers). Simple
expressions are allowed, for example: ``function-name + 0x103``.

To exit the debugger and continue execution, type:

.. code:: screen

    continue

To get a stack trace, use:

.. code:: screen

    trace

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Note that when entering DDB via a hot-key, the kernel is currently
servicing an interrupt, so the stack trace might be not of much use to
you.

.. raw:: html

   </div>

If you want to remove a breakpoint, use

.. code:: screen

    del
    del address-expression

The first form will be accepted immediately after a breakpoint hit, and
deletes the current breakpoint. The second form can remove any
breakpoint, but you need to specify the exact address; this can be
obtained from:

.. code:: screen

    show b

or:

.. code:: screen

    show break

To single-step the kernel, try:

.. code:: screen

    s

This will step into functions, but you can make DDB trace them until the
matching return statement is reached by:

.. code:: screen

    n

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This is different from ``gdb``'s ``next`` statement; it is like
``gdb``'s ``finish``. Pressing **n** more than once will cause a
continue.

.. raw:: html

   </div>

To examine data from memory, use (for example):

.. code:: screen

    x/wx 0xf0133fe0,40
    x/hd db_symtab_space
    x/bc termbuf,10
    x/s stringbuf

for word/halfword/byte access, and hexadecimal/decimal/character/ string
display. The number after the comma is the object count. To display the
next 0x10 items, simply use:

.. code:: screen

    x ,10

Similarly, use

.. code:: screen

    x/ia foofunc,10

to disassemble the first 0x10 instructions of ``foofunc``, and display
them along with their offset from the beginning of ``foofunc``.

To modify memory, use the write command:

.. code:: screen

    w/b termbuf 0xa 0xb 0
    w/w 0xf0010030 0 0

The command modifier (``b``/``h``/``w``) specifies the size of the data
to be written, the first following expression is the address to write to
and the remainder is interpreted as data to write to successive memory
locations.

If you need to know the current registers, use:

.. code:: screen

    show reg

Alternatively, you can display a single register value by e.g.

.. code:: screen

    p $eax

and modify it by:

.. code:: screen

    set $eax new-value

Should you need to call some kernel functions from DDB, simply say:

.. code:: screen

    call func(arg1, arg2, ...)

The return value will be printed.

For a `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
style summary of all running processes, use:

.. code:: screen

    ps

Now you have examined why your kernel failed, and you wish to reboot.
Remember that, depending on the severity of previous malfunctioning, not
all parts of the kernel might still be working as expected. Perform one
of the following actions to shut down and reboot your system:

.. code:: screen

    panic

This will cause your kernel to dump core and reboot, so you can later
analyze the core on a higher level with ``gdb``. This command usually
must be followed by another ``continue`` statement.

.. code:: screen

    call boot(0)

Might be a good way to cleanly shut down the running system, ``sync()``
all disks, and finally, in some cases, reboot. As long as the disk and
filesystem interfaces of the kernel are not damaged, this could be a
good way for an almost clean shutdown.

.. code:: screen

    call cpu_reset()

This is the final way out of disaster and almost the same as hitting the
Big Red Button.

If you need a short command summary, simply type:

.. code:: screen

    help

It is highly recommended to have a printed copy of the
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__
manual page ready for a debugging session. Remember that it is hard to
read the on-line manual while single-stepping the kernel.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-----------------------------+----------------------------------------------------+
| `Prev <kerneldebug-ddd.html>`__?         | `Up <kerneldebug.html>`__   | ?\ `Next <kerneldebug-online-gdb.html>`__          |
+------------------------------------------+-----------------------------+----------------------------------------------------+
| 10.3.?Debugging a Crash Dump with DDD?   | `Home <index.html>`__       | ?10.5.?On-Line Kernel Debugging Using Remote GDB   |
+------------------------------------------+-----------------------------+----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
