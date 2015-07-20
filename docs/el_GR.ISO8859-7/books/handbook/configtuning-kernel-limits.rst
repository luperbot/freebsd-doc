===========================
12.13. Tuning Kernel Limits
===========================

.. raw:: html

   <div class="navheader">

12.13. Tuning Kernel Limits
`????? <configtuning-disk.html>`__?
???????? 12. ??????? ??? ??????????????
?\ `??????? <adding-swap-space.html>`__

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

12.13. Tuning Kernel Limits
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

12.13.1. File/Process Limits
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

12.13.1.1. ``kern.maxfiles``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``kern.maxfiles`` can be raised or lowered based upon your system
requirements. This variable indicates the maximum number of file
descriptors on your system. When the file descriptor table is full,
file: table is full will show up repeatedly in the system message
buffer, which can be viewed with the ``dmesg`` command.

Each open file, socket, or fifo uses one file descriptor. A large-scale
production server may easily require many thousands of file descriptors,
depending on the kind and number of services running concurrently.

In older FreeBSD releases, the default value of ``kern.maxfiles`` is
derived from the ``maxusers`` option in your kernel configuration file.
``kern.maxfiles`` grows proportionally to the value of ``maxusers``.
When compiling a custom kernel, it is a good idea to set this kernel
configuration option according to the uses of your system. From this
number, the kernel is given most of its pre-defined limits. Even though
a production machine may not actually have 256 users connected at once,
the resources needed may be similar to a high-scale web server.

As of FreeBSD 4.5, ``kern.maxusers`` is automatically sized at boot
based on the amount of memory available in the system, and may be
determined at run-time by inspecting the value of the read-only
``kern.maxusers`` sysctl. Some sites will require larger or smaller
values of ``kern.maxusers`` and may set it as a loader tunable; values
of 64, 128, and 256 are not uncommon. We do not recommend going above
256 unless you need a huge number of file descriptors; many of the
tunable values set to their defaults by ``kern.maxusers`` may be
individually overridden at boot-time or run-time in
``/boot/loader.conf`` (see the
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
man page or the ``/boot/defaults/loader.conf`` file for some hints) or
as described elsewhere in this document. Systems older than FreeBSD?4.4
must set this value via the kernel
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
option ``maxusers`` instead.

In older releases, the system will auto-tune ``maxusers`` for you if you
explicitly set it to ``0``\ `:sup:`[5]` <#ftn.idp85932752>`__. When
setting this option, you will want to set ``maxusers`` to at least 4,
especially if you are using the X Window System or compiling software.
The reason is that the most important table set by ``maxusers`` is the
maximum number of processes, which is set to
``20 + 16 *       maxusers``, so if you set ``maxusers`` to 1, then you
can only have 36 simultaneous processes, including the 18 or so that the
system starts up at boot time and the 15 or so you will probably create
when you start the X Window System. Even a simple task like reading a
manual page will start up nine processes to filter, decompress, and view
it. Setting ``maxusers`` to 64 will allow you to have up to 1044
simultaneous processes, which should be enough for nearly all uses. If,
however, you see the dreaded proc table full error when trying to start
another program, or are running a server with a large number of
simultaneous users (like ``ftp.FreeBSD.org``), you can always increase
the number and rebuild.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

``maxusers`` does *not* limit the number of users which can log into
your machine. It simply sets various table sizes to reasonable values
considering the maximum number of users you will likely have on your
system and how many processes each of them will be running. One keyword
which *does* limit the number of simultaneous remote logins and X
terminal windows is
```pseudo-device pty         16`` <kernelconfig-config.html#kernelconfig-ptys>`__.
With FreeBSD?5.X, you do not have to worry about this number since the
`pty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pty&sektion=4>`__
driver is ?auto-cloning?; you simply use the line ``device pty`` in your
configuration file.

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

12.13.1.2. ``kern.ipc.somaxconn``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``kern.ipc.somaxconn`` sysctl variable limits the size of the listen
queue for accepting new TCP connections. The default value of ``128`` is
typically too low for robust handling of new connections in a heavily
loaded web server environment. For such environments, it is recommended
to increase this value to ``1024`` or higher. The service daemon may
itself limit the listen queue size (e.g.
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__,
or Apache) but will often have a directive in its configuration file to
adjust the queue size. Large listen queues also do a better job of
avoiding Denial of Service (DoS) attacks.

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

12.13.2. Network Limits
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``NMBCLUSTERS`` kernel configuration option dictates the amount of
network Mbufs available to the system. A heavily-trafficked server with
a low number of Mbufs will hinder FreeBSD's ability. Each cluster
represents approximately 2?K of memory, so a value of 1024 represents 2
megabytes of kernel memory reserved for network buffers. A simple
calculation can be done to figure out how many are needed. If you have a
web server which maxes out at 1000 simultaneous connections, and each
connection eats a 16?K receive and 16?K send buffer, you need
approximately 32?MB worth of network buffers to cover the web server. A
good rule of thumb is to multiply by 2, so 2x32?MB?/?2?KB?=
64?MB?/?2?kB?= 32768. We recommend values between 4096 and 32768 for
machines with greater amounts of memory. Under no circumstances should
you specify an arbitrarily high value for this parameter as it could
lead to a boot time crash. The ``-m`` option to
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__
may be used to observe network cluster use.

``kern.ipc.nmbclusters`` loader tunable should be used to tune this at
boot time. Only older versions of FreeBSD will require you to use the
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
adjusted is when processes are seen in the ``sfbufa`` state. The sysctl
variable ``kern.ipc.nsfbufs`` is a read-only glimpse at the kernel
configured variable. This parameter nominally scales with
``kern.maxusers``, however it may be necessary to tune accordingly.

.. raw:: html

   <div class="important" xmlns="">

?????????:
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

12.13.2.1. ``net.inet.ip.portrange.*``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``net.inet.ip.portrange.*`` sysctl variables control the port number
ranges automatically bound to TCP and UDP sockets. There are three
ranges: a low range, a default range, and a high range. Most network
programs use the default range which is controlled by the
``net.inet.ip.portrange.first`` and ``net.inet.ip.portrange.last``,
which default to 1024 and 5000, respectively. Bound port ranges are used
for outgoing connections, and it is possible to run the system out of
ports under certain circumstances. This most commonly occurs when you
are running a heavily loaded web proxy. The port range is not an issue
when running servers which handle mainly incoming connections, such as a
normal web server, or has a limited number of outgoing connections, such
as a mail relay. For situations where you may run yourself out of ports,
it is recommended to increase ``net.inet.ip.portrange.last`` modestly. A
value of ``10000``, ``20000`` or ``30000`` may be reasonable. You should
also consider firewall effects when changing the port range. Some
firewalls may block large ranges of ports (usually low-numbered ports)
and expect systems to use higher ranges of ports for outgoing
connections - for this reason it is not recommended that
``net.inet.ip.portrange.first`` be lowered.

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

12.13.2.2. TCP Bandwidth Delay Product
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The TCP Bandwidth Delay Product Limiting is similar to TCP/Vegas in
NetBSD. It can be enabled by setting ``net.inet.tcp.inflight.enable``
sysctl variable to ``1``. The system will attempt to calculate the
bandwidth delay product for each connection and limit the amount of data
queued to the network to just the amount required to maintain optimum
throughput.

This feature is useful if you are serving data over modems, Gigabit
Ethernet, or even high speed WAN links (or any other link with a high
bandwidth delay product), especially if you are also using window
scaling or have configured a large send window. If you enable this
option, you should also be sure to set ``net.inet.tcp.inflight.debug``
to ``0`` (disable debugging), and for production use setting
``net.inet.tcp.inflight.min`` to at least ``6144`` may be beneficial.
However, note that setting high minimums may effectively disable
bandwidth limiting depending on the link. The limiting feature reduces
the amount of data built up in intermediate route and switch packet
queues as well as reduces the amount of data built up in the local
host's interface queue. With fewer packets queued up, interactive
connections, especially over slow modems, will also be able to operate
with lower *Round Trip Times*. However, note that this feature only
effects data transmission (uploading / server side). It has no effect on
data reception (downloading).

Adjusting ``net.inet.tcp.inflight.stab`` is *not* recommended. This
parameter defaults to 20, representing 2 maximal packets added to the
bandwidth delay product window calculation. The additional window is
required to stabilize the algorithm and improve responsiveness to
changing conditions, but it can also result in higher ping times over
slow links (though still much lower than you would get without the
inflight algorithm). In such cases, you may wish to try reducing this
parameter to 15, 10, or 5; and may also have to reduce
``net.inet.tcp.inflight.min`` (for example, to 3500) to get the desired
effect. Reducing these parameters should be done as a last resort only.

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

12.13.3. Virtual Memory
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

12.13.3.1. ``kern.maxvnodes``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A vnode is the internal representation of a file or directory. So
increasing the number of vnodes available to the operating system cuts
down on disk I/O. Normally this is handled by the operating system and
does not need to be changed. In some cases where disk I/O is a
bottleneck and the system is running out of vnodes, this setting will
need to be increased. The amount of inactive and free RAM will need to
be taken into account.

To see the current number of vnodes in use:

.. code:: programlisting

    # sysctl vfs.numvnodes
    vfs.numvnodes: 91349

To see the maximum vnodes:

.. code:: programlisting

    # sysctl kern.maxvnodes
    kern.maxvnodes: 100000

If the current vnode usage is near the maximum, increasing
``kern.maxvnodes`` by a value of 1,000 is probably a good idea. Keep an
eye on the number of ``vfs.numvnodes``. If it climbs up to the maximum
again, ``kern.maxvnodes`` will need to be increased further. A shift in
your memory usage as reported by
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
should be visible. More memory should be active.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp85932752" class="footnote">

`:sup:`[5]` <#idp85932752>`__\ The auto-tuning algorithm sets
``maxusers`` equal to the amount of memory in the system, with a minimum
of 32, and a maximum of 384.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------------+-------------------------------------------+
| `????? <configtuning-disk.html>`__?   | `???? <config-tuning.html>`__   | ?\ `??????? <adding-swap-space.html>`__   |
+---------------------------------------+---------------------------------+-------------------------------------------+
| 12.12. Tuning Disks?                  | `???? <index.html>`__           | ?12.14. Adding Swap Space                 |
+---------------------------------------+---------------------------------+-------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
