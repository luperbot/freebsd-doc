==============================
8.2.?Setting Up the Sound Card
==============================

.. raw:: html

   <div class="navheader">

8.2.?Setting Up the Sound Card
`Prev <multimedia.html>`__?
Chapter?8.?Multimedia
?\ `Next <sound-mp3.html>`__

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

8.2.?Setting Up the Sound Card
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Moses Moore.

.. raw:: html

   </div>

.. raw:: html

   <div>

Enhanced by Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before beginning the configuration, determine the model of the sound
card and the chip it uses. FreeBSD supports a wide variety of sound
cards. Check the supported audio devices list of the `Hardware
Notes <http://www.FreeBSD.org/releases/10.1R/hardware.html>`__ to see if
the card is supported and which FreeBSD driver it uses.

In order to use the sound device, its device driver must be loaded. The
easiest way is to load a kernel module for the sound card with
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
This example loads the driver for a built-in audio chipset based on the
Intel specification:

.. code:: screen

    # kldload snd_hda

To automate the loading of this driver at boot time, add the driver to
``/boot/loader.conf``. The line for this driver is:

.. code:: programlisting

    snd_hda_load="YES"

Other available sound modules are listed in
``/boot/defaults/loader.conf``. When unsure which driver to use, load
the ``snd_driver`` module:

.. code:: screen

    # kldload snd_driver

This is a metadriver which loads all of the most common sound drivers
and can be used to speed up the search for the correct driver. It is
also possible to load all sound drivers by adding the metadriver to
``/boot/loader.conf``.

To determine which driver was selected for the sound card after loading
the ``snd_driver`` metadriver, type ``cat /dev/sndstat``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.2.1.?Configuring a Custom Kernel with Sound Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section is for users who prefer to statically compile in support
for the sound card in a custom kernel. For more information about
recompiling a kernel, refer to `Chapter?9, *Configuring the FreeBSD
Kernel* <kernelconfig.html>`__.

When using a custom kernel to provide sound support, make sure that the
audio framework driver exists in the custom kernel configuration file:

.. code:: programlisting

    device sound

Next, add support for the sound card. To continue the example of the
built-in audio chipset based on the Intel specification from the
previous section, use the following line in the custom kernel
configuration file:

.. code:: programlisting

    device snd_hda

Be sure to read the manual page of the driver for the device name to use
for the driver.

Non-PnP ISA sound cards may require the IRQ and I/O port settings of the
card to be added to ``/boot/device.hints``. During the boot process,
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
reads this file and passes the settings to the kernel. For example, an
old Creative SoundBlaster? 16 ISA non-PnP card will use the
`snd\_sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_sbc&sektion=4>`__
driver in conjunction with ``snd_sb16``. For this card, the following
lines must be added to the kernel configuration file:

.. code:: programlisting

    device snd_sbc
    device snd_sb16

If the card uses the ``0x220`` I/O port and IRQ ``5``, these lines must
also be added to ``/boot/device.hints``:

.. code:: programlisting

    hint.sbc.0.at="isa"
    hint.sbc.0.port="0x220"
    hint.sbc.0.irq="5"
    hint.sbc.0.drq="1"
    hint.sbc.0.flags="0x15"

In this case, the card uses the ``0x220`` I/O port and the IRQ ``5``.

The syntax used in ``/boot/device.hints`` is described in
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4>`__
and the manual page for the driver of the sound card.

The settings shown above are the defaults. In some cases, the IRQ or
other settings may need to be changed to match the card. Refer to
`snd\_sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_sbc&sektion=4>`__
for more information about this card.

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

8.2.2.?Testing Sound
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After loading the required module or rebooting into the custom kernel,
the sound card should be detected. To confirm, run ``dmesg | grep pcm``.
This example is from a system with a built-in Conexant CX20590 chipset:

.. code:: screen

    pcm0: <NVIDIA (0x001c) (HDMI/DP 8ch)> at nid 5 on hdaa0
    pcm1: <NVIDIA (0x001c) (HDMI/DP 8ch)> at nid 6 on hdaa0
    pcm2: <Conexant CX20590 (Analog 2.0+HP/2.0)> at nid 31,25 and 35,27 on hdaa1

The status of the sound card may also be checked using this command:

.. code:: screen

    # cat /dev/sndstat
    FreeBSD Audio Driver (newpcm: 64bit 2009061500/amd64)
    Installed devices:
    pcm0: <NVIDIA (0x001c) (HDMI/DP 8ch)> (play)
    pcm1: <NVIDIA (0x001c) (HDMI/DP 8ch)> (play)
    pcm2: <Conexant CX20590 (Analog 2.0+HP/2.0)> (play/rec) default

The output will vary depending upon the sound card. If no ``pcm``
devices are listed, double-check that the correct device driver was
loaded or compiled into the kernel. The next section lists some common
problems and their solutions.

If all goes well, the sound card should now work in os;. If the CD or
DVD drive is properly connected to the sound card, one can insert an
audio CD in the drive and play it with
`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1>`__:

.. code:: screen

    % cdcontrol -f /dev/acd0 play 1

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Audio CDs have specialized encodings which means that they should not be
mounted using
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.

.. raw:: html

   </div>

Various applications, such as
`audio/workman <http://www.freebsd.org/cgi/url.cgi?ports/audio/workman/pkg-descr>`__,
provide a friendlier interface. The
`audio/mpg123 <http://www.freebsd.org/cgi/url.cgi?ports/audio/mpg123/pkg-descr>`__
port can be installed to listen to MP3 audio files.

Another quick way to test the card is to send data to ``/dev/dsp``:

.. code:: screen

    % cat filename > /dev/dsp

where ``filename`` can be any type of file. This command should produce
some noise, confirming that the sound card is working.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The ``/dev/dsp*`` device nodes will be created automatically as needed.
When not in use, they do not exist and will not appear in the output of
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__.

.. raw:: html

   </div>

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

8.2.3.?Troubleshooting Sound
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Table 8.1 lists some common error messages and their solutions:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?8.1.?Common Error Messages

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Error                                      | Solution                                                                                                                                                       |
+============================================+================================================================================================================================================================+
| sb\_dspwr(XX) timed out                    | The I/O port is not set correctly.                                                                                                                             |
+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| bad irq XX                                 | The IRQ is set incorrectly. Make sure that the set IRQ and the sound IRQ are the same.                                                                         |
+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| xxx: gus pcm not attached, out of memory   | There is not enough available memory to use the device.                                                                                                        |
+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| xxx: can't open /dev/dsp!                  | Type ``fstat | grep           dsp`` to check if another application is holding the device open. Noteworthy troublemakers are esound and KDE's sound support.   |
+--------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Modern graphics cards often come with their own sound driver for use
with HDMI. This sound device is sometimes enumerated before the sound
card meaning that the sound card will not be used as the default
playback device. To check if this is the case, run dmesg and look for
``pcm``. The output looks something like this:

.. code:: programlisting

    ...
    hdac0: HDA Driver Revision: 20100226_0142
    hdac1: HDA Driver Revision: 20100226_0142
    hdac0: HDA Codec #0: NVidia (Unknown)
    hdac0: HDA Codec #1: NVidia (Unknown)
    hdac0: HDA Codec #2: NVidia (Unknown)
    hdac0: HDA Codec #3: NVidia (Unknown)
    pcm0: <HDA NVidia (Unknown) PCM #0 DisplayPort> at cad 0 nid 1 on hdac0
    pcm1: <HDA NVidia (Unknown) PCM #0 DisplayPort> at cad 1 nid 1 on hdac0
    pcm2: <HDA NVidia (Unknown) PCM #0 DisplayPort> at cad 2 nid 1 on hdac0
    pcm3: <HDA NVidia (Unknown) PCM #0 DisplayPort> at cad 3 nid 1 on hdac0
    hdac1: HDA Codec #2: Realtek ALC889
    pcm4: <HDA Realtek ALC889 PCM #0 Analog> at cad 2 nid 1 on hdac1
    pcm5: <HDA Realtek ALC889 PCM #1 Analog> at cad 2 nid 1 on hdac1
    pcm6: <HDA Realtek ALC889 PCM #2 Digital> at cad 2 nid 1 on hdac1
    pcm7: <HDA Realtek ALC889 PCM #3 Digital> at cad 2 nid 1 on hdac1
    ...

In this example, the graphics card (``NVidia``) has been enumerated
before the sound card (``Realtek ALC889``). To use the sound card as the
default playback device, change ``hw.snd.default_unit`` to the unit that
should be used for playback:

.. code:: screen

    # sysctl hw.snd.default_unit=n

where ``n`` is the number of the sound device to use. In this example,
it should be ``4``. Make this change permanent by adding the following
line to ``/etc/sysctl.conf``:

.. code:: programlisting

    hw.snd.default_unit=4

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

8.2.4.?Utilizing Multiple Sound Sources
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Munish Chopra.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

It is often desirable to have multiple sources of sound that are able to
play simultaneously. FreeBSD uses “Virtual Sound Channels” to multiplex
the sound card's playback by mixing sound in the kernel.

Three
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
knobs are available for configuring virtual channels:

.. code:: screen

    # sysctl dev.pcm.0.play.vchans=4
    # sysctl dev.pcm.0.rec.vchans=4
    # sysctl hw.snd.maxautovchans=4

This example allocates four virtual channels, which is a practical
number for everyday use. Both ``dev.pcm.0.play.vchans=4`` and
``dev.pcm.0.rec.vchans=4`` are configurable after a device has been
attached and represent the number of virtual channels ``pcm0`` has for
playback and recording. Since the ``pcm`` module can be loaded
independently of the hardware drivers, ``hw.snd.maxautovchans``
indicates how many virtual channels will be given to an audio device
when it is attached. Refer to
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4>`__ for
more information.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The number of virtual channels for a device cannot be changed while it
is in use. First, close any programs using the device, such as music
players or sound daemons.

.. raw:: html

   </div>

The correct ``pcm`` device will automatically be allocated transparently
to a program that requests ``/dev/dsp0``.

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

8.2.5.?Setting Default Values for Mixer Channels
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Josef El-Rayes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The default values for the different mixer channels are hardcoded in the
source code of the
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4>`__
driver. While sound card mixer levels can be changed using
`mixer(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mixer&sektion=8>`__
or third-party applications and daemons, this is not a permanent
solution. To instead set default mixer values at the driver level,
define the appropriate values in ``/boot/device.hints``, as seen in this
example:

.. code:: programlisting

    hint.pcm.0.vol="50"

This will set the volume channel to a default value of ``50`` when the
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4>`__
module is loaded.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+----------------------------+--------------------------------+
| `Prev <multimedia.html>`__?   | `Up <multimedia.html>`__   | ?\ `Next <sound-mp3.html>`__   |
+-------------------------------+----------------------------+--------------------------------+
| Chapter?8.?Multimedia?        | `Home <index.html>`__      | ?8.3.?MP3 Audio                |
+-------------------------------+----------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
