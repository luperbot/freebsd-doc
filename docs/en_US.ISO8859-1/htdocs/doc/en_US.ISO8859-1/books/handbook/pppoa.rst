================================
27.5.?Using PPP over ATM (PPPoA)
================================

.. raw:: html

   <div class="navheader">

27.5.?Using PPP over ATM (PPPoA)
`Prev <pppoe.html>`__?
Chapter?27.?PPP
?\ `Next <mail.html>`__

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

27.5.?Using PPP over ATM (PPPoA)
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following describes how to set up PPP over ATM (PPPoA). PPPoA is a
popular choice among European DSL providers.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.5.1.?Using mpd
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The mpd application can be used to connect to a variety of services, in
particular PPTP services. It can be installed using the
`net/mpd5 <http://www.freebsd.org/cgi/url.cgi?ports/net/mpd5/pkg-descr>`__
package or port. Many ADSL modems require that a PPTP tunnel is created
between the modem and computer.

Once installed, configure mpd to suit the provider's settings. The port
places a set of sample configuration files which are well documented in
``/usr/local/etc/mpd/``. A complete guide to configure mpd is available
in HTML format in ``/usr/ports/share/doc/mpd/``. Here is a sample
configuration for connecting to an ADSL service with mpd. The
configuration is spread over two files, first the ``mpd.conf``:

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This example of the ``mpd.conf`` file only works with mpd 4.x.

.. raw:: html

   </div>

.. code:: programlisting

    default:
        load adsl

    adsl:
        new -i ng0 adsl adsl
        set bundle authname username 
        set bundle password password 
        set bundle disable multilink

        set link no pap acfcomp protocomp
        set link disable chap
        set link accept chap
        set link keep-alive 30 10

        set ipcp no vjcomp
        set ipcp ranges 0.0.0.0/0 0.0.0.0/0

        set iface route default
        set iface disable on-demand
        set iface enable proxy-arp
        set iface idle 0

        open

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-mpd-ex-user>`__            | The username used to authenticate    |
|                                      | with your ISP.                       |
+--------------------------------------+--------------------------------------+
| `|2| <#co-mpd-ex-pass>`__            | The password used to authenticate    |
|                                      | with your ISP.                       |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

The ``mpd.links`` file contains information about the link, or links, to
establish. An example ``mpd.links`` to accompany the above example is
given beneath:

.. code:: programlisting

    adsl:
        set link type pptp
        set pptp mode active
        set pptp enable originate outcall
        set pptp self 10.0.0.1 
        set pptp peer 10.0.0.138 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-mpd-ex-self>`__            | The IP address of FreeBSD computer   |
|                                      | running mpd.                         |
+--------------------------------------+--------------------------------------+
| `|2| <#co-mpd-ex-peer>`__            | The IP address of the ADSL modem.    |
|                                      | The Alcatel SpeedTouch™ Home         |
|                                      | defaults to ``10.0.0.138``.          |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

It is possible to initialize the connection easily by issuing the
following command as ``root``:

.. code:: screen

    # mpd -b adsl

To view the status of the connection:

.. code:: screen

    % ifconfig ng0
    ng0: flags=88d1<UP,POINTOPOINT,RUNNING,NOARP,SIMPLEX,MULTICAST> mtu 1500
         inet 216.136.204.117 --> 204.152.186.171 netmask 0xffffffff

Using mpd is the recommended way to connect to an ADSL service with
FreeBSD.

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

27.5.2.?Using pptpclient
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is also possible to use FreeBSD to connect to other PPPoA services
using
`net/pptpclient <http://www.freebsd.org/cgi/url.cgi?ports/net/pptpclient/pkg-descr>`__.

To use
`net/pptpclient <http://www.freebsd.org/cgi/url.cgi?ports/net/pptpclient/pkg-descr>`__
to connect to a DSL service, install the port or package, then edit
``/etc/ppp/ppp.conf``. An example section of ``ppp.conf`` is given
below. For further information on ``ppp.conf`` options consult
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__.

.. code:: programlisting

    adsl:
     set log phase chat lcp ipcp ccp tun command
     set timeout 0
     enable dns
     set authname username 
     set authkey password 
     set ifaddr 0 0
     add default HISADDR

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-pptp-ex-user>`__           | The username for the DSL provider.   |
+--------------------------------------+--------------------------------------+
| `|2| <#co-pptp-ex-pass>`__           | The password for your account.       |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Since the account's password is added to ``ppp.conf``\ in plain text
form, make sure nobody can read the contents of this file:

.. code:: screen

    # chown root:wheel /etc/ppp/ppp.conf
    # chmod 600 /etc/ppp/ppp.conf

.. raw:: html

   </div>

This will open a tunnel for a PPP session to the DSL router. Ethernet
DSL modems have a preconfigured LAN IP address to connect to. In the
case of the Alcatel SpeedTouch™ Home, this address is ``10.0.0.138``.
The router's documentation should list the address the device uses. To
open the tunnel and start a PPP session:

.. code:: screen

    # pptp address adsl

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

If an ampersand (“&”) is added to the end of this command, pptp will
return the prompt.

.. raw:: html

   </div>

A ``tun`` virtual tunnel device will be created for interaction between
the pptp and ppp processes. Once the prompt is returned, or the pptp
process has confirmed a connection, examine the tunnel:

.. code:: screen

    % ifconfig tun0
    tun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1500
            inet 216.136.204.21 --> 204.152.186.171 netmask 0xffffff00
        Opened by PID 918

If the connection fails, check the configuration of the router, which is
usually accessible using a web browser. Also, examine the output of
``pptp`` and the contents of the log file, ``/var/log/ppp.log`` for
clues.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+------------------------------+--------------------------------+
| `Prev <pppoe.html>`__?                   | `Up <ppp-and-slip.html>`__   | ?\ `Next <mail.html>`__        |
+------------------------------------------+------------------------------+--------------------------------+
| 27.4.?Using PPP over Ethernet (PPPoE)?   | `Home <index.html>`__        | ?Chapter?28.?Electronic Mail   |
+------------------------------------------+------------------------------+--------------------------------+

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
