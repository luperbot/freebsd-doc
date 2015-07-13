======================
2.8.?Post-Installation
======================

.. raw:: html

   <div class="navheader">

2.8.?Post-Installation
`Prev <bsdinstall-final-warning.html>`__?
Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later
?\ `Next <bsdinstall-install-trouble.html>`__

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

2.8.?Post-Installation
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once FreeBSD is installed, bsdinstall will prompt to configure several
options before booting into the newly installed system. This section
describes these configuration options.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

Once the system has booted, ``bsdconfig`` provides a menu-driven method
for configuring the system using these and additional options.

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

2.8.1.?Setting the ``root`` Password
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, the ``root`` password must be set. While entering the password,
the characters being typed are not displayed on the screen. After the
password has been entered, it must be entered again. This helps prevent
typing errors.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.30.?Setting the ``root`` Password

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Setting the root Password|

.. raw:: html

   </div>

.. raw:: html

   </div>

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

2.8.2.?Configuring Network Interfaces
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Next, a list of the network interfaces found on the computer is shown.
Select the interface to configure.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The network configuration menus will be skipped if the network was
previously configured as part of a *bootonly* installation.

.. raw:: html

   </div>

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.31.?Choose a Network Interface

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Choose a Network Interface|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If an Ethernet interface is selected, the installer will skip ahead to
the menu shown in `Figure?2.35, “Choose IPv4
Networking” <bsdinstall-post.html#bsdinstall-configure-net-ipv4>`__. If
a wireless network interface is chosen, the system will instead scan for
wireless access points:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.32.?Scanning for Wireless Access Points

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Scanning for Wireless Access Points|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wireless networks are identified by a Service Set Identifier (SSID), a
short, unique name given to each network. SSIDs found during the scan
are listed, followed by a description of the encryption types available
for that network. If the desired SSID does not appear in the list,
select [?Rescan?] to scan again. If the desired network still does not
appear, check for problems with antenna connections or try moving the
computer closer to the access point. Rescan after each change is made.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.33.?Choosing a Wireless Network

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Choosing a Wireless Network|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Next, enter the encryption information for connecting to the selected
wireless network. WPA2 encryption is strongly recommended as older
encryption types, like WEP, offer little security. If the network uses
WPA2, input the password, also known as the Pre-Shared Key (PSK). For
security reasons, the characters typed into the input box are displayed
as asterisks.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.34.?WPA2 Setup

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|WPA2 Setup|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Next, choose whether or not an IPv4 address should be configured on the
Ethernet or wireless interface:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.35.?Choose IPv4 Networking

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Choose IPv4 Networking|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are two methods of IPv4 configuration. DHCP will automatically
configure the network interface correctly and should be used if the
network provides a DHCP server. Otherwise, the addressing information
needs to be input manually as a static configuration.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Do not enter random network information as it will not work. If a DHCP
server is not available, obtain the information listed in `Required
Network
Information <bsdinstall-pre.html#bsdinstall-collect-network-information>`__
from the network administrator or Internet service provider.

.. raw:: html

   </div>

If a DHCP server is available, select [?Yes?] in the next menu to
automatically configure the network interface. The installer will appear
to pause for a minute or so as it finds the DHCP server and obtains the
addressing information for the system.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.36.?Choose IPv4 DHCP Configuration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Choose IPv4 DHCP Configuration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If a DHCP server is not available, select [?No?] and input the following
addressing information in this menu:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.37.?IPv4 Static Configuration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|IPv4 Static Configuration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``IP Address`` - The IPv4 address assigned to this computer. The
   address must be unique and not already in use by another piece of
   equipment on the local network.

-  ``Subnet Mask`` - The subnet mask for the network.

-  ``Default Router`` - The IP address of the network's default gateway.

.. raw:: html

   </div>

The next screen will ask if the interface should be configured for IPv6.
If IPv6 is available and desired, choose [?Yes?] to select it.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.38.?Choose IPv6 Networking

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Choose IPv6 Networking|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPv6 also has two methods of configuration. StateLess Address
AutoConfiguration (SLAAC) will automatically request the correct
configuration information from a local router. Refer to
http://tools.ietf.org/html/rfc4862 for more information. Static
configuration requires manual entry of network information.

If an IPv6 router is available, select [?Yes?] in the next menu to
automatically configure the network interface. The installer will appear
to pause for a minute or so as it finds the router and obtains the
addressing information for the system.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.39.?Choose IPv6 SLAAC Configuration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Choose IPv6 SLAAC Configuration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If an IPv6 router is not available, select [?No?] and input the
following addressing information in this menu:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.40.?IPv6 Static Configuration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|IPv6 Static Configuration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``IPv6 Address`` - The IPv6 address assigned to this computer. The
   address must be unique and not already in use by another piece of
   equipment on the local network.

-  ``Default Router`` - The IPv6 address of the network's default
   gateway.

.. raw:: html

   </div>

The last network configuration menu is used to configure the Domain Name
System (DNS) resolver, which converts hostnames to and from network
addresses. If DHCP or SLAAC was used to autoconfigure the network
interface, the ``Resolver       Configuration`` values may already be
filled in. Otherwise, enter the local network's domain name in the
``Search`` field. ``DNS #1`` and ``DNS #2`` are the IPv4 and/or IPv6
addresses of the DNS servers. At least one DNS server is required.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.41.?DNS Configuration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|DNS Configuration|

.. raw:: html

   </div>

.. raw:: html

   </div>

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

2.8.3.?Setting the Time Zone
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The next menu asks if the system clock uses UTC or local time. When in
doubt, select [?No?] to choose the more commonly-used local time.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.42.?Select Local or UTC Clock

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Select Local or UTC Clock|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The next series of menus are used to determine the correct local time by
selecting the geographic region, country, and time zone. Setting the
time zone allows the system to automatically correct for regional time
changes, such as daylight savings time, and perform other time zone
related functions properly.

The example shown here is for a machine located in the Eastern time zone
of the United States. The selections will vary according to the
geographical location.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.43.?Select a Region

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Select a Region|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The appropriate region is selected using the arrow keys and then
pressing **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.44.?Select a Country

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Select a Country|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Select the appropriate country using the arrow keys and press **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.45.?Select a Time Zone

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Select a Time Zone|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The appropriate time zone is selected using the arrow keys and pressing
**Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.46.?Confirm Time Zone

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Confirm Time Zone|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Confirm the abbreviation for the time zone is correct. If it is, press
**Enter** to continue with the post-installation configuration.

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

2.8.4.?Enabling Services
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The next menu is used to configure which system services will be started
whenever the system boots. All of these services are optional. Only
start the services that are needed for the system to function.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.47.?Selecting Additional Services to Enable

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Selecting Additional Services to Enable|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here is a summary of the services which can be enabled in this menu:

.. raw:: html

   <div class="itemizedlist">

-  ``sshd`` - The Secure Shell (SSH) daemon is used to remotely access a
   system over an encrypted connection. Only enable this service if the
   system should be available for remote logins.

-  ``moused`` - Enable this service if the mouse will be used from the
   command-line system console.

-  ``ntpd`` - The Network Time Protocol (NTP) daemon for automatic clock
   synchronization. Enable this service if there is a Windows?,
   Kerberos, or LDAP server on the network.

-  ``powerd`` - System power control utility for power control and
   energy saving.

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

2.8.5.?Enabling Crash Dumps
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The next menu is used to configure whether or not crash dumps should be
enabled. Enabling crash dumps can be useful in debugging issues with the
system, so users are encouraged to enable crash dumps.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.48.?Enabling Crash Dumps

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Enabling Crash Dumps|

.. raw:: html

   </div>

.. raw:: html

   </div>

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

2.8.6.?Add Users
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The next menu prompts to create at least one user account. It is
recommended to login to the system using a user account rather than as
``root``. When logged in as ``root``, there are essentially no limits or
protection on what can be done. Logging in as a normal user is safer and
more secure.

Select [?Yes?] to add new users.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.49.?Add User Accounts

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Add User Accounts|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Follow the prompts and input the requested information for the user
account. The example shown in `Figure?2.50, “Enter User
Information” <bsdinstall-post.html#bsdinstall-add-user2>`__ creates the
``asample`` user account.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.50.?Enter User Information

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Enter User Information|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here is a summary of the information to input:

.. raw:: html

   <div class="itemizedlist">

-  ``Username`` - The name the user will enter to log in. A common
   convention is to use the first letter of the first name combined with
   the last name, as long as each username is unique for the system. The
   username is case sensitive and should not contain any spaces.

-  ``Full name`` - The user's full name. This can contain spaces and is
   used as a description for the user account.

-  ``Uid`` - User ID. Typically, this is left blank so the system will
   assign a value.

-  ``Login group`` - The user's group. Typically this is left blank to
   accept the default.

-  ``Invite user`` into other groups? - Additional groups to which the
   user will be added as a member. If the user needs administrative
   access, type ``wheel`` here.

-  ``Login class`` - Typically left blank for the default.

-  ``Shell`` - Type in one of the listed values to set the interactive
   shell for the user. Refer to `Section?4.9, “Shells” <shells.html>`__
   for more information about shells.

-  ``Home directory`` - The user's home directory. The default is
   usually correct.

-  ``Home directory permissions`` - Permissions on the user's home
   directory. The default is usually correct.

-  ``Use password-based authentication?`` - Typically ``yes`` so that
   the user is prompted to input their password at login.

-  ``Use an empty password?`` - Typically ``no`` as it is insecure to
   have a blank password.

-  ``Use a random password?`` - Typically ``no`` so that the user can
   set their own password in the next prompt.

-  ``Enter password`` - The password for this user. Characters typed
   will not show on the screen.

-  ``Enter password again`` - The password must be typed again for
   verification.

-  ``Lock out the account after           creation?`` - Typically ``no``
   so that the user can login.

.. raw:: html

   </div>

After entering everything, a summary is shown for review. If a mistake
was made, enter ``no`` and try again. If everything is correct, enter
``yes`` to create the new user.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.51.?Exit User and Group Management

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Exit User and Group Management|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If there are more users to add, answer the ``Add       another user?``
question with ``yes``. Enter ``no`` to finish adding users and continue
the installation.

For more information on adding users and user management, see
`Section?4.3, “Users and Basic Account
Management” <users-synopsis.html>`__.

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

2.8.7.?Final Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After everything has been installed and configured, a final chance is
provided to modify settings.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.52.?Final Configuration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Final Configuration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Use this menu to make any changes or do any additional configuration
before completing the installation.

.. raw:: html

   <div class="itemizedlist">

-  ``Add User`` - Described in `Section?2.8.6, “Add
   Users” <bsdinstall-post.html#bsdinstall-addusers>`__.

-  ``Root Password`` - Described in `Section?2.8.1, “Setting the
   ``root`` Password” <bsdinstall-post.html#bsdinstall-post-root>`__.

-  ``Hostname`` - Described in `Section?2.5.2, “Setting the
   Hostname” <using-bsdinstall.html#bsdinstall-hostname>`__.

-  ``Network`` - Described in `Section?2.8.2, “Configuring Network
   Interfaces” <bsdinstall-post.html#bsdinstall-config-network-dev>`__.

-  ``Services`` - Described in `Section?2.8.4, “Enabling
   Services” <bsdinstall-post.html#bsdinstall-sysconf>`__.

-  ``Time Zone`` - Described in `Section?2.8.3, “Setting the Time
   Zone” <bsdinstall-post.html#bsdinstall-timezone>`__.

-  ``Handbook`` - Download and install the FreeBSD Handbook.

.. raw:: html

   </div>

After any final configuration is complete, select Exit.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.53.?Manual Configuration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Manual Configuration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

bsdinstall will prompt if there are any additional configuration that
needs to be done before rebooting into the new system. Select [?Yes?] to
exit to a shell within the new system or [?No?] to proceed to the last
step of the installation.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.54.?Complete the Installation

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Complete the Installation|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If further configuration or special setup is needed, select [?Live?CD?]
to boot the install media into Live CD mode.

If the installation is complete, select [?Reboot?] to reboot the
computer and start the new FreeBSD system. Do not forget to remove the
FreeBSD install media or the computer may boot from it again.

As FreeBSD boots, informational messages are displayed. After the system
finishes booting, a login prompt is displayed. At the ``login:`` prompt,
enter the username added during the installation. Avoid logging in as
``root``. Refer to `Section?4.3.1.3, “The Superuser
Account” <users-synopsis.html#users-superuser>`__ for instructions on
how to become the superuser when administrative access is needed.

The messages that appeared during boot can be reviewed by pressing
**Scroll-Lock** to turn on the scroll-back buffer. The **PgUp**,
**PgDn**, and arrow keys can be used to scroll back through the
messages. When finished, press **Scroll-Lock** again to unlock the
display and return to the console. To review these messages once the
system has been up for some time, type
``less       /var/run/dmesg.boot`` from a command prompt. Press **q** to
return to the command line after viewing.

If sshd was enabled in `Figure?2.47, “Selecting Additional Services to
Enable” <bsdinstall-post.html#bsdinstall-config-serv>`__, the first boot
may be a bit slower as the system will generate the RSA and DSA keys.
Subsequent boots will be faster. The fingerprints of the keys will be
displayed, as seen in this example:

.. code:: screen

    Generating public/private rsa1 key pair.
    Your identification has been saved in /etc/ssh/ssh_host_key.
    Your public key has been saved in /etc/ssh/ssh_host_key.pub.
    The key fingerprint is:
    10:a0:f5:af:93:ae:a3:1a:b2:bb:3c:35:d9:5a:b3:f3 root@machine3.example.com
    The key's randomart image is:
    +--[RSA1 1024]----+
    |    o..          |
    |   o . .         |
    |  .   o          |
    |       o         |
    |    o   S        |
    |   + + o         |
    |o . + *          |
    |o+ ..+ .         |
    |==o..o+E         |
    +-----------------+
    Generating public/private dsa key pair.
    Your identification has been saved in /etc/ssh/ssh_host_dsa_key.
    Your public key has been saved in /etc/ssh/ssh_host_dsa_key.pub.
    The key fingerprint is:
    7e:1c:ce:dc:8a:3a:18:13:5b:34:b5:cf:d9:d1:47:b2 root@machine3.example.com
    The key's randomart image is:
    +--[ DSA 1024]----+
    |       ..     . .|
    |      o  .   . + |
    |     . ..   . E .|
    |    . .  o o . . |
    |     +  S = .    |
    |    +  . = o     |
    |     +  . * .    |
    |    . .  o .     |
    |      .o. .      |
    +-----------------+
    Starting sshd.

Refer to `Section?14.8, “OpenSSH” <openssh.html>`__ for more information
about fingerprints and SSH.

FreeBSD does not install a graphical environment by default. Refer to
`Chapter?6, *The X Window System* <x11.html>`__ for more information
about installing and configuring a graphical window manager.

Proper shutdown of a FreeBSD computer helps protect data and hardware
from damage. *Do not turn off the power before the system has been
properly shut down!* If the user is a member of the ``wheel`` group,
become the superuser by typing ``su`` at the command line and entering
the ``root`` password. Then, type ``shutdown -p now`` and the system
will shut down cleanly, and if the hardware supports it, turn itself
off.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+----------------------------+-------------------------------------------------+
| `Prev <bsdinstall-final-warning.html>`__?   | `Up <bsdinstall.html>`__   | ?\ `Next <bsdinstall-install-trouble.html>`__   |
+---------------------------------------------+----------------------------+-------------------------------------------------+
| 2.7.?Committing to the Installation?        | `Home <index.html>`__      | ?2.9.?Troubleshooting                           |
+---------------------------------------------+----------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |Setting the root Password| image:: bsdinstall/bsdinstall-post-root-passwd.png
.. |Choose a Network Interface| image:: bsdinstall/bsdinstall-configure-network-interface.png
.. |Scanning for Wireless Access Points| image:: bsdinstall/bsdinstall-configure-wireless-scan.png
.. |Choosing a Wireless Network| image:: bsdinstall/bsdinstall-configure-wireless-accesspoints.png
.. |WPA2 Setup| image:: bsdinstall/bsdinstall-configure-wireless-wpa2setup.png
.. |Choose IPv4 Networking| image:: bsdinstall/bsdinstall-configure-network-interface-ipv4.png
.. |Choose IPv4 DHCP Configuration| image:: bsdinstall/bsdinstall-configure-network-interface-ipv4-dhcp.png
.. |IPv4 Static Configuration| image:: bsdinstall/bsdinstall-configure-network-interface-ipv4-static.png
.. |Choose IPv6 Networking| image:: bsdinstall/bsdinstall-configure-network-interface-ipv6.png
.. |Choose IPv6 SLAAC Configuration| image:: bsdinstall/bsdinstall-configure-network-interface-slaac.png
.. |IPv6 Static Configuration| image:: bsdinstall/bsdinstall-configure-network-interface-ipv6-static.png
.. |DNS Configuration| image:: bsdinstall/bsdinstall-configure-network-ipv4-dns.png
.. |Select Local or UTC Clock| image:: bsdinstall/bsdinstall-set-clock-local-utc.png
.. |Select a Region| image:: bsdinstall/bsdinstall-timezone-region.png
.. |Select a Country| image:: bsdinstall/bsdinstall-timezone-country.png
.. |Select a Time Zone| image:: bsdinstall/bsdinstall-timezone-zone.png
.. |Confirm Time Zone| image:: bsdinstall/bsdinstall-timezone-confirm.png
.. |Selecting Additional Services to Enable| image:: bsdinstall/bsdinstall-config-services.png
.. |Enabling Crash Dumps| image:: bsdinstall/bsdinstall-config-crashdump.png
.. |Add User Accounts| image:: bsdinstall/bsdinstall-adduser1.png
.. |Enter User Information| image:: bsdinstall/bsdinstall-adduser2.png
.. |Exit User and Group Management| image:: bsdinstall/bsdinstall-adduser3.png
.. |Final Configuration| image:: bsdinstall/bsdinstall-finalconfiguration.png
.. |Manual Configuration| image:: bsdinstall/bsdinstall-final-modification-shell.png
.. |Complete the Installation| image:: bsdinstall/bsdinstall-mainexit.png
