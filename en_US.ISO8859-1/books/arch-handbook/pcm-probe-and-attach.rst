==============================
15.3.?Probing, Attaching, etc.
==============================

.. raw:: html

   <div class="navheader">

15.3.?Probing, Attaching, etc.
`Prev <oss-files.html>`__?
Chapter?15.?Sound Subsystem
?\ `Next <oss-interfaces.html>`__

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

15.3.?Probing, Attaching, etc.
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sound drivers probe and attach in almost the same way as any hardware
driver module. You might want to look at the `ISA <isa-driver.html>`__
or `PCI <pci.html>`__ specific sections of the handbook for more
information.

However, sound drivers differ in some ways:

.. raw:: html

   <div class="itemizedlist">

-  They declare themselves as ``pcm`` class devices, with a
   ``struct snddev_info`` device private structure:

   .. code:: programlisting

                 static driver_t xxx_driver = {
                     "pcm",
                     xxx_methods,
                     sizeof(struct snddev_info)
                 };

                 DRIVER_MODULE(snd_xxxpci, pci, xxx_driver, pcm_devclass, 0, 0);
                 MODULE_DEPEND(snd_xxxpci, snd_pcm, PCM_MINVER, PCM_PREFVER,PCM_MAXVER);

   Most sound drivers need to store additional private information about
   their device. A private data structure is usually allocated in the
   attach routine. Its address is passed to ``pcm`` by the calls to
   ``pcm_register()`` and ``mixer_init()``. ``pcm`` later passes back
   this address as a parameter in calls to the sound driver interfaces.

-  The sound driver attach routine should declare its MIXER or AC97
   interface to ``pcm`` by calling ``mixer_init()``. For a MIXER
   interface, this causes in turn a call to
   ```xxxmixer_init()`` <oss-interfaces.html#xxxmixer-init>`__.

-  The sound driver attach routine declares its general CHANNEL
   configuration to ``pcm`` by calling
   ``pcm_register(dev, sc, nplay,       nrec)``, where ``sc`` is the
   address for the device data structure, used in further calls from
   ``pcm``, and ``nplay`` and ``nrec`` are the number of play and record
   channels.

-  The sound driver attach routine declares each of its channel objects
   by calls to ``pcm_addchan()``. This sets up the channel glue in
   ``pcm`` and causes in turn a call to
   ```xxxchannel_init()`` <oss-interfaces.html#xxxchannel-init>`__.

-  The sound driver detach routine should call ``pcm_unregister()``
   before releasing its resources.

.. raw:: html

   </div>

There are two possible methods to handle non-PnP devices:

.. raw:: html

   <div class="itemizedlist">

-  Use a ``device_identify()`` method (example: ``sound/isa/es1888.c``).
   The ``device_identify()`` method probes for the hardware at known
   addresses and, if it finds a supported device, creates a new pcm
   device which is then passed to probe/attach.

-  Use a custom kernel configuration with appropriate hints for pcm
   devices (example: ``sound/isa/mss.c``).

.. raw:: html

   </div>

``pcm`` drivers should implement ``device_suspend``, ``device_resume``
and ``device_shutdown`` routines, so that power management and module
unloading function correctly.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+-------------------------------------+
| `Prev <oss-files.html>`__?   | `Up <oss.html>`__       | ?\ `Next <oss-interfaces.html>`__   |
+------------------------------+-------------------------+-------------------------------------+
| 15.2.?Files?                 | `Home <index.html>`__   | ?15.4.?Interfaces                   |
+------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
