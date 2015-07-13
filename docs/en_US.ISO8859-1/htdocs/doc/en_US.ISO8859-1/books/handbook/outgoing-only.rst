=============================
28.7.?Setting Up to Send Only
=============================

.. raw:: html

   <div class="navheader">

28.7.?Setting Up to Send Only
`Prev <mail-advanced.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <SMTP-dialup.html>`__

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

28.7.?Setting Up to Send Only
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Bill Moran.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are many instances where one may only want to send mail through a
relay. Some examples are:

.. raw:: html

   <div class="itemizedlist">

-  The computer is a desktop machine that needs to use programs such as
   `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__,
   using the ISP's mail relay.

-  The computer is a server that does not handle mail locally, but needs
   to pass off all mail to a relay for processing.

.. raw:: html

   </div>

While any MTA is capable of filling this particular niche, it can be
difficult to properly configure a full-featured MTA just to handle
offloading mail. Programs such as Sendmail and Postfix are overkill for
this use.

Additionally, a typical Internet access service agreement may forbid one
from running a “mail server”.

The easiest way to fulfill those needs is to install the
`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__
port:

.. code:: screen

    # cd /usr/ports/mail/ssmtp
    # make install replace clean

Once installed,
`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__
can be configured with ``/usr/local/etc/ssmtp/ssmtp.conf``:

.. code:: programlisting

    root=yourrealemail@example.com
    mailhub=mail.example.com
    rewriteDomain=example.com
    hostname=_HOSTNAME_

Use the real email address for ``root``. Enter the ISP's outgoing mail
relay in place of ``mail.example.com``. Some ISPs call this the
“outgoing mail server” or “SMTP server”).

Make sure to disable Sendmail, including the outgoing mail service. See
`Section?28.4.1, “Disable
Sendmail” <mail-changingmta.html#mail-disable-sendmail>`__ for details.

`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__
has some other options available. Refer to the examples in
``/usr/local/etc/ssmtp`` or the manual page of ssmtp for more
information.

Setting up ssmtp in this manner allows any software on the computer that
needs to send mail to function properly, while not violating the ISP's
usage policy or allowing the computer to be hijacked for spamming.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+----------------------------------------------+
| `Prev <mail-advanced.html>`__?   | `Up <mail.html>`__      | ?\ `Next <SMTP-dialup.html>`__               |
+----------------------------------+-------------------------+----------------------------------------------+
| 28.6.?Advanced Topics?           | `Home <index.html>`__   | ?28.8.?Using Mail with a Dialup Connection   |
+----------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
