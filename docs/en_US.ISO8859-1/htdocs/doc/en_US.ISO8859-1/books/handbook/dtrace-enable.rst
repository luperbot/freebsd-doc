=============================
25.3.?Enabling DTrace Support
=============================

.. raw:: html

   <div class="navheader">

25.3.?Enabling DTrace Support
`Prev <dtrace-implementation.html>`__?
Chapter?25.?DTrace
?\ `Next <dtrace-using.html>`__

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

25.3.?Enabling DTrace Support
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD 9.2 and 10.0, DTrace support is built into the ``GENERIC``
kernel. Users of earlier versions of FreeBSD or who prefer to statically
compile in DTrace support should add the following lines to a custom
kernel configuration file and recompile the kernel using the
instructions in `Chapter?9, *Configuring the FreeBSD
Kernel* <kernelconfig.html>`__:

.. code:: programlisting

    options         KDTRACE_HOOKS
    options         DDB_CTF
    options     DEBUG=-g

Users of the AMD64 architecture should also add this line:

.. code:: programlisting

    options         KDTRACE_FRAME

This option provides support for FBT. While DTrace will work without
this option, there will be limited support for function boundary
tracing.

Once the FreeBSD system has rebooted into the new kernel, or the DTrace
kernel modules have been loaded using ``kldload dtraceall``, the system
will need support for the Korn shell as the DTrace Toolkit has several
utilities written in ``ksh``. Make sure that the
`shells/ksh93 <http://www.freebsd.org/cgi/url.cgi?ports/shells/ksh93/pkg-descr>`__
package or port is installed. It is also possible to run these tools
under
`shells/pdksh <http://www.freebsd.org/cgi/url.cgi?ports/shells/pdksh/pkg-descr>`__
or
`shells/mksh <http://www.freebsd.org/cgi/url.cgi?ports/shells/mksh/pkg-descr>`__.

Finally, install the current DTrace Toolkit, a collection of ready-made
scripts for collecting system information. There are scripts to check
open files, memory, CPU usage, and a lot more. FreeBSD 10 installs a few
of these scripts into ``/usr/share/dtrace``. On other FreeBSD versions,
or to install the full DTrace Toolkit, use the
`sysutils/DTraceToolkit <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/DTraceToolkit/pkg-descr>`__
package or port.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The scripts found in ``/usr/share/dtrace`` have been specifically ported
to FreeBSD. Not all of the scripts found in the DTrace Toolkit will work
as-is on FreeBSD and some scripts may require some effort in order for
them to work on FreeBSD.

.. raw:: html

   </div>

The DTrace Toolkit includes many scripts in the special language of
DTrace. This language is called the D language and it is very similar to
C++. An in depth discussion of the language is beyond the scope of this
document. It is extensively discussed at
``http://wikis.oracle.com/display/DTrace/Documentation``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------+-----------------------------------+
| `Prev <dtrace-implementation.html>`__?   | `Up <dtrace.html>`__    | ?\ `Next <dtrace-using.html>`__   |
+------------------------------------------+-------------------------+-----------------------------------+
| 25.2.?Implementation Differences?        | `Home <index.html>`__   | ?25.4.?Using DTrace               |
+------------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
