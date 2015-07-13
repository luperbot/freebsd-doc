=================================
8.?procfs: Gone But Not Forgotten
=================================

.. raw:: html

   <div class="navheader">

8.?procfs: Gone But Not Forgotten
`Prev <updates.html>`__?
?
?\ `Next <commands.html>`__

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

8.?procfs: Gone But Not Forgotten
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In some Linux? distributions, one could look at
``/proc/sys/net/ipv4/ip_forward`` to determine if IP forwarding is
enabled. In FreeBSD,
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
is instead used to view this and other system settings.

For example, use the following to determine if IP forwarding is enabled
on a FreeBSD system:

.. code:: screen

    % sysctl net.inet.ip.forwarding
    net.inet.ip.forwarding: 0

Use ``-a`` to list all the system settings:

.. code:: screen

    % sysctl -a | more

If an application requires procfs, add the following entry to
``/etc/fstab``:

.. code:: screen

    proc                /proc           procfs  rw,noauto       0       0

Including ``noauto`` will prevent ``/proc`` from being automatically
mounted at boot.

To mount the file system without rebooting:

.. code:: screen

    # mount /proc

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+-------------------------------+
| `Prev <updates.html>`__?   | ?                       | ?\ `Next <commands.html>`__   |
+----------------------------+-------------------------+-------------------------------+
| 7.?Updating FreeBSD?       | `Home <index.html>`__   | ?9.?Common Commands           |
+----------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
