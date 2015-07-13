===========================
5.?Configuring CUPS Clients
===========================

.. raw:: html

   <div class="navheader">

5.?Configuring CUPS Clients
`Prev <printing-cups-configuring-printers.html>`__?
?
?\ `Next <printing-cups-troubleshooting.html>`__

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

5.?Configuring CUPS Clients
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the CUPS server has been configured and printers have been added
and published to the network, the next step is to configure the clients,
or the machines that are going to access the CUPS server. If one has a
single desktop machine that is acting as both server and client, then
much of this information may not be needed.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?UNIX? Clients
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CUPS will also need to be installed on your UNIX? clients. Once CUPS is
installed on the clients, then CUPS printers that are shared across the
network are often automatically discovered by the printer managers for
various desktop environments such as GNOME or KDE. Alternatively, one
can access the local CUPS interface on the client machine at
``http://localhost:631`` and click on “Add Printer” in the
Administration section. When presented with the “Device” drop-down box,
simply select the networked CUPS printer, if it was automatically
discovered, or select ``ipp`` or ``http`` and enter the IPP or HTTP URI
of the networked CUPS printer, usually in one of the two following
syntaxes:

.. code:: programlisting

    ipp://server-name-or-ip/printers/printername

.. code:: programlisting

    http://server-name-or-ip:631/printers/printername

If the CUPS clients have difficulty finding other CUPS printers shared
across the network, sometimes it is helpful to add or create a file
``/usr/local/etc/cups/client.conf`` with a single entry as follows:

.. code:: programlisting

    ServerName server-ip

In this case, *``server-ip``* would be replaced by the local IP address
of the CUPS server on the network.

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

5.2.?Windows? Clients
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Versions of Windows? prior to XP did not have the capability to natively
network with IPP-based printers. However, Windows??XP and later versions
do have this capability. Therefore, to add a CUPS printer in these
versions of Windows? is quite easy. Generally, the Windows?
administrator will run the Windows? ``Add Printer`` wizard, select
``Network       Printer`` and then enter the URI in the following
syntax:

.. code:: programlisting

    http://server-name-or-ip:631/printers/printername

If one has an older version of Windows? without native IPP printing
support, then the general means of connecting to a CUPS printer is to
use
`net/samba3 <http://www.freebsd.org/cgi/url.cgi?ports/net/samba3/pkg-descr>`__
and CUPS together, which is a topic outside the scope of this chapter.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------+-------------------------+----------------------------------------------------+
| `Prev <printing-cups-configuring-printers.html>`__?   | ?                       | ?\ `Next <printing-cups-troubleshooting.html>`__   |
+-------------------------------------------------------+-------------------------+----------------------------------------------------+
| 4.?Configuring Printers on the CUPS Print Server?     | `Home <index.html>`__   | ?6.?CUPS Troubleshooting                           |
+-------------------------------------------------------+-------------------------+----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
