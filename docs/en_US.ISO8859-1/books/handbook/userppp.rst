=====================
27.2.?Configuring PPP
=====================

.. raw:: html

   <div class="navheader">

27.2.?Configuring PPP
`Prev <ppp-and-slip.html>`__?
Chapter?27.?PPP
?\ `Next <ppp-troubleshoot.html>`__

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

27.2.?Configuring PPP
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides built-in support for managing dial-up PPP connections
using
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__. The
default FreeBSD kernel provides support for ``tun`` which is used to
interact with a modem hardware. Configuration is performed by editing at
least one configuration file, and configuration files containing
examples are provided. Finally, ``ppp`` is used to start and manage
connections.

In order to use a PPP connection, the following items are needed:

.. raw:: html

   <div class="itemizedlist">

-  A dial-up account with an Internet Service Provider (ISP).

-  A dial-up modem.

-  The dial-up number for the ISP.

-  The login name and password assigned by the ISP.

-  The IP address of one or more DNS servers. Normally, the ISP provides
   these addresses. If it did not, FreeBSD can be configured to use DNS
   negotiation.

.. raw:: html

   </div>

If any of the required information is missing, contact the ISP.

The following information may be supplied by the ISP, but is not
necessary:

.. raw:: html

   <div class="itemizedlist">

-  The IP address of the default gateway. If this information is
   unknown, the ISP will automatically provide the correct value during
   connection setup. When configuring PPP on FreeBSD, this address is
   referred to as ``HISADDR``.

-  The subnet mask. If the ISP has not provided one, ``255.255.255.255``
   will be used in the
   `ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
   configuration file.

-  

   If the ISP has assigned a static IP address and hostname, it should
   be input into the configuration file. Otherwise, this information
   will be automatically provided during connection setup.

.. raw:: html

   </div>

The rest of this section demonstrates how to configure FreeBSD for
common PPP connection scenarios. The required configuration file is
``/etc/ppp/ppp.conf`` and additional files and examples are available in
``/usr/share/examples/ppp/``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Throughout this section, many of the file examples display line numbers.
These line numbers have been added to make it easier to follow the
discussion and are not meant to be placed in the actual file.

When editing a configuration file, proper indentation is important.
Lines that end in a ``:`` start in the first column (beginning of the
line) while all other lines should be indented as shown using spaces or
tabs.

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

27.2.1.?Basic Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to configure a PPP connection, first edit ``/etc/ppp/ppp.conf``
with the dial-in information for the ISP. This file is described as
follows:

.. code:: programlisting

    1     default:
    2       set log Phase Chat LCP IPCP CCP tun command
    3       ident user-ppp VERSION
    4       set device /dev/cuau0
    5       set speed 115200
    6       set dial "ABORT BUSY ABORT NO\\sCARRIER TIMEOUT 5 \
    7                 \"\" AT OK-AT-OK ATE1Q0 OK \\dATDT\\T TIMEOUT 40 CONNECT"
    8       set timeout 180
    9       enable dns
    10
    11    provider:
    12      set phone "(123) 456 7890"
    13      set authname foo
    14      set authkey bar
    15      set timeout 300
    16      set ifaddr x.x.x.x/0 y.y.y.y/0 255.255.255.255 0.0.0.0
    17      add default HISADDR

.. raw:: html

   <div class="variablelist">

Line 1:
    Identifies the ``default`` entry. Commands in this entry (lines 2
    through 9) are executed automatically when ``ppp`` is run.

Line 2:
    Enables verbose logging parameters for testing the connection. Once
    the configuration is working satisfactorily, this line should be
    reduced to:

    .. code:: programlisting

        set log phase tun

Line 3:
    Displays the version of
    `ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
    to the PPP software running on the other side of the connection.

Line 4:
    Identifies the device to which the modem is connected, where
    ``COM1`` is ``/dev/cuau0`` and ``COM2`` is ``/dev/cuau1``.

Line 5:
    Sets the connection speed. If ``115200`` does not work on an older
    modem, try ``38400`` instead.

Lines 6 & 7:
    The dial string written as an expect-send syntax. Refer to
    `chat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chat&sektion=8>`__
    for more information.

    Note that this command continues onto the next line for readability.
    Any command in ``ppp.conf`` may do this if the last character on the
    line is ``\``.

Line 8:
    Sets the idle timeout for the link in seconds.

Line 9:
    Instructs the peer to confirm the DNS settings. If the local network
    is running its own DNS server, this line should be commented out, by
    adding a ``#`` at the beginning of the line, or removed.

Line 10:
    A blank line for readability. Blank lines are ignored by
    `ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__.

Line 11:
    Identifies an entry called ``provider``. This could be changed to
    the name of the ISP so that ``load             ISP`` can be used to
    start the connection.

Line 12:
    Use the phone number for the ISP. Multiple phone numbers may be
    specified using the colon (``:``) or pipe character (``|``) as a
    separator. To rotate through the numbers, use a colon. To always
    attempt to dial the first number first and only use the other
    numbers if the first number fails, use the pipe character. Always
    enclose the entire set of phone numbers between quotation marks
    (``"``) to prevent dialing failures.

Lines 13 & 14:
    Use the user name and password for the ISP.

Line 15:
    Sets the default idle timeout in seconds for the connection. In this
    example, the connection will be closed automatically after 300
    seconds of inactivity. To prevent a timeout, set this value to zero.

Line 16:
    Sets the interface addresses. The values used depend upon whether a
    static IP address has been obtained from the ISP or if it instead
    negotiates a dynamic IP address during connection.

    If the ISP has allocated a static IP address and default gateway,
    replace *``x.x.x.x``* with the static IP address and replace
    *``y.y.y.y``* with the IP address of the default gateway. If the ISP
    has only provided a static IP address without a gateway address,
    replace *``y.y.y.y``* with ``10.0.0.2/0``.

    If the IP address changes whenever a connection is made, change this
    line to the following value. This tells
    `ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
    to use the IP Configuration Protocol (IPCP) to negotiate a dynamic
    IP address:

    .. code:: programlisting

        set ifaddr 10.0.0.1/0 10.0.0.2/0 255.255.255.255 0.0.0.0

Line 17:
    Keep this line as-is as it adds a default route to the gateway. The
    ``HISADDR`` will automatically be replaced with the gateway address
    specified on line 16. It is important that this line appears after
    line 16.

.. raw:: html

   </div>

Depending upon whether
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__ is
started manually or automatically, a ``/etc/ppp/ppp.linkup`` may also
need to be created which contains the following lines. This file is
required when running ``ppp`` in ``-auto`` mode. This file is used after
the connection has been established. At this point, the IP address will
have been assigned and it is now be possible to add the routing table
entries. When creating this file, make sure that *``provider``* matches
the value demonstrated in line 11 of ``ppp.conf``.

.. code:: programlisting

    provider:
          add default HISADDR

This file is also needed when the default gateway address is “guessed”
in a static IP address configuration. In this case, remove line 17 from
``ppp.conf`` and create ``/etc/ppp/ppp.linkup`` with the above two
lines. More examples for this file can be found in
``/usr/share/examples/ppp/``.

By default, the ``ppp`` command must be run as the ``root`` user. To
change this default, add the account of the user who should run ``ppp``
to the ``network`` group in ``/etc/group``.

Then, give the user access to one or more entries in
``/etc/ppp/ppp.conf`` using the ``allow`` command. For example, to give
``fred`` and ``mary`` permission to only the ``provider:`` entry, add
this line to the ``provider:`` section:

.. code:: programlisting

    allow users fred mary

To give the specified users access to all entries, put that line in the
``default`` section instead.

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

27.2.2.?Advanced Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is possible to configure PPP to supply DNS and NetBIOS nameserver
addresses on demand.

To enable these extensions with PPP version 1.x, the following lines
might be added to the relevant section of ``/etc/ppp/ppp.conf``.

.. code:: programlisting

    enable msext
    set ns 203.14.100.1 203.14.100.2
    set nbns 203.14.100.5

And for PPP version 2 and above:

.. code:: programlisting

    accept dns
    set dns 203.14.100.1 203.14.100.2
    set nbns 203.14.100.5

This will tell the clients the primary and secondary name server
addresses, and a NetBIOS nameserver host.

In version 2 and above, if the ``set           dns`` line is omitted,
PPP will use the values found in ``/etc/resolv.conf``.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

27.2.2.1.?PAP and CHAP Authentication
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some ISPs set their system up so that the authentication part of the
connection is done using either of the PAP or CHAP authentication
mechanisms. If this is the case, the ISP will not give a ``login:``
prompt at connection, but will start talking PPP immediately.

PAP is less secure than CHAP, but security is not normally an issue here
as passwords, although being sent as plain text with PAP, are being
transmitted down a serial line only. There is not much room for crackers
to “eavesdrop”.

The following alterations must be made:

.. code:: programlisting

    13      set authname MyUserName
    14      set authkey MyPassword
    15      set login

.. raw:: html

   <div class="variablelist">

Line 13:
    This line specifies the PAP/CHAP user name. Insert the correct value
    for *``MyUserName``*.

Line 14:
    This line specifies the PAP/CHAP password. Insert the correct value
    for *``MyPassword``*. You may want to add an additional line, such
    as:

    .. code:: programlisting

        16      accept PAP

    or

    .. code:: programlisting

        16      accept CHAP

    to make it obvious that this is the intention, but PAP and CHAP are
    both accepted by default.

Line 15:
    The ISP will not normally require a login to the server when using
    PAP or CHAP. Therefore, disable the “set login” string.

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

27.2.2.2.?Using PPP Network Address Translation Capability
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PPP has ability to use internal NAT without kernel diverting
capabilities. This functionality may be enabled by the following line in
``/etc/ppp/ppp.conf``:

.. code:: programlisting

    nat enable yes

Alternatively, NAT may be enabled by command-line option ``-nat``. There
is also ``/etc/rc.conf`` knob named ``ppp_nat``, which is enabled by
default.

When using this feature, it may be useful to include the following
``/etc/ppp/ppp.conf`` options to enable incoming connections forwarding:

.. code:: programlisting

    nat port tcp 10.0.0.2:ftp ftp
    nat port tcp 10.0.0.2:http http

or do not trust the outside at all

.. code:: programlisting

    nat deny_incoming yes

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

27.2.3.?Final System Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While ``ppp`` is now configured, some edits still need to be made to
``/etc/rc.conf``.

Working from the top down in this file, make sure the ``hostname=`` line
is set:

.. code:: programlisting

    hostname="foo.example.com"

If the ISP has supplied a static IP address and name, use this name as
the host name.

Look for the ``network_interfaces`` variable. To configure the system to
dial the ISP on demand, make sure the ``tun0`` device is added to the
list, otherwise remove it.

.. code:: programlisting

    network_interfaces="lo0 tun0"
    ifconfig_tun0=

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The ``ifconfig_tun0`` variable should be empty, and a file called
``/etc/start_if.tun0`` should be created. This file should contain the
line:

.. code:: programlisting

    ppp -auto mysystem

This script is executed at network configuration time, starting the ppp
daemon in automatic mode. If this machine acts as a gateway, consider
including ``-alias``. Refer to the manual page for further details.

.. raw:: html

   </div>

Make sure that the router program is set to ``NO`` with the following
line in ``/etc/rc.conf``:

.. code:: programlisting

    router_enable="NO"

It is important that the ``routed`` daemon is not started, as ``routed``
tends to delete the default routing table entries created by ``ppp``.

It is probably a good idea to ensure that the ``sendmail_flags`` line
does not include the ``-q`` option, otherwise ``sendmail`` will attempt
to do a network lookup every now and then, possibly causing your machine
to dial out. You may try:

.. code:: programlisting

    sendmail_flags="-bd"

The downside is that ``sendmail`` is forced to re-examine the mail queue
whenever the ppp link. To automate this, include ``!bg`` in
``ppp.linkup``:

.. code:: programlisting

    1     provider:
    2       delete ALL
    3       add 0 0 HISADDR
    4       !bg sendmail -bd -q30m

An alternative is to set up a “dfilter” to block SMTP traffic. Refer to
the sample files for further details.

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

27.2.4.?Using ``ppp``
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All that is left is to reboot the machine. After rebooting, either type:

.. code:: screen

    # ppp

and then ``dial provider`` to start the PPP session, or, to configure
``ppp`` to establish sessions automatically when there is outbound
traffic and ``start_if.tun0`` does not exist, type:

.. code:: screen

    # ppp -auto provider

It is possible to talk to the ``ppp`` program while it is running in the
background, but only if a suitable diagnostic port has been set up. To
do this, add the following line to the configuration:

.. code:: programlisting

    set server /var/run/ppp-tun%d DiagnosticPassword 0177

This will tell PPP to listen to the specified UNIX? domain socket,
asking clients for the specified password before allowing access. The
``%d`` in the name is replaced with the ``tun`` device number that is in
use.

Once a socket has been set up, the
`pppctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppctl&sektion=8>`__
program may be used in scripts that wish to manipulate the running
program.

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

27.2.5.?Configuring Dial-in Services
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`Section?26.4, “Dial-in Service” <dialup.html>`__ provides a good
description on enabling dial-up services using
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__.

An alternative to ``getty`` is
`comms/mgetty+sendfax <http://www.freebsd.org/cgi/url.cgi?ports/comms/mgetty+sendfax/pkg-descr>`__
port), a smarter version of ``getty`` designed with dial-up lines in
mind.

The advantages of using ``mgetty`` is that it actively *talks* to
modems, meaning if port is turned off in ``/etc/ttys`` then the modem
will not answer the phone.

Later versions of ``mgetty`` (from 0.99beta onwards) also support the
automatic detection of PPP streams, allowing clients scriptless access
to the server.

Refer to http://mgetty.greenie.net/doc/mgetty_toc.html for more
information on ``mgetty``.

By default the
`comms/mgetty+sendfax <http://www.freebsd.org/cgi/url.cgi?ports/comms/mgetty+sendfax/pkg-descr>`__
port comes with the ``AUTO_PPP`` option enabled allowing ``mgetty`` to
detect the LCP phase of PPP connections and automatically spawn off a
ppp shell. However, since the default login/password sequence does not
occur it is necessary to authenticate users using either PAP or CHAP.

This section assumes the user has successfully compiled, and installed
the
`comms/mgetty+sendfax <http://www.freebsd.org/cgi/url.cgi?ports/comms/mgetty+sendfax/pkg-descr>`__
port on his system.

Ensure that ``/usr/local/etc/mgetty+sendfax/login.config`` has the
following:

.. code:: programlisting

    /AutoPPP/ -     - /etc/ppp/ppp-pap-dialup

This tells ``mgetty`` to run ``ppp-pap-dialup`` for detected PPP
connections.

Create an executable file called ``/etc/ppp/ppp-pap-dialup`` containing
the following:

.. code:: programlisting

    #!/bin/sh
    exec /usr/sbin/ppp -direct pap$IDENT

For each dial-up line enabled in ``/etc/ttys``, create a corresponding
entry in ``/etc/ppp/ppp.conf``. This will happily co-exist with the
definitions we created above.

.. code:: programlisting

    pap:
      enable pap
      set ifaddr 203.14.100.1 203.14.100.20-203.14.100.40
      enable proxy

Each user logging in with this method will need to have a
username/password in ``/etc/ppp/ppp.secret`` file, or alternatively add
the following option to authenticate users via PAP from the
``/etc/passwd`` file.

.. code:: programlisting

    enable passwdauth

To assign some users a static IP number, specify the number as the third
argument in ``/etc/ppp/ppp.secret``. See
``/usr/share/examples/ppp/ppp.secret.sample`` for examples.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+------------------------------+------------------------------------------+
| `Prev <ppp-and-slip.html>`__?   | `Up <ppp-and-slip.html>`__   | ?\ `Next <ppp-troubleshoot.html>`__      |
+---------------------------------+------------------------------+------------------------------------------+
| Chapter?27.?PPP?                | `Home <index.html>`__        | ?27.3.?Troubleshooting PPP Connections   |
+---------------------------------+------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
