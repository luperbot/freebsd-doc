==================================
4.6.?DEFCON 3 – Variable Expansion
==================================

.. raw:: html

   <div class="navheader">

4.6.?DEFCON 3 – Variable Expansion
`Prev <compatibility.html>`__?
Chapter?4.?PMake for Gods
?\ `Next <defcon2.html>`__

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

4.6.?DEFCON 3 – Variable Expansion
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As noted before, PMake will not expand a variable unless it knows of a
value for it. This can cause problems for makefiles that expect to leave
variables undefined except in special circumstances (e.g. if more flags
need to be passed to the C compiler or the output from a text processor
should be sent to a different printer). If the variables are enclosed in
curly braces (``${PRINTER}``), the shell will let them pass. If they are
enclosed in parentheses, however, the shell will declare a syntax error
and the make will come to a grinding halt.

You have two choices: change the makefile to define the variables (their
values can be overridden on the command line, since that is where they
would have been set if you used Make, anyway) or always give the ``-V``
flag (this can be done with the ``.MAKEFLAGS`` target, if you want).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+--------------------------------------------+
| `Prev <compatibility.html>`__?   | `Up <gods.html>`__      | ?\ `Next <defcon2.html>`__                 |
+----------------------------------+-------------------------+--------------------------------------------+
| 4.5.?Compatibility?              | `Home <index.html>`__   | ?4.7.?DEFCON 2 – The Number of the Beast   |
+----------------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
