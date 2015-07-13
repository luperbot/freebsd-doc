=========================
12.8.?Configuration Files
=========================

.. raw:: html

   <div class="navheader">

12.8.?Configuration Files
`Prev <configtuning-syslog.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <configtuning-sysctl.html>`__

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

12.8.?Configuration Files
-------------------------

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

12.8.1.?\ ``/etc`` Layout
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are a number of directories in which configuration information is
kept. These include:

.. raw:: html

   <div class="informaltable">

+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc``                  | Generic system-specific configuration information.                                                                                                                                 |
+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/defaults``         | Default versions of system configuration files.                                                                                                                                    |
+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/mail``             | Extra `sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__ configuration and other MTA configuration files.                                               |
+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/ppp``              | Configuration for both user- and kernel-ppp programs.                                                                                                                              |
+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/namedb``           | Default location for `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__ data. Normally ``named.conf`` and zone files are stored here.                         |
+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/usr/local/etc``        | Configuration files for installed applications. May contain per-application subdirectories.                                                                                        |
+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/usr/local/etc/rc.d``   | `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ scripts for installed applications.                                                                              |
+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/var/db``               | Automatically generated system-specific database files, such as the package database and the `locate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=locate&sektion=1>`__ database.   |
+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

12.8.2.?Hostnames
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

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

12.8.2.1.?\ ``/etc/resolv.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

How a FreeBSD system accesses the Internet Domain Name System (DNS) is
controlled by
`resolv.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=resolv.conf&sektion=5>`__.

The most common entries to ``/etc/resolv.conf`` are:

.. raw:: html

   <div class="informaltable">

+------------------+-----------------------------------------------------------------------------------------------------------------------------------+
| ``nameserver``   | The IP address of a name server the resolver should query. The servers are queried in the order listed with a maximum of three.   |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------+
| ``search``       | Search list for hostname lookup. This is normally determined by the domain of the local hostname.                                 |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------+
| ``domain``       | The local domain name.                                                                                                            |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

A typical ``/etc/resolv.conf`` looks like this:

.. code:: programlisting

    search example.com
    nameserver 147.11.1.11
    nameserver 147.11.100.30

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Only one of the ``search`` and ``domain`` options should be used.

.. raw:: html

   </div>

When using DHCP,
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
usually rewrites ``/etc/resolv.conf`` with information received from the
DHCP server.

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

12.8.2.2.?\ ``/etc/hosts``
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``/etc/hosts`` is a simple text database which works in conjunction with
DNS and NIS to provide host name to IP address mappings. Entries for
local computers connected via a LAN can be added to this file for
simplistic naming purposes instead of setting up a
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__
server. Additionally, ``/etc/hosts`` can be used to provide a local
record of Internet names, reducing the need to query external DNS
servers for commonly accessed names.

.. code:: programlisting

    # $FreeBSD$
    #
    #
    # Host Database
    #
    # This file should contain the addresses and aliases for local hosts that
    # share this file.  Replace 'my.domain' below with the domainname of your
    # machine.
    #
    # In the presence of the domain name service or NIS, this file may
    # not be consulted at all; see /etc/nsswitch.conf for the resolution order.
    #
    #
    ::1         localhost localhost.my.domain
    127.0.0.1       localhost localhost.my.domain
    #
    # Imaginary network.
    #10.0.0.2       myname.my.domain myname
    #10.0.0.3       myfriend.my.domain myfriend
    #
    # According to RFC 1918, you can use the following IP networks for
    # private nets which will never be connected to the Internet:
    #
    #   10.0.0.0    -   10.255.255.255
    #   172.16.0.0  -   172.31.255.255
    #   192.168.0.0 -   192.168.255.255
    #
    # In case you want to be able to connect to the Internet, you need
    # real official assigned numbers.  Do not try to invent your own network
    # numbers but instead get one from your network provider (if any) or
    # from your regional registry (ARIN, APNIC, LACNIC, RIPE NCC, or AfriNIC.)
    #

The format of ``/etc/hosts`` is as follows:

.. code:: programlisting

    [Internet address] [official hostname] [alias1] [alias2] ...

For example:

.. code:: programlisting

    10.0.0.1 myRealHostname.example.com myRealHostname foobar1 foobar2

Consult
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__
for more information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+------------------------------------------+
| `Prev <configtuning-syslog.html>`__?   | `Up <config-tuning.html>`__   | ?\ `Next <configtuning-sysctl.html>`__   |
+----------------------------------------+-------------------------------+------------------------------------------+
| 12.7.?Configuring System Logging?      | `Home <index.html>`__         | ?12.9.?Tuning with sysctl(8)             |
+----------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
