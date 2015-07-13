====================
2.9.?Troubleshooting
====================

.. raw:: html

   <div class="navheader">

2.9.?Troubleshooting
`Prev <bsdinstall-post.html>`__?
Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later
?\ `Next <using-live-cd.html>`__

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

2.9.?Troubleshooting
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section covers basic installation troubleshooting, such as common
problems people have reported.

Check the Hardware Notes
(`http://www.freebsd.org/releases/index.html <../../../../releases/index.html>`__)
document for the version of FreeBSD to make sure the hardware is
supported. If the hardware is supported and lock-ups or other problems
occur, build a custom kernel using the instructions in `Chapter?9,
*Configuring the FreeBSD Kernel* <kernelconfig.html>`__ to add support
for devices which are not present in the ``GENERIC`` kernel. The default
kernel assumes that most hardware devices are in their factory default
configuration in terms of IRQs, I/O addresses, and DMA channels. If the
hardware has been reconfigured, a custom kernel configuration file can
tell FreeBSD where to find things.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Some installation problems can be avoided or alleviated by updating the
firmware on various hardware components, most notably the motherboard.
Motherboard firmware is usually referred to as the BIOS. Most
motherboard and computer manufacturers have a website for upgrades and
upgrade information.

Manufacturers generally advise against upgrading the motherboard BIOS
unless there is a good reason for doing so, like a critical update. The
upgrade process *can* go wrong, leaving the BIOS incomplete and the
computer inoperative.

.. raw:: html

   </div>

If the system hangs while probing hardware during boot, or it behaves
strangely during install, ACPI may be the culprit. FreeBSD makes
extensive use of the system ACPI service on the i386, amd64, and ia64
platforms to aid in system configuration if it is detected during boot.
Unfortunately, some bugs still exist in both the ACPI driver and within
system motherboards and BIOS firmware. ACPI can be disabled by setting
the ``hint.acpi.0.disabled`` hint in the third stage boot loader:

.. code:: screen

    set hint.acpi.0.disabled="1"

This is reset each time the system is booted, so it is necessary to add
``hint.acpi.0.disabled="1"`` to the file ``/boot/loader.conf``. More
information about the boot loader can be found in `Section?13.1,
“Synopsis” <boot.html#boot-synopsis>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------+------------------------------------+
| `Prev <bsdinstall-post.html>`__?   | `Up <bsdinstall.html>`__   | ?\ `Next <using-live-cd.html>`__   |
+------------------------------------+----------------------------+------------------------------------+
| 2.8.?Post-Installation?            | `Home <index.html>`__      | ?2.10.?Using the Live CD           |
+------------------------------------+----------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
