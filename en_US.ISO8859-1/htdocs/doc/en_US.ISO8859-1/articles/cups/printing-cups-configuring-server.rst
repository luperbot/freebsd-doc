====================================
3.?Configuring the CUPS Print Server
====================================

.. raw:: html

   <div class="navheader">

3.?Configuring the CUPS Print Server
`Prev <printing-cups-install.html>`__?
?
?\ `Next <printing-cups-configuring-printers.html>`__

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

3.?Configuring the CUPS Print Server
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After installation, a few files must be edited in order to configure the
CUPS server. First, create or modify, as the case may be, the file
``/etc/devfs.rules`` and add the following information to set the proper
permissions on all potential printer devices and to associate printers
with the ``cups`` user group:

.. code:: programlisting

    [system=10]
    add path 'unlpt*' mode 0660 group cups
    add path 'ulpt*' mode 0660 group cups
    add path 'lpt*' mode 0660 group cups
    add path 'usb/X.Y.Z' mode 0660 group cups

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Note that *``X``*, *``Y``*, and *``Z``* should be replaced with the
target USB device listed in the ``/dev/usb`` directory that corresponds
to the printer. To find the correct device, examine the output of
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__,
where ``ugenX``.\ *``Y``* lists the printer device, which is a symbolic
link to a USB device in ``/dev/usb``.

.. raw:: html

   </div>

Next, add two lines to ``/etc/rc.conf`` as follows:

.. code:: programlisting

    cupsd_enable="YES"
    devfs_system_ruleset="system"

These two entries will start the CUPS print server on boot and invoke
the local devfs rule created above, respectively.

In order to enable CUPS printing under certain Microsoft??Windows?
clients, the line below should be uncommented in
``/usr/local/etc/cups/mime.types`` and
``/usr/local/etc/cups/mime.convs``:

.. code:: programlisting

    application/octet-stream

Once these changes have been made, the
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8>`__
and CUPS systems must both be restarted, either by rebooting the
computer or issuing the following two commands in a root terminal:

.. code:: screen

    # /etc/rc.d/devfs restart
    # /usr/local/etc/rc.d/cupsd restart

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+---------------------------------------------------------+
| `Prev <printing-cups-install.html>`__?   | ?                       | ?\ `Next <printing-cups-configuring-printers.html>`__   |
+------------------------------------------+-------------------------+---------------------------------------------------------+
| 2.?Installing the CUPS Print Server?     | `Home <index.html>`__   | ?4.?Configuring Printers on the CUPS Print Server       |
+------------------------------------------+-------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
