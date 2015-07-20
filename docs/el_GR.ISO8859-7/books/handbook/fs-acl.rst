=======================================
15.12. File System Access Control Lists
=======================================

.. raw:: html

   <div class="navheader">

15.12. File System Access Control Lists
`????? <openssh.html>`__?
???????? 15. ????????
?\ `??????? <security-portaudit.html>`__

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

15.12. File System Access Control Lists
---------------------------------------

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

In conjunction with file system enhancements like snapshots, FreeBSD 5.0
and later offers the security of File System Access Control Lists
(ACLs).

Access Control Lists extend the standard UNIX(R) permission model in a
highly compatible (POSIX(R).1e) way. This feature permits an
administrator to make use of and take advantage of a more sophisticated
security model.

To enable ACL support for UFS file systems, the following:

.. code:: programlisting

    options UFS_ACL

must be compiled into the kernel. If this option has not been compiled
in, a warning message will be displayed when attempting to mount a file
system supporting ACLs. This option is included in the ``GENERIC``
kernel. ACLs rely on extended attributes being enabled on the file
system. Extended attributes are natively supported in the next
generation UNIX(R) file system, UFS2.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

A higher level of administrative overhead is required to configure
extended attributes on UFS1 than on UFS2. The performance of extended
attributes on UFS2 is also substantially higher. As a result, UFS2 is
generally recommended in preference to UFS1 for use with access control
lists.

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

-  The mount-time ACLs flag cannot be changed by a remount
   (`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
   ``-u``), only by means of a complete
   `umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8>`__
   and fresh
   `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
   This means that ACLs cannot be enabled on the root file system after
   boot. It also means that you cannot change the disposition of a file
   system once it is in use.

-  Setting the superblock flag will cause the file system to always be
   mounted with ACLs enabled even if there is not an ``fstab`` entry or
   if the devices re-order. This prevents accidental mounting of the
   file system without ACLs enabled, which can result in ACLs being
   improperly enforced, and hence security problems.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

We may change the ACLs behavior to allow the flag to be enabled without
a complete fresh
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__,
but we consider it desirable to discourage accidental mounting without
ACLs enabled, because you can shoot your feet quite nastily if you
enable ACLs, then disable them, then re-enable them without flushing the
extended attributes. In general, once you have enabled ACLs on a file
system, they should not be disabled, as the resulting file protections
may not be compatible with those intended by the users of the system,
and re-enabling ACLs may re-attach the previous ACLs to files that have
since had their permissions changed, resulting in other unpredictable
behavior.

.. raw:: html

   </div>

File systems with ACLs enabled will show a ``+`` (plus) sign in their
permission settings when viewed. For example:

.. code:: programlisting

    drwx------  2 robert  robert  512 Dec 27 11:54 private
    drwxrwx---+ 2 robert  robert  512 Dec 23 10:57 directory1
    drwxrwx---+ 2 robert  robert  512 Dec 22 10:20 directory2
    drwxrwx---+ 2 robert  robert  512 Dec 27 11:57 directory3
    drwxr-xr-x  2 robert  robert  512 Nov 10 11:54 public_html

Here we see that the ``directory1``, ``directory2``, and ``directory3``
directories are all taking advantage of ACLs. The ``public_html``
directory is not.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.12.1. Making Use of ACLs
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The file system ACLs can be viewed by the
`getfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getfacl&sektion=1>`__
utility. For instance, to view the ACL settings on the ``test`` file,
one would use the command:

.. code:: screen

    % getfacl test
        #file:test
        #owner:1001
        #group:1001
        user::rw-
        group::r--
        other::r--

To change the ACL settings on this file, invoke the
`setfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfacl&sektion=1>`__
utility. Observe:

.. code:: screen

    % setfacl -k test

The ``-k`` flag will remove all of the currently defined ACLs from a
file or file system. The more preferable method would be to use ``-b``
as it leaves the basic fields required for ACLs to work.

.. code:: screen

    % setfacl -m u:trhodes:rwx,group:web:r--,o::--- test

In the aforementioned command, the ``-m`` option was used to modify the
default ACL entries. Since there were no pre-defined entries, as they
were removed by the previous command, this will restore the default
options and assign the options listed. Take care to notice that if you
add a user or group which does not exist on the system, an Invalid
argument error will be printed to ``stdout``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+----------------------------+--------------------------------------------------+
| `????? <openssh.html>`__?   | `???? <security.html>`__   | ?\ `??????? <security-portaudit.html>`__         |
+-----------------------------+----------------------------+--------------------------------------------------+
| 15.11. OpenSSH?             | `???? <index.html>`__      | ?15.13. Monitoring Third Party Security Issues   |
+-----------------------------+----------------------------+--------------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
