===========
6.?Firewall
===========

.. raw:: html

   <div class="navheader">

6.?Firewall
`Prev <network.html>`__?
?
?\ `Next <updates.html>`__

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

6.?Firewall
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD does not use Linux? IPTABLES for its firewall. Instead, FreeBSD
offers a choice of three kernel level firewalls:

.. raw:: html

   <div class="itemizedlist">

-  `PF <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-pf.html>`__
-  `IPFILTER <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-ipf.html>`__
-  `IPFW <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-ipfw.html>`__

.. raw:: html

   </div>

PF is developed by the OpenBSD project and ported to FreeBSD. PF was
created as a replacement for IPFILTER and its syntax is similar to that
of IPFILTER. PF can be paired with
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__ to
provide QoS features.

This sample PF entry allows inbound SSH:

.. code:: programlisting

    pass in on $ext_if inet proto tcp from any to ($ext_if) port 22

IPFILTER is the firewall application developed by Darren Reed. It is not
specific to FreeBSD and has been ported to several operating systems
including NetBSD, OpenBSD, SunOS, HP/UX, and Solaris.

The IPFILTER syntax to allow inbound SSH is:

.. code:: programlisting

    pass in on $ext_if proto tcp from any to any port = 22

IPFW is the firewall developed and maintained by FreeBSD. It can be
paired with
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
to provide traffic shaping capabilities and simulate different types of
network connections.

The IPFW syntax to allow inbound SSH would be:

.. code:: programlisting

    ipfw add allow tcp from any to me 22 in via $ext_if

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+------------------------------+
| `Prev <network.html>`__?    | ?                       | ?\ `Next <updates.html>`__   |
+-----------------------------+-------------------------+------------------------------+
| 5.?Network Configuration?   | `Home <index.html>`__   | ?7.?Updating FreeBSD         |
+-----------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
