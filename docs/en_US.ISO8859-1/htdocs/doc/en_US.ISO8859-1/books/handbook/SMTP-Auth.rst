=========================
28.9.?SMTP Authentication
=========================

.. raw:: html

   <div class="navheader">

28.9.?SMTP Authentication
`Prev <SMTP-dialup.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <mail-agents.html>`__

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

28.9.?SMTP Authentication
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by James Gorham.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configuring SMTP authentication on the MTA provides a number of
benefits. SMTP authentication adds a layer of security to Sendmail, and
provides mobile users who switch hosts the ability to use the same MTA
without the need to reconfigure their mail client's settings each time.

.. raw:: html

   <div class="procedure">

#. Install
   `security/cyrus-sasl2 <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl2/pkg-descr>`__
   from the Ports Collection. This port supports a number of
   compile-time options. For the SMTP authentication method demonstrated
   in this example, make sure that ``LOGIN`` is not disabled.

#. After installing
   `security/cyrus-sasl2 <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl2/pkg-descr>`__,
   edit ``/usr/local/lib/sasl2/Sendmail.conf``, or create it if it does
   not exist, and add the following line:

   .. code:: programlisting

       pwcheck_method: saslauthd

#. Next, install
   `security/cyrus-sasl2-saslauthd <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl2-saslauthd/pkg-descr>`__
   and add the following line to ``/etc/rc.conf``:

   .. code:: programlisting

       saslauthd_enable="YES"

   Finally, start the saslauthd daemon:

   .. code:: screen

       # service saslauthd start

   This daemon serves as a broker for sendmail to authenticate against
   the FreeBSD
   `passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5>`__
   database. This saves the trouble of creating a new set of usernames
   and passwords for each user that needs to use SMTP authentication,
   and keeps the login and mail password the same.

#. Next, edit ``/etc/make.conf`` and add the following lines:

   .. code:: programlisting

       SENDMAIL_CFLAGS=-I/usr/local/include/sasl -DSASL
       SENDMAIL_LDFLAGS=-L/usr/local/lib
       SENDMAIL_LDADD=-lsasl2

   These lines provide Sendmail the proper configuration options for
   linking to
   `cyrus-sasl2 <http://www.freebsd.org/cgi/url.cgi?ports/cyrus-sasl2/pkg-descr>`__
   at compile time. Make sure that
   `cyrus-sasl2 <http://www.freebsd.org/cgi/url.cgi?ports/cyrus-sasl2/pkg-descr>`__
   has been installed before recompiling Sendmail.

#. Recompile Sendmail by executing the following commands:

   .. code:: screen

       # cd /usr/src/lib/libsmutil
       # make cleandir && make obj && make
       # cd /usr/src/lib/libsm
       # make cleandir && make obj && make
       # cd /usr/src/usr.sbin/sendmail
       # make cleandir && make obj && make && make install

   This compile should not have any problems if ``/usr/src`` has not
   changed extensively and the shared libraries it needs are available.

#. After Sendmail has been compiled and reinstalled, edit
   ``/etc/mail/freebsd.mc`` or the local ``.mc``. Many administrators
   choose to use the output from
   `hostname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=hostname&sektion=1>`__
   as the name of ``.mc`` for uniqueness. Add these lines:

   .. code:: programlisting

       dnl set SASL options
       TRUST_AUTH_MECH(`GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN')dnl
       define(`confAUTH_MECHANISMS', `GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN')dnl

   These options configure the different methods available to Sendmail
   for authenticating users. To use a method other than pwcheck, refer
   to the Sendmail documentation.

#. Finally, run
   `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
   while in ``/etc/mail``. That will run the new ``.mc`` and create a
   ``.cf`` named either ``freebsd.cf`` or the name used for the local
   ``.mc``. Then, run ``make         install restart``, which will copy
   the file to ``sendmail.cf``, and properly restart Sendmail. For more
   information about this process, refer to ``/etc/mail/Makefile``.

.. raw:: html

   </div>

To test the configuration, use a MUA to send a test message. For further
investigation, set the ``LogLevel`` of Sendmail to ``13`` and watch
``/var/log/maillog`` for any errors.

For more information, refer to `SMTP
authentication <http://www.sendmail.org/~ca/email/auth.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+----------------------------------+
| `Prev <SMTP-dialup.html>`__?                 | `Up <mail.html>`__      | ?\ `Next <mail-agents.html>`__   |
+----------------------------------------------+-------------------------+----------------------------------+
| 28.8.?Using Mail with a Dialup Connection?   | `Home <index.html>`__   | ?28.10.?Mail User Agents         |
+----------------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
