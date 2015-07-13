=======================
13.5.?Shutdown Sequence
=======================

.. raw:: html

   <div class="navheader">

13.5.?Shutdown Sequence
`Prev <device-hints.html>`__?
Chapter?13.?The FreeBSD Booting Process
?\ `Next <security.html>`__

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

13.5.?Shutdown Sequence
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Upon controlled shutdown using
`shutdown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=shutdown&sektion=8>`__,
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
will attempt to run the script ``/etc/rc.shutdown``, and then proceed to
send all processes the ``TERM`` signal, and subsequently the ``KILL``
signal to any that do not terminate in a timely manner.

To power down a FreeBSD machine on architectures and systems that
support power management, use ``shutdown -p now`` to turn the power off
immediately. To reboot a FreeBSD system, use ``shutdown -r now``. One
must be ``root`` or a member of ``operator`` in order to run
`shutdown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=shutdown&sektion=8>`__.
One can also use
`halt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=halt&sektion=8>`__
and
`reboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=reboot&sektion=8>`__.
Refer to their manual pages and to
`shutdown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=shutdown&sektion=8>`__
for more information.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Power management requires
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__ to
be loaded as a module or statically compiled into a custom kernel.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+-------------------------------+
| `Prev <device-hints.html>`__?   | `Up <boot.html>`__      | ?\ `Next <security.html>`__   |
+---------------------------------+-------------------------+-------------------------------+
| 13.4.?Device Hints?             | `Home <index.html>`__   | ?Chapter?14.?Security         |
+---------------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
