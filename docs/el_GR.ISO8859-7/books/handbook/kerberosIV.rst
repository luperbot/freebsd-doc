================
15.7. KerberosIV
================

.. raw:: html

   <div class="navheader">

15.7. KerberosIV
`????? <tcpwrappers.html>`__?
???????? 15. ????????
?\ `??????? <kerberos5.html>`__

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

15.7. KerberosIV
----------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Mark Murray.

.. raw:: html

   </div>

.. raw:: html

   <div>

Based on a contribution by Mark Dapoz.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos is a network add-on system/protocol that allows users to
authenticate themselves through the services of a secure server.
Services such as remote login, remote copy, secure inter-system file
copying and other high-risk tasks are made considerably safer and more
controllable.

The following instructions can be used as a guide on how to set up
Kerberos as distributed for FreeBSD. However, you should refer to the
relevant manual pages for a complete description.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.7.1. Installing KerberosIV
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos is an optional component of FreeBSD. The easiest way to install
this software is by selecting the ``krb4`` or ``krb5`` distribution in
sysinstall during the initial installation of FreeBSD. This will install
the ?eBones? (KerberosIV) or ?Heimdal? (Kerberos5) implementation of
Kerberos. These implementations are included because they are developed
outside the USA/Canada and were thus available to system owners outside
those countries during the era of restrictive export controls on
cryptographic code from the USA.

Alternatively, the MIT implementation of Kerberos is available from the
Ports Collection as
`security/krb5 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb5/pkg-descr>`__.

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

15.7.2. Creating the Initial Database
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is done on the Kerberos server only. First make sure that you do
not have any old Kerberos databases around. You should change to the
directory ``/etc/kerberosIV`` and check that only the following files
are present:

.. code:: screen

    # cd /etc/kerberosIV
    # ls
    README      krb.conf        krb.realms

If any additional files (such as ``principal.*`` or ``master_key``)
exist, then use the ``kdb_destroy`` command to destroy the old Kerberos
database, or if Kerberos is not running, simply delete the extra files.

You should now edit the ``krb.conf`` and ``krb.realms`` files to define
your Kerberos realm. In this case the realm will be ``EXAMPLE.COM`` and
the server is ``grunt.example.com``. We edit or create the ``krb.conf``
file:

.. code:: screen

    # cat krb.conf
    EXAMPLE.COM
    EXAMPLE.COM grunt.example.com admin server
    CS.BERKELEY.EDU okeeffe.berkeley.edu
    ATHENA.MIT.EDU kerberos.mit.edu
    ATHENA.MIT.EDU kerberos-1.mit.edu
    ATHENA.MIT.EDU kerberos-2.mit.edu
    ATHENA.MIT.EDU kerberos-3.mit.edu
    LCS.MIT.EDU kerberos.lcs.mit.edu
    TELECOM.MIT.EDU bitsy.mit.edu
    ARC.NASA.GOV trident.arc.nasa.gov

In this case, the other realms do not need to be there. They are here as
an example of how a machine may be made aware of multiple realms. You
may wish to not include them for simplicity.

The first line names the realm in which this system works. The other
lines contain realm/host entries. The first item on a line is a realm,
and the second is a host in that realm that is acting as a ?key
distribution center?. The words ``admin       server`` following a
host's name means that host also provides an administrative database
server. For further explanation of these terms, please consult the
Kerberos manual pages.

Now we have to add ``grunt.example.com`` to the ``EXAMPLE.COM`` realm
and also add an entry to put all hosts in the ``.example.com`` domain in
the ``EXAMPLE.COM`` realm. The ``krb.realms`` file would be updated as
follows:

.. code:: screen

    # cat krb.realms
    grunt.example.com EXAMPLE.COM
    .example.com EXAMPLE.COM
    .berkeley.edu CS.BERKELEY.EDU
    .MIT.EDU ATHENA.MIT.EDU
    .mit.edu ATHENA.MIT.EDU

Again, the other realms do not need to be there. They are here as an
example of how a machine may be made aware of multiple realms. You may
wish to remove them to simplify things.

The first line puts the *specific* system into the named realm. The rest
of the lines show how to default systems of a particular subdomain to a
named realm.

Now we are ready to create the database. This only needs to run on the
Kerberos server (or Key Distribution Center). Issue the ``kdb_init``
command to do this:

.. code:: screen

    # kdb_init
    Realm name [default  ATHENA.MIT.EDU ]: EXAMPLE.COM
    You will be prompted for the database Master Password.
    It is important that you NOT FORGET this password.

    Enter Kerberos master key: 

Now we have to save the key so that servers on the local machine can
pick it up. Use the ``kstash`` command to do this:

.. code:: screen

    # kstash

    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered. BEWARE!

This saves the encrypted master password in
``/etc/kerberosIV/master_key``.

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

15.7.3. Making It All Run
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Two principals need to be added to the database for *each* system that
will be secured with Kerberos. Their names are ``kpasswd`` and ``rcmd``.
These two principals are made for each system, with the instance being
the name of the individual system.

These daemons, kpasswd and rcmd allow other systems to change Kerberos
passwords and run commands like
`rcp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rcp&sektion=1>`__,
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__
and `rsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsh&sektion=1>`__.

Now let us add these entries:

.. code:: screen

    # kdb_edit
    Opening database...

    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered.  BEWARE!
    Previous or default values are in [brackets] ,
    enter return to leave the same, or new value.

    Principal name: passwd
    Instance: grunt

    <Not found>, Create [y] ? y

    Principal: passwd, Instance: grunt, kdc_key_ver: 1
    New Password:                    <---- enter RANDOM here
    Verifying password

    New Password: <---- enter RANDOM here

    Random password [y] ? y

    Principal's new key version = 1
    Expiration date (enter yyyy-mm-dd) [ 2000-01-01 ] ?
    Max ticket lifetime (*5 minutes) [ 255 ] ?
    Attributes [ 0 ] ?
    Edit O.K.
    Principal name: rcmd
    Instance: grunt

    <Not found>, Create [y] ?

    Principal: rcmd, Instance: grunt, kdc_key_ver: 1
    New Password:       <---- enter RANDOM here
    Verifying password

    New Password:           <---- enter RANDOM here

    Random password [y] ?

    Principal's new key version = 1
    Expiration date (enter yyyy-mm-dd) [ 2000-01-01 ] ?
    Max ticket lifetime (*5 minutes) [ 255 ] ?
    Attributes [ 0 ] ?
    Edit O.K.
    Principal name:         <---- null entry here will cause an exit

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

15.7.4. Creating the Server File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We now have to extract all the instances which define the services on
each machine. For this we use the ``ext_srvtab`` command. This will
create a file which must be copied or moved *by secure means* to each
Kerberos client's ``/etc`` directory. This file must be present on each
server and client, and is crucial to the operation of Kerberos.

.. code:: screen

    # ext_srvtab grunt
    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered. BEWARE!
    Generating 'grunt-new-srvtab'....

Now, this command only generates a temporary file which must be renamed
to ``srvtab`` so that all the servers can pick it up. Use the
`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1>`__
command to move it into place on the original system:

.. code:: screen

    # mv grunt-new-srvtab srvtab

If the file is for a client system, and the network is not deemed safe,
then copy the ``client-new-srvtab`` to removable media and transport it
by secure physical means. Be sure to rename it to ``srvtab`` in the
client's ``/etc`` directory, and make sure it is mode 600:

.. code:: screen

    # mv grumble-new-srvtab srvtab
    # chmod 600 srvtab

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

15.7.5. Populating the Database
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We now have to add some user entries into the database. First let us
create an entry for the user ``jane``. Use the ``kdb_edit`` command to
do this:

.. code:: screen

    # kdb_edit
    Opening database...

    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered.  BEWARE!
    Previous or default values are in [brackets] ,
    enter return to leave the same, or new value.

    Principal name: jane
    Instance:

    <Not found>, Create [y] ? y

    Principal: jane, Instance: , kdc_key_ver: 1
    New Password:                <---- enter a secure password here
    Verifying password

    New Password:                <---- re-enter the password here
    Principal's new key version = 1
    Expiration date (enter yyyy-mm-dd) [ 2000-01-01 ] ?
    Max ticket lifetime (*5 minutes) [ 255 ] ?
    Attributes [ 0 ] ?
    Edit O.K.
    Principal name:        <---- null entry here will cause an exit

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

15.7.6. Testing It All Out
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First we have to start the Kerberos daemons. Note that if you have
correctly edited your ``/etc/rc.conf`` then this will happen
automatically when you reboot. This is only necessary on the Kerberos
server. Kerberos clients will automatically get what they need from the
``/etc/kerberosIV`` directory.

.. code:: screen

    # kerberos &
    Kerberos server starting
    Sleep forever on error
    Log file is /var/log/kerberos.log
    Current Kerberos master key version is 1.

    Master key entered. BEWARE!

    Current Kerberos master key version is 1
    Local realm: EXAMPLE.COM
    # kadmind -n &
    KADM Server KADM0.0A initializing
    Please do not use 'kill -9' to kill this job, use a
    regular kill instead

    Current Kerberos master key version is 1.

    Master key entered.  BEWARE!

Now we can try using the ``kinit`` command to get a ticket for the ID
``jane`` that we created above:

.. code:: screen

    % kinit jane
    MIT Project Athena (grunt.example.com)
    Kerberos Initialization for "jane"
    Password: 

Try listing the tokens using ``klist`` to see if we really have them:

.. code:: screen

    % klist
    Ticket file:    /tmp/tkt245
    Principal:      jane@EXAMPLE.COM

      Issued           Expires          Principal
    Apr 30 11:23:22  Apr 30 19:23:22  krbtgt.EXAMPLE.COM@EXAMPLE.COM

Now try changing the password using
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__
to check if the kpasswd daemon can get authorization to the Kerberos
database:

.. code:: screen

    % passwd
    realm EXAMPLE.COM
    Old password for jane:
    New Password for jane:
    Verifying password
    New Password for jane:
    Password changed.

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

15.7.7. Adding ``su`` Privileges
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos allows us to give *each* user who needs ``root`` privileges
their own *separate*
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
password. We could now add an ID which is authorized to
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ to
``root``. This is controlled by having an instance of ``root``
associated with a principal. Using ``kdb_edit`` we can create the entry
``jane.root`` in the Kerberos database:

.. code:: screen

    # kdb_edit
    Opening database...

    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered.  BEWARE!
    Previous or default values are in [brackets] ,
    enter return to leave the same, or new value.

    Principal name: jane
    Instance: root

    <Not found>, Create [y] ? y

    Principal: jane, Instance: root, kdc_key_ver: 1
    New Password:                    <---- enter a SECURE password here
    Verifying password

    New Password:            <---- re-enter the password here

    Principal's new key version = 1
    Expiration date (enter yyyy-mm-dd) [ 2000-01-01 ] ?
    Max ticket lifetime (*5 minutes) [ 255 ] ? 12 <--- Keep this short!
    Attributes [ 0 ] ?
    Edit O.K.
    Principal name:              <---- null entry here will cause an exit

Now try getting tokens for it to make sure it works:

.. code:: screen

    # kinit jane.root
    MIT Project Athena (grunt.example.com)
    Kerberos Initialization for "jane.root"
    Password:

Now we need to add the user to ``root``'s ``.klogin`` file:

.. code:: screen

    # cat /root/.klogin
    jane.root@EXAMPLE.COM

Now try doing the
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__:

.. code:: screen

    % su
    Password:

and take a look at what tokens we have:

.. code:: screen

    # klist
    Ticket file:    /tmp/tkt_root_245
    Principal:      jane.root@EXAMPLE.COM

      Issued           Expires          Principal
    May  2 20:43:12  May  3 04:43:12  krbtgt.EXAMPLE.COM@EXAMPLE.COM

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

15.7.8. Using Other Commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In an earlier example, we created a principal called ``jane`` with an
instance ``root``. This was based on a user with the same name as the
principal, and this is a Kerberos default; that a
``<principal>.<instance>`` of the form ``<username>.``\ ``root`` will
allow that ``<username>`` to
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ to
``root`` if the necessary entries are in the ``.klogin`` file in
``root``'s home directory:

.. code:: screen

    # cat /root/.klogin
    jane.root@EXAMPLE.COM

Likewise, if a user has in their own home directory lines of the form:

.. code:: screen

    % cat ~/.klogin
    jane@EXAMPLE.COM
    jack@EXAMPLE.COM

This allows anyone in the ``EXAMPLE.COM`` realm who has authenticated
themselves as ``jane`` or ``jack`` (via ``kinit``, see above) to access
to ``jane``'s account or files on this system (``grunt``) via
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__,
`rsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsh&sektion=1>`__ or
`rcp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rcp&sektion=1>`__.

For example, ``jane`` now logs into another system using Kerberos:

.. code:: screen

    % kinit
    MIT Project Athena (grunt.example.com)
    Password:
    % rlogin grunt
    Last login: Mon May  1 21:14:47 from grumble
    Copyright (c) 1980, 1983, 1986, 1988, 1990, 1991, 1993, 1994
            The Regents of the University of California.   All rights reserved.

    FreeBSD BUILT-19950429 (GR386) #0: Sat Apr 29 17:50:09 SAT 1995

Or ``jack`` logs into ``jane``'s account on the same machine (``jane``
having set up the ``.klogin`` file as above, and the person in charge of
Kerberos having set up principal *jack* with a null instance):

.. code:: screen

    % kinit
    % rlogin grunt -l jane
    MIT Project Athena (grunt.example.com)
    Password:
    Last login: Mon May  1 21:16:55 from grumble
    Copyright (c) 1980, 1983, 1986, 1988, 1990, 1991, 1993, 1994
            The Regents of the University of California.   All rights reserved.
    FreeBSD BUILT-19950429 (GR386) #0: Sat Apr 29 17:50:09 SAT 1995

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+----------------------------+-----------------------------------+
| `????? <tcpwrappers.html>`__?   | `???? <security.html>`__   | ?\ `??????? <kerberos5.html>`__   |
+---------------------------------+----------------------------+-----------------------------------+
| 15.6. TCP Wrappers?             | `???? <index.html>`__      | ?15.8. Kerberos5                  |
+---------------------------------+----------------------------+-----------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
