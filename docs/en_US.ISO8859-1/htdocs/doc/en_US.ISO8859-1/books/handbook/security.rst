====================
Chapter?14.?Security
====================

.. raw:: html

   <div class="navheader">

Chapter?14.?Security
`Prev <boot-shutdown.html>`__?
Part?III.?System Administration
?\ `Next <security-intro.html>`__

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

Chapter?14.?Security
--------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Rewritten by Tom Rhodes.

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

`14.1. Synopsis <security.html#security-synopsis>`__
`14.2. Introduction <security-intro.html>`__
`14.3. One-time Passwords <one-time-passwords.html>`__
`14.4. TCP Wrapper <tcpwrappers.html>`__
`14.5. Kerberos <kerberos5.html>`__
`14.6. OpenSSL <openssl.html>`__
`14.7. VPN over IPsec <ipsec.html>`__
`14.8. OpenSSH <openssh.html>`__
`14.9. Access Control Lists <fs-acl.html>`__
`14.10. Monitoring Third Party Security Issues <security-pkg.html>`__
`14.11. FreeBSD Security Advisories <security-advisories.html>`__
`14.12. Process Accounting <security-accounting.html>`__
`14.13. Resource Limits <security-resourcelimits.html>`__

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

14.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Security, whether physical or virtual, is a topic so broad that an
entire industry has grown up around it. Hundreds of standard practices
have been authored about how to secure systems and networks, and as a
user of FreeBSD, understanding how to protect against attacks and
intruders is a must.

In this chapter, several fundamentals and techniques will be discussed.
The FreeBSD system comes with multiple layers of security, and many more
third party utilities may be added to enhance security.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  Basic FreeBSD system security concepts.

-  The various crypt mechanisms available in FreeBSD.

-  How to set up one-time password authentication.

-  How to configure TCP Wrapper for use with
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__.

-  How to set up Kerberos on FreeBSD.

-  How to configure IPsec and create a VPN.

-  How to configure and use OpenSSH on FreeBSD.

-  How to use file system ACLs.

-  How to use pkg to audit third party software packages installed from
   the Ports Collection.

-  How to utilize FreeBSD security advisories.

-  What Process Accounting is and how to enable it on FreeBSD.

-  How to control user resources using login classes or the resource
   limits database.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand basic FreeBSD and Internet concepts.

.. raw:: html

   </div>

Additional security topics are covered elsewhere in this Handbook. For
example, Mandatory Access Control is discussed in `Chapter?16,
*Mandatory Access Control* <mac.html>`__ and Internet firewalls are
discussed in `Chapter?30, *Firewalls* <firewalls.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------------------+-------------------------------------+
| `Prev <boot-shutdown.html>`__?   | `Up <system-administration.html>`__   | ?\ `Next <security-intro.html>`__   |
+----------------------------------+---------------------------------------+-------------------------------------+
| 13.5.?Shutdown Sequence?         | `Home <index.html>`__                 | ?14.2.?Introduction                 |
+----------------------------------+---------------------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
