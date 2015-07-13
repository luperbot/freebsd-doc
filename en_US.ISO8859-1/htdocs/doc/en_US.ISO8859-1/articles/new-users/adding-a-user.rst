=====================================
2.?Adding A User with Root Privileges
=====================================

.. raw:: html

   <div class="navheader">

2.?Adding A User with Root Privileges
`Prev <index.html>`__?
?
?\ `Next <looking-around.html>`__

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

2.?Adding A User with Root Privileges
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you did not create any users when you installed the system and are
thus logged in as ``root``, you should probably create a user now with

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # adduser

.. raw:: html

   </div>

The first time you use ``adduser``, it might ask for some defaults to
save. You might want to make the default shell
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__
instead of
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__, if it
suggests ``sh`` as the default. Otherwise just press enter to accept
each default. These defaults are saved in ``/etc/adduser.conf``, an
editable file.

Suppose you create a user ``jack`` with full name *Jack Benimble*. Give
``jack`` a password if security (even kids around who might pound on the
keyboard) is an issue. When it asks you if you want to invite ``jack``
into other groups, type ``wheel``

.. raw:: html

   <div class="informalexample">

.. code:: screen

    Login group is ``jack''. Invite jack into other groups: wheel

.. raw:: html

   </div>

This will make it possible to log in as ``jack`` and use the
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
command to become ``root``. Then you will not get scolded any more for
logging in as ``root``.

You can quit ``adduser`` any time by typing **Ctrl**+**C**, and at the
end you will have a chance to approve your new user or simply type **n**
for no. You might want to create a second new user so that when you edit
``jack``'s login files, you will have a hot spare in case something goes
wrong.

Once you have done this, use ``exit`` to get back to a login prompt and
log in as ``jack``. In general, it is a good idea to do as much work as
possible as an ordinary user who does not have the power—and risk—of
``root``.

If you already created a user and you want the user to be able to ``su``
to ``root``, you can log in as ``root`` and edit the file
``/etc/group``, adding ``jack`` to the first line (the group ``wheel``).
But first you need to practice
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__, the
text editor—or use the simpler text editor,
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1>`__,
installed on recent versions of FreeBSD.

To delete a user, use the ``rmuser`` command.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------+-------------------------------------+
| `Prev <index.html>`__?                      | ?                       | ?\ `Next <looking-around.html>`__   |
+---------------------------------------------+-------------------------+-------------------------------------+
| For People New to Both FreeBSD and UNIX??   | `Home <index.html>`__   | ?3.?Looking Around                  |
+---------------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
