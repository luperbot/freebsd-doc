=========================================
3.13.?Preparing Custom Installation Media
=========================================

.. raw:: html

   <div class="navheader">

3.13.?Preparing Custom Installation Media
`Prev <install-advanced.html>`__?
Chapter?3.?Installing FreeBSD?8.\ *``X``*
?\ `Next <basics.html>`__

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

3.13.?Preparing Custom Installation Media
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some situations may require a customized FreeBSD installation media
and/or source. This might be physical media or a source that
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
can use to retrieve the installation files. Some example situations
include:

.. raw:: html

   <div class="itemizedlist">

-  A local network with many machines has a private FTP server hosting
   the FreeBSD installation files which the machines should use for
   installation.

-  FreeBSD does not recognize the CD/DVD drive but Windows? does. In
   this case, copy the FreeBSD installation files to a Windows?
   partition on the same computer, and then install FreeBSD using those
   files.

-  The computer to install does not have a CD/DVD drive or a network
   card, but can be connected using a null-printer cable to a computer
   that does.

-  A tape will be used to install FreeBSD.

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

3.13.1.?Creating an Installation ISO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As part of each release, the FreeBSD Project provides ISO images for
each supported architecture. These images can be written (“burned”) to
CD or DVD media using a burning application, and then used to install
FreeBSD. If a CD/DVD writer is available, this is the easiest way to
install FreeBSD.

.. raw:: html

   <div class="procedure">

#. **Download the Correct ISO Images**

   The ISO images for each release can be downloaded from
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/ISO-IMAGES-arch``/*``version``*
   or the closest mirror. Substitute *``arch``* and *``version``* as
   appropriate.

   An image directory normally contains the following images:

   .. raw:: html

      <div class="table">

   .. raw:: html

      <div class="table-title">

   Table?3.4.?FreeBSD ISO Image Names and Meanings

   .. raw:: html

      </div>

   .. raw:: html

      <div class="table-contents">

   +-------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Filename                                              | Contents                                                                                                                                                                                                                                                                                       |
   +=======================================================+================================================================================================================================================================================================================================================================================================+
   | ``FreeBSD-version``-RELEASE-*``arch``*-bootonly.iso   | This CD image starts the installation process by booting from a CD-ROM drive but it does not contain the support for installing FreeBSD from the CD itself. Perform a network based install, such as from an FTP server, after booting from this CD.                                           |
   +-------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version``-RELEASE-*``arch``*-dvd1.iso.gz    | This DVD image contains everything necessary to install the base FreeBSD operating system, a collection of pre-built packages, and the documentation. It also supports booting into a “livefs” based rescue mode.                                                                              |
   +-------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version``-RELEASE-*``arch``*-memstick.img   | This image can be written to a USB memory stick in order to install machines capable of booting from USB drives. It also supports booting into a “livefs” based rescue mode. The only included package is the documentation package.                                                           |
   +-------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version``-RELEASE-*``arch``*-disc1.iso      | This image can be written to a USB memory stick in order to install machines capable of booting from USB drives. Similar to the ``bootonly.iso`` image, it does not contain the distribution sets on the medium itself, but does support network-based installations (for example, via ftp).   |
   +-------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version-RELEASE-arch-disc1.iso``            | This CD image contains the base FreeBSD operating system and the documentation package but no other packages.                                                                                                                                                                                  |
   +-------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version``-RELEASE-*``arch``*-disc2.iso      | A CD image with as many third-party packages as would fit on the disc. This image is not available for FreeBSD?9.\ *``X``*.                                                                                                                                                                    |
   +-------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version``-RELEASE-*``arch``*-disc3.iso      | Another CD image with as many third-party packages as would fit on the disc. This image is not available for FreeBSD?9.\ *``X``*.                                                                                                                                                              |
   +-------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``FreeBSD-version``-RELEASE-*``arch``*-livefs.iso     | This CD image contains support for booting into a “livefs” based rescue mode but does not support doing an install from the CD itself.                                                                                                                                                         |
   +-------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

   When performing a CD installation, download either the ``bootonly``
   ISO image or ``disc1``. Do not download both, since ``disc1``
   contains everything that the ``bootonly`` ISO image contains.

   Use the ``bootonly`` ISO to perform a network install over the
   Internet. Additional software can be installed as needed using the
   Ports Collection as described in `Chapter?5, *Installing
   Applications: Packages and Ports* <ports.html>`__.

   Use ``dvd1`` to install FreeBSD and a selection of third-party
   packages from the disc.

#. **Burn the Media**

   Next, write the downloaded image(s) to disc. If using another FreeBSD
   system, refer to `Section?18.5.2, “Burning a
   CD” <creating-cds.html#cdrecord>`__ for instructions.

   If using another platform, use any burning utility that exists for
   that platform. The images are in the standard ISO format which most
   CD writing applications support.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

To build a customized release of FreeBSD, refer to the `Release
Engineering
Article <../../../../doc/en_US.ISO8859-1/articles/releng>`__.

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

3.13.2.?Creating a Local FTP Site with a FreeBSD Disc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD discs are laid out in the same way as the FTP site. This makes
it easy to create a local FTP site that can be used by other machines on
a network to install FreeBSD.

.. raw:: html

   <div class="procedure">

#. On the FreeBSD computer that will host the FTP site, ensure that the
   CD/DVD is in the drive and mounted:

   .. code:: screen

       # mount /cdrom

#. Create an account for anonymous FTP. Use
   `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__
   to insert this line:

   .. code:: programlisting

       ftp:*:99:99::0:0:FTP:/cdrom:/nonexistent

#. Ensure that the FTP service is enabled in ``/etc/inetd.conf``.

.. raw:: html

   </div>

Anyone with network connectivity to the machine can now chose a media
type of FTP and type in **``ftp://your       machine``** after picking
“Other” in the FTP sites menu during the install.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If the boot media for the FTP clients is not precisely the same version
as that provided by the local FTP site,
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
will not complete the installation. To override this, go into the
Options menu and change the distribution name to any.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

This approach is acceptable for a machine on the local network which is
protected by a firewall. Offering anonymous FTP services to other
machines over the Internet exposes the computer to increased security
risks. It is strongly recommended to follow good security practices when
providing services over the Internet.

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

3.13.3.?Installing from an Windows? Partition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To prepare for an installation from a Windows? partition, copy the files
from the distribution into a directory in the root directory of the
partition, such as ``c:\freebsd``. Since the directory structure must be
reproduced, it is recommended to use ``robocopy`` when copying from a
CD/DVD. For example, to prepare for a minimal installation of FreeBSD:

.. code:: screen

    C:\> md c:\freebsd
    C:\> robocopy e:\bin c:\freebsd\bin\ /s
    C:\> robocopy e:\manpages c:\freebsd\manpages\ /s

This example assumes that ``C:`` has enough free space and ``E:`` is
where the CD/DVD is mounted.

Alternatively, download the distribution from
`ftp.FreeBSD.org <ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/9.3-RELEASE/>`__.
Each distribution is in its own directory; for example, the *base*
distribution can be found in the
`9.3/base/ <ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/9.3-RELEASE/base/>`__
directory.

Copy the distributions to install from a Windows? partition to
``c:\freebsd``. Both the ``base`` and ``kernel`` distributions are
needed for the most minimal installation.

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

3.13.4.?Before Installing over a Network
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are three types of network installations available: Ethernet, PPP,
and PLIP.

For the fastest possible network installation, use an Ethernet adapter.
FreeBSD supports most common Ethernet cards. A list of supported cards
is provided in the Hardware Notes for each release of FreeBSD. If using
a supported PCMCIA Ethernet card, be sure that it is plugged in *before*
the system is powered on as FreeBSD does not support hot insertion of
PCMCIA cards during installation.

Make note of the system's IP address, subnet mask, hostname, default
gateway address, and DNS server addresses if these values are statically
assigned. If installing by FTP through a HTTP proxy, make note of the
proxy's address. If you do not know these values, ask the system
administrator or ISP *before* trying this type of installation.

If using a dialup modem, have the service provider's PPP information
handy as it is needed early in the installation process.

If PAP or CHAP are used to connect to the ISP without using a script,
type ``dial`` at the FreeBSD ppp prompt. Otherwise, know how to dial the
ISP using the “AT commands” specific to the modem, as the PPP dialer
provides only a simple terminal emulator. Refer to `Section?27.2,
“Configuring PPP” <userppp.html>`__ and
``../../../../doc/en_US.ISO8859-1/books/faq/ppp.html`` for further
information. Logging can be directed to the screen using
``set log local ...``.

If a hard-wired connection to another FreeBSD machine is available, the
installation can occur over a null-modem parallel port cable. The data
rate over the parallel port is higher than what is typically possible
over a serial line.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.13.4.1.?Before Installing via NFS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To perform an NFS installation, copy the needed FreeBSD distribution
files to an NFS server and then point the installer's NFS media
selection to it.

If the server supports only a “privileged port”, set the option
``NFS Secure`` in the Options menu so that the installation can proceed.

If using a poor quality Ethernet card which suffers from slow transfer
rates, toggle the ``NFS Slow`` flag to on.

In order for an NFS installation to work, the server must support subdir
mounts. For example, if the FreeBSD?10.1 distribution lives on:
``ziggy:/usr/archive/stuff/FreeBSD``, ``ziggy`` will have to allow the
direct mounting of ``/usr/archive/stuff/FreeBSD``, not just ``/usr`` or
``/usr/archive/stuff``.

In FreeBSD, this is controlled by using ``-alldirs`` in
``/etc/exports``. Other NFS servers may have different conventions. If
the server is displaying permission denied messages, it is likely that
this is not enabled properly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-----------------------------+
| `Prev <install-advanced.html>`__?    | `Up <install.html>`__   | ?\ `Next <basics.html>`__   |
+--------------------------------------+-------------------------+-----------------------------+
| 3.12.?Advanced Installation Guide?   | `Home <index.html>`__   | ?Chapter?4.?UNIX Basics     |
+--------------------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
