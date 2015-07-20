====================================
12.15. Power and Resource Management
====================================

.. raw:: html

   <div class="navheader">

12.15. Power and Resource Management
`????? <adding-swap-space.html>`__?
???????? 12. ??????? ??? ??????????????
?\ `??????? <ACPI-debug.html>`__

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

12.15. Power and Resource Management
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Hiten Pandya ??? Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is important to utilize hardware resources in an efficient manner.
Before ACPI was introduced, it was difficult and inflexible for
operating systems to manage the power usage and thermal properties of a
system. The hardware was managed by the BIOS and thus the user had less
control and visibility into the power management settings. Some limited
configurability was available via *Advanced Power Management (APM)*.
Power and resource management is one of the key components of a modern
operating system. For example, you may want an operating system to
monitor system limits (and possibly alert you) in case your system
temperature increased unexpectedly.

In this section of the FreeBSD Handbook, we will provide comprehensive
information about ACPI. References will be provided for further reading
at the end.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.15.1. What Is ACPI?
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Advanced Configuration and Power Interface (ACPI) is a standard written
by an alliance of vendors to provide a standard interface for hardware
resources and power management (hence the name). It is a key element in
*Operating System-directed configuration and Power Management*, i.e.: it
provides more control and flexibility to the operating system (OS).
Modern systems ?stretched? the limits of the current Plug and Play
interfaces prior to the introduction of ACPI. ACPI is the direct
successor to APM (Advanced Power Management).

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

12.15.2. Shortcomings of Advanced Power Management (APM)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The *Advanced Power Management (APM)* facility controls the power usage
of a system based on its activity. The APM BIOS is supplied by the
(system) vendor and it is specific to the hardware platform. An APM
driver in the OS mediates access to the *APM Software Interface*, which
allows management of power levels. APM should still be used for systems
manufactured at or before the year 2000.

There are four major problems in APM. Firstly, power management is done
by the (vendor-specific) BIOS, and the OS does not have any knowledge of
it. One example of this, is when the user sets idle-time values for a
hard drive in the APM BIOS, that when exceeded, it (BIOS) would spin
down the hard drive, without the consent of the OS. Secondly, the APM
logic is embedded in the BIOS, and it operates outside the scope of the
OS. This means users can only fix problems in their APM BIOS by flashing
a new one into the ROM; which is a very dangerous procedure with the
potential to leave the system in an unrecoverable state if it fails.
Thirdly, APM is a vendor-specific technology, which means that there is
a lot of parity (duplication of efforts) and bugs found in one vendor's
BIOS, may not be solved in others. Last but not the least, the APM BIOS
did not have enough room to implement a sophisticated power policy, or
one that can adapt very well to the purpose of the machine.

*Plug and Play BIOS (PNPBIOS)* was unreliable in many situations.
PNPBIOS is 16-bit technology, so the OS has to use 16-bit emulation in
order to ?interface? with PNPBIOS methods.

The FreeBSD APM driver is documented in the
`apm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=apm&sektion=4>`__
manual page.

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

12.15.3. Configuring ACPI
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``acpi.ko`` driver is loaded by default at start up by the
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
and should *not* be compiled into the kernel. The reasoning behind this
is that modules are easier to work with, say if switching to another
``acpi.ko`` without doing a kernel rebuild. This has the advantage of
making testing easier. Another reason is that starting ACPI after a
system has been brought up often doesn't work well. If you are
experiencing problems, you can disable ACPI altogether. This driver
should not and can not be unloaded because the system bus uses it for
various hardware interactions. ACPI can be disabled by setting
``hint.acpi.0.disabled="1"`` in ``/boot/loader.conf`` or at the
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
prompt.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

ACPI and APM cannot coexist and should be used separately. The last one
to load will terminate if the driver notices the other running.

.. raw:: html

   </div>

ACPI can be used to put the system into a sleep mode with
`acpiconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpiconf&sektion=8>`__,
the ``-s`` flag, and a ``1-5`` option. Most users will only need ``1``
or ``3`` (suspend to RAM). Option ``5`` will do a soft-off which is the
same action as:

.. code:: screen

    # halt -p

Other options are available via
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.
Check out the
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__
and
`acpiconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpiconf&sektion=8>`__
manual pages for more information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------------+--------------------------------------------+
| `????? <adding-swap-space.html>`__?   | `???? <config-tuning.html>`__   | ?\ `??????? <ACPI-debug.html>`__           |
+---------------------------------------+---------------------------------+--------------------------------------------+
| 12.14. Adding Swap Space?             | `???? <index.html>`__           | ?12.16. Using and Debugging FreeBSD ACPI   |
+---------------------------------------+---------------------------------+--------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
