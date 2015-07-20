===============================
17.10. The MAC partition Module
===============================

.. raw:: html

   <div class="navheader">

17.10. The MAC partition Module
`????? <mac-portacl.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-mls.html>`__

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

17.10. The MAC partition Module
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_partition.ko``

Kernel configuration line: ``options MAC_PARTITION``

Boot option: ``mac_partition_load="YES"``

The
`mac\_partition(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_partition&sektion=4>`__
policy will drop processes into specific ?partitions? based on their MAC
label. Think of it as a special type of
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__,
though that is hardly a worthy comparison.

This is one module that should be added to the
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
file so that it loads and enables the policy during the boot process.

Most configuration for this policy is done using the
`setpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setpmac&sektion=8>`__
utility which will be explained below. The following ``sysctl`` tunable
is available for this policy:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.partition.enabled`` will enable the enforcement of MAC
   process partitions.

.. raw:: html

   </div>

When this policy is enabled, users will only be permitted to see their
processes, and any others within their partition, but will not be
permitted to work with utilities outside the scope of this partition.
For instance, a user in the ``insecure`` class above will not be
permitted to access the ``top`` command as well as many other commands
that must spawn a process.

To set or drop utilities into a partition label, use the ``setpmac``
utility:

.. code:: screen

    # setpmac partition/13 top

This will add the ``top`` command to the label set on users in the
``insecure`` class. Note that all processes spawned by users in the
``insecure`` class will stay in the ``partition/13`` label.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.10.1. Examples
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following command will show you the partition label and the process
list:

.. code:: screen

    # ps Zax

This next command will allow the viewing of another user's process
partition label and that user's currently running processes:

.. code:: screen

    # ps -ZU trhodes

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Users can see processes in ``root``'s label unless the
`mac\_seeotheruids(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_seeotheruids&sektion=4>`__
policy is loaded.

.. raw:: html

   </div>

A really crafty implementation could have all of the services disabled
in ``/etc/rc.conf`` and started by a script that starts them with the
proper labeling set.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

The following policies support integer settings in place of the three
default labels offered. These options, including their limitations, are
further explained in the module manual pages.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+-----------------------------------------------+
| `????? <mac-portacl.html>`__?   | `???? <mac.html>`__     | ?\ `??????? <mac-mls.html>`__                 |
+---------------------------------+-------------------------+-----------------------------------------------+
| 17.9. The MAC portacl Module?   | `???? <index.html>`__   | ?17.11. The MAC Multi-Level Security Module   |
+---------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
