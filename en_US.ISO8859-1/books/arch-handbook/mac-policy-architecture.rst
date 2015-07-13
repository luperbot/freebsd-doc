============================
6.6.?MAC Policy Architecture
============================

.. raw:: html

   <div class="navheader">

6.6.?MAC Policy Architecture
`Prev <mac-framework-kernel-arch.html>`__?
Chapter?6.?The TrustedBSD MAC Framework
?\ `Next <mac-entry-point-reference.html>`__

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

6.6.?MAC Policy Architecture
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Security policies are either linked directly into the kernel, or
compiled into loadable kernel modules that may be loaded at boot, or
dynamically using the module loading system calls at runtime. Policy
modules interact with the system through a set of declared entry points,
providing access to a stream of system events and permitting the policy
to influence access control decisions. Each policy contains a number of
elements:

.. raw:: html

   <div class="itemizedlist">

-  Optional configuration parameters for policy.

-  Centralized implementation of the policy logic and parameters.

-  Optional implementation of policy life cycle events, such as
   initialization and destruction.

-  Optional support for initializing, maintaining, and destroying labels
   on selected kernel objects.

-  Optional support for user process inspection and modification of
   labels on selected objects.

-  Implementation of selected access control entry points that are of
   interest to the policy.

-  Declaration of policy identity, module entry points, and policy
   properties.

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

6.6.1.?Policy Declaration
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modules may be declared using the ``MAC_POLICY_SET()`` macro, which
names the policy, provides a reference to the MAC entry point vector,
provides load-time flags determining how the policy framework should
handle the policy, and optionally requests the allocation of label state
by the framework.

.. code:: programlisting

    static struct mac_policy_ops mac_policy_ops =
    {
            .mpo_destroy = mac_policy_destroy,
            .mpo_init = mac_policy_init,
            .mpo_init_bpfdesc_label = mac_policy_init_bpfdesc_label,
            .mpo_init_cred_label = mac_policy_init_label,
    /* ... */
            .mpo_check_vnode_setutimes = mac_policy_check_vnode_setutimes,
            .mpo_check_vnode_stat = mac_policy_check_vnode_stat,
            .mpo_check_vnode_write = mac_policy_check_vnode_write,
    };

The MAC policy entry point vector, ``mac_policy``\ \_ops in this
example, associates functions defined in the module with specific entry
points. A complete listing of available entry points and their
prototypes may be found in the MAC entry point reference section. Of
specific interest during module registration are the .mpo\_destroy and
.mpo\_init entry points. .mpo\_init will be invoked once a policy is
successfully registered with the module framework but prior to any other
entry points becoming active. This permits the policy to perform any
policy-specific allocation and initialization, such as initialization of
any data or locks. .mpo\_destroy will be invoked when a policy module is
unloaded to permit releasing of any allocated memory and destruction of
locks. Currently, these two entry points are invoked with the MAC policy
list mutex held to prevent any other entry points from being invoked:
this will be changed, but in the mean time, policies should be careful
about what kernel primitives they invoke so as to avoid lock ordering or
sleeping problems.

The policy declaration's module name field exists so that the module may
be uniquely identified for the purposes of module dependencies. An
appropriate string should be selected. The full string name of the
policy is displayed to the user via the kernel log during load and
unload events, and also exported when providing status information to
userland processes.

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

6.6.2.?Policy Flags
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The policy declaration flags field permits the module to provide the
framework with information about its capabilities at the time the module
is loaded. Currently, three flags are defined:

.. raw:: html

   <div class="variablelist">

MPC\_LOADTIME\_FLAG\_UNLOADOK
    This flag indicates that the policy module may be unloaded. If this
    flag is not provided, then the policy framework will reject requests
    to unload the module. This flag might be used by modules that
    allocate label state and are unable to free that state at runtime.

MPC\_LOADTIME\_FLAG\_NOTLATE
    This flag indicates that the policy module must be loaded and
    initialized early in the boot process. If the flag is specified,
    attempts to register the module following boot will be rejected. The
    flag may be used by policies that require pervasive labeling of all
    system objects, and cannot handle objects that have not been
    properly initialized by the policy.

MPC\_LOADTIME\_FLAG\_LABELMBUFS
    This flag indicates that the policy module requires labeling of
    Mbufs, and that memory should always be allocated for the storage of
    Mbuf labels. By default, the MAC Framework will not allocate label
    storage for Mbufs unless at least one loaded policy has this flag
    set. This measurably improves network performance when policies do
    not require Mbuf labeling. A kernel option,
    ``MAC_ALWAYS_LABEL_MBUF``, exists to force the MAC Framework to
    allocate Mbuf label storage regardless of the setting of this flag,
    and may be useful in some environments.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Policies using the ``MPC_LOADTIME_FLAG_LABELMBUFS`` without the
``MPC_LOADTIME_FLAG_NOTLATE`` flag set must be able to correctly handle
``NULL`` Mbuf label pointers passed into entry points. This is necessary
as in-flight Mbufs without label storage may persist after a policy
enabling Mbuf labeling has been loaded. If a policy is loaded before the
network subsystem is active (i.e., the policy is not being loaded late),
then all Mbufs are guaranteed to have label storage.

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

6.6.3.?Policy Entry Points
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Four classes of entry points are offered to policies registered with the
framework: entry points associated with the registration and management
of policies, entry points denoting initialization, creation,
destruction, and other life cycle events for kernel objects, events
associated with access control decisions that the policy module may
influence, and calls associated with the management of labels on
objects. In addition, a ``mac_syscall()`` entry point is provided so
that policies may extend the kernel interface without registering new
system calls.

Policy module writers should be aware of the kernel locking strategy, as
well as what object locks are available during which entry points.
Writers should attempt to avoid deadlock scenarios by avoiding grabbing
non-leaf locks inside of entry points, and also follow the locking
protocol for object access and modification. In particular, writers
should be aware that while necessary locks to access objects and their
labels are generally held, sufficient locks to modify an object or its
label may not be present for all entry points. Locking information for
arguments is documented in the MAC framework entry point document.

Policy entry points will pass a reference to the object label along with
the object itself. This permits labeled policies to be unaware of the
internals of the object yet still make decisions based on the label. The
exception to this is the process credential, which is assumed to be
understood by policies as a first class security object in the kernel.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+------------------------------------------------+
| `Prev <mac-framework-kernel-arch.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-entry-point-reference.html>`__   |
+----------------------------------------------+-------------------------+------------------------------------------------+
| 6.5.?MAC Framework Kernel Architecture?      | `Home <index.html>`__   | ?6.7.?MAC Policy Entry Point Reference         |
+----------------------------------------------+-------------------------+------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
