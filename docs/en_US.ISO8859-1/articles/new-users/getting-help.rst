===============================
4.?Getting Help and Information
===============================

.. raw:: html

   <div class="navheader">

4.?Getting Help and Information
`Prev <looking-around.html>`__?
?
?\ `Next <editing-text.html>`__

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

4.?Getting Help and Information
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here are some useful sources of help. *``Text``* stands for something of
your choice that you type in—usually a command or filename.

.. raw:: html

   <div class="variablelist">

``apropos         text``
    Everything containing string *``text``* in the whatis database.

``man         text``
    The manual page for *``text``*. The major source of documentation
    for UNIX? systems. ``man ls`` will tell you all the ways to use the
    ``ls`` command. Press **Enter** to move through text, **Ctrl**+**B**
    to go back a page, **Ctrl**+**F** to go forward, **q** or
    **Ctrl**+**C** to quit.

``which         text``
    Tells you where in the user's path the command *``text``* is found.

``locate         text``
    All the paths where the string *``text``* is found.

``whatis         text``
    Tells you what the command *``text``* does and its manual page.
    Typing ``whatis *`` will tell you about all the binaries in the
    current directory.

``whereis         text``
    Finds the file *``text``*, giving its full path.

.. raw:: html

   </div>

You might want to try using ``whatis`` on some common useful commands
like ``cat``, ``more``, ``grep``, ``mv``, ``find``, ``tar``, ``chmod``,
``chown``, ``date``, and ``script``. ``more`` lets you read a page at a
time as it does in DOS, e.g., ``ls -l |     more`` or
``more     filename``. The ``*`` works as a wildcard—e.g., ``ls     w*``
will show you files beginning with ``w``.

Are some of these not working very well? Both
`locate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=locate&sektion=1>`__
and
`whatis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whatis&sektion=1>`__
depend on a database that is rebuilt weekly. If your machine is not
going to be left on over the weekend (and running FreeBSD), you might
want to run the commands for daily, weekly, and monthly maintenance now
and then. Run them as ``root`` and, for now, give each one time to
finish before you start the next one.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # periodic daily
    output omitted
    # periodic weekly
    output omitted
    # periodic monthly
    output omitted

.. raw:: html

   </div>

If you get tired of waiting, press **Alt**+**F2** to get another
*virtual console*, and log in again. After all, it is a multi-user,
multi-tasking system. Nevertheless these commands will probably flash
messages on your screen while they are running; you can type ``clear``
at the prompt to clear the screen. Once they have run, you might want to
look at ``/var/mail/root`` and ``/var/log/messages``.

Running such commands is part of system administration—and as a single
user of a UNIX? system, you are your own system administrator. Virtually
everything you need to be ``root`` to do is system administration. Such
responsibilities are not covered very well even in those big fat books
on UNIX?, which seem to devote a lot of space to pulling down menus in
windows managers. You might want to get one of the two leading books on
systems administration, either Evi Nemeth et.al.'s *UNIX System
Administration Handbook* (Prentice-Hall, 1995, ISBN 0-13-15051-7)—the
second edition with the red cover; or ?leen Frisch's *Essential System
Administration* (O'Reilly & Associates, 2002, ISBN 0-596-00343-9). I
used Nemeth.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+-----------------------------------+
| `Prev <looking-around.html>`__?   | ?                       | ?\ `Next <editing-text.html>`__   |
+-----------------------------------+-------------------------+-----------------------------------+
| 3.?Looking Around?                | `Home <index.html>`__   | ?5.?Editing Text                  |
+-----------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
