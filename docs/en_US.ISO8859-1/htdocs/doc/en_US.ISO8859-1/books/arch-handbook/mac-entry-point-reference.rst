=====================================
6.7.?MAC Policy Entry Point Reference
=====================================

.. raw:: html

   <div class="navheader">

6.7.?MAC Policy Entry Point Reference
`Prev <mac-policy-architecture.html>`__?
Chapter?6.?The TrustedBSD MAC Framework
?\ `Next <mac-userland-arch.html>`__

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

6.7.?MAC Policy Entry Point Reference
-------------------------------------

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

6.7.1.?General-Purpose Module Entry Points
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

6.7.1.1.?\ ``mpo_init``
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------+----------------+-----+
| ``void               mpo_init(``   | conf\ ``)``;   | ?   |
+------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mac_policy_conf               *conf``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+-------------------------+-----------+
| Parameter    | Description             | Locking   |
+==============+=========================+===========+
| *``conf``*   | MAC policy definition   | ?         |
+--------------+-------------------------+-----------+

.. raw:: html

   </div>

Policy load event. The policy list mutex is held, so sleep operations
cannot be performed, and calls out to other kernel subsystems must be
made with caution. If potentially sleeping memory allocations are
required during policy initialization, they should be made using a
separate module SYSINIT().

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

6.7.1.2.?\ ``mpo_destroy``
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------+----------------+-----+
| ``void               mpo_destroy(``   | conf\ ``)``;   | ?   |
+---------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mac_policy_conf               *conf``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+-------------------------+-----------+
| Parameter    | Description             | Locking   |
+==============+=========================+===========+
| *``conf``*   | MAC policy definition   | ?         |
+--------------+-------------------------+-----------+

.. raw:: html

   </div>

Policy load event. The policy list mutex is held, so caution should be
applied.

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

6.7.1.3.?\ ``mpo_syscall``
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------+---------------+-----+
| ``int               mpo_syscall(``   | td,           | ?   |
+--------------------------------------+---------------+-----+
| ?                                    | call,         | ?   |
+--------------------------------------+---------------+-----+
| ?                                    | arg\ ``)``;   | ?   |
+--------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct thread               *td``;
``int call``;
``void *arg``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+----------------------------------+-----------+
| Parameter    | Description                      | Locking   |
+==============+==================================+===========+
| *``td``*     | Calling thread                   | ?         |
+--------------+----------------------------------+-----------+
| *``call``*   | Policy-specific syscall number   | ?         |
+--------------+----------------------------------+-----------+
| *``arg``*    | Pointer to syscall arguments     | ?         |
+--------------+----------------------------------+-----------+

.. raw:: html

   </div>

This entry point provides a policy-multiplexed system call so that
policies may provide additional services to user processes without
registering specific system calls. The policy name provided during
registration is used to demux calls from userland, and the arguments
will be forwarded to this entry point. When implementing new services,
security modules should be sure to invoke appropriate access control
checks from the MAC framework as needed. For example, if a policy
implements an augmented signal functionality, it should call the
necessary signal access control checks to invoke the MAC framework and
other registered policies.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Modules must currently perform the ``copyin()`` of the syscall data on
their own.

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

6.7.1.4.?\ ``mpo_thread_userret``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+--------------+-----+
| ``void               mpo_thread_userret(``   | td\ ``)``;   | ?   |
+----------------------------------------------+--------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct thread               *td``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------+--------------------+-----------+
| Parameter   | Description        | Locking   |
+=============+====================+===========+
| *``td``*    | Returning thread   | ?         |
+-------------+--------------------+-----------+

.. raw:: html

   </div>

This entry point permits policy modules to perform MAC-related events
when a thread returns to user space, via a system call return, trap
return, or otherwise. This is required for policies that have floating
process labels, as it is not always possible to acquire the process lock
at arbitrary points in the stack during system call processing; process
labels might represent traditional authentication data, process history
information, or other data. To employ this mechanism, intended changes
to the process credential label may be stored in the ``p_label``
protected by a per-policy spin lock, and then set the per-thread
``TDF_ASTPENDING`` flag and per-process ``PS_MACPENDM`` flag to schedule
a call to the userret entry point. From this entry point, the policy may
create a replacement credential with less concern about the locking
context. Policy writers are cautioned that event ordering relating to
scheduling an AST and the AST being performed may be complex and
interlaced in multithreaded applications.

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

6.7.2.?Label Operations
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

6.7.2.1.?\ ``mpo_init_bpfdesc_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+-----------------+-----+
| ``void               mpo_init_bpfdesc_label(``   | label\ ``)``;   | ?   |
+--------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+----------------------+-----------+
| Parameter     | Description          | Locking   |
+===============+======================+===========+
| *``label``*   | New label to apply   | ?         |
+---------------+----------------------+-----------+

.. raw:: html

   </div>

Initialize the label on a newly instantiated bpfdesc (BPF descriptor).
Sleeping is permitted.

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

6.7.2.2.?\ ``mpo_init_cred_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+-----------------+-----+
| ``void               mpo_init_cred_label(``   | label\ ``)``;   | ?   |
+-----------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+---------------------------+-----------+
| Parameter     | Description               | Locking   |
+===============+===========================+===========+
| *``label``*   | New label to initialize   | ?         |
+---------------+---------------------------+-----------+

.. raw:: html

   </div>

Initialize the label for a newly instantiated user credential. Sleeping
is permitted.

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

6.7.2.3.?\ ``mpo_init_devfsdirent_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------------+-----------------+-----+
| ``void               mpo_init_devfsdirent_label(``   | label\ ``)``;   | ?   |
+------------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+----------------------+-----------+
| Parameter     | Description          | Locking   |
+===============+======================+===========+
| *``label``*   | New label to apply   | ?         |
+---------------+----------------------+-----------+

.. raw:: html

   </div>

Initialize the label on a newly instantiated devfs entry. Sleeping is
permitted.

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

6.7.2.4.?\ ``mpo_init_ifnet_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+-----------------+-----+
| ``void               mpo_init_ifnet_label(``   | label\ ``)``;   | ?   |
+------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+----------------------+-----------+
| Parameter     | Description          | Locking   |
+===============+======================+===========+
| *``label``*   | New label to apply   | ?         |
+---------------+----------------------+-----------+

.. raw:: html

   </div>

Initialize the label on a newly instantiated network interface. Sleeping
is permitted.

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

6.7.2.5.?\ ``mpo_init_ipq_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+----------------+-----+
| ``void               mpo_init_ipq_label(``   | label,         | ?   |
+----------------------------------------------+----------------+-----+
| ?                                            | flag\ ``)``;   | ?   |
+----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;
``int flag``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+--------------------------------------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                                                  | Locking   |
+===============+==============================================================================================================+===========+
| *``label``*   | New label to apply                                                                                           | ?         |
+---------------+--------------------------------------------------------------------------------------------------------------+-----------+
| *``flag``*    | Sleeping/non-sleeping `malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__; see below   | ?         |
+---------------+--------------------------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Initialize the label on a newly instantiated IP fragment reassembly
queue. The *``flag``* field may be one of M\_WAITOK and M\_NOWAIT, and
should be employed to avoid performing a sleeping
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
during this initialization call. IP fragment reassembly queue allocation
frequently occurs in performance sensitive environments, and the
implementation should be careful to avoid sleeping or long-lived
operations. This entry point is permitted to fail resulting in the
failure to allocate the IP fragment reassembly queue.

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

6.7.2.6.?\ ``mpo_init_mbuf_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+-----------------+-----+
| ``void               mpo_init_mbuf_label(``   | flag,           | ?   |
+-----------------------------------------------+-----------------+-----+
| ?                                             | label\ ``)``;   | ?   |
+-----------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``int flag``;
``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+--------------------------------------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                                                  | Locking   |
+===============+==============================================================================================================+===========+
| *``flag``*    | Sleeping/non-sleeping `malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__; see below   | ?         |
+---------------+--------------------------------------------------------------------------------------------------------------+-----------+
| *``label``*   | Policy label to initialize                                                                                   | ?         |
+---------------+--------------------------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Initialize the label on a newly instantiated mbuf packet header
(*``mbuf``*). The *``flag``* field may be one of M\_WAITOK and
M\_NOWAIT, and should be employed to avoid performing a sleeping
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
during this initialization call. Mbuf allocation frequently occurs in
performance sensitive environments, and the implementation should be
careful to avoid sleeping or long-lived operations. This entry point is
permitted to fail resulting in the failure to allocate the mbuf header.

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

6.7.2.7.?\ ``mpo_init_mount_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+-------------------+-----+
| ``void               mpo_init_mount_label(``   | mntlabel,         | ?   |
+------------------------------------------------+-------------------+-----+
| ?                                              | fslabel\ ``)``;   | ?   |
+------------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *mntlabel``;
``struct label               *fslabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+-------------------------------------------------------+-----------+
| Parameter        | Description                                           | Locking   |
+==================+=======================================================+===========+
| *``mntlabel``*   | Policy label to be initialized for the mount itself   | ?         |
+------------------+-------------------------------------------------------+-----------+
| *``fslabel``*    | Policy label to be initialized for the file system    | ?         |
+------------------+-------------------------------------------------------+-----------+

.. raw:: html

   </div>

Initialize the labels on a newly instantiated mount point. Sleeping is
permitted.

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

6.7.2.8.?\ ``mpo_init_mount_fs_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-----------------+-----+
| ``void               mpo_init_mount_fs_label(``   | label\ ``)``;   | ?   |
+---------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+---------------------------+-----------+
| Parameter     | Description               | Locking   |
+===============+===========================+===========+
| *``label``*   | Label to be initialized   | ?         |
+---------------+---------------------------+-----------+

.. raw:: html

   </div>

Initialize the label on a newly mounted file system. Sleeping is
permitted

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

6.7.2.9.?\ ``mpo_init_pipe_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+-----------------+-----+
| ``void               mpo_init_pipe_label(``   | label\ ``)``;   | ?   |
+-----------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct               label*label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-------------------------+-----------+
| Parameter     | Description             | Locking   |
+===============+=========================+===========+
| *``label``*   | Label to be filled in   | ?         |
+---------------+-------------------------+-----------+

.. raw:: html

   </div>

Initialize a label for a newly instantiated pipe. Sleeping is permitted.

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

6.7.2.10.?\ ``mpo_init_socket_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+----------------+-----+
| ``void               mpo_init_socket_label(``   | label,         | ?   |
+-------------------------------------------------+----------------+-----+
| ?                                               | flag\ ``)``;   | ?   |
+-------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;
``int flag``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                       | Locking   |
+===============+===================================================================================+===========+
| *``label``*   | New label to initialize                                                           | ?         |
+---------------+-----------------------------------------------------------------------------------+-----------+
| *``flag``*    | `malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__ flags   | ?         |
+---------------+-----------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Initialize a label for a newly instantiated socket. The *``flag``* field
may be one of M\_WAITOK and M\_NOWAIT, and should be employed to avoid
performing a sleeping
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
during this initialization call.

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

6.7.2.11.?\ ``mpo_init_socket_peer_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------------+----------------+-----+
| ``void               mpo_init_socket_peer_label(``   | label,         | ?   |
+------------------------------------------------------+----------------+-----+
| ?                                                    | flag\ ``)``;   | ?   |
+------------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;
``int flag``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                       | Locking   |
+===============+===================================================================================+===========+
| *``label``*   | New label to initialize                                                           | ?         |
+---------------+-----------------------------------------------------------------------------------+-----------+
| *``flag``*    | `malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__ flags   | ?         |
+---------------+-----------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Initialize the peer label for a newly instantiated socket. The
*``flag``* field may be one of M\_WAITOK and M\_NOWAIT, and should be
employed to avoid performing a sleeping
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
during this initialization call.

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

6.7.2.12.?\ ``mpo_init_proc_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+-----------------+-----+
| ``void               mpo_init_proc_label(``   | label\ ``)``;   | ?   |
+-----------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+---------------------------+-----------+
| Parameter     | Description               | Locking   |
+===============+===========================+===========+
| *``label``*   | New label to initialize   | ?         |
+---------------+---------------------------+-----------+

.. raw:: html

   </div>

Initialize the label for a newly instantiated process. Sleeping is
permitted.

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

6.7.2.13.?\ ``mpo_init_vnode_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+-----------------+-----+
| ``void               mpo_init_vnode_label(``   | label\ ``)``;   | ?   |
+------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+---------------------------+-----------+
| Parameter     | Description               | Locking   |
+===============+===========================+===========+
| *``label``*   | New label to initialize   | ?         |
+---------------+---------------------------+-----------+

.. raw:: html

   </div>

Initialize the label on a newly instantiated vnode. Sleeping is
permitted.

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

6.7.2.14.?\ ``mpo_destroy_bpfdesc_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_bpfdesc_label(``   | label\ ``)``;   | ?   |
+-----------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------+-----------+
| Parameter     | Description     | Locking   |
+===============+=================+===========+
| *``label``*   | bpfdesc label   | ?         |
+---------------+-----------------+-----------+

.. raw:: html

   </div>

Destroy the label on a BPF descriptor. In this entry point a policy
should free any internal storage associated with *``label``* so that it
may be destroyed.

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

6.7.2.15.?\ ``mpo_destroy_cred_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_cred_label(``   | label\ ``)``;   | ?   |
+--------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-------------------------+-----------+
| Parameter     | Description             | Locking   |
+===============+=========================+===========+
| *``label``*   | Label being destroyed   | ?         |
+---------------+-------------------------+-----------+

.. raw:: html

   </div>

Destroy the label on a credential. In this entry point, a policy module
should free any internal storage associated with *``label``* so that it
may be destroyed.

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

6.7.2.16.?\ ``mpo_destroy_devfsdirent_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_devfsdirent_label(``   | label\ ``)``;   | ?   |
+---------------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-------------------------+-----------+
| Parameter     | Description             | Locking   |
+===============+=========================+===========+
| *``label``*   | Label being destroyed   | ?         |
+---------------+-------------------------+-----------+

.. raw:: html

   </div>

Destroy the label on a devfs entry. In this entry point, a policy module
should free any internal storage associated with *``label``* so that it
may be destroyed.

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

6.7.2.17.?\ ``mpo_destroy_ifnet_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_ifnet_label(``   | label\ ``)``;   | ?   |
+---------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-------------------------+-----------+
| Parameter     | Description             | Locking   |
+===============+=========================+===========+
| *``label``*   | Label being destroyed   | ?         |
+---------------+-------------------------+-----------+

.. raw:: html

   </div>

Destroy the label on a removed interface. In this entry point, a policy
module should free any internal storage associated with *``label``* so
that it may be destroyed.

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

6.7.2.18.?\ ``mpo_destroy_ipq_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_ipq_label(``   | label\ ``)``;   | ?   |
+-------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-------------------------+-----------+
| Parameter     | Description             | Locking   |
+===============+=========================+===========+
| *``label``*   | Label being destroyed   | ?         |
+---------------+-------------------------+-----------+

.. raw:: html

   </div>

Destroy the label on an IP fragment queue. In this entry point, a policy
module should free any internal storage associated with *``label``* so
that it may be destroyed.

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

6.7.2.19.?\ ``mpo_destroy_mbuf_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_mbuf_label(``   | label\ ``)``;   | ?   |
+--------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-------------------------+-----------+
| Parameter     | Description             | Locking   |
+===============+=========================+===========+
| *``label``*   | Label being destroyed   | ?         |
+---------------+-------------------------+-----------+

.. raw:: html

   </div>

Destroy the label on an mbuf header. In this entry point, a policy
module should free any internal storage associated with *``label``* so
that it may be destroyed.

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

6.7.2.20.?\ ``mpo_destroy_mount_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_mount_label(``   | label\ ``)``;   | ?   |
+---------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-------------------------------------+-----------+
| Parameter     | Description                         | Locking   |
+===============+=====================================+===========+
| *``label``*   | Mount point label being destroyed   | ?         |
+---------------+-------------------------------------+-----------+

.. raw:: html

   </div>

Destroy the labels on a mount point. In this entry point, a policy
module should free the internal storage associated with *``mntlabel``*
so that they may be destroyed.

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

6.7.2.21.?\ ``mpo_destroy_mount_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-------------------+-----+
| ``void               mpo_destroy_mount_label(``   | mntlabel,         | ?   |
+---------------------------------------------------+-------------------+-----+
| ?                                                 | fslabel\ ``)``;   | ?   |
+---------------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *mntlabel``;
``struct label               *fslabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+--------------------------------------+-----------+
| Parameter        | Description                          | Locking   |
+==================+======================================+===========+
| *``mntlabel``*   | Mount point label being destroyed    | ?         |
+------------------+--------------------------------------+-----------+
| *``fslabel``*    | File system label being destroyed>   | ?         |
+------------------+--------------------------------------+-----------+

.. raw:: html

   </div>

Destroy the labels on a mount point. In this entry point, a policy
module should free the internal storage associated with *``mntlabel``*
and *``fslabel``* so that they may be destroyed.

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

6.7.2.22.?\ ``mpo_destroy_socket_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_socket_label(``   | label\ ``)``;   | ?   |
+----------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+--------------------------------+-----------+
| Parameter     | Description                    | Locking   |
+===============+================================+===========+
| *``label``*   | Socket label being destroyed   | ?         |
+---------------+--------------------------------+-----------+

.. raw:: html

   </div>

Destroy the label on a socket. In this entry point, a policy module
should free any internal storage associated with *``label``* so that it
may be destroyed.

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

6.7.2.23.?\ ``mpo_destroy_socket_peer_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------------+---------------------+-----+
| ``void               mpo_destroy_socket_peer_label(``   | peerlabel\ ``)``;   | ?   |
+---------------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *peerlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+-------------------------------------+-----------+
| Parameter         | Description                         | Locking   |
+===================+=====================================+===========+
| *``peerlabel``*   | Socket peer label being destroyed   | ?         |
+-------------------+-------------------------------------+-----------+

.. raw:: html

   </div>

Destroy the peer label on a socket. In this entry point, a policy module
should free any internal storage associated with *``label``* so that it
may be destroyed.

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

6.7.2.24.?\ ``mpo_destroy_pipe_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_pipe_label(``   | label\ ``)``;   | ?   |
+--------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+---------------+-----------+
| Parameter     | Description   | Locking   |
+===============+===============+===========+
| *``label``*   | Pipe label    | ?         |
+---------------+---------------+-----------+

.. raw:: html

   </div>

Destroy the label on a pipe. In this entry point, a policy module should
free any internal storage associated with *``label``* so that it may be
destroyed.

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

6.7.2.25.?\ ``mpo_destroy_proc_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_proc_label(``   | label\ ``)``;   | ?   |
+--------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------+-----------+
| Parameter     | Description     | Locking   |
+===============+=================+===========+
| *``label``*   | Process label   | ?         |
+---------------+-----------------+-----------+

.. raw:: html

   </div>

Destroy the label on a process. In this entry point, a policy module
should free any internal storage associated with *``label``* so that it
may be destroyed.

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

6.7.2.26.?\ ``mpo_destroy_vnode_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-----------------+-----+
| ``void               mpo_destroy_vnode_label(``   | label\ ``)``;   | ?   |
+---------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------+-----------+
| Parameter     | Description     | Locking   |
+===============+=================+===========+
| *``label``*   | Process label   | ?         |
+---------------+-----------------+-----------+

.. raw:: html

   </div>

Destroy the label on a vnode. In this entry point, a policy module
should free any internal storage associated with *``label``* so that it
may be destroyed.

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

6.7.2.27.?\ ``mpo_copy_mbuf_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+----------------+-----+
| ``void               mpo_copy_mbuf_label(``   | src,           | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | dest\ ``)``;   | ?   |
+-----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *src``;
``struct label               *dest``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+---------------------+-----------+
| Parameter    | Description         | Locking   |
+==============+=====================+===========+
| *``src``*    | Source label        | ?         |
+--------------+---------------------+-----------+
| *``dest``*   | Destination label   | ?         |
+--------------+---------------------+-----------+

.. raw:: html

   </div>

Copy the label information in *``src``* into *``dest``*.

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

6.7.2.28.?\ ``mpo_copy_pipe_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+----------------+-----+
| ``void               mpo_copy_pipe_label(``   | src,           | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | dest\ ``)``;   | ?   |
+-----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *src``;
``struct label               *dest``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+---------------------+-----------+
| Parameter    | Description         | Locking   |
+==============+=====================+===========+
| *``src``*    | Source label        | ?         |
+--------------+---------------------+-----------+
| *``dest``*   | Destination label   | ?         |
+--------------+---------------------+-----------+

.. raw:: html

   </div>

Copy the label information in *``src``* into *``dest``*.

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

6.7.2.29.?\ ``mpo_copy_vnode_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+----------------+-----+
| ``void               mpo_copy_vnode_label(``   | src,           | ?   |
+------------------------------------------------+----------------+-----+
| ?                                              | dest\ ``)``;   | ?   |
+------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label               *src``;
``struct label               *dest``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+---------------------+-----------+
| Parameter    | Description         | Locking   |
+==============+=====================+===========+
| *``src``*    | Source label        | ?         |
+--------------+---------------------+-----------+
| *``dest``*   | Destination label   | ?         |
+--------------+---------------------+-----------+

.. raw:: html

   </div>

Copy the label information in *``src``* into *``dest``*.

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

6.7.2.30.?\ ``mpo_externalize_cred_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------+---------------------+-----+
| ``int               mpo_externalize_cred_label(``   | label,              | ?   |
+-----------------------------------------------------+---------------------+-----+
| ?                                                   | element\_name,      | ?   |
+-----------------------------------------------------+---------------------+-----+
| ?                                                   | sb,                 | ?   |
+-----------------------------------------------------+---------------------+-----+
| ?                                                   | \*claimed\ ``)``;   | ?   |
+-----------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``struct sbuf *sb``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+-------------------------------------------------------------------+-----------+
| Parameter            | Description                                                       | Locking   |
+======================+===================================================================+===========+
| *``label``*          | Label to be externalized                                          | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be externalized             | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``sb``*             | String buffer to be filled with a text representation of label    | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when *``element_data``* can be filled in.   | ?         |
+----------------------+-------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an externalized label based on the label structure passed. An
externalized label consists of a text representation of the label
contents that can be used with userland applications and read by the
user. Currently, all policies' ``externalize`` entry points will be
called, so the implementation should check the contents of
*``element_name``* before attempting to fill in *``sb``*. If
*``element_name``* does not match the name of your policy, simply return
0. Only return nonzero if an error occurs while externalizing the label
data. Once the policy fills in *``element_data``*, ``*claimed`` should
be incremented.

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

6.7.2.31.?\ ``mpo_externalize_ifnet_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------------+---------------------+-----+
| ``int               mpo_externalize_ifnet_label(``   | label,              | ?   |
+------------------------------------------------------+---------------------+-----+
| ?                                                    | element\_name,      | ?   |
+------------------------------------------------------+---------------------+-----+
| ?                                                    | sb,                 | ?   |
+------------------------------------------------------+---------------------+-----+
| ?                                                    | \*claimed\ ``)``;   | ?   |
+------------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``struct sbuf *sb``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+-------------------------------------------------------------------+-----------+
| Parameter            | Description                                                       | Locking   |
+======================+===================================================================+===========+
| *``label``*          | Label to be externalized                                          | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be externalized             | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``sb``*             | String buffer to be filled with a text representation of label    | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when *``element_data``* can be filled in.   | ?         |
+----------------------+-------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an externalized label based on the label structure passed. An
externalized label consists of a text representation of the label
contents that can be used with userland applications and read by the
user. Currently, all policies' ``externalize`` entry points will be
called, so the implementation should check the contents of
*``element_name``* before attempting to fill in *``sb``*. If
*``element_name``* does not match the name of your policy, simply return
0. Only return nonzero if an error occurs while externalizing the label
data. Once the policy fills in *``element_data``*, ``*claimed`` should
be incremented.

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

6.7.2.32.?\ ``mpo_externalize_pipe_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------+---------------------+-----+
| ``int               mpo_externalize_pipe_label(``   | label,              | ?   |
+-----------------------------------------------------+---------------------+-----+
| ?                                                   | element\_name,      | ?   |
+-----------------------------------------------------+---------------------+-----+
| ?                                                   | sb,                 | ?   |
+-----------------------------------------------------+---------------------+-----+
| ?                                                   | \*claimed\ ``)``;   | ?   |
+-----------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``struct sbuf *sb``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+-------------------------------------------------------------------+-----------+
| Parameter            | Description                                                       | Locking   |
+======================+===================================================================+===========+
| *``label``*          | Label to be externalized                                          | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be externalized             | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``sb``*             | String buffer to be filled with a text representation of label    | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when *``element_data``* can be filled in.   | ?         |
+----------------------+-------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an externalized label based on the label structure passed. An
externalized label consists of a text representation of the label
contents that can be used with userland applications and read by the
user. Currently, all policies' ``externalize`` entry points will be
called, so the implementation should check the contents of
*``element_name``* before attempting to fill in *``sb``*. If
*``element_name``* does not match the name of your policy, simply return
0. Only return nonzero if an error occurs while externalizing the label
data. Once the policy fills in *``element_data``*, ``*claimed`` should
be incremented.

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

6.7.2.33.?\ ``mpo_externalize_socket_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------+---------------------+-----+
| ``int               mpo_externalize_socket_label(``   | label,              | ?   |
+-------------------------------------------------------+---------------------+-----+
| ?                                                     | element\_name,      | ?   |
+-------------------------------------------------------+---------------------+-----+
| ?                                                     | sb,                 | ?   |
+-------------------------------------------------------+---------------------+-----+
| ?                                                     | \*claimed\ ``)``;   | ?   |
+-------------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``struct sbuf *sb``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+-------------------------------------------------------------------+-----------+
| Parameter            | Description                                                       | Locking   |
+======================+===================================================================+===========+
| *``label``*          | Label to be externalized                                          | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be externalized             | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``sb``*             | String buffer to be filled with a text representation of label    | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when *``element_data``* can be filled in.   | ?         |
+----------------------+-------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an externalized label based on the label structure passed. An
externalized label consists of a text representation of the label
contents that can be used with userland applications and read by the
user. Currently, all policies' ``externalize`` entry points will be
called, so the implementation should check the contents of
*``element_name``* before attempting to fill in *``sb``*. If
*``element_name``* does not match the name of your policy, simply return
0. Only return nonzero if an error occurs while externalizing the label
data. Once the policy fills in *``element_data``*, ``*claimed`` should
be incremented.

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

6.7.2.34.?\ ``mpo_externalize_socket_peer_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------------------+---------------------+-----+
| ``int               mpo_externalize_socket_peer_label(``   | label,              | ?   |
+------------------------------------------------------------+---------------------+-----+
| ?                                                          | element\_name,      | ?   |
+------------------------------------------------------------+---------------------+-----+
| ?                                                          | sb,                 | ?   |
+------------------------------------------------------------+---------------------+-----+
| ?                                                          | \*claimed\ ``)``;   | ?   |
+------------------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``struct sbuf *sb``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+-------------------------------------------------------------------+-----------+
| Parameter            | Description                                                       | Locking   |
+======================+===================================================================+===========+
| *``label``*          | Label to be externalized                                          | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be externalized             | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``sb``*             | String buffer to be filled with a text representation of label    | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when *``element_data``* can be filled in.   | ?         |
+----------------------+-------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an externalized label based on the label structure passed. An
externalized label consists of a text representation of the label
contents that can be used with userland applications and read by the
user. Currently, all policies' ``externalize`` entry points will be
called, so the implementation should check the contents of
*``element_name``* before attempting to fill in *``sb``*. If
*``element_name``* does not match the name of your policy, simply return
0. Only return nonzero if an error occurs while externalizing the label
data. Once the policy fills in *``element_data``*, ``*claimed`` should
be incremented.

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

6.7.2.35.?\ ``mpo_externalize_vnode_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------------+---------------------+-----+
| ``int               mpo_externalize_vnode_label(``   | label,              | ?   |
+------------------------------------------------------+---------------------+-----+
| ?                                                    | element\_name,      | ?   |
+------------------------------------------------------+---------------------+-----+
| ?                                                    | sb,                 | ?   |
+------------------------------------------------------+---------------------+-----+
| ?                                                    | \*claimed\ ``)``;   | ?   |
+------------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``struct sbuf *sb``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+-------------------------------------------------------------------+-----------+
| Parameter            | Description                                                       | Locking   |
+======================+===================================================================+===========+
| *``label``*          | Label to be externalized                                          | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be externalized             | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``sb``*             | String buffer to be filled with a text representation of label    | ?         |
+----------------------+-------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when *``element_data``* can be filled in.   | ?         |
+----------------------+-------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an externalized label based on the label structure passed. An
externalized label consists of a text representation of the label
contents that can be used with userland applications and read by the
user. Currently, all policies' ``externalize`` entry points will be
called, so the implementation should check the contents of
*``element_name``* before attempting to fill in *``sb``*. If
*``element_name``* does not match the name of your policy, simply return
0. Only return nonzero if an error occurs while externalizing the label
data. Once the policy fills in *``element_data``*, ``*claimed`` should
be incremented.

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

6.7.2.36.?\ ``mpo_internalize_cred_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------+-------------------+-----+
| ``int               mpo_internalize_cred_label(``   | label,            | ?   |
+-----------------------------------------------------+-------------------+-----+
| ?                                                   | element\_name,    | ?   |
+-----------------------------------------------------+-------------------+-----+
| ?                                                   | element\_data,    | ?   |
+-----------------------------------------------------+-------------------+-----+
| ?                                                   | claimed\ ``)``;   | ?   |
+-----------------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``char *element_data``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+---------------------------------------------------------------------+-----------+
| Parameter            | Description                                                         | Locking   |
+======================+=====================================================================+===========+
| *``label``*          | Label to be filled in                                               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be internalized               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_data``*   | Text data to be internalized                                        | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when data can be successfully internalized.   | ?         |
+----------------------+---------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an internal label structure based on externalized label data in
text format. Currently, all policies' ``internalize`` entry points are
called when internalization is requested, so the implementation should
compare the contents of *``element_name``* to its own name in order to
be sure it should be internalizing the data in *``element_data``*. Just
as in the ``externalize`` entry points, the entry point should return 0
if *``element_name``* does not match its own name, or when data can
successfully be internalized, in which case ``*claimed`` should be
incremented.

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

6.7.2.37.?\ ``mpo_internalize_ifnet_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------------+-------------------+-----+
| ``int               mpo_internalize_ifnet_label(``   | label,            | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | element\_name,    | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | element\_data,    | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | claimed\ ``)``;   | ?   |
+------------------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``char *element_data``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+---------------------------------------------------------------------+-----------+
| Parameter            | Description                                                         | Locking   |
+======================+=====================================================================+===========+
| *``label``*          | Label to be filled in                                               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be internalized               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_data``*   | Text data to be internalized                                        | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when data can be successfully internalized.   | ?         |
+----------------------+---------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an internal label structure based on externalized label data in
text format. Currently, all policies' ``internalize`` entry points are
called when internalization is requested, so the implementation should
compare the contents of *``element_name``* to its own name in order to
be sure it should be internalizing the data in *``element_data``*. Just
as in the ``externalize`` entry points, the entry point should return 0
if *``element_name``* does not match its own name, or when data can
successfully be internalized, in which case ``*claimed`` should be
incremented.

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

6.7.2.38.?\ ``mpo_internalize_pipe_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------+-------------------+-----+
| ``int               mpo_internalize_pipe_label(``   | label,            | ?   |
+-----------------------------------------------------+-------------------+-----+
| ?                                                   | element\_name,    | ?   |
+-----------------------------------------------------+-------------------+-----+
| ?                                                   | element\_data,    | ?   |
+-----------------------------------------------------+-------------------+-----+
| ?                                                   | claimed\ ``)``;   | ?   |
+-----------------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``char *element_data``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+---------------------------------------------------------------------+-----------+
| Parameter            | Description                                                         | Locking   |
+======================+=====================================================================+===========+
| *``label``*          | Label to be filled in                                               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be internalized               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_data``*   | Text data to be internalized                                        | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when data can be successfully internalized.   | ?         |
+----------------------+---------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an internal label structure based on externalized label data in
text format. Currently, all policies' ``internalize`` entry points are
called when internalization is requested, so the implementation should
compare the contents of *``element_name``* to its own name in order to
be sure it should be internalizing the data in *``element_data``*. Just
as in the ``externalize`` entry points, the entry point should return 0
if *``element_name``* does not match its own name, or when data can
successfully be internalized, in which case ``*claimed`` should be
incremented.

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

6.7.2.39.?\ ``mpo_internalize_socket_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------+-------------------+-----+
| ``int               mpo_internalize_socket_label(``   | label,            | ?   |
+-------------------------------------------------------+-------------------+-----+
| ?                                                     | element\_name,    | ?   |
+-------------------------------------------------------+-------------------+-----+
| ?                                                     | element\_data,    | ?   |
+-------------------------------------------------------+-------------------+-----+
| ?                                                     | claimed\ ``)``;   | ?   |
+-------------------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``char *element_data``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+---------------------------------------------------------------------+-----------+
| Parameter            | Description                                                         | Locking   |
+======================+=====================================================================+===========+
| *``label``*          | Label to be filled in                                               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be internalized               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_data``*   | Text data to be internalized                                        | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when data can be successfully internalized.   | ?         |
+----------------------+---------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an internal label structure based on externalized label data in
text format. Currently, all policies' ``internalize`` entry points are
called when internalization is requested, so the implementation should
compare the contents of *``element_name``* to its own name in order to
be sure it should be internalizing the data in *``element_data``*. Just
as in the ``externalize`` entry points, the entry point should return 0
if *``element_name``* does not match its own name, or when data can
successfully be internalized, in which case ``*claimed`` should be
incremented.

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

6.7.2.40.?\ ``mpo_internalize_vnode_label``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------------+-------------------+-----+
| ``int               mpo_internalize_vnode_label(``   | label,            | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | element\_name,    | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | element\_data,    | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | claimed\ ``)``;   | ?   |
+------------------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct label *label``;
``char *element_name``;
``char *element_data``;
``int *claimed``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+---------------------------------------------------------------------+-----------+
| Parameter            | Description                                                         | Locking   |
+======================+=====================================================================+===========+
| *``label``*          | Label to be filled in                                               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_name``*   | Name of the policy whose label should be internalized               | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``element_data``*   | Text data to be internalized                                        | ?         |
+----------------------+---------------------------------------------------------------------+-----------+
| *``claimed``*        | Should be incremented when data can be successfully internalized.   | ?         |
+----------------------+---------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Produce an internal label structure based on externalized label data in
text format. Currently, all policies' ``internalize`` entry points are
called when internalization is requested, so the implementation should
compare the contents of *``element_name``* to its own name in order to
be sure it should be internalizing the data in *``element_data``*. Just
as in the ``externalize`` entry points, the entry point should return 0
if *``element_name``* does not match its own name, or when data can
successfully be internalized, in which case ``*claimed`` should be
incremented.

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

6.7.3.?Label Events
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This class of entry points is used by the MAC framework to permit
policies to maintain label information on kernel objects. For each
labeled kernel object of interest to a MAC policy, entry points may be
registered for relevant life cycle events. All objects implement
initialization, creation, and destruction hooks. Some objects will also
implement relabeling, allowing user processes to change the labels on
objects. Some objects will also implement object-specific events, such
as label events associated with IP reassembly. A typical labeled object
will have the following life cycle of entry points:

.. code:: programlisting

    Label initialization          o
    (object-specific wait)         \
    Label creation                  o
                                     \
    Relabel events,                   o--<--.
    Various object-specific,          |     |
    Access control events             ~-->--o
                                             \
    Label destruction                         o

Label initialization permits policies to allocate memory and set initial
values for labels without context for the use of the object. The label
slot allocated to a policy will be zeroed by default, so some policies
may not need to perform initialization.

Label creation occurs when the kernel structure is associated with an
actual kernel object. For example, Mbufs may be allocated and remain
unused in a pool until they are required. mbuf allocation causes label
initialization on the mbuf to take place, but mbuf creation occurs when
the mbuf is associated with a datagram. Typically, context will be
provided for a creation event, including the circumstances of the
creation, and labels of other relevant objects in the creation process.
For example, when an mbuf is created from a socket, the socket and its
label will be presented to registered policies in addition to the new
mbuf and its label. Memory allocation in creation events is discouraged,
as it may occur in performance sensitive ports of the kernel; in
addition, creation calls are not permitted to fail so a failure to
allocate memory cannot be reported.

Object specific events do not generally fall into the other broad
classes of label events, but will generally provide an opportunity to
modify or update the label on an object based on additional context. For
example, the label on an IP fragment reassembly queue may be updated
during the MAC\_UPDATE\_IPQ entry point as a result of the acceptance of
an additional mbuf to that queue.

Access control events are discussed in detail in the following section.

Label destruction permits policies to release storage or state
associated with a label during its association with an object so that
the kernel data structures supporting the object may be reused or
released.

In addition to labels associated with specific kernel objects, an
additional class of labels exists: temporary labels. These labels are
used to store update information submitted by user processes. These
labels are initialized and destroyed as with other label types, but the
creation event is MAC\_INTERNALIZE, which accepts a user label to be
converted to an in-kernel representation.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.?File System Object Labeling Event Operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.1.?\ ``mpo_associate_vnode_devfs``
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------+------------------+-----+
| ``void                 mpo_associate_vnode_devfs(``   | mp,              | ?   |
+-------------------------------------------------------+------------------+-----+
| ?                                                     | fslabel,         | ?   |
+-------------------------------------------------------+------------------+-----+
| ?                                                     | de,              | ?   |
+-------------------------------------------------------+------------------+-----+
| ?                                                     | delabel,         | ?   |
+-------------------------------------------------------+------------------+-----+
| ?                                                     | vp,              | ?   |
+-------------------------------------------------------+------------------+-----+
| ?                                                     | vlabel\ ``)``;   | ?   |
+-------------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mount                 *mp``;
``struct label                 *fslabel``;
``struct devfs_dirent                 *de``;
``struct label                 *delabel``;
``struct vnode                 *vp``;
``struct label                 *vlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------+-------------------------------------------------+-----------+
| Parameter       | Description                                     | Locking   |
+=================+=================================================+===========+
| *``mp``*        | Devfs mount point                               | ?         |
+-----------------+-------------------------------------------------+-----------+
| *``fslabel``*   | Devfs file system label (``mp->mnt_fslabel``)   | ?         |
+-----------------+-------------------------------------------------+-----------+
| *``de``*        | Devfs directory entry                           | ?         |
+-----------------+-------------------------------------------------+-----------+
| *``delabel``*   | Policy label associated with *``de``*           | ?         |
+-----------------+-------------------------------------------------+-----------+
| *``vp``*        | vnode associated with *``de``*                  | ?         |
+-----------------+-------------------------------------------------+-----------+
| *``vlabel``*    | Policy label associated with *``vp``*           | ?         |
+-----------------+-------------------------------------------------+-----------+

.. raw:: html

   </div>

Fill in the label (*``vlabel``*) for a newly created devfs vnode based
on the devfs directory entry passed in *``de``* and its label.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.2.?\ ``mpo_associate_vnode_extattr``
''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------------+------------------+-----+
| ``int                 mpo_associate_vnode_extattr(``   | mp,              | ?   |
+--------------------------------------------------------+------------------+-----+
| ?                                                      | fslabel,         | ?   |
+--------------------------------------------------------+------------------+-----+
| ?                                                      | vp,              | ?   |
+--------------------------------------------------------+------------------+-----+
| ?                                                      | vlabel\ ``)``;   | ?   |
+--------------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mount                 *mp``;
``struct label                 *fslabel``;
``struct vnode                 *vp``;
``struct label                 *vlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------+-----------------------------------------+-----------+
| Parameter       | Description                             | Locking   |
+=================+=========================================+===========+
| *``mp``*        | File system mount point                 | ?         |
+-----------------+-----------------------------------------+-----------+
| *``fslabel``*   | File system label                       | ?         |
+-----------------+-----------------------------------------+-----------+
| *``vp``*        | Vnode to label                          | ?         |
+-----------------+-----------------------------------------+-----------+
| *``vlabel``*    | Policy label associated with *``vp``*   | ?         |
+-----------------+-----------------------------------------+-----------+

.. raw:: html

   </div>

Attempt to retrieve the label for *``vp``* from the file system extended
attributes. Upon success, the value ``0`` is returned. Should extended
attribute retrieval not be supported, an accepted fallback is to copy
*``fslabel``* into *``vlabel``*. In the event of an error, an
appropriate value for ``errno`` should be returned.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.3.?\ ``mpo_associate_vnode_singlelabel``
''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------------+------------------+-----+
| ``void                 mpo_associate_vnode_singlelabel(``   | mp,              | ?   |
+-------------------------------------------------------------+------------------+-----+
| ?                                                           | fslabel,         | ?   |
+-------------------------------------------------------------+------------------+-----+
| ?                                                           | vp,              | ?   |
+-------------------------------------------------------------+------------------+-----+
| ?                                                           | vlabel\ ``)``;   | ?   |
+-------------------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mount                 *mp``;
``struct label                 *fslabel``;
``struct vnode                 *vp``;
``struct label                 *vlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------+-----------------------------------------+-----------+
| Parameter       | Description                             | Locking   |
+=================+=========================================+===========+
| *``mp``*        | File system mount point                 | ?         |
+-----------------+-----------------------------------------+-----------+
| *``fslabel``*   | File system label                       | ?         |
+-----------------+-----------------------------------------+-----------+
| *``vp``*        | Vnode to label                          | ?         |
+-----------------+-----------------------------------------+-----------+
| *``vlabel``*    | Policy label associated with *``vp``*   | ?         |
+-----------------+-----------------------------------------+-----------+

.. raw:: html

   </div>

On non-multilabel file systems, this entry point is called to set the
policy label for *``vp``* based on the file system label, *``fslabel``*.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.4.?\ ``mpo_create_devfs_device``
''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------+------------------+-----+
| ``void                 mpo_create_devfs_device(``   | dev,             | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | devfs\_dirent,   | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | label\ ``)``;    | ?   |
+-----------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``dev_t dev``;
``struct devfs_dirent                 *devfs_dirent``;
``struct label                 *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+-------------------------------------------------+-----------+
| Parameter            | Description                                     | Locking   |
+======================+=================================================+===========+
| *``dev``*            | Device corresponding with *``devfs_dirent``*    | ?         |
+----------------------+-------------------------------------------------+-----------+
| *``devfs_dirent``*   | Devfs directory entry to be labeled.            | ?         |
+----------------------+-------------------------------------------------+-----------+
| *``label``*          | Label for *``devfs_dirent``* to be filled in.   | ?         |
+----------------------+-------------------------------------------------+-----------+

.. raw:: html

   </div>

Fill out the label on a devfs\_dirent being created for the passed
device. This call will be made when the device file system is mounted,
regenerated, or a new device is made available.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.5.?\ ``mpo_create_devfs_directory``
'''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------------+------------------+-----+
| ``void                 mpo_create_devfs_directory(``   | dirname,         | ?   |
+--------------------------------------------------------+------------------+-----+
| ?                                                      | dirnamelen,      | ?   |
+--------------------------------------------------------+------------------+-----+
| ?                                                      | devfs\_dirent,   | ?   |
+--------------------------------------------------------+------------------+-----+
| ?                                                      | label\ ``)``;    | ?   |
+--------------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``char *dirname``;
``int dirnamelen``;
``struct devfs_dirent                 *devfs_dirent``;
``struct label                 *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+------------------------------------------------------+-----------+
| Parameter            | Description                                          | Locking   |
+======================+======================================================+===========+
| *``dirname``*        | Name of directory being created                      | ?         |
+----------------------+------------------------------------------------------+-----------+
| *``namelen``*        | Length of string *``dirname``*                       | ?         |
+----------------------+------------------------------------------------------+-----------+
| *``devfs_dirent``*   | Devfs directory entry for directory being created.   | ?         |
+----------------------+------------------------------------------------------+-----------+

.. raw:: html

   </div>

Fill out the label on a devfs\_dirent being created for the passed
directory. This call will be made when the device file system is
mounted, regenerated, or a new device requiring a specific directory
hierarchy is made available.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.6.?\ ``mpo_create_devfs_symlink``
'''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------------+-------------------+-----+
| ``void                 mpo_create_devfs_symlink(``   | cred,             | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | mp,               | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | dd,               | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | ddlabel,          | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | de,               | ?   |
+------------------------------------------------------+-------------------+-----+
| ?                                                    | delabel\ ``)``;   | ?   |
+------------------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct mount                 *mp``;
``struct devfs_dirent                 *dd``;
``struct label                 *ddlabel``;
``struct devfs_dirent                 *de``;
``struct label                 *delabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------+----------------------------------+-----------+
| Parameter       | Description                      | Locking   |
+=================+==================================+===========+
| *``cred``*      | Subject credential               | ?         |
+-----------------+----------------------------------+-----------+
| *``mp``*        | Devfs mount point                | ?         |
+-----------------+----------------------------------+-----------+
| *``dd``*        | Link destination                 | ?         |
+-----------------+----------------------------------+-----------+
| *``ddlabel``*   | Label associated with *``dd``*   | ?         |
+-----------------+----------------------------------+-----------+
| *``de``*        | Symlink entry                    | ?         |
+-----------------+----------------------------------+-----------+
| *``delabel``*   | Label associated with *``de``*   | ?         |
+-----------------+----------------------------------+-----------+

.. raw:: html

   </div>

Fill in the label (*``delabel``*) for a newly created
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
symbolic link entry.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.7.?\ ``mpo_create_vnode_extattr``
'''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------+---------------+-----+
| ``int                 mpo_create_vnode_extattr(``   | cred,         | ?   |
+-----------------------------------------------------+---------------+-----+
| ?                                                   | mp,           | ?   |
+-----------------------------------------------------+---------------+-----+
| ?                                                   | fslabel,      | ?   |
+-----------------------------------------------------+---------------+-----+
| ?                                                   | dvp,          | ?   |
+-----------------------------------------------------+---------------+-----+
| ?                                                   | dlabel,       | ?   |
+-----------------------------------------------------+---------------+-----+
| ?                                                   | vp,           | ?   |
+-----------------------------------------------------+---------------+-----+
| ?                                                   | vlabel,       | ?   |
+-----------------------------------------------------+---------------+-----+
| ?                                                   | cnp\ ``)``;   | ?   |
+-----------------------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct mount                 *mp``;
``struct label                 *fslabel``;
``struct vnode                 *dvp``;
``struct label                 *dlabel``;
``struct vnode                 *vp``;
``struct label                 *vlabel``;
``struct componentname                 *cnp``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+-----------------------------------------+-----------+
| Parameter      | Description                             | Locking   |
+================+=========================================+===========+
| *``cred``*     | Subject credential                      | ?         |
+----------------+-----------------------------------------+-----------+
| *``mount``*    | File system mount point                 | ?         |
+----------------+-----------------------------------------+-----------+
| *``label``*    | File system label                       | ?         |
+----------------+-----------------------------------------+-----------+
| *``dvp``*      | Parent directory vnode                  | ?         |
+----------------+-----------------------------------------+-----------+
| *``dlabel``*   | Label associated with *``dvp``*         | ?         |
+----------------+-----------------------------------------+-----------+
| *``vp``*       | Newly created vnode                     | ?         |
+----------------+-----------------------------------------+-----------+
| *``vlabel``*   | Policy label associated with *``vp``*   | ?         |
+----------------+-----------------------------------------+-----------+
| *``cnp``*      | Component name for *``vp``*             | ?         |
+----------------+-----------------------------------------+-----------+

.. raw:: html

   </div>

Write out the label for *``vp``* to the appropriate extended attribute.
If the write succeeds, fill in *``vlabel``* with the label, and return
0. Otherwise, return an appropriate error.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.8.?\ ``mpo_create_mount``
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+-------------------+-----+
| ``void                 mpo_create_mount(``   | cred,             | ?   |
+----------------------------------------------+-------------------+-----+
| ?                                            | mp,               | ?   |
+----------------------------------------------+-------------------+-----+
| ?                                            | mnt,              | ?   |
+----------------------------------------------+-------------------+-----+
| ?                                            | fslabel\ ``)``;   | ?   |
+----------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct mount                 *mp``;
``struct label                 *mnt``;
``struct label                 *fslabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+-----------------------------------------------------+-----------+
| Parameter        | Description                                         | Locking   |
+==================+=====================================================+===========+
| *``cred``*       | Subject credential                                  | ?         |
+------------------+-----------------------------------------------------+-----------+
| *``mp``*         | Object; file system being mounted                   | ?         |
+------------------+-----------------------------------------------------+-----------+
| *``mntlabel``*   | Policy label to be filled in for *``mp``*           | ?         |
+------------------+-----------------------------------------------------+-----------+
| *``fslabel``*    | Policy label for the file system *``mp``* mounts.   | ?         |
+------------------+-----------------------------------------------------+-----------+

.. raw:: html

   </div>

Fill out the labels on the mount point being created by the passed
subject credential. This call will be made when a new file system is
mounted.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.9.?\ ``mpo_create_root_mount``
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-------------------+-----+
| ``void                 mpo_create_root_mount(``   | cred,             | ?   |
+---------------------------------------------------+-------------------+-----+
| ?                                                 | mp,               | ?   |
+---------------------------------------------------+-------------------+-----+
| ?                                                 | mntlabel,         | ?   |
+---------------------------------------------------+-------------------+-----+
| ?                                                 | fslabel\ ``)``;   | ?   |
+---------------------------------------------------+-------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct mount                 *mp``;
``struct label                 *mntlabel``;
``struct label                 *fslabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

Parameter
Description
Locking
See `Section?6.7.3.1.8,
“\ ``mpo_create_mount``\ ” <mac-entry-point-reference.html#mac-mpo-create-mount>`__.

.. raw:: html

   </div>

Fill out the labels on the mount point being created by the passed
subject credential. This call will be made when the root file system is
mounted, after mpo\_create\_mount;.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.10.?\ ``mpo_relabel_vnode``
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+--------------------+-----+
| ``void                 mpo_relabel_vnode(``   | cred,              | ?   |
+-----------------------------------------------+--------------------+-----+
| ?                                             | vp,                | ?   |
+-----------------------------------------------+--------------------+-----+
| ?                                             | vnodelabel,        | ?   |
+-----------------------------------------------+--------------------+-----+
| ?                                             | newlabel\ ``)``;   | ?   |
+-----------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct vnode                 *vp``;
``struct label                 *vnodelabel``;
``struct label                 *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+-----------------------------------------------------------+-----------+
| Parameter          | Description                                               | Locking   |
+====================+===========================================================+===========+
| *``cred``*         | Subject credential                                        | ?         |
+--------------------+-----------------------------------------------------------+-----------+
| *``vp``*           | vnode to relabel                                          | ?         |
+--------------------+-----------------------------------------------------------+-----------+
| *``vnodelabel``*   | Existing policy label for *``vp``*                        | ?         |
+--------------------+-----------------------------------------------------------+-----------+
| *``newlabel``*     | New, possibly partial label to replace *``vnodelabel``*   | ?         |
+--------------------+-----------------------------------------------------------+-----------+

.. raw:: html

   </div>

Update the label on the passed vnode given the passed update vnode label
and the passed subject credential.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.11.?\ ``mpo_setlabel_vnode_extattr``
''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------+--------------------+-----+
| ``int                 mpo_setlabel_vnode_extattr(``   | cred,              | ?   |
+-------------------------------------------------------+--------------------+-----+
| ?                                                     | vp,                | ?   |
+-------------------------------------------------------+--------------------+-----+
| ?                                                     | vlabel,            | ?   |
+-------------------------------------------------------+--------------------+-----+
| ?                                                     | intlabel\ ``)``;   | ?   |
+-------------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct vnode                 *vp``;
``struct label                 *vlabel``;
``struct label                 *intlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+----------------------------------------------+-----------+
| Parameter        | Description                                  | Locking   |
+==================+==============================================+===========+
| *``cred``*       | Subject credential                           | ?         |
+------------------+----------------------------------------------+-----------+
| *``vp``*         | Vnode for which the label is being written   | ?         |
+------------------+----------------------------------------------+-----------+
| *``vlabel``*     | Policy label associated with *``vp``*        | ?         |
+------------------+----------------------------------------------+-----------+
| *``intlabel``*   | Label to write out                           | ?         |
+------------------+----------------------------------------------+-----------+

.. raw:: html

   </div>

Write out the policy from *``intlabel``* to an extended attribute. This
is called from ``vop_stdcreatevnode_ea``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1.12.?\ ``mpo_update_devfsdirent``
''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------------+----------------------+-----+
| ``void                 mpo_update_devfsdirent(``   | devfs\_dirent,       | ?   |
+----------------------------------------------------+----------------------+-----+
| ?                                                  | direntlabel,         | ?   |
+----------------------------------------------------+----------------------+-----+
| ?                                                  | vp,                  | ?   |
+----------------------------------------------------+----------------------+-----+
| ?                                                  | vnodelabel\ ``)``;   | ?   |
+----------------------------------------------------+----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct devfs_dirent                 *devfs_dirent``;
``struct label                 *direntlabel``;
``struct vnode                 *vp``;
``struct label                 *vnodelabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+------------------------------------------------------+-----------+
| Parameter            | Description                                          | Locking   |
+======================+======================================================+===========+
| *``devfs_dirent``*   | Object; devfs directory entry                        | ?         |
+----------------------+------------------------------------------------------+-----------+
| *``direntlabel``*    | Policy label for *``devfs_dirent``* to be updated.   | ?         |
+----------------------+------------------------------------------------------+-----------+
| *``vp``*             | Parent vnode                                         | Locked    |
+----------------------+------------------------------------------------------+-----------+
| *``vnodelabel``*     | Policy label for *``vp``*                            | ?         |
+----------------------+------------------------------------------------------+-----------+

.. raw:: html

   </div>

Update the *``devfs_dirent``* label from the passed devfs vnode label.
This call will be made when a devfs vnode has been successfully
relabeled to commit the label change such that it lasts even if the
vnode is recycled. It will also be made when a symlink is created in
devfs, following a call to ``mac_vnode_create_from_vnode`` to initialize
the vnode label.

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

6.7.3.2.?IPC Object Labeling Event Operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.2.1.?\ ``mpo_create_mbuf_from_socket``
''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------------+---------------------+-----+
| ``void                 mpo_create_mbuf_from_socket(``   | so,                 | ?   |
+---------------------------------------------------------+---------------------+-----+
| ?                                                       | socketlabel,        | ?   |
+---------------------------------------------------------+---------------------+-----+
| ?                                                       | m,                  | ?   |
+---------------------------------------------------------+---------------------+-----+
| ?                                                       | mbuflabel\ ``)``;   | ?   |
+---------------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct socket                 *so``;
``struct label                 *socketlabel``;
``struct mbuf *m``;
``struct label                 *mbuflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+---------------------------------------+----------------------+
| Parameter           | Description                           | Locking              |
+=====================+=======================================+======================+
| *``socket``*        | Socket                                | Socket locking WIP   |
+---------------------+---------------------------------------+----------------------+
| *``socketlabel``*   | Policy label for *``socket``*         | ?                    |
+---------------------+---------------------------------------+----------------------+
| *``m``*             | Object; mbuf                          | ?                    |
+---------------------+---------------------------------------+----------------------+
| *``mbuflabel``*     | Policy label to fill in for *``m``*   | ?                    |
+---------------------+---------------------------------------+----------------------+

.. raw:: html

   </div>

Set the label on a newly created mbuf header from the passed socket
label. This call is made when a new datagram or message is generated by
the socket and stored in the passed mbuf.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.2.2.?\ ``mpo_create_pipe``
''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------+---------------------+-----+
| ``void                 mpo_create_pipe(``   | cred,               | ?   |
+---------------------------------------------+---------------------+-----+
| ?                                           | pipe,               | ?   |
+---------------------------------------------+---------------------+-----+
| ?                                           | pipelabel\ ``)``;   | ?   |
+---------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct pipe                 *pipe``;
``struct label                 *pipelabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+-------------------------------------------+-----------+
| Parameter         | Description                               | Locking   |
+===================+===========================================+===========+
| *``cred``*        | Subject credential                        | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipe``*        | Pipe                                      | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipelabel``*   | Policy label associated with *``pipe``*   | ?         |
+-------------------+-------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on a newly created pipe from the passed subject
credential. This call is made when a new pipe is created.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.2.3.?\ ``mpo_create_socket``
''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+-----------------------+-----+
| ``void                 mpo_create_socket(``   | cred,                 | ?   |
+-----------------------------------------------+-----------------------+-----+
| ?                                             | so,                   | ?   |
+-----------------------------------------------+-----------------------+-----+
| ?                                             | socketlabel\ ``)``;   | ?   |
+-----------------------------------------------+-----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct socket                 *so``;
``struct label                 *socketlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+---------------------------------+-------------+
| Parameter           | Description                     | Locking     |
+=====================+=================================+=============+
| *``cred``*          | Subject credential              | Immutable   |
+---------------------+---------------------------------+-------------+
| *``so``*            | Object; socket to label         | ?           |
+---------------------+---------------------------------+-------------+
| *``socketlabel``*   | Label to fill in for *``so``*   | ?           |
+---------------------+---------------------------------+-------------+

.. raw:: html

   </div>

Set the label on a newly created socket from the passed subject
credential. This call is made when a socket is created.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.2.4.?\ ``mpo_create_socket_from_socket``
''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------------+--------------------------+-----+
| ``void                 mpo_create_socket_from_socket(``   | oldsocket,               | ?   |
+-----------------------------------------------------------+--------------------------+-----+
| ?                                                         | oldsocketlabel,          | ?   |
+-----------------------------------------------------------+--------------------------+-----+
| ?                                                         | newsocket,               | ?   |
+-----------------------------------------------------------+--------------------------+-----+
| ?                                                         | newsocketlabel\ ``)``;   | ?   |
+-----------------------------------------------------------+--------------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct socket                 *oldsocket``;
``struct label                 *oldsocketlabel``;
``struct socket                 *newsocket``;
``struct label                 *newsocketlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------------+-----------------------------------------------------+-----------+
| Parameter              | Description                                         | Locking   |
+========================+=====================================================+===========+
| *``oldsocket``*        | Listening socket                                    | ?         |
+------------------------+-----------------------------------------------------+-----------+
| *``oldsocketlabel``*   | Policy label associated with *``oldsocket``*        | ?         |
+------------------------+-----------------------------------------------------+-----------+
| *``newsocket``*        | New socket                                          | ?         |
+------------------------+-----------------------------------------------------+-----------+
| *``newsocketlabel``*   | Policy label associated with *``newsocketlabel``*   | ?         |
+------------------------+-----------------------------------------------------+-----------+

.. raw:: html

   </div>

Label a socket, *``newsocket``*, newly
`accept(2) <http://www.FreeBSD.org/cgi/man.cgi?query=accept&sektion=2>`__\ ed,
based on the
`listen(2) <http://www.FreeBSD.org/cgi/man.cgi?query=listen&sektion=2>`__
socket, *``oldsocket``*.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.2.5.?\ ``mpo_relabel_pipe``
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+--------------------+-----+
| ``void                 mpo_relabel_pipe(``   | cred,              | ?   |
+----------------------------------------------+--------------------+-----+
| ?                                            | pipe,              | ?   |
+----------------------------------------------+--------------------+-----+
| ?                                            | oldlabel,          | ?   |
+----------------------------------------------+--------------------+-----+
| ?                                            | newlabel\ ``)``;   | ?   |
+----------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct pipe                 *pipe``;
``struct label                 *oldlabel``;
``struct label                 *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+---------------------------------------------------+-----------+
| Parameter        | Description                                       | Locking   |
+==================+===================================================+===========+
| *``cred``*       | Subject credential                                | ?         |
+------------------+---------------------------------------------------+-----------+
| *``pipe``*       | Pipe                                              | ?         |
+------------------+---------------------------------------------------+-----------+
| *``oldlabel``*   | Current policy label associated with *``pipe``*   | ?         |
+------------------+---------------------------------------------------+-----------+
| *``newlabel``*   | Policy label update to apply to *``pipe``*        | ?         |
+------------------+---------------------------------------------------+-----------+

.. raw:: html

   </div>

Apply a new label, *``newlabel``*, to *``pipe``*.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.2.6.?\ ``mpo_relabel_socket``
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+--------------------+-----+
| ``void                 mpo_relabel_socket(``   | cred,              | ?   |
+------------------------------------------------+--------------------+-----+
| ?                                              | so,                | ?   |
+------------------------------------------------+--------------------+-----+
| ?                                              | oldlabel,          | ?   |
+------------------------------------------------+--------------------+-----+
| ?                                              | newlabel\ ``)``;   | ?   |
+------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct socket                 *so``;
``struct label                 *oldlabel``;
``struct label                 *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+------------------------------+-------------+
| Parameter        | Description                  | Locking     |
+==================+==============================+=============+
| *``cred``*       | Subject credential           | Immutable   |
+------------------+------------------------------+-------------+
| *``so``*         | Object; socket               | ?           |
+------------------+------------------------------+-------------+
| *``oldlabel``*   | Current label for *``so``*   | ?           |
+------------------+------------------------------+-------------+
| *``newlabel``*   | Label update for *``so``*    | ?           |
+------------------+------------------------------+-------------+

.. raw:: html

   </div>

Update the label on a socket from the passed socket label update.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.2.7.?\ ``mpo_set_socket_peer_from_mbuf``
''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------------+--------------------+-----+
| ``void                 mpo_set_socket_peer_from_mbuf(``   | mbuf,              | ?   |
+-----------------------------------------------------------+--------------------+-----+
| ?                                                         | mbuflabel,         | ?   |
+-----------------------------------------------------------+--------------------+-----+
| ?                                                         | oldlabel,          | ?   |
+-----------------------------------------------------------+--------------------+-----+
| ?                                                         | newlabel\ ``)``;   | ?   |
+-----------------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mbuf                 *mbuf``;
``struct label                 *mbuflabel``;
``struct label                 *oldlabel``;
``struct label                 *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+------------------------------------------------+-----------+
| Parameter         | Description                                    | Locking   |
+===================+================================================+===========+
| *``mbuf``*        | First datagram received over socket            | ?         |
+-------------------+------------------------------------------------+-----------+
| *``mbuflabel``*   | Label for *``mbuf``*                           | ?         |
+-------------------+------------------------------------------------+-----------+
| *``oldlabel``*    | Current label for the socket                   | ?         |
+-------------------+------------------------------------------------+-----------+
| *``newlabel``*    | Policy label to be filled out for the socket   | ?         |
+-------------------+------------------------------------------------+-----------+

.. raw:: html

   </div>

Set the peer label on a stream socket from the passed mbuf label. This
call will be made when the first datagram is received by the stream
socket, with the exception of Unix domain sockets.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.2.8.?\ ``mpo_set_socket_peer_from_socket``
''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------------+------------------------------+-----+
| ``void                 mpo_set_socket_peer_from_socket(``   | oldsocket,                   | ?   |
+-------------------------------------------------------------+------------------------------+-----+
| ?                                                           | oldsocketlabel,              | ?   |
+-------------------------------------------------------------+------------------------------+-----+
| ?                                                           | newsocket,                   | ?   |
+-------------------------------------------------------------+------------------------------+-----+
| ?                                                           | newsocketpeerlabel\ ``)``;   | ?   |
+-------------------------------------------------------------+------------------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct socket                 *oldsocket``;
``struct label                 *oldsocketlabel``;
``struct socket                 *newsocket``;
``struct label                 *newsocketpeerlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------------+-----------------------------------------------+-----------+
| Parameter                  | Description                                   | Locking   |
+============================+===============================================+===========+
| *``oldsocket``*            | Local socket                                  | ?         |
+----------------------------+-----------------------------------------------+-----------+
| *``oldsocketlabel``*       | Policy label for *``oldsocket``*              | ?         |
+----------------------------+-----------------------------------------------+-----------+
| *``newsocket``*            | Peer socket                                   | ?         |
+----------------------------+-----------------------------------------------+-----------+
| *``newsocketpeerlabel``*   | Policy label to fill in for *``newsocket``*   | ?         |
+----------------------------+-----------------------------------------------+-----------+

.. raw:: html

   </div>

Set the peer label on a stream UNIX domain socket from the passed remote
socket endpoint. This call will be made when the socket pair is
connected, and will be made for both endpoints.

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

6.7.3.3.?Network Object Labeling Event Operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.1.?\ ``mpo_create_bpfdesc``
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+--------------------+-----+
| ``void                 mpo_create_bpfdesc(``   | cred,              | ?   |
+------------------------------------------------+--------------------+-----+
| ?                                              | bpf\_d,            | ?   |
+------------------------------------------------+--------------------+-----+
| ?                                              | bpflabel\ ``)``;   | ?   |
+------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct bpf_d                 *bpf_d``;
``struct label                 *bpflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+------------------------------------------------+-------------+
| Parameter     | Description                                    | Locking     |
+===============+================================================+=============+
| *``cred``*    | Subject credential                             | Immutable   |
+---------------+------------------------------------------------+-------------+
| *``bpf_d``*   | Object; bpf descriptor                         | ?           |
+---------------+------------------------------------------------+-------------+
| *``bpf``*     | Policy label to be filled in for *``bpf_d``*   | ?           |
+---------------+------------------------------------------------+-------------+

.. raw:: html

   </div>

Set the label on a newly created BPF descriptor from the passed subject
credential. This call will be made when a BPF device node is opened by a
process with the passed subject credential.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.2.?\ ``mpo_create_ifnet``
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+----------------------+-----+
| ``void                 mpo_create_ifnet(``   | ifnet,               | ?   |
+----------------------------------------------+----------------------+-----+
| ?                                            | ifnetlabel\ ``)``;   | ?   |
+----------------------------------------------+----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ifnet                 *ifnet``;
``struct label                 *ifnetlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+-------------------------------------------+-----------+
| Parameter          | Description                               | Locking   |
+====================+===========================================+===========+
| *``ifnet``*        | Network interface                         | ?         |
+--------------------+-------------------------------------------+-----------+
| *``ifnetlabel``*   | Policy label to fill in for *``ifnet``*   | ?         |
+--------------------+-------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on a newly created interface. This call may be made when a
new physical interface becomes available to the system, or when a
pseudo-interface is instantiated during the boot or as a result of a
user action.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.3.?\ ``mpo_create_ipq``
'''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------+--------------------+-----+
| ``void                 mpo_create_ipq(``   | fragment,          | ?   |
+--------------------------------------------+--------------------+-----+
| ?                                          | fragmentlabel,     | ?   |
+--------------------------------------------+--------------------+-----+
| ?                                          | ipq,               | ?   |
+--------------------------------------------+--------------------+-----+
| ?                                          | ipqlabel\ ``)``;   | ?   |
+--------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mbuf                 *fragment``;
``struct label                 *fragmentlabel``;
``struct ipq                 *ipq``;
``struct label                 *ipqlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------------+----------------------------------------------+-----------+
| Parameter             | Description                                  | Locking   |
+=======================+==============================================+===========+
| *``fragment``*        | First received IP fragment                   | ?         |
+-----------------------+----------------------------------------------+-----------+
| *``fragmentlabel``*   | Policy label for *``fragment``*              | ?         |
+-----------------------+----------------------------------------------+-----------+
| *``ipq``*             | IP reassembly queue to be labeled            | ?         |
+-----------------------+----------------------------------------------+-----------+
| *``ipqlabel``*        | Policy label to be filled in for *``ipq``*   | ?         |
+-----------------------+----------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on a newly created IP fragment reassembly queue from the
mbuf header of the first received fragment.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.4.?\ ``mpo_create_datagram_from_ipq``
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------------------+-------------------------+-----+
| ``void                 mpo_create_create_datagram_from_ipq(``   | ipq,                    | ?   |
+-----------------------------------------------------------------+-------------------------+-----+
| ?                                                               | ipqlabel,               | ?   |
+-----------------------------------------------------------------+-------------------------+-----+
| ?                                                               | datagram,               | ?   |
+-----------------------------------------------------------------+-------------------------+-----+
| ?                                                               | datagramlabel\ ``)``;   | ?   |
+-----------------------------------------------------------------+-------------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ipq                 *ipq``;
``struct label                 *ipqlabel``;
``struct mbuf                 *datagram``;
``struct label                 *datagramlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------------+--------------------------------------------------------+-----------+
| Parameter             | Description                                            | Locking   |
+=======================+========================================================+===========+
| *``ipq``*             | IP reassembly queue                                    | ?         |
+-----------------------+--------------------------------------------------------+-----------+
| *``ipqlabel``*        | Policy label for *``ipq``*                             | ?         |
+-----------------------+--------------------------------------------------------+-----------+
| *``datagram``*        | Datagram to be labeled                                 | ?         |
+-----------------------+--------------------------------------------------------+-----------+
| *``datagramlabel``*   | Policy label to be filled in for *``datagramlabel``*   | ?         |
+-----------------------+--------------------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on a newly reassembled IP datagram from the IP fragment
reassembly queue from which it was generated.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.5.?\ ``mpo_create_fragment``
''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+-------------------------+-----+
| ``void                 mpo_create_fragment(``   | datagram,               | ?   |
+-------------------------------------------------+-------------------------+-----+
| ?                                               | datagramlabel,          | ?   |
+-------------------------------------------------+-------------------------+-----+
| ?                                               | fragment,               | ?   |
+-------------------------------------------------+-------------------------+-----+
| ?                                               | fragmentlabel\ ``)``;   | ?   |
+-------------------------------------------------+-------------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mbuf                 *datagram``;
``struct label                 *datagramlabel``;
``struct mbuf                 *fragment``;
``struct label                 *fragmentlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------------+---------------------------------------------------+-----------+
| Parameter             | Description                                       | Locking   |
+=======================+===================================================+===========+
| *``datagram``*        | Datagram                                          | ?         |
+-----------------------+---------------------------------------------------+-----------+
| *``datagramlabel``*   | Policy label for *``datagram``*                   | ?         |
+-----------------------+---------------------------------------------------+-----------+
| *``fragment``*        | Fragment to be labeled                            | ?         |
+-----------------------+---------------------------------------------------+-----------+
| *``fragmentlabel``*   | Policy label to be filled in for *``datagram``*   | ?         |
+-----------------------+---------------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on the mbuf header of a newly created IP fragment from the
label on the mbuf header of the datagram it was generate from.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.6.?\ ``mpo_create_mbuf_from_mbuf``
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------+------------------------+-----+
| ``void                 mpo_create_mbuf_from_mbuf(``   | oldmbuf,               | ?   |
+-------------------------------------------------------+------------------------+-----+
| ?                                                     | oldmbuflabel,          | ?   |
+-------------------------------------------------------+------------------------+-----+
| ?                                                     | newmbuf,               | ?   |
+-------------------------------------------------------+------------------------+-----+
| ?                                                     | newmbuflabel\ ``)``;   | ?   |
+-------------------------------------------------------+------------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mbuf                 *oldmbuf``;
``struct label                 *oldmbuflabel``;
``struct mbuf                 *newmbuf``;
``struct label                 *newmbuflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+--------------------------------------------------+-----------+
| Parameter            | Description                                      | Locking   |
+======================+==================================================+===========+
| *``oldmbuf``*        | Existing (source) mbuf                           | ?         |
+----------------------+--------------------------------------------------+-----------+
| *``oldmbuflabel``*   | Policy label for *``oldmbuf``*                   | ?         |
+----------------------+--------------------------------------------------+-----------+
| *``newmbuf``*        | New mbuf to be labeled                           | ?         |
+----------------------+--------------------------------------------------+-----------+
| *``newmbuflabel``*   | Policy label to be filled in for *``newmbuf``*   | ?         |
+----------------------+--------------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on the mbuf header of a newly created datagram from the
mbuf header of an existing datagram. This call may be made in a number
of situations, including when an mbuf is re-allocated for alignment
purposes.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.7.?\ ``mpo_create_mbuf_linklayer``
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------+---------------------+-----+
| ``void                 mpo_create_mbuf_linklayer(``   | ifnet,              | ?   |
+-------------------------------------------------------+---------------------+-----+
| ?                                                     | ifnetlabel,         | ?   |
+-------------------------------------------------------+---------------------+-----+
| ?                                                     | mbuf,               | ?   |
+-------------------------------------------------------+---------------------+-----+
| ?                                                     | mbuflabel\ ``)``;   | ?   |
+-------------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ifnet                 *ifnet``;
``struct label                 *ifnetlabel``;
``struct mbuf                 *mbuf``;
``struct label                 *mbuflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+-----------------------------------------------+-----------+
| Parameter          | Description                                   | Locking   |
+====================+===============================================+===========+
| *``ifnet``*        | Network interface                             | ?         |
+--------------------+-----------------------------------------------+-----------+
| *``ifnetlabel``*   | Policy label for *``ifnet``*                  | ?         |
+--------------------+-----------------------------------------------+-----------+
| *``mbuf``*         | mbuf header for new datagram                  | ?         |
+--------------------+-----------------------------------------------+-----------+
| *``mbuflabel``*    | Policy label to be filled in for *``mbuf``*   | ?         |
+--------------------+-----------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on the mbuf header of a newly created datagram generated
for the purposes of a link layer response for the passed interface. This
call may be made in a number of situations, including for ARP or ND6
responses in the IPv4 and IPv6 stacks.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.8.?\ ``mpo_create_mbuf_from_bpfdesc``
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------------------+---------------------+-----+
| ``void                 mpo_create_mbuf_from_bpfdesc(``   | bpf\_d,             | ?   |
+----------------------------------------------------------+---------------------+-----+
| ?                                                        | bpflabel,           | ?   |
+----------------------------------------------------------+---------------------+-----+
| ?                                                        | mbuf,               | ?   |
+----------------------------------------------------------+---------------------+-----+
| ?                                                        | mbuflabel\ ``)``;   | ?   |
+----------------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct bpf_d                 *bpf_d``;
``struct label                 *bpflabel``;
``struct mbuf                 *mbuf``;
``struct label                 *mbuflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+------------------------------------------+-----------+
| Parameter         | Description                              | Locking   |
+===================+==========================================+===========+
| *``bpf_d``*       | BPF descriptor                           | ?         |
+-------------------+------------------------------------------+-----------+
| *``bpflabel``*    | Policy label for *``bpflabel``*          | ?         |
+-------------------+------------------------------------------+-----------+
| *``mbuf``*        | New mbuf to be labeled                   | ?         |
+-------------------+------------------------------------------+-----------+
| *``mbuflabel``*   | Policy label to fill in for *``mbuf``*   | ?         |
+-------------------+------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on the mbuf header of a newly created datagram generated
using the passed BPF descriptor. This call is made when a write is
performed to the BPF device associated with the passed BPF descriptor.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.9.?\ ``mpo_create_mbuf_from_ifnet``
'''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------------+---------------------+-----+
| ``void                 mpo_create_mbuf_from_ifnet(``   | ifnet,              | ?   |
+--------------------------------------------------------+---------------------+-----+
| ?                                                      | ifnetlabel,         | ?   |
+--------------------------------------------------------+---------------------+-----+
| ?                                                      | mbuf,               | ?   |
+--------------------------------------------------------+---------------------+-----+
| ?                                                      | mbuflabel\ ``)``;   | ?   |
+--------------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ifnet                 *ifnet``;
``struct label                 *ifnetlabel``;
``struct mbuf                 *mbuf``;
``struct label                 *mbuflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+-----------------------------------------------+-----------+
| Parameter          | Description                                   | Locking   |
+====================+===============================================+===========+
| *``ifnet``*        | Network interface                             | ?         |
+--------------------+-----------------------------------------------+-----------+
| *``ifnetlabel``*   | Policy label for *``ifnetlabel``*             | ?         |
+--------------------+-----------------------------------------------+-----------+
| *``mbuf``*         | mbuf header for new datagram                  | ?         |
+--------------------+-----------------------------------------------+-----------+
| *``mbuflabel``*    | Policy label to be filled in for *``mbuf``*   | ?         |
+--------------------+-----------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on the mbuf header of a newly created datagram generated
from the passed network interface.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.10.?\ ``mpo_create_mbuf_multicast_encap``
'''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------------+------------------------+-----+
| ``void                 mpo_create_mbuf_multicast_encap(``   | oldmbuf,               | ?   |
+-------------------------------------------------------------+------------------------+-----+
| ?                                                           | oldmbuflabel,          | ?   |
+-------------------------------------------------------------+------------------------+-----+
| ?                                                           | ifnet,                 | ?   |
+-------------------------------------------------------------+------------------------+-----+
| ?                                                           | ifnetlabel,            | ?   |
+-------------------------------------------------------------+------------------------+-----+
| ?                                                           | newmbuf,               | ?   |
+-------------------------------------------------------------+------------------------+-----+
| ?                                                           | newmbuflabel\ ``)``;   | ?   |
+-------------------------------------------------------------+------------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mbuf                 *oldmbuf``;
``struct label                 *oldmbuflabel``;
``struct ifnet                 *ifnet``;
``struct label                 *ifnetlabel``;
``struct mbuf                 *newmbuf``;
``struct label                 *newmbuflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+--------------------------------------------------+-----------+
| Parameter            | Description                                      | Locking   |
+======================+==================================================+===========+
| *``oldmbuf``*        | mbuf header for existing datagram                | ?         |
+----------------------+--------------------------------------------------+-----------+
| *``oldmbuflabel``*   | Policy label for *``oldmbuf``*                   | ?         |
+----------------------+--------------------------------------------------+-----------+
| *``ifnet``*          | Network interface                                | ?         |
+----------------------+--------------------------------------------------+-----------+
| *``ifnetlabel``*     | Policy label for *``ifnet``*                     | ?         |
+----------------------+--------------------------------------------------+-----------+
| *``newmbuf``*        | mbuf header to be labeled for new datagram       | ?         |
+----------------------+--------------------------------------------------+-----------+
| *``newmbuflabel``*   | Policy label to be filled in for *``newmbuf``*   | ?         |
+----------------------+--------------------------------------------------+-----------+

.. raw:: html

   </div>

Set the label on the mbuf header of a newly created datagram generated
from the existing passed datagram when it is processed by the passed
multicast encapsulation interface. This call is made when an mbuf is to
be delivered using the virtual interface.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.11.?\ ``mpo_create_mbuf_netlayer``
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------------+------------------------+-----+
| ``void                 mpo_create_mbuf_netlayer(``   | oldmbuf,               | ?   |
+------------------------------------------------------+------------------------+-----+
| ?                                                    | oldmbuflabel,          | ?   |
+------------------------------------------------------+------------------------+-----+
| ?                                                    | newmbuf,               | ?   |
+------------------------------------------------------+------------------------+-----+
| ?                                                    | newmbuflabel\ ``)``;   | ?   |
+------------------------------------------------------+------------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mbuf                 *oldmbuf``;
``struct label                 *oldmbuflabel``;
``struct mbuf                 *newmbuf``;
``struct label                 *newmbuflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------+----------------------------------+-----------+
| Parameter            | Description                      | Locking   |
+======================+==================================+===========+
| *``oldmbuf``*        | Received datagram                | ?         |
+----------------------+----------------------------------+-----------+
| *``oldmbuflabel``*   | Policy label for *``oldmbuf``*   | ?         |
+----------------------+----------------------------------+-----------+
| *``newmbuf``*        | Newly created datagram           | ?         |
+----------------------+----------------------------------+-----------+
| *``newmbuflabel``*   | Policy label for *``newmbuf``*   | ?         |
+----------------------+----------------------------------+-----------+

.. raw:: html

   </div>

Set the label on the mbuf header of a newly created datagram generated
by the IP stack in response to an existing received datagram
(*``oldmbuf``*). This call may be made in a number of situations,
including when responding to ICMP request datagrams.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.12.?\ ``mpo_fragment_match``
''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+--------------------+-----+
| ``int                 mpo_fragment_match(``   | fragment,          | ?   |
+-----------------------------------------------+--------------------+-----+
| ?                                             | fragmentlabel,     | ?   |
+-----------------------------------------------+--------------------+-----+
| ?                                             | ipq,               | ?   |
+-----------------------------------------------+--------------------+-----+
| ?                                             | ipqlabel\ ``)``;   | ?   |
+-----------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mbuf                 *fragment``;
``struct label                 *fragmentlabel``;
``struct ipq                 *ipq``;
``struct label                 *ipqlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------------+-----------------------------------+-----------+
| Parameter             | Description                       | Locking   |
+=======================+===================================+===========+
| *``fragment``*        | IP datagram fragment              | ?         |
+-----------------------+-----------------------------------+-----------+
| *``fragmentlabel``*   | Policy label for *``fragment``*   | ?         |
+-----------------------+-----------------------------------+-----------+
| *``ipq``*             | IP fragment reassembly queue      | ?         |
+-----------------------+-----------------------------------+-----------+
| *``ipqlabel``*        | Policy label for *``ipq``*        | ?         |
+-----------------------+-----------------------------------+-----------+

.. raw:: html

   </div>

Determine whether an mbuf header containing an IP datagram
(*``fragment``*) fragment matches the label of the passed IP fragment
reassembly queue (*``ipq``*). Return (1) for a successful match, or (0)
for no match. This call is made when the IP stack attempts to find an
existing fragment reassembly queue for a newly received fragment; if
this fails, a new fragment reassembly queue may be instantiated for the
fragment. Policies may use this entry point to prevent the reassembly of
otherwise matching IP fragments if policy does not permit them to be
reassembled based on the label or other information.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.13.?\ ``mpo_relabel_ifnet``
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+--------------------+-----+
| ``void                 mpo_relabel_ifnet(``   | cred,              | ?   |
+-----------------------------------------------+--------------------+-----+
| ?                                             | ifnet,             | ?   |
+-----------------------------------------------+--------------------+-----+
| ?                                             | ifnetlabel,        | ?   |
+-----------------------------------------------+--------------------+-----+
| ?                                             | newlabel\ ``)``;   | ?   |
+-----------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct ifnet                 *ifnet``;
``struct label                 *ifnetlabel``;
``struct label                 *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+----------------------------------------+-----------+
| Parameter          | Description                            | Locking   |
+====================+========================================+===========+
| *``cred``*         | Subject credential                     | ?         |
+--------------------+----------------------------------------+-----------+
| *``ifnet``*        | Object; Network interface              | ?         |
+--------------------+----------------------------------------+-----------+
| *``ifnetlabel``*   | Policy label for *``ifnet``*           | ?         |
+--------------------+----------------------------------------+-----------+
| *``newlabel``*     | Label update to apply to *``ifnet``*   | ?         |
+--------------------+----------------------------------------+-----------+

.. raw:: html

   </div>

Update the label of network interface, *``ifnet``*, based on the passed
update label, *``newlabel``*, and the passed subject credential,
*``cred``*.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.3.14.?\ ``mpo_update_ipq``
''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------+--------------------+-----+
| ``void                 mpo_update_ipq(``   | fragment,          | ?   |
+--------------------------------------------+--------------------+-----+
| ?                                          | fragmentlabel,     | ?   |
+--------------------------------------------+--------------------+-----+
| ?                                          | ipq,               | ?   |
+--------------------------------------------+--------------------+-----+
| ?                                          | ipqlabel\ ``)``;   | ?   |
+--------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct mbuf                 *fragment``;
``struct label                 *fragmentlabel``;
``struct ipq                 *ipq``;
``struct label                 *ipqlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+--------------------------------------------+-----------+
| Parameter         | Description                                | Locking   |
+===================+============================================+===========+
| *``mbuf``*        | IP fragment                                | ?         |
+-------------------+--------------------------------------------+-----------+
| *``mbuflabel``*   | Policy label for *``mbuf``*                | ?         |
+-------------------+--------------------------------------------+-----------+
| *``ipq``*         | IP fragment reassembly queue               | ?         |
+-------------------+--------------------------------------------+-----------+
| *``ipqlabel``*    | Policy label to be updated for *``ipq``*   | ?         |
+-------------------+--------------------------------------------+-----------+

.. raw:: html

   </div>

Update the label on an IP fragment reassembly queue (*``ipq``*) based on
the acceptance of the passed IP fragment mbuf header (*``mbuf``*).

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

6.7.3.4.?Process Labeling Event Operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.4.1.?\ ``mpo_create_cred``
''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------+-----------------------+-----+
| ``void                 mpo_create_cred(``   | parent\_cred,         | ?   |
+---------------------------------------------+-----------------------+-----+
| ?                                           | child\_cred\ ``)``;   | ?   |
+---------------------------------------------+-----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *parent_cred``;
``struct ucred                 *child_cred``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+-----------------------------+-----------+
| Parameter           | Description                 | Locking   |
+=====================+=============================+===========+
| *``parent_cred``*   | Parent subject credential   | ?         |
+---------------------+-----------------------------+-----------+
| *``child_cred``*    | Child subject credential    | ?         |
+---------------------+-----------------------------+-----------+

.. raw:: html

   </div>

Set the label of a newly created subject credential from the passed
subject credential. This call will be made when
`crcopy(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crcopy&sektion=9>`__
is invoked on a newly created struct ucred. This call should not be
confused with a process forking or creation event.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.4.2.?\ ``mpo_execve_transition``
''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+----------------------+-----+
| ``void                 mpo_execve_transition(``   | old,                 | ?   |
+---------------------------------------------------+----------------------+-----+
| ?                                                 | new,                 | ?   |
+---------------------------------------------------+----------------------+-----+
| ?                                                 | vp,                  | ?   |
+---------------------------------------------------+----------------------+-----+
| ?                                                 | vnodelabel\ ``)``;   | ?   |
+---------------------------------------------------+----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *old``;
``struct ucred                 *new``;
``struct vnode                 *vp``;
``struct label                 *vnodelabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+----------------------------------------+-------------+
| Parameter          | Description                            | Locking     |
+====================+========================================+=============+
| *``old``*          | Existing subject credential            | Immutable   |
+--------------------+----------------------------------------+-------------+
| *``new``*          | New subject credential to be labeled   | ?           |
+--------------------+----------------------------------------+-------------+
| *``vp``*           | File to execute                        | Locked      |
+--------------------+----------------------------------------+-------------+
| *``vnodelabel``*   | Policy label for *``vp``*              | ?           |
+--------------------+----------------------------------------+-------------+

.. raw:: html

   </div>

Update the label of a newly created subject credential (*``new``*) from
the passed existing subject credential (*``old``*) based on a label
transition caused by executing the passed vnode (*``vp``*). This call
occurs when a process executes the passed vnode and one of the policies
returns a success from the ``mpo_execve_will_transition`` entry point.
Policies may choose to implement this call simply by invoking
``mpo_create_cred`` and passing the two subject credentials so as not to
implement a transitioning event. Policies should not leave this entry
point unimplemented if they implement ``mpo_create_cred``, even if they
do not implement ``mpo_execve_will_transition``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.4.3.?\ ``mpo_execve_will_transition``
'''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------------+----------------------+-----+
| ``int                 mpo_execve_will_transition(``   | old,                 | ?   |
+-------------------------------------------------------+----------------------+-----+
| ?                                                     | vp,                  | ?   |
+-------------------------------------------------------+----------------------+-----+
| ?                                                     | vnodelabel\ ``)``;   | ?   |
+-------------------------------------------------------+----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *old``;
``struct vnode                 *vp``;
``struct label                 *vnodelabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+---------------------------------------------------------------------------------------------------------+-------------+
| Parameter          | Description                                                                                             | Locking     |
+====================+=========================================================================================================+=============+
| *``old``*          | Subject credential prior to `execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__   | Immutable   |
+--------------------+---------------------------------------------------------------------------------------------------------+-------------+
| *``vp``*           | File to execute                                                                                         | ?           |
+--------------------+---------------------------------------------------------------------------------------------------------+-------------+
| *``vnodelabel``*   | Policy label for *``vp``*                                                                               | ?           |
+--------------------+---------------------------------------------------------------------------------------------------------+-------------+

.. raw:: html

   </div>

Determine whether the policy will want to perform a transition event as
a result of the execution of the passed vnode by the passed subject
credential. Return 1 if a transition is required, 0 if not. Even if a
policy returns 0, it should behave correctly in the presence of an
unexpected invocation of ``mpo_execve_transition``, as that call may
happen as a result of another policy requesting a transition.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.4.4.?\ ``mpo_create_proc0``
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+----------------+-----+
| ``void                 mpo_create_proc0(``   | cred\ ``)``;   | ?   |
+----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+--------------------------------------+-----------+
| Parameter    | Description                          | Locking   |
+==============+======================================+===========+
| *``cred``*   | Subject credential to be filled in   | ?         |
+--------------+--------------------------------------+-----------+

.. raw:: html

   </div>

Create the subject credential of process 0, the parent of all kernel
processes.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.4.5.?\ ``mpo_create_proc1``
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+----------------+-----+
| ``void                 mpo_create_proc1(``   | cred\ ``)``;   | ?   |
+----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+--------------------------------------+-----------+
| Parameter    | Description                          | Locking   |
+==============+======================================+===========+
| *``cred``*   | Subject credential to be filled in   | ?         |
+--------------+--------------------------------------+-----------+

.. raw:: html

   </div>

Create the subject credential of process 1, the parent of all user
processes.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.4.6.?\ ``mpo_relabel_cred``
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+--------------------+-----+
| ``void                 mpo_relabel_cred(``   | cred,              | ?   |
+----------------------------------------------+--------------------+-----+
| ?                                            | newlabel\ ``)``;   | ?   |
+----------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred                 *cred``;
``struct label                 *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+---------------------------------------+-----------+
| Parameter        | Description                           | Locking   |
+==================+=======================================+===========+
| *``cred``*       | Subject credential                    | ?         |
+------------------+---------------------------------------+-----------+
| *``newlabel``*   | Label update to apply to *``cred``*   | ?         |
+------------------+---------------------------------------+-----------+

.. raw:: html

   </div>

Update the label on a subject credential from the passed update label.

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

6.7.4.?Access Control Checks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Access control entry points permit policy modules to influence access
control decisions made by the kernel. Generally, although not always,
arguments to an access control entry point will include one or more
authorizing credentials, information (possibly including a label) for
any other objects involved in the operation. An access control entry
point may return 0 to permit the operation, or an
`errno(2) <http://www.FreeBSD.org/cgi/man.cgi?query=errno&sektion=2>`__
error value. The results of invoking the entry point across various
registered policy modules will be composed as follows: if all modules
permit the operation to succeed, success will be returned. If one or
modules returns a failure, a failure will be returned. If more than one
module returns a failure, the errno value to return to the user will be
selected using the following precedence, implemented by the
``error_select()`` function in ``kern_mac.c``:

.. raw:: html

   <div class="informaltable">

+--------------------+-----------+
| Most precedence    | EDEADLK   |
+--------------------+-----------+
| ?                  | EINVAL    |
+--------------------+-----------+
| ?                  | ESRCH     |
+--------------------+-----------+
| ?                  | EACCES    |
+--------------------+-----------+
| Least precedence   | EPERM     |
+--------------------+-----------+

.. raw:: html

   </div>

If none of the error values returned by all modules are listed in the
precedence chart then an arbitrarily selected value from the set will be
returned. In general, the rules provide precedence to errors in the
following order: kernel failures, invalid arguments, object not present,
access not permitted, other.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.4.1.?\ ``mpo_check_bpfdesc_receive``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------------+----------------------+-----+
| ``int               mpo_check_bpfdesc_receive(``   | bpf\_d,              | ?   |
+----------------------------------------------------+----------------------+-----+
| ?                                                  | bpflabel,            | ?   |
+----------------------------------------------------+----------------------+-----+
| ?                                                  | ifnet,               | ?   |
+----------------------------------------------------+----------------------+-----+
| ?                                                  | ifnetlabel\ ``)``;   | ?   |
+----------------------------------------------------+----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct bpf_d               *bpf_d``;
``struct label               *bpflabel``;
``struct ifnet               *ifnet``;
``struct label               *ifnetlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+--------------------------------+-----------+
| Parameter          | Description                    | Locking   |
+====================+================================+===========+
| *``bpf_d``*        | Subject; BPF descriptor        | ?         |
+--------------------+--------------------------------+-----------+
| *``bpflabel``*     | Policy label for *``bpf_d``*   | ?         |
+--------------------+--------------------------------+-----------+
| *``ifnet``*        | Object; network interface      | ?         |
+--------------------+--------------------------------+-----------+
| *``ifnetlabel``*   | Policy label for *``ifnet``*   | ?         |
+--------------------+--------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the MAC framework should permit datagrams from the
passed interface to be delivered to the buffers of the passed BPF
descriptor. Return (0) for success, or an ``errno`` value for failure
Suggested failure: EACCES for label mismatches, EPERM for lack of
privilege.

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

6.7.4.2.?\ ``mpo_check_kenv_dump``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+----------------+-----+
| ``int               mpo_check_kenv_dump(``   | cred\ ``)``;   | ?   |
+----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+----------------------+-----------+
| Parameter    | Description          | Locking   |
+==============+======================+===========+
| *``cred``*   | Subject credential   | ?         |
+--------------+----------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to retrieve the kernel
environment (see
`kenv(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kenv&sektion=2>`__).

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

6.7.4.3.?\ ``mpo_check_kenv_get``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------+----------------+-----+
| ``int               mpo_check_kenv_get(``   | cred,          | ?   |
+---------------------------------------------+----------------+-----+
| ?                                           | name\ ``)``;   | ?   |
+---------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``char *name``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+------------------------------------+-----------+
| Parameter    | Description                        | Locking   |
+==============+====================================+===========+
| *``cred``*   | Subject credential                 | ?         |
+--------------+------------------------------------+-----------+
| *``name``*   | Kernel environment variable name   | ?         |
+--------------+------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to retrieve the value of
the specified kernel environment variable.

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

6.7.4.4.?\ ``mpo_check_kenv_set``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------+----------------+-----+
| ``int               mpo_check_kenv_set(``   | cred,          | ?   |
+---------------------------------------------+----------------+-----+
| ?                                           | name\ ``)``;   | ?   |
+---------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``char *name``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+------------------------------------+-----------+
| Parameter    | Description                        | Locking   |
+==============+====================================+===========+
| *``cred``*   | Subject credential                 | ?         |
+--------------+------------------------------------+-----------+
| *``name``*   | Kernel environment variable name   | ?         |
+--------------+------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to set the specified
kernel environment variable.

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

6.7.4.5.?\ ``mpo_check_kenv_unset``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+----------------+-----+
| ``int               mpo_check_kenv_unset(``   | cred,          | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | name\ ``)``;   | ?   |
+-----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``char *name``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+------------------------------------+-----------+
| Parameter    | Description                        | Locking   |
+==============+====================================+===========+
| *``cred``*   | Subject credential                 | ?         |
+--------------+------------------------------------+-----------+
| *``name``*   | Kernel environment variable name   | ?         |
+--------------+------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to unset the specified
kernel environment variable.

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

6.7.4.6.?\ ``mpo_check_kld_load``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------+------------------+-----+
| ``int               mpo_check_kld_load(``   | cred,            | ?   |
+---------------------------------------------+------------------+-----+
| ?                                           | vp,              | ?   |
+---------------------------------------------+------------------+-----+
| ?                                           | vlabel\ ``)``;   | ?   |
+---------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *vlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+----------------------------------+-----------+
| Parameter      | Description                      | Locking   |
+================+==================================+===========+
| *``cred``*     | Subject credential               | ?         |
+----------------+----------------------------------+-----------+
| *``vp``*       | Kernel module vnode              | ?         |
+----------------+----------------------------------+-----------+
| *``vlabel``*   | Label associated with *``vp``*   | ?         |
+----------------+----------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to load the specified
module file.

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

6.7.4.7.?\ ``mpo_check_kld_stat``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------+----------------+-----+
| ``int               mpo_check_kld_stat(``   | cred\ ``)``;   | ?   |
+---------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+----------------------+-----------+
| Parameter    | Description          | Locking   |
+==============+======================+===========+
| *``cred``*   | Subject credential   | ?         |
+--------------+----------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to retrieve a list of
loaded kernel module files and associated statistics.

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

6.7.4.8.?\ ``mpo_check_kld_unload``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+----------------+-----+
| ``int               mpo_check_kld_unload(``   | cred\ ``)``;   | ?   |
+-----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+----------------------+-----------+
| Parameter    | Description          | Locking   |
+==============+======================+===========+
| *``cred``*   | Subject credential   | ?         |
+--------------+----------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to unload a kernel
module.

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

6.7.4.9.?\ ``mpo_check_pipe_ioctl``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+----------------+-----+
| ``int               mpo_check_pipe_ioctl(``   | cred,          | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | pipe,          | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | pipelabel,     | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | cmd,           | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | data\ ``)``;   | ?   |
+-----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct pipe               *pipe``;
``struct label               *pipelabel``;
``unsigned long               cmd``;
``void *data``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+-----------------------------------------------------------------------------------+-----------+
| Parameter         | Description                                                                       | Locking   |
+===================+===================================================================================+===========+
| *``cred``*        | Subject credential                                                                | ?         |
+-------------------+-----------------------------------------------------------------------------------+-----------+
| *``pipe``*        | Pipe                                                                              | ?         |
+-------------------+-----------------------------------------------------------------------------------+-----------+
| *``pipelabel``*   | Policy label associated with *``pipe``*                                           | ?         |
+-------------------+-----------------------------------------------------------------------------------+-----------+
| *``cmd``*         | `ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2>`__ command   | ?         |
+-------------------+-----------------------------------------------------------------------------------+-----------+
| *``data``*        | `ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2>`__ data      | ?         |
+-------------------+-----------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to make the specified
`ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2>`__
call.

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

6.7.4.10.?\ ``mpo_check_pipe_poll``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+---------------------+-----+
| ``int               mpo_check_pipe_poll(``   | cred,               | ?   |
+----------------------------------------------+---------------------+-----+
| ?                                            | pipe,               | ?   |
+----------------------------------------------+---------------------+-----+
| ?                                            | pipelabel\ ``)``;   | ?   |
+----------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct pipe               *pipe``;
``struct label               *pipelabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+-------------------------------------------+-----------+
| Parameter         | Description                               | Locking   |
+===================+===========================================+===========+
| *``cred``*        | Subject credential                        | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipe``*        | Pipe                                      | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipelabel``*   | Policy label associated with *``pipe``*   | ?         |
+-------------------+-------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to poll *``pipe``*.

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

6.7.4.11.?\ ``mpo_check_pipe_read``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+---------------------+-----+
| ``int               mpo_check_pipe_read(``   | cred,               | ?   |
+----------------------------------------------+---------------------+-----+
| ?                                            | pipe,               | ?   |
+----------------------------------------------+---------------------+-----+
| ?                                            | pipelabel\ ``)``;   | ?   |
+----------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct pipe               *pipe``;
``struct label               *pipelabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+-------------------------------------------+-----------+
| Parameter         | Description                               | Locking   |
+===================+===========================================+===========+
| *``cred``*        | Subject credential                        | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipe``*        | Pipe                                      | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipelabel``*   | Policy label associated with *``pipe``*   | ?         |
+-------------------+-------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed read access to
*``pipe``*.

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

6.7.4.12.?\ ``mpo_check_pipe_relabel``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+--------------------+-----+
| ``int               mpo_check_pipe_relabel(``   | cred,              | ?   |
+-------------------------------------------------+--------------------+-----+
| ?                                               | pipe,              | ?   |
+-------------------------------------------------+--------------------+-----+
| ?                                               | pipelabel,         | ?   |
+-------------------------------------------------+--------------------+-----+
| ?                                               | newlabel\ ``)``;   | ?   |
+-------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct pipe               *pipe``;
``struct label               *pipelabel``;
``struct label               *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+---------------------------------------------------+-----------+
| Parameter         | Description                                       | Locking   |
+===================+===================================================+===========+
| *``cred``*        | Subject credential                                | ?         |
+-------------------+---------------------------------------------------+-----------+
| *``pipe``*        | Pipe                                              | ?         |
+-------------------+---------------------------------------------------+-----------+
| *``pipelabel``*   | Current policy label associated with *``pipe``*   | ?         |
+-------------------+---------------------------------------------------+-----------+
| *``newlabel``*    | Label update to *``pipelabel``*                   | ?         |
+-------------------+---------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to relabel *``pipe``*.

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

6.7.4.13.?\ ``mpo_check_pipe_stat``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------+---------------------+-----+
| ``int               mpo_check_pipe_stat(``   | cred,               | ?   |
+----------------------------------------------+---------------------+-----+
| ?                                            | pipe,               | ?   |
+----------------------------------------------+---------------------+-----+
| ?                                            | pipelabel\ ``)``;   | ?   |
+----------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct pipe               *pipe``;
``struct label               *pipelabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+-------------------------------------------+-----------+
| Parameter         | Description                               | Locking   |
+===================+===========================================+===========+
| *``cred``*        | Subject credential                        | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipe``*        | Pipe                                      | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipelabel``*   | Policy label associated with *``pipe``*   | ?         |
+-------------------+-------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to retrieve statistics
related to *``pipe``*.

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

6.7.4.14.?\ ``mpo_check_pipe_write``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+---------------------+-----+
| ``int               mpo_check_pipe_write(``   | cred,               | ?   |
+-----------------------------------------------+---------------------+-----+
| ?                                             | pipe,               | ?   |
+-----------------------------------------------+---------------------+-----+
| ?                                             | pipelabel\ ``)``;   | ?   |
+-----------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct pipe               *pipe``;
``struct label               *pipelabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------+-------------------------------------------+-----------+
| Parameter         | Description                               | Locking   |
+===================+===========================================+===========+
| *``cred``*        | Subject credential                        | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipe``*        | Pipe                                      | ?         |
+-------------------+-------------------------------------------+-----------+
| *``pipelabel``*   | Policy label associated with *``pipe``*   | ?         |
+-------------------+-------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to write to *``pipe``*.

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

6.7.4.15.?\ ``mpo_check_socket_bind``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+--------------------+-----+
| ``int               mpo_check_socket_bind(``   | cred,              | ?   |
+------------------------------------------------+--------------------+-----+
| ?                                              | socket,            | ?   |
+------------------------------------------------+--------------------+-----+
| ?                                              | socketlabel,       | ?   |
+------------------------------------------------+--------------------+-----+
| ?                                              | sockaddr\ ``)``;   | ?   |
+------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct socket               *socket``;
``struct label               *socketlabel``;
``struct sockaddr               *sockaddr``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+---------------------------------+-----------+
| Parameter           | Description                     | Locking   |
+=====================+=================================+===========+
| *``cred``*          | Subject credential              | ?         |
+---------------------+---------------------------------+-----------+
| *``socket``*        | Socket to be bound              | ?         |
+---------------------+---------------------------------+-----------+
| *``socketlabel``*   | Policy label for *``socket``*   | ?         |
+---------------------+---------------------------------+-----------+
| *``sockaddr``*      | Address of *``socket``*         | ?         |
+---------------------+---------------------------------+-----------+

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

6.7.4.16.?\ ``mpo_check_socket_connect``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+--------------------+-----+
| ``int               mpo_check_socket_connect(``   | cred,              | ?   |
+---------------------------------------------------+--------------------+-----+
| ?                                                 | socket,            | ?   |
+---------------------------------------------------+--------------------+-----+
| ?                                                 | socketlabel,       | ?   |
+---------------------------------------------------+--------------------+-----+
| ?                                                 | sockaddr\ ``)``;   | ?   |
+---------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct socket               *socket``;
``struct label               *socketlabel``;
``struct sockaddr               *sockaddr``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+---------------------------------+-----------+
| Parameter           | Description                     | Locking   |
+=====================+=================================+===========+
| *``cred``*          | Subject credential              | ?         |
+---------------------+---------------------------------+-----------+
| *``socket``*        | Socket to be connected          | ?         |
+---------------------+---------------------------------+-----------+
| *``socketlabel``*   | Policy label for *``socket``*   | ?         |
+---------------------+---------------------------------+-----------+
| *``sockaddr``*      | Address of *``socket``*         | ?         |
+---------------------+---------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential (*``cred``*) can connect the
passed socket (*``socket``*) to the passed socket address
(*``sockaddr``*). Return 0 for success, or an ``errno`` value for
failure. Suggested failure: EACCES for label mismatches, EPERM for lack
of privilege.

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

6.7.4.17.?\ ``mpo_check_socket_receive``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-----------------------+-----+
| ``int               mpo_check_socket_receive(``   | cred,                 | ?   |
+---------------------------------------------------+-----------------------+-----+
| ?                                                 | so,                   | ?   |
+---------------------------------------------------+-----------------------+-----+
| ?                                                 | socketlabel\ ``)``;   | ?   |
+---------------------------------------------------+-----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct socket               *so``;
``struct label               *socketlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+-----------------------------------------+-----------+
| Parameter           | Description                             | Locking   |
+=====================+=========================================+===========+
| *``cred``*          | Subject credential                      | ?         |
+---------------------+-----------------------------------------+-----------+
| *``so``*            | Socket                                  | ?         |
+---------------------+-----------------------------------------+-----------+
| *``socketlabel``*   | Policy label associated with *``so``*   | ?         |
+---------------------+-----------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to receive information
from the socket *``so``*.

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

6.7.4.18.?\ ``mpo_check_socket_send``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+-----------------------+-----+
| ``int               mpo_check_socket_send(``   | cred,                 | ?   |
+------------------------------------------------+-----------------------+-----+
| ?                                              | so,                   | ?   |
+------------------------------------------------+-----------------------+-----+
| ?                                              | socketlabel\ ``)``;   | ?   |
+------------------------------------------------+-----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct socket               *so``;
``struct label               *socketlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+-----------------------------------------+-----------+
| Parameter           | Description                             | Locking   |
+=====================+=========================================+===========+
| *``cred``*          | Subject credential                      | ?         |
+---------------------+-----------------------------------------+-----------+
| *``so``*            | Socket                                  | ?         |
+---------------------+-----------------------------------------+-----------+
| *``socketlabel``*   | Policy label associated with *``so``*   | ?         |
+---------------------+-----------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to send information
across the socket *``so``*.

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

6.7.4.19.?\ ``mpo_check_cred_visible``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+--------------+-----+
| ``int               mpo_check_cred_visible(``   | u1,          | ?   |
+-------------------------------------------------+--------------+-----+
| ?                                               | u2\ ``)``;   | ?   |
+-------------------------------------------------+--------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *u1``;
``struct ucred               *u2``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------+----------------------+-----------+
| Parameter   | Description          | Locking   |
+=============+======================+===========+
| *``u1``*    | Subject credential   | ?         |
+-------------+----------------------+-----------+
| *``u2``*    | Object credential    | ?         |
+-------------+----------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential *``u1``* can “see” other
subjects with the passed subject credential *``u2``*. Return 0 for
success, or an ``errno`` value for failure. Suggested failure: EACCES
for label mismatches, EPERM for lack of privilege, or ESRCH to hide
visibility. This call may be made in a number of situations, including
inter-process status sysctl's used by ``ps``, and in procfs lookups.

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

6.7.4.20.?\ ``mpo_check_socket_visible``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-----------------------+-----+
| ``int               mpo_check_socket_visible(``   | cred,                 | ?   |
+---------------------------------------------------+-----------------------+-----+
| ?                                                 | socket,               | ?   |
+---------------------------------------------------+-----------------------+-----+
| ?                                                 | socketlabel\ ``)``;   | ?   |
+---------------------------------------------------+-----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct socket               *socket``;
``struct label               *socketlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+---------------------------------+-----------+
| Parameter           | Description                     | Locking   |
+=====================+=================================+===========+
| *``cred``*          | Subject credential              | ?         |
+---------------------+---------------------------------+-----------+
| *``socket``*        | Object; socket                  | ?         |
+---------------------+---------------------------------+-----------+
| *``socketlabel``*   | Policy label for *``socket``*   | ?         |
+---------------------+---------------------------------+-----------+

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

6.7.4.21.?\ ``mpo_check_ifnet_relabel``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+--------------------+-----+
| ``int               mpo_check_ifnet_relabel(``   | cred,              | ?   |
+--------------------------------------------------+--------------------+-----+
| ?                                                | ifnet,             | ?   |
+--------------------------------------------------+--------------------+-----+
| ?                                                | ifnetlabel,        | ?   |
+--------------------------------------------------+--------------------+-----+
| ?                                                | newlabel\ ``)``;   | ?   |
+--------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct ifnet               *ifnet``;
``struct label               *ifnetlabel``;
``struct label               *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+----------------------------------------------------------+-----------+
| Parameter          | Description                                              | Locking   |
+====================+==========================================================+===========+
| *``cred``*         | Subject credential                                       | ?         |
+--------------------+----------------------------------------------------------+-----------+
| *``ifnet``*        | Object; network interface                                | ?         |
+--------------------+----------------------------------------------------------+-----------+
| *``ifnetlabel``*   | Existing policy label for *``ifnet``*                    | ?         |
+--------------------+----------------------------------------------------------+-----------+
| *``newlabel``*     | Policy label update to later be applied to *``ifnet``*   | ?         |
+--------------------+----------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can relabel the passed network
interface to the passed label update.

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

6.7.4.22.?\ ``mpo_check_socket_relabel``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+--------------------+-----+
| ``int               mpo_check_socket_relabel(``   | cred,              | ?   |
+---------------------------------------------------+--------------------+-----+
| ?                                                 | socket,            | ?   |
+---------------------------------------------------+--------------------+-----+
| ?                                                 | socketlabel,       | ?   |
+---------------------------------------------------+--------------------+-----+
| ?                                                 | newlabel\ ``)``;   | ?   |
+---------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct socket               *socket``;
``struct label               *socketlabel``;
``struct label               *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+---------------------------------------------------------+-----------+
| Parameter           | Description                                             | Locking   |
+=====================+=========================================================+===========+
| *``cred``*          | Subject credential                                      | ?         |
+---------------------+---------------------------------------------------------+-----------+
| *``socket``*        | Object; socket                                          | ?         |
+---------------------+---------------------------------------------------------+-----------+
| *``socketlabel``*   | Existing policy label for *``socket``*                  | ?         |
+---------------------+---------------------------------------------------------+-----------+
| *``newlabel``*      | Label update to later be applied to *``socketlabel``*   | ?         |
+---------------------+---------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can relabel the passed socket
to the passed label update.

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

6.7.4.23.?\ ``mpo_check_cred_relabel``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+--------------------+-----+
| ``int               mpo_check_cred_relabel(``   | cred,              | ?   |
+-------------------------------------------------+--------------------+-----+
| ?                                               | newlabel\ ``)``;   | ?   |
+-------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct label               *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+--------------------------------------------------+-----------+
| Parameter        | Description                                      | Locking   |
+==================+==================================================+===========+
| *``cred``*       | Subject credential                               | ?         |
+------------------+--------------------------------------------------+-----------+
| *``newlabel``*   | Label update to later be applied to *``cred``*   | ?         |
+------------------+--------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can relabel itself to the
passed label update.

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

6.7.4.24.?\ ``mpo_check_vnode_relabel``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+--------------------+-----+
| ``int               mpo_check_vnode_relabel(``   | cred,              | ?   |
+--------------------------------------------------+--------------------+-----+
| ?                                                | vp,                | ?   |
+--------------------------------------------------+--------------------+-----+
| ?                                                | vnodelabel,        | ?   |
+--------------------------------------------------+--------------------+-----+
| ?                                                | newlabel\ ``)``;   | ?   |
+--------------------------------------------------+--------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *vnodelabel``;
``struct label               *newlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+-------------------------------------------------------+-------------+
| Parameter          | Description                                           | Locking     |
+====================+=======================================================+=============+
| *``cred``*         | Subject credential                                    | Immutable   |
+--------------------+-------------------------------------------------------+-------------+
| *``vp``*           | Object; vnode                                         | Locked      |
+--------------------+-------------------------------------------------------+-------------+
| *``vnodelabel``*   | Existing policy label for *``vp``*                    | ?           |
+--------------------+-------------------------------------------------------+-------------+
| *``newlabel``*     | Policy label update to later be applied to *``vp``*   | ?           |
+--------------------+-------------------------------------------------------+-------------+

.. raw:: html

   </div>

Determine whether the subject credential can relabel the passed vnode to
the passed label update.

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

6.7.4.25.?\ ``mpo_check_mount_stat``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------+----------------------+-----+
| ``int mpo_check_mount_stat(``   | cred,                | ?   |
+---------------------------------+----------------------+-----+
| ?                               | mp,                  | ?   |
+---------------------------------+----------------------+-----+
| ?                               | mountlabel\ ``)``;   | ?   |
+---------------------------------+----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct mount               *mp``;
``struct label               *mountlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+-----------------------------+-----------+
| Parameter          | Description                 | Locking   |
+====================+=============================+===========+
| *``cred``*         | Subject credential          | ?         |
+--------------------+-----------------------------+-----------+
| *``mp``*           | Object; file system mount   | ?         |
+--------------------+-----------------------------+-----------+
| *``mountlabel``*   | Policy label for *``mp``*   | ?         |
+--------------------+-----------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can see the results of a statfs
performed on the file system. Return 0 for success, or an ``errno``
value for failure. Suggested failure: EACCES for label mismatches or
EPERM for lack of privilege. This call may be made in a number of
situations, including during invocations of
`statfs(2) <http://www.FreeBSD.org/cgi/man.cgi?query=statfs&sektion=2>`__
and related calls, as well as to determine what file systems to exclude
from listings of file systems, such as when
`getfsstat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=getfsstat&sektion=2>`__
is invoked.

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

6.7.4.26.?\ ``mpo_check_proc_debug``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+----------------+-----+
| ``int               mpo_check_proc_debug(``   | cred,          | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | proc\ ``)``;   | ?   |
+-----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct proc               *proc``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+----------------------+-------------+
| Parameter    | Description          | Locking     |
+==============+======================+=============+
| *``cred``*   | Subject credential   | Immutable   |
+--------------+----------------------+-------------+
| *``proc``*   | Object; process      | ?           |
+--------------+----------------------+-------------+

.. raw:: html

   </div>

Determine whether the subject credential can debug the passed process.
Return 0 for success, or an ``errno`` value for failure. Suggested
failure: EACCES for label mismatch, EPERM for lack of privilege, or
ESRCH to hide visibility of the target. This call may be made in a
number of situations, including use of the
`ptrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ptrace&sektion=2>`__
and
`ktrace(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ktrace&sektion=2>`__
APIs, as well as for some types of procfs operations.

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

6.7.4.27.?\ ``mpo_check_vnode_access``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+-----------------+-----+
| ``int               mpo_check_vnode_access(``   | cred,           | ?   |
+-------------------------------------------------+-----------------+-----+
| ?                                               | vp,             | ?   |
+-------------------------------------------------+-----------------+-----+
| ?                                               | label,          | ?   |
+-------------------------------------------------+-----------------+-----+
| ?                                               | flags\ ``)``;   | ?   |
+-------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``int flags``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                       | Locking   |
+===============+===================================================================================+===========+
| *``cred``*    | Subject credential                                                                | ?         |
+---------------+-----------------------------------------------------------------------------------+-----------+
| *``vp``*      | Object; vnode                                                                     | ?         |
+---------------+-----------------------------------------------------------------------------------+-----------+
| *``label``*   | Policy label for *``vp``*                                                         | ?         |
+---------------+-----------------------------------------------------------------------------------+-----------+
| *``flags``*   | `access(2) <http://www.FreeBSD.org/cgi/man.cgi?query=access&sektion=2>`__ flags   | ?         |
+---------------+-----------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine how invocations of
`access(2) <http://www.FreeBSD.org/cgi/man.cgi?query=access&sektion=2>`__
and related calls by the subject credential should return when performed
on the passed vnode using the passed access flags. This should generally
be implemented using the same semantics used in
``mpo_check_vnode_open``. Return 0 for success, or an ``errno`` value
for failure. Suggested failure: EACCES for label mismatches or EPERM for
lack of privilege.

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

6.7.4.28.?\ ``mpo_check_vnode_chdir``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+------------------+-----+
| ``int               mpo_check_vnode_chdir(``   | cred,            | ?   |
+------------------------------------------------+------------------+-----+
| ?                                              | dvp,             | ?   |
+------------------------------------------------+------------------+-----+
| ?                                              | dlabel\ ``)``;   | ?   |
+------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *dvp``;
``struct label               *dlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+-------------------------------------------------------------------------------------------------+-----------+
| Parameter      | Description                                                                                     | Locking   |
+================+=================================================================================================+===========+
| *``cred``*     | Subject credential                                                                              | ?         |
+----------------+-------------------------------------------------------------------------------------------------+-----------+
| *``dvp``*      | Object; vnode to `chdir(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chdir&sektion=2>`__ into   | ?         |
+----------------+-------------------------------------------------------------------------------------------------+-----------+
| *``dlabel``*   | Policy label for *``dvp``*                                                                      | ?         |
+----------------+-------------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can change the process working
directory to the passed vnode. Return 0 for success, or an ``errno``
value for failure. Suggested failure: EACCES for label mismatch, or
EPERM for lack of privilege.

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

6.7.4.29.?\ ``mpo_check_vnode_chroot``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+------------------+-----+
| ``int               mpo_check_vnode_chroot(``   | cred,            | ?   |
+-------------------------------------------------+------------------+-----+
| ?                                               | dvp,             | ?   |
+-------------------------------------------------+------------------+-----+
| ?                                               | dlabel\ ``)``;   | ?   |
+-------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *dvp``;
``struct label               *dlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+------------------------------------------+-----------+
| Parameter      | Description                              | Locking   |
+================+==========================================+===========+
| *``cred``*     | Subject credential                       | ?         |
+----------------+------------------------------------------+-----------+
| *``dvp``*      | Directory vnode                          | ?         |
+----------------+------------------------------------------+-----------+
| *``dlabel``*   | Policy label associated with *``dvp``*   | ?         |
+----------------+------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
into the specified directory (*``dvp``*).

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

6.7.4.30.?\ ``mpo_check_vnode_create``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+---------------+-----+
| ``int               mpo_check_vnode_create(``   | cred,         | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | dvp,          | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | dlabel,       | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | cnp,          | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | vap\ ``)``;   | ?   |
+-------------------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *dvp``;
``struct label               *dlabel``;
``struct componentname               *cnp``;
``struct vattr               *vap``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+----------------------------------+-----------+
| Parameter      | Description                      | Locking   |
+================+==================================+===========+
| *``cred``*     | Subject credential               | ?         |
+----------------+----------------------------------+-----------+
| *``dvp``*      | Object; vnode                    | ?         |
+----------------+----------------------------------+-----------+
| *``dlabel``*   | Policy label for *``dvp``*       | ?         |
+----------------+----------------------------------+-----------+
| *``cnp``*      | Component name for *``dvp``*     | ?         |
+----------------+----------------------------------+-----------+
| *``vap``*      | vnode attributes for *``vap``*   | ?         |
+----------------+----------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can create a vnode with the
passed parent directory, passed name information, and passed attribute
information. Return 0 for success, or an ``errno`` value for failure.
Suggested failure: EACCES for label mismatch, or EPERM for lack of
privilege. This call may be made in a number of situations, including as
a result of calls to
`open(2) <http://www.FreeBSD.org/cgi/man.cgi?query=open&sektion=2>`__
with O\_CREAT,
`mkfifo(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mkfifo&sektion=2>`__,
and others.

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

6.7.4.31.?\ ``mpo_check_vnode_delete``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+---------------+-----+
| ``int               mpo_check_vnode_delete(``   | cred,         | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | dvp,          | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | dlabel,       | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | vp,           | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | label,        | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | cnp\ ``)``;   | ?   |
+-------------------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *dvp``;
``struct label               *dlabel``;
``struct vnode               *vp``;
``void *label``;
``struct componentname               *cnp``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+-------------------------------+-----------+
| Parameter      | Description                   | Locking   |
+================+===============================+===========+
| *``cred``*     | Subject credential            | ?         |
+----------------+-------------------------------+-----------+
| *``dvp``*      | Parent directory vnode        | ?         |
+----------------+-------------------------------+-----------+
| *``dlabel``*   | Policy label for *``dvp``*    | ?         |
+----------------+-------------------------------+-----------+
| *``vp``*       | Object; vnode to delete       | ?         |
+----------------+-------------------------------+-----------+
| *``label``*    | Policy label for *``vp``*     | ?         |
+----------------+-------------------------------+-----------+
| *``cnp``*      | Component name for *``vp``*   | ?         |
+----------------+-------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can delete a vnode from the
passed parent directory and passed name information. Return 0 for
success, or an ``errno`` value for failure. Suggested failure: EACCES
for label mismatch, or EPERM for lack of privilege. This call may be
made in a number of situations, including as a result of calls to
`unlink(2) <http://www.FreeBSD.org/cgi/man.cgi?query=unlink&sektion=2>`__
and
`rmdir(2) <http://www.FreeBSD.org/cgi/man.cgi?query=rmdir&sektion=2>`__.
Policies implementing this entry point should also implement
``mpo_check_rename_to`` to authorize deletion of objects as a result of
being the target of a rename.

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

6.7.4.32.?\ ``mpo_check_vnode_deleteacl``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------------+----------------+-----+
| ``int               mpo_check_vnode_deleteacl(``   | cred,          | ?   |
+----------------------------------------------------+----------------+-----+
| ?                                                  | vp,            | ?   |
+----------------------------------------------------+----------------+-----+
| ?                                                  | label,         | ?   |
+----------------------------------------------------+----------------+-----+
| ?                                                  | type\ ``)``;   | ?   |
+----------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred *cred``;
``struct vnode *vp``;
``struct label *label``;
``acl_type_t type``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------+-------------+
| Parameter     | Description                 | Locking     |
+===============+=============================+=============+
| *``cred``*    | Subject credential          | Immutable   |
+---------------+-----------------------------+-------------+
| *``vp``*      | Object; vnode               | Locked      |
+---------------+-----------------------------+-------------+
| *``label``*   | Policy label for *``vp``*   | ?           |
+---------------+-----------------------------+-------------+
| *``type``*    | ACL type                    | ?           |
+---------------+-----------------------------+-------------+

.. raw:: html

   </div>

Determine whether the subject credential can delete the ACL of passed
type from the passed vnode. Return 0 for success, or an ``errno`` value
for failure. Suggested failure: EACCES for label mismatch, or EPERM for
lack of privilege.

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

6.7.4.33.?\ ``mpo_check_vnode_exec``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+-----------------+-----+
| ``int               mpo_check_vnode_exec(``   | cred,           | ?   |
+-----------------------------------------------+-----------------+-----+
| ?                                             | vp,             | ?   |
+-----------------------------------------------+-----------------+-----+
| ?                                             | label\ ``)``;   | ?   |
+-----------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------+-----------+
| Parameter     | Description                 | Locking   |
+===============+=============================+===========+
| *``cred``*    | Subject credential          | ?         |
+---------------+-----------------------------+-----------+
| *``vp``*      | Object; vnode to execute    | ?         |
+---------------+-----------------------------+-----------+
| *``label``*   | Policy label for *``vp``*   | ?         |
+---------------+-----------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can execute the passed vnode.
Determination of execute privilege is made separately from decisions
about any transitioning event. Return 0 for success, or an ``errno``
value for failure. Suggested failure: EACCES for label mismatch, or
EPERM for lack of privilege.

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

6.7.4.34.?\ ``mpo_check_vnode_getacl``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+----------------+-----+
| ``int               mpo_check_vnode_getacl(``   | cred,          | ?   |
+-------------------------------------------------+----------------+-----+
| ?                                               | vp,            | ?   |
+-------------------------------------------------+----------------+-----+
| ?                                               | label,         | ?   |
+-------------------------------------------------+----------------+-----+
| ?                                               | type\ ``)``;   | ?   |
+-------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``acl_type_t               type``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------+-----------+
| Parameter     | Description                 | Locking   |
+===============+=============================+===========+
| *``cred``*    | Subject credential          | ?         |
+---------------+-----------------------------+-----------+
| *``vp``*      | Object; vnode               | ?         |
+---------------+-----------------------------+-----------+
| *``label``*   | Policy label for *``vp``*   | ?         |
+---------------+-----------------------------+-----------+
| *``type``*    | ACL type                    | ?         |
+---------------+-----------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can retrieve the ACL of passed
type from the passed vnode. Return 0 for success, or an ``errno`` value
for failure. Suggested failure: EACCES for label mismatch, or EPERM for
lack of privilege.

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

6.7.4.35.?\ ``mpo_check_vnode_getextattr``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------+------------------+-----+
| ``int               mpo_check_vnode_getextattr(``   | cred,            | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | vp,              | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | label,           | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | attrnamespace,   | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | name,            | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | uio\ ``)``;      | ?   |
+-----------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``int               attrnamespace``;
``const char               *name``;
``struct uio               *uio``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| Parameter             | Description                                                                                      | Locking   |
+=======================+==================================================================================================+===========+
| *``cred``*            | Subject credential                                                                               | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``vp``*              | Object; vnode                                                                                    | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``label``*           | Policy label for *``vp``*                                                                        | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``attrnamespace``*   | Extended attribute namespace                                                                     | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``name``*            | Extended attribute name                                                                          | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``uio``*             | I/O structure pointer; see `uio(9) <http://www.FreeBSD.org/cgi/man.cgi?query=uio&sektion=9>`__   | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can retrieve the extended
attribute with the passed namespace and name from the passed vnode.
Policies implementing labeling using extended attributes may be
interested in special handling of operations on those extended
attributes. Return 0 for success, or an ``errno`` value for failure.
Suggested failure: EACCES for label mismatch, or EPERM for lack of
privilege.

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

6.7.4.36.?\ ``mpo_check_vnode_link``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+---------------+-----+
| ``int               mpo_check_vnode_link(``   | cred,         | ?   |
+-----------------------------------------------+---------------+-----+
| ?                                             | dvp,          | ?   |
+-----------------------------------------------+---------------+-----+
| ?                                             | dlabel,       | ?   |
+-----------------------------------------------+---------------+-----+
| ?                                             | vp,           | ?   |
+-----------------------------------------------+---------------+-----+
| ?                                             | label,        | ?   |
+-----------------------------------------------+---------------+-----+
| ?                                             | cnp\ ``)``;   | ?   |
+-----------------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *dvp``;
``struct label               *dlabel``;
``struct vnode               *vp``;
``struct label               *label``;
``struct componentname               *cnp``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+---------------------------------------------+-----------+
| Parameter      | Description                                 | Locking   |
+================+=============================================+===========+
| *``cred``*     | Subject credential                          | ?         |
+----------------+---------------------------------------------+-----------+
| *``dvp``*      | Directory vnode                             | ?         |
+----------------+---------------------------------------------+-----------+
| *``dlabel``*   | Policy label associated with *``dvp``*      | ?         |
+----------------+---------------------------------------------+-----------+
| *``vp``*       | Link destination vnode                      | ?         |
+----------------+---------------------------------------------+-----------+
| *``label``*    | Policy label associated with *``vp``*       | ?         |
+----------------+---------------------------------------------+-----------+
| *``cnp``*      | Component name for the link being created   | ?         |
+----------------+---------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to create a link to the
vnode *``vp``* with the name specified by *``cnp``*.

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

6.7.4.37.?\ ``mpo_check_vnode_mmap``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+----------------+-----+
| ``int               mpo_check_vnode_mmap(``   | cred,          | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | vp,            | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | label,         | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | prot\ ``)``;   | ?   |
+-----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``int prot``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+------------------------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                                    | Locking   |
+===============+================================================================================================+===========+
| *``cred``*    | Subject credential                                                                             | ?         |
+---------------+------------------------------------------------------------------------------------------------+-----------+
| *``vp``*      | Vnode to map                                                                                   | ?         |
+---------------+------------------------------------------------------------------------------------------------+-----------+
| *``label``*   | Policy label associated with *``vp``*                                                          | ?         |
+---------------+------------------------------------------------------------------------------------------------+-----------+
| *``prot``*    | Mmap protections (see `mmap(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mmap&sektion=2>`__)   | ?         |
+---------------+------------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to map the vnode
*``vp``* with the protections specified in *``prot``*.

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

6.7.4.38.?\ ``mpo_check_vnode_mmap_downgrade``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------------------+----------------+-----+
| ``void               mpo_check_vnode_mmap_downgrade(``   | cred,          | ?   |
+----------------------------------------------------------+----------------+-----+
| ?                                                        | vp,            | ?   |
+----------------------------------------------------------+----------------+-----+
| ?                                                        | label,         | ?   |
+----------------------------------------------------------+----------------+-----+
| ?                                                        | prot\ ``)``;   | ?   |
+----------------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``int *prot``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

Parameter
Description
Locking
*``cred``*
See `Section?6.7.4.37,
“\ ``mpo_check_vnode_mmap``\ ” <mac-entry-point-reference.html#mac-mpo-check-vnode-mmap>`__.
?
*``vp``*
?
*``label``*
?
*``prot``*
Mmap protections to be downgraded
?

.. raw:: html

   </div>

Downgrade the mmap protections based on the subject and object labels.

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

6.7.4.39.?\ ``mpo_check_vnode_mprotect``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+----------------+-----+
| ``int               mpo_check_vnode_mprotect(``   | cred,          | ?   |
+---------------------------------------------------+----------------+-----+
| ?                                                 | vp,            | ?   |
+---------------------------------------------------+----------------+-----+
| ?                                                 | label,         | ?   |
+---------------------------------------------------+----------------+-----+
| ?                                                 | prot\ ``)``;   | ?   |
+---------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``int prot``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+----------------------+-----------+
| Parameter    | Description          | Locking   |
+==============+======================+===========+
| *``cred``*   | Subject credential   | ?         |
+--------------+----------------------+-----------+
| *``vp``*     | Mapped vnode         | ?         |
+--------------+----------------------+-----------+
| *``prot``*   | Memory protections   | ?         |
+--------------+----------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to set the specified
memory protections on memory mapped from the vnode *``vp``*.

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

6.7.4.40.?\ ``mpo_check_vnode_poll``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+-----------------+-----+
| ``int               mpo_check_vnode_poll(``   | active\_cred,   | ?   |
+-----------------------------------------------+-----------------+-----+
| ?                                             | file\_cred,     | ?   |
+-----------------------------------------------+-----------------+-----+
| ?                                             | vp,             | ?   |
+-----------------------------------------------+-----------------+-----+
| ?                                             | label\ ``)``;   | ?   |
+-----------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *active_cred``;
``struct ucred               *file_cred``;
``struct vnode               *vp``;
``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+----------------------------------------------+-----------+
| Parameter           | Description                                  | Locking   |
+=====================+==============================================+===========+
| *``active_cred``*   | Subject credential                           | ?         |
+---------------------+----------------------------------------------+-----------+
| *``file_cred``*     | Credential associated with the struct file   | ?         |
+---------------------+----------------------------------------------+-----------+
| *``vp``*            | Polled vnode                                 | ?         |
+---------------------+----------------------------------------------+-----------+
| *``label``*         | Policy label associated with *``vp``*        | ?         |
+---------------------+----------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to poll the vnode
*``vp``*.

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

6.7.4.41.?\ ``mpo_check_vnode_rename_from``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+---------------+-----+
| ``int               mpo_vnode_rename_from(``   | cred,         | ?   |
+------------------------------------------------+---------------+-----+
| ?                                              | dvp,          | ?   |
+------------------------------------------------+---------------+-----+
| ?                                              | dlabel,       | ?   |
+------------------------------------------------+---------------+-----+
| ?                                              | vp,           | ?   |
+------------------------------------------------+---------------+-----+
| ?                                              | label,        | ?   |
+------------------------------------------------+---------------+-----+
| ?                                              | cnp\ ``)``;   | ?   |
+------------------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *dvp``;
``struct label               *dlabel``;
``struct vnode               *vp``;
``struct label               *label``;
``struct componentname               *cnp``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+------------------------------------------+-----------+
| Parameter      | Description                              | Locking   |
+================+==========================================+===========+
| *``cred``*     | Subject credential                       | ?         |
+----------------+------------------------------------------+-----------+
| *``dvp``*      | Directory vnode                          | ?         |
+----------------+------------------------------------------+-----------+
| *``dlabel``*   | Policy label associated with *``dvp``*   | ?         |
+----------------+------------------------------------------+-----------+
| *``vp``*       | Vnode to be renamed                      | ?         |
+----------------+------------------------------------------+-----------+
| *``label``*    | Policy label associated with *``vp``*    | ?         |
+----------------+------------------------------------------+-----------+
| *``cnp``*      | Component name for *``vp``*              | ?         |
+----------------+------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to rename the vnode
*``vp``* to something else.

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

6.7.4.42.?\ ``mpo_check_vnode_rename_to``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------------+---------------+-----+
| ``int               mpo_check_vnode_rename_to(``   | cred,         | ?   |
+----------------------------------------------------+---------------+-----+
| ?                                                  | dvp,          | ?   |
+----------------------------------------------------+---------------+-----+
| ?                                                  | dlabel,       | ?   |
+----------------------------------------------------+---------------+-----+
| ?                                                  | vp,           | ?   |
+----------------------------------------------------+---------------+-----+
| ?                                                  | label,        | ?   |
+----------------------------------------------------+---------------+-----+
| ?                                                  | samedir,      | ?   |
+----------------------------------------------------+---------------+-----+
| ?                                                  | cnp\ ``)``;   | ?   |
+----------------------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *dvp``;
``struct label               *dlabel``;
``struct vnode               *vp``;
``struct label               *label``;
``int samedir``;
``struct componentname               *cnp``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------+-------------------------------------------------------------------------+-----------+
| Parameter       | Description                                                             | Locking   |
+=================+=========================================================================+===========+
| *``cred``*      | Subject credential                                                      | ?         |
+-----------------+-------------------------------------------------------------------------+-----------+
| *``dvp``*       | Directory vnode                                                         | ?         |
+-----------------+-------------------------------------------------------------------------+-----------+
| *``dlabel``*    | Policy label associated with *``dvp``*                                  | ?         |
+-----------------+-------------------------------------------------------------------------+-----------+
| *``vp``*        | Overwritten vnode                                                       | ?         |
+-----------------+-------------------------------------------------------------------------+-----------+
| *``label``*     | Policy label associated with *``vp``*                                   | ?         |
+-----------------+-------------------------------------------------------------------------+-----------+
| *``samedir``*   | Boolean; ``1`` if the source and destination directories are the same   | ?         |
+-----------------+-------------------------------------------------------------------------+-----------+
| *``cnp``*       | Destination component name                                              | ?         |
+-----------------+-------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to rename to the vnode
*``vp``*, into the directory *``dvp``*, or to the name represented by
*``cnp``*. If there is no existing file to overwrite, *``vp``* and
*``label``* will be NULL.

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

6.7.4.43.?\ ``mpo_check_socket_listen``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+-----------------------+-----+
| ``int               mpo_check_socket_listen(``   | cred,                 | ?   |
+--------------------------------------------------+-----------------------+-----+
| ?                                                | socket,               | ?   |
+--------------------------------------------------+-----------------------+-----+
| ?                                                | socketlabel\ ``)``;   | ?   |
+--------------------------------------------------+-----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct socket               *socket``;
``struct label               *socketlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+---------------------------------+-----------+
| Parameter           | Description                     | Locking   |
+=====================+=================================+===========+
| *``cred``*          | Subject credential              | ?         |
+---------------------+---------------------------------+-----------+
| *``socket``*        | Object; socket                  | ?         |
+---------------------+---------------------------------+-----------+
| *``socketlabel``*   | Policy label for *``socket``*   | ?         |
+---------------------+---------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can listen on the passed
socket. Return 0 for success, or an ``errno`` value for failure.
Suggested failure: EACCES for label mismatch, or EPERM for lack of
privilege.

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

6.7.4.44.?\ ``mpo_check_vnode_lookup``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+---------------+-----+
| ``int               mpo_check_vnode_lookup(``   | ,             | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | ,             | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | ,             | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | cnp\ ``)``;   | ?   |
+-------------------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *dvp``;
``struct label               *dlabel``;
``struct componentname               *cnp``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+----------------------------------+-----------+
| Parameter      | Description                      | Locking   |
+================+==================================+===========+
| *``cred``*     | Subject credential               | ?         |
+----------------+----------------------------------+-----------+
| *``dvp``*      | Object; vnode                    | ?         |
+----------------+----------------------------------+-----------+
| *``dlabel``*   | Policy label for *``dvp``*       | ?         |
+----------------+----------------------------------+-----------+
| *``cnp``*      | Component name being looked up   | ?         |
+----------------+----------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can perform a lookup in the
passed directory vnode for the passed name. Return 0 for success, or an
``errno`` value for failure. Suggested failure: EACCES for label
mismatch, or EPERM for lack of privilege.

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

6.7.4.45.?\ ``mpo_check_vnode_open``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+---------------------+-----+
| ``int               mpo_check_vnode_open(``   | cred,               | ?   |
+-----------------------------------------------+---------------------+-----+
| ?                                             | vp,                 | ?   |
+-----------------------------------------------+---------------------+-----+
| ?                                             | label,              | ?   |
+-----------------------------------------------+---------------------+-----+
| ?                                             | acc\_mode\ ``)``;   | ?   |
+-----------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``int               acc_mode``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+-------------------------------------------------------------------------------------+-----------+
| Parameter        | Description                                                                         | Locking   |
+==================+=====================================================================================+===========+
| *``cred``*       | Subject credential                                                                  | ?         |
+------------------+-------------------------------------------------------------------------------------+-----------+
| *``vp``*         | Object; vnode                                                                       | ?         |
+------------------+-------------------------------------------------------------------------------------+-----------+
| *``label``*      | Policy label for *``vp``*                                                           | ?         |
+------------------+-------------------------------------------------------------------------------------+-----------+
| *``acc_mode``*   | `open(2) <http://www.FreeBSD.org/cgi/man.cgi?query=open&sektion=2>`__ access mode   | ?         |
+------------------+-------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can perform an open operation
on the passed vnode with the passed access mode. Return 0 for success,
or an errno value for failure. Suggested failure: EACCES for label
mismatch, or EPERM for lack of privilege.

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

6.7.4.46.?\ ``mpo_check_vnode_readdir``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+----------+-----+
| ``int               mpo_check_vnode_readdir(``   | ,        | ?   |
+--------------------------------------------------+----------+-----+
| ?                                                | ,        | ?   |
+--------------------------------------------------+----------+-----+
| ?                                                | ``)``;   | ?   |
+--------------------------------------------------+----------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *dvp``;
``struct label               *dlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+------------------------------+-----------+
| Parameter      | Description                  | Locking   |
+================+==============================+===========+
| *``cred``*     | Subject credential           | ?         |
+----------------+------------------------------+-----------+
| *``dvp``*      | Object; directory vnode      | ?         |
+----------------+------------------------------+-----------+
| *``dlabel``*   | Policy label for *``dvp``*   | ?         |
+----------------+------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can perform a ``readdir``
operation on the passed directory vnode. Return 0 for success, or an
``errno`` value for failure. Suggested failure: EACCES for label
mismatch, or EPERM for lack of privilege.

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

6.7.4.47.?\ ``mpo_check_vnode_readlink``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-----------------+-----+
| ``int               mpo_check_vnode_readlink(``   | cred,           | ?   |
+---------------------------------------------------+-----------------+-----+
| ?                                                 | vp,             | ?   |
+---------------------------------------------------+-----------------+-----+
| ?                                                 | label\ ``)``;   | ?   |
+---------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------+-----------+
| Parameter     | Description                 | Locking   |
+===============+=============================+===========+
| *``cred``*    | Subject credential          | ?         |
+---------------+-----------------------------+-----------+
| *``vp``*      | Object; vnode               | ?         |
+---------------+-----------------------------+-----------+
| *``label``*   | Policy label for *``vp``*   | ?         |
+---------------+-----------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can perform a ``readlink``
operation on the passed symlink vnode. Return 0 for success, or an
``errno`` value for failure. Suggested failure: EACCES for label
mismatch, or EPERM for lack of privilege. This call may be made in a
number of situations, including an explicit ``readlink`` call by the
user process, or as a result of an implicit ``readlink`` during a name
lookup by the process.

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

6.7.4.48.?\ ``mpo_check_vnode_revoke``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+-----------------+-----+
| ``int               mpo_check_vnode_revoke(``   | cred,           | ?   |
+-------------------------------------------------+-----------------+-----+
| ?                                               | vp,             | ?   |
+-------------------------------------------------+-----------------+-----+
| ?                                               | label\ ``)``;   | ?   |
+-------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------+-----------+
| Parameter     | Description                 | Locking   |
+===============+=============================+===========+
| *``cred``*    | Subject credential          | ?         |
+---------------+-----------------------------+-----------+
| *``vp``*      | Object; vnode               | ?         |
+---------------+-----------------------------+-----------+
| *``label``*   | Policy label for *``vp``*   | ?         |
+---------------+-----------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can revoke access to the passed
vnode. Return 0 for success, or an ``errno`` value for failure.
Suggested failure: EACCES for label mismatch, or EPERM for lack of
privilege.

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

6.7.4.49.?\ ``mpo_check_vnode_setacl``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-------------------------------------------------+---------------+-----+
| ``int               mpo_check_vnode_setacl(``   | cred,         | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | vp,           | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | label,        | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | type,         | ?   |
+-------------------------------------------------+---------------+-----+
| ?                                               | acl\ ``)``;   | ?   |
+-------------------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``acl_type_t               type``;
``struct acl               *acl``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------+-----------+
| Parameter     | Description                 | Locking   |
+===============+=============================+===========+
| *``cred``*    | Subject credential          | ?         |
+---------------+-----------------------------+-----------+
| *``vp``*      | Object; vnode               | ?         |
+---------------+-----------------------------+-----------+
| *``label``*   | Policy label for *``vp``*   | ?         |
+---------------+-----------------------------+-----------+
| *``type``*    | ACL type                    | ?         |
+---------------+-----------------------------+-----------+
| *``acl``*     | ACL                         | ?         |
+---------------+-----------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can set the passed ACL of
passed type on the passed vnode. Return 0 for success, or an ``errno``
value for failure. Suggested failure: EACCES for label mismatch, or
EPERM for lack of privilege.

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

6.7.4.50.?\ ``mpo_check_vnode_setextattr``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------------+------------------+-----+
| ``int               mpo_check_vnode_setextattr(``   | cred,            | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | vp,              | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | label,           | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | attrnamespace,   | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | name,            | ?   |
+-----------------------------------------------------+------------------+-----+
| ?                                                   | uio\ ``)``;      | ?   |
+-----------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``int               attrnamespace``;
``const char               *name``;
``struct uio               *uio``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| Parameter             | Description                                                                                      | Locking   |
+=======================+==================================================================================================+===========+
| *``cred``*            | Subject credential                                                                               | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``vp``*              | Object; vnode                                                                                    | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``label``*           | Policy label for *``vp``*                                                                        | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``attrnamespace``*   | Extended attribute namespace                                                                     | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``name``*            | Extended attribute name                                                                          | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+
| *``uio``*             | I/O structure pointer; see `uio(9) <http://www.FreeBSD.org/cgi/man.cgi?query=uio&sektion=9>`__   | ?         |
+-----------------------+--------------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can set the extended attribute
of passed name and passed namespace on the passed vnode. Policies
implementing security labels backed into extended attributes may want to
provide additional protections for those attributes. Additionally,
policies should avoid making decisions based on the data referenced from
*``uio``*, as there is a potential race condition between this check and
the actual operation. The *``uio``* may also be ``NULL`` if a delete
operation is being performed. Return 0 for success, or an ``errno``
value for failure. Suggested failure: EACCES for label mismatch, or
EPERM for lack of privilege.

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

6.7.4.51.?\ ``mpo_check_vnode_setflags``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-----------------+-----+
| ``int               mpo_check_vnode_setflags(``   | cred,           | ?   |
+---------------------------------------------------+-----------------+-----+
| ?                                                 | vp,             | ?   |
+---------------------------------------------------+-----------------+-----+
| ?                                                 | label,          | ?   |
+---------------------------------------------------+-----------------+-----+
| ?                                                 | flags\ ``)``;   | ?   |
+---------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``u_long flags``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                                   | Locking   |
+===============+===============================================================================================+===========+
| *``cred``*    | Subject credential                                                                            | ?         |
+---------------+-----------------------------------------------------------------------------------------------+-----------+
| *``vp``*      | Object; vnode                                                                                 | ?         |
+---------------+-----------------------------------------------------------------------------------------------+-----------+
| *``label``*   | Policy label for *``vp``*                                                                     | ?         |
+---------------+-----------------------------------------------------------------------------------------------+-----------+
| *``flags``*   | File flags; see `chflags(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=2>`__   | ?         |
+---------------+-----------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can set the passed flags on the
passed vnode. Return 0 for success, or an ``errno`` value for failure.
Suggested failure: EACCES for label mismatch, or EPERM for lack of
privilege.

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

6.7.4.52.?\ ``mpo_check_vnode_setmode``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+----------------+-----+
| ``int               mpo_check_vnode_setmode(``   | cred,          | ?   |
+--------------------------------------------------+----------------+-----+
| ?                                                | vp,            | ?   |
+--------------------------------------------------+----------------+-----+
| ?                                                | label,         | ?   |
+--------------------------------------------------+----------------+-----+
| ?                                                | mode\ ``)``;   | ?   |
+--------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``mode_t mode``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+------------------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                              | Locking   |
+===============+==========================================================================================+===========+
| *``cred``*    | Subject credential                                                                       | ?         |
+---------------+------------------------------------------------------------------------------------------+-----------+
| *``vp``*      | Object; vnode                                                                            | ?         |
+---------------+------------------------------------------------------------------------------------------+-----------+
| *``label``*   | Policy label for *``vp``*                                                                | ?         |
+---------------+------------------------------------------------------------------------------------------+-----------+
| *``mode``*    | File mode; see `chmod(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=2>`__   | ?         |
+---------------+------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can set the passed mode on the
passed vnode. Return 0 for success, or an ``errno`` value for failure.
Suggested failure: EACCES for label mismatch, or EPERM for lack of
privilege.

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

6.7.4.53.?\ ``mpo_check_vnode_setowner``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+---------------+-----+
| ``int               mpo_check_vnode_setowner(``   | cred,         | ?   |
+---------------------------------------------------+---------------+-----+
| ?                                                 | vp,           | ?   |
+---------------------------------------------------+---------------+-----+
| ?                                                 | label,        | ?   |
+---------------------------------------------------+---------------+-----+
| ?                                                 | uid,          | ?   |
+---------------------------------------------------+---------------+-----+
| ?                                                 | gid\ ``)``;   | ?   |
+---------------------------------------------------+---------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``uid_t uid``;
``gid_t gid``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------+-----------+
| Parameter     | Description                 | Locking   |
+===============+=============================+===========+
| *``cred``*    | Subject credential          | ?         |
+---------------+-----------------------------+-----------+
| *``vp``*      | Object; vnode               | ?         |
+---------------+-----------------------------+-----------+
| *``label``*   | Policy label for *``vp``*   | ?         |
+---------------+-----------------------------+-----------+
| *``uid``*     | User ID                     | ?         |
+---------------+-----------------------------+-----------+
| *``gid``*     | Group ID                    | ?         |
+---------------+-----------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can set the passed uid and
passed gid as file uid and file gid on the passed vnode. The IDs may be
set to (``-1``) to request no update. Return 0 for success, or an
``errno`` value for failure. Suggested failure: EACCES for label
mismatch, or EPERM for lack of privilege.

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

6.7.4.54.?\ ``mpo_check_vnode_setutimes``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+----------------------------------------------------+----------+-----+
| ``int               mpo_check_vnode_setutimes(``   | ,        | ?   |
+----------------------------------------------------+----------+-----+
| ?                                                  | ,        | ?   |
+----------------------------------------------------+----------+-----+
| ?                                                  | ,        | ?   |
+----------------------------------------------------+----------+-----+
| ?                                                  | ,        | ?   |
+----------------------------------------------------+----------+-----+
| ?                                                  | ``)``;   | ?   |
+----------------------------------------------------+----------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;
``struct timespec               atime``;
``struct timespec               mtime``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+----------------------------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                                        | Locking   |
+===============+====================================================================================================+===========+
| *``cred``*    | Subject credential                                                                                 | ?         |
+---------------+----------------------------------------------------------------------------------------------------+-----------+
| *``vp``*      | Object; vp                                                                                         | ?         |
+---------------+----------------------------------------------------------------------------------------------------+-----------+
| *``label``*   | Policy label for *``vp``*                                                                          | ?         |
+---------------+----------------------------------------------------------------------------------------------------+-----------+
| *``atime``*   | Access time; see `utimes(2) <http://www.FreeBSD.org/cgi/man.cgi?query=utimes&sektion=2>`__         | ?         |
+---------------+----------------------------------------------------------------------------------------------------+-----------+
| *``mtime``*   | Modification time; see `utimes(2) <http://www.FreeBSD.org/cgi/man.cgi?query=utimes&sektion=2>`__   | ?         |
+---------------+----------------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can set the passed access
timestamps on the passed vnode. Return 0 for success, or an ``errno``
value for failure. Suggested failure: EACCES for label mismatch, or
EPERM for lack of privilege.

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

6.7.4.55.?\ ``mpo_check_proc_sched``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+----------------+-----+
| ``int               mpo_check_proc_sched(``   | ucred,         | ?   |
+-----------------------------------------------+----------------+-----+
| ?                                             | proc\ ``)``;   | ?   |
+-----------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *ucred``;
``struct proc               *proc``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+----------------------+-----------+
| Parameter    | Description          | Locking   |
+==============+======================+===========+
| *``cred``*   | Subject credential   | ?         |
+--------------+----------------------+-----------+
| *``proc``*   | Object; process      | ?         |
+--------------+----------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can change the scheduling
parameters of the passed process. Return 0 for success, or an ``errno``
value for failure. Suggested failure: EACCES for label mismatch, EPERM
for lack of privilege, or ESRCH to limit visibility.

See
`setpriority(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setpriority&sektion=2>`__
for more information.

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

6.7.4.56.?\ ``mpo_check_proc_signal``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+------------------+-----+
| ``int               mpo_check_proc_signal(``   | cred,            | ?   |
+------------------------------------------------+------------------+-----+
| ?                                              | proc,            | ?   |
+------------------------------------------------+------------------+-----+
| ?                                              | signal\ ``)``;   | ?   |
+------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct proc               *proc``;
``int signal``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+-------------------------------------------------------------------------------------+-----------+
| Parameter      | Description                                                                         | Locking   |
+================+=====================================================================================+===========+
| *``cred``*     | Subject credential                                                                  | ?         |
+----------------+-------------------------------------------------------------------------------------+-----------+
| *``proc``*     | Object; process                                                                     | ?         |
+----------------+-------------------------------------------------------------------------------------+-----------+
| *``signal``*   | Signal; see `kill(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=2>`__   | ?         |
+----------------+-------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can deliver the passed signal
to the passed process. Return 0 for success, or an ``errno`` value for
failure. Suggested failure: EACCES for label mismatch, EPERM for lack of
privilege, or ESRCH to limit visibility.

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

6.7.4.57.?\ ``mpo_check_vnode_stat``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+-----------------------------------------------+-----------------+-----+
| ``int               mpo_check_vnode_stat(``   | cred,           | ?   |
+-----------------------------------------------+-----------------+-----+
| ?                                             | vp,             | ?   |
+-----------------------------------------------+-----------------+-----+
| ?                                             | label\ ``)``;   | ?   |
+-----------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *label``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+-----------------------------+-----------+
| Parameter     | Description                 | Locking   |
+===============+=============================+===========+
| *``cred``*    | Subject credential          | ?         |
+---------------+-----------------------------+-----------+
| *``vp``*      | Object; vnode               | ?         |
+---------------+-----------------------------+-----------+
| *``label``*   | Policy label for *``vp``*   | ?         |
+---------------+-----------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject credential can ``stat`` the passed vnode.
Return 0 for success, or an ``errno`` value for failure. Suggested
failure: EACCES for label mismatch, or EPERM for lack of privilege.

See
`stat(2) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=2>`__
for more information.

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

6.7.4.58.?\ ``mpo_check_ifnet_transmit``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+---------------------+-----+
| ``int               mpo_check_ifnet_transmit(``   | cred,               | ?   |
+---------------------------------------------------+---------------------+-----+
| ?                                                 | ifnet,              | ?   |
+---------------------------------------------------+---------------------+-----+
| ?                                                 | ifnetlabel,         | ?   |
+---------------------------------------------------+---------------------+-----+
| ?                                                 | mbuf,               | ?   |
+---------------------------------------------------+---------------------+-----+
| ?                                                 | mbuflabel\ ``)``;   | ?   |
+---------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct ifnet               *ifnet``;
``struct label               *ifnetlabel``;
``struct mbuf               *mbuf``;
``struct label               *mbuflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+--------------------------------+-----------+
| Parameter          | Description                    | Locking   |
+====================+================================+===========+
| *``cred``*         | Subject credential             | ?         |
+--------------------+--------------------------------+-----------+
| *``ifnet``*        | Network interface              | ?         |
+--------------------+--------------------------------+-----------+
| *``ifnetlabel``*   | Policy label for *``ifnet``*   | ?         |
+--------------------+--------------------------------+-----------+
| *``mbuf``*         | Object; mbuf to be sent        | ?         |
+--------------------+--------------------------------+-----------+
| *``mbuflabel``*    | Policy label for *``mbuf``*    | ?         |
+--------------------+--------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the network interface can transmit the passed mbuf.
Return 0 for success, or an ``errno`` value for failure. Suggested
failure: EACCES for label mismatch, or EPERM for lack of privilege.

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

6.7.4.59.?\ ``mpo_check_socket_deliver``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+---------------------+-----+
| ``int               mpo_check_socket_deliver(``   | cred,               | ?   |
+---------------------------------------------------+---------------------+-----+
| ?                                                 | ifnet,              | ?   |
+---------------------------------------------------+---------------------+-----+
| ?                                                 | ifnetlabel,         | ?   |
+---------------------------------------------------+---------------------+-----+
| ?                                                 | mbuf,               | ?   |
+---------------------------------------------------+---------------------+-----+
| ?                                                 | mbuflabel\ ``)``;   | ?   |
+---------------------------------------------------+---------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct ifnet               *ifnet``;
``struct label               *ifnetlabel``;
``struct mbuf               *mbuf``;
``struct label               *mbuflabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------+--------------------------------+-----------+
| Parameter          | Description                    | Locking   |
+====================+================================+===========+
| *``cred``*         | Subject credential             | ?         |
+--------------------+--------------------------------+-----------+
| *``ifnet``*        | Network interface              | ?         |
+--------------------+--------------------------------+-----------+
| *``ifnetlabel``*   | Policy label for *``ifnet``*   | ?         |
+--------------------+--------------------------------+-----------+
| *``mbuf``*         | Object; mbuf to be delivered   | ?         |
+--------------------+--------------------------------+-----------+
| *``mbuflabel``*    | Policy label for *``mbuf``*    | ?         |
+--------------------+--------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the socket may receive the datagram stored in the
passed mbuf header. Return 0 for success, or an ``errno`` value for
failure. Suggested failures: EACCES for label mismatch, or EPERM for
lack of privilege.

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

6.7.4.60.?\ ``mpo_check_socket_visible``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+-----------------------+-----+
| ``int               mpo_check_socket_visible(``   | cred,                 | ?   |
+---------------------------------------------------+-----------------------+-----+
| ?                                                 | so,                   | ?   |
+---------------------------------------------------+-----------------------+-----+
| ?                                                 | socketlabel\ ``)``;   | ?   |
+---------------------------------------------------+-----------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct socket               *so``;
``struct label               *socketlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------------+-----------------------------+-------------+
| Parameter           | Description                 | Locking     |
+=====================+=============================+=============+
| *``cred``*          | Subject credential          | Immutable   |
+---------------------+-----------------------------+-------------+
| *``so``*            | Object; socket              | ?           |
+---------------------+-----------------------------+-------------+
| *``socketlabel``*   | Policy label for *``so``*   | ?           |
+---------------------+-----------------------------+-------------+

.. raw:: html

   </div>

Determine whether the subject credential cred can "see" the passed
socket (*``socket``*) using system monitoring functions, such as those
employed by
`netstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=8>`__
and
`sockstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sockstat&sektion=1>`__.
Return 0 for success, or an ``errno`` value for failure. Suggested
failure: EACCES for label mismatches, EPERM for lack of privilege, or
ESRCH to hide visibility.

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

6.7.4.61.?\ ``mpo_check_system_acct``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+------------------+-----+
| ``int               mpo_check_system_acct(``   | ucred,           | ?   |
+------------------------------------------------+------------------+-----+
| ?                                              | vp,              | ?   |
+------------------------------------------------+------------------+-----+
| ?                                              | vlabel\ ``)``;   | ?   |
+------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *ucred``;
``struct vnode               *vp``;
``struct label               *vlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+------------------------------------------------------------------------------------------+-----------+
| Parameter      | Description                                                                              | Locking   |
+================+==========================================================================================+===========+
| *``ucred``*    | Subject credential                                                                       | ?         |
+----------------+------------------------------------------------------------------------------------------+-----------+
| *``vp``*       | Accounting file; `acct(5) <http://www.FreeBSD.org/cgi/man.cgi?query=acct&sektion=5>`__   | ?         |
+----------------+------------------------------------------------------------------------------------------+-----------+
| *``vlabel``*   | Label associated with *``vp``*                                                           | ?         |
+----------------+------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to enable accounting,
based on its label and the label of the accounting log file.

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

6.7.4.62.?\ ``mpo_check_system_nfsd``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+------------------------------------------------+----------------+-----+
| ``int               mpo_check_system_nfsd(``   | cred\ ``)``;   | ?   |
+------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+----------------------+-----------+
| Parameter    | Description          | Locking   |
+==============+======================+===========+
| *``cred``*   | Subject credential   | ?         |
+--------------+----------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to call
`nfssvc(2) <http://www.FreeBSD.org/cgi/man.cgi?query=nfssvc&sektion=2>`__.

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

6.7.4.63.?\ ``mpo_check_system_reboot``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+-----------------+-----+
| ``int               mpo_check_system_reboot(``   | cred,           | ?   |
+--------------------------------------------------+-----------------+-----+
| ?                                                | howto\ ``)``;   | ?   |
+--------------------------------------------------+-----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``int howto``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+---------------+--------------------------------------------------------------------------------------------------------+-----------+
| Parameter     | Description                                                                                            | Locking   |
+===============+========================================================================================================+===========+
| *``cred``*    | Subject credential                                                                                     | ?         |
+---------------+--------------------------------------------------------------------------------------------------------+-----------+
| *``howto``*   | *``howto``* parameter from `reboot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=reboot&sektion=2>`__   | ?         |
+---------------+--------------------------------------------------------------------------------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to reboot the system in
the specified manner.

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

6.7.4.64.?\ ``mpo_check_system_settime``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+---------------------------------------------------+----------------+-----+
| ``int               mpo_check_system_settime(``   | cred\ ``)``;   | ?   |
+---------------------------------------------------+----------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------+----------------------+-----------+
| Parameter    | Description          | Locking   |
+==============+======================+===========+
| *``cred``*   | Subject credential   | ?         |
+--------------+----------------------+-----------+

.. raw:: html

   </div>

Determine whether the user should be allowed to set the system clock.

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

6.7.4.65.?\ ``mpo_check_system_swapon``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+------------------+-----+
| ``int               mpo_check_system_swapon(``   | cred,            | ?   |
+--------------------------------------------------+------------------+-----+
| ?                                                | vp,              | ?   |
+--------------------------------------------------+------------------+-----+
| ?                                                | vlabel\ ``)``;   | ?   |
+--------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``struct vnode               *vp``;
``struct label               *vlabel``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------+----------------------------------+-----------+
| Parameter      | Description                      | Locking   |
+================+==================================+===========+
| *``cred``*     | Subject credential               | ?         |
+----------------+----------------------------------+-----------+
| *``vp``*       | Swap device                      | ?         |
+----------------+----------------------------------+-----------+
| *``vlabel``*   | Label associated with *``vp``*   | ?         |
+----------------+----------------------------------+-----------+

.. raw:: html

   </div>

Determine whether the subject should be allowed to add *``vp``* as a
swap device.

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

6.7.4.66.?\ ``mpo_check_system_sysctl``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="funcsynopsis">

+--------------------------------------------------+------------------+-----+
| ``int               mpo_check_system_sysctl(``   | cred,            | ?   |
+--------------------------------------------------+------------------+-----+
| ?                                                | name,            | ?   |
+--------------------------------------------------+------------------+-----+
| ?                                                | namelen,         | ?   |
+--------------------------------------------------+------------------+-----+
| ?                                                | old,             | ?   |
+--------------------------------------------------+------------------+-----+
| ?                                                | oldlenp,         | ?   |
+--------------------------------------------------+------------------+-----+
| ?                                                | inkernel,        | ?   |
+--------------------------------------------------+------------------+-----+
| ?                                                | new,             | ?   |
+--------------------------------------------------+------------------+-----+
| ?                                                | newlen\ ``)``;   | ?   |
+--------------------------------------------------+------------------+-----+

.. raw:: html

   <div class="paramdef-list">

``struct ucred               *cred``;
``int *name``;
``u_int *namelen``;
``void *old``;
``size_t               *oldlenp``;
``int inkernel``;
``void *new``;
``size_t newlen``;

.. raw:: html

   </div>

.. raw:: html

   <div class="funcprototype-spacer">

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

Parameter
Description
Locking
*``cred``*
Subject credential
?
*``name``*
See
`sysctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=3>`__
?
*``namelen``*
?
*``old``*
?
*``oldlenp``*
?
*``inkernel``*
Boolean; ``1`` if called from kernel
?
*``new``*
See
`sysctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=3>`__
?
*``newlen``*
?

.. raw:: html

   </div>

Determine whether the subject should be allowed to make the specified
`sysctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=3>`__
transaction.

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

6.7.5.?Label Management Calls
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Relabel events occur when a user process has requested that the label on
an object be modified. A two-phase update occurs: first, an access
control check will be performed to determine if the update is both valid
and permitted, and then the update itself is performed via a separate
entry point. Relabel entry points typically accept the object, object
label reference, and an update label submitted by the process. Memory
allocation during relabel is discouraged, as relabel calls are not
permitted to fail (failure should be reported earlier in the relabel
check).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------+----------------------------------------+
| `Prev <mac-policy-architecture.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-userland-arch.html>`__   |
+--------------------------------------------+-------------------------+----------------------------------------+
| 6.6.?MAC Policy Architecture?              | `Home <index.html>`__   | ?6.8.?Userland Architecture            |
+--------------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
