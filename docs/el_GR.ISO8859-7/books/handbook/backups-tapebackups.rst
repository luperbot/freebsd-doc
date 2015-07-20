===================================
19.8. Creating and Using Data Tapes
===================================

.. raw:: html

   <div class="navheader">

19.8. Creating and Using Data Tapes
`????? <floppies.html>`__?
???????? 19. ???????????? ????
?\ `??????? <backup-strategies.html>`__

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

19.8. Creating and Using Data Tapes
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tape technology has continued to evolve but is less likely to be used in
a modern system. Modern backup systems tend to use off site combined
with local removable disk drive technologies. Still, FreeBSD will
support any tape drive that uses SCSI, such as LTO and older devices
such as DAT. There is limited support for SATA and USB tape drives.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.8.1. Serial Access with `sa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=4>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD uses the
`sa(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=4>`__
driver, providing ``/dev/sa0``, ``/dev/nsa0``, and ``/dev/esa0``. In
normal use, only ``/dev/sa0`` is needed. ``/dev/nsa0`` is the same
physical drive as ``/dev/sa0`` but does not rewind the tape after
writing a file. This allows writing more than one file to a tape. Using
``/dev/esa0`` ejects the tape after the device is closed, if applicable.

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

19.8.2. Controlling the Tape Drive with `mt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mt&sektion=1>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`mt(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mt&sektion=1>`__ is the
FreeBSD utility for controlling other operations of the tape drive, such
as seeking through files on a tape or writing tape control marks to the
tape.

For example, the first three files on a tape can be preserved by
skipping past them before writing a new file:

.. code:: screen

    # mt -f /dev/nsa0 fsf 3

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

19.8.3. Using `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ to Read and Write Tape Backups
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An example of writing a single file to tape using
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__:

.. code:: screen

    # tar cvf /dev/sa0 file

Recovering files from a
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
archive on tape into the current directory:

.. code:: screen

    # tar xvf /dev/sa0

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

19.8.4. Using `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__ and `restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__ to Create and Restore Backups
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A simple backup of ``/usr`` with
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__:

.. code:: screen

    # dump -0aL -b64 -f /dev/nsa0 /usr

Interactively restoring files from a
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
file on tape into the current directory:

.. code:: screen

    # restore -i -f /dev/nsa0

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

19.8.5. Other Tape Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Higher-level programs are available to simplify tape backup. The most
popular are Amanda and Bacula. These programs aim to make backups easier
and more convenient, or to automate complex backups of multiple
machines. The Ports Collection contains both these and other tape
utility applications.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+-------------------------------------------+
| `????? <floppies.html>`__?               | `???? <disks.html>`__   | ?\ `??????? <backup-strategies.html>`__   |
+------------------------------------------+-------------------------+-------------------------------------------+
| 19.7. Creating and Using Floppy Disks?   | `???? <index.html>`__   | ?19.9. Backup Strategies                  |
+------------------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
