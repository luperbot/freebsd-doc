=============================================
11.2.?Configuring Linux? Binary Compatibility
=============================================

.. raw:: html

   <div class="navheader">

11.2.?Configuring Linux? Binary Compatibility
`Prev <linuxemu.html>`__?
Chapter?11.?Linux? Binary Compatibility
?\ `Next <linuxemu-advanced.html>`__

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

11.2.?Configuring Linux? Binary Compatibility
---------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default, Linux? libraries are not installed and Linux? binary
compatibility is not enabled. Linux? libraries can either be installed
manually or from the FreeBSD Ports Collection.

Before attempting to build the port, load the Linux? kernel module,
otherwise the build will fail:

.. code:: screen

    # kldload linux

To verify that the module is loaded:

.. code:: screen

    % kldstat
          Id Refs Address    Size     Name
          1    2 0xc0100000 16bdb8   kernel
          7    1 0xc24db000 d000     linux.ko

The
`emulators/linux\_base-c6 <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base-c6/pkg-descr>`__
package or port is the easiest way to install a base set of Linux?
libraries and binaries on a FreeBSD system. To install the port:

.. code:: screen

    # printf "compat.linux.osrelease=2.6.18\n" >> /etc/sysctl.conf
    # sysctl compat.linux.osrelease=2.6.18
    # pkg install emulators/linux_base-c6

For Linux? compatibility to be enabled at boot time, add this line to
``/etc/rc.conf``:

.. code:: programlisting

    linux_enable="YES"

Users who prefer to statically link Linux? binary compatibility into a
custom kernel should add ``options COMPAT_LINUX`` to their custom kernel
configuration file. Compile and install the new kernel as described in
`Chapter?9, *Configuring the FreeBSD Kernel* <kernelconfig.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.2.1.?Installing Additional Libraries Manually
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If a Linux? application complains about missing shared libraries after
configuring Linux? binary compatibility, determine which shared
libraries the Linux? binary needs and install them manually.

From a Linux? system, ``ldd`` can be used to determine which shared
libraries the application needs. For example, to check which shared
libraries ``linuxdoom`` needs, run this command from a Linux? system
that has Doom installed:

.. code:: screen

    % ldd linuxdoom
    libXt.so.3 (DLL Jump 3.1) => /usr/X11/lib/libXt.so.3.1.0
    libX11.so.3 (DLL Jump 3.1) => /usr/X11/lib/libX11.so.3.1.0
    libc.so.4 (DLL Jump 4.5pl26) => /lib/libc.so.4.6.29

Then, copy all the files in the last column of the output from the
Linux? system into ``/compat/linux`` on the FreeBSD system. Once copied,
create symbolic links to the names in the first column. This example
will result in the following files on the FreeBSD system:

.. code:: screen

    /compat/linux/usr/X11/lib/libXt.so.3.1.0
    /compat/linux/usr/X11/lib/libXt.so.3 -> libXt.so.3.1.0
    /compat/linux/usr/X11/lib/libX11.so.3.1.0
    /compat/linux/usr/X11/lib/libX11.so.3 -> libX11.so.3.1.0
    /compat/linux/lib/libc.so.4.6.29
    /compat/linux/lib/libc.so.4 -> libc.so.4.6.29

If a Linux? shared library already exists with a matching major revision
number to the first column of the ``ldd`` output, it does not need to be
copied to the file named in the last column, as the existing library
should work. It is advisable to copy the shared library if it is a newer
version, though. The old one can be removed, as long as the symbolic
link points to the new one.

For example, these libraries already exist on the FreeBSD system:

.. code:: screen

    /compat/linux/lib/libc.so.4.6.27
    /compat/linux/lib/libc.so.4 -> libc.so.4.6.27

and ``ldd`` indicates that a binary requires a later version:

.. code:: screen

    libc.so.4 (DLL Jump 4.5pl26) -> libc.so.4.6.29

Since the existing library is only one or two versions out of date in
the last digit, the program should still work with the slightly older
version. However, it is safe to replace the existing ``libc.so`` with
the newer version:

.. code:: screen

    /compat/linux/lib/libc.so.4.6.29
    /compat/linux/lib/libc.so.4 -> libc.so.4.6.29

Generally, one will need to look for the shared libraries that Linux?
binaries depend on only the first few times that a Linux? program is
installed on FreeBSD. After a while, there will be a sufficient set of
Linux? shared libraries on the system to be able to run newly installed
Linux? binaries without any extra work.

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

11.2.2.?Installing Linux? ELF Binaries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ELF binaries sometimes require an extra step. When an unbranded ELF
binary is executed, it will generate an error message:

.. code:: screen

    % ./my-linux-elf-binary
    ELF binary type not known
    Abort

To help the FreeBSD kernel distinguish between a FreeBSD ELF binary and
a Linux? binary, use
`brandelf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=brandelf&sektion=1>`__:

.. code:: screen

    % brandelf -t Linux my-linux-elf-binary

Since the GNU toolchain places the appropriate branding information into
ELF binaries automatically, this step is usually not necessary.

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

11.2.3.?Installing a Linux? RPM Based Application
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to install a Linux? RPM-based application, first install the
`archivers/rpm <http://www.freebsd.org/cgi/url.cgi?ports/archivers/rpm/pkg-descr>`__
package or port. Once installed, ``root`` can use this command to
install a ``.rpm``:

.. code:: screen

    # cd /compat/linux
    # rpm2cpio < /path/to/linux.archive.rpm | cpio -id

If necessary, ``brandelf`` the installed ELF binaries. Note that this
will prevent a clean uninstall.

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

11.2.4.?Configuring the Hostname Resolver
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If DNS does not work or this error appears:

.. code:: screen

    resolv+: "bind" is an invalid keyword resolv+:
    "hosts" is an invalid keyword

configure ``/compat/linux/etc/host.conf`` as follows:

.. code:: programlisting

    order hosts, bind
    multi on

This specifies that ``/etc/hosts`` is searched first and DNS is searched
second. When ``/compat/linux/etc/host.conf`` does not exist, Linux?
applications use ``/etc/host.conf`` and complain about the incompatible
FreeBSD syntax. Remove ``bind`` if a name server is not configured using
``/etc/resolv.conf``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+--------------------------+----------------------------------------+
| `Prev <linuxemu.html>`__?                  | `Up <linuxemu.html>`__   | ?\ `Next <linuxemu-advanced.html>`__   |
+--------------------------------------------+--------------------------+----------------------------------------+
| Chapter?11.?Linux? Binary Compatibility?   | `Home <index.html>`__    | ?11.3.?Advanced Topics                 |
+--------------------------------------------+--------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
