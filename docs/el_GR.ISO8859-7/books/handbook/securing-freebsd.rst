======================
15.3. Securing FreeBSD
======================

.. raw:: html

   <div class="navheader">

15.3. Securing FreeBSD
`????? <security-intro.html>`__?
???????? 15. ????????
?\ `??????? <crypt.html>`__

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

15.3. Securing FreeBSD
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Command vs. Protocol:
~~~~~~~~~~~~~~~~~~~~~

Throughout this document, we will use bold text to refer to an
application, and a ``monospaced`` font to refer to specific commands.
Protocols will use a normal font. This typographical distinction is
useful for instances such as ssh, since it is a protocol as well as
command.

.. raw:: html

   </div>

The sections that follow will cover the methods of securing your FreeBSD
system that were mentioned in the `last section <security-intro.html>`__
of this chapter.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.3.1. Securing the ``root`` Account and Staff Accounts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First off, do not bother securing staff accounts if you have not secured
the ``root`` account. Most systems have a password assigned to the
``root`` account. The first thing you do is assume that the password is
*always* compromised. This does not mean that you should remove the
password. The password is almost always necessary for console access to
the machine. What it does mean is that you should not make it possible
to use the password outside of the console or possibly even with the
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
command. For example, make sure that your ptys are specified as being
insecure in the ``/etc/ttys`` file so that direct ``root`` logins via
``telnet`` or ``rlogin`` are disallowed. If using other login services
such as sshd, make sure that direct ``root`` logins are disabled there
as well. You can do this by editing your ``/etc/ssh/sshd_config`` file,
and making sure that ``PermitRootLogin`` is set to ``NO``. Consider
every access method - services such as FTP often fall through the
cracks. Direct ``root`` logins should only be allowed via the system
console.

Of course, as a sysadmin you have to be able to get to ``root``, so we
open up a few holes. But we make sure these holes require additional
password verification to operate. One way to make ``root`` accessible is
to add appropriate staff accounts to the ``wheel`` group (in
``/etc/group``). The staff members placed in the ``wheel`` group are
allowed to ``su`` to ``root``. You should never give staff members
native ``wheel`` access by putting them in the ``wheel`` group in their
password entry. Staff accounts should be placed in a ``staff`` group,
and then added to the ``wheel`` group via the ``/etc/group`` file. Only
those staff members who actually need to have ``root`` access should be
placed in the ``wheel`` group. It is also possible, when using an
authentication method such as Kerberos, to use Kerberos' ``.k5login``
file in the ``root`` account to allow a
`ksu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ksu&sektion=1>`__ to
``root`` without having to place anyone at all in the ``wheel`` group.
This may be the better solution since the ``wheel`` mechanism still
allows an intruder to break ``root`` if the intruder has gotten hold of
your password file and can break into a staff account. While having the
``wheel`` mechanism is better than having nothing at all, it is not
necessarily the safest option.

An indirect way to secure staff accounts, and ultimately ``root`` access
is to use an alternative login access method and do what is known as
?starring? out the encrypted password for the staff accounts. Using the
`vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__
command, one can replace each instance of an encrypted password with a
single ?``*``? character. This command will update the
``/etc/master.passwd`` file and user/password database to disable
password-authenticated logins.

A staff account entry such as:

.. code:: programlisting

    foobar:R9DT/Fa1/LV9U:1000:1000::0:0:Foo Bar:/home/foobar:/usr/local/bin/tcsh

Should be changed to this:

.. code:: programlisting

    foobar:*:1000:1000::0:0:Foo Bar:/home/foobar:/usr/local/bin/tcsh

This change will prevent normal logins from occurring, since the
encrypted password will never match ?``*``?. With this done, staff
members must use another mechanism to authenticate themselves such as
`kerberos(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kerberos&sektion=1>`__
or `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
using a public/private key pair. When using something like Kerberos, one
generally must secure the machines which run the Kerberos servers and
your desktop workstation. When using a public/private key pair with ssh,
one must generally secure the machine used to login *from* (typically
one's workstation). An additional layer of protection can be added to
the key pair by password protecting the key pair when creating it with
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__.
Being able to ?star? out the passwords for staff accounts also
guarantees that staff members can only login through secure access
methods that you have set up. This forces all staff members to use
secure, encrypted connections for all of their sessions, which closes an
important hole used by many intruders: sniffing the network from an
unrelated, less secure machine.

The more indirect security mechanisms also assume that you are logging
in from a more restrictive server to a less restrictive server. For
example, if your main box is running all sorts of servers, your
workstation should not be running any. In order for your workstation to
be reasonably secure you should run as few servers as possible, up to
and including no servers at all, and you should run a password-protected
screen blanker. Of course, given physical access to a workstation an
attacker can break any sort of security you put on it. This is
definitely a problem that you should consider, but you should also
consider the fact that the vast majority of break-ins occur remotely,
over a network, from people who do not have physical access to your
workstation or servers.

Using something like Kerberos also gives you the ability to disable or
change the password for a staff account in one place, and have it
immediately affect all the machines on which the staff member may have
an account. If a staff member's account gets compromised, the ability to
instantly change his password on all machines should not be underrated.
With discrete passwords, changing a password on N machines can be a
mess. You can also impose re-passwording restrictions with Kerberos: not
only can a Kerberos ticket be made to timeout after a while, but the
Kerberos system can require that the user choose a new password after a
certain period of time (say, once a month).

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

15.3.2. Securing Root-run Servers and SUID/SGID Binaries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The prudent sysadmin only runs the servers he needs to, no more, no
less. Be aware that third party servers are often the most bug-prone.
For example, running an old version of imapd or popper is like giving a
universal ``root`` ticket out to the entire world. Never run a server
that you have not checked out carefully. Many servers do not need to be
run as ``root``. For example, the ntalk, comsat, and finger daemons can
be run in special user *sandboxes*. A sandbox is not perfect, unless you
go through a large amount of trouble, but the onion approach to security
still stands: If someone is able to break in through a server running in
a sandbox, they still have to break out of the sandbox. The more layers
the attacker must break through, the lower the likelihood of his
success. Root holes have historically been found in virtually every
server ever run as ``root``, including basic system servers. If you are
running a machine through which people only login via sshd and never
login via telnetd or rshd or rlogind, then turn off those services!

FreeBSD now defaults to running ntalkd, comsat, and finger in a sandbox.
Another program which may be a candidate for running in a sandbox is
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__.
``/etc/defaults/rc.conf`` includes the arguments necessary to run named
in a sandbox in a commented-out form. Depending on whether you are
installing a new system or upgrading an existing system, the special
user accounts used by these sandboxes may not be installed. The prudent
sysadmin would research and implement sandboxes for servers whenever
possible.

There are a number of other servers that typically do not run in
sandboxes: sendmail, popper, imapd, ftpd, and others. There are
alternatives to some of these, but installing them may require more work
than you are willing to perform (the convenience factor strikes again).
You may have to run these servers as ``root`` and rely on other
mechanisms to detect break-ins that might occur through them.

The other big potential ``root`` holes in a system are the suid-root and
sgid binaries installed on the system. Most of these binaries, such as
rlogin, reside in ``/bin``, ``/sbin``, ``/usr/bin``, or ``/usr/sbin``.
While nothing is 100% safe, the system-default suid and sgid binaries
can be considered reasonably safe. Still, ``root`` holes are
occasionally found in these binaries. A ``root`` hole was found in
``Xlib`` in 1998 that made xterm (which is typically suid) vulnerable.
It is better to be safe than sorry and the prudent sysadmin will
restrict suid binaries, that only staff should run, to a special group
that only staff can access, and get rid of (``chmod 000``) any suid
binaries that nobody uses. A server with no display generally does not
need an xterm binary. Sgid binaries can be almost as dangerous. If an
intruder can break an sgid-kmem binary, the intruder might be able to
read ``/dev/kmem`` and thus read the encrypted password file,
potentially compromising any passworded account. Alternatively an
intruder who breaks group ``kmem`` can monitor keystrokes sent through
ptys, including ptys used by users who login through secure methods. An
intruder that breaks the ``tty`` group can write to almost any user's
tty. If a user is running a terminal program or emulator with a
keyboard-simulation feature, the intruder can potentially generate a
data stream that causes the user's terminal to echo a command, which is
then run as that user.

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

15.3.3. Securing User Accounts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

User accounts are usually the most difficult to secure. While you can
impose draconian access restrictions on your staff and ?star? out their
passwords, you may not be able to do so with any general user accounts
you might have. If you do have sufficient control, then you may win out
and be able to secure the user accounts properly. If not, you simply
have to be more vigilant in your monitoring of those accounts. Use of
ssh and Kerberos for user accounts is more problematic, due to the extra
administration and technical support required, but still a very good
solution compared to a encrypted password file.

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

15.3.4. Securing the Password File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The only sure fire way is to star out as many passwords as you can and
use ssh or Kerberos for access to those accounts. Even though the
encrypted password file (``/etc/spwd.db``) can only be read by ``root``,
it may be possible for an intruder to obtain read access to that file
even if the attacker cannot obtain root-write access.

Your security scripts should always check for and report changes to the
password file (see the `Checking file
integrity <securing-freebsd.html#security-integrity>`__ section below).

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

15.3.5. Securing the Kernel Core, Raw Devices, and File systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If an attacker breaks ``root`` he can do just about anything, but there
are certain conveniences. For example, most modern kernels have a packet
sniffing device driver built in. Under FreeBSD it is called the ``bpf``
device. An intruder will commonly attempt to run a packet sniffer on a
compromised machine. You do not need to give the intruder the capability
and most systems do not have the need for the ``bpf`` device compiled
in.

But even if you turn off the ``bpf`` device, you still have ``/dev/mem``
and ``/dev/kmem`` to worry about. For that matter, the intruder can
still write to raw disk devices. Also, there is another kernel feature
called the module loader,
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
An enterprising intruder can use a KLD module to install his own ``bpf``
device, or other sniffing device, on a running kernel. To avoid these
problems you have to run the kernel at a higher secure level, at least
securelevel 1. The securelevel can be set with a ``sysctl`` on the
``kern.securelevel`` variable. Once you have set the securelevel to 1,
write access to raw devices will be denied and special ``chflags``
flags, such as ``schg``, will be enforced. You must also ensure that the
``schg`` flag is set on critical startup binaries, directories, and
script files - everything that gets run up to the point where the
securelevel is set. This might be overdoing it, and upgrading the system
is much more difficult when you operate at a higher secure level. You
may compromise and run the system at a higher secure level but not set
the ``schg`` flag for every system file and directory under the sun.
Another possibility is to simply mount ``/`` and ``/usr`` read-only. It
should be noted that being too draconian in what you attempt to protect
may prevent the all-important detection of an intrusion.

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

15.3.6. Checking File Integrity: Binaries, Configuration Files, Etc.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When it comes right down to it, you can only protect your core system
configuration and control files so much before the convenience factor
rears its ugly head. For example, using ``chflags`` to set the ``schg``
bit on most of the files in ``/`` and ``/usr`` is probably
counterproductive, because while it may protect the files, it also
closes a detection window. The last layer of your security onion is
perhaps the most important - detection. The rest of your security is
pretty much useless (or, worse, presents you with a false sense of
security) if you cannot detect potential intrusions. Half the job of the
onion is to slow down the attacker, rather than stop him, in order to be
able to catch him in the act.

The best way to detect an intrusion is to look for modified, missing, or
unexpected files. The best way to look for modified files is from
another (often centralized) limited-access system. Writing your security
scripts on the extra-secure limited-access system makes them mostly
invisible to potential attackers, and this is important. In order to
take maximum advantage you generally have to give the limited-access box
significant access to the other machines in the business, usually either
by doing a read-only NFS export of the other machines to the
limited-access box, or by setting up ssh key-pairs to allow the
limited-access box to ssh to the other machines. Except for its network
traffic, NFS is the least visible method - allowing you to monitor the
file systems on each client box virtually undetected. If your
limited-access server is connected to the client boxes through a switch,
the NFS method is often the better choice. If your limited-access server
is connected to the client boxes through a hub, or through several
layers of routing, the NFS method may be too insecure (network-wise) and
using ssh may be the better choice even with the audit-trail tracks that
ssh lays.

Once you have given a limited-access box at least read access to the
client systems it is supposed to monitor, you must write scripts to do
the actual monitoring. Given an NFS mount, you can write scripts out of
simple system utilities such as
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__
and `md5(1) <http://www.FreeBSD.org/cgi/man.cgi?query=md5&sektion=1>`__.
It is best to physically md5 the client-box files at least once a day,
and to test control files such as those found in ``/etc`` and
``/usr/local/etc`` even more often. When mismatches are found, relative
to the base md5 information the limited-access machine knows is valid,
it should scream at a sysadmin to go check it out. A good security
script will also check for inappropriate suid binaries and for new or
deleted files on system partitions such as ``/`` and ``/usr``.

When using ssh rather than NFS, writing the security script is much more
difficult. You essentially have to ``scp`` the scripts to the client box
in order to run them, making them visible, and for safety you also need
to ``scp`` the binaries (such as find) that those scripts use. The ssh
client on the client box may already be compromised. All in all, using
ssh may be necessary when running over insecure links, but it is also a
lot harder to deal with.

A good security script will also check for changes to user and staff
members access configuration files: ``.rhosts``, ``.shosts``,
``.ssh/authorized_keys`` and so forth, files that might fall outside the
purview of the ``MD5`` check.

If you have a huge amount of user disk space, it may take too long to
run through every file on those partitions. In this case, setting mount
flags to disallow suid binaries and devices on those partitions is a
good idea. The ``nodev`` and ``nosuid`` options (see
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__)
are what you want to look into. You should probably scan them anyway, at
least once a week, since the object of this layer is to detect a
break-in attempt, whether or not the attempt succeeds.

Process accounting (see
`accton(8) <http://www.FreeBSD.org/cgi/man.cgi?query=accton&sektion=8>`__)
is a relatively low-overhead feature of the operating system which might
help as a post-break-in evaluation mechanism. It is especially useful in
tracking down how an intruder has actually broken into a system,
assuming the file is still intact after the break-in has occured.

Finally, security scripts should process the log files, and the logs
themselves should be generated in as secure a manner as possible -
remote syslog can be very useful. An intruder will try to cover his
tracks, and log files are critical to the sysadmin trying to track down
the time and method of the initial break-in. One way to keep a permanent
record of the log files is to run the system console to a serial port
and collect the information to a secure machine monitoring the consoles.

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

15.3.7. Paranoia
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A little paranoia never hurts. As a rule, a sysadmin can add any number
of security features, as long as they do not affect convenience, and can
add security features that *do* affect convenience with some added
thought. Even more importantly, a security administrator should mix it
up a bit - if you use recommendations such as those given by this
document verbatim, you give away your methodologies to the prospective
attacker who also has access to this document.

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

15.3.8. Denial of Service Attacks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section covers Denial of Service attacks. A DoS attack is typically
a packet attack. While there is not much you can do about modern spoofed
packet attacks that saturate your network, you can generally limit the
damage by ensuring that the attacks cannot take down your servers by:

.. raw:: html

   <div class="orderedlist">

#. Limiting server forks.

#. Limiting springboard attacks (ICMP response attacks, ping broadcast,
   etc.).

#. Overloading the Kernel Route Cache.

.. raw:: html

   </div>

A common DoS attack scenario is attacking a forking server and making it
spawning so many child processes that the host system eventually runs
out of memory, file descriptors, etc. and then grinds to a halt. inetd
(see
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__)
has several options to limit this sort of attack. It should be noted
that while it is possible to prevent a machine from going down, it is
not generally possible to prevent a service from being disrupted by the
attack. Read the inetd manual page carefully and pay specific attention
to the ``-c``, ``-C``, and ``-R`` options. Note that spoofed-IP attacks
will circumvent the ``-C`` option to inetd, so typically a combination
of options must be used. Some standalone servers have
self-fork-limitation parameters.

Sendmail has its ``-OMaxDaemonChildren`` option, which tends to work
much better than trying to use Sendmail's load limiting options due to
the load lag. You should specify a ``MaxDaemonChildren`` parameter, when
you start sendmail; high enough to handle your expected load, but not so
high that the computer cannot handle that number of Sendmail instances
without falling on its face. It is also prudent to run Sendmail in
queued mode (``-ODeliveryMode=queued``) and to run the daemon
(``sendmail -bd``) separate from the queue-runs (``sendmail -q15m``). If
you still want real-time delivery you can run the queue at a much lower
interval, such as ``-q1m``, but be sure to specify a reasonable
``MaxDaemonChildren`` option for *that* Sendmail to prevent cascade
failures.

Syslogd can be attacked directly and it is strongly recommended that you
use the ``-s`` option whenever possible, and the ``-a`` option
otherwise.

You should also be fairly careful with connect-back services such as TCP
Wrapper's reverse-identd, which can be attacked directly. You generally
do not want to use the reverse-ident feature of TCP Wrapper for this
reason.

It is a very good idea to protect internal services from external access
by firewalling them off at your border routers. The idea here is to
prevent saturation attacks from outside your LAN, not so much to protect
internal services from network-based ``root`` compromise. Always
configure an exclusive firewall, i.e., ?firewall everything *except*
ports A, B, C, D, and M-Z?. This way you can firewall off all of your
low ports except for certain specific services such as named (if you are
primary for a zone), ntalkd, sendmail, and other Internet-accessible
services. If you try to configure the firewall the other way - as an
inclusive or permissive firewall, there is a good chance that you will
forget to ?close? a couple of services, or that you will add a new
internal service and forget to update the firewall. You can still open
up the high-numbered port range on the firewall, to allow
permissive-like operation, without compromising your low ports. Also
take note that FreeBSD allows you to control the range of port numbers
used for dynamic binding, via the various ``net.inet.ip.portrange``
``sysctl``'s (``sysctl -a | fgrep     portrange``), which can also ease
the complexity of your firewall's configuration. For example, you might
use a normal first/last range of 4000 to 5000, and a hiport range of
49152 to 65535, then block off everything under 4000 in your firewall
(except for certain specific Internet-accessible ports, of course).

Another common DoS attack is called a springboard attack - to attack a
server in a manner that causes the server to generate responses which
overloads the server, the local network, or some other machine. The most
common attack of this nature is the *ICMP ping broadcast attack*. The
attacker spoofs ping packets sent to your LAN's broadcast address with
the source IP address set to the actual machine they wish to attack. If
your border routers are not configured to stomp on ping packets to
broadcast addresses, your LAN winds up generating sufficient responses
to the spoofed source address to saturate the victim, especially when
the attacker uses the same trick on several dozen broadcast addresses
over several dozen different networks at once. Broadcast attacks of over
a hundred and twenty megabits have been measured. A second common
springboard attack is against the ICMP error reporting system. By
constructing packets that generate ICMP error responses, an attacker can
saturate a server's incoming network and cause the server to saturate
its outgoing network with ICMP responses. This type of attack can also
crash the server by running it out of memory, especially if the server
cannot drain the ICMP responses it generates fast enough. Use the sysctl
variable ``net.inet.icmp.icmplim`` to limit these attacks. The last
major class of springboard attacks is related to certain internal inetd
services such as the udp echo service. An attacker simply spoofs a UDP
packet with the source address being server A's echo port, and the
destination address being server B's echo port, where server A and B are
both on your LAN. The two servers then bounce this one packet back and
forth between each other. The attacker can overload both servers and
their LANs simply by injecting a few packets in this manner. Similar
problems exist with the internal chargen port. A competent sysadmin will
turn off all of these inetd-internal test services.

Spoofed packet attacks may also be used to overload the kernel route
cache. Refer to the ``net.inet.ip.rtexpire``, ``rtminexpire``, and
``rtmaxcache`` ``sysctl`` parameters. A spoofed packet attack that uses
a random source IP will cause the kernel to generate a temporary cached
route in the route table, viewable with ``netstat -rna | fgrep W3``.
These routes typically timeout in 1600 seconds or so. If the kernel
detects that the cached route table has gotten too big it will
dynamically reduce the ``rtexpire`` but will never decrease it to less
than ``rtminexpire``. There are two problems:

.. raw:: html

   <div class="orderedlist">

#. The kernel does not react quickly enough when a lightly loaded server
   is suddenly attacked.

#. The ``rtminexpire`` is not low enough for the kernel to survive a
   sustained attack.

.. raw:: html

   </div>

If your servers are connected to the Internet via a T3 or better, it may
be prudent to manually override both ``rtexpire`` and ``rtminexpire``
via
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.
Never set either parameter to zero (unless you want to crash the
machine). Setting both parameters to 2 seconds should be sufficient to
protect the route table from attack.

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

15.3.9. Access Issues with Kerberos and SSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are a few issues with both Kerberos and ssh that need to be
addressed if you intend to use them. Kerberos 5 is an excellent
authentication protocol, but there are bugs in the kerberized telnet and
rlogin applications that make them unsuitable for dealing with binary
streams. Also, by default Kerberos does not encrypt a session unless you
use the ``-x`` option. ssh encrypts everything by default.

Ssh works quite well in every respect except that it forwards encryption
keys by default. What this means is that if you have a secure
workstation holding keys that give you access to the rest of the system,
and you ssh to an insecure machine, your keys are usable. The actual
keys themselves are not exposed, but ssh installs a forwarding port for
the duration of your login, and if an attacker has broken ``root`` on
the insecure machine he can utilize that port to use your keys to gain
access to any other machine that your keys unlock.

We recommend that you use ssh in combination with Kerberos whenever
possible for staff logins. Ssh can be compiled with Kerberos support.
This reduces your reliance on potentially exposed ssh keys while at the
same time protecting passwords via Kerberos. Ssh keys should only be
used for automated tasks from secure machines (something that Kerberos
is unsuited to do). We also recommend that you either turn off
key-forwarding in the ssh configuration, or that you make use of the
``from=IP/DOMAIN`` option that ssh allows in its ``authorized_keys``
file to make the key only usable to entities logging in from specific
machines.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------+-------------------------------+
| `????? <security-intro.html>`__?   | `???? <security.html>`__   | ?\ `??????? <crypt.html>`__   |
+------------------------------------+----------------------------+-------------------------------+
| 15.2. Introduction?                | `???? <index.html>`__      | ?15.4. DES, MD5, and Crypt    |
+------------------------------------+----------------------------+-------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
