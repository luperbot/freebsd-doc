========================
2.?Terms and conventions
========================

.. raw:: html

   <div class="navheader">

2.?Terms and conventions
`Prev <index.html>`__?
?
?\ `Next <pam-essentials.html>`__

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

2.?Terms and conventions
------------------------

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

2.1.?Definitions
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The terminology surrounding PAM is rather confused. Neither Samar and
Lai's original paper nor the XSSO specification made any attempt at
formally defining terms for the various actors and entities involved in
PAM, and the terms that they do use (but do not define) are sometimes
misleading and ambiguous. The first attempt at establishing a consistent
and unambiguous terminology was a whitepaper written by Andrew G. Morgan
(author of Linux-PAM) in 1999. While Morgan's choice of terminology was
a huge leap forward, it is in this author's opinion by no means perfect.
What follows is an attempt, heavily inspired by Morgan, to define
precise and unambiguous terms for all actors and entities involved in
PAM.

.. raw:: html

   <div class="glosslist">

account
    The set of credentials the applicant is requesting from the
    arbitrator.

applicant
    The user or entity requesting authentication.

arbitrator
    The user or entity who has the privileges necessary to verify the
    applicant's credentials and the authority to grant or deny the
    request.

chain
    A sequence of modules that will be invoked in response to a PAM
    request. The chain includes information about the order in which to
    invoke the modules, what arguments to pass to them, and how to
    interpret the results.

client
    The application responsible for initiating an authentication request
    on behalf of the applicant and for obtaining the necessary
    authentication information from him.

facility
    One of the four basic groups of functionality provided by PAM:
    authentication, account management, session management and
    authentication token update.

module
    A collection of one or more related functions implementing a
    particular authentication facility, gathered into a single (normally
    dynamically loadable) binary file and identified by a single name.

policy
    The complete set of configuration statements describing how to
    handle PAM requests for a particular service. A policy normally
    consists of four chains, one for each facility, though some services
    do not use all four facilities.

server
    The application acting on behalf of the arbitrator to converse with
    the client, retrieve authentication information, verify the
    applicant's credentials and grant or deny requests.

service
    A class of servers providing similar or related functionality and
    requiring similar authentication. PAM policies are defined on a
    per-service basis, so all servers that claim the same service name
    will be subject to the same policy.

session
    The context within which service is rendered to the applicant by the
    server. One of PAM's four facilities, session management, is
    concerned exclusively with setting up and tearing down this context.

token
    A chunk of information associated with the account, such as a
    password or passphrase, which the applicant must provide to prove
    his identity.

transaction
    A sequence of requests from the same applicant to the same instance
    of the same server, beginning with authentication and session set-up
    and ending with session tear-down.

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

2.2.?Usage examples
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section aims to illustrate the meanings of some of the terms
defined above by way of a handful of simple examples.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.?Client and server are one
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This simple example shows ``alice``
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__'ing to
``root``.

.. code:: screen

    % whoami
    alice
    % ls -l `which su`
    -r-sr-xr-x  1 root  wheel  10744 Dec  6 19:06 /usr/bin/su
    % su -
    Password: xi3kiune
    # whoami
    root

.. raw:: html

   <div class="itemizedlist">

-  The applicant is ``alice``.

-  The account is ``root``.

-  The `su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
   process is both client and server.

-  The authentication token is ``xi3kiune``.

-  The arbitrator is ``root``, which is why
   `su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ is
   setuid ``root``.

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

2.2.2.?Client and server are separate
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The example below shows ``eve`` try to initiate an
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
connection to ``login.example.com``, ask to log in as ``bob``, and
succeed. Bob should have chosen a better password!

.. code:: screen

    % whoami
    eve
    % ssh bob@login.example.com
    bob@login.example.com's password: god
    Last login: Thu Oct 11 09:52:57 2001 from 192.168.0.1
    Copyright (c) 1980, 1983, 1986, 1988, 1990, 1991, 1993, 1994
        The Regents of the University of California.  All rights reserved.
    FreeBSD 4.4-STABLE (LOGIN) #4: Tue Nov 27 18:10:34 PST 2001

    Welcome to FreeBSD!
    %

.. raw:: html

   <div class="itemizedlist">

-  The applicant is ``eve``.

-  The client is Eve's
   `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
   process.

-  The server is the
   `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
   process on ``login.example.com``

-  The account is ``bob``.

-  The authentication token is ``god``.

-  Although this is not shown in this example, the arbitrator is
   ``root``.

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

2.2.3.?Sample policy
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following is FreeBSD's default policy for ``sshd``:

.. code:: programlisting

    sshd    auth        required    pam_nologin.so  no_warn
    sshd    auth        required    pam_unix.so no_warn try_first_pass
    sshd    account     required    pam_login_access.so
    sshd    account     required    pam_unix.so
    sshd    session     required    pam_lastlog.so  no_fail
    sshd    password    required    pam_permit.so

.. raw:: html

   <div class="itemizedlist">

-  This policy applies to the ``sshd`` service (which is not necessarily
   restricted to the
   `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
   server.)

-  ``auth``, ``account``, ``session`` and ``password`` are facilities.

-  ``pam_nologin.so``, ``pam_unix.so``, ``pam_login_access.so``,
   ``pam_lastlog.so`` and ``pam_permit.so`` are modules. It is clear
   from this example that ``pam_unix.so`` provides at least two
   facilities (authentication and account management.)

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+-------------------------------------+
| `Prev <index.html>`__?              | ?                       | ?\ `Next <pam-essentials.html>`__   |
+-------------------------------------+-------------------------+-------------------------------------+
| Pluggable Authentication Modules?   | `Home <index.html>`__   | ?3.?PAM Essentials                  |
+-------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
