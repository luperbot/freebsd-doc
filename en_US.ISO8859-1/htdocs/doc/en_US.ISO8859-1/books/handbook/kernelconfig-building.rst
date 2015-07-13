============================================
9.5.?Building and Installing a Custom Kernel
============================================

.. raw:: html

   <div class="navheader">

9.5.?Building and Installing a Custom Kernel
`Prev <kernelconfig-config.html>`__?
Chapter?9.?Configuring the FreeBSD Kernel
?\ `Next <kernelconfig-trouble.html>`__

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

9.5.?Building and Installing a Custom Kernel
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the edits to the custom configuration file have been saved, the
source code for the kernel can be compiled using the following steps:

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?9.1.?Building a Kernel

.. raw:: html

   </div>

#. Change to this directory:

   .. code:: screen

       # cd /usr/src

#. Compile the new kernel by specifying the name of the custom kernel
   configuration file:

   .. code:: screen

       # make buildkernel KERNCONF=MYKERNEL

#. Install the new kernel associated with the specified kernel
   configuration file. This command will copy the new kernel to
   ``/boot/kernel/kernel`` and save the old kernel to
   ``/boot/kernel.old/kernel``:

   .. code:: screen

       # make installkernel KERNCONF=MYKERNEL

#. Shutdown the system and reboot into the new kernel. If something goes
   wrong, refer to `The kernel does not
   boot <kernelconfig-trouble.html#kernelconfig-noboot>`__.

.. raw:: html

   </div>

By default, when a custom kernel is compiled, all kernel modules are
rebuilt. To update a kernel faster or to build only custom modules, edit
``/etc/make.conf`` before starting to build the kernel.

For example, this variable specifies the list of modules to build
instead of using the default of building all modules:

.. code:: programlisting

    MODULES_OVERRIDE = linux acpi

Alternately, this variable lists which modules to exclude from the build
process:

.. code:: programlisting

    WITHOUT_MODULES = linux acpi sound

Additional variables are available. Refer to
`make.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=make.conf&sektion=5>`__
for details.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+------------------------------+-------------------------------------------+
| `Prev <kernelconfig-config.html>`__?   | `Up <kernelconfig.html>`__   | ?\ `Next <kernelconfig-trouble.html>`__   |
+----------------------------------------+------------------------------+-------------------------------------------+
| 9.4.?The Configuration File?           | `Home <index.html>`__        | ?9.6.?If Something Goes Wrong             |
+----------------------------------------+------------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
