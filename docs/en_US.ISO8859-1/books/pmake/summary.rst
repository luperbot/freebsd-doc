============
2.8.?Summary
============

.. raw:: html

   <div class="navheader">

2.8.?Summary
`Prev <invoking.html>`__?
Chapter?2.?The Basics of PMake
?\ `Next <shortcuts.html>`__

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

2.8.?Summary
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A makefile is made of four types of lines:

.. raw:: html

   <div class="itemizedlist">

-  Dependency lines

-  Creation commands

-  Variable assignments

-  Comments, include statements and conditional directives

.. raw:: html

   </div>

A dependency line is a list of one or more targets, an operator (``:``,
``::``, or ``!``), and a list of zero or more sources. Sources may
contain wildcards and certain local variables.

A creation command is a regular shell command preceded by a tab. In
addition, if the first two characters after the tab (and other
whitespace) are a combination of ``@`` or ``-``, PMake will cause the
command to not be printed (if the character is ``@``) or errors from it
to be ignored (if ``-``). A blank line, dependency line or variable
assignment terminates a creation script. There may be only one creation
script for each target with a ``:`` or ``!`` operator.

Variables are places to store text. They may be unconditionally
assigned-to using the ``=`` operator, appended-to using the ``+=``
operator, conditionally (if the variable is undefined) assigned-to with
the ``?=`` operator, and assigned-to with variable expansion with the
``:=`` operator. The output of a shell command may be assigned to a
variable using the ``!=`` operator. Variables may be expanded (their
value inserted) by enclosing their name in parentheses or curly braces,
preceded by a dollar sign. A dollar sign may be escaped with another
dollar sign. Variables are not expanded if PMake does not know about
them. There are seven local variables: ``.TARGET``, ``.ALLSRC``,
``.OODATE``, ``.PREFIX``, ``.IMPSRC``, ``.ARCHIVE``, and ``.MEMBER``.
Four of them (``.TARGET``, ``.PREFIX``, ``.ARCHIVE``, and ``.MEMBER``)
may be used to specify “dynamic sources”. Variables are good. Know them.
Love them. Live them.

Debugging of makefiles is best accomplished using the ``-n``, ``-d m``,
and ``-p 2`` flags.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+------------------------------------------------+
| `Prev <invoking.html>`__?   | `Up <basics.html>`__    | ?\ `Next <shortcuts.html>`__                   |
+-----------------------------+-------------------------+------------------------------------------------+
| 2.7.?Invoking PMake?        | `Home <index.html>`__   | ?Chapter?3.?Short-cuts and Other Nice Things   |
+-----------------------------+-------------------------+------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
