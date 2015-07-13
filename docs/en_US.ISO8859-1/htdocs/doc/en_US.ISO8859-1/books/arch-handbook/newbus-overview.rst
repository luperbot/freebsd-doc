========================
14.2.?Overview of Newbus
========================

.. raw:: html

   <div class="navheader">

14.2.?Overview of Newbus
`Prev <newbus.html>`__?
Chapter?14.?Newbus
?\ `Next <newbus-api.html>`__

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

14.2.?Overview of Newbus
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*Newbus* is the implementation of a new bus architecture based on
abstraction layers which saw its introduction in FreeBSD 3.0 when the
Alpha port was imported into the source tree. It was not until 4.0
before it became the default system to use for device drivers. Its goals
are to provide a more object-oriented means of interconnecting the
various busses and devices which a host system provides to the
*Operating System*.

Its main features include amongst others:

.. raw:: html

   <div class="itemizedlist">

-  dynamic attaching

-  easy modularization of drivers

-  pseudo-busses

.. raw:: html

   </div>

One of the most prominent changes is the migration from the flat and
ad-hoc system to a device tree layout.

At the top level resides the *“root”* device which is the parent to hang
all other devices on. For each architecture, there is typically a single
child of “root” which has such things as *host-to-PCI bridges*, etc.
attached to it. For x86, this “root” device is the *“nexus”* device. For
Alpha, various different models of Alpha have different top-level
devices corresponding to the different hardware chipsets, including
*lca*, *apecs*, *cia* and *tsunami*.

A device in the Newbus context represents a single hardware entity in
the system. For instance each PCI device is represented by a Newbus
device. Any device in the system can have children; a device which has
children is often called a *“bus”*. Examples of common busses in the
system are ISA and PCI, which manage lists of devices attached to ISA
and PCI busses respectively.

Often, a connection between different kinds of bus is represented by a
*“bridge”* device, which normally has one child for the attached bus. An
example of this is a *PCI-to-PCI bridge* which is represented by a
device *``pcibN``* on the parent PCI bus and has a child *``pciN``* for
the attached bus. This layout simplifies the implementation of the PCI
bus tree, allowing common code to be used for both top-level and bridged
busses.

Each device in the Newbus architecture asks its parent to map its
resources. The parent then asks its own parent until the nexus is
reached. So, basically the nexus is the only part of the Newbus system
which knows about all resources.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

An ISA device might want to map its IO port at ``0x230``, so it asks its
parent, in this case the ISA bus. The ISA bus hands it over to the
PCI-to-ISA bridge which in its turn asks the PCI bus, which reaches the
host-to-PCI bridge and finally the nexus. The beauty of this transition
upwards is that there is room to translate the requests. For example,
the ``0x230`` IO port request might become memory-mapped at
``0xb0000230`` on a MIPS box by the PCI bridge.

.. raw:: html

   </div>

Resource allocation can be controlled at any place in the device tree.
For instance on many Alpha platforms, ISA interrupts are managed
separately from PCI interrupts and resource allocations for ISA
interrupts are managed by the Alpha's ISA bus device. On IA-32, ISA and
PCI interrupts are both managed by the top-level nexus device. For both
ports, memory and port address space is managed by a single entity -
nexus for IA-32 and the relevant chipset driver on Alpha (e.g., CIA or
tsunami).

In order to normalize access to memory and port mapped resources, Newbus
integrates the ``bus_space`` APIs from NetBSD. These provide a single
API to replace inb/outb and direct memory reads/writes. The advantage of
this is that a single driver can easily use either memory-mapped
registers or port-mapped registers (some hardware supports both).

This support is integrated into the resource allocation mechanism. When
a resource is allocated, a driver can retrieve the associated
``bus_space_tag_t`` and ``bus_space_handle_t`` from the resource.

Newbus also allows for definitions of interface methods in files
dedicated to this purpose. These are the ``.m`` files that are found
under the ``src/sys`` hierarchy.

The core of the Newbus system is an extensible “object-based
programming” model. Each device in the system has a table of methods
which it supports. The system and other devices uses those methods to
control the device and request services. The different methods supported
by a device are defined by a number of “interfaces”. An “interface” is
simply a group of related methods which can be implemented by a device.

In the Newbus system, the methods for a device are provided by the
various device drivers in the system. When a device is attached to a
driver during *auto-configuration*, it uses the method table declared by
the driver. A device can later *detach* from its driver and *re-attach*
to a new driver with a new method table. This allows dynamic replacement
of drivers which can be useful for driver development.

The interfaces are described by an interface definition language similar
to the language used to define vnode operations for file systems. The
interface would be stored in a methods file (which would normally be
named ``foo_if.m``).

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?14.1.?Newbus Methods

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

          # Foo subsystem/driver (a comment...)

          INTERFACE foo

        METHOD int doit {
            device_t dev;
        };

        # DEFAULT is the method that will be used, if a method was not
        # provided via: DEVMETHOD()

        METHOD void doit_to_child {
            device_t dev;
            driver_t child;
        } DEFAULT doit_generic_to_child;

.. raw:: html

   </div>

.. raw:: html

   </div>

When this interface is compiled, it generates a header file
“``foo_if.h``” which contains function declarations:

.. code:: programlisting

          int FOO_DOIT(device_t dev);
          int FOO_DOIT_TO_CHILD(device_t dev, device_t child);

A source file, “``foo_if.c``” is also created to accompany the
automatically generated header file; it contains implementations of
those functions which look up the location of the relevant functions in
the object's method table and call that function.

The system defines two main interfaces. The first fundamental interface
is called *“device”* and includes methods which are relevant to all
devices. Methods in the *“device”* interface include *“probe”*,
*“attach”* and *“detach”* to control detection of hardware and
*“shutdown”*, *“suspend”* and *“resume”* for critical event
notification.

The second, more complex interface is *“bus”*. This interface contains
methods suitable for devices which have children, including methods to
access bus specific per-device information
`:sup:`[10]` <#ftn.idp73166544>`__, event notification
(*``child_detached``*, *``driver_added``*) and resource management
(*``alloc_resource``*, *``activate_resource``*,
*``deactivate_resource``*, *``release_resource``*).

Many methods in the “bus” interface are performing services for some
child of the bus device. These methods would normally use the first two
arguments to specify the bus providing the service and the child device
which is requesting the service. To simplify driver code, many of these
methods have accessor functions which lookup the parent and call a
method on the parent. For instance the method
``BUS_TEARDOWN_INTR(device_t dev, device_t child,     ...)`` can be
called using the function
``bus_teardown_intr(device_t child,     ...)``.

Some bus types in the system define additional interfaces to provide
access to bus-specific functionality. For instance, the PCI bus driver
defines the “pci” interface which has two methods *``read_config``* and
*``write_config``* for accessing the configuration registers of a PCI
device.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp73166544" class="footnote">

`:sup:`[10]` <#idp73166544>`__\ `bus\_generic\_read\_ivar(9) <http://www.FreeBSD.org/cgi/man.cgi?query=bus_generic_read_ivar&sektion=9>`__
and
`bus\_generic\_write\_ivar(9) <http://www.FreeBSD.org/cgi/man.cgi?query=bus_generic_write_ivar&sektion=9>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+---------------------------------+
| `Prev <newbus.html>`__?   | `Up <newbus.html>`__    | ?\ `Next <newbus-api.html>`__   |
+---------------------------+-------------------------+---------------------------------+
| Chapter?14.?Newbus?       | `Home <index.html>`__   | ?14.3.?Newbus API               |
+---------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
