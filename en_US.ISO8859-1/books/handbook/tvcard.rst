=============
8.5.?TV Cards
=============

.. raw:: html

   <div class="navheader">

8.5.?TV Cards
`Prev <video-playback.html>`__?
Chapter?8.?Multimedia
?\ `Next <mythtv.html>`__

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

8.5.?TV Cards
-------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Original contribution by Josef El-Rayes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Enhanced and adapted by Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

TV cards can be used to watch broadcast or cable TV on a computer. Most
cards accept composite video via an RCA or S-video input and some cards
include a FM radio tuner.

FreeBSD provides support for PCI-based TV cards using a Brooktree
Bt848/849/878/879 video capture chip with the
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__
driver. This driver supports most Pinnacle PCTV video cards. Before
purchasing a TV card, consult
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__
for a list of supported tuners.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.5.1.?Loading the Driver
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to use the card, the
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__
driver must be loaded. To automate this at boot time, add the following
line to ``/boot/loader.conf``:

.. code:: programlisting

    bktr_load="YES"

Alternatively, one can statically compile support for the TV card into a
custom kernel. In that case, add the following lines to the custom
kernel configuration file:

.. code:: programlisting

    device  bktr
    device  iicbus
    device  iicbb
    device  smbus

These additional devices are necessary as the card components are
interconnected via an I2C bus. Then, build and install a new kernel.

To test that the tuner is correctly detected, reboot the system. The TV
card should appear in the boot messages, as seen in this example:

.. code:: programlisting

    bktr0: <BrookTree 848A> mem 0xd7000000-0xd7000fff irq 10 at device 10.0 on pci0
    iicbb0: <I2C bit-banging driver> on bti2c0
    iicbus0: <Philips I2C bus> on iicbb0 master-only
    iicbus1: <Philips I2C bus> on iicbb0 master-only
    smbus0: <System Management Bus> on bti2c0
    bktr0: Pinnacle/Miro TV, Philips SECAM tuner.

The messages will differ according to the hardware. If necessary, it is
possible to override some of the detected parameters using
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
or custom kernel configuration options. For example, to force the tuner
to a Philips SECAM tuner, add the following line to a custom kernel
configuration file:

.. code:: programlisting

    options OVERRIDE_TUNER=6

or, use
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__:

.. code:: screen

    # sysctl hw.bt848.tuner=6

Refer to
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__
for a description of the available
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
parameters and kernel options.

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

8.5.2.?Useful Applications
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To use the TV card, install one of the following applications:

.. raw:: html

   <div class="itemizedlist">

-  `multimedia/fxtv <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/fxtv/pkg-descr>`__
   provides TV-in-a-window and image/audio/video capture capabilities.

-  `multimedia/xawtv <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xawtv/pkg-descr>`__
   is another TV application with similar features.

-  `audio/xmradio <http://www.freebsd.org/cgi/url.cgi?ports/audio/xmradio/pkg-descr>`__
   provides an application for using the FM radio tuner of a TV card.

.. raw:: html

   </div>

More applications are available in the FreeBSD Ports Collection.

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

8.5.3.?Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If any problems are encountered with the TV card, check that the video
capture chip and the tuner are supported by
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__
and that the right configuration options were used. For more support or
to ask questions about supported TV cards, refer to the
`freebsd-multimedia <http://lists.FreeBSD.org/mailman/listinfo/freebsd-multimedia>`__
mailing list.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+----------------------------+-----------------------------+
| `Prev <video-playback.html>`__?   | `Up <multimedia.html>`__   | ?\ `Next <mythtv.html>`__   |
+-----------------------------------+----------------------------+-----------------------------+
| 8.4.?Video Playback?              | `Home <index.html>`__      | ?8.6.?MythTV                |
+-----------------------------------+----------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
