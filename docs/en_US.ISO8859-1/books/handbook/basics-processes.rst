==========================
4.8.?Processes and Daemons
==========================

.. raw:: html

   <div class="navheader">

4.8.?Processes and Daemons
`Prev <mount-unmount.html>`__?
Chapter?4.?UNIX Basics
?\ `Next <shells.html>`__

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

4.8.?Processes and Daemons
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD is a multi-tasking operating system. Each program running at any
one time is called a *process*. Every running command starts at least
one new process and there are a number of system processes that are run
by FreeBSD.

Each process is uniquely identified by a number called a *process ID*
(PID). Similar to files, each process has one owner and group, and the
owner and group permissions are used to determine which files and
devices the process can open. Most processes also have a parent process
that started them. For example, the shell is a process, and any command
started in the shell is a process which has the shell as its parent
process. The exception is a special process called
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
which is always the first process to start at boot time and which always
has a PID of ``1``.

Some programs are not designed to be run with continuous user input and
disconnect from the terminal at the first opportunity. For example, a
web server responds to web requests, rather than user input. Mail
servers are another example of this type of application. These types of
programs are known as *daemons*. The term daemon comes from Greek
mythology and represents an entity that is neither good nor evil, and
which invisibly performs useful tasks. This is why the BSD mascot is the
cheerful-looking daemon with sneakers and a pitchfork.

There is a convention to name programs that normally run as daemons with
a trailing “d”. For example, BIND is the Berkeley Internet Name Domain,
but the actual program that executes is ``named``. The Apache web server
program is ``httpd`` and the line printer spooling daemon is ``lpd``.
This is only a naming convention. For example, the main mail daemon for
the Sendmail application is ``sendmail``, and not ``maild``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.8.1.?Viewing Processes
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To see the processes running on the system, use
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ or
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__. To
display a static list of the currently running processes, their PIDs,
how much memory they are using, and the command they were started with,
use `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__.
To display all the running processes and update the display every few
seconds in order to interactively see what the computer is doing, use
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__.

By default,
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ only
shows the commands that are running and owned by the user. For example:

.. code:: screen

    % ps
     PID TT  STAT    TIME COMMAND
    8203  0  Ss   0:00.59 /bin/csh
    8895  0  R+   0:00.00 ps

The output from
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ is
organized into a number of columns. The ``PID`` column displays the
process ID. PIDs are assigned starting at 1, go up to 99999, then wrap
around back to the beginning. However, a PID is not reassigned if it is
already in use. The ``TT`` column shows the tty the program is running
on and ``STAT`` shows the program's state. ``TIME`` is the amount of
time the program has been running on the CPU. This is usually not the
elapsed time since the program was started, as most programs spend a lot
of time waiting for things to happen before they need to spend time on
the CPU. Finally, ``COMMAND`` is the command that was used to start the
program.

A number of different options are available to change the information
that is displayed. One of the most useful sets is ``auxww``, where ``a``
displays information about all the running processes of all users, ``u``
displays the username and memory usage of the process' owner, ``x``
displays information about daemon processes, and ``ww`` causes
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ to
display the full command line for each process, rather than truncating
it once it gets too long to fit on the screen.

The output from
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__ is
similar:

.. code:: screen

    % top
    last pid:  9609;  load averages:  0.56,  0.45,  0.36              up 0+00:20:03  10:21:46
    107 processes: 2 running, 104 sleeping, 1 zombie
    CPU:  6.2% user,  0.1% nice,  8.2% system,  0.4% interrupt, 85.1% idle
    Mem: 541M Active, 450M Inact, 1333M Wired, 4064K Cache, 1498M Free
    ARC: 992M Total, 377M MFU, 589M MRU, 250K Anon, 5280K Header, 21M Other
    Swap: 2048M Total, 2048M Free

      PID USERNAME    THR PRI NICE   SIZE    RES STATE   C   TIME   WCPU COMMAND
      557 root          1 -21  r31   136M 42296K select  0   2:20  9.96% Xorg
     8198 dru           2  52    0   449M 82736K select  3   0:08  5.96% kdeinit4
     8311 dru          27  30    0  1150M   187M uwait   1   1:37  0.98% firefox
      431 root          1  20    0 14268K  1728K select  0   0:06  0.98% moused
     9551 dru           1  21    0 16600K  2660K CPU3    3   0:01  0.98% top
     2357 dru           4  37    0   718M   141M select  0   0:21  0.00% kdeinit4
     8705 dru           4  35    0   480M    98M select  2   0:20  0.00% kdeinit4
     8076 dru           6  20    0   552M   113M uwait   0   0:12  0.00% soffice.bin
     2623 root          1  30   10 12088K  1636K select  3   0:09  0.00% powerd
     2338 dru           1  20    0   440M 84532K select  1   0:06  0.00% kwin
     1427 dru           5  22    0   605M 86412K select  1   0:05  0.00% kdeinit4

The output is split into two sections. The header (the first five or six
lines) shows the PID of the last process to run, the system load
averages (which are a measure of how busy the system is), the system
uptime (time since the last reboot) and the current time. The other
figures in the header relate to how many processes are running, how much
memory and swap space has been used, and how much time the system is
spending in different CPU states. If the ZFS file system module has been
loaded, an ``ARC`` line indicates how much data was read from the memory
cache instead of from disk.

Below the header is a series of columns containing similar information
to the output from
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__, such
as the PID, username, amount of CPU time, and the command that started
the process. By default,
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__ also
displays the amount of memory space taken by the process. This is split
into two columns: one for total size and one for resident size. Total
size is how much memory the application has needed and the resident size
is how much it is actually using now.

`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
automatically updates the display every two seconds. A different
interval can be specified with ``-s``.

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

4.8.2.?Killing Processes
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One way to communicate with any running process or daemon is to send a
*signal* using
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__.
There are a number of different signals; some have a specific meaning
while others are described in the application's documentation. A user
can only send a signal to a process they own and sending a signal to
someone else's process will result in a permission denied error. The
exception is the ``root`` user, who can send signals to anyone's
processes.

The operating system can also send a signal to a process. If an
application is badly written and tries to access memory that it is not
supposed to, FreeBSD will send the process the “Segmentation Violation”
signal (``SIGSEGV``). If an application has been written to use the
`alarm(3) <http://www.FreeBSD.org/cgi/man.cgi?query=alarm&sektion=3>`__
system call to be alerted after a period of time has elapsed, it will be
sent the “Alarm” signal (``SIGALRM``).

Two signals can be used to stop a process: ``SIGTERM`` and ``SIGKILL``.
``SIGTERM`` is the polite way to kill a process as the process can read
the signal, close any log files it may have open, and attempt to finish
what it is doing before shutting down. In some cases, a process may
ignore ``SIGTERM`` if it is in the middle of some task that can not be
interrupted.

``SIGKILL`` can not be ignored by a process. Sending a ``SIGKILL`` to a
process will usually stop that process there and then.
`:sup:`[1]` <#ftn.idp70574928>`__.

Other commonly used signals are ``SIGHUP``, ``SIGUSR1``, and
``SIGUSR2``. Since these are general purpose signals, different
applications will respond differently.

For example, after changing a web server's configuration file, the web
server needs to be told to re-read its configuration. Restarting
``httpd`` would result in a brief outage period on the web server.
Instead, send the daemon the ``SIGHUP`` signal. Be aware that different
daemons will have different behavior, so refer to the documentation for
the daemon to determine if ``SIGHUP`` will achieve the desired results.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?4.1.?Sending a Signal to a Process

.. raw:: html

   </div>

This example shows how to send a signal to
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__.
The
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
configuration file is ``/etc/inetd.conf``, and
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
will re-read this configuration file when it is sent a ``SIGHUP``.

#. Find the PID of the process to send the signal to using
   `pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1>`__.
   In this example, the PID for
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
   is 198:

   .. code:: screen

       % pgrep -l inetd
       198  inetd -wW

#. Use
   `kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
   to send the signal. Because
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
   is owned by ``root``, use
   `su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ to
   become ``root`` first.

   .. code:: screen

       % su
       Password:
       # /bin/kill -s HUP 198

   Like most UNIX? commands,
   `kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
   will not print any output if it is successful. If a signal is sent to
   a process not owned by that user, the message kill: *``PID``*:
   Operation not permitted will be displayed. Mistyping the PID will
   either send the signal to the wrong process, which could have
   negative results, or will send the signal to a PID that is not
   currently in use, resulting in the error kill: *``PID``*: No such
   process.

   .. raw:: html

      <div class="note" xmlns="">

   Why Use ``/bin/kill``?:
   ~~~~~~~~~~~~~~~~~~~~~~~

   Many shells provide ``kill`` as a built in command, meaning that the
   shell will send the signal directly, rather than running
   ``/bin/kill``. Be aware that different shells have a different syntax
   for specifying the name of the signal to send. Rather than try to
   learn all of them, it can be simpler to specify ``/bin/kill``.

   .. raw:: html

      </div>

.. raw:: html

   </div>

When sending other signals, substitute ``TERM`` or ``KILL`` with the
name of the signal.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Killing a random process on the system is a bad idea. In particular,
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__,
PID 1, is special. Running ``/bin/kill -s KILL 1`` is a quick, and
unrecommended, way to shutdown the system. *Always* double check the
arguments to
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
*before* pressing **Return**.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp70574928" class="footnote">

`:sup:`[1]` <#idp70574928>`__\ There are a few tasks that can not be
interrupted. For example, if the process is trying to read from a file
that is on another computer on the network, and the other computer is
unavailable, the process is said to be “uninterruptible”. Eventually the
process will time out, typically after two minutes. As soon as this time
out occurs the process will be killed.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+-----------------------------+
| `Prev <mount-unmount.html>`__?               | `Up <basics.html>`__    | ?\ `Next <shells.html>`__   |
+----------------------------------------------+-------------------------+-----------------------------+
| 4.7.?Mounting and Unmounting File Systems?   | `Home <index.html>`__   | ?4.9.?Shells                |
+----------------------------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
