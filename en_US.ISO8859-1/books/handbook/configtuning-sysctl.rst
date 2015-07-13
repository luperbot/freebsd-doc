===========================
12.9.?Tuning with sysctl(8)
===========================

.. raw:: html

   <div class="navheader">

12.9.?Tuning with sysctl(8)
`Prev <configtuning-configfiles.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <configtuning-disk.html>`__

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

12.9.?Tuning with `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
-------------------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
is used to make changes to a running FreeBSD system. This includes many
advanced options of the TCP/IP stack and virtual memory system that can
dramatically improve performance for an experienced system
administrator. Over five hundred system variables can be read and set
using
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

At its core,
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
serves two functions: to read and to modify system settings.

To view all readable variables:

.. code:: screen

    % sysctl -a

To read a particular variable, specify its name:

.. code:: screen

    % sysctl kern.maxproc
    kern.maxproc: 1044

To set a particular variable, use the *``variable``*\ =\ *``value``*
syntax:

.. code:: screen

    # sysctl kern.maxfiles=5000
    kern.maxfiles: 2088 -> 5000

Settings of sysctl variables are usually either strings, numbers, or
booleans, where a boolean is ``1`` for yes or ``0`` for no.

To automatically set some variables each time the machine boots, add
them to ``/etc/sysctl.conf``. For more information, refer to
`sysctl.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl.conf&sektion=5>`__
and `Section?12.9.1,
“\ ``sysctl.conf``\ ” <configtuning-sysctl.html#configtuning-sysctlconf>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.9.1.?\ ``sysctl.conf``
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The configuration file for
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__,
``/etc/sysctl.conf``, looks much like ``/etc/rc.conf``. Values are set
in a ``variable=value`` form. The specified values are set after the
system goes into multi-user mode. Not all variables are settable in this
mode.

For example, to turn off logging of fatal signal exits and prevent users
from seeing processes started by other users, the following tunables can
be set in ``/etc/sysctl.conf``:

.. code:: programlisting

    # Do not log fatal signal exits (e.g., sig 11)
    kern.logsigexit=0

    # Prevent users from seeing information about processes that
    # are being run under another UID.
    security.bsd.see_other_uids=0

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

12.9.2.?\ `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__ Read-only
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In some cases it may be desirable to modify read-only
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
values, which will require a reboot of the system.

For instance, on some laptop models the
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4>`__
device will not probe memory ranges and will fail with errors similar
to:

.. code:: screen

    cbb0: Could not map register memory
    device_probe_and_attach: cbb0 attach returned 12

The fix requires the modification of a read-only
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
setting. Add ``hw.pci.allow_unsupported_io_range=1`` to
``/boot/loader.conf`` and reboot. Now
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4>`__
should work properly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------------+----------------------------------------+
| `Prev <configtuning-configfiles.html>`__?   | `Up <config-tuning.html>`__   | ?\ `Next <configtuning-disk.html>`__   |
+---------------------------------------------+-------------------------------+----------------------------------------+
| 12.8.?Configuration Files?                  | `Home <index.html>`__         | ?12.10.?Tuning Disks                   |
+---------------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
