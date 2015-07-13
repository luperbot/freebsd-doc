===========
8.6.?MythTV
===========

.. raw:: html

   <div class="navheader">

8.6.?MythTV
`Prev <tvcard.html>`__?
Chapter?8.?Multimedia
?\ `Next <scanners.html>`__

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

8.6.?MythTV
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MythTV is a popular, open source Personal Video Recorder (PVR)
application. This section demonstrates how to install and setup MythTV
on FreeBSD. Refer to `mythtv.org/wiki <http://www.mythtv.org/wiki/>`__
for more information on how to use MythTV.

MythTV requires a frontend and a backend. These components can either be
installed on the same system or on different machines.

The frontend can be installed on FreeBSD using the
`multimedia/mythtv-frontend <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/mythtv-frontend/pkg-descr>`__
package or port. Xorg must also be installed and configured as described
in `Chapter?6, *The X Window System* <x11.html>`__. Ideally, this system
has a video card that supports X-Video Motion Compensation (XvMC) and,
optionally, a Linux Infrared Remote Control (LIRC)-compatible remote.

To install both the backend and the frontend on FreeBSD, use the
`multimedia/mythtv <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/mythtv/pkg-descr>`__
package or port. A MySQL™ database server is also required and should
automatically be installed as a dependency. Optionally, this system
should have a tuner card and sufficient storage to hold recorded data.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.6.1.?Hardware
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MythTV uses Video for Linux (V4L) to access video input devices such as
encoders and tuners. In FreeBSD, MythTV works best with USB DVB-S/C/T
cards as they are well supported by the
`multimedia/webcamd <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/webcamd/pkg-descr>`__
package or port which provides a V4L userland application. Any Digital
Video Broadcasting (DVB) card supported by webcamd should work with
MythTV. A list of known working cards can be found at
`wiki.freebsd.org/WebcamCompat <http://wiki.freebsd.org/WebcamCompat>`__.
Drivers are also available for Hauppauge cards in the
`multimedia/pvr250 <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/pvr250/pkg-descr>`__
and
`multimedia/pvrxxx <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/pvrxxx/pkg-descr>`__
ports, but they provide a non-standard driver interface that does not
work with versions of MythTV greater than 0.23. Due to licensing
restrictions, no packages are available and these two ports must be
compiled.

The `wiki.freebsd.org/HTPC <http://wiki.freebsd.org/HTPC>`__ page
contains a list of all available DVB drivers.

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

8.6.2.?Setting up the MythTV Backend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To install MythTV using the port:

.. code:: screen

    # cd /usr/ports/multimedia/mythtv
    # make install

Once installed, set up the MythTV database:

.. code:: screen

    # mysql -uroot -p < /usr/local/share/mythtv/database/mc.sql

Then, configure the backend:

.. code:: screen

    # mythtv-setup

Finally, start the backend:

.. code:: screen

    # echo 'mythbackend_enable="YES"' >> /etc/rc.conf
    # service mythbackend start

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+----------------------------+-------------------------------+
| `Prev <tvcard.html>`__?   | `Up <multimedia.html>`__   | ?\ `Next <scanners.html>`__   |
+---------------------------+----------------------------+-------------------------------+
| 8.5.?TV Cards?            | `Home <index.html>`__      | ?8.7.?Image Scanners          |
+---------------------------+----------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
