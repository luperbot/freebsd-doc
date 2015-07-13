=================
14.4.?TCP Wrapper
=================

.. raw:: html

   <div class="navheader">

14.4.?TCP Wrapper
`Prev <one-time-passwords.html>`__?
Chapter?14.?Security
?\ `Next <kerberos5.html>`__

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

14.4.?TCP Wrapper
-----------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

TCP Wrapper is a host-based access control system which extends the
abilities of `Section?29.2, “The inetd
Super-Server” <network-inetd.html>`__. It can be configured to provide
logging support, return messages, and connection restrictions for the
server daemons under the control of inetd. Refer to
`tcpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpd&sektion=8>`__
for more information about TCP Wrapper and its features.

TCP Wrapper should not be considered a replacement for a properly
configured firewall. Instead, TCP Wrapper should be used in conjunction
with a firewall and other security enhancements in order to provide
another layer of protection in the implementation of a security policy.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.4.1.?Initial Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To enable TCP Wrapper in FreeBSD, add the following lines to
``/etc/rc.conf``:

.. code:: programlisting

    inetd_enable="YES"
    inetd_flags="-Ww"

Then, properly configure ``/etc/hosts.allow``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Unlike other implementations of TCP Wrapper, the use of ``hosts.deny``
is deprecated in FreeBSD. All configuration options should be placed in
``/etc/hosts.allow``.

.. raw:: html

   </div>

In the simplest configuration, daemon connection policies are set to
either permit or block, depending on the options in
``/etc/hosts.allow``. The default configuration in FreeBSD is to allow
all connections to the daemons started with inetd.

Basic configuration usually takes the form of
``daemon : address : action``, where ``daemon`` is the daemon which
inetd started, ``address`` is a valid hostname, IP address, or an IPv6
address enclosed in brackets ([?]), and ``action`` is either ``allow``
or ``deny``. TCP Wrapper uses a first rule match semantic, meaning that
the configuration file is scanned from the beginning for a matching
rule. When a match is found, the rule is applied and the search process
stops.

For example, to allow POP3 connections via the
`mail/qpopper <http://www.freebsd.org/cgi/url.cgi?ports/mail/qpopper/pkg-descr>`__
daemon, the following lines should be appended to ``hosts.allow``:

.. code:: programlisting

    # This line is required for POP3 connections:
    qpopper : ALL : allow

Whenever this file is edited, restart inetd:

.. code:: screen

    # service inetd restart

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

14.4.2.?Advanced Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

TCP Wrapper provides advanced options to allow more control over the way
connections are handled. In some cases, it may be appropriate to return
a comment to certain hosts or daemon connections. In other cases, a log
entry should be recorded or an email sent to the administrator. Other
situations may require the use of a service for local connections only.
This is all possible through the use of configuration options known as
wildcards, expansion characters, and external command execution.

Suppose that a situation occurs where a connection should be denied yet
a reason should be sent to the host who attempted to establish that
connection. That action is possible with ``twist``. When a connection
attempt is made, ``twist`` executes a shell command or script. An
example exists in ``hosts.allow``:

.. code:: programlisting

    # The rest of the daemons are protected.
    ALL : ALL \
        : severity auth.info \
        : twist /bin/echo "You are not welcome to use %d from %h."

In this example, the message “You are not allowed to use
*``daemon name``* from *``hostname``*.” will be returned for any daemon
not configured in ``hosts.allow``. This is useful for sending a reply
back to the connection initiator right after the established connection
is dropped. Any message returned *must* be wrapped in quote (``"``)
characters.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

It may be possible to launch a denial of service attack on the server if
an attacker floods these daemons with connection requests.

.. raw:: html

   </div>

Another possibility is to use ``spawn``. Like ``twist``, ``spawn``
implicitly denies the connection and may be used to run external shell
commands or scripts. Unlike ``twist``, ``spawn`` will not send a reply
back to the host who established the connection. For example, consider
the following configuration:

.. code:: programlisting

    # We do not allow connections from example.com:
    ALL : .example.com \
        : spawn (/bin/echo %a from %h attempted to access %d >> \
          /var/log/connections.log) \
        : deny

This will deny all connection attempts from ``*.example.com`` and log
the hostname, IP address, and the daemon to which access was attempted
to ``/var/log/connections.log``. This example uses the substitution
characters ``%a`` and ``%h``. Refer to
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__
for the complete list.

To match every instance of a daemon, domain, or IP address, use ``ALL``.
Another wildcard is ``PARANOID`` which may be used to match any host
which provides an IP address that may be forged because the IP address
differs from its resolved hostname. In this example, all connection
requests to Sendmail which have an IP address that varies from its
hostname will be denied:

.. code:: programlisting

    # Block possibly spoofed requests to sendmail:
    sendmail : PARANOID : deny

.. raw:: html

   <div class="caution" xmlns="">

Caution:
~~~~~~~~

Using the ``PARANOID`` wildcard will result in denied connections if the
client or server has a broken DNS setup.

.. raw:: html

   </div>

To learn more about wildcards and their associated functionality, refer
to
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When adding new configuration lines, make sure that any unneeded entries
for that daemon are commented out in ``hosts.allow``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------+--------------------------------+
| `Prev <one-time-passwords.html>`__?   | `Up <security.html>`__   | ?\ `Next <kerberos5.html>`__   |
+---------------------------------------+--------------------------+--------------------------------+
| 14.3.?One-time Passwords?             | `Home <index.html>`__    | ?14.5.?Kerberos                |
+---------------------------------------+--------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
