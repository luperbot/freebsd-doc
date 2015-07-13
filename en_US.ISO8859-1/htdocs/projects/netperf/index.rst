=============================================
FreeBSD Network Performance Project (netperf)
=============================================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Header And Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

.. raw:: html

   <div class="frontdonateroundbox">

.. raw:: html

   <div class="frontdonatetop">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatecontent">

`Donate to FreeBSD <https://www.FreeBSDFoundation.org/donate/>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatebot">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Peripheral Links
----------------

.. raw:: html

   <div id="searchnav">

.. raw:: html

   </div>

.. raw:: html

   <div id="search">

Search
------

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Site Navigation
---------------

.. raw:: html

   <div id="menu">

-  `Home <../../>`__

-  `About <../../about.html>`__

   -  `Introduction <../../projects/newbies.html>`__
   -  `Features <../../features.html>`__
   -  `Advocacy <../../advocacy/>`__
   -  `Marketing <../../marketing/>`__
   -  `Privacy Policy <../../privacy.html>`__

-  `Get FreeBSD <../../where.html>`__

   -  `Release Information <../../releases/>`__
   -  `Release Engineering <../../releng/>`__

-  `Documentation <../../docs.html>`__

   -  `FAQ <../../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../../docs/books.html>`__

-  `Community <../../community.html>`__

   -  `Mailing Lists <../../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../../usergroups.html>`__
   -  `Events <../../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../../support.html>`__

   -  `Vendors <../../commercial/commercial.html>`__
   -  `Security Information <../../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../../donations/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `Developers <../../projects/index.html>`__
-  `Developer's
   Handbook <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
-  `Porter's
   Handbook <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
-  `Source code repositories <../../developers/cvs.html>`__
-  `Release Engineering <../../releng/index.html>`__
-  `Platforms <../../platforms/>`__
-  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
-  `Contributing <../../doc/en_US.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Network Performance Project (netperf)
=============================================

Contents
--------

-  `Project Goal <#goal>`__
-  `Project Strategies <#strategies>`__
-  `Project Tasks <#tasks>`__
-  `Netperf Cluster <#cluster>`__
-  `Papers and Reports <#papers>`__
-  `Links <#links>`__

Project Goal
------------

The netperf project is working to enhance the performance of the FreeBSD
network stack. This work grew out of the SMPng Project, which moved the
FreeBSD kernel from a "Giant Lock" to more fine-grained locking and
multi-threading. SMPng offered both performance improvement and
degradation for the network stack, improving parallelism and preemption,
but substantially increasing per-packet processing costs. The netperf
project is primarily focussed on further improving parallelism in
network processing while reducing the SMP synchronization overhead. This
in turn will lead to higher processing throughput and lower processing
latency.

Project Strategies
------------------

Robert Watson

The two primary focuses of this work are to increase parallelism while
decreasing overhead. Several activities are being performed that will
work toward these goals:

-  The Netperf project has completed locking work for all components of
   the network stack; as of FreeBSD 7.0 we have removed non-MPSAFE
   protocol shims, and as of FreeBSD 8.0 we have removed non-MPSAFE
   device driver shims.

-  Optimize locking strategies to find better balances between locking
   granularity and locking overhead. In the first cut at locking for the
   kernel, the goal was to adopt a medium-grained locking approach based
   on data locking. This approach identifies critical data structures,
   and inserts new locks and locking operations to protect those data
   structures. Depending on the data model of the code being protected,
   this may lead to the introduction of a substantial number of locks
   offering unnecessary granularity, where the overhead of locking
   overwhelms the benefits of available parallelism and preemption. By
   selectively reducing granularity, it is possible to improve
   performance by decreasing locking overhead.

-  Amortize the cost of locking by processing queues of packets or
   events. While the cost of individual synchronization operations may
   be high, it is possible to amortize the cost of synchronization
   operations by grouping processing of similar data (packets, events)
   under the same protection. This approach focuses on identifying
   places where similar locking occurs frequently in succession, and
   introducing queueing or coalescing of lock operations across the body
   of the work. For example, when a series of packets is inserted into
   an outgoing interface queue, a basic locking approach would lock the
   queue for each insert operation, unlock it, and hand off to the
   interface driver to begin the send, repeating this sequence as
   required. With a coalesced approach, the caller would pass off a
   queue of packets in order to reduce the locking overhead, as well as
   eliminate unnecessary synchronization due to the queue being
   thread-local. This approach can be applied at several levels in the
   stack, and is particularly applicable at lower levels of the stack
   where streams of packets require almost identical processing.

-  Introduce new synchronization strategies with reduced overhead
   relative to traditional strategies. Most traditional strategies
   employ a combination of interrupt disabling and atomic operations to
   achieve mutual exclusion and non-preemption guarantees. However,
   these operations are expensive on modern CPUs, leading to the desire
   for cheaper primitives with weaker semantics. For example, the
   application of uni-processor primitives where synchronization is
   required only on a single processor, and optimizations to critical
   section primitives to avoid the need for interrupt disabling.

-  Modify synchronization strategies to take advantage of additional,
   non-locking, synchronization primitives. This approach might take the
   form of making increased use of per-CPU or per-thread data
   structures, which require little or no synchronization. For example,
   through the use of critical sections, it is possible to synchronize
   access to per-CPU caches and queues. Through the use of per-thread
   queues, data can be handed off between stack layers without the use
   of synchronization.

-  Increase the opportunities for parallelism through increased
   threading in the network stack. The current network stack model
   offers the opportunity for substantial parallelism, with outbound
   processing typically taking place in the context of the sending
   thread in kernel, crypto occurring in crypto worker threads, and
   receive processing taking place in a combination of the receiving
   ithread and dispatched netisr thread. While handoffs between threads
   introduces overhead (synchronization, context switching), there is
   the opportunity to increase parallelism in some workloads through
   introducing additional worker threads. Identifying work that may be
   relocated to new threads must be done carefully to balance overhead,
   and latency concerns, but can pay off by increasing effective CPU
   utilization and hence throughput. For example, introducing additional
   netisr threads capable of running on more than one CPU at a time can
   increase input parallelism, subject to maintaining desirable packet
   ordering (present in FreeBSD 8.0).

Project Tasks
-------------

+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Task                                                                                                                                                         | Responsible                                   | Last updated   | Status       | Notes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
+==============================================================================================================================================================+===============================================+================+==============+===============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| Prefer file descriptor reference counts to socket reference counts for system calls.                                                                         | Robert Watson                                 | 20041124       | Done         | Sockets and file descriptors both have reference counts in order to prevent these objects from being free'd while in use. However, if a file descriptor is used to reach the socket, the reference counts are somewhat interchangeable, as either will prevent undesired garbage collection. For socket system calls, overhead can be reduced by relying on the file descriptor reference count, thus avoiding the synchronized operations necessary to modify the socket reference count, an approach also taken in the VFS code. This change has been made for most socket system calls, and has been committed to HEAD (6.x). It has also been merged to RELENG\_5 for inclusion in 5.4.                                                                                                                                                                                                                                                                                                   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Mbuf queue library                                                                                                                                           | Robert Watson                                 | 20041124       | Prototyped   | In order to facilitate passing off queues of packets between network stack components, create an mbuf queue primitive, struct mbufqueue. The initial implementation is complete, and the primitive is now being applied in several sample cases to determine whether it offers the desired semantics and benefits. The implementation can be found in the rwatson\_dispatch Perforce branch. Additional work must also be done to explore the performance impact of "queues" vs arrays of mbuf pointers, which are likely to behave better from a caching perspective.                                                                                                                                                                                                                                                                                                                                                                                                                        |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Employ queued dispatch in interface send API                                                                                                                 | Robert Watson                                 | 20041106       | Prototyped   | An experimental if\_start\_mbufqueue() interface to struct ifnet has been added, which passes an mbuf queue to the device driver for processing, avoiding redundant synchronization against the interface queue, even in the event that additional queueing is required. This has not yet been benchmarked. A subset change to dispatch a single mbuf to a driver has also been prototyped, and benchmarked at a several percentage point improvement in packet send rates from user space.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Employ queued dispatch in the interface receive API                                                                                                          | Robert Watson                                 | 20041106       | Not done     | Similar to if\_start\_mbufqueue, allow input of a queue of mbufs from the device driver into the lowest protocol layers, such as ether\_input\_mbufqueue.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Employ queued dispatch across netisr dispatch API                                                                                                            | Robert Watson                                 | 20090601       | Done         | Pull all of the mbufs in the netisr queue into a thread-local mbuf queue to avoid repeated lock operations to access the queue. This work was completed as part of the netisr2 project, and will ship with 8.0-RELEASE.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Modify UMA allocator to use critical sections not mutexes for per-CPU caches.                                                                                | Robert Watson                                 | 20050429       | Done         | The mutexes protecting per-CPU caches require atomic operations on SMP systems; as they are per-CPU objects, the cost of synchronizing access to the caches can be reduced by combining CPU pinning and/or critical sections instead. This change has now been committed and will appear in 6.0-RELEASE; it results in a several percentage performance in UDP send from user space, and there have been reports of 20%+ improvements in allocation intensive code within the kernel. In micro-benchmarks, the cost of allocation on SMP is dramatically reduced.                                                                                                                                                                                                                                                                                                                                                                                                                             |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Modify malloc(9) allocator to use per-CPU statistics with critical sections to protect malloc\_type statistics rather than global statistics with a mutex.   | Robert Watson                                 | 20050529       | Done         | Previously, malloc(9) used a single statistics structure protected by a mutex to hold global malloc statistics for each malloc type. This change moves to per-CPU statistics structures, which are coalesced when reporting memory allocation statistics to the user, and protects them using critical sections. This reduces cache line contention for common allocation types by avoiding shared lines, and also reduces synchronization costs by using critical sections to synchronize access instead of a mutex. While malloc(9) is less frequently used in the network stack than uma(9), it is used for socket address data, so is on performance critical paths for datagram operations. This has been committed and appeared 6.0-RELEASE.                                                                                                                                                                                                                                            |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Optimize critical section performance                                                                                                                        | John Baldwin                                  | 20050404       | Done         | Critical sections prevent preemption of a thread on a CPU, as well as preventing migration of that thread to another CPU, and maybe used for synchronizing access to per-CPU data structures, as well as preventing recursion in interrupt processing. Currently, critical sections disable interrupts on the CPU. In previous versions of FreeBSD (4.x and before), optimizations were present that allowed for software interrupt disabling, which lowers the cost of critical sections in the common case by avoiding expensive microcode operations on the CPU. By restoring this model, or a variation on it, critical sections can be made substantially cheaper to enter. In particular, this change lowers the cost of critical sections on UP such that it is approximately the same cost as a mutex, meaning that optimizations on SMP to use critical sections instead of mutexes will not harm UP performance. This change has now been committed, and appeared in 6.0-RELEASE.   |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Normalize socket and protocol control block reference model                                                                                                  | Robert Watson                                 | 20060401       | Done         | The socket/protocol boundary is characterized by a set of data structures and API interfaces, where the socket code acts as both a consumer and a service library for protocols. This task is to normalize the reference model by which protocol state is attached to and detached from socket state in order to strengthen invariants, allowing the removal of countless unused code paths (especially error handling), the removal of unnecessary locking in TCP, and a general improve the structure of the code. This serves both the immediate purpose of improving the quality and performance of this code, as well as being necessary for future optimization work. These changes have been prototyped in Perforce, and now merged to 7-CURRENT. They will be merged into RELENG\_6 once they have been thoroughly tested.                                                                                                                                                            |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Add true inpcb reference count support                                                                                                                       | Mohan Srinivasan, Robert Watson, Peter Wemm   | 20081208       | Done         | Historically, the in-bound TCP and UDP socket paths relied on global pcbinfo info locks to prevent PCBs being delivered to from being garbage collected by another thread while in use. This set of changes introduces a true reference model for PCBs so that the global lock can be released during in-bound process, and appear in 8.0-RELEASE.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Fine-grained locking for UNIX domain sockets                                                                                                                 | Robert Watson                                 | 20070226       | Done         | UNIX domain sockets in FreeBSD 5.x and 6.x use a single global subsystem lock. This is sufficient to allow it to run without Giant, but results in contention with large numbers of processors simultaneously operating on UNIX domain sockets. This task introduced per-protocol control block locks in order to reduce contention on a larger subsystem lock, and the results appeared in 7.0-RELEASE.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Multiple netisr threads                                                                                                                                      | Robert Watson                                 | 20090601       | Done         | Historically, the BSD network stack has used a single network software interrupt context, for deferred network processing. With the introduction of multi-processing, this became a single software interrupt thread. In FreeBSD 8.0, multiple netisr threads are now supported, up to the number of CPUs present in the system.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------+----------------+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Netperf Cluster
---------------

Through the generous donations and investment of Sentex Data
Communications, FreeBSD Systems, IronPort Systems, and the FreeBSD
Foundation, a network performance testbed has been created in Ontario,
Canada for use by FreeBSD developers working in the area of network
performance. A similar cluster, made possible through the generous
donation of Verio, is being prepared for use in more general SMP
performance work in Virginia, US. Each cluster consists of several SMP
systems inter-connected with giga-bit ethernet such that relatively
arbitrary topologies can be constructed in order to test host-host, IP
forwarding, and bridging performance scenarios. Systems are network
booted, have serial console, and remote power, in order to maximize
availability and minimize configuration overhead. These systems are
available on a check-out basis for experimentation and performance
measurement to FreeBSD developers working on the Netperf project, and in
related areas.

`More detailed information on the netperf cluster can be found by
following this link. <cluster.html>`__

Papers and Reports
------------------

The following paper(s) have been produced by or are related to the
Netperf Project:

-  `"Introduction to Multithreading and Multiprocessing in the FreeBSD
   SMPng Network Stack", EuroBSDCon 2005, Basel,
   Switzerland <http://www.watson.org/~robert/freebsd/netperf/20051027-eurobsdcon2005-netperf.pdf>`__.

Links
-----

Some useful links relating to the netperf work:

-  SMPng Project -- Project to introduce finer grained locking in the
   FreeBSD kernel.

-  `Robert Watson's netperf web
   page <http://www.watson.org/~robert/freebsd/netperf/>`__ -- Web page
   that includes a change log and performance measurement/debugging
   information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../../search/index-site.html>`__ \| `Legal
Notices <../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ../..
