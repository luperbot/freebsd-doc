===========
15.2.?Files
===========

.. raw:: html

   <div class="navheader">

15.2.?Files
`Prev <oss.html>`__?
Chapter?15.?Sound Subsystem
?\ `Next <pcm-probe-and-attach.html>`__

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

15.2.?Files
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All the relevant code lives in ``/usr/src/sys/dev/sound/``, except for
the public ioctl interface definitions, found in
``/usr/src/sys/sys/soundcard.h``

Under ``/usr/src/sys/dev/sound/``, the ``pcm/`` directory holds the
central code, while the ``pci/``, ``isa/`` and ``usb/`` directories have
the drivers for PCI and ISA boards, and for USB audio devices.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+-------------------------------------------+
| `Prev <oss.html>`__?           | `Up <oss.html>`__       | ?\ `Next <pcm-probe-and-attach.html>`__   |
+--------------------------------+-------------------------+-------------------------------------------+
| Chapter?15.?Sound Subsystem?   | `Home <index.html>`__   | ?15.3.?Probing, Attaching, etc.           |
+--------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
