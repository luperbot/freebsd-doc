==============================
29.6. Domain Name System (DNS)
==============================

.. raw:: html

   <div class="navheader">

29.6. Domain Name System (DNS)
`????? <network-dhcp.html>`__?
???????? 29. ???????????? ???????
?\ `??????? <network-apache.html>`__

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

29.6. Domain Name System (DNS)
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Chern Lee, Tom Rhodes ??? Daniel Gerzo.

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

29.6.1. Overview
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD utilizes, by default, a version of BIND (Berkeley Internet Name
Domain), which is the most common implementation of the DNS protocol.
DNS is the protocol through which names are mapped to IP addresses, and
vice versa. For example, a query for ``www.FreeBSD.org`` will receive a
reply with the IP address of The FreeBSD Project's web server, whereas,
a query for ``ftp.FreeBSD.org`` will return the IP address of the
corresponding FTP machine. Likewise, the opposite can happen. A query
for an IP address can resolve its hostname. It is not necessary to run a
name server to perform DNS lookups on a system.

FreeBSD currently comes with BIND9 DNS server software by default. Our
installation provides enhanced security features, a new file system
layout and automated
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
configuration.

DNS is coordinated across the Internet through a somewhat complex system
of authoritative root, Top Level Domain (TLD), and other smaller-scale
name servers which host and cache individual domain information.

Currently, BIND is maintained by the Internet Software Consortium
``http://www.isc.org/``.

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

29.6.2. Terminology
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To understand this document, some terms related to DNS must be
understood.

.. raw:: html

   <div class="informaltable">

+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Term                       | Definition                                                                                                                                                   |
+============================+==============================================================================================================================================================+
| Forward DNS                | Mapping of hostnames to IP addresses.                                                                                                                        |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Origin                     | Refers to the domain covered in a particular zone file.                                                                                                      |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| named, BIND, name server   | Common names for the BIND name server package within FreeBSD.                                                                                                |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Resolver                   | A system process through which a machine queries a name server for zone information.                                                                         |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Reverse DNS                | The opposite of forward DNS; mapping of IP addresses to hostnames.                                                                                           |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Root zone                  | The beginning of the Internet zone hierarchy. All zones fall under the root zone, similar to how all files in a file system fall under the root directory.   |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Zone                       | An individual domain, subdomain, or portion of the DNS administered by the same authority.                                                                   |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Examples of zones:

.. raw:: html

   <div class="itemizedlist">

-  ``.`` is the root zone.

-  ``org.`` is a Top Level Domain (TLD) under the root zone.

-  ``example.org.`` is a zone under the ``org.`` TLD.

-  ``1.168.192.in-addr.arpa`` is a zone referencing all IP addresses
   which fall under the ``192.168.1.*`` IP space.

.. raw:: html

   </div>

As one can see, the more specific part of a hostname appears to its
left. For example, ``example.org.`` is more specific than ``org.``, as
``org.`` is more specific than the root zone. The layout of each part of
a hostname is much like a file system: the ``/dev`` directory falls
within the root, and so on.

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

29.6.3. Reasons to Run a Name Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Name servers usually come in two forms: an authoritative name server,
and a caching name server.

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
world by the caching DNS server. Every additional query will not have to
look to the outside of the local network, since the information is
cached locally.

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

29.6.4. How It Works
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD, the BIND daemon is called named for obvious reasons.

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

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.6.5. Starting BIND
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since BIND is installed by default, configuring it all is relatively
simple.

The default named configuration is that of a basic resolving name
server, ran in a
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
environment. To start the server one time with this configuration, use
the following command:

.. code:: screen

    # /etc/rc.d/named forcestart

To ensure the named daemon is started at boot each time, put the
following line into the ``/etc/rc.conf``:

.. code:: programlisting

    named_enable="YES"

There are obviously many configuration options for
``/etc/namedb/named.conf`` that are beyond the scope of this document.
However, if you are interested in the startup options for named on
FreeBSD, take a look at the ``named_*`` flags in
``/etc/defaults/rc.conf`` and consult the
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
manual page. The `??????12.7, ???????????????? ?? ??????? rc ???
FreeBSD? <configtuning-rcd.html>`__ section is also a good read.

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

29.6.6. Configuration Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configuration files for named currently reside in ``/etc/namedb``
directory and will need modification before use, unless all that is
needed is a simple resolver. This is where most of the configuration
will be performed.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.6.6.1. Using ``make-localhost``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To configure a master zone for the localhost visit the ``/etc/namedb``
directory and run the following command:

.. code:: screen

    # sh make-localhost

If all went well, a new file should exist in the ``master``
subdirectory. The filenames should be ``localhost.rev`` for the local
domain name and ``localhost-v6.rev`` for IPv6 configurations. As the
default configuration file, required information will be present in the
``named.conf`` file.

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

29.6.6.2. ``/etc/namedb/named.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
        directory   "/etc/namedb";
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

    // In addition to the "forwarders" clause, you can force your name
    // server to never initiate queries of its own, but always ask its
    // forwarders only, by enabling the following line:
    //
    //  forward only;

    // If you've got a DNS server around at your upstream provider, enter
    // its IP address here, and enable the line below.  This will make you
    // benefit from its cache, thus reduce overall DNS traffic in the Internet.
    /*
        forwarders {
            127.0.0.1;
        };
    */

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

?????????????:
~~~~~~~~~~~~~~

``127.0.0.1`` will *not* work here. Change this IP address to a name
server at your uplink.

.. raw:: html

   </div>

.. code:: programlisting

       /*
         * If there is a firewall between you and nameservers you want
         * to talk to, you might need to uncomment the query-source
         * directive below.  Previous versions of BIND always asked
         * questions using port 53, but BIND versions 8 and later
         * use a pseudo-random unprivileged UDP port by default.
         */
         // query-source address * port 53;
    };

    // If you enable a local name server, don't forget to enter 127.0.0.1
    // first in your /etc/resolv.conf so this server will be queried.
    // Also, make sure to enable it in /etc/rc.conf.

    zone "." {
        type hint;
        file "named.root";
    };

    zone "0.0.127.IN-ADDR.ARPA" {
        type master;
        file "master/localhost.rev";
    };

    // RFC 3152
    zone "1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.IP6.ARPA" {
        type master;
        file "master/localhost-v6.rev";
    };

    // NB: Do not use the IP addresses below, they are faked, and only
    // serve demonstration/documentation purposes!
    //
    // Example slave zone config entries.  It can be convenient to become
    // a slave at least for the zone your own domain is in.  Ask
    // your network administrator for the IP address of the responsible
    // primary.
    //
    // Never forget to include the reverse lookup (IN-ADDR.ARPA) zone!
    // (This is named after the first bytes of the IP address, in reverse
    // order, with ".IN-ADDR.ARPA" appended.)
    //
    // Before starting to set up a primary zone, make sure you fully
    // understand how DNS and BIND works.  There are sometimes
    // non-obvious pitfalls.  Setting up a slave zone is simpler.
    //
    // NB: Don't blindly enable the examples below. :-)  Use actual names
    // and addresses instead.

    /* An example master zone
    zone "example.net" {
        type master;
        file "master/example.net";
    };
    */

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
        file "dynamic/example.org";
    };
    */

    /* Examples of forward and reverse slave zones
    zone "example.com" {
        type slave;
        file "slave/example.com";
        masters {
            192.168.1.1;
        };
    };
    zone "1.168.192.in-addr.arpa" {
        type slave;
        file "slave/1.168.192.in-addr.arpa";
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

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.6.6.3. Zone Files
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An example master zone file for ``example.org`` (existing within
``/etc/namedb/master/example.org``) is as follows:

.. code:: programlisting

    $TTL 3600        ; 1 hour
    example.org.    IN      SOA      ns1.example.org. admin.example.org. (
                                    2006051501      ; Serial
                                    10800           ; Refresh
                                    3600            ; Retry
                                    604800          ; Expire
                                    86400           ; Minimum TTL
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
    www             IN      CNAME   @

Note that every hostname ending in a ?.? is an exact hostname, whereas
everything without a trailing ?.? is referenced to the origin. For
example, ``www`` is translated into ``www.origin``. In our fictitious
zone file, our origin is ``example.org.``, so ``www`` would translate to
``www.example.org.``

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
                            86400 )         ; Minimum TTL of 1 day

.. raw:: html

   <div class="variablelist">

``example.org.``
    the domain name, also the origin for this zone file.

``ns1.example.org.``
    the primary/authoritative name server for this zone.

``admin.example.org.``
    the responsible person for this zone, email address with ?@?
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
machine. In the example, ``www`` is aliased to the ?master? machine
which name equals to domain name ``example.org`` (``192.168.1.1``).
CNAMEs can be used to provide alias hostnames, or round robin one
hostname among multiple machines.

.. code:: programlisting

                   IN MX   10      mail.example.org.

The MX record indicates which mail servers are responsible for handling
incoming mail for the zone. ``mail.example.org`` is the hostname of the
mail server, and 10 being the priority of that mail server.

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
                            3600 )          ; Minimum

            IN      NS      ns1.example.org.
            IN      NS      ns2.example.org.

    1       IN      PTR     example.org.
    2       IN      PTR     ns1.example.org.
    3       IN      PTR     ns2.example.org.
    4       IN      PTR     mx.example.org.
    5       IN      PTR     mail.example.org.

This file gives the proper IP address to hostname mappings of our above
fictitious domain.

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

29.6.7. Caching Name Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A caching name server is a name server that is not authoritative for any
zones. It simply asks queries of its own, and remembers them for later
use. To set one up, just configure the name server as usual, omitting
any inclusions of zones.

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

29.6.8. Security
~~~~~~~~~~~~~~~~

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
security advisories and to subscribe to the `??????????? ?????
???????????? ??? ?????? ????????? ???
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-security-notifications>`__
to stay up to date with the current Internet and FreeBSD security
issues.

.. raw:: html

   <div class="tip" xmlns="">

????????:
~~~~~~~~~

If a problem arises, keeping sources up to date and having a fresh build
of named would not hurt.

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

29.6.9. Further Reading
~~~~~~~~~~~~~~~~~~~~~~~

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

.. raw:: html

   <div class="itemizedlist">

-  `Official ISC BIND Page <http://www.isc.org/products/BIND/>`__

-  `Official ISC BIND Forum <http://www.isc.org/sw/guild/bf/>`__

-  `BIND FAQ <http://www.nominum.com/getOpenSourceResource.php?id=6>`__

-  `O'Reilly DNS and BIND 5th
   Edition <http://www.oreilly.com/catalog/dns5/>`__

-  `RFC1034 - Domain Names - Concepts and
   Facilities <ftp://ftp.isi.edu/in-notes/rfc1034.txt>`__

-  `RFC1035 - Domain Names - Implementation and
   Specification <ftp://ftp.isi.edu/in-notes/rfc1035.txt>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+-----------------------------------+----------------------------------------+
| `????? <network-dhcp.html>`__?                  | `???? <network-servers.html>`__   | ?\ `??????? <network-apache.html>`__   |
+-------------------------------------------------+-----------------------------------+----------------------------------------+
| 29.5. Automatic Network Configuration (DHCP)?   | `???? <index.html>`__             | ?29.7. ? ???????????? HTTP Apache      |
+-------------------------------------------------+-----------------------------------+----------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
