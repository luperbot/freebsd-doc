==================
Glossary of Jargon
==================

.. raw:: html

   <div class="navheader">

Glossary of Jargon
`Prev <answers.html>`__?
?
?

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="glossary">

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

attribute
    A property given to a target that causes PMake to treat it
    differently.

command script
    The lines immediately following a dependency line that specify
    commands to execute to create each of the targets on the dependency
    line. Each line in the command script must begin with a tab.

command-line variable
    A variable defined in an argument when PMake is first executed.
    Overrides all assignments to the same variable name in the makefile.

conditional
    A construct much like that used in C that allows a makefile to be
    configured on the fly based on the local environment, or on what is
    being made by that invocation of PMake.

creation script
    Commands used to create a target.

dependency
    The relationship between a source and a target. This comes in three
    flavors, as indicated by the operator between the target and the
    source. ``:`` gives a straight time-wise dependency (if the target
    is older than the source, the target is out-of-date), while ``!``
    provides simply an ordering and always considers the target
    out-of-date. ``::`` is much like ``:``, save it creates multiple
    instances of a target each of which depends on its own list of
    sources.

dynamic source
    This refers to a source that has a local variable invocation in it.
    It allows a single dependency line to specify a different source for
    each target on the line.

global variable
    Any variable defined in a makefile. Takes precedence over variables
    defined in the environment, but not over command-line or local
    variables.

input graph
    What PMake constructs from a makefile. Consists of nodes made of the
    targets in the makefile, and the links between them (the
    dependencies). The links are directed (from source to target) and
    there may not be any cycles (loops) in the graph.

local variable
    A variable defined by PMake visible only in a target's shell script.
    There are seven local variables, not all of which are defined for
    every target: ``.TARGET``, ``.ALLSRC``, ``.OODATE``, ``.PREFIX``,
    ``.IMPSRC``, ``.ARCHIVE``, and ``.MEMBER``. ``.TARGET``,
    ``.PREFIX``, ``.ARCHIVE``, and ``.MEMBER`` may be used on dependency
    lines to create “dynamic sources”.

makefile
    A file that describes how a system is built. If you do not know what
    it is after reading this tutorial…

modifier
    A letter, following a colon, used to alter how a variable is
    expanded. It has no effect on the variable itself.

operator
    What separates a source from a target (on a dependency line) and
    specifies the relationship between the two. There are three: ``:``,
    ``::``, and ``!``.

search path
    A list of directories in which a file should be sought. PMake's view
    of the contents of directories in a search path does not change once
    the makefile has been read. A file is sought on a search path only
    if it is exclusively a source.

shell
    A program to which commands are passed in order to create targets.

source
    Anything to the right of an operator on a dependency line. Targets
    on the dependency line are usually created from the sources.

special target
    A target that causes PMake to do special things when it is
    encountered.

suffix
    The tail end of a file name. Usually begins with a period, like
    ``.c`` or ``.ms``.

target
    A word to the left of the operator on a dependency line. More
    generally, any file that PMake might create. A file may be (and
    often is) both a target and a source (what it is depends on how
    PMake is looking at it at the time – sort of like the wave/particle
    duality of light, you know).

transformation rule
    A special construct in a makefile that specifies how to create a
    file of one type from a file of another, as indicated by their
    suffixes.

variable expansion
    The process of substituting the value of a variable for a reference
    to it. Expansion may be altered by means of modifiers.

variable
    A place in which to store text that may be retrieved later. Also
    used to define the local environment. Conditionals exist that test
    whether a variable is defined or not.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+-----+
| `Prev <answers.html>`__?           | ?                       | ?   |
+------------------------------------+-------------------------+-----+
| Chapter?5.?Answers to Exercises?   | `Home <index.html>`__   | ?   |
+------------------------------------+-------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
