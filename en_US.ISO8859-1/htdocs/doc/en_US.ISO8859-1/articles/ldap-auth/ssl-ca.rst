================================
B.?OpenSSL Certificates for LDAP
================================

.. raw:: html

   <div class="navheader">

B.?OpenSSL Certificates for LDAP
`Prev <useful.html>`__?
?
?

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="appendix">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

B.?OpenSSL Certificates for LDAP
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you are hosting two or more LDAP servers, you will probably not want
to use self-signed certificates, since each client will have to be
configured to work with each certificate. While this is possible, it is
not nearly as simple as creating your own certificate authority, and
signing your servers' certificates with that.

The steps here are presented as they are with very little attempt at
explaining what is going on—further explanation can be found in
`openssl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=openssl&sektion=1>`__
and its friends.

To create a certificate authority, we simply need a self-signed
certificate and key. The steps for this again are

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?B.1.?Creating a Certificate

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % openssl genrsa -out root.key 1024
    % openssl req -new -key root.key -out root.csr
    % openssl x509 -req -days 1024 -in root.csr -signkey root.key -out root.crt

.. raw:: html

   </div>

.. raw:: html

   </div>

These will be your root CA key and certificate. You will probably want
to encrypt the key and store it in a cool, dry place; anyone with access
to it can masquerade as one of your LDAP servers.

Next, using the first two steps above create a key
``ldap-server-one.key`` and certificate signing request
``ldap-server-one.csr``. Once you sign the signing request with
``root.key``, you will be able to use ``ldap-server-one.*`` on your LDAP
servers.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Do not forget to use the fully qualified domain name for the “common
name” attribute when generating the certificate signing request;
otherwise clients will reject a connection with you, and it can be very
tricky to diagnose.

.. raw:: html

   </div>

To sign the key, use ``-CA`` and ``-CAkey`` instead of ``-signkey``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?B.2.?Signing as a Certificate Authority

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % openssl x509 -req -days 1024 \
    -in ldap-server-one.csr -CA root.crt -CAkey root.key \
    -out ldap-server-one.crt

.. raw:: html

   </div>

.. raw:: html

   </div>

The resulting file will be the certificate that you can use on your LDAP
servers.

Finally, for clients to trust all your servers, distribute ``root.crt``
(the *certificate*, not the key!) to each client, and specify it in the
``TLSCACertificateFile`` directive in ``ldap.conf``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+-----+
| `Prev <useful.html>`__?   | ?                       | ?   |
+---------------------------+-------------------------+-----+
| A.?Useful Aids?           | `Home <index.html>`__   | ?   |
+---------------------------+-------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
