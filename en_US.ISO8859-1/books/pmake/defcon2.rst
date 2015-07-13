=======================================
4.7.?DEFCON 2 – The Number of the Beast
=======================================

.. raw:: html

   <div class="navheader">

4.7.?DEFCON 2 – The Number of the Beast
`Prev <defcon3.html>`__?
Chapter?4.?PMake for Gods
?\ `Next <defcon1.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.7.?DEFCON 2 – The Number of the Beast
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Then there are the makefiles that expect certain commands, such as
changing to a different directory, to not affect other commands in a
target's creation script. You can solve this is either by going back to
executing one shell per command (which is what the ``-B`` flag forces
PMake to do), which slows the process down a good bit and requires you
to use semicolons and escaped newlines for shell constructs, or by
changing the makefile to execute the offending command(s) in a subshell
(by placing the line inside parentheses), like so:

.. code:: programlisting

    install :: .MAKE
          (cd src; $(.PMAKE) install)
          (cd lib; $(.PMAKE) install)
          (cd man; $(.PMAKE) install)

This will always execute the three makes (even if the ``-n`` flag was
given) because of the combination of the ``::`` operator and the
``.MAKE`` attribute. Each command will change to the proper directory to
perform the install, leaving the main shell in the directory in which it
started.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+----------------------------------------------------------------------+
| `Prev <defcon3.html>`__?              | `Up <gods.html>`__      | ?\ `Next <defcon1.html>`__                                           |
+---------------------------------------+-------------------------+----------------------------------------------------------------------+
| 4.6.?DEFCON 3 – Variable Expansion?   | `Home <index.html>`__   | ?4.8.?DEFCON 1 – Imitation is the Not the Highest Form of Flattery   |
+---------------------------------------+-------------------------+----------------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
