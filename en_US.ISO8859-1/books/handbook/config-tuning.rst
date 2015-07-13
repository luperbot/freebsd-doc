====================================
Chapter?12.?Configuration and Tuning
====================================

.. raw:: html

   <div class="navheader">

Chapter?12.?Configuration and Tuning
`Prev <system-administration.html>`__?
Part?III.?System Administration
?\ `Next <configtuning-starting-services.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?12.?Configuration and Tuning
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   <div>

Based on a tutorial written by Mike Smith.

.. raw:: html

   </div>

.. raw:: html

   <div>

Also based on tuning(7) written by Matt Dillon.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

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

12.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One of the important aspects of FreeBSD is proper system configuration.
This chapter explains much of the FreeBSD configuration process,
including some of the parameters which can be set to tune a FreeBSD
system.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  The basics of ``rc.conf`` configuration and ``/usr/local/etc/rc.d``
   startup scripts.

-  How to configure and test a network card.

-  How to configure virtual hosts on network devices.

-  How to use the various configuration files in ``/etc``.

-  How to tune FreeBSD using
   `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
   variables.

-  How to tune disk performance and modify kernel limitations.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand UNIX? and FreeBSD basics (`Chapter?4, *UNIX
   Basics* <basics.html>`__).

-  Be familiar with the basics of kernel configuration and compilation
   (`Chapter?9, *Configuring the FreeBSD
   Kernel* <kernelconfig.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------------+-----------------------------------------------------+
| `Prev <system-administration.html>`__?   | `Up <system-administration.html>`__   | ?\ `Next <configtuning-starting-services.html>`__   |
+------------------------------------------+---------------------------------------+-----------------------------------------------------+
| Part?III.?System Administration?         | `Home <index.html>`__                 | ?12.2.?Starting Services                            |
+------------------------------------------+---------------------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
