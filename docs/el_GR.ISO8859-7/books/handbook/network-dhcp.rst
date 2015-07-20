============================================
29.5. Automatic Network Configuration (DHCP)
============================================

.. raw:: html

   <div class="navheader">

29.5. Automatic Network Configuration (DHCP)
`????? <network-nis.html>`__?
???????? 29. ???????????? ???????
?\ `??????? <network-dns.html>`__

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

29.5. Automatic Network Configuration (DHCP)
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Greg Sutter.

.. raw:: html

   </div>

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

29.5.1. What Is DHCP?
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DHCP, the Dynamic Host Configuration Protocol, describes the means by
which a system can connect to a network and obtain the necessary
information for communication upon that network. FreeBSD versions prior
to 6.0 use the ISC (Internet Software Consortium) DHCP client
(`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__)
implementation. Later versions use the OpenBSD ``dhclient`` taken from
OpenBSD?3.7. All information here regarding ``dhclient`` is for use with
either of the ISC or OpenBSD DHCP clients. The DHCP server is the one
included in the ISC distribution.

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

29.5.2. What This Section Covers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes both the client-side components of the ISC and
OpenBSD DHCP client and server-side components of the ISC DHCP system.
The client-side program, ``dhclient``, comes integrated within FreeBSD,
and the server-side portion is available from the
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__
port. The
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__,
`dhcp-options(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcp-options&sektion=5>`__,
and
`dhclient.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.conf&sektion=5>`__
manual pages, in addition to the references below, are useful resources.

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

29.5.3. How It Works
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When ``dhclient``, the DHCP client, is executed on the client machine,
it begins broadcasting requests for configuration information. By
default, these requests are on UDP port 68. The server replies on UDP
67, giving the client an IP address and other relevant network
information such as netmask, router, and DNS servers. All of this
information comes in the form of a DHCP ?lease? and is only valid for a
certain time (configured by the DHCP server maintainer). In this manner,
stale IP addresses for clients no longer connected to the network can be
automatically reclaimed.

DHCP clients can obtain a great deal of information from the server. An
exhaustive list may be found in
`dhcp-options(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcp-options&sektion=5>`__.

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

29.5.4. FreeBSD Integration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD fully integrates the ISC or OpenBSD DHCP client, ``dhclient``
(according to the FreeBSD version you run). DHCP client support is
provided within both the installer and the base system, obviating the
need for detailed knowledge of network configurations on any network
that runs a DHCP server. ``dhclient`` has been included in all FreeBSD
distributions since 3.2.

DHCP is supported by sysinstall. When configuring a network interface
within sysinstall, the second question asked is: ?Do you want to try
DHCP configuration of the interface??. Answering affirmatively will
execute ``dhclient``, and if successful, will fill in the network
configuration information automatically.

There are two things you must do to have your system use DHCP upon
startup:

.. raw:: html

   <div class="itemizedlist">

-  Make sure that the ``bpf`` device is compiled into your kernel. To do
   this, add ``device bpf`` to your kernel configuration file, and
   rebuild the kernel. For more information about building kernels, see
   `?????????9, *??????????? ??? ?????? ???
   FreeBSD* <kernelconfig.html>`__.

   The ``bpf`` device is already part of the ``GENERIC`` kernel that is
   supplied with FreeBSD, so if you do not have a custom kernel, you
   should not need to create one in order to get DHCP working.

   .. raw:: html

      <div class="note" xmlns="">

   ????????:
   ~~~~~~~~~

   For those who are particularly security conscious, you should be
   warned that ``bpf`` is also the device that allows packet sniffers to
   work correctly (although they still have to be run as ``root``).
   ``bpf`` *is* required to use DHCP, but if you are very sensitive
   about security, you probably should not add ``bpf`` to your kernel in
   the expectation that at some point in the future you will be using
   DHCP.

   .. raw:: html

      </div>

-  Edit your ``/etc/rc.conf`` to include the following:

   .. code:: programlisting

       ifconfig_fxp0="DHCP"

   .. raw:: html

      <div class="note" xmlns="">

   ????????:
   ~~~~~~~~~

   Be sure to replace ``fxp0`` with the designation for the interface
   that you wish to dynamically configure, as described in `??????12.8,
   ???????????? ??? ?????? ???????? <config-network-setup.html>`__.

   .. raw:: html

      </div>

   If you are using a different location for ``dhclient``, or if you
   wish to pass additional flags to ``dhclient``, also include the
   following (editing as necessary):

   .. code:: programlisting

       dhcp_program="/sbin/dhclient"
       dhcp_flags=""

.. raw:: html

   </div>

The DHCP server, dhcpd, is included as part of the
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__
port in the ports collection. This port contains the ISC DHCP server and
documentation.

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

29.5.5. Files
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``/etc/dhclient.conf``

   ``dhclient`` requires a configuration file, ``/etc/dhclient.conf``.
   Typically the file contains only comments, the defaults being
   reasonably sane. This configuration file is described by the
   `dhclient.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.conf&sektion=5>`__
   manual page.

-  ``/sbin/dhclient``

   ``dhclient`` is statically linked and resides in ``/sbin``. The
   `dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
   manual page gives more information about ``dhclient``.

-  ``/sbin/dhclient-script``

   ``dhclient-script`` is the FreeBSD-specific DHCP client configuration
   script. It is described in
   `dhclient-script(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient-script&sektion=8>`__,
   but should not need any user modification to function properly.

-  ``/var/db/dhclient.leases``

   The DHCP client keeps a database of valid leases in this file, which
   is written as a log.
   `dhclient.leases(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.leases&sektion=5>`__
   gives a slightly longer description.

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

29.5.6. Further Reading
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The DHCP protocol is fully described in `RFC
2131 <http://www.freesoft.org/CIE/RFC/2131/>`__. An informational
resource has also been set up at ``http://www.dhcp.org/``.

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

29.5.7. Installing and Configuring a DHCP Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.5.7.1. What This Section Covers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section provides information on how to configure a FreeBSD system
to act as a DHCP server using the ISC (Internet Software Consortium)
implementation of the DHCP server.

The server is not provided as part of FreeBSD, and so you will need to
install the
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__
port to provide this service. See `?????????5, *??????????? ?????????:
?????? ??? Ports* <ports.html>`__ for more information on using the
Ports Collection.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.5.7.2. DHCP Server Installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to configure your FreeBSD system as a DHCP server, you will
need to ensure that the
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__
device is compiled into your kernel. To do this, add ``device bpf`` to
your kernel configuration file, and rebuild the kernel. For more
information about building kernels, see `?????????9, *??????????? ???
?????? ??? FreeBSD* <kernelconfig.html>`__.

The ``bpf`` device is already part of the ``GENERIC`` kernel that is
supplied with FreeBSD, so you do not need to create a custom kernel in
order to get DHCP working.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Those who are particularly security conscious should note that ``bpf``
is also the device that allows packet sniffers to work correctly
(although such programs still need privileged access). ``bpf`` *is*
required to use DHCP, but if you are very sensitive about security, you
probably should not include ``bpf`` in your kernel purely because you
expect to use DHCP at some point in the future.

.. raw:: html

   </div>

The next thing that you will need to do is edit the sample
``dhcpd.conf`` which was installed by the
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__
port. By default, this will be ``/usr/local/etc/dhcpd.conf.sample``, and
you should copy this to ``/usr/local/etc/dhcpd.conf`` before proceeding
to make changes.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.5.7.3. Configuring the DHCP Server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``dhcpd.conf`` is comprised of declarations regarding subnets and hosts,
and is perhaps most easily explained using an example :

.. code:: programlisting

    option domain-name "example.com";
    option domain-name-servers 192.168.4.100;
    option subnet-mask 255.255.255.0;

    default-lease-time 3600;
    max-lease-time 86400;
    ddns-update-style none;

    subnet 192.168.4.0 netmask 255.255.255.0 {
      range 192.168.4.129 192.168.4.254;
      option routers 192.168.4.1;
    }

    host mailhost {
      hardware ethernet 02:03:04:05:06:07;
      fixed-address mailhost.example.com;
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#domain-name>`__               | This option specifies the domain     |
|                                      | that will be provided to clients as  |
|                                      | the default search domain. See       |
|                                      | `resolv.conf(5) <http://www.FreeBSD. |
|                                      | org/cgi/man.cgi?query=resolv.conf&se |
|                                      | ktion=5>`__                          |
|                                      | for more information on what this    |
|                                      | means.                               |
+--------------------------------------+--------------------------------------+
| `|2| <#domain-name-servers>`__       | This option specifies a comma        |
|                                      | separated list of DNS servers that   |
|                                      | the client should use.               |
+--------------------------------------+--------------------------------------+
| `|3| <#subnet-mask>`__               | The netmask that will be provided to |
|                                      | clients.                             |
+--------------------------------------+--------------------------------------+
| `|4| <#default-lease-time>`__        | A client may request a specific      |
|                                      | length of time that a lease will be  |
|                                      | valid. Otherwise the server will     |
|                                      | assign a lease with this expiry      |
|                                      | value (in seconds).                  |
+--------------------------------------+--------------------------------------+
| `|5| <#max-lease-time>`__            | This is the maximum length of time   |
|                                      | that the server will lease for.      |
|                                      | Should a client request a longer     |
|                                      | lease, a lease will be issued,       |
|                                      | although it will only be valid for   |
|                                      | ``max-lease-time`` seconds.          |
+--------------------------------------+--------------------------------------+
| `|6| <#ddns-update-style>`__         | This option specifies whether the    |
|                                      | DHCP server should attempt to update |
|                                      | DNS when a lease is accepted or      |
|                                      | released. In the ISC implementation, |
|                                      | this option is *required*.           |
+--------------------------------------+--------------------------------------+
| `|7| <#range>`__                     | This denotes which IP addresses      |
|                                      | should be used in the pool reserved  |
|                                      | for allocating to clients. IP        |
|                                      | addresses between, and including,    |
|                                      | the ones stated are handed out to    |
|                                      | clients.                             |
+--------------------------------------+--------------------------------------+
| `|8| <#routers>`__                   | Declares the default gateway that    |
|                                      | will be provided to clients.         |
+--------------------------------------+--------------------------------------+
| `|9| <#hardware>`__                  | The hardware MAC address of a host   |
|                                      | (so that the DHCP server can         |
|                                      | recognize a host when it makes a     |
|                                      | request).                            |
+--------------------------------------+--------------------------------------+
| `|10| <#fixed-address>`__            | Specifies that the host should       |
|                                      | always be given the same IP address. |
|                                      | Note that using a hostname is        |
|                                      | correct here, since the DHCP server  |
|                                      | will resolve the hostname itself     |
|                                      | before returning the lease           |
|                                      | information.                         |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Once you have finished writing your ``dhcpd.conf``, you should enable
the DHCP server in ``/etc/rc.conf``, i.e. by adding:

.. code:: programlisting

    dhcpd_enable="YES"
    dhcpd_ifaces="dc0"

Replace the ``dc0`` interface name with the interface (or interfaces,
separated by whitespace) that your DHCP server should listen on for DHCP
client requests.

Then, you can proceed to start the server by issuing the following
command:

.. code:: screen

    # /usr/local/etc/rc.d/isc-dhcpd.sh start

Should you need to make changes to the configuration of your server in
the future, it is important to note that sending a ``SIGHUP`` signal to
dhcpd does *not* result in the configuration being reloaded, as it does
with most daemons. You will need to send a ``SIGTERM`` signal to stop
the process, and then restart it using the command above.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.5.7.4. Files
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``/usr/local/sbin/dhcpd``

   dhcpd is statically linked and resides in ``/usr/local/sbin``. The
   `dhcpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpd&sektion=8>`__
   manual page installed with the port gives more information about
   dhcpd.

-  ``/usr/local/etc/dhcpd.conf``

   dhcpd requires a configuration file, ``/usr/local/etc/dhcpd.conf``
   before it will start providing service to clients. This file needs to
   contain all the information that should be provided to clients that
   are being serviced, along with information regarding the operation of
   the server. This configuration file is described by the
   `dhcpd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpd.conf&sektion=5>`__
   manual page installed by the port.

-  ``/var/db/dhcpd.leases``

   The DHCP server keeps a database of leases it has issued in this
   file, which is written as a log. The manual page
   `dhcpd.leases(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpd.leases&sektion=5>`__,
   installed by the port gives a slightly longer description.

-  ``/usr/local/sbin/dhcrelay``

   dhcrelay is used in advanced environments where one DHCP server
   forwards a request from a client to another DHCP server on a separate
   network. If you require this functionality, then install the
   `net/isc-dhcp3-relay <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-relay/pkg-descr>`__
   port. The
   `dhcrelay(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcrelay&sektion=8>`__
   manual page provided with the port contains more detail.

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

+----------------------------------------------+-----------------------------------+-------------------------------------+
| `????? <network-nis.html>`__?                | `???? <network-servers.html>`__   | ?\ `??????? <network-dns.html>`__   |
+----------------------------------------------+-----------------------------------+-------------------------------------+
| 29.4. Network Information System (NIS/YP)?   | `???? <index.html>`__             | ?29.6. Domain Name System (DNS)     |
+----------------------------------------------+-----------------------------------+-------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

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
