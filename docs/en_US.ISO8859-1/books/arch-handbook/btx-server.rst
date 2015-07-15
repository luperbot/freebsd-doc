===================
1.6.?The BTX Server
===================

.. raw:: html

   <div class="navheader">

1.6.?The BTX Server
`Prev <boot-boot1.html>`__?
Chapter?1.?Bootstrapping and Kernel Initialization
?\ `Next <boot2.html>`__

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

1.6.?The BTX Server
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Next in our boot sequence is the BTX Server. Let us quickly remember how
we got here:

.. raw:: html

   <div class="itemizedlist">

-  The BIOS loads the absolute sector one (the MBR, or ``boot0``), to
   address ``0x7c00`` and jumps there.

-  ``boot0`` relocates itself to ``0x600``, the address it was linked to
   execute, and jumps over there. It then reads the first sector of the
   FreeBSD slice (which consists of ``boot1``) into address ``0x7c00``
   and jumps over there.

-  ``boot1`` loads the first 16 sectors of the FreeBSD slice into
   address ``0x8c00``. This 16 sectors, or 8192 bytes, is the whole file
   ``boot``. The file is a concatenation of ``boot1`` and ``boot2``.
   ``boot2``, in turn, contains the BTX server and the ``boot2`` client.
   Finally, a jump is made to address ``0x9010``, the entry point of the
   BTX server.

.. raw:: html

   </div>

Before studying the BTX Server in detail, let us further review how the
single, all-in-one ``boot`` file is created. The way ``boot`` is built
is defined in its ``Makefile``
(``/usr/src/sys/boot/i386/boot2/Makefile``). Let us look at the rule
that creates the ``boot`` file:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.20.?\ ``sys/boot/i386/boot2/Makefile``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          boot: boot1 boot2
        cat boot1 boot2 > boot

.. raw:: html

   </div>

.. raw:: html

   </div>

This tells us that ``boot1`` and ``boot2`` are needed, and the rule
simply concatenates them to produce a single file called ``boot``. The
rules for creating ``boot1`` are also quite simple:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.21.?\ ``sys/boot/i386/boot2/Makefile``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          boot1: boot1.out
        objcopy -S -O binary boot1.out boot1

          boot1.out: boot1.o
        ld -e start -Ttext 0x7c00 -o boot1.out boot1.o

.. raw:: html

   </div>

.. raw:: html

   </div>

To apply the rule for creating ``boot1``, ``boot1.out`` must be
resolved. This, in turn, depends on the existence of ``boot1.o``. This
last file is simply the result of assembling our familiar ``boot1.S``,
without linking. Now, the rule for creating ``boot1.out`` is applied.
This tells us that ``boot1.o`` should be linked with ``start`` as its
entry point, and starting at address ``0x7c00``. Finally, ``boot1`` is
created from ``boot1.out`` applying the appropriate rule. This rule is
the ``objcopy`` command applied to ``boot1.out``. Note the flags passed
to ``objcopy``: ``-S`` tells it to strip all relocation and symbolic
information; ``-O binary`` indicates the output format, that is, a
simple, unformatted binary file.

Having ``boot1``, let us take a look at how ``boot2`` is constructed:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.22.?\ ``sys/boot/i386/boot2/Makefile``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          boot2: boot2.ld
        @set -- `ls -l boot2.ld`; x=$$((7680-$$5)); \
            echo "$$x bytes available"; test $$x -ge 0
        dd if=boot2.ld of=boot2 obs=7680 conv=osync

          boot2.ld: boot2.ldr boot2.bin ../btx/btx/btx
        btxld -v -E 0x2000 -f bin -b ../btx/btx/btx -l boot2.ldr \
            -o boot2.ld -P 1 boot2.bin

          boot2.ldr:
        dd if=/dev/zero of=boot2.ldr bs=512 count=1

          boot2.bin: boot2.out
        objcopy -S -O binary boot2.out boot2.bin

          boot2.out: ../btx/lib/crt0.o boot2.o sio.o
        ld -Ttext 0x2000 -o boot2.out

          boot2.o: boot2.s
        ${CC} ${ACFLAGS} -c boot2.s

          boot2.s: boot2.c boot2.h ${.CURDIR}/../../common/ufsread.c
        ${CC} ${CFLAGS} -S -o boot2.s.tmp ${.CURDIR}/boot2.c
        sed -e '/align/d' -e '/nop/d' "MISSING" boot2.s.tmp > boot2.s
        rm -f boot2.s.tmp

          boot2.h: boot1.out
        ${NM} -t d ${.ALLSRC} | awk '/([0-9])+ T xread/ \
            { x = $$1 - ORG1; \
            printf("#define XREADORG %#x\n", REL1 + x) }' \
            ORG1=`printf "%d" ${ORG1}` \
            REL1=`printf "%d" ${REL1}` > ${.TARGET}

.. raw:: html

   </div>

.. raw:: html

   </div>

The mechanism for building ``boot2`` is far more elaborate. Let us point
out the most relevant facts. The dependency list is as follows:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.23.?\ ``sys/boot/i386/boot2/Makefile``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          boot2: boot2.ld
          boot2.ld: boot2.ldr boot2.bin ${BTXDIR}/btx/btx
          boot2.bin: boot2.out
          boot2.out: ${BTXDIR}/lib/crt0.o boot2.o sio.o
          boot2.o: boot2.s
          boot2.s: boot2.c boot2.h ${.CURDIR}/../../common/ufsread.c
          boot2.h: boot1.out

.. raw:: html

   </div>

.. raw:: html

   </div>

Note that initially there is no header file ``boot2.h``, but its
creation depends on ``boot1.out``, which we already have. The rule for
its creation is a bit terse, but the important thing is that the output,
``boot2.h``, is something like this:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.24.?\ ``sys/boot/i386/boot2/boot2.h``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          #define XREADORG 0x725

.. raw:: html

   </div>

.. raw:: html

   </div>

Recall that ``boot1`` was relocated (i.e., copied from ``0x7c00`` to
``0x700``). This relocation will now make sense, because as we will see,
the BTX server reclaims some memory, including the space where ``boot1``
was originally loaded. However, the BTX server needs access to
``boot1``'s ``xread`` function; this function, according to the output
of ``boot2.h``, is at location ``0x725``. Indeed, the BTX server uses
the ``xread`` function from ``boot1``'s relocated code. This function is
now accesible from within the ``boot2`` client.

We next build ``boot2.s`` from files ``boot2.h``, ``boot2.c`` and
``/usr/src/sys/boot/common/ufsread.c``. The rule for this is to compile
the code in ``boot2.c`` (which includes ``boot2.h`` and ``ufsread.c``)
into assembly code. Having ``boot2.s``, the next rule assembles
``boot2.s``, creating the object file ``boot2.o``. The next rule directs
the linker to link various files (``crt0.o``, ``boot2.o`` and
``sio.o``). Note that the output file, ``boot2.out``, is linked to
execute at address ``0x2000``. Recall that ``boot2`` will be executed in
user mode, within a special user segment set up by the BTX server. This
segment starts at ``0xa000``. Also, remember that the ``boot2`` portion
of ``boot`` was copied to address ``0xc000``, that is, offset ``0x2000``
from the start of the user segment, so ``boot2`` will work properly when
we transfer control to it. Next, ``boot2.bin`` is created from
``boot2.out`` by stripping its symbols and format information; boot2.bin
is a *raw* binary. Now, note that a file ``boot2.ldr`` is created as a
512-byte file full of zeros. This space is reserved for the bsdlabel.

Now that we have files ``boot1``, ``boot2.bin`` and ``boot2.ldr``, only
the BTX server is missing before creating the all-in-one ``boot`` file.
The BTX server is located in ``/usr/src/sys/boot/i386/btx/btx``; it has
its own ``Makefile`` with its own set of rules for building. The
important thing to notice is that it is also compiled as a *raw* binary,
and that it is linked to execute at address ``0x9000``. The details can
be found in ``/usr/src/sys/boot/i386/btx/btx/Makefile``.

Having the files that comprise the ``boot`` program, the final step is
to *merge* them. This is done by a special program called ``btxld``
(source located in ``/usr/src/usr.sbin/btxld``). Some arguments to this
program include the name of the output file (``boot``), its entry point
(``0x2000``) and its file format (raw binary). The various files are
finally merged by this utility into the file ``boot``, which consists of
``boot1``, ``boot2``, the ``bsdlabel`` and the BTX server. This file,
which takes exactly 16 sectors, or 8192 bytes, is what is actually
written to the beginning of the FreeBSD slice during instalation. Let us
now proceed to study the BTX server program.

The BTX server prepares a simple environment and switches from 16-bit
real mode to 32-bit protected mode, right before passing control to the
client. This includes initializing and updating the following data
structures:

.. raw:: html

   <div class="itemizedlist">

-  Modifies the ``Interrupt Vector Table (IVT)``. The IVT provides
   exception and interrupt handlers for Real-Mode code.

-  The ``Interrupt Descriptor Table (IDT)`` is created. Entries are
   provided for processor exceptions, hardware interrupts, two system
   calls and V86 interface. The IDT provides exception and interrupt
   handlers for Protected-Mode code.

-  A ``Task-State Segment (TSS)`` is created. This is necessary because
   the processor works in the *least* privileged level when executing
   the client (``boot2``), but in the *most* privileged level when
   executing the BTX server.

-  The GDT (Global Descriptor Table) is set up. Entries (descriptors)
   are provided for supervisor code and data, user code and data, and
   real-mode code and data. `:sup:`[9]` <#ftn.idp64534352>`__

.. raw:: html

   </div>

Let us now start studying the actual implementation. Recall that
``boot1`` made a jump to address ``0x9010``, the BTX server's entry
point. Before studying program execution there, note that the BTX server
has a special header at address range ``0x9000-0x900f``, right before
its entry point. This header is defined as follows:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.25.?\ ``sys/boot/i386/btx/btx/btx.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    start:                      # Start of code
    /*
     * BTX header.
     */
    btx_hdr:    .byte 0xeb          # Machine ID
            .byte 0xe           # Header size
            .ascii "BTX"            # Magic
            .byte 0x1           # Major version
            .byte 0x2           # Minor version
            .byte BTX_FLAGS         # Flags
            .word PAG_CNT-MEM_ORG>>0xc    # Paging control
            .word break-start       # Text size
            .long 0x0           # Entry address

.. raw:: html

   </div>

.. raw:: html

   </div>

Note the first two bytes are ``0xeb`` and ``0xe``. In the IA-32
architecture, these two bytes are interpreted as a relative jump past
the header into the entry point, so in theory, ``boot1`` could jump here
(address ``0x9000``) instead of address ``0x9010``. Note that the last
field in the BTX header is a pointer to the client's (``boot2``) entry
point. This field is patched at link time.

Immediately following the header is the BTX server's entry point:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.26.?\ ``sys/boot/i386/btx/btx/btx.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    /*
     * Initialization routine.
     */
    init:       cli             # Disable interrupts
            xor %ax,%ax         # Zero/segment
            mov %ax,%ss         # Set up
            mov $0x1800,%sp     #  stack
            mov %ax,%es         # Address
            mov %ax,%ds         #  data
            pushl $0x2          # Clear
            popfl               #  flags

.. raw:: html

   </div>

.. raw:: html

   </div>

This code disables interrupts, sets up a working stack (starting at
address ``0x1800``) and clears the flags in the EFLAGS register. Note
that the ``popfl`` instruction pops out a doubleword (4 bytes) from the
stack and places it in the EFLAGS register. Because the value actually
popped is ``2``, the EFLAGS register is effectively cleared (IA-32
requires that bit 2 of the EFLAGS register always be 1).

Our next code block clears (sets to ``0``) the memory range
``0x5e00-0x8fff``. This range is where the various data structures will
be created:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.27.?\ ``sys/boot/i386/btx/btx/btx.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    /*
     * Initialize memory.
     */
            mov $0x5e00,%di     # Memory to initialize
            mov $(0x9000-0x5e00)/2,%cx  # Words to zero
            rep             # Zero-fill
            stosw               #  memory

.. raw:: html

   </div>

.. raw:: html

   </div>

Recall that ``boot1`` was originally loaded to address ``0x7c00``, so,
with this memory initialization, that copy effectively dissapeared.
However, also recall that ``boot1`` was relocated to ``0x700``, so
*that* copy is still in memory, and the BTX server will make use of it.

Next, the real-mode IVT (Interrupt Vector Table is updated. The IVT is
an array of segment/offset pairs for exception and interrupt handlers.
The BIOS normally maps hardware interrupts to interrupt vectors ``0x8``
to ``0xf`` and ``0x70`` to ``0x77`` but, as will be seen, the 8259A
Programmable Interrupt Controller, the chip controlling the actual
mapping of hardware interrupts to interrupt vectors, is programmed to
remap these interrupt vectors from ``0x8-0xf`` to ``0x20-0x27`` and from
``0x70-0x77`` to ``0x28-0x2f``. Thus, interrupt handlers are provided
for interrupt vectors ``0x20-0x2f``. The reason the BIOS-provided
handlers are not used directly is because they work in 16-bit real mode,
but not 32-bit protected mode. Processor mode will be switched to 32-bit
protected mode shortly. However, the BTX server sets up a mechanism to
effectively use the handlers provided by the BIOS:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.28.?\ ``sys/boot/i386/btx/btx/btx.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    /*
     * Update real mode IDT for reflecting hardware interrupts.
     */
            mov $intr20,%bx         # Address first handler
            mov $0x10,%cx           # Number of handlers
            mov $0x20*4,%di         # First real mode IDT entry
    init.0:     mov %bx,(%di)           # Store IP
            inc %di             # Address next
            inc %di             #  entry
            stosw               # Store CS
            add $4,%bx          # Next handler
            loop init.0         # Next IRQ

.. raw:: html

   </div>

.. raw:: html

   </div>

The next block creates the IDT (Interrupt Descriptor Table). The IDT is
analogous, in protected mode, to the IVT in real mode. That is, the IDT
describes the various exception and interrupt handlers used when the
processor is executing in protected mode. In essence, it also consists
of an array of segment/offset pairs, although the structure is somewhat
more complex, because segments in protected mode are different than in
real mode, and various protection mechanisms apply:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.29.?\ ``sys/boot/i386/btx/btx/btx.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    /*
     * Create IDT.
     */
            mov $0x5e00,%di         # IDT's address
            mov $idtctl,%si         # Control string
    init.1:     lodsb               # Get entry
            cbw             #  count
            xchg %ax,%cx            #  as word
            jcxz init.4         # If done
            lodsb               # Get segment
            xchg %ax,%dx            #  P:DPL:type
            lodsw               # Get control
            xchg %ax,%bx            #  set
            lodsw               # Get handler offset
            mov $SEL_SCODE,%dh      # Segment selector
    init.2:     shr %bx             # Handle this int?
            jnc init.3          # No
            mov %ax,(%di)           # Set handler offset
            mov %dh,0x2(%di)        #  and selector
            mov %dl,0x5(%di)        # Set P:DPL:type
            add $0x4,%ax            # Next handler
    init.3:     lea 0x8(%di),%di        # Next entry
            loop init.2         # Till set done
            jmp init.1          # Continue

.. raw:: html

   </div>

.. raw:: html

   </div>

Each entry in the ``IDT`` is 8 bytes long. Besides the segment/offset
information, they also describe the segment type, privilege level, and
whether the segment is present in memory or not. The construction is
such that interrupt vectors from ``0`` to ``0xf`` (exceptions) are
handled by function ``intx00``; vector ``0x10`` (also an exception) is
handled by ``intx10``; hardware interrupts, which are later configured
to start at interrupt vector ``0x20`` all the way to interrupt vector
``0x2f``, are handled by function ``intx20``. Lastly, interrupt vector
``0x30``, which is used for system calls, is handled by ``intx30``, and
vectors ``0x31`` and ``0x32`` are handled by ``intx31``. It must be
noted that only descriptors for interrupt vectors ``0x30``, ``0x31`` and
``0x32`` are given privilege level 3, the same privilege level as the
``boot2`` client, which means the client can execute a
software-generated interrupt to this vectors through the ``int``
instruction without failing (this is the way ``boot2`` use the services
provided by the BTX server). Also, note that *only* software-generated
interrupts are protected from code executing in lesser privilege levels.
Hardware-generated interrupts and processor-generated exceptions are
*always* handled adequately, regardless of the actual privileges
involved.

The next step is to initialize the TSS (Task-State Segment). The TSS is
a hardware feature that helps the operating system or executive software
implement multitasking functionality through process abstraction. The
IA-32 architecture demands the creation and use of *at least* one TSS if
multitasking facilities are used or different privilege levels are
defined. Because the ``boot2`` client is executed in privilege level 3,
but the BTX server does in privilege level 0, a TSS must be defined:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.30.?\ ``sys/boot/i386/btx/btx/btx.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    /*
     * Initialize TSS.
     */
    init.4:     movb $_ESP0H,TSS_ESP0+1(%di)    # Set ESP0
            movb $SEL_SDATA,TSS_SS0(%di)    # Set SS0
            movb $_TSSIO,TSS_MAP(%di)   # Set I/O bit map base

.. raw:: html

   </div>

.. raw:: html

   </div>

Note that a value is given for the Privilege Level 0 stack pointer and
stack segment in the TSS. This is needed because, if an interrupt or
exception is received while executing ``boot2`` in Privilege Level 3, a
change to Privilege Level 0 is automatically performed by the processor,
so a new working stack is needed. Finally, the I/O Map Base Address
field of the TSS is given a value, which is a 16-bit offset from the
beginning of the TSS to the I/O Permission Bitmap and the Interrupt
Redirection Bitmap.

After the IDT and TSS are created, the processor is ready to switch to
protected mode. This is done in the next block:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.31.?\ ``sys/boot/i386/btx/btx/btx.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    /*
     * Bring up the system.
     */
            mov $0x2820,%bx         # Set protected mode
            callw setpic            #  IRQ offsets
            lidt idtdesc            # Set IDT
            lgdt gdtdesc            # Set GDT
            mov %cr0,%eax           # Switch to protected
            inc %ax             #  mode
            mov %eax,%cr0           #
            ljmp $SEL_SCODE,$init.8     # To 32-bit code
            .code32
    init.8:     xorl %ecx,%ecx          # Zero
            movb $SEL_SDATA,%cl     # To 32-bit
            movw %cx,%ss            #  stack

.. raw:: html

   </div>

.. raw:: html

   </div>

First, a call is made to ``setpic`` to program the 8259A PIC
(Programmable Interrupt Controller). This chip is connected to multiple
hardware interrupt sources. Upon receiving an interrupt from a device,
it signals the processor with the appropriate interrupt vector. This can
be customized so that specific interrupts are associated with specific
interrupt vectors, as explained before. Next, the IDTR (Interrupt
Descriptor Table Register) and GDTR (Global Descriptor Table Register)
are loaded with the instructions ``lidt`` and ``lgdt``, respectively.
These registers are loaded with the base address and limit address for
the IDT and GDT. The following three instructions set the Protection
Enable (PE) bit of the ``%cr0`` register. This effectively switches the
processor to 32-bit protected mode. Next, a long jump is made to
``init.8`` using segment selector SEL\_SCODE, which selects the
Supervisor Code Segment. The processor is effectively executing in CPL
0, the most privileged level, after this jump. Finally, the Supervisor
Data Segment is selected for the stack by assigning the segment selector
SEL\_SDATA to the ``%ss`` register. This data segment also has a
privilege level of ``0``.

Our last code block is responsible for loading the TR (Task Register)
with the segment selector for the TSS we created earlier, and setting
the User Mode environment before passing execution control to the
``boot2`` client.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.32.?\ ``sys/boot/i386/btx/btx/btx.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    /*
     * Launch user task.
     */
            movb $SEL_TSS,%cl       # Set task
            ltr %cx             #  register
            movl $0xa000,%edx       # User base address
            movzwl %ss:BDA_MEM,%eax     # Get free memory
            shll $0xa,%eax          # To bytes
            subl $ARGSPACE,%eax     # Less arg space
            subl %edx,%eax          # Less base
            movb $SEL_UDATA,%cl     # User data selector
            pushl %ecx          # Set SS
            pushl %eax          # Set ESP
            push $0x202         # Set flags (IF set)
            push $SEL_UCODE         # Set CS
            pushl btx_hdr+0xc       # Set EIP
            pushl %ecx          # Set GS
            pushl %ecx          # Set FS
            pushl %ecx          # Set DS
            pushl %ecx          # Set ES
            pushl %edx          # Set EAX
            movb $0x7,%cl           # Set remaining
    init.9:     push $0x0           #  general
            loop init.9         #  registers
            popa                #  and initialize
            popl %es            # Initialize
            popl %ds            #  user
            popl %fs            #  segment
            popl %gs            #  registers
            iret                # To user mode

.. raw:: html

   </div>

.. raw:: html

   </div>

Note that the client's environment include a stack segment selector and
stack pointer (registers ``%ss`` and ``%esp``). Indeed, once the TR is
loaded with the appropriate stack segment selector (instruction
``ltr``), the stack pointer is calculated and pushed onto the stack
along with the stack's segment selector. Next, the value ``0x202`` is
pushed onto the stack; it is the value that the EFLAGS will get when
control is passed to the client. Also, the User Mode code segment
selector and the client's entry point are pushed. Recall that this entry
point is patched in the BTX header at link time. Finally, segment
selectors (stored in register ``%ecx``) for the segment registers
``%gs, %fs, %ds and %es`` are pushed onto the stack, along with the
value at ``%edx`` (``0xa000``). Keep in mind the various values that
have been pushed onto the stack (they will be popped out shortly). Next,
values for the remaining general purpose registers are also pushed onto
the stack (note the ``loop`` that pushes the value ``0`` seven times).
Now, values will be started to be popped out of the stack. First, the
``popa`` instruction pops out of the stack the latest seven values
pushed. They are stored in the general purpose registers in order
``%edi, %esi, %ebp, %ebx, %edx, %ecx, %eax``. Then, the various segment
selectors pushed are popped into the various segment registers. Five
values still remain on the stack. They are popped when the ``iret``
instruction is executed. This instruction first pops the value that was
pushed from the BTX header. This value is a pointer to ``boot2``'s entry
point. It is placed in the register ``%eip``, the instruction pointer
register. Next, the segment selector for the User Code Segment is popped
and copied to register ``%cs``. Remember that this segment's privilege
level is 3, the least privileged level. This means that we must provide
values for the stack of this privilege level. This is why the processor,
besides further popping the value for the EFLAGS register, does two more
pops out of the stack. These values go to the stack pointer (``%esp``)
and the stack segment (``%ss``). Now, execution continues at ``boot0``'s
entry point.

It is important to note how the User Code Segment is defined. This
segment's *base address* is set to ``0xa000``. This means that code
memory addresses are *relative* to address 0xa000; if code being
executed is fetched from address ``0x2000``, the *actual* memory
addressed is ``0xa000+0x2000=0xc000``.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64534352" class="footnote">

`:sup:`[9]` <#idp64534352>`__\ Real-mode code and data are necessary
when switching back to real mode from protected mode, as suggested by
the Intel manuals.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+----------------------------+
| `Prev <boot-boot1.html>`__?   | `Up <boot.html>`__      | ?\ `Next <boot2.html>`__   |
+-------------------------------+-------------------------+----------------------------+
| 1.5.?\ ``boot1`` Stage?       | `Home <index.html>`__   | ?1.7.?boot2 Stage          |
+-------------------------------+-------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
