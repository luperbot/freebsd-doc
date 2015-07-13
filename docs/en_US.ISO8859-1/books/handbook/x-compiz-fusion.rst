=============================
6.9.?Installing Compiz Fusion
=============================

.. raw:: html

   <div class="navheader">

6.9.?Installing Compiz Fusion
`Prev <x11-wm.html>`__?
Chapter?6.?The X Window System
?\ `Next <x11-understanding.html>`__

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

6.9.?Installing Compiz Fusion
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One way to increase the pleasantness of using a desktop computer is by
having nice 3D effects.

Installing the Compiz?Fusion package is easy, but configuring it
requires a few steps that are not described in the port's documentation.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.9.1.?Setting up the FreeBSD nVidia Driver
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Desktop effects can cause quite a load on the graphics card. For an
nVidia-based graphics card, the proprietary driver is required for good
performance. Users of other graphics cards can skip this section and
continue with the ``xorg.conf`` configuration.

To determine which nVidia driver is needed see the `FAQ question on the
subject <../../../../doc/en_US.ISO8859-1/books/faq/x.html#idp59950544>`__.

Having determined the correct driver to use for your card, installation
is as simple as installing any other package.

For example, to install the latest driver:

.. code:: screen

    # pkg install x11/nvidia-driver

The driver will create a kernel module, which needs to be loaded at
system startup. Add the following line to ``/boot/loader.conf``:

.. code:: programlisting

    nvidia_load="YES"

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

To immediately load the kernel module into the running kernel by issuing
a command like ``kldload         nvidia``, however it has been noted
that the some versions of Xorg will not function properly if the driver
is not loaded at boot time. After editing ``/boot/loader.conf``, a
reboot is recommended.

.. raw:: html

   </div>

With the kernel module loaded, you normally only need to change a single
line in ``xorg.conf`` to enable the proprietary driver:

Find the following line in ``/etc/X11/xorg.conf``:

.. code:: programlisting

    Driver      "nv"

and change it to:

.. code:: programlisting

    Driver      "nvidia"

Start the GUI as usual, and you should be greeted by the nVidia splash.
Everything should work as usual.

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

6.9.2.?Configuring xorg.conf for Desktop Effects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To enable Compiz?Fusion, ``/etc/X11/xorg.conf`` needs to be modified:

Add the following section to enable composite effects:

.. code:: programlisting

    Section "Extensions"
        Option         "Composite" "Enable"
        EndSection

Locate the “Screen” section which should look similar to the one below:

.. code:: programlisting

    Section "Screen"
        Identifier     "Screen0"
        Device         "Card0"
        Monitor        "Monitor0"
        ...

and add the following two lines (after “Monitor” will do):

.. code:: programlisting

    DefaultDepth    24
        Option         "AddARGBGLXVisuals" "True"

Locate the “Subsection” that refers to the screen resolution that you
wish to use. For example, if you wish to use 1280x1024, locate the
section that follows. If the desired resolution does not appear in any
subsection, you may add the relevant entry by hand:

.. code:: programlisting

    SubSection     "Display"
        Viewport    0 0
        Modes      "1280x1024"
        EndSubSection

A color depth of 24?bits is needed for desktop composition, change the
above subsection to:

.. code:: programlisting

    SubSection     "Display"
        Viewport    0 0
        Depth       24
        Modes      "1280x1024"
        EndSubSection

Finally, confirm that the “glx” and “extmod” modules are loaded in the
“Module” section:

.. code:: programlisting

    Section "Module"
        Load           "extmod"
        Load           "glx"
        ...

The preceding can be done automatically with
`x11/nvidia-xconfig <http://www.freebsd.org/cgi/url.cgi?ports/x11/nvidia-xconfig/pkg-descr>`__
by running (as root):

.. code:: screen

    # nvidia-xconfig --add-argb-glx-visuals
        # nvidia-xconfig --composite
        # nvidia-xconfig --depth=24

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

6.9.3.?Installing and Configuring Compiz?Fusion
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Installing Compiz?Fusion is as simple as any other package:

.. code:: screen

    # pkg install x11-wm/compiz-fusion

When the installation is finished, start your graphic desktop and at a
terminal, enter the following commands (as a normal user):

.. code:: screen

    % compiz --replace --sm-disable --ignore-desktop-hints ccp &
        % emerald --replace &

Your screen will flicker for a few seconds, as your window manager (e.g.
Metacity if you are using GNOME) is replaced by Compiz?Fusion. Emerald
takes care of the window decorations (i.e. close, minimize, maximize
buttons, title bars and so on).

You may convert this to a trivial script and have it run at startup
automatically (e.g. by adding to “Sessions” in a GNOME desktop):

.. code:: programlisting

    #! /bin/sh
        compiz --replace --sm-disable --ignore-desktop-hints ccp &
        emerald --replace &

Save this in your home directory as, for example, ``start-compiz`` and
make it executable:

.. code:: screen

    % chmod +x ~/start-compiz

Then use the GUI to add it to Startup Programs (located in System,
Preferences, Sessions on a GNOME desktop).

To actually select all the desired effects and their settings, execute
(again as a normal user) the Compiz?Config?Settings?Manager:

.. code:: screen

    % ccsm

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In GNOME, this can also be found in the System, Preferences menu.

.. raw:: html

   </div>

If you have selected “gconf support” during the build, you will also be
able to view these settings using ``gconf-editor`` under
``apps/compiz``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+----------------------------------------+
| `Prev <x11-wm.html>`__?      | `Up <x11.html>`__       | ?\ `Next <x11-understanding.html>`__   |
+------------------------------+-------------------------+----------------------------------------+
| 6.8.?Desktop Environments?   | `Home <index.html>`__   | ?6.10.?Troubleshooting                 |
+------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
