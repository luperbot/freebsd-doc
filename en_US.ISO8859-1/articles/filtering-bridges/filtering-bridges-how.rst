=================
2.?How to Install
=================

.. raw:: html

   <div class="navheader">

2.?How to Install
`Prev <index.html>`__?
?
?\ `Next <filtering-bridges-finalprep.html>`__

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

2.?How to Install
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Adding bridge functionalities to a FreeBSD system is not difficult.
Since 4.5 release it is possible to load such functionalities as modules
instead of having to rebuild the kernel, simplifying the procedure a
great deal. In the following subsections I will explain both
installation ways.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

*Do not* follow both instructions: a procedure *excludes* the other one.
Select the best choice according to your needs and abilities.

.. raw:: html

   </div>

Before going on, be sure to have at least two Ethernet cards that
support the promiscuous mode for both reception and transmission, since
they must be able to send Ethernet packets with any address, not just
their own. Moreover, to have a good throughput, the cards should be PCI
bus mastering cards. The best choices are still the Intel EtherExpress™
Pro, followed by the 3Com? 3c9xx series. To simplify the firewall
configuration it may be useful to have two cards of different
manufacturers (using different drivers) in order to distinguish clearly
which interface is connected to the router and which to the inner
network.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Kernel Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

So you have decided to use the older but well tested installation
method. To begin, you have to add the following rows to your kernel
configuration file:

.. code:: programlisting

    options BRIDGE
    options IPFIREWALL
    options IPFIREWALL_VERBOSE

The first line is to compile the bridge support, the second one is the
firewall and the third one is the logging functions of the firewall.

Now it is necessary to build and install the new kernel. You may find
detailed instructions in the `Building and Installing a Custom
Kernel <../../../../doc/en_US.ISO8859-1/books/handbook/kernelconfig-building.html>`__
section of the FreeBSD Handbook.

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

2.2.?Modules Loading
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you have chosen to use the new and simpler installation method, the
only thing to do now is add the following row to ``/boot/loader.conf``:

.. code:: programlisting

    bridge_load="YES"

In this way, during the system startup, the ``bridge.ko`` module will be
loaded together with the kernel. It is not required to add a similar row
for the ``ipfw.ko`` module, since it will be loaded automatically after
the execution of the steps in the following section.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+--------------------------------------------------+
| `Prev <index.html>`__?   | ?                       | ?\ `Next <filtering-bridges-finalprep.html>`__   |
+--------------------------+-------------------------+--------------------------------------------------+
| Filtering Bridges?       | `Home <index.html>`__   | ?3.?Final Preparation                            |
+--------------------------+-------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
