===================
2.?Configuring LDAP
===================

.. raw:: html

   <div class="navheader">

2.?Configuring LDAP
`Prev <index.html>`__?
?
?\ `Next <client.html>`__

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

2.?Configuring LDAP
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

LDAP stands for “Lightweight Directory Access Protocol” and is a subset
of the X.500 Directory Access Protocol. Its most recent specifications
are in `RFC4510 <http://www.ietf.org/rfc/rfc4510.txt>`__ and friends.
Essentially it is a database that expects to be read from more often
than it is written to.

The LDAP server `OpenLDAP <http://www.openldap.org/>`__ will be used in
the examples in this document; while the principles here should be
generally applicable to many different servers, most of the concrete
administration is OpenLDAP-specific. There are several server versions
in ports, for example
`net/openldap24-server <http://www.freebsd.org/cgi/url.cgi?ports/net/openldap24-server/pkg-descr>`__.
Client servers will need the corresponding
`net/openldap24-client <http://www.freebsd.org/cgi/url.cgi?ports/net/openldap24-client/pkg-descr>`__
libraries.

There are (basically) two areas of the LDAP service which need
configuration. The first is setting up a server to receive connections
properly, and the second is adding entries to the server's directory so
that FreeBSD tools know how to interact with it.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?Setting Up the Server for Connections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This section is specific to OpenLDAP. If you are using another server,
you will need to consult that server's documentation.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.1.?Installing OpenLDAP
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, install OpenLDAP:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?1.?Installing OpenLDAP

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # cd /usr/ports/net/openldap24-server
    # make install clean

.. raw:: html

   </div>

.. raw:: html

   </div>

This installs the ``slapd`` and ``slurpd`` binaries, along with the
required OpenLDAP libraries.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.2.?Configuring OpenLDAP
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Next we must configure OpenLDAP.

You will want to require encryption in your connections to the LDAP
server; otherwise your users' passwords will be transferred in plain
text, which is considered insecure. The tools we will be using support
two very similar kinds of encryption, SSL and TLS.

TLS stands for “Transportation Layer Security”. Services that employ TLS
tend to connect on the *same* ports as the same services without TLS;
thus an SMTP server which supports TLS will listen for connections on
port 25, and an LDAP server will listen on 389.

SSL stands for “Secure Sockets Layer”, and services that implement SSL
do *not* listen on the same ports as their non-SSL counterparts. Thus
SMTPS listens on port 465 (not 25), HTTPS listens on 443, and LDAPS on
636.

The reason SSL uses a different port than TLS is because a TLS
connection begins as plain text, and switches to encrypted traffic after
the ``STARTTLS`` directive. SSL connections are encrypted from the
beginning. Other than that there are no substantial differences between
the two.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

We will adjust OpenLDAP to use TLS, as SSL is considered deprecated.

.. raw:: html

   </div>

Once OpenLDAP is installed via ports, the following configuration
parameters in ``/usr/local/etc/openldap/slapd.conf`` will enable TLS:

.. code:: programlisting

    security ssf=128

    TLSCertificateFile /path/to/your/cert.crt
    TLSCertificateKeyFile /path/to/your/cert.key
    TLSCACertificateFile /path/to/your/cacert.crt

Here, ``ssf=128`` tells OpenLDAP to require 128-bit encryption for all
connections, both search and update. This parameter may be configured
based on the security needs of your site, but rarely you need to weaken
it, as most LDAP client libraries support strong encryption.

The ``cert.crt``, ``cert.key``, and ``cacert.crt`` files are necessary
for clients to authenticate *you* as the valid LDAP server. If you
simply want a server that runs, you can create a self-signed certificate
with OpenSSL:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?2.?Generating an RSA Key

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % openssl genrsa -out cert.key 1024
    Generating RSA private key, 1024 bit long modulus
    ....................++++++
    ...++++++
    e is 65537 (0x10001)
    % openssl req -new -key cert.key -out cert.csr

.. raw:: html

   </div>

.. raw:: html

   </div>

At this point you should be prompted for some values. You may enter
whatever values you like; however, it is important the “Common Name”
value be the fully qualified domain name of the OpenLDAP server. In our
case, and the examples here, the server is *``server.example.org``*.
Incorrectly setting this value will cause clients to fail when making
connections. This can the cause of great frustration, so ensure that you
follow these steps closely.

Finally, the certificate signing request needs to be signed:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?3.?Self-signing the Certificate

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % openssl x509 -req -in cert.csr -days 365 -signkey cert.key -out cert.crt
    Signature ok
    subject=/C=AU/ST=Some-State/O=Internet Widgits Pty Ltd
    Getting Private key

.. raw:: html

   </div>

.. raw:: html

   </div>

This will create a self-signed certificate that can be used for the
directives in ``slapd.conf``, where ``cert.crt`` and ``cacert.crt`` are
the same file. If you are going to use many OpenLDAP servers (for
replication via ``slurpd``) you will want to see `Appendix?B, *OpenSSL
Certificates for LDAP* <ssl-ca.html>`__ to generate a CA key and use it
to sign individual server certificates.

Once this is done, put the following in ``/etc/rc.conf``:

.. code:: programlisting

    slapd_enable="YES"

Then run **``/usr/local/etc/rc.d/slapd       start``**. This should
start OpenLDAP. Confirm that it is listening on 389 with

.. code:: screen

    % sockstat -4 -p 389
    ldap     slapd      3261  7  tcp4   *:389                 *:*

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.3.?Configuring the Client
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Install the
`net/openldap24-client <http://www.freebsd.org/cgi/url.cgi?ports/net/openldap24-client/pkg-descr>`__
port for the OpenLDAP libraries. The client machines will always have
OpenLDAP libraries since that is all
`security/pam\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/security/pam_ldap/pkg-descr>`__
and
`net/nss\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/net/nss_ldap/pkg-descr>`__
support, at least for the moment.

The configuration file for the OpenLDAP libraries is
``/usr/local/etc/openldap/ldap.conf``. Edit this file to contain the
following values:

.. code:: programlisting

    base dc=example,dc=org
    uri ldap://server.example.org/
    ssl start_tls
    tls_cacert /path/to/your/cacert.crt

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is important that your clients have access to ``cacert.crt``,
otherwise they will not be able to connect.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

There are two files called ``ldap.conf``. The first is this file, which
is for the OpenLDAP libraries and defines how to talk to the server. The
second is ``/usr/local/etc/ldap.conf``, and is for pam\_ldap.

.. raw:: html

   </div>

At this point you should be able to run **``ldapsearch -Z``** on the
client machine; ``-Z`` means “use TLS”. If you encounter an error, then
something is configured wrong; most likely it is your certificates. Use
`openssl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=openssl&sektion=1>`__'s
``s_client`` and ``s_server`` to ensure you have them configured and
signed properly.

.. raw:: html

   </div>

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

2.2.?Entries in the Database
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Authentication against an LDAP directory is generally accomplished by
attempting to bind to the directory as the connecting user. This is done
by establishing a “simple” bind on the directory with the user name
supplied. If there is an entry with the ``uid`` equal to the user name
and that entry's ``userPassword`` attribute matches the password
supplied, then the bind is successful.

The first thing we have to do is figure out is where in the directory
our users will live.

The base entry for our database is ``dc=example,dc=org``. The default
location for users that most clients seem to expect is something like
``ou=people,base``, so that is what will be used here. However keep in
mind that this is configurable.

So the ldif entry for the ``people`` organizational unit will look like:

.. code:: programlisting

    dn: ou=people,dc=example,dc=org
    objectClass: top
    objectClass: organizationalUnit
    ou: people

All users will be created as subentries of this organizational unit.

Some thought might be given to the object class your users will belong
to. Most tools by default will use ``people``, which is fine if you
simply want to provide entries against which to authenticate. However,
if you are going to store user information in the LDAP database as well,
you will probably want to use ``inetOrgPerson``, which has many useful
attributes. In either case, the relevant schemas need to be loaded in
``slapd.conf``.

For this example we will use the ``person`` object class. If you are
using ``inetOrgPerson``, the steps are basically identical, except that
the ``sn`` attribute is required.

To add a user ``testuser``, the ldif would be:

.. code:: programlisting

    dn: uid=tuser,ou=people,dc=example,dc=org
    objectClass: person
    objectClass: posixAccount
    objectClass: shadowAccount
    objectClass: top
    uidNumber: 10000
    gidNumber: 10000
    homeDirectory: /home/tuser
    loginShell: /bin/csh
    uid: tuser
    cn: tuser

I start my LDAP users' UIDs at 10000 to avoid collisions with system
accounts; you can configure whatever number you wish here, as long as it
is less than 65536.

We also need group entries. They are as configurable as user entries,
but we will use the defaults below:

.. code:: programlisting

    dn: ou=groups,dc=example,dc=org
    objectClass: top
    objectClass: organizationalUnit
    ou: groups

    dn: cn=tuser,ou=groups,dc=example,dc=org
    objectClass: posixGroup
    objectClass: top
    gidNumber: 10000
    cn: tuser

To enter these into your database, you can use ``slapadd`` or
``ldapadd`` on a file containing these entries. Alternatively, you can
use
`sysutils/ldapvi <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/ldapvi/pkg-descr>`__.

The ``ldapsearch`` utility on the client machine should now return these
entries. If it does, your database is properly configured to be used as
an LDAP authentication server.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+-----------------------------+
| `Prev <index.html>`__?   | ?                       | ?\ `Next <client.html>`__   |
+--------------------------+-------------------------+-----------------------------+
| LDAP Authentication?     | `Home <index.html>`__   | ?3.?Client Configuration    |
+--------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
