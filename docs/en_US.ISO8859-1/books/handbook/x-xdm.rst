==========================
6.7.?The X Display Manager
==========================

.. raw:: html

   <div class="navheader">

6.7.?The X Display Manager
`Prev <x-fonts.html>`__?
Chapter?6.?The X Window System
?\ `Next <x11-wm.html>`__

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

6.7.?The X Display Manager
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Seth Kingsley.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xorg provides an X Display Manager, XDM, which can be used for login
session management. XDM provides a graphical interface for choosing
which display server to connect to and for entering authorization
information such as a login and password combination.

This section demonstrates how to configure the X Display Manager on
FreeBSD. Some desktop environments provide their own graphical login
manager. Refer to `Section?6.8.1, “GNOME” <x11-wm.html#x11-wm-gnome>`__
for instructions on how to configure the GNOME Display Manager and
`Section?6.8.2, “KDE” <x11-wm.html#x11-wm-kde>`__ for instructions on
how to configure the KDE Display Manager.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.1.?Configuring XDM
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To install XDM, use the
`x11/xdm <http://www.freebsd.org/cgi/url.cgi?ports/x11/xdm/pkg-descr>`__
package or port. Once installed, XDM can be configured to run when the
machine boots up by editing this entry in ``/etc/ttys``:

.. code:: screen

    ttyv8   "/usr/local/bin/xdm -nodaemon"  xterm   off secure

Change the ``off`` to ``on`` and save the edit. The ``ttyv8`` in this
entry indicates that XDM will run on the ninth virtual terminal.

The XDM configuration directory is located in
``/usr/local/lib/X11/xdm``. This directory contains several files used
to change the behavior and appearance of XDM, as well as a few scripts
and programs used to set up the desktop when XDM is running. `Table?6.1,
“XDM Configuration Files” <x-xdm.html#xdm-config-files>`__ summarizes
the function of each of these files. The exact syntax and usage of these
files is described in
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.1.?XDM Configuration Files

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| File              | Description                                                                                                                                                                                                                                                                                                                                                              |
+===================+==========================================================================================================================================================================================================================================================================================================================================================================+
| ``Xaccess``       | The protocol for connecting to XDM is called the X Display Manager Connection Protocol (XDMCP) This file is a client authorization ruleset for controlling XDMCP connections from remote machines. By default, this file does not allow any remote clients to connect.                                                                                                   |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Xresources``    | This file controls the look and feel of the XDM display chooser and login screens. The default configuration is a simple rectangular login window with the hostname of the machine displayed at the top in a large font and “Login:” and “Password:” prompts below. The format of this file is identical to the app-defaults file described in the Xorg documentation.   |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Xservers``      | The list of local and remote displays the chooser should provide as login choices.                                                                                                                                                                                                                                                                                       |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Xsession``      | Default session script for logins which is run by XDM after a user has logged in. Normally each user will have a customized session script in ``~/.xsession`` that overrides this script                                                                                                                                                                                 |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``Xsetup_``\ \*   | Script to automatically launch applications before displaying the chooser or login interfaces. There is a script for each display being used, named ``Xsetup_*``, where ``*`` is the local display number. Typically these scripts run one or two programs in the background such as ``xconsole``.                                                                       |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``xdm-config``    | Global configuration for all displays running on this machine.                                                                                                                                                                                                                                                                                                           |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``xdm-errors``    | Contains errors generated by the server program. If a display that XDM is trying to start hangs, look at this file for error messages. These messages are also written to the user's ``~/.xsession-errors`` on a per-session basis.                                                                                                                                      |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``xdm-pid``       | The running process ID of XDM.                                                                                                                                                                                                                                                                                                                                           |
+-------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

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

6.7.2.?Configuring Remote Access
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, only users on the same system can login using XDM. To enable
users on other systems to connect to the display server, edit the access
control rules and enable the connection listener.

To configure XDM to listen for any remote connection, comment out the
``DisplayManager.requestPort`` line in
``/usr/local/lib/X11/xdm/xdm-config`` by putting a ``!`` in front of it:

.. code:: screen

    ! SECURITY: do not listen for XDMCP or Chooser requests
    ! Comment out this line if you want to manage X terminals with xdm
    DisplayManager.requestPort:     0

Save the edits and restart XDM. To restrict remote access, look at the
example entries in ``/usr/local/lib/X11/xdm/Xaccess`` and refer to
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__ for
further information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+------------------------------+
| `Prev <x-fonts.html>`__?    | `Up <x11.html>`__       | ?\ `Next <x11-wm.html>`__    |
+-----------------------------+-------------------------+------------------------------+
| 6.6.?Using Fonts in Xorg?   | `Home <index.html>`__   | ?6.8.?Desktop Environments   |
+-----------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
