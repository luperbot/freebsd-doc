=====================
28.2.?Mail Components
=====================

.. raw:: html

   <div class="navheader">

28.2.?Mail Components
`Prev <mail.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <sendmail.html>`__

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

28.2.?Mail Components
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are five major parts involved in an email exchange: the Mail User
Agent (MUA), the Mail Transfer Agent (MTA), a mail host, a remote or
local mailbox, and DNS. This section provides an overview of these
components.

.. raw:: html

   <div class="variablelist">

Mail User Agent (MUA)
    The Mail User Agent (MUA) is an application which is used to
    compose, send, and receive emails. This application can be a command
    line program, such as the built-in ``mail`` utility or a third-party
    application from the Ports Collection, such as mutt, alpine, or elm.
    Dozens of graphical programs are also available in the Ports
    Collection, including Claws Mail, Evolution, and Thunderbird. Some
    organizations provide a web mail program which can be accessed
    through a web browser. More information about installing and using a
    MUA on FreeBSD can be found in `Section?28.10, “Mail User
    Agents” <mail-agents.html>`__.

Mail Transfer Agent (MTA)
    The Mail Transfer Agent (MTA) is responsible for receiving incoming
    mail and delivering outgoing mail. FreeBSD ships with Sendmail as
    the default MTA, but it also supports numerous other mail server
    daemons, including Exim, Postfix, and qmail. Sendmail configuration
    is described in `Section?28.3, “Sendmail Configuration
    Files” <sendmail.html>`__. If another MTA is installed using the
    Ports Collection, refer to its post-installation message for
    FreeBSD-specific configuration details and the application's website
    for more general configuration instructions.

Mail Host and Mailboxes
    The mail host is a server that is responsible for delivering and
    receiving mail for a host or a network. The mail host collects all
    mail sent to the domain and stores it either in the default ``mbox``
    or the alternative Maildir format, depending on the configuration.
    Once mail has been stored, it may either be read locally using a MUA
    or remotely accessed and collected using protocols such as POP or
    IMAP. If mail is read locally, a POP or IMAP server does not need to
    be installed.

    To access mailboxes remotely, a POP or IMAP server is required as
    these protocols allow users to connect to their mailboxes from
    remote locations. IMAP offers several advantages over POP. These
    include the ability to store a copy of messages on a remote server
    after they are downloaded and concurrent updates. IMAP can be useful
    over low-speed links as it allows users to fetch the structure of
    messages without downloading them. It can also perform tasks such as
    searching on the server in order to minimize data transfer between
    clients and servers.

    Several POP and IMAP servers are available in the Ports Collection.
    These include
    `mail/qpopper <http://www.freebsd.org/cgi/url.cgi?ports/mail/qpopper/pkg-descr>`__,
    `mail/imap-uw <http://www.freebsd.org/cgi/url.cgi?ports/mail/imap-uw/pkg-descr>`__,
    `mail/courier-imap <http://www.freebsd.org/cgi/url.cgi?ports/mail/courier-imap/pkg-descr>`__,
    and
    `mail/dovecot2 <http://www.freebsd.org/cgi/url.cgi?ports/mail/dovecot2/pkg-descr>`__.

    .. raw:: html

       <div class="warning" xmlns="">

    Warning:
    ~~~~~~~~

    It should be noted that both POP and IMAP transmit information,
    including username and password credentials, in clear-text. To
    secure the transmission of information across these protocols,
    consider tunneling sessions over
    `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
    (`Section?14.8.1.2, “SSH
    Tunneling” <openssh.html#security-ssh-tunneling>`__) or using SSL
    (`Section?14.6, “OpenSSL” <openssl.html>`__).

    .. raw:: html

       </div>

Domain Name System (DNS)
    The Domain Name System (DNS) and its daemon ``named`` play a large
    role in the delivery of email. In order to deliver mail from one
    site to another, the MTA will look up the remote site in DNS to
    determine which host will receive mail for the destination. This
    process also occurs when mail is sent from a remote host to the MTA.

    In addition to mapping hostnames to IP addresses, DNS is responsible
    for storing information specific to mail delivery, known as Mail
    eXchanger MX records. The MX record specifies which hosts will
    receive mail for a particular domain.

    To view the MX records for a domain, specify the type of record.
    Refer to
    `host(1) <http://www.FreeBSD.org/cgi/man.cgi?query=host&sektion=1>`__,
    for more details about this command:

    .. code:: screen

        % host -t mx FreeBSD.org
        FreeBSD.org mail is handled by 10 mx1.FreeBSD.org

    Refer to `Section?29.7, “Domain Name System
    (DNS)” <network-dns.html>`__ for more information about DNS and its
    configuration.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+---------------------------------------+
| `Prev <mail.html>`__?          | `Up <mail.html>`__      | ?\ `Next <sendmail.html>`__           |
+--------------------------------+-------------------------+---------------------------------------+
| Chapter?28.?Electronic Mail?   | `Home <index.html>`__   | ?28.3.?Sendmail Configuration Files   |
+--------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
