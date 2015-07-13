================
15.4.?Interfaces
================

.. raw:: html

   <div class="navheader">

15.4.?Interfaces
`Prev <pcm-probe-and-attach.html>`__?
Chapter?15.?Sound Subsystem
?\ `Next <pccard.html>`__

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

15.4.?Interfaces
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The interface between the ``pcm`` core and the sound drivers is defined
in terms of `kernel objects <kernel-objects.html>`__.

There are two main interfaces that a sound driver will usually provide:
*CHANNEL* and either *MIXER* or *AC97*.

The *AC97* interface is a very small hardware access (register
read/write) interface, implemented by drivers for hardware with an AC97
codec. In this case, the actual MIXER interface is provided by the
shared AC97 code in ``pcm``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.4.1.?The CHANNEL Interface
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

15.4.1.1.?Common Notes for Function Parameters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sound drivers usually have a private data structure to describe their
device, and one structure for each play and record data channel that it
supports.

For all CHANNEL interface functions, the first parameter is an opaque
pointer.

The second parameter is a pointer to the private channel data structure,
except for ``channel_init()`` which has a pointer to the private device
structure (and returns the channel pointer for further use by ``pcm``).

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

15.4.1.2.?Overview of Data Transfer Operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For sound data transfers, the ``pcm`` core and the sound drivers
communicate through a shared memory area, described by a
``struct snd_dbuf``.

``struct snd_dbuf`` is private to ``pcm``, and sound drivers obtain
values of interest by calls to accessor functions (``sndbuf_getxxx()``).

The shared memory area has a size of ``sndbuf_getsize()`` and is divided
into fixed size blocks of ``sndbuf_getblksz()`` bytes.

When playing, the general transfer mechanism is as follows (reverse the
idea for recording):

.. raw:: html

   <div class="itemizedlist">

-  ``pcm`` initially fills up the buffer, then calls the sound driver's
   ```xxxchannel_trigger()`` <oss-interfaces.html#channel-trigger>`__
   function with a parameter of PCMTRIG\_START.

-  The sound driver then arranges to repeatedly transfer the whole
   memory area (``sndbuf_getbuf()``, ``sndbuf_getsize()``) to the
   device, in blocks of ``sndbuf_getblksz()`` bytes. It calls back the
   ``chn_intr()`` ``pcm`` function for each transferred block (this will
   typically happen at interrupt time).

-  ``chn_intr()`` arranges to copy new data to the area that was
   transferred to the device (now free), and make appropriate updates to
   the ``snd_dbuf`` structure.

.. raw:: html

   </div>

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

15.4.1.3.?channel\_init
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxchannel_init()`` is called to initialize each of the play or record
channels. The calls are initiated from the sound driver attach routine.
(See the `probe and attach section <pcm-probe-and-attach.html>`__).

.. code:: programlisting

              static void *
              xxxchannel_init(kobj_t obj, void *data,
                 struct snd_dbuf *b, struct pcm_channel *c, int dir)
              {
                  struct xxx_info *sc = data;
                  struct xxx_chinfo *ch;
                   ...
                  return ch;
               }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-chinit-params>`__          | ``b`` is the address for the channel |
|                                      | ``struct snd_dbuf``. It should be    |
|                                      | initialized in the function by       |
|                                      | calling ``sndbuf_alloc()``. The      |
|                                      | buffer size to use is normally a     |
|                                      | small multiple of the 'typical' unit |
|                                      | transfer size for your device.       |
|                                      |                                      |
|                                      | ``c`` is the ``pcm`` channel control |
|                                      | structure pointer. This is an opaque |
|                                      | object. The function should store it |
|                                      | in the local channel structure, to   |
|                                      | be used in later calls to ``pcm``    |
|                                      | (ie: ``chn_intr(c)``).               |
|                                      |                                      |
|                                      | ``dir`` indicates the channel        |
|                                      | direction (``PCMDIR_PLAY`` or        |
|                                      | ``PCMDIR_REC``).                     |
+--------------------------------------+--------------------------------------+
| `|2| <#co-chinit-return>`__          | The function should return a pointer |
|                                      | to the private area used to control  |
|                                      | this channel. This will be passed as |
|                                      | a parameter to other channel         |
|                                      | interface calls.                     |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

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

15.4.1.4.?channel\_setformat
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxchannel_setformat()`` should set up the hardware for the specified
channel for the specified sound format.

.. code:: programlisting

              static int
              xxxchannel_setformat(kobj_t obj, void *data, u_int32_t format)
              {
                  struct xxx_chinfo *ch = data;
                   ...
                  return 0;
               }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-chsetformat-params>`__     | ``format`` is specified as an        |
|                                      | ``AFMT_XXX value``                   |
|                                      | (``soundcard.h``).                   |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

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

15.4.1.5.?channel\_setspeed
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxchannel_setspeed()`` sets up the channel hardware for the specified
sampling speed, and returns the possibly adjusted speed.

.. code:: programlisting

              static int
              xxxchannel_setspeed(kobj_t obj, void *data, u_int32_t speed)
              {
                  struct xxx_chinfo *ch = data;
                   ...
                  return speed;
               }

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

15.4.1.6.?channel\_setblocksize
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxchannel_setblocksize()`` sets the block size, which is the size of
unit transactions between ``pcm`` and the sound driver, and between the
sound driver and the device. Typically, this would be the number of
bytes transferred before an interrupt occurs. During a transfer, the
sound driver should call ``pcm``'s ``chn_intr()`` every time this size
has been transferred.

Most sound drivers only take note of the block size here, to be used
when an actual transfer will be started.

.. code:: programlisting

              static int
              xxxchannel_setblocksize(kobj_t obj, void *data, u_int32_t blocksize)
              {
                  struct xxx_chinfo *ch = data;
                    ...
                  return blocksize;
               }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-chsetblocksize-return>`__  | The function returns the possibly    |
|                                      | adjusted block size. In case the     |
|                                      | block size is indeed changed,        |
|                                      | ``sndbuf_resize()`` should be called |
|                                      | to adjust the buffer.                |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

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

15.4.1.7.?channel\_trigger
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxchannel_trigger()`` is called by ``pcm`` to control data transfer
operations in the driver.

.. code:: programlisting

              static int
              xxxchannel_trigger(kobj_t obj, void *data, int go)
              {
                  struct xxx_chinfo *ch = data;
                   ...
                  return 0;
               }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-chtrigger-params>`__       | ``go`` defines the action for the    |
|                                      | current call. The possible values    |
|                                      | are:                                 |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="itemizedlist">        |
|                                      |                                      |
|                                      | -  ``PCMTRIG_START``: the driver     |
|                                      |    should start a data transfer from |
|                                      |    or to the channel buffer. If      |
|                                      |    needed, the buffer base and size  |
|                                      |    can be retrieved through          |
|                                      |    ``sndbuf_getbuf()`` and           |
|                                      |    ``sndbuf_getsize()``.             |
|                                      |                                      |
|                                      | -  ``PCMTRIG_EMLDMAWR`` /            |
|                                      |    ``PCMTRIG_EMLDMARD``: this tells  |
|                                      |    the driver that the input or      |
|                                      |    output buffer may have been       |
|                                      |    updated. Most drivers just ignore |
|                                      |    these calls.                      |
|                                      |                                      |
|                                      | -  ``PCMTRIG_STOP`` /                |
|                                      |    ``PCMTRIG_ABORT``: the driver     |
|                                      |    should stop the current transfer. |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If the driver uses ISA DMA, ``sndbuf_isadma()`` should be called before
performing actions on the device, and will take care of the DMA chip
side of things.

.. raw:: html

   </div>

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

15.4.1.8.?channel\_getptr
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxchannel_getptr()`` returns the current offset in the transfer
buffer. This will typically be called by ``chn_intr()``, and this is how
``pcm`` knows where it can transfer new data.

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

15.4.1.9.?channel\_free
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxchannel_free()`` is called to free up channel resources, for
example when the driver is unloaded, and should be implemented if the
channel data structures are dynamically allocated or if
``sndbuf_alloc()`` was not used for buffer allocation.

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

15.4.1.10.?channel\_getcaps
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

              struct pcmchan_caps *
              xxxchannel_getcaps(kobj_t obj, void *data)
              {
                  return &xxx_caps;
               }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-chgetcaps-return>`__       | The routine returns a pointer to a   |
|                                      | (usually statically-defined)         |
|                                      | ``pcmchan_caps`` structure (defined  |
|                                      | in ``sound/pcm/channel.h``. The      |
|                                      | structure holds the minimum and      |
|                                      | maximum sampling frequencies, and    |
|                                      | the accepted sound formats. Look at  |
|                                      | any sound driver for an example.     |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

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

15.4.1.11.?More Functions
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``channel_reset()``, ``channel_resetdone()``, and ``channel_notify()``
are for special purposes and should not be implemented in a driver
without discussing it on the `FreeBSD multimedia mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-multimedia>`__.

``channel_setdir()`` is deprecated.

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

15.4.2.?The MIXER Interface
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

15.4.2.1.?mixer\_init
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxmixer_init()`` initializes the hardware and tells ``pcm`` what
mixer devices are available for playing and recording

.. code:: programlisting

              static int
              xxxmixer_init(struct snd_mixer *m)
              {
                  struct xxx_info   *sc = mix_getdevinfo(m);
                  u_int32_t v;

                  [Initialize hardware]

                  [Set appropriate bits in v for play mixers]
                  mix_setdevs(m, v);
                  [Set appropriate bits in v for record mixers]
                  mix_setrecdevs(m, v)

                  return 0;
              }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-mxini-sd>`__               | Set bits in an integer value and     |
|                                      | call ``mix_setdevs()`` and           |
|                                      | ``mix_setrecdevs()`` to tell ``pcm`` |
|                                      | what devices exist.                  |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Mixer bits definitions can be found in ``soundcard.h``
(``SOUND_MASK_XXX`` values and ``SOUND_MIXER_XXX`` bit shifts).

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

15.4.2.2.?mixer\_set
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxmixer_set()`` sets the volume level for one mixer device.

.. code:: programlisting

              static int
              xxxmixer_set(struct snd_mixer *m, unsigned dev,
                               unsigned left, unsigned right)
              {
                  struct sc_info *sc = mix_getdevinfo(m);
                  [set volume level]
                  return left | (right << 8);
              }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-mxset-params>`__           | The device is specified as a         |
|                                      | ``SOUND_MIXER_XXX`` value            |
|                                      |                                      |
|                                      | The volume values are specified in   |
|                                      | range [0-100]. A value of zero       |
|                                      | should mute the device.              |
+--------------------------------------+--------------------------------------+
| `|2| <#co-mxset-return>`__           | As the hardware levels probably will |
|                                      | not match the input scale, and some  |
|                                      | rounding will occur, the routine     |
|                                      | returns the actual level values (in  |
|                                      | range 0-100) as shown.               |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

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

15.4.2.3.?mixer\_setrecsrc
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxmixer_setrecsrc()`` sets the recording source device.

.. code:: programlisting

              static int
              xxxmixer_setrecsrc(struct snd_mixer *m, u_int32_t src)
              {
                  struct xxx_info *sc = mix_getdevinfo(m);

                  [look for non zero bit(s) in src, set up hardware]

                  [update src to reflect actual action]
                  return src;
               }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-mxsr-params>`__            | The desired recording devices are    |
|                                      | specified as a bit field             |
+--------------------------------------+--------------------------------------+
| `|2| <#co-mxsr-return>`__            | The actual devices set for recording |
|                                      | are returned. Some drivers can only  |
|                                      | set one device for recording. The    |
|                                      | function should return -1 if an      |
|                                      | error occurs.                        |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

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

15.4.2.4.?mixer\_uninit, mixer\_reinit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``xxxmixer_uninit()`` should ensure that all sound is muted and if
possible mixer hardware should be powered down

``xxxmixer_reinit()`` should ensure that the mixer hardware is powered
up and any settings not controlled by ``mixer_set()`` or
``mixer_setrecsrc()`` are restored.

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

15.4.3.?The AC97 Interface
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The *AC97* interface is implemented by drivers with an AC97 codec. It
only has three methods:

.. raw:: html

   <div class="itemizedlist">

-  ``xxxac97_init()`` returns the number of ac97 codecs found.

-  ``ac97_read()`` and ``ac97_write()`` read or write a specified
   register.

.. raw:: html

   </div>

The *AC97* interface is used by the AC97 code in ``pcm`` to perform
higher level operations. Look at ``sound/pci/maestro3.c`` or many others
under ``sound/pci/`` for an example.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+-----------------------------+
| `Prev <pcm-probe-and-attach.html>`__?   | `Up <oss.html>`__       | ?\ `Next <pccard.html>`__   |
+-----------------------------------------+-------------------------+-----------------------------+
| 15.3.?Probing, Attaching, etc.?         | `Home <index.html>`__   | ?Chapter?16.?PC Card        |
+-----------------------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
