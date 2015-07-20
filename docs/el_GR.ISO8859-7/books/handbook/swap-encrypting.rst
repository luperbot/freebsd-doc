============================
19.15. Encrypting Swap Space
============================

.. raw:: html

   <div class="navheader">

19.15. Encrypting Swap Space
`????? <disks-encrypting.html>`__?
???????? 19. ???????????? ????
?\ `??????? <disks-hast.html>`__

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

19.15. Encrypting Swap Space
----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Christian Br"uffer.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Like the encryption of disk partitions, encryption of swap space is used
to protect sensitive information. Consider an application that deals
with passwords. As long as these passwords stay in physical memory,
these passwords will not be written to disk and be cleared after a
reboot. If FreeBSD starts swapping out memory pages to free space for
other applications, the passwords may be written to the disk platters
unencrypted. Encrypting swap space can be a solution for this scenario.

The
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__ or
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
encryption systems may be used for swap encryption. Both systems use the
``encswap`` `rc.d <configtuning-rcd.html>`__ script.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

For the remainder of this section, ``ad0s1b`` will be the swap
partition.

.. raw:: html

   </div>

Swap partitions are not encrypted by default and should be cleared of
any sensitive data before continuing. To overwrite the current swap
parition with random garbage, execute the following command:

.. code:: screen

    # dd if=/dev/random of=/dev/ad0s1b bs=1m

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.15.1. Swap Encryption with `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``.bde`` suffix should be added to the device in the respective
``/etc/fstab`` swap line:

.. code:: programlisting

    # Device       Mountpoint  FStype  Options     Dump    Pass#
    /dev/ad0s1b.bde     none        swap    sw      0   0

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

19.15.2. Swap Encryption with `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The procedure for instead using
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
for swap encryption is similar to that of using
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__.
The ``.eli`` suffix should be added to the device in the respective
``/etc/fstab`` swap line:

.. code:: programlisting

    # Device       Mountpoint  FStype  Options     Dump    Pass#
    /dev/ad0s1b.eli     none        swap    sw      0   0

`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
uses the AES algorithm with a key length of 128 bit by default. These
defaults can be altered by using ``geli_swap_flags`` in
``/etc/rc.conf``. The following line tells the ``encswap`` rc.d script
to create
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
swap partitions using the Blowfish algorithm with a key length of 128
bits and a sectorsize of 4 kilobytes, and sets ?detach on last close?:

.. code:: programlisting

    geli_swap_flags="-e blowfish -l 128 -s 4096 -d"

Refer to the description of ``onetime`` in
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
for a list of possible options.

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

19.15.3. Encrypted Swap Verification
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once the system has rebooted, proper operation of the encrypted swap can
be verified using ``swapinfo``.

If `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
is being used:

.. code:: screen

    % swapinfo
    Device          1K-blocks     Used    Avail Capacity
    /dev/ad0s1b.bde    542720        0   542720     0%

If `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
is being used:

.. code:: screen

    % swapinfo
    Device          1K-blocks     Used    Avail Capacity
    /dev/ad0s1b.eli    542720        0   542720     0%

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-------------------------------------------+
| `????? <disks-encrypting.html>`__?   | `???? <disks.html>`__   | ?\ `??????? <disks-hast.html>`__          |
+--------------------------------------+-------------------------+-------------------------------------------+
| 19.14. Encrypting Disk Partitions?   | `???? <index.html>`__   | ?19.16. Highly Available Storage (HAST)   |
+--------------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
