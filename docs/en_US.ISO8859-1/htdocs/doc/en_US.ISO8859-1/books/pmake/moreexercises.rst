===================
3.7.?More Exercises
===================

.. raw:: html

   <div class="navheader">

3.7.?More Exercises
`Prev <modyvarex.html>`__?
Chapter?3.?Short-cuts and Other Nice Things
?\ `Next <gods.html>`__

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

3.7.?More Exercises
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Exercise 3.1
------------

You have got a set programs, each of which is created from its own
assembly-language source file (suffix ``.asm``). Each program can be
assembled into two versions, one with error-checking code assembled in
and one without. You could assemble them into files with different
suffixes (``.eobj`` and ``.obj``, for instance), but your linker only
understands files that end in ``.obj``. To top it all off, the final
executables must have the suffix ``.exe``. How can you still use
transformation rules to make your life easier (Hint: assume the
errorchecking versions have ec tacked onto their prefix)?

Exercise 3.2
------------

Assume, for a moment or two, you want to perform a sort of “indirection”
by placing the name of a variable into another one, then you want to get
the value of the first by expanding the second somehow. Unfortunately,
PMake does not allow constructs like:

.. code:: programlisting

    $($(FOO))

What do you do? Hint: no further variable expansion is performed after
modifiers are applied, thus if you cause a ``$`` to occur in the
expansion, that is what will be in the result.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------+------------------------------+
| `Prev <modyvarex.html>`__?           | `Up <shortcuts.html>`__   | ?\ `Next <gods.html>`__      |
+--------------------------------------+---------------------------+------------------------------+
| 3.6.?Modifying Variable Expansion?   | `Home <index.html>`__     | ?Chapter?4.?PMake for Gods   |
+--------------------------------------+---------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
