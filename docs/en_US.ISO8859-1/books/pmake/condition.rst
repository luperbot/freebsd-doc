========================
4.3.?On the Condition...
========================

.. raw:: html

   <div class="navheader">

4.3.?On the Condition...
`Prev <archivesandlibraries.html>`__?
Chapter?4.?PMake for Gods
?\ `Next <ashell.html>`__

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

4.3.?On the Condition...
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Like the C compiler before it, PMake allows you to configure the
makefile, based on the current environment, using conditional
statements. A conditional looks like this:

.. code:: programlisting

    #if boolean expression
    lines
    #elif another boolean expression
    more lines
    #else
    still more lines
    #endif

They may be nested to a maximum depth of 30 and may occur anywhere
(except in a comment, of course). The ``#`` must the very first
character on the line.

Each boolean expression is made up of terms that look like function
calls, the standard C boolean operators ``&&``, ``||``, and ``!``, and
the standard relational operators ``==``, ``!=``, ``>``, ``>=``, ``<``,
and ``<=``, with ``==`` and ``!=`` being overloaded to allow string
comparisons as well. ``&&`` represents logical AND; ``||`` is logical OR
and ``!`` is logical NOT. The arithmetic and string operators take
precedence over all three of these operators, while NOT takes precedence
over AND, which takes precedence over OR. This precedence may be
overridden with parentheses, and an expression may be parenthesized to
your heart's content. Each term looks like a call on one of four
functions:

.. raw:: html

   <div class="informaltable">

+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``make``      | The syntax is make(target) where target is a target in the makefile. This is true if the given target was specified on the command line, or as the source for a ``.MAIN`` target (note that the sources for ``.MAIN`` are only used if no targets were given on the command line).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``defined``   | The syntax is ``defined(variable)`` and is true if variable is defined. Certain variables are defined in the system makefile that identify the system on which PMake is being run.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``exists``    | The syntax is ``exists(file)`` and is true if the file can be found on the global search path (i.e. that defined by ``.PATH`` targets, not by ``.PATHsuffix`` targets).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``empty``     | This syntax is much like the others, except the string inside the parentheses is of the same form as you would put between parentheses when expanding a variable, complete with modifiers and everything. The function returns true if the resulting string is empty. An undefined variable in this context will cause at the very least a warning message about a malformed conditional, and at the worst will cause the process to stop once it has read the makefile. If you want to check for a variable being defined or empty, use the expression: ``!defined(var) || empty(var)`` as the definition of ``||`` will prevent the ``empty()`` from being evaluated and causing an error, if the variable is undefined. This can be used to see if a variable contains a given word, for example: ``#if !empty(var:Mword)``   |
+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

The arithmetic and string operators may only be used to test the value
of a variable. The lefthand side must contain the variable expansion,
while the righthand side contains either a string, enclosed in
double-quotes, or a number. The standard C numeric conventions (except
for specifying an octal number) apply to both sides. E.g.:

.. code:: programlisting

    #if $(OS) == 4.3

    #if $(MACHINE) == "sun3"

    #if $(LOAD_ADDR) > 0xc000

are all valid conditionals. In addition, the numeric value of a variable
can be tested as a boolean as follows:

.. code:: programlisting

    #if $(LOAD)

would see if ``LOAD`` contains a non-zero value and:

.. code:: programlisting

    #if !$(LOAD)

would test if ``LOAD`` contains a zero value.

In addition to the bare ``#if``, there are other forms that apply one of
the first two functions to each term. They are as follows:

.. raw:: html

   <div class="informaltable">

+---------------+----------------+
| ``ifdef``     | ``defined``    |
+---------------+----------------+
| ``ifndef``    | ``!defined``   |
+---------------+----------------+
| ``ifmake``    | ``make``       |
+---------------+----------------+
| ``ifnmake``   | ``!make``      |
+---------------+----------------+

.. raw:: html

   </div>

There are also the “``else       if``” forms: ``elif``, ``elifdef``,
``elifndef``, ``elifmake``, and ``elifnmake``.

For instance, if you wish to create two versions of a program, one of
which is optimized (the production version) and the other of which is
for debugging (has symbols for dbx), you have two choices: you can
create two makefiles, one of which uses the ``-g`` flag for the
compilation, while the other uses the ``-O`` flag, or you can use
another target (call it debug) to create the debug version. The
construct below will take care of this for you. I have also made it so
defining the variable ``DEBUG`` (say with ``pmake -D DEBUG``) will also
cause the debug version to be made.

.. code:: programlisting

    #if defined(DEBUG) || make(debug)
    CFLAGS         += -g
    #else
    CFLAGS         += -O
    #endif

There are, of course, problems with this approach. The most glaring
annoyance is that if you want to go from making a debug version to
making a production version, you have to remove all the object files, or
you will get some optimized and some debug versions in the same program.
Another annoyance is you have to be careful not to make two targets that
“conflict” because of some conditionals in the makefile. For instance:

.. code:: programlisting

    #if make(print)
    FORMATTER = ditroff -Plaser_printer
    #endif
    #if make(draft)
    FORMATTER = nroff -Pdot_matrix_printer
    #endif

would wreak havoc if you tried ``pmake draft print`` since you would use
the same formatter for each target. As I said, this all gets somewhat
complicated.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+---------------------------------------+
| `Prev <archivesandlibraries.html>`__?   | `Up <gods.html>`__      | ?\ `Next <ashell.html>`__             |
+-----------------------------------------+-------------------------+---------------------------------------+
| 4.2.?Archives and Libraries?            | `Home <index.html>`__   | ?4.4.?A Shell is a Shell is a Shell   |
+-----------------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
