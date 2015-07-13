===============================
Chapter?5.?Answers to Exercises
===============================

.. raw:: html

   <div class="navheader">

Chapter?5.?Answers to Exercises
`Prev <theway.html>`__?
?
?\ `Next <glossary.html>`__

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

Exercise 3.1
------------

This is something of a trick question, for which I apologize. The trick
comes from the UNIX? definition of a suffix, which PMake does not
necessarily share. You will have noticed that all the suffixes used in
this tutorial (and in UNIX? in general) begin with a period (``.ms``,
``.c``, etc.). Now, PMake's idea of a suffix is more like English's: it
is the characters at the end of a word. With this in mind, one possible
solution to this problem goes as follows:

.. code:: programlisting

    .SUFFIXES       : ec.exe .exe ec.obj .obj .asm
    ec.objec.exe .obj.exe :
        link -o $(.TARGET) $(.IMPSRC)
    .asmec.obj      :
        asm -o $(.TARGET) -DDO_ERROR_CHECKING $(.IMPSRC)
    .asm.obj        :
        asm -o $(.TARGET) $(.IMPSRC)

Excercise 3.2
-------------

The trick to this one lies in the ``:=`` variable-assignment operator
and the ``:S`` variable-expansion modifier. Basically what you want is
to take the pointer variable, so to speak, and transform it into an
invocation of the variable at which it points. You might try something
like:

.. code:: programlisting

    $(PTR:S/^/\$(/:S/$/))

which places ``$(`` at the front of the variable name and ``)`` at the
end, thus transforming ``VAR,`` for example, into ``$(VAR)``, which is
just what we want. Unfortunately (as you know if you have tried it),
since, as it says in the hint, PMake does no further substitution on the
result of a modified expansion, that is all you get. The solution is to
make use of ``:=`` to place that string into yet another variable, then
invoke the other variable directly:

.. code:: programlisting

    *PTR            := $(PTR:S/^/\$(/:S/$/)/)

You can then use ``$(*PTR)`` to your heart's content.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+-------------------------------+
| `Prev <theway.html>`__?     | ?                       | ?\ `Next <glossary.html>`__   |
+-----------------------------+-------------------------+-------------------------------+
| 4.9.?The Way Things Work?   | `Home <index.html>`__   | ?Glossary of Jargon           |
+-----------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
