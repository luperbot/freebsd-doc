===================================
1.4.?The Master Boot Record (boot0)
===================================

.. raw:: html

   <div class="navheader">

1.4.?The Master Boot Record (``boot0``)
`Prev <boot-bios.html>`__?
Chapter?1.?Bootstrapping and Kernel Initialization
?\ `Next <boot-boot1.html>`__

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

1.4.?The Master Boot Record (``boot0``)
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After control is received from the BIOS at memory address ``0x7c00``,
``boot0`` starts executing. It is the first piece of code under FreeBSD
control. The task of ``boot0`` is quite simple: scan the partition table
and let the user choose which partition to boot from. The Partition
Table is a special, standard data structure embedded in the MBR (hence
embedded in ``boot0``) describing the four standard PC “partitions”
`:sup:`[1]` <#ftn.idp63627344>`__. ``boot0`` resides in the filesystem
as ``/boot/boot0``. It is a small 512-byte file, and it is exactly what
FreeBSD's installation procedure wrote to the hard disk's MBR if you
chose the “bootmanager” option at installation time. Indeed, ``boot0``
*is* the MBR.

As mentioned previously, the ``INT 0x19`` instruction causes the
``INT 0x19`` handler to load an MBR (``boot0``) into memory at address
``0x7c00``. The source file for ``boot0`` can be found in
``sys/boot/i386/boot0/boot0.S`` - which is an awesome piece of code
written by Robert Nordier.

A special structure starting from offset ``0x1be`` in the MBR is called
the *partition table*. It has four records of 16 bytes each, called
*partition records*, which represent how the hard disk is partitioned,
or, in FreeBSD's terminology, sliced. One byte of those 16 says whether
a partition (slice) is bootable or not. Exactly one record must have
that flag set, otherwise ``boot0``'s code will refuse to proceed.

A partition record has the following fields:

.. raw:: html

   <div class="itemizedlist">

-  the 1-byte filesystem type

-  the 1-byte bootable flag

-  the 6 byte descriptor in CHS format

-  the 8 byte descriptor in LBA format

.. raw:: html

   </div>

A partition record descriptor contains information about where exactly
the partition resides on the drive. Both descriptors, LBA and CHS,
describe the same information, but in different ways: LBA (Logical Block
Addressing) has the starting sector for the partition and the
partition's length, while CHS (Cylinder Head Sector) has coordinates for
the first and last sectors of the partition. The partition table ends
with the special signature ``0xaa55``.

The MBR must fit into 512 bytes, a single disk sector. This program uses
low-level “tricks” like taking advantage of the side effects of certain
instructions and reusing register values from previous operations to
make the most out of the fewest possible instructions. Care must also be
taken when handling the partition table, which is embedded in the MBR
itself. For these reasons, be very careful when modifying ``boot0.S``.

Note that the ``boot0.S`` source file is assembled “as is”: instructions
are translated one by one to binary, with no additional information (no
ELF file format, for example). This kind of low-level control is
achieved at link time through special control flags passed to the
linker. For example, the text section of the program is set to be
located at address ``0x600``. In practice this means that ``boot0`` must
be loaded to memory address ``0x600`` in order to function properly.

It is worth looking at the ``Makefile`` for ``boot0``
(``sys/boot/i386/boot0/Makefile``), as it defines some of the run-time
behavior of ``boot0``. For instance, if a terminal connected to the
serial port (COM1) is used for I/O, the macro ``SIO`` must be defined
(``-DSIO``). ``-DPXE`` enables boot through PXE by pressing **F6**.
Additionally, the program defines a set of *flags* that allow further
modification of its behavior. All of this is illustrated in the
``Makefile``. For example, look at the linker directives which command
the linker to start the text section at address ``0x600``, and to build
the output file “as is” (strip out any file formatting):

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.1.?\ ``sys/boot/i386/boot0/Makefile``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          BOOT_BOOT0_ORG?=0x600
          LDFLAGS=-e start -Ttext ${BOOT_BOOT0_ORG} \
          -Wl,-N,-S,--oformat,binary

.. raw:: html

   </div>

.. raw:: html

   </div>

Let us now start our study of the MBR, or ``boot0``, starting where
execution begins.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Some modifications have been made to some instructions in favor of
better exposition. For example, some macros are expanded, and some macro
tests are omitted when the result of the test is known. This applies to
all of the code examples shown.

.. raw:: html

   </div>

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.2.?\ ``sys/boot/i386/boot0/boot0.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    start:
          cld           # String ops inc
          xorw %ax,%ax      # Zero
          movw %ax,%es      # Address
          movw %ax,%ds      #  data
          movw %ax,%ss      # Set up
          movw 0x7c00,%sp       #  stack

.. raw:: html

   </div>

.. raw:: html

   </div>

This first block of code is the entry point of the program. It is where
the BIOS transfers control. First, it makes sure that the string
operations autoincrement its pointer operands (the ``cld`` instruction)
`:sup:`[2]` <#ftn.idp63741904>`__. Then, as it makes no assumption about
the state of the segment registers, it initializes them. Finally, it
sets the stack pointer register (``%sp``) to address ``0x7c00``, so we
have a working stack.

The next block is responsible for the relocation and subsequent jump to
the relocated code.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.3.?\ ``sys/boot/i386/boot0/boot0.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          movw $0x7c00,%si  # Source
          movw $0x600,%di       # Destination
          movw $512,%cx     # Word count
          rep           # Relocate
          movsb         #  code
          movw %di,%bp      # Address variables
          movb $16,%cl      # Words to clear
          rep           # Zero
          stosb         #  them
          incb -0xe(%di)        # Set the S field to 1
          jmp main-0x7c00+0x600 # Jump to relocated code

.. raw:: html

   </div>

.. raw:: html

   </div>

Because ``boot0`` is loaded by the BIOS to address ``0x7C00``, it copies
itself to address ``0x600`` and then transfers control there (recall
that it was linked to execute at address ``0x600``). The source address,
``0x7c00``, is copied to register ``%si``. The destination address,
``0x600``, to register ``%di``. The number of bytes to copy, ``512``
(the program's size), is copied to register ``%cx``. Next, the ``rep``
instruction repeats the instruction that follows, that is, ``movsb``,
the number of times dictated by the ``%cx`` register. The ``movsb``
instruction copies the byte pointed to by ``%si`` to the address pointed
to by ``%di``. This is repeated another 511 times. On each repetition,
both the source and destination registers, ``%si`` and ``%di``, are
incremented by one. Thus, upon completion of the 512-byte copy, ``%di``
has the value ``0x600``\ +\ ``512``\ = ``0x800``, and ``%si`` has the
value ``0x7c00``\ +\ ``512``\ = ``0x7e00``; we have thus completed the
code *relocation*.

Next, the destination register ``%di`` is copied to ``%bp``. ``%bp``
gets the value ``0x800``. The value ``16`` is copied to ``%cl`` in
preparation for a new string operation (like our previous ``movsb``).
Now, ``stosb`` is executed 16 times. This instruction copies a ``0``
value to the address pointed to by the destination register (``%di``,
which is ``0x800``), and increments it. This is repeated another 15
times, so ``%di`` ends up with value ``0x810``. Effectively, this clears
the address range ``0x800``-``0x80f``. This range is used as a (fake)
partition table for writing the MBR back to disk. Finally, the sector
field for the CHS addressing of this fake partition is given the value 1
and a jump is made to the main function from the relocated code. Note
that until this jump to the relocated code, any reference to an absolute
address was avoided.

The following code block tests whether the drive number provided by the
BIOS should be used, or the one stored in ``boot0``.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.4.?\ ``sys/boot/i386/boot0/boot0.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    main:
          testb $SETDRV,-69(%bp)    # Set drive number?
          jnz disable_update    # Yes
          testb %dl,%dl     # Drive number valid?
          js save_curdrive      # Possibly (0x80 set)

.. raw:: html

   </div>

.. raw:: html

   </div>

This code tests the ``SETDRV`` bit (``0x20``) in the *flags* variable.
Recall that register ``%bp`` points to address location ``0x800``, so
the test is done to the *flags* variable at address ``0x800``-``69``\ =
``0x7bb``. This is an example of the type of modifications that can be
done to ``boot0``. The ``SETDRV`` flag is not set by default, but it can
be set in the ``Makefile``. When set, the drive number stored in the MBR
is used instead of the one provided by the BIOS. We assume the defaults,
and that the BIOS provided a valid drive number, so we jump to
``save_curdrive``.

The next block saves the drive number provided by the BIOS, and calls
``putn`` to print a new line on the screen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.5.?\ ``sys/boot/i386/boot0/boot0.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    save_curdrive:
          movb %dl, (%bp)       # Save drive number
          pushw %dx         # Also in the stack
    #ifdef  TEST    /* test code, print internal bios drive */
          rolb $1, %dl
          movw $drive, %si
          call putkey
    #endif
          callw putn        # Print a newline

.. raw:: html

   </div>

.. raw:: html

   </div>

Note that we assume ``TEST`` is not defined, so the conditional code in
it is not assembled and will not appear in our executable ``boot0``.

Our next block implements the actual scanning of the partition table. It
prints to the screen the partition type for each of the four entries in
the partition table. It compares each type with a list of well-known
operating system file systems. Examples of recognized partition types
are NTFS (Windows?, ID 0x7), ``ext2fs`` (Linux?, ID 0x83), and, of
course, ``ffs``/``ufs2`` (FreeBSD, ID 0xa5). The implementation is
fairly simple.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.6.?\ ``sys/boot/i386/boot0/boot0.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          movw $(partbl+0x4),%bx  # Partition table (+4)
          xorw %dx,%dx      # Item number

    read_entry:
          movb %ch,-0x4(%bx)    # Zero active flag (ch == 0)
          btw %dx,_FLAGS(%bp)   # Entry enabled?
          jnc next_entry        # No
          movb (%bx),%al        # Load type
          test %al, %al     # skip empty partition
          jz next_entry
          movw $bootable_ids,%di    # Lookup tables
          movb $(TLEN+1),%cl    # Number of entries
          repne         # Locate
          scasb         #  type
          addw $(TLEN-1), %di   # Adjust
          movb (%di),%cl        # Partition
          addw %cx,%di      #  description
          callw putx        # Display it

    next_entry:
          incw %dx          # Next item
          addb $0x10,%bl        # Next entry
          jnc read_entry        # Till done

.. raw:: html

   </div>

.. raw:: html

   </div>

It is important to note that the active flag for each entry is cleared,
so after the scanning, *no* partition entry is active in our memory copy
of ``boot0``. Later, the active flag will be set for the selected
partition. This ensures that only one active partition exists if the
user chooses to write the changes back to disk.

The next block tests for other drives. At startup, the BIOS writes the
number of drives present in the computer to address ``0x475``. If there
are any other drives present, ``boot0`` prints the current drive to
screen. The user may command ``boot0`` to scan partitions on another
drive later.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.7.?\ ``sys/boot/i386/boot0/boot0.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          popw %ax         # Drive number
          subb $0x79,%al        # Does next
          cmpb 0x475,%al        #  drive exist? (from BIOS?)
          jb print_drive        # Yes
          decw %ax          # Already drive 0?
          jz print_prompt       # Yes

.. raw:: html

   </div>

.. raw:: html

   </div>

We make the assumption that a single drive is present, so the jump to
``print_drive`` is not performed. We also assume nothing strange
happened, so we jump to ``print_prompt``.

This next block just prints out a prompt followed by the default option:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.8.?\ ``sys/boot/i386/boot0/boot0.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    print_prompt:
          movw $prompt,%si      # Display
          callw putstr      #  prompt
          movb _OPT(%bp),%dl    # Display
          decw %si          #  default
          callw putkey      #  key
          jmp start_input       # Skip beep

.. raw:: html

   </div>

.. raw:: html

   </div>

Finally, a jump is performed to ``start_input``, where the BIOS services
are used to start a timer and for reading user input from the keyboard;
if the timer expires, the default option will be selected:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.9.?\ ``sys/boot/i386/boot0/boot0.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    start_input:
          xorb %ah,%ah      # BIOS: Get
          int $0x1a         #  system time
          movw %dx,%di      # Ticks when
          addw _TICKS(%bp),%di  #  timeout
    read_key:
          movb $0x1,%ah     # BIOS: Check
          int $0x16         #  for keypress
          jnz got_key       # Have input
          xorb %ah,%ah      # BIOS: int 0x1a, 00
          int $0x1a         #  get system time
          cmpw %di,%dx      # Timeout?
          jb read_key       # No

.. raw:: html

   </div>

.. raw:: html

   </div>

An interrupt is requested with number ``0x1a`` and argument ``0`` in
register ``%ah``. The BIOS has a predefined set of services, requested
by applications as software-generated interrupts through the ``int``
instruction and receiving arguments in registers (in this case,
``%ah``). Here, particularly, we are requesting the number of clock
ticks since last midnight; this value is computed by the BIOS through
the RTC (Real Time Clock). This clock can be programmed to work at
frequencies ranging from 2?Hz to 8192?Hz. The BIOS sets it to 18.2?Hz at
startup. When the request is satisfied, a 32-bit result is returned by
the BIOS in registers ``%cx`` and ``%dx`` (lower bytes in ``%dx``). This
result (the ``%dx`` part) is copied to register ``%di``, and the value
of the ``TICKS`` variable is added to ``%di``. This variable resides in
``boot0`` at offset ``_TICKS`` (a negative value) from register ``%bp``
(which, recall, points to ``0x800``). The default value of this variable
is ``0xb6`` (182 in decimal). Now, the idea is that ``boot0`` constantly
requests the time from the BIOS, and when the value returned in register
``%dx`` is greater than the value stored in ``%di``, the time is up and
the default selection will be made. Since the RTC ticks 18.2 times per
second, this condition will be met after 10 seconds (this default
behaviour can be changed in the ``Makefile``). Until this time has
passed, ``boot0`` continually asks the BIOS for any user input; this is
done through ``int 0x16``, argument ``1`` in ``%ah``.

Whether a key was pressed or the time expired, subsequent code validates
the selection. Based on the selection, the register ``%si`` is set to
point to the appropriate partition entry in the partition table. This
new selection overrides the previous default one. Indeed, it becomes the
new default. Finally, the ACTIVE flag of the selected partition is set.
If it was enabled at compile time, the in-memory version of ``boot0``
with these modified values is written back to the MBR on disk. We leave
the details of this implementation to the reader.

We now end our study with the last code block from the ``boot0``
program:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.10.?\ ``sys/boot/i386/boot0/boot0.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          movw $0x7c00,%bx       # Address for read
          movb $0x2,%ah     # Read sector
          callw intx13      #  from disk
          jc beep           # If error
          cmpw $0xaa55,0x1fe(%bx)   # Bootable?
          jne beep          # No
          pushw %si         # Save ptr to selected part.
          callw putn        # Leave some space
          popw %si          # Restore, next stage uses it
          jmp *%bx          # Invoke bootstrap

.. raw:: html

   </div>

.. raw:: html

   </div>

Recall that ``%si`` points to the selected partition entry. This entry
tells us where the partition begins on disk. We assume, of course, that
the partition selected is actually a FreeBSD slice.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

From now on, we will favor the use of the technically more accurate term
“slice” rather than “partition”.

.. raw:: html

   </div>

The transfer buffer is set to ``0x7c00`` (register ``%bx``), and a read
for the first sector of the FreeBSD slice is requested by calling
``intx13``. We assume that everything went okay, so a jump to ``beep``
is not performed. In particular, the new sector read must end with the
magic sequence ``0xaa55``. Finally, the value at ``%si`` (the pointer to
the selected partition table) is preserved for use by the next stage,
and a jump is performed to address ``0x7c00``, where execution of our
next stage (the just-read block) is started.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp63627344" class="footnote">

`:sup:`[1]` <#idp63627344>`__\ http://en.wikipedia.org/wiki/Master_boot_record

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp63741904" class="footnote">

`:sup:`[2]` <#idp63741904>`__\ When in doubt, we refer the reader to the
official Intel manuals, which describe the exact semantics for each
instruction:
http://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+---------------------------------+
| `Prev <boot-bios.html>`__?   | `Up <boot.html>`__      | ?\ `Next <boot-boot1.html>`__   |
+------------------------------+-------------------------+---------------------------------+
| 1.3.?The BIOS?               | `Home <index.html>`__   | ?1.5.?\ ``boot1`` Stage         |
+------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
