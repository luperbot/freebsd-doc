=======================
Introduction to NanoBSD
=======================

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

Daniel Gerzo
~~~~~~~~~~~~

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

Copyright ? 2006 The FreeBSD Documentation Project

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

This document provides information about the NanoBSD tools, which can be
used to create FreeBSD system images for embedded applications, suitable
for use on a Compact Flash card (or other mass storage medium).

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

`1. Introduction to NanoBSD <#intro>`__
`2. NanoBSD Howto <#howto>`__
`Index <#idp62098768>`__

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

1.?Introduction to NanoBSD
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NanoBSD is a tool currently developed by Poul-Henning Kamp
``<phk@FreeBSD.org>``. It creates a FreeBSD system image for embedded
applications, suitable for use on a Compact Flash card (or other mass
storage medium).

It can be used to build specialized install images, designed for easy
installation and maintenance of systems commonly called “computer
appliances”. Computer appliances have their hardware and software
bundled in the product, which means all applications are pre-installed.
The appliance is plugged into an existing network and can begin working
(almost) immediately.

The features of NanoBSD include:

.. raw:: html

   <div class="itemizedlist">

-  Ports and packages work as in FreeBSD — Every single application can
   be installed and used in a NanoBSD image, the same way as in FreeBSD.

-  No missing functionality — If it is possible to do something with
   FreeBSD, it is possible to do the same thing with NanoBSD, unless the
   specific feature or features were explicitly removed from the NanoBSD
   image when it was created.

-  Everything is read-only at run-time — It is safe to pull the
   power-plug. There is no necessity to run
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   after a non-graceful shutdown of the system.

-  Easy to build and customize — Making use of just one shell script and
   one configuration file it is possible to build reduced and customized
   images satisfying any arbitrary set of requirements.

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

2.?NanoBSD Howto
----------------

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

2.1.?The Design of NanoBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the image is present on the medium, it is possible to boot NanoBSD.
The mass storage medium is divided into three parts by default:

.. raw:: html

   <div class="itemizedlist">

-  Two image partitions: ``code#1`` and ``code#2``.

-  The configuration file partition, which can be mounted under the
   ``/cfg`` directory at run time.

.. raw:: html

   </div>

These partitions are normally mounted read-only.

The ``/etc`` and ``/var`` directories are
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
(malloc) disks.

The configuration file partition persists under the ``/cfg`` directory.
It contains files for ``/etc`` directory and is briefly mounted
read-only right after the system boot, therefore it is required to copy
modified files from ``/etc`` back to the ``/cfg`` directory if changes
are expected to persist after the system restarts.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?1.?Making Persistent Changes to ``/etc/resolv.conf``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # vi /etc/resolv.conf
    [...]
    # mount /cfg
    # cp /etc/resolv.conf /cfg
    # umount /cfg

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The partition containing ``/cfg`` should be mounted only at boot time
and while overriding the configuration files.

Keeping ``/cfg`` mounted at all times is not a good idea, especially if
the NanoBSD system runs off a mass storage medium that may be adversely
affected by a large number of writes to the partition (like when the
filesystem syncer flushes data to the system disks).

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

2.2.?Building a NanoBSD Image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A NanoBSD image is built using a simple ``nanobsd.sh`` shell script,
which can be found in the ``/usr``/src/tools/tools/nanobsd directory.
This script creates an image, which can be copied on the storage medium
using the
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
utility.

The necessary commands to build a NanoBSD image are:

.. code:: screen

    # cd /usr/src/tools/tools/nanobsd 
    # sh nanobsd.sh 
    # cd /usr/obj/nanobsd.full 
    # dd if=_.disk.full of=/dev/da0 bs=64k 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#nbsd-cd>`__                   | Change the current directory to the  |
|                                      | base directory of the NanoBSD build  |
|                                      | script.                              |
+--------------------------------------+--------------------------------------+
| `|2| <#nbsd-sh>`__                   | Start the build process.             |
+--------------------------------------+--------------------------------------+
| `|3| <#nbsd-cd2>`__                  | Change the current directory to the  |
|                                      | place where the built images are     |
|                                      | located.                             |
+--------------------------------------+--------------------------------------+
| `|4| <#nbsd-dd>`__                   | Install NanoBSD onto the storage     |
|                                      | medium.                              |
+--------------------------------------+--------------------------------------+

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

2.3.?Customizing a NanoBSD Image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is probably the most important and most interesting feature of
NanoBSD. This is also where you will be spending most of the time when
developing with NanoBSD.

Invocation of the following command will force the ``nanobsd.sh`` to
read its configuration from ``myconf.nano`` located in the current
directory:

.. code:: screen

    # sh nanobsd.sh -c myconf.nano

Customization is done in two ways:

.. raw:: html

   <div class="itemizedlist">

-  Configuration options

-  Custom functions

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

2.3.1.?Configuration Options
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With configuration settings, it is possible to configure options passed
to both the ``buildworld`` and ``installworld`` stages of the NanoBSD
build process, as well as internal options passed to the main build
process of NanoBSD. Through these options it is possible to cut the
system down, so it will fit on as little as 64MB. You can use the
configuration options to trim down FreeBSD even more, until it will
consists of just the kernel and two or three files in the userland.

The configuration file consists of configuration options, which override
the default values. The most important directives are:

.. raw:: html

   <div class="itemizedlist">

-  ``NANO_NAME`` — Name of build (used to construct the workdir names).

-  ``NANO_SRC`` — Path to the source tree used to build the image.

-  ``NANO_KERNEL`` — Name of kernel configuration file used to build
   kernel.

-  ``CONF_BUILD`` — Options passed to the ``buildworld`` stage of the
   build.

-  ``CONF_INSTALL`` — Options passed to the ``installworld`` stage of
   the build.

-  ``CONF_WORLD`` — Options passed to both the ``buildworld`` and the
   ``installworld`` stage of the build.

-  ``FlashDevice`` — Defines what type of media to use. Check
   ``FlashDevice.sub`` for more details.

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

2.3.2.?Custom Functions
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is possible to fine-tune NanoBSD using shell functions in the
configuration file. The following example illustrates the basic model of
custom functions:

.. code:: programlisting

    cust_foo () (
        echo "bar=baz" > \
            ${NANO_WORLDDIR}/etc/foo
    )
    customize_cmd cust_foo

A more useful example of a customization function is the following,
which changes the default size of the ``/etc`` directory from 5MB to
30MB:

.. code:: programlisting

    cust_etc_size () (
        cd ${NANO_WORLDDIR}/conf
        echo 30000 > default/etc/md_size
    )
    customize_cmd cust_etc_size

There are a few default pre-defined customization functions ready for
use:

.. raw:: html

   <div class="itemizedlist">

-  ``cust_comconsole`` — Disables
   `getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
   on the VGA devices (the ``/dev/ttyv*`` device nodes) and enables the
   use of the COM1 serial port as the system console.

-  ``cust_allow_ssh_root`` — Allow ``root`` to login via
   `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__.

-  ``cust_install_files`` — Installs files from the ``nanobsd/Files``
   directory, which contains some useful scripts for system
   administration.

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

2.3.3.?Adding Packages
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Packages can be added to a NanoBSD image using a custom function. The
following function will install all the packages located in
``/usr/src/tools/tools/nanobsd/packages``:

.. code:: programlisting

    install_packages () (
    mkdir -p ${NANO_WORLDDIR}/packages
    cp /usr/src/tools/tools/nanobsd/packages/* ${NANO_WORLDDIR}/packages
    chroot ${NANO_WORLDDIR} sh -c 'cd packages; pkg_add -v *;cd ..;'
    rm -rf ${NANO_WORLDDIR}/packages
    )
    customize_cmd install_packages

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

2.3.4.?Configuration File Example
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A complete example of a configuration file for building a custom NanoBSD
image can be:

.. code:: programlisting

    NANO_NAME=custom
    NANO_SRC=/usr/src
    NANO_KERNEL=MYKERNEL
    NANO_IMAGES=2

    CONF_BUILD='
    WITHOUT_KLDLOAD=YES
    WITHOUT_NETGRAPH=YES
    WITHOUT_PAM=YES
    '

    CONF_INSTALL='
    WITHOUT_ACPI=YES
    WITHOUT_BLUETOOTH=YES
    WITHOUT_FORTRAN=YES
    WITHOUT_HTML=YES
    WITHOUT_LPR=YES
    WITHOUT_MAN=YES
    WITHOUT_SENDMAIL=YES
    WITHOUT_SHAREDOCS=YES
    WITHOUT_EXAMPLES=YES
    WITHOUT_INSTALLLIB=YES
    WITHOUT_CALENDAR=YES
    WITHOUT_MISC=YES
    WITHOUT_SHARE=YES
    '

    CONF_WORLD='
    WITHOUT_BIND=YES
    WITHOUT_MODULES=YES
    WITHOUT_KERBEROS=YES
    WITHOUT_GAMES=YES
    WITHOUT_RESCUE=YES
    WITHOUT_LOCALES=YES
    WITHOUT_SYSCONS=YES
    WITHOUT_INFO=YES
    '

    FlashDevice SanDisk 1G

    cust_nobeastie() (
        touch ${NANO_WORLDDIR}/boot/loader.conf
        echo "beastie_disable=\"YES\"" >> ${NANO_WORLDDIR}/boot/loader.conf
    )

    customize_cmd cust_comconsole
    customize_cmd cust_install_files
    customize_cmd cust_allow_ssh_root
    customize_cmd cust_nobeastie

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

2.4.?Updating NanoBSD
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The update process of NanoBSD is relatively simple:

.. raw:: html

   <div class="procedure">

#. Build a new NanoBSD image, as usual.

#. Upload the new image into an unused partition of a running NanoBSD
   appliance.

   The most important difference of this step from the initial NanoBSD
   installation is that now instead of using ``_.disk.full`` (which
   contains an image of the entire disk), the ``_.disk.image`` image is
   installed (which contains an image of a single system partition).

#. Reboot, and start the system from the newly installed partition.

#. If all goes well, the upgrade is finished.

#. If anything goes wrong, reboot back into the previous partition
   (which contains the old, working image), to restore system
   functionality as fast as possible. Fix any problems of the new build,
   and repeat the process.

.. raw:: html

   </div>

To install new image onto the running NanoBSD system, it is possible to
use either the ``updatep1`` or ``updatep2`` script located in the
``/root`` directory, depending from which partition is running the
current system.

According to which services are available on host serving new NanoBSD
image and what type of transfer is preferred, it is possible to examine
one of these three ways:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.1.?Using `ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the transfer speed is in first place, use this example:

.. code:: screen

    # ftp myhost
    get _.disk.image "| sh updatep1"

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

2.4.2.?Using `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If a secure transfer is preferred, consider using this example:

.. code:: screen

    # ssh myhost cat _.disk.image.gz | zcat | sh updatep1

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

2.4.3.?Using `nc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nc&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Try this example if the remote host is not running neither
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8>`__ or
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
service:

.. raw:: html

   <div class="procedure">

#. At first, open a TCP listener on host serving the image and make it
   send the image to client:

   .. code:: screen

       myhost# nc -l 2222 < _.disk.image

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Make sure that the used port is not blocked to receive incoming
   connections from NanoBSD host by firewall.

   .. raw:: html

      </div>

#. Connect to the host serving new image and execute ``updatep1``
   script:

   .. code:: screen

       # nc myhost 2222 | sh updatep1

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

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

N
~

NanoBSD, `Introduction to NanoBSD <#intro>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
