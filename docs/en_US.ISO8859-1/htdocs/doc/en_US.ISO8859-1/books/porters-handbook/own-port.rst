============================
Chapter?2.?Making a New Port
============================

.. raw:: html

   <div class="navheader">

Chapter?2.?Making a New Port
`Prev <why-port.html>`__?
?
?\ `Next <quick-porting.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Interested in making a new port, or upgrading existing ports? Great!

What follows are some guidelines for creating a new port for FreeBSD. To
upgrade an existing port, read this, then read `Chapter?10, *Upgrading a
Port* <port-upgrading.html>`__.

When this document is not sufficiently detailed, refer to
``/usr/ports/Mk/bsd.port.mk``, which is included by all port
``Makefile``\ s. Even those not hacking ``Makefile``\ s daily can gain
much knowledge from it. Additionally, specific questions can be sent to
the `FreeBSD ports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Only a fraction of the variables (``VAR``) that can be overridden are
mentioned in this document. Most (if not all) are documented at the
start of ``/usr/ports/Mk/bsd.port.mk``; the others probably ought to be.
Note that this file uses a non-standard tab setting: Emacs and Vim will
recognize the setting on loading the file. Both
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__ and
`ex(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ex&sektion=1>`__ can be
set to use the correct value by typing ``:set tabstop=4`` once the file
has been loaded.

.. raw:: html

   </div>

Looking for something easy to start with? Take a look at the `list of
requested ports <http://wiki.freebsd.org/WantedPorts>`__ and see if you
can work on one (or more).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+------------------------------------+
| `Prev <why-port.html>`__?   | ?                       | ?\ `Next <quick-porting.html>`__   |
+-----------------------------+-------------------------+------------------------------------+
| Chapter?1.?Introduction?    | `Home <index.html>`__   | ?Chapter?3.?Quick Porting          |
+-----------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
