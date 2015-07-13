============================
9.6.?If Something Goes Wrong
============================

.. raw:: html

   <div class="navheader">

9.6.?If Something Goes Wrong
`Prev <kernelconfig-building.html>`__?
Chapter?9.?Configuring the FreeBSD Kernel
?\ `Next <printing.html>`__

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

9.6.?If Something Goes Wrong
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are four categories of trouble that can occur when building a
custom kernel:

.. raw:: html

   <div class="variablelist">

``config`` fails
    If ``config`` fails, it will print the line number that is
    incorrect. As an example, for the following message, make sure that
    line 17 is typed correctly by comparing it to ``GENERIC`` or
    ``NOTES``:

    .. code:: screen

        config: line 17: syntax error

``make`` fails
    If ``make`` fails, it is usually due to an error in the kernel
    configuration file which is not severe enough for ``config`` to
    catch. Review the configuration, and if the problem is not apparent,
    send an email to the `FreeBSD general questions mailing
    list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__
    which contains the kernel configuration file.

The kernel does not boot
    If the new kernel does not boot or fails to recognize devices, do
    not panic! Fortunately, FreeBSD has an excellent mechanism for
    recovering from incompatible kernels. Simply choose the kernel to
    boot from at the FreeBSD boot loader. This can be accessed when the
    system boot menu appears by selecting the “Escape to a loader
    prompt” option. At the prompt, type ``boot           kernel.old``,
    or the name of any other kernel that is known to boot properly.

    After booting with a good kernel, check over the configuration file
    and try to build it again. One helpful resource is
    ``/var/log/messages`` which records the kernel messages from every
    successful boot. Also,
    `dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
    will print the kernel messages from the current boot.

    .. raw:: html

       <div class="note" xmlns="">

    Note:
    ~~~~~

    When troubleshooting a kernel, make sure to keep a copy of
    ``GENERIC``, or some other kernel that is known to work, as a
    different name that will not get erased on the next build. This is
    important because every time a new kernel is installed,
    ``kernel.old`` is overwritten with the last installed kernel, which
    may or may not be bootable. As soon as possible, move the working
    kernel by renaming the directory containing the good kernel:

    .. code:: screen

        # mv /boot/kernel /boot/kernel.bad
        # mv /boot/kernel.good /boot/kernel

    .. raw:: html

       </div>

The kernel works, but
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ does
not
    If the kernel version differs from the one that the system utilities
    have been built with, for example, a kernel built from -CURRENT
    sources is installed on a -RELEASE system, many system status
    commands like
    `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
    and
    `vmstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vmstat&sektion=8>`__
    will not work. To fix this, `recompile and install a
    world <makeworld.html>`__ built with the same version of the source
    tree as the kernel. It is never a good idea to use a different
    version of the kernel than the rest of the operating system.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+------------------------------+-------------------------------+
| `Prev <kernelconfig-building.html>`__?          | `Up <kernelconfig.html>`__   | ?\ `Next <printing.html>`__   |
+-------------------------------------------------+------------------------------+-------------------------------+
| 9.5.?Building and Installing a Custom Kernel?   | `Home <index.html>`__        | ?Chapter?10.?Printing         |
+-------------------------------------------------+------------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
