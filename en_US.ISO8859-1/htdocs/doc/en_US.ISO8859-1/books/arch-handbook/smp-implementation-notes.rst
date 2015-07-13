=========================
8.5.?Implementation Notes
=========================

.. raw:: html

   <div class="navheader">

8.5.?Implementation Notes
`Prev <smp-lock-strategies.html>`__?
Chapter?8.?SMPng Design Document
?\ `Next <smp-misc.html>`__

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

8.5.?Implementation Notes
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.5.1.?Sleep Queues
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A sleep queue is a structure that holds the list of threads asleep on a
wait channel. Each thread that is not asleep on a wait channel carries a
sleep queue structure around with it. When a thread blocks on a wait
channel, it donates its sleep queue structure to that wait channel.
Sleep queues associated with a wait channel are stored in a hash table.

The sleep queue hash table holds sleep queues for wait channels that
have at least one blocked thread. Each entry in the hash table is called
a sleepqueue chain. The chain contains a linked list of sleep queues and
a spin mutex. The spin mutex protects the list of sleep queues as well
as the contents of the sleep queue structures on the list. Only one
sleep queue is associated with a given wait channel. If multiple threads
block on a wait channel than the sleep queues associated with all but
the first thread are stored on a list of free sleep queues in the master
sleep queue. When a thread is removed from the sleep queue it is given
one of the sleep queue structures from the master queue's free list if
it is not the only thread asleep on the queue. The last thread is given
the master sleep queue when it is resumed. Since threads may be removed
from the sleep queue in a different order than they are added, a thread
may depart from a sleep queue with a different sleep queue structure
than the one it arrived with.

The ``sleepq_lock`` function locks the spin mutex of the sleep queue
chain that maps to a specific wait channel. The ``sleepq_lookup``
function looks in the hash table for the master sleep queue associated
with a given wait channel. If no master sleep queue is found, it returns
``NULL``. The ``sleepq_release`` function unlocks the spin mutex
associated with a given wait channel.

A thread is added to a sleep queue via the ``sleepq_add``. This function
accepts the wait channel, a pointer to the mutex that protects the wait
channel, a wait message description string, and a mask of flags. The
sleep queue chain should be locked via ``sleepq_lock`` before this
function is called. If no mutex protects the wait channel (or it is
protected by Giant), then the mutex pointer argument should be ``NULL``.
The flags argument contains a type field that indicates the kind of
sleep queue that the thread is being added to and a flag to indicate if
the sleep is interruptible (``SLEEPQ_INTERRUPTIBLE``). Currently there
are only two types of sleep queues: traditional sleep queues managed via
the ``msleep`` and ``wakeup`` functions (``SLEEPQ_MSLEEP``) and
condition variable sleep queues (``SLEEPQ_CONDVAR``). The sleep queue
type and lock pointer argument are used solely for internal assertion
checking. Code that calls ``sleepq_add`` should explicitly unlock any
interlock protecting the wait channel after the associated sleepqueue
chain has been locked via ``sleepq_lock`` and before blocking on the
sleep queue via one of the waiting functions.

A timeout for a sleep is set by invoking ``sleepq_set_timeout``. The
function accepts the wait channel and the timeout time as a relative
tick count as its arguments. If a sleep should be interrupted by
arriving signals, the ``sleepq_catch_signals`` function should be called
as well. This function accepts the wait channel as its only parameter.
If there is already a signal pending for this thread, then
``sleepq_catch_signals`` will return a signal number; otherwise, it will
return 0.

Once a thread has been added to a sleep queue, it blocks using one of
the ``sleepq_wait`` functions. There are four wait functions depending
on whether or not the caller wishes to use a timeout or have the sleep
aborted by caught signals or an interrupt from the userland thread
scheduler. The ``sleepq_wait`` function simply waits until the current
thread is explicitly resumed by one of the wakeup functions. The
``sleepq_timedwait`` function waits until either the thread is
explicitly resumed or the timeout set by an earlier call to
``sleepq_set_timeout`` expires. The ``sleepq_wait_sig`` function waits
until either the thread is explicitly resumed or its sleep is aborted.
The ``sleepq_timedwait_sig`` function waits until either the thread is
explicitly resumed, the timeout set by an earlier call to
``sleepq_set_timeout`` expires, or the thread's sleep is aborted. All of
the wait functions accept the wait channel as their first parameter. In
addition, the ``sleepq_timedwait_sig`` function accepts a second boolean
parameter to indicate if the earlier call to ``sleepq_catch_signals``
found a pending signal.

If the thread is explicitly resumed or is aborted by a signal, then a
value of zero is returned by the wait function to indicate a successful
sleep. If the thread is resumed by either a timeout or an interrupt from
the userland thread scheduler then an appropriate errno value is
returned instead. Note that since ``sleepq_wait`` can only return 0 it
does not return anything and the caller should assume a successful
sleep. Also, if a thread's sleep times out and is aborted simultaneously
then ``sleepq_timedwait_sig`` will return an error indicating that a
timeout occurred. If an error value of 0 is returned and either
``sleepq_wait_sig`` or ``sleepq_timedwait_sig`` was used to block, then
the function ``sleepq_calc_signal_retval`` should be called to check for
any pending signals and calculate an appropriate return value if any are
found. The signal number returned by the earlier call to
``sleepq_catch_signals`` should be passed as the sole argument to
``sleepq_calc_signal_retval``.

Threads asleep on a wait channel are explicitly resumed by the
``sleepq_broadcast`` and ``sleepq_signal`` functions. Both functions
accept the wait channel from which to resume threads, a priority to
raise resumed threads to, and a flags argument to indicate which type of
sleep queue is being resumed. The priority argument is treated as a
minimum priority. If a thread being resumed already has a higher
priority (numerically lower) than the priority argument then its
priority is not adjusted. The flags argument is used for internal
assertions to ensure that sleep queues are not being treated as the
wrong type. For example, the condition variable functions should not
resume threads on a traditional sleep queue. The ``sleepq_broadcast``
function resumes all threads that are blocked on the specified wait
channel while ``sleepq_signal`` only resumes the highest priority thread
blocked on the wait channel. The sleep queue chain should first be
locked via the ``sleepq_lock`` function before calling these functions.

A sleeping thread may have its sleep interrupted by calling the
``sleepq_abort`` function. This function must be called with
``sched_lock`` held and the thread must be queued on a sleep queue. A
thread may also be removed from a specific sleep queue via the
``sleepq_remove`` function. This function accepts both a thread and a
wait channel as an argument and only awakens the thread if it is on the
sleep queue for the specified wait channel. If the thread is not on a
sleep queue or it is on a sleep queue for a different wait channel, then
this function does nothing.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.5.2.?Turnstiles
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

- Compare/contrast with sleep queues.

- Lookup/wait/release. - Describe TDF\_TSNOBLOCK race.

- Priority propagation.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.5.3.?Details of the Mutex Implementation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

- Should we require mutexes to be owned for mtx\_destroy() since we can
not safely assert that they are unowned by anyone else otherwise?

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.5.3.1.?Spin Mutexes
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

- Use a critical section...

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.5.3.2.?Sleep Mutexes
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

- Describe the races with contested mutexes

- Why it is safe to read mtx\_lock of a contested mutex when holding the
turnstile chain lock.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.5.4.?Witness
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

- What does it do

- How does it work

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+-------------------------------+
| `Prev <smp-lock-strategies.html>`__?   | `Up <smp.html>`__       | ?\ `Next <smp-misc.html>`__   |
+----------------------------------------+-------------------------+-------------------------------+
| 8.4.?Specific Locking Strategies?      | `Home <index.html>`__   | ?8.6.?Miscellaneous Topics    |
+----------------------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
