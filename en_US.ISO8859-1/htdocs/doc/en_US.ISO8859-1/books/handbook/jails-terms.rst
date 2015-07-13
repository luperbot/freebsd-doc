============================
15.2.?Terms Related to Jails
============================

.. raw:: html

   <div class="navheader">

15.2.?Terms Related to Jails
`Prev <jails.html>`__?
Chapter?15.?Jails
?\ `Next <jails-build.html>`__

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

15.2.?Terms Related to Jails
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To facilitate better understanding of parts of the FreeBSD system
related to jails, their internals and the way they interact with the
rest of FreeBSD, the following terms are used further in this chapter:

.. raw:: html

   <div class="variablelist">

`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
(command)
    Utility, which uses
    `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
    FreeBSD system call to change the root directory of a process and
    all its descendants.

`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
(environment)
    The environment of processes running in a “chroot”. This includes
    resources such as the part of the file system which is visible, user
    and group IDs which are available, network interfaces and other IPC
    mechanisms, etc.

`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
(command)
    The system administration utility which allows launching of
    processes within a jail environment.

host (system, process, user, etc.)
    The controlling system of a jail environment. The host system has
    access to all the hardware resources available, and can control
    processes both outside of and inside a jail environment. One of the
    important differences of the host system from a jail is that the
    limitations which apply to superuser processes inside a jail are not
    enforced for processes of the host system.

hosted (system, process, user, etc.)
    A process, user or other entity, whose access to resources is
    restricted by a FreeBSD jail.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+-----------------------------------------+
| `Prev <jails.html>`__?   | `Up <jails.html>`__     | ?\ `Next <jails-build.html>`__          |
+--------------------------+-------------------------+-----------------------------------------+
| Chapter?15.?Jails?       | `Home <index.html>`__   | ?15.3.?Creating and Controlling Jails   |
+--------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
