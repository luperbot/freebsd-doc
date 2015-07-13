==================================
28.3.?Sendmail Configuration Files
==================================

.. raw:: html

   <div class="navheader">

28.3.?Sendmail Configuration Files
`Prev <mail-using.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <mail-changingmta.html>`__

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

28.3.?Sendmail Configuration Files
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Christopher Shumway.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sendmail is the default MTA installed with FreeBSD. It accepts mail from
MUAs and delivers it to the appropriate mail host, as defined by its
configuration. Sendmail can also accept network connections and deliver
mail to local mailboxes or to another program.

The configuration files for Sendmail are located in ``/etc/mail``. This
section describes these files in more detail.

.. raw:: html

   <div class="variablelist">

``/etc/mail/access``
    This access database file defines which hosts or IP addresses have
    access to the local mail server and what kind of access they have.
    Hosts listed as ``OK``, which is the default option, are allowed to
    send mail to this host as long as the mail's final destination is
    the local machine. Hosts listed as ``REJECT`` are rejected for all
    mail connections. Hosts listed as ``RELAY`` are allowed to send mail
    for any destination using this mail server. Hosts listed as
    ``ERROR`` will have their mail returned with the specified mail
    error. If a host is listed as ``SKIP``, Sendmail will abort the
    current search for this entry without accepting or rejecting the
    mail. Hosts listed as ``QUARANTINE`` will have their messages held
    and will receive the specified text as the reason for the hold.

    Examples of using these options for both IPv4 and IPv6 addresses can
    be found in the FreeBSD sample configuration,
    ``/etc/mail/access.sample``:

    .. code:: programlisting

        # $FreeBSD$
        #
        # Mail relay access control list.  Default is to reject mail unless the
        # destination is local, or listed in /etc/mail/local-host-names
        #
        ## Examples (commented out for safety)
        #From:cyberspammer.com          ERROR:"550 We don't accept mail from spammers"
        #From:okay.cyberspammer.com     OK
        #Connect:sendmail.org           RELAY
        #To:sendmail.org                RELAY
        #Connect:128.32                 RELAY
        #Connect:128.32.2               SKIP
        #Connect:IPv6:1:2:3:4:5:6:7     RELAY
        #Connect:suspicious.example.com QUARANTINE:Mail from suspicious host
        #Connect:[127.0.0.3]            OK
        #Connect:[IPv6:1:2:3:4:5:6:7:8] OK

    To configure the access database, use the format shown in the sample
    to make entries in ``/etc/mail/access``, but do not put a comment
    symbol (``#``) in front of the entries. Create an entry for each
    host or network whose access should be configured. Mail senders that
    match the left side of the table are affected by the action on the
    right side of the table.

    Whenever this file is updated, update its database and restart
    Sendmail:

    .. code:: screen

        # makemap hash /etc/mail/access < /etc/mail/access
        # service sendmail restart

``/etc/mail/aliases``
    This database file contains a list of virtual mailboxes that are
    expanded to users, files, programs, or other aliases. Here are a few
    entries to illustrate the file format:

    .. code:: programlisting

        root: localuser
        ftp-bugs: joe,eric,paul
        bit.bucket:  /dev/null
        procmail: "|/usr/local/bin/procmail"

    The mailbox name on the left side of the colon is expanded to the
    target(s) on the right. The first entry expands the ``root`` mailbox
    to the ``localuser`` mailbox, which is then looked up in the
    ``/etc/mail/aliases`` database. If no match is found, the message is
    delivered to ``localuser``. The second entry shows a mail list. Mail
    to ``ftp-bugs`` is expanded to the three local mailboxes ``joe``,
    ``eric``, and ``paul``. A remote mailbox could be specified as
    *``user@example.com``*. The third entry shows how to write mail to a
    file, in this case ``/dev/null``. The last entry demonstrates how to
    send mail to a program, ``/usr/local/bin/procmail``, through a UNIX?
    pipe. Refer to
    `aliases(5) <http://www.FreeBSD.org/cgi/man.cgi?query=aliases&sektion=5>`__
    for more information about the format of this file.

    Whenever this file is updated, run ``newaliases`` to update and
    initialize the aliases database.

``/etc/mail/sendmail.cf``
    This is the master configuration file for Sendmail. It controls the
    overall behavior of Sendmail, including everything from rewriting
    email addresses to printing rejection messages to remote mail
    servers. Accordingly, this configuration file is quite complex.
    Fortunately, this file rarely needs to be changed for standard mail
    servers.

    The master Sendmail configuration file can be built from
    `m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1>`__
    macros that define the features and behavior of Sendmail. Refer to
    ``/usr/src/contrib/sendmail/cf/README`` for some of the details.

    Whenever changes to this file are made, Sendmail needs to be
    restarted for the changes to take effect.

``/etc/mail/virtusertable``
    This database file maps mail addresses for virtual domains and users
    to real mailboxes. These mailboxes can be local, remote, aliases
    defined in ``/etc/mail/aliases``, or files. This allows multiple
    virtual domains to be hosted on one machine.

    FreeBSD provides a sample configuration file in
    ``/etc/mail/virtusertable.sample`` to further demonstrate its
    format. The following example demonstrates how to create custom
    entries using that format:

    .. code:: programlisting

        root@example.com                root
        postmaster@example.com          postmaster@noc.example.net
        @example.com                    joe

    This file is processed in a first match order. When an email address
    matches the address on the left, it is mapped to the local mailbox
    listed on the right. The format of the first entry in this example
    maps a specific email address to a local mailbox, whereas the format
    of the second entry maps a specific email address to a remote
    mailbox. Finally, any email address from ``example.com`` which has
    not matched any of the previous entries will match the last mapping
    and be sent to the local mailbox ``joe``. When creating custom
    entries, use this format and add them to
    ``/etc/mail/virtusertable``. Whenever this file is edited, update
    its database and restart Sendmail:

    .. code:: screen

        # makemap hash /etc/mail/virtusertable < /etc/mail/virtusertable
        # service sendmail restart

``/etc/mail/relay-domains``
    In a default FreeBSD installation, Sendmail is configured to only
    send mail from the host it is running on. For example, if a POP
    server is available, users will be able to check mail from remote
    locations but they will not be able to send outgoing emails from
    outside locations. Typically, a few moments after the attempt, an
    email will be sent from ``MAILER-DAEMON`` with a 5.7 Relaying Denied
    message.

    The most straightforward solution is to add the ISP's FQDN to
    ``/etc/mail/relay-domains``. If multiple addresses are needed, add
    them one per line:

    .. code:: programlisting

        your.isp.example.com
        other.isp.example.net
        users-isp.example.org
        www.example.org

    After creating or editing this file, restart Sendmail with
    ``service sendmail restart``.

    Now any mail sent through the system by any host in this list,
    provided the user has an account on the system, will succeed. This
    allows users to send mail from the system remotely without opening
    the system up to relaying SPAM from the Internet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+-------------------------------------------+
| `Prev <mail-using.html>`__?   | `Up <mail.html>`__      | ?\ `Next <mail-changingmta.html>`__       |
+-------------------------------+-------------------------+-------------------------------------------+
| 28.2.?Mail Components?        | `Home <index.html>`__   | ?28.4.?Changing the Mail Transfer Agent   |
+-------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
