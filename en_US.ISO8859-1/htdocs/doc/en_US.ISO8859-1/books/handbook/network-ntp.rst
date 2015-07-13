=====================================
29.11.?Clock Synchronization with NTP
=====================================

.. raw:: html

   <div class="navheader">

29.11.?Clock Synchronization with NTP
`Prev <network-samba.html>`__?
Chapter?29.?Network Servers
?\ `Next <network-iscsi.html>`__

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

29.11.?Clock Synchronization with NTP
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Over time, a computer's clock is prone to drift. This is problematic as
many network services require the computers on a network to share the
same accurate time. Accurate time is also needed to ensure that file
timestamps stay consistent. The Network Time Protocol (NTP) is one way
to provide clock accuracy in a network.

FreeBSD includes
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
which can be configured to query other NTP servers in order to
synchronize the clock on that machine or to provide time services to
other computers in the network. The servers which are queried can be
local to the network or provided by an ISP. In addition, an `online list
of publicly accessible NTP
servers <http://support.ntp.org/bin/view/Servers/WebHome>`__ is
available. When choosing a public NTP server, select one that is
geographically close and review its usage policy.

Choosing several NTP servers is recommended in case one of the servers
becomes unreachable or its clock proves unreliable. As ntpd receives
responses, it favors reliable servers over the less reliable ones.

This section describes how to configure ntpd on FreeBSD. Further
documentation can be found in ``/usr/share/doc/ntp/`` in HTML format.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.11.1.?NTP Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

On FreeBSD, the built-in ntpd can be used to synchronize a system's
clock. To enable ntpd at boot time, add ``ntpd_enable="YES"`` to
``/etc/rc.conf``. Additional variables can be specified in
``/etc/rc.conf``. Refer to
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
and
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
for details.

This application reads ``/etc/ntp.conf`` to determine which NTP servers
to query. Here is a simple example of an ``/etc/ntp.conf``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?29.4.? Sample ``/etc/ntp.conf``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    server ntplocal.example.com prefer
    server timeserver.example.org
    server ntp2a.example.net

    driftfile /var/db/ntp.drift

.. raw:: html

   </div>

.. raw:: html

   </div>

The format of this file is described in
`ntp.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ntp.conf&sektion=5>`__.
The ``server`` option specifies which servers to query, with one server
listed on each line. If a server entry includes ``prefer``, that server
is preferred over other servers. A response from a preferred server will
be discarded if it differs significantly from other servers' responses;
otherwise it will be used. The ``prefer`` argument should only be used
for NTP servers that are known to be highly accurate, such as those with
special time monitoring hardware.

The ``driftfile`` entry specifies which file is used to store the system
clock's frequency offset. ntpd uses this to automatically compensate for
the clock's natural drift, allowing it to maintain a reasonably correct
setting even if it is cut off from all external time sources for a
period of time. This file also stores information about previous
responses from NTP servers. Since this file contains internal
information for NTP, it should not be modified.

By default, an NTP server is accessible to any network host. The
``restrict`` option in ``/etc/ntp.conf`` can be used to control which
systems can access the server. For example, to deny all machines from
accessing the NTP server, add the following line to ``/etc/ntp.conf``:

.. code:: programlisting

    restrict default ignore

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This will also prevent access from other NTP servers. If there is a need
to synchronize with an external NTP server, allow only that specific
server. Refer to
`ntp.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ntp.conf&sektion=5>`__
for more information.

.. raw:: html

   </div>

To allow machines within the network to synchronize their clocks with
the server, but ensure they are not allowed to configure the server or
be used as peers to synchronize against, instead use:

.. code:: programlisting

    restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap

where ``192.168.1.0`` is the local network address and ``255.255.255.0``
is the network's subnet mask.

Multiple ``restrict`` entries are supported. For more details, refer to
the ``Access       Control Support`` subsection of
`ntp.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ntp.conf&sektion=5>`__.

Once ``ntpd_enable="YES"`` has been added to ``/etc/rc.conf``, ntpd can
be started now without rebooting the system by typing:

.. code:: screen

    # service ntpd start

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

29.11.2.?Using NTP with a PPP Connection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ntpd does not need a permanent connection to the Internet to function
properly. However, if a PPP connection is configured to dial out on
demand, NTP traffic should be prevented from triggering a dial out or
keeping the connection alive. This can be configured with ``filter``
directives in ``/etc/ppp/ppp.conf``. For example:

.. code:: programlisting

     set filter dial 0 deny udp src eq 123
     # Prevent NTP traffic from initiating dial out
     set filter dial 1 permit 0 0
     set filter alive 0 deny udp src eq 123
     # Prevent incoming NTP traffic from keeping the connection open
     set filter alive 1 deny udp dst eq 123
     # Prevent outgoing NTP traffic from keeping the connection open
     set filter alive 2 permit 0/0 0/0

For more details, refer to the ``PACKET FILTERING`` section in
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__ and
the examples in ``/usr/share/examples/ppp/``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Some Internet access providers block low-numbered ports, preventing NTP
from functioning since replies never reach the machine.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------------------+---------------------------------+----------------------------------------------------+
| `Prev <network-samba.html>`__?                                            | `Up <network-servers.html>`__   | ?\ `Next <network-iscsi.html>`__                   |
+---------------------------------------------------------------------------+---------------------------------+----------------------------------------------------+
| 29.10.?File and Print Services for Microsoft??Windows? Clients (Samba)?   | `Home <index.html>`__           | ?29.12.?iSCSI Initiator and Target Configuration   |
+---------------------------------------------------------------------------+---------------------------------+----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
