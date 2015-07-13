==========================
1.9.?Kernel Initialization
==========================

.. raw:: html

   <div class="navheader">

1.9.?Kernel Initialization
`Prev <boot-loader.html>`__?
Chapter?1.?Bootstrapping and Kernel Initialization
?\ `Next <locking.html>`__

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

1.9.?Kernel Initialization
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Let us take a look at the command that links the kernel. This will help
identify the exact location where the loader passes execution to the
kernel. This location is the kernel's actual entry point.

.. code:: programlisting

    sys/conf/Makefile.i386:
    ld -elf -Bdynamic -T /usr/src/sys/conf/ldscript.i386  -export-dynamic \
    -dynamic-linker /red/herring -o kernel -X locore.o \
    <lots of kernel .o files>

A few interesting things can be seen here. First, the kernel is an ELF
dynamically linked binary, but the dynamic linker for kernel is
``/red/herring``, which is definitely a bogus file. Second, taking a
look at the file ``sys/conf/ldscript.i386`` gives an idea about what ld
options are used when compiling a kernel. Reading through the first few
lines, the string

.. code:: programlisting

    sys/conf/ldscript.i386:
    ENTRY(btext)

says that a kernel's entry point is the symbol \`btext'. This symbol is
defined in ``locore.s``:

.. code:: programlisting

    sys/i386/i386/locore.s:
        .text
    /**********************************************************************
     *
     * This is where the bootblocks start us, set the ball rolling...
     *
     */
    NON_GPROF_ENTRY(btext)

First, the register EFLAGS is set to a predefined value of 0x00000002.
Then all the segment registers are initialized:

.. code:: programlisting

    sys/i386/i386/locore.s:
    /* Don't trust what the BIOS gives for eflags. */
        pushl   $PSL_KERNEL
        popfl

    /*
     * Don't trust what the BIOS gives for %fs and %gs.  Trust the bootstrap
     * to set %cs, %ds, %es and %ss.
     */
        mov %ds, %ax
        mov %ax, %fs
        mov %ax, %gs

btext calls the routines ``recover_bootinfo()``, ``identify_cpu()``,
``create_pagetables()``, which are also defined in ``locore.s``. Here is
a description of what they do:

.. raw:: html

   <div class="informaltable">

+-------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``recover_bootinfo``    | This routine parses the parameters to the kernel passed from the bootstrap. The kernel may have been booted in 3 ways: by the loader, described above, by the old disk boot blocks, or by the old diskless boot procedure. This function determines the booting method, and stores the ``struct bootinfo`` structure into the kernel memory.   |
+-------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``identify_cpu``        | This functions tries to find out what CPU it is running on, storing the value found in a variable ``_cpu``.                                                                                                                                                                                                                                    |
+-------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``create_pagetables``   | This function allocates and fills out a Page Table Directory at the top of the kernel memory area.                                                                                                                                                                                                                                             |
+-------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

The next steps are enabling VME, if the CPU supports it:

.. code:: programlisting

       testl   $CPUID_VME, R(_cpu_feature)
        jz  1f
        movl    %cr4, %eax
        orl $CR4_VME, %eax
        movl    %eax, %cr4

Then, enabling paging:

.. code:: programlisting

    /* Now enable paging */
        movl    R(_IdlePTD), %eax
        movl    %eax,%cr3           /* load ptd addr into mmu */
        movl    %cr0,%eax           /* get control word */
        orl $CR0_PE|CR0_PG,%eax     /* enable paging */
        movl    %eax,%cr0           /* and let's page NOW! */

The next three lines of code are because the paging was set, so the jump
is needed to continue the execution in virtualized address space:

.. code:: programlisting

        pushl   $begin              /* jump to high virtualized address */
        ret

    /* now running relocated at KERNBASE where the system is linked to run */
    begin:

The function ``init386()`` is called with a pointer to the first free
physical page, after that ``mi_startup()``. ``init386`` is an
architecture dependent initialization function, and ``mi_startup()`` is
an architecture independent one (the 'mi\_' prefix stands for Machine
Independent). The kernel never returns from ``mi_startup()``, and by
calling it, the kernel finishes booting:

.. code:: programlisting

    sys/i386/i386/locore.s:
        movl    physfree, %esi
        pushl   %esi                /* value of first for init386(first) */
        call    _init386            /* wire 386 chip for unix operation */
        call    _mi_startup         /* autoconfiguration, mountroot etc */
        hlt     /* never returns to here */

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.9.1.?\ ``init386()``
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``init386()`` is defined in ``sys/i386/i386/machdep.c`` and performs
low-level initialization specific to the i386 chip. The switch to
protected mode was performed by the loader. The loader has created the
very first task, in which the kernel continues to operate. Before
looking at the code, consider the tasks the processor must complete to
initialize protected mode execution:

.. raw:: html

   <div class="itemizedlist">

-  Initialize the kernel tunable parameters, passed from the
   bootstrapping program.

-  Prepare the GDT.

-  Prepare the IDT.

-  Initialize the system console.

-  Initialize the DDB, if it is compiled into kernel.

-  Initialize the TSS.

-  Prepare the LDT.

-  Set up proc0's pcb.

.. raw:: html

   </div>

``init386()`` initializes the tunable parameters passed from bootstrap
by setting the environment pointer (envp) and calling ``init_param1()``.
The envp pointer has been passed from loader in the ``bootinfo``
structure:

.. code:: programlisting

    sys/i386/i386/machdep.c:
            kern_envp = (caddr_t)bootinfo.bi_envp + KERNBASE;

        /* Init basic tunables, hz etc */
        init_param1();

``init_param1()`` is defined in ``sys/kern/subr_param.c``. That file has
a number of sysctls, and two functions, ``init_param1()`` and
``init_param2()``, that are called from ``init386()``:

.. code:: programlisting

    sys/kern/subr_param.c:
        hz = HZ;
        TUNABLE_INT_FETCH("kern.hz", &hz);

TUNABLE\_<typename>\_FETCH is used to fetch the value from the
environment:

.. code:: programlisting

    /usr/src/sys/sys/kernel.h:
    #define TUNABLE_INT_FETCH(path, var)    getenv_int((path), (var))

Sysctl ``kern.hz`` is the system clock tick. Additionally, these sysctls
are set by ``init_param1()``:
``kern.maxswzone,     kern.maxbcache, kern.maxtsiz, kern.dfldsiz, kern.maxdsiz,       kern.dflssiz, kern.maxssiz, kern.sgrowsiz``.

Then ``init386()`` prepares the Global Descriptors Table (GDT). Every
task on an x86 is running in its own virtual address space, and this
space is addressed by a segment:offset pair. Say, for instance, the
current instruction to be executed by the processor lies at CS:EIP, then
the linear virtual address for that instruction would be “the virtual
address of code segment CS” + EIP. For convenience, segments begin at
virtual address 0 and end at a 4Gb boundary. Therefore, the
instruction's linear virtual address for this example would just be the
value of EIP. Segment registers such as CS, DS etc are the selectors,
i.e., indexes, into GDT (to be more precise, an index is not a selector
itself, but the INDEX field of a selector). FreeBSD's GDT holds
descriptors for 15 selectors per CPU:

.. code:: programlisting

    sys/i386/i386/machdep.c:
    union descriptor gdt[NGDT * MAXCPU];    /* global descriptor table */

    sys/i386/include/segments.h:
    /*
     * Entries in the Global Descriptor Table (GDT)
     */
    #define GNULL_SEL   0   /* Null Descriptor */
    #define GCODE_SEL   1   /* Kernel Code Descriptor */
    #define GDATA_SEL   2   /* Kernel Data Descriptor */
    #define GPRIV_SEL   3   /* SMP Per-Processor Private Data */
    #define GPROC0_SEL  4   /* Task state process slot zero and up */
    #define GLDT_SEL    5   /* LDT - eventually one per process */
    #define GUSERLDT_SEL    6   /* User LDT */
    #define GTGATE_SEL  7   /* Process task switch gate */
    #define GBIOSLOWMEM_SEL 8   /* BIOS low memory access (must be entry 8) */
    #define GPANIC_SEL  9   /* Task state to consider panic from */
    #define GBIOSCODE32_SEL 10  /* BIOS interface (32bit Code) */
    #define GBIOSCODE16_SEL 11  /* BIOS interface (16bit Code) */
    #define GBIOSDATA_SEL   12  /* BIOS interface (Data) */
    #define GBIOSUTIL_SEL   13  /* BIOS interface (Utility) */
    #define GBIOSARGS_SEL   14  /* BIOS interface (Arguments) */

Note that those #defines are not selectors themselves, but just a field
INDEX of a selector, so they are exactly the indices of the GDT. for
example, an actual selector for the kernel code (GCODE\_SEL) has the
value 0x08.

The next step is to initialize the Interrupt Descriptor Table (IDT).
This table is referenced by the processor when a software or hardware
interrupt occurs. For example, to make a system call, user application
issues the ``INT 0x80`` instruction. This is a software interrupt, so
the processor's hardware looks up a record with index 0x80 in the IDT.
This record points to the routine that handles this interrupt, in this
particular case, this will be the kernel's syscall gate. The IDT may
have a maximum of 256 (0x100) records. The kernel allocates NIDT records
for the IDT, where NIDT is the maximum (256):

.. code:: programlisting

    sys/i386/i386/machdep.c:
    static struct gate_descriptor idt0[NIDT];
    struct gate_descriptor *idt = &idt0[0]; /* interrupt descriptor table */

For each interrupt, an appropriate handler is set. The syscall gate for
``INT 0x80`` is set as well:

.. code:: programlisting

    sys/i386/i386/machdep.c:
        setidt(0x80, &IDTVEC(int0x80_syscall),
                SDT_SYS386TGT, SEL_UPL, GSEL(GCODE_SEL, SEL_KPL));

So when a userland application issues the ``INT 0x80`` instruction,
control will transfer to the function ``_Xint0x80_syscall``, which is in
the kernel code segment and will be executed with supervisor privileges.

Console and DDB are then initialized:

.. code:: programlisting

    sys/i386/i386/machdep.c:
        cninit();
    /* skipped */
    #ifdef DDB
        kdb_init();
        if (boothowto & RB_KDB)
            Debugger("Boot flags requested debugger");
    #endif

The Task State Segment is another x86 protected mode structure, the TSS
is used by the hardware to store task information when a task switch
occurs.

The Local Descriptors Table is used to reference userland code and data.
Several selectors are defined to point to the LDT, they are the system
call gates and the user code and data selectors:

.. code:: programlisting

    /usr/include/machine/segments.h:
    #define LSYS5CALLS_SEL  0   /* forced by intel BCS */
    #define LSYS5SIGR_SEL   1
    #define L43BSDCALLS_SEL 2   /* notyet */
    #define LUCODE_SEL  3
    #define LSOL26CALLS_SEL 4   /* Solaris >= 2.6 system call gate */
    #define LUDATA_SEL  5
    /* separate stack, es,fs,gs sels ? */
    /* #define  LPOSIXCALLS_SEL 5*/ /* notyet */
    #define LBSDICALLS_SEL  16  /* BSDI system call gate */
    #define NLDT        (LBSDICALLS_SEL + 1)

Next, proc0's Process Control Block (``struct pcb``) structure is
initialized. proc0 is a ``struct proc`` structure that describes a
kernel process. It is always present while the kernel is running,
therefore it is declared as global:

.. code:: programlisting

    sys/kern/kern_init.c:
        struct  proc proc0;

The structure ``struct pcb`` is a part of a proc structure. It is
defined in ``/usr/include/machine/pcb.h`` and has a process's
information specific to the i386 architecture, such as registers values.

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

1.9.2.?\ ``mi_startup()``
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This function performs a bubble sort of all the system initialization
objects and then calls the entry of each object one by one:

.. code:: programlisting

    sys/kern/init_main.c:
        for (sipp = sysinit; *sipp; sipp++) {

            /* ... skipped ... */

            /* Call function */
            (*((*sipp)->func))((*sipp)->udata);
            /* ... skipped ... */
        }

Although the sysinit framework is described in the `Developers'
Handbook <../../../../doc/en_US.ISO8859-1/books/developers-handbook>`__,
I will discuss the internals of it.

Every system initialization object (sysinit object) is created by
calling a SYSINIT() macro. Let us take as example an ``announce``
sysinit object. This object prints the copyright message:

.. code:: programlisting

    sys/kern/init_main.c:
    static void
    print_caddr_t(void *data __unused)
    {
        printf("%s", (char *)data);
    }
    SYSINIT(announce, SI_SUB_COPYRIGHT, SI_ORDER_FIRST, print_caddr_t, copyright)

The subsystem ID for this object is SI\_SUB\_COPYRIGHT (0x0800001),
which comes right after the SI\_SUB\_CONSOLE (0x0800000). So, the
copyright message will be printed out first, just after the console
initialization.

Let us take a look at what exactly the macro ``SYSINIT()`` does. It
expands to a ``C_SYSINIT()`` macro. The ``C_SYSINIT()`` macro then
expands to a static ``struct sysinit`` structure declaration with
another ``DATA_SET`` macro call:

.. code:: programlisting

    /usr/include/sys/kernel.h:
          #define C_SYSINIT(uniquifier, subsystem, order, func, ident) \
          static struct sysinit uniquifier ## _sys_init = { \ subsystem, \
          order, \ func, \ ident \ }; \ DATA_SET(sysinit_set,uniquifier ##
          _sys_init);

    #define SYSINIT(uniquifier, subsystem, order, func, ident)  \
        C_SYSINIT(uniquifier, subsystem, order,         \
        (sysinit_cfunc_t)(sysinit_nfunc_t)func, (void *)ident)

The ``DATA_SET()`` macro expands to a ``MAKE_SET()``, and that macro is
the point where all the sysinit magic is hidden:

.. code:: programlisting

    /usr/include/linker_set.h:
    #define MAKE_SET(set, sym)                      \
        static void const * const __set_##set##_sym_##sym = &sym;   \
        __asm(".section .set." #set ",\"aw\"");             \
        __asm(".long " #sym);                       \
        __asm(".previous")
    #endif
    #define TEXT_SET(set, sym) MAKE_SET(set, sym)
    #define DATA_SET(set, sym) MAKE_SET(set, sym)

In our case, the following declaration will occur:

.. code:: programlisting

    static struct sysinit announce_sys_init = {
        SI_SUB_COPYRIGHT,
        SI_ORDER_FIRST,
        (sysinit_cfunc_t)(sysinit_nfunc_t)  print_caddr_t,
        (void *) copyright
    };

    static void const *const __set_sysinit_set_sym_announce_sys_init =
        &announce_sys_init;
    __asm(".section .set.sysinit_set" ",\"aw\"");
    __asm(".long " "announce_sys_init");
    __asm(".previous");

The first ``__asm`` instruction will create an ELF section within the
kernel's executable. This will happen at kernel link time. The section
will have the name ``.set.sysinit_set``. The content of this section is
one 32-bit value, the address of announce\_sys\_init structure, and that
is what the second ``__asm`` is. The third ``__asm`` instruction marks
the end of a section. If a directive with the same section name occurred
before, the content, i.e., the 32-bit value, will be appended to the
existing section, so forming an array of 32-bit pointers.

Running objdump on a kernel binary, you may notice the presence of such
small sections:

.. code:: screen

    % objdump -h /kernel
      7 .set.cons_set 00000014  c03164c0  c03164c0  002154c0  2**2
                      CONTENTS, ALLOC, LOAD, DATA
      8 .set.kbddriver_set 00000010  c03164d4  c03164d4  002154d4  2**2
                      CONTENTS, ALLOC, LOAD, DATA
      9 .set.scrndr_set 00000024  c03164e4  c03164e4  002154e4  2**2
                      CONTENTS, ALLOC, LOAD, DATA
     10 .set.scterm_set 0000000c  c0316508  c0316508  00215508  2**2
                      CONTENTS, ALLOC, LOAD, DATA
     11 .set.sysctl_set 0000097c  c0316514  c0316514  00215514  2**2
                      CONTENTS, ALLOC, LOAD, DATA
     12 .set.sysinit_set 00000664  c0316e90  c0316e90  00215e90  2**2
                      CONTENTS, ALLOC, LOAD, DATA

This screen dump shows that the size of .set.sysinit\_set section is
0x664 bytes, so ``0x664/sizeof(void     *)`` sysinit objects are
compiled into the kernel. The other sections such as ``.set.sysctl_set``
represent other linker sets.

By defining a variable of type ``struct       linker_set`` the content
of ``.set.sysinit_set`` section will be “collected” into that variable:

.. code:: programlisting

    sys/kern/init_main.c:
          extern struct linker_set sysinit_set; /* XXX */

The ``struct linker_set`` is defined as follows:

.. code:: programlisting

    /usr/include/linker_set.h:
      struct linker_set {
        int ls_length;
        void    *ls_items[1];       /* really ls_length of them, trailing NULL */
    };

The first node will be equal to the number of a sysinit objects, and the
second node will be a NULL-terminated array of pointers to them.

Returning to the ``mi_startup()`` discussion, it is must be clear now,
how the sysinit objects are being organized. The ``mi_startup()``
function sorts them and calls each. The very last object is the system
scheduler:

.. code:: programlisting

    /usr/include/sys/kernel.h:
    enum sysinit_sub_id {
        SI_SUB_DUMMY        = 0x0000000,    /* not executed; for linker*/
        SI_SUB_DONE     = 0x0000001,    /* processed*/
        SI_SUB_CONSOLE      = 0x0800000,    /* console*/
        SI_SUB_COPYRIGHT    = 0x0800001,    /* first use of console*/
    ...
        SI_SUB_RUN_SCHEDULER    = 0xfffffff /* scheduler: no return*/
    };

The system scheduler sysinit object is defined in the file
``sys/vm/vm_glue.c``, and the entry point for that object is
``scheduler()``. That function is actually an infinite loop, and it
represents a process with PID 0, the swapper process. The proc0
structure, mentioned before, is used to describe it.

The first user process, called *init*, is created by the sysinit object
``init``:

.. code:: programlisting

    sys/kern/init_main.c:
    static void
    create_init(const void *udata __unused)
    {
        int error;
        int s;

        s = splhigh();
        error = fork1(&proc0, RFFDG | RFPROC, &initproc);
        if (error)
            panic("cannot fork init: %d\n", error);
        initproc->p_flag |= P_INMEM | P_SYSTEM;
        cpu_set_fork_handler(initproc, start_init, NULL);
        remrunqueue(initproc);
        splx(s);
    }
    SYSINIT(init,SI_SUB_CREATE_INIT, SI_ORDER_FIRST, create_init, NULL)

The ``create_init()`` allocates a new process by calling ``fork1()``,
but does not mark it runnable. When this new process is scheduled for
execution by the scheduler, the ``start_init()`` will be called. That
function is defined in ``init_main.c``. It tries to load and exec the
``init`` binary, probing ``/sbin/init`` first, then ``/sbin/oinit``,
``/sbin/init.bak``, and finally ``/stand/sysinstall``:

.. code:: programlisting

    sys/kern/init_main.c:
    static char init_path[MAXPATHLEN] =
    #ifdef  INIT_PATH
        __XSTRING(INIT_PATH);
    #else
        "/sbin/init:/sbin/oinit:/sbin/init.bak:/stand/sysinstall";
    #endif

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+------------------------------+
| `Prev <boot-loader.html>`__?   | `Up <boot.html>`__      | ?\ `Next <locking.html>`__   |
+--------------------------------+-------------------------+------------------------------+
| 1.8.?loader Stage?             | `Home <index.html>`__   | ?Chapter?2.?Locking Notes    |
+--------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
