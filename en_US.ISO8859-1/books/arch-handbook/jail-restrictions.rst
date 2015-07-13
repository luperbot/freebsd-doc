=================
4.2.?Restrictions
=================

.. raw:: html

   <div class="navheader">

4.2.?Restrictions
`Prev <jail.html>`__?
Chapter?4.?The Jail Subsystem
?\ `Next <sysinit.html>`__

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

4.2.?Restrictions
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Throughout the kernel there are access restrictions relating to jailed
processes. Usually, these restrictions only check whether the process is
jailed, and if so, returns an error. For example:

.. code:: programlisting

    if (jailed(td->td_ucred))
        return (EPERM);

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.1.?SysV IPC
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

System V IPC is based on messages. Processes can send each other these
messages which tell them how to act. The functions which deal with
messages are:
`msgctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=msgctl&sektion=3>`__,
`msgget(3) <http://www.FreeBSD.org/cgi/man.cgi?query=msgget&sektion=3>`__,
`msgsnd(3) <http://www.FreeBSD.org/cgi/man.cgi?query=msgsnd&sektion=3>`__
and
`msgrcv(3) <http://www.FreeBSD.org/cgi/man.cgi?query=msgrcv&sektion=3>`__.
Earlier, I mentioned that there were certain sysctls you could turn on
or off in order to affect the behavior of jail. One of these sysctls was
``security.jail.sysvipc_allowed``. By default, this sysctl is set to 0.
If it were set to 1, it would defeat the whole purpose of having a jail;
privileged users from the jail would be able to affect processes outside
the jailed environment. The difference between a message and a signal is
that the message only consists of the signal number.

``/usr/src/sys/kern/sysv_msg.c``:

.. raw:: html

   <div class="itemizedlist">

-  ``msgget(key, msgflg)``: ``msgget`` returns (and possibly creates) a
   message descriptor that designates a message queue for use in other
   functions.

-  ``msgctl(msgid, cmd, buf)``: Using this function, a process can query
   the status of a message descriptor.

-  ``msgsnd(msgid, msgp, msgsz, msgflg)``: ``msgsnd`` sends a message to
   a process.

-  ``msgrcv(msgid, msgp, msgsz, msgtyp,         msgflg)``: a process
   receives messages using this function

.. raw:: html

   </div>

In each of the system calls corresponding to these functions, there is
this conditional:

.. code:: programlisting

    /usr/src/sys/kern/sysv_msg.c:
    if (!jail_sysvipc_allowed && jailed(td->td_ucred))
        return (ENOSYS);

Semaphore system calls allow processes to synchronize execution by doing
a set of operations atomically on a set of semaphores. Basically
semaphores provide another way for processes lock resources. However,
process waiting on a semaphore, that is being used, will sleep until the
resources are relinquished. The following semaphore system calls are
blocked inside a jail:
`semget(2) <http://www.FreeBSD.org/cgi/man.cgi?query=semget&sektion=2>`__,
`semctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=semctl&sektion=2>`__
and
`semop(2) <http://www.FreeBSD.org/cgi/man.cgi?query=semop&sektion=2>`__.

``/usr/src/sys/kern/sysv_sem.c``:

.. raw:: html

   <div class="itemizedlist">

-  ``semctl(semid, semnum, cmd, ...)``: ``semctl`` does the specified
   ``cmd`` on the semaphore queue indicated by ``semid``.

-  ``semget(key, nsems, flag)``: ``semget`` creates an array of
   semaphores, corresponding to ``key``.

   ``key and flag take on the same meaning as they           do in msgget.``

-  ``semop(semid, array, nops)``: ``semop`` performs a group of
   operations indicated by ``array``, to the set of semaphores
   identified by ``semid``.

.. raw:: html

   </div>

System V IPC allows for processes to share memory. Processes can
communicate directly with each other by sharing parts of their virtual
address space and then reading and writing data stored in the shared
memory. These system calls are blocked within a jailed environment:
`shmdt(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shmdt&sektion=2>`__,
`shmat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shmat&sektion=2>`__,
`shmctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shmctl&sektion=2>`__
and
`shmget(2) <http://www.FreeBSD.org/cgi/man.cgi?query=shmget&sektion=2>`__.

``/usr/src/sys/kern/sysv_shm.c``:

.. raw:: html

   <div class="itemizedlist">

-  ``shmctl(shmid, cmd, buf)``: ``shmctl`` does various control
   operations on the shared memory region identified by ``shmid``.

-  ``shmget(key, size, flag)``: ``shmget`` accesses or creates a shared
   memory region of ``size`` bytes.

-  ``shmat(shmid, addr, flag)``: ``shmat`` attaches a shared memory
   region identified by ``shmid`` to the address space of a process.

-  ``shmdt(addr)``: ``shmdt`` detaches the shared memory region
   previously attached at ``addr``.

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

4.2.2.?Sockets
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jail treats the
`socket(2) <http://www.FreeBSD.org/cgi/man.cgi?query=socket&sektion=2>`__
system call and related lower-level socket functions in a special
manner. In order to determine whether a certain socket is allowed to be
created, it first checks to see if the sysctl
``security.jail.socket_unixiproute_only`` is set. If set, sockets are
only allowed to be created if the family specified is either
``PF_LOCAL``, ``PF_INET`` or ``PF_ROUTE``. Otherwise, it returns an
error.

.. code:: programlisting

    /usr/src/sys/kern/uipc_socket.c:
    int
    socreate(int dom, struct socket **aso, int type, int proto,
        struct ucred *cred, struct thread *td)
    {
        struct protosw *prp;
    ...
        if (jailed(cred) && jail_socket_unixiproute_only &&
            prp->pr_domain->dom_family != PF_LOCAL &&
            prp->pr_domain->dom_family != PF_INET &&
            prp->pr_domain->dom_family != PF_ROUTE) {
            return (EPROTONOSUPPORT);
        }
    ...
    }

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

4.2.3.?Berkeley Packet Filter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Berkeley Packet Filter provides a raw interface to data link layers
in a protocol independent fashion. BPF is now controlled by the
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8>`__
whether it can be used in a jailed environment.

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

4.2.4.?Protocols
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are certain protocols which are very common, such as TCP, UDP, IP
and ICMP. IP and ICMP are on the same level: the network layer 2. There
are certain precautions which are taken in order to prevent a jailed
process from binding a protocol to a certain address only if the ``nam``
parameter is set. ``nam`` is a pointer to a ``sockaddr`` structure,
which describes the address on which to bind the service. A more exact
definition is that ``sockaddr`` "may be used as a template for referring
to the identifying tag and length of each address". In the function
``in_pcbbind_setup()``, ``sin`` is a pointer to a ``sockaddr_in``
structure, which contains the port, address, length and domain family of
the socket which is to be bound. Basically, this disallows any processes
from jail to be able to specify the address that does not belong to the
jail in which the calling process exists.

.. code:: programlisting

    /usr/src/sys/netinet/in_pcb.c:
    int
    in_pcbbind_setup(struct inpcb *inp, struct sockaddr *nam, in_addr_t *laddrp,
        u_short *lportp, struct ucred *cred)
    {
        ...
        struct sockaddr_in *sin;
        ...
        if (nam) {
            sin = (struct sockaddr_in *)nam;
            ...
            if (sin->sin_addr.s_addr != INADDR_ANY)
                if (prison_ip(cred, 0, &sin->sin_addr.s_addr))
                    return(EINVAL);
            ...
            if (lport) {
                ...
                if (prison && prison_ip(cred, 0, &sin->sin_addr.s_addr))
                    return (EADDRNOTAVAIL);
                ...
            }
        }
        if (lport == 0) {
            ...
            if (laddr.s_addr != INADDR_ANY)
                if (prison_ip(cred, 0, &laddr.s_addr))
                    return (EINVAL);
            ...
        }
    ...
        if (prison_ip(cred, 0, &laddr.s_addr))
            return (EINVAL);
    ...
    }

You might be wondering what function ``prison_ip()`` does.
``prison_ip()`` is given three arguments, a pointer to the
credential(represented by ``cred``), any flags, and an IP address. It
returns 1 if the IP address does NOT belong to the jail or 0 otherwise.
As you can see from the code, if it is indeed an IP address not
belonging to the jail, the protocol is not allowed to bind to that
address.

.. code:: programlisting

    /usr/src/sys/kern/kern_jail.c:
    int
    prison_ip(struct ucred *cred, int flag, u_int32_t *ip)
    {
        u_int32_t tmp;

        if (!jailed(cred))
            return (0);
        if (flag)
            tmp = *ip;
        else
            tmp = ntohl(*ip);
        if (tmp == INADDR_ANY) {
            if (flag)
                *ip = cred->cr_prison->pr_ip;
            else
                *ip = htonl(cred->cr_prison->pr_ip);
            return (0);
        }
        if (tmp == INADDR_LOOPBACK) {
            if (flag)
                *ip = cred->cr_prison->pr_ip;
            else
                *ip = htonl(cred->cr_prison->pr_ip);
            return (0);
        }
        if (cred->cr_prison->pr_ip != tmp)
            return (1);
        return (0);
    }

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

4.2.5.?Filesystem
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Even ``root`` users within the jail are not allowed to unset or modify
any file flags, such as immutable, append-only, and undeleteable flags,
if the securelevel is greater than 0.

.. code:: programlisting

    /usr/src/sys/ufs/ufs/ufs_vnops.c:
    static int
    ufs_setattr(ap)
        ...
    {
        ...
            if (!priv_check_cred(cred, PRIV_VFS_SYSFLAGS, 0)) {
                if (ip->i_flags
                    & (SF_NOUNLINK | SF_IMMUTABLE | SF_APPEND)) {
                        error = securelevel_gt(cred, 0);
                        if (error)
                            return (error);
                }
                ...
            }
    }
    /usr/src/sys/kern/kern_priv.c
    int
    priv_check_cred(struct ucred *cred, int priv, int flags)
    {
        ...
        error = prison_priv_check(cred, priv);
        if (error)
            return (error);
        ...
    }
    /usr/src/sys/kern/kern_jail.c
    int
    prison_priv_check(struct ucred *cred, int priv)
    {
        ...
        switch (priv) {
        ...
        case PRIV_VFS_SYSFLAGS:
            if (jail_chflags_allowed)
                return (0);
            else
                return (EPERM);
        ...
        }
        ...
    }

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+-------------------------------------+
| `Prev <jail.html>`__?            | `Up <jail.html>`__      | ?\ `Next <sysinit.html>`__          |
+----------------------------------+-------------------------+-------------------------------------+
| Chapter?4.?The Jail Subsystem?   | `Home <index.html>`__   | ?Chapter?5.?The SYSINIT Framework   |
+----------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
