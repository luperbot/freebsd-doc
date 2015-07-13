=======================================
4.3.?Users and Basic Account Management
=======================================

.. raw:: html

   <div class="navheader">

4.3.?Users and Basic Account Management
`Prev <consoles.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <permissions.html>`__

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

4.3.?Users and Basic Account Management
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD allows multiple users to use the computer at the same time.
While only one user can sit in front of the screen and use the keyboard
at any one time, any number of users can log in to the system through
the network. To use the system, each user should have their own user
account.

This chapter describes:

.. raw:: html

   <div class="itemizedlist">

-  The different types of user accounts on a FreeBSD system.

-  How to add, remove, and modify user accounts.

-  How to set limits to control the resources that users and groups are
   allowed to access.

-  How to create groups and add users as members of a group.

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

4.3.1.?Account Types
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Since all access to the FreeBSD system is achieved using accounts and
all processes are run by users, user and account management is
important.

There are three main types of accounts: system accounts, user accounts,
and the superuser account.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.1.1.?System Accounts
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

System accounts are used to run services such as DNS, mail, and web
servers. The reason for this is security; if all services ran as the
superuser, they could act without restriction.

Examples of system accounts are ``daemon``, ``operator``, ``bind``,
``news``, and ``www``.

``nobody`` is the generic unprivileged system account. However, the more
services that use ``nobody``, the more files and processes that user
will become associated with, and hence the more privileged that user
becomes.

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

4.3.1.2.?User Accounts
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

User accounts are assigned to real people and are used to log in and use
the system. Every person accessing the system should have a unique user
account. This allows the administrator to find out who is doing what and
prevents users from clobbering the settings of other users.

Each user can set up their own environment to accommodate their use of
the system, by configuring their default shell, editor, key bindings,
and language settings.

Every user account on a FreeBSD system has certain information
associated with it:

.. raw:: html

   <div class="variablelist">

User name
    The user name is typed at the ``login:`` prompt. Each user must have
    a unique user name. There are a number of rules for creating valid
    user names which are documented in
    `passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5>`__.
    It is recommended to use user names that consist of eight or fewer,
    all lower case characters in order to maintain backwards
    compatibility with applications.

Password
    Each account has an associated password.

User ID (UID)
    The User ID (UID) is a number used to uniquely identify the user to
    the FreeBSD system. Commands that allow a user name to be specified
    will first convert it to the UID. It is recommended to use a UID
    less than 65535, since higher values may cause compatibility issues
    with some software.

Group ID (GID)
    The Group ID (GID) is a number used to uniquely identify the primary
    group that the user belongs to. Groups are a mechanism for
    controlling access to resources based on a user's GID rather than
    their UID. This can significantly reduce the size of some
    configuration files and allows users to be members of more than one
    group. It is recommended to use a GID of 65535 or lower as higher
    GIDs may break some software.

Login class
    Login classes are an extension to the group mechanism that provide
    additional flexibility when tailoring the system to different users.
    Login classes are discussed further in `Section?14.13.1,
    “Configuring Login
    Classes” <security-resourcelimits.html#users-limiting>`__.

Password change time
    By default, passwords do not expire. However, password expiration
    can be enabled on a per-user basis, forcing some or all users to
    change their passwords after a certain amount of time has elapsed.

Account expiry time
    By default, FreeBSD does not expire accounts. When creating accounts
    that need a limited lifespan, such as student accounts in a school,
    specify the account expiry date using
    `pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__.
    After the expiry time has elapsed, the account cannot be used to log
    in to the system, although the account's directories and files will
    remain.

User's full name
    The user name uniquely identifies the account to FreeBSD, but does
    not necessarily reflect the user's real name. Similar to a comment,
    this information can contain spaces, uppercase characters, and be
    more than 8 characters long.

Home directory
    The home directory is the full path to a directory on the system.
    This is the user's starting directory when the user logs in. A
    common convention is to put all user home directories under
    ``/home/username`` or ``/usr/home/username``. Each user stores their
    personal files and subdirectories in their own home directory.

User shell
    The shell provides the user's default environment for interacting
    with the system. There are many different kinds of shells and
    experienced users will have their own preferences, which can be
    reflected in their account settings.

.. raw:: html

   </div>

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

4.3.1.3.?The Superuser Account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The superuser account, usually called ``root``, is used to manage the
system with no limitations on privileges. For this reason, it should not
be used for day-to-day tasks like sending and receiving mail, general
exploration of the system, or programming.

The superuser, unlike other user accounts, can operate without limits,
and misuse of the superuser account may result in spectacular disasters.
User accounts are unable to destroy the operating system by mistake, so
it is recommended to login as a user account and to only become the
superuser when a command requires extra privilege.

Always double and triple-check any commands issued as the superuser,
since an extra space or missing character can mean irreparable data
loss.

There are several ways to gain superuser privilege. While one can log in
as ``root``, this is highly discouraged.

Instead, use
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ to
become the superuser. If ``-`` is specified when running this command,
the user will also inherit the root user's environment. The user running
this command must be in the ``wheel`` group or else the command will
fail. The user must also know the password for the ``root`` user
account.

In this example, the user only becomes superuser in order to run
``make install`` as this step requires superuser privilege. Once the
command completes, the user types ``exit`` to leave the superuser
account and return to the privilege of their user account.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.1.?Install a Program As the Superuser

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % configure
    % make
    % su -
    Password:
    # make install
    # exit
    %

.. raw:: html

   </div>

.. raw:: html

   </div>

The built-in
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
framework works well for single systems or small networks with just one
system administrator. An alternative is to install the
`security/sudo <http://www.freebsd.org/cgi/url.cgi?ports/security/sudo/pkg-descr>`__
package or port. This software provides activity logging and allows the
administrator to configure which users can run which commands as the
superuser.

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

4.3.2.?Managing Accounts
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides a variety of different commands to manage user
accounts. The most common commands are summarized in `Table?4.1,
“Utilities for Managing User
Accounts” <users-synopsis.html#users-modifying-utilities>`__, followed
by some examples of their usage. See the manual page for each utility
for more details and usage examples.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?4.1.?Utilities for Managing User Accounts

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------------------------------------------------------------+----------------------------------------------------------------------------+
| Command                                                                       | Summary                                                                    |
+===============================================================================+============================================================================+
| `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__   | The recommended command-line application for adding new users.             |
+-------------------------------------------------------------------------------+----------------------------------------------------------------------------+
| `rmuser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rmuser&sektion=8>`__     | The recommended command-line application for removing users.               |
+-------------------------------------------------------------------------------+----------------------------------------------------------------------------+
| `chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__     | A flexible tool for changing user database information.                    |
+-------------------------------------------------------------------------------+----------------------------------------------------------------------------+
| `passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__     | The command-line tool to change user passwords.                            |
+-------------------------------------------------------------------------------+----------------------------------------------------------------------------+
| `pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__             | A powerful and flexible tool for modifying all aspects of user accounts.   |
+-------------------------------------------------------------------------------+----------------------------------------------------------------------------+

.. raw:: html

   </div>

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

4.3.2.1.?\ ``adduser``
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The recommended program for adding new users is
`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__.
When a new user is added, this program automatically updates
``/etc/passwd`` and ``/etc/group``. It also creates a home directory for
the new user, copies in the default configuration files from
``/usr/share/skel``, and can optionally mail the new user a welcome
message. This utility must be run as the superuser.

The
`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
utility is interactive and walks through the steps for creating a new
user account. As seen in `Example?4.2, “Adding a User on
FreeBSD” <users-synopsis.html#users-modifying-adduser>`__, either input
the required information or press **Return** to accept the default value
shown in square brackets. In this example, the user has been invited
into the ``wheel`` group, allowing them to become the superuser with
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__. When
finished, the utility will prompt to either create another user or to
exit.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.2.?Adding a User on FreeBSD

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # adduser
    Username: jru
    Full name: J. Random User
    Uid (Leave empty for default):
    Login group [jru]:
    Login group is jru. Invite jru into other groups? []: wheel
    Login class [default]:
    Shell (sh csh tcsh zsh nologin) [sh]: zsh
    Home directory [/home/jru]:
    Home directory permissions (Leave empty for default):
    Use password-based authentication? [yes]:
    Use an empty password? (yes/no) [no]:
    Use a random password? (yes/no) [no]:
    Enter password:
    Enter password again:
    Lock out the account after creation? [no]:
    Username   : jru
    Password   : ****
    Full Name  : J. Random User
    Uid        : 1001
    Class      :
    Groups     : jru wheel
    Home       : /home/jru
    Shell      : /usr/local/bin/zsh
    Locked     : no
    OK? (yes/no): yes
    adduser: INFO: Successfully added (jru) to the user database.
    Add another user? (yes/no): no
    Goodbye!
    #

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Since the password is not echoed when typed, be careful to not mistype
the password when creating the user account.

.. raw:: html

   </div>

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

4.3.2.2.?\ ``rmuser``
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To completely remove a user from the system, run
`rmuser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rmuser&sektion=8>`__
as the superuser. This command performs the following steps:

.. raw:: html

   <div class="procedure">

#. Removes the user's
   `crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1>`__
   entry, if one exists.

#. Removes any
   `at(1) <http://www.FreeBSD.org/cgi/man.cgi?query=at&sektion=1>`__
   jobs belonging to the user.

#. Kills all processes owned by the user.

#. Removes the user from the system's local password file.

#. Optionally removes the user's home directory, if it is owned by the
   user.

#. Removes the incoming mail files belonging to the user from
   ``/var/mail``.

#. Removes all files owned by the user from temporary file storage areas
   such as ``/tmp``.

#. Finally, removes the username from all groups to which it belongs in
   ``/etc/group``. If a group becomes empty and the group name is the
   same as the username, the group is removed. This complements the
   per-user unique groups created by
   `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__.

.. raw:: html

   </div>

`rmuser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rmuser&sektion=8>`__
cannot be used to remove superuser accounts since that is almost always
an indication of massive destruction.

By default, an interactive mode is used, as shown in the following
example.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.3.?\ ``rmuser`` Interactive Account Removal

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # rmuser jru
    Matching password entry:
    jru:*:1001:1001::0:0:J. Random User:/home/jru:/usr/local/bin/zsh
    Is this the entry you wish to remove? y
    Remove user's home directory (/home/jru)? y
    Removing user (jru): mailspool home passwd.
    #

.. raw:: html

   </div>

.. raw:: html

   </div>

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

4.3.2.3.?\ ``chpass``
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Any user can use
`chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__
to change their default shell and personal information associated with
their user account. The superuser can use this utility to change
additional account information for any user.

When passed no options, aside from an optional username,
`chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__
displays an editor containing user information. When the user exits from
the editor, the user database is updated with the new information.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This utility will prompt for the user's password when exiting the
editor, unless the utility is run as the superuser.

.. raw:: html

   </div>

In `Example?4.4, “Using ``chpass`` as
Superuser” <users-synopsis.html#users-modifying-chpass-su>`__, the
superuser has typed ``chpass jru`` and is now viewing the fields that
can be changed for this user. If ``jru`` runs this command instead, only
the last six fields will be displayed and available for editing. This is
shown in `Example?4.5, “Using ``chpass`` as Regular
User” <users-synopsis.html#users-modifying-chpass-ru>`__.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.4.?Using ``chpass`` as Superuser

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    #Changing user database information for jru.
    Login: jru
    Password: *
    Uid [#]: 1001
    Gid [# or name]: 1001
    Change [month day year]:
    Expire [month day year]:
    Class:
    Home directory: /home/jru
    Shell: /usr/local/bin/zsh
    Full Name: J. Random User
    Office Location:
    Office Phone:
    Home Phone:
    Other information:

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.5.?Using ``chpass`` as Regular User

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    #Changing user database information for jru.
    Shell: /usr/local/bin/zsh
    Full Name: J. Random User
    Office Location:
    Office Phone:
    Home Phone:
    Other information:

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The commands
`chfn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chfn&sektion=1>`__
and
`chsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chsh&sektion=1>`__
are links to
`chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__,
as are
`ypchpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypchpass&sektion=1>`__,
`ypchfn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypchfn&sektion=1>`__,
and
`ypchsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypchsh&sektion=1>`__.
Since NIS support is automatic, specifying the ``yp`` before the command
is not necessary. How to configure NIS is covered in `Chapter?29,
*Network Servers* <network-servers.html>`__.

.. raw:: html

   </div>

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

4.3.2.4.?\ ``passwd``
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Any user can easily change their password using
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__.
To prevent accidental or unauthorized changes, this command will prompt
for the user's original password before a new password can be set:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.6.?Changing Your Password

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % passwd
    Changing local password for jru.
    Old password:
    New password:
    Retype new password:
    passwd: updating the database...
    passwd: done

.. raw:: html

   </div>

.. raw:: html

   </div>

The superuser can change any user's password by specifying the username
when running
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__.
When this utility is run as the superuser, it will not prompt for the
user's current password. This allows the password to be changed when a
user cannot remember the original password.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.7.?Changing Another User's Password as the Superuser

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # passwd jru
    Changing local password for jru.
    New password:
    Retype new password:
    passwd: updating the database...
    passwd: done

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

As with
`chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__,
`yppasswd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=yppasswd&sektion=1>`__
is a link to
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__,
so NIS works with either command.

.. raw:: html

   </div>

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

4.3.2.5.?\ ``pw``
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The `pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__
utility can create, remove, modify, and display users and groups. It
functions as a front end to the system user and group files.
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ has a
very powerful set of command line options that make it suitable for use
in shell scripts, but new users may find it more complicated than the
other commands presented in this section.

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

4.3.3.?Managing Groups
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A group is a list of users. A group is identified by its group name and
GID. In FreeBSD, the kernel uses the UID of a process, and the list of
groups it belongs to, to determine what the process is allowed to do.
Most of the time, the GID of a user or process usually means the first
group in the list.

The group name to GID mapping is listed in ``/etc/group``. This is a
plain text file with four colon-delimited fields. The first field is the
group name, the second is the encrypted password, the third the GID, and
the fourth the comma-delimited list of members. For a more complete
description of the syntax, refer to
`group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5>`__.

The superuser can modify ``/etc/group`` using a text editor.
Alternatively,
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ can be
used to add and edit groups. For example, to add a group called
``teamtwo`` and then confirm that it exists:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.8.?Adding a Group Using
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # pw groupadd teamtwo
    # pw groupshow teamtwo
    teamtwo:*:1100:

.. raw:: html

   </div>

.. raw:: html

   </div>

In this example, ``1100`` is the GID of ``teamtwo``. Right now,
``teamtwo`` has no members. This command will add ``jru`` as a member of
``teamtwo``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.9.?Adding User Accounts to a New Group Using
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # pw groupmod teamtwo -M jru
    # pw groupshow teamtwo
    teamtwo:*:1100:jru

.. raw:: html

   </div>

.. raw:: html

   </div>

The argument to ``-M`` is a comma-delimited list of users to be added to
a new (empty) group or to replace the members of an existing group. To
the user, this group membership is different from (and in addition to)
the user's primary group listed in the password file. This means that
the user will not show up as a member when using ``groupshow`` with
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__, but
will show up when the information is queried via
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1>`__ or a
similar tool. When
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ is
used to add a user to a group, it only manipulates ``/etc/group`` and
does not attempt to read additional data from ``/etc/passwd``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.10.?Adding a New Member to a Group Using
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # pw groupmod teamtwo -m db
    # pw groupshow teamtwo
    teamtwo:*:1100:jru,db

.. raw:: html

   </div>

.. raw:: html

   </div>

In this example, the argument to ``-m`` is a comma-delimited list of
users who are to be added to the group. Unlike the previous example,
these users are appended to the group and do not replace existing users
in the group.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?4.11.?Using
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1>`__ to
Determine Group Membership

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % id jru
    uid=1001(jru) gid=1001(jru) groups=1001(jru), 1100(teamtwo)

.. raw:: html

   </div>

.. raw:: html

   </div>

In this example, ``jru`` is a member of the groups ``jru`` and
``teamtwo``.

For more information about this command and the format of
``/etc/group``, refer to
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ and
`group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+----------------------------------+
| `Prev <consoles.html>`__?              | `Up <basics.html>`__    | ?\ `Next <permissions.html>`__   |
+----------------------------------------+-------------------------+----------------------------------+
| 4.2.?Virtual Consoles and Terminals?   | `Home <index.html>`__   | ?4.4.?Permissions                |
+----------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
