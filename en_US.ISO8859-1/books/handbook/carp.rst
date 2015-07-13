================================================
31.10.?Common Address Redundancy Protocol (CARP)
================================================

.. raw:: html

   <div class="navheader">

31.10.?Common Address Redundancy Protocol (CARP)
`Prev <network-ipv6.html>`__?
Chapter?31.?Advanced Networking
?\ `Next <appendices.html>`__

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

31.10.?Common Address Redundancy Protocol (CARP)
------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Updated by Allan Jude.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Common Address Redundancy Protocol (CARP) allows multiple hosts to
share the same IP address and Virtual Host ID (VHID) in order to provide
*high availability* for one or more services. This means that one or
more hosts can fail, and the other hosts will transparently take over so
that users do not see a service failure.

In addition to the shared IP address, each host has its own IP address
for management and configuration. All of the machines that share an IP
address have the same VHID. The VHID for each virtual IP address must be
unique across the broadcast domain of the network interface.

High availability using CARP is built into FreeBSD, though the steps to
configure it vary slightly depending upon the FreeBSD version. This
section provides the same example configuration for versions before and
equal to or after FreeBSD?10.

This example configures failover support with three hosts, all with
unique IP addresses, but providing the same web content. It has two
different masters named ``hosta.example.org`` and ``hostb.example.org``,
with a shared backup named ``hostc.example.org``.

These machines are load balanced with a Round Robin DNS configuration.
The master and backup machines are configured identically except for
their hostnames and management IP addresses. These servers must have the
same configuration and run the same services. When the failover occurs,
requests to the service on the shared IP address can only be answered
correctly if the backup server has access to the same content. The
backup machine has two additional CARP interfaces, one for each of the
master content server's IP addresses. When a failure occurs, the backup
server will pick up the failed master machine's IP address.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.10.1.?Using CARP on FreeBSD?10 and Later
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Enable boot-time support for CARP by adding an entry for the ``carp.ko``
kernel module in ``/boot/loader.conf``:

.. code:: programlisting

    carp_load="YES"

To load the module now without rebooting:

.. code:: screen

    # kldload carp

For users who prefer to use a custom kernel, include the following line
in the custom kernel configuration file and compile the kernel as
described in `Chapter?9, *Configuring the FreeBSD
Kernel* <kernelconfig.html>`__:

.. code:: programlisting

    device carp

The hostname, management IP address and subnet mask, shared IP address,
and VHID are all set by adding entries to ``/etc/rc.conf``. This example
is for ``hosta.example.org``:

.. code:: programlisting

    hostname="hosta.example.org"
    ifconfig_em0="inet 192.168.1.3 netmask 255.255.255.0"
    ifconfig_em0_alias0="vhid 1 pass testpass alias 192.168.1.50/32"

The next set of entries are for ``hostb.example.org``. Since it
represents a second master, it uses a different shared IP address and
VHID. However, the passwords specified with ``pass`` must be identical
as CARP will only listen to and accept advertisements from machines with
the correct password.

.. code:: programlisting

    hostname="hostb.example.org"
    ifconfig_em0="inet 192.168.1.4 netmask 255.255.255.0"
    ifconfig_em0_alias0="vhid 2 pass testpass alias 192.168.1.51/32"

The third machine, ``hostc.example.org``, is configured to handle
failover from either master. This machine is configured with two CARP
VHIDs, one to handle the virtual IP address for each of the master
hosts. The CARP advertising skew, ``advskew``, is set to ensure that the
backup host advertises later than the master, since ``advskew`` controls
the order of precedence when there are multiple backup servers.

.. code:: programlisting

    hostname="hostc.example.org"
    ifconfig_em0="inet 192.168.1.5 netmask 255.255.255.0"
    ifconfig_em0_alias0="vhid 1 advskew 100 pass testpass alias 192.168.1.50/32"
    ifconfig_em0_alias1="vhid 2 advskew 100 pass testpass alias 192.168.1.51/32"

Having two CARP VHIDs configured means that ``hostc.example.org`` will
notice if either of the master servers becomes unavailable. If a master
fails to advertise before the backup server, the backup server will pick
up the shared IP address until the master becomes available again.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Preemption is disabled by default. If preemption has been enabled,
``hostc.example.org`` might not release the virtual IP address back to
the original master server. The administrator can force the backup
server to return the IP address to the master with the command:

.. code:: screen

    # ifconfig em0 vhid 1 state backup

.. raw:: html

   </div>

Once the configuration is complete, either restart networking or reboot
each system. High availability is now enabled.

CARP functionality can be controlled via several
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variables documented in the
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4>`__
manual pages. Other actions can be triggered from CARP events by using
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__.

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

31.10.2.?Using CARP on FreeBSD?9 and Earlier
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The configuration for these versions of FreeBSD is similar to the one
described in the previous section, except that a CARP device must first
be created and referred to in the configuration.

Enable boot-time support for CARP by loading the ``if_carp.ko`` kernel
module in ``/boot/loader.conf``:

.. code:: programlisting

    if_carp_load="YES"

To load the module now without rebooting:

.. code:: screen

    # kldload carp

For users who prefer to use a custom kernel, include the following line
in the custom kernel configuration file and compile the kernel as
described in `Chapter?9, *Configuring the FreeBSD
Kernel* <kernelconfig.html>`__:

.. code:: programlisting

    device carp

Next, on each host, create a CARP device:

.. code:: screen

    # ifconfig carp0 create

Set the hostname, management IP address, the shared IP address, and VHID
by adding the required lines to ``/etc/rc.conf``. Since a virtual CARP
device is used instead of an alias, the actual subnet mask of ``/24`` is
used instead of ``/32``. Here are the entries for ``hosta.example.org``:

.. code:: programlisting

    hostname="hosta.example.org"
    ifconfig_fxp0="inet 192.168.1.3 netmask 255.255.255.0"
    cloned_interfaces="carp0"
    ifconfig_carp0="vhid 1 pass testpass 192.168.1.50/24"

On ``hostb.example.org``:

.. code:: programlisting

    hostname="hostb.example.org"
    ifconfig_fxp0="inet 192.168.1.4 netmask 255.255.255.0"
    cloned_interfaces="carp0"
    ifconfig_carp0="vhid 2 pass testpass 192.168.1.51/24"

The third machine, ``hostc.example.org``, is configured to handle
failover from either of the master hosts:

.. code:: programlisting

    hostname="hostc.example.org"
    ifconfig_fxp0="inet 192.168.1.5 netmask 255.255.255.0"
    cloned_interfaces="carp0 carp1"
    ifconfig_carp0="vhid 1 advskew 100 pass testpass 192.168.1.50/24"
    ifconfig_carp1="vhid 2 advskew 100 pass testpass 192.168.1.51/24"

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Preemption is disabled in the GENERIC FreeBSD kernel. If preemption has
been enabled with a custom kernel, ``hostc.example.org`` may not release
the IP address back to the original content server. The administrator
can force the backup server to return the IP address to the master with
the command:

.. code:: screen

    # ifconfig carp0 down && ifconfig carp0 up

This should be done on the ``carp`` interface which corresponds to the
correct host.

.. raw:: html

   </div>

Once the configuration is complete, either restart networking or reboot
each system. High availability is now enabled.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------------------+---------------------------------+
| `Prev <network-ipv6.html>`__?   | `Up <advanced-networking.html>`__   | ?\ `Next <appendices.html>`__   |
+---------------------------------+-------------------------------------+---------------------------------+
| 31.9.?IPv6?                     | `Home <index.html>`__               | ?Part?V.?Appendices             |
+---------------------------------+-------------------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
