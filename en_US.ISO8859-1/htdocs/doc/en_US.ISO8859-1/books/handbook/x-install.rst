====================
6.3.?Installing Xorg
====================

.. raw:: html

   <div class="navheader">

6.3.?Installing Xorg
`Prev <x-understanding.html>`__?
Chapter?6.?The X Window System
?\ `Next <x-config-quick-start.html>`__

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

6.3.?Installing Xorg
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xorg is the implementation of the open source X Window System released
by the X.Org Foundation. In FreeBSD, it can be installed as a package or
port. The meta-port for the complete distribution which includes X
servers, clients, libraries, and fonts is located in
`x11/xorg <http://www.freebsd.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__.
A minimal distribution is located in
`x11/xorg-minimal <http://www.freebsd.org/cgi/url.cgi?ports/x11/xorg-minimal/pkg-descr>`__,
with separate ports available for docs, libraries, and apps. The
examples in this section install the complete Xorg distribution.

To build and install Xorg from the Ports Collection:

.. code:: screen

    # cd /usr/ports/x11/xorg
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

To build Xorg in its entirety, be sure to have at least 4?GB of free
disk space available.

.. raw:: html

   </div>

Alternatively, Xorg can be installed directly from packages with this
command:

.. code:: screen

    # pkg install xorg

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+-------------------------------------------+
| `Prev <x-understanding.html>`__?   | `Up <x11.html>`__       | ?\ `Next <x-config-quick-start.html>`__   |
+------------------------------------+-------------------------+-------------------------------------------+
| 6.2.?Terminology?                  | `Home <index.html>`__   | ?6.4.?Quick Start                         |
+------------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
