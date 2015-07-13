==================
25.4.?Using DTrace
==================

.. raw:: html

   <div class="navheader">

25.4.?Using DTrace
`Prev <dtrace-enable.html>`__?
Chapter?25.?DTrace
?\ `Next <network-communication.html>`__

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

25.4.?Using DTrace
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DTrace scripts consist of a list of one or more *probes*, or
instrumentation points, where each probe is associated with an action.
Whenever the condition for a probe is met, the associated action is
executed. For example, an action may occur when a file is opened, a
process is started, or a line of code is executed. The action might be
to log some information or to modify context variables. The reading and
writing of context variables allows probes to share information and to
cooperatively analyze the correlation of different events.

To view all probes, the administrator can execute the following command:

.. code:: screen

    # dtrace -l | more

Each probe has an ``ID``, a ``PROVIDER`` (dtrace or fbt), a ``MODULE``,
and a ``FUNCTION NAME``. Refer to
`dtrace(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dtrace&sektion=1>`__
for more information about this command.

The examples in this section provide an overview of how to use two of
the fully supported scripts from the DTrace Toolkit: the ``hotkernel``
and ``procsystime`` scripts.

The ``hotkernel`` script is designed to identify which function is using
the most kernel time. It will produce output similar to the following:

.. code:: screen

    # cd /usr/share/dtrace/toolkit
    # ./hotkernel
    Sampling... Hit Ctrl-C to end.

As instructed, use the **Ctrl**+**C** key combination to stop the
process. Upon termination, the script will display a list of kernel
functions and timing information, sorting the output in increasing order
of time:

.. code:: screen

    kernel`_thread_lock_flags                                   2   0.0%
    0xc1097063                                                  2   0.0%
    kernel`sched_userret                                        2   0.0%
    kernel`kern_select                                          2   0.0%
    kernel`generic_copyin                                       3   0.0%
    kernel`_mtx_assert                                          3   0.0%
    kernel`vm_fault                                             3   0.0%
    kernel`sopoll_generic                                       3   0.0%
    kernel`fixup_filename                                       4   0.0%
    kernel`_isitmyx                                             4   0.0%
    kernel`find_instance                                        4   0.0%
    kernel`_mtx_unlock_flags                                    5   0.0%
    kernel`syscall                                              5   0.0%
    kernel`DELAY                                                5   0.0%
    0xc108a253                                                  6   0.0%
    kernel`witness_lock                                         7   0.0%
    kernel`read_aux_data_no_wait                                7   0.0%
    kernel`Xint0x80_syscall                                     7   0.0%
    kernel`witness_checkorder                                   7   0.0%
    kernel`sse2_pagezero                                        8   0.0%
    kernel`strncmp                                              9   0.0%
    kernel`spinlock_exit                                       10   0.0%
    kernel`_mtx_lock_flags                                     11   0.0%
    kernel`witness_unlock                                      15   0.0%
    kernel`sched_idletd                                       137   0.3%
    0xc10981a5                                              42139  99.3%

This script will also work with kernel modules. To use this feature, run
the script with ``-m``:

.. code:: screen

    # ./hotkernel -m
    Sampling... Hit Ctrl-C to end.
    ^C
    MODULE                                                  COUNT   PCNT
    0xc107882e                                                  1   0.0%
    0xc10e6aa4                                                  1   0.0%
    0xc1076983                                                  1   0.0%
    0xc109708a                                                  1   0.0%
    0xc1075a5d                                                  1   0.0%
    0xc1077325                                                  1   0.0%
    0xc108a245                                                  1   0.0%
    0xc107730d                                                  1   0.0%
    0xc1097063                                                  2   0.0%
    0xc108a253                                                 73   0.0%
    kernel                                                    874   0.4%
    0xc10981a5                                             213781  99.6%

The ``procsystime`` script captures and prints the system call time
usage for a given process ID (PID) or process name. In the following
example, a new instance of ``/bin/csh`` was spawned. Then,
``procsystime`` was executed and remained waiting while a few commands
were typed on the other incarnation of ``csh``. These are the results of
this test:

.. code:: screen

    # ./procsystime -n csh
    Tracing... Hit Ctrl-C to end...
    ^C

    Elapsed Times for processes csh,

             SYSCALL          TIME (ns)
              getpid               6131
           sigreturn               8121
               close              19127
               fcntl              19959
                 dup              26955
             setpgid              28070
                stat              31899
           setitimer              40938
               wait4              62717
           sigaction              67372
         sigprocmask             119091
        gettimeofday             183710
               write             263242
              execve             492547
               ioctl             770073
               vfork            3258923
          sigsuspend            6985124
                read         3988049784

As shown, the ``read()`` system call used the most time in nanoseconds
while the ``getpid()`` system call used the least amount of time.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+--------------------------------------------+
| `Prev <dtrace-enable.html>`__?   | `Up <dtrace.html>`__    | ?\ `Next <network-communication.html>`__   |
+----------------------------------+-------------------------+--------------------------------------------+
| 25.3.?Enabling DTrace Support?   | `Home <index.html>`__   | ?Part?IV.?Network Communication            |
+----------------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
