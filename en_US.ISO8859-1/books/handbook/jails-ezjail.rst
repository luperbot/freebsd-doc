================================
15.6.?Managing Jails with ezjail
================================

.. raw:: html

   <div class="navheader">

15.6.?Managing Jails with ezjail
`Prev <jails-application.html>`__?
Chapter?15.?Jails
?\ `Next <mac.html>`__

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

15.6.?Managing Jails with ezjail
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Originally contributed by Warren Block.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Creating and managing multiple jails can quickly become tedious and
error-prone. Dirk Engling's ezjail automates and greatly simplifies many
jail tasks. A *basejail* is created as a template. Additional jails use
`mount\_nullfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nullfs&sektion=8>`__
to share many of the basejail directories without using additional disk
space. Each additional jail takes only a few megabytes of disk space
before applications are installed. Upgrading the copy of the userland in
the basejail automatically upgrades all of the other jails.

Additional benefits and features are described in detail on the ezjail
web site, https://erdgeist.org/arts/software/ezjail/.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.6.1.?Installing ezjail
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Installing ezjail consists of adding a loopback interface for use in
jails, installing the port or package, and enabling the service.

.. raw:: html

   <div class="procedure">

#. To keep jail loopback traffic off the host's loopback network
   interface ``lo0``, a second loopback interface is created by adding
   an entry to ``/etc/rc.conf``:

   .. code:: programlisting

       cloned_interfaces="${cloned_interfaces} lo1"

   The second loopback interface ``lo1`` will be created when the system
   starts. It can also be created manually without a restart:

   .. code:: screen

       # service netif cloneup
       Created clone interfaces: lo1.

   Jails can be allowed to use aliases of this secondary loopback
   interface without interfering with the host.

   Inside a jail, access to the loopback address ``127.0.0.1`` is
   redirected to the first IP address assigned to the jail. To make the
   jail loopback correspond with the new ``lo1`` interface, that
   interface must be specified first in the list of interfaces and IP
   addresses given when creating a new jail.

   Give each jail a unique loopback address in the ``127.0.0.0``\ ``/8``
   netblock.

#. Install
   `sysutils/ezjail <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/ezjail/pkg-descr>`__:

   .. code:: screen

       # cd /usr/ports/sysutils/ezjail
       # make install clean

#. Enable ezjail by adding this line to ``/etc/rc.conf``:

   .. code:: programlisting

       ezjail_enable="YES"

#. The service will automatically start on system boot. It can be
   started immediately for the current session:

   .. code:: screen

       # service ezjail start

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

15.6.2.?Initial Setup
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With ezjail installed, the basejail directory structure can be created
and populated. This step is only needed once on the jail host computer.

In both of these examples, ``-p`` causes the ports tree to be retrieved
with
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__
into the basejail. That single copy of the ports directory will be
shared by all the jails. Using a separate copy of the ports directory
for jails isolates them from the host. The ezjail FAQ explains in more
detail: http://erdgeist.org/arts/software/ezjail/#FAQ.

.. raw:: html

   <div class="procedure">

-  

   -  **To Populate the Jail with FreeBSD-RELEASE**

      For a basejail based on the FreeBSD RELEASE matching that of the
      host computer, use ``install``. For example, on a host computer
      running FreeBSD?10-STABLE, the latest RELEASE version of
      FreeBSD?-10 will be installed in the jail):

      .. code:: screen

          # ezjail-admin install -p

   -  **To Populate the Jail with ``installworld``**

      The basejail can be installed from binaries created by
      ``buildworld`` on the host with ``ezjail-admin update``.

      In this example, FreeBSD?10-STABLE has been built from source. The
      jail directories are created. Then ``installworld`` is executed,
      installing the host's ``/usr/obj`` into the basejail.

      .. code:: screen

          # ezjail-admin update -i -p

      The host's ``/usr/src`` is used by default. A different source
      directory on the host can be specified with ``-s`` and a path, or
      set with ``ezjail_sourcetree`` in ``/usr/local/etc/ezjail.conf``.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

The basejail's ports tree is shared by other jails. However, downloaded
distfiles are stored in the jail that downloaded them. By default, these
files are stored in ``/var/ports/distfiles`` within each jail.
``/var/ports`` inside each jail is also used as a work directory when
building ports.

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

15.6.3.?Creating and Starting a New Jail
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

New jails are created with ``ezjail-admin create``. In these examples,
the ``lo1`` loopback interface is used as described above.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?15.1.?Create and Start a New Jail

.. raw:: html

   </div>

#. Create the jail, specifying a name and the loopback and network
   interfaces to use, along with their IP addresses. In this example,
   the jail is named ``dnsjail``.

   .. code:: screen

       # ezjail-admin create dnsjail 'lo1|127.0.1.1,em0|192.168.1.50'

   .. raw:: html

      <div class="tip" xmlns="">

   Tip:
   ~~~~

   Most network services run in jails without problems. A few network
   services, most notably
   `ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__,
   use *raw network sockets*. In jails, raw network sockets are disabled
   by default for security. Services that require them will not work.

   Occasionally, a jail genuinely needs raw sockets. For example,
   network monitoring applications often use
   `ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
   to check the availability of other computers. When raw network
   sockets are actually needed in a jail, they can be enabled by editing
   the ezjail configuration file for the individual jail,
   ``/usr/local/etc/ezjail/jailname``. Modify the ``parameters`` entry:

   .. code:: programlisting

       export jail_jailname_parameters="allow.raw_sockets=1"

   Do not enable raw network sockets unless services in the jail
   actually require them.

   .. raw:: html

      </div>

#. Start the jail:

   .. code:: screen

       # ezjail-admin start dnsjail

#. Use a console on the jail:

   .. code:: screen

       # ezjail-admin console dnsjail

.. raw:: html

   </div>

The jail is operating and additional configuration can be completed.
Typical settings added at this point include:

.. raw:: html

   <div class="procedure">

#. **Set the ``root`` Password**

   Connect to the jail and set the ``root`` user's password:

   .. code:: screen

       # ezjail-admin console dnsjail
       # passwd
       Changing local password for root
       New Password:
       Retype New Password:

#. **Time Zone Configuration**

   The jail's time zone can be set with
   `tzsetup(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tzsetup&sektion=8>`__.
   To avoid spurious error messages, the
   `adjkerntz(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adjkerntz&sektion=8>`__
   entry in ``/etc/crontab`` can be commented or removed. This job
   attempts to update the computer's hardware clock with time zone
   changes, but jails are not allowed to access that hardware.

#. **DNS Servers**

   Enter domain name server lines in ``/etc/resolv.conf`` so DNS works
   in the jail.

#. **Edit ``/etc/hosts``**

   Change the address and add the jail name to the ``localhost`` entries
   in ``/etc/hosts``.

#. **Configure ``/etc/rc.conf``**

   Enter configuration settings in ``/etc/rc.conf``. This is much like
   configuring a full computer. The host name and IP address are not set
   here. Those values are already provided by the jail configuration.

.. raw:: html

   </div>

With the jail configured, the applications for which the jail was
created can be installed.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

Some ports must be built with special options to be used in a jail. For
example, both of the network monitoring plugin packages
`net-mgmt/nagios-plugins <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/nagios-plugins/pkg-descr>`__
and
`net-mgmt/monitoring-plugins <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/monitoring-plugins/pkg-descr>`__
have a ``JAIL`` option which must be enabled for them to work correctly
inside a jail.

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

15.6.4.?Updating Jails
~~~~~~~~~~~~~~~~~~~~~~

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

15.6.4.1.?Updating the Operating System
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Because the basejail's copy of the userland is shared by the other
jails, updating the basejail automatically updates all of the other
jails. Either source or binary updates can be used.

To build the world from source on the host, then install it in the
basejail, use:

.. code:: screen

    # ezjail-admin update -b

If the world has already been compiled on the host, install it in the
basejail with:

.. code:: screen

    # ezjail-admin update -i

Binary updates use
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__.
These updates have the same limitations as if
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
were being run directly. The most important one is that only -RELEASE
versions of FreeBSD are available with this method.

Update the basejail to the latest patched release of the version of
FreeBSD on the host. For example, updating from RELEASE-p1 to
RELEASE-p2.

.. code:: screen

    # ezjail-admin update -u

To upgrade the basejail to a new version, first upgrade the host system
as described in `Section?24.2.3, “Performing Major and Minor Version
Upgrades” <updating-upgrading-freebsdupdate.html#freebsdupdate-upgrade>`__.
Once the host has been upgraded and rebooted, the basejail can then be
upgraded.
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
has no way of determining which version is currently installed in the
basejail, so the original version must be specified. Use
`file(1) <http://www.FreeBSD.org/cgi/man.cgi?query=file&sektion=1>`__ to
determine the original version in the basejail:

.. code:: screen

    # file /usr/jails/basejail/bin/sh
    /usr/jails/basejail/bin/sh: ELF 64-bit LSB executable, x86-64, version 1 (FreeBSD), dynamically linked (uses shared libs), for FreeBSD 9.3, stripped

Now use this information to perform the upgrade from ``9.3-RELEASE`` to
the current version of the host system:

.. code:: screen

    # ezjail-admin update -U -s 9.3-RELEASE

After updating the basejail,
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__
must be run to update each jail's configuration files.

How to use
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__
depends on the purpose and trustworthiness of a jail. If a jail's
services or users are not trusted, then
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__
should only be run from within that jail:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?15.1.?\ `mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__
on Untrusted Jail

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Delete the link from the jail's ``/usr/src`` into the basejail and
create a new ``/usr/src`` in the jail as a mountpoint. Mount the host
computer's ``/usr/src`` read-only on the jail's new ``/usr/src``
mountpoint:

.. code:: screen

    # rm /usr/jails/jailname/usr/src
    # mkdir /usr/jails/jailname/usr/src
    # mount -t nullfs -o ro /usr/src /usr/jails/jailname/usr/src

Get a console in the jail:

.. code:: screen

    # ezjail-admin console jailname

Inside the jail, run ``mergemaster``. Then exit the jail console:

.. code:: screen

    # cd /usr/src
    # mergemaster -U
    # exit

Finally, unmount the jail's ``/usr/src``:

.. code:: screen

    # umount /usr/jails/jailname/usr/src

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?15.2.?\ `mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__
on Trusted Jail

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

If the users and services in a jail are trusted,
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__
can be run from the host:

.. code:: screen

    # mergemaster -U -D /usr/jails/jailname

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

15.6.4.2.?Updating Ports
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ports tree in the basejail is shared by the other jails. Updating
that copy of the ports tree gives the other jails the updated version
also.

The basejail ports tree is updated with
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__:

.. code:: screen

    # ezjail-admin update -P

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

15.6.5.?Controlling Jails
~~~~~~~~~~~~~~~~~~~~~~~~~

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

15.6.5.1.?Stopping and Starting Jails
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ezjail automatically starts jails when the computer is started. Jails
can be manually stopped and restarted with ``stop`` and ``start``:

.. code:: screen

    # ezjail-admin stop sambajail
    Stopping jails: sambajail.

By default, jails are started automatically when the host computer
starts. Autostarting can be disabled with ``config``:

.. code:: screen

    # ezjail-admin config -r norun seldomjail

This takes effect the next time the host computer is started. A jail
that is already running will not be stopped.

Enabling autostart is very similar:

.. code:: screen

    # ezjail-admin config -r run oftenjail

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

15.6.5.2.?Archiving and Restoring Jails
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Use ``archive`` to create a ``.tar.gz`` archive of a jail. The file name
is composed from the name of the jail and the current date. Archive
files are written to the archive directory,
``/usr/jails/ezjail_archives``. A different archive directory can be
chosen by setting ``ezjail_archivedir`` in the configuration file.

The archive file can be copied elsewhere as a backup, or an existing
jail can be restored from it with ``restore``. A new jail can be created
from the archive, providing a convenient way to clone existing jails.

Stop and archive a jail named ``wwwserver``:

.. code:: screen

    # ezjail-admin stop wwwserver
    Stopping jails: wwwserver.
    # ezjail-admin archive wwwserver
    # ls /usr/jails/ezjail-archives/
    wwwserver-201407271153.13.tar.gz

Create a new jail named ``wwwserver-clone`` from the archive created in
the previous step. Use the ``em1`` interface and assign a new IP address
to avoid conflict with the original:

.. code:: screen

    # ezjail-admin create -a /usr/jails/ezjail_archives/wwwserver-201407271153.13.tar.gz wwwserver-clone 'lo1|127.0.3.1,em1|192.168.1.51'

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

15.6.6.?Full Example: BIND in a Jail
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Putting the BIND DNS server in a jail improves security by isolating it.
This example creates a simple caching-only name server.

.. raw:: html

   <div class="itemizedlist">

-  The jail will be called ``dns1``.

-  The jail will use IP address ``192.168.1.240`` on the host's ``re0``
   interface.

-  The upstream ISP's DNS servers are at ``10.0.0.62`` and
   ``10.0.0.61``.

-  The basejail has already been created and a ports tree installed.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?15.3.?Running BIND in a Jail

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Create a cloned loopback interface by adding a line to ``/etc/rc.conf``:

.. code:: programlisting

    cloned_interfaces="${cloned_interfaces} lo1"

Immediately create the new loopback interface:

.. code:: screen

    # service netif cloneup
    Created clone interfaces: lo1.

Create the jail:

.. code:: screen

    # ezjail-admin create dns1 'lo1|127.0.2.1,re0|192.168.1.240'

Start the jail, connect to a console running on it, and perform some
basic configuration:

.. code:: screen

    # ezjail-admin start dns1
    # ezjail-admin console dns1
    # passwd
    Changing local password for root
    New Password:
    Retype New Password:
    # tzsetup
    # sed -i .bak -e '/adjkerntz/ s/^/#/' /etc/crontab
    # sed -i .bak -e 's/127.0.0.1/127.0.2.1/g; s/localhost.my.domain/dns1.my.domain dns1/' /etc/hosts

Temporarily set the upstream DNS servers in ``/etc/resolv.conf`` so
ports can be downloaded:

.. code:: programlisting

    nameserver 10.0.0.62
    nameserver 10.0.0.61

Still using the jail console, install
`dns/bind99 <http://www.freebsd.org/cgi/url.cgi?ports/dns/bind99/pkg-descr>`__.

.. code:: screen

    # make -C /usr/ports/dns/bind99 install clean

Configure the name server by editing
``/usr/local/etc/namedb/named.conf``.

Create an Access Control List (ACL) of addresses and networks that are
permitted to send DNS queries to this name server. This section is added
just before the ``options`` section already in the file:

.. code:: programlisting

    ...
    // or cause huge amounts of useless Internet traffic.

    acl "trusted" {
        192.168.1.0/24;
        localhost;
        localnets;
    };

    options {
    ...

Use the jail IP address in the ``listen-on`` setting to accept DNS
queries from other computers on the network:

.. code:: programlisting

      listen-on   { 192.168.1.240; };

A simple caching-only DNS name server is created by changing the
``forwarders`` section. The original file contains:

.. code:: programlisting

    /*
        forwarders {
            127.0.0.1;
        };
    */

Uncomment the section by removing the ``/*`` and ``*/`` lines. Enter the
IP addresses of the upstream DNS servers. Immediately after the
``forwarders`` section, add references to the ``trusted`` ACL defined
earlier:

.. code:: programlisting

      forwarders {
            10.0.0.62;
            10.0.0.61;
        };

        allow-query       { any; };
        allow-recursion   { trusted; };
        allow-query-cache { trusted; };

Enable the service in ``/etc/rc.conf``:

.. code:: programlisting

    named_enable="YES"

Start and test the name server:

.. code:: screen

    # service named start
    wrote key file "/usr/local/etc/namedb/rndc.key"
    Starting named.
    # /usr/local/bin/dig @192.168.1.240 freebsd.org

A response that includes

.. code:: screen

    ;; Got answer;

shows that the new DNS server is working. A long delay followed by a
response including

.. code:: screen

    ;; connection timed out; no servers could be reached

shows a problem. Check the configuration settings and make sure any
local firewalls allow the new DNS access to the upstream DNS servers.

The new DNS server can use itself for local name resolution, just like
other local computers. Set the address of the DNS server in the client
computer's ``/etc/resolv.conf``:

.. code:: programlisting

    nameserver 192.168.1.240

A local DHCP server can be configured to provide this address for a
local DNS server, providing automatic configuration on DHCP clients.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-----------------------------------------+
| `Prev <jails-application.html>`__?   | `Up <jails.html>`__     | ?\ `Next <mac.html>`__                  |
+--------------------------------------+-------------------------+-----------------------------------------+
| 15.5.?Updating Multiple Jails?       | `Home <index.html>`__   | ?Chapter?16.?Mandatory Access Control   |
+--------------------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
