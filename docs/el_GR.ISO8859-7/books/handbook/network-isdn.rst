==========
31.7. ISDN
==========

.. raw:: html

   <div class="navheader">

31.7. ISDN
`????? <network-diskless.html>`__?
???????? 31. ??????????? ?????? ?????????
?\ `??????? <network-natd.html>`__

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

31.7. ISDN
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A good resource for information on ISDN technology and hardware is `Dan
Kegel's ISDN Page <http://www.alumni.caltech.edu/~dank/isdn/>`__.

A quick simple road map to ISDN follows:

.. raw:: html

   <div class="itemizedlist">

-  If you live in Europe you might want to investigate the ISDN card
   section.

-  If you are planning to use ISDN primarily to connect to the Internet
   with an Internet Provider on a dial-up non-dedicated basis, you might
   look into Terminal Adapters. This will give you the most flexibility,
   with the fewest problems, if you change providers.

-  If you are connecting two LANs together, or connecting to the
   Internet with a dedicated ISDN connection, you might consider the
   stand alone router/bridge option.

.. raw:: html

   </div>

Cost is a significant factor in determining what solution you will
choose. The following options are listed from least expensive to most
expensive.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.7.1. ISDN Cards
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Hellmuth Michaelis.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD's ISDN implementation supports only the DSS1/Q.931 (or
Euro-ISDN) standard using passive cards. Some active cards are supported
where the firmware also supports other signaling protocols; this also
includes the first supported Primary Rate (PRI) ISDN card.

The isdn4bsd software allows you to connect to other ISDN routers using
either IP over raw HDLC or by using synchronous PPP: either by using
kernel PPP with ``isppp``, a modified
`sppp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sppp&sektion=4>`__
driver, or by using userland
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__. By
using userland
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__,
channel bonding of two or more ISDN B-channels is possible. A telephone
answering machine application is also available as well as many
utilities such as a software 300 Baud modem.

Some growing number of PC ISDN cards are supported under FreeBSD and the
reports show that it is successfully used all over Europe and in many
other parts of the world.

The passive ISDN cards supported are mostly the ones with the Infineon
(formerly Siemens) ISAC/HSCX/IPAC ISDN chipsets, but also ISDN cards
with chips from Cologne Chip (ISA bus only), PCI cards with Winbond
W6692 chips, some cards with the Tiger300/320/ISAC chipset combinations
and some vendor specific chipset based cards such as the AVM Fritz!Card
PCI V.1.0 and the AVM Fritz!Card PnP.

Currently the active supported ISDN cards are the AVM B1 (ISA and PCI)
BRI cards and the AVM T1 PCI PRI cards.

For documentation on isdn4bsd, have a look at
``/usr/share/examples/isdn/`` directory on your FreeBSD system or at the
`homepage of isdn4bsd <http://www.freebsd-support.de/i4b/>`__ which also
has pointers to hints, erratas and much more documentation such as the
`isdn4bsd handbook <http://people.FreeBSD.org/~hm/>`__.

In case you are interested in adding support for a different ISDN
protocol, a currently unsupported ISDN PC card or otherwise enhancing
isdn4bsd, please get in touch with Hellmuth Michaelis.

For questions regarding the installation, configuration and
troubleshooting isdn4bsd, a
`freebsd-isdn <http://lists.FreeBSD.org/mailman/listinfo/freebsd-isdn>`__
mailing list is available.

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

31.7.2. ISDN Terminal Adapters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Terminal adapters (TA), are to ISDN what modems are to regular phone
lines.

Most TA's use the standard Hayes modem AT command set, and can be used
as a drop in replacement for a modem.

A TA will operate basically the same as a modem except connection and
throughput speeds will be much faster than your old modem. You will need
to configure `PPP <ppp.html>`__ exactly the same as for a modem setup.
Make sure you set your serial speed as high as possible.

The main advantage of using a TA to connect to an Internet Provider is
that you can do Dynamic PPP. As IP address space becomes more and more
scarce, most providers are not willing to provide you with a static IP
anymore. Most stand-alone routers are not able to accommodate dynamic IP
allocation.

TA's completely rely on the PPP daemon that you are running for their
features and stability of connection. This allows you to upgrade easily
from using a modem to ISDN on a FreeBSD machine, if you already have PPP
set up. However, at the same time any problems you experienced with the
PPP program and are going to persist.

If you want maximum stability, use the kernel `PPP <ppp.html>`__ option,
not the `userland PPP <userppp.html>`__.

The following TA's are known to work with FreeBSD:

.. raw:: html

   <div class="itemizedlist">

-  Motorola BitSurfer and Bitsurfer Pro

-  Adtran

.. raw:: html

   </div>

Most other TA's will probably work as well, TA vendors try to make sure
their product can accept most of the standard modem AT command set.

The real problem with external TA's is that, like modems, you need a
good serial card in your computer.

You should read the `FreeBSD Serial
Hardware <../../../../doc/el_GR.ISO8859-7/articles/serial-uart/index.html>`__
tutorial for a detailed understanding of serial devices, and the
differences between asynchronous and synchronous serial ports.

A TA running off a standard PC serial port (asynchronous) limits you to
115.2?Kbs, even though you have a 128?Kbs connection. To fully utilize
the 128?Kbs that ISDN is capable of, you must move the TA to a
synchronous serial card.

Do not be fooled into buying an internal TA and thinking you have
avoided the synchronous/asynchronous issue. Internal TA's simply have a
standard PC serial port chip built into them. All this will do is save
you having to buy another serial cable and find another empty electrical
socket.

A synchronous card with a TA is at least as fast as a stand-alone
router, and with a simple 386 FreeBSD box driving it, probably more
flexible.

The choice of synchronous card/TA v.s. stand-alone router is largely a
religious issue. There has been some discussion of this in the mailing
lists. We suggest you search the
`archives <../../../../search/index.html>`__ for the complete
discussion.

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

31.7.3. Stand-alone ISDN Bridges/Routers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ISDN bridges or routers are not at all specific to FreeBSD or any other
operating system. For a more complete description of routing and
bridging technology, please refer to a networking reference book.

In the context of this section, the terms router and bridge will be used
interchangeably.

As the cost of low end ISDN routers/bridges comes down, it will likely
become a more and more popular choice. An ISDN router is a small box
that plugs directly into your local Ethernet network, and manages its
own connection to the other bridge/router. It has built in software to
communicate via PPP and other popular protocols.

A router will allow you much faster throughput than a standard TA, since
it will be using a full synchronous ISDN connection.

The main problem with ISDN routers and bridges is that interoperability
between manufacturers can still be a problem. If you are planning to
connect to an Internet provider, you should discuss your needs with
them.

If you are planning to connect two LAN segments together, such as your
home LAN to the office LAN, this is the simplest lowest maintenance
solution. Since you are buying the equipment for both sides of the
connection you can be assured that the link will work.

For example to connect a home computer or branch office network to a
head office network the following setup could be used:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 31.1. Branch Office or Home Network

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Network uses a bus based topology with 10 base 2 Ethernet (?thinnet?).
Connect router to network cable with AUI/10BT transceiver, if necessary.

.. raw:: html

   <div class="mediaobject">

|10 Base 2 Ethernet|

.. raw:: html

   </div>

If your home/branch office is only one computer you can use a twisted
pair crossover cable to connect to the stand-alone router directly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 31.2. Head Office or Other LAN

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Network uses a star topology with 10 base T Ethernet (?Twisted Pair?).

.. raw:: html

   <div class="mediaobject">

|ISDN Network Diagram|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One large advantage of most routers/bridges is that they allow you to
have 2 *separate independent* PPP connections to 2 separate sites at the
*same* time. This is not supported on most TA's, except for specific
(usually expensive) models that have two serial ports. Do not confuse
this with channel bonding, MPP, etc.

This can be a very useful feature if, for example, you have an dedicated
ISDN connection at your office and would like to tap into it, but do not
want to get another ISDN line at work. A router at the office location
can manage a dedicated B channel connection (64?Kbps) to the Internet
and use the other B channel for a separate data connection. The second B
channel can be used for dial-in, dial-out or dynamically bonding (MPP,
etc.) with the first B channel for more bandwidth.

An Ethernet bridge will also allow you to transmit more than just IP
traffic. You can also send IPX/SPX or whatever other protocols you use.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------------------+--------------------------------------+
| `????? <network-diskless.html>`__?   | `???? <advanced-networking.html>`__   | ?\ `??????? <network-natd.html>`__   |
+--------------------------------------+---------------------------------------+--------------------------------------+
| 31.6. Diskless Operation?            | `???? <index.html>`__                 | ?31.8. Network Address Translation   |
+--------------------------------------+---------------------------------------+--------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

.. |10 Base 2 Ethernet| image:: advanced-networking/isdn-bus.png
.. |ISDN Network Diagram| image:: advanced-networking/isdn-twisted-pair.png
