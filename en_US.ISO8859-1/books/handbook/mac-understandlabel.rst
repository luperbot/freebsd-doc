==============================
16.3.?Understanding MAC Labels
==============================

.. raw:: html

   <div class="navheader">

16.3.?Understanding MAC Labels
`Prev <mac-inline-glossary.html>`__?
Chapter?16.?Mandatory Access Control
?\ `Next <mac-planning.html>`__

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

16.3.?Understanding MAC Labels
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A MAC label is a security attribute which may be applied to subjects and
objects throughout the system. When setting a label, the administrator
must understand its implications in order to prevent unexpected or
undesired behavior of the system. The attributes available on an object
depend on the loaded policy module, as policy modules interpret their
attributes in different ways.

The security label on an object is used as a part of a security access
control decision by a policy. With some policies, the label contains all
of the information necessary to make a decision. In other policies, the
labels may be processed as part of a larger rule set.

There are two types of label policies: single label and multi label. By
default, the system will use single label. The administrator should be
aware of the pros and cons of each in order to implement policies which
meet the requirements of the system's security model.

A single label security policy only permits one label to be used for
every subject or object. Since a single label policy enforces one set of
access permissions across the entire system, it provides lower
administration overhead, but decreases the flexibility of policies which
support labeling. However, in many environments, a single label policy
may be all that is required.

A single label policy is somewhat similar to DAC as ``root`` configures
the policies so that users are placed in the appropriate categories and
access levels. A notable difference is that many policy modules can also
restrict ``root``. Basic control over objects will then be released to
the group, but ``root`` may revoke or modify the settings at any time.

When appropriate, a multi label policy can be set on a UFS file system
by passing ``multilabel`` to
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__.
A multi label policy permits each subject or object to have its own
independent MAC label. The decision to use a multi label or single label
policy is only required for policies which implement the labeling
feature, such as ``biba``, ``lomac``, and ``mls``. Some policies, such
as ``seeotheruids``, ``portacl`` and ``partition``, do not use labels at
all.

Using a multi label policy on a partition and establishing a multi label
security model can increase administrative overhead as everything in
that file system has a label. This includes directories, files, and even
device nodes.

The following command will set ``multilabel`` on the specified UFS file
system. This may only be done in single-user mode and is not a
requirement for the swap file system:

.. code:: screen

    # tunefs -l enable /

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Some users have experienced problems with setting the ``multilabel``
flag on the root partition. If this is the case, please review
`Section?16.8, “Troubleshooting the MAC
Framework” <mac-troubleshoot.html>`__.

.. raw:: html

   </div>

Since the multi label policy is set on a per-file system basis, a multi
label policy may not be needed if the file system layout is well
designed. Consider an example security MAC model for a FreeBSD web
server. This machine uses the single label, ``biba/high``, for
everything in the default file systems. If the web server needs to run
at ``biba/low`` to prevent write up capabilities, it could be installed
to a separate UFS ``/usr/local`` file system set at ``biba/low``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

16.3.1.?Label Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Virtually all aspects of label policy module configuration will be
performed using the base system utilities. These commands provide a
simple interface for object or subject configuration or the manipulation
and verification of the configuration.

All configuration may be done using ``setfmac``, which is used to set
MAC labels on system objects, and ``setpmac``, which is used to set the
labels on system subjects. For example, to set the ``biba`` MAC label to
``high`` on ``test``:

.. code:: screen

    # setfmac biba/high test

If the configuration is successful, the prompt will be returned without
error. A common error is Permission denied which usually occurs when the
label is being set or modified on a restricted object. Other conditions
may produce different failures. For instance, the file may not be owned
by the user attempting to relabel the object, the object may not exist,
or the object may be read-only. A mandatory policy will not allow the
process to relabel the file, maybe because of a property of the file, a
property of the process, or a property of the proposed new label value.
For example, if a user running at low integrity tries to change the
label of a high integrity file, or a user running at low integrity tries
to change the label of a low integrity file to a high integrity label,
these operations will fail.

The system administrator may use ``setpmac`` to override the policy
module's settings by assigning a different label to the invoked process:

.. code:: screen

    # setfmac biba/high test
    Permission denied
    # setpmac biba/low setfmac biba/high test
    # getfmac test
    test: biba/high

For currently running processes, such as sendmail, ``getpmac`` is
usually used instead. This command takes a process ID (PID) in place of
a command name. If users attempt to manipulate a file not in their
access, subject to the rules of the loaded policy modules, the Operation
not permitted error will be displayed.

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

16.3.2.?Predefined Labels
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A few FreeBSD policy modules which support the labeling feature offer
three predefined labels: ``low``, ``equal``, and ``high``, where:

.. raw:: html

   <div class="itemizedlist">

-  ``low`` is considered the lowest label setting an object or subject
   may have. Setting this on objects or subjects blocks their access to
   objects or subjects marked high.

-  ``equal`` sets the subject or object to be disabled or unaffected and
   should only be placed on objects considered to be exempt from the
   policy.

-  ``high`` grants an object or subject the highest setting available in
   the Biba and MLS policy modules.

.. raw:: html

   </div>

Such policy modules include
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__,
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4>`__
and
`mac\_lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_lomac&sektion=4>`__.
Each of the predefined labels establishes a different information flow
directive. Refer to the manual page of the module to determine the
traits of the generic label configurations.

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

16.3.3.?Numeric Labels
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Biba and MLS policy modules support a numeric label which may be set
to indicate the precise level of hierarchical control. This numeric
level is used to partition or sort information into different groups of
classification, only permitting access to that group or a higher group
level. For example:

.. code:: programlisting

    biba/10:2+3+6(5:2+3-20:2+3+4+5+6)

may be interpreted as “Biba Policy Label/Grade 10:Compartments 2, 3 and
6: (grade 5 ...”)

In this example, the first grade would be considered the effective grade
with effective compartments, the second grade is the low grade, and the
last one is the high grade. In most configurations, such fine-grained
settings are not needed as they are considered to be advanced
configurations.

System objects only have a current grade and compartment. System
subjects reflect the range of available rights in the system, and
network interfaces, where they are used for access control.

The grade and compartments in a subject and object pair are used to
construct a relationship known as *dominance*, in which a subject
dominates an object, the object dominates the subject, neither dominates
the other, or both dominate each other. The “both dominate” case occurs
when the two labels are equal. Due to the information flow nature of
Biba, a user has rights to a set of compartments that might correspond
to projects, but objects also have a set of compartments. Users may have
to subset their rights using ``su`` or ``setpmac`` in order to access
objects in a compartment from which they are not restricted.

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

16.3.4.?User Labels
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Users are required to have labels so that their files and processes
properly interact with the security policy defined on the system. This
is configured in ``/etc/login.conf`` using login classes. Every policy
module that uses labels will implement the user class setting.

To set the user class default label which will be enforced by MAC, add a
``label`` entry. An example ``label`` entry containing every policy
module is displayed below. Note that in a real configuration, the
administrator would never enable every policy module. It is recommended
that the rest of this chapter be reviewed before any configuration is
implemented.

.. code:: programlisting

    default:\
        :copyright=/etc/COPYRIGHT:\
        :welcome=/etc/motd:\
        :setenv=MAIL=/var/mail/$,BLOCKSIZE=K:\
        :path=~/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:\
        :manpath=/usr/share/man /usr/local/man:\
        :nologin=/usr/sbin/nologin:\
        :cputime=1h30m:\
        :datasize=8M:\
        :vmemoryuse=100M:\
        :stacksize=2M:\
        :memorylocked=4M:\
        :memoryuse=8M:\
        :filesize=8M:\
        :coredumpsize=8M:\
        :openfiles=24:\
        :maxproc=32:\
        :priority=0:\
        :requirehome:\
        :passwordtime=91d:\
        :umask=022:\
        :ignoretime@:\
        :label=partition/13,mls/5,biba/10(5-15),lomac/10[2]:

While users can not modify the default value, they may change their
label after they login, subject to the constraints of the policy. The
example above tells the Biba policy that a process's minimum integrity
is ``5``, its maximum is ``15``, and the default effective label is
``10``. The process will run at ``10`` until it chooses to change label,
perhaps due to the user using ``setpmac``, which will be constrained by
Biba to the configured range.

After any change to ``login.conf``, the login class capability database
must be rebuilt using ``cap_mkdb``.

Many sites have a large number of users requiring several different user
classes. In depth planning is required as this can become difficult to
manage.

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

16.3.5.?Network Interface Labels
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Labels may be set on network interfaces to help control the flow of data
across the network. Policies using network interface labels function in
the same way that policies function with respect to objects. Users at
high settings in Biba, for example, will not be permitted to access
network interfaces with a label of ``low``.

When setting the MAC label on network interfaces, ``maclabel`` may be
passed to ``ifconfig``:

.. code:: screen

    # ifconfig bge0 maclabel biba/equal

This example will set the MAC label of ``biba/equal`` on the ``bge0``
interface. When using a setting similar to ``biba/high(low-high)``, the
entire label should be quoted to prevent an error from being returned.

Each policy module which supports labeling has a tunable which may be
used to disable the MAC label on network interfaces. Setting the label
to ``equal`` will have a similar effect. Review the output of
``sysctl``, the policy manual pages, and the information in the rest of
this chapter for more information on those tunables.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------+----------------------------------------------+
| `Prev <mac-inline-glossary.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-planning.html>`__              |
+----------------------------------------+-------------------------+----------------------------------------------+
| 16.2.?Key Terms?                       | `Home <index.html>`__   | ?16.4.?Planning the Security Configuration   |
+----------------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
