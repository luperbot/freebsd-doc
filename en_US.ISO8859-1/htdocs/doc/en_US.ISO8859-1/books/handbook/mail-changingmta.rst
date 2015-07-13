======================================
28.4.?Changing the Mail Transfer Agent
======================================

.. raw:: html

   <div class="navheader">

28.4.?Changing the Mail Transfer Agent
`Prev <sendmail.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <mail-trouble.html>`__

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

28.4.?Changing the Mail Transfer Agent
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Andrew Boothman.

.. raw:: html

   </div>

.. raw:: html

   <div>

Information taken from emails written by Gregory Neil Shapiro.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD comes with Sendmail already installed as the MTA which is in
charge of outgoing and incoming mail. However, the system administrator
can change the system's MTA. A wide choice of alternative MTAs is
available from the ``mail`` category of the FreeBSD Ports Collection.

Once a new MTA is installed, configure and test the new software before
replacing Sendmail. Refer to the documentation of the new MTA for
information on how to configure the software.

Once the new MTA is working, use the instructions in this section to
disable Sendmail and configure FreeBSD to use the replacement MTA.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.4.1.?Disable Sendmail
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

If Sendmail's outgoing mail service is disabled, it is important that it
is replaced with an alternative mail delivery system. Otherwise, system
functions such as
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
will be unable to deliver their results by email. Many parts of the
system expect a functional MTA. If applications continue to use
Sendmail's binaries to try to send email after they are disabled, mail
could go into an inactive Sendmail queue and never be delivered.

.. raw:: html

   </div>

In order to completely disable Sendmail, add or edit the following lines
in ``/etc/rc.conf``:

.. code:: programlisting

    sendmail_enable="NO"
    sendmail_submit_enable="NO"
    sendmail_outbound_enable="NO"
    sendmail_msp_queue_enable="NO"

To only disable Sendmail's incoming mail service, use only this entry in
``/etc/rc.conf``:

.. code:: programlisting

    sendmail_enable="NO"

More information on Sendmail's startup options is available in
`rc.sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.sendmail&sektion=8>`__.

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

28.4.2.?Replace the Default MTA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When a new MTA is installed using the Ports Collection, its startup
script is also installed and startup instructions are mentioned in its
package message. Before starting the new MTA, stop the running Sendmail
processes. This example stops all of these services, then starts the
Postfix service:

.. code:: screen

    # service sendmail stop
    # service postfix start

To start the replacement MTA at system boot, add its configuration line
to ``/etc/rc.conf``. This entry enables the Postfix MTA:

.. code:: programlisting

    postfix_enable="YES"

Some extra configuration is needed as Sendmail is so ubiquitous that
some software assumes it is already installed and configured. Check
``/etc/periodic.conf`` and make sure that these values are set to
``NO``. If this file does not exist, create it with these entries:

.. code:: programlisting

    daily_clean_hoststat_enable="NO"
    daily_status_mail_rejects_enable="NO"
    daily_status_include_submit_mailq="NO"
    daily_submit_queuerun="NO"

Some alternative MTAs provide their own compatible implementations of
the Sendmail command-line interface in order to facilitate using them as
drop-in replacements for Sendmail. However, some MUAs may try to execute
standard Sendmail binaries instead of the new MTA's binaries. FreeBSD
uses ``/etc/mail/mailer.conf`` to map the expected Sendmail binaries to
the location of the new binaries. More information about this mapping
can be found in
`mailwrapper(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mailwrapper&sektion=8>`__.

The default ``/etc/mail/mailer.conf`` looks like this:

.. code:: programlisting

    # $FreeBSD$
    #
    # Execute the "real" sendmail program, named /usr/libexec/sendmail/sendmail
    #
    sendmail        /usr/libexec/sendmail/sendmail
    send-mail       /usr/libexec/sendmail/sendmail
    mailq           /usr/libexec/sendmail/sendmail
    newaliases      /usr/libexec/sendmail/sendmail
    hoststat        /usr/libexec/sendmail/sendmail
    purgestat       /usr/libexec/sendmail/sendmail

When any of the commands listed on the left are run, the system actually
executes the associated command shown on the right. This system makes it
easy to change what binaries are executed when these default binaries
are invoked.

Some MTAs, when installed using the Ports Collection, will prompt to
update this file for the new binaries. For example, Postfix will update
the file like this:

.. code:: programlisting

    #
    # Execute the Postfix sendmail program, named /usr/local/sbin/sendmail
    #
    sendmail        /usr/local/sbin/sendmail
    send-mail       /usr/local/sbin/sendmail
    mailq           /usr/local/sbin/sendmail
    newaliases      /usr/local/sbin/sendmail

If the installation of the MTA does not automatically update
``/etc/mail/mailer.conf``, edit this file in a text editor so that it
points to the new binaries. This example points to the binaries
installed by
`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__:

.. code:: programlisting

    sendmail        /usr/local/sbin/ssmtp
    send-mail       /usr/local/sbin/ssmtp
    mailq           /usr/libexec/sendmail/sendmail
    newaliases      /usr/libexec/sendmail/sendmail
    hoststat        /usr/libexec/sendmail/sendmail
    purgestat       /usr/libexec/sendmail/sendmail

Once everything is configured, it is recommended to reboot the system.
Rebooting provides the opportunity to ensure that the system is
correctly configured to start the new MTA automatically on boot.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+-----------------------------------+
| `Prev <sendmail.html>`__?             | `Up <mail.html>`__      | ?\ `Next <mail-trouble.html>`__   |
+---------------------------------------+-------------------------+-----------------------------------+
| 28.3.?Sendmail Configuration Files?   | `Home <index.html>`__   | ?28.5.?Troubleshooting            |
+---------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
