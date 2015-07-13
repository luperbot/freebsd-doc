=================
3.?Looking Around
=================

.. raw:: html

   <div class="navheader">

3.?Looking Around
`Prev <adding-a-user.html>`__?
?
?\ `Next <getting-help.html>`__

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

3.?Looking Around
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Logged in as an ordinary user, look around and try out some commands
that will access the sources of help and information within FreeBSD.

Here are some commands and what they do:

.. raw:: html

   <div class="variablelist">

``id``
    Tells you who you are!

``pwd``
    Shows you where you are—the current working directory.

``ls``
    Lists the files in the current directory.

``ls -F``
    Lists the files in the current directory with a ``*`` after
    executables, a ``/`` after directories, and an ``@`` after symbolic
    links.

``ls -l``
    Lists the files in long format—size, date, permissions.

``ls -a``
    Lists hidden “dot” files with the others. If you are ``root``, the
    “dot” files show up without the ``-a`` switch.

``cd``
    Changes directories. ``cd         ..`` backs up one level; note the
    space after ``cd``. ``cd         /usr/local`` goes there. ``cd ~``
    goes to the home directory of the person logged in—e.g.,
    ``/usr/home/jack``. Try ``cd         /cdrom``, and then ``ls``, to
    find out if your CDROM is mounted and working.

``less         filename``
    Lets you look at a file (named *``filename``*) without changing it.
    Try ``less /etc/fstab``. Type ``q`` to quit.

``cat         filename``
    Displays *``filename``* on screen. If it is too long and you can see
    only the end of it, press **ScrollLock** and use the **up-arrow** to
    move backward; you can use **ScrollLock** with manual pages too.
    Press **ScrollLock** again to quit scrolling. You might want to try
    ``cat`` on some of the dot files in your home
    directory—\ ``cat           .cshrc``, ``cat           .login``,
    ``cat           .profile``.

.. raw:: html

   </div>

You will notice aliases in ``.cshrc`` for some of the ``ls`` commands
(they are very convenient). You can create other aliases by editing
``.cshrc``. You can make these aliases available to all users on the
system by putting them in the system-wide ``csh`` configuration file,
``/etc/csh.cshrc``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+------------------------------------+
| `Prev <adding-a-user.html>`__?           | ?                       | ?\ `Next <getting-help.html>`__    |
+------------------------------------------+-------------------------+------------------------------------+
| 2.?Adding A User with Root Privileges?   | `Home <index.html>`__   | ?4.?Getting Help and Information   |
+------------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
