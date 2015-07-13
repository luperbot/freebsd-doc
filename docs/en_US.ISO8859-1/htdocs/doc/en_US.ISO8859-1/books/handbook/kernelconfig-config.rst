===========================
9.4.?The Configuration File
===========================

.. raw:: html

   <div class="navheader">

9.4.?The Configuration File
`Prev <kernelconfig-devices.html>`__?
Chapter?9.?Configuring the FreeBSD Kernel
?\ `Next <kernelconfig-building.html>`__

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

9.4.?The Configuration File
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In order to create a custom kernel configuration file and build a custom
kernel, the full FreeBSD source tree must first be installed.

If ``/usr/src/`` does not exist or it is empty, source has not been
installed. Source can be installed using Subversion and the instructions
in `Section?A.4, “Using Subversion” <svn.html>`__.

Once source is installed, review the contents of ``/usr/src/sys``. This
directory contains a number of subdirectories, including those which
represent the following supported architectures: ``amd64``, ``i386``,
``ia64``, ``pc98``, ``powerpc``, and ``sparc64``. Everything inside a
particular architecture's directory deals with that architecture only
and the rest of the code is machine independent code common to all
platforms. Each supported architecture has a ``conf`` subdirectory which
contains the ``GENERIC`` kernel configuration file for that
architecture.

Do not make edits to ``GENERIC``. Instead, copy the file to a different
name and make edits to the copy. The convention is to use a name with
all capital letters. When maintaining multiple FreeBSD machines with
different hardware, it is a good idea to name it after the machine's
hostname. This example creates a copy, named ``MYKERNEL``, of the
``GENERIC`` configuration file for the ``amd64`` architecture:

.. code:: screen

    # cd /usr/src/sys/amd64/conf
    # cp GENERIC MYKERNEL

``MYKERNEL`` can now be customized with any ASCII text editor. The
default editor is vi, though an easier editor for beginners, called ee,
is also installed with FreeBSD.

The format of the kernel configuration file is simple. Each line
contains a keyword that represents a device or subsystem, an argument,
and a brief description. Any text after a ``#`` is considered a comment
and ignored. To remove kernel support for a device or subsystem, put a
``#`` at the beginning of the line representing that device or
subsystem. Do not add or remove a ``#`` for any line that you do not
understand.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

It is easy to remove support for a device or option and end up with a
broken kernel. For example, if the
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4>`__
driver is removed from the kernel configuration file, a system using ATA
disk drivers may not boot. When in doubt, just leave support in the
kernel.

.. raw:: html

   </div>

In addition to the brief descriptions provided in this file, additional
descriptions are contained in ``NOTES``, which can be found in the same
directory as ``GENERIC`` for that architecture. For architecture
independent options, refer to ``/usr/src/sys/conf/NOTES``.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

When finished customizing the kernel configuration file, save a backup
copy to a location outside of ``/usr/src``.

Alternately, keep the kernel configuration file elsewhere and create a
symbolic link to the file:

.. code:: screen

    # cd /usr/src/sys/amd64/conf
    # mkdir /root/kernels
    # cp GENERIC /root/kernels/MYKERNEL
    # ln -s /root/kernels/MYKERNEL

.. raw:: html

   </div>

An ``include`` directive is available for use in configuration files.
This allows another configuration file to be included in the current
one, making it easy to maintain small changes relative to an existing
file. If only a small number of additional options or drivers are
required, this allows a delta to be maintained with respect to
``GENERIC``, as seen in this example:

.. code:: programlisting

    include GENERIC
    ident MYKERNEL

    options         IPFIREWALL
    options         DUMMYNET
    options         IPFIREWALL_DEFAULT_TO_ACCEPT
    options         IPDIVERT

Using this method, the local configuration file expresses local
differences from a ``GENERIC`` kernel. As upgrades are performed, new
features added to ``GENERIC`` will also be added to the local kernel
unless they are specifically prevented using ``nooptions`` or
``nodevice``. A comprehensive list of configuration directives and their
descriptions may be found in
`config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=5>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

To build a file which contains all available options, run the following
command as ``root``:

.. code:: screen

    # cd /usr/src/sys/arch/conf && make LINT

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+------------------------------+-------------------------------------------------+
| `Prev <kernelconfig-devices.html>`__?   | `Up <kernelconfig.html>`__   | ?\ `Next <kernelconfig-building.html>`__        |
+-----------------------------------------+------------------------------+-------------------------------------------------+
| 9.3.?Finding the System Hardware?       | `Home <index.html>`__        | ?9.5.?Building and Installing a Custom Kernel   |
+-----------------------------------------+------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
