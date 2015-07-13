=====================================
27.3.?Troubleshooting PPP Connections
=====================================

.. raw:: html

   <div class="navheader">

27.3.?Troubleshooting PPP Connections
`Prev <userppp.html>`__?
Chapter?27.?PPP
?\ `Next <pppoe.html>`__

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

27.3.?Troubleshooting PPP Connections
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section covers a few issues which may arise when using PPP over a
modem connection. Some ISPs present the ``ssword`` prompt while others
present ``password``. If the ``ppp`` script is not written accordingly,
the login attempt will fail. The most common way to debug ``ppp``
connections is by connecting manually as described in this section.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.3.1.?Check the Device Nodes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When using a custom kernel, make sure to include the following line in
the kernel configuration file:

.. code:: programlisting

    device   uart

The ``uart`` device is already included in the ``GENERIC`` kernel, so no
additional steps are necessary in this case. Just check the ``dmesg``
output for the modem device with:

.. code:: screen

    # dmesg | grep uart

This should display some pertinent output about the ``uart`` devices.
These are the COM ports we need. If the modem acts like a standard
serial port, it should be listed on ``uart1``, or ``COM2``. If so, a
kernel rebuild is not required. When matching up, if the modem is on
``uart1``, the modem device would be ``/dev/cuau1``.

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

27.3.2.?Connecting Manually
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Connecting to the Internet by manually controlling ``ppp`` is quick,
easy, and a great way to debug a connection or just get information on
how the ISP treats ``ppp`` client connections. Lets start PPP from the
command line. Note that in all of our examples we will use *example* as
the hostname of the machine running PPP. To start ``ppp``:

.. code:: screen

    # ppp

.. code:: screen

    ppp ON example> set device /dev/cuau1

This second command sets the modem device to ``cuau1``.

.. code:: screen

    ppp ON example> set speed 115200

This sets the connection speed to 115,200 kbps.

.. code:: screen

    ppp ON example> enable dns

This tells ``ppp`` to configure the resolver and add the nameserver
lines to ``/etc/resolv.conf``. If ``ppp`` cannot determine the hostname,
it can manually be set later.

.. code:: screen

    ppp ON example> term

This switches to “terminal” mode in order to manually control the modem.

.. code:: programlisting

    deflink: Entering terminal mode on /dev/cuau1
    type '~h' for help

.. code:: screen

    at
    OK
    atdt123456789

Use ``at`` to initialize the modem, then use ``atdt`` and the number for
the ISP to begin the dial in process.

.. code:: screen

    CONNECT

Confirmation of the connection, if we are going to have any connection
problems, unrelated to hardware, here is where we will attempt to
resolve them.

.. code:: screen

    ISP Login:myusername

At this prompt, return the prompt with the username that was provided by
the ISP.

.. code:: screen

    ISP Pass:mypassword

At this prompt, reply with the password that was provided by the ISP.
Just like logging into FreeBSD, the password will not echo.

.. code:: screen

    Shell or PPP:ppp

Depending on the ISP, this prompt might not appear. If it does, it is
asking whether to use a shell on the provider or to start ``ppp``. In
this example, ``ppp`` was selected in order to establish an Internet
connection.

.. code:: screen

    Ppp ON example>

Notice that in this example the first ``p`` has been capitalized. This
shows that we have successfully connected to the ISP.

.. code:: screen

    PPp ON example>

We have successfully authenticated with our ISP and are waiting for the
assigned IP address.

.. code:: screen

    PPP ON example>

We have made an agreement on an IP address and successfully completed
our connection.

.. code:: screen

    PPP ON example>add default HISADDR

Here we add our default route, we need to do this before we can talk to
the outside world as currently the only established connection is with
the peer. If this fails due to existing routes, put a bang character
``!`` in front of the ``add``. Alternatively, set this before making the
actual connection and it will negotiate a new route accordingly.

If everything went good we should now have an active connection to the
Internet, which could be thrown into the background using **CTRL**+**z**
If ``PPP`` returns to ``ppp`` then the connection has bee lost. This is
good to know because it shows the connection status. Capital P's
represent a connection to the ISP and lowercase p's show that the
connection has been lost.

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

27.3.3.?Debugging
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If a connection cannot be established, turn hardware flow CTS/RTS to off
using ``set         ctsrts off``. This is mainly the case when connected
to some PPP-capable terminal servers, where PPP hangs when it tries to
write data to the communication link, and waits for a Clear To Send
(CTS) signal which may never come. When using this option, include
``set accmap`` as it may be required to defeat hardware dependent on
passing certain characters from end to end, most of the time XON/XOFF.
Refer to
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__ for
more information on this option and how it is used.

An older modem may need ``set parity         even``. Parity is set at
none be default, but is used for error checkingm with a large increase
in traffic, on older modems.

PPP may not return to the command mode, which is usually a negotiation
error where the ISP is waiting for negotiating to begin. At this point,
using ``~p`` will force ppp to start sending the configuration
information.

If a login prompt never appears, PAP or CHAP authentication is most
likely required. To use PAP or CHAP, add the following options to PPP
before going into terminal mode:

.. code:: screen

    ppp ON example> set authname myusername

Where *``myusername``* should be replaced with the username that was
assigned by the ISP.

.. code:: screen

    ppp ON example> set authkey mypassword

Where *``mypassword``* should be replaced with the password that was
assigned by the ISP.

If a connection is established, but cannot seem to find any domain name,
try to
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__ an
IP address. If there is 100 percent (100%) packet loss, it is likely
that a default route was not assigned. Double check that
``add default         HISADDR`` was set during the connection. If a
connection can be made to a remote IP address, it is possible that a
resolver address has not been added to ``/etc/resolv.conf``. This file
should look like:

.. code:: programlisting

    domain example.com
    nameserver x.x.x.x
    nameserver y.y.y.y

Where *``x.x.x.x``* and *``y.y.y.y``* should be replaced with the IP
address of the ISP's DNS servers.

To configure
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__
to provide logging for the PPP connection, make sure this line exists in
``/etc/syslog.conf``:

.. code:: programlisting

    !ppp
    *.*     /var/log/ppp.log

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+------------------------------+------------------------------------------+
| `Prev <userppp.html>`__?   | `Up <ppp-and-slip.html>`__   | ?\ `Next <pppoe.html>`__                 |
+----------------------------+------------------------------+------------------------------------------+
| 27.2.?Configuring PPP?     | `Home <index.html>`__        | ?27.4.?Using PPP over Ethernet (PPPoE)   |
+----------------------------+------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
