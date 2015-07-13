=============================================
10.2.?Debugging a Kernel Crash Dump with kgdb
=============================================

.. raw:: html

   <div class="navheader">

10.2.?Debugging a Kernel Crash Dump with ``kgdb``
`Prev <kerneldebug.html>`__?
Chapter?10.?Kernel Debugging
?\ `Next <kerneldebug-ddd.html>`__

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

10.2.?Debugging a Kernel Crash Dump with ``kgdb``
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This section covers
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1>`__ as
found in FreeBSD?5.3 and later. In previous versions, one must use
``gdb -k`` to read a core dump file.

.. raw:: html

   </div>

Once a dump has been obtained, getting useful information out of the
dump is relatively easy for simple problems. Before launching into the
internals of
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1>`__ to
debug the crash dump, locate the debug version of your kernel (normally
called ``kernel.debug``) and the path to the source files used to build
your kernel (normally ``/usr/obj/usr/src/sys/KERNCONF``, where
``KERNCONF`` is the ``ident`` specified in a kernel
`config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=5>`__).
With those two pieces of info, let the debugging commence!

To enter into the debugger and begin getting information from the dump,
the following steps are required at a minimum:

.. code:: screen

    # cd /usr/obj/usr/src/sys/KERNCONF
    # kgdb kernel.debug /var/crash/vmcore.0

You can debug the crash dump using the kernel sources just like you can
for any other program.

This first dump is from a 5.2-BETA kernel and the crash comes from deep
within the kernel. The output below has been modified to include line
numbers on the left. This first trace inspects the instruction pointer
and obtains a back trace. The address that is used on line 41 for the
``list`` command is the instruction pointer and can be found on line 17.
Most developers will request having at least this information sent to
them if you are unable to debug the problem yourself. If, however, you
do solve the problem, make sure that your patch winds its way into the
source tree via a problem report, mailing lists, or by being able to
commit it!

.. code:: screen

     1:# cd /usr/obj/usr/src/sys/KERNCONF
     2:# kgdb kernel.debug /var/crash/vmcore.0
     3:GNU gdb 5.2.1 (FreeBSD)
     4:Copyright 2002 Free Software Foundation, Inc.
     5:GDB is free software, covered by the GNU General Public License, and you are
     6:welcome to change it and/or distribute copies of it under certain conditions.
     7:Type "show copying" to see the conditions.
     8:There is absolutely no warranty for GDB.  Type "show warranty" for details.
     9:This GDB was configured as "i386-undermydesk-freebsd"...
    10:panic: page fault
    11:panic messages:
    12:---
    13:Fatal trap 12: page fault while in kernel mode
    14:cpuid = 0; apic id = 00
    15:fault virtual address   = 0x300
    16:fault code:             = supervisor read, page not present
    17:instruction pointer     = 0x8:0xc0713860
    18:stack pointer           = 0x10:0xdc1d0b70
    19:frame pointer           = 0x10:0xdc1d0b7c
    20:code segment            = base 0x0, limit 0xfffff, type 0x1b
    21:                        = DPL 0, pres 1, def32 1, gran 1
    22:processor eflags        = resume, IOPL = 0
    23:current process         = 14394 (uname)
    24:trap number             = 12
    25:panic: page fault
    26      cpuid = 0;
    27:Stack backtrace:
    28
    29:syncing disks, buffers remaining... 2199 2199 panic: mi_switch: switch in a critical section
    30:cpuid = 0;
    31:Uptime: 2h43m19s
    32:Dumping 255 MB
    33: 16 32 48 64 80 96 112 128 144 160 176 192 208 224 240
    34:---
    35:Reading symbols from /boot/kernel/snd_maestro3.ko...done.
    36:Loaded symbols for /boot/kernel/snd_maestro3.ko
    37:Reading symbols from /boot/kernel/snd_pcm.ko...done.
    38:Loaded symbols for /boot/kernel/snd_pcm.ko
    39:#0  doadump () at /usr/src/sys/kern/kern_shutdown.c:240
    40:240             dumping++;
    41:(kgdb) list *0xc0713860
    42:0xc0713860 is in lapic_ipi_wait (/usr/src/sys/i386/i386/local_apic.c:663).
    43:658                     incr = 0;
    44:659                     delay = 1;
    45:660             } else
    46:661                     incr = 1;
    47:662             for (x = 0; x < delay; x += incr) {
    48:663                     if ((lapic->icr_lo & APIC_DELSTAT_MASK) == APIC_DELSTAT_IDLE)
    49:664                             return (1);
    50:665                     ia32_pause();
    51:666             }
    52:667             return (0);
    53:(kgdb) backtrace
    54:#0  doadump () at /usr/src/sys/kern/kern_shutdown.c:240
    55:#1  0xc055fd9b in boot (howto=260) at /usr/src/sys/kern/kern_shutdown.c:372
    56:#2  0xc056019d in panic () at /usr/src/sys/kern/kern_shutdown.c:550
    57:#3  0xc0567ef5 in mi_switch () at /usr/src/sys/kern/kern_synch.c:470
    58:#4  0xc055fa87 in boot (howto=256) at /usr/src/sys/kern/kern_shutdown.c:312
    59:#5  0xc056019d in panic () at /usr/src/sys/kern/kern_shutdown.c:550
    60:#6  0xc0720c66 in trap_fatal (frame=0xdc1d0b30, eva=0)
    61:    at /usr/src/sys/i386/i386/trap.c:821
    62:#7  0xc07202b3 in trap (frame=
    63:      {tf_fs = -1065484264, tf_es = -1065484272, tf_ds = -1065484272, tf_edi = 1, tf_esi = 0, tf_ebp = -602076292, tf_isp = -602076324, tf_ebx = 0, tf_edx = 0, tf_ecx = 1000000, tf_eax = 243, tf_trapno = 12, tf_err = 0, tf_eip = -1066321824, tf_cs = 8, tf_eflags = 65671, tf_esp = 243, tf_ss = 0})
    64:    at /usr/src/sys/i386/i386/trap.c:250
    65:#8  0xc070c9f8 in calltrap () at {standard input}:94
    66:#9  0xc07139f3 in lapic_ipi_vectored (vector=0, dest=0)
    67:    at /usr/src/sys/i386/i386/local_apic.c:733
    68:#10 0xc0718b23 in ipi_selected (cpus=1, ipi=1)
    69:    at /usr/src/sys/i386/i386/mp_machdep.c:1115
    70:#11 0xc057473e in kseq_notify (ke=0xcc05e360, cpu=0)
    71:    at /usr/src/sys/kern/sched_ule.c:520
    72:#12 0xc0575cad in sched_add (td=0xcbcf5c80)
    73:    at /usr/src/sys/kern/sched_ule.c:1366
    74:#13 0xc05666c6 in setrunqueue (td=0xcc05e360)
    75:    at /usr/src/sys/kern/kern_switch.c:422
    76:#14 0xc05752f4 in sched_wakeup (td=0xcbcf5c80)
    77:    at /usr/src/sys/kern/sched_ule.c:999
    78:#15 0xc056816c in setrunnable (td=0xcbcf5c80)
    79:    at /usr/src/sys/kern/kern_synch.c:570
    80:#16 0xc0567d53 in wakeup (ident=0xcbcf5c80)
    81:    at /usr/src/sys/kern/kern_synch.c:411
    82:#17 0xc05490a8 in exit1 (td=0xcbcf5b40, rv=0)
    83:    at /usr/src/sys/kern/kern_exit.c:509
    84:#18 0xc0548011 in sys_exit () at /usr/src/sys/kern/kern_exit.c:102
    85:#19 0xc0720fd0 in syscall (frame=
    86:      {tf_fs = 47, tf_es = 47, tf_ds = 47, tf_edi = 0, tf_esi = -1, tf_ebp = -1077940712, tf_isp = -602075788, tf_ebx = 672411944, tf_edx = 10, tf_ecx = 672411600, tf_eax = 1, tf_trapno = 12, tf_err = 2, tf_eip = 671899563, tf_cs = 31, tf_eflags = 642, tf_esp = -1077940740, tf_ss = 47})
    87:    at /usr/src/sys/i386/i386/trap.c:1010
    88:#20 0xc070ca4d in Xint0x80_syscall () at {standard input}:136
    89:---Can't read userspace from dump, or kernel process---
    90:(kgdb) quit

This next trace is an older dump from the FreeBSD 2 time frame, but is
more involved and demonstrates more of the features of ``gdb``. Long
lines have been folded to improve readability, and the lines are
numbered for reference. Despite this, it is a real-world error trace
taken during the development of the pcvt console driver.

.. code:: screen

     1:Script started on Fri Dec 30 23:15:22 1994
     2:# cd /sys/compile/URIAH
     3:# gdb -k kernel /var/crash/vmcore.1
     4:Reading symbol data from /usr/src/sys/compile/URIAH/kernel
    ...done.
     5:IdlePTD 1f3000
     6:panic: because you said to!
     7:current pcb at 1e3f70
     8:Reading in symbols for ../../i386/i386/machdep.c...done.
     9:(kgdb) backtrace
    10:#0  boot (arghowto=256) (../../i386/i386/machdep.c line 767)
    11:#1  0xf0115159 in panic ()
    12:#2  0xf01955bd in diediedie () (../../i386/i386/machdep.c line 698)
    13:#3  0xf010185e in db_fncall ()
    14:#4  0xf0101586 in db_command (-266509132, -266509516, -267381073)
    15:#5  0xf0101711 in db_command_loop ()
    16:#6  0xf01040a0 in db_trap ()
    17:#7  0xf0192976 in kdb_trap (12, 0, -272630436, -266743723)
    18:#8  0xf019d2eb in trap_fatal (...)
    19:#9  0xf019ce60 in trap_pfault (...)
    20:#10 0xf019cb2f in trap (...)
    21:#11 0xf01932a1 in exception:calltrap ()
    22:#12 0xf0191503 in cnopen (...)
    23:#13 0xf0132c34 in spec_open ()
    24:#14 0xf012d014 in vn_open ()
    25:#15 0xf012a183 in open ()
    26:#16 0xf019d4eb in syscall (...)
    27:(kgdb) up 10
    28:Reading in symbols for ../../i386/i386/trap.c...done.
    29:#10 0xf019cb2f in trap (frame={tf_es = -260440048, tf_ds = 16, tf_\
    30:edi = 3072, tf_esi = -266445372, tf_ebp = -272630356, tf_isp = -27\
    31:2630396, tf_ebx = -266427884, tf_edx = 12, tf_ecx = -266427884, tf\
    32:_eax = 64772224, tf_trapno = 12, tf_err = -272695296, tf_eip = -26\
    33:6672343, tf_cs = -266469368, tf_eflags = 66066, tf_esp = 3072, tf_\
    34:ss = -266427884}) (../../i386/i386/trap.c line 283)
    35:283                             (void) trap_pfault(&frame, FALSE);
    36:(kgdb) frame frame->tf_ebp frame->tf_eip
    37:Reading in symbols for ../../i386/isa/pcvt/pcvt_drv.c...done.
    38:#0  0xf01ae729 in pcopen (dev=3072, flag=3, mode=8192, p=(struct p\
    39:roc *) 0xf07c0c00) (../../i386/isa/pcvt/pcvt_drv.c line 403)
    40:403             return ((*linesw[tp->t_line].l_open)(dev, tp));
    41:(kgdb) list
    42:398
    43:399             tp->t_state |= TS_CARR_ON;
    44:400             tp->t_cflag |= CLOCAL;  /* cannot be a modem (:-) */
    45:401
    46:402     #if PCVT_NETBSD || (PCVT_FREEBSD >= 200)
    47:403             return ((*linesw[tp->t_line].l_open)(dev, tp));
    48:404     #else
    49:405             return ((*linesw[tp->t_line].l_open)(dev, tp, flag));
    50:406     #endif /* PCVT_NETBSD || (PCVT_FREEBSD >= 200) */
    51:407     }
    52:(kgdb) print tp
    53:Reading in symbols for ../../i386/i386/cons.c...done.
    54:$1 = (struct tty *) 0x1bae
    55:(kgdb) print tp->t_line
    56:$2 = 1767990816
    57:(kgdb) up
    58:#1  0xf0191503 in cnopen (dev=0x00000000, flag=3, mode=8192, p=(st\
    59:ruct proc *) 0xf07c0c00) (../../i386/i386/cons.c line 126)
    60:       return ((*cdevsw[major(dev)].d_open)(dev, flag, mode, p));
    61:(kgdb) up
    62:#2  0xf0132c34 in spec_open ()
    63:(kgdb) up
    64:#3  0xf012d014 in vn_open ()
    65:(kgdb) up
    66:#4  0xf012a183 in open ()
    67:(kgdb) up
    68:#5  0xf019d4eb in syscall (frame={tf_es = 39, tf_ds = 39, tf_edi =\
    69: 2158592, tf_esi = 0, tf_ebp = -272638436, tf_isp = -272629788, tf\
    70:_ebx = 7086, tf_edx = 1, tf_ecx = 0, tf_eax = 5, tf_trapno = 582, \
    71:tf_err = 582, tf_eip = 75749, tf_cs = 31, tf_eflags = 582, tf_esp \
    72:= -272638456, tf_ss = 39}) (../../i386/i386/trap.c line 673)
    73:673             error = (*callp->sy_call)(p, args, rval);
    74:(kgdb) up
    75:Initial frame selected; you cannot go up.
    76:(kgdb) quit

Comments to the above script:

.. raw:: html

   <div class="variablelist">

line 6:
    This is a dump taken from within DDB (see below), hence the panic
    comment “because you said to!”, and a rather long stack trace; the
    initial reason for going into DDB has been a page fault trap though.

line 20:
    This is the location of function ``trap()`` in the stack trace.

line 36:
    Force usage of a new stack frame; this is no longer necessary. The
    stack frames are supposed to point to the right locations now, even
    in case of a trap. From looking at the code in source line 403,
    there is a high probability that either the pointer access for “tp”
    was messed up, or the array access was out of bounds.

line 52:
    The pointer looks suspicious, but happens to be a valid address.

line 56:
    However, it obviously points to garbage, so we have found our error!
    (For those unfamiliar with that particular piece of code:
    ``tp->t_line`` refers to the line discipline of the console device
    here, which must be a rather small integer number.)

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

If your system is crashing regularly and you are running out of disk
space, deleting old ``vmcore`` files in ``/var/crash`` could save a
considerable amount of disk space!

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-----------------------------+------------------------------------------+
| `Prev <kerneldebug.html>`__?    | `Up <kerneldebug.html>`__   | ?\ `Next <kerneldebug-ddd.html>`__       |
+---------------------------------+-----------------------------+------------------------------------------+
| Chapter?10.?Kernel Debugging?   | `Home <index.html>`__       | ?10.3.?Debugging a Crash Dump with DDD   |
+---------------------------------+-----------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
