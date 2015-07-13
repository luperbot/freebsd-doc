=============================================
Chapter?6.?Regression and Performance Testing
=============================================

.. raw:: html

   <div class="navheader">

Chapter?6.?Regression and Performance Testing
`Prev <policies-shlib.html>`__?
Part?I.?Basics
?\ `Next <testing-tinderbox.html>`__

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

Chapter?6.?Regression and Performance Testing
---------------------------------------------

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

`6.1. Micro Benchmark
Checklist <testing.html#testing-micro-benchmark>`__
`6.2. The FreeBSD Source Tinderbox <testing-tinderbox.html>`__

.. raw:: html

   </div>

Regression tests are used to exercise a particular bit of the system to
check that it works as expected, and to make sure that old bugs are not
reintroduced.

The FreeBSD regression testing tools can be found in the FreeBSD source
tree in the directory ``src/tools/regression``.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.1.?Micro Benchmark Checklist
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section contains hints for doing proper micro-benchmarking on
FreeBSD or of FreeBSD itself.

It is not possible to use all of the suggestions below every single
time, but the more used, the better the benchmark's ability to test
small differences will be.

.. raw:: html

   <div class="itemizedlist">

-  Disable APM and any other kind of clock fiddling (ACPI ?).

-  Run in single user mode. E.g.,
   `cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__,
   and other daemons only add noise. The
   `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
   daemon can also cause problems. If ssh access is required during
   testing either disable the SSHv1 key regeneration, or kill the parent
   ``sshd`` daemon during the tests.

-  Do not run
   `ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__.

-  If
   `syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__
   events are generated, run
   `syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
   with an empty ``/etc/syslogd.conf``, otherwise, do not run it.

-  Minimize disk-I/O, avoid it entirely if possible.

-  Do not mount file systems that are not needed.

-  Mount ``/``, ``/usr``, and any other file system as read-only if
   possible. This removes atime updates to disk (etc.) from the I/O
   picture.

-  Reinitialize the read/write test file system with
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
   and populate it from a
   `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
   or
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
   file before every run. Unmount and mount it before starting the test.
   This results in a consistent file system layout. For a worldstone
   test this would apply to ``/usr/obj`` (just reinitialize with
   ``newfs`` and mount). To get 100% reproducibility, populate the file
   system from a
   `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
   file (i.e.: ``dd         if=myimage of=/dev/ad0s1h         bs=1m``)

-  Use malloc backed or preloaded
   `md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
   partitions.

-  Reboot between individual iterations of the test, this gives a more
   consistent state.

-  Remove all non-essential device drivers from the kernel. For instance
   if USB is not needed for the test, do not put USB in the kernel.
   Drivers which attach often have timeouts ticking away.

-  Unconfigure hardware that are not in use. Detach disks with
   `atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8>`__
   and
   `camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__
   if the disks are not used for the test.

-  Do not configure the network unless it is being tested, or wait until
   after the test has been performed to ship the results off to another
   computer.

   If the system must be connected to a public network, watch out for
   spikes of broadcast traffic. Even though it is hardly noticeable, it
   will take up CPU cycles. Multicast has similar caveats.

-  Put each file system on its own disk. This minimizes jitter from
   head-seek optimizations.

-  Minimize output to serial or VGA consoles. Running output into files
   gives less jitter. (Serial consoles easily become a bottleneck.) Do
   not touch keyboard while the test is running, even **space** or
   **back-space** shows up in the numbers.

-  Make sure the test is long enough, but not too long. If the test is
   too short, timestamping is a problem. If it is too long temperature
   changes and drift will affect the frequency of the quartz crystals in
   the computer. Rule of thumb: more than a minute, less than an hour.

-  Try to keep the temperature as stable as possible around the machine.
   This affects both quartz crystals and disk drive algorithms. To get
   real stable clock, consider stabilized clock injection. E.g., get a
   OCXO + PLL, inject output into clock circuits instead of motherboard
   xtal. Contact Poul-Henning Kamp ``<phk@FreeBSD.org>`` for more
   information about this.

-  Run the test at least 3 times but it is better to run more than 20
   times both for “before” and “after” code. Try to interleave if
   possible (i.e.: do not run 20 times before then 20 times after), this
   makes it possible to spot environmental effects. Do not interleave
   1:1, but 3:3, this makes it possible to spot interaction effects.

   A good pattern is: ``bababa{bbbaaa}*``. This gives hint after the
   first 1+1 runs (so it is possible to stop the test if it goes
   entirely the wrong way), a standard deviation after the first 3+3
   (gives a good indication if it is going to be worth a long run) and
   trending and interaction numbers later on.

-  Use
   `ministat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ministat&sektion=1>`__
   to see if the numbers are significant. Consider buying “Cartoon guide
   to statistics” ISBN: 0062731025, highly recommended, if you have
   forgotten or never learned about standard deviation and Student's T.

-  Do not use background
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   unless the test is a benchmark of background ``fsck``. Also, disable
   ``background_fsck`` in ``/etc/rc.conf`` unless the benchmark is not
   started at least 60+“``fsck`` runtime” seconds after the boot, as
   `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
   wakes up and checks if ``fsck`` needs to run on any file systems when
   background ``fsck`` is enabled. Likewise, make sure there are no
   snapshots lying around unless the benchmark is a test with snapshots.

-  If the benchmark show unexpected bad performance, check for things
   like high interrupt volume from an unexpected source. Some versions
   of ACPI have been reported to “misbehave” and generate excess
   interrupts. To help diagnose odd test results, take a few snapshots
   of ``vmstat -i`` and look for anything unusual.

-  Make sure to be careful about optimization parameters for kernel and
   userspace, likewise debugging. It is easy to let something slip
   through and realize later the test was not comparing the same thing.

-  Do not ever benchmark with the ``WITNESS`` and ``INVARIANTS`` kernel
   options enabled unless the test is interested to benchmarking those
   features. ``WITNESS`` can cause 400%+ drops in performance. Likewise,
   userspace
   `malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3>`__
   parameters default differently in -CURRENT from the way they ship in
   production releases.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+----------------------------------------+
| `Prev <policies-shlib.html>`__?   | `Up <Basics.html>`__    | ?\ `Next <testing-tinderbox.html>`__   |
+-----------------------------------+-------------------------+----------------------------------------+
| 5.5.?Shared Libraries?            | `Home <index.html>`__   | ?6.2.?The FreeBSD Source Tinderbox     |
+-----------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
