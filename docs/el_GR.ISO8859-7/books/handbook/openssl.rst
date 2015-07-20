=============
15.9. OpenSSL
=============

.. raw:: html

   <div class="navheader">

15.9. OpenSSL
`????? <kerberos5.html>`__?
???????? 15. ????????
?\ `??????? <ipsec.html>`__

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

15.9. OpenSSL
-------------

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

One feature that many users overlook is the OpenSSL toolkit included in
FreeBSD. OpenSSL provides an encryption transport layer on top of the
normal communications layer; thus allowing it to be intertwined with
many network applications and services.

Some uses of OpenSSL may include encrypted authentication of mail
clients, web based transactions such as credit card payments and more.
Many ports such as
`www/apache13-ssl <http://www.freebsd.org/cgi/url.cgi?ports/www/apache13-ssl/pkg-descr>`__,
and
`mail/sylpheed-claws <http://www.freebsd.org/cgi/url.cgi?ports/mail/sylpheed-claws/pkg-descr>`__
will offer compilation support for building with OpenSSL.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

In most cases the Ports Collection will attempt to build the
`security/openssl <http://www.freebsd.org/cgi/url.cgi?ports/security/openssl/pkg-descr>`__
port unless the ``WITH_OPENSSL_BASE`` make variable is explicitly set to
?yes?.

.. raw:: html

   </div>

The version of OpenSSL included in FreeBSD supports Secure Sockets Layer
v2/v3 (SSLv2/SSLv3), Transport Layer Security v1 (TLSv1) network
security protocols and can be used as a general cryptographic library.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

While OpenSSL supports the IDEA algorithm, it is disabled by default due
to United States patents. To use it, the license should be reviewed and,
if the restrictions are acceptable, the ``MAKE_IDEA`` variable must be
set in ``make.conf``.

.. raw:: html

   </div>

One of the most common uses of OpenSSL is to provide certificates for
use with software applications. These certificates ensure that the
credentials of the company or individual are valid and not fraudulent.
If the certificate in question has not been verified by one of the
several ?Certificate Authorities?, or CAs, a warning is usually
produced. A Certificate Authority is a company, such as
`VeriSign <http://www.verisign.com>`__, which will sign certificates in
order to validate credentials of individuals or companies. This process
has a cost associated with it and is definitely not a requirement for
using certificates; however, it can put some of the more paranoid users
at ease.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.9.1. Generating Certificates
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To generate a certificate, the following command is available:

.. code:: screen

    # openssl req -new -nodes -out req.pem -keyout cert.pem
    Generating a 1024 bit RSA private key
    ................++++++
    .......................................++++++
    writing new private key to 'cert.pem'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:US
    State or Province Name (full name) [Some-State]:PA
    Locality Name (eg, city) []:Pittsburgh
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:My Company
    Organizational Unit Name (eg, section) []:Systems Administrator
    Common Name (eg, YOUR name) []:localhost.example.org
    Email Address []:trhodes@FreeBSD.org

    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:SOME PASSWORD
    An optional company name []:Another Name

Notice the response directly after the ?Common Name? prompt shows a
domain name. This prompt requires a server name to be entered for
verification purposes; placing anything but a domain name would yield a
useless certificate. Other options, for instance expire time, alternate
encryption algorithms, etc. are available. A complete list may be
obtained by viewing the
`openssl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=openssl&sektion=1>`__
manual page.

Two files should now exist in the directory in which the aforementioned
command was issued. The certificate request, ``req.pem``, may be sent to
a certificate authority who will validate the credentials that you
entered, sign the request and return the certificate to you. The second
file created will be named ``cert.pem`` and is the private key for the
certificate and should be protected at all costs; if this falls in the
hands of others it can be used to impersonate you (or your server).

In cases where a signature from a CA is not required, a self signed
certificate can be created. First, generate the RSA key:

.. code:: screen

    # openssl dsaparam -rand -genkey -out myRSA.key 1024

Next, generate the CA key:

.. code:: screen

    # openssl gendsa -des3 -out myca.key myRSA.key

Use this key to create the certificate:

.. code:: screen

    # openssl req -new -x509 -days 365 -key myca.key -out new.crt

Two new files should appear in the directory: a certificate authority
signature file, ``myca.key`` and the certificate itself, ``new.crt``.
These should be placed in a directory, preferably under ``/etc``, which
is readable only by ``root``. Permissions of 0700 should be fine for
this and they can be set with the ``chmod`` utility.

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

15.9.2. Using Certificates, an Example
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

So what can these files do? A good use would be to encrypt connections
to the Sendmail MTA. This would dissolve the use of clear text
authentication for users who send mail via the local MTA.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

This is not the best use in the world as some MUAs will present the user
with an error if they have not installed the certificate locally. Refer
to the documentation included with the software for more information on
certificate installation.

.. raw:: html

   </div>

The following lines should be placed inside the local ``.mc`` file:

.. code:: programlisting

    dnl SSL Options
    define(`confCACERT_PATH',`/etc/certs')dnl
    define(`confCACERT',`/etc/certs/new.crt')dnl
    define(`confSERVER_CERT',`/etc/certs/new.crt')dnl
    define(`confSERVER_KEY',`/etc/certs/myca.key')dnl
    define(`confTLS_SRV_OPTIONS', `V')dnl

Where ``/etc/certs/`` is the directory to be used for storing the
certificate and key files locally. The last few requirements are a
rebuild of the local ``.cf`` file. This is easily achieved by typing
``make`` *``install``* within the ``/etc/mail`` directory. Follow that
up with ``make`` *``restart``* which should start the Sendmail daemon.

If all went well there will be no error messages in the
``/var/log/maillog`` file and Sendmail will show up in the process list.

For a simple test, simply connect to the mail server using the
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__
utility:

.. code:: screen

    # telnet example.com 25
    Trying 192.0.34.166...
    Connected to example.com.
    Escape character is '^]'.
    220 example.com ESMTP Sendmail 8.12.10/8.12.10; Tue, 31 Aug 2004 03:41:22 -0400 (EDT)
    ehlo example.com
    250-example.com Hello example.com [192.0.34.166], pleased to meet you
    250-ENHANCEDSTATUSCODES
    250-PIPELINING
    250-8BITMIME
    250-SIZE
    250-DSN
    250-ETRN
    250-AUTH LOGIN PLAIN
    250-STARTTLS
    250-DELIVERBY
    250 HELP
    quit
    221 2.0.0 example.com closing connection
    Connection closed by foreign host.

If the ?STARTTLS? line appears in the output then everything is working
correctly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+----------------------------+-------------------------------+
| `????? <kerberos5.html>`__?   | `???? <security.html>`__   | ?\ `??????? <ipsec.html>`__   |
+-------------------------------+----------------------------+-------------------------------+
| 15.8. Kerberos5?              | `???? <index.html>`__      | ?15.10. VPN over IPsec        |
+-------------------------------+----------------------------+-------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
