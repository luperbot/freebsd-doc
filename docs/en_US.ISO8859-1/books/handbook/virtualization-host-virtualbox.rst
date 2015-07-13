=======================================
22.3.?FreeBSD as a Host with VirtualBox
=======================================

.. raw:: html

   <div class="navheader">

22.3.?FreeBSD as a Host with VirtualBox
`Prev <virtualization-guest.html>`__?
Chapter?22.?Virtualization
?\ `Next <virtualization-host-bhyve.html>`__

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

22.3.?FreeBSD as a Host with VirtualBox
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

VirtualBox™ is an actively developed, complete virtualization package,
that is available for most operating systems including Windows?,
Mac?OS?, Linux? and FreeBSD. It is equally capable of running Windows?
or UNIX?-like guests. It is released as open source software, but with
closed-source components available in a separate extension pack. These
components include support for USB 2.0 devices. More information may be
found on the `“Downloads” page of the VirtualBox™
wiki <http://www.virtualbox.org/wiki/Downloads>`__. Currently, these
extensions are not available for FreeBSD.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.3.1.?Installing VirtualBox™
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

VirtualBox™ is available as a FreeBSD package or port in
`emulators/virtualbox-ose <http://www.freebsd.org/cgi/url.cgi?ports/emulators/virtualbox-ose/pkg-descr>`__.
The port can be installed using these commands:

.. code:: screen

    # cd /usr/ports/emulators/virtualbox-ose
    # make install clean

One useful option in the port's configuration menu is the
``GuestAdditions`` suite of programs. These provide a number of useful
features in guest operating systems, like mouse pointer integration
(allowing the mouse to be shared between host and guest without the need
to press a special keyboard shortcut to switch) and faster video
rendering, especially in Windows? guests. The guest additions are
available in the Devices menu, after the installation of the guest is
finished.

A few configuration changes are needed before VirtualBox™ is started for
the first time. The port installs a kernel module in ``/boot/modules``
which must be loaded into the running kernel:

.. code:: screen

    # kldload vboxdrv

To ensure the module always gets loaded after a reboot, add the
following line to ``/boot/loader.conf``:

.. code:: programlisting

    vboxdrv_load="YES"

To use the kernel modules that allow bridged or host-only networking,
add the following to ``/etc/rc.conf`` and reboot the computer:

.. code:: programlisting

    vboxnet_enable="YES"

The ``vboxusers`` group is created during installation of VirtualBox™.
All users that need access to VirtualBox™ will have to be added as
members of this group. ``pw`` can be used to add new members:

.. code:: screen

    # pw groupmod vboxusers -m yourusername

The default permissions for ``/dev/vboxnetctl`` are restrictive and need
to be changed for bridged networking:

.. code:: screen

    # chown root:vboxusers /dev/vboxnetctl
    # chmod 0660 /dev/vboxnetctl

To make this permissions change permanent, add these lines to
``/etc/devfs.conf``:

.. code:: programlisting

    own     vboxnetctl root:vboxusers
    perm    vboxnetctl 0660

To launch VirtualBox™, type from a Xorg session:

.. code:: screen

    % VirtualBox

For more information on configuring and using VirtualBox™, refer to the
`official website <http://www.virtualbox.org>`__. For FreeBSD-specific
information and troubleshooting instructions, refer to the `relevant
page in the FreeBSD wiki <http://wiki.FreeBSD.org/VirtualBox>`__.

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

22.3.2.?VirtualBox™ USB Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to be able to read and write to USB devices, users need to be
members of ``operator``:

.. code:: screen

    # pw groupmod operator -m jerry

Then, add the following to ``/etc/devfs.rules``, or create this file if
it does not exist yet:

.. code:: programlisting

    [system=10]
    add path 'usb/*' mode 0660 group operator

To load these new rules, add the following to ``/etc/rc.conf``:

.. code:: programlisting

    devfs_system_ruleset="system"

Then, restart devfs:

.. code:: screen

    # service devfs restart

USB can now be enabled in the guest operating system. USB devices should
be visible in the VirtualBox™ preferences.

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

22.3.3.?VirtualBox™ Host DVD/CD Access
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Access to the host DVD/CD drives from guests is achieved through the
sharing of the physical drives. Within VirtualBox™, this is set up from
the Storage window in the Settings of the virtual machine. If needed,
create an empty IDE CD/DVD device first. Then choose the Host Drive from
the popup menu for the virtual CD/DVD drive selection. A checkbox
labeled ``Passthrough`` will appear. This allows the virtual machine to
use the hardware directly. For example, audio CDs or the burner will
only function if this option is selected.

HAL needs to run for VirtualBox™ DVD/CD functions to work, so enable it
in ``/etc/rc.conf`` and start it if it is not already running:

.. code:: programlisting

    hald_enable="YES"

.. code:: screen

    # service hald start

In order for users to be able to use VirtualBox™ DVD/CD functions, they
need access to ``/dev/xpt0``, ``/dev/cdN``, and ``/dev/passN``. This is
usually achieved by making the user a member of ``operator``.
Permissions to these devices have to be corrected by adding these lines
to ``/etc/devfs.conf``:

.. code:: programlisting

    perm cd* 0660
    perm xpt0 0660
    perm pass* 0660

.. code:: screen

    # service devfs restart

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+--------------------------------+------------------------------------------------+
| `Prev <virtualization-guest.html>`__?   | `Up <virtualization.html>`__   | ?\ `Next <virtualization-host-bhyve.html>`__   |
+-----------------------------------------+--------------------------------+------------------------------------------------+
| 22.2.?FreeBSD as a Guest OS?            | `Home <index.html>`__          | ?22.4.?FreeBSD as a Host with bhyve            |
+-----------------------------------------+--------------------------------+------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
