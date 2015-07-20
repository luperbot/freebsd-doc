===============
15.8. Kerberos5
===============

.. raw:: html

   <div class="navheader">

15.8. Kerberos5
`????? <kerberosIV.html>`__?
???????? 15. ????????
?\ `??????? <openssl.html>`__

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

15.8. Kerberos5
---------------

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

Every FreeBSD release beyond FreeBSD-5.1 includes support only for
Kerberos5. Hence Kerberos5 is the only version included, and its
configuration is similar in many aspects to that of KerberosIV. The
following information only applies to Kerberos5 in post FreeBSD-5.0
releases. Users who wish to use the KerberosIV package may install the
`security/krb4 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb4/pkg-descr>`__
port.

Kerberos is a network add-on system/protocol that allows users to
authenticate themselves through the services of a secure server.
Services such as remote login, remote copy, secure inter-system file
copying and other high-risk tasks are made considerably safer and more
controllable.

Kerberos can be described as an identity-verifying proxy system. It can
also be described as a trusted third-party authentication system.
Kerberos provides only one function - the secure authentication of users
on the network. It does not provide authorization functions (what users
are allowed to do) or auditing functions (what those users did). After a
client and server have used Kerberos to prove their identity, they can
also encrypt all of their communications to assure privacy and data
integrity as they go about their business.

Therefore it is highly recommended that Kerberos be used with other
security methods which provide authorization and audit services.

The following instructions can be used as a guide on how to set up
Kerberos as distributed for FreeBSD. However, you should refer to the
relevant manual pages for a complete description.

For purposes of demonstrating a Kerberos installation, the various name
spaces will be handled as follows:

.. raw:: html

   <div class="itemizedlist">

-  The DNS domain (?zone?) will be example.org.

-  The Kerberos realm will be EXAMPLE.ORG.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Please use real domain names when setting up Kerberos even if you intend
to run it internally. This avoids DNS problems and assures
inter-operation with other Kerberos realms.

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

15.8.1. History
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos was created by MIT as a solution to network security problems.
The Kerberos protocol uses strong cryptography so that a client can
prove its identity to a server (and vice versa) across an insecure
network connection.

Kerberos is both the name of a network authentication protocol and an
adjective to describe programs that implement the program (Kerberos
telnet, for example). The current version of the protocol is version 5,
described in RFC?1510.

Several free implementations of this protocol are available, covering a
wide range of operating systems. The Massachusetts Institute of
Technology (MIT), where Kerberos was originally developed, continues to
develop their Kerberos package. It is commonly used in the US as a
cryptography product, as such it has historically been affected by US
export regulations. The MIT Kerberos is available as a port
(`security/krb5 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb5/pkg-descr>`__).
Heimdal Kerberos is another version 5 implementation, and was explicitly
developed outside of the US to avoid export regulations (and is thus
often included in non-commercial UNIX(R) variants). The Heimdal Kerberos
distribution is available as a port
(`security/heimdal <http://www.freebsd.org/cgi/url.cgi?ports/security/heimdal/pkg-descr>`__),
and a minimal installation of it is included in the base FreeBSD
install.

In order to reach the widest audience, these instructions assume the use
of the Heimdal distribution included in FreeBSD.

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

15.8.2. Setting up a Heimdal KDC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Key Distribution Center (KDC) is the centralized authentication
service that Kerberos provides - it is the computer that issues Kerberos
tickets. The KDC is considered ?trusted? by all other computers in the
Kerberos realm, and thus has heightened security concerns.

Note that while running the Kerberos server requires very few computing
resources, a dedicated machine acting only as a KDC is recommended for
security reasons.

To begin setting up a KDC, ensure that your ``/etc/rc.conf`` file
contains the correct settings to act as a KDC (you may need to adjust
paths to reflect your own system):

.. code:: programlisting

    kerberos5_server_enable="YES"
    kadmind5_server_enable="YES"

Next we will set up your Kerberos config file, ``/etc/krb5.conf``:

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

Note that this ``/etc/krb5.conf`` file implies that your KDC will have
the fully-qualified hostname of ``kerberos.example.org``. You will need
to add a CNAME (alias) entry to your zone file to accomplish this if
your KDC has a different hostname.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

For large networks with a properly configured BIND DNS server, the above
example could be trimmed to:

.. code:: programlisting

    [libdefaults]
          default_realm = EXAMPLE.ORG

With the following lines being appended to the ``example.org`` zonefile:

.. code:: programlisting

    _kerberos._udp      IN  SRV     01 00 88 kerberos.example.org.
    _kerberos._tcp      IN  SRV     01 00 88 kerberos.example.org.
    _kpasswd._udp       IN  SRV     01 00 464 kerberos.example.org.
    _kerberos-adm._tcp  IN  SRV     01 00 749 kerberos.example.org.
    _kerberos           IN  TXT     EXAMPLE.ORG

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

For clients to be able to find the Kerberos services, you *must* have
either a fully configured ``/etc/krb5.conf`` or a minimally configured
``/etc/krb5.conf`` *and* a properly configured DNS server.

.. raw:: html

   </div>

Next we will create the Kerberos database. This database contains the
keys of all principals encrypted with a master password. You are not
required to remember this password, it will be stored in a file
(``/var/heimdal/m-key``). To create the master key, run ``kstash`` and
enter a password.

Once the master key has been created, you can initialize the database
using the ``kadmin`` program with the ``-l`` option (standing for
?local?). This option instructs ``kadmin`` to modify the database files
directly rather than going through the ``kadmind`` network service. This
handles the chicken-and-egg problem of trying to connect to the database
before it is created. Once you have the ``kadmin`` prompt, use the
``init`` command to create your realms initial database.

Lastly, while still in ``kadmin``, create your first principal using the
``add`` command. Stick to the defaults options for the principal for
now, you can always change them later with the ``modify`` command. Note
that you can use the ``?`` command at any prompt to see the available
options.

A sample database creation session is shown below:

.. code:: screen

    # kstash
    Master key: xxxxxxxx
    Verifying password - Master key: xxxxxxxx

    # kadmin -l
    kadmin> init EXAMPLE.ORG
    Realm max ticket life [unlimited]:
    kadmin> add tillman
    Max ticket life [unlimited]:
    Max renewable life [unlimited]:
    Attributes []:
    Password: xxxxxxxx
    Verifying password - Password: xxxxxxxx

Now it is time to start up the KDC services. Run
``/etc/rc.d/kerberos start`` and ``/etc/rc.d/kadmind start`` to bring up
the services. Note that you will not have any kerberized daemons running
at this point but you should be able to confirm the that the KDC is
functioning by obtaining and listing a ticket for the principal (user)
that you just created from the command-line of the KDC itself:

.. code:: screen

    % kinit tillman
    tillman@EXAMPLE.ORG's Password:

    % klist
    Credentials cache: FILE:/tmp/krb5cc_500
        Principal: tillman@EXAMPLE.ORG

      Issued           Expires          Principal
    Aug 27 15:37:58  Aug 28 01:37:58  krbtgt/EXAMPLE.ORG@EXAMPLE.ORG

The ticket can then be revoked when you have finished:

.. code:: screen

    % k5destroy

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

15.8.3. Kerberos enabling a server with Heimdal services
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, we need a copy of the Kerberos configuration file,
``/etc/krb5.conf``. To do so, simply copy it over to the client computer
from the KDC in a secure fashion (using network utilities, such as
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__, or
physically via a floppy disk).

Next you need a ``/etc/krb5.keytab`` file. This is the major difference
between a server providing Kerberos enabled daemons and a workstation -
the server must have a ``keytab`` file. This file contains the server's
host key, which allows it and the KDC to verify each others identity. It
must be transmitted to the server in a secure fashion, as the security
of the server can be broken if the key is made public. This explicitly
means that transferring it via a clear text channel, such as FTP, is a
very bad idea.

Typically, you transfer to the ``keytab`` to the server using the
``kadmin`` program. This is handy because you also need to create the
host principal (the KDC end of the ``krb5.keytab``) using ``kadmin``.

Note that you must have already obtained a ticket and that this ticket
must be allowed to use the ``kadmin`` interface in the ``kadmind.acl``.
See the section titled ?Remote administration? in the Heimdal info pages
(``info heimdal``) for details on designing access control lists. If you
do not want to enable remote ``kadmin`` access, you can simply securely
connect to the KDC (via local console,
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ or
Kerberos
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__)
and perform administration locally using ``kadmin -l``.

After installing the ``/etc/krb5.conf`` file, you can use ``kadmin``
from the Kerberos server. The ``add --random-key`` command will let you
add the server's host principal, and the ``ext`` command will allow you
to extract the server's host principal to its own keytab. For example:

.. code:: screen

    # kadmin
    kadmin> add --random-key host/myserver.example.org
    Max ticket life [unlimited]:
    Max renewable life [unlimited]:
    Attributes []:
    kadmin> ext host/myserver.example.org
    kadmin> exit

Note that the ``ext`` command (short for ?extract?) stores the extracted
key in ``/etc/krb5.keytab`` by default.

If you do not have ``kadmind`` running on the KDC (possibly for security
reasons) and thus do not have access to ``kadmin`` remotely, you can add
the host principal (``host/myserver.EXAMPLE.ORG``) directly on the KDC
and then extract it to a temporary file (to avoid over-writing the
``/etc/krb5.keytab`` on the KDC) using something like this:

.. code:: screen

    # kadmin
    kadmin> ext --keytab=/tmp/example.keytab host/myserver.example.org
    kadmin> exit

You can then securely copy the keytab to the server computer (using
``scp`` or a floppy, for example). Be sure to specify a non-default
keytab name to avoid over-writing the keytab on the KDC.

At this point your server can communicate with the KDC (due to its
``krb5.conf`` file) and it can prove its own identity (due to the
``krb5.keytab`` file). It is now ready for you to enable some Kerberos
services. For this example we will enable the ``telnet`` service by
putting a line like this into your ``/etc/inetd.conf`` and then
restarting the
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
service with ``/etc/rc.d/inetd restart``:

.. code:: programlisting

    telnet    stream  tcp     nowait  root    /usr/libexec/telnetd  telnetd -a user

The critical bit is that the ``-a`` (for authentication) type is set to
user. Consult the
`telnetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=telnetd&sektion=8>`__
manual page for more details.

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

15.8.4. Kerberos enabling a client with Heimdal
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Setting up a client computer is almost trivially easy. As far as
Kerberos configuration goes, you only need the Kerberos configuration
file, located at ``/etc/krb5.conf``. Simply securely copy it over to the
client computer from the KDC.

Test your client computer by attempting to use ``kinit``, ``klist``, and
``kdestroy`` from the client to obtain, show, and then delete a ticket
for the principal you created above. You should also be able to use
Kerberos applications to connect to Kerberos enabled servers, though if
that does not work and obtaining a ticket does the problem is likely
with the server and not with the client or the KDC.

When testing an application like ``telnet``, try using a packet sniffer
(such as
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__)
to confirm that your password is not sent in the clear. Try using
``telnet`` with the ``-x`` option, which encrypts the entire data stream
(similar to ``ssh``).

Various non-core Kerberos client applications are also installed by
default. This is where the ?minimal? nature of the base Heimdal
installation is felt: ``telnet`` is the only Kerberos enabled service.

The Heimdal port adds some of the missing client applications: Kerberos
enabled versions of ``ftp``, ``rsh``, ``rcp``, ``rlogin``, and a few
other less common programs. The MIT port also contains a full suite of
Kerberos client applications.

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

15.8.5. User configuration files: ``.k5login`` and ``.k5users``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Users within a realm typically have their Kerberos principal (such as
``tillman@EXAMPLE.ORG``) mapped to a local user account (such as a local
account named ``tillman``). Client applications such as ``telnet``
usually do not require a user name or a principal.

Occasionally, however, you want to grant access to a local user account
to someone who does not have a matching Kerberos principal. For example,
``tillman@EXAMPLE.ORG`` may need access to the local user account
``webdevelopers``. Other principals may also need access to that local
account.

The ``.k5login`` and ``.k5users`` files, placed in a users home
directory, can be used similar to a powerful combination of ``.hosts``
and ``.rhosts``, solving this problem. For example, if a ``.k5login``
with the following contents:

.. code:: screen

    tillman@example.org
    jdoe@example.org

Were to be placed into the home directory of the local user
``webdevelopers`` then both principals listed would have access to that
account without requiring a shared password.

Reading the manual pages for these commands is recommended. Note that
the ``ksu`` manual page covers ``.k5users``.

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

15.8.6. Kerberos Tips, Tricks, and Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  When using either the Heimdal or MIT Kerberos ports ensure that your
   ``PATH`` environment variable lists the Kerberos versions of the
   client applications before the system versions.

-  Do all the computers in your realm have synchronized time settings?
   If not, authentication may fail. `??????29.10, ????????????? ????????
   ?????????? ?? NTP? <network-ntp.html>`__ describes how to synchronize
   clocks using NTP.

-  MIT and Heimdal inter-operate nicely. Except for ``kadmin``, the
   protocol for which is not standardized.

-  If you change your hostname, you also need to change your ``host/``
   principal and update your keytab. This also applies to special keytab
   entries like the ``www/`` principal used for Apache's
   `www/mod\_auth\_kerb <http://www.freebsd.org/cgi/url.cgi?ports/www/mod_auth_kerb/pkg-descr>`__.

-  All hosts in your realm must be resolvable (both forwards and
   reverse) in DNS (or ``/etc/hosts`` as a minimum). CNAMEs will work,
   but the A and PTR records must be correct and in place. The error
   message is not very intuitive: Kerberos5 refuses authentication
   because Read req failed: Key table entry not found.

-  Some operating systems that may being acting as clients to your KDC
   do not set the permissions for ``ksu`` to be setuid ``root``. This
   means that ``ksu`` does not work, which is a good security idea but
   annoying. This is not a KDC error.

-  With MIT Kerberos, if you want to allow a principal to have a ticket
   life longer than the default ten hours, you must use
   ``modify_principal`` in ``kadmin`` to change the maxlife of both the
   principal in question and the ``krbtgt`` principal. Then the
   principal can use the ``-l`` option with ``kinit`` to request a
   ticket with a longer lifetime.

-  

   .. raw:: html

      <div class="note" xmlns="">

   ????????:
   ~~~~~~~~~

   If you run a packet sniffer on your KDC to add in troubleshooting and
   then run ``kinit`` from a workstation, you will notice that your TGT
   is sent immediately upon running ``kinit`` - even before you type
   your password! The explanation is that the Kerberos server freely
   transmits a TGT (Ticket Granting Ticket) to any unauthorized request;
   however, every TGT is encrypted in a key derived from the user's
   password. Therefore, when a user types their password it is not being
   sent to the KDC, it is being used to decrypt the TGT that ``kinit``
   already obtained. If the decryption process results in a valid ticket
   with a valid time stamp, the user has valid Kerberos credentials.
   These credentials include a session key for establishing secure
   communications with the Kerberos server in the future, as well as the
   actual ticket-granting ticket, which is actually encrypted with the
   Kerberos server's own key. This second layer of encryption is unknown
   to the user, but it is what allows the Kerberos server to verify the
   authenticity of each TGT.

   .. raw:: html

      </div>

-  If you want to use long ticket lifetimes (a week, for example) and
   you are using OpenSSH to connect to the machine where your ticket is
   stored, make sure that Kerberos ``TicketCleanup`` is set to ``no`` in
   your ``sshd_config`` or else your tickets will be deleted when you
   log out.

-  Remember that host principals can have a longer ticket lifetime as
   well. If your user principal has a lifetime of a week but the host
   you are connecting to has a lifetime of nine hours, you will have an
   expired host principal in your cache and the ticket cache will not
   work as expected.

-  When setting up a ``krb5.dict`` file to prevent specific bad
   passwords from being used (the manual page for ``kadmind`` covers
   this briefly), remember that it only applies to principals that have
   a password policy assigned to them. The ``krb5.dict`` files format is
   simple: one string per line. Creating a symbolic link to
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

15.8.7. Differences with the MIT port
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The major difference between the MIT and Heimdal installs relates to the
``kadmin`` program which has a different (but equivalent) set of
commands and uses a different protocol. This has a large implications if
your KDC is MIT as you will not be able to use the Heimdal ``kadmin``
program to administer your KDC remotely (or vice versa, for that
matter).

The client applications may also take slightly different command line
options to accomplish the same tasks. Following the instructions on the
MIT Kerberos web site (``http://web.mit.edu/Kerberos/www/``) is
recommended. Be careful of path issues: the MIT port installs into
``/usr/local/`` by default, and the ?normal? system applications may be
run instead of MIT if your ``PATH`` environment variable lists the
system directories first.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

With the MIT
`security/krb5 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb5/pkg-descr>`__
port that is provided by FreeBSD, be sure to read the
``/usr/local/share/doc/krb5/README.FreeBSD`` file installed by the port
if you want to understand why logins via ``telnetd`` and ``klogind``
behave somewhat oddly. Most importantly, correcting the ?incorrect
permissions on cache file? behavior requires that the ``login.krb5``
binary be used for authentication so that it can properly change
ownership for the forwarded credentials.

.. raw:: html

   </div>

The ``rc.conf`` must also be modified to contain the following
configuration:

.. code:: programlisting

    kerberos5_server="/usr/local/sbin/krb5kdc"
    kadmind5_server="/usr/local/sbin/kadmind"
    kerberos5_server_enable="YES"
    kadmind5_server_enable="YES"

This is done because the applications for MIT kerberos installs binaries
in the ``/usr/local`` hierarchy.

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

15.8.8. Mitigating limitations found in Kerberos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

15.8.8.1. Kerberos is an all-or-nothing approach
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Every service enabled on the network must be modified to work with
Kerberos (or be otherwise secured against network attacks) or else the
users credentials could be stolen and re-used. An example of this would
be Kerberos enabling all remote shells (via ``rsh`` and ``telnet``, for
example) but not converting the POP3 mail server which sends passwords
in plain text.

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

15.8.8.2. Kerberos is intended for single-user workstations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In a multi-user environment, Kerberos is less secure. This is because it
stores the tickets in the ``/tmp`` directory, which is readable by all
users. If a user is sharing a computer with several other people
simultaneously (i.e. multi-user), it is possible that the user's tickets
can be stolen (copied) by another user.

This can be overcome with the ``-c`` filename command-line option or
(preferably) the ``KRB5CCNAME`` environment variable, but this is rarely
done. In principal, storing the ticket in the users home directory and
using simple file permissions can mitigate this problem.

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

15.8.8.3. The KDC is a single point of failure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By design, the KDC must be as secure as the master password database is
contained on it. The KDC should have absolutely no other services
running on it and should be physically secured. The danger is high
because Kerberos stores all passwords encrypted with the same key (the
?master? key), which in turn is stored as a file on the KDC.

As a side note, a compromised master key is not quite as bad as one
might normally fear. The master key is only used to encrypt the Kerberos
database and as a seed for the random number generator. As long as
access to your KDC is secure, an attacker cannot do much with the master
key.

Additionally, if the KDC is unavailable (perhaps due to a denial of
service attack or network problems) the network services are unusable as
authentication can not be performed, a recipe for a denial-of-service
attack. This can alleviated with multiple KDCs (a single master and one
or more slaves) and with careful implementation of secondary or
fall-back authentication (PAM is excellent for this).

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

15.8.8.4. Kerberos Shortcomings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos allows users, hosts and services to authenticate between
themselves. It does not have a mechanism to authenticate the KDC to the
users, hosts or services. This means that a trojanned ``kinit`` (for
example) could record all user names and passwords. Something like
`security/tripwire <http://www.freebsd.org/cgi/url.cgi?ports/security/tripwire/pkg-descr>`__
or other file system integrity checking tools can alleviate this.

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

15.8.9. Resources and further information
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

-  `RFC 1510, The Kerberos Network Authentication Service
   (V5) <http://www.ietf.org/rfc/rfc1510.txt?number=1510>`__

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

+--------------------------------+----------------------------+---------------------------------+
| `????? <kerberosIV.html>`__?   | `???? <security.html>`__   | ?\ `??????? <openssl.html>`__   |
+--------------------------------+----------------------------+---------------------------------+
| 15.7. KerberosIV?              | `???? <index.html>`__      | ?15.9. OpenSSL                  |
+--------------------------------+----------------------------+---------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
