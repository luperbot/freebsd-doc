===============
CUPS on FreeBSD
===============

.. raw:: html

   <div class="article" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Chess Griffin
~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<chess@chessgriffin.com>``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

An article about configuring CUPS on FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. An Introduction to the Common Unix Printing System
(CUPS) <#printing-cups>`__
`2. Installing the CUPS Print Server <#printing-cups-install>`__
`3. Configuring the CUPS Print
Server <#printing-cups-configuring-server>`__
`4. Configuring Printers on the CUPS Print
Server <#printing-cups-configuring-printers>`__
`5. Configuring CUPS Clients <#printing-cups-clients>`__
`6. CUPS Troubleshooting <#printing-cups-troubleshooting>`__
`Index <#idp61714768>`__

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

1.?An Introduction to the Common Unix Printing System (CUPS)
------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CUPS, the Common UNIX Printing System, provides a portable printing
layer for UNIX?-based operating systems. It has been developed by Easy
Software Products to promote a standard printing solution for all UNIX?
vendors and users.

CUPS uses the Internet Printing Protocol (IPP) as the basis for managing
print jobs and queues. The Line Printer Daemon (LPD), Server Message
Block (SMB), and AppSocket (aka JetDirect) protocols are also supported
with reduced functionality. CUPS adds network printer browsing and
PostScript Printer Description (PPD) based printing options to support
real-world printing under UNIX?. As a result, CUPS is ideally-suited for
sharing and accessing printers in mixed environments of FreeBSD, Linux?,
Mac?OS??X, or Windows?.

The main site for CUPS is ``http://www.cups.org/``.

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

2.?Installing the CUPS Print Server
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To install CUPS using a precompiled binary, issue the following command
from a root terminal:

.. code:: screen

    # pkg install cups

Other optional, but recommended, packages are
`print/gutenprint-cups <http://www.freebsd.org/cgi/url.cgi?ports/print/gutenprint-cups/pkg-descr>`__
and
`print/hplip <http://www.freebsd.org/cgi/url.cgi?ports/print/hplip/pkg-descr>`__,
both of which add drivers and utilities for a variety of printers. Once
installed, the CUPS configuration files can be found in the directory
``/usr/local/etc/cups``.

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

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.?CUPS Troubleshooting
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Difficulties with CUPS often lies in permissions. First, double check
the
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8>`__
permissions as outlined above. Next, check the actual permissions of the
devices created in the file system. It is also helpful to make sure your
user is a member of the ``cups`` group. If the permissions check boxes
in the Administration section of the CUPS web interface do not seem to
be working, another fix might be to manually backup the main CUPS
configuration file located at ``/usr/local/etc/cups/cupsd.conf`` and
edit the various configuration options and try different combinations of
configuration options. One sample ``/usr/local/etc/cups/cupsd.conf`` to
test is listed below. Please note that this sample ``cupsd.conf`` file
sacrifices security for easier configuration; once the administrator
successfully connects to the CUPS server and configures the clients, it
is advisable to revisit this configuration file and begin locking down
access.

.. code:: programlisting

    # Log general information in error_log - change "info" to "debug" for
    # troubleshooting...
    LogLevel info

    # Administrator user group...
    SystemGroup wheel

    # Listen for connections on Port 631.
    Port 631
    #Listen localhost:631
    Listen /var/run/cups.sock

    # Show shared printers on the local network.
    Browsing On
    BrowseOrder allow,deny
    #BrowseAllow @LOCAL
    BrowseAllow 192.168.1.* # change to local LAN settings
    BrowseAddress 192.168.1.* # change to local LAN settings

    # Default authentication type, when authentication is required...
    DefaultAuthType Basic
    DefaultEncryption Never # comment this line to allow encryption

    # Allow access to the server from any machine on the LAN
    <Location />
      Order allow,deny
      #Allow localhost
      Allow 192.168.1.* # change to local LAN settings
    </Location>

    # Allow access to the admin pages from any machine on the LAN
    <Location /admin>
      #Encryption Required
      Order allow,deny
      #Allow localhost
      Allow 192.168.1.* # change to local LAN settings
    </Location>

    # Allow access to configuration files from any machine on the LAN
    <Location /admin/conf>
      AuthType Basic
      Require user @SYSTEM
      Order allow,deny
      #Allow localhost
      Allow 192.168.1.* # change to local LAN settings
    </Location>

    # Set the default printer/job policies...
    <Policy default>
      # Job-related operations must be done by the owner or an administrator...
      <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs \
    Set-Job-Attributes Create-Job-Subscription Renew-Subscription Cancel-Subscription \
    Get-Notifications Reprocess-Job Cancel-Current-Job Suspend-Current-Job Resume-Job \
    CUPS-Move-Job>
        Require user @OWNER @SYSTEM
        Order deny,allow
      </Limit>

      # All administration operations require an administrator to authenticate...
      <Limit Pause-Printer Resume-Printer Set-Printer-Attributes Enable-Printer \
    Disable-Printer Pause-Printer-After-Current-Job Hold-New-Jobs Release-Held-New-Jobs \
    Deactivate-Printer Activate-Printer Restart-Printer Shutdown-Printer Startup-Printer \
    Promote-Job Schedule-Job-After CUPS-Add-Printer CUPS-Delete-Printer CUPS-Add-Class \
    CUPS-Delete-Class CUPS-Accept-Jobs CUPS-Reject-Jobs CUPS-Set-Default>
        AuthType Basic
        Require user @SYSTEM
        Order deny,allow
      </Limit>

      # Only the owner or an administrator can cancel or authenticate a job...
      <Limit Cancel-Job CUPS-Authenticate-Job>
        Require user @OWNER @SYSTEM
        Order deny,allow
      </Limit>

      <Limit All>
        Order deny,allow
      </Limit>
    </Policy>

.. raw:: html

   </div>

.. raw:: html

   <div class="index">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Index
-----

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="index">

.. raw:: html

   <div class="indexdiv">

C
~

CUPS, `An Introduction to the Common Unix Printing System
(CUPS) <#printing-cups>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="indexdiv">

P
~

printing, `An Introduction to the Common Unix Printing System
(CUPS) <#printing-cups>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>
