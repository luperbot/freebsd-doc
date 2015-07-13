==========================
4.?Security Considerations
==========================

.. raw:: html

   <div class="navheader">

4.?Security Considerations
`Prev <client.html>`__?
?
?\ `Next <useful.html>`__

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

4.?Security Considerations
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now that your machines (and possibly other services) are authenticating
against your LDAP server, this server needs to be protected at least as
well as ``/etc/master.passwd`` would be on a regular server, and
possibly even more so since a broken or cracked LDAP server would break
every client service.

Remember, this section is not exhaustive. You should continually review
your configuration and procedures for improvements.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Setting Attributes Read-only
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Several attributes in LDAP should be read-only. If left writable by the
user, for example, a user could change his ``uidNumber`` attribute to
``0`` and get ``root`` access!

To begin with, the ``userPassword`` attribute should not be
world-readable. By default, anyone who can connect to the LDAP server
can read this attribute. To disable this, put the following in
``slapd.conf``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.?Hide Passwords

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    access to dn.subtree="ou=people,dc=example,dc=org"
      attrs=userPassword
      by self write
      by anonymous auth
      by * none

    access to *
      by self write
      by * read

.. raw:: html

   </div>

.. raw:: html

   </div>

This will disallow reading of the ``userPassword`` attribute, while
still allowing users to change their own passwords.

Additionally, you'll want to keep users from changing some of their own
attributes. By default, users can change any attribute (except for those
which the LDAP schemas themselves deny changes), such as ``uidNumber``.
To close this hole, modify the above to

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.?Read-only Attributes

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    access to dn.subtree="ou=people,dc=example,dc=org"
      attrs=userPassword
      by self write
      by anonymous auth
      by * none

    access to attrs=homeDirectory,uidNumber,gidNumber
      by * read

    access to *
      by self write
      by * read

.. raw:: html

   </div>

.. raw:: html

   </div>

This will stop users from being able to masquerade as other users.

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

4.2.?\ ``root`` Account Definition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Often the ``root`` or manager account for the LDAP service will be
defined in the configuration file. OpenLDAP supports this, for example,
and it works, but it can lead to trouble if ``slapd.conf`` is
compromised. It may be better to use this only to bootstrap yourself
into LDAP, and then define a ``root`` account there.

Even better is to define accounts that have limited permissions, and
omit a ``root`` account entirely. For example, users that can add or
remove user accounts are added to one group, but they cannot themselves
change the membership of this group. Such a security policy would help
mitigate the effects of a leaked password.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.1.?Creating a Management Group
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Say you want your IT department to be able to change home directories
for users, but you do not want all of them to be able to add or remove
users. The way to do this is to add a group for these admins:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?10.?Creating a Management Group

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    dn: cn=homemanagement,dc=example,dc=org
    objectClass: top
    objectClass: posixGroup
    cn: homemanagement
    gidNumber: 121 # required for posixGroup
    memberUid: uid=tuser,ou=people,dc=example,dc=org
    memberUid: uid=user2,ou=people,dc=example,dc=org

.. raw:: html

   </div>

.. raw:: html

   </div>

And then change the permissions attributes in ``slapd.conf``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?11.?ACLs for a Home Directory Management Group

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    access to dn.subtree="ou=people,dc=example,dc=org"
      attr=homeDirectory
      by dn="cn=homemanagement,dc=example,dc=org"
      dnattr=memberUid write

.. raw:: html

   </div>

.. raw:: html

   </div>

Now ``tuser`` and ``user2`` can change other users' home directories.

In this example we have given a subset of administrative power to
certain users without giving them power in other domains. The idea is
that soon no single user account has the power of a ``root`` account,
but every power root had is had by at least one user. The ``root``
account then becomes unnecessary and can be removed.

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

4.3.?Password Storage
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default OpenLDAP will store the value of the ``userPassword``
attribute as it stores any other data: in the clear. Most of the time it
is base 64 encoded, which provides enough protection to keep an honest
administrator from knowing your password, but little else.

It is a good idea, then, to store passwords in a more secure format,
such as SSHA (salted SHA). This is done by whatever program you use to
change users' passwords.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+-----------------------------+
| `Prev <client.html>`__?    | ?                       | ?\ `Next <useful.html>`__   |
+----------------------------+-------------------------+-----------------------------+
| 3.?Client Configuration?   | `Home <index.html>`__   | ?A.?Useful Aids             |
+----------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
