=======================
3.?Client Configuration
=======================

.. raw:: html

   <div class="navheader">

3.?Client Configuration
`Prev <ldap.html>`__?
?
?\ `Next <secure.html>`__

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

3.?Client Configuration
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The client should already have OpenLDAP libraries from `Section?2.1.3,
“Configuring the Client” <ldap.html#ldap-connect-client>`__, but if you
are installing several client machines you will need to install
`net/openldap24-client <http://www.freebsd.org/cgi/url.cgi?ports/net/openldap24-client/pkg-descr>`__
on each of them.

FreeBSD requires two ports to be installed to authenticate against an
LDAP server,
`security/pam\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/security/pam_ldap/pkg-descr>`__
and
`net/nss\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/net/nss_ldap/pkg-descr>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Authentication
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`security/pam\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/security/pam_ldap/pkg-descr>`__
is configured via ``/usr/local/etc/ldap.conf``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This is a *different file* than the OpenLDAP library functions'
configuration file, ``/usr/local/etc/openldap/ldap.conf``; however, it
takes many of the same options; in fact it is a superset of that file.
For the rest of this section, references to ``ldap.conf`` will mean
``/usr/local/etc/ldap.conf``.

.. raw:: html

   </div>

Thus, we will want to copy all of our original configuration parameters
from ``openldap/ldap.conf`` to the new ``ldap.conf``. Once this is done,
we want to tell
`security/pam\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/security/pam_ldap/pkg-descr>`__
what to look for on the directory server.

We are identifying our users with the ``uid`` attribute. To configure
this (though it is the default), set the ``pam_login_attribute``
directive in ``ldap.conf``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.?Setting ``pam_login_attribute``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    pam_login_attribute uid

.. raw:: html

   </div>

.. raw:: html

   </div>

With this set,
`security/pam\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/security/pam_ldap/pkg-descr>`__
will search the entire LDAP directory under ``base`` for the value
``uid=username``. If it finds one and only one entry, it will attempt to
bind as that user with the password it was given. If it binds correctly,
then it will allow access. Otherwise it will fail.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.1.?PAM
^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PAM, which stands for “Pluggable Authentication Modules”, is the method
by which FreeBSD authenticates most of its sessions. To tell FreeBSD we
wish to use an LDAP server, we will have to add a line to the
appropriate PAM file.

Most of the time the appropriate PAM file is ``/etc/pam.d/sshd``, if you
want to use SSH (remember to set the relevant options in
``/etc/ssh/sshd_config``, otherwise SSH will not use PAM).

To use PAM for authentication, add the line

.. code:: programlisting

    auth  sufficient  /usr/local/lib/pam_ldap.so  no_warn

Exactly where this line shows up in the file and which options appear in
the fourth column determine the exact behavior of the authentication
mechanism; see
`pam.d(5) <http://www.FreeBSD.org/cgi/man.cgi?query=pam.d&sektion=5>`__

With this configuration you should be able to authenticate a user
against an LDAP directory. PAM will perform a bind with your
credentials, and if successful will tell SSH to allow access.

However it is not a good idea to allow *every* user in the directory
into *every* client machine. With the current configuration, all that a
user needs to log into a machine is an LDAP entry. Fortunately there are
a few ways to restrict user access.

``ldap.conf`` supports a ``pam_groupdn`` directive; every account that
connects to this machine needs to be a member of the group specified
here. For example, if you have

.. code:: programlisting

    pam_groupdn cn=servername,ou=accessgroups,dc=example,dc=org

in ``ldap.conf``, then only members of that group will be able to log
in. There are a few things to bear in mind, however.

Members of this group are specified in one or more ``memberUid``
attributes, and each attribute must have the full distinguished name of
the member. So ``memberUid: someuser`` will not work; it must be:

.. code:: programlisting

    memberUid: uid=someuser,ou=people,dc=example,dc=org

Additionally, this directive is not checked in PAM during
authentication, it is checked during account management, so you will
need a second line in your PAM files under ``account``. This will
require, in turn, *every* user to be listed in the group, which is not
necessarily what we want. To avoid blocking users that are not in LDAP,
you should enable the ``ignore_unknown_user`` attribute. Finally, you
should set the ``ignore_authinfo_unavail`` option so that you are not
locked out of every computer when the LDAP server is unavailable.

Your ``pam.d/sshd`` might then end up looking like this:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.?Sample ``pam.d/sshd``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    auth            required        pam_nologin.so          no_warn
    auth            sufficient      pam_opie.so             no_warn no_fake_prompts
    auth            requisite       pam_opieaccess.so       no_warn allow_local
    auth            sufficient      /usr/local/lib/pam_ldap.so      no_warn
    auth            required        pam_unix.so             no_warn try_first_pass

    account         required        pam_login_access.so
    account         required        /usr/local/lib/pam_ldap.so      no_warn ignore_authinfo_unavail ignore_unknown_user

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Since we are adding these lines specifically to ``pam.d/sshd``, this
will only have an effect on SSH sessions. LDAP users will be unable to
log in at the console. To change this behavior, examine the other files
in ``/etc/pam.d`` and modify them accordingly.

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

3.2.?Name Service Switch
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NSS is the service that maps attributes to names. So, for example, if a
file is owned by user ``1001``, an application will query NSS for the
name of ``1001``, and it might get ``bob`` or ``ted`` or whatever the
user's name is.

Now that our user information is kept in LDAP, we need to tell NSS to
look there when queried.

The
`net/nss\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/net/nss_ldap/pkg-descr>`__
port does this. It uses the same configuration file as
`security/pam\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/security/pam_ldap/pkg-descr>`__,
and should not need any extra parameters once it is installed. Instead,
what is left is simply to edit ``/etc/nsswitch.conf`` to take advantage
of the directory. Simply replace the following lines:

.. code:: programlisting

    group: compat
    passwd: compat

with

.. code:: programlisting

    group: files ldap
    passwd: files ldap

This will allow you to map usernames to UIDs and UIDs to usernames.

Congratulations! You should now have working LDAP authentication.

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

3.3.?Caveats
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unfortunately, as of the time this was written FreeBSD did not support
changing user passwords with
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__.
Because of this, most administrators are left to implement a solution
themselves. I provide some examples here. Note that if you write your
own password change script, there are some security issues you should be
made aware of; see `Section?4.3, “Password
Storage” <secure.html#security-passwd>`__

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.?Shell Script for Changing Passwords

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    #!/bin/sh

    stty -echo
    read -p "Old Password: " oldp; echo
    read -p "New Password: " np1; echo
    read -p "Retype New Password: " np2; echo
    stty echo

    if [ "$np1" != "$np2" ]; then
      echo "Passwords do not match."
      exit 1
    fi

    ldappasswd -D uid="$USER",ou=people,dc=example,dc=org \
      -w "$oldp" \
      -a "$oldp" \
      -s "$np1"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="caution" xmlns="">

Caution:
~~~~~~~~

This script does hardly any error checking, but more important it is
very cavalier about how it stores your passwords. If you do anything
like this, at least adjust the ``security.bsd.see_other_uids`` sysctl
value:

.. code:: screen

    # sysctl security.bsd.see_other_uids=0.

.. raw:: html

   </div>

A more flexible (and probably more secure) approach can be used by
writing a custom program, or even a web interface. The following is part
of a Ruby library that can change LDAP passwords. It sees use both on
the command line, and on the web.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.?Ruby Script for Changing Passwords

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    require 'ldap'
    require 'base64'
    require 'digest'
    require 'password' # ruby-password

    ldap_server = "ldap.example.org"
    luser = "uid=#{ENV['USER']},ou=people,dc=example,dc=org"

    # get the new password, check it, and create a salted hash from it
    def get_password
      pwd1 = Password.get("New Password: ")
      pwd2 = Password.get("Retype New Password: ")

      raise if pwd1 != pwd2
      pwd1.check # check password strength

      salt = rand.to_s.gsub(/0\./, '')
      pass = pwd1.to_s
      hash = "{SSHA}"+Base64.encode64(Digest::SHA1.digest("#{pass}#{salt}")+salt).chomp!
      return hash
    end

    oldp = Password.get("Old Password: ")
    newp = get_password

    # We'll just replace it.  That we can bind proves that we either know
    # the old password or are an admin.

    replace = LDAP::Mod.new(LDAP::LDAP_MOD_REPLACE | LDAP::LDAP_MOD_BVALUES,
                            "userPassword",
                            [newp])

    conn = LDAP::SSLConn.new(ldap_server, 389, true)
    conn.set_option(LDAP::LDAP_OPT_PROTOCOL_VERSION, 3)
    conn.bind(luser, oldp)
    conn.modify(luser, [replace])

.. raw:: html

   </div>

.. raw:: html

   </div>

Although not guaranteed to be free of security holes (the password is
kept in memory, for example) this is cleaner and more flexible than a
simple ``sh`` script.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------+-------------------------+-------------------------------+
| `Prev <ldap.html>`__?   | ?                       | ?\ `Next <secure.html>`__     |
+-------------------------+-------------------------+-------------------------------+
| 2.?Configuring LDAP?    | `Home <index.html>`__   | ?4.?Security Considerations   |
+-------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
