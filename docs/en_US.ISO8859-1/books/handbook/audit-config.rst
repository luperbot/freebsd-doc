=========================
17.3.?Audit Configuration
=========================

.. raw:: html

   <div class="navheader">

17.3.?Audit Configuration
`Prev <audit-inline-glossary.html>`__?
Chapter?17.?Security Event Auditing
?\ `Next <audit-administration.html>`__

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

17.3.?Audit Configuration
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

User space support for event auditing is installed as part of the base
FreeBSD operating system. Kernel support is available in the ``GENERIC``
kernel by default, and
`auditd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=auditd&sektion=8>`__
can be enabled by adding the following line to ``/etc/rc.conf``:

.. code:: programlisting

    auditd_enable="YES"

Then, start the audit daemon:

.. code:: screen

    # service auditd start

Users who prefer to compile a custom kernel must include the following
line in their custom kernel configuration file:

.. code:: programlisting

    options  AUDIT

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.3.1.?Event Selection Expressions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Selection expressions are used in a number of places in the audit
configuration to determine which events should be audited. Expressions
contain a list of event classes to match. Selection expressions are
evaluated from left to right, and two expressions are combined by
appending one onto the other.

`Table?17.1, “Default Audit Event
Classes” <audit-config.html#event-selection>`__ summarizes the default
audit event classes:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?17.1.?Default Audit Event Classes

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Class Name   | Description                        | Action                                                                                                                                                                                                                                                                                                 |
+==============+====================================+========================================================================================================================================================================================================================================================================================================+
| all          | all                                | Match all event classes.                                                                                                                                                                                                                                                                               |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| aa           | authentication and authorization   | ?                                                                                                                                                                                                                                                                                                      |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ad           | administrative                     | Administrative actions performed on the system as a whole.                                                                                                                                                                                                                                             |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ap           | application                        | Application defined action.                                                                                                                                                                                                                                                                            |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| cl           | file close                         | Audit calls to the ``close`` system call.                                                                                                                                                                                                                                                              |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ex           | exec                               | Audit program execution. Auditing of command line arguments and environmental variables is controlled via `audit\_control(5) <http://www.FreeBSD.org/cgi/man.cgi?query=audit_control&sektion=5>`__ using the ``argv`` and ``envv`` parameters to the ``policy`` setting.                               |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| fa           | file attribute access              | Audit the access of object attributes such as `stat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=1>`__ and `pathconf(2) <http://www.FreeBSD.org/cgi/man.cgi?query=pathconf&sektion=2>`__.                                                                                                 |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| fc           | file create                        | Audit events where a file is created as a result.                                                                                                                                                                                                                                                      |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| fd           | file delete                        | Audit events where file deletion occurs.                                                                                                                                                                                                                                                               |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| fm           | file attribute modify              | Audit events where file attribute modification occurs, such as by `chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8>`__, `chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__, and `flock(2) <http://www.FreeBSD.org/cgi/man.cgi?query=flock&sektion=2>`__.   |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| fr           | file read                          | Audit events in which data is read or files are opened for reading.                                                                                                                                                                                                                                    |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| fw           | file write                         | Audit events in which data is written or files are written or modified.                                                                                                                                                                                                                                |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| io           | ioctl                              | Audit use of the ``ioctl`` system call.                                                                                                                                                                                                                                                                |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ip           | ipc                                | Audit various forms of Inter-Process Communication, including POSIX pipes and System V IPC operations.                                                                                                                                                                                                 |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| lo           | login\_logout                      | Audit `login(1) <http://www.FreeBSD.org/cgi/man.cgi?query=login&sektion=1>`__ and `logout(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logout&sektion=1>`__ events.                                                                                                                                    |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| na           | non attributable                   | Audit non-attributable events.                                                                                                                                                                                                                                                                         |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| no           | invalid class                      | Match no audit events.                                                                                                                                                                                                                                                                                 |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| nt           | network                            | Audit events related to network actions such as `connect(2) <http://www.FreeBSD.org/cgi/man.cgi?query=connect&sektion=2>`__ and `accept(2) <http://www.FreeBSD.org/cgi/man.cgi?query=accept&sektion=2>`__.                                                                                             |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ot           | other                              | Audit miscellaneous events.                                                                                                                                                                                                                                                                            |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| pc           | process                            | Audit process operations such as `exec(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exec&sektion=3>`__ and `exit(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exit&sektion=3>`__.                                                                                                                      |
+--------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

These audit event classes may be customized by modifying the
``audit_class`` and ``audit_event`` configuration files.

Each audit event class may be combined with a prefix indicating whether
successful/failed operations are matched, and whether the entry is
adding or removing matching for the class and type. `Table?17.2,
“Prefixes for Audit Event Classes” <audit-config.html#event-prefixes>`__
summarizes the available prefixes:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?17.2.?Prefixes for Audit Event Classes

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------+-------------------------------------------------------------+
| Prefix   | Action                                                      |
+==========+=============================================================+
| +        | Audit successful events in this class.                      |
+----------+-------------------------------------------------------------+
| -        | Audit failed events in this class.                          |
+----------+-------------------------------------------------------------+
| ^        | Audit neither successful nor failed events in this class.   |
+----------+-------------------------------------------------------------+
| ^+       | Do not audit successful events in this class.               |
+----------+-------------------------------------------------------------+
| ^-       | Do not audit failed events in this class.                   |
+----------+-------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

If no prefix is present, both successful and failed instances of the
event will be audited.

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

17.3.2.?Configuration Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following configuration files for security event auditing are found
in ``/etc/security``:

.. raw:: html

   <div class="itemizedlist">

-  ``audit_class``: contains the definitions of the audit classes.

-  ``audit_control``: controls aspects of the audit subsystem, such as
   default audit classes, minimum disk space to leave on the audit log
   volume, and maximum audit trail size.

-  ``audit_event``: textual names and descriptions of system audit
   events and a list of which classes each event is in.

-  ``audit_user``: user-specific audit requirements to be combined with
   the global defaults at login.

-  ``audit_warn``: a customizable shell script used by
   `auditd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=auditd&sektion=8>`__
   to generate warning messages in exceptional situations, such as when
   space for audit records is running low or when the audit trail file
   has been rotated.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Audit configuration files should be edited and maintained carefully, as
errors in configuration may result in improper logging of events.

.. raw:: html

   </div>

In most cases, administrators will only need to modify ``audit_control``
and ``audit_user``. The first file controls system-wide audit properties
and policies and the second file may be used to fine-tune auditing by
user.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.3.2.1.?The ``audit_control`` File
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A number of defaults for the audit subsystem are specified in
``audit_control``:

.. code:: programlisting

    dir:/var/audit
    dist:off
    flags:lo,aa
    minfree:5
    naflags:lo,aa
    policy:cnt,argv
    filesz:2M
    expire-after:10M

The ``dir`` entry is used to set one or more directories where audit
logs will be stored. If more than one directory entry appears, they will
be used in order as they fill. It is common to configure audit so that
audit logs are stored on a dedicated file system, in order to prevent
interference between the audit subsystem and other subsystems if the
file system fills.

If the ``dist`` field is set to ``on`` or ``yes``, hard links will be
created to all trail files in ``/var/audit/dist``.

The ``flags`` field sets the system-wide default preselection mask for
attributable events. In the example above, successful and failed
login/logout events as well as authentication and authorization are
audited for all users.

The ``minfree`` entry defines the minimum percentage of free space for
the file system where the audit trail is stored.

The ``naflags`` entry specifies audit classes to be audited for
non-attributed events, such as the login/logout process and
authentication and authorization.

The ``policy`` entry specifies a comma-separated list of policy flags
controlling various aspects of audit behavior. The ``cnt`` indicates
that the system should continue running despite an auditing failure
(this flag is highly recommended). The other flag, ``argv``, causes
command line arguments to the
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
system call to be audited as part of command execution.

The ``filesz`` entry specifies the maximum size for an audit trail
before automatically terminating and rotating the trail file. A value of
``0`` disables automatic log rotation. If the requested file size is
below the minimum of 512k, it will be ignored and a log message will be
generated.

The ``expire-after`` field specifies when audit log files will expire
and be removed.

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

17.3.2.2.?The ``audit_user`` File
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The administrator can specify further audit requirements for specific
users in ``audit_user``. Each line configures auditing for a user via
two fields: the ``alwaysaudit`` field specifies a set of events that
should always be audited for the user, and the ``neveraudit`` field
specifies a set of events that should never be audited for the user.

The following example entries audit login/logout events and successful
command execution for ``root`` and file creation and successful command
execution for ``www``. If used with the default ``audit_control``, the
``lo`` entry for ``root`` is redundant, and login/logout events will
also be audited for ``www``.

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

+------------------------------------------+-------------------------+-------------------------------------------+
| `Prev <audit-inline-glossary.html>`__?   | `Up <audit.html>`__     | ?\ `Next <audit-administration.html>`__   |
+------------------------------------------+-------------------------+-------------------------------------------+
| 17.2.?Key Terms?                         | `Home <index.html>`__   | ?17.4.?Working with Audit Trails          |
+------------------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
