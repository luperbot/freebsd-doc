===============================================
4.?Setting a virtual console to 80x60 line mode
===============================================

.. raw:: html

   <div class="navheader">

4.?Setting a virtual console to 80x60 line mode
`Prev <font-formats.html>`__?
?
?\ `Next <type1-fonts-x11.html>`__

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

4.?Setting a virtual console to 80x60 line mode
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, an 8x8 font must be loaded. To do this, ``/etc/rc.conf`` should
contain the line (change the font name to an appropriate one for your
locale):

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    font8x8="iso-8x8"       # font 8x8 from /usr/share/syscons/fonts/* (or NO).

.. raw:: html

   </div>

The command to actually switch the mode is
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % vidcontrol VGA_80x60

.. raw:: html

   </div>

Various screen-oriented programs, such as
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__, must
be able to determine the current screen dimensions. As this is achieved
this through ``ioctl`` calls to the console driver (such as
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4>`__)
they will correctly determine the new screen dimensions.

To make this more seamless, one can embed these commands in the startup
scripts so it takes place when the system boots. To do this is add this
line to ``/etc/rc.conf``

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    allscreens_flags="VGA_80x60"   # Set this vidcontrol mode for all virtual screens
          

.. raw:: html

   </div>

References:
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__,
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+--------------------------------------+
| `Prev <font-formats.html>`__?      | ?                       | ?\ `Next <type1-fonts-x11.html>`__   |
+------------------------------------+-------------------------+--------------------------------------+
| 3.?What font formats can I use??   | `Home <index.html>`__   | ?5.?Using type 1 fonts with X11      |
+------------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
