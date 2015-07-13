===================================
4.2.?Virtual Consoles and Terminals
===================================

.. raw:: html

   <div class="navheader">

4.2.?Virtual Consoles and Terminals
`Prev <basics.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <users-synopsis.html>`__

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

4.2.?Virtual Consoles and Terminals
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unless FreeBSD has been configured to automatically start a graphical
environment during startup, the system will boot into a command line
login prompt, as seen in this example:

.. code:: screen

    FreeBSD/amd64 (pc3.example.org) (ttyv0)

    login:

The first line contains some information about the system. The ``amd64``
indicates that the system in this example is running a 64-bit version of
FreeBSD. The hostname is ``pc3.example.org``, and ``ttyv0`` indicates
that this is the “system console”. The second line is the login prompt.

Since FreeBSD is a multiuser system, it needs some way to distinguish
between different users. This is accomplished by requiring every user to
log into the system before gaining access to the programs on the system.
Every user has a unique name “username” and a personal “password”.

To log into the system console, type the username that was configured
during system installation, as described in `Section?2.8.6, “Add
Users” <bsdinstall-post.html#bsdinstall-addusers>`__, and press
**Enter**. Then enter the password associated with the username and
press **Enter**. The password is *not echoed* for security reasons.

Once the correct password is input, the message of the day (MOTD) will
be displayed followed by a command prompt. Depending upon the shell that
was selected when the user was created, this prompt will be a ``#``,
``$``, or ``%`` character. The prompt indicates that the user is now
logged into the FreeBSD system console and ready to try the available
commands.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.1.?Virtual Consoles
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While the system console can be used to interact with the system, a user
working from the command line at the keyboard of a FreeBSD system will
typically instead log into a virtual console. This is because system
messages are configured by default to display on the system console.
These messages will appear over the command or file that the user is
working on, making it difficult to concentrate on the work at hand.

By default, FreeBSD is configured to provide several virtual consoles
for inputting commands. Each virtual console has its own login prompt
and shell and it is easy to switch between virtual consoles. This
essentially provides the command line equivalent of having several
windows open at the same time in a graphical environment.

The key combinations **Alt**+**F1** through **Alt**+**F8** have been
reserved by FreeBSD for switching between virtual consoles. Use
**Alt**+**F1** to switch to the system console (``ttyv0``),
**Alt**+**F2** to access the first virtual console (``ttyv1``),
**Alt**+**F3** to access the second virtual console (``ttyv2``), and so
on.

When switching from one console to the next, FreeBSD manages the screen
output. The result is an illusion of having multiple virtual screens and
keyboards that can be used to type commands for FreeBSD to run. The
programs that are launched in one virtual console do not stop running
when the user switches to a different virtual console.

Refer to
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4>`__,
`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4>`__,
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__
and
`kbdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdcontrol&sektion=1>`__
for a more technical description of the FreeBSD console and its keyboard
drivers.

In FreeBSD, the number of available virtual consoles is configured in
this section of ``/etc/ttys``:

.. code:: programlisting

    # name    getty                         type  status comments
    #
    ttyv0   "/usr/libexec/getty Pc"         xterm   on  secure
    # Virtual terminals
    ttyv1   "/usr/libexec/getty Pc"         xterm   on  secure
    ttyv2   "/usr/libexec/getty Pc"         xterm   on  secure
    ttyv3   "/usr/libexec/getty Pc"         xterm   on  secure
    ttyv4   "/usr/libexec/getty Pc"         xterm   on  secure
    ttyv5   "/usr/libexec/getty Pc"         xterm   on  secure
    ttyv6   "/usr/libexec/getty Pc"         xterm   on  secure
    ttyv7   "/usr/libexec/getty Pc"         xterm   on  secure
    ttyv8   "/usr/X11R6/bin/xdm -nodaemon"  xterm   off secure

To disable a virtual console, put a comment symbol (``#``) at the
beginning of the line representing that virtual console. For example, to
reduce the number of available virtual consoles from eight to four, put
a ``#`` in front of the last four lines representing virtual consoles
``ttyv5`` through ``ttyv8``. *Do not* comment out the line for the
system console ``ttyv0``. Note that the last virtual console (``ttyv8``)
is used to access the graphical environment if Xorg has been installed
and configured as described in `Chapter?6, *The X Window
System* <x11.html>`__.

For a detailed description of every column in this file and the
available options for the virtual consoles, refer to
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5>`__.

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

4.2.2.?Single User Mode
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD boot menu provides an option labelled as “Boot Single User”.
If this option is selected, the system will boot into a special mode
known as “single user mode”. This mode is typically used to repair a
system that will not boot or to reset the ``root`` password when it is
not known. While in single user mode, networking and other virtual
consoles are not available. However, full ``root`` access to the system
is available, and by default, the ``root`` password is not needed. For
these reasons, physical access to the keyboard is needed to boot into
this mode and determining who has physical access to the keyboard is
something to consider when securing a FreeBSD system.

The settings which control single user mode are found in this section of
``/etc/ttys``:

.. code:: programlisting

    # name  getty                           type  status  comments
    #
    # If console is marked "insecure", then init will ask for the root password
    # when going to single-user mode.
    console none                            unknown  off  secure

By default, the status is set to ``secure``. This assumes that who has
physical access to the keyboard is either not important or it is
controlled by a physical security policy. If this setting is changed to
``insecure``, the assumption is that the environment itself is insecure
because anyone can access the keyboard. When this line is changed to
``insecure``, FreeBSD will prompt for the ``root`` password when a user
selects to boot into single user mode.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

*Be careful when changing this setting to ``insecure``*! If the ``root``
password is forgotten, booting into single user mode is still possible,
but may be difficult for someone who is not familiar with the FreeBSD
booting process.

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

4.2.3.?Changing Console Video Modes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD console default video mode may be adjusted to 1024x768,
1280x1024, or any other size supported by the graphics chip and monitor.
To use a different video mode load the ``VESA`` module:

.. code:: screen

    # kldload vesa

To determine which video modes are supported by the hardware, use
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__.
To get a list of supported video modes issue the following:

.. code:: screen

    # vidcontrol -i mode

The output of this command lists the video modes that are supported by
the hardware. To select a new video mode, specify the mode using
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__
as the ``root`` user:

.. code:: screen

    # vidcontrol MODE_279

If the new video mode is acceptable, it can be permanently set on boot
by adding it to ``/etc/rc.conf``:

.. code:: programlisting

    allscreens_flags="MODE_279"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+--------------------------------------------+
| `Prev <basics.html>`__?   | `Up <basics.html>`__    | ?\ `Next <users-synopsis.html>`__          |
+---------------------------+-------------------------+--------------------------------------------+
| Chapter?4.?UNIX Basics?   | `Home <index.html>`__   | ?4.3.?Users and Basic Account Management   |
+---------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
