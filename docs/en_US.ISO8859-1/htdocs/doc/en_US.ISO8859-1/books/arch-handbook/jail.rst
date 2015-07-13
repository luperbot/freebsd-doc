=============================
Chapter?4.?The Jail Subsystem
=============================

.. raw:: html

   <div class="navheader">

Chapter?4.?The Jail Subsystem
`Prev <kernel-objects-using.html>`__?
Part?I.?Kernel
?\ `Next <jail-restrictions.html>`__

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

Chapter?4.?The Jail Subsystem
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Evan Sarmiento

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2001 Evan Sarmiento

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

`4.1. Architecture <jail.html#jail-arch>`__
`4.2. Restrictions <jail-restrictions.html>`__

.. raw:: html

   </div>

On most UNIX? systems, ``root`` has omnipotent power. This promotes
insecurity. If an attacker gained ``root`` on a system, he would have
every function at his fingertips. In FreeBSD there are sysctls which
dilute the power of ``root``, in order to minimize the damage caused by
an attacker. Specifically, one of these functions is called
``secure levels``. Similarly, another function which is present from
FreeBSD 4.0 and onward, is a utility called
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.
Jail chroots an environment and sets certain restrictions on processes
which are forked within the jail. For example, a jailed process cannot
affect processes outside the jail, utilize certain system calls, or
inflict any damage on the host environment.

Jail is becoming the new security model. People are running potentially
vulnerable servers such as Apache, BIND, and sendmail within jails, so
that if an attacker gains ``root`` within the jail, it is only an
annoyance, and not a devastation. This article mainly focuses on the
internals (source code) of jail. For information on how to set up a jail
see the `handbook entry on
jails <../../../../doc/en_US.ISO8859-1/books/handbook/jails.html>`__.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?Architecture
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jail consists of two realms: the userland program,
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__,
and the code implemented within the kernel: the
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2>`__
system call and associated restrictions. I will be discussing the
userland program and then how jail is implemented within the kernel.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.1.?Userland Code
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The source for the userland jail is located in
``/usr/src/usr.sbin/jail``, consisting of one file, ``jail.c``. The
program takes these arguments: the path of the jail, hostname, IP
address, and the command to be executed.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.1.1.?Data Structures
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In ``jail.c``, the first thing I would note is the declaration of an
important structure ``struct jail j;`` which was included from
``/usr/include/sys/jail.h``.

The definition of the ``jail`` structure is:

.. code:: programlisting

    /usr/include/sys/jail.h:

    struct jail {
            u_int32_t       version;
            char            *path;
            char            *hostname;
            u_int32_t       ip_number;
    };

As you can see, there is an entry for each of the arguments passed to
the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
program, and indeed, they are set during its execution.

.. code:: programlisting

    /usr/src/usr.sbin/jail/jail.c
    char path[PATH_MAX];
    ...
    if (realpath(argv[0], path) == NULL)
        err(1, "realpath: %s", argv[0]);
    if (chdir(path) != 0)
        err(1, "chdir: %s", path);
    memset(&j, 0, sizeof(j));
    j.version = 0;
    j.path = path;
    j.hostname = argv[1];

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

4.1.1.2.?Networking
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One of the arguments passed to the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
program is an IP address with which the jail can be accessed over the
network.
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
translates the IP address given into host byte order and then stores it
in ``j`` (the ``jail`` structure).

.. code:: programlisting

    /usr/src/usr.sbin/jail/jail.c:
    struct in_addr in;
    ...
    if (inet_aton(argv[2], &in) == 0)
        errx(1, "Could not make sense of ip-number: %s", argv[2]);
    j.ip_number = ntohl(in.s_addr);

The
`inet\_aton(3) <http://www.FreeBSD.org/cgi/man.cgi?query=inet_aton&sektion=3>`__
function "interprets the specified character string as an Internet
address, placing the address into the structure provided." The
``ip_number`` member in the ``jail`` structure is set only when the IP
address placed onto the ``in`` structure by
`inet\_aton(3) <http://www.FreeBSD.org/cgi/man.cgi?query=inet_aton&sektion=3>`__
is translated into host byte order by
`ntohl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ntohl&sektion=3>`__.

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

4.1.1.3.?Jailing the Process
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Finally, the userland program jails the process. Jail now becomes an
imprisoned process itself and then executes the command given using
`execv(3) <http://www.FreeBSD.org/cgi/man.cgi?query=execv&sektion=3>`__.

.. code:: programlisting

    /usr/src/usr.sbin/jail/jail.c
    i = jail(&j);
    ...
    if (execv(argv[3], argv + 3) != 0)
        err(1, "execv: %s", argv[3]);

As you can see, the ``jail()`` function is called, and its argument is
the ``jail`` structure which has been filled with the arguments given to
the program. Finally, the program you specify is executed. I will now
discuss how jail is implemented within the kernel.

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

4.1.2.?Kernel Space
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We will now be looking at the file ``/usr/src/sys/kern/kern_jail.c``.
This is the file where the
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2>`__
system call, appropriate sysctls, and networking functions are defined.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.2.1.?sysctls
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In ``kern_jail.c``, the following sysctls are defined:

.. code:: programlisting

    /usr/src/sys/kern/kern_jail.c:

    int     jail_set_hostname_allowed = 1;
    SYSCTL_INT(_security_jail, OID_AUTO, set_hostname_allowed, CTLFLAG_RW,
        &jail_set_hostname_allowed, 0,
        "Processes in jail can set their hostnames");

    int     jail_socket_unixiproute_only = 1;
    SYSCTL_INT(_security_jail, OID_AUTO, socket_unixiproute_only, CTLFLAG_RW,
        &jail_socket_unixiproute_only, 0,
        "Processes in jail are limited to creating UNIX/IPv4/route sockets only");

    int     jail_sysvipc_allowed = 0;
    SYSCTL_INT(_security_jail, OID_AUTO, sysvipc_allowed, CTLFLAG_RW,
        &jail_sysvipc_allowed, 0,
        "Processes in jail can use System V IPC primitives");

    static int jail_enforce_statfs = 2;
    SYSCTL_INT(_security_jail, OID_AUTO, enforce_statfs, CTLFLAG_RW,
        &jail_enforce_statfs, 0,
        "Processes in jail cannot see all mounted file systems");

    int    jail_allow_raw_sockets = 0;
    SYSCTL_INT(_security_jail, OID_AUTO, allow_raw_sockets, CTLFLAG_RW,
        &jail_allow_raw_sockets, 0,
        "Prison root can create raw sockets");

    int    jail_chflags_allowed = 0;
    SYSCTL_INT(_security_jail, OID_AUTO, chflags_allowed, CTLFLAG_RW,
        &jail_chflags_allowed, 0,
        "Processes in jail can alter system file flags");

    int     jail_mount_allowed = 0;
    SYSCTL_INT(_security_jail, OID_AUTO, mount_allowed, CTLFLAG_RW,
        &jail_mount_allowed, 0,
        "Processes in jail can mount/unmount jail-friendly file systems");

Each of these sysctls can be accessed by the user through the
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
program. Throughout the kernel, these specific sysctls are recognized by
their name. For example, the name of the first sysctl is
``security.jail.set_hostname_allowed``.

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

4.1.2.2.?\ `jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2>`__ System Call
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Like all system calls, the
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2>`__
system call takes two arguments, ``struct thread *td`` and
``struct jail_args *uap``. ``td`` is a pointer to the ``thread``
structure which describes the calling thread. In this context, ``uap``
is a pointer to the structure in which a pointer to the ``jail``
structure passed by the userland ``jail.c`` is contained. When I
described the userland program before, you saw that the
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2>`__
system call was given a ``jail`` structure as its own argument.

.. code:: programlisting

    /usr/src/sys/kern/kern_jail.c:
    /*
     * struct jail_args {
     *  struct jail *jail;
     * };
     */
    int
    jail(struct thread *td, struct jail_args *uap)

Therefore, ``uap->jail`` can be used to access the ``jail`` structure
which was passed to the system call. Next, the system call copies the
``jail`` structure into kernel space using the
`copyin(9) <http://www.FreeBSD.org/cgi/man.cgi?query=copyin&sektion=9>`__
function.
`copyin(9) <http://www.FreeBSD.org/cgi/man.cgi?query=copyin&sektion=9>`__
takes three arguments: the address of the data which is to be copied
into kernel space, ``uap->jail``, where to store it, ``j`` and the size
of the storage. The ``jail`` structure pointed by ``uap->jail`` is
copied into kernel space and is stored in another ``jail`` structure,
``j``.

.. code:: programlisting

    /usr/src/sys/kern/kern_jail.c: 
    error = copyin(uap->jail, &j, sizeof(j));

There is another important structure defined in ``jail.h``. It is the
``prison`` structure. The ``prison`` structure is used exclusively
within kernel space. Here is the definition of the ``prison`` structure.

.. code:: programlisting

    /usr/include/sys/jail.h:
    struct prison {
            LIST_ENTRY(prison) pr_list;                     /* (a) all prisons */
            int              pr_id;                         /* (c) prison id */
            int              pr_ref;                        /* (p) refcount */
            char             pr_path[MAXPATHLEN];           /* (c) chroot path */
            struct vnode    *pr_root;                       /* (c) vnode to rdir */
            char             pr_host[MAXHOSTNAMELEN];       /* (p) jail hostname */
            u_int32_t        pr_ip;                         /* (c) ip addr host */
            void            *pr_linux;                      /* (p) linux abi */
            int              pr_securelevel;                /* (p) securelevel */
            struct task      pr_task;                       /* (d) destroy task */
            struct mtx       pr_mtx;
          void            **pr_slots;                     /* (p) additional data */
    };

The
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2>`__
system call then allocates memory for a ``prison`` structure and copies
data between the ``jail`` and ``prison`` structure.

.. code:: programlisting

    /usr/src/sys/kern/kern_jail.c:
    MALLOC(pr, struct prison *, sizeof(*pr), M_PRISON, M_WAITOK | M_ZERO);
    ...
    error = copyinstr(j.path, &pr->pr_path, sizeof(pr->pr_path), 0);
    if (error)
        goto e_killmtx;
    ...
    error = copyinstr(j.hostname, &pr->pr_host, sizeof(pr->pr_host), 0);
    if (error)
         goto e_dropvnref;
    pr->pr_ip = j.ip_number;

Next, we will discuss another important system call
`jail\_attach(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail_attach&sektion=2>`__,
which implements the function to put a process into the jail.

.. code:: programlisting

    /usr/src/sys/kern/kern_jail.c:
    /*
     * struct jail_attach_args {
     *      int jid;
     * };
     */
    int
    jail_attach(struct thread *td, struct jail_attach_args *uap)

This system call makes the changes that can distinguish a jailed process
from those unjailed ones. To understand what
`jail\_attach(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail_attach&sektion=2>`__
does for us, certain background information is needed.

On FreeBSD, each kernel visible thread is identified by its ``thread``
structure, while the processes are described by their ``proc``
structures. You can find the definitions of the ``thread`` and ``proc``
structure in ``/usr/include/sys/proc.h``. For example, the ``td``
argument in any system call is actually a pointer to the calling
thread's ``thread`` structure, as stated before. The ``td_proc`` member
in the ``thread`` structure pointed by ``td`` is a pointer to the
``proc`` structure which represents the process that contains the thread
represented by ``td``. The ``proc`` structure contains members which can
describe the owner's identity(\ ``p_ucred``), the process resource
limits(\ ``p_limit``), and so on. In the ``ucred`` structure pointed by
``p_ucred`` member in the ``proc`` structure, there is a pointer to the
``prison`` structure(\ ``cr_prison``).

.. code:: programlisting

    /usr/include/sys/proc.h: 
    struct thread {
        ...
        struct proc *td_proc;
        ...
    };
    struct proc {
        ...
        struct ucred *p_ucred;
        ...
    };
    /usr/include/sys/ucred.h
    struct ucred {
        ...
        struct prison *cr_prison;
        ...
    };

In ``kern_jail.c``, the function ``jail()`` then calls function
``jail_attach()`` with a given ``jid``. And ``jail_attach()`` calls
function ``change_root()`` to change the root directory of the calling
process. The ``jail_attach()`` then creates a new ``ucred`` structure,
and attaches the newly created ``ucred`` structure to the calling
process after it has successfully attached the ``prison`` structure to
the ``ucred`` structure. From then on, the calling process is recognized
as jailed. When the kernel routine ``jailed()`` is called in the kernel
with the newly created ``ucred`` structure as its argument, it returns 1
to tell that the credential is connected with a jail. The public
ancestor process of all the process forked within the jail, is the
process which runs
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__,
as it calls the
`jail(2) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=2>`__
system call. When a program is executed through
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__,
it inherits the jailed property of its parent's ``ucred`` structure,
therefore it has a jailed ``ucred`` structure.

.. code:: programlisting

    /usr/src/sys/kern/kern_jail.c
    int
    jail(struct thread *td, struct jail_args *uap)
    {
    ...
        struct jail_attach_args jaa;
    ...
        error = jail_attach(td, &jaa);
        if (error)
            goto e_dropprref;
    ...
    }

    int
    jail_attach(struct thread *td, struct jail_attach_args *uap)
    {
        struct proc *p;
        struct ucred *newcred, *oldcred;
        struct prison *pr;
    ...
        p = td->td_proc;
    ...
        pr = prison_find(uap->jid);
    ...
        change_root(pr->pr_root, td);
    ...
        newcred->cr_prison = pr;
        p->p_ucred = newcred;
    ...
    }

When a process is forked from its parent process, the
`fork(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fork&sektion=2>`__
system call uses ``crhold()`` to maintain the credential for the newly
forked process. It inherently keep the newly forked child's credential
consistent with its parent, so the child process is also jailed.

.. code:: programlisting

    /usr/src/sys/kern/kern_fork.c:
    p2->p_ucred = crhold(td->td_ucred);
    ...
    td2->td_ucred = crhold(p2->p_ucred);

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+----------------------------------------+
| `Prev <kernel-objects-using.html>`__?   | `Up <kernel.html>`__    | ?\ `Next <jail-restrictions.html>`__   |
+-----------------------------------------+-------------------------+----------------------------------------+
| 3.3.?Using Kobj?                        | `Home <index.html>`__   | ?4.2.?Restrictions                     |
+-----------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
