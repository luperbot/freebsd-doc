==============
14.5.?Kerberos
==============

.. raw:: html

   <div class="navheader">

14.5.?Kerberos
`Prev <tcpwrappers.html>`__?
Chapter?14.?Security
?\ `Next <openssl.html>`__

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

14.5.?Kerberos
--------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tillman Hodgson.

.. raw:: html

   </div>

.. raw:: html

   <div>

Based on a contribution by Mark Murray.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos is a network authentication protocol which was originally
created by the Massachusetts Institute of Technology (MIT) as a way to
securely provide authentication across a potentially hostile network.
The Kerberos protocol uses strong cryptography so that both a client and
server can prove their identity without sending any unencrypted secrets
over the network. Kerberos can be described as an identity-verifying
proxy system and as a trusted third-party authentication system. After a
user authenticates with Kerberos, their communications can be encrypted
to assure privacy and data integrity.

The only function of Kerberos is to provide the secure authentication of
users and servers on the network. It does not provide authorization or
auditing functions. It is recommended that Kerberos be used with other
security methods which provide authorization and audit services.

The current version of the protocol is version 5, described in RFC?4120.
Several free implementations of this protocol are available, covering a
wide range of operating systems. MIT continues to develop their Kerberos
package. It is commonly used in the US as a cryptography product, and
has historically been subject to US export regulations. In FreeBSD, MIT
Kerberos is available as the
`security/krb5 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb5/pkg-descr>`__
package or port. The Heimdal Kerberos implementation was explicitly
developed outside of the US to avoid export regulations. The Heimdal
Kerberos distribution is included in the base FreeBSD installation, and
another distribution with more configurable options is available as
`security/heimdal <http://www.freebsd.org/cgi/url.cgi?ports/security/heimdal/pkg-descr>`__
in the Ports Collection.

In Kerberos users and services are identified as “principals” which are
contained within an administrative grouping, called a “realm”. A typical
user principal would be of the form ``user``\ @\ *``REALM``* (realms are
traditionally uppercase).

This section provides a guide on how to set up Kerberos using the
Heimdal distribution included in FreeBSD.

For purposes of demonstrating a Kerberos installation, the name spaces
will be as follows:

.. raw:: html

   <div class="itemizedlist">

-  The DNS domain (zone) will be ``example.org``.

-  The Kerberos realm will be ``EXAMPLE.ORG``.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Use real domain names when setting up Kerberos, even if it will run
internally. This avoids DNS problems and assures inter-operation with
other Kerberos realms.

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

14.5.1.?Setting up a Heimdal KDC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Key Distribution Center (KDC) is the centralized authentication
service that Kerberos provides, the “trusted third party” of the system.
It is the computer that issues Kerberos tickets, which are used for
clients to authenticate to servers. Because the KDC is considered
trusted by all other computers in the Kerberos realm, it has heightened
security concerns. Direct access to the KDC should be limited.

While running a KDC requires few computing resources, a dedicated
machine acting only as a KDC is recommended for security reasons.

To begin setting up a KDC, add these lines to ``/etc/rc.conf``:

.. code:: programlisting

    kerberos5_server_enable="YES"
    kadmind5_server_enable="YES"

Next, edit ``/etc/krb5.conf`` as follows:

.. code:: programlisting

    [libdefaults]
        default_realm = EXAMPLE.ORG
    [realms]
        EXAMPLE.ORG = {
        kdc = kerberos.example.org
        admin_server = kerberos.example.org
        }
    [domain_realm]
        .example.org = EXAMPLE.ORG

In this example, the KDC will use the fully-qualified hostname
``kerberos.example.org``. The hostname of the KDC must be resolvable in
the DNS.

Kerberos can also use the DNS to locate KDCs, instead of a ``[realms]``
section in ``/etc/krb5.conf``. For large organizations that have their
own DNS servers, the above example could be trimmed to:

.. code:: programlisting

    [libdefaults]
          default_realm = EXAMPLE.ORG
    [domain_realm]
        .example.org = EXAMPLE.ORG

With the following lines being included in the ``example.org`` zone
file:

.. code:: programlisting

    _kerberos._udp      IN  SRV     01 00 88 kerberos.example.org.
    _kerberos._tcp      IN  SRV     01 00 88 kerberos.example.org.
    _kpasswd._udp       IN  SRV     01 00 464 kerberos.example.org.
    _kerberos-adm._tcp  IN  SRV     01 00 749 kerberos.example.org.
    _kerberos           IN  TXT     EXAMPLE.ORG

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In order for clients to be able to find the Kerberos services, they
*must* have either a fully configured ``/etc/krb5.conf`` or a minimally
configured ``/etc/krb5.conf`` *and* a properly configured DNS server.

.. raw:: html

   </div>

Next, create the Kerberos database which contains the keys of all
principals (users and hosts) encrypted with a master password. It is not
required to remember this password as it will be stored in
``/var/heimdal/m-key``; it would be reasonable to use a 45-character
random password for this purpose. To create the master key, run
``kstash`` and enter a password:

.. code:: screen

    # kstash
    Master key: xxxxxxxxxxxxxxxxxxxxxxx
    Verifying password - Master key: xxxxxxxxxxxxxxxxxxxxxxx

Once the master key has been created, the database should be
initialized. The Kerberos administrative tool
`kadmin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kadmin&sektion=8>`__
can be used on the KDC in a mode that operates directly on the database,
without using the
`kadmind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kadmind&sektion=8>`__
network service, as ``kadmin -l``. This resolves the chicken-and-egg
problem of trying to connect to the database before it is created. At
the ``kadmin`` prompt, use ``init`` to create the realm's initial
database:

.. code:: screen

    # kadmin -l
    kadmin> init EXAMPLE.ORG
    Realm max ticket life [unlimited]:

Lastly, while still in ``kadmin``, create the first principal using
``add``. Stick to the default options for the principal for now, as
these can be changed later with ``modify``. Type ``?`` at the prompt to
see the available options.

.. code:: screen

    kadmin> add tillman
    Max ticket life [unlimited]:
    Max renewable life [unlimited]:
    Attributes []:
    Password: xxxxxxxx
    Verifying password - Password: xxxxxxxx

Next, start the KDC services by running ``service kerberos start`` and
``service kadmind start``. While there will not be any kerberized
daemons running at this point, it is possible to confirm that the KDC is
functioning by obtaining a ticket for the principal that was just
created:

.. code:: screen

    % kinit tillman
    tillman@EXAMPLE.ORG's Password:

Confirm that a ticket was successfully obtained using ``klist``:

.. code:: screen

    % klist
    Credentials cache: FILE:/tmp/krb5cc_1001
        Principal: tillman@EXAMPLE.ORG

      Issued                Expires               Principal
    Aug 27 15:37:58 2013  Aug 28 01:37:58 2013  krbtgt/EXAMPLE.ORG@EXAMPLE.ORG

The temporary ticket can be destroyed when the test is finished:

.. code:: screen

    % kdestroy

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

14.5.2.?Configuring a Server to Use Kerberos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first step in configuring a server to use Kerberos authentication is
to ensure that it has the correct configuration in ``/etc/krb5.conf``.
The version from the KDC can be used as-is, or it can be regenerated on
the new system.

Next, create ``/etc/krb5.keytab`` on the server. This is the main part
of “Kerberizing” a service — it corresponds to generating a secret
shared between the service and the KDC. The secret is a cryptographic
key, stored in a “keytab”. The keytab contains the server's host key,
which allows it and the KDC to verify each others' identity. It must be
transmitted to the server in a secure fashion, as the security of the
server can be broken if the key is made public. Typically, the
``keytab`` is generated on an administrator's trusted machine using
``kadmin``, then securely transferred to the server, e.g., with
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__; it
can also be created directly on the server if that is consistent with
the desired security policy. It is very important that the keytab is
transmitted to the server in a secure fashion: if the key is known by
some other party, that party can impersonate any user to the server!
Using ``kadmin`` on the server directly is convenient, because the entry
for the host principal in the KDC database is also created using
``kadmin``.

Of course, ``kadmin`` is a kerberized service; a Kerberos ticket is
needed to authenticate to the network service, but to ensure that the
user running ``kadmin`` is actually present (and their session has not
been hijacked), ``kadmin`` will prompt for the password to get a fresh
ticket. The principal authenticating to the kadmin service must be
permitted to use the ``kadmin`` interface, as specified in
``kadmind.acl``. See the section titled “Remote administration” in
``info heimdal`` for details on designing access control lists. Instead
of enabling remote ``kadmin`` access, the administrator could securely
connect to the KDC via the local console or
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__, and
perform administration locally using ``kadmin -l``.

After installing ``/etc/krb5.conf``, use ``add --random-key`` in
``kadmin``. This adds the server's host principal to the database, but
does not extract a copy of the host principal key to a keytab. To
generate the keytab, use ``ext`` to extract the server's host principal
key to its own keytab:

.. code:: screen

    # kadmin
    kadmin> add --random-key host/myserver.example.org
    Max ticket life [unlimited]:
    Max renewable life [unlimited]:
    Principal expiration time [never]:
    Password expiration time [never]:
    Attributes []:
    kadmin> ext_keytab host/myserver.example.org
    kadmin> exit

Note that ``ext_keytab`` stores the extracted key in
``/etc/krb5.keytab`` by default. This is good when being run on the
server being kerberized, but the ``--keytab       path/to/file``
argument should be used when the keytab is being extracted elsewhere:

.. code:: screen

    # kadmin
    kadmin> ext_keytab --keytab=/tmp/example.keytab host/myserver.example.org
    kadmin> exit

The keytab can then be securely copied to the server using
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__ or a
removable media. Be sure to specify a non-default keytab name to avoid
inserting unneeded keys into the system's keytab.

At this point, the server can read encrypted messages from the KDC using
its shared key, stored in ``krb5.keytab``. It is now ready for the
Kerberos-using services to be enabled. One of the most common such
services is
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
which supports Kerberos via the GSS-API. In ``/etc/ssh/sshd_config``,
add the line:

.. code:: programlisting

    GSSAPIAuthentication yes

After making this change,
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
must be restared for the new configuration to take effect:
``service sshd restart``.

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

14.5.3.?Configuring a Client to Use Kerberos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As it was for the server, the client requires configuration in
``/etc/krb5.conf``. Copy the file in place (securely) or re-enter it as
needed.

Test the client by using ``kinit``, ``klist``, and ``kdestroy`` from the
client to obtain, show, and then delete a ticket for an existing
principal. Kerberos applications should also be able to connect to
Kerberos enabled servers. If that does not work but obtaining a ticket
does, the problem is likely with the server and not with the client or
the KDC. In the case of kerberized
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__,
GSS-API is disabled by default, so test using
``ssh -o       GSSAPIAuthentication=yes       hostname``.

When testing a Kerberized application, try using a packet sniffer such
as ``tcpdump`` to confirm that no sensitive information is sent in the
clear.

Various Kerberos client applications are available. With the advent of a
bridge so that applications using SASL for authentication can use
GSS-API mechanisms as well, large classes of client applications can use
Kerberos for authentication, from Jabber clients to IMAP clients.

Users within a realm typically have their Kerberos principal mapped to a
local user account. Occasionally, one needs to grant access to a local
user account to someone who does not have a matching Kerberos principal.
For example, ``tillman@EXAMPLE.ORG`` may need access to the local user
account ``webdevelopers``. Other principals may also need access to that
local account.

The ``.k5login`` and ``.k5users`` files, placed in a user's home
directory, can be used to solve this problem. For example, if the
following ``.k5login`` is placed in the home directory of
``webdevelopers``, both principals listed will have access to that
account without requiring a shared password.:

.. code:: screen

    tillman@example.org
    jdoe@example.org

Refer to
`ksu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ksu&sektion=1>`__ for
more information about ``.k5users``.

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

14.5.4.?MIT Differences
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The major difference between the MIT and Heimdal implementations is that
``kadmin`` has a different, but equivalent, set of commands and uses a
different protocol. If the KDC is MIT, the Heimdal version of ``kadmin``
cannot be used to administer the KDC remotely, and vice versa.

Client applications may also use slightly different command line options
to accomplish the same tasks. Following the instructions at
http://web.mit.edu/Kerberos/www/ is recommended. Be careful of path
issues: the MIT port installs into ``/usr/local/`` by default, and the
FreeBSD system applications run instead of the MIT versions if ``PATH``
lists the system directories first.

When using MIT Kerberos as a KDC on FreeBSD, the following edits should
also be made to ``rc.conf``:

.. code:: programlisting

    kerberos5_server="/usr/local/sbin/krb5kdc"
    kadmind5_server="/usr/local/sbin/kadmind"
    kerberos5_server_flags=""
    kerberos5_server_enable="YES"
    kadmind5_server_enable="YES"

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

14.5.5.?Kerberos Tips, Tricks, and Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When configuring and troubleshooting Kerberos, keep the following points
in mind:

.. raw:: html

   <div class="itemizedlist">

-  When using either Heimdal or MIT Kerberos from ports, ensure that the
   ``PATH`` lists the port's versions of the client applications before
   the system versions.

-  If all the computers in the realm do not have synchronized time
   settings, authentication may fail. `Section?29.11, “Clock
   Synchronization with NTP” <network-ntp.html>`__ describes how to
   synchronize clocks using NTP.

-  If the hostname is changed, the ``host/`` principal must be changed
   and the keytab updated. This also applies to special keytab entries
   like the ``HTTP/`` principal used for Apache's
   `www/mod\_auth\_kerb <http://www.freebsd.org/cgi/url.cgi?ports/www/mod_auth_kerb/pkg-descr>`__.

-  All hosts in the realm must be both forward and reverse resolvable in
   DNS or, at a minimum, exist in ``/etc/hosts``. CNAMEs will work, but
   the A and PTR records must be correct and in place. The error message
   for unresolvable hosts is not intuitive: Kerberos5 refuses
   authentication because Read req failed: Key table entry not found.

-  Some operating systems that act as clients to the KDC do not set the
   permissions for ``ksu`` to be setuid ``root``. This means that
   ``ksu`` does not work. This is a permissions problem, not a KDC
   error.

-  With MIT Kerberos, to allow a principal to have a ticket life longer
   than the default lifetime of ten hours, use ``modify_principal`` at
   the
   `kadmin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kadmin&sektion=8>`__
   prompt to change the ``maxlife`` of both the principal in question
   and the ``krbtgt`` principal. The principal can then use ``kinit -l``
   to request a ticket with a longer lifetime.

-  When running a packet sniffer on the KDC to aid in troubleshooting
   while running ``kinit`` from a workstation, the Ticket Granting
   Ticket (TGT) is sent immediately, even before the password is typed.
   This is because the Kerberos server freely transmits a TGT to any
   unauthorized request. However, every TGT is encrypted in a key
   derived from the user's password. When a user types their password,
   it is not sent to the KDC, it is instead used to decrypt the TGT that
   ``kinit`` already obtained. If the decryption process results in a
   valid ticket with a valid time stamp, the user has valid Kerberos
   credentials. These credentials include a session key for establishing
   secure communications with the Kerberos server in the future, as well
   as the actual TGT, which is encrypted with the Kerberos server's own
   key. This second layer of encryption allows the Kerberos server to
   verify the authenticity of each TGT.

-  Host principals can have a longer ticket lifetime. If the user
   principal has a lifetime of a week but the host being connected to
   has a lifetime of nine hours, the user cache will have an expired
   host principal and the ticket cache will not work as expected.

-  When setting up ``krb5.dict`` to prevent specific bad passwords from
   being used as described in
   `kadmind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kadmind&sektion=8>`__,
   remember that it only applies to principals that have a password
   policy assigned to them. The format used in ``krb5.dict`` is one
   string per line. Creating a symbolic link to
   ``/usr/share/dict/words`` might be useful.

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

14.5.6.?Mitigating Kerberos Limitations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since Kerberos is an all or nothing approach, every service enabled on
the network must either be modified to work with Kerberos or be
otherwise secured against network attacks. This is to prevent user
credentials from being stolen and re-used. An example is when Kerberos
is enabled on all remote shells but the non-Kerberized POP3 mail server
sends passwords in plain text.

The KDC is a single point of failure. By design, the KDC must be as
secure as its master password database. The KDC should have absolutely
no other services running on it and should be physically secure. The
danger is high because Kerberos stores all passwords encrypted with the
same master key which is stored as a file on the KDC.

A compromised master key is not quite as bad as one might fear. The
master key is only used to encrypt the Kerberos database and as a seed
for the random number generator. As long as access to the KDC is secure,
an attacker cannot do much with the master key.

If the KDC is unavailable, network services are unusable as
authentication cannot be performed. This can be alleviated with a single
master KDC and one or more slaves, and with careful implementation of
secondary or fall-back authentication using PAM.

Kerberos allows users, hosts and services to authenticate between
themselves. It does not have a mechanism to authenticate the KDC to the
users, hosts, or services. This means that a trojanned ``kinit`` could
record all user names and passwords. File system integrity checking
tools like
`security/tripwire <http://www.freebsd.org/cgi/url.cgi?ports/security/tripwire/pkg-descr>`__
can alleviate this.

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

14.5.7.?Resources and Further Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  `The Kerberos
   FAQ <http://www.faqs.org/faqs/Kerberos-faq/general/preamble.html>`__

-  `Designing an Authentication System: a Dialog in Four
   Scenes <http://web.mit.edu/Kerberos/www/dialogue.html>`__

-  `RFC 4120, The Kerberos Network Authentication Service
   (V5) <http://www.ietf.org/rfc/rfc4120.txt?number=4120>`__

-  `MIT Kerberos home page <http://web.mit.edu/Kerberos/www/>`__

-  `Heimdal Kerberos home page <http://www.pdc.kth.se/heimdal/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+--------------------------+------------------------------+
| `Prev <tcpwrappers.html>`__?   | `Up <security.html>`__   | ?\ `Next <openssl.html>`__   |
+--------------------------------+--------------------------+------------------------------+
| 14.4.?TCP Wrapper?             | `Home <index.html>`__    | ?14.6.?OpenSSL               |
+--------------------------------+--------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
