================
14.3.?Newbus API
================

.. raw:: html

   <div class="navheader">

14.3.?Newbus API
`Prev <newbus-overview.html>`__?
Chapter?14.?Newbus
?\ `Next <oss.html>`__

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

14.3.?Newbus API
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As the Newbus API is huge, this section makes some effort at documenting
it. More information to come in the next revision of this document.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.3.1.?Important Locations in the Source Hierarchy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``src/sys/[arch]/[arch]`` - Kernel code for a specific machine
architecture resides in this directory. For example, the ``i386``
architecture, or the ``SPARC64`` architecture.

``src/sys/dev/[bus]`` - device support for a specific ``[bus]`` resides
in this directory.

``src/sys/dev/pci`` - PCI bus support code resides in this directory.

``src/sys/[isa|pci]`` - PCI/ISA device drivers reside in this directory.
The PCI/ISA bus support code used to exist in this directory in FreeBSD
version ``4.0``.

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

14.3.2.?Important Structures and Type Definitions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``devclass_t`` - This is a type definition of a pointer to a
``struct devclass``.

``device_method_t`` - This is the same as ``kobj_method_t`` (see
``src/sys/kobj.h``).

``device_t`` - This is a type definition of a pointer to a
``struct device``. ``device_t`` represents a device in the system. It is
a kernel object. See ``src/sys/sys/bus_private.h`` for implementation
details.

``driver_t`` - This is a type definition which references
``struct driver``. The ``driver`` struct is a class of the ``device``
kernel object; it also holds data private to the driver.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?14.1.?*driver\_t* Implementation

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

        struct driver {
            KOBJ_CLASS_FIELDS;
            void    *priv;          /* driver private data */
          };

.. raw:: html

   </div>

.. raw:: html

   </div>

A ``device_state_t`` type, which is an enumeration, ``device_state``. It
contains the possible states of a Newbus device before and after the
autoconfiguration process.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?14.2.?Device States *device\_state\_t*

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: programlisting

         /*
           * src/sys/sys/bus.h
           */
          typedef enum device_state {
            DS_NOTPRESENT,  /* not probed or probe failed */
            DS_ALIVE,       /* probe succeeded */
            DS_ATTACHED,    /* attach method called */
            DS_BUSY         /* device is open */
          } device_state_t;

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+--------------------------------+
| `Prev <newbus-overview.html>`__?   | `Up <newbus.html>`__    | ?\ `Next <oss.html>`__         |
+------------------------------------+-------------------------+--------------------------------+
| 14.2.?Overview of Newbus?          | `Home <index.html>`__   | ?Chapter?15.?Sound Subsystem   |
+------------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
