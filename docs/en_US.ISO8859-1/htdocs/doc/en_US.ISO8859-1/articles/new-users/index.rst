========================================
For People New to Both FreeBSD and UNIX?
========================================

.. raw:: html

   <div class="navheader">

For People New to Both FreeBSD and UNIX?
?
?
?\ `Next <adding-a-user.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Annelise Anderson
~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<andrsn@andrsn.stanford.edu>``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on 1997-08-15 by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

Congratulations on installing FreeBSD! This introduction is for people
new to both FreeBSD *and* UNIX?—so it starts with basics.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Logging in and Getting Out <index.html#in-and-out>`__
`2. Adding A User with Root Privileges <adding-a-user.html>`__
`3. Looking Around <looking-around.html>`__
`4. Getting Help and Information <getting-help.html>`__
`5. Editing Text <editing-text.html>`__
`6. Other Useful Commands <other-useful-commands.html>`__
`7. Next Steps <next-steps.html>`__
`8. Your Working Environment <your-working-environment.html>`__
`9. Other <other.html>`__
`10. Comments Welcome <comments-welcome.html>`__

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

1.?Logging in and Getting Out
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Log in (when you see ``login:``) as a user you created during
installation or as ``root``. (Your FreeBSD installation will already
have an account for ``root``; who can go anywhere and do anything,
including deleting essential files, so be careful!) The symbols ``%``
and ``#`` in the following stand for the prompt (yours may be
different), with ``%`` indicating an ordinary user and ``#`` indicating
``root``.

To log out (and get a new ``login:`` prompt) type

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # exit

.. raw:: html

   </div>

as often as necessary. Yes, press enter after commands, and remember
that UNIX? is case-sensitive—\ ``exit``, not ``EXIT``.

To shut down the machine type

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/shutdown -h now

.. raw:: html

   </div>

Or to reboot type

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/shutdown -r now

.. raw:: html

   </div>

or

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/reboot

.. raw:: html

   </div>

You can also reboot with **Ctrl**+**Alt**+**Delete**. Give it a little
time to do its work. This is equivalent to ``/sbin/reboot`` in recent
releases of FreeBSD and is much, much better than hitting the reset
button. You do not want to have to reinstall this thing, do you?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+------------------------------------------+
| ?   | ?   | ?\ `Next <adding-a-user.html>`__         |
+-----+-----+------------------------------------------+
| ?   | ?   | ?2.?Adding A User with Root Privileges   |
+-----+-----+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
