=================
Chapter?15.?Jails
=================

.. raw:: html

   <div class="navheader">

Chapter?15.?Jails
`Prev <security-resourcelimits.html>`__?
Part?III.?System Administration
?\ `Next <jails-terms.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?15.?Jails
-----------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Matteo Riondato.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`15.1. Synopsis <jails.html#jails-synopsis>`__
`15.2. Terms Related to Jails <jails-terms.html>`__
`15.3. Creating and Controlling Jails <jails-build.html>`__
`15.4. Fine Tuning and Administration <jails-tuning.html>`__
`15.5. Updating Multiple Jails <jails-application.html>`__
`15.6. Managing Jails with ezjail <jails-ezjail.html>`__

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

15.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since system administration is a difficult task, many tools have been
developed to make life easier for the administrator. These tools often
enhance the way systems are installed, configured, and maintained. One
of the tools which can be used to enhance the security of a FreeBSD
system is *jails*. Jails have been available since FreeBSD?4.X and
continue to be enhanced in their usefulness, performance, reliability,
and security.

Jails build upon the
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
concept, which is used to change the root directory of a set of
processes, creating a safe environment, separate from the rest of the
system. Processes created in the chrooted environment can not access
files or resources outside of it. For that reason, compromising a
service running in a chrooted environment should not allow the attacker
to compromise the entire system. However, a chroot has several
limitations. It is suited to easy tasks which do not require much
flexibility or complex, advanced features. Over time many ways have been
found to escape from a chrooted environment, making it a less than ideal
solution for securing services.

Jails improve on the concept of the traditional chroot environment in
several ways. In a traditional chroot environment, processes are only
limited in the part of the file system they can access. The rest of the
system resources, system users, running processes, and the networking
subsystem are shared by the chrooted processes and the processes of the
host system. Jails expand this model by virtualizing access to the file
system, the set of users, and the networking subsystem. More
fine-grained controls are available for tuning the access of a jailed
environment. Jails can be considered as a type of operating system-level
virtualization.

A jail is characterized by four elements:

.. raw:: html

   <div class="itemizedlist">

-  A directory subtree: the starting point from which a jail is entered.
   Once inside the jail, a process is not permitted to escape outside of
   this subtree.

-  A hostname: which will be used by the jail.

-  An IP address: which is assigned to the jail. The IP address of a
   jail is often an alias address for an existing network interface.

-  A command: the path name of an executable to run inside the jail. The
   path is relative to the root directory of the jail environment.

.. raw:: html

   </div>

Jails have their own set of users and their own ``root`` account which
are limited to the jail environment. The ``root`` account of a jail is
not allowed to perform operations to the system outside of the
associated jail environment.

This chapter provides an overview of jail terminology are how to use
FreeBSD jails. Jails are a powerful tool for system administrators, but
their basic usage can also be useful for advanced users.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  What a jail is and what purpose it may serve in FreeBSD
   installations.

-  How to build, start, and stop a jail.

-  The basics of jail administration, both from inside and outside the
   jail.

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Jails are a powerful tool, but they are not a security panacea. While it
is not possible for a jailed process to break out on its own, there are
several ways in which an unprivileged user outside the jail can
cooperate with a privileged user inside the jail to obtain elevated
privileges in the host environment.

Most of these attacks can be mitigated by ensuring that the jail root is
not accessible to unprivileged users in the host environment. As a
general rule, untrusted users with privileged access to a jail should
not be given access to the host environment.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+---------------------------------------+----------------------------------+
| `Prev <security-resourcelimits.html>`__?   | `Up <system-administration.html>`__   | ?\ `Next <jails-terms.html>`__   |
+--------------------------------------------+---------------------------------------+----------------------------------+
| 14.13.?Resource Limits?                    | `Home <index.html>`__                 | ?15.2.?Terms Related to Jails    |
+--------------------------------------------+---------------------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
