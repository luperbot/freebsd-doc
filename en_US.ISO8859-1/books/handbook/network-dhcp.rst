================================================
29.6.?Dynamic Host Configuration Protocol (DHCP)
================================================

.. raw:: html

   <div class="navheader">

29.6.?Dynamic Host Configuration Protocol (DHCP)
`Prev <network-ldap.html>`__?
Chapter?29.?Network Servers
?\ `Next <network-dns.html>`__

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

29.6.?Dynamic Host Configuration Protocol (DHCP)
------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Dynamic Host Configuration Protocol (DHCP) allows a system to
connect to a network in order to be assigned the necessary addressing
information for communication on that network. FreeBSD includes the
OpenBSD version of ``dhclient`` which is used by the client to obtain
the addressing information. FreeBSD does not install a DHCP server, but
several servers are available in the FreeBSD Ports Collection. The DHCP
protocol is fully described in `RFC
2131 <http://www.freesoft.org/CIE/RFC/2131/>`__. Informational resources
are also available at
`isc.org/downloads/dhcp/ <http://www.isc.org/downloads/dhcp/>`__.

This section describes how to use the built-in DHCP client. It then
describes how to install and configure a DHCP server.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In FreeBSD, the
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__
device is needed by both the DHCP server and DHCP client. This device is
included in the ``GENERIC`` kernel that is installed with FreeBSD. Users
who prefer to create a custom kernel need to keep this device if DHCP is
used.

It should be noted that ``bpf`` also allows privileged users to run
network packet sniffers on that system.

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

29.6.1.?Configuring a DHCP Client
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DHCP client support is included in the FreeBSD installer, making it easy
to configure a newly installed system to automatically receive its
networking addressing information from an existing DHCP server. Refer to
`Section?2.8, “Post-Installation” <bsdinstall-post.html>`__ for examples
of network configuration.

When ``dhclient`` is executed on the client machine, it begins
broadcasting requests for configuration information. By default, these
requests use UDP port 68. The server replies on UDP port 67, giving the
client an IP address and other relevant network information such as a
subnet mask, default gateway, and DNS server addresses. This information
is in the form of a DHCP “lease” and is valid for a configurable time.
This allows stale IP addresses for clients no longer connected to the
network to automatically be reused. DHCP clients can obtain a great deal
of information from the server. An exhaustive list may be found in
`dhcp-options(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcp-options&sektion=5>`__.

By default, when a FreeBSD system boots, its DHCP client runs in the
background, or *asynchronously*. Other startup scripts continue to run
while the DHCP process completes, which speeds up system startup.

Background DHCP works well when the DHCP server responds quickly to the
client's requests. However, DHCP may take a long time to complete on
some systems. If network services attempt to run before DHCP has
assigned the network addressing information, they will fail. Using DHCP
in *synchronous* mode prevents this problem as it pauses startup until
the DHCP configuration has completed.

This line in ``/etc/rc.conf`` is used to configure background or
asynchronous mode:

.. code:: programlisting

    ifconfig_fxp0="DHCP"

This line may already exist if the system was configured to use DHCP
during installation. Replace the *``fxp0``* shown in these examples with
the name of the interface to be dynamically configured, as described in
`Section?12.5, “Setting Up Network Interface
Cards” <config-network-setup.html>`__.

To instead configure the system to use synchronous mode, and to pause
during startup while DHCP completes, use “``SYNCDHCP``”:

.. code:: programlisting

    ifconfig_fxp0="SYNCDHCP"

Additional client options are available. Search for ``dhclient`` in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
for details.

The DHCP client uses the following files:

.. raw:: html

   <div class="itemizedlist">

-  ``/etc/dhclient.conf``

   The configuration file used by ``dhclient``. Typically, this file
   contains only comments as the defaults are suitable for most clients.
   This configuration file is described in
   `dhclient.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.conf&sektion=5>`__.

-  ``/sbin/dhclient``

   More information about the command itself can be found in
   `dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__.

-  ``/sbin/dhclient-script``

   The FreeBSD-specific DHCP client configuration script. It is
   described in
   `dhclient-script(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient-script&sektion=8>`__,
   but should not need any user modification to function properly.

-  ``/var/db/dhclient.leases.interface``

   The DHCP client keeps a database of valid leases in this file, which
   is written as a log and is described in
   `dhclient.leases(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.leases&sektion=5>`__.

.. raw:: html

   </div>

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

29.6.2.?Installing and Configuring a DHCP Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section demonstrates how to configure a FreeBSD system to act as a
DHCP server using the Internet Systems Consortium (ISC) implementation
of the DHCP server. This implementation and its documentation can be
installed using the
`net/isc-dhcp42-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-server/pkg-descr>`__
package or port.

The installation of
`net/isc-dhcp42-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-server/pkg-descr>`__
installs a sample configuration file. Copy
``/usr/local/etc/dhcpd.conf.example`` to ``/usr/local/etc/dhcpd.conf``
and make any edits to this new file.

The configuration file is comprised of declarations for subnets and
hosts which define the information that is provided to DHCP clients. For
example, these lines configure the following:

.. code:: programlisting

    option domain-name "example.org";
    option domain-name-servers ns1.example.org;
    option subnet-mask 255.255.255.0;

    default-lease-time 600;
    max-lease-time 72400;
    ddns-update-style none;

    subnet 10.254.239.0 netmask 255.255.255.224 {
      range 10.254.239.10 10.254.239.20;
      option routers rtr-239-0-1.example.org, rtr-239-0-2.example.org;
    }

    host fantasia {
      hardware ethernet 08:00:07:26:c0:a5;
      fixed-address fantasia.fugue.com;
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#domain-name>`__               | This option specifies the default    |
|                                      | search domain that will be provided  |
|                                      | to clients. Refer to                 |
|                                      | `resolv.conf(5) <http://www.FreeBSD. |
|                                      | org/cgi/man.cgi?query=resolv.conf&se |
|                                      | ktion=5>`__                          |
|                                      | for more information.                |
+--------------------------------------+--------------------------------------+
| `|2| <#domain-name-servers>`__       | This option specifies a comma        |
|                                      | separated list of DNS servers that   |
|                                      | the client should use. They can be   |
|                                      | listed by their Fully Qualified      |
|                                      | Domain Names (FQDN), as seen in the  |
|                                      | example, or by their IP addresses.   |
+--------------------------------------+--------------------------------------+
| `|3| <#subnet-mask>`__               | The subnet mask that will be         |
|                                      | provided to clients.                 |
+--------------------------------------+--------------------------------------+
| `|4| <#default-lease-time>`__        | The default lease expiry time in     |
|                                      | seconds. A client can be configured  |
|                                      | to override this value.              |
+--------------------------------------+--------------------------------------+
| `|5| <#max-lease-time>`__            | The maximum allowed length of time,  |
|                                      | in seconds, for a lease. Should a    |
|                                      | client request a longer lease, a     |
|                                      | lease will still be issued, but it   |
|                                      | will only be valid for               |
|                                      | ``max-lease-time``.                  |
+--------------------------------------+--------------------------------------+
| `|6| <#ddns-update-style>`__         | The default of ``none`` disables     |
|                                      | dynamic DNS updates. Changing this   |
|                                      | to ``interim`` configures the DHCP   |
|                                      | server to update a DNS server        |
|                                      | whenever it hands out a lease so     |
|                                      | that the DNS server knows which IP   |
|                                      | addresses are associated with which  |
|                                      | computers in the network. Do not     |
|                                      | change the default setting unless    |
|                                      | the DNS server has been configured   |
|                                      | to support dynamic DNS.              |
+--------------------------------------+--------------------------------------+
| `|7| <#range>`__                     | This line creates a pool of          |
|                                      | available IP addresses which are     |
|                                      | reserved for allocation to DHCP      |
|                                      | clients. The range of addresses must |
|                                      | be valid for the network or subnet   |
|                                      | specified in the previous line.      |
+--------------------------------------+--------------------------------------+
| `|8| <#routers>`__                   | Declares the default gateway that is |
|                                      | valid for the network or subnet      |
|                                      | specified before the opening ``{``   |
|                                      | bracket.                             |
+--------------------------------------+--------------------------------------+
| `|9| <#hardware>`__                  | Specifies the hardware MAC address   |
|                                      | of a client so that the DHCP server  |
|                                      | can recognize the client when it     |
|                                      | makes a request.                     |
+--------------------------------------+--------------------------------------+
| `|10| <#fixed-address>`__            | Specifies that this host should      |
|                                      | always be given the same IP address. |
|                                      | Using the hostname is correct, since |
|                                      | the DHCP server will resolve the     |
|                                      | hostname before returning the lease  |
|                                      | information.                         |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

This configuration file supports many more options. Refer to
dhcpd.conf(5), installed with the server, for details and examples.

Once the configuration of ``dhcpd.conf`` is complete, enable the DHCP
server in ``/etc/rc.conf``:

.. code:: programlisting

    dhcpd_enable="YES"
    dhcpd_ifaces="dc0"

Replace the ``dc0`` with the interface (or interfaces, separated by
whitespace) that the DHCP server should listen on for DHCP client
requests.

Start the server by issuing the following command:

.. code:: screen

    # service isc-dhcpd start

Any future changes to the configuration of the server will require the
dhcpd service to be stopped and then started using
`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8>`__.

The DHCP server uses the following files. Note that the manual pages are
installed with the server software.

.. raw:: html

   <div class="itemizedlist">

-  ``/usr/local/sbin/dhcpd``

   More information about the dhcpd server can be found in dhcpd(8).

-  ``/usr/local/etc/dhcpd.conf``

   The server configuration file needs to contain all the information
   that should be provided to clients, along with information regarding
   the operation of the server. This configuration file is described in
   dhcpd.conf(5).

-  ``/var/db/dhcpd.leases``

   The DHCP server keeps a database of leases it has issued in this
   file, which is written as a log. Refer to dhcpd.leases(5), which
   gives a slightly longer description.

-  ``/usr/local/sbin/dhcrelay``

   This daemon is used in advanced environments where one DHCP server
   forwards a request from a client to another DHCP server on a separate
   network. If this functionality is required, install the
   `net/isc-dhcp42-relay <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-relay/pkg-descr>`__
   package or port. The installation includes dhcrelay(8) which provides
   more detail.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------+---------------------------------+-----------------------------------+
| `Prev <network-ldap.html>`__?                         | `Up <network-servers.html>`__   | ?\ `Next <network-dns.html>`__    |
+-------------------------------------------------------+---------------------------------+-----------------------------------+
| 29.5.?Lightweight Directory Access Protocol (LDAP)?   | `Home <index.html>`__           | ?29.7.?Domain Name System (DNS)   |
+-------------------------------------------------------+---------------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |9| image:: ./imagelib/callouts/9.png
.. |10| image:: ./imagelib/callouts/10.png
