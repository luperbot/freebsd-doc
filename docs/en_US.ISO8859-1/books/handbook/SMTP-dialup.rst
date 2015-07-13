=========================================
28.8.?Using Mail with a Dialup Connection
=========================================

.. raw:: html

   <div class="navheader">

28.8.?Using Mail with a Dialup Connection
`Prev <outgoing-only.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <SMTP-Auth.html>`__

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

28.8.?Using Mail with a Dialup Connection
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When using a static IP address, one should not need to adjust the
default configuration. Set the hostname to the assigned Internet name
and Sendmail will do the rest.

When using a dynamically assigned IP address and a dialup PPP connection
to the Internet, one usually has a mailbox on the ISP's mail server. In
this example, the ISP's domain is ``example.net``, the user name is
``user``, the hostname is ``bsd.home``, and the ISP has allowed
``relay.example.net`` as a mail relay.

In order to retrieve mail from the ISP's mailbox, install a retrieval
agent from the Ports Collection.
`mail/fetchmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/fetchmail/pkg-descr>`__
is a good choice as it supports many different protocols. Usually, the
ISP will provide POP. When using user PPP, email can be automatically
fetched when an Internet connection is established with the following
entry in ``/etc/ppp/ppp.linkup``:

.. code:: programlisting

    MYADDR:
    !bg su user -c fetchmail

When using Sendmail to deliver mail to non-local accounts, configure
Sendmail to process the mail queue as soon as the Internet connection is
established. To do this, add this line after the above ``fetchmail``
entry in ``/etc/ppp/ppp.linkup``:

.. code:: programlisting

      !bg su user -c "sendmail -q"

In this example, there is an account for ``user`` on ``bsd.home``. In
the home directory of ``user`` on ``bsd.home``, create a
``.fetchmailrc`` which contains this line:

.. code:: programlisting

    poll example.net protocol pop3 fetchall pass MySecret

This file should not be readable by anyone except ``user`` as it
contains the password ``MySecret``.

In order to send mail with the correct ``from:`` header, configure
Sendmail to use ``<user@example.net>`` rather than ``<user@bsd.home>``
and to send all mail via ``relay.example.net``, allowing quicker mail
transmission.

The following ``.mc`` should suffice:

.. code:: programlisting

    VERSIONID(`bsd.home.mc version 1.0')
    OSTYPE(bsd4.4)dnl
    FEATURE(nouucp)dnl
    MAILER(local)dnl
    MAILER(smtp)dnl
    Cwlocalhost
    Cwbsd.home
    MASQUERADE_AS(`example.net')dnl
    FEATURE(allmasquerade)dnl
    FEATURE(masquerade_envelope)dnl
    FEATURE(nocanonify)dnl
    FEATURE(nodns)dnl
    define(`SMART_HOST', `relay.example.net')
    Dmbsd.home
    define(`confDOMAIN_NAME',`bsd.home')dnl
    define(`confDELIVERY_MODE',`deferred')dnl

Refer to the previous section for details of how to convert this file
into the ``sendmail.cf`` format. Do not forget to restart Sendmail after
updating ``sendmail.cf``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+--------------------------------+
| `Prev <outgoing-only.html>`__?   | `Up <mail.html>`__      | ?\ `Next <SMTP-Auth.html>`__   |
+----------------------------------+-------------------------+--------------------------------+
| 28.7.?Setting Up to Send Only?   | `Home <index.html>`__   | ?28.9.?SMTP Authentication     |
+----------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
