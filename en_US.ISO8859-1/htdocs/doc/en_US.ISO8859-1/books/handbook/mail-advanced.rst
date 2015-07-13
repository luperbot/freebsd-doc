=====================
28.6.?Advanced Topics
=====================

.. raw:: html

   <div class="navheader">

28.6.?Advanced Topics
`Prev <mail-trouble.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <outgoing-only.html>`__

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

28.6.?Advanced Topics
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section covers more involved topics such as mail configuration and
setting up mail for an entire domain.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.6.1.?Basic Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Out of the box, one can send email to external hosts as long as
``/etc/resolv.conf`` is configured or the network has access to a
configured DNS server. To have email delivered to the MTA on the FreeBSD
host, do one of the following:

.. raw:: html

   <div class="itemizedlist">

-  Run a DNS server for the domain.

-  Get mail delivered directly to to the FQDN for the machine.

.. raw:: html

   </div>

In order to have mail delivered directly to a host, it must have a
permanent static IP address, not a dynamic IP address. If the system is
behind a firewall, it must be configured to allow SMTP traffic. To
receive mail directly at a host, one of these two must be configured:

.. raw:: html

   <div class="itemizedlist">

-  Make sure that the lowest-numbered MX record in DNS points to the
   host's static IP address.

-  Make sure there is no MX entry in the DNS for the host.

.. raw:: html

   </div>

Either of the above will allow mail to be received directly at the host.

Try this:

.. code:: screen

    # hostname
    example.FreeBSD.org
    # host example.FreeBSD.org
    example.FreeBSD.org has address 204.216.27.XX

In this example, mail sent directly to
``<yourlogin@example.FreeBSD.org>`` should work without problems,
assuming Sendmail is running correctly on ``example.FreeBSD.org``.

For this example:

.. code:: screen

    # host example.FreeBSD.org
    example.FreeBSD.org has address 204.216.27.XX
    example.FreeBSD.org mail is handled (pri=10) by nevdull.FreeBSD.org

All mail sent to ``example.FreeBSD.org`` will be collected on ``hub``
under the same username instead of being sent directly to your host.

The above information is handled by the DNS server. The DNS record that
carries mail routing information is the MX entry. If no MX record
exists, mail will be delivered directly to the host by way of its IP
address.

The MX entry for ``freefall.FreeBSD.org`` at one time looked like this:

.. code:: programlisting

    freefall      MX  30  mail.crl.net
    freefall        MX  40  agora.rdrop.com
    freefall        MX  10  freefall.FreeBSD.org
    freefall        MX  20  who.cdrom.com

``freefall`` had many MX entries. The lowest MX number is the host that
receives mail directly, if available. If it is not accessible for some
reason, the next lower-numbered host will accept messages temporarily,
and pass it along when a lower-numbered host becomes available.

Alternate MX sites should have separate Internet connections in order to
be most useful. Your ISP can provide this service.

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

28.6.2.?Mail for a Domain
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When configuring a MTA for a network, any mail sent to hosts in its
domain should be diverted to the MTA so that users can receive their
mail on the master mail server.

To make life easiest, a user account with the same *username* should
exist on both the MTA and the system with the MUA. Use
`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
to create the user accounts.

The MTA must be the designated mail exchanger for each workstation on
the network. This is done in theDNS configuration with an MX record:

.. code:: programlisting

    example.FreeBSD.org    A   204.216.27.XX       ; Workstation
                MX  10 nevdull.FreeBSD.org  ; Mailhost

This will redirect mail for the workstation to the MTA no matter where
the A record points. The mail is sent to the MX host.

This must be configured on a DNS server. If the network does not run its
own DNS server, talk to the ISP or DNS provider.

The following is an example of virtual email hosting. Consider a
customer with the domain ``customer1.org``, where all the mail for
``customer1.org`` should be sent to ``mail.myhost.com``. The DNS entry
should look like this:

.. code:: programlisting

    customer1.org        MX  10  mail.myhost.com

An ``A``> record is *not* needed for ``customer1.org`` in order to only
handle email for that domain. However, running ``ping`` against
``customer1.org`` will not work unless an ``A`` record exists for it.

Tell the MTA which domains and/or hostnames it should accept mail for.
Either of the following will work for Sendmail:

.. raw:: html

   <div class="itemizedlist">

-  Add the hosts to ``/etc/mail/local-host-names`` when using the
   ``FEATURE(use_cw_file)``. For versions of Sendmail earlier than 8.10,
   edit ``/etc/sendmail.cw`` instead.

-  Add a ``Cwyour.host.com`` line to ``/etc/sendmail.cf``. For Sendmail
   8.10 or higher, add that line to ``/etc/mail/sendmail.cf``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+------------------------------------+
| `Prev <mail-trouble.html>`__?   | `Up <mail.html>`__      | ?\ `Next <outgoing-only.html>`__   |
+---------------------------------+-------------------------+------------------------------------+
| 28.5.?Troubleshooting?          | `Home <index.html>`__   | ?28.7.?Setting Up to Send Only     |
+---------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
