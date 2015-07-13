======================
5.2.?SYSINIT Operation
======================

.. raw:: html

   <div class="navheader">

5.2.?SYSINIT Operation
`Prev <sysinit.html>`__?
Chapter?5.?The SYSINIT Framework
?\ `Next <sysinit-using.html>`__

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

5.2.?SYSINIT Operation
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SYSINIT relies on the ability of the linker to take static data declared
at multiple locations throughout a program's source and group it
together as a single contiguous chunk of data. This linker technique is
called a “linker set”. SYSINIT uses two linker sets to maintain two data
sets containing each consumer's call order, function, and a pointer to
the data to pass to that function.

SYSINIT uses two priorities when ordering the functions for execution.
The first priority is a subsystem ID giving an overall order for
SYSINIT's dispatch of functions. Current predeclared ID's are in
``<sys/kernel.h>`` in the enum list ``sysinit_sub_id``. The second
priority used is an element order within the subsystem. Current
predeclared subsystem element orders are in ``<sys/kernel.h>`` in the
enum list ``sysinit_elem_order``.

There are currently two uses for SYSINIT. Function dispatch at system
startup and kernel module loads, and function dispatch at system
shutdown and kernel module unload. Kernel subsystems often use system
startup SYSINIT's to initialize data structures, for example the process
scheduling subsystem uses a SYSINIT to initialize the run queue data
structure. Device drivers should avoid using ``SYSINIT()`` directly.
Instead drivers for real devices that are part of a bus structure should
use ``DRIVER_MODULE()`` to provide a function that detects the device
and, if it is present, initializes the device. It will do a few things
specific to devices and then call ``SYSINIT()`` itself. For
pseudo-devices, which are not part of a bus structure, use
``DEV_MODULE()``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+------------------------------------+
| `Prev <sysinit.html>`__?            | `Up <sysinit.html>`__   | ?\ `Next <sysinit-using.html>`__   |
+-------------------------------------+-------------------------+------------------------------------+
| Chapter?5.?The SYSINIT Framework?   | `Home <index.html>`__   | ?5.3.?Using SYSINIT                |
+-------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
