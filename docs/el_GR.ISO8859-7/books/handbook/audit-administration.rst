=======================================
18.5. Administering the Audit Subsystem
=======================================

.. raw:: html

   <div class="navheader">

18.5. Administering the Audit Subsystem
`????? <audit-config.html>`__?
???????? 18. ??????? ????????? ?????????
?\ `??????? <disks.html>`__

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

18.5. Administering the Audit Subsystem
---------------------------------------

.. raw:: html

   </div>

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

18.5.1. Viewing Audit Trails
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Audit trails are stored in the BSM binary format, so tools must be used
to modify or convert to text. The ``praudit`` command convert trail
files to a simple text format; the ``auditreduce`` command may be used
to reduce the audit trail file for analysis, archiving, or printing
purposes. ``auditreduce`` supports a variety of selection parameters,
including event type, event class, user, date or time of the event, and
the file path or object acted on.

For example, the ``praudit`` utility will dump the entire contents of a
specified audit log in plain text:

.. code:: screen

    # praudit /var/audit/AUDITFILE

Where *``AUDITFILE``* is the audit log to dump.

Audit trails consist of a series of audit records made up of tokens,
which ``praudit`` prints sequentially one per line. Each token is of a
specific type, such as ``header`` holding an audit record header, or
``path`` holding a file path from a name lookup. The following is an
example of an ``execve`` event:

.. code:: programlisting

    header,133,10,execve(2),0,Mon Sep 25 15:58:03 2006, + 384 msec
    exec arg,finger,doug
    path,/usr/bin/finger
    attribute,555,root,wheel,90,24918,104944
    subject,robert,root,wheel,root,wheel,38439,38032,42086,128.232.9.100
    return,success,0
    trailer,133

This audit represents a successful ``execve`` call, in which the command
``finger doug`` has been run. The arguments token contains both the
processed command line presented by the shell to the kernel. The path
token holds the path to the executable as looked up by the kernel. The
attribute token describes the binary, and in particular, includes the
file mode which can be used to determine if the application was setuid.
The subject token describes the subject process, and stores in sequence
the audit user ID, effective user ID and group ID, real user ID and
group ID, process ID, session ID, port ID, and login address. Notice
that the audit user ID and real user ID differ: the user ``robert`` has
switched to the ``root`` account before running this command, but it is
audited using the original authenticated user. Finally, the return token
indicates the successful execution, and the trailer concludes the
record.

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

18.5.2. Reducing Audit Trails
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since audit logs may be very large, an administrator will likely want to
select a subset of records for using, such as records associated with a
specific user:

.. code:: screen

    # auditreduce -u trhodes /var/audit/AUDITFILE | praudit

This will select all audit records produced for the user ``trhodes``
stored in the ``AUDITFILE`` file.

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

18.5.3. Delegating Audit Review Rights
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Members of the ``audit`` group are given permission to read audit trails
in ``/var/audit``; by default, this group is empty, so only the ``root``
user may read audit trails. Users may be added to the ``audit`` group in
order to delegate audit review rights to the user. As the ability to
track audit log contents provides significant insight into the behavior
of users and processes, it is recommended that the delegation of audit
review rights be performed with caution.

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

18.5.4. Live Monitoring Using Audit Pipes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Audit pipes are cloning pseudo-devices in the device file system which
allow applications to tap the live audit record stream. This is
primarily of interest to authors of intrusion detection and system
monitoring applications. However, for the administrator the audit pipe
device is a convenient way to allow live monitoring without running into
problems with audit trail file ownership or log rotation interrupting
the event stream. To track the live audit event stream, use the
following command line

.. code:: screen

    # praudit /dev/auditpipe

By default, audit pipe device nodes are accessible only to the ``root``
user. To make them accessible to the members of the ``audit`` group, add
a ``devfs`` rule to ``devfs.rules``:

.. code:: programlisting

    add path 'auditpipe*' mode 0440 group audit

See
`devfs.rules(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs.rules&sektion=5>`__
for more information on configuring the devfs file system.

.. raw:: html

   <div class="warning" xmlns="">

?????????????:
~~~~~~~~~~~~~~

It is easy to produce audit event feedback cycles, in which the viewing
of each audit event results in the generation of more audit events. For
example, if all network I/O is audited, and praudit is run from an SSH
session, then a continuous stream of audit events will be generated at a
high rate, as each event being printed will generate another event. It
is advisable to run praudit on an audit pipe device from sessions
without fine-grained I/O auditing in order to avoid this happening.

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

18.5.5. Rotating Audit Trail Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Audit trails are written to only by the kernel, and managed only by the
audit daemon, auditd. Administrators should not attempt to use
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5>`__
or other tools to directly rotate audit logs. Instead, the ``audit``
management tool may be used to shut down auditing, reconfigure the audit
system, and perform log rotation. The following command causes the audit
daemon to create a new audit log and signal the kernel to switch to
using the new log. The old log will be terminated and renamed, at which
point it may then be manipulated by the administrator.

.. code:: screen

    # audit -n

.. raw:: html

   <div class="warning" xmlns="">

?????????????:
~~~~~~~~~~~~~~

If the auditd daemon is not currently running, this command will fail
and an error message will be produced.

.. raw:: html

   </div>

Adding the following line to ``/etc/crontab`` will force the rotation
every twelve hours from
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__:

.. code:: programlisting

    0     */12       *       *       *       root    /usr/sbin/audit -n

The change will take effect once you have saved the new
``/etc/crontab``.

Automatic rotation of the audit trail file based on file size is
possible via the ``filesz`` option in
`audit\_control(5) <http://www.FreeBSD.org/cgi/man.cgi?query=audit_control&sektion=5>`__,
and is described in the configuration files section of this chapter.

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

18.5.6. Compressing Audit Trails
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As audit trail files can become very large, it is often desirable to
compress or otherwise archive trails once they have been closed by the
audit daemon. The ``audit_warn`` script can be used to perform
customized operations for a variety of audit-related events, including
the clean termination of audit trails when they are rotated. For
example, the following may be added to the ``audit_warn`` script to
compress audit trails on close:

.. code:: programlisting

    #
    # Compress audit trail files on close.
    #
    if [ "$1" = closefile ]; then
            gzip -9 $2
    fi

Other archiving activities might include copying trail files to a
centralized server, deleting old trail files, or reducing the audit
trail to remove unneeded records. The script will be run only when audit
trail files are cleanly terminated, so will not be run on trails left
unterminated following an improper shutdown.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-----------------------------------+
| `????? <audit-config.html>`__?   | `???? <audit.html>`__   | ?\ `??????? <disks.html>`__       |
+----------------------------------+-------------------------+-----------------------------------+
| 18.4. Audit Configuration?       | `???? <index.html>`__   | ????????? 19. ???????????? ????   |
+----------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
