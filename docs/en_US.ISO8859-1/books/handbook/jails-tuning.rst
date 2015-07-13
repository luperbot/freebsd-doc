====================================
15.4.?Fine Tuning and Administration
====================================

.. raw:: html

   <div class="navheader">

15.4.?Fine Tuning and Administration
`Prev <jails-build.html>`__?
Chapter?15.?Jails
?\ `Next <jails-application.html>`__

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

15.4.?Fine Tuning and Administration
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are several options which can be set for any jail, and various
ways of combining a host FreeBSD system with jails, to produce higher
level applications. This section presents:

.. raw:: html

   <div class="itemizedlist">

-  Some of the options available for tuning the behavior and security
   restrictions implemented by a jail installation.

-  Some of the high-level applications for jail management, which are
   available through the FreeBSD Ports Collection, and can be used to
   implement overall jail-based solutions.

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

15.4.1.?System Tools for Jail Tuning in FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Fine tuning of a jail's configuration is mostly done by setting
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variables. A special subtree of sysctl exists as a basis for organizing
all the relevant options: the ``security.jail.*`` hierarchy of FreeBSD
kernel options. Here is a list of the main jail-related sysctls,
complete with their default value. Names should be self-explanatory, but
for more information about them, please refer to the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
and
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
manual pages.

.. raw:: html

   <div class="itemizedlist">

-  ``security.jail.set_hostname_allowed:           1``

-  ``security.jail.socket_unixiproute_only:           1``

-  ``security.jail.sysvipc_allowed:           0``

-  ``security.jail.enforce_statfs:           2``

-  ``security.jail.allow_raw_sockets:           0``

-  ``security.jail.chflags_allowed:           0``

-  ``security.jail.jailed: 0``

.. raw:: html

   </div>

These variables can be used by the system administrator of the *host
system* to add or remove some of the limitations imposed by default on
the ``root`` user. Note that there are some limitations which cannot be
removed. The ``root`` user is not allowed to mount or unmount file
systems from within a
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.
The ``root`` inside a jail may not load or unload
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8>`__
rulesets, set firewall rules, or do many other administrative tasks
which require modifications of in-kernel data, such as setting the
``securelevel`` of the kernel.

The base system of FreeBSD contains a basic set of tools for viewing
information about the active jails, and attaching to a jail to run
administrative commands. The
`jls(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jls&sektion=8>`__ and
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
commands are part of the base FreeBSD system, and can be used to perform
the following simple tasks:

.. raw:: html

   <div class="itemizedlist">

-  Print a list of active jails and their corresponding jail identifier
   (JID), IP address, hostname and path.

-  Attach to a running jail, from its host system, and run a command
   inside the jail or perform administrative tasks inside the jail
   itself. This is especially useful when the ``root`` user wants to
   cleanly shut down a jail. The
   `jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
   utility can also be used to start a shell in a jail to do
   administration in it; for example:

   .. code:: screen

       # jexec 1 tcsh

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

15.4.2.?High-Level Administrative Tools in the FreeBSD Ports Collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Among the many third-party utilities for jail administration, one of the
most complete and useful is
`sysutils/ezjail <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/ezjail/pkg-descr>`__.
It is a set of scripts that contribute to
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
management. Please refer to `the handbook section on
ezjail <../../../../doc/en_US.ISO8859-1/books/handbook/jails-ezjail.html>`__
for more information.

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

15.4.3.?Keeping Jails Patched and up to Date
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jails should be kept up to date from the host operating system as
attempting to patch userland from within the jail may likely fail as the
default behaviour in FreeBSD is to disallow the use of
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__
in a jail which prevents the replacement of some files. It is possible
to change this behavior but it is recommended to use
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
to maintain jails instead. Use ``-b`` to specify the path of the jail to
be updated.

.. code:: screen

    # freebsd-update -b /here/is/the/jail fetch
    # freebsd-update -b /here/is/the/jail install

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+----------------------------------------+
| `Prev <jails-build.html>`__?            | `Up <jails.html>`__     | ?\ `Next <jails-application.html>`__   |
+-----------------------------------------+-------------------------+----------------------------------------+
| 15.3.?Creating and Controlling Jails?   | `Home <index.html>`__   | ?15.5.?Updating Multiple Jails         |
+-----------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
