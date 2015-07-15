=========
2.5.?Make
=========

.. raw:: html

   <div class="navheader">

2.5.?Make
`Prev <tools-compiling.html>`__?
Chapter?2.?Programming Tools
?\ `Next <debugging.html>`__

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

2.5.?Make
---------

.. raw:: html

   </div>

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

2.5.1.?What is ``make``?
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When you are working on a simple program with only one or two source
files, typing in

.. code:: screen

    % cc file1.c file2.c

is not too bad, but it quickly becomes very tedious when there are
several files—and it can take a while to compile, too.

One way to get around this is to use object files and only recompile the
source file if the source code has changed. So we could have something
like:

.. code:: screen

    % cc file1.o file2.o … file37.c …

if we had changed ``file37.c``, but not any of the others, since the
last time we compiled. This may speed up the compilation quite a bit,
but does not solve the typing problem.

Or we could write a shell script to solve the typing problem, but it
would have to re-compile everything, making it very inefficient on a
large project.

What happens if we have hundreds of source files lying about? What if we
are working in a team with other people who forget to tell us when they
have changed one of their source files that we use?

Perhaps we could put the two solutions together and write something like
a shell script that would contain some kind of magic rule saying when a
source file needs compiling. Now all we need now is a program that can
understand these rules, as it is a bit too complicated for the shell.

This program is called ``make``. It reads in a file, called a
*makefile*, that tells it how different files depend on each other, and
works out which files need to be re-compiled and which ones do not. For
example, a rule could say something like “if ``fromboz.o`` is older than
``fromboz.c``, that means someone must have changed ``fromboz.c``, so it
needs to be re-compiled.” The makefile also has rules telling make *how*
to re-compile the source file, making it a much more powerful tool.

Makefiles are typically kept in the same directory as the source they
apply to, and can be called ``makefile``, ``Makefile`` or ``MAKEFILE``.
Most programmers use the name ``Makefile``, as this puts it near the top
of a directory listing, where it can easily be seen.
`:sup:`[5]` <#ftn.idp64345168>`__

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

2.5.2.?Example of using ``make``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here is a very simple make file:

.. code:: programlisting

    foo: foo.c
        cc -o foo foo.c

It consists of two lines, a dependency line and a creation line.

The dependency line here consists of the name of the program (known as
the *target*), followed by a colon, then whitespace, then the name of
the source file. When ``make`` reads this line, it looks to see if
``foo`` exists; if it exists, it compares the time ``foo`` was last
modified to the time ``foo.c`` was last modified. If ``foo`` does not
exist, or is older than ``foo.c``, it then looks at the creation line to
find out what to do. In other words, this is the rule for working out
when ``foo.c`` needs to be re-compiled.

The creation line starts with a tab (press the **tab** key) and then the
command you would type to create ``foo`` if you were doing it at a
command prompt. If ``foo`` is out of date, or does not exist, ``make``
then executes this command to create it. In other words, this is the
rule which tells make how to re-compile ``foo.c``.

So, when you type **``make``**, it will make sure that ``foo`` is up to
date with respect to your latest changes to ``foo.c``. This principle
can be extended to ``Makefile``\ s with hundreds of targets—in fact, on
FreeBSD, it is possible to compile the entire operating system just by
typing **``make       world``** in the appropriate directory!

Another useful property of makefiles is that the targets do not have to
be programs. For instance, we could have a make file that looks like
this:

.. code:: programlisting

    foo: foo.c
        cc -o foo foo.c

    install:
        cp foo /home/me

We can tell make which target we want to make by typing:

.. code:: screen

    % make target

``make`` will then only look at that target and ignore any others. For
example, if we type **``make foo``** with the makefile above, make will
ignore the ``install`` target.

If we just type **``make``** on its own, make will always look at the
first target and then stop without looking at any others. So if we typed
**``make``** here, it will just go to the ``foo`` target, re-compile
``foo`` if necessary, and then stop without going on to the ``install``
target.

Notice that the ``install`` target does not actually depend on anything!
This means that the command on the following line is always executed
when we try to make that target by typing **``make install``**. In this
case, it will copy ``foo`` into the user's home directory. This is often
used by application makefiles, so that the application can be installed
in the correct directory when it has been correctly compiled.

This is a slightly confusing subject to try to explain. If you do not
quite understand how ``make`` works, the best thing to do is to write a
simple program like “hello world” and a make file like the one above and
experiment. Then progress to using more than one source file, or having
the source file include a header file. The ``touch`` command is very
useful here—it changes the date on a file without you having to edit it.

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

2.5.3.?Make and include-files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

C code often starts with a list of files to include, for example
stdio.h. Some of these files are system-include files, some of them are
from the project you are now working on:

.. code:: programlisting

    #include <stdio.h>
    #include "foo.h"

    int main(....

To make sure that this file is recompiled the moment ``foo.h`` is
changed, you have to add it in your ``Makefile``:

.. code:: programlisting

    foo: foo.c foo.h

The moment your project is getting bigger and you have more and more own
include-files to maintain, it will be a pain to keep track of all
include files and the files which are depending on it. If you change an
include-file but forget to recompile all the files which are depending
on it, the results will be devastating. ``gcc`` has an option to analyze
your files and to produce a list of include-files and their
dependencies: ``-MM``.

If you add this to your Makefile:

.. code:: programlisting

    depend:
        gcc -E -MM *.c > .depend

and run **``make depend``**, the file ``.depend`` will appear with a
list of object-files, C-files and the include-files:

.. code:: programlisting

    foo.o: foo.c foo.h

If you change ``foo.h``, next time you run ``make`` all files depending
on ``foo.h`` will be recompiled.

Do not forget to run ``make depend`` each time you add an include-file
to one of your files.

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

2.5.4.?FreeBSD Makefiles
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Makefiles can be rather complicated to write. Fortunately, BSD-based
systems like FreeBSD come with some very powerful ones as part of the
system. One very good example of this is the FreeBSD ports system. Here
is the essential part of a typical ports ``Makefile``:

.. code:: programlisting

    MASTER_SITES=   ftp://freefall.cdrom.com/pub/FreeBSD/LOCAL_PORTS/
    DISTFILES=      scheme-microcode+dist-7.3-freebsd.tgz

    .include <bsd.port.mk>

Now, if we go to the directory for this port and type **``make``**, the
following happens:

.. raw:: html

   <div class="procedure">

#. A check is made to see if the source code for this port is already on
   the system.

#. If it is not, an FTP connection to the URL in MASTER\_SITES is set up
   to download the source.

#. The checksum for the source is calculated and compared it with one
   for a known, good, copy of the source. This is to make sure that the
   source was not corrupted while in transit.

#. Any changes required to make the source work on FreeBSD are
   applied—this is known as *patching*.

#. Any special configuration needed for the source is done. (Many UNIX?
   program distributions try to work out which version of UNIX? they are
   being compiled on and which optional UNIX? features are present—this
   is where they are given the information in the FreeBSD ports
   scenario).

#. The source code for the program is compiled. In effect, we change to
   the directory where the source was unpacked and do ``make``—the
   program's own make file has the necessary information to build the
   program.

#. We now have a compiled version of the program. If we wish, we can
   test it now; when we feel confident about the program, we can type
   **``make install``**. This will cause the program and any supporting
   files it needs to be copied into the correct location; an entry is
   also made into a package database, so that the port can easily be
   uninstalled later if we change our mind about it.

.. raw:: html

   </div>

Now I think you will agree that is rather impressive for a four line
script!

The secret lies in the last line, which tells ``make`` to look in the
system makefile called ``bsd.port.mk``. It is easy to overlook this
line, but this is where all the clever stuff comes from—someone has
written a makefile that tells ``make`` to do all the things above (plus
a couple of other things I did not mention, including handling any
errors that may occur) and anyone can get access to that just by putting
a single line in their own make file!

If you want to have a look at these system makefiles, they are in
``/usr/share/mk``, but it is probably best to wait until you have had a
bit of practice with makefiles, as they are very complicated (and if you
do look at them, make sure you have a flask of strong coffee handy!)

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

2.5.5.?More advanced uses of ``make``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``Make`` is a very powerful tool, and can do much more than the simple
example above shows. Unfortunately, there are several different versions
of ``make``, and they all differ considerably. The best way to learn
what they can do is probably to read the documentation—hopefully this
introduction will have given you a base from which you can do this.

The version of make that comes with FreeBSD is the Berkeley make; there
is a tutorial for it in ``/usr/share/doc/psd/12.make``. To view it, do

.. code:: screen

    % zmore paper.ascii.gz

in that directory.

Many applications in the ports use GNU make, which has a very good set
of “info” pages. If you have installed any of these ports, GNU make will
automatically have been installed as ``gmake``. It is also available as
a port and package in its own right.

To view the info pages for GNU make, you will have to edit the ``dir``
file in the ``/usr/local/info`` directory to add an entry for it. This
involves adding a line like

.. code:: programlisting

     * Make: (make).                 The GNU Make utility.

to the file. Once you have done this, you can type **``info``** and then
select make from the menu (or in Emacs, do **``C-h       i``**).

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64345168" class="footnote">

`:sup:`[5]` <#idp64345168>`__\ They do not use the ``MAKEFILE`` form as
block capitals are often used for documentation files like ``README``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+--------------------------------+
| `Prev <tools-compiling.html>`__?   | `Up <tools.html>`__     | ?\ `Next <debugging.html>`__   |
+------------------------------------+-------------------------+--------------------------------+
| 2.4.?Compiling with ``cc``?        | `Home <index.html>`__   | ?2.6.?Debugging                |
+------------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
