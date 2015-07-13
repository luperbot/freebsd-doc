========================
Chapter?3.?Quick Porting
========================

.. raw:: html

   <div class="navheader">

Chapter?3.?Quick Porting
`Prev <own-port.html>`__?
?
?\ `Next <porting-desc.html>`__

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

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`3.1. Writing the ``Makefile`` <quick-porting.html#porting-makefile>`__
`3.2. Writing the Description Files <porting-desc.html>`__
`3.3. Creating the Checksum File <porting-checksum.html>`__
`3.4. Testing the Port <porting-testing.html>`__
`3.5. Checking the Port with ``portlint`` <porting-portlint.html>`__
`3.6. Submitting the New Port <porting-submitting.html>`__

.. raw:: html

   </div>

This section describes how to quickly create a new port. For
applications where this quick method is not adequate, the full “Slow
Porting” process is described in `Chapter?4, *Slow
Porting* <slow-porting.html>`__.

First, get the original tarball and put it into ``DISTDIR``, which
defaults to ``/usr/ports/distfiles``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

These steps assume that the software compiled out-of-the-box. In other
words, absolutely no changes were required for the application to work
on a FreeBSD system. If anything had to be changed, refer to `Chapter?4,
*Slow Porting* <slow-porting.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is recommended to set the ``DEVELOPER``
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
variable in ``/etc/make.conf`` before getting into porting.

.. code:: screen

    # echo DEVELOPER=yes >> /etc/make.conf

This setting enables the “developer mode” that displays deprecation
warnings and activates some further quality checks on calling ``make``.

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

3.1.?Writing the ``Makefile``
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The minimal ``Makefile`` would look something like this:

.. code:: programlisting

    # $FreeBSD$

    PORTNAME=   oneko
    PORTVERSION=    1.1b
    CATEGORIES= games
    MASTER_SITES=   ftp://ftp.cs.columbia.edu/archives/X11R5/contrib/

    MAINTAINER= youremail@example.com
    COMMENT=    Cat chasing a mouse all over the screen

    .include <bsd.port.mk>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

In some cases, the ``Makefile`` of an existing port may contain
additional lines in the header, such as the name of the port and the
date it was created. This additional information has been declared
obsolete, and is being phased out.

.. raw:: html

   </div>

Try to figure it out. Do not worry about the contents of the
``$FreeBSD$`` line, it will be filled in automatically by Subversion
when the port is imported to our main ports tree. A more detailed
example is shown in the `sample Makefile <porting-samplem.html>`__
section.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+---------------------------------------+
| `Prev <own-port.html>`__?       | ?                       | ?\ `Next <porting-desc.html>`__       |
+---------------------------------+-------------------------+---------------------------------------+
| Chapter?2.?Making a New Port?   | `Home <index.html>`__   | ?3.2.?Writing the Description Files   |
+---------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
