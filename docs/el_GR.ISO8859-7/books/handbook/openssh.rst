==============
15.11. OpenSSH
==============

.. raw:: html

   <div class="navheader">

15.11. OpenSSH
`????? <ipsec.html>`__?
???????? 15. ????????
?\ `??????? <fs-acl.html>`__

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

15.11. OpenSSH
--------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OpenSSH is a set of network connectivity tools used to access remote
machines securely. It can be used as a direct replacement for
``rlogin``, ``rsh``, ``rcp``, and ``telnet``. Additionally, TCP/IP
connections can be tunneled/forwarded securely through SSH. OpenSSH
encrypts all traffic to effectively eliminate eavesdropping, connection
hijacking, and other network-level attacks.

OpenSSH is maintained by the OpenBSD project, and is based upon SSH
v1.2.12 with all the recent bug fixes and updates. It is compatible with
both SSH protocols 1 and 2.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.11.1. Advantages of Using OpenSSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Normally, when using
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__
or
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__,
data is sent over the network in an clear, un-encrypted form. Network
sniffers anywhere in between the client and server can steal your
user/password information or data transferred in your session. OpenSSH
offers a variety of authentication and encryption methods to prevent
this from happening.

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

15.11.2. Enabling sshd
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The sshd is an option presented during a ``Standard`` install of
FreeBSD. To see if sshd is enabled, check the ``rc.conf`` file for:

.. code:: screen

    sshd_enable="YES"

This will load
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
the daemon program for OpenSSH, the next time your system initializes.
Alternatively, it is possible to use ``/etc/rc.d/sshd``
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ script
to start OpenSSH:

.. code:: programlisting

    /etc/rc.d/sshd start

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

15.11.3. SSH Client
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
utility works similarly to
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__.

.. code:: screen

    # ssh user@example.com
    Host key not found from the list of known hosts.
    Are you sure you want to continue connecting (yes/no)? yes
    Host 'example.com' added to the list of known hosts.
    user@example.com's password: *******

The login will continue just as it would have if a session was created
using ``rlogin`` or ``telnet``. SSH utilizes a key fingerprint system
for verifying the authenticity of the server when the client connects.
The user is prompted to enter ``yes`` only when connecting for the first
time. Future attempts to login are all verified against the saved
fingerprint key. The SSH client will alert you if the saved fingerprint
differs from the received fingerprint on future login attempts. The
fingerprints are saved in ``~/.ssh/known_hosts``, or
``~/.ssh/known_hosts2`` for SSH v2 fingerprints.

By default, recent versions of the OpenSSH servers only accept SSH v2
connections. The client will use version 2 if possible and will fall
back to version 1. The client can also be forced to use one or the other
by passing it the ``-1`` or ``-2`` for version 1 or version 2,
respectively. The version 1 compatibility is maintained in the client
for backwards compatibility with older versions.

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

15.11.4. Secure Copy
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__
command works similarly to
`rcp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rcp&sektion=1>`__; it
copies a file to or from a remote machine, except in a secure fashion.

.. code:: screen

    #  scp user@example.com:/COPYRIGHT COPYRIGHT
    user@example.com's password: *******
    COPYRIGHT            100% |*****************************|  4735
    00:00
    #

Since the fingerprint was already saved for this host in the previous
example, it is verified when using
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__
here.

The arguments passed to
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__ are
similar to
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1>`__, with
the file or files in the first argument, and the destination in the
second. Since the file is fetched over the network, through SSH, one or
more of the file arguments takes on the form
``user@host:<path_to_remote_file>``.

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

15.11.5. Configuration
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The system-wide configuration files for both the OpenSSH daemon and
client reside within the ``/etc/ssh`` directory.

``ssh_config`` configures the client settings, while ``sshd_config``
configures the daemon.

Additionally, the ``sshd_program`` (``/usr/sbin/sshd`` by default), and
``sshd_flags`` ``rc.conf`` options can provide more levels of
configuration.

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

15.11.6. ssh-keygen
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Instead of using passwords,
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
can be used to generate DSA or RSA keys to authenticate a user:

.. code:: screen

    % ssh-keygen -t dsa
    Generating public/private dsa key pair.
    Enter file in which to save the key (/home/user/.ssh/id_dsa):
    Created directory '/home/user/.ssh'.
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/user/.ssh/id_dsa.
    Your public key has been saved in /home/user/.ssh/id_dsa.pub.
    The key fingerprint is:
    bb:48:db:f2:93:57:80:b6:aa:bc:f5:d5:ba:8f:79:17 user@host.example.com

`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
will create a public and private key pair for use in authentication. The
private key is stored in ``~/.ssh/id_dsa`` or ``~/.ssh/id_rsa``, whereas
the public key is stored in ``~/.ssh/id_dsa.pub`` or
``~/.ssh/id_rsa.pub``, respectively for DSA and RSA key types. The
public key must be placed in ``~/.ssh/authorized_keys`` of the remote
machine in order for the setup to work. Similarly, RSA version 1 public
keys should be placed in ``~/.ssh/authorized_keys``.

This will allow connection to the remote machine based upon SSH keys
instead of passwords.

If a passphrase is used in
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__,
the user will be prompted for a password each time in order to use the
private key.
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
can alleviate the strain of repeatedly entering long passphrases, and is
explored in the `??????15.11.7, ?ssh-agent and
ssh-add? <openssh.html#security-ssh-agent>`__ section below.

.. raw:: html

   <div class="warning" xmlns="">

?????????????:
~~~~~~~~~~~~~~

The various options and files can be different according to the OpenSSH
version you have on your system; to avoid problems you should consult
the
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
manual page.

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

15.11.7. ssh-agent and ssh-add
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
and
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
utilities provide methods for SSH keys to be loaded into memory for use,
without needing to type the passphrase each time.

The
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
utility will handle the authentication using the private key(s) that are
loaded into it.
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
should be used to launch another application. At the most basic level,
it could spawn a shell or at a more advanced level, a window manager.

To use
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
in a shell, first it will need to be spawned with a shell as an
argument. Secondly, the identity needs to be added by running
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
and providing it the passphrase for the private key. Once these steps
have been completed the user will be able to
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ to
any host that has the corresponding public key installed. For example:

.. code:: screen

    % ssh-agent csh
    % ssh-add
    Enter passphrase for /home/user/.ssh/id_dsa:
    Identity added: /home/user/.ssh/id_dsa (/home/user/.ssh/id_dsa)
    %

To use
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
in X11, a call to
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
will need to be placed in ``~/.xinitrc``. This will provide the
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
services to all programs launched in X11. An example ``~/.xinitrc`` file
might look like this:

.. code:: programlisting

    exec ssh-agent startxfce4

This would launch
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__,
which would in turn launch XFCE, every time X11 starts. Then once that
is done and X11 has been restarted so that the changes can take effect,
simply run
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
to load all of your SSH keys.

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

15.11.8. SSH Tunneling
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OpenSSH has the ability to create a tunnel to encapsulate another
protocol in an encrypted session.

The following command tells
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ to
create a tunnel for telnet:

.. code:: screen

    % ssh -2 -N -f -L 5023:localhost:23 user@foo.example.com
    %

The ``ssh`` command is used with the following options:

.. raw:: html

   <div class="variablelist">

``-2``
    Forces ``ssh`` to use version 2 of the protocol. (Do not use if you
    are working with older SSH servers)

``-N``
    Indicates no command, or tunnel only. If omitted, ``ssh`` would
    initiate a normal session.

``-f``
    Forces ``ssh`` to run in the background.

``-L``
    Indicates a local tunnel in *``localport:remotehost:remoteport``*
    fashion.

``user@foo.example.com``
    The remote SSH server.

.. raw:: html

   </div>

An SSH tunnel works by creating a listen socket on ``localhost`` on the
specified port. It then forwards any connection received on the local
host/port via the SSH connection to the specified remote host and port.

In the example, port *``5023``* on ``localhost`` is being forwarded to
port *``23``* on ``localhost`` of the remote machine. Since *``23``* is
telnet, this would create a secure telnet session through an SSH tunnel.

This can be used to wrap any number of insecure TCP protocols such as
SMTP, POP3, FTP, etc.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 15.1. Using SSH to Create a Secure Tunnel for SMTP

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % ssh -2 -N -f -L 5025:localhost:25 user@mailserver.example.com
    user@mailserver.example.com's password: *****
    % telnet localhost 5025
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    220 mailserver.example.com ESMTP

This can be used in conjunction with an
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
and additional user accounts to create a more seamless/hassle-free SSH
tunneling environment. Keys can be used in place of typing a password,
and the tunnels can be run as a separate user.

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

15.11.8.1. Practical SSH Tunneling Examples
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.11.8.1.1. Secure Access of a POP3 Server
'''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

At work, there is an SSH server that accepts connections from the
outside. On the same office network resides a mail server running a POP3
server. The network, or network path between your home and office may or
may not be completely trustable. Because of this, you need to check your
e-mail in a secure manner. The solution is to create an SSH connection
to your office's SSH server, and tunnel through to the mail server.

.. code:: screen

    % ssh -2 -N -f -L 2110:mail.example.com:110 user@ssh-server.example.com
    user@ssh-server.example.com's password: ******

When the tunnel is up and running, you can point your mail client to
send POP3 requests to ``localhost`` port 2110. A connection here will be
forwarded securely across the tunnel to ``mail.example.com``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.11.8.1.2. Bypassing a Draconian Firewall
'''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some network administrators impose extremely draconian firewall rules,
filtering not only incoming connections, but outgoing connections. You
may be only given access to contact remote machines on ports 22 and 80
for SSH and web surfing.

You may wish to access another (perhaps non-work related) service, such
as an Ogg Vorbis server to stream music. If this Ogg Vorbis server is
streaming on some other port than 22 or 80, you will not be able to
access it.

The solution is to create an SSH connection to a machine outside of your
network's firewall, and use it to tunnel to the Ogg Vorbis server.

.. code:: screen

    % ssh -2 -N -f -L 8888:music.example.com:8000 user@unfirewalled-system.example.org
    user@unfirewalled-system.example.org's password: *******

Your streaming client can now be pointed to ``localhost`` port 8888,
which will be forwarded over to ``music.example.com`` port 8000,
successfully evading the firewall.

.. raw:: html

   </div>

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

15.11.9. The ``AllowUsers`` Users Option
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is often a good idea to limit which users can log in and from where.
The ``AllowUsers`` option is a good way to accomplish this. For example,
to only allow the ``root`` user to log in from ``192.168.1.32``,
something like this would be appropriate in the ``/etc/ssh/sshd_config``
file:

.. code:: programlisting

    AllowUsers root@192.168.1.32

To allow the user ``admin`` to log in from anywhere, just list the
username by itself:

.. code:: programlisting

    AllowUsers admin

Multiple users should be listed on the same line, like so:

.. code:: programlisting

    AllowUsers root@192.168.1.32 admin

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

It is important that you list each user that needs to log in to this
machine; otherwise they will be locked out.

.. raw:: html

   </div>

After making changes to ``/etc/ssh/sshd_config`` you must tell
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__ to
reload its config files, by running:

.. code:: screen

    # /etc/rc.d/sshd reload

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

15.11.10. Further Reading
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`OpenSSH <http://www.openssh.com/>`__

`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
`ssh\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh_config&sektion=5>`__

`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
`sftp-server(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sftp-server&sektion=8>`__
`sshd\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd_config&sektion=5>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+----------------------------+--------------------------------------------+
| `????? <ipsec.html>`__?   | `???? <security.html>`__   | ?\ `??????? <fs-acl.html>`__               |
+---------------------------+----------------------------+--------------------------------------------+
| 15.10. VPN over IPsec?    | `???? <index.html>`__      | ?15.12. File System Access Control Lists   |
+---------------------------+----------------------------+--------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
