==============
A.?Useful Aids
==============

.. raw:: html

   <div class="navheader">

A.?Useful Aids
`Prev <secure.html>`__?
?
?\ `Next <ssl-ca.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="appendix">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.?Useful Aids
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are a few other programs that might be useful, particularly if you
have many users and do not want to configure everything manually.

`security/pam\_mkhomedir <http://www.freebsd.org/cgi/url.cgi?ports/security/pam_mkhomedir/pkg-descr>`__
is a PAM module that always succeeds; its purpose is to create home
directories for users which do not have them. If you have dozens of
client servers and hundreds of users, it is much easier to use this and
set up skeleton directories than to prepare every home directory.

`sysutils/cpu <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cpu/pkg-descr>`__
is a
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__-like
utility that can be used to manage users in the LDAP directory. You can
call it directly, or wrap scripts around it. It can handle both TLS
(with the ``-x`` flag) and SSL (directly).

`sysutils/ldapvi <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/ldapvi/pkg-descr>`__
is a great utility for editing LDAP values in an LDIF-like syntax. The
directory (or subsection of the directory) is presented in the editor
chosen by the ``EDITOR`` environment variable. This makes it easy to
enable large-scale changes in the directory without having to write a
custom tool.

`security/openssh-portable <http://www.freebsd.org/cgi/url.cgi?ports/security/openssh-portable/pkg-descr>`__
has the ability to contact an LDAP server to verify SSH keys. This is
extremely nice if you have many servers and do not want to copy your
public keys across all of them.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+-------------------------------------+
| `Prev <secure.html>`__?       | ?                       | ?\ `Next <ssl-ca.html>`__           |
+-------------------------------+-------------------------+-------------------------------------+
| 4.?Security Considerations?   | `Home <index.html>`__   | ?B.?OpenSSL Certificates for LDAP   |
+-------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
