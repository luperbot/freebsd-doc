=========================
6.8.?Desktop Environments
=========================

.. raw:: html

   <div class="navheader">

6.8.?Desktop Environments
`Prev <x-xdm.html>`__?
Chapter?6.?The X Window System
?\ `Next <x-compiz-fusion.html>`__

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

6.8.?Desktop Environments
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Valentino Vaschetto.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes how to install three popular desktop environments
on a FreeBSD system. A desktop environment can range from a simple
window manager to a complete suite of desktop applications. Over a
hundred desktop environments are available in the ``x11-wm`` category of
the Ports Collection.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.8.1.?GNOME
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GNOME is a user-friendly desktop environment. It includes a panel for
starting applications and displaying status, a desktop, a set of tools
and applications, and a set of conventions that make it easy for
applications to cooperate and be consistent with each other. More
information regarding GNOME on FreeBSD can be found at
http://www.FreeBSD.org/gnome. That web site contains additional
documentation about installing, configuring, and managing GNOME on
FreeBSD.

This desktop environment can be installed from a package:

.. code:: screen

    # pkg install gnome2

To instead build GNOME from ports, use the following command. GNOME is a
large application and will take some time to compile, even on a fast
computer.

.. code:: screen

    # cd /usr/ports/x11/gnome2
    # make install clean

For proper operation, GNOME requires ``/proc`` to be mounted. Add this
line to ``/etc/fstab`` to mount this file system automatically during
system startup:

.. code:: programlisting

    proc           /proc       procfs  rw  0   0

Once GNOME is installed, configure Xorg to start GNOME. The easiest way
to do this is to enable the GNOME Display Manager, GDM, which is
installed as part of the GNOME package or port. It can be enabled by
adding this line to ``/etc/rc.conf``:

.. code:: programlisting

    gdm_enable="YES"

It is often desirable to also start all GNOME services. To achieve this,
add a second line to ``/etc/rc.conf``:

.. code:: programlisting

    gnome_enable="YES"

GDM will now start automatically when the system boots.

A second method for starting GNOME is to type ``startx`` from the
command-line after configuring ``~/.xinitrc``. If this file already
exists, replace the line that starts the current window manager with one
that starts ``/usr/local/bin/gnome-session``. If this file does not
exist, create it with this command:

.. code:: screen

    % echo "exec /usr/local/bin/gnome-session" > ~/.xinitrc

A third method is to use XDM as the display manager. In this case,
create an executable ``~/.xsession``:

.. code:: screen

    % echo "#!/bin/sh" > ~/.xsession
    % echo "exec /usr/local/bin/gnome-session" >> ~/.xsession
    % chmod +x ~/.xsession

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

6.8.2.?KDE
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

KDE is another easy-to-use desktop environment. This desktop provides a
suite of applications with a consistent look and feel, a standardized
menu and toolbars, keybindings, color-schemes, internationalization, and
a centralized, dialog-driven desktop configuration. More information on
KDE can be found at http://www.kde.org/. For FreeBSD-specific
information, consult
`http://freebsd.kde.org <http://freebsd.kde.org/>`__.

To install the KDE package, type:

.. code:: screen

    # pkg install x11/kde4

To instead build the KDE port, use the following command. Installing the
port will provide a menu for selecting which components to install. KDE
is a large application and will take some time to compile, even on a
fast computer.

.. code:: screen

    # cd /usr/ports/x11/kde4
    # make install clean

KDE requires ``/proc`` to be mounted. Add this line to ``/etc/fstab`` to
mount this file system automatically during system startup:

.. code:: programlisting

    proc           /proc       procfs  rw  0   0

The installation of KDE includes the KDE Display Manager, KDM. To enable
this display manager, add this line to ``/etc/rc.conf``:

.. code:: programlisting

    kdm4_enable="YES"

A second method for launching KDE is to type ``startx`` from the command
line. For this to work, the following line is needed in ``~/.xinitrc``:

.. code:: programlisting

    exec /usr/local/bin/startkde

A third method for starting KDE is through XDM. To do so, create an
executable ``~/.xsession`` as follows:

.. code:: screen

    % echo "#!/bin/sh" > ~/.xsession
    % echo "exec /usr/local/bin/startkde" >> ~/.xsession
    % chmod +x ~/.xsession

Once KDE is started, refer to its built-in help system for more
information on how to use its various menus and applications.

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

6.8.3.?Xfce
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xfce is a desktop environment based on the GTK+ toolkit used by GNOME.
However, it is more lightweight and provides a simple, efficient,
easy-to-use desktop. It is fully configurable, has a main panel with
menus, applets, and application launchers, provides a file manager and
sound manager, and is themeable. Since it is fast, light, and efficient,
it is ideal for older or slower machines with memory limitations. More
information on Xfce can be found at
`http://www.xfce.org <http://www.xfce.org/>`__.

To install the Xfce package:

.. code:: screen

    # pkg install xfce

Alternatively, to build the port:

.. code:: screen

    # cd /usr/ports/x11-wm/xfce4
    # make install clean

Unlike GNOME or KDE, Xfce does not provide its own login manager. In
order to start Xfce from the command line by typing ``startx``, first
add its entry to ``~/.xinitrc``:

.. code:: screen

    % echo "exec /usr/local/bin/startxfce4" > ~/.xinitrc

An alternate method is to use XDM. To configure this method, create an
executable ``~/.xsession``:

.. code:: screen

    % echo "#!/bin/sh" > ~/.xsession
    % echo "exec /usr/local/bin/startxfce4" >> ~/.xsession
    % chmod +x ~/.xsession

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+--------------------------------------+
| `Prev <x-xdm.html>`__?        | `Up <x11.html>`__       | ?\ `Next <x-compiz-fusion.html>`__   |
+-------------------------------+-------------------------+--------------------------------------+
| 6.7.?The X Display Manager?   | `Home <index.html>`__   | ?6.9.?Installing Compiz Fusion       |
+-------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
