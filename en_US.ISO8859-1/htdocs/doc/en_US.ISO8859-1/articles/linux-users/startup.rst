=================
4.?System Startup
=================

.. raw:: html

   <div class="navheader">

4.?System Startup
`Prev <software.html>`__?
?
?\ `Next <network.html>`__

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

4.?System Startup
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many Linux? distributions use the SysV init system, whereas FreeBSD uses
the traditional BSD-style
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__.
Under the BSD-style
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__,
there are no run-levels and ``/etc/inittab`` does not exist. Instead,
startup is controlled by
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
scripts. At system boot, ``/etc/rc`` reads ``/etc/rc.conf`` and
``/etc/defaults/rc.conf`` to determine which services are to be started.
The specified services are then started by running the corresponding
service initialization scripts located in ``/etc/rc.d/`` and
``/usr/local/etc/rc.d/``. These scripts are similar to the scripts
located in ``/etc/init.d/`` on Linux? systems.

The scripts found in ``/etc/rc.d/`` are for applications that are part
of the “base” system, such as
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__,
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
and
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__.
The scripts in ``/usr/local/etc/rc.d/`` are for user-installed
applications such as Apache and Squid.

Since FreeBSD is developed as a complete operating system,
user-installed applications are not considered to be part of the “base”
system. User-installed applications are generally installed using
`Packages or
Ports <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__.
In order to keep them separate from the base system, user-installed
applications are installed under ``/usr/local/``. Therefore,
user-installed binaries reside in ``/usr/local/bin/``, configuration
files are in ``/usr/local/etc/``, and so on.

Services are enabled by adding an entry for the service in
``/etc/rc.conf`` . The system defaults are found in
``/etc/defaults/rc.conf`` and these default settings are overridden by
settings in ``/etc/rc.conf``. Refer to
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
for more information about the available entries. When installing
additional applications, review the application's install message to
determine how to enable any associated services.

The following entries in ``/etc/rc.conf`` enable
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
enable Apache 2.4, and specify that Apache should be started with SSL.

.. code:: programlisting

    # enable SSHD
    sshd_enable="YES"
    # enable Apache with SSL
    apache24_enable="YES"
    apache24_flags="-DSSL"

Once a service has been enabled in ``/etc/rc.conf``, it can be started
without rebooting the system:

.. code:: screen

    # service sshd start
    # service apache24 start

If a service has not been enabled, it can be started from the command
line using ``onestart``:

.. code:: screen

    # service sshd onestart

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+-------------------------+------------------------------+
| `Prev <software.html>`__?                            | ?                       | ?\ `Next <network.html>`__   |
+------------------------------------------------------+-------------------------+------------------------------+
| 3.?Packages and Ports: Adding Software in FreeBSD?   | `Home <index.html>`__   | ?5.?Network Configuration    |
+------------------------------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
