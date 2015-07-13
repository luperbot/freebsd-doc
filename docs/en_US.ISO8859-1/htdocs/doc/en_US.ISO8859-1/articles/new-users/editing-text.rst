===============
5.?Editing Text
===============

.. raw:: html

   <div class="navheader">

5.?Editing Text
`Prev <getting-help.html>`__?
?
?\ `Next <other-useful-commands.html>`__

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

5.?Editing Text
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To configure your system, you need to edit text files. Most of them will
be in the ``/etc`` directory; and you will need to ``su`` to ``root`` to
be able to change them. You can use the easy ``ee``, but in the long run
the text editor ``vi`` is worth learning. There is an excellent tutorial
on vi in ``/usr/src/contrib/nvi/docs/tutorial``, if you have the system
sources installed.

Before you edit a file, you should probably back it up. Suppose you want
to edit ``/etc/rc.conf``. You could just use ``cd /etc`` to get to the
``/etc`` directory and do:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cp rc.conf rc.conf.orig

.. raw:: html

   </div>

This would copy ``rc.conf`` to ``rc.conf.orig``, and you could later
copy ``rc.conf.orig`` to ``rc.conf`` to recover the original. But even
better would be moving (renaming) and then copying back:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # mv rc.conf rc.conf.orig
    # cp rc.conf.orig rc.conf

.. raw:: html

   </div>

because the ``mv`` command preserves the original date and owner of the
file. You can now edit ``rc.conf``. If you want the original back, you
would then **``mv rc.conf rc.conf.myedit``** (assuming you want to
preserve your edited version) and then

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # mv rc.conf.orig rc.conf

.. raw:: html

   </div>

to put things back the way they were.

To edit a file, type

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # vi filename

.. raw:: html

   </div>

Move through the text with the arrow keys. **Esc** (the escape key) puts
``vi`` in command mode. Here are some commands:

.. raw:: html

   <div class="variablelist">

``x``
    delete letter the cursor is on

``dd``
    delete the entire line (even if it wraps on the screen)

``i``
    insert text at the cursor

``a``
    insert text after the cursor

.. raw:: html

   </div>

Once you type ``i`` or ``a``, you can enter text. ``Esc`` puts you back
in command mode where you can type

.. raw:: html

   <div class="variablelist">

``:w``
    to write your changes to disk and continue editing

``:wq``
    to write and quit

``:q!``
    to quit without saving changes

``/text``
    to move the cursor to *``text``*; ``/``\ **Enter** (the enter key)
    to find the next instance of *``text``*.

``G``
    to go to the end of the file

``n``\ G
    to go to line *``n``* in the file, where *``n``* is a number

**Ctrl**+**L**
    to redraw the screen

**Ctrl**+**b** and **Ctrl**+**f**
    go back and forward a screen, as they do with ``more`` and ``view``.

.. raw:: html

   </div>

Practice with ``vi`` in your home directory by creating a new file with
``vi       filename`` and adding and deleting text, saving the file, and
calling it up again. ``vi`` delivers some surprises because it is really
quite complex, and sometimes you will inadvertently issue a command that
will do something you do not expect. (Some people actually like
``vi``—it is more powerful than DOS EDIT—find out about the ``:r``
command.) Use **Esc** one or more times to be sure you are in command
mode and proceed from there when it gives you trouble, save often with
``:w``, and use ``:q!`` to get out and start over (from your last
``:w``) when you need to.

Now you can ``cd`` to ``/etc``, ``su`` to ``root``, use ``vi`` to edit
the file ``/etc/group``, and add a user to ``wheel`` so the user has
root privileges. Just add a comma and the user's login name to the end
of the first line in the file, press **Esc**, and use ``:wq`` to write
the file to disk and quit. Instantly effective. (You did not put a space
after the comma, did you?)

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+--------------------------------------------+
| `Prev <getting-help.html>`__?      | ?                       | ?\ `Next <other-useful-commands.html>`__   |
+------------------------------------+-------------------------+--------------------------------------------+
| 4.?Getting Help and Information?   | `Home <index.html>`__   | ?6.?Other Useful Commands                  |
+------------------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
