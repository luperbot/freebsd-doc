======================================
5.2.?Overview of Software Installation
======================================

.. raw:: html

   <div class="navheader">

5.2.?Overview of Software Installation
`Prev <ports.html>`__?
Chapter?5.?Installing Applications: Packages and Ports
?\ `Next <ports-finding-applications.html>`__

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

5.2.?Overview of Software Installation
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The typical steps for installing third-party software on a UNIX? system
include:

.. raw:: html

   <div class="procedure">

#. Find and download the software, which might be distributed in source
   code format or as a binary.

#. Unpack the software from its distribution format. This is typically a
   tarball compressed with
   `compress(1) <http://www.FreeBSD.org/cgi/man.cgi?query=compress&sektion=1>`__,
   `gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1>`__,
   or
   `bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1>`__.

#. Locate the documentation in ``INSTALL``, ``README`` or some file in a
   ``doc/`` subdirectory and read up on how to install the software.

#. If the software was distributed in source format, compile it. This
   may involve editing a ``Makefile`` or running a ``configure`` script.

#. Test and install the software.

.. raw:: html

   </div>

If the software package was not deliberately ported, or tested to work,
on FreeBSD, the source code may need editing in order for it to install
and run properly. At the time of this writing, over 24,000 third-party
applications have been ported to FreeBSD.

A FreeBSD package contains pre-compiled copies of all the commands for
an application, as well as any configuration files and documentation. A
package can be manipulated with the pkg commands, such as
``pkg install``.

A FreeBSD port is a collection of files designed to automate the process
of compiling an application from source code. The files that comprise a
port contain all the necessary information to automatically download,
extract, patch, compile, and install the application.

The ports system can also be used to generate packages which can be
manipulated with the FreeBSD package management commands.

Both packages and ports understand dependencies. If a package or port is
used to install an application and a dependent library is not already
installed, the library will automatically be installed first.

While the two technologies are similar, packages and ports each have
their own strengths. Select the technology that meets your requirements
for installing a particular application.

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Package Benefits

.. raw:: html

   </div>

-  A compressed package tarball is typically smaller than the compressed
   tarball containing the source code for the application.

-  Packages do not require compilation time. For large applications,
   such as Mozilla, KDE, or GNOME, this can be important on a slow
   system.

-  Packages do not require any understanding of the process involved in
   compiling software on FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Port Benefits

.. raw:: html

   </div>

-  Packages are normally compiled with conservative options because they
   have to run on the maximum number of systems. By compiling from the
   port, one can change the compilation options.

-  Some applications have compile-time options relating to which
   features are installed. For example, Apache can be configured with a
   wide variety of different built-in options.

   In some cases, multiple packages will exist for the same application
   to specify certain settings. For example, Ghostscript is available as
   a ``ghostscript`` package and a ``ghostscript-nox11`` package,
   depending on whether or not Xorg is installed. Creating multiple
   packages rapidly becomes impossible if an application has more than
   one or two different compile-time options.

-  The licensing conditions of some software forbid binary distribution.
   Such software must be distributed as source code which must be
   compiled by the end-user.

-  Some people do not trust binary distributions or prefer to read
   through source code in order to look for potential problems.

-  Source code is needed in order to apply custom patches.

.. raw:: html

   </div>

To keep track of updated ports, subscribe to the `FreeBSD ports mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__ and
the `FreeBSD ports bugs mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports-bugs>`__.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

Before installing any application, check http://vuxml.freebsd.org/ for
security issues related to the application or type ``pkg audit -F`` to
check all installed applications for known vulnerabilities.

.. raw:: html

   </div>

The remainder of this chapter explains how to use packages and ports to
install and manage third-party software on FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------+-------------------------+-------------------------------------------------+
| `Prev <ports.html>`__?                                    | `Up <ports.html>`__     | ?\ `Next <ports-finding-applications.html>`__   |
+-----------------------------------------------------------+-------------------------+-------------------------------------------------+
| Chapter?5.?Installing Applications: Packages and Ports?   | `Home <index.html>`__   | ?5.3.?Finding Software                          |
+-----------------------------------------------------------+-------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
