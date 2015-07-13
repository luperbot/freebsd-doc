==========================
14.9.?Access Control Lists
==========================

.. raw:: html

   <div class="navheader">

14.9.?Access Control Lists
`Prev <openssh.html>`__?
Chapter?14.?Security
?\ `Next <security-pkg.html>`__

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

14.9.?Access Control Lists
--------------------------

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

Access Control Lists (ACLs) extend the standard UNIX? permission model
in a POSIX?.1e compatible way. This permits an administrator to take
advantage of a more fine-grained permissions model.

The FreeBSD ``GENERIC`` kernel provides ACL support for UFS file
systems. Users who prefer to compile a custom kernel must include the
following option in their custom kernel configuration file:

.. code:: programlisting

    options UFS_ACL

If this option is not compiled in, a warning message will be displayed
when attempting to mount a file system with ACL support. ACLs rely on
extended attributes which are natively supported in UFS2.

This chapter describes how to enable ACL support and provides some usage
examples.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.9.1.?Enabling ACL Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ACLs are enabled by the mount-time administrative flag, ``acls``, which
may be added to ``/etc/fstab``. The mount-time flag can also be
automatically set in a persistent manner using
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
to modify a superblock ACLs flag in the file system header. In general,
it is preferred to use the superblock flag for several reasons:

.. raw:: html

   <div class="itemizedlist">

-  The superblock flag cannot be changed by a remount using ``mount -u``
   as it requires a complete ``umount`` and fresh ``mount``. This means
   that ACLs cannot be enabled on the root file system after boot. It
   also means that ACL support on a file system cannot be changed while
   the system is in use.

-  Setting the superblock flag causes the file system to always be
   mounted with ACLs enabled, even if there is not an ``fstab`` entry or
   if the devices re-order. This prevents accidental mounting of the
   file system without ACL support.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is desirable to discourage accidental mounting without ACLs enabled
because nasty things can happen if ACLs are enabled, then disabled, then
re-enabled without flushing the extended attributes. In general, once
ACLs are enabled on a file system, they should not be disabled, as the
resulting file protections may not be compatible with those intended by
the users of the system, and re-enabling ACLs may re-attach the previous
ACLs to files that have since had their permissions changed, resulting
in unpredictable behavior.

.. raw:: html

   </div>

File systems with ACLs enabled will show a plus (``+``) sign in their
permission settings:

.. code:: programlisting

    drwx------  2 robert  robert  512 Dec 27 11:54 private
    drwxrwx---+ 2 robert  robert  512 Dec 23 10:57 directory1
    drwxrwx---+ 2 robert  robert  512 Dec 22 10:20 directory2
    drwxrwx---+ 2 robert  robert  512 Dec 27 11:57 directory3
    drwxr-xr-x  2 robert  robert  512 Nov 10 11:54 public_html

In this example, ``directory1``, ``directory2``, and ``directory3`` are
all taking advantage of ACLs, whereas ``public_html`` is not.

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

14.9.2.?Using ACLs
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

File system ACLs can be viewed using ``getfacl``. For instance, to view
the ACL settings on ``test``:

.. code:: screen

    % getfacl test
        #file:test
        #owner:1001
        #group:1001
        user::rw-
        group::r--
        other::r--

To change the ACL settings on this file, use ``setfacl``. To remove all
of the currently defined ACLs from a file or file system, include
``-k``. However, the preferred method is to use ``-b`` as it leaves the
basic fields required for ACLs to work.

.. code:: screen

    % setfacl -k test

To modify the default ACL entries, use ``-m``:

.. code:: screen

    % setfacl -m u:trhodes:rwx,group:web:r--,o::--- test

In this example, there were no pre-defined entries, as they were removed
by the previous command. This command restores the default options and
assigns the options listed. If a user or group is added which does not
exist on the system, an Invalid argument error will be displayed.

Refer to
`getfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getfacl&sektion=1>`__
and
`setfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfacl&sektion=1>`__
for more information about the options available for these commands.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+--------------------------+--------------------------------------------------+
| `Prev <openssh.html>`__?   | `Up <security.html>`__   | ?\ `Next <security-pkg.html>`__                  |
+----------------------------+--------------------------+--------------------------------------------------+
| 14.8.?OpenSSH?             | `Home <index.html>`__    | ?14.10.?Monitoring Third Party Security Issues   |
+----------------------------+--------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
