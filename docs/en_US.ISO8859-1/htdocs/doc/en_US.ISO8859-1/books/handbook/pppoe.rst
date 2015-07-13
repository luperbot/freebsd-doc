=====================================
27.4.?Using PPP over Ethernet (PPPoE)
=====================================

.. raw:: html

   <div class="navheader">

27.4.?Using PPP over Ethernet (PPPoE)
`Prev <ppp-troubleshoot.html>`__?
Chapter?27.?PPP
?\ `Next <pppoa.html>`__

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

27.4.?Using PPP over Ethernet (PPPoE)
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes how to set up PPP over Ethernet (PPPoE).

Here is an example of a working ``ppp.conf``:

.. code:: programlisting

    default:
      set log Phase tun command # you can add more detailed logging if you wish
      set ifaddr 10.0.0.1/0 10.0.0.2/0

    name_of_service_provider:
      set device PPPoE:xl1 # replace xl1 with your Ethernet device
      set authname YOURLOGINNAME
      set authkey YOURPASSWORD
      set dial
      set login
      add default HISADDR

As ``root``, run:

.. code:: screen

    # ppp -ddial name_of_service_provider

Add the following to ``/etc/rc.conf``:

.. code:: programlisting

    ppp_enable="YES"
    ppp_mode="ddial"
    ppp_nat="YES"   # if you want to enable nat for your local network, otherwise NO
    ppp_profile="name_of_service_provider"

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.4.1.?Using a PPPoE Service Tag
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sometimes it will be necessary to use a service tag to establish the
connection. Service tags are used to distinguish between different PPPoE
servers attached to a given network.

Any required service tag information should be in the documentation
provided by the ISP.

As a last resort, one could try installing the
`net/rr-pppoe <http://www.freebsd.org/cgi/url.cgi?ports/net/rr-pppoe/pkg-descr>`__
package or port. Bear in mind however, this may de-program your modem
and render it useless, so think twice before doing it. Simply install
the program shipped with the modem. Then, access the System menu from
the program. The name of the profile should be listed there. It is
usually *ISP*.

The profile name (service tag) will be used in the PPPoE configuration
entry in ``ppp.conf`` as the provider part of the ``set device`` command
(see the
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
manual page for full details). It should look like this:

.. code:: programlisting

    set device PPPoE:xl1:ISP

Do not forget to change *``xl1``* to the proper device for the Ethernet
card.

Do not forget to change *``ISP``* to the profile.

For additional information, refer to `Cheaper Broadband with FreeBSD on
DSL <http://renaud.waldura.com/doc/freebsd/pppoe/>`__ by Renaud Waldura.

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

27.4.2.?PPPoE with a 3Com? HomeConnect? ADSL Modem Dual Link
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This modem does not follow the PPPoE specification defined in `RFC
2516 <http://www.faqs.org/rfcs/rfc2516.html>`__.

In order to make FreeBSD capable of communicating with this device, a
sysctl must be set. This can be done automatically at boot time by
updating ``/etc/sysctl.conf``:

.. code:: programlisting

    net.graph.nonstandard_pppoe=1

or can be done immediately with the command:

.. code:: screen

    # sysctl net.graph.nonstandard_pppoe=1

Unfortunately, because this is a system-wide setting, it is not possible
to talk to a normal PPPoE client or server and a 3Com? HomeConnect? ADSL
Modem at the same time.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+------------------------------+-------------------------------------+
| `Prev <ppp-troubleshoot.html>`__?        | `Up <ppp-and-slip.html>`__   | ?\ `Next <pppoa.html>`__            |
+------------------------------------------+------------------------------+-------------------------------------+
| 27.3.?Troubleshooting PPP Connections?   | `Home <index.html>`__        | ?27.5.?Using PPP over ATM (PPPoA)   |
+------------------------------------------+------------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
