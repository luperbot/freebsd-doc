=========================
12.11. Tuning with sysctl
=========================

.. raw:: html

   <div class="navheader">

12.11. Tuning with sysctl
`????? <configtuning-configfiles.html>`__?
???????? 12. ??????? ??? ??????????????
?\ `??????? <configtuning-disk.html>`__

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

12.11. Tuning with sysctl
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
is an interface that allows you to make changes to a running FreeBSD
system. This includes many advanced options of the TCP/IP stack and
virtual memory system that can dramatically improve performance for an
experienced system administrator. Over five hundred system variables can
be read and set using
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

At its core,
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
serves two functions: to read and to modify system settings.

To view all readable variables:

.. code:: screen

    % sysctl -a

To read a particular variable, for example, ``kern.maxproc``:

.. code:: screen

    % sysctl kern.maxproc
    kern.maxproc: 1044

To set a particular variable, use the intuitive
*``variable``*\ =\ *``value``* syntax:

.. code:: screen

    # sysctl kern.maxfiles=5000
    kern.maxfiles: 2088 -> 5000

Settings of sysctl variables are usually either strings, numbers, or
booleans (a boolean being ``1`` for yes or a ``0`` for no).

If you want to set automatically some variables each time the machine
boots, add them to the ``/etc/sysctl.conf`` file. For more information
see the
`sysctl.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl.conf&sektion=5>`__
manual page and the `??????12.10.4,
?\ ``sysctl.conf``? <configtuning-configfiles.html#configtuning-sysctlconf>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.11.1. `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__ Read-only
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
values. While this is sometimes unavoidable, it can only be done on
(re)boot.

For instance on some laptop models the
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4>`__
device will not probe memory ranges, and fail with errors which look
similar to:

.. code:: screen

    cbb0: Could not map register memory
    device_probe_and_attach: cbb0 attach returned 12

Cases like the one above usually require the modification of some
default
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
settings which are set read only. To overcome these situations a user
can put
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
?OIDs? in their local ``/boot/loader.conf``. Default settings are
located in the ``/boot/defaults/loader.conf`` file.

Fixing the problem mentioned above would require a user to set
``hw.pci.allow_unsupported_io_range=1`` in the aforementioned file. Now
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4>`__
will work properly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+---------------------------------+-------------------------------------------+
| `????? <configtuning-configfiles.html>`__?   | `???? <config-tuning.html>`__   | ?\ `??????? <configtuning-disk.html>`__   |
+----------------------------------------------+---------------------------------+-------------------------------------------+
| 12.10. ?????? ??????????                     | `???? <index.html>`__           | ?12.12. Tuning Disks                      |
+----------------------------------------------+---------------------------------+-------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
