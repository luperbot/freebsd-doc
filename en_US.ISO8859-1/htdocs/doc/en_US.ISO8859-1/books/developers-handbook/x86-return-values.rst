===================
11.4.?Return Values
===================

.. raw:: html

   <div class="navheader">

11.4.?Return Values
`Prev <x86-system-calls.html>`__?
Chapter?11.?x86 Assembly Language Programming
?\ `Next <x86-portable-code.html>`__

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

11.4.?Return Values
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A system call would not be useful most of the time if it did not return
some kind of a value: The file descriptor of an open file, the number of
bytes read to a buffer, the system time, etc.

Additionally, the system needs to inform us if an error occurs: A file
does not exist, system resources are exhausted, we passed an invalid
parameter, etc.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.4.1.?Man Pages
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The traditional place to look for information about various system calls
under UNIX? systems are the manual pages. FreeBSD describes its system
calls in section 2, sometimes in section 3.

For example,
`open(2) <http://www.FreeBSD.org/cgi/man.cgi?query=open&sektion=2>`__
says:

.. raw:: html

   <div class="blockquote">

    If successful, ``open()`` returns a non-negative integer, termed a
    file descriptor. It returns ``-1`` on failure, and sets ``errno`` to
    indicate the error.

.. raw:: html

   </div>

The assembly language programmer new to UNIX? and FreeBSD will
immediately ask the puzzling question: Where is ``errno`` and how do I
get to it?

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The information presented in the manual pages applies to C programs. The
assembly language programmer needs additional information.

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

11.4.2.?Where Are the Return Values?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unfortunately, it depends... For most system calls it is in ``EAX``, but
not for all. A good rule of thumb, when working with a system call for
the first time, is to look for the return value in ``EAX``. If it is not
there, you need further research.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

I am aware of one system call that returns the value in ``EDX``:
``SYS_fork``. All others I have worked with use ``EAX``. But I have not
worked with them all yet.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

If you cannot find the answer here or anywhere else, study libc source
code and see how it interfaces with the kernel.

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

11.4.3.?Where Is ``errno``?
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Actually, nowhere...

``errno`` is part of the C language, not the UNIX? kernel. When
accessing kernel services directly, the error code is returned in
``EAX``, the same register the proper return value generally ends up in.

This makes perfect sense. If there is no error, there is no error code.
If there is an error, there is no return value. One register can contain
either.

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

11.4.4.?Determining an Error Occurred
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When using the standard FreeBSD calling convention, the ``carry flag``
is cleared upon success, set upon failure.

When using the Linux emulation mode, the signed value in ``EAX`` is
non-negative upon success, and contains the return value. In case of an
error, the value is negative, i.e., ``-errno``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+----------------------------------------+
| `Prev <x86-system-calls.html>`__?   | `Up <x86.html>`__       | ?\ `Next <x86-portable-code.html>`__   |
+-------------------------------------+-------------------------+----------------------------------------+
| 11.3.?System Calls?                 | `Home <index.html>`__   | ?11.5.?Creating Portable Code          |
+-------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
