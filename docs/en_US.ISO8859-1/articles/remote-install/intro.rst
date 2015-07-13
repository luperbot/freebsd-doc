===============
2.?Introduction
===============

.. raw:: html

   <div class="navheader">

2.?Introduction
`Prev <index.html>`__?
?
?\ `Next <preparation.html>`__

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

2.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section will summarize the purpose of this article and better
explain what is covered herein. The instructions included in this
article will benefit those using services provided by colocation
facilities not supporting FreeBSD.

.. raw:: html

   <div class="procedure">

#. As we have mentioned in the `Background <index.html#background>`__
   section, many of the reputable server hosting companies provide some
   kind of rescue system, which is booted from their LAN and accessible
   over SSH. They usually provide this support in order to help their
   customers fix broken operating systems. As this article will explain,
   it is possible to install FreeBSD with the help of these rescue
   systems.

#. The next section of this article will describe how to configure, and
   build minimalistic FreeBSD on the local machine. That version will
   eventually be running on the remote machine from a ramdisk, which
   will allow us to install a complete FreeBSD operating system from an
   FTP mirror using the sysinstall utility.

#. The rest of this article will describe the installation procedure
   itself, as well as the configuration of the ZFS file system.

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

2.1.?Requirements
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To continue successfully, you must:

.. raw:: html

   <div class="itemizedlist">

-  Have a network accessible operating system with SSH access

-  Understand the FreeBSD installation process

-  Be familiar with the
   `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
   utility

-  Have the FreeBSD installation ISO image or CD handy

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------------------------+-------------------------+----------------------------------+
| `Prev <index.html>`__?                                                          | ?                       | ?\ `Next <preparation.html>`__   |
+---------------------------------------------------------------------------------+-------------------------+----------------------------------+
| Remote Installation of the FreeBSD Operating System Without a Remote Console?   | `Home <index.html>`__   | ?3.?Preparation - mfsBSD         |
+---------------------------------------------------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
