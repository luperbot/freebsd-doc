==================
9.?Common Commands
==================

.. raw:: html

   <div class="navheader">

9.?Common Commands
`Prev <procfs.html>`__?
?
?\ `Next <conclusion.html>`__

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

9.?Common Commands
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some common command equivalents are as follows:

.. raw:: html

   <div class="informaltable">

+---------------------------------------------------------+-------------------------------+------------------------------------------+
| Linux? command (Red?Hat/Debian)                         | FreeBSD equivalent            | Purpose                                  |
+=========================================================+===============================+==========================================+
| ``yum install package`` / ``apt-get install package``   | ``pkg install package``       | Install package from remote repository   |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``rpm -ivh package`` / ``dpkg -i package``              | ``pkg add package``           | Install local package                    |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``rpm -qa`` / ``dpkg -l``                               | ``pkg info``                  | List installed packages                  |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``lspci``                                               | ``pciconf``                   | List PCI devices                         |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``lsmod``                                               | ``kldstat``                   | List loaded kernel modules               |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``modprobe``                                            | ``kldload`` / ``kldunload``   | Load/Unload kernel modules               |
+---------------------------------------------------------+-------------------------------+------------------------------------------+
| ``strace``                                              | ``truss``                     | Trace system calls                       |
+---------------------------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+---------------------------------+
| `Prev <procfs.html>`__?              | ?                       | ?\ `Next <conclusion.html>`__   |
+--------------------------------------+-------------------------+---------------------------------+
| 8.?procfs: Gone But Not Forgotten?   | `Home <index.html>`__   | ?10.?Conclusion                 |
+--------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
