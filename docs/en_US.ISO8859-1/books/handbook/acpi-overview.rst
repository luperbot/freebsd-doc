====================================
12.13.?Power and Resource Management
====================================

.. raw:: html

   <div class="navheader">

12.13.?Power and Resource Management
`Prev <adding-swap-space.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <boot.html>`__

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

12.13.?Power and Resource Management
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Hiten Pandya and Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is important to utilize hardware resources in an efficient manner.
Power and resource management allows the operating system to monitor
system limits and to possibly provide an alert if the system temperature
increases unexpectedly. An early specification for providing power
management was the Advanced Power Management (APM) facility. APM
controls the power usage of a system based on its activity. However, it
was difficult and inflexible for operating systems to manage the power
usage and thermal properties of a system. The hardware was managed by
the BIOS and the user had limited configurability and visibility into
the power management settings. The APM BIOS is supplied by the vendor
and is specific to the hardware platform. An APM driver in the operating
system mediates access to the APM Software Interface, which allows
management of power levels.

There are four major problems in APM. First, power management is done by
the vendor-specific BIOS, separate from the operating system. For
example, the user can set idle-time values for a hard drive in the APM
BIOS so that, when exceeded, the BIOS spins down the hard drive without
the consent of the operating system. Second, the APM logic is embedded
in the BIOS, and it operates outside the scope of the operating system.
This means that users can only fix problems in the APM BIOS by flashing
a new one into the ROM, which is a dangerous procedure with the
potential to leave the system in an unrecoverable state if it fails.
Third, APM is a vendor-specific technology, meaning that there is a lot
of duplication of efforts and bugs found in one vendor's BIOS may not be
solved in others. Lastly, the APM BIOS did not have enough room to
implement a sophisticated power policy or one that can adapt well to the
purpose of the machine.

The Plug and Play BIOS (PNPBIOS) was unreliable in many situations.
PNPBIOS is 16-bit technology, so the operating system has to use 16-bit
emulation in order to interface with PNPBIOS methods. FreeBSD provides
an APM driver as APM should still be used for systems manufactured at or
before the year 2000. The driver is documented in
`apm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=apm&sektion=4>`__.

The successor to APM is the Advanced Configuration and Power Interface
(ACPI). ACPI is a standard written by an alliance of vendors to provide
an interface for hardware resources and power management. It is a key
element in *Operating System-directed configuration and Power
Management* as it provides more control and flexibility to the operating
system.

This chapter demonstrates how to configure ACPI on FreeBSD. It then
offers some tips on how to debug ACPI and how to submit a problem report
containing debugging information so that developers can diagnosis and
fix ACPI issues.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.13.1.?Configuring ACPI
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD the
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__
driver is loaded by default at system boot and should *not* be compiled
into the kernel. This driver cannot be unloaded after boot because the
system bus uses it for various hardware interactions. However, if the
system is experiencing problems, ACPI can be disabled altogether by
rebooting after setting ``hint.acpi.0.disabled="1"`` in
``/boot/loader.conf`` or by setting this variable at the loader prompt,
as described in `Section?13.2.3, “Stage
Three” <boot-introduction.html#boot-loader>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

ACPI and APM cannot coexist and should be used separately. The last one
to load will terminate if the driver notices the other is running.

.. raw:: html

   </div>

ACPI can be used to put the system into a sleep mode with ``acpiconf``,
the ``-s`` flag, and a number from ``1`` to ``5``. Most users only need
``1`` (quick suspend to RAM) or ``3`` (suspend to RAM). Option ``5``
performs a soft-off which is the same as running ``halt -p``.

Other options are available using ``sysctl``. Refer to
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__
and
`acpiconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpiconf&sektion=8>`__
for more information.

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

12.13.2.?Common Problems
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ACPI is present in all modern computers that conform to the ia32 (x86),
ia64 (Itanium), and amd64 (AMD) architectures. The full standard has
many features including CPU performance management, power planes
control, thermal zones, various battery systems, embedded controllers,
and bus enumeration. Most systems implement less than the full standard.
For instance, a desktop system usually only implements bus enumeration
while a laptop might have cooling and battery management support as
well. Laptops also have suspend and resume, with their own associated
complexity.

An ACPI-compliant system has various components. The BIOS and chipset
vendors provide various fixed tables, such as FADT, in memory that
specify things like the APIC map (used for SMP), config registers, and
simple configuration values. Additionally, a bytecode table, the
Differentiated System Description Table DSDT, specifies a tree-like name
space of devices and methods.

The ACPI driver must parse the fixed tables, implement an interpreter
for the bytecode, and modify device drivers and the kernel to accept
information from the ACPI subsystem. For FreeBSD, Intel? has provided an
interpreter (ACPI-CA) that is shared with Linux? and NetBSD. The path to
the ACPI-CA source code is ``src/sys/contrib/dev/acpica``. The glue code
that allows ACPI-CA to work on FreeBSD is in ``src/sys/dev/acpica/Osd``.
Finally, drivers that implement various ACPI devices are found in
``src/sys/dev/acpica``.

For ACPI to work correctly, all the parts have to work correctly. Here
are some common problems, in order of frequency of appearance, and some
possible workarounds or fixes. If a fix does not resolve the issue,
refer to `Section?12.13.4, “Getting and Submitting Debugging
Info” <acpi-overview.html#ACPI-submitdebug>`__ for instructions on how
to submit a bug report.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.13.2.1.?Mouse Issues
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In some cases, resuming from a suspend operation will cause the mouse to
fail. A known work around is to add ``hint.psm.0.flags="0x3000"`` to
``/boot/loader.conf``.

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

12.13.2.2.?Suspend/Resume
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ACPI has three suspend to RAM (STR) states, ``S1``-``S3``, and one
suspend to disk state (STD), called ``S4``. STD can be implemented in
two separate ways. The ``S4``\ BIOS is a BIOS-assisted suspend to disk
and ``S4``\ OS is implemented entirely by the operating system. The
normal state the system is in when plugged in but not powered up is
“soft off” (``S5``).

Use ``sysctl hw.acpi`` to check for the suspend-related items. These
example results are from a Thinkpad:

.. code:: screen

    hw.acpi.supported_sleep_state: S3 S4 S5
    hw.acpi.s4bios: 0

Use ``acpiconf -s`` to test ``S3``, ``S4``, and ``S5``. An ``s4bios`` of
one (``1``) indicates ``S4``\ BIOS support instead of ``S4`` operating
system support.

When testing suspend/resume, start with ``S1``, if supported. This state
is most likely to work since it does not require much driver support. No
one has implemented ``S2``, which is similar to ``S1``. Next, try
``S3``. This is the deepest STR state and requires a lot of driver
support to properly reinitialize the hardware.

A common problem with suspend/resume is that many device drivers do not
save, restore, or reinitialize their firmware, registers, or device
memory properly. As a first attempt at debugging the problem, try:

.. code:: screen

    # sysctl debug.bootverbose=1
    # sysctl debug.acpi.suspend_bounce=1
    # acpiconf -s 3

This test emulates the suspend/resume cycle of all device drivers
without actually going into ``S3`` state. In some cases, problems such
as losing firmware state, device watchdog time out, and retrying
forever, can be captured with this method. Note that the system will not
really enter ``S3`` state, which means devices may not lose power, and
many will work fine even if suspend/resume methods are totally missing,
unlike real ``S3`` state.

Harder cases require additional hardware, such as a serial port and
cable for debugging through a serial console, a Firewire port and cable
for using
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__,
and kernel debugging skills.

To help isolate the problem, unload as many drivers as possible. If it
works, narrow down which driver is the problem by loading drivers until
it fails again. Typically, binary drivers like ``nvidia.ko``, display
drivers, and USB will have the most problems while Ethernet interfaces
usually work fine. If drivers can be properly loaded and unloaded,
automate this by putting the appropriate commands in ``/etc/rc.suspend``
and ``/etc/rc.resume``. Try setting ``hw.acpi.reset_video`` to ``0`` if
the display is messed up after resume. Try setting longer or shorter
values for ``hw.acpi.sleep_delay`` to see if that helps.

Try loading a recent Linux? distribution to see if suspend/resume works
on the same hardware. If it works on Linux?, it is likely a FreeBSD
driver problem. Narrowing down which driver causes the problem will
assist developers in fixing the problem. Since the ACPI maintainers
rarely maintain other drivers, such as sound or ATA, any driver problems
should also be posted to the
`freebsd-current <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__
list and mailed to the driver maintainer. Advanced users can include
debugging
`printf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=3>`__\ s
in a problematic driver to track down where in its resume function it
hangs.

Finally, try disabling ACPI and enabling APM instead. If suspend/resume
works with APM, stick with APM, especially on older hardware (pre-2000).
It took vendors a while to get ACPI support correct and older hardware
is more likely to have BIOS problems with ACPI.

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

12.13.2.3.?System Hangs
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Most system hangs are a result of lost interrupts or an interrupt storm.
Chipsets may have problems based on boot, how the BIOS configures
interrupts before correctness of the APIC (MADT) table, and routing of
the System Control Interrupt (SCI).

Interrupt storms can be distinguished from lost interrupts by checking
the output of ``vmstat -i`` and looking at the line that has ``acpi0``.
If the counter is increasing at more than a couple per second, there is
an interrupt storm. If the system appears hung, try breaking to DDB
(**CTRL**+**ALT**+**ESC** on console) and type ``show interrupts``.

When dealing with interrupt problems, try disabling APIC support with
``hint.apic.0.disabled="1"`` in ``/boot/loader.conf``.

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

12.13.2.4.?Panics
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Panics are relatively rare for ACPI and are the top priority to be
fixed. The first step is to isolate the steps to reproduce the panic, if
possible, and get a backtrace. Follow the advice for enabling
``options DDB`` and setting up a serial console in `Section?26.6.4,
“Entering the DDB Debugger from the Serial
Line” <serialconsole-setup.html#serialconsole-ddb>`__ or setting up a
dump partition. To get a backtrace in DDB, use ``tr``. When handwriting
the backtrace, get at least the last five and the top five lines in the
trace.

Then, try to isolate the problem by booting with ACPI disabled. If that
works, isolate the ACPI subsystem by using various values of
``debug.acpi.disable``. See
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__
for some examples.

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

12.13.2.5.?System Powers Up After Suspend or Shutdown
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, try setting ``hw.acpi.disable_on_poweroff="0"`` in
``/boot/loader``. This keeps ACPI from disabling various events during
the shutdown process. Some systems need this value set to ``1`` (the
default) for the same reason. This usually fixes the problem of a system
powering up spontaneously after a suspend or poweroff.

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

12.13.2.6.?BIOS Contains Buggy Bytecode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some BIOS vendors provide incorrect or buggy bytecode. This is usually
manifested by kernel console messages like this:

.. code:: screen

    ACPI-1287: *** Error: Method execution failed [\\_SB_.PCI0.LPC0.FIGD._STA] \\
    (Node 0xc3f6d160), AE_NOT_FOUND

Often, these problems may be resolved by updating the BIOS to the latest
revision. Most console messages are harmless, but if there are other
problems, like the battery status is not working, these messages are a
good place to start looking for problems.

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

12.13.3.?Overriding the Default AML
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The BIOS bytecode, known as ACPI Machine Language (AML), is compiled
from a source language called ACPI Source Language (ASL). The AML is
found in the table known as the Differentiated System Description Table
(DSDT).

The goal of FreeBSD is for everyone to have working ACPI without any
user intervention. Workarounds are still being developed for common
mistakes made by BIOS vendors. The Microsoft? interpreter (``acpi.sys``
and ``acpiec.sys``) does not strictly check for adherence to the
standard, and thus many BIOS vendors who only test ACPI under Windows?
never fix their ASL. FreeBSD developers continue to identify and
document which non-standard behavior is allowed by Microsoft?'s
interpreter and replicate it so that FreeBSD can work without forcing
users to fix the ASL.

To help identify buggy behavior and possibly fix it manually, a copy can
be made of the system's ASL. To copy the system's ASL to a specified
file name, use ``acpidump`` with ``-t``, to show the contents of the
fixed tables, and ``-d``, to disassemble the AML:

.. code:: screen

    # acpidump -td > my.asl

Some AML versions assume the user is running Windows?. To override this,
set ``hw.acpi.osname="Windows       2009"`` in ``/boot/loader.conf``,
using the most recent Windows? version listed in the ASL.

Other workarounds may require ``my.asl`` to be customized. If this file
is edited, compile the new ASL using the following command. Warnings can
usually be ignored, but errors are bugs that will usually prevent ACPI
from working correctly.

.. code:: screen

    # iasl -f my.asl

Including ``-f`` forces creation of the AML, even if there are errors
during compilation. Some errors, such as missing return statements, are
automatically worked around by the FreeBSD interpreter.

The default output filename for ``iasl`` is ``DSDT.aml``. Load this file
instead of the BIOS's buggy copy, which is still present in flash
memory, by editing ``/boot/loader.conf`` as follows:

.. code:: programlisting

    acpi_dsdt_load="YES"
    acpi_dsdt_name="/boot/DSDT.aml"

Be sure to copy ``DSDT.aml`` to ``/boot``, then reboot the system. If
this fixes the problem, send a
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__ of
the old and new ASL to
`freebsd-acpi <http://lists.FreeBSD.org/mailman/listinfo/freebsd-acpi>`__
so that developers can work around the buggy behavior in ``acpica``.

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

12.13.4.?Getting and Submitting Debugging Info
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Nate Lawson.

.. raw:: html

   </div>

.. raw:: html

   <div>

With contributions from Peter Schultz and Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ACPI driver has a flexible debugging facility. A set of subsystems
and the level of verbosity can be specified. The subsystems to debug are
specified as layers and are broken down into components
(``ACPI_ALL_COMPONENTS``) and ACPI hardware support
(``ACPI_ALL_DRIVERS``). The verbosity of debugging output is specified
as the level and ranges from just report errors (``ACPI_LV_ERROR``) to
everything (``ACPI_LV_VERBOSE``). The level is a bitmask so multiple
options can be set at once, separated by spaces. In practice, a serial
console should be used to log the output so it is not lost as the
console message buffer flushes. A full list of the individual layers and
levels is found in
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__.

Debugging output is not enabled by default. To enable it, add
``options ACPI_DEBUG`` to the custom kernel configuration file if ACPI
is compiled into the kernel. Add ``ACPI_DEBUG=1`` to ``/etc/make.conf``
to enable it globally. If a module is used instead of a custom kernel,
recompile just the ``acpi.ko`` module as follows:

.. code:: screen

    # cd /sys/modules/acpi/acpi && make clean && make ACPI_DEBUG=1

Copy the compiled ``acpi.ko`` to ``/boot/kernel`` and add the desired
level and layer to ``/boot/loader.conf``. The entries in this example
enable debug messages for all ACPI components and hardware drivers and
output error messages at the least verbose level:

.. code:: programlisting

    debug.acpi.layer="ACPI_ALL_COMPONENTS ACPI_ALL_DRIVERS"
    debug.acpi.level="ACPI_LV_ERROR"

If the required information is triggered by a specific event, such as a
suspend and then resume, do not modify ``/boot/loader.conf``. Instead,
use ``sysctl`` to specify the layer and level after booting and
preparing the system for the specific event. The variables which can be
set using ``sysctl`` are named the same as the tunables in
``/boot/loader.conf``.

Once the debugging information is gathered, it can be sent to
`freebsd-acpi <http://lists.FreeBSD.org/mailman/listinfo/freebsd-acpi>`__
so that it can be used by the FreeBSD ACPI maintainers to identify the
root cause of the problem and to develop a solution.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Before submitting debugging information to this mailing list, ensure the
latest BIOS version is installed and, if available, the embedded
controller firmware version.

.. raw:: html

   </div>

When submitting a problem report, include the following information:

.. raw:: html

   <div class="itemizedlist">

-  Description of the buggy behavior, including system type, model, and
   anything that causes the bug to appear. Note as accurately as
   possible when the bug began occurring if it is new.

-  The output of ``dmesg`` after running ``boot -v``, including any
   error messages generated by the bug.

-  The ``dmesg`` output from ``boot           -v`` with ACPI disabled,
   if disabling ACPI helps to fix the problem.

-  Output from ``sysctl hw.acpi``. This lists which features the system
   offers.

-  The URL to a pasted version of the system's ASL. Do *not* send the
   ASL directly to the list as it can be very large. Generate a copy of
   the ASL by running this command:

   .. code:: screen

       # acpidump -dt > name-system.asl

   Substitute the login name for *``name``* and manufacturer/model for
   *``system``*. For example, use ``njl-FooCo6000.asl``.

.. raw:: html

   </div>

Most FreeBSD developers watch the `FreeBSD-CURRENT mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__, but
one should submit problems to
`freebsd-acpi <http://lists.FreeBSD.org/mailman/listinfo/freebsd-acpi>`__
to be sure it is seen. Be patient when waiting for a response. If the
bug is not immediately apparent, submit a PR using
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__.
When entering a PR, include the same information as requested above.
This helps developers to track the problem and resolve it. Do not send a
PR without emailing
`freebsd-acpi <http://lists.FreeBSD.org/mailman/listinfo/freebsd-acpi>`__
first as it is likely that the problem has been reported before.

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

12.13.5.?References
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

More information about ACPI may be found in the following locations:

.. raw:: html

   <div class="itemizedlist">

-  The FreeBSD ACPI Mailing List Archives
   (``http://lists.freebsd.org/pipermail/freebsd-acpi/``)

-  The ACPI 2.0 Specification (``http://acpi.info/spec.htm``)

-  `acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__,
   `acpi\_thermal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_thermal&sektion=4>`__,
   `acpidump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidump&sektion=8>`__,
   `iasl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iasl&sektion=8>`__,
   and
   `acpidb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidb&sektion=8>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+--------------------------------------------+
| `Prev <adding-swap-space.html>`__?   | `Up <config-tuning.html>`__   | ?\ `Next <boot.html>`__                    |
+--------------------------------------+-------------------------------+--------------------------------------------+
| 12.12.?Adding Swap Space?            | `Home <index.html>`__         | ?Chapter?13.?The FreeBSD Booting Process   |
+--------------------------------------+-------------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
