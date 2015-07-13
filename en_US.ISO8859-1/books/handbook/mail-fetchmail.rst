======================
28.11.?Using fetchmail
======================

.. raw:: html

   <div class="navheader">

28.11.?Using fetchmail
`Prev <mail-agents.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <mail-procmail.html>`__

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

28.11.?Using fetchmail
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Marc Silver.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

fetchmail is a full-featured IMAP and POP client. It allows users to
automatically download mail from remote IMAP and POP servers and save it
into local mailboxes where it can be accessed more easily. fetchmail can
be installed using the
`mail/fetchmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/fetchmail/pkg-descr>`__
port, and offers various features, including:

.. raw:: html

   <div class="itemizedlist">

-  Support for the POP3, APOP, KPOP, IMAP, ETRN and ODMR protocols.

-  Ability to forward mail using SMTP, which allows filtering,
   forwarding, and aliasing to function normally.

-  May be run in daemon mode to check periodically for new messages.

-  Can retrieve multiple mailboxes and forward them, based on
   configuration, to different local users.

.. raw:: html

   </div>

This section explains some of the basic features of fetchmail. This
utility requires a ``.fetchmailrc`` configuration in the user's home
directory in order to run correctly. This file includes server
information as well as login credentials. Due to the sensitive nature of
the contents of this file, it is advisable to make it readable only by
the user, with the following command:

.. code:: screen

    % chmod 600 .fetchmailrc

The following ``.fetchmailrc`` serves as an example for downloading a
single user mailbox using POP. It tells fetchmail to connect to
``example.com`` using a username of ``joesoap`` and a password of
``XXX``. This example assumes that the user ``joesoap`` exists on the
local system.

.. code:: programlisting

    poll example.com protocol pop3 username "joesoap" password "XXX"

The next example connects to multiple POP and IMAP servers and redirects
to different local usernames where applicable:

.. code:: programlisting

    poll example.com proto pop3:
    user "joesoap", with password "XXX", is "jsoap" here;
    user "andrea", with password "XXXX";
    poll example2.net proto imap:
    user "john", with password "XXXXX", is "myth" here;

fetchmail can be run in daemon mode by running it with ``-d``, followed
by the interval (in seconds) that fetchmail should poll servers listed
in ``.fetchmailrc``. The following example configures fetchmail to poll
every 600 seconds:

.. code:: screen

    % fetchmail -d 600

More information on fetchmail can be found at
``http://www.fetchmail.info/``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+------------------------------------+
| `Prev <mail-agents.html>`__?   | `Up <mail.html>`__      | ?\ `Next <mail-procmail.html>`__   |
+--------------------------------+-------------------------+------------------------------------+
| 28.10.?Mail User Agents?       | `Home <index.html>`__   | ?28.12.?Using procmail             |
+--------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
