======================
5.?FreeBSD PAM Modules
======================

.. raw:: html

   <div class="navheader">

5.?FreeBSD PAM Modules
`Prev <pam-config.html>`__?
?
?\ `Next <pam-appl-prog.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.?FreeBSD PAM Modules
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?\ `pam\_deny(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_deny&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_deny(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_deny&sektion=8>`__
module is one of the simplest modules available; it responds to any
request with ``PAM_AUTH_ERR``. It is useful for quickly disabling a
service (add it to the top of every chain), or for terminating chains of
``sufficient`` modules.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.?\ `pam\_echo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_echo&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_echo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_echo&sektion=8>`__
module simply passes its arguments to the conversation function as a
``PAM_TEXT_INFO`` message. It is mostly useful for debugging, but can
also serve to display messages such as “Unauthorized access will be
prosecuted” before starting the authentication procedure.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.?\ `pam\_exec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_exec&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_exec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_exec&sektion=8>`__
module takes its first argument to be the name of a program to execute,
and the remaining arguments are passed to that program as command-line
arguments. One possible application is to use it to run a program at
login time which mounts the user's home directory.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.?\ `pam\_ftpusers(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ftpusers&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_ftpusers(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ftpusers&sektion=8>`__
module

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.5.?\ `pam\_group(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_group&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_group(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_group&sektion=8>`__
module accepts or rejects applicants on the basis of their membership in
a particular file group (normally ``wheel`` for
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__). It
is primarily intended for maintaining the traditional behaviour of BSD
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__, but
has many other uses, such as excluding certain groups of users from a
particular service.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.6.?\ `pam\_guest(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_guest&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_guest(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_guest&sektion=8>`__
module allows guest logins using fixed login names. Various requirements
can be placed on the password, but the default behaviour is to allow any
password as long as the login name is that of a guest account. The
`pam\_guest(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_guest&sektion=8>`__
module can easily be used to implement anonymous FTP logins.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.7.?\ `pam\_krb5(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_krb5&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_krb5(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_krb5&sektion=8>`__
module

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.8.?\ `pam\_ksu(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ksu&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_ksu(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ksu&sektion=8>`__
module

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.9.?\ `pam\_lastlog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_lastlog&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_lastlog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_lastlog&sektion=8>`__
module

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.10.?\ `pam\_login\_access(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_login_access&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_login\_access(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_login_access&sektion=8>`__
module provides an implementation of the account management primitive
which enforces the login restrictions specified in the
`login.access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.access&sektion=5>`__
table.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.11.?\ `pam\_nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_nologin&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_nologin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_nologin&sektion=8>`__
module refuses non-root logins when ``/var/run/nologin`` exists. This
file is normally created by
`shutdown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=shutdown&sektion=8>`__
when less than five minutes remain until the scheduled shutdown time.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.12.?\ `pam\_opie(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opie&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_opie(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opie&sektion=8>`__
module implements the
`opie(4) <http://www.FreeBSD.org/cgi/man.cgi?query=opie&sektion=4>`__
authentication method. The
`opie(4) <http://www.FreeBSD.org/cgi/man.cgi?query=opie&sektion=4>`__
system is a challenge-response mechanism where the response to each
challenge is a direct function of the challenge and a passphrase, so the
response can be easily computed “just in time” by anyone possessing the
passphrase, eliminating the need for password lists. Moreover, since
`opie(4) <http://www.FreeBSD.org/cgi/man.cgi?query=opie&sektion=4>`__
never reuses a challenge that has been correctly answered, it is not
vulnerable to replay attacks.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.13.?\ `pam\_opieaccess(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opieaccess&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_opieaccess(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opieaccess&sektion=8>`__
module is a companion module to
`pam\_opie(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opie&sektion=8>`__.
Its purpose is to enforce the restrictions codified in
`opieaccess(5) <http://www.FreeBSD.org/cgi/man.cgi?query=opieaccess&sektion=5>`__,
which regulate the conditions under which a user who would normally
authenticate herself using
`opie(4) <http://www.FreeBSD.org/cgi/man.cgi?query=opie&sektion=4>`__ is
allowed to use alternate methods. This is most often used to prohibit
the use of password authentication from untrusted hosts.

In order to be effective, the
`pam\_opieaccess(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opieaccess&sektion=8>`__
module must be listed as ``requisite`` immediately after a
``sufficient`` entry for
`pam\_opie(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_opie&sektion=8>`__,
and before any other modules, in the ``auth`` chain.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.14.?\ `pam\_passwdqc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_passwdqc&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_passwdqc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_passwdqc&sektion=8>`__
module

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.15.?\ `pam\_permit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_permit&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_permit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_permit&sektion=8>`__
module is one of the simplest modules available; it responds to any
request with ``PAM_SUCCESS``. It is useful as a placeholder for services
where one or more chains would otherwise be empty.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.16.?\ `pam\_radius(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_radius&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_radius(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_radius&sektion=8>`__
module

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.17.?\ `pam\_rhosts(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_rhosts&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_rhosts(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_rhosts&sektion=8>`__
module

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.18.?\ `pam\_rootok(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_rootok&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_rootok(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_rootok&sektion=8>`__
module reports success if and only if the real user id of the process
calling it (which is assumed to be run by the applicant) is 0. This is
useful for non-networked services such as
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ or
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__,
to which the ``root`` should have automatic access.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.19.?\ `pam\_securetty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_securetty&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_securetty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_securetty&sektion=8>`__
module

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.20.?\ `pam\_self(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_self&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_self(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_self&sektion=8>`__
module reports success if and only if the names of the applicant matches
that of the target account. It is most useful for non-networked services
such as
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__, where
the identity of the applicant can be easily verified.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.21.?\ `pam\_ssh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ssh&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_ssh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_ssh&sektion=8>`__
module provides both authentication and session services. The
authentication service allows users who have passphrase-protected SSH
secret keys in their ``~/.ssh`` directory to authenticate themselves by
typing their passphrase. The session service starts
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
and preloads it with the keys that were decrypted in the authentication
phase. This feature is particularly useful for local logins, whether in
X (using
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__ or
another PAM-aware X login manager) or at the console.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.22.?\ `pam\_tacplus(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_tacplus&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_tacplus(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_tacplus&sektion=8>`__
module

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.23.?\ `pam\_unix(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_unix&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`pam\_unix(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_unix&sektion=8>`__
module implements traditional UNIX? password authentication, using
`getpwnam(3) <http://www.FreeBSD.org/cgi/man.cgi?query=getpwnam&sektion=3>`__
to obtain the target account's password and compare it with the one
provided by the applicant. It also provides account management services
(enforcing account and password expiration times) and password-changing
services. This is probably the single most useful module, as the great
majority of admins will want to maintain historical behaviour for at
least some services.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+------------------------------------+
| `Prev <pam-config.html>`__?   | ?                       | ?\ `Next <pam-appl-prog.html>`__   |
+-------------------------------+-------------------------+------------------------------------+
| 4.?PAM Configuration?         | `Home <index.html>`__   | ?6.?PAM Application Programming    |
+-------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
