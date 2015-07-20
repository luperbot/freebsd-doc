==================
15.6. TCP Wrappers
==================

.. raw:: html

   <div class="navheader">

15.6. TCP Wrappers
`????? <one-time-passwords.html>`__?
???????? 15. ????????
?\ `??????? <kerberosIV.html>`__

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

15.6. TCP Wrappers
------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by: Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Anyone familiar with
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
has probably heard of TCP Wrappers at some point. But few individuals
seem to fully comprehend its usefulness in a network environment. It
seems that everyone wants to install a firewall to handle network
connections. While a firewall has a wide variety of uses, there are some
things that a firewall not handle such as sending text back to the
connection originator. The TCP software does this and much more. In the
next few sections many of the TCP Wrappers features will be discussed,
and, when applicable, example configuration lines will be provided.

The TCP Wrappers software extends the abilities of ``inetd`` to provide
support for every server daemon under its control. Using this method it
is possible to provide logging support, return messages to connections,
permit a daemon to only accept internal connections, etc. While some of
these features can be provided by implementing a firewall, this will add
not only an extra layer of protection but go beyond the amount of
control a firewall can provide.

The added functionality of TCP Wrappers should not be considered a
replacement for a good firewall. TCP Wrappers can be used in conjunction
with a firewall or other security enhancements though and it can serve
nicely as an extra layer of protection for the system.

Since this is an extension to the configuration of ``inetd``, the reader
is expected have read the `inetd configuration <network-inetd.html>`__
section.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

While programs run by
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
are not exactly ?daemons?, they have traditionally been called daemons.
This is the term we will use in this section too.

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

15.6.1. Initial Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The only requirement of using TCP Wrappers in FreeBSD is to ensure the
``inetd`` server is started from ``rc.conf`` with the ``-Ww`` option;
this is the default setting. Of course, proper configuration of
``/etc/hosts.allow`` is also expected, but
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
will throw messages in the system logs in these cases.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Unlike other implementations of TCP Wrappers, the use of ``hosts.deny``
has been deprecated. All configuration options should be placed in
``/etc/hosts.allow``.

.. raw:: html

   </div>

In the simplest configuration, daemon connection policies are set to
either be permitted or blocked depending on the options in
``/etc/hosts.allow``. The default configuration in FreeBSD is to allow a
connection to every daemon started with ``inetd``. Changing this will be
discussed only after the basic configuration is covered.

Basic configuration usually takes the form of
``daemon : address : action``. Where ``daemon`` is the daemon name which
``inetd`` started. The ``address`` can be a valid hostname, an IP
address or an IPv6 address enclosed in brackets ([?]). The action field
can be either allow or deny to grant or deny access appropriately. Keep
in mind that configuration works off a first rule match semantic,
meaning that the configuration file is scanned in ascending order for a
matching rule. When a match is found the rule is applied and the search
process will halt.

Several other options exist but they will be explained in a later
section. A simple configuration line may easily be constructed from that
information alone. For example, to allow POP3 connections via the
`mail/qpopper <http://www.freebsd.org/cgi/url.cgi?ports/mail/qpopper/pkg-descr>`__
daemon, the following lines should be appended to ``hosts.allow``:

.. code:: programlisting

    # This line is required for POP3 connections:
    qpopper : ALL : allow

After adding this line, ``inetd`` will need restarted. This can be
accomplished by use of the
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
command, or with the *``restart``* parameter with ``/etc/rc.d/inetd``.

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

15.6.2. Advanced Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

TCP Wrappers has advanced options too; they will allow for more control
over the way connections are handled. In some cases it may be a good
idea to return a comment to certain hosts or daemon connections. In
other cases, perhaps a log file should be recorded or an email sent to
the administrator. Other situations may require the use of a service for
local connections only. This is all possible through the use of
configuration options known as ``wildcards``, expansion characters and
external command execution. The next two sections are written to cover
these situations.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.6.2.1. External Commands
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Suppose that a situation occurs where a connection should be denied yet
a reason should be sent to the individual who attempted to establish
that connection. How could it be done? That action can be made possible
by using the ``twist`` option. When a connection attempt is made,
``twist`` will be called to execute a shell command or script. An
example already exists in the ``hosts.allow`` file:

.. code:: programlisting

    # The rest of the daemons are protected.
    ALL : ALL \
            : severity auth.info \
            : twist /bin/echo "You are not welcome to use %d from %h."

This example shows that the message, ?You are not allowed to use
``daemon`` from ``hostname``.? will be returned for any daemon not
previously configured in the access file. This is extremely useful for
sending a reply back to the connection initiator right after the
established connection is dropped. Note that any message returned *must*
be wrapped in quote ``"`` characters; there are no exceptions to this
rule.

.. raw:: html

   <div class="warning" xmlns="">

?????????????:
~~~~~~~~~~~~~~

It may be possible to launch a denial of service attack on the server if
an attacker, or group of attackers could flood these daemons with
connection requests.

.. raw:: html

   </div>

Another possibility is to use the ``spawn`` option in these cases. Like
``twist``, the ``spawn`` implicitly denies the connection and may be
used to run external shell commands or scripts. Unlike ``twist``,
``spawn`` will not send a reply back to the individual who established
the connection. For an example, consider the following configuration
line:

.. code:: programlisting

    # We do not allow connections from example.com:
    ALL : .example.com \
        : spawn (/bin/echo %a from %h attempted to access %d >> \
          /var/log/connections.log) \
        : deny

This will deny all connection attempts from the ``*.example.com``
domain; simultaneously logging the hostname, IP address and the daemon
which they attempted to access in the ``/var/log/connections.log`` file.

Aside from the already explained substitution characters above, e.g. %a,
a few others exist. See the
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__
manual page for the complete list.

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

15.6.2.2. Wildcard Options
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Thus far the ``ALL`` example has been used continuously throughout the
examples. Other options exist which could extend the functionality a bit
further. For instance, ``ALL`` may be used to match every instance of
either a daemon, domain or an IP address. Another wildcard available is
``PARANOID`` which may be used to match any host which provides an IP
address that may be forged. In other words, ``paranoid`` may be used to
define an action to be taken whenever a connection is made from an IP
address that differs from its hostname. The following example may shed
some more light on this discussion:

.. code:: programlisting

    # Block possibly spoofed requests to sendmail:
    sendmail : PARANOID : deny

In that example all connection requests to ``sendmail`` which have an IP
address that varies from its hostname will be denied.

.. raw:: html

   <div class="caution" xmlns="">

???????:
~~~~~~~~

Using the ``PARANOID`` may severely cripple servers if the client or
server has a broken DNS setup. Administrator discretion is advised.

.. raw:: html

   </div>

To learn more about wildcards and their associated functionality, see
the
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__
manual page.

Before any of the specific configuration lines above will work, the
first configuration line should be commented out in ``hosts.allow``.
This was noted at the beginning of this section.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------+------------------------------------+
| `????? <one-time-passwords.html>`__?   | `???? <security.html>`__   | ?\ `??????? <kerberosIV.html>`__   |
+----------------------------------------+----------------------------+------------------------------------+
| 15.5. One-time Passwords?              | `???? <index.html>`__      | ?15.7. KerberosIV                  |
+----------------------------------------+----------------------------+------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
