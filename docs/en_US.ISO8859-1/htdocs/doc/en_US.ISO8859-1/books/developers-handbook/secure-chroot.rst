========================================
3.5.?Limiting your program's environment
========================================

.. raw:: html

   <div class="navheader">

3.5.?Limiting your program's environment
`Prev <secure-setuid.html>`__?
Chapter?3.?Secure Programming
?\ `Next <secure-trust.html>`__

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

3.5.?Limiting your program's environment
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The traditional method of restricting a process is with the ``chroot()``
system call. This system call changes the root directory from which all
other paths are referenced for a process and any child processes. For
this call to succeed the process must have execute (search) permission
on the directory being referenced. The new environment does not actually
take effect until you ``chdir()`` into your new environment. It should
also be noted that a process can easily break out of a chroot
environment if it has root privilege. This could be accomplished by
creating device nodes to read kernel memory, attaching a debugger to a
process outside of the
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
environment, or in many other creative ways.

The behavior of the ``chroot()`` system call can be controlled somewhat
with the kern.chroot\_allow\_open\_directories ``sysctl`` variable. When
this value is set to 0, ``chroot()`` will fail with EPERM if there are
any directories open. If set to the default value of 1, then
``chroot()`` will fail with EPERM if there are any directories open and
the process is already subject to a ``chroot()`` call. For any other
value, the check for open directories will be bypassed completely.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.5.1.?FreeBSD's jail functionality
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The concept of a Jail extends upon the ``chroot()`` by limiting the
powers of the superuser to create a true \`virtual server'. Once a
prison is set up all network communication must take place through the
specified IP address, and the power of "root privilege" in this jail is
severely constrained.

While in a prison, any tests of superuser power within the kernel using
the ``suser()`` call will fail. However, some calls to ``suser()`` have
been changed to a new interface ``suser_xxx()``. This function is
responsible for recognizing or denying access to superuser power for
imprisoned processes.

A superuser process within a jailed environment has the power to:

.. raw:: html

   <div class="itemizedlist">

-  Manipulate credential with ``setuid``, ``seteuid``, ``setgid``,
   ``setegid``, ``setgroups``, ``setreuid``, ``setregid``, ``setlogin``
-  Set resource limits with ``setrlimit``
-  Modify some sysctl nodes (kern.hostname)
-  ``chroot()``
-  Set flags on a vnode: ``chflags``, ``fchflags``
-  Set attributes of a vnode such as file permission, owner, group,
   size, access time, and modification time.
-  Bind to privileged ports in the Internet domain (ports < 1024)

.. raw:: html

   </div>

``Jail`` is a very useful tool for running applications in a secure
environment but it does have some shortcomings. Currently, the IPC
mechanisms have not been converted to the ``suser_xxx`` so applications
such as MySQL cannot be run within a jail. Superuser access may have a
very limited meaning within a jail, but there is no way to specify
exactly what "very limited" means.

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

3.5.2.?POSIX?.1e Process Capabilities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

POSIX? has released a working draft that adds event auditing, access
control lists, fine grained privileges, information labeling, and
mandatory access control.

This is a work in progress and is the focus of the
`TrustedBSD <http://www.trustedbsd.org/>`__ project. Some of the initial
work has been committed to FreeBSD-CURRENT (cap\_set\_proc(3)).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-----------------------------------+
| `Prev <secure-setuid.html>`__?   | `Up <secure.html>`__    | ?\ `Next <secure-trust.html>`__   |
+----------------------------------+-------------------------+-----------------------------------+
| 3.4.?SetUID issues?              | `Home <index.html>`__   | ?3.6.?Trust                       |
+----------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
