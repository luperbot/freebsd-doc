================
FreeBSD Handbook
================

.. raw:: html

   <div class="navheader">

FreeBSD Handbook
?
?
?\ `Next <book-preface.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="en" lang="en">

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

The FreeBSD Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Copyright ? 1995-2015 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Copyright <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

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

Welcome to FreeBSD! This handbook covers the installation and day to day
use of *FreeBSD 8.4-RELEASE*, *FreeBSD 9.3-RELEASE*, and *FreeBSD
10.1-RELEASE*. This manual is a *work in progress* and is the work of
many individuals. As such, some sections may become dated and require
updating. If you are interested in helping out with this project, send
email to the `FreeBSD documentation project mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__. The
latest version of this document is always available from the `FreeBSD
web site <http://www.FreeBSD.org/>`__ (previous versions of this
handbook can be obtained from ``http://docs.FreeBSD.org/doc/``). It may
also be downloaded in a variety of formats and compression options from
the `FreeBSD FTP server <ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/>`__ or
one of the numerous `mirror sites <mirrors-ftp.html>`__. If you would
prefer to have a hard copy of the handbook, you can purchase one at the
`FreeBSD Mall <http://www.freebsdmall.com/>`__. You may also want to
`search the handbook <../../../../search/index.html>`__.

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

`Preface <book-preface.html>`__
`I. Getting Started <getting-started.html>`__
`1. Introduction <introduction.html>`__
`1.1. Synopsis <introduction.html#introduction-synopsis>`__
`1.2. Welcome to FreeBSD! <nutshell.html>`__
`1.3. About the FreeBSD?Project <history.html>`__
`2. Installing FreeBSD?9.\ *``X``* and Later <bsdinstall.html>`__
`2.1. Synopsis <bsdinstall.html#bsdinstall-synopsis>`__
`2.2. Minimum Hardware Requirements <bsdinstall-hardware.html>`__
`2.3. Pre-Installation Tasks <bsdinstall-pre.html>`__
`2.4. Starting the Installation <bsdinstall-start.html>`__
`2.5. Using bsdinstall <using-bsdinstall.html>`__
`2.6. Allocating Disk Space <bsdinstall-partitioning.html>`__
`2.7. Committing to the Installation <bsdinstall-final-warning.html>`__
`2.8. Post-Installation <bsdinstall-post.html>`__
`2.9. Troubleshooting <bsdinstall-install-trouble.html>`__
`2.10. Using the Live CD <using-live-cd.html>`__
`3. Installing FreeBSD?8.\ *``X``* <install.html>`__
`3.1. Synopsis <install.html#install-synopsis>`__
`3.2. Hardware Requirements <install-hardware.html>`__
`3.3. Pre-installation Tasks <install-pre.html>`__
`3.4. Starting the Installation <install-start.html>`__
`3.5. Introducing sysinstall(8) <using-sysinstall.html>`__
`3.6. Allocating Disk Space <install-steps.html>`__
`3.7. Choosing What to Install <install-choosing.html>`__
`3.8. Choosing the Installation Media <install-media.html>`__
`3.9. Committing to the Installation <install-final-warning.html>`__
`3.10. Post-installation <install-post.html>`__
`3.11. Troubleshooting <install-trouble.html>`__
`3.12. Advanced Installation Guide <install-advanced.html>`__
`3.13. Preparing Custom Installation Media <install-diff-media.html>`__
`4. UNIX Basics <basics.html>`__
`4.1. Synopsis <basics.html#basics-synopsis>`__
`4.2. Virtual Consoles and Terminals <consoles.html>`__
`4.3. Users and Basic Account Management <users-synopsis.html>`__
`4.4. Permissions <permissions.html>`__
`4.5. Directory Structure <dirstructure.html>`__
`4.6. Disk Organization <disk-organization.html>`__
`4.7. Mounting and Unmounting File Systems <mount-unmount.html>`__
`4.8. Processes and Daemons <basics-processes.html>`__
`4.9. Shells <shells.html>`__
`4.10. Text Editors <editors.html>`__
`4.11. Devices and Device Nodes <basics-devices.html>`__
`4.12. Manual Pages <basics-more-information.html>`__
`5. Installing Applications: Packages and Ports <ports.html>`__
`5.1. Synopsis <ports.html#ports-synopsis>`__
`5.2. Overview of Software Installation <ports-overview.html>`__
`5.3. Finding Software <ports-finding-applications.html>`__
`5.4. Using pkg for Binary Package Management <pkgng-intro.html>`__
`5.5. Using the Ports Collection <ports-using.html>`__
`5.6. Building Packages with Poudriere <ports-poudriere.html>`__
`5.7. Post-Installation Considerations <ports-nextsteps.html>`__
`5.8. Dealing with Broken Ports <ports-broken.html>`__
`6. The X Window System <x11.html>`__
`6.1. Synopsis <x11.html#x11-synopsis>`__
`6.2. Terminology <x-understanding.html>`__
`6.3. Installing Xorg <x-install.html>`__
`6.4. Quick Start <x-config-quick-start.html>`__
`6.5. Xorg Configuration <x-config.html>`__
`6.6. Using Fonts in Xorg <x-fonts.html>`__
`6.7. The X Display Manager <x-xdm.html>`__
`6.8. Desktop Environments <x11-wm.html>`__
`6.9. Installing Compiz Fusion <x-compiz-fusion.html>`__
`6.10. Troubleshooting <x11-understanding.html>`__
`II. Common Tasks <common-tasks.html>`__
`7. Desktop Applications <desktop.html>`__
`7.1. Synopsis <desktop.html#desktop-synopsis>`__
`7.2. Browsers <desktop-browsers.html>`__
`7.3. Productivity <desktop-productivity.html>`__
`7.4. Document Viewers <desktop-viewers.html>`__
`7.5. Finance <desktop-finance.html>`__
`8. Multimedia <multimedia.html>`__
`8.1. Synopsis <multimedia.html#multimedia-synopsis>`__
`8.2. Setting Up the Sound Card <sound-setup.html>`__
`8.3. MP3 Audio <sound-mp3.html>`__
`8.4. Video Playback <video-playback.html>`__
`8.5. TV Cards <tvcard.html>`__
`8.6. MythTV <mythtv.html>`__
`8.7. Image Scanners <scanners.html>`__
`9. Configuring the FreeBSD Kernel <kernelconfig.html>`__
`9.1. Synopsis <kernelconfig.html#kernelconfig-synopsis>`__
`9.2. Why Build a Custom Kernel? <kernelconfig-custom-kernel.html>`__
`9.3. Finding the System Hardware <kernelconfig-devices.html>`__
`9.4. The Configuration File <kernelconfig-config.html>`__
`9.5. Building and Installing a Custom
Kernel <kernelconfig-building.html>`__
`9.6. If Something Goes Wrong <kernelconfig-trouble.html>`__
`10. Printing <printing.html>`__
`10.1. Quick Start <printing.html#printing-quick-start>`__
`10.2. Printer Connections <printing-connections.html>`__
`10.3. Common Page Description Languages <printing-pdls.html>`__
`10.4. Direct Printing <printing-direct.html>`__
`10.5. LPD (Line Printer Daemon) <printing-lpd.html>`__
`10.6. Other Printing Systems <printing-other.html>`__
`11. Linux? Binary Compatibility <linuxemu.html>`__
`11.1. Synopsis <linuxemu.html#linuxemu-synopsis>`__
`11.2. Configuring Linux? Binary
Compatibility <linuxemu-lbc-install.html>`__
`11.3. Advanced Topics <linuxemu-advanced.html>`__
`III. System Administration <system-administration.html>`__
`12. Configuration and Tuning <config-tuning.html>`__
`12.1. Synopsis <config-tuning.html#config-synopsis>`__
`12.2. Starting Services <configtuning-starting-services.html>`__
`12.3. Configuring cron(8) <configtuning-cron.html>`__
`12.4. Managing Services in FreeBSD <configtuning-rcd.html>`__
`12.5. Setting Up Network Interface Cards <config-network-setup.html>`__
`12.6. Virtual Hosts <configtuning-virtual-hosts.html>`__
`12.7. Configuring System Logging <configtuning-syslog.html>`__
`12.8. Configuration Files <configtuning-configfiles.html>`__
`12.9. Tuning with sysctl(8) <configtuning-sysctl.html>`__
`12.10. Tuning Disks <configtuning-disk.html>`__
`12.11. Tuning Kernel Limits <configtuning-kernel-limits.html>`__
`12.12. Adding Swap Space <adding-swap-space.html>`__
`12.13. Power and Resource Management <acpi-overview.html>`__
`13. The FreeBSD Booting Process <boot.html>`__
`13.1. Synopsis <boot.html#boot-synopsis>`__
`13.2. FreeBSD Boot Process <boot-introduction.html>`__
`13.3. Configuring Boot Time Splash Screens <boot-splash.html>`__
`13.4. Device Hints <device-hints.html>`__
`13.5. Shutdown Sequence <boot-shutdown.html>`__
`14. Security <security.html>`__
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
`15. Jails <jails.html>`__
`15.1. Synopsis <jails.html#jails-synopsis>`__
`15.2. Terms Related to Jails <jails-terms.html>`__
`15.3. Creating and Controlling Jails <jails-build.html>`__
`15.4. Fine Tuning and Administration <jails-tuning.html>`__
`15.5. Updating Multiple Jails <jails-application.html>`__
`15.6. Managing Jails with ezjail <jails-ezjail.html>`__
`16. Mandatory Access Control <mac.html>`__
`16.1. Synopsis <mac.html#mac-synopsis>`__
`16.2. Key Terms <mac-inline-glossary.html>`__
`16.3. Understanding MAC Labels <mac-understandlabel.html>`__
`16.4. Planning the Security Configuration <mac-planning.html>`__
`16.5. Available MAC Policies <mac-policies.html>`__
`16.6. User Lock Down <mac-userlocked.html>`__
`16.7. Nagios in a MAC Jail <mac-implementing.html>`__
`16.8. Troubleshooting the MAC Framework <mac-troubleshoot.html>`__
`17. Security Event Auditing <audit.html>`__
`17.1. Synopsis <audit.html#audit-synopsis>`__
`17.2. Key Terms <audit-inline-glossary.html>`__
`17.3. Audit Configuration <audit-config.html>`__
`17.4. Working with Audit Trails <audit-administration.html>`__
`18. Storage <disks.html>`__
`18.1. Synopsis <disks.html#disks-synopsis>`__
`18.2. Adding Disks <disks-adding.html>`__
`18.3. Resizing and Growing Disks <disks-growing.html>`__
`18.4. USB Storage Devices <usb-disks.html>`__
`18.5. Creating and Using CD Media <creating-cds.html>`__
`18.6. Creating and Using DVD Media <creating-dvds.html>`__
`18.7. Creating and Using Floppy Disks <floppies.html>`__
`18.8. Backup Basics <backup-basics.html>`__
`18.9. Memory Disks <disks-virtual.html>`__
`18.10. File System Snapshots <snapshots.html>`__
`18.11. Disk Quotas <quotas.html>`__
`18.12. Encrypting Disk Partitions <disks-encrypting.html>`__
`18.13. Encrypting Swap <swap-encrypting.html>`__
`18.14. Highly Available Storage (HAST) <disks-hast.html>`__
`19. GEOM: Modular Disk Transformation Framework <geom.html>`__
`19.1. Synopsis <geom.html#geom-synopsis>`__
`19.2. RAID0 - Striping <geom-striping.html>`__
`19.3. RAID1 - Mirroring <geom-mirror.html>`__
`19.4. RAID3 - Byte-level Striping with Dedicated
Parity <geom-raid3.html>`__
`19.5. Software RAID Devices <geom-graid.html>`__
`19.6. GEOM Gate Network <geom-ggate.html>`__
`19.7. Labeling Disk Devices <geom-glabel.html>`__
`19.8. UFS Journaling Through GEOM <geom-gjournal.html>`__
`20. The Z File System (ZFS) <zfs.html>`__
`20.1. What Makes ZFS Different <zfs.html#zfs-differences>`__
`20.2. Quick Start Guide <zfs-quickstart.html>`__
`20.3. ``zpool`` Administration <zfs-zpool.html>`__
`20.4. ``zfs`` Administration <zfs-zfs.html>`__
`20.5. Delegated Administration <zfs-zfs-allow.html>`__
`20.6. Advanced Topics <zfs-advanced.html>`__
`20.7. Additional Resources <zfs-links.html>`__
`20.8. ZFS Features and Terminology <zfs-term.html>`__
`21. Other File Systems <filesystems.html>`__
`21.1. Synopsis <filesystems.html#filesystems-synopsis>`__
`21.2. Linux? File Systems <filesystems-linux.html>`__
`22. Virtualization <virtualization.html>`__
`22.1. Synopsis <virtualization.html#virtualization-synopsis>`__
`22.2. FreeBSD as a Guest OS <virtualization-guest.html>`__
`22.3. FreeBSD as a Host with
VirtualBox <virtualization-host-virtualbox.html>`__
`22.4. FreeBSD as a Host with bhyve <virtualization-host-bhyve.html>`__
`23. Localization - i18n/L10n Usage and Setup <l10n.html>`__
`23.1. Synopsis <l10n.html#l10n-synopsis>`__
`23.2. Using Localization <using-localization.html>`__
`23.3. Finding i18n Applications <l10n-compiling.html>`__
`23.4. Locale Configuration for Specific Languages <lang-setup.html>`__
`24. Updating and Upgrading FreeBSD <updating-upgrading.html>`__
`24.1. Synopsis <updating-upgrading.html#updating-upgrading-synopsis>`__
`24.2. FreeBSD Update <updating-upgrading-freebsdupdate.html>`__
`24.3. Updating the Documentation
Set <updating-upgrading-documentation.html>`__
`24.4. Tracking a Development Branch <current-stable.html>`__
`24.5. Synchronizing Source <synching.html>`__
`24.6. Rebuilding World <makeworld.html>`__
`24.7. Tracking for Multiple Machines <small-lan.html>`__
`25. DTrace <dtrace.html>`__
`25.1. Synopsis <dtrace.html#dtrace-synopsis>`__
`25.2. Implementation Differences <dtrace-implementation.html>`__
`25.3. Enabling DTrace Support <dtrace-enable.html>`__
`25.4. Using DTrace <dtrace-using.html>`__
`IV. Network Communication <network-communication.html>`__
`26. Serial Communications <serialcomms.html>`__
`26.1. Synopsis <serialcomms.html#serial-synopsis>`__
`26.2. Serial Terminology and Hardware <serial.html>`__
`26.3. Terminals <term.html>`__
`26.4. Dial-in Service <dialup.html>`__
`26.5. Dial-out Service <dialout.html>`__
`26.6. Setting Up the Serial Console <serialconsole-setup.html>`__
`27. PPP <ppp-and-slip.html>`__
`27.1. Synopsis <ppp-and-slip.html#ppp-and-slip-synopsis>`__
`27.2. Configuring PPP <userppp.html>`__
`27.3. Troubleshooting PPP Connections <ppp-troubleshoot.html>`__
`27.4. Using PPP over Ethernet (PPPoE) <pppoe.html>`__
`27.5. Using PPP over ATM (PPPoA) <pppoa.html>`__
`28. Electronic Mail <mail.html>`__
`28.1. Synopsis <mail.html#mail-synopsis>`__
`28.2. Mail Components <mail-using.html>`__
`28.3. Sendmail Configuration Files <sendmail.html>`__
`28.4. Changing the Mail Transfer Agent <mail-changingmta.html>`__
`28.5. Troubleshooting <mail-trouble.html>`__
`28.6. Advanced Topics <mail-advanced.html>`__
`28.7. Setting Up to Send Only <outgoing-only.html>`__
`28.8. Using Mail with a Dialup Connection <SMTP-dialup.html>`__
`28.9. SMTP Authentication <SMTP-Auth.html>`__
`28.10. Mail User Agents <mail-agents.html>`__
`28.11. Using fetchmail <mail-fetchmail.html>`__
`28.12. Using procmail <mail-procmail.html>`__
`29. Network Servers <network-servers.html>`__
`29.1. Synopsis <network-servers.html#network-servers-synopsis>`__
`29.2. The inetd Super-Server <network-inetd.html>`__
`29.3. Network File System (NFS) <network-nfs.html>`__
`29.4. Network Information System (NIS) <network-nis.html>`__
`29.5. Lightweight Directory Access Protocol
(LDAP) <network-ldap.html>`__
`29.6. Dynamic Host Configuration Protocol (DHCP) <network-dhcp.html>`__
`29.7. Domain Name System (DNS) <network-dns.html>`__
`29.8. Apache HTTP Server <network-apache.html>`__
`29.9. File Transfer Protocol (FTP) <network-ftp.html>`__
`29.10. File and Print Services for Microsoft??Windows? Clients
(Samba) <network-samba.html>`__
`29.11. Clock Synchronization with NTP <network-ntp.html>`__
`29.12. iSCSI Initiator and Target Configuration <network-iscsi.html>`__
`30. Firewalls <firewalls.html>`__
`30.1. Synopsis <firewalls.html#firewalls-intro>`__
`30.2. Firewall Concepts <firewalls-concepts.html>`__
`30.3. PF <firewalls-pf.html>`__
`30.4. IPFW <firewalls-ipfw.html>`__
`30.5. IPFILTER (IPF) <firewalls-ipf.html>`__
`31. Advanced Networking <advanced-networking.html>`__
`31.1.
Synopsis <advanced-networking.html#advanced-networking-synopsis>`__
`31.2. Gateways and Routes <network-routing.html>`__
`31.3. Wireless Networking <network-wireless.html>`__
`31.4. USB Tethering <network-usb-tethering.html>`__
`31.5. Bluetooth <network-bluetooth.html>`__
`31.6. Bridging <network-bridging.html>`__
`31.7. Link Aggregation and Failover <network-aggregation.html>`__
`31.8. Diskless Operation with PXE <network-diskless.html>`__
`31.9. IPv6 <network-ipv6.html>`__
`31.10. Common Address Redundancy Protocol (CARP) <carp.html>`__
`V. Appendices <appendices.html>`__
`A. Obtaining FreeBSD <mirrors.html>`__
`A.1. CD and DVD Sets <mirrors.html#mirrors-cdrom>`__
`A.2. FTP Sites <mirrors-ftp.html>`__
`A.3. Using CTM <ctm.html>`__
`A.4. Using Subversion <svn.html>`__
`A.5. Using rsync <mirrors-rsync.html>`__
`B. Bibliography <bibliography.html>`__
`B.1. Books Specific to
FreeBSD <bibliography.html#bibliography-freebsd>`__
`B.2. Users' Guides <bibliography-userguides.html>`__
`B.3. Administrators' Guides <bibliography-adminguides.html>`__
`B.4. Programmers' Guides <bibliography-programmers.html>`__
`B.5. Operating System Internals <bibliography-osinternals.html>`__
`B.6. Security Reference <bibliography-security.html>`__
`B.7. Hardware Reference <bibliography-hardware.html>`__
`B.8. UNIX? History <bibliography-history.html>`__
`B.9. Periodicals, Journals, and
Magazines <bibliography-journals.html>`__
`C. Resources on the Internet <eresources.html>`__
`C.1. Websites <eresources.html#eresources-www>`__
`C.2. Mailing Lists <eresources-mail.html>`__
`C.3. Usenet Newsgroups <eresources-news.html>`__
`C.4. Official Mirrors <eresources-web.html>`__
`D. OpenPGP Keys <pgpkeys.html>`__
`D.1. Officers <pgpkeys.html#pgpkeys-officers>`__
`FreeBSD Glossary <freebsd-glossary.html>`__
`Index <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-figures">

.. raw:: html

   <div class="toc-title">

List of Figures

.. raw:: html

   </div>

2.1. `FreeBSD Boot Loader
Menu <bsdinstall-start.html#bsdinstall-newboot-loader-menu>`__
2.2. `FreeBSD Boot Options
Menu <bsdinstall-start.html#bsdinstall-boot-options-menu>`__
2.3. `Welcome Menu <bsdinstall-start.html#bsdinstall-choose-mode>`__
2.4. `Keymap
Selection <using-bsdinstall.html#bsdinstall-keymap-select-default>`__
2.5. `Selecting Keyboard
Menu <using-bsdinstall.html#bsdinstall-config-keymap>`__
2.6. `Enhanced Keymap
Menu <using-bsdinstall.html#bsdinstall-keymap-10>`__
2.7. `Setting the
Hostname <using-bsdinstall.html#bsdinstall-config-hostname>`__
2.8. `Selecting Components to
Install <using-bsdinstall.html#bsdinstall-config-components>`__
2.9. `Installing from the
Network <using-bsdinstall.html#bsdinstall-netinstall-notify>`__
2.10. `Choosing a
Mirror <using-bsdinstall.html#bsdinstall-netinstall-mirror>`__
2.11. `Partitioning Choices on FreeBSD
9.x <bsdinstall-partitioning.html#bsdinstall-part-guided-manual>`__
2.12. `Partitioning Choices on FreeBSD 10.x and
Higher <bsdinstall-partitioning.html#bsdinstall-zfs-partmenu>`__
2.13. `Selecting from Multiple
Disks <bsdinstall-partitioning.html#bsdinstall-part-guided-disk>`__
2.14. `Selecting Entire Disk or
Partition <bsdinstall-partitioning.html#bsdinstall-part-entire-part>`__
2.15. `Review Created
Partitions <bsdinstall-partitioning.html#bsdinstall-part-review>`__
2.16. `Manually Create
Partitions <bsdinstall-partitioning.html#bsdinstall-part-manual-create>`__
2.17. `Manually Create
Partitions <bsdinstall-partitioning.html#bsdinstall-part-manual-partscheme>`__
2.18. `Manually Create
Partitions <bsdinstall-partitioning.html#bsdinstall-part-manual-addpart>`__
2.19. `ZFS Partitioning
Menu <bsdinstall-partitioning.html#bsdinstall-zfs-menu>`__
2.20. `ZFS Pool
Type <bsdinstall-partitioning.html#bsdinstall-zfs-vdev_type>`__
2.21. `Disk
Selection <bsdinstall-partitioning.html#bsdinstall-zfs-disk_select>`__
2.22. `Invalid
Selection <bsdinstall-partitioning.html#bsdinstall-zfs-vdev_invalid>`__
2.23. `Analysing a
Disk <bsdinstall-partitioning.html#bsdinstall-zfs-disk_info>`__
2.24. `Disk Encryption
Password <bsdinstall-partitioning.html#bsdinstall-zfs-geli_password>`__
2.25. `Last
Chance <bsdinstall-partitioning.html#bsdinstall-zfs-warning>`__
2.26. `Final
Confirmation <bsdinstall-final-warning.html#bsdinstall-final-confirmation>`__
2.27. `Fetching Distribution
Files <bsdinstall-final-warning.html#bsdinstall-distfile-fetching>`__
2.28. `Verifying Distribution
Files <bsdinstall-final-warning.html#bsdinstall-distfile-verify>`__
2.29. `Extracting Distribution
Files <bsdinstall-final-warning.html#bsdinstall-distfile-extract>`__
2.30. `Setting the ``root``
Password <bsdinstall-post.html#bsdinstall-post-set-root-passwd>`__
2.31. `Choose a Network
Interface <bsdinstall-post.html#bsdinstall-configure-net-interface>`__
2.32. `Scanning for Wireless Access
Points <bsdinstall-post.html#bsdinstall-wireless-scan>`__
2.33. `Choosing a Wireless
Network <bsdinstall-post.html#bsdinstall-wireless-accesspoints>`__
2.34. `WPA2 Setup <bsdinstall-post.html#bsdinstall-wireless-wpa2>`__
2.35. `Choose IPv4
Networking <bsdinstall-post.html#bsdinstall-configure-net-ipv4>`__
2.36. `Choose IPv4 DHCP
Configuration <bsdinstall-post.html#bsdinstall-net-ipv4-dhcp>`__
2.37. `IPv4 Static
Configuration <bsdinstall-post.html#bsdinstall-net-ipv4-static>`__
2.38. `Choose IPv6
Networking <bsdinstall-post.html#bsdinstall-net-ipv6>`__
2.39. `Choose IPv6 SLAAC
Configuration <bsdinstall-post.html#bsdinstall-net-ipv6-slaac>`__
2.40. `IPv6 Static
Configuration <bsdinstall-post.html#bsdinstall-net-ipv6-static>`__
2.41. `DNS
Configuration <bsdinstall-post.html#bsdinstall-net-dns-config>`__
2.42. `Select Local or UTC
Clock <bsdinstall-post.html#bsdinstall-local-utc>`__
2.43. `Select a
Region <bsdinstall-post.html#bsdinstall-timezone-region>`__
2.44. `Select a
Country <bsdinstall-post.html#bsdinstall-timezone-country>`__
2.45. `Select a Time
Zone <bsdinstall-post.html#bsdinstall-timezone-zone>`__
2.46. `Confirm Time
Zone <bsdinstall-post.html#bsdinstall-timezone-confirmation>`__
2.47. `Selecting Additional Services to
Enable <bsdinstall-post.html#bsdinstall-config-serv>`__
2.48. `Enabling Crash
Dumps <bsdinstall-post.html#bsdinstall-config-crashdump>`__
2.49. `Add User Accounts <bsdinstall-post.html#bsdinstall-add-user1>`__
2.50. `Enter User
Information <bsdinstall-post.html#bsdinstall-add-user2>`__
2.51. `Exit User and Group
Management <bsdinstall-post.html#bsdinstall-add-user3>`__
2.52. `Final
Configuration <bsdinstall-post.html#bsdinstall-final-config>`__
2.53. `Manual
Configuration <bsdinstall-post.html#bsdinstall-final-modification-shell>`__
2.54. `Complete the
Installation <bsdinstall-post.html#bsdinstall-final-main>`__
3.1. `FreeBSD Boot Loader Menu <install-start.html#boot-loader-menu>`__
3.2. `Typical Device Probe
Results <install-start.html#install-dev-probe>`__
3.3. `Selecting Country Menu <install-start.html#config-country>`__
3.4. `Selecting Keyboard Menu <install-start.html#config-keymap>`__
3.5. `Selecting Usage from Sysinstall Main
Menu <using-sysinstall.html#sysinstall-main3>`__
3.6. `Selecting Documentation Menu <using-sysinstall.html#main-doc>`__
3.7. `Sysinstall Documentation Menu <using-sysinstall.html#docmenu1>`__
3.8. `Sysinstall Main Menu <using-sysinstall.html#sysinstall-keymap>`__
3.9. `Sysinstall Keymap
Menu <using-sysinstall.html#sysinstall-keymap-menu>`__
3.10. `Sysinstall Main
Menu <using-sysinstall.html#sysinstall-options>`__
3.11. `Sysinstall Options <using-sysinstall.html#options>`__
3.12. `Begin Standard
Installation <using-sysinstall.html#sysinstall-standard>`__
3.13. `Select Drive for
FDisk <install-steps.html#sysinstall-fdisk-drive1>`__
3.14. `Typical Default FDisk
Partitions <install-steps.html#sysinstall-fdisk1>`__
3.15. `Fdisk Partition Using Entire
Disk <install-steps.html#sysinstall-fdisk2>`__
3.16. `Sysinstall Boot Manager
Menu <install-steps.html#sysinstall-bootmgr>`__
3.17. `Exit Select Drive <install-steps.html#sysinstall-fdisk-drive2>`__
3.18. `Sysinstall Disklabel
Editor <install-steps.html#sysinstall-label>`__
3.19. `Sysinstall Disklabel Editor with Auto
Defaults <install-steps.html#sysinstall-label2>`__
3.20. `Free Space for Root
Partition <install-steps.html#sysinstall-label-add>`__
3.21. `Edit Root Partition
Size <install-steps.html#sysinstall-label-add2>`__
3.22. `Choose the Root Partition
Type <install-steps.html#sysinstall-label-type>`__
3.23. `Choose the Root Mount
Point <install-steps.html#sysinstall-label-mount>`__
3.24. `Sysinstall Disklabel
Editor <install-steps.html#sysinstall-label4>`__
3.25. `Choose Distributions <install-choosing.html#distribution-set1>`__
3.26. `Confirm
Distributions <install-choosing.html#distribution-set2>`__
3.27. `Choose Installation Media <install-media.html#choose-media>`__
3.28. `Selecting an Ethernet Device <install-post.html#ed-config1>`__
3.29. `Set Network Configuration for
*``ed0``* <install-post.html#ed-config2>`__
3.30. `Editing ``inetd.conf`` <install-post.html#inetd-edit>`__
3.31. `Default Anonymous FTP
Configuration <install-post.html#anon-ftp2>`__
3.32. `Edit the FTP Welcome Message <install-post.html#anon-ftp4>`__
3.33. `Editing ``exports`` <install-post.html#nfs-server-edit>`__
3.34. `System Console Configuration
Options <install-post.html#saver-options>`__
3.35. `Screen Saver Options <install-post.html#saver-select>`__
3.36. `Screen Saver Timeout <install-post.html#saver-timeout>`__
3.37. `System Console Configuration
Exit <install-post.html#saver-exit>`__
3.38. `Select the Region <install-post.html#set-timezone-region>`__
3.39. `Select the Country <install-post.html#set-timezone-country>`__
3.40. `Select the Time Zone <install-post.html#set-timezone-locality>`__
3.41. `Select Mouse Protocol Type <install-post.html#mouse-protocol>`__
3.42. `Set Mouse Protocol <install-post.html#set-mouse-protocol>`__
3.43. `Configure Mouse Port <install-post.html#config-mouse-port>`__
3.44. `Setting the Mouse Port <install-post.html#set-mouse-port>`__
3.45. `Enable the Mouse Daemon <install-post.html#test-daemon>`__
3.46. `Test the Mouse Daemon <install-post.html#test-mouse-daemon>`__
3.47. `Select Package Category <install-post.html#package-category>`__
3.48. `Select Packages <install-post.html#package-select>`__
3.49. `Install Packages <install-post.html#package-install>`__
3.50. `Confirm Package
Installation <install-post.html#package-install-confirm>`__
3.51. `Select User <install-post.html#add-user2>`__
3.52. `Add User Information <install-post.html#add-user3>`__
3.53. `Exit User and Group Management <install-post.html#add-user4>`__
3.54. `Exit Install <install-post.html#final-main>`__
3.55. `Network Configuration
Upper-level <install-post.html#network-configuration>`__
3.56. `Select a Default MTA <install-post.html#mta-selection>`__
3.57. `Ntpdate Configuration <install-post.html#Ntpdate-config>`__
3.58. `Network Configuration
Lower-level <install-post.html#Network-configuration-cont>`__
31.1. `PXE Booting Process with NFS Root
Mount <network-diskless.html#idp88893776>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-tables">

.. raw:: html

   <div class="toc-title">

List of Tables

.. raw:: html

   </div>

2.1. `Partitioning Schemes <bsdinstall-partitioning.html#idp67583952>`__
3.1. `Sample Device Inventory <install-pre.html#idp68048848>`__
3.2. `Partition Layout for First
Disk <install-steps.html#idp68610384>`__
3.3. `Partition Layout for Subsequent
Disks <install-steps.html#idp68631760>`__
3.4. `FreeBSD ISO Image Names and
Meanings <install-diff-media.html#idp69438544>`__
4.1. `Utilities for Managing User
Accounts <users-synopsis.html#users-modifying-utilities>`__
4.2. `UNIX? Permissions <permissions.html#idp69900624>`__
4.3. `Disk Device Names <disk-organization.html#disks-naming>`__
4.4. `Common Environment Variables <shells.html#shell-env-vars>`__
6.1. `XDM Configuration Files <x-xdm.html#xdm-config-files>`__
8.1. `Common Error Messages <sound-setup.html#idp72489296>`__
10.1. `Output PDLs <printing-pdls.html#print-pdls-ps-to-other-tbl>`__
13.1. `Loader Built-In
Commands <boot-introduction.html#boot-loader-commands>`__
13.2. `Kernel Interaction During
Boot <boot-introduction.html#boot-kernel>`__
14.1. `Login Class Resource
Limits <security-resourcelimits.html#resource-limits>`__
17.1. `Default Audit Event
Classes <audit-config.html#event-selection>`__
17.2. `Prefixes for Audit Event
Classes <audit-config.html#event-prefixes>`__
23.1. `Common Language and Country
Codes <using-localization.html#locale-lang-country>`__
23.2. `Defined Terminal Types for Character
Sets <using-localization.html#locale-charset>`__
23.3. `Available Console from Ports
Collection <using-localization.html#locale-console>`__
23.4. `Available Input Methods <using-localization.html#locale-xim>`__
26.1. `RS-232C Signal Names <serial.html#serialcomms-signal-names>`__
26.2. `DB-25 to DB-25 Null-Modem Cable <serial.html#nullmodem-db25>`__
26.3. `DB-9 to DB-9 Null-Modem Cable <serial.html#nullmodem-db9>`__
26.4. `DB-9 to DB-25 Null-Modem Cable <serial.html#nullmodem-db9-25>`__
29.1. `NIS Terminology <network-nis.html#idp84887120>`__
29.2. `Additional Users <network-nis.html#idp85125072>`__
29.3. `Additional Systems <network-nis.html#idp85149520>`__
29.4. `DNS Terminology <network-dns.html#idp85475408>`__
30.1. `Useful ``pfctl`` Options <firewalls-pf.html#pfctl>`__
31.1. `Commonly Seen Routing Table
Flags <network-routing.html#routeflags>`__
31.2. `Station Capability Codes <network-wireless.html#idp87785296>`__
31.3. `Reserved IPv6 Addresses <network-ipv6.html#reservedip6>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

List of Examples

.. raw:: html

   </div>

2.1. `Creating Traditional Split File System
Partitions <bsdinstall-partitioning.html#bsdinstall-part-manual-splitfs>`__
3.1. `Using an Existing Partition
Unchanged <install-pre.html#idp68091344>`__
3.2. `Shrinking an Existing Partition <install-pre.html#idp68099920>`__
4.1. `Install a Program As the
Superuser <users-synopsis.html#idp69696592>`__
4.2. `Adding a User on
FreeBSD <users-synopsis.html#users-modifying-adduser>`__
4.3. ```rmuser`` Interactive Account
Removal <users-synopsis.html#idp69771856>`__
4.4. `Using ``chpass`` as
Superuser <users-synopsis.html#users-modifying-chpass-su>`__
4.5. `Using ``chpass`` as Regular
User <users-synopsis.html#users-modifying-chpass-ru>`__
4.6. `Changing Your Password <users-synopsis.html#idp69808976>`__
4.7. `Changing Another User's Password as the
Superuser <users-synopsis.html#idp69811920>`__
4.8. `Adding a Group Using pw(8) <users-synopsis.html#idp69843664>`__
4.9. `Adding User Accounts to a New Group Using
pw(8) <users-synopsis.html#idp69862480>`__
4.10. `Adding a New Member to a Group Using
pw(8) <users-synopsis.html#idp69870032>`__
4.11. `Using id(1) to Determine Group
Membership <users-synopsis.html#idp69874000>`__
4.12. `Sample Disk, Slice, and Partition
Names <disk-organization.html#basics-disk-slice-part>`__
4.13. `Conceptual Model of a
Disk <disk-organization.html#basics-concept-disk-model>`__
12.1. `Sample Log Server
Configuration <configtuning-syslog.html#idp74455632>`__
12.2. `Creating a Swap File on FreeBSD?10.\ *``X``* and
Later <adding-swap-space.html#swapfile-10-and-later>`__
12.3. `Creating a Swap File on FreeBSD?9.\ *``X``* and
Earlier <adding-swap-space.html#swapfile-9-and-earlier>`__
13.1. ```boot0``
Screenshot <boot-introduction.html#boot-boot0-example>`__
13.2. ```boot2``
Screenshot <boot-introduction.html#boot-boot2-example>`__
13.3. `Configuring an Insecure Console in
``/etc/ttys`` <boot-introduction.html#boot-insecure-console>`__
14.1. `Create a Secure Tunnel for SMTP <openssh.html#idp76323152>`__
14.2. `Secure Access of a POP3 Server <openssh.html#idp76331984>`__
14.3. `Bypassing a Firewall <openssh.html#idp76342480>`__
15.1. `mergemaster(8) on Untrusted
Jail <jails-ezjail.html#jails-ezjail-update-mergemaster-untrusted>`__
15.2. `mergemaster(8) on Trusted
Jail <jails-ezjail.html#jails-ezjail-update-mergemaster-trusted>`__
15.3. `Running BIND in a
Jail <jails-ezjail.html#jails-ezjail-example-bind-steps>`__
18.1. `Using ``dump`` over ssh <backup-basics.html#idp78644048>`__
18.2. `Using ``dump`` over ssh with ``RSH``
Set <backup-basics.html#idp78647504>`__
18.3. `Backing Up the Current Directory with
``tar`` <backup-basics.html#idp78660432>`__
18.4. `Restoring Up the Current Directory with
``tar`` <backup-basics.html#idp78663504>`__
18.5. `Using\ ``ls`` and ``cpio`` to Make a Recursive Backup of the
Current Directory <backup-basics.html#idp78672080>`__
18.6. `Backing Up the Current Directory with
``pax`` <backup-basics.html#idp78687056>`__
19.1. `Labeling Partitions on the Boot
Disk <geom-glabel.html#idp79818704>`__
26.1. `Configuring Terminal Entries <term.html#ex-etc-ttys>`__
29.1. `Reloading the inetd Configuration
File <network-inetd.html#network-inetd-reread>`__
29.2. `Mounting an Export with amd <network-nfs.html#idp84787664>`__
29.3. `Mounting an Export with
autofs(5) <network-nfs.html#idp84838096>`__
29.4. `Sample ``/etc/ntp.conf`` <network-ntp.html#idp86213712>`__
31.1. `LACP Aggregation with a Cisco?
Switch <network-aggregation.html#networking-lacp-aggregation-cisco>`__
31.2. `Failover
Mode <network-aggregation.html#networking-lagg-failover>`__
31.3. `Failover Mode Between Ethernet and Wireless
Interfaces <network-aggregation.html#networking-lagg-wired-and-wireless>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------------+
| ?   | ?   | ?\ `Next <book-preface.html>`__   |
+-----+-----+-----------------------------------+
| ?   | ?   | ?Preface                          |
+-----+-----+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
