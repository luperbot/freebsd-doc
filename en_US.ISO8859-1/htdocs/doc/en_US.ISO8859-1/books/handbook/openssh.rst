=============
14.8.?OpenSSH
=============

.. raw:: html

   <div class="navheader">

14.8.?OpenSSH
`Prev <ipsec.html>`__?
Chapter?14.?Security
?\ `Next <fs-acl.html>`__

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

14.8.?OpenSSH
-------------

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

OpenSSH is a set of network connectivity tools used to provide secure
access to remote machines. Additionally, TCP/IP connections can be
tunneled or forwarded securely through SSH connections. OpenSSH encrypts
all traffic to effectively eliminate eavesdropping, connection
hijacking, and other network-level attacks.

OpenSSH is maintained by the OpenBSD project and is installed by default
in FreeBSD. It is compatible with both SSH version 1 and 2 protocols.

When data is sent over the network in an unencrypted form, network
sniffers anywhere in between the client and server can steal
user/password information or data transferred during the session.
OpenSSH offers a variety of authentication and encryption methods to
prevent this from happening. More information about OpenSSH is available
from http://www.openssh.com/.

This section provides an overview of the built-in client utilities to
securely access other systems and securely transfer files from a FreeBSD
system. It then describes how to configure a SSH server on a FreeBSD
system. More information is available in the man pages mentioned in this
chapter.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.8.1.?Using the SSH Client Utilities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To log into a SSH server, use ``ssh`` and specify a username that exists
on that server and the IP address or hostname of the server. If this is
the first time a connection has been made to the specified server, the
user will be prompted to first verify the server's fingerprint:

.. code:: screen

    # ssh user@example.com
    The authenticity of host 'example.com (10.0.0.1)' can't be established.
    ECDSA key fingerprint is 25:cc:73:b5:b3:96:75:3d:56:19:49:d2:5c:1f:91:3b.
    Are you sure you want to continue connecting (yes/no)? yes
    Permanently added 'example.com' (ECDSA) to the list of known hosts.
    Password for user@example.com: user_password

SSH utilizes a key fingerprint system to verify the authenticity of the
server when the client connects. When the user accepts the key's
fingerprint by typing ``yes`` when connecting for the first time, a copy
of the key is saved to ``.ssh/known_hosts`` in the user's home
directory. Future attempts to login are verified against the saved key
and ``ssh`` will display an alert if the server's key does not match the
saved key. If this occurs, the user should first verify why the key has
changed before continuing with the connection.

By default, recent versions of OpenSSH only accept SSHv2 connections. By
default, the client will use version 2 if possible and will fall back to
version 1 if the server does not support version 2. To force ``ssh`` to
only use the specified protocol, include ``-1`` or ``-2``. Additional
options are described in
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__.

Use `scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__
to securely copy a file to or from a remote machine. This example copies
``COPYRIGHT`` on the remote system to a file of the same name in the
current directory of the local system:

.. code:: screen

    # scp user@example.com:/COPYRIGHT COPYRIGHT
    Password for user@example.com: *******
    COPYRIGHT            100% |*****************************|  4735
    00:00
    #

Since the fingerprint was already verified for this host, the server's
key is automatically checked before prompting for the user's password.

The arguments passed to ``scp`` are similar to ``cp``. The file or files
to copy is the first argument and the destination to copy to is the
second. Since the file is fetched over the network, one or more of the
file arguments takes the form ``user@host:<path_to_remote_file>``. Be
aware when copying directories recursively that ``scp`` uses ``-r``,
whereas ``cp`` uses ``-R``.

To open an interactive session for copying files, use ``sftp``. Refer to
`sftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sftp&sektion=1>`__
for a list of available commands while in an ``sftp`` session.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.8.1.1.?Key-based Authentication
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Instead of using passwords, a client can be configured to connect to the
remote machine using keys. To generate DSA or RSA authentication keys,
use ``ssh-keygen``. To generate a public and private key pair, specify
the type of key and follow the prompts. It is recommended to protect the
keys with a memorable, but hard to guess passphrase.

.. code:: screen

    % ssh-keygen -t dsa
    Generating public/private dsa key pair.
    Enter file in which to save the key (/home/user/.ssh/id_dsa):
    Created directory '/home/user/.ssh'.
    Enter passphrase (empty for no passphrase): type some passphrase here which can contain spaces
    Enter same passphrase again: type some passphrase here which can contain spaces
    Your identification has been saved in /home/user/.ssh/id_dsa.
    Your public key has been saved in /home/user/.ssh/id_dsa.pub.
    The key fingerprint is:
    bb:48:db:f2:93:57:80:b6:aa:bc:f5:d5:ba:8f:79:17 user@host.example.com

Depending upon the specified protocol, the private key is stored in
``~/.ssh/id_dsa`` (or ``~/.ssh/id_rsa``), and the public key is stored
in ``~/.ssh/id_dsa.pub`` (or ``~/.ssh/id_rsa.pub``). The *public* key
must be first copied to ``~/.ssh/authorized_keys`` on the remote machine
in order for key-based authentication to work.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Many users believe that keys are secure by design and will use a key
without a passphrase. This is *dangerous* behavior. An administrator can
verify that a key pair is protected by a passphrase by viewing the
private key manually. If the private key file contains the word
``ENCRYPTED``, the key owner is using a passphrase. In addition, to
better secure end users, ``from`` may be placed in the public key file.
For example, adding ``from="192.168.10.5"`` in the front of ``ssh-rsa``
or ``rsa-dsa`` prefix will only allow that specific user to login from
that IP address.

.. raw:: html

   </div>

The various options and files can be different according to the OpenSSH
version. To avoid problems, consult
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__.

If a passphrase is used, the user will be prompted for the passphrase
each time a connection is made to the server. To load SSH keys into
memory, without needing to type the passphrase each time, use
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
and
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__.

Authentication is handled by ``ssh-agent``, using the private key(s)
that are loaded into it. Then, ``ssh-agent`` should be used to launch
another application such as a shell or a window manager.

To use ``ssh-agent`` in a shell, start it with a shell as an argument.
Next, add the identity by running ``ssh-add`` and providing it the
passphrase for the private key. Once these steps have been completed,
the user will be able to ``ssh`` to any host that has the corresponding
public key installed. For example:

.. code:: screen

    % ssh-agent csh
    % ssh-add
    Enter passphrase for key '/usr/home/user/.ssh/id_dsa': type passphrase here
    Identity added: /usr/home/user/.ssh/id_dsa (/usr/home/user/.ssh/id_dsa)
    %

To use ``ssh-agent`` in Xorg, add an entry for it in ``~/.xinitrc``.
This provides the ``ssh-agent`` services to all programs launched in
Xorg. An example ``~/.xinitrc`` might look like this:

.. code:: programlisting

    exec ssh-agent startxfce4

This launches ``ssh-agent``, which in turn launches XFCE, every time
Xorg starts. Once Xorg has been restarted so that the changes can take
effect, run ``ssh-add`` to load all of the SSH keys.

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

14.8.1.2.?SSH Tunneling
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OpenSSH has the ability to create a tunnel to encapsulate another
protocol in an encrypted session.

The following command tells ``ssh`` to create a tunnel for telnet:

.. code:: screen

    % ssh -2 -N -f -L 5023:localhost:23 user@foo.example.com
    %

This example uses the following options:

.. raw:: html

   <div class="variablelist">

``-2``
    Forces ``ssh`` to use version 2 to connect to the server.

``-N``
    Indicates no command, or tunnel only. If omitted, ``ssh`` initiates
    a normal session.

``-f``
    Forces ``ssh`` to run in the background.

``-L``
    Indicates a local tunnel in *``localport:remotehost:remoteport``*
    format.

``user@foo.example.com``
    The login name to use on the specified remote SSH server.

.. raw:: html

   </div>

An SSH tunnel works by creating a listen socket on ``localhost`` on the
specified ``localport``. It then forwards any connections received on
``localport`` via the SSH connection to the specified
``remotehost:remoteport``. In the example, port ``5023`` on the client
is forwarded to port ``23`` on the remote machine. Since port 23 is used
by telnet, this creates an encrypted telnet session through an SSH
tunnel.

This method can be used to wrap any number of insecure TCP protocols
such as SMTP, POP3, and FTP, as seen in the following examples.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?14.1.?Create a Secure Tunnel for SMTP

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

This can be used in conjunction with ``ssh-keygen`` and additional user
accounts to create a more seamless SSH tunneling environment. Keys can
be used in place of typing a password, and the tunnels can be run as a
separate user.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?14.2.?Secure Access of a POP3 Server

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

In this example, there is an SSH server that accepts connections from
the outside. On the same network resides a mail server running a POP3
server. To check email in a secure manner, create an SSH connection to
the SSH server and tunnel through to the mail server:

.. code:: screen

    % ssh -2 -N -f -L 2110:mail.example.com:110 user@ssh-server.example.com
    user@ssh-server.example.com's password: ******

Once the tunnel is up and running, point the email client to send POP3
requests to ``localhost`` on port 2110. This connection will be
forwarded securely across the tunnel to ``mail.example.com``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?14.3.?Bypassing a Firewall

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Some firewalls filter both incoming and outgoing connections. For
example, a firewall might limit access from remote machines to ports 22
and 80 to only allow SSH and web surfing. This prevents access to any
other service which uses a port other than 22 or 80.

The solution is to create an SSH connection to a machine outside of the
network's firewall and use it to tunnel to the desired service:

.. code:: screen

    % ssh -2 -N -f -L 8888:music.example.com:8000 user@unfirewalled-system.example.org
    user@unfirewalled-system.example.org's password: *******

In this example, a streaming Ogg Vorbis client can now be pointed to
``localhost`` port 8888, which will be forwarded over to
``music.example.com`` on port 8000, successfully bypassing the firewall.

.. raw:: html

   </div>

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

14.8.2.?Enabling the SSH Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In addition to providing built-in SSH client utilities, a FreeBSD system
can be configured as an SSH server, accepting connections from other SSH
clients.

To see if sshd is enabled, check ``/etc/rc.conf`` for this line and add
it if it is missing:

.. code:: programlisting

    sshd_enable="YES"

This will start sshd, the daemon program for OpenSSH, the next time the
system boots. To start it now:

.. code:: screen

    # service sshd start

The first time sshd starts on a FreeBSD system, the system's host keys
will be automatically created and the fingerprint will be displayed on
the console. Provide users with the fingerprint so that they can verify
it the first time they connect to the server.

Refer to
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
for the list of available options when starting sshd and a more complete
discussion about authentication, the login process, and the various
configuration files.

It is a good idea to limit which users can log into the SSH server and
from where using the ``AllowUsers`` keyword in the OpenSSH server
configuration file. For example, to only allow ``root`` to log in from
``192.168.1.32``, add this line to ``/etc/ssh/sshd_config``:

.. code:: programlisting

    AllowUsers root@192.168.1.32

To allow ``admin`` to log in from anywhere, list that user without
specifying an IP address:

.. code:: programlisting

    AllowUsers admin

Multiple users should be listed on the same line, like so:

.. code:: programlisting

    AllowUsers root@192.168.1.32 admin

After making changes to ``/etc/ssh/sshd_config``, tell sshd to reload
its configuration file by running:

.. code:: screen

    # service sshd reload

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When this keyword is used, it is important to list each user that needs
to log into this machine. Any user that is not specified in that line
will be locked out. Also, the keywords used in the OpenSSH server
configuration file are case-sensitive. If the keyword is not spelled
correctly, including its case, it will be ignored. Always test changes
to this file to make sure that the edits are working as expected. Refer
to
`sshd\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd_config&sektion=5>`__
to verify the spelling and use of the available keywords.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

Do not confuse ``/etc/ssh/sshd_config`` with ``/etc/ssh/ssh_config``
(note the extra ``d`` in the first filename). The first file configures
the server and the second file configures the client. Refer to
`ssh\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh_config&sektion=5>`__
for a listing of the available client settings,.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+--------------------------+-------------------------------+
| `Prev <ipsec.html>`__?   | `Up <security.html>`__   | ?\ `Next <fs-acl.html>`__     |
+--------------------------+--------------------------+-------------------------------+
| 14.7.?VPN over IPsec?    | `Home <index.html>`__    | ?14.9.?Access Control Lists   |
+--------------------------+--------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
