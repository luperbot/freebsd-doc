===========================
Chapter?29.?Network Servers
===========================

.. raw:: html

   <div class="navheader">

Chapter?29.?Network Servers
`Prev <mail-procmail.html>`__?
Part?IV.?Network Communication
?\ `Next <network-inetd.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?29.?Network Servers
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`29.1. Synopsis <network-servers.html#network-servers-synopsis>`__
`29.2. The inetd Super-Server <network-inetd.html>`__
`29.3. Network File System (NFS) <network-nfs.html>`__
`29.4. Network Information System (NIS) <network-nis.html>`__
`29.5. Lightweight Directory Access Protocol
(LDAP) <network-ldap.html>`__
`29.6. Dynamic Host Configuration Protocol (DHCP) <network-dhcp.html>`__
`29.7. Domain Name System (DNS) <network-dns.html>`__
`29.8. Apache HTTP Server <network-apache.html>`__
`29.9. File Transfer Protocol (FTP) <network-ftp.html>`__
`29.10. File and Print Services for Microsoft??Windows? Clients
(Samba) <network-samba.html>`__
`29.11. Clock Synchronization with NTP <network-ntp.html>`__
`29.12. iSCSI Initiator and Target Configuration <network-iscsi.html>`__

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

29.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This chapter covers some of the more frequently used network services on
UNIX? systems. This includes installing, configuring, testing, and
maintaining many different types of network services. Example
configuration files are included throughout this chapter for reference.

By the end of this chapter, readers will know:

.. raw:: html

   <div class="itemizedlist">

-  How to manage the inetd daemon.

-  How to set up the Network File System (NFS).

-  How to set up the Network Information Server (NIS) for centralizing
   and sharing user accounts.

-  How to set FreeBSD up to act as an LDAP server or client

-  How to set up automatic network settings using DHCP.

-  How to set up a Domain Name Server (DNS).

-  How to set up the Apache HTTP Server.

-  How to set up a File Transfer Protocol (FTP) server.

-  How to set up a file and print server for Windows? clients using
   Samba.

-  How to synchronize the time and date, and set up a time server using
   the Network Time Protocol (NTP).

-  How to set up iSCSI.

.. raw:: html

   </div>

This chapter assumes a basic knowledge of:

.. raw:: html

   <div class="itemizedlist">

-  ``/etc/rc`` scripts.

-  Network terminology.

-  Installation of additional third-party software (`Chapter?5,
   *Installing Applications: Packages and Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------------------+------------------------------------+
| `Prev <mail-procmail.html>`__?   | `Up <network-communication.html>`__   | ?\ `Next <network-inetd.html>`__   |
+----------------------------------+---------------------------------------+------------------------------------+
| 28.12.?Using procmail?           | `Home <index.html>`__                 | ?29.2.?The inetd Super-Server      |
+----------------------------------+---------------------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
