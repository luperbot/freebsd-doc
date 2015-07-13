=====================
2.5.?Using bsdinstall
=====================

.. raw:: html

   <div class="navheader">

2.5.?Using bsdinstall
`Prev <bsdinstall-start.html>`__?
Chapter?2.?Installing FreeBSD?9.\ *``X``* and Later
?\ `Next <bsdinstall-partitioning.html>`__

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

2.5.?Using bsdinstall
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section shows the order of the bsdinstall menus and the type of
information that will be asked before the system is installed. Use the
arrow keys to highlight a menu option, then **Space** to select or
deselect that menu item. When finished, press **Enter** to save the
selection and move onto the next screen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.5.1.?Selecting the Keymap Menu
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Depending on the system console being used, bsdinstall may initially
display the menu shown in `Figure?2.4, “Keymap
Selection” <using-bsdinstall.html#bsdinstall-keymap-select-default>`__.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.4.?Keymap Selection

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Keymap Selection|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To configure the keyboard layout, press **Enter** with [?YES?] selected,
which will display the menu shown in `Figure?2.5, “Selecting Keyboard
Menu” <using-bsdinstall.html#bsdinstall-config-keymap>`__. To instead
use the default layout, use the arrow key to select [?NO?] and press
**Enter** to skip this menu screen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.5.?Selecting Keyboard Menu

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Selecting Keyboard Menu|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When configuring the keyboard layout, use the up and down arrows to
select the keymap that most closely represents the mapping of the
keyboard attached to the system. Press **Enter** to save the selection.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Pressing **Esc** will exit this menu and use the default keymap. If the
choice of keymap is not clear, United States of America ISO-8859-1 is
also a safe option.

.. raw:: html

   </div>

In FreeBSD 10.0-RELEASE and later, this menu has been enhanced. The full
selection of keymaps is shown, with the default preselected. In
addition, when selecting a different keymap, a dialog is displayed that
allows the user to try the keymap and ensure it is correct before
proceeding.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.6.?Enhanced Keymap Menu

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Enhanced Keymap Menu|

.. raw:: html

   </div>

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

2.5.2.?Setting the Hostname
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The next bsdinstall menu is used to set the hostname for the newly
installed system.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.7.?Setting the Hostname

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Setting the Hostname|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Type in a hostname that is unique for the network. It should be a
fully-qualified hostname, such as ``machine3.example.com``.

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

2.5.3.?Selecting Components to Install
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Next, bsdinstall will prompt to select optional components to install.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.8.?Selecting Components to Install

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Selecting Components to Install|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Deciding which components to install will depend largely on the intended
use of the system and the amount of disk space available. The FreeBSD
kernel and userland, collectively known as the *base system*, are always
installed. Depending on the architecture, some of these components may
not appear:

.. raw:: html

   <div class="itemizedlist">

-  ``doc`` - Additional documentation, mostly of historical interest, to
   install into ``/usr/share/doc``. The documentation provided by the
   FreeBSD Documentation Project may be installed later using the
   instructions in `Section?24.3, “Updating the Documentation
   Set” <updating-upgrading-documentation.html>`__.

-  ``games`` - Several traditional BSD games, including fortune, rot13,
   and others.

-  ``lib32`` - Compatibility libraries for running 32-bit applications
   on a 64-bit version of FreeBSD.

-  ``ports`` - The FreeBSD Ports Collection is a collection of files
   which automates the downloading, compiling and installation of
   third-party software packages. `Chapter?5, *Installing Applications:
   Packages and Ports* <ports.html>`__ discusses how to use the Ports
   Collection.

   .. raw:: html

      <div class="warning" xmlns="">

   Warning:
   ~~~~~~~~

   The installation program does not check for adequate disk space.
   Select this option only if sufficient hard disk space is available.
   The FreeBSD Ports Collection takes up about 500?MB of disk space.

   .. raw:: html

      </div>

-  ``src`` - The complete FreeBSD source code for both the kernel and
   the userland. Although not required for the majority of applications,
   it may be required to build device drivers, kernel modules, or some
   applications from the Ports Collection. It is also used for
   developing FreeBSD itself. The full source tree requires 1?GB of disk
   space and recompiling the entire FreeBSD system requires an
   additional 5?GB of space.

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

2.5.4.?Installing from the Network
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The menu shown in `Figure?2.9, “Installing from the
Network” <using-bsdinstall.html#bsdinstall-netinstall-notify>`__ only
appears when installing from a ``-bootonly.iso`` CD as this installation
media does not hold copies of the installation files. Since the
installation files must be retrieved over a network connection, this
menu indicates that the network interface must be first configured.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.9.?Installing from the Network

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Installing from the Network|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To configure the network connection, press **Enter** and follow the
instructions in `Section?2.8.2, “Configuring Network
Interfaces” <bsdinstall-post.html#bsdinstall-config-network-dev>`__.
Once the interface is configured, select a mirror site that is located
in the same region of the world as the computer on which FreeBSD is
being installed. Files can be retrieved more quickly when the mirror is
close to the target computer, reducing installation time.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?2.10.?Choosing a Mirror

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Choosing a Mirror|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Installation will then continue as if the installation files were
located on the local installation media.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------+----------------------------------------------+
| `Prev <bsdinstall-start.html>`__?   | `Up <bsdinstall.html>`__   | ?\ `Next <bsdinstall-partitioning.html>`__   |
+-------------------------------------+----------------------------+----------------------------------------------+
| 2.4.?Starting the Installation?     | `Home <index.html>`__      | ?2.6.?Allocating Disk Space                  |
+-------------------------------------+----------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |Keymap Selection| image:: bsdinstall/bsdinstall-keymap-select-default.png
.. |Selecting Keyboard Menu| image:: bsdinstall/bsdinstall-config-keymap.png
.. |Enhanced Keymap Menu| image:: bsdinstall/bsdinstall-keymap-10.png
.. |Setting the Hostname| image:: bsdinstall/bsdinstall-config-hostname.png
.. |Selecting Components to Install| image:: bsdinstall/bsdinstall-config-components.png
.. |Installing from the Network| image:: bsdinstall/bsdinstall-netinstall-files.png
.. |Choosing a Mirror| image:: bsdinstall/bsdinstall-netinstall-mirrorselect.png
