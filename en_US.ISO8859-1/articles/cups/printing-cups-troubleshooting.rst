=======================
6.?CUPS Troubleshooting
=======================

.. raw:: html

   <div class="navheader">

6.?CUPS Troubleshooting
`Prev <printing-cups-clients.html>`__?
?
?\ `Next <ix01.html>`__

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

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+---------------------------+
| `Prev <printing-cups-clients.html>`__?   | ?                       | ?\ `Next <ix01.html>`__   |
+------------------------------------------+-------------------------+---------------------------+
| 5.?Configuring CUPS Clients?             | `Home <index.html>`__   | ?Index                    |
+------------------------------------------+-------------------------+---------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
