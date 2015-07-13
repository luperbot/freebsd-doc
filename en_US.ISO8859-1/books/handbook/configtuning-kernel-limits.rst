===========================
12.11.?Tuning Kernel Limits
===========================

.. raw:: html

   <div class="navheader">

12.11.?Tuning Kernel Limits
`Prev <configtuning-disk.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <adding-swap-space.html>`__

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

12.11.?Tuning Kernel Limits
---------------------------

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

12.11.1.?File/Process Limits
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

12.11.1.1.?\ ``kern.maxfiles``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``kern.maxfiles``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable can be raised or lowered based upon system requirements. This
variable indicates the maximum number of file descriptors on the system.
When the file descriptor table is full, file: table is full will show up
repeatedly in the system message buffer, which can be viewed using
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__.

Each open file, socket, or fifo uses one file descriptor. A large-scale
production server may easily require many thousands of file descriptors,
depending on the kind and number of services running concurrently.

In older FreeBSD releases, the default value of ``kern.maxfiles`` is
derived from ``maxusers`` in the kernel configuration file.
``kern.maxfiles`` grows proportionally to the value of ``maxusers``.
When compiling a custom kernel, consider setting this kernel
configuration option according to the use of the system. From this
number, the kernel is given most of its pre-defined limits. Even though
a production machine may not have 256 concurrent users, the resources
needed may be similar to a high-scale web server.

The read-only
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable ``kern.maxusers`` is automatically sized at boot based on the
amount of memory available in the system, and may be determined at
run-time by inspecting the value of ``kern.maxusers``. Some systems
require larger or smaller values of ``kern.maxusers`` and values of
``64``, ``128``, and ``256`` are not uncommon. Going above ``256`` is
not recommended unless a huge number of file descriptors is needed. Many
of the tunable values set to their defaults by ``kern.maxusers`` may be
individually overridden at boot-time or run-time in
``/boot/loader.conf``. Refer to
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
and ``/boot/defaults/loader.conf`` for more details and some hints.

In older releases, the system will auto-tune ``maxusers`` if it is set
to ``0``. `:sup:`[2]` <#ftn.idp74837584>`__. When setting this option,
set ``maxusers`` to at least ``4``, especially if the system runs Xorg
or is used to compile software. The most important table set by
``maxusers`` is the maximum number of processes, which is set to
``20 + 16 * maxusers``. If ``maxusers`` is set to ``1``, there can only
be ``36`` simultaneous processes, including the ``18`` or so that the
system starts up at boot time and the ``15`` or so used by Xorg. Even a
simple task like reading a manual page will start up nine processes to
filter, decompress, and view it. Setting ``maxusers`` to ``64`` allows
up to ``1044`` simultaneous processes, which should be enough for nearly
all uses. If, however, the proc table full error is displayed when
trying to start another program, or a server is running with a large
number of simultaneous users, increase the number and rebuild.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

``maxusers`` does *not* limit the number of users which can log into the
machine. It instead sets various table sizes to reasonable values
considering the maximum number of users on the system and how many
processes each user will be running.

.. raw:: html

   </div>

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

12.11.1.2.?\ ``kern.ipc.somaxconn``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``kern.ipc.somaxconn``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable limits the size of the listen queue for accepting new ``TCP``
connections. The default value of ``128`` is typically too low for
robust handling of new connections on a heavily loaded web server. For
such environments, it is recommended to increase this value to ``1024``
or higher. A service such as
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__,
or Apache may itself limit the listen queue size, but will often have a
directive in its configuration file to adjust the queue size. Large
listen queues do a better job of avoiding Denial of Service (DoS)
attacks.

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

12.11.2.?Network Limits
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``NMBCLUSTERS`` kernel configuration option dictates the amount of
network Mbufs available to the system. A heavily-trafficked server with
a low number of Mbufs will hinder performance. Each cluster represents
approximately 2?K of memory, so a value of ``1024`` represents ``2``
megabytes of kernel memory reserved for network buffers. A simple
calculation can be done to figure out how many are needed. A web server
which maxes out at ``1000`` simultaneous connections where each
connection uses a 6?K receive and 16?K send buffer, requires
approximately 32?MB worth of network buffers to cover the web server. A
good rule of thumb is to multiply by ``2``, so 2x32?MB?/?2?KB?=
64?MB?/?2?kB?= ``32768``. Values between ``4096`` and ``32768`` are
recommended for machines with greater amounts of memory. Never specify
an arbitrarily high value for this parameter as it could lead to a boot
time crash. To observe network cluster usage, use ``-m`` with
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__.

The ``kern.ipc.nmbclusters`` loader tunable should be used to tune this
at boot time. Only older versions of FreeBSD will require the use of the
``NMBCLUSTERS`` kernel
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
option.

For busy servers that make extensive use of the
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2>`__
system call, it may be necessary to increase the number of
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2>`__
buffers via the ``NSFBUFS`` kernel configuration option or by setting
its value in ``/boot/loader.conf`` (see
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
for details). A common indicator that this parameter needs to be
adjusted is when processes are seen in the ``sfbufa`` state. The
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable ``kern.ipc.nsfbufs`` is read-only. This parameter nominally
scales with ``kern.maxusers``, however it may be necessary to tune
accordingly.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Even though a socket has been marked as non-blocking, calling
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2>`__
on the non-blocking socket may result in the
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2>`__
call blocking until enough ``struct sf_buf``'s are made available.

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

12.11.2.1.?\ ``net.inet.ip.portrange.*``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``net.inet.ip.portrange.*``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variables control the port number ranges automatically bound to ``TCP``
and ``UDP`` sockets. There are three ranges: a low range, a default
range, and a high range. Most network programs use the default range
which is controlled by ``net.inet.ip.portrange.first`` and
``net.inet.ip.portrange.last``, which default to ``1024`` and ``5000``,
respectively. Bound port ranges are used for outgoing connections and it
is possible to run the system out of ports under certain circumstances.
This most commonly occurs when running a heavily loaded web proxy. The
port range is not an issue when running a server which handles mainly
incoming connections, such as a web server, or has a limited number of
outgoing connections, such as a mail relay. For situations where there
is a shortage of ports, it is recommended to increase
``net.inet.ip.portrange.last`` modestly. A value of ``10000``, ``20000``
or ``30000`` may be reasonable. Consider firewall effects when changing
the port range. Some firewalls may block large ranges of ports, usually
low-numbered ports, and expect systems to use higher ranges of ports for
outgoing connections. For this reason, it is not recommended that the
value of ``net.inet.ip.portrange.first`` be lowered.

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

12.11.2.2.?\ ``TCP`` Bandwidth Delay Product
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``TCP`` bandwidth delay product limiting can be enabled by setting the
``net.inet.tcp.inflight.enable``
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variable to ``1``. This instructs the system to attempt to calculate the
bandwidth delay product for each connection and limit the amount of data
queued to the network to just the amount required to maintain optimum
throughput.

This feature is useful when serving data over modems, Gigabit Ethernet,
high speed ``WAN`` links, or any other link with a high bandwidth delay
product, especially when also using window scaling or when a large send
window has been configured. When enabling this option, also set
``net.inet.tcp.inflight.debug`` to ``0`` to disable debugging. For
production use, setting ``net.inet.tcp.inflight.min`` to at least
``6144`` may be beneficial. Setting high minimums may effectively
disable bandwidth limiting, depending on the link. The limiting feature
reduces the amount of data built up in intermediate route and switch
packet queues and reduces the amount of data built up in the local
host's interface queue. With fewer queued packets, interactive
connections, especially over slow modems, will operate with lower *Round
Trip Times*. This feature only effects server side data transmission
such as uploading. It has no effect on data reception or downloading.

Adjusting ``net.inet.tcp.inflight.stab`` is *not* recommended. This
parameter defaults to ``20``, representing 2 maximal packets added to
the bandwidth delay product window calculation. The additional window is
required to stabilize the algorithm and improve responsiveness to
changing conditions, but it can also result in higher
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
times over slow links, though still much lower than without the inflight
algorithm. In such cases, try reducing this parameter to ``15``, ``10``,
or ``5`` and reducing ``net.inet.tcp.inflight.min`` to a value such as
``3500`` to get the desired effect. Reducing these parameters should be
done as a last resort only.

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

12.11.3.?Virtual Memory
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

12.11.3.1.?\ ``kern.maxvnodes``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A vnode is the internal representation of a file or directory.
Increasing the number of vnodes available to the operating system
reduces disk I/O. Normally, this is handled by the operating system and
does not need to be changed. In some cases where disk I/O is a
bottleneck and the system is running out of vnodes, this setting needs
to be increased. The amount of inactive and free RAM will need to be
taken into account.

To see the current number of vnodes in use:

.. code:: screen

    # sysctl vfs.numvnodes
    vfs.numvnodes: 91349

To see the maximum vnodes:

.. code:: screen

    # sysctl kern.maxvnodes
    kern.maxvnodes: 100000

If the current vnode usage is near the maximum, try increasing
``kern.maxvnodes`` by a value of ``1000``. Keep an eye on the number of
``vfs.numvnodes``. If it climbs up to the maximum again,
``kern.maxvnodes`` will need to be increased further. Otherwise, a shift
in memory usage as reported by
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
should be visible and more memory should be active.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp74837584" class="footnote">

`:sup:`[2]` <#idp74837584>`__\ The auto-tuning algorithm sets
``maxusers`` equal to the amount of memory in the system, with a minimum
of ``32``, and a maximum of ``384``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+----------------------------------------+
| `Prev <configtuning-disk.html>`__?   | `Up <config-tuning.html>`__   | ?\ `Next <adding-swap-space.html>`__   |
+--------------------------------------+-------------------------------+----------------------------------------+
| 12.10.?Tuning Disks?                 | `Home <index.html>`__         | ?12.12.?Adding Swap Space              |
+--------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
