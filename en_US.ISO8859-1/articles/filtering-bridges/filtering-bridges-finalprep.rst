====================
3.?Final Preparation
====================

.. raw:: html

   <div class="navheader">

3.?Final Preparation
`Prev <filtering-bridges-how.html>`__?
?
?\ `Next <filtering-bridges-enabling.html>`__

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

3.?Final Preparation
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before rebooting in order to load the new kernel or the required modules
(according to the previously chosen installation method), you have to
make some changes to the ``/etc/rc.conf`` configuration file. The
default rule of the firewall is to reject all IP packets. Initially we
will set up an ``open`` firewall, in order to verify its operation
without any issue related to packet filtering (in case you are going to
execute this procedure remotely, such configuration will avoid you to
remain isolated from the network). Put these lines in ``/etc/rc.conf``:

.. code:: programlisting

    firewall_enable="YES"
    firewall_type="open"
    firewall_quiet="YES"
    firewall_logging="YES"

The first row will enable the firewall (and will load the module
``ipfw.ko`` if it is not compiled in the kernel), the second one to set
up it in ``open`` mode (as explained in ``/etc/rc.firewall``), the third
one to not show rules loading and the fourth one to enable logging
support.

About the configuration of the network interfaces, the most used way is
to assign an IP to only one of the network cards, but the bridge will
work equally even if both interfaces or none has a configured IP. In the
last case (IP-less) the bridge machine will be still more hidden, as
inaccessible from the network: to configure it, you have to login from
console or through a third network interface separated from the bridge.
Sometimes, during the system startup, some programs require network
access, say for domain resolution: in this case it is necessary to
assign an IP to the external interface (the one connected to Internet,
where DNS server resides), since the bridge will be activated at the end
of the startup procedure. It means that the ``fxp0`` interface (in our
case) must be mentioned in the ifconfig section of the ``/etc/rc.conf``
file, while the ``xl0`` is not. Assigning an IP to both the network
cards does not make much sense, unless, during the start procedure,
applications should access to services on both Ethernet segments.

There is another important thing to know. When running IP over Ethernet,
there are actually two Ethernet protocols in use: one is IP, the other
is ARP. ARP does the conversion of the IP address of a host into its
Ethernet address (MAC layer). In order to allow the communication
between two hosts separated by the bridge, it is necessary that the
bridge will forward ARP packets. Such protocol is not included in the IP
layer, since it exists only with IP over Ethernet. The FreeBSD firewall
filters exclusively on the IP layer and therefore all non-IP packets
(ARP included) will be forwarded without being filtered, even if the
firewall is configured to not permit anything.

Now it is time to reboot the system and use it as before: there will be
some new messages about the bridge and the firewall, but the bridge will
not be activated and the firewall, being in ``open`` mode, will not
avoid any operations.

If there are any problems, you should sort them out now before
proceeding.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+-------------------------------------------------+
| `Prev <filtering-bridges-how.html>`__?   | ?                       | ?\ `Next <filtering-bridges-enabling.html>`__   |
+------------------------------------------+-------------------------+-------------------------------------------------+
| 2.?How to Install?                       | `Home <index.html>`__   | ?4.?Enabling the Bridge                         |
+------------------------------------------+-------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
