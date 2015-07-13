================================================
4.?Configuring Printers on the CUPS Print Server
================================================

.. raw:: html

   <div class="navheader">

4.?Configuring Printers on the CUPS Print Server
`Prev <printing-cups-configuring-server.html>`__?
?
?\ `Next <printing-cups-clients.html>`__

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

4.?Configuring Printers on the CUPS Print Server
------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After the CUPS system has been installed and configured, the
administrator can begin configuring the local printers attached to the
CUPS print server. This part of the process is very similar, if not
identical, to configuring CUPS printers on other UNIX?-based operating
systems, such as a Linux? distribution.

The primary means for managing and administering the CUPS server is
through the web-based interface, which can be found by launching a web
browser and entering ``http://localhost:631`` in the browser's URL bar.
If the CUPS server is on another machine on the network, substitute the
server's local IP address for ``localhost``. The CUPS web interface is
fairly self-explanatory, as there are sections for managing printers and
print jobs, authorizing users, and more. Additionally, on the right-hand
side of the Administration screen are several check-boxes allowing easy
access to commonly-changed settings, such as whether to share published
printers connected to the system, whether to allow remote administration
of the CUPS server, and whether to allow users additional access and
privileges to the printers and print jobs.

Adding a printer is generally as easy as clicking “Add Printer” at the
Administration screen of the CUPS web interface, or clicking one of the
“New Printers Found” buttons also at the Administration screen. When
presented with the “Device” drop-down box, simply select the desired
locally-attached printer, and then continue through the process. If one
has added the
`print/gutenprint-cups <http://www.freebsd.org/cgi/url.cgi?ports/print/gutenprint-cups/pkg-descr>`__
or
`print/hplip <http://www.freebsd.org/cgi/url.cgi?ports/print/hplip/pkg-descr>`__
ports or packages as referenced above, then additional print drivers
will be available in the subsequent screens that might provide more
stability or features.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+-------------------------+--------------------------------------------+
| `Prev <printing-cups-configuring-server.html>`__?   | ?                       | ?\ `Next <printing-cups-clients.html>`__   |
+-----------------------------------------------------+-------------------------+--------------------------------------------+
| 3.?Configuring the CUPS Print Server?               | `Home <index.html>`__   | ?5.?Configuring CUPS Clients               |
+-----------------------------------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
