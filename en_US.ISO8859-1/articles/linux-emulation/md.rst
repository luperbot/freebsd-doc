==================================
4.?Linux? emulation layer -MD part
==================================

.. raw:: html

   <div class="navheader">

4.?Linux? emulation layer -MD part
`Prev <freebsd-emulation.html>`__?
?
?\ `Next <mi.html>`__

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

4.?Linux? emulation layer -MD part
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section deals with implementation of Linux? emulation layer in
FreeBSD operating system. It first describes the machine dependent part
talking about how and where interaction between userland and kernel is
implemented. It talks about syscalls, signals, ptrace, traps, stack
fixup. This part discusses i386 but it is written generally so other
architectures should not differ very much. The next part is the machine
independent part of the Linuxulator. This section only covers i386 and
ELF handling. A.OUT is obsolete and untested.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Syscall handling
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Syscall handling is mostly written in ``linux_sysvec.c``, which covers
most of the routines pointed out in the ``sysentvec`` structure. When a
Linux? process running on FreeBSD issues a syscall, the general syscall
routine calls linux prepsyscall routine for the Linux? ABI.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.1.?Linux? prepsyscall
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux? passes arguments to syscalls via registers (that is why it is
limited to 6 parameters on i386) while FreeBSD uses the stack. The
Linux? prepsyscall routine must copy parameters from registers to the
stack. The order of the registers is: ``%ebx``, ``%ecx``, ``%edx``,
``%esi``, ``%edi``, ``%ebp``. The catch is that this is true for only
*most* of the syscalls. Some (most notably ``clone``) uses a different
order but it is luckily easy to fix by inserting a dummy parameter in
the ``linux_clone`` prototype.

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

4.1.2.?Syscall writing
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Every syscall implemented in the Linuxulator must have its prototype
with various flags in ``syscalls.master``. The form of the file is:

.. code:: programlisting

    ...
        AUE_FORK STD        { int linux_fork(void); }
    ...
        AUE_CLOSE NOPROTO   { int close(int fd); }
    ...

The first column represents the syscall number. The second column is for
auditing support. The third column represents the syscall type. It is
either ``STD``, ``OBSOL``, ``NOPROTO`` and ``UNIMPL``. ``STD`` is a
standard syscall with full prototype and implementation. ``OBSOL`` is
obsolete and defines just the prototype. ``NOPROTO`` means that the
syscall is implemented elsewhere so do not prepend ABI prefix, etc.
``UNIMPL`` means that the syscall will be substituted with the ``nosys``
syscall (a syscall just printing out a message about the syscall not
being implemented and returning ``ENOSYS``).

From ``syscalls.master`` a script generates three files:
``linux_syscall.h``, ``linux_proto.h`` and ``linux_sysent.c``. The
``linux_syscall.h`` contains definitions of syscall names and their
numerical value, e.g.:

.. code:: programlisting

    ...
    #define LINUX_SYS_linux_fork 2
    ...
    #define LINUX_SYS_close 6
    ...

The ``linux_proto.h`` contains structure definitions of arguments to
every syscall, e.g.:

.. code:: programlisting

    struct linux_fork_args {
      register_t dummy;
    };

And finally, ``linux_sysent.c`` contains structure describing the system
entry table, used to actually dispatch a syscall, e.g.:

.. code:: programlisting

    { 0, (sy_call_t *)linux_fork, AUE_FORK, NULL, 0, 0 }, /* 2 = linux_fork */
    { AS(close_args), (sy_call_t *)close, AUE_CLOSE, NULL, 0, 0 }, /* 6 = close */

As you can see ``linux_fork`` is implemented in Linuxulator itself so
the definition is of ``STD`` type and has no argument, which is
exhibited by the dummy argument structure. On the other hand ``close``
is just an alias for real FreeBSD
`close(2) <http://www.FreeBSD.org/cgi/man.cgi?query=close&sektion=2>`__
so it has no linux arguments structure associated and in the system
entry table it is not prefixed with linux as it calls the real
`close(2) <http://www.FreeBSD.org/cgi/man.cgi?query=close&sektion=2>`__
in the kernel.

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

4.1.3.?Dummy syscalls
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Linux? emulation layer is not complete, as some syscalls are not
implemented properly and some are not implemented at all. The emulation
layer employs a facility to mark unimplemented syscalls with the
``DUMMY`` macro. These dummy definitions reside in ``linux_dummy.c`` in
a form of ``DUMMY(syscall);``, which is then translated to various
syscall auxiliary files and the implementation consists of printing a
message saying that this syscall is not implemented. The ``UNIMPL``
prototype is not used because we want to be able to identify the name of
the syscall that was called in order to know what syscalls are more
important to implement.

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

4.2.?Signal handling
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Signal handling is done generally in the FreeBSD kernel for all binary
compatibilities with a call to a compat-dependent layer. Linux?
compatibility layer defines ``linux_sendsig`` routine for this purpose.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.1.?Linux? sendsig
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This routine first checks whether the signal has been installed with a
``SA_SIGINFO`` in which case it calls ``linux_rt_sendsig`` routine
instead. Furthermore, it allocates (or reuses an already existing)
signal handle context, then it builds a list of arguments for the signal
handler. It translates the signal number based on the signal translation
table, assigns a handler, translates sigset. Then it saves context for
the ``sigreturn`` routine (various registers, translated trap number and
signal mask). Finally, it copies out the signal context to the userspace
and prepares context for the actual signal handler to run.

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

4.2.2.?linux\_rt\_sendsig
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This routine is similar to ``linux_sendsig`` just the signal context
preparation is different. It adds ``siginfo``, ``ucontext``, and some
POSIX? parts. It might be worth considering whether those two functions
could not be merged with a benefit of less code duplication and possibly
even faster execution.

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

4.2.3.?linux\_sigreturn
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This syscall is used for return from the signal handler. It does some
security checks and restores the original process context. It also
unmasks the signal in process signal mask.

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

4.3.?Ptrace
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many UNIX? derivates implement the
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
syscall in order to allow various tracking and debugging features. This
facility enables the tracing process to obtain various information about
the traced process, like register dumps, any memory from the process
address space, etc. and also to trace the process like in stepping an
instruction or between system entries (syscalls and traps).
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
also lets you set various information in the traced process (registers
etc.).
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
is a UNIX?-wide standard implemented in most UNIX?es around the world.

Linux? emulation in FreeBSD implements the
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
facility in ``linux_ptrace.c``. The routines for converting registers
between Linux? and FreeBSD and the actual
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
syscall emulation syscall. The syscall is a long switch block that
implements its counterpart in FreeBSD for every
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
command. The
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
commands are mostly equal between Linux? and FreeBSD so usually just a
small modification is needed. For example, ``PT_GETREGS`` in Linux?
operates on direct data while FreeBSD uses a pointer to the data so
after performing a (native)
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
syscall, a copyout must be done to preserve Linux? semantics.

The
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
implementation in Linuxulator has some known weaknesses. There have been
panics seen when using ``strace`` (which is a
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
consumer) in the Linuxulator environment. Also ``PT_SYSCALL`` is not
implemented.

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

4.4.?Traps
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Whenever a Linux? process running in the emulation layer traps the trap
itself is handled transparently with the only exception of the trap
translation. Linux? and FreeBSD differs in opinion on what a trap is so
this is dealt with here. The code is actually very short:

.. code:: programlisting

    static int
    translate_traps(int signal, int trap_code)
    {

      if (signal != SIGBUS)
        return signal;

      switch (trap_code) {

        case T_PROTFLT:
        case T_TSSFLT:
        case T_DOUBLEFLT:
        case T_PAGEFLT:
          return SIGSEGV;

        default:
          return signal;
      }
    }

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

4.5.?Stack fixup
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The RTLD run-time link-editor expects so called AUX tags on stack during
an ``execve`` so a fixup must be done to ensure this. Of course, every
RTLD system is different so the emulation layer must provide its own
stack fixup routine to do this. So does Linuxulator. The
``elf_linux_fixup`` simply copies out AUX tags to the stack and adjusts
the stack of the user space process to point right after those tags. So
RTLD works in a smart way.

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

4.6.?A.OUT support
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Linux? emulation layer on i386 also supports Linux? A.OUT binaries.
Pretty much everything described in the previous sections must be
implemented for A.OUT support (beside traps translation and signals
sending). The support for A.OUT binaries is no longer maintained,
especially the 2.6 emulation does not work with it but this does not
cause any problem, as the linux-base in ports probably do not support
A.OUT binaries at all. This support will probably be removed in future.
Most of the stuff necessary for loading Linux? A.OUT binaries is in
``imgact_linux.c`` file.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+---------------------------------------+
| `Prev <freebsd-emulation.html>`__?   | ?                       | ?\ `Next <mi.html>`__                 |
+--------------------------------------+-------------------------+---------------------------------------+
| 3.?Emulation?                        | `Home <index.html>`__   | ?5.?Linux? emulation layer -MI part   |
+--------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
