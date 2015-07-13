==================================
29.9.?File Transfer Protocol (FTP)
==================================

.. raw:: html

   <div class="navheader">

29.9.?File Transfer Protocol (FTP)
`Prev <network-apache.html>`__?
Chapter?29.?Network Servers
?\ `Next <network-samba.html>`__

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

29.9.?File Transfer Protocol (FTP)
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The File Transfer Protocol (FTP) provides users with a simple way to
transfer files to and from an FTP server. FreeBSD includes FTP server
software, ftpd, in the base system.

FreeBSD provides several configuration files for controlling access to
the FTP server. This section summarizes these files. Refer to
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8>`__
for more details about the built-in FTP server.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.9.1.?Configuration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The most important configuration step is deciding which accounts will be
allowed access to the FTP server. A FreeBSD system has a number of
system accounts which should not be allowed FTP access. The list of
users disallowed any FTP access can be found in ``/etc/ftpusers``. By
default, it includes system accounts. Additional users that should not
be allowed access to FTP can be added.

In some cases it may be desirable to restrict the access of some users
without preventing them completely from using FTP. This can be
accomplished be creating ``/etc/ftpchroot`` as described in
`ftpchroot(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpchroot&sektion=5>`__.
This file lists users and groups subject to FTP access restrictions.

To enable anonymous FTP access to the server, create a user named
``ftp`` on the FreeBSD system. Users will then be able to log on to the
FTP server with a username of ``ftp`` or ``anonymous``. When prompted
for the password, any input will be accepted, but by convention, an
email address should be used as the password. The FTP server will call
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
when an anonymous user logs in, to restrict access to only the home
directory of the ``ftp`` user.

There are two text files that can be created to specify welcome messages
to be displayed to FTP clients. The contents of ``/etc/ftpwelcome`` will
be displayed to users before they reach the login prompt. After a
successful login, the contents of ``/etc/ftpmotd`` will be displayed.
Note that the path to this file is relative to the login environment, so
the contents of ``~ftp/etc/ftpmotd`` would be displayed for anonymous
users.

Once the FTP server has been configured, set the appropriate variable in
``/etc/rc.conf`` to start the service during boot:

.. code:: programlisting

    ftpd_enable="YES"

To start the service now:

.. code:: screen

    # service ftpd start

Test the connection to the FTP server by typing:

.. code:: screen

    % ftp localhost

The ftpd daemon uses
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__
to log messages. By default, the system log daemon will write messages
related to FTP in ``/var/log/xferlog``. The location of the FTP log can
be modified by changing the following line in ``/etc/syslog.conf``:

.. code:: programlisting

    ftp.info      /var/log/xferlog

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Be aware of the potential problems involved with running an anonymous
FTP server. In particular, think twice about allowing anonymous users to
upload files. It may turn out that the FTP site becomes a forum for the
trade of unlicensed commercial software or worse. If anonymous FTP
uploads are required, then verify the permissions so that these files
can not be read by other anonymous users until they have been reviewed
by an administrator.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+---------------------------------+---------------------------------------------------------------------------+
| `Prev <network-apache.html>`__?   | `Up <network-servers.html>`__   | ?\ `Next <network-samba.html>`__                                          |
+-----------------------------------+---------------------------------+---------------------------------------------------------------------------+
| 29.8.?Apache HTTP Server?         | `Home <index.html>`__           | ?29.10.?File and Print Services for Microsoft??Windows? Clients (Samba)   |
+-----------------------------------+---------------------------------+---------------------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
