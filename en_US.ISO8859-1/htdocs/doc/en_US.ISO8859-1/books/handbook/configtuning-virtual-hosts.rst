===================
12.6.?Virtual Hosts
===================

.. raw:: html

   <div class="navheader">

12.6.?Virtual Hosts
`Prev <config-network-setup.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <configtuning-syslog.html>`__

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

12.6.?Virtual Hosts
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A common use of FreeBSD is virtual site hosting, where one server
appears to the network as many servers. This is achieved by assigning
multiple network addresses to a single interface.

A given network interface has one “real” address, and may have any
number of “alias” addresses. These aliases are normally added by placing
alias entries in ``/etc/rc.conf``, as seen in this example:

.. code:: programlisting

    ifconfig_fxp0_alias0="inet xxx.xxx.xxx.xxx netmask xxx.xxx.xxx.xxx"

Alias entries must start with ``alias0`` using a sequential number such
as ``alias0``, ``alias1``, and so on. The configuration process will
stop at the first missing number.

The calculation of alias netmasks is important. For a given interface,
there must be one address which correctly represents the network's
netmask. Any other addresses which fall within this network must have a
netmask of all ``1``\ s, expressed as either ``255.255.255.255`` or
``0xffffffff``.

For example, consider the case where the ``fxp0`` interface is connected
to two networks: ``10.1.1.0`` with a netmask of ``255.255.255.0`` and
``202.0.75.16`` with a netmask of ``255.255.255.240``. The system is to
be configured to appear in the ranges ``10.1.1.1`` through ``10.1.1.5``
and ``202.0.75.17`` through ``202.0.75.20``. Only the first address in a
given network range should have a real netmask. All the rest
(``10.1.1.2`` through ``10.1.1.5`` and ``202.0.75.18`` through
``202.0.75.20``) must be configured with a netmask of
``255.255.255.255``.

The following ``/etc/rc.conf`` entries configure the adapter correctly
for this scenario:

.. code:: programlisting

    ifconfig_fxp0="inet 10.1.1.1 netmask 255.255.255.0"
    ifconfig_fxp0_alias0="inet 10.1.1.2 netmask 255.255.255.255"
    ifconfig_fxp0_alias1="inet 10.1.1.3 netmask 255.255.255.255"
    ifconfig_fxp0_alias2="inet 10.1.1.4 netmask 255.255.255.255"
    ifconfig_fxp0_alias3="inet 10.1.1.5 netmask 255.255.255.255"
    ifconfig_fxp0_alias4="inet 202.0.75.17 netmask 255.255.255.240"
    ifconfig_fxp0_alias5="inet 202.0.75.18 netmask 255.255.255.255"
    ifconfig_fxp0_alias6="inet 202.0.75.19 netmask 255.255.255.255"
    ifconfig_fxp0_alias7="inet 202.0.75.20 netmask 255.255.255.255"

A simpler way to express this is with a space-separated list of IP
address ranges. The first address will be given the indicated subnet
mask and the additional addresses will have a subnet mask of
``255.255.255.255``.

.. code:: programlisting

    ifconfig_fxp0_aliases="inet 10.1.1.1-5/24 inet 202.0.75.17-20/28"

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------------+------------------------------------------+
| `Prev <config-network-setup.html>`__?       | `Up <config-tuning.html>`__   | ?\ `Next <configtuning-syslog.html>`__   |
+---------------------------------------------+-------------------------------+------------------------------------------+
| 12.5.?Setting Up Network Interface Cards?   | `Home <index.html>`__         | ?12.7.?Configuring System Logging        |
+---------------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
