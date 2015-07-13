=========================================================
5.?System Strategies for Small and Read Only Environments
=========================================================

.. raw:: html

   <div class="navheader">

5.?System Strategies for Small and Read Only Environments
`Prev <ar01s04.html>`__?
?
?

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

5.?System Strategies for Small and Read Only Environments
---------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In `Section?3, “The ``rc`` Subsystem and Read-Only
Filesystems” <ro-fs.html>`__, it was pointed out that the ``/var``
filesystem constructed by ``/etc/rc.d/var`` and the presence of a
read-only root filesystem causes problems with many common software
packages used with FreeBSD. In this article, suggestions for
successfully running cron, syslog, ports installations, and the Apache
web server will be provided.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?Cron
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Upon boot, ``/var`` gets populated by ``/etc/rc.d/var`` using the list
from ``/etc/mtree/BSD.var.dist``, so the ``cron``, ``cron/tabs``,
``at``, and a few other standard directories get created.

However, this does not solve the problem of maintaining cron tabs across
reboots. When the system reboots, the ``/var`` filesystem that is in
memory will disappear and any cron tabs you may have had in it will also
disappear. Therefore, one solution would be to create cron tabs for the
users that need them, mount your ``/`` filesystem as read-write and copy
those cron tabs to somewhere safe, like ``/etc/tabs``, then add a line
to the end of ``/etc/rc.initdiskless`` that copies those crontabs into
``/var/cron/tabs`` after that directory has been created during system
initialization. You may also need to add a line that changes modes and
permissions on the directories you create and the files you copy with
``/etc/rc.initdiskless``.

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

5.2.?Syslog
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``syslog.conf`` specifies the locations of certain log files that exist
in ``/var/log``. These files are not created by ``/etc/rc.d/var`` upon
system initialization. Therefore, somewhere in ``/etc/rc.d/var``, after
the section that creates the directories in ``/var``, you will need to
add something like this:

.. code:: screen

    # touch /var/log/security /var/log/maillog /var/log/cron /var/log/messages
    # chmod 0644 /var/log/*

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

5.3.?Ports Installation
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before discussing the changes necessary to successfully use the ports
tree, a reminder is necessary regarding the read-only nature of your
filesystems on the flash media. Since they are read-only, you will need
to temporarily mount them read-write using the mount syntax shown in
`Section?3, “The ``rc`` Subsystem and Read-Only
Filesystems” <ro-fs.html>`__. You should always remount those
filesystems read-only when you are done with any maintenance -
unnecessary writes to the flash media could considerably shorten its
lifespan.

To make it possible to enter a ports directory and successfully run
``make`` ``install``, we must create a packages directory on a
non-memory filesystem that will keep track of our packages across
reboots. Because it is necessary to mount your filesystems as read-write
for the installation of a package anyway, it is sensible to assume that
an area on the flash media can also be used for package information to
be written to.

First, create a package database directory. This is normally in
``/var/db/pkg``, but we cannot place it there as it will disappear every
time the system is booted.

.. code:: screen

    # mkdir /etc/pkg

Now, add a line to ``/etc/rc.d/var`` that links the ``/etc/pkg``
directory to ``/var/db/pkg``. An example:

.. code:: screen

    # ln -s /etc/pkg /var/db/pkg

Now, any time that you mount your filesystems as read-write and install
a package, the ``make`` ``install`` will work, and package information
will be written successfully to ``/etc/pkg`` (because the filesystem
will, at that time, be mounted read-write) which will always be
available to the operating system as ``/var/db/pkg``.

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

5.4.?Apache Web Server
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The steps in this section are only necessary if Apache is set up to
write its pid or log information outside of ``/var``. By default, Apache
keeps its pid file in ``/var/run/httpd.pid`` and its log files in
``/var/log``.

.. raw:: html

   </div>

It is now assumed that Apache keeps its log files in a directory
``apache_log_dir`` outside of ``/var``. When this directory lives on a
read-only filesystem, Apache will not be able to save any log files, and
may have problems working. If so, it is necessary to add a new directory
to the list of directories in ``/etc/rc.d/var`` to create in ``/var``,
and to link ``apache_log_dir`` to ``/var/log/apache``. It is also
necessary to set permissions and ownership on this new directory.

First, add the directory ``log/apache`` to the list of directories to be
created in ``/etc/rc.d/var``.

Second, add these commands to ``/etc/rc.d/var`` after the directory
creation section:

.. code:: screen

    # chmod 0774 /var/log/apache
    # chown nobody:nobody /var/log/apache

Finally, remove the existing ``apache_log_dir`` directory, and replace
it with a link:

.. code:: screen

    # rm -rf apache_log_dir
    # ln -s /var/log/apache apache_log_dir

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------+-----+
| `Prev <ar01s04.html>`__?                  | ?                       | ?   |
+-------------------------------------------+-------------------------+-----+
| 4.?Building a File System from Scratch?   | `Home <index.html>`__   | ?   |
+-------------------------------------------+-------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
