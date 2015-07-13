==================================================
29.5.?Lightweight Directory Access Protocol (LDAP)
==================================================

.. raw:: html

   <div class="navheader">

29.5.?Lightweight Directory Access Protocol (LDAP)
`Prev <network-nis.html>`__?
Chapter?29.?Network Servers
?\ `Next <network-dhcp.html>`__

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

29.5.?Lightweight Directory Access Protocol (LDAP)
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Lightweight Directory Access Protocol (LDAP) is an application layer
protocol used to access, modify, and authenticate objects using a
distributed directory information service. Think of it as a phone or
record book which stores several levels of hierarchical, homogeneous
information. It is used in Active Directory and OpenLDAP networks and
allows users to access to several levels of internal information
utilizing a single account. For example, email authentication, pulling
employee contact information, and internal website authentication might
all make use of a single user account in the LDAP server's record base.

This section provides a quick start guide for configuring an LDAP server
on a FreeBSD system. It assumes that the administrator already has a
design plan which includes the type of information to store, what that
information will be used for, which users should have access to that
information, and how to secure this information from unauthorized
access.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.5.1.?LDAP Terminology and Structure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

LDAP uses several terms which should be understood before starting the
configuration. All directory entries consist of a group of *attributes*.
Each of these attribute sets contains a unique identifier known as a
*Distinguished Name* (DN) which is normally built from several other
attributes such as the common or *Relative Distinguished Name* (RDN).
Similar to how directories have absolute and relative paths, consider a
DN as an absolute path and the RDN as the relative path.

An example LDAP entry looks like the following. This example searches
for the entry for the specified user account (``uid``), organizational
unit (``ou``), and organization (``o``):

.. code:: screen

    % ldapsearch -xb "uid=trhodes,ou=users,o=example.com"
    # extended LDIF
    #
    # LDAPv3
    # base <uid=trhodes,ou=users,o=example.com> with scope subtree
    # filter: (objectclass=*)
    # requesting: ALL
    #

    # trhodes, users, example.com
    dn: uid=trhodes,ou=users,o=example.com
    mail: trhodes@example.com
    cn: Tom Rhodes
    uid: trhodes
    telephoneNumber: (123) 456-7890

    # search result
    search: 2
    result: 0 Success

    # numResponses: 2
    # numEntries: 1

This example entry shows the values for the ``dn``, ``mail``, ``cn``,
``uid``, and ``telephoneNumber`` attributes. The cn attribute is the
RDN.

More information about LDAP and its terminology can be found at
``http://www.openldap.org/doc/admin24/intro.html``.

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

29.5.2.?Configuring an LDAP Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD does not provide a built-in LDAP server. Begin the configuration
by installing the
`net/openldap24-server <http://www.freebsd.org/cgi/url.cgi?ports/net/openldap24-server/pkg-descr>`__
package or port. Since the port has many configurable options, it is
recommended that the default options are reviewed to see if the package
is sufficient, and to instead compile the port if any options should be
changed. In most cases, the defaults are fine. However, if SQL support
is needed, this option must be enabled and the port compiled using the
instructions in `Section?5.5, “Using the Ports
Collection” <ports-using.html>`__.

Next, create the directories to hold the data and to store the
certificates:

.. code:: screen

    # mkdir /var/db/openldap-data
    # mkdir /usr/local/etc/openldap/private

Copy over the database configuration file:

.. code:: screen

    # cp /usr/local/etc/openldap/DB_CONFIG.example /var/db/openldap-data/DB_CONFIG

The next phase is to configure the certificate authority. The following
commands must be executed from ``/usr/local/etc/openldap/private``. This
is important as the file permissions need to be restrictive and users
should not have access to these files. To create the certificate
authority, start with this command and follow the prompts:

.. code:: screen

    # openssl req -days 365 -nodes -new -x509 -keyout ca.key -out ../ca.crt

The entries for the prompts may be generic *except* for the
``Common Name``. This entry must be *different* than the system
hostname. If this will be a self signed certificate, prefix the hostname
with ``CA`` for certificate authority.

The next task is to create a certificate signing request and a private
key. Input this command and follow the prompts:

.. code:: screen

    # openssl req -days 365 -nodes -new -keyout server.key -out server.csr

During the certificate generation process, be sure to correctly set the
``Common Name`` attribute. Once complete, sign the key:

.. code:: screen

    # openssl x509 -req -days 365 -in server.csr -out ../server.crt -CA ../ca.crt -CAkey ca.key -CAcreateserial

The final part of the certificate generation process is to generate and
sign the client certificates:

.. code:: screen

    # openssl req -days 365 -nodes -new -keyout client.key -out client.csr
    # openssl x509 -req -days 3650 -in client.csr -out ../client.crt -CA ../ca.crt -CAkey ca.key

Remember to use the same ``Common Name`` attribute when prompted. When
finished, ensure that a total of eight (8) new files have been generated
through the proceeding commands. If so, the next step is to edit
``/usr/local/etc/openldap/slapd.conf`` and add the following options:

.. code:: programlisting

    TLSCipherSuite HIGH:MEDIUM:+SSLv3
    TLSCertificateFile /usr/local/etc/openldap/server.crt
    TLSCertificateKeyFile /usr/local/etc/openldap/private/server.key
    TLSCACertificateFile /usr/local/etc/openldap/ca.crt

Then, edit ``/usr/local/etc/openldap/ldap.conf`` and add the following
lines:

.. code:: programlisting

    TLS_CACERT /usr/local/etc/openldap/ca.crt
    TLS_CIPHER_SUITE HIGH:MEDIUM:+SSLv3

While editing this file, uncomment the following entries and set them to
the desired values: ``BASE``, ``URI``, ``SIZELIMIT`` and ``TIMELIMIT``.
Set the ``URI`` to contain ``ldap://`` and ``ldaps://``. Then, add two
entries pointing to the certificate authority. When finished, the
entries should look similar to the following:

.. code:: programlisting

    BASE    dc=example,dc=com
    URI     ldap:// ldaps://

    SIZELIMIT       12
    TIMELIMIT       15

    TLS_CACERT /usr/local/etc/openldap/ca.crt
    TLS_CIPHER_SUITE HIGH:MEDIUM:+SSLv3

The default password for the server should then be changed:

.. code:: screen

    # slappasswd -h "{SHA}" >> /usr/local/etc/openldap/slapd.conf

This command will prompt for the password and, if the process does not
fail, a password hash will be added to the end of ``slapd.conf``.
Several hashing formats are supported. Refer to the manual page for
``slappasswd`` for more information.

Next, edit ``/usr/local/etc/openldap/slapd.conf`` and add the following
lines:

.. code:: programlisting

    password-hash {sha}
    allow bind_v2

The ``suffix`` in this file must be updated to match the ``BASE`` used
in ``/usr/local/etc/openldap/ldap.conf`` and ``rootdn`` should also be
set. A recommended value for ``rootdn`` is something like
``cn=Manager``. Before saving this file, place the ``rootpw`` in front
of the password output from ``slappasswd`` and delete the old
``rootpw``. The end result should look similar to this:

.. code:: programlisting

    TLSCipherSuite HIGH:MEDIUM:+SSLv3
    TLSCertificateFile /usr/local/etc/openldap/server.crt
    TLSCertificateKeyFile /usr/local/etc/openldap/private/server.key
    TLSCACertificateFile /usr/local/etc/openldap/ca.crt
    rootpw  {SHA}W6ph5Mm5Pz8GgiULbPgzG37mj9g=

Finally, enable the OpenLDAP service in ``/etc/rc.conf`` and set the
URI:

.. code:: programlisting

    slapd_enable="YES"
    slapd_flags="-4 -h ldaps:///"

At this point the server can be started and tested:

.. code:: screen

    # service slapd start

If everything is configured correctly, a search of the directory should
show a successful connection with a single response as in this example:

.. code:: screen

    # ldapsearch -Z
    # extended LDIF
    #
    # LDAPv3
    # base <dc=example,dc=com> (default) with scope subtree
    # filter: (objectclass=*)
    # requesting: ALL
    #

    # search result
    search: 3
    result: 32 No such object

    # numResponses: 1

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If the command fails and the configuration looks correct, stop the
``slapd`` service and restart it with debugging options:

.. code:: screen

    # service slapd stop
    # /usr/local/libexec/slapd -d -1

.. raw:: html

   </div>

Once the service is responding, the directory can be populated using
``ldapadd``. In this example, a file containing this list of users is
first created. Each user should use the following format:

.. code:: programlisting

    dn: dc=example,dc=com
    objectclass: dcObject
    objectclass: organization
    o: Example
    dc: Example

    dn: cn=Manager,dc=example,dc=com
    objectclass: organizationalRole
    cn: Manager

To import this file, specify the file name. The following command will
prompt for the password specified earlier and the output should look
something like this:

.. code:: screen

    # ldapadd -Z -D "cn=Manager,dc=example,dc=com" -W -f import.ldif
    Enter LDAP Password:
    adding new entry "dc=example,dc=com"

    adding new entry "cn=Manager,dc=example,dc=com"

Verify the data was added by issuing a search on the server using
``ldapsearch``:

.. code:: screen

    % ldapsearch -Z
    # extended LDIF
    #
    # LDAPv3
    # base <dc=example,dc=com> (default) with scope subtree
    # filter: (objectclass=*)
    # requesting: ALL
    #

    # example.com
    dn: dc=example,dc=com
    objectClass: dcObject
    objectClass: organization
    o: Example
    dc: Example

    # Manager, example.com
    dn: cn=Manager,dc=example,dc=com
    objectClass: organizationalRole
    cn: Manager

    # search result
    search: 3
    result: 0 Success

    # numResponses: 3
    # numEntries: 2

At this point, the server should be configured and functioning properly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------------+-----------------------------------------------------+
| `Prev <network-nis.html>`__?              | `Up <network-servers.html>`__   | ?\ `Next <network-dhcp.html>`__                     |
+-------------------------------------------+---------------------------------+-----------------------------------------------------+
| 29.4.?Network Information System (NIS)?   | `Home <index.html>`__           | ?29.6.?Dynamic Host Configuration Protocol (DHCP)   |
+-------------------------------------------+---------------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
