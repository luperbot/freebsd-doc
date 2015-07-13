==============
8.3.?MP3 Audio
==============

.. raw:: html

   <div class="navheader">

8.3.?MP3 Audio
`Prev <sound-setup.html>`__?
Chapter?8.?Multimedia
?\ `Next <video-playback.html>`__

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

8.3.?MP3 Audio
--------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes some MP3 players available for FreeBSD, how to
rip audio CD tracks, and how to encode and decode MP3s.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.3.1.?MP3 Players
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A popular graphical MP3 player is XMMS. It supports Winamp skins and
additional plugins. The interface is intuitive, with a playlist, graphic
equalizer, and more. Those familiar with Winamp will find XMMS simple to
use. On FreeBSD, XMMS can be installed from the
`multimedia/xmms <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xmms/pkg-descr>`__
port or package.

The
`audio/mpg123 <http://www.freebsd.org/cgi/url.cgi?ports/audio/mpg123/pkg-descr>`__
package or port provides an alternative, command-line MP3 player. Once
installed, specify the MP3 file to play on the command line. If the
system has multiple audio devices, the sound device can also be
specifed:

.. code:: screen

    # mpg123 -a /dev/dsp1.0 Foobar-GreatestHits.mp3
    High Performance MPEG 1.0/2.0/2.5 Audio Player for Layers 1, 2 and 3
            version 1.18.1; written and copyright by Michael Hipp and others
            free software (LGPL) without any warranty but with best wishes

    Playing MPEG stream from Foobar-GreatestHits.mp3 ...
    MPEG 1.0 layer III, 128 kbit/s, 44100 Hz joint-stereo

Additional MP3 players are available in the FreeBSD Ports Collection.

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

8.3.2.?Ripping CD Audio Tracks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before encoding a CD or CD track to MP3, the audio data on the CD must
be ripped to the hard drive. This is done by copying the raw CD Digital
Audio (CDDA) data to WAV files.

The ``cdda2wav`` tool, which is installed with the
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
suite, can be used to rip audio information from CDs.

With the audio CD in the drive, the following command can be issued as
``root`` to rip an entire CD into individual, per track, WAV files:

.. code:: screen

    # cdda2wav -D 0,1,0 -B

In this example, the ``-D       0,1,0`` indicates the SCSI device
``0,1,0`` containing the CD to rip. Use ``cdrecord -scanbus`` to
determine the correct device parameters for the system.

To rip individual tracks, use ``-t`` to specify the track:

.. code:: screen

    # cdda2wav -D 0,1,0 -t 7

To rip a range of tracks, such as track one to seven, specify a range:

.. code:: screen

    # cdda2wav -D 0,1,0 -t 1+7

To rip from an ATAPI (IDE) CDROM drive, specify the device name in place
of the SCSI unit numbers. For example, to rip track 7 from an IDE drive:

.. code:: screen

    # cdda2wav -D /dev/acd0 -t 7

Alternately, ``dd`` can be used to extract audio tracks on ATAPI drives,
as described in `Section?18.5.5, “Duplicating Audio
CDs” <creating-cds.html#duplicating-audiocds>`__.

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

8.3.3.?Encoding and Decoding MP3s
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lame is a popular MP3 encoder which can be installed from the
`audio/lame <http://www.freebsd.org/cgi/url.cgi?ports/audio/lame/pkg-descr>`__
port. Due to patent issues, a package is not available.

The following command will convert the ripped WAV file ``audio01.wav``
to ``audio01.mp3``:

.. code:: screen

    # lame -h -b 128 --tt "Foo Song Title" --ta "FooBar Artist" --tl "FooBar Album" \
    --ty "2014" --tc "Ripped and encoded by Foo" --tg "Genre" audio01.wav audio01.mp3

The specified 128?kbits is a standard MP3 bitrate while the 160 and 192
bitrates provide higher quality. The higher the bitrate, the larger the
size of the resulting MP3. The ``-h`` turns on the “higher quality but a
little slower” mode. The options beginning with ``--t`` indicate ID3
tags, which usually contain song information, to be embedded within the
MP3 file. Additional encoding options can be found in the lame manual
page.

In order to burn an audio CD from MP3s, they must first be converted to
a non-compressed file format. XMMS can be used to convert to the WAV
format, while mpg123 can be used to convert to the raw Pulse-Code
Modulation (PCM) audio data format.

To convert ``audio01.mp3`` using mpg123, specify the name of the PCM
file:

.. code:: screen

    # mpg123 -s audio01.mp3 > audio01.pcm

To use XMMS to convert a MP3 to WAV format, use these steps:

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?8.1.?Converting to WAV Format in XMMS

.. raw:: html

   </div>

#. Launch XMMS.

#. Right-click the window to bring up the XMMS menu.

#. Select ``Preferences`` under ``Options``.

#. Change the Output Plugin to “Disk Writer Plugin”.

#. Press ``Configure``.

#. Enter or browse to a directory to write the uncompressed files to.

#. Load the MP3 file into XMMS as usual, with volume at 100% and EQ
   settings turned off.

#. Press ``Play``. The XMMS will appear as if it is playing the MP3, but
   no music will be heard. It is actually playing the MP3 to a file.

#. When finished, be sure to set the default Output Plugin back to what
   it was before in order to listen to MP3s again.

.. raw:: html

   </div>

Both the WAV and PCM formats can be used with cdrecord. When using WAV
files, there will be a small tick sound at the beginning of each track.
This sound is the header of the WAV file. The
`audio/sox <http://www.freebsd.org/cgi/url.cgi?ports/audio/sox/pkg-descr>`__
port or package can be used to remove the header:

.. code:: screen

    % sox -t wav -r 44100 -s -w -c 2 track.wav track.raw

Refer to `Section?18.5, “Creating and Using CD
Media” <creating-cds.html>`__ for more information on using a CD burner
in FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+----------------------------+-------------------------------------+
| `Prev <sound-setup.html>`__?      | `Up <multimedia.html>`__   | ?\ `Next <video-playback.html>`__   |
+-----------------------------------+----------------------------+-------------------------------------+
| 8.2.?Setting Up the Sound Card?   | `Home <index.html>`__      | ?8.4.?Video Playback                |
+-----------------------------------+----------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
