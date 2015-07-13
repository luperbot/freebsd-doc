=============================
15.5.?Updating Multiple Jails
=============================

.. raw:: html

   <div class="navheader">

15.5.?Updating Multiple Jails
`Prev <jails-tuning.html>`__?
Chapter?15.?Jails
?\ `Next <jails-ezjail.html>`__

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

15.5.?Updating Multiple Jails
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Daniel Gerzo.

.. raw:: html

   </div>

.. raw:: html

   <div>

Based upon an idea presented by Simon L. B. Nielsen.

.. raw:: html

   </div>

.. raw:: html

   <div>

And an article written by Ken Tom.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The management of multiple jails can become problematic because every
jail has to be rebuilt from scratch whenever it is upgraded. This can be
time consuming and tedious if a lot of jails are created and manually
updated.

This section demonstrates one method to resolve this issue by safely
sharing as much as is possible between jails using read-only
`mount\_nullfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nullfs&sektion=8>`__
mounts, so that updating is simpler. This makes it more attractive to
put single services, such as HTTP, DNS, and SMTP, into individual jails.
Additionally, it provides a simple way to add, remove, and upgrade
jails.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Simpler solutions exist, such as ezjail, which provides an easier method
of administering FreeBSD jails but is less versatile than this setup.
ezjail is covered in more detail in `Section?15.6, “Managing Jails with
ezjail” <jails-ezjail.html>`__.

.. raw:: html

   </div>

The goals of the setup described in this section are:

.. raw:: html

   <div class="itemizedlist">

-  Create a simple and easy to understand jail structure that does not
   require running a full installworld on each and every jail.

-  Make it easy to add new jails or remove existing ones.

-  Make it easy to update or upgrade existing jails.

-  Make it possible to run a customized FreeBSD branch.

-  Be paranoid about security, reducing as much as possible the
   possibility of compromise.

-  Save space and inodes, as much as possible.

.. raw:: html

   </div>

This design relies on a single, read-only master template which is
mounted into each jail and one read-write device per jail. A device can
be a separate physical disc, a partition, or a vnode backed memory
device. This example uses read-write nullfs mounts.

The file system layout is as follows:

.. raw:: html

   <div class="itemizedlist">

-  The jails are based under the ``/home`` partition.

-  Each jail will be mounted under the ``/home/j`` directory.

-  The template for each jail and the read-only partition for all of the
   jails is ``/home/j/mroot``.

-  A blank directory will be created for each jail under the ``/home/j``
   directory.

-  Each jail will have a ``/s`` directory that will be linked to the
   read-write portion of the system.

-  Each jail will have its own read-write system that is based upon
   ``/home/j/skel``.

-  The read-write portion of each jail will be created in ``/home/js``.

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

15.5.1.?Creating the Template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes the steps needed to create the master template.

It is recommended to first update the host FreeBSD system to the latest
-RELEASE branch using the instructions in `Section?24.6, “Rebuilding
World” <makeworld.html>`__. Additionally, this template uses the
`sysutils/cpdup <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cpdup/pkg-descr>`__
package or port and portsnap will be used to download the FreeBSD Ports
Collection.

.. raw:: html

   <div class="procedure">

#. First, create a directory structure for the read-only file system
   which will contain the FreeBSD binaries for the jails. Then, change
   directory to the FreeBSD source tree and install the read-only file
   system to the jail template:

   .. code:: screen

       # mkdir /home/j /home/j/mroot
       # cd /usr/src
       # make installworld DESTDIR=/home/j/mroot

#. Next, prepare a FreeBSD Ports Collection for the jails as well as a
   FreeBSD source tree, which is required for mergemaster:

   .. code:: screen

       # cd /home/j/mroot
       # mkdir usr/ports
       # portsnap -p /home/j/mroot/usr/ports fetch extract
       # cpdup /usr/src /home/j/mroot/usr/src

#. Create a skeleton for the read-write portion of the system:

   .. code:: screen

       # mkdir /home/j/skel /home/j/skel/home /home/j/skel/usr-X11R6 /home/j/skel/distfiles
       # mv etc /home/j/skel
       # mv usr/local /home/j/skel/usr-local
       # mv tmp /home/j/skel
       # mv var /home/j/skel
       # mv root /home/j/skel

#. Use mergemaster to install missing configuration files. Then, remove
   the extra directories that mergemaster creates:

   .. code:: screen

       # mergemaster -t /home/j/skel/var/tmp/temproot -D /home/j/skel -i
       # cd /home/j/skel
       # rm -R bin boot lib libexec mnt proc rescue sbin sys usr dev

#. Now, symlink the read-write file system to the read-only file system.
   Ensure that the symlinks are created in the correct ``s/`` locations
   as the creation of directories in the wrong locations will cause the
   installation to fail.

   .. code:: screen

       # cd /home/j/mroot
       # mkdir s
       # ln -s s/etc etc
       # ln -s s/home home
       # ln -s s/root root
       # ln -s s/usr-local usr/local
       # ln -s s/usr-X11R6 usr/X11R6
       # ln -s s/distfiles usr/ports/distfiles
       # ln -s s/tmp tmp
       # ln -s s/var var

#. As a last step, create a generic ``/home/j/skel/etc/make.conf``
   containing this line:

   .. code:: programlisting

       WRKDIRPREFIX?=  /s/portbuild

   This makes it possible to compile FreeBSD ports inside each jail.
   Remember that the ports directory is part of the read-only system.
   The custom path for ``WRKDIRPREFIX`` allows builds to be done in the
   read-write portion of every jail.

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

15.5.2.?Creating Jails
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The jail template can now be used to setup and configure the jails in
``/etc/rc.conf``. This example demonstrates the creation of 3 jails:
``NS``, ``MAIL`` and ``WWW``.

.. raw:: html

   <div class="procedure">

#. Add the following lines to ``/etc/fstab``, so that the read-only
   template for the jails and the read-write space will be available in
   the respective jails:

   .. code:: programlisting

       /home/j/mroot   /home/j/ns     nullfs  ro  0   0
       /home/j/mroot   /home/j/mail   nullfs  ro  0   0
       /home/j/mroot   /home/j/www    nullfs  ro  0   0
       /home/js/ns     /home/j/ns/s   nullfs  rw  0   0
       /home/js/mail   /home/j/mail/s nullfs  rw  0   0
       /home/js/www    /home/j/www/s  nullfs  rw  0   0

   To prevent fsck from checking nullfs mounts during boot and dump from
   backing up the read-only nullfs mounts of the jails, the last two
   columns are both set to ``0``.

#. Configure the jails in ``/etc/rc.conf``:

   .. code:: programlisting

       jail_enable="YES"
       jail_set_hostname_allow="NO"
       jail_list="ns mail www"
       jail_ns_hostname="ns.example.org"
       jail_ns_ip="192.168.3.17"
       jail_ns_rootdir="/usr/home/j/ns"
       jail_ns_devfs_enable="YES"
       jail_mail_hostname="mail.example.org"
       jail_mail_ip="192.168.3.18"
       jail_mail_rootdir="/usr/home/j/mail"
       jail_mail_devfs_enable="YES"
       jail_www_hostname="www.example.org"
       jail_www_ip="62.123.43.14"
       jail_www_rootdir="/usr/home/j/www"
       jail_www_devfs_enable="YES"

   The ``jail_name``\ \_rootdir variable is set to ``/usr/home`` instead
   of ``/home`` because the physical path of ``/home`` on a default
   FreeBSD installation is ``/usr/home``. The ``jail_name``\ \_rootdir
   variable must *not* be set to a path which includes a symbolic link,
   otherwise the jails will refuse to start.

#. Create the required mount points for the read-only file system of
   each jail:

   .. code:: screen

       # mkdir /home/j/ns /home/j/mail /home/j/www

#. Install the read-write template into each jail using
   `sysutils/cpdup <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cpdup/pkg-descr>`__:

   .. code:: screen

       # mkdir /home/js
       # cpdup /home/j/skel /home/js/ns
       # cpdup /home/j/skel /home/js/mail
       # cpdup /home/j/skel /home/js/www

#. In this phase, the jails are built and prepared to run. First, mount
   the required file systems for each jail, and then start them:

   .. code:: screen

       # mount -a
       # service jail start

.. raw:: html

   </div>

The jails should be running now. To check if they have started
correctly, use ``jls``. Its output should be similar to the following:

.. code:: screen

    # jls
       JID  IP Address      Hostname                      Path
         3  192.168.3.17    ns.example.org                /home/j/ns
         2  192.168.3.18    mail.example.org              /home/j/mail
         1  62.123.43.14    www.example.org               /home/j/www

At this point, it should be possible to log onto each jail, add new
users, or configure daemons. The ``JID`` column indicates the jail
identification number of each running jail. Use the following command to
perform administrative tasks in the jail whose JID is ``3``:

.. code:: screen

    # jexec 3 tcsh

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

15.5.3.?Upgrading
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The design of this setup provides an easy way to upgrade existing jails
while minimizing their downtime. Also, it provides a way to roll back to
the older version should a problem occur.

.. raw:: html

   <div class="procedure">

#. The first step is to upgrade the host system. Then, create a new
   temporary read-only template in ``/home/j/mroot2``.

   .. code:: screen

       # mkdir /home/j/mroot2
       # cd /usr/src
       # make installworld DESTDIR=/home/j/mroot2
       # cd /home/j/mroot2
       # cpdup /usr/src usr/src
       # mkdir s

   The ``installworld`` creates a few unnecessary directories, which
   should be removed:

   .. code:: screen

       # chflags -R 0 var
       # rm -R etc var root usr/local tmp

#. Recreate the read-write symlinks for the master file system:

   .. code:: screen

       # ln -s s/etc etc
       # ln -s s/root root
       # ln -s s/home home
       # ln -s ../s/usr-local usr/local
       # ln -s ../s/usr-X11R6 usr/X11R6
       # ln -s s/tmp tmp
       # ln -s s/var var

#. Next, stop the jails:

   .. code:: screen

       # service jail stop

#. Unmount the original file systems as the read-write systems are
   attached to the read-only system (``/s``):

   .. code:: screen

       # umount /home/j/ns/s
       # umount /home/j/ns
       # umount /home/j/mail/s
       # umount /home/j/mail
       # umount /home/j/www/s
       # umount /home/j/www

#. Move the old read-only file system and replace it with the new one.
   This will serve as a backup and archive of the old read-only file
   system should something go wrong. The naming convention used here
   corresponds to when a new read-only file system has been created.
   Move the original FreeBSD Ports Collection over to the new file
   system to save some space and inodes:

   .. code:: screen

       # cd /home/j
       # mv mroot mroot.20060601
       # mv mroot2 mroot
       # mv mroot.20060601/usr/ports mroot/usr

#. At this point the new read-only template is ready, so the only
   remaining task is to remount the file systems and start the jails:

   .. code:: screen

       # mount -a
       # service jail start

.. raw:: html

   </div>

Use ``jls`` to check if the jails started correctly. Run ``mergemaster``
in each jail to update the configuration files.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+-------------------------------------+
| `Prev <jails-tuning.html>`__?           | `Up <jails.html>`__     | ?\ `Next <jails-ezjail.html>`__     |
+-----------------------------------------+-------------------------+-------------------------------------+
| 15.4.?Fine Tuning and Administration?   | `Home <index.html>`__   | ?15.6.?Managing Jails with ezjail   |
+-----------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
