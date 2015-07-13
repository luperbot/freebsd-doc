===========================
8.?Your Working Environment
===========================

.. raw:: html

   <div class="navheader">

8.?Your Working Environment
`Prev <next-steps.html>`__?
?
?\ `Next <other.html>`__

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

8.?Your Working Environment
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Your shell is the most important part of your working environment. The
shell is what interprets the commands you type on the command line, and
thus communicates with the rest of the operating system. You can also
write shell scripts a series of commands to be run without intervention.

Two shells come installed with FreeBSD: ``csh`` and ``sh``. ``csh`` is
good for command-line work, but scripts should be written with ``sh``
(or ``bash``). You can find out what shell you have by typing
``echo $SHELL``.

The ``csh`` shell is okay, but ``tcsh`` does everything ``csh`` does and
more. It allows you to recall commands with the arrow keys and edit
them. It has tab-key completion of filenames (``csh`` uses the **Esc**
key), and it lets you switch to the directory you were last in with
``cd -``. It is also much easier to alter your prompt with ``tcsh``. It
makes life a lot easier.

Here are the three steps for installing a new shell:

.. raw:: html

   <div class="procedure">

#. Install the shell as a port or a package, just as you would any other
   port or package.

#. Use the ``chsh`` command to change your shell to ``tcsh``
   permanently, or type ``tcsh`` at the prompt to change your shell
   without logging in again.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It can be dangerous to change ``root``'s shell to something other than
``sh`` or ``csh`` on early versions of FreeBSD and many other versions
of UNIX?; you may not have a working shell when the system puts you into
single user mode. The solution is to use ``su     -m`` to become
``root``, which will give you the ``tcsh`` as ``root``, because the
shell is part of the environment. You can make this permanent by adding
it to your ``.tcshrc`` file as an alias with:

.. code:: programlisting

    alias su su -m

.. raw:: html

   </div>

When ``tcsh`` starts up, it will read the ``/etc/csh.cshrc`` and
``/etc/csh.login`` files, as does ``csh``. It will also read the
``.login`` file in your home directory and the ``.cshrc`` file as well,
unless you provide a ``.tcshrc`` file. This you can do by simply copying
``.cshrc`` to ``.tcshrc``.

Now that you have installed ``tcsh``, you can adjust your prompt. You
can find the details in the manual page for ``tcsh``, but here is a line
to put in your ``.tcshrc`` that will tell you how many commands you have
typed, what time it is, and what directory you are in. It also produces
a ``>`` if you are an ordinary user and a ``#`` if you are ``root``, but
tsch will do that in any case:

set prompt = "%h %t %~ %# "

This should go in the same place as the existing set prompt line if
there is one, or under "if($?prompt) then" if not. Comment out the old
line; you can always switch back to it if you prefer it. Do not forget
the spaces and quotes. You can get the ``.tcshrc`` reread by typing
``source .tcshrc``.

You can get a listing of other environmental variables that have been
set by typing ``env`` at the prompt. The result will show you your
default editor, pager, and terminal type, among possibly many others. A
useful command if you log in from a remote location and can not run a
program because the terminal is not capable is
``setenv TERM       vt100``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+----------------------------+
| `Prev <next-steps.html>`__?   | ?                       | ?\ `Next <other.html>`__   |
+-------------------------------+-------------------------+----------------------------+
| 7.?Next Steps?                | `Home <index.html>`__   | ?9.?Other                  |
+-------------------------------+-------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
