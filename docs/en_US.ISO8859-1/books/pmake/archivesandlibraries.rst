===========================
4.2.?Archives and Libraries
===========================

.. raw:: html

   <div class="navheader">

4.2.?Archives and Libraries
`Prev <gods.html>`__?
Chapter?4.?PMake for Gods
?\ `Next <condition.html>`__

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

4.2.?Archives and Libraries
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

UNIX? and Sprite allow you to merge files into an archive using the
``ar`` command. Further, if the files are relocatable object files, you
can run ranlib on the archive and get yourself a library that you can
link into any program you want. The main problem with archives is they
double the space you need to store the archived files, since there is
one copy in the archive and one copy out by itself. The problem with
libraries is you usually think of them as ``-lm`` rather than
``/usr/lib/libm.a`` and the linker thinks they are out-of-date if you so
much as look at them.

PMake solves the problem with archives by allowing you to tell it to
examine the files in the archives (so you can remove the individual
files without having to regenerate them later). To handle the problem
with libraries, PMake adds an additional way of deciding if a library is
out-of-date: if the table of contents is older than the library, or is
missing, the library is out-of-date.

A library is any target that looks like ``-lname`` or that ends in a
suffix that was marked as a library using the ``.LIBS`` target. ``.a``
is so marked in the system makefile. Members of an archive are specified
as ``archive(member[member...])``. Thus ``libdix.a(window.o)`` specifies
the file ``window.o`` in the archive ``libdix.a``. You may also use
wildcards to specify the members of the archive. Just remember that most
the wildcard characters will only find existing files. A file that is a
member of an archive is treated specially. If the file does not exist,
but it is in the archive, the modification time recorded in the archive
is used for the file when determining if the file is out-of-date. When
figuring out how to make an archived member target (not the file itself,
but the file in the archive – the archive(member) target), special care
is taken with the transformation rules, as follows:

.. raw:: html

   <div class="itemizedlist">

-  archive(member) is made to depend on member.

-  The transformation from the member's suffix to the archive's suffix
   is applied to the archive(member) target.

-  The archive(member)'s ``.TARGET`` variable is set to the name of the
   member if member is actually a target, or the path to the member file
   if member is only a source.

-  The ``.ARCHIVE`` variable for the archive(member) target is set to
   the name of the archive.

-  The ``.MEMBER`` variable is set to the actual string inside the
   parentheses. In most cases, this will be the same as the ``.TARGET``
   variable.

-  The archive(member)'s place in the local variables of the targets
   that depend on it is taken by the value of its ``.TARGET`` variable.

.. raw:: html

   </div>

Thus, a program library could be created with the following makefile:

.. code:: programlisting

    .o.a            :
        ...
        rm -f $(.TARGET:T)
    OBJS            = obj1.o obj2.o obj3.o
    libprog.a       : libprog.a($(OBJS))
        ar cru $(.TARGET) $(.OODATE)
        ranlib $(.TARGET)

This will cause the three object files to be compiled (if the
corresponding source files were modified after the object file or, if
that does not exist, the archived object file), the out-of-date ones
archived in ``libprog.a``, a table of contents placed in the archive and
the newly-archived object files to be removed.

All this is used in the ``makelib.mk`` system makefile to create a
single library with ease. This makefile looks like this:

.. code:: programlisting

    #
    # Rules for making libraries. The object files that make up the library
    # are removed once they are archived.
    #
    # To make several libraries in parallel, you should define the variable
    # "many_libraries". This will serialize the invocations of ranlib.
    #
    # To use, do something like this:
    #
    # OBJECTS = <files in the library>
    #
    # fish.a: fish.a($(OBJECTS)) MAKELIB
    #
    #

    #ifndef _MAKELIB_MK
    _MAKELIB_MK    =

    #include  <po.mk>

    .po.a .o.a     :
        ...
        rm -f $(.MEMBER)

    ARFLAGS        ?= crl

    #
    # Re-archive the out-of-date members and recreate the library's table of
    # contents using ranlib. If many_libraries is defined, put the ranlib
    # off til the end so many libraries can be made at once.
    #
    MAKELIB        : .USE .PRECIOUS
        ar $(ARFLAGS) $(.TARGET) $(.OODATE)
    #ifndef no_ranlib
    # ifdef many_libraries
        ...
    # endif many_libraries
        ranlib $(.TARGET)
    #endif no_ranlib

    #endif _MAKELIB_MK

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+--------------------------------+
| `Prev <gods.html>`__?        | `Up <gods.html>`__      | ?\ `Next <condition.html>`__   |
+------------------------------+-------------------------+--------------------------------+
| Chapter?4.?PMake for Gods?   | `Home <index.html>`__   | ?4.3.?On the Condition...      |
+------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
