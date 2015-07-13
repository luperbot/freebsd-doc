================================
25.2.?Implementation Differences
================================

.. raw:: html

   <div class="navheader">

25.2.?Implementation Differences
`Prev <dtrace.html>`__?
Chapter?25.?DTrace
?\ `Next <dtrace-enable.html>`__

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

25.2.?Implementation Differences
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While the DTrace in FreeBSD is similar to that found in Solaris™,
differences do exist. The primary difference is that in FreeBSD, DTrace
is implemented as a set of kernel modules and DTrace can not be used
until the modules are loaded. To load all of the necessary modules:

.. code:: screen

    # kldload dtraceall

Beginning with FreeBSD 10.0-RELEASE, the modules are automatically
loaded when ``dtrace`` is run.

FreeBSD uses the ``DDB_CTF`` kernel option to enable support for loading
CTF data from kernel modules and the kernel itself. CTF is the Solaris™
Compact C Type Format which encapsulates a reduced form of debugging
information similar to DWARF and the venerable stabs. CTF data is added
to binaries by the ``ctfconvert`` and ``ctfmerge`` build tools. The
``ctfconvert`` utility parses DWARF ELF debug sections created by the
compiler and ``ctfmerge`` merges CTF ELF sections from objects into
either executables or shared libraries.

Some different providers exist for FreeBSD than for Solaris™. Most
notable is the ``dtmalloc`` provider, which allows tracing ``malloc()``
by type in the FreeBSD kernel. Some of the providers found in Solaris™,
such as ``cpc`` and ``mib``, are not present in FreeBSD. These may
appear in future versions of FreeBSD. Moreover, some of the providers
available in both operating systems are not compatible, in the sense
that their probes have different argument types. Thus, D scripts written
on Solaris™ may or may not work unmodified on FreeBSD, and vice versa.

Due to security differences, only ``root`` may use DTrace on FreeBSD.
Solaris™ has a few low level security checks which do not yet exist in
FreeBSD. As such, the ``/dev/dtrace/dtrace`` is strictly limited to
``root``.

DTrace falls under the Common Development and Distribution License
(CDDL) license. To view this license on FreeBSD, see
``/usr/src/cddl/contrib/opensolaris/OPENSOLARIS.LICENSE`` or view it
online at ``http://opensource.org/licenses/CDDL-1.0``. While a FreeBSD
kernel with DTrace support is BSD licensed, the CDDL is used when the
modules are distributed in binary form or the binaries are loaded.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+------------------------------------+
| `Prev <dtrace.html>`__?   | `Up <dtrace.html>`__    | ?\ `Next <dtrace-enable.html>`__   |
+---------------------------+-------------------------+------------------------------------+
| Chapter?25.?DTrace?       | `Home <index.html>`__   | ?25.3.?Enabling DTrace Support     |
+---------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
