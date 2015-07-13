===============================
17.4.?Working with Audit Trails
===============================

.. raw:: html

   <div class="navheader">

17.4.?Working with Audit Trails
`Prev <audit-config.html>`__?
Chapter?17.?Security Event Auditing
?\ `Next <disks.html>`__

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

17.4.?Working with Audit Trails
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since audit trails are stored in the BSM binary format, several built-in
tools are available to modify or convert these trails to text. To
convert trail files to a simple text format, use ``praudit``. To reduce
the audit trail file for analysis, archiving, or printing purposes, use
``auditreduce``. This utility supports a variety of selection
parameters, including event type, event class, user, date or time of the
event, and the file path or object acted on.

For example, to dump the entire contents of a specified audit log in
plain text:

.. code:: screen

    # praudit /var/audit/AUDITFILE

Where *``AUDITFILE``* is the audit log to dump.

Audit trails consist of a series of audit records made up of tokens,
which ``praudit`` prints sequentially, one per line. Each token is of a
specific type, such as ``header`` (an audit record header) or ``path``
(a file path from a name lookup). The following is an example of an
``execve`` event:

.. code:: programlisting

    header,133,10,execve(2),0,Mon Sep 25 15:58:03 2006, + 384 msec
    exec arg,finger,doug
    path,/usr/bin/finger
    attribute,555,root,wheel,90,24918,104944
    subject,robert,root,wheel,root,wheel,38439,38032,42086,128.232.9.100
    return,success,0
    trailer,133

This audit represents a successful ``execve`` call, in which the command
``finger doug`` has been run. The ``exec arg`` token contains the
processed command line presented by the shell to the kernel. The
``path`` token holds the path to the executable as looked up by the
kernel. The ``attribute`` token describes the binary and includes the
file mode. The ``subject`` token stores the audit user ID, effective
user ID and group ID, real user ID and group ID, process ID, session ID,
port ID, and login address. Notice that the audit user ID and real user
ID differ as the user ``robert`` switched to the ``root`` account before
running this command, but it is audited using the original authenticated
user. The ``return`` token indicates the successful execution and the
``trailer`` concludes the record.

XML output format is also supported and can be selected by including
``-x``.

Since audit logs may be very large, a subset of records can be selected
using ``auditreduce``. This example selects all audit records produced
for the user ``trhodes`` stored in ``AUDITFILE``:

.. code:: screen

    # auditreduce -u trhodes /var/audit/AUDITFILE | praudit

Members of the ``audit`` group have permission to read audit trails in
``/var/audit``. By default, this group is empty, so only the ``root``
user can read audit trails. Users may be added to the ``audit`` group in
order to delegate audit review rights. As the ability to track audit log
contents provides significant insight into the behavior of users and
processes, it is recommended that the delegation of audit review rights
be performed with caution.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.1.?Live Monitoring Using Audit Pipes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Audit pipes are cloning pseudo-devices which allow applications to tap
the live audit record stream. This is primarily of interest to authors
of intrusion detection and system monitoring applications. However, the
audit pipe device is a convenient way for the administrator to allow
live monitoring without running into problems with audit trail file
ownership or log rotation interrupting the event stream. To track the
live audit event stream:

.. code:: screen

    # praudit /dev/auditpipe

By default, audit pipe device nodes are accessible only to the ``root``
user. To make them accessible to the members of the ``audit`` group, add
a ``devfs`` rule to ``/etc/devfs.rules``:

.. code:: programlisting

    add path 'auditpipe*' mode 0440 group audit

See
`devfs.rules(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs.rules&sektion=5>`__
for more information on configuring the devfs file system.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

It is easy to produce audit event feedback cycles, in which the viewing
of each audit event results in the generation of more audit events. For
example, if all network I/O is audited, and ``praudit`` is run from an
SSH session, a continuous stream of audit events will be generated at a
high rate, as each event being printed will generate another event. For
this reason, it is advisable to run ``praudit`` on an audit pipe device
from sessions without fine-grained I/O auditing.

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

17.4.2.?Rotating and Compressing Audit Trail Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Audit trails are written to by the kernel and managed by the audit
daemon,
`auditd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=auditd&sektion=8>`__.
Administrators should not attempt to use
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5>`__
or other tools to directly rotate audit logs. Instead, ``audit`` should
be used to shut down auditing, reconfigure the audit system, and perform
log rotation. The following command causes the audit daemon to create a
new audit log and signal the kernel to switch to using the new log. The
old log will be terminated and renamed, at which point it may then be
manipulated by the administrator:

.. code:: screen

    # audit -n

If
`auditd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=auditd&sektion=8>`__
is not currently running, this command will fail and an error message
will be produced.

Adding the following line to ``/etc/crontab`` will schedule this
rotation every twelve hours:

.. code:: programlisting

    0     */12       *       *       *       root    /usr/sbin/audit -n

The change will take effect once ``/etc/crontab`` is saved.

Automatic rotation of the audit trail file based on file size is
possible using ``filesz`` in ``audit_control`` as described in
`Section?17.3.2.1, “The ``audit_control``
File” <audit-config.html#audit-auditcontrol>`__.

As audit trail files can become very large, it is often desirable to
compress or otherwise archive trails once they have been closed by the
audit daemon. The ``audit_warn`` script can be used to perform
customized operations for a variety of audit-related events, including
the clean termination of audit trails when they are rotated. For
example, the following may be added to ``/etc/security/audit_warn`` to
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
trail to remove unneeded records. This script will be run only when
audit trail files are cleanly terminated, so will not be run on trails
left unterminated following an improper shutdown.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+----------------------------+
| `Prev <audit-config.html>`__?   | `Up <audit.html>`__     | ?\ `Next <disks.html>`__   |
+---------------------------------+-------------------------+----------------------------+
| 17.3.?Audit Configuration?      | `Home <index.html>`__   | ?Chapter?18.?Storage       |
+---------------------------------+-------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
