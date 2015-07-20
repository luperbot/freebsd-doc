==================
15.2. Introduction
==================

.. raw:: html

   <div class="navheader">

15.2. Introduction
`????? <security.html>`__?
???????? 15. ????????
?\ `??????? <securing-freebsd.html>`__

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

15.2. Introduction
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Security is a function that begins and ends with the system
administrator. While all BSD UNIX(R) multi-user systems have some
inherent security, the job of building and maintaining additional
security mechanisms to keep those users ?honest? is probably one of the
single largest undertakings of the sysadmin. Machines are only as secure
as you make them, and security concerns are ever competing with the
human necessity for convenience. UNIX(R) systems, in general, are
capable of running a huge number of simultaneous processes and many of
these processes operate as servers - meaning that external entities can
connect and talk to them. As yesterday's mini-computers and mainframes
become today's desktops, and as computers become networked and
inter-networked, security becomes an even bigger issue.

System security also pertains to dealing with various forms of attack,
including attacks that attempt to crash, or otherwise make a system
unusable, but do not attempt to compromise the ``root`` account (?break
root?). Security concerns can be split up into several categories:

.. raw:: html

   <div class="orderedlist">

#. Denial of service attacks.

#. User account compromises.

#. Root compromise through accessible servers.

#. Root compromise via user accounts.

#. Backdoor creation.

.. raw:: html

   </div>

A denial of service attack is an action that deprives the machine of
needed resources. Typically, DoS attacks are brute-force mechanisms that
attempt to crash or otherwise make a machine unusable by overwhelming
its servers or network stack. Some DoS attacks try to take advantage of
bugs in the networking stack to crash a machine with a single packet.
The latter can only be fixed by applying a bug fix to the kernel.
Attacks on servers can often be fixed by properly specifying options to
limit the load the servers incur on the system under adverse conditions.
Brute-force network attacks are harder to deal with. A spoofed-packet
attack, for example, is nearly impossible to stop, short of cutting your
system off from the Internet. It may not be able to take your machine
down, but it can saturate your Internet connection.

A user account compromise is even more common than a DoS attack. Many
sysadmins still run standard telnetd, rlogind, rshd, and ftpd servers on
their machines. These servers, by default, do not operate over encrypted
connections. The result is that if you have any moderate-sized user
base, one or more of your users logging into your system from a remote
location (which is the most common and convenient way to login to a
system) will have his or her password sniffed. The attentive system
admin will analyze his remote access logs looking for suspicious source
addresses even for successful logins.

One must always assume that once an attacker has access to a user
account, the attacker can break ``root``. However, the reality is that
in a well secured and maintained system, access to a user account does
not necessarily give the attacker access to ``root``. The distinction is
important because without access to ``root`` the attacker cannot
generally hide his tracks and may, at best, be able to do nothing more
than mess with the user's files, or crash the machine. User account
compromises are very common because users tend not to take the
precautions that sysadmins take.

System administrators must keep in mind that there are potentially many
ways to break ``root`` on a machine. The attacker may know the ``root``
password, the attacker may find a bug in a root-run server and be able
to break ``root`` over a network connection to that server, or the
attacker may know of a bug in a suid-root program that allows the
attacker to break ``root`` once he has broken into a user's account. If
an attacker has found a way to break ``root`` on a machine, the attacker
may not have a need to install a backdoor. Many of the ``root`` holes
found and closed to date involve a considerable amount of work by the
attacker to cleanup after himself, so most attackers install backdoors.
A backdoor provides the attacker with a way to easily regain ``root``
access to the system, but it also gives the smart system administrator a
convenient way to detect the intrusion. Making it impossible for an
attacker to install a backdoor may actually be detrimental to your
security, because it will not close off the hole the attacker found to
break in the first place.

Security remedies should always be implemented with a multi-layered
?onion peel? approach and can be categorized as follows:

.. raw:: html

   <div class="orderedlist">

#. Securing ``root`` and staff accounts.

#. Securing ``root``-run servers and suid/sgid binaries.

#. Securing user accounts.

#. Securing the password file.

#. Securing the kernel core, raw devices, and file systems.

#. Quick detection of inappropriate changes made to the system.

#. Paranoia.

.. raw:: html

   </div>

The next section of this chapter will cover the above bullet items in
greater depth.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+----------------------------+------------------------------------------+
| `????? <security.html>`__?   | `???? <security.html>`__   | ?\ `??????? <securing-freebsd.html>`__   |
+------------------------------+----------------------------+------------------------------------------+
| ???????? 15. ?????????       | `???? <index.html>`__      | ?15.3. Securing FreeBSD                  |
+------------------------------+----------------------------+------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
