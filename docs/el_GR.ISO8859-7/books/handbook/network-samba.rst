=========================================================================
29.9. File and Print Services for Microsoft(R)?Windows(R) clients (Samba)
=========================================================================

.. raw:: html

   <div class="navheader">

29.9. File and Print Services for Microsoft(R)?Windows(R) clients
(Samba)
`????? <network-ftp.html>`__?
???????? 29. ???????????? ???????
?\ `??????? <network-ntp.html>`__

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

29.9. File and Print Services for Microsoft(R)?Windows(R) clients (Samba)
-------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Murray Stokely.

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

29.9.1. Overview
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Samba is a popular open source software package that provides file and
print services for Microsoft(R)?Windows(R) clients. Such clients can
connect to and use FreeBSD filespace as if it was a local disk drive, or
FreeBSD printers as if they were local printers.

Samba software packages should be included on your FreeBSD installation
media. If you did not install Samba when you first installed FreeBSD,
then you can install it from the
`net/samba3 <http://www.freebsd.org/cgi/url.cgi?ports/net/samba3/pkg-descr>`__
port or package.

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

29.9.2. Configuration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A default Samba configuration file is installed as
``/usr/local/etc/smb.conf.default``. This file must be copied to
``/usr/local/etc/smb.conf`` and customized before Samba can be used.

The ``smb.conf`` file contains runtime configuration information for
Samba, such as definitions of the printers and ?file system shares? that
you would like to share with Windows(R) clients. The Samba package
includes a web based tool called swat which provides a simple way of
configuring the ``smb.conf`` file.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.9.2.1. Using the Samba Web Administration Tool (SWAT)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Samba Web Administration Tool (SWAT) runs as a daemon from inetd.
Therefore, the following line in ``/etc/inetd.conf`` should be
uncommented before swat can be used to configure Samba:

.. code:: programlisting

    swat   stream  tcp     nowait/400      root    /usr/local/sbin/swat

As explained in `???????????29.1, ?Reloading the inetd configuration
file? <network-inetd.html#network-inetd-reread>`__, the inetd must be
reloaded after this configuration file is changed.

Once swat has been enabled in ``inetd.conf``, you can use a browser to
connect to ``http://localhost:901``. You will first have to log on with
the system ``root`` account.

Once you have successfully logged on to the main Samba configuration
page, you can browse the system documentation, or begin by clicking on
the Globals tab. The Globals section corresponds to the variables that
are set in the ``[global]`` section of ``/usr/local/etc/smb.conf``.

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

29.9.2.2. Global Settings
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Whether you are using swat or editing ``/usr/local/etc/smb.conf``
directly, the first directives you are likely to encounter when
configuring Samba are:

.. raw:: html

   <div class="variablelist">

``workgroup``
    NT Domain-Name or Workgroup-Name for the computers that will be
    accessing this server.

``netbios name``
    This sets the NetBIOS name by which a Samba server is known. By
    default it is the same as the first component of the host's DNS
    name.

``server string``
    This sets the string that will be displayed with the ``net view``
    command and some other networking tools that seek to display
    descriptive text about the server.

.. raw:: html

   </div>

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

29.9.2.3. Security Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Two of the most important settings in ``/usr/local/etc/smb.conf`` are
the security model chosen, and the backend password format for client
users. The following directives control these options:

.. raw:: html

   <div class="variablelist">

``security``
    The two most common options here are ``security = share`` and
    ``security             = user``. If your clients use usernames that
    are the same as their usernames on your FreeBSD machine then you
    will want to use user level security. This is the default security
    policy and it requires clients to first log on before they can
    access shared resources.

    In share level security, client do not need to log onto the server
    with a valid username and password before attempting to connect to a
    shared resource. This was the default security model for older
    versions of Samba.

``passdb backend``
    Samba has several different backend authentication models. You can
    authenticate clients with LDAP, NIS+, a SQL database, or a modified
    password file. The default authentication method is ``smbpasswd``,
    and that is all that will be covered here.

.. raw:: html

   </div>

Assuming that the default ``smbpasswd`` backend is used, the
``/usr/local/private/smbpasswd`` file must be created to allow Samba to
authenticate clients. If you would like to give your UNIX(R) user
accounts access from Windows(R) clients, use the following command:

.. code:: screen

    # smbpasswd -a username

Please see the `Official Samba
HOWTO <http://www.samba.org/samba/docs/man/Samba-HOWTO-Collection/>`__
for additional information about configuration options. With the basics
outlined here, you should have everything you need to start running
Samba.

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

29.9.3. Starting Samba
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The
`net/samba3 <http://www.freebsd.org/cgi/url.cgi?ports/net/samba3/pkg-descr>`__
port adds a new startup script, which can be used to control Samba. To
enable this script, so that it can be used for example to start, stop or
restart Samba, add the following line to the ``/etc/rc.conf`` file:

.. code:: programlisting

    samba_enable="YES"

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

This will also configure Samba to automatically start at system boot
time.

.. raw:: html

   </div>

It is possible then to start Samba at any time by typing:

.. code:: screen

    # /usr/local/etc/rc.d/samba start
    Starting SAMBA: removing stale tdbs :
    Starting nmbd.
    Starting smbd.

Please refer to `??????12.7, ???????????????? ?? ??????? rc ???
FreeBSD? <configtuning-rcd.html>`__ for more information about using rc
scripts.

Samba actually consists of three separate daemons. You should see that
both the nmbd and smbd daemons are started by the ``samba.sh`` script.
If you enabled winbind name resolution services in ``smb.conf``, then
you will also see that the winbindd daemon is started.

You can stop Samba at any time by typing :

.. code:: screen

    # /usr/local/etc/rc.d/samba.sh stop

Samba is a complex software suite with functionality that allows broad
integration with Microsoft(R)?Windows(R) networks. For more information
about functionality beyond the basic installation described here, please
see ``http://www.samba.org``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-----------------------------------+---------------------------------------------------+
| `????? <network-ftp.html>`__?              | `???? <network-servers.html>`__   | ?\ `??????? <network-ntp.html>`__                 |
+--------------------------------------------+-----------------------------------+---------------------------------------------------+
| 29.8. ????????? ????????? ??????? (FTP)?   | `???? <index.html>`__             | ?29.10. ???????????? ???????? ?????????? ?? NTP   |
+--------------------------------------------+-----------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
