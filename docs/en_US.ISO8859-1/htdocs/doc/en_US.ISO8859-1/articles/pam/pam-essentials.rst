=================
3.?PAM Essentials
=================

.. raw:: html

   <div class="navheader">

3.?PAM Essentials
`Prev <pam-terms.html>`__?
?
?\ `Next <pam-config.html>`__

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

3.?PAM Essentials
-----------------

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

3.1.?Facilities and primitives
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The PAM API offers six different authentication primitives grouped in
four facilities, which are described below.

.. raw:: html

   <div class="variablelist">

``auth``
    *Authentication.* This facility concerns itself with authenticating
    the applicant and establishing the account credentials. It provides
    two primitives:

    .. raw:: html

       <div class="itemizedlist">

    -  `pam\_authenticate(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_authenticate&sektion=3>`__
       authenticates the applicant, usually by requesting an
       authentication token and comparing it with a value stored in a
       database or obtained from an authentication server.

    -  `pam\_setcred(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_setcred&sektion=3>`__
       establishes account credentials such as user ID, group membership
       and resource limits.

    .. raw:: html

       </div>

``account``
    *Account management.* This facility handles
    non-authentication-related issues of account availability, such as
    access restrictions based on the time of day or the server's work
    load. It provides a single primitive:

    .. raw:: html

       <div class="itemizedlist">

    -  `pam\_acct\_mgmt(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_acct_mgmt&sektion=3>`__
       verifies that the requested account is available.

    .. raw:: html

       </div>

``session``
    *Session management.* This facility handles tasks associated with
    session set-up and tear-down, such as login accounting. It provides
    two primitives:

    .. raw:: html

       <div class="itemizedlist">

    -  `pam\_open\_session(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_open_session&sektion=3>`__
       performs tasks associated with session set-up: add an entry in
       the ``utmp`` and ``wtmp`` databases, start an SSH agent, etc.

    -  `pam\_close\_session(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_close_session&sektion=3>`__
       performs tasks associated with session tear-down: add an entry in
       the ``utmp`` and ``wtmp`` databases, stop the SSH agent, etc.

    .. raw:: html

       </div>

``password``
    *Password management.* This facility is used to change the
    authentication token associated with an account, either because it
    has expired or because the user wishes to change it. It provides a
    single primitive:

    .. raw:: html

       <div class="itemizedlist">

    -  `pam\_chauthtok(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_chauthtok&sektion=3>`__
       changes the authentication token, optionally verifying that it is
       sufficiently hard to guess, has not been used previously, etc.

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

3.2.?Modules
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modules are a very central concept in PAM; after all, they are the “M”
in “PAM”. A PAM module is a self-contained piece of program code that
implements the primitives in one or more facilities for one particular
mechanism; possible mechanisms for the authentication facility, for
instance, include the UNIX? password database, NIS, LDAP and Radius.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.2.1.?Module Naming
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD implements each mechanism in a single module, named
``pam_mechanism``.so (for instance, ``pam_unix.so`` for the UNIX?
mechanism.) Other implementations sometimes have separate modules for
separate facilities, and include the facility name as well as the
mechanism name in the module name. To name one example, Solaris™ has a
``pam_dial_auth.so.1`` module which is commonly used to authenticate
dialup users.

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

3.2.2.?Module Versioning
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD's original PAM implementation, based on Linux-PAM, did not use
version numbers for PAM modules. This would commonly cause problems with
legacy applications, which might be linked against older versions of the
system libraries, as there was no way to load a matching version of the
required modules.

OpenPAM, on the other hand, looks for modules that have the same version
number as the PAM library (currently 2), and only falls back to an
unversioned module if no versioned module could be loaded. Thus legacy
modules can be provided for legacy applications, while allowing new (or
newly built) applications to take advantage of the most recent modules.

Although Solaris™ PAM modules commonly have a version number, they are
not truly versioned, because the number is a part of the module name and
must be included in the configuration.

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

3.3.?Chains and policies
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When a server initiates a PAM transaction, the PAM library tries to load
a policy for the service specified in the
`pam\_start(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_start&sektion=3>`__
call. The policy specifies how authentication requests should be
processed, and is defined in a configuration file. This is the other
central concept in PAM: the possibility for the admin to tune the system
security policy (in the wider sense of the word) simply by editing a
text file.

A policy consists of four chains, one for each of the four PAM
facilities. Each chain is a sequence of configuration statements, each
specifying a module to invoke, some (optional) parameters to pass to the
module, and a control flag that describes how to interpret the return
code from the module.

Understanding the control flags is essential to understanding PAM
configuration files. There are four different control flags:

.. raw:: html

   <div class="variablelist">

``binding``
    If the module succeeds and no earlier module in the chain has
    failed, the chain is immediately terminated and the request is
    granted. If the module fails, the rest of the chain is executed, but
    the request is ultimately denied.

    This control flag was introduced by Sun in Solaris™ 9 (SunOS™ 5.9),
    and is also supported by OpenPAM.

``required``
    If the module succeeds, the rest of the chain is executed, and the
    request is granted unless some other module fails. If the module
    fails, the rest of the chain is also executed, but the request is
    ultimately denied.

``requisite``
    If the module succeeds, the rest of the chain is executed, and the
    request is granted unless some other module fails. If the module
    fails, the chain is immediately terminated and the request is
    denied.

``sufficient``
    If the module succeeds and no earlier module in the chain has
    failed, the chain is immediately terminated and the request is
    granted. If the module fails, the module is ignored and the rest of
    the chain is executed.

    As the semantics of this flag may be somewhat confusing, especially
    when it is used for the last module in a chain, it is recommended
    that the ``binding`` control flag be used instead if the
    implementation supports it.

``optional``
    The module is executed, but its result is ignored. If all modules in
    a chain are marked ``optional``, all requests will always be
    granted.

.. raw:: html

   </div>

When a server invokes one of the six PAM primitives, PAM retrieves the
chain for the facility the primitive belongs to, and invokes each of the
modules listed in the chain, in the order they are listed, until it
reaches the end, or determines that no further processing is necessary
(either because a ``binding`` or ``sufficient`` module succeeded, or
because a ``requisite`` module failed.) The request is granted if and
only if at least one module was invoked, and all non-optional modules
succeeded.

Note that it is possible, though not very common, to have the same
module listed several times in the same chain. For instance, a module
that looks up user names and passwords in a directory server could be
invoked multiple times with different parameters specifying different
directory servers to contact. PAM treat different occurrences of the
same module in the same chain as different, unrelated modules.

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

3.4.?Transactions
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The lifecycle of a typical PAM transaction is described below. Note that
if any of these steps fails, the server should report a suitable error
message to the client and abort the transaction.

.. raw:: html

   <div class="orderedlist">

#. If necessary, the server obtains arbitrator credentials through a
   mechanism independent of PAM—most commonly by virtue of having been
   started by ``root``, or of being setuid ``root``.

#. The server calls
   `pam\_start(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_start&sektion=3>`__
   to initialize the PAM library and specify its service name and the
   target account, and register a suitable conversation function.

#. The server obtains various information relating to the transaction
   (such as the applicant's user name and the name of the host the
   client runs on) and submits it to PAM using
   `pam\_set\_item(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_set_item&sektion=3>`__.

#. The server calls
   `pam\_authenticate(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_authenticate&sektion=3>`__
   to authenticate the applicant.

#. The server calls
   `pam\_acct\_mgmt(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_acct_mgmt&sektion=3>`__
   to verify that the requested account is available and valid. If the
   password is correct but has expired,
   `pam\_acct\_mgmt(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_acct_mgmt&sektion=3>`__
   will return ``PAM_NEW_AUTHTOK_REQD`` instead of ``PAM_SUCCESS``.

#. If the previous step returned ``PAM_NEW_AUTHTOK_REQD``, the server
   now calls
   `pam\_chauthtok(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_chauthtok&sektion=3>`__
   to force the client to change the authentication token for the
   requested account.

#. Now that the applicant has been properly authenticated, the server
   calls
   `pam\_setcred(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_setcred&sektion=3>`__
   to establish the credentials of the requested account. It is able to
   do this because it acts on behalf of the arbitrator, and holds the
   arbitrator's credentials.

#. Once the correct credentials have been established, the server calls
   `pam\_open\_session(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_open_session&sektion=3>`__
   to set up the session.

#. The server now performs whatever service the client requested—for
   instance, provide the applicant with a shell.

#. Once the server is done serving the client, it calls
   `pam\_close\_session(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_close_session&sektion=3>`__
   to tear down the session.

#. Finally, the server calls
   `pam\_end(3) <http://www.FreeBSD.org/cgi/man.cgi?query=pam_end&sektion=3>`__
   to notify the PAM library that it is done and that it can release
   whatever resources it has allocated in the course of the transaction.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+---------------------------------+
| `Prev <pam-terms.html>`__?   | ?                       | ?\ `Next <pam-config.html>`__   |
+------------------------------+-------------------------+---------------------------------+
| 2.?Terms and conventions?    | `Home <index.html>`__   | ?4.?PAM Configuration           |
+------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
