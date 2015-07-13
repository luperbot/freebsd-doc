===============================
9.2.?Why Build a Custom Kernel?
===============================

.. raw:: html

   <div class="navheader">

9.2.?Why Build a Custom Kernel?
`Prev <kernelconfig.html>`__?
Chapter?9.?Configuring the FreeBSD Kernel
?\ `Next <kernelconfig-devices.html>`__

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

9.2.?Why Build a Custom Kernel?
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Traditionally, FreeBSD used a monolithic kernel. The kernel was one
large program, supported a fixed list of devices, and in order to change
the kernel's behavior, one had to compile and then reboot into a new
kernel.

Today, most of the functionality in the FreeBSD kernel is contained in
modules which can be dynamically loaded and unloaded from the kernel as
necessary. This allows the running kernel to adapt immediately to new
hardware or for new functionality to be brought into the kernel. This is
known as a modular kernel.

Occasionally, it is still necessary to perform static kernel
configuration. Sometimes the needed functionality is so tied to the
kernel that it can not be made dynamically loadable. Some security
environments prevent the loading and unloading of kernel modules and
require that only needed functionality is statically compiled into the
kernel.

Building a custom kernel is often a rite of passage for advanced BSD
users. This process, while time consuming, can provide benefits to the
FreeBSD system. Unlike the ``GENERIC`` kernel, which must support a wide
range of hardware, a custom kernel can be stripped down to only provide
support for that computer's hardware. This has a number of benefits,
such as:

.. raw:: html

   <div class="itemizedlist">

-  Faster boot time. Since the kernel will only probe the hardware on
   the system, the time it takes the system to boot can decrease.

-  Lower memory usage. A custom kernel often uses less memory than the
   ``GENERIC`` kernel by omitting unused features and device drivers.
   This is important because the kernel code remains resident in
   physical memory at all times, preventing that memory from being used
   by applications. For this reason, a custom kernel is useful on a
   system with a small amount of RAM.

-  Additional hardware support. A custom kernel can add support for
   devices which are not present in the ``GENERIC`` kernel.

.. raw:: html

   </div>

Before building a custom kernel, consider the reason for doing so. If
there is a need for specific hardware support, it may already exist as a
module.

Kernel modules exist in ``/boot/kernel`` and may be dynamically loaded
into the running kernel using
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
Most kernel drivers have a loadable module and manual page. For example,
the `ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4>`__
wireless Ethernet driver has the following information in its manual
page:

.. code:: screen

    Alternatively, to load the driver as a module at boot time, place the
    following line in loader.conf(5):

        if_ath_load="YES"

Adding ``if_ath_load="YES"`` to ``/boot/loader.conf`` will load this
module dynamically at boot time.

In some cases, there is no associated module in ``/boot/kernel``. This
is mostly true for certain subsystems.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+------------------------------+-------------------------------------------+
| `Prev <kernelconfig.html>`__?                | `Up <kernelconfig.html>`__   | ?\ `Next <kernelconfig-devices.html>`__   |
+----------------------------------------------+------------------------------+-------------------------------------------+
| Chapter?9.?Configuring the FreeBSD Kernel?   | `Home <index.html>`__        | ?9.3.?Finding the System Hardware         |
+----------------------------------------------+------------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
