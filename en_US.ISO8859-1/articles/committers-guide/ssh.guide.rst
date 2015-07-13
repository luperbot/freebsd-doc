=========================
15.?SSH Quick-Start Guide
=========================

.. raw:: html

   <div class="navheader">

15.?SSH Quick-Start Guide
`Prev <people.html>`__?
?
?\ `Next <coverity.html>`__

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

15.?SSH Quick-Start Guide
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. If you do not wish to type your password in every time you use
   `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__,
   and you use RSA or DSA keys to authenticate,
   `ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
   is there for your convenience. If you want to use
   `ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__,
   make sure that you run it before running other applications. X users,
   for example, usually do this from their ``.xsession`` or
   ``.xinitrc``. See
   `ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
   for details.

#. Generate a key pair using
   `ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__.
   The key pair will wind up in your ``$HOME/.ssh/`` directory.

#. Send your public key (``$HOME/.ssh/id_dsa.pub`` or
   ``$HOME/.ssh/id_rsa.pub``) to the person setting you up as a
   committer so it can be put into ``yourlogin`` in ``/etc/ssh-keys/``
   on ``freefall``.

.. raw:: html

   </div>

Now you should be able to use
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
for authentication once per session. This will prompt you for your
private key's pass phrase, and then store it in your authentication
agent
(`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__).
If you no longer wish to have your key stored in the agent, issuing
``ssh-add -d`` will remove it.

Test by doing something such as
``ssh     freefall.FreeBSD.org ls /usr``.

For more information, see
`security/openssh <http://www.freebsd.org/cgi/url.cgi?ports/security/openssh/pkg-descr>`__,
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__,
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__,
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__,
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__,
and `scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__.

For information on adding, changing, or removing
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
keys, see ``this     article``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+------------------------------------------------------+
| `Prev <people.html>`__?   | ?                       | ?\ `Next <coverity.html>`__                          |
+---------------------------+-------------------------+------------------------------------------------------+
| 14.?Who's Who?            | `Home <index.html>`__   | ?16.?Coverity? Availability for FreeBSD Committers   |
+---------------------------+-------------------------+------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
