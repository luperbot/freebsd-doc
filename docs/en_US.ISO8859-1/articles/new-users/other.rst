========
9.?Other
========

.. raw:: html

   <div class="navheader">

9.?Other
`Prev <your-working-environment.html>`__?
?
?\ `Next <comments-welcome.html>`__

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

9.?Other
--------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As ``root``, you can unmount the CDROM with ``/sbin/umount /cdrom``,
take it out of the drive, insert another one, and mount it with
``/sbin/mount_cd9660 /dev/cd0a /cdrom`` assuming cd0a is the device name
for your CDROM drive. The most recent versions of FreeBSD let you mount
the CDROM with just ``/sbin/mount /cdrom``.

Using the live filesystem—the second of FreeBSD's CDROM disks—is useful
if you have got limited space. What is on the live filesystem varies
from release to release. You might try playing games from the CDROM.
This involves using ``lndir``, which gets installed with the X Window
System, to tell the program(s) where to find the necessary files,
because they are in the ``/cdrom`` file system instead of in ``/usr``
and its subdirectories, which is where they are expected to be. Read
``man lndir``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------+---------------------------------------+
| `Prev <your-working-environment.html>`__?   | ?                       | ?\ `Next <comments-welcome.html>`__   |
+---------------------------------------------+-------------------------+---------------------------------------+
| 8.?Your Working Environment?                | `Home <index.html>`__   | ?10.?Comments Welcome                 |
+---------------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
