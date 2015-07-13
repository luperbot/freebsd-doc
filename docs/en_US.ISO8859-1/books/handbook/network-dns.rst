==============================
29.7.?Domain Name System (DNS)
==============================

.. raw:: html

   <div class="navheader">

29.7.?Domain Name System (DNS)
`Prev <network-dhcp.html>`__?
Chapter?29.?Network Servers
?\ `Next <network-apache.html>`__

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

29.7.?Domain Name System (DNS)
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Domain Name System (DNS) is the protocol through which domain names are
mapped to IP addresses, and vice versa. DNS is coordinated across the
Internet through a somewhat complex system of authoritative root, Top
Level Domain (TLD), and other smaller-scale name servers, which host and
cache individual domain information. It is not necessary to run a name
server to perform DNS lookups on a system.

In FreeBSD 10, the Berkeley Internet Name Domain (BIND) has been removed
from the base system and replaced with Unbound. Unbound as configured in
the FreeBSD Base is a local caching resolver. BIND is still available
from The Ports Collection as
`dns/bind99 <http://www.freebsd.org/cgi/url.cgi?ports/dns/bind99/pkg-descr>`__
or
`dns/bind98 <http://www.freebsd.org/cgi/url.cgi?ports/dns/bind98/pkg-descr>`__.
In FreeBSD 9 and lower, BIND is included in FreeBSD Base. The FreeBSD
version provides enhanced security features, a new file system layout,
and automated
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
configuration. BIND is maintained by the `Internet Systems
Consortium <https://www.isc.org/>`__.

The following table describes some of the terms associated with DNS:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?29.4.?DNS Terminology

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Term          | Definition                                                                                                                                                   |
+===============+==============================================================================================================================================================+
| Forward DNS   | Mapping of hostnames to IP addresses.                                                                                                                        |
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Origin        | Refers to the domain covered in a particular zone file.                                                                                                      |
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| named, BIND   | Common names for the BIND name server package within FreeBSD.                                                                                                |
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Resolver      | A system process through which a machine queries a name server for zone information.                                                                         |
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Reverse DNS   | Mapping of IP addresses to hostnames.                                                                                                                        |
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Root zone     | The beginning of the Internet zone hierarchy. All zones fall under the root zone, similar to how all files in a file system fall under the root directory.   |
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Zone          | An individual domain, subdomain, or portion of the DNS administered by the same authority.                                                                   |
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Examples of zones:

.. raw:: html

   <div class="itemizedlist">

-  ``.`` is how the root zone is usually referred to in documentation.

-  ``org.`` is a Top Level Domain (TLD) under the root zone.

-  ``example.org.`` is a zone under the ``org.`` TLD.

-  ``1.168.192.in-addr.arpa`` is a zone referencing all IP addresses
   which fall under the ``192.168.1.*`` IP address space.

.. raw:: html

   </div>

As one can see, the more specific part of a hostname appears to its
left. For example, ``example.org.`` is more specific than ``org.``, as
``org.`` is more specific than the root zone. The layout of each part of
a hostname is much like a file system: the ``/dev`` directory falls
within the root, and so on.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.1.?Reasons to Run a Name Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Name servers generally come in two forms: authoritative name servers,
and caching (also known as resolving) name servers.

An authoritative name server is needed when:

.. raw:: html

   <div class="itemizedlist">

-  One wants to serve DNS information to the world, replying
   authoritatively to queries.

-  A domain, such as ``example.org``, is registered and IP addresses
   need to be assigned to hostnames under it.

-  An IP address block requires reverse DNS entries (IP to hostname).

-  A backup or second name server, called a slave, will reply to
   queries.

.. raw:: html

   </div>

A caching name server is needed when:

.. raw:: html

   <div class="itemizedlist">

-  A local DNS server may cache and respond more quickly than querying
   an outside name server.

.. raw:: html

   </div>

When one queries for ``www.FreeBSD.org``, the resolver usually queries
the uplink ISP's name server, and retrieves the reply. With a local,
caching DNS server, the query only has to be made once to the outside
world by the caching DNS server. Additional queries will not have to go
outside the local network, since the information is cached locally.

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

29.7.2.?DNS Server Configuration in FreeBSD 10.0 and Later
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD 10.0, BIND has been replaced with Unbound. Unbound is a
validating caching resolver only. If an authoritative server is needed,
many are available from the Ports Collection.

Unbound is provided in the FreeBSD base system. By default, it will
provide DNS resolution to the local machine only. While the base system
package can be configured to provide resolution services beyond the
local machine, it is recommended that such requirements be addressed by
installing Unbound from the FreeBSD Ports Collection.

To enable Unbound, add the following to ``/etc/rc.conf``:

.. code:: programlisting

    local_unbound_enable="YES"

Any existing nameservers in ``/etc/resolv.conf`` will be configured as
forwarders in the new Unbound configuration.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If any of the listed nameservers do not support DNSSEC, local DNS
resolution will fail. Be sure to test each nameserver and remove any
that fail the test. The following command will show the trust tree or a
failure for a nameserver running on ``192.168.1.1``:

.. raw:: html

   </div>

.. code:: screen

    % drill -S FreeBSD.org @192.168.1.1

Once each nameserver is confirmed to support DNSSEC, start Unbound:

.. code:: screen

    # service local_unbound onestart

This will take care of updating ``/etc/resolv.conf`` so that queries for
DNSSEC secured domains will now work. For example, run the following to
validate the FreeBSD.org DNSSEC trust tree:

.. code:: screen

    % drill -S FreeBSD.org
    ;; Number of trusted keys: 1
    ;; Chasing: freebsd.org. A

    DNSSEC Trust tree:
    freebsd.org. (A)
    |---freebsd.org. (DNSKEY keytag: 36786 alg: 8 flags: 256)
        |---freebsd.org. (DNSKEY keytag: 32659 alg: 8 flags: 257)
        |---freebsd.org. (DS keytag: 32659 digest type: 2)
            |---org. (DNSKEY keytag: 49587 alg: 7 flags: 256)
                |---org. (DNSKEY keytag: 9795 alg: 7 flags: 257)
                |---org. (DNSKEY keytag: 21366 alg: 7 flags: 257)
                |---org. (DS keytag: 21366 digest type: 1)
                |   |---. (DNSKEY keytag: 40926 alg: 8 flags: 256)
                |       |---. (DNSKEY keytag: 19036 alg: 8 flags: 257)
                |---org. (DS keytag: 21366 digest type: 2)
                    |---. (DNSKEY keytag: 40926 alg: 8 flags: 256)
                        |---. (DNSKEY keytag: 19036 alg: 8 flags: 257)
    ;; Chase successful

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

29.7.3.?DNS Server Configuration in FreeBSD 9.\ *``X``* and Earlier
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD, the BIND daemon is called named.

.. raw:: html

   <div class="informaltable">

+---------------------------------------------------------------------------+--------------------------------------------------+
| File                                                                      | Description                                      |
+===========================================================================+==================================================+
| `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__   | The BIND daemon.                                 |
+---------------------------------------------------------------------------+--------------------------------------------------+
| `rndc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rndc&sektion=8>`__     | Name server control utility.                     |
+---------------------------------------------------------------------------+--------------------------------------------------+
| ``/etc/namedb``                                                           | Directory where BIND zone information resides.   |
+---------------------------------------------------------------------------+--------------------------------------------------+
| ``/etc/namedb/named.conf``                                                | Configuration file of the daemon.                |
+---------------------------------------------------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

Depending on how a given zone is configured on the server, the files
related to that zone can be found in the ``master``, ``slave``, or
``dynamic`` subdirectories of the ``/etc/namedb`` directory. These files
contain the DNS information that will be given out by the name server in
response to queries.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.3.1.?Starting BIND
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since BIND is installed by default, configuring it is relatively simple.

The default named configuration is that of a basic resolving name
server, running in a
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
environment, and restricted to listening on the local IPv4 loopback
address (127.0.0.1). To start the server one time with this
configuration, use the following command:

.. code:: screen

    # service named onestart

To ensure the named daemon is started at boot each time, put the
following line into the ``/etc/rc.conf``:

.. code:: programlisting

    named_enable="YES"

There are many configuration options for ``/etc/namedb/named.conf`` that
are beyond the scope of this document. Other startup options for named
on FreeBSD can be found in the ``named_*`` flags in
``/etc/defaults/rc.conf`` and in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.
The `Section?12.4, “Managing Services in
FreeBSD” <configtuning-rcd.html>`__ section is also a good read.

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

29.7.3.2.?Configuration Files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configuration files for named currently reside in ``/etc/namedb``
directory and will need modification before use unless all that is
needed is a simple resolver. This is where most of the configuration
will be performed.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.3.2.1.?\ ``/etc/namedb/named.conf``
''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    // $FreeBSD$
    //
    // Refer to the named.conf(5) and named(8) man pages, and the documentation
    // in /usr/share/doc/bind9 for more details.
    //
    // If you are going to set up an authoritative server, make sure you
    // understand the hairy details of how DNS works.  Even with
    // simple mistakes, you can break connectivity for affected parties,
    // or cause huge amounts of useless Internet traffic.

    options {
        // All file and path names are relative to the chroot directory,
        // if any, and should be fully qualified.
        directory   "/etc/namedb/working";
        pid-file    "/var/run/named/pid";
        dump-file   "/var/dump/named_dump.db";
        statistics-file "/var/stats/named.stats";

    // If named is being used only as a local resolver, this is a safe default.
    // For named to be accessible to the network, comment this option, specify
    // the proper IP address, or delete this option.
        listen-on   { 127.0.0.1; };

    // If you have IPv6 enabled on this system, uncomment this option for
    // use as a local resolver.  To give access to the network, specify
    // an IPv6 address, or the keyword "any".
    //  listen-on-v6    { ::1; };

    // These zones are already covered by the empty zones listed below.
    // If you remove the related empty zones below, comment these lines out.
        disable-empty-zone "255.255.255.255.IN-ADDR.ARPA";
        disable-empty-zone "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.IP6.ARPA";
        disable-empty-zone "1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.IP6.ARPA";

    // If you've got a DNS server around at your upstream provider, enter
    // its IP address here, and enable the line below.  This will make you
    // benefit from its cache, thus reduce overall DNS traffic in the Internet.
    /*
        forwarders {
            127.0.0.1;
        };
    */

    // If the 'forwarders' clause is not empty the default is to 'forward first'
    // which will fall back to sending a query from your local server if the name
    // servers in 'forwarders' do not have the answer.  Alternatively you can
    // force your name server to never initiate queries of its own by enabling the
    // following line:
    //  forward only;

    // If you wish to have forwarding configured automatically based on
    // the entries in /etc/resolv.conf, uncomment the following line and
    // set named_auto_forward=yes in /etc/rc.conf.  You can also enable
    // named_auto_forward_only (the effect of which is described above).
    //  include "/etc/namedb/auto_forward.conf";

Just as the comment says, to benefit from an uplink's cache,
``forwarders`` can be enabled here. Under normal circumstances, a name
server will recursively query the Internet looking at certain name
servers until it finds the answer it is looking for. Having this enabled
will have it query the uplink's name server (or name server provided)
first, taking advantage of its cache. If the uplink name server in
question is a heavily trafficked, fast name server, enabling this may be
worthwhile.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

``127.0.0.1`` will *not* work here. Change this IP address to a name
server at the uplink.

.. raw:: html

   </div>

.. code:: programlisting

       /*
           Modern versions of BIND use a random UDP port for each outgoing
           query by default in order to dramatically reduce the possibility
           of cache poisoning.  All users are strongly encouraged to utilize
           this feature, and to configure their firewalls to accommodate it.

           AS A LAST RESORT in order to get around a restrictive firewall
           policy you can try enabling the option below.  Use of this option
           will significantly reduce your ability to withstand cache poisoning
           attacks, and should be avoided if at all possible.

           Replace NNNNN in the example with a number between 49160 and 65530.
        */
        // query-source address * port NNNNN;
    };

    // If you enable a local name server, don't forget to enter 127.0.0.1
    // first in your /etc/resolv.conf so this server will be queried.
    // Also, make sure to enable it in /etc/rc.conf.

    // The traditional root hints mechanism. Use this, OR the slave zones below.
    zone "." { type hint; file "/etc/namedb/named.root"; };

    /*  Slaving the following zones from the root name servers has some
        significant advantages:
        1. Faster local resolution for your users
        2. No spurious traffic will be sent from your network to the roots
        3. Greater resilience to any potential root server failure/DDoS

        On the other hand, this method requires more monitoring than the
        hints file to be sure that an unexpected failure mode has not
        incapacitated your server.  Name servers that are serving a lot
        of clients will benefit more from this approach than individual
        hosts.  Use with caution.

        To use this mechanism, uncomment the entries below, and comment
        the hint zone above.

        As documented at http://dns.icann.org/services/axfr/ these zones:
        "." (the root), ARPA, IN-ADDR.ARPA, IP6.ARPA, and ROOT-SERVERS.NET
        are available for AXFR from these servers on IPv4 and IPv6:
        xfr.lax.dns.icann.org, xfr.cjr.dns.icann.org
    */
    /*
    zone "." {
        type slave;
        file "/etc/namedb/slave/root.slave";
        masters {
            192.5.5.241;    // F.ROOT-SERVERS.NET.
        };
        notify no;
    };
    zone "arpa" {
        type slave;
        file "/etc/namedb/slave/arpa.slave";
        masters {
            192.5.5.241;    // F.ROOT-SERVERS.NET.
        };
        notify no;
    };
    */

    /*  Serving the following zones locally will prevent any queries
        for these zones leaving your network and going to the root
        name servers.  This has two significant advantages:
        1. Faster local resolution for your users
        2. No spurious traffic will be sent from your network to the roots
    */
    // RFCs 1912 and 5735 (and BCP 32 for localhost)
    zone "localhost"    { type master; file "/etc/namedb/master/localhost-forward.db"; };
    zone "127.in-addr.arpa" { type master; file "/etc/namedb/master/localhost-reverse.db"; };
    zone "255.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // RFC 1912-style zone for IPv6 localhost address
    zone "0.ip6.arpa"   { type master; file "/etc/namedb/master/localhost-reverse.db"; };

    // "This" Network (RFCs 1912 and 5735)
    zone "0.in-addr.arpa"   { type master; file "/etc/namedb/master/empty.db"; };

    // Private Use Networks (RFCs 1918 and 5735)
    zone "10.in-addr.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "16.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "17.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "18.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "19.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "20.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "21.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "22.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "23.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "24.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "25.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "26.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "27.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "28.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "29.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "30.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "31.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "168.192.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // Link-local/APIPA (RFCs 3927 and 5735)
    zone "254.169.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // IETF protocol assignments (RFCs 5735 and 5736)
    zone "0.0.192.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // TEST-NET-[1-3] for Documentation (RFCs 5735 and 5737)
    zone "2.0.192.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "100.51.198.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "113.0.203.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 Range for Documentation (RFC 3849)
    zone "8.b.d.0.1.0.0.2.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // Domain Names for Documentation and Testing (BCP 32)
    zone "test" { type master; file "/etc/namedb/master/empty.db"; };
    zone "example" { type master; file "/etc/namedb/master/empty.db"; };
    zone "invalid" { type master; file "/etc/namedb/master/empty.db"; };
    zone "example.com" { type master; file "/etc/namedb/master/empty.db"; };
    zone "example.net" { type master; file "/etc/namedb/master/empty.db"; };
    zone "example.org" { type master; file "/etc/namedb/master/empty.db"; };

    // Router Benchmark Testing (RFCs 2544 and 5735)
    zone "18.198.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "19.198.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // IANA Reserved - Old Class E Space (RFC 5735)
    zone "240.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "241.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "242.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "243.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "244.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "245.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "246.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "247.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "248.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "249.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "250.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "251.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "252.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "253.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "254.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 Unassigned Addresses (RFC 4291)
    zone "1.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "3.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "4.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "5.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "6.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "7.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "8.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "9.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "a.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "b.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "c.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "d.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "e.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "0.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "1.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "2.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "3.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "4.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "5.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "6.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "7.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "8.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "9.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "a.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "b.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "0.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "1.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "2.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "3.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "4.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "5.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "6.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "7.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 ULA (RFC 4193)
    zone "c.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "d.f.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 Link Local (RFC 4291)
    zone "8.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "9.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "a.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "b.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 Deprecated Site-Local Addresses (RFC 3879)
    zone "c.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "d.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "e.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };
    zone "f.e.f.ip6.arpa"   { type master; file "/etc/namedb/master/empty.db"; };

    // IP6.INT is Deprecated (RFC 4159)
    zone "ip6.int"      { type master; file "/etc/namedb/master/empty.db"; };

    // NB: Do not use the IP addresses below, they are faked, and only
    // serve demonstration/documentation purposes!
    //
    // Example slave zone config entries.  It can be convenient to become
    // a slave at least for the zone your own domain is in.  Ask
    // your network administrator for the IP address of the responsible
    // master name server.
    //
    // Do not forget to include the reverse lookup zone!
    // This is named after the first bytes of the IP address, in reverse
    // order, with ".IN-ADDR.ARPA" appended, or ".IP6.ARPA" for IPv6.
    //
    // Before starting to set up a master zone, make sure you fully
    // understand how DNS and BIND work.  There are sometimes
    // non-obvious pitfalls.  Setting up a slave zone is usually simpler.
    //
    // NB: Don't blindly enable the examples below. :-)  Use actual names
    // and addresses instead.

    /* An example dynamic zone
    key "exampleorgkey" {
        algorithm hmac-md5;
        secret "sf87HJqjkqh8ac87a02lla==";
    };
    zone "example.org" {
        type master;
        allow-update {
            key "exampleorgkey";
        };
        file "/etc/namedb/dynamic/example.org";
    };
    */

    /* Example of a slave reverse zone
    zone "1.168.192.in-addr.arpa" {
        type slave;
        file "/etc/namedb/slave/1.168.192.in-addr.arpa";
        masters {
            192.168.1.1;
        };
    };
    */

In ``named.conf``, these are examples of slave entries for a forward and
reverse zone.

For each new zone served, a new zone entry must be added to
``named.conf``.

For example, the simplest zone entry for ``example.org`` can look like:

.. code:: programlisting

    zone "example.org" {
        type master;
        file "master/example.org";
    };

The zone is a master, as indicated by the ``type`` statement, holding
its zone information in ``/etc/namedb/master/example.org`` indicated by
the ``file`` statement.

.. code:: programlisting

    zone "example.org" {
        type slave;
        file "slave/example.org";
    };

In the slave case, the zone information is transferred from the master
name server for the particular zone, and saved in the file specified. If
and when the master server dies or is unreachable, the slave name server
will have the transferred zone information and will be able to serve it.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.3.2.2.?Zone Files
''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An example master zone file for ``example.org`` (existing within
``/etc/namedb/master/example.org``) is as follows:

.. code:: programlisting

    $TTL 3600        ; 1 hour default TTL
    example.org.    IN      SOA      ns1.example.org. admin.example.org. (
                                    2006051501      ; Serial
                                    10800           ; Refresh
                                    3600            ; Retry
                                    604800          ; Expire
                                    300             ; Negative Response TTL
                            )

    ; DNS Servers
                    IN      NS      ns1.example.org.
                    IN      NS      ns2.example.org.

    ; MX Records
                    IN      MX 10   mx.example.org.
                    IN      MX 20   mail.example.org.

                    IN      A       192.168.1.1

    ; Machine Names
    localhost       IN      A       127.0.0.1
    ns1             IN      A       192.168.1.2
    ns2             IN      A       192.168.1.3
    mx              IN      A       192.168.1.4
    mail            IN      A       192.168.1.5

    ; Aliases
    www             IN      CNAME   example.org.

Note that every hostname ending in a “.” is an exact hostname, whereas
everything without a trailing “.” is relative to the origin. For
example, ``ns1`` is translated into ``ns1.example.org.``

The format of a zone file follows:

.. code:: programlisting

    recordname      IN recordtype   value

The most commonly used DNS records:

.. raw:: html

   <div class="variablelist">

SOA
    start of zone authority

NS
    an authoritative name server

A
    a host address

CNAME
    the canonical name for an alias

MX
    mail exchanger

PTR
    a domain name pointer (used in reverse DNS)

.. raw:: html

   </div>

.. code:: programlisting

    example.org. IN SOA ns1.example.org. admin.example.org. (
                            2006051501      ; Serial
                            10800           ; Refresh after 3 hours
                            3600            ; Retry after 1 hour
                            604800          ; Expire after 1 week
                            300 )           ; Negative Response TTL

.. raw:: html

   <div class="variablelist">

``example.org.``
    the domain name, also the origin for this zone file.

``ns1.example.org.``
    the primary/authoritative name server for this zone.

``admin.example.org.``
    the responsible person for this zone, email address with “@”
    replaced. (``<admin@example.org>`` becomes ``admin.example.org``)

``2006051501``
    the serial number of the file. This must be incremented each time
    the zone file is modified. Nowadays, many admins prefer a
    ``yyyymmddrr`` format for the serial number. ``2006051501`` would
    mean last modified 05/15/2006, the latter ``01`` being the first
    time the zone file has been modified this day. The serial number is
    important as it alerts slave name servers for a zone when it is
    updated.

.. raw:: html

   </div>

.. code:: programlisting

           IN NS           ns1.example.org.

This is an NS entry. Every name server that is going to reply
authoritatively for the zone must have one of these entries.

.. code:: programlisting

    localhost       IN      A       127.0.0.1
    ns1             IN      A       192.168.1.2
    ns2             IN      A       192.168.1.3
    mx              IN      A       192.168.1.4
    mail            IN      A       192.168.1.5

The A record indicates machine names. As seen above, ``ns1.example.org``
would resolve to ``192.168.1.2``.

.. code:: programlisting

                    IN      A       192.168.1.1

This line assigns IP address ``192.168.1.1`` to the current origin, in
this case ``example.org``.

.. code:: programlisting

    www             IN CNAME        @

The canonical name record is usually used for giving aliases to a
machine. In the example, ``www`` is aliased to the “master” machine
whose name happens to be the same as the domain name ``example.org``
(``192.168.1.1``). CNAMEs can never be used together with another kind
of record for the same hostname.

.. code:: programlisting

                   IN MX   10      mail.example.org.

The MX record indicates which mail servers are responsible for handling
incoming mail for the zone. ``mail.example.org`` is the hostname of a
mail server, and 10 is the priority of that mail server.

One can have several mail servers, with priorities of 10, 20 and so on.
A mail server attempting to deliver to ``example.org`` would first try
the highest priority MX (the record with the lowest priority number),
then the second highest, etc, until the mail can be properly delivered.

For in-addr.arpa zone files (reverse DNS), the same format is used,
except with PTR entries instead of A or CNAME.

.. code:: programlisting

    $TTL 3600

    1.168.192.in-addr.arpa. IN SOA ns1.example.org. admin.example.org. (
                            2006051501      ; Serial
                            10800           ; Refresh
                            3600            ; Retry
                            604800          ; Expire
                            300 )           ; Negative Response TTL

            IN      NS      ns1.example.org.
            IN      NS      ns2.example.org.

    1       IN      PTR     example.org.
    2       IN      PTR     ns1.example.org.
    3       IN      PTR     ns2.example.org.
    4       IN      PTR     mx.example.org.
    5       IN      PTR     mail.example.org.

This file gives the proper IP address to hostname mappings for the above
fictitious domain.

It is worth noting that all names on the right side of a PTR record need
to be fully qualified (i.e., end in a “.”).

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

29.7.3.3.?Caching Name Server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A caching name server is a name server whose primary role is to resolve
recursive queries. It simply asks queries of its own, and remembers the
answers for later use.

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

29.7.3.4.?DNSSEC
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Domain Name System Security Extensions, or DNSSEC for short, is a suite
of specifications to protect resolving name servers from forged DNS
data, such as spoofed DNS records. By using digital signatures, a
resolver can verify the integrity of the record. Note that DNSSEC only
provides integrity via digitally signing the Resource Records (RRs). It
provides neither confidentiality nor protection against false end-user
assumptions. This means that it cannot protect against people going to
``example.net`` instead of ``example.com``. The only thing DNSSEC does
is authenticate that the data has not been compromised in transit. The
security of DNS is an important step in securing the Internet in
general. For more in-depth details of how DNSSEC works, the relevant
RFCs are a good place to start. See the list in `Section?29.7.3.6,
“Further Reading” <network-dns.html#dns-read>`__.

The following sections will demonstrate how to enable DNSSEC for an
authoritative DNS server and a recursive (or caching) DNS server running
BIND 9. While all versions of BIND 9 support DNSSEC, it is necessary to
have at least version 9.6.2 in order to be able to use the signed root
zone when validating DNS queries. This is because earlier versions lack
the required algorithms to enable validation using the root zone key. It
is strongly recommended to use the latest version of BIND 9.7 or later
to take advantage of automatic key updating for the root key, as well as
other features to automatically keep zones signed and signatures up to
date. Where configurations differ between 9.6.2 and 9.7 and later,
differences will be pointed out.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.3.4.1.?Recursive DNS Server Configuration
''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Enabling DNSSEC validation of queries performed by a recursive DNS
server requires a few changes to ``named.conf``. Before making these
changes the root zone key, or trust anchor, must be acquired. Currently
the root zone key is not available in a file format BIND understands, so
it has to be manually converted into the proper format. The key itself
can be obtained by querying the root zone for it using dig. By running

.. code:: screen

    % dig +multi +noall +answer DNSKEY . > root.dnskey

the key will end up in ``root.dnskey``. The contents should look
something like this:

.. code:: programlisting

    . 93910 IN DNSKEY 257 3 8 (
        AwEAAagAIKlVZrpC6Ia7gEzahOR+9W29euxhJhVVLOyQ
        bSEW0O8gcCjFFVQUTf6v58fLjwBd0YI0EzrAcQqBGCzh
        /RStIoO8g0NfnfL2MTJRkxoXbfDaUeVPQuYEhg37NZWA
        JQ9VnMVDxP/VHL496M/QZxkjf5/Efucp2gaDX6RS6CXp
        oY68LsvPVjR0ZSwzz1apAzvN9dlzEheX7ICJBBtuA6G3
        LQpzW5hOA2hzCTMjJPJ8LbqF6dsV6DoBQzgul0sGIcGO
        Yl7OyQdXfZ57relSQageu+ipAdTTJ25AsRTAoub8ONGc
        LmqrAmRLKBP1dfwhYB4N7knNnulqQxA+Uk1ihz0=
        ) ; key id = 19036
    . 93910 IN DNSKEY 256 3 8 (
        AwEAAcaGQEA+OJmOzfzVfoYN249JId7gx+OZMbxy69Hf
        UyuGBbRN0+HuTOpBxxBCkNOL+EJB9qJxt+0FEY6ZUVjE
        g58sRr4ZQ6Iu6b1xTBKgc193zUARk4mmQ/PPGxn7Cn5V
        EGJ/1h6dNaiXuRHwR+7oWh7DnzkIJChcTqlFrXDW3tjt
    ) ; key id = 34525

Do not be alarmed if the obtained keys differ from this example. They
might have changed since these instructions were last updated. This
output actually contains two keys. The first key in the listing, with
the value 257 after the DNSKEY record type, is the one needed. This
value indicates that this is a Secure Entry Point (SEP), commonly known
as a Key Signing Key (KSK). The second key, with value 256, is a
subordinate key, commonly called a Zone Signing Key (ZSK). More on the
different key types later in `Section?29.7.3.4.2, “Authoritative DNS
Server Configuration” <network-dns.html#dns-dnssec-auth>`__.

Now the key must be verified and formatted so that BIND can use it. To
verify the key, generate a DS RR set. Create a file containing these RRs
with

.. code:: screen

    % dnssec-dsfromkey -f root.dnskey . > root.ds

These records use SHA-1 and SHA-256 respectively, and should look
similar to the following example, where the longer is using SHA-256.

.. code:: programlisting

    .  IN DS 19036 8 1
        B256BD09DC8DD59F0E0F0D8541B8328DD986DF6E
    . IN DS 19036 8 2 49AAC11D7B6F6446702E54A1607371607A1A41855200FD2CE1CDDE32F24E8FB5

The SHA-256 RR can now be compared to the digest in
https://data.iana.org/root-anchors/root-anchors.xml. To be absolutely
sure that the key has not been tampered with the data in the XML file
can be verified using the PGP signature in
https://data.iana.org/root-anchors/root-anchors.asc.

Next, the key must be formatted properly. This differs a little between
BIND versions 9.6.2 and 9.7 and later. In version 9.7 support was added
to automatically track changes to the key and update it as necessary.
This is done using ``managed-keys`` as seen in the example below. When
using the older version, the key is added using a ``trusted-keys``
statement and updates must be done manually. For BIND 9.6.2 the format
should look like:

.. code:: programlisting

    trusted-keys {
        "." 257 3 8
        "AwEAAagAIKlVZrpC6Ia7gEzahOR+9W29euxhJhVVLOyQbSEW0O8gcCjF
        FVQUTf6v58fLjwBd0YI0EzrAcQqBGCzh/RStIoO8g0NfnfL2MTJRkxoX
        bfDaUeVPQuYEhg37NZWAJQ9VnMVDxP/VHL496M/QZxkjf5/Efucp2gaD
        X6RS6CXpoY68LsvPVjR0ZSwzz1apAzvN9dlzEheX7ICJBBtuA6G3LQpz
        W5hOA2hzCTMjJPJ8LbqF6dsV6DoBQzgul0sGIcGOYl7OyQdXfZ57relS
        Qageu+ipAdTTJ25AsRTAoub8ONGcLmqrAmRLKBP1dfwhYB4N7knNnulq
        QxA+Uk1ihz0=";
    };

For 9.7 the format will instead be:

.. code:: programlisting

    managed-keys {
        "." initial-key 257 3 8
        "AwEAAagAIKlVZrpC6Ia7gEzahOR+9W29euxhJhVVLOyQbSEW0O8gcCjF
        FVQUTf6v58fLjwBd0YI0EzrAcQqBGCzh/RStIoO8g0NfnfL2MTJRkxoX
        bfDaUeVPQuYEhg37NZWAJQ9VnMVDxP/VHL496M/QZxkjf5/Efucp2gaD
        X6RS6CXpoY68LsvPVjR0ZSwzz1apAzvN9dlzEheX7ICJBBtuA6G3LQpz
        W5hOA2hzCTMjJPJ8LbqF6dsV6DoBQzgul0sGIcGOYl7OyQdXfZ57relS
        Qageu+ipAdTTJ25AsRTAoub8ONGcLmqrAmRLKBP1dfwhYB4N7knNnulq
        QxA+Uk1ihz0=";
    };

The root key can now be added to ``named.conf`` either directly or by
including a file containing the key. After these steps, configure BIND
to do DNSSEC validation on queries by editing ``named.conf`` and adding
the following to the ``options`` directive:

.. code:: programlisting

    dnssec-enable yes;
    dnssec-validation yes;

To verify that it is actually working use dig to make a query for a
signed zone using the resolver just configured. A successful reply will
contain the ``AD`` flag to indicate the data was authenticated. Running
a query such as

.. code:: screen

    % dig @resolver +dnssec se ds 

should return the DS RR for the ``.se`` zone. In the ``flags:`` section
the ``AD`` flag should be set, as seen in:

.. code:: programlisting

    ...
    ;; flags: qr rd ra ad; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1
    ...

The resolver is now capable of authenticating DNS queries.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.3.4.2.?Authoritative DNS Server Configuration
''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to get an authoritative name server to serve a DNSSEC signed
zone a little more work is required. A zone is signed using
cryptographic keys which must be generated. It is possible to use only
one key for this. The preferred method however is to have a strong
well-protected Key Signing Key (KSK) that is not rotated very often and
a Zone Signing Key (ZSK) that is rotated more frequently. Information on
recommended operational practices can be found in `RFC 4641: DNSSEC
Operational Practices <http://tools.ietf.org/rfc/rfc4641.txt>`__.
Practices regarding the root zone can be found in `DNSSEC Practice
Statement for the Root Zone KSK
operator <http://www.root-dnssec.org/wp-content/uploads/2010/06/icann-dps-00.txt>`__
and `DNSSEC Practice Statement for the Root Zone ZSK
operator <http://www.root-dnssec.org/wp-content/uploads/2010/06/vrsn-dps-00.txt>`__.
The KSK is used to build a chain of authority to the data in need of
validation and as such is also called a Secure Entry Point (SEP) key. A
message digest of this key, called a Delegation Signer (DS) record, must
be published in the parent zone to establish the trust chain. How this
is accomplished depends on the parent zone owner. The ZSK is used to
sign the zone, and only needs to be published there.

To enable DNSSEC for the ``example.com`` zone depicted in previous
examples, the first step is to use dnssec-keygen to generate the KSK and
ZSK key pair. This key pair can utilize different cryptographic
algorithms. It is recommended to use RSA/SHA256 for the keys and 2048
bits key length should be enough. To generate the KSK for
``example.com``, run

.. code:: screen

    % dnssec-keygen -f KSK -a RSASHA256 -b 2048 -n ZONE example.com

and to generate the ZSK, run

.. code:: screen

    % dnssec-keygen -a RSASHA256 -b 2048 -n ZONE example.com

dnssec-keygen outputs two files, the public and the private keys in
files named similar to ``Kexample.com.+005+nnnnn.key`` (public) and
``Kexample.com.+005+nnnnn.private`` (private). The ``nnnnn`` part of the
file name is a five digit key ID. Keep track of which key ID belongs to
which key. This is especially important when having more than one key in
a zone. It is also possible to rename the keys. For each KSK file do:

.. code:: screen

    % mv Kexample.com.+005+nnnnn.key Kexample.com.+005+nnnnn.KSK.key
    % mv Kexample.com.+005+nnnnn.private Kexample.com.+005+nnnnn.KSK.private

For the ZSK files, substitute ``KSK`` for ``ZSK`` as necessary. The
files can now be included in the zone file, using the ``$include``
statement. It should look something like this:

.. code:: programlisting

    $include Kexample.com.+005+nnnnn.KSK.key ; KSK
    $include Kexample.com.+005+nnnnn.ZSK.key    ; ZSK

Finally, sign the zone and tell BIND to use the signed zone file. To
sign a zone dnssec-signzone is used. The command to sign the zone
``example.com``, located in ``example.com.db`` would look similar to

.. code:: screen

    % dnssec-signzone -o
        example.com -k Kexample.com.+005+nnnnn.KSK example.com.db
        Kexample.com.+005+nnnnn.ZSK.key

The key supplied to the ``-k`` argument is the KSK and the other key
file is the ZSK that should be used in the signing. It is possible to
supply more than one KSK and ZSK, which will result in the zone being
signed with all supplied keys. This can be needed to supply zone data
signed using more than one algorithm. The output of dnssec-signzone is a
zone file with all RRs signed. This output will end up in a file with
the extension ``.signed``, such as ``example.com.db.signed``. The DS
records will also be written to a separate file ``dsset-example.com``.
To use this signed zone just modify the zone directive in ``named.conf``
to use ``example.com.db.signed``. By default, the signatures are only
valid 30 days, meaning that the zone needs to be resigned in about 15
days to be sure that resolvers are not caching records with stale
signatures. It is possible to make a script and a cron job to do this.
See relevant manuals for details.

Be sure to keep private keys confidential, as with all cryptographic
keys. When changing a key it is best to include the new key into the
zone, while still signing with the old one, and then move over to using
the new key to sign. After these steps are done the old key can be
removed from the zone. Failure to do this might render the DNS data
unavailable for a time, until the new key has propagated through the DNS
hierarchy. For more information on key rollovers and other DNSSEC
operational issues, see `RFC 4641: DNSSEC Operational
practices <http://www.ietf.org/rfc/rfc4641.txt>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.3.4.3.?Automation Using BIND 9.7 or Later
''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beginning with BIND version 9.7 a new feature called *Smart Signing* was
introduced. This feature aims to make the key management and signing
process simpler by automating parts of the task. By putting the keys
into a directory called a *key repository*, and using the new option
``auto-dnssec``, it is possible to create a dynamic zone which will be
resigned as needed. To update this zone use nsupdate with the new option
``-l``. rndc has also grown the ability to sign zones with keys in the
key repository, using the option ``sign``. To tell BIND to use this
automatic signing and zone updating for ``example.com``, add the
following to ``named.conf``:

.. code:: programlisting

    zone example.com {
        type master;
        key-directory "/etc/named/keys";
        update-policy local;
        auto-dnssec maintain;
        file "/etc/named/dynamic/example.com.zone";
    };

After making these changes, generate keys for the zone as explained in
`Section?29.7.3.4.2, “Authoritative DNS Server
Configuration” <network-dns.html#dns-dnssec-auth>`__, put those keys in
the key repository given as the argument to the ``key-directory`` in the
zone configuration and the zone will be signed automatically. Updates to
a zone configured this way must be done using nsupdate, which will take
care of re-signing the zone with the new data added. For further
details, see `Section?29.7.3.6, “Further
Reading” <network-dns.html#dns-read>`__ and the BIND documentation.

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

29.7.3.5.?Security
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Although BIND is the most common implementation of DNS, there is always
the issue of security. Possible and exploitable security holes are
sometimes found.

While FreeBSD automatically drops named into a
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
environment; there are several other security mechanisms in place which
could help to lure off possible DNS service attacks.

It is always good idea to read `CERT <http://www.cert.org/>`__'s
security advisories and to subscribe to the `FreeBSD security
notifications mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-security-notifications>`__
to stay up to date with the current Internet and FreeBSD security
issues.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

If a problem arises, keeping sources up to date and having a fresh build
of named may help.

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

29.7.3.6.?Further Reading
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BIND/named manual pages:
`rndc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rndc&sektion=8>`__
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__
`named.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=named.conf&sektion=5>`__
`nsupdate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nsupdate&sektion=1>`__
`dnssec-signzone(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dnssec-signzone&sektion=8>`__
`dnssec-keygen(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dnssec-keygen&sektion=8>`__

.. raw:: html

   <div class="itemizedlist">

-  `Official ISC BIND Page <https://www.isc.org/software/bind>`__

-  `Official ISC BIND Forum <https://www.isc.org/software/guild>`__

-  `O'Reilly DNS and BIND 5th
   Edition <http://www.oreilly.com/catalog/dns5/>`__

-  `Root DNSSEC <http://www.root-dnssec.org/documentation/>`__

-  `DNSSEC Trust Anchor Publication for the Root
   Zone <http://data.iana.org/root-anchors/draft-icann-dnssec-trust-anchor.html>`__

-  `RFC1034 - Domain Names - Concepts and
   Facilities <http://tools.ietf.org/html/rfc1034>`__

-  `RFC1035 - Domain Names - Implementation and
   Specification <http://tools.ietf.org/html/rfc1035>`__

-  `RFC4033 - DNS Security Introduction and
   Requirements <http://tools.ietf.org/html/rfc4033>`__

-  `RFC4034 - Resource Records for the DNS Security
   Extensions <http://tools.ietf.org/html/rfc4034>`__

-  `RFC4035 - Protocol Modifications for the DNS Security
   Extensions <http://tools.ietf.org/html/rfc4035>`__

-  `RFC4641 - DNSSEC Operational
   Practices <http://tools.ietf.org/html/rfc4641>`__

-  `RFC 5011 - Automated Updates of DNS Security (DNSSEC Trust
   Anchors <http://tools.ietf.org/html/rfc5011>`__

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

+-----------------------------------------------------+---------------------------------+-------------------------------------+
| `Prev <network-dhcp.html>`__?                       | `Up <network-servers.html>`__   | ?\ `Next <network-apache.html>`__   |
+-----------------------------------------------------+---------------------------------+-------------------------------------+
| 29.6.?Dynamic Host Configuration Protocol (DHCP)?   | `Home <index.html>`__           | ?29.8.?Apache HTTP Server           |
+-----------------------------------------------------+---------------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
