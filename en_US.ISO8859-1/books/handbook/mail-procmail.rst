=====================
28.12.?Using procmail
=====================

.. raw:: html

   <div class="navheader">

28.12.?Using procmail
`Prev <mail-fetchmail.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <network-servers.html>`__

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

28.12.?Using procmail
---------------------

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

procmail is a powerful application used to filter incoming mail. It
allows users to define “rules” which can be matched to incoming mails to
perform specific functions or to reroute mail to alternative mailboxes
or email addresses. procmail can be installed using the
`mail/procmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/procmail/pkg-descr>`__
port. Once installed, it can be directly integrated into most MTAs.
Consult the MTA documentation for more information. Alternatively,
procmail can be integrated by adding the following line to a
``.forward`` in the home directory of the user:

.. code:: programlisting

    "|exec /usr/local/bin/procmail || exit 75"

The following section displays some basic procmail rules, as well as
brief descriptions of what they do. Rules must be inserted into a
``.procmailrc``, which must reside in the user's home directory.

The majority of these rules can be found in
`procmailex(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procmailex&sektion=5>`__.

To forward all mail from ``<user@example.com>`` to an external address
of ``<goodmail@example2.com>``:

.. code:: programlisting

    :0
    * ^From.*user@example.com
    ! goodmail@example2.com

To forward all mails shorter than 1000 bytes to an external address of
``<goodmail@example2.com>``:

.. code:: programlisting

    :0
    * < 1000
    ! goodmail@example2.com

To send all mail sent to ``<alternate@example.com>`` to a mailbox called
``alternate``:

.. code:: programlisting

    :0
    * ^TOalternate@example.com
    alternate

To send all mail with a subject of “Spam” to ``/dev/null``:

.. code:: programlisting

    :0
    ^Subject:.*Spam
    /dev/null

A useful recipe that parses incoming ``FreeBSD.org`` mailing lists and
places each list in its own mailbox:

.. code:: programlisting

    :0
    * ^Sender:.owner-freebsd-\/[^@]+@FreeBSD.ORG
    {
        LISTNAME=${MATCH}
        :0
        * LISTNAME??^\/[^@]+
        FreeBSD-${MATCH}
    }

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+--------------------------------------+
| `Prev <mail-fetchmail.html>`__?   | `Up <mail.html>`__      | ?\ `Next <network-servers.html>`__   |
+-----------------------------------+-------------------------+--------------------------------------+
| 28.11.?Using fetchmail?           | `Home <index.html>`__   | ?Chapter?29.?Network Servers         |
+-----------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
