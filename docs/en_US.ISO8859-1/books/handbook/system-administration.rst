===============================
Part?III.?System Administration
===============================

.. raw:: html

   <div class="navheader">

Part?III.?System Administration
`Prev <linuxemu-advanced.html>`__?
?
?\ `Next <config-tuning.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="part">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="partintro">

.. raw:: html

   <div xmlns="">

.. raw:: html

   </div>

The remaining chapters of the FreeBSD Handbook cover all aspects of
FreeBSD system administration. Each chapter starts by describing what
you will learn as a result of reading the chapter, and also details what
you are expected to know before tackling the material.

These chapters are designed to be read when you need the information.
You do not have to read them in any particular order, nor do you need to
read all of them before you can begin using FreeBSD.

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

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
| `Prev <linuxemu-advanced.html>`__?   | ?                       | ?\ `Next <config-tuning.html>`__        |
+--------------------------------------+-------------------------+-----------------------------------------+
| 11.3.?Advanced Topics?               | `Home <index.html>`__   | ?Chapter?12.?Configuration and Tuning   |
+--------------------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
