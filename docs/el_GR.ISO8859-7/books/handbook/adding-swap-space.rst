========================
12.14. Adding Swap Space
========================

.. raw:: html

   <div class="navheader">

12.14. Adding Swap Space
`????? <configtuning-kernel-limits.html>`__?
???????? 12. ??????? ??? ??????????????
?\ `??????? <acpi-overview.html>`__

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

12.14. Adding Swap Space
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

No matter how well you plan, sometimes a system does not run as you
expect. If you find you need more swap space, it is simple enough to
add. You have three ways to increase swap space: adding a new hard
drive, enabling swap over NFS, and creating a swap file on an existing
partition.

For information on how to encrypt swap space, what options for this task
exist and why it should be done, please refer to `??????19.15,
?Encrypting Swap Space? <swap-encrypting.html>`__ of the Handbook.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.14.1. Swap on a New Hard Drive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The best way to add swap, of course, is to use this as an excuse to add
another hard drive. You can always use another hard drive, after all. If
you can do this, go reread the discussion of swap space in `??????12.2,
??????? ???????? <configtuning-initial.html>`__ of the Handbook for some
suggestions on how to best arrange your swap.

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

12.14.2. Swapping over NFS
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Swapping over NFS is only recommended if you do not have a local hard
disk to swap to; NFS swapping will be limited by the available network
bandwidth and puts an additional burden on the NFS server.

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

12.14.3. Swapfiles
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

You can create a file of a specified size to use as a swap file. In our
example here we will use a 64MB file called ``/usr/swap0``. You can use
any name you want, of course.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

?????????? 12.1. Creating a Swapfile on FreeBSD

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. raw:: html

   <div class="orderedlist">

#. Be certain that your kernel configuration includes the memory disk
   driver
   (`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__).
   It is default in ``GENERIC`` kernel.

   .. code:: programlisting

       device   md   # Memory "disks"

#. Create a swapfile (``/usr/swap0``):

   .. code:: screen

       # dd if=/dev/zero of=/usr/swap0 bs=1024k count=64

#. Set proper permissions on (``/usr/swap0``):

   .. code:: screen

       # chmod 0600 /usr/swap0

#. Enable the swap file in ``/etc/rc.conf``:

   .. code:: programlisting

       swapfile="/usr/swap0"   # Set to name of swapfile if aux swapfile desired.

#. Reboot the machine or to enable the swap file immediately, type:

   .. code:: screen

       # mdconfig -a -t vnode -f /usr/swap0 -u 0 && swapon /dev/md0

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+---------------------------------+-----------------------------------------+
| `????? <configtuning-kernel-limits.html>`__?   | `???? <config-tuning.html>`__   | ?\ `??????? <acpi-overview.html>`__     |
+------------------------------------------------+---------------------------------+-----------------------------------------+
| 12.13. Tuning Kernel Limits?                   | `???? <index.html>`__           | ?12.15. Power and Resource Management   |
+------------------------------------------------+---------------------------------+-----------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
