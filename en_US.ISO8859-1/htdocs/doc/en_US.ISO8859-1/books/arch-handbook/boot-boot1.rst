================
1.5.?boot1 Stage
================

.. raw:: html

   <div class="navheader">

1.5.?\ ``boot1`` Stage
`Prev <boot-boot0.html>`__?
Chapter?1.?Bootstrapping and Kernel Initialization
?\ `Next <btx-server.html>`__

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

1.5.?\ ``boot1`` Stage
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

So far we have gone through the following sequence:

.. raw:: html

   <div class="itemizedlist">

-  The BIOS did some early hardware initialization, including the POST.
   The MBR (``boot0``) was loaded from absolute disk sector one to
   address ``0x7c00``. Execution control was passed to that location.

-  ``boot0`` relocated itself to the location it was linked to execute
   (``0x600``), followed by a jump to continue execution at the
   appropriate place. Finally, ``boot0`` loaded the first disk sector
   from the FreeBSD slice to address ``0x7c00``. Execution control was
   passed to that location.

.. raw:: html

   </div>

``boot1`` is the next step in the boot-loading sequence. It is the first
of three boot stages. Note that we have been dealing exclusively with
disk sectors. Indeed, the BIOS loads the absolute first sector, while
``boot0`` loads the first sector of the FreeBSD slice. Both loads are to
address ``0x7c00``. We can conceptually think of these disk sectors as
containing the files ``boot0`` and ``boot1``, respectively, but in
reality this is not entirely true for ``boot1``. Strictly speaking,
unlike ``boot0``, ``boot1`` is not part of the boot blocks
`:sup:`[3]` <#ftn.idp64308688>`__. Instead, a single, full-blown file,
``boot`` (``/boot/boot``), is what ultimately is written to disk. This
file is a combination of ``boot1``, ``boot2`` and the ``Boot Extender``
(or BTX). This single file is greater in size than a single sector
(greater than 512 bytes). Fortunately, ``boot1`` occupies *exactly* the
first 512 bytes of this single file, so when ``boot0`` loads the first
sector of the FreeBSD slice (512 bytes), it is actually loading
``boot1`` and transferring control to it.

The main task of ``boot1`` is to load the next boot stage. This next
stage is somewhat more complex. It is composed of a server called the
“Boot Extender”, or BTX, and a client, called ``boot2``. As we will see,
the last boot stage, ``loader``, is also a client of the BTX server.

Let us now look in detail at what exactly is done by ``boot1``, starting
like we did for ``boot0``, at its entry point:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.11.?\ ``sys/boot/i386/boot2/boot1.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    start:
        jmp main

.. raw:: html

   </div>

.. raw:: html

   </div>

The entry point at ``start`` simply jumps past a special data area to
the label ``main``, which in turn looks like this:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.12.?\ ``sys/boot/i386/boot2/boot1.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    main:
          cld           # String ops inc
          xor %cx,%cx       # Zero
          mov %cx,%es       # Address
          mov %cx,%ds       #  data
          mov %cx,%ss       # Set up
          mov $start,%sp        #  stack
          mov %sp,%si       # Source
          mov $0x700,%di        # Destination
          incb %ch          # Word count
          rep           # Copy
          movsw         #  code

.. raw:: html

   </div>

.. raw:: html

   </div>

Just like ``boot0``, this code relocates ``boot1``, this time to memory
address ``0x700``. However, unlike ``boot0``, it does not jump there.
``boot1`` is linked to execute at address ``0x7c00``, effectively where
it was loaded in the first place. The reason for this relocation will be
discussed shortly.

Next comes a loop that looks for the FreeBSD slice. Although ``boot0``
loaded ``boot1`` from the FreeBSD slice, no information was passed to it
about this `:sup:`[4]` <#ftn.idp64364368>`__, so ``boot1`` must rescan
the partition table to find where the FreeBSD slice starts. Therefore it
rereads the MBR:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.13.?\ ``sys/boot/i386/boot2/boot1.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          mov $part4,%si     # Partition
          cmpb $0x80,%dl        # Hard drive?
          jb main.4         # No
          movb $0x1,%dh     # Block count
          callw nread       # Read MBR

.. raw:: html

   </div>

.. raw:: html

   </div>

In the code above, register ``%dl`` maintains information about the boot
device. This is passed on by the BIOS and preserved by the MBR. Numbers
``0x80`` and greater tells us that we are dealing with a hard drive, so
a call is made to ``nread``, where the MBR is read. Arguments to
``nread`` are passed through ``%si`` and ``%dh``. The memory address at
label ``part4`` is copied to ``%si``. This memory address holds a “fake
partition” to be used by ``nread``. The following is the data in the
fake partition:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.14.?\ ``sys/boot/i386/boot2/Makefile``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

          part4:
        .byte 0x80, 0x00, 0x01, 0x00
        .byte 0xa5, 0xfe, 0xff, 0xff
        .byte 0x00, 0x00, 0x00, 0x00
        .byte 0x50, 0xc3, 0x00, 0x00

.. raw:: html

   </div>

.. raw:: html

   </div>

In particular, the LBA for this fake partition is hardcoded to zero.
This is used as an argument to the BIOS for reading absolute sector one
from the hard drive. Alternatively, CHS addressing could be used. In
this case, the fake partition holds cylinder 0, head 0 and sector 1,
which is equivalent to absolute sector one.

Let us now proceed to take a look at ``nread``:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.15.?\ ``sys/boot/i386/boot2/boot1.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    nread:
          mov $0x8c00,%bx       # Transfer buffer
          mov 0x8(%si),%ax      # Get
          mov 0xa(%si),%cx      #  LBA
          push %cs          # Read from
          callw xread.1     #  disk
          jnc return        # If success, return

.. raw:: html

   </div>

.. raw:: html

   </div>

Recall that ``%si`` points to the fake partition. The word
`:sup:`[5]` <#ftn.idp64428368>`__ at offset ``0x8`` is copied to
register ``%ax`` and word at offset ``0xa`` to ``%cx``. They are
interpreted by the BIOS as the lower 4-byte value denoting the LBA to be
read (the upper four bytes are assumed to be zero). Register ``%bx``
holds the memory address where the MBR will be loaded. The instruction
pushing ``%cs`` onto the stack is very interesting. In this context, it
accomplishes nothing. However, as we will see shortly, ``boot2``, in
conjunction with the BTX server, also uses ``xread.1``. This mechanism
will be discussed in the next section.

The code at ``xread.1`` further calls the ``read`` function, which
actually calls the BIOS asking for the disk sector:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.16.?\ ``sys/boot/i386/boot2/boot1.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    xread.1:
        pushl $0x0      #  absolute
        push %cx        #  block
        push %ax        #  number
        push %es        # Address of
        push %bx        #  transfer buffer
        xor %ax,%ax     # Number of
        movb %dh,%al        #  blocks to
        push %ax        #  transfer
        push $0x10      # Size of packet
        mov %sp,%bp     # Packet pointer
        callw read      # Read from disk
        lea 0x10(%bp),%sp   # Clear stack
        lret            # To far caller

.. raw:: html

   </div>

.. raw:: html

   </div>

Note the long return instruction at the end of this block. This
instruction pops out the ``%cs`` register pushed by ``nread``, and
returns. Finally, ``nread`` also returns.

With the MBR loaded to memory, the actual loop for searching the FreeBSD
slice begins:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.17.?\ ``sys/boot/i386/boot2/boot1.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

      mov $0x1,%cx         # Two passes
    main.1:
        mov $0x8dbe,%si # Partition table
        movb $0x1,%dh        # Partition
    main.2:
        cmpb $0xa5,0x4(%si)  # Our partition type?
        jne main.3       # No
        jcxz main.5      # If second pass
        testb $0x80,(%si)    # Active?
        jnz main.5       # Yes
    main.3:
        add $0x10,%si        # Next entry
        incb %dh         # Partition
        cmpb $0x5,%dh        # In table?
        jb main.2        # Yes
        dec %cx          # Do two
        jcxz main.1      #  passes

.. raw:: html

   </div>

.. raw:: html

   </div>

If a FreeBSD slice is identified, execution continues at ``main.5``.
Note that when a FreeBSD slice is found ``%si`` points to the
appropriate entry in the partition table, and ``%dh`` holds the
partition number. We assume that a FreeBSD slice is found, so we
continue execution at ``main.5``:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.18.?\ ``sys/boot/i386/boot2/boot1.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    main.5:
        mov %dx,0x900              # Save args
        movb $0x10,%dh             # Sector count
        callw nread            # Read disk
        mov $0x9000,%bx            # BTX
        mov 0xa(%bx),%si           # Get BTX length and set
        add %bx,%si            #  %si to start of boot2.bin
        mov $0xc000,%di            # Client page 2
        mov $0xa200,%cx            # Byte
        sub %si,%cx            #  count
        rep                # Relocate
        movsb                  #  client

.. raw:: html

   </div>

.. raw:: html

   </div>

Recall that at this point, register ``%si`` points to the FreeBSD slice
entry in the MBR partition table, so a call to ``nread`` will
effectively read sectors at the beginning of this partition. The
argument passed on register ``%dh`` tells ``nread`` to read 16 disk
sectors. Recall that the first 512 bytes, or the first sector of the
FreeBSD slice, coincides with the ``boot1`` program. Also recall that
the file written to the beginning of the FreeBSD slice is not
``/boot/boot1``, but ``/boot/boot``. Let us look at the size of these
files in the filesystem:

.. code:: screen

    -r--r--r--  1 root  wheel   512B Jan  8 00:15 /boot/boot0
    -r--r--r--  1 root  wheel   512B Jan  8 00:15 /boot/boot1
    -r--r--r--  1 root  wheel   7.5K Jan  8 00:15 /boot/boot2
    -r--r--r--  1 root  wheel   8.0K Jan  8 00:15 /boot/boot

Both ``boot0`` and ``boot1`` are 512 bytes each, so they fit *exactly*
in one disk sector. ``boot2`` is much bigger, holding both the BTX
server and the ``boot2`` client. Finally, a file called simply ``boot``
is 512 bytes larger than ``boot2``. This file is a concatenation of
``boot1`` and ``boot2``. As already noted, ``boot0`` is the file written
to the absolute first disk sector (the MBR), and ``boot`` is the file
written to the first sector of the FreeBSD slice; ``boot1`` and
``boot2`` are *not* written to disk. The command used to concatenate
``boot1`` and ``boot2`` into a single ``boot`` is merely
``cat boot1 boot2 > boot``.

So ``boot1`` occupies exactly the first 512 bytes of ``boot`` and,
because ``boot`` is written to the first sector of the FreeBSD slice,
``boot1`` fits exactly in this first sector. Because ``nread`` reads the
first 16 sectors of the FreeBSD slice, it effectively reads the entire
``boot`` file `:sup:`[6]` <#ftn.idp64537680>`__. We will see more
details about how ``boot`` is formed from ``boot1`` and ``boot2`` in the
next section.

Recall that ``nread`` uses memory address ``0x8c00`` as the transfer
buffer to hold the sectors read. This address is conveniently chosen.
Indeed, because ``boot1`` belongs to the first 512 bytes, it ends up in
the address range ``0x8c00``-``0x8dff``. The 512 bytes that follows
(range ``0x8e00``-``0x8fff``) is used to store the *bsdlabel*
`:sup:`[7]` <#ftn.idp64561616>`__.

Starting at address ``0x9000`` is the beginning of the BTX server, and
immediately following is the ``boot2`` client. The BTX server acts as a
kernel, and executes in protected mode in the most privileged level. In
contrast, the BTX clients (``boot2``, for example), execute in user
mode. We will see how this is accomplished in the next section. The code
after the call to ``nread`` locates the beginning of ``boot2`` in the
memory buffer, and copies it to memory address ``0xc000``. This is
because the BTX server arranges ``boot2`` to execute in a segment
starting at ``0xa000``. We explore this in detail in the following
section.

The last code block of ``boot1`` enables access to memory above 1MB
`:sup:`[8]` <#ftn.idp64578896>`__ and concludes with a jump to the
starting point of the BTX server:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?1.19.?\ ``sys/boot/i386/boot2/boot1.S``

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

    seta20:
        cli         # Disable interrupts
    seta20.1:
        dec %cx         # Timeout?
        jz seta20.3     # Yes

        inb $0x64,%al       # Get status
        testb $0x2,%al      # Busy?
        jnz seta20.1        # Yes
        movb $0xd1,%al      # Command: Write
        outb %al,$0x64      #  output port
    seta20.2:
        inb $0x64,%al       # Get status
        testb $0x2,%al      # Busy?
        jnz seta20.2        # Yes
        movb $0xdf,%al      # Enable
        outb %al,$0x60      #  A20
    seta20.3:
        sti         # Enable interrupts
        jmp 0x9010      # Start BTX

.. raw:: html

   </div>

.. raw:: html

   </div>

Note that right before the jump, interrupts are enabled.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64308688" class="footnote">

`:sup:`[3]` <#idp64308688>`__\ There is a file ``/boot/boot1``, but it
is not the written to the beginning of the FreeBSD slice. Instead, it is
concatenated with ``boot2`` to form ``boot``, which *is* written to the
beginning of the FreeBSD slice and read at boot time.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp64364368" class="footnote">

`:sup:`[4]` <#idp64364368>`__\ Actually we did pass a pointer to the
slice entry in register ``%si``. However, ``boot1`` does not assume that
it was loaded by ``boot0`` (perhaps some other MBR loaded it, and did
not pass this information), so it assumes nothing.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp64428368" class="footnote">

`:sup:`[5]` <#idp64428368>`__\ In the context of 16-bit real mode, a
word is 2 bytes.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp64537680" class="footnote">

`:sup:`[6]` <#idp64537680>`__\ 512\*16=8192 bytes, exactly the size of
``boot``

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp64561616" class="footnote">

`:sup:`[7]` <#idp64561616>`__\ Historically known as “disklabel”. If you
ever wondered where FreeBSD stored this information, it is in this
region. See
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp64578896" class="footnote">

`:sup:`[8]` <#idp64578896>`__\ This is necessary for legacy reasons.
Interested readers should see http://en.wikipedia.org/wiki/A20_line.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------+---------------------------------+
| `Prev <boot-boot0.html>`__?                | `Up <boot.html>`__      | ?\ `Next <btx-server.html>`__   |
+--------------------------------------------+-------------------------+---------------------------------+
| 1.4.?The Master Boot Record (``boot0``)?   | `Home <index.html>`__   | ?1.6.?The BTX Server            |
+--------------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
