==============================
3.2.?Secure Design Methodology
==============================

.. raw:: html

   <div class="navheader">

3.2.?Secure Design Methodology
`Prev <secure.html>`__?
Chapter?3.?Secure Programming
?\ `Next <secure-bufferov.html>`__

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

3.2.?Secure Design Methodology
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Writing secure applications takes a very scrutinous and pessimistic
outlook on life. Applications should be run with the principle of “least
privilege” so that no process is ever running with more than the bare
minimum access that it needs to accomplish its function. Previously
tested code should be reused whenever possible to avoid common mistakes
that others may have already fixed.

One of the pitfalls of the UNIX? environment is how easy it is to make
assumptions about the sanity of the environment. Applications should
never trust user input (in all its forms), system resources,
inter-process communication, or the timing of events. UNIX? processes do
not execute synchronously so logical operations are rarely atomic.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+--------------------------------------+
| `Prev <secure.html>`__?          | `Up <secure.html>`__    | ?\ `Next <secure-bufferov.html>`__   |
+----------------------------------+-------------------------+--------------------------------------+
| Chapter?3.?Secure Programming?   | `Home <index.html>`__   | ?3.3.?Buffer Overflows               |
+----------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
