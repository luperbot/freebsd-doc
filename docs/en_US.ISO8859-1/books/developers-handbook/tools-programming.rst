================================
2.3.?Introduction to Programming
================================

.. raw:: html

   <div class="navheader">

2.3.?Introduction to Programming
`Prev <tools-intro.html>`__?
Chapter?2.?Programming Tools
?\ `Next <tools-compiling.html>`__

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

2.3.?Introduction to Programming
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A program is a set of instructions that tell the computer to do various
things; sometimes the instruction it has to perform depends on what
happened when it performed a previous instruction. This section gives an
overview of the two main ways in which you can give these instructions,
or “commands” as they are usually called. One way uses an *interpreter*,
the other a *compiler*. As human languages are too difficult for a
computer to understand in an unambiguous way, commands are usually
written in one or other languages specially designed for the purpose.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.1.?Interpreters
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With an interpreter, the language comes as an environment, where you
type in commands at a prompt and the environment executes them for you.
For more complicated programs, you can type the commands into a file and
get the interpreter to load the file and execute the commands in it. If
anything goes wrong, many interpreters will drop you into a debugger to
help you track down the problem.

The advantage of this is that you can see the results of your commands
immediately, and mistakes can be corrected readily. The biggest
disadvantage comes when you want to share your programs with someone.
They must have the same interpreter, or you must have some way of giving
it to them, and they need to understand how to use it. Also users may
not appreciate being thrown into a debugger if they press the wrong key!
From a performance point of view, interpreters can use up a lot of
memory, and generally do not generate code as efficiently as compilers.

In my opinion, interpreted languages are the best way to start if you
have not done any programming before. This kind of environment is
typically found with languages like Lisp, Smalltalk, Perl and Basic. It
could also be argued that the UNIX? shell (``sh``, ``csh``) is itself an
interpreter, and many people do in fact write shell “scripts” to help
with various “housekeeping” tasks on their machine. Indeed, part of the
original UNIX? philosophy was to provide lots of small utility programs
that could be linked together in shell scripts to perform useful tasks.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.2.?Interpreters available with FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here is a list of interpreters that are available from the FreeBSD Ports
Collection, with a brief discussion of some of the more popular
interpreted languages.

Instructions on how to get and install applications from the Ports
Collection can be found in the `Ports
section <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__
of the handbook.

.. raw:: html

   <div class="variablelist">

BASIC
    Short for Beginner's All-purpose Symbolic Instruction Code.
    Developed in the 1950s for teaching University students to program
    and provided with every self-respecting personal computer in the
    1980s, BASIC has been the first programming language for many
    programmers. It is also the foundation for Visual Basic.

    The Bywater Basic Interpreter can be found in the Ports Collection
    as
    `lang/bwbasic <http://www.freebsd.org/cgi/url.cgi?ports/lang/bwbasic/pkg-descr>`__
    and the Phil Cockroft's Basic Interpreter (formerly Rabbit Basic) is
    available as
    `lang/pbasic <http://www.freebsd.org/cgi/url.cgi?ports/lang/pbasic/pkg-descr>`__.

Lisp
    A language that was developed in the late 1950s as an alternative to
    the “number-crunching” languages that were popular at the time.
    Instead of being based on numbers, Lisp is based on lists; in fact
    the name is short for “List Processing”. Very popular in AI
    (Artificial Intelligence) circles.

    Lisp is an extremely powerful and sophisticated language, but can be
    rather large and unwieldy.

    Various implementations of Lisp that can run on UNIX? systems are
    available in the Ports Collection for FreeBSD. GNU Common Lisp can
    be found as
    `lang/gcl <http://www.freebsd.org/cgi/url.cgi?ports/lang/gcl/pkg-descr>`__.
    CLISP by Bruno Haible and Michael Stoll is available as
    `lang/clisp <http://www.freebsd.org/cgi/url.cgi?ports/lang/clisp/pkg-descr>`__.
    For CMUCL, which includes a highly-optimizing compiler too, or
    simpler Lisp implementations like SLisp, which implements most of
    the Common Lisp constructs in a few hundred lines of C code,
    `lang/cmucl <http://www.freebsd.org/cgi/url.cgi?ports/lang/cmucl/pkg-descr>`__
    and
    `lang/slisp <http://www.freebsd.org/cgi/url.cgi?ports/lang/slisp/pkg-descr>`__
    are available respectively.

Perl
    Very popular with system administrators for writing scripts; also
    often used on World Wide Web servers for writing CGI scripts.

    Perl is available in the Ports Collection as
    `lang/perl5.16 <http://www.freebsd.org/cgi/url.cgi?ports/lang/perl5.16/pkg-descr>`__
    for all FreeBSD releases.

Scheme
    A dialect of Lisp that is rather more compact and cleaner than
    Common Lisp. Popular in Universities as it is simple enough to teach
    to undergraduates as a first language, while it has a high enough
    level of abstraction to be used in research work.

    Scheme is available from the Ports Collection as
    `lang/elk <http://www.freebsd.org/cgi/url.cgi?ports/lang/elk/pkg-descr>`__
    for the Elk Scheme Interpreter. The MIT Scheme Interpreter can be
    found in
    `lang/mit-scheme <http://www.freebsd.org/cgi/url.cgi?ports/lang/mit-scheme/pkg-descr>`__
    and the SCM Scheme Interpreter in
    `lang/scm <http://www.freebsd.org/cgi/url.cgi?ports/lang/scm/pkg-descr>`__.

Icon
    Icon is a high-level language with extensive facilities for
    processing strings and structures. The version of Icon for FreeBSD
    can be found in the Ports Collection as
    `lang/icon <http://www.freebsd.org/cgi/url.cgi?ports/lang/icon/pkg-descr>`__.

Logo
    Logo is a language that is easy to learn, and has been used as an
    introductory programming language in various courses. It is an
    excellent tool to work with when teaching programming in small ages,
    as it makes the creation of elaborate geometric shapes an easy task
    even for very small children.

    The latest version of Logo for FreeBSD is available from the Ports
    Collection in
    `lang/logo <http://www.freebsd.org/cgi/url.cgi?ports/lang/logo/pkg-descr>`__.

Python
    Python is an Object-Oriented, interpreted language. Its advocates
    argue that it is one of the best languages to start programming
    with, since it is relatively easy to start with, but is not limited
    in comparison to other popular interpreted languages that are used
    for the development of large, complex applications (Perl and Tcl are
    two other languages that are popular for such tasks).

    The latest version of Python is available from the Ports Collection
    in
    `lang/python <http://www.freebsd.org/cgi/url.cgi?ports/lang/python/pkg-descr>`__.

Ruby
    Ruby is an interpreter, pure object-oriented programming language.
    It has become widely popular because of its easy to understand
    syntax, flexibility when writing code, and the ability to easily
    develop and maintain large, complex programs.

    Ruby is available from the Ports Collection as
    `lang/ruby18 <http://www.freebsd.org/cgi/url.cgi?ports/lang/ruby18/pkg-descr>`__.

Tcl and Tk
    Tcl is an embeddable, interpreted language, that has become widely
    used and became popular mostly because of its portability to many
    platforms. It can be used both for quickly writing small, prototype
    applications, or (when combined with Tk, a GUI toolkit)
    fully-fledged, featureful programs.

    Various versions of Tcl are available as ports for FreeBSD. The
    latest version, Tcl 8.5, can be found in
    `lang/tcl85 <http://www.freebsd.org/cgi/url.cgi?ports/lang/tcl85/pkg-descr>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.3.?Compilers
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Compilers are rather different. First of all, you write your code in a
file (or files) using an editor. You then run the compiler and see if it
accepts your program. If it did not compile, grit your teeth and go back
to the editor; if it did compile and gave you a program, you can run it
either at a shell command prompt or in a debugger to see if it works
properly. `:sup:`[1]` <#ftn.idp63814864>`__

Obviously, this is not quite as direct as using an interpreter. However
it allows you to do a lot of things which are very difficult or even
impossible with an interpreter, such as writing code which interacts
closely with the operating system—or even writing your own operating
system! It is also useful if you need to write very efficient code, as
the compiler can take its time and optimize the code, which would not be
acceptable in an interpreter. Moreover, distributing a program written
for a compiler is usually more straightforward than one written for an
interpreter—you can just give them a copy of the executable, assuming
they have the same operating system as you.

As the edit-compile-run-debug cycle is rather tedious when using
separate programs, many commercial compiler makers have produced
Integrated Development Environments (IDEs for short). FreeBSD does not
include an IDE in the base system, but
`devel/kdevelop <http://www.freebsd.org/cgi/url.cgi?ports/devel/kdevelop/pkg-descr>`__
is available in the Ports Collection and many use Emacs for this
purpose. Using Emacs as an IDE is discussed in `Section?2.7, “Using
Emacs as a Development Environment” <emacs.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp63814864" class="footnote">

`:sup:`[1]` <#idp63814864>`__\ If you run it in the shell, you may get a
core dump.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+--------------------------------------+
| `Prev <tools-intro.html>`__?   | `Up <tools.html>`__     | ?\ `Next <tools-compiling.html>`__   |
+--------------------------------+-------------------------+--------------------------------------+
| 2.2.?Introduction?             | `Home <index.html>`__   | ?2.4.?Compiling with ``cc``          |
+--------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
