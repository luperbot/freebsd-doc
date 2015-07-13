==================
14.2.?Introduction
==================

.. raw:: html

   <div class="navheader">

14.2.?Introduction
`Prev <security.html>`__?
Chapter?14.?Security
?\ `Next <one-time-passwords.html>`__

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

14.2.?Introduction
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Security is everyone's responsibility. A weak entry point in any system
could allow intruders to gain access to critical information and cause
havoc on an entire network. One of the core principles of information
security is the CIA triad, which stands for the Confidentiality,
Integrity, and Availability of information systems.

The CIA triad is a bedrock concept of computer security as customers and
users expect their data to be protected. For example, a customer expects
that their credit card information is securely stored (confidentiality),
that their orders are not changed behind the scenes (integrity), and
that they have access to their order information at all times
(availablility).

To provide CIA, security professionals apply a defense in depth
strategy. The idea of defense in depth is to add several layers of
security to prevent one single layer failing and the entire security
system collapsing. For example, a system administrator cannot simply
turn on a firewall and consider the network or system secure. One must
also audit accounts, check the integrity of binaries, and ensure
malicious tools are not installed. To implement an effective security
strategy, one must understand threats and how to defend against them.

What is a threat as it pertains to computer security? Threats are not
limited to remote attackers who attempt to access a system without
permission from a remote location. Threats also include employees,
malicious software, unauthorized network devices, natural disasters,
security vulnerabilities, and even competing corporations.

Systems and networks can be accessed without permission, sometimes by
accident, or by remote attackers, and in some cases, via corporate
espionage or former employees. As a user, it is important to prepare for
and admit when a mistake has lead to a security breach and report
possible issues to the security team. As an administrator, it is
important to know of the threats and be prepared to mitigate them.

When applying security to systems, it is recommended to start by
securing the basic accounts and system configuration, and then to secure
the network layer so that it adheres to the system policy and the
organization's security procedures. Many organizations already have a
security policy that covers the configuration of technology devices. The
policy should include the security configuration of workstations,
desktops, mobile devices, phones, production servers, and development
servers. In many cases, standard operating procedures (SOPs) already
exist. When in doubt, ask the security team.

The rest of this introduction describes how some of these basic security
configurations are performed on a FreeBSD system. The rest of this
chapter describes some specific tools which can be used when
implementing a security policy on a FreeBSD system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.2.1.?Preventing Logins
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In securing a system, a good starting point is an audit of accounts.
Ensure that ``root`` has a strong password and that this password is not
shared. Disable any accounts that do not need login access.

To deny login access to accounts, two methods exist. The first is to
lock the account. This example locks the ``toor`` account:

.. code:: screen

    # pw lock toor

The second method is to prevent login access by changing the shell to
``/sbin/nologin``. Only the superuser can change the shell for other
users:

.. code:: screen

    # chsh -s /usr/sbin/nologin toor

The ``/usr/sbin/nologin`` shell prevents the system from assigning a
shell to the user when they attempt to login.

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

14.2.2.?Permitted Account Escalation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In some cases, system administration needs to be shared with other
users. FreeBSD has two methods to handle this. The first one, which is
not recommended, is a shared root password used by members of the
``wheel`` group. With this method, a user types ``su`` and enters the
password for ``wheel`` whenever superuser access is needed. The user
should then type ``exit`` to leave privileged access after finishing the
commands that required administrative access. To add a user to this
group, edit ``/etc/group`` and add the user to the end of the ``wheel``
entry. The user must be separated by a comma character with no space.

The second, and recommended, method to permit privilege escalation is to
install the
`security/sudo <http://www.freebsd.org/cgi/url.cgi?ports/security/sudo/pkg-descr>`__
package or port. This software provides additional auditing, more
fine-grained user control, and can be configured to lock users into
running only the specified privileged commands.

After installation, use ``visudo`` to edit ``/usr/local/etc/sudoers``.
This example creates a new ``webadmin`` group, adds the ``trhodes``
account to that group, and configures that group access to restart
`apache24 <http://www.freebsd.org/cgi/url.cgi?ports/apache24/pkg-descr>`__:

.. code:: screen

    # pw groupadd webadmin -M trhodes -g 6000
    # visudo
    %webadmin ALL=(ALL) /usr/sbin/service apache24 *

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

14.2.3.?Password Hashes
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Passwords are a necessary evil of technology. When they must be used,
they should be complex and a powerful hash mechanism should be used to
encrypt the version that is stored in the password database. FreeBSD
supports the DES, MD5, SHA256, SHA512, and Blowfish hash algorithms in
its ``crypt()`` library. The default of SHA512 should not be changed to
a less secure hashing algorithm, but can be changed to the more secure
Blowfish algorithm.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Blowfish is not part of AES and is not considered compliant with any
Federal Information Processing Standards (FIPS). Its use may not be
permitted in some environments.

.. raw:: html

   </div>

To determine which hash algorithm is used to encrypt a user's password,
the superuser can view the hash for the user in the FreeBSD password
database. Each hash starts with a symbol which indicates the type of
hash mechanism used to encrypt the password. If DES is used, there is no
beginning symbol. For MD5, the symbol is ``$``. For SHA256 and SHA512,
the symbol is ``$6$``. For Blowfish, the symbol is ``$2a$``. In this
example, the password for ``dru`` is hashed using the default SHA512
algorithm as the hash starts with ``$6$``. Note that the encrypted hash,
not the password itself, is stored in the password database:

.. code:: screen

    # grep dru /etc/master.passwd
    dru:$6$pzIjSvCAn.PBYQBA$PXpSeWPx3g5kscj3IMiM7tUEUSPmGexxta.8Lt9TGSi2lNQqYGKszsBPuGME0:1001:1001::0:0:dru:/usr/home/dru:/bin/csh

The hash mechanism is set in the user's login class. For this example,
the user is in the ``default`` login class and the hash algorithm is set
with this line in ``/etc/login.conf``:

.. code:: programlisting

            :passwd_format=sha512:\

To change the algorithm to Blowfish, modify that line to look like this:

.. code:: programlisting

            :passwd_format=blf:\

Then run ``cap_mkdb /etc/login.conf`` as described in `Section?14.13.1,
“Configuring Login
Classes” <security-resourcelimits.html#users-limiting>`__. Note that
this change will not affect any existing password hashes. This means
that all passwords should be re-hashed by asking users to run ``passwd``
in order to change their password.

For remote logins, two-factor authentication should be used. An example
of two-factor authentication is “something you have”, such as a key, and
“something you know”, such as the passphrase for that key. Since OpenSSH
is part of the FreeBSD base system, all network logins should be over an
encrypted connection and use key-based authentication instead of
passwords. For more information, refer to `Section?14.8,
“OpenSSH” <openssh.html>`__. Kerberos users may need to make additional
changes to implement OpenSSH in their network. These changes are
described in `Section?14.5, “Kerberos” <kerberos5.html>`__.

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

14.2.4.?Password Policy Enforcement
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Enforcing a strong password policy for local accounts is a fundamental
aspect of system security. In FreeBSD, password length, password
strength, and password complexity can be implemented using built-in
Pluggable Authentication Modules (PAM).

This section demonstrates how to configure the minimum and maximum
password length and the enforcement of mixed characters using the
``pam_passwdqc.so`` module. This module is enforced when a user changes
their password.

To configure this module, become the superuser and uncomment the line
containing ``pam_passwdqc.so`` in ``/etc/pam.d/passwd``. Then, edit that
line to match the password policy:

.. code:: programlisting

    password        requisite       pam_passwdqc.so         min=disabled,disabled,disabled,12,10 similar=deny retry=3 enforce=users

This example sets several requirements for new passwords. The ``min``
setting controls the minimum password length. It has five values because
this module defines five different types of passwords based on their
complexity. Complexity is defined by the type of characters that must
exist in a password, such as letters, numbers, symbols, and case. The
types of passwords are described in
`pam\_passwdqc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_passwdqc&sektion=8>`__.
In this example, the first three types of passwords are disabled,
meaning that passwords that meet those complexity requirements will not
be accepted, regardless of their length. The ``12`` sets a minimum
password policy of at least twelve characters, if the password also
contains characters with three types of complexity. The ``10`` sets the
password policy to also allow passwords of at least ten characters, if
the password contains characters with four types of complexity.

The ``similar`` setting denies passwords that are similar to the user's
previous password. The ``retry`` setting provides a user with three
opportunities to enter a new password.

Once this file is saved, a user changing their password will see a
message similar to the following:

.. code:: screen

    % passwd
    Changing local password for trhodes
    Old Password:

    You can now choose the new password.
    A valid password should be a mix of upper and lower case letters,
    digits and other characters.  You can use a 12 character long
    password with characters from at least 3 of these 4 classes, or
    a 10 character long password containing characters from all the
    classes.  Characters that form a common pattern are discarded by
    the check.
    Alternatively, if noone else can see your terminal now, you can
    pick this as your password: "trait-useful&knob".
    Enter new password:

If a password that does not match the policy is entered, it will be
rejected with a warning and the user will have an opportunity to try
again, up to the configured number of retries.

Most password policies require passwords to expire after so many days.
To set a password age time in FreeBSD, set ``passwordtime`` for the
user's login class in ``/etc/login.conf``. The ``default`` login class
contains an example:

.. code:: programlisting

    #       :passwordtime=90d:\

So, to set an expiry of 90 days for this login class, remove the comment
symbol (``#``), save the edit, and run
``cap_mkdb       /etc/login.conf``.

To set the expiration on individual users, pass an expiration date or
the number of days to expiry and a username to ``pw``:

.. code:: screen

    # pw usermod -p 30-apr-2015 -n trhodes

As seen here, an expiration date is set in the form of day, month, and
year. For more information, see
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__.

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

14.2.5.?Detecting Rootkits
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A *rootkit* is any unauthorized software that attempts to gain ``root``
access to a system. Once installed, this malicious software will
normally open up another avenue of entry for an attacker. Realistically,
once a system has been compromised by a rootkit and an investigation has
been performed, the system should be reinstalled from scratch. There is
tremendous risk that even the most prudent security or systems engineer
will miss something an attacker left behind.

A rootkit does do one thing usefulfor administrators: once detected, it
is a sign that a compromise happened at some point. But, these types of
applications tend to be very well hidden. This section demonstrates a
tool that can be used to detect rootkits,
`security/rkhunter <http://www.freebsd.org/cgi/url.cgi?ports/security/rkhunter/pkg-descr>`__.

After installation of this package or port, the system may be checked
using the following command. It will produce a lot of information and
will require some manual pressing of **ENTER**:

.. code:: screen

    # rkhunter -c

After the process completes, a status message will be printed to the
screen. This message will include the amount of files checked, suspect
files, possible rootkits, and more. During the check, some generic
security warnings may be produced about hidden files, the OpenSSH
protocol selection, and known vulnerable versions of installed software.
These can be handled now or after a more detailed analysis has been
performed.

Every administrator should know what is running on the systems they are
responsible for. Third-party tools like rkhunter and
`sysutils/lsof <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/lsof/pkg-descr>`__,
and native commands such as ``netstat`` and ``ps``, can show a great
deal of information on the system. Take notes on what is normal, ask
questions when something seems out of place, and be paranoid. While
preventing a compromise is ideal, detecting a compromise is a must.

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

14.2.6.?Binary Verification
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Verification of system files and binaries is important because it
provides the system administration and security teams information about
system changes. A software application that monitors the system for
changes is called an Intrusion Detection System (IDS).

FreeBSD provides native support for a basic IDS system. While the
nightly security emails will notify an administrator of changes, the
information is stored locally and there is a chance that a malicious
user could modify this information in order to hide their changes to the
system. As such, it is recommended to create a separate set of binary
signatures and store them on a read-only, root-owned directory or,
preferably, on a removable USB disk or remote rsync server.

The built-in ``mtree`` utility can be used to generate a specification
of the contents of a directory. A seed, or a numeric constant, is used
to generate the specification and is required to check that the
specification has not changed. This makes it possible to determine if a
file or binary has been modified. Since the seed value is unknown by an
attacker, faking or checking the checksum values of files will be
difficult to impossible. The following example generates a set of SHA256
hashes, one for each system binary in ``/bin``, and saves those values
to a hidden file in ``root``'s home directory,
``/root/.bin_chksum_mtree``:

.. code:: screen

    # mtree -s 3483151339707503 -c -K cksum,sha256digest -p /bin > /root/.bin_chksum_mtree
    # mtree: /bin checksum: 3427012225

The *``3483151339707503``* represents the seed. This value should be
remembered, but not shared.

Viewing ``/root/.bin_cksum_mtree`` should yield output similar to the
following:

.. code:: programlisting

    #          user: root
    #       machine: dreadnaught
    #          tree: /bin
    #          date: Mon Feb  3 10:19:53 2014

    # .
    /set type=file uid=0 gid=0 mode=0555 nlink=1 flags=none
    .               type=dir mode=0755 nlink=2 size=1024 \
                    time=1380277977.000000000
        \133        nlink=2 size=11704 time=1380277977.000000000 \
                    cksum=484492447 \
                    sha256digest=6207490fbdb5ed1904441fbfa941279055c3e24d3a4049aeb45094596400662a
        cat         size=12096 time=1380277975.000000000 cksum=3909216944 \
                    sha256digest=65ea347b9418760b247ab10244f47a7ca2a569c9836d77f074e7a306900c1e69
        chflags     size=8168 time=1380277975.000000000 cksum=3949425175 \
                    sha256digest=c99eb6fc1c92cac335c08be004a0a5b4c24a0c0ef3712017b12c89a978b2dac3
        chio        size=18520 time=1380277975.000000000 cksum=2208263309 \
                    sha256digest=ddf7c8cb92a58750a675328345560d8cc7fe14fb3ccd3690c34954cbe69fc964
        chmod       size=8640 time=1380277975.000000000 cksum=2214429708 \
                    sha256digest=a435972263bf814ad8df082c0752aa2a7bdd8b74ff01431ccbd52ed1e490bbe7

The machine's hostname, the date and time the specification was created,
and the name of the user who created the specification are included in
this report. There is a checksum, size, time, and SHA256 digest for each
binary in the directory.

To verify that the binary signatures have not changed, compare the
current contents of the directory to the previously generated
specification, and save the results to a file. This command requires the
seed that was used to generate the original specification:

.. code:: screen

    # mtree -s 3483151339707503 -p /bin < /root/.bin_chksum_mtree >> /root/.bin_chksum_output
    # mtree: /bin checksum: 3427012225

This should produce the same checksum for ``/bin`` that was produced
when the specification was created. If no changes have occurred to the
binaries in this directory, the ``/root/.bin_chksum_output`` output file
will be empty. To simulate a change, change the date on ``/bin/cat``
using ``touch`` and run the verification command again:

.. code:: screen

    # touch /bin/cat
    # mtree -s 3483151339707503 -p /bin < /root/.bin_chksum_mtree >> /root/.bin_chksum_output
    # more /root/.bin_chksum_output
    cat changed
        modification time expected Fri Sep 27 06:32:55 2013 found Mon Feb  3 10:28:43 2014

It is recommended to create specifications for the directories which
contain binaries and configuration files, as well as any directories
containing sensitive data. Typically, specifications are created for
``/bin``, ``/sbin``, ``/usr/bin``, ``/usr/sbin``, ``/usr/local/bin``,
``/etc``, and ``/usr/local/etc``.

More advanced IDS systems exist, such as
`security/aide <http://www.freebsd.org/cgi/url.cgi?ports/security/aide/pkg-descr>`__.
In most cases, ``mtree`` provides the functionality administrators need.
It is important to keep the seed value and the checksum output hidden
from malicious users. More information about ``mtree`` can be found in
`mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8>`__.

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

14.2.7.?System Tuning for Security
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD, many system features can be tuned using ``sysctl``. A few of
the security features which can be tuned to prevent Denial of Service
(DoS) attacks will be covered in this section. More information about
using ``sysctl``, including how to temporarily change values and how to
make the changes permanent after testing, can be found in `Section?12.9,
“Tuning with sysctl(8)” <configtuning-sysctl.html>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Any time a setting is changed with ``sysctl``, the chance to cause
undesired harm is increased, affecting the availability of the system.
All changes should be monitored and, if possible, tried on a testing
system before being used on a production system.

.. raw:: html

   </div>

By default, the FreeBSD kernel boots with a security level of ``-1``.
This is called “insecure mode” because immutable file flags may be
turned off and all devices may be read from or written to. The security
level will remain at ``-1`` unless it is altered through ``sysctl`` or
by a setting in the startup scripts. The security level may be increased
during system startup by setting ``kern_securelevel_enable`` to ``YES``
in ``/etc/rc.conf``, and the value of ``kern_securelevel`` to the
desired security level. See
`security(7) <http://www.FreeBSD.org/cgi/man.cgi?query=security&sektion=7>`__
and
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
for more information on these settings and the available security
levels.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Increasing the ``securelevel`` can break Xorg and cause other issues. Be
prepared to do some debugging.

.. raw:: html

   </div>

The ``net.inet.tcp.blackhole`` and ``net.inet.udp.blackhole`` settings
can be used to drop incoming SYN packets on closed ports without sending
a return RST response. The default behavior is to return an RST to show
a port is closed. Changing the default provides some level of protection
against ports scans, which are used to determine which applications are
running on a system. Set ``net.inet.tcp.blackhole`` to ``2`` and
``net.inet.udp.blackhole`` to ``1``. Refer to
`blackhole(4) <http://www.FreeBSD.org/cgi/man.cgi?query=blackhole&sektion=4>`__
for more information about these settings.

The ``net.inet.icmp.drop_redirect`` and ``net.inet.ip.redirect``
settings help prevent against *redirect attacks*. A redirect attack is a
type of DoS which sends mass numbers of ICMP type 5 packets. Since these
packets are not required, set ``net.inet.icmp.drop_redirect`` to ``1``
and set ``net.inet.ip.redirect`` to ``0``.

Source routing is a method for detecting and accessing non-routable
addresses on the internal network. This should be disabled as
non-routable addresses are normally not routable on purpose. To disable
this feature, set ``net.inet.ip.sourceroute`` and
``net.inet.ip.accept_sourceroute`` to ``0``.

When a machine on the network needs to send messages to all hosts on a
subnet, an ICMP echo request message is sent to the broadcast address.
However, there is no reason for an external host to perform such an
action. To reject all external broadcast requests, set
``net.inet.icmp.bmcastecho `` to ``0``.

Some additional settings are documented in
`security(7) <http://www.FreeBSD.org/cgi/man.cgi?query=security&sektion=7>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+--------------------------+-----------------------------------------+
| `Prev <security.html>`__?   | `Up <security.html>`__   | ?\ `Next <one-time-passwords.html>`__   |
+-----------------------------+--------------------------+-----------------------------------------+
| Chapter?14.?Security?       | `Home <index.html>`__    | ?14.3.?One-time Passwords               |
+-----------------------------+--------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
