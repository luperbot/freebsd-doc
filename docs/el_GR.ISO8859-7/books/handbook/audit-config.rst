=========================
18.4. Audit Configuration
=========================

.. raw:: html

   <div class="navheader">

18.4. Audit Configuration
`????? <audit-install.html>`__?
???????? 18. ??????? ????????? ?????????
?\ `??????? <audit-administration.html>`__

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

18.4. Audit Configuration
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All configuration files for security audit are found in
``/etc/security``. The following files must be present before the audit
daemon is started:

.. raw:: html

   <div class="itemizedlist">

-  ``audit_class`` - Contains the definitions of the audit classes.

-  ``audit_control`` - Controls aspects of the audit subsystem, such as
   default audit classes, minimum disk space to leave on the audit log
   volume, maximum audit trail size, etc.

-  ``audit_event`` - Textual names and descriptions of system audit
   events, as well as a list of which classes each event in in.

-  ``audit_user`` - User-specific audit requirements, which are combined
   with the global defaults at login.

-  ``audit_warn`` - A customizable shell script used by auditd to
   generate warning messages in exceptional situations, such as when
   space for audit records is running low or when the audit trail file
   has been rotated.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

?????????????:
~~~~~~~~~~~~~~

Audit configuration files should be edited and maintained carefully, as
errors in configuration may result in improper logging of events.

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

18.4.1. Event Selection Expressions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Selection expressions are used in a number of places in the audit
configuration to determine which events should be audited. Expressions
contain a list of event classes to match, each with a prefix indicating
whether matching records should be accepted or ignored, and optionally
to indicate if the entry is intended to match successful or failed
operations. Selection expressions are evaluated from left to right, and
two expressions are combined by appending one onto the other.

The following list contains the default audit event classes present in
``audit_class``:

.. raw:: html

   <div class="itemizedlist">

-  ``all`` - ``all`` - Match all event classes.

-  ``ad`` - ``administrative`` - Administrative actions performed on the
   system as a whole.

-  ``ap`` - ``application`` - Application defined action.

-  ``cl`` - ``file_close`` - Audit calls to the ``close`` system call.

-  ``ex`` - ``exec`` - Audit program execution. Auditing of command line
   arguments and environmental variables is controlled via
   `audit\_control(5) <http://www.FreeBSD.org/cgi/man.cgi?query=audit_control&sektion=5>`__
   using the ``argv`` and ``envv`` parameters to the ``policy`` setting.

-  ``fa`` - ``file_attr_acc`` - Audit the access of object attributes
   such as
   `stat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=1>`__,
   `pathconf(2) <http://www.FreeBSD.org/cgi/man.cgi?query=pathconf&sektion=2>`__
   and similar events.

-  ``fc`` - ``file_creation`` - Audit events where a file is created as
   a result.

-  ``fd`` - ``file_deletion`` - Audit events where file deletion occurs.

-  ``fm`` - ``file_attr_mod`` - Audit events where file attribute
   modification occurs, such as
   `chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8>`__,
   `chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__,
   `flock(2) <http://www.FreeBSD.org/cgi/man.cgi?query=flock&sektion=2>`__,
   etc.

-  ``fr`` - ``file_read`` - Audit events in which data is read, files
   are opened for reading, etc.

-  ``fw`` - ``file_write`` - Audit events in which data is written,
   files are written or modified, etc.

-  ``io`` - ``ioctl`` - Audit use of the
   `ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2>`__
   system call.

-  ``ip`` - ``ipc`` - Audit various forms of Inter-Process
   Communication, including POSIX pipes and System V IPC operations.

-  ``lo`` - ``login_logout`` - Audit
   `login(1) <http://www.FreeBSD.org/cgi/man.cgi?query=login&sektion=1>`__
   and
   `logout(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logout&sektion=1>`__
   events occurring on the system.

-  ``na`` - ``non_attrib`` - Audit non-attributable events.

-  ``no`` - ``no_class`` - Match no audit events.

-  ``nt`` - ``network`` - Audit events related to network actions, such
   as
   `connect(2) <http://www.FreeBSD.org/cgi/man.cgi?query=connect&sektion=2>`__
   and
   `accept(2) <http://www.FreeBSD.org/cgi/man.cgi?query=accept&sektion=2>`__.

-  ``ot`` - ``other`` - Audit miscellaneous events.

-  ``pc`` - ``process`` - Audit process operations, such as
   `exec(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exec&sektion=3>`__
   and
   `exit(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exit&sektion=3>`__.

.. raw:: html

   </div>

These audit event classes may be customized by modifying the
``audit_class`` and ``audit_event`` configuration files.

Each audit class in the list is combined with a prefix indicating
whether successful/failed operations are matched, and whether the entry
is adding or removing matching for the class and type.

.. raw:: html

   <div class="itemizedlist">

-  (none) Audit both successful and failed instances of the event.

-  ``+`` Audit successful events in this class.

-  ``-`` Audit failed events in this class.

-  ``^`` Audit neither successful nor failed events in this class.

-  ``^+`` Don't audit successful events in this class.

-  ``^-`` Don't audit failed events in this class.

.. raw:: html

   </div>

The following example selection string selects both successful and
failed login/logout events, but only successful execution events:

.. code:: programlisting

    lo,+ex

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

18.4.2. Configuration Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In most cases, administrators will need to modify only two files when
configuring the audit system: ``audit_control`` and ``audit_user``. The
first controls system-wide audit properties and policies; the second may
be used to fine-tune auditing by user.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.4.2.1. The ``audit_control`` File
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``audit_control`` file specifies a number of defaults for the audit
subsystem. Viewing the contents of this file, we see the following:

.. code:: programlisting

    dir:/var/audit
    flags:lo
    minfree:20
    naflags:lo
    policy:cnt
    filesz:0

The ``dir`` option is used to set one or more directories where audit
logs will be stored. If more than one directory entry appears, they will
be used in order as they fill. It is common to configure audit so that
audit logs are stored on a dedicated file system, in order to prevent
interference between the audit subsystem and other subsystems if the
file system fills.

The ``flags`` field sets the system-wide default preselection mask for
attributable events. In the example above, successful and failed login
and logout events are audited for all users.

The ``minfree`` option defines the minimum percentage of free space for
the file system where the audit trail is stored. When this threshold is
exceeded, a warning will be generated. The above example sets the
minimum free space to twenty percent.

The ``naflags`` option specifies audit classes to be audited for
non-attributed events, such as the login process and system daemons.

The ``policy`` option specifies a comma-separated list of policy flags
controlling various aspects of audit behavior. The default ``cnt`` flag
indicates that the system should continue running despite an auditing
failure (this flag is highly recommended). Another commonly used flag is
``argv``, which causes command line arguments to the
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
system call to audited as part of command execution.

The ``filesz`` option specifies the maximum size in bytes to allow an
audit trail file to grow to before automatically terminating and
rotating the trail file. The default, 0, disables automatic log
rotation. If the requested file size is non-zero and below the minimum
512k, it will be ignored and a log message will be generated.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.4.2.2. The ``audit_user`` File
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``audit_user`` file permits the administrator to specify further
audit requirements for specific users. Each line configures auditing for
a user via two fields: the first is the ``alwaysaudit`` field, which
specifies a set of events that should always be audited for the user,
and the second is the ``neveraudit`` field, which specifies a set of
events that should never be audited for the user.

The following example ``audit_user`` file audits login/logout events and
successful command execution for the root user, and audits file creation
and successful command execution for the www user. If used with the
example ``audit_control`` file above, the ``lo`` entry for ``root`` is
redundant, and login/logout events will also be audited for the ``www``
user.

.. code:: programlisting

    root:lo,+ex:no
    www:fc,+ex:no

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+----------------------------------------------+
| `????? <audit-install.html>`__?   | `???? <audit.html>`__   | ?\ `??????? <audit-administration.html>`__   |
+-----------------------------------+-------------------------+----------------------------------------------+
| 18.3. Installing Audit Support?   | `???? <index.html>`__   | ?18.5. Administering the Audit Subsystem     |
+-----------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
