============================
FreeBSD Developers' Handbook
============================

.. raw:: html

   <div class="navheader">

FreeBSD Developers' Handbook
?
?
?\ `Next <Basics.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

The FreeBSD Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2000-2014 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Copyright <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

Welcome to the Developers' Handbook. This manual is a *work in progress*
and is the work of many individuals. Many sections do not yet exist and
some of those that do exist need to be updated. If you are interested in
helping with this project, send email to the `FreeBSD documentation
project mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__.

The latest version of this document is always available from the
`FreeBSD World Wide Web server <../../../../index.html>`__. It may also
be downloaded in a variety of formats and compression options from the
`FreeBSD FTP server <ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/>`__ or one
of the numerous `mirror
sites <../../../../doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`I. Basics <Basics.html>`__
`1. Introduction <introduction.html>`__
`1.1. Developing on FreeBSD <introduction.html#introduction-devel>`__
`1.2. The BSD Vision <introduction-bsdvision.html>`__
`1.3. Architectural Guidelines <introduction-archguide.html>`__
`1.4. The Layout of ``/usr/src`` <introduction-layout.html>`__
`2. Programming Tools <tools.html>`__
`2.1. Synopsis <tools.html#tools-synopsis>`__
`2.2. Introduction <tools-intro.html>`__
`2.3. Introduction to Programming <tools-programming.html>`__
`2.4. Compiling with ``cc`` <tools-compiling.html>`__
`2.5. Make <tools-make.html>`__
`2.6. Debugging <debugging.html>`__
`2.7. Using Emacs as a Development Environment <emacs.html>`__
`2.8. Further Reading <tools-reading.html>`__
`3. Secure Programming <secure.html>`__
`3.1. Synopsis <secure.html#secure-synopsis>`__
`3.2. Secure Design Methodology <secure-philosophy.html>`__
`3.3. Buffer Overflows <secure-bufferov.html>`__
`3.4. SetUID issues <secure-setuid.html>`__
`3.5. Limiting your program's environment <secure-chroot.html>`__
`3.6. Trust <secure-trust.html>`__
`3.7. Race Conditions <secure-race-conditions.html>`__
`4. Localization and Internationalization - L10N and I18N <l10n.html>`__
`4.1. Programming I18N Compliant
Applications <l10n.html#l10n-programming>`__
`4.2. Localized Messages with POSIX.1 Native Language Support
(NLS) <posix-nls.html>`__
`5. Source Tree Guidelines and Policies <policies.html>`__
`5.1. Style Guidelines <policies.html#policies-style>`__
`5.2. ``MAINTAINER`` on Makefiles <policies-maintainer.html>`__
`5.3. Contributed Software <policies-contributed.html>`__
`5.4. Encumbered Files <policies-encumbered.html>`__
`5.5. Shared Libraries <policies-shlib.html>`__
`6. Regression and Performance Testing <testing.html>`__
`6.1. Micro Benchmark
Checklist <testing.html#testing-micro-benchmark>`__
`6.2. The FreeBSD Source Tinderbox <testing-tinderbox.html>`__
`II. Interprocess Communication <ipc.html>`__
`7. Sockets <sockets.html>`__
`7.1. Synopsis <sockets.html#sockets-synopsis>`__
`7.2. Networking and Diversity <sockets-diversity.html>`__
`7.3. Protocols <sockets-protocols.html>`__
`7.4. The Sockets Model <sockets-model.html>`__
`7.5. Essential Socket Functions <sockets-essential-functions.html>`__
`7.6. Helper Functions <sockets-helper-functions.html>`__
`7.7. Concurrent Servers <sockets-concurrent-servers.html>`__
`8. IPv6 Internals <ipv6.html>`__
`8.1. IPv6/IPsec Implementation <ipv6.html#ipv6-implementation>`__
`III. Kernel <kernel.html>`__
`9. Building and Installing a FreeBSD Kernel <kernelbuild.html>`__
`9.1. Building a Kernel the “Traditional”
Way <kernelbuild.html#kernelbuild-traditional>`__
`9.2. Building a Kernel the “New” Way <kernelbuild-new.html>`__
`10. Kernel Debugging <kerneldebug.html>`__
`10.1. Obtaining a Kernel Crash
Dump <kerneldebug.html#kerneldebug-obtain>`__
`10.2. Debugging a Kernel Crash Dump with
``kgdb`` <kerneldebug-gdb.html>`__
`10.3. Debugging a Crash Dump with DDD <kerneldebug-ddd.html>`__
`10.4. On-Line Kernel Debugging Using
DDB <kerneldebug-online-ddb.html>`__
`10.5. On-Line Kernel Debugging Using Remote
GDB <kerneldebug-online-gdb.html>`__
`10.6. Debugging a Console Driver <kerneldebug-console.html>`__
`10.7. Debugging Deadlocks <kerneldebug-deadlocks.html>`__
`10.8. Kernel debugging with Dcons <kerneldebug-dcons.html>`__
`10.9. Glossary of Kernel Options for
Debugging <kerneldebug-options.html>`__
`IV. Architectures <architectures.html>`__
`11. x86 Assembly Language Programming <x86.html>`__
`11.1. Synopsis <x86.html#x86-intro>`__
`11.2. The Tools <x86-the-tools.html>`__
`11.3. System Calls <x86-system-calls.html>`__
`11.4. Return Values <x86-return-values.html>`__
`11.5. Creating Portable Code <x86-portable-code.html>`__
`11.6. Our First Program <x86-first-program.html>`__
`11.7. Writing UNIX? Filters <x86-unix-filters.html>`__
`11.8. Buffered Input and Output <x86-buffered-io.html>`__
`11.9. Command Line Arguments <x86-command-line.html>`__
`11.10. UNIX? Environment <x86-environment.html>`__
`11.11. Working with Files <x86-files.html>`__
`11.12. One-Pointed Mind <x86-one-pointed-mind.html>`__
`11.13. Using the FPU <x86-fpu.html>`__
`11.14. Caveats <x86-caveats.html>`__
`11.15. Acknowledgements <x86-acknowledgements.html>`__
`V. Appendices <appendices.html>`__
`Bibliography <bi01.html>`__
`Index <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

List of Examples

.. raw:: html

   </div>

2.1. `A sample ``.emacs`` file <emacs.html#idp64901968>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------+
| ?   | ?   | ?\ `Next <Basics.html>`__   |
+-----+-----+-----------------------------+
| ?   | ?   | ?Part?I.?Basics             |
+-----+-----+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
