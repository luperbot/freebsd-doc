==================================
12.4.?Managing Services in FreeBSD
==================================

.. raw:: html

   <div class="navheader">

12.4.?Managing Services in FreeBSD
`Prev <configtuning-cron.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <config-network-setup.html>`__

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

12.4.?Managing Services in FreeBSD
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD uses the
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ system
of startup scripts during system initialization and for managing
services. The scripts listed in ``/etc/rc.d`` provide basic services
which can be controlled with the ``start``, ``stop``, and ``restart``
options to
`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8>`__.
For instance,
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
can be restarted with the following command:

.. code:: screen

    # service sshd restart

This procedure can be used to start services on a running system.
Services will be started automatically at boot time as specified in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.
For example, to enable
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ at
system startup, add the following line to ``/etc/rc.conf``:

.. code:: programlisting

    natd_enable="YES"

If a ``natd_enable="NO"`` line is already present, change the ``NO`` to
``YES``. The
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
scripts will automatically load any dependent services during the next
boot, as described below.

Since the
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ system
is primarily intended to start and stop services at system startup and
shutdown time, the ``start``, ``stop`` and ``restart`` options will only
perform their action if the appropriate ``/etc/rc.conf`` variable is
set. For instance, ``sshd restart`` will only work if ``sshd_enable`` is
set to ``YES`` in ``/etc/rc.conf``. To ``start``, ``stop`` or
``restart`` a service regardless of the settings in ``/etc/rc.conf``,
these commands should be prefixed with “one”. For instance, to restart
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
regardless of the current ``/etc/rc.conf`` setting, execute the
following command:

.. code:: screen

    # service sshd onerestart

To check if a service is enabled in ``/etc/rc.conf``, run the
appropriate
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ script
with ``rcvar``. This example checks to see if
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__ is
enabled in ``/etc/rc.conf``:

.. code:: screen

    # service sshd rcvar
    # sshd
    #
    sshd_enable="YES"
    #   (default: "")

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The ``# sshd`` line is output from the above command, not a ``root``
console.

.. raw:: html

   </div>

To determine whether or not a service is running, use ``status``. For
instance, to verify that
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__ is
running:

.. code:: screen

    # service sshd status
    sshd is running as pid 433.

In some cases, it is also possible to ``reload`` a service. This
attempts to send a signal to an individual service, forcing the service
to reload its configuration files. In most cases, this means sending the
service a ``SIGHUP`` signal. Support for this feature is not included
for every service.

The `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
system is used for network services and it also contributes to most of
the system initialization. For instance, when the ``/etc/rc.d/bgfsck``
script is executed, it prints out the following message:

.. code:: screen

    Starting background file system checks in 60 seconds.

This script is used for background file system checks, which occur only
during system initialization.

Many system services depend on other services to function properly. For
example,
`yp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=yp&sektion=8>`__ and
other RPC-based services may fail to start until after the
`rpcbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcbind&sektion=8>`__
service has started. To resolve this issue, information about
dependencies and other meta-data is included in the comments at the top
of each startup script. The
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
program is used to parse these comments during system initialization to
determine the order in which system services should be invoked to
satisfy the dependencies.

The following key word must be included in all startup scripts as it is
required by
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__
to “enable” the startup script:

.. raw:: html

   <div class="itemizedlist">

-  ``PROVIDE``: Specifies the services this file provides.

.. raw:: html

   </div>

The following key words may be included at the top of each startup
script. They are not strictly necessary, but are useful as hints to
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__:

.. raw:: html

   <div class="itemizedlist">

-  ``REQUIRE``: Lists services which are required for this service. The
   script containing this key word will run *after* the specified
   services.

-  ``BEFORE``: Lists services which depend on this service. The script
   containing this key word will run *before* the specified services.

.. raw:: html

   </div>

By carefully setting these keywords for each startup script, an
administrator has a fine-grained level of control of the startup order
of the scripts, without the need for “runlevels” used by some UNIX?
operating systems.

Additional information can be found in
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ and
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__.
Refer to `this
article <../../../../doc/en_US.ISO8859-1/articles/rc-scripting>`__ for
instructions on how to create custom
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
scripts.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.4.1.?Managing System-Specific Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The principal location for system configuration information is
``/etc/rc.conf``. This file contains a wide range of configuration
information and it is read at system startup to configure the system. It
provides the configuration information for the ``rc*`` files.

The entries in ``/etc/rc.conf`` override the default settings in
``/etc/defaults/rc.conf``. The file containing the default settings
should not be edited. Instead, all system-specific changes should be
made to ``/etc/rc.conf``.

A number of strategies may be applied in clustered applications to
separate site-wide configuration from system-specific configuration in
order to reduce administration overhead. The recommended approach is to
place system-specific configuration into ``/etc/rc.conf.local``. For
example, these entries in ``/etc/rc.conf`` apply to all systems:

.. code:: programlisting

    sshd_enable="YES"
    keyrate="fast"
    defaultrouter="10.1.1.254"

Whereas these entries in ``/etc/rc.conf.local`` apply to this system
only:

.. code:: programlisting

    hostname="node1.example.org"
    ifconfig_fxp0="inet 10.1.1.1/8"

Distribute ``/etc/rc.conf`` to every system using an application such as
rsync or puppet, while ``/etc/rc.conf.local`` remains unique.

Upgrading the system will not overwrite ``/etc/rc.conf``, so system
configuration information will not be lost.

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

Both ``/etc/rc.conf`` and ``/etc/rc.conf.local`` are parsed by
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__. This
allows system operators to create complex configuration scenarios. Refer
to
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
for further information on this topic.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+---------------------------------------------+
| `Prev <configtuning-cron.html>`__?   | `Up <config-tuning.html>`__   | ?\ `Next <config-network-setup.html>`__     |
+--------------------------------------+-------------------------------+---------------------------------------------+
| 12.3.?Configuring cron(8)?           | `Home <index.html>`__         | ?12.5.?Setting Up Network Interface Cards   |
+--------------------------------------+-------------------------------+---------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
