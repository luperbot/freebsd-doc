=============
1.3.?The BIOS
=============

.. raw:: html

   <div class="navheader">

1.3.?The BIOS
`Prev <boot-overview.html>`__?
Chapter?1.?Bootstrapping and Kernel Initialization
?\ `Next <boot-boot0.html>`__

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

1.3.?The BIOS
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When the computer powers on, the processor's registers are set to some
predefined values. One of the registers is the *instruction pointer*
register, and its value after a power on is well defined: it is a 32-bit
value of ``0xfffffff0``. The instruction pointer register (also known as
the Program Counter) points to code to be executed by the processor.
Another important register is the ``cr0`` 32-bit control register, and
its value just after a reboot is ``0``. One of ``cr0``'s bits, the PE
(Protection Enabled) bit, indicates whether the processor is running in
32-bit protected mode or 16-bit real mode. Since this bit is cleared at
boot time, the processor boots in 16-bit real mode. Real mode means,
among other things, that linear and physical addresses are identical.
The reason for the processor not to start immediately in 32-bit
protected mode is backwards compatibility. In particular, the boot
process relies on the services provided by the BIOS, and the BIOS itself
works in legacy, 16-bit code.

The value of ``0xfffffff0`` is slightly less than 4?GB, so unless the
machine has 4?GB of physical memory, it cannot point to a valid memory
address. The computer's hardware translates this address so that it
points to a BIOS memory block.

The BIOS (Basic Input Output System) is a chip on the motherboard that
has a relatively small amount of read-only memory (ROM). This memory
contains various low-level routines that are specific to the hardware
supplied with the motherboard. The processor will first jump to the
address 0xfffffff0, which really resides in the BIOS's memory. Usually
this address contains a jump instruction to the BIOS's POST routines.

The POST (Power On Self Test) is a set of routines including the memory
check, system bus check, and other low-level initialization so the CPU
can set up the computer properly. The important step of this stage is
determining the boot device. Modern BIOS implementations permit the
selection of a boot device, allowing booting from a floppy, CD-ROM, hard
disk, or other devices.

The very last thing in the POST is the ``INT 0x19`` instruction. The
``INT 0x19`` handler reads 512 bytes from the first sector of boot
device into the memory at address ``0x7c00``. The term *first sector*
originates from hard drive architecture, where the magnetic plate is
divided into a number of cylindrical tracks. Tracks are numbered, and
every track is divided into a number (usually 64) of sectors. Track
numbers start at 0, but sector numbers start from 1. Track 0 is the
outermost on the magnetic plate, and sector 1, the first sector, has a
special purpose. It is also called the MBR, or Master Boot Record. The
remaining sectors on the first track are never used.

This sector is our boot-sequence starting point. As we will see, this
sector contains a copy of our ``boot0`` program. A jump is made by the
BIOS to address ``0x7c00`` so it starts executing.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+--------------------------------------------+
| `Prev <boot-overview.html>`__?   | `Up <boot.html>`__      | ?\ `Next <boot-boot0.html>`__              |
+----------------------------------+-------------------------+--------------------------------------------+
| 1.2.?Overview?                   | `Home <index.html>`__   | ?1.4.?The Master Boot Record (``boot0``)   |
+----------------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
