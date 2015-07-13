=======
Preface
=======

.. raw:: html

   <div class="navheader">

Preface
`Prev <index.html>`__?
?
?\ `Next <getting-started.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="preface">

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

Intended Audience
-----------------

The FreeBSD newcomer will find that the first section of this book
guides the user through the FreeBSD installation process and gently
introduces the concepts and conventions that underpin UNIX?. Working
through this section requires little more than the desire to explore,
and the ability to take on board new concepts as they are introduced.

Once you have traveled this far, the second, far larger, section of the
Handbook is a comprehensive reference to all manner of topics of
interest to FreeBSD system administrators. Some of these chapters may
recommend that you do some prior reading, and this is noted in the
synopsis at the beginning of each chapter.

For a list of additional sources of information, please see `Appendix?B,
*Bibliography* <bibliography.html>`__.

Changes from the Third Edition
------------------------------

The current online version of the Handbook represents the cumulative
effort of many hundreds of contributors over the past 10 years. The
following are some of the significant changes since the two volume third
edition was published in 2004:

.. raw:: html

   <div class="itemizedlist">

-  `Chapter?25, *DTrace* <dtrace.html>`__ has been added with
   information about the powerful DTrace performance analysis tool.

-  `Chapter?21, *Other File Systems* <filesystems.html>`__ has been
   added with information about non-native file systems in FreeBSD, such
   as ZFS from Sun™.

-  `Chapter?17, *Security Event Auditing* <audit.html>`__ has been added
   to cover the new auditing capabilities in FreeBSD and explain its
   use.

-  `Chapter?22, *Virtualization* <virtualization.html>`__ has been added
   with information about installing FreeBSD on virtualization software.

-  `Chapter?2, *Installing FreeBSD?9.\ *``X``* and
   Later* <bsdinstall.html>`__ has been added to cover installation of
   FreeBSD using the new installation utility, bsdinstall.

.. raw:: html

   </div>

Changes from the Second Edition (2004)
--------------------------------------

The third edition was the culmination of over two years of work by the
dedicated members of the FreeBSD Documentation Project. The printed
edition grew to such a size that it was necessary to publish as two
separate volumes. The following are the major changes in this new
edition:

.. raw:: html

   <div class="itemizedlist">

-  `Chapter?12, *Configuration and Tuning* <config-tuning.html>`__ has
   been expanded with new information about the ACPI power and resource
   management, the ``cron`` system utility, and more kernel tuning
   options.

-  `Chapter?14, *Security* <security.html>`__ has been expanded with new
   information about virtual private networks (VPNs), file system access
   control lists (ACLs), and security advisories.

-  `Chapter?16, *Mandatory Access Control* <mac.html>`__ is a new
   chapter with this edition. It explains what MAC is and how this
   mechanism can be used to secure a FreeBSD system.

-  `Chapter?18, *Storage* <disks.html>`__ has been expanded with new
   information about USB storage devices, file system snapshots, file
   system quotas, file and network backed filesystems, and encrypted
   disk partitions.

-  A troubleshooting section has been added to `Chapter?27,
   *PPP* <ppp-and-slip.html>`__.

-  `Chapter?28, *Electronic Mail* <mail.html>`__ has been expanded with
   new information about using alternative transport agents, SMTP
   authentication, UUCP, fetchmail, procmail, and other advanced topics.

-  `Chapter?29, *Network Servers* <network-servers.html>`__ is all new
   with this edition. This chapter includes information about setting up
   the Apache HTTP Server, ftpd, and setting up a server for Microsoft?
   Windows? clients with Samba. Some sections from `Chapter?31,
   *Advanced Networking* <advanced-networking.html>`__ were moved here
   to improve the presentation.

-  `Chapter?31, *Advanced Networking* <advanced-networking.html>`__ has
   been expanded with new information about using Bluetooth? devices
   with FreeBSD, setting up wireless networks, and Asynchronous Transfer
   Mode (ATM) networking.

-  A glossary has been added to provide a central location for the
   definitions of technical terms used throughout the book.

-  A number of aesthetic improvements have been made to the tables and
   figures throughout the book.

.. raw:: html

   </div>

Changes from the First Edition (2001)
-------------------------------------

The second edition was the culmination of over two years of work by the
dedicated members of the FreeBSD Documentation Project. The following
were the major changes in this edition:

.. raw:: html

   <div class="itemizedlist">

-  A complete Index has been added.

-  All ASCII figures have been replaced by graphical diagrams.

-  A standard synopsis has been added to each chapter to give a quick
   summary of what information the chapter contains, and what the reader
   is expected to know.

-  The content has been logically reorganized into three parts: “Getting
   Started”, “System Administration”, and “Appendices”.

-  `Chapter?3, *Installing FreeBSD?8.\ *``X``** <install.html>`__ was
   completely rewritten with many screenshots to make it much easier for
   new users to grasp the text.

-  `Chapter?4, *UNIX Basics* <basics.html>`__ has been expanded to
   contain additional information about processes, daemons, and signals.

-  `Chapter?5, *Installing Applications: Packages and
   Ports* <ports.html>`__ has been expanded to contain additional
   information about binary package management.

-  `Chapter?6, *The X Window System* <x11.html>`__ has been completely
   rewritten with an emphasis on using modern desktop technologies such
   as KDE and GNOME on XFree86™ 4.X.

-  `Chapter?13, *The FreeBSD Booting Process* <boot.html>`__ has been
   expanded.

-  `Chapter?18, *Storage* <disks.html>`__ has been written from what
   used to be two separate chapters on “Disks” and “Backups”. We feel
   that the topics are easier to comprehend when presented as a single
   chapter. A section on RAID (both hardware and software) has also been
   added.

-  `Chapter?26, *Serial Communications* <serialcomms.html>`__ has been
   completely reorganized and updated for FreeBSD 4.X/5.X.

-  `Chapter?27, *PPP* <ppp-and-slip.html>`__ has been substantially
   updated.

-  Many new sections have been added to `Chapter?31, *Advanced
   Networking* <advanced-networking.html>`__.

-  `Chapter?28, *Electronic Mail* <mail.html>`__ has been expanded to
   include more information about configuring sendmail.

-  `Chapter?11, *Linux? Binary Compatibility* <linuxemu.html>`__ has
   been expanded to include information about installing Oracle? and
   SAP??R/3?.

-  The following new topics are covered in this second edition:

   .. raw:: html

      <div class="itemizedlist">

   -  `Chapter?12, *Configuration and Tuning* <config-tuning.html>`__.

   -  `Chapter?8, *Multimedia* <multimedia.html>`__.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Organization of This Book
-------------------------

This book is split into five logically distinct sections. The first
section, *Getting Started*, covers the installation and basic usage of
FreeBSD. It is expected that the reader will follow these chapters in
sequence, possibly skipping chapters covering familiar topics. The
second section, *Common Tasks*, covers some frequently used features of
FreeBSD. This section, and all subsequent sections, can be read out of
order. Each chapter begins with a succinct synopsis that describes what
the chapter covers and what the reader is expected to already know. This
is meant to allow the casual reader to skip around to find chapters of
interest. The third section, *System Administration*, covers
administration topics. The fourth section, *Network Communication*,
covers networking and server topics. The fifth section contains
appendices of reference information.

.. raw:: html

   <div class="variablelist">

*`Chapter?1, *Introduction* <introduction.html>`__*
    Introduces FreeBSD to a new user. It describes the history of the
    FreeBSD Project, its goals and development model.

*`Chapter?2, *Installing FreeBSD?9.\ *``X``* and
Later* <bsdinstall.html>`__*
    Walks a user through the entire installation process of
    FreeBSD?9.\ *``x``* and later using bsdinstall.

*`Chapter?3, *Installing FreeBSD?8.\ *``X``** <install.html>`__*
    Walks a user through the entire installation process of
    FreeBSD?8.\ *``x``* and earlier using sysinstall. Some advanced
    installation topics, such as installing through a serial console,
    are also covered.

*`Chapter?4, *UNIX Basics* <basics.html>`__*
    Covers the basic commands and functionality of the FreeBSD operating
    system. If you are familiar with Linux? or another flavor of UNIX?
    then you can probably skip this chapter.

*`Chapter?5, *Installing Applications: Packages and
Ports* <ports.html>`__*
    Covers the installation of third-party software with both FreeBSD's
    innovative “Ports Collection” and standard binary packages.

*`Chapter?6, *The X Window System* <x11.html>`__*
    Describes the X Window System in general and using X11 on FreeBSD in
    particular. Also describes common desktop environments such as KDE
    and GNOME.

*`Chapter?7, *Desktop Applications* <desktop.html>`__*
    Lists some common desktop applications, such as web browsers and
    productivity suites, and describes how to install them on FreeBSD.

*`Chapter?8, *Multimedia* <multimedia.html>`__*
    Shows how to set up sound and video playback support for your
    system. Also describes some sample audio and video applications.

*`Chapter?9, *Configuring the FreeBSD Kernel* <kernelconfig.html>`__*
    Explains why you might need to configure a new kernel and provides
    detailed instructions for configuring, building, and installing a
    custom kernel.

*`Chapter?10, *Printing* <printing.html>`__*
    Describes managing printers on FreeBSD, including information about
    banner pages, printer accounting, and initial setup.

*`Chapter?11, *Linux? Binary Compatibility* <linuxemu.html>`__*
    Describes the Linux? compatibility features of FreeBSD. Also
    provides detailed installation instructions for many popular Linux?
    applications such as Oracle? and Mathematica?.

*`Chapter?12, *Configuration and Tuning* <config-tuning.html>`__*
    Describes the parameters available for system administrators to tune
    a FreeBSD system for optimum performance. Also describes the various
    configuration files used in FreeBSD and where to find them.

*`Chapter?13, *The FreeBSD Booting Process* <boot.html>`__*
    Describes the FreeBSD boot process and explains how to control this
    process with configuration options.

*`Chapter?14, *Security* <security.html>`__*
    Describes many different tools available to help keep your FreeBSD
    system secure, including Kerberos, IPsec and OpenSSH.

*`Chapter?15, *Jails* <jails.html>`__*
    Describes the jails framework, and the improvements of jails over
    the traditional chroot support of FreeBSD.

*`Chapter?16, *Mandatory Access Control* <mac.html>`__*
    Explains what Mandatory Access Control (MAC) is and how this
    mechanism can be used to secure a FreeBSD system.

*`Chapter?17, *Security Event Auditing* <audit.html>`__*
    Describes what FreeBSD Event Auditing is, how it can be installed,
    configured, and how audit trails can be inspected or monitored.

*`Chapter?18, *Storage* <disks.html>`__*
    Describes how to manage storage media and filesystems with FreeBSD.
    This includes physical disks, RAID arrays, optical and tape media,
    memory-backed disks, and network filesystems.

*`Chapter?19, *GEOM: Modular Disk Transformation
Framework* <geom.html>`__*
    Describes what the GEOM framework in FreeBSD is and how to configure
    various supported RAID levels.

*`Chapter?21, *Other File Systems* <filesystems.html>`__*
    Examines support of non-native file systems in FreeBSD, like the Z
    File System from Sun™.

*`Chapter?22, *Virtualization* <virtualization.html>`__*
    Describes what virtualization systems offer, and how they can be
    used with FreeBSD.

*`Chapter?23, *Localization - i18n/L10n Usage and Setup* <l10n.html>`__*
    Describes how to use FreeBSD in languages other than English. Covers
    both system and application level localization.

*`Chapter?24, *Updating and Upgrading
FreeBSD* <updating-upgrading.html>`__*
    Explains the differences between FreeBSD-STABLE, FreeBSD-CURRENT,
    and FreeBSD releases. Describes which users would benefit from
    tracking a development system and outlines that process. Covers the
    methods users may take to update their system to the latest security
    release.

*`Chapter?25, *DTrace* <dtrace.html>`__*
    Describes how to configure and use the DTrace tool from Sun™ in
    FreeBSD. Dynamic tracing can help locate performance issues, by
    performing real time system analysis.

*`Chapter?26, *Serial Communications* <serialcomms.html>`__*
    Explains how to connect terminals and modems to your FreeBSD system
    for both dial in and dial out connections.

*`Chapter?27, *PPP* <ppp-and-slip.html>`__*
    Describes how to use PPP to connect to remote systems with FreeBSD.

*`Chapter?28, *Electronic Mail* <mail.html>`__*
    Explains the different components of an email server and dives into
    simple configuration topics for the most popular mail server
    software: sendmail.

*`Chapter?29, *Network Servers* <network-servers.html>`__*
    Provides detailed instructions and example configuration files to
    set up your FreeBSD machine as a network filesystem server, domain
    name server, network information system server, or time
    synchronization server.

*`Chapter?30, *Firewalls* <firewalls.html>`__*
    Explains the philosophy behind software-based firewalls and provides
    detailed information about the configuration of the different
    firewalls available for FreeBSD.

*`Chapter?31, *Advanced Networking* <advanced-networking.html>`__*
    Describes many networking topics, including sharing an Internet
    connection with other computers on your LAN, advanced routing
    topics, wireless networking, Bluetooth?, ATM, IPv6, and much more.

*`Appendix?A, *Obtaining FreeBSD* <mirrors.html>`__*
    Lists different sources for obtaining FreeBSD media on CDROM or DVD
    as well as different sites on the Internet that allow you to
    download and install FreeBSD.

*`Appendix?B, *Bibliography* <bibliography.html>`__*
    This book touches on many different subjects that may leave you
    hungry for a more detailed explanation. The bibliography lists many
    excellent books that are referenced in the text.

*`Appendix?C, *Resources on the Internet* <eresources.html>`__*
    Describes the many forums available for FreeBSD users to post
    questions and engage in technical conversations about FreeBSD.

*`Appendix?D, *OpenPGP Keys* <pgpkeys.html>`__*
    Lists the PGP fingerprints of several FreeBSD Developers.

.. raw:: html

   </div>

Conventions used in this book
-----------------------------

To provide a consistent and easy to read text, several conventions are
followed throughout the book.

Typographic Conventions
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="variablelist">

*Italic*
    An *italic* font is used for filenames, URLs, emphasized text, and
    the first usage of technical terms.

``Monospace``
    A ``monospaced`` font is used for error messages, commands,
    environment variables, names of ports, hostnames, user names, group
    names, device names, variables, and code fragments.

Bold
    A bold font is used for applications, commands, and keys.

.. raw:: html

   </div>

User Input
~~~~~~~~~~

Keys are shown in **bold** to stand out from other text. Key
combinations that are meant to be typed simultaneously are shown with
\`\ ``+``' between the keys, such as:

**Ctrl**+**Alt**+**Del**

Meaning the user should type the **Ctrl**, **Alt**, and **Del** keys at
the same time.

Keys that are meant to be typed in sequence will be separated with
commas, for example:

**Ctrl**+**X**, **Ctrl**+**S**

Would mean that the user is expected to type the **Ctrl** and **X** keys
simultaneously and then to type the **Ctrl** and **S** keys
simultaneously.

Examples
~~~~~~~~

Examples starting with ``C:\>`` indicate a MS-DOS? command. Unless
otherwise noted, these commands may be executed from a “Command Prompt”
window in a modern Microsoft??Windows? environment.

.. code:: screen

    E:\> tools\fdimage floppies\kern.flp A:

Examples starting with ``#`` indicate a command that must be invoked as
the superuser in FreeBSD. You can login as ``root`` to type the command,
or login as your normal account and use
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ to
gain superuser privileges.

.. code:: screen

    # dd if=kern.flp of=/dev/fd0

Examples starting with ``%`` indicate a command that should be invoked
from a normal user account. Unless otherwise noted, C-shell syntax is
used for setting environment variables and other shell commands.

.. code:: screen

    % top

Acknowledgments
---------------

The book you are holding represents the efforts of many hundreds of
people around the world. Whether they sent in fixes for typos, or
submitted complete chapters, all the contributions have been useful.

Several companies have supported the development of this document by
paying authors to work on it full-time, paying for publication, etc. In
particular, BSDi (subsequently acquired by `Wind River
Systems <http://www.windriver.com>`__) paid members of the FreeBSD
Documentation Project to work on improving this book full time leading
up to the publication of the first printed edition in March 2000 (ISBN
1-57176-241-8). Wind River Systems then paid several additional authors
to make a number of improvements to the print-output infrastructure and
to add additional chapters to the text. This work culminated in the
publication of the second printed edition in November 2001 (ISBN
1-57176-303-1). In 2003-2004, `FreeBSD Mall,
Inc <http://www.freebsdmall.com>`__, paid several contributors to
improve the Handbook in preparation for the third printed edition.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+--------------------------------------+
| `Prev <index.html>`__?   | ?                       | ?\ `Next <getting-started.html>`__   |
+--------------------------+-------------------------+--------------------------------------+
| FreeBSD Handbook?        | `Home <index.html>`__   | ?Part?I.?Getting Started             |
+--------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
