======================
2.14.?System Operation
======================

.. raw:: html

   <div class="navheader">

2.14.?System Operation
`Prev <overview-network-implementation.html>`__?
Chapter?2.?Design Overview of 4.4BSD
?

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

2.14.?System Operation
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bootstrapping mechanisms are used to start the system running. First,
the 4.4BSD kernel must be loaded into the main memory of the processor.
Once loaded, it must go through an initialization phase to set the
hardware into a known state. Next, the kernel must do autoconfiguration,
a process that finds and configures the peripherals that are attached to
the processor. The system begins running in single-user mode while a
start-up script does disk checks and starts the accounting and quota
checking. Finally, the start-up script starts the general system
services and brings up the system to full multiuser operation.

During multiuser operation, processes wait for login requests on the
terminal lines and network ports that have been configured for user
access. When a login request is detected, a login process is spawned and
user validation is done. When the login validation is successful, a
login shell is created from which the user can run additional processes.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+--------------------------+-----+
| `Prev <overview-network-implementation.html>`__?   | `Up <overview.html>`__   | ?   |
+----------------------------------------------------+--------------------------+-----+
| 2.13.?Network Implementation?                      | `Home <index.html>`__    | ?   |
+----------------------------------------------------+--------------------------+-----+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
