=====================
3.3.?Buffer Overflows
=====================

.. raw:: html

   <div class="navheader">

3.3.?Buffer Overflows
`Prev <secure-philosophy.html>`__?
Chapter?3.?Secure Programming
?\ `Next <secure-setuid.html>`__

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

3.3.?Buffer Overflows
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Buffer Overflows have been around since the very beginnings of the
Von-Neuman `1 <bi01.html#COD>`__ architecture. They first gained
widespread notoriety in 1988 with the Morris Internet worm.
Unfortunately, the same basic attack remains effective today. By far the
most common type of buffer overflow attack is based on corrupting the
stack.

Most modern computer systems use a stack to pass arguments to procedures
and to store local variables. A stack is a last in first out (LIFO)
buffer in the high memory area of a process image. When a program
invokes a function a new "stack frame" is created. This stack frame
consists of the arguments passed to the function as well as a dynamic
amount of local variable space. The "stack pointer" is a register that
holds the current location of the top of the stack. Since this value is
constantly changing as new values are pushed onto the top of the stack,
many implementations also provide a "frame pointer" that is located near
the beginning of a stack frame so that local variables can more easily
be addressed relative to this value. `1 <bi01.html#COD>`__ The return
address for function calls is also stored on the stack, and this is the
cause of stack-overflow exploits since overflowing a local variable in a
function can overwrite the return address of that function, potentially
allowing a malicious user to execute any code he or she wants.

Although stack-based attacks are by far the most common, it would also
be possible to overrun the stack with a heap-based (malloc/free) attack.

The C programming language does not perform automatic bounds checking on
arrays or pointers as many other languages do. In addition, the standard
C library is filled with a handful of very dangerous functions.

.. raw:: html

   <div class="informaltable">

+----------------------------------------------------------+--------------------------------+
| ``strcpy``\ (char \*dest, const char \*src)              | May overflow the dest buffer   |
+----------------------------------------------------------+--------------------------------+
| ``strcat``\ (char \*dest, const char \*src)              | May overflow the dest buffer   |
+----------------------------------------------------------+--------------------------------+
| ``getwd``\ (char \*buf)                                  | May overflow the buf buffer    |
+----------------------------------------------------------+--------------------------------+
| ``gets``\ (char \*s)                                     | May overflow the s buffer      |
+----------------------------------------------------------+--------------------------------+
| ``[vf]scanf``\ (const char \*format, ...)                | May overflow its arguments.    |
+----------------------------------------------------------+--------------------------------+
| ``realpath``\ (char \*path, char resolved\_path[])       | May overflow the path buffer   |
+----------------------------------------------------------+--------------------------------+
| ``[v]sprintf``\ (char \*str, const char \*format, ...)   | May overflow the str buffer.   |
+----------------------------------------------------------+--------------------------------+

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

3.3.1.?Example Buffer Overflow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following example code contains a buffer overflow designed to
overwrite the return address and skip the instruction immediately
following the function call. (Inspired by `4 <bi01.html#Phrack>`__)

.. code:: programlisting

    #include <stdio.h>

    void manipulate(char *buffer) {
      char newbuffer[80];
      strcpy(newbuffer,buffer);
    }

    int main() {
      char ch,buffer[4096];
      int i=0;

      while ((buffer[i++] = getchar()) != '\n') {};

      i=1;
      manipulate(buffer);
      i=2;
      printf("The value of i is : %d\n",i);
      return 0;
    }

Let us examine what the memory image of this process would look like if
we were to input 160 spaces into our little program before hitting
return.

[XXX figure here!]

Obviously more malicious input can be devised to execute actual compiled
instructions (such as exec(/bin/sh)).

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

3.3.2.?Avoiding Buffer Overflows
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The most straightforward solution to the problem of stack-overflows is
to always use length restricted memory and string copy functions.
``strncpy`` and ``strncat`` are part of the standard C library. These
functions accept a length value as a parameter which should be no larger
than the size of the destination buffer. These functions will then copy
up to \`length' bytes from the source to the destination. However there
are a number of problems with these functions. Neither function
guarantees NUL termination if the size of the input buffer is as large
as the destination. The length parameter is also used inconsistently
between strncpy and strncat so it is easy for programmers to get
confused as to their proper usage. There is also a significant
performance loss compared to ``strcpy`` when copying a short string into
a large buffer since ``strncpy`` NUL fills up the size specified.

Another memory copy implementation exists to get around these problems.
The ``strlcpy`` and ``strlcat`` functions guarantee that they will
always null terminate the destination string when given a non-zero
length argument.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.2.1.?Compiler based run-time bounds checking
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unfortunately there is still a very large assortment of code in public
use which blindly copies memory around without using any of the bounded
copy routines we just discussed. Fortunately, there is a way to help
prevent such attacks — run-time bounds checking, which is implemented by
several C/C++ compilers.

ProPolice is one such compiler feature, and is integrated into
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__
versions 4.1 and later. It replaces and extends the earlier StackGuard
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__
extension.

ProPolice helps to protect against stack-based buffer overflows and
other attacks by laying pseudo-random numbers in key areas of the stack
before calling any function. When a function returns, these “canaries”
are checked and if they are found to have been changed the executable is
immediately aborted. Thus any attempt to modify the return address or
other variable stored on the stack in an attempt to get malicious code
to run is unlikely to succeed, as the attacker would have to also manage
to leave the pseudo-random canaries untouched.

Recompiling your application with ProPolice is an effective means of
stopping most buffer-overflow attacks, but it can still be compromised.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.2.2.?Library based run-time bounds checking
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Compiler-based mechanisms are completely useless for binary-only
software for which you cannot recompile. For these situations there are
a number of libraries which re-implement the unsafe functions of the
C-library (``strcpy``, ``fscanf``, ``getwd``, etc..) and ensure that
these functions can never write past the stack pointer.

.. raw:: html

   <div class="itemizedlist">

-  libsafe
-  libverify
-  libparanoia

.. raw:: html

   </div>

Unfortunately these library-based defenses have a number of
shortcomings. These libraries only protect against a very small set of
security related issues and they neglect to fix the actual problem.
These defenses may fail if the application was compiled with
-fomit-frame-pointer. Also, the LD\_PRELOAD and LD\_LIBRARY\_PATH
environment variables can be overwritten/unset by the user.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+------------------------------------+
| `Prev <secure-philosophy.html>`__?   | `Up <secure.html>`__    | ?\ `Next <secure-setuid.html>`__   |
+--------------------------------------+-------------------------+------------------------------------+
| 3.2.?Secure Design Methodology?      | `Home <index.html>`__   | ?3.4.?SetUID issues                |
+--------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
