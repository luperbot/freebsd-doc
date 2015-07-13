================
4.4.?Permissions
================

.. raw:: html

   <div class="navheader">

4.4.?Permissions
`Prev <users-synopsis.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <dirstructure.html>`__

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

4.4.?Permissions
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD, every file and directory has an associated set of
permissions and several utilities are available for viewing and
modifying these permissions. Understanding how permissions work is
necessary to make sure that users are able to access the files that they
need and are unable to improperly access the files used by the operating
system or owned by other users.

This section discusses the traditional UNIX? permissions used in
FreeBSD. For finer grained file system access control, refer to
`Section?14.9, “Access Control Lists” <fs-acl.html>`__.

In UNIX?, basic permissions are assigned using three types of access:
read, write, and execute. These access types are used to determine file
access to the file's owner, group, and others (everyone else). The read,
write, and execute permissions can be represented as the letters ``r``,
``w``, and ``x``. They can also be represented as binary numbers as each
permission is either on or off (``0``). When represented as a number,
the order is always read as ``rwx``, where ``r`` has an on value of
``4``, ``w`` has an on value of ``2`` and ``x`` has an on value of
``1``.

Table 4.1 summarizes the possible numeric and alphabetic possibilities.
When reading the “Directory Listing” column, a ``-`` is used to
represent a permission that is set to off.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?4.2.?UNIX? Permissions

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------+---------------------------------+---------------------+
| Value   | Permission                      | Directory Listing   |
+=========+=================================+=====================+
| 0       | No read, no write, no execute   | ``---``             |
+---------+---------------------------------+---------------------+
| 1       | No read, no write, execute      | ``--x``             |
+---------+---------------------------------+---------------------+
| 2       | No read, write, no execute      | ``-w-``             |
+---------+---------------------------------+---------------------+
| 3       | No read, write, execute         | ``-wx``             |
+---------+---------------------------------+---------------------+
| 4       | Read, no write, no execute      | ``r--``             |
+---------+---------------------------------+---------------------+
| 5       | Read, no write, execute         | ``r-x``             |
+---------+---------------------------------+---------------------+
| 6       | Read, write, no execute         | ``rw-``             |
+---------+---------------------------------+---------------------+
| 7       | Read, write, execute            | ``rwx``             |
+---------+---------------------------------+---------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Use the ``-l`` argument to
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ to
view a long directory listing that includes a column of information
about a file's permissions for the owner, group, and everyone else. For
example, a ``ls -l`` in an arbitrary directory may show:

.. code:: screen

    % ls -l
    total 530
    -rw-r--r--  1 root  wheel     512 Sep  5 12:31 myfile
    -rw-r--r--  1 root  wheel     512 Sep  5 12:31 otherfile
    -rw-r--r--  1 root  wheel    7680 Sep  5 12:31 email.txt

The first (leftmost) character in the first column indicates whether
this file is a regular file, a directory, a special character device, a
socket, or any other special pseudo-file device. In this example, the
``-`` indicates a regular file. The next three characters, ``rw-`` in
this example, give the permissions for the owner of the file. The next
three characters, ``r--``, give the permissions for the group that the
file belongs to. The final three characters, ``r--``, give the
permissions for the rest of the world. A dash means that the permission
is turned off. In this example, the permissions are set so the owner can
read and write to the file, the group can read the file, and the rest of
the world can only read the file. According to the table above, the
permissions for this file would be ``644``, where each digit represents
the three parts of the file's permission.

How does the system control permissions on devices? FreeBSD treats most
hardware devices as a file that programs can open, read, and write data
to. These special device files are stored in ``/dev/``.

Directories are also treated as files. They have read, write, and
execute permissions. The executable bit for a directory has a slightly
different meaning than that of files. When a directory is marked
executable, it means it is possible to change into that directory using
`cd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=1>`__. This
also means that it is possible to access the files within that
directory, subject to the permissions on the files themselves.

In order to perform a directory listing, the read permission must be set
on the directory. In order to delete a file that one knows the name of,
it is necessary to have write *and* execute permissions to the directory
containing the file.

There are more permission bits, but they are primarily used in special
circumstances such as setuid binaries and sticky directories. For more
information on file permissions and how to set them, refer to
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.4.1.?Symbolic Permissions
~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Symbolic permissions use characters instead of octal values to assign
permissions to files or directories. Symbolic permissions use the syntax
of (who) (action) (permissions), where the following values are
available:

.. raw:: html

   <div class="informaltable">

+-----------------+----------+------------------------------+
| Option          | Letter   | Represents                   |
+=================+==========+==============================+
| (who)           | u        | User                         |
+-----------------+----------+------------------------------+
| (who)           | g        | Group owner                  |
+-----------------+----------+------------------------------+
| (who)           | o        | Other                        |
+-----------------+----------+------------------------------+
| (who)           | a        | All (“world”)                |
+-----------------+----------+------------------------------+
| (action)        | +        | Adding permissions           |
+-----------------+----------+------------------------------+
| (action)        | -        | Removing permissions         |
+-----------------+----------+------------------------------+
| (action)        | =        | Explicitly set permissions   |
+-----------------+----------+------------------------------+
| (permissions)   | r        | Read                         |
+-----------------+----------+------------------------------+
| (permissions)   | w        | Write                        |
+-----------------+----------+------------------------------+
| (permissions)   | x        | Execute                      |
+-----------------+----------+------------------------------+
| (permissions)   | t        | Sticky bit                   |
+-----------------+----------+------------------------------+
| (permissions)   | s        | Set UID or GID               |
+-----------------+----------+------------------------------+

.. raw:: html

   </div>

These values are used with
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__,
but with letters instead of numbers. For example, the following command
would block other users from accessing *``FILE``*:

.. code:: screen

    % chmod go= FILE

A comma separated list can be provided when more than one set of changes
to a file must be made. For example, the following command removes the
group and “world” write permission on *``FILE``*, and adds the execute
permissions for everyone:

.. code:: screen

    % chmod go-w,a+x FILE

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

4.4.2.?FreeBSD File Flags
~~~~~~~~~~~~~~~~~~~~~~~~~

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

In addition to file permissions, FreeBSD supports the use of “file
flags”. These flags add an additional level of security and control over
files, but not directories. With file flags, even ``root`` can be
prevented from removing or altering files.

File flags are modified using
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__.
For example, to enable the system undeletable flag on the file
``file1``, issue the following command:

.. code:: screen

    # chflags sunlink file1

To disable the system undeletable flag, put a “no” in front of the
``sunlink``:

.. code:: screen

    # chflags nosunlink file1

To view the flags of a file, use ``-lo`` with
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__:

.. code:: screen

    # ls -lo file1

.. code:: programlisting

    -rw-r--r--  1 trhodes  trhodes  sunlnk 0 Mar  1 05:54 file1

Several file flags may only be added or removed by the ``root`` user. In
other cases, the file owner may set its file flags. Refer to
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__
and
`chflags(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=2>`__
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

4.4.3.?The ``setuid``, ``setgid``, and ``sticky`` Permissions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Other than the permissions already discussed, there are three other
specific settings that all administrators should know about. They are
the ``setuid``, ``setgid``, and ``sticky`` permissions.

These settings are important for some UNIX? operations as they provide
functionality not normally granted to normal users. To understand them,
the difference between the real user ID and effective user ID must be
noted.

The real user ID is the UID who owns or starts the process. The
effective UID is the user ID the process runs as. As an example,
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__
runs with the real user ID when a user changes their password. However,
in order to update the password database, the command runs as the
effective ID of the ``root`` user. This allows users to change their
passwords without seeing a Permission Denied error.

The setuid permission may be set by prefixing a permission set with the
number four (4) as shown in the following example:

.. code:: screen

    # chmod 4755 suidexample.sh

The permissions on ``suidexample.sh`` now look like the following:

.. code:: programlisting

    -rwsr-xr-x   1 trhodes  trhodes    63 Aug 29 06:36 suidexample.sh

Note that a ``s`` is now part of the permission set designated for the
file owner, replacing the executable bit. This allows utilities which
need elevated permissions, such as
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The ``nosuid``
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
option will cause such binaries to silently fail without alerting the
user. That option is not completely reliable as a ``nosuid`` wrapper may
be able to circumvent it.

.. raw:: html

   </div>

To view this in real time, open two terminals. On one, type ``passwd``
as a normal user. While it waits for a new password, check the process
table and look at the user information for
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__:

In terminal A:

.. code:: screen

    Changing local password for trhodes
    Old Password:

In terminal B:

.. code:: screen

    # ps aux | grep passwd

.. code:: screen

    trhodes  5232  0.0  0.2  3420  1608   0  R+    2:10AM   0:00.00 grep passwd
    root     5211  0.0  0.2  3620  1724   2  I+    2:09AM   0:00.01 passwd

Although
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__
is run as a normal user, it is using the effective UID of ``root``.

The ``setgid`` permission performs the same function as the ``setuid``
permission; except that it alters the group settings. When an
application or utility executes with this setting, it will be granted
the permissions based on the group that owns the file, not the user who
started the process.

To set the ``setgid`` permission on a file, provide
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
with a leading two (2):

.. code:: screen

    # chmod 2755 sgidexample.sh

In the following listing, notice that the ``s`` is now in the field
designated for the group permission settings:

.. code:: screen

    -rwxr-sr-x   1 trhodes  trhodes    44 Aug 31 01:49 sgidexample.sh

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In these examples, even though the shell script in question is an
executable file, it will not run with a different EUID or effective user
ID. This is because shell scripts may not access the
`setuid(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setuid&sektion=2>`__
system calls.

.. raw:: html

   </div>

The ``setuid`` and ``setgid`` permission bits may lower system security,
by allowing for elevated permissions. The third special permission, the
``sticky bit``, can strengthen the security of a system.

When the ``sticky bit`` is set on a directory, it allows file deletion
only by the file owner. This is useful to prevent file deletion in
public directories, such as ``/tmp``, by users who do not own the file.
To utilize this permission, prefix the permission set with a one (1):

.. code:: screen

    # chmod 1777 /tmp

The ``sticky bit`` permission will display as a ``t`` at the very end of
the permission set:

.. code:: screen

    # ls -al / | grep tmp

.. code:: screen

    drwxrwxrwt  10 root  wheel         512 Aug 31 01:49 tmp

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------+-----------------------------------+
| `Prev <users-synopsis.html>`__?            | `Up <basics.html>`__    | ?\ `Next <dirstructure.html>`__   |
+--------------------------------------------+-------------------------+-----------------------------------+
| 4.3.?Users and Basic Account Management?   | `Home <index.html>`__   | ?4.5.?Directory Structure         |
+--------------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
