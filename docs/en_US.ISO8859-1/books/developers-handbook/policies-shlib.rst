=====================
5.5.?Shared Libraries
=====================

.. raw:: html

   <div class="navheader">

5.5.?Shared Libraries
`Prev <policies-encumbered.html>`__?
Chapter?5.?Source Tree Guidelines and Policies
?\ `Next <testing.html>`__

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

5.5.?Shared Libraries
---------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Satoshi Asami, Peter Wemm and David O'Brien.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you are adding shared library support to a port or other piece of
software that does not have one, the version numbers should follow these
rules. Generally, the resulting numbers will have nothing to do with the
release version of the software.

The three principles of shared library building are:

.. raw:: html

   <div class="itemizedlist">

-  Start from ``1.0``

-  If there is a change that is backwards compatible, bump minor number
   (note that ELF systems ignore the minor number)

-  If there is an incompatible change, bump major number

.. raw:: html

   </div>

For instance, added functions and bugfixes result in the minor version
number being bumped, while deleted functions, changed function call
syntax, etc. will force the major version number to change.

Stick to version numbers of the form major.minor (*``x``*.\ *``y``*).
Our a.out dynamic linker does not handle version numbers of the form
*``x``*.\ *``y``*.\ *``z``* well. Any version number after the *``y``*
(i.e. the third digit) is totally ignored when comparing shared lib
version numbers to decide which library to link with. Given two shared
libraries that differ only in the “micro” revision, ``ld.so`` will link
with the higher one. That is, if you link with ``libfoo.so.3.3.3``, the
linker only records ``3.3`` in the headers, and will link with anything
starting with
*``libfoo.so.3``*.\ *``(anything     >= 3)``*.\ *``(highest     available)``*.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

``ld.so`` will always use the highest “minor” revision. For instance, it
will use ``libc.so.2.2`` in preference to ``libc.so.2.0``, even if the
program was initially linked with ``libc.so.2.0``.

.. raw:: html

   </div>

In addition, our ELF dynamic linker does not handle minor version
numbers at all. However, one should still specify a major and minor
version number as our ``Makefile``\ s “do the right thing” based on the
type of system.

For non-port libraries, it is also our policy to change the shared
library version number only once between releases. In addition, it is
our policy to change the major shared library version number only once
between major OS releases (i.e. from 6.0 to 7.0). When you make a change
to a system library that requires the version number to be bumped, check
the ``Makefile``'s commit logs. It is the responsibility of the
committer to ensure that the first such change since the release will
result in the shared library version number in the ``Makefile`` to be
updated, and any subsequent changes will not.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+--------------------------+--------------------------------------------------+
| `Prev <policies-encumbered.html>`__?   | `Up <policies.html>`__   | ?\ `Next <testing.html>`__                       |
+----------------------------------------+--------------------------+--------------------------------------------------+
| 5.4.?Encumbered Files?                 | `Home <index.html>`__    | ?Chapter?6.?Regression and Performance Testing   |
+----------------------------------------+--------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
