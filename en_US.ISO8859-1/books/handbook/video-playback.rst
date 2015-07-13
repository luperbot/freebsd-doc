===================
8.4.?Video Playback
===================

.. raw:: html

   <div class="navheader">

8.4.?Video Playback
`Prev <sound-mp3.html>`__?
Chapter?8.?Multimedia
?\ `Next <tvcard.html>`__

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

8.4.?Video Playback
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Ross Lippert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before configuring video playback, determine the model and chipset of
the video card. While Xorg supports a wide variety of video cards, not
all provide good playback performance. To obtain a list of extensions
supported by the Xorg server using the card, run ``xdpyinfo`` while Xorg
is running.

It is a good idea to have a short MPEG test file for evaluating various
players and options. Since some DVD applications look for DVD media in
``/dev/dvd`` by default, or have this device name hardcoded in them, it
might be useful to make a symbolic link to the proper device:

.. code:: screen

    # ln -sf /dev/cd0 /dev/dvd

Due to the nature of
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__,
manually created links will not persist after a system reboot. In order
to recreate the symbolic link automatically when the system boots, add
the following line to ``/etc/devfs.conf``:

.. code:: programlisting

    link cd0 dvd

DVD decryption invokes certain functions that require write permission
to the DVD device.

To enhance the shared memory Xorg interface, it is recommended to
increase the values of these
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variables:

.. code:: programlisting

    kern.ipc.shmmax=67108864
    kern.ipc.shmall=32768

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.1.?Determining Video Capabilities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are several possible ways to display video under Xorg and what
works is largely hardware dependent. Each method described below will
have varying quality across different hardware.

Common video interfaces include:

.. raw:: html

   <div class="orderedlist">

#. Xorg: normal output using shared memory.

#. XVideo: an extension to the Xorg interface which allows video to be
   directly displayed in drawable objects through a special
   acceleration. This extension provides good quality playback even on
   low-end machines. The next section describes how to determine if this
   extension is running.

#. SDL: the Simple Directmedia Layer is a porting layer for many
   operating systems, allowing cross-platform applications to be
   developed which make efficient use of sound and graphics. SDL
   provides a low-level abstraction to the hardware which can sometimes
   be more efficient than the Xorg interface. On FreeBSD, SDL can be
   installed using the
   `devel/sdl20 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl20/pkg-descr>`__
   package or port.

#. DGA: the Direct Graphics Access is an Xorg extension which allows a
   program to bypass the Xorg server and directly alter the framebuffer.
   Because it relies on a low level memory mapping, programs using it
   must be run as ``root``. The DGA extension can be tested and
   benchmarked using
   `dga(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dga&sektion=1>`__.
   When ``dga`` is running, it changes the colors of the display
   whenever a key is pressed. To quit, press **q**.

#. SVGAlib: a low level console graphics layer.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.1.1.?XVideo
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To check whether this extension is running, use ``xvinfo``:

.. code:: screen

    % xvinfo

XVideo is supported for the card if the result is similar to:

.. code:: screen

    X-Video Extension version 2.2
      screen #0
      Adaptor #0: "Savage Streams Engine"
        number of ports: 1
        port base: 43
        operations supported: PutImage
        supported visuals:
          depth 16, visualID 0x22
          depth 16, visualID 0x23
        number of attributes: 5
          "XV_COLORKEY" (range 0 to 16777215)
                  client settable attribute
                  client gettable attribute (current value is 2110)
          "XV_BRIGHTNESS" (range -128 to 127)
                  client settable attribute
                  client gettable attribute (current value is 0)
          "XV_CONTRAST" (range 0 to 255)
                  client settable attribute
                  client gettable attribute (current value is 128)
          "XV_SATURATION" (range 0 to 255)
                  client settable attribute
                  client gettable attribute (current value is 128)
          "XV_HUE" (range -180 to 180)
                  client settable attribute
                  client gettable attribute (current value is 0)
        maximum XvImage size: 1024 x 1024
        Number of image formats: 7
          id: 0x32595559 (YUY2)
            guid: 59555932-0000-0010-8000-00aa00389b71
            bits per pixel: 16
            number of planes: 1
            type: YUV (packed)
          id: 0x32315659 (YV12)
            guid: 59563132-0000-0010-8000-00aa00389b71
            bits per pixel: 12
            number of planes: 3
            type: YUV (planar)
          id: 0x30323449 (I420)
            guid: 49343230-0000-0010-8000-00aa00389b71
            bits per pixel: 12
            number of planes: 3
            type: YUV (planar)
          id: 0x36315652 (RV16)
            guid: 52563135-0000-0000-0000-000000000000
            bits per pixel: 16
            number of planes: 1
            type: RGB (packed)
            depth: 0
            red, green, blue masks: 0x1f, 0x3e0, 0x7c00
          id: 0x35315652 (RV15)
            guid: 52563136-0000-0000-0000-000000000000
            bits per pixel: 16
            number of planes: 1
            type: RGB (packed)
            depth: 0
            red, green, blue masks: 0x1f, 0x7e0, 0xf800
          id: 0x31313259 (Y211)
            guid: 59323131-0000-0010-8000-00aa00389b71
            bits per pixel: 6
            number of planes: 3
            type: YUV (packed)
          id: 0x0
            guid: 00000000-0000-0000-0000-000000000000
            bits per pixel: 0
            number of planes: 0
            type: RGB (packed)
            depth: 1
            red, green, blue masks: 0x0, 0x0, 0x0

The formats listed, such as YUV2 and YUV12, are not present with every
implementation of XVideo and their absence may hinder some players.

If the result instead looks like:

.. code:: screen

    X-Video Extension version 2.2
    screen #0
    no adaptors present

XVideo is probably not supported for the card. This means that it will
be more difficult for the display to meet the computational demands of
rendering video, depending on the video card and processor.

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

8.4.2.?Ports and Packages Dealing with Video
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section introduces some of the software available from the FreeBSD
Ports Collection which can be used for video playback.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.2.1.?MPlayer and MEncoder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MPlayer is a command-line video player with an optional graphical
interface which aims to provide speed and flexibility. Other graphical
front-ends to MPlayer are available from the FreeBSD Ports Collection.

MPlayer can be installed using the
`multimedia/mplayer <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/mplayer/pkg-descr>`__
package or port. Several compile options are available and a variety of
hardware checks occur during the build process. For these reasons, some
users prefer to build the port rather than install the package.

When compiling the port, the menu options should be reviewed to
determine the type of support to compile into the port. If an option is
not selected, MPlayer will not be able to display that type of video
format. Use the arrow keys and spacebar to select the required formats.
When finished, press **Enter** to continue the port compile and
installation.

By default, the package or port will build the ``mplayer`` command line
utility and the ``gmplayer`` graphical utility. To encode videos,
compile the
`multimedia/mencoder <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/mencoder/pkg-descr>`__
port. Due to licensing restrictions, a package is not available for
MEncoder.

The first time MPlayer is run, it will create ``~/.mplayer`` in the
user's home directory. This subdirectory contains default versions of
the user-specific configuration files.

This section describes only a few common uses. Refer to mplayer(1) for a
complete description of its numerous options.

To play the file ``testfile.avi``, specify the video interfaces with
``-vo``, as seen in the following examples:

.. code:: screen

    % mplayer -vo xv testfile.avi

.. code:: screen

    % mplayer -vo sdl testfile.avi

.. code:: screen

    % mplayer -vo x11 testfile.avi

.. code:: screen

    # mplayer -vo dga testfile.avi

.. code:: screen

    # mplayer -vo 'sdl:dga' testfile.avi

It is worth trying all of these options, as their relative performance
depends on many factors and will vary significantly with hardware.

To play a DVD, replace ``testfile.avi`` with ``dvd://N`` -dvd-device
*``DEVICE``*, where *``N``* is the title number to play and *``DEVICE``*
is the device node for the DVD. For example, to play title 3 from
``/dev/dvd``:

.. code:: screen

    # mplayer -vo xv dvd://3 -dvd-device /dev/dvd

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The default DVD device can be defined during the build of the MPlayer
port by including the ``WITH_DVD_DEVICE=/path/to/desired/device``
option. By default, the device is ``/dev/cd0``. More details can be
found in the port's ``Makefile.options``.

.. raw:: html

   </div>

To stop, pause, advance, and so on, use a keybinding. To see the list of
keybindings, run ``mplayer         -h`` or read mplayer(1).

Additional playback options include ``-fs         -zoom``, which engages
fullscreen mode, and ``-framedrop``, which helps performance.

Each user can add commonly used options to their ``~/.mplayer/config``
like so:

.. code:: programlisting

    vo=xv
    fs=yes
    zoom=yes

``mplayer`` can be used to rip a DVD title to a ``.vob``. To dump the
second title from a DVD:

.. code:: screen

    # mplayer -dumpstream -dumpfile out.vob dvd://2 -dvd-device /dev/dvd

The output file, ``out.vob``, will be in MPEG format.

Anyone wishing to obtain a high level of expertise with UNIX? video
should consult `mplayerhq.hu/DOCS <http://www.mplayerhq.hu/DOCS/>`__ as
it is technically informative. This documentation should be considered
as required reading before submitting any bug reports.

Before using ``mencoder``, it is a good idea to become familiar with the
options described at
`mplayerhq.hu/DOCS/HTML/en/mencoder.html <http://www.mplayerhq.hu/DOCS/HTML/en/mencoder.html>`__.
There are innumerable ways to improve quality, lower bitrate, and change
formats, and some of these options may make the difference between good
or bad performance. Improper combinations of command line options can
yield output files that are unplayable even by ``mplayer``.

Here is an example of a simple copy:

.. code:: screen

    % mencoder input.avi -oac copy -ovc copy -o output.avi

To rip to a file, use ``-dumpfile`` with ``mplayer``.

To convert ``input.avi`` to the MPEG4 codec with MPEG3 audio encoding,
first install the
`audio/lame <http://www.freebsd.org/cgi/url.cgi?ports/audio/lame/pkg-descr>`__
port. Due to licensing restrictions, a package is not available. Once
installed, type:

.. code:: screen

    % mencoder input.avi -oac mp3lame -lameopts br=192 \
         -ovc lavc -lavcopts vcodec=mpeg4:vhq -o output.avi

This will produce output playable by applications such as ``mplayer``
and ``xine``.

``input.avi`` can be replaced with
``dvd://1 -dvd-device         /dev/dvd`` and run as ``root`` to
re-encode a DVD title directly. Since it may take a few tries to get the
desired result, it is recommended to instead dump the title to a file
and to work on the file.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.2.2.?The xine Video Player
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

xine is a video player with a reusable base library and a modular
executable which can be extended with plugins. It can be installed using
the
`multimedia/xine <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xine/pkg-descr>`__
package or port.

In practice, xine requires either a fast CPU with a fast video card, or
support for the XVideo extension. The xine video player performs best on
XVideo interfaces.

By default, the xine player starts a graphical user interface. The menus
can then be used to open a specific file.

Alternatively, xine may be invoked from the command line by specifying
the name of the file to play:

.. code:: screen

    % xine -g -p mymovie.avi

Refer to `xine-project.org/faq <http://www.xine-project.org/faq>`__ for
more information and troubleshooting tips.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.4.2.3.?The Transcode Utilities
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Transcode provides a suite of tools for re-encoding video and audio
files. Transcode can be used to merge video files or repair broken files
using command line tools with stdin/stdout stream interfaces.

In FreeBSD, Transcode can be installed using the
`multimedia/transcode <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/transcode/pkg-descr>`__
package or port. Many users prefer to compile the port as it provides a
menu of compile options for specifying the support and codecs to compile
in. If an option is not selected, Transcode will not be able to encode
that format. Use the arrow keys and spacebar to select the required
formats. When finished, press **Enter** to continue the port compile and
installation.

This example demonstrates how to convert a DivX file into a PAL MPEG-1
file (PAL VCD):

.. code:: screen

    % transcode -i
    input.avi -V --export_prof vcd-pal -o output_vcd
    % mplex -f 1 -o output_vcd.mpg output_vcd.m1v output_vcd.mpa

The resulting MPEG file, ``output_vcd.mpg``, is ready to be played with
MPlayer. The file can be burned on a CD media to create a video CD using
a utility such as
`multimedia/vcdimager <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/vcdimager/pkg-descr>`__
or
`sysutils/cdrdao <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrdao/pkg-descr>`__.

In addition to the manual page for ``transcode``, refer to
`transcoding.org/cgi-bin/transcode <http://www.transcoding.org/cgi-bin/transcode>`__
for further information and examples.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+----------------------------+-----------------------------+
| `Prev <sound-mp3.html>`__?   | `Up <multimedia.html>`__   | ?\ `Next <tvcard.html>`__   |
+------------------------------+----------------------------+-----------------------------+
| 8.3.?MP3 Audio?              | `Home <index.html>`__      | ?8.5.?TV Cards              |
+------------------------------+----------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
