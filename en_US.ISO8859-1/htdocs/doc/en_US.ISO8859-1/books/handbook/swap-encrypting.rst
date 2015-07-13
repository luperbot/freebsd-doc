======================
18.13.?Encrypting Swap
======================

.. raw:: html

   <div class="navheader">

18.13.?Encrypting Swap
`Prev <disks-encrypting.html>`__?
Chapter?18.?Storage
?\ `Next <disks-hast.html>`__

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

18.13.?Encrypting Swap
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Christian Brueffer.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Like the encryption of disk partitions, encryption of swap space is used
to protect sensitive information. Consider an application that deals
with passwords. As long as these passwords stay in physical memory, they
are not written to disk and will be cleared after a reboot. However, if
FreeBSD starts swapping out memory pages to free space, the passwords
may be written to the disk unencrypted. Encrypting swap space can be a
solution for this scenario.

This section demonstrates how to configure an encrypted swap partition
using
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__ or
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
encryption. It assumes a UFS file system where ``/dev/ada0s1b`` is the
swap partition.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.13.1.?Configuring Encrypted Swap
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Swap partitions are not encrypted by default and should be cleared of
any sensitive data before continuing. To overwrite the current swap
partition with random garbage, execute the following command:

.. code:: screen

    # dd if=/dev/random of=/dev/ada0s1b bs=1m

To encrypt the swap partition using
`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__,
add the ``.bde`` suffix to the swap line in ``/etc/fstab``:

.. code:: programlisting

    # Device       Mountpoint  FStype  Options     Dump    Pass#
    /dev/ada0s1b.bde    none        swap    sw      0   0

To instead encrypt the swap partition using
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__,
use the ``.eli`` suffix:

.. code:: programlisting

    # Device       Mountpoint  FStype  Options     Dump    Pass#
    /dev/ada0s1b.eli    none        swap    sw      0   0

By default,
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
uses the AES algorithm with a key length of 256 bits. These defaults can
be altered in the options field in ``/etc/fstab``. The possible flags
are:

.. raw:: html

   <div class="variablelist">

aalgo
    Data integrity verification algorithm used to ensure that the
    encrypted data has not been tampered with. See
    `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
    for a list of supported algorithms.

ealgo
    Encryption algorithm used to protect the data. See
    `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
    for a list of supported algorithms.

keylen
    The length of the key used for the encryption algorithm. See
    `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
    for the key lengths that are supported by each encryption algorithm.

sectorsize
    The size of the blocks data is broken into before it is encrypted.
    Larger sector sizes increase performance at the cost of higher
    storage overhead. The recommended size is 4096 bytes.

.. raw:: html

   </div>

This example configures an encryped swap partition using the Blowfish
algorithm with a key length of 128 bits and a sectorsize of 4 kilobytes:

.. code:: programlisting

    # Device      Mountpoint  FStype  Options             Dump    Pass#
    /dev/ada0s1b.eli    none        swap    sw,ealgo=blowfish,keylen=128,sectorsize=4096    0   0

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

18.13.2.?Encrypted Swap Verification
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
    /dev/ada0s1b.bde   542720        0   542720     0%

If `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
is being used:

.. code:: screen

    % swapinfo
    Device          1K-blocks     Used    Avail Capacity
    /dev/ada0s1b.eli   542720        0   542720     0%

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-------------------------------------------+
| `Prev <disks-encrypting.html>`__?    | `Up <disks.html>`__     | ?\ `Next <disks-hast.html>`__             |
+--------------------------------------+-------------------------+-------------------------------------------+
| 18.12.?Encrypting Disk Partitions?   | `Home <index.html>`__   | ?18.14.?Highly Available Storage (HAST)   |
+--------------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
