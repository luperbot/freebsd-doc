==============================
17.4. Understanding MAC Labels
==============================

.. raw:: html

   <div class="navheader">

17.4. Understanding MAC Labels
`????? <mac-initial.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-planning.html>`__

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

17.4. Understanding MAC Labels
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A MAC label is a security attribute which may be applied to subjects and
objects throughout the system.

When setting a label, the user must be able to comprehend what it is,
exactly, that is being done. The attributes available on an object
depend on the policy module loaded, and that policy modules interpret
their attributes in different ways. If improperly configured due to lack
of comprehension, or the inability to understand the implications, the
result will be the unexpected and perhaps, undesired, behavior of the
system.

The security label on an object is used as a part of a security access
control decision by a policy. With some policies, the label by itself
contains all information necessary to make a decision; in other models,
the labels may be processed as part of a larger rule set, etc.

For instance, setting the label of ``biba/low`` on a file will represent
a label maintained by the Biba security policy module, with a value of
?low?.

A few policy modules which support the labeling feature in FreeBSD offer
three specific predefined labels. These are the low, high, and equal
labels. Although they enforce access control in a different manner with
each policy module, you can be sure that the low label will be the
lowest setting, the equal label will set the subject or object to be
disabled or unaffected, and the high label will enforce the highest
setting available in the Biba and MLS policy modules.

Within single label file system environments, only one label may be used
on objects. This will enforce one set of access permissions across the
entire system and in many environments may be all that is required.
There are a few cases where multiple labels may be set on objects or
subjects in the file system. For those cases, the ``multilabel`` option
may be passed to
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__.

In the case of Biba and MLS, a numeric label may be set to indicate the
precise level of hierarchical control. This numeric level is used to
partition or sort information into different groups of say,
classification only permitting access to that group or a higher group
level.

In most cases the administrator will only be setting up a single label
to use throughout the file system.

*Hey wait, this is similar to DAC! I thought MAC gave control strictly
to the administrator.* That statement still holds true, to some extent
as ``root`` is the one in control and who configures the policies so
that users are placed in the appropriate categories/access levels. Alas,
many policy modules can restrict the ``root`` user as well. Basic
control over objects will then be released to the group, but ``root``
may revoke or modify the settings at any time. This is the
hierarchal/clearance model covered by policies such as Biba and MLS.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.1. Label Configuration
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

All configuration may be done by use of the
`setfmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setfmac&sektion=8>`__
and
`setpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setpmac&sektion=8>`__
utilities. The ``setfmac`` command is used to set MAC labels on system
objects while the ``setpmac`` command is used to set the labels on
system subjects. Observe:

.. code:: screen

    # setfmac biba/high test

If no errors occurred with the command above, a prompt will be returned.
The only time these commands are not quiescent is when an error
occurred; similarly to the
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
and
`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8>`__
commands. In some cases this error may be a Permission denied and is
usually obtained when the label is being set or modified on an object
which is restricted.`:sup:`[9]` <#ftn.idp89188176>`__ The system
administrator may use the following commands to overcome this:

.. code:: screen

    # setfmac biba/high test
    Permission denied
    # setpmac biba/low setfmac biba/high test
    # getfmac test
    test: biba/high

As we see above, ``setpmac`` can be used to override the policy module's
settings by assigning a different label to the invoked process. The
``getpmac`` utility is usually used with currently running processes,
such as sendmail: although it takes a process ID in place of a command
the logic is extremely similar. If users attempt to manipulate a file
not in their access, subject to the rules of the loaded policy modules,
the Operation not permitted error will be displayed by the
``mac_set_link`` function.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.1.1. Common Label Types
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For the
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__,
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4>`__
and
`mac\_lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_lomac&sektion=4>`__
policy modules, the ability to assign simple labels is provided. These
take the form of high, equal and low, what follows is a brief
description of what these labels provide:

.. raw:: html

   <div class="itemizedlist">

-  The ``low`` label is considered the lowest label setting an object or
   subject may have. Setting this on objects or subjects will block
   their access to objects or subjects marked high.

-  The ``equal`` label should only be placed on objects considered to be
   exempt from the policy.

-  The ``high`` label grants an object or subject the highest possible
   setting.

.. raw:: html

   </div>

With respect to each policy module, each of those settings will instate
a different information flow directive. Reading the proper manual pages
will further explain the traits of these generic label configurations.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.1.1.1. Advanced Label Configuration
''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Numeric grade labels are used for
``comparison:compartment+compartment``; thus the following:

.. code:: programlisting

    biba/10:2+3+6(5:2+3-20:2+3+4+5+6)

May be interpreted as:

?Biba Policy Label?/?Grade 10? :?Compartments 2, 3 and 6?: (?grade 5
...?)

In this example, the first grade would be considered the ?effective
grade? with ?effective compartments?, the second grade is the low grade
and the last one is the high grade. In most configurations these
settings will not be used; indeed, they offered for more advanced
configurations.

When applied to system objects, they will only have a current
grade/compartments as opposed to system subjects as they reflect the
range of available rights in the system, and network interfaces, where
they are used for access control.

The grade and compartments in a subject and object pair are used to
construct a relationship referred to as ?dominance?, in which a subject
dominates an object, the object dominates the subject, neither dominates
the other, or both dominate each other. The ?both dominate? case occurs
when the two labels are equal. Due to the information flow nature of
Biba, you have rights to a set of compartments, ?need to know?, that
might correspond to projects, but objects also have a set of
compartments. Users may have to subset their rights using ``su`` or
``setpmac`` in order to access objects in a compartment from which they
are not restricted.

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

17.4.1.2. Users and Label Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Users themselves are required to have labels so that their files and
processes may properly interact with the security policy defined on the
system. This is configured through the ``login.conf`` file by use of
login classes. Every policy module that uses labels will implement the
user class setting.

An example entry containing every policy module setting is displayed
below:

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

The ``label`` option is used to set the user class default label which
will be enforced by MAC. Users will never be permitted to modify this
value, thus it can be considered not optional in the user case. In a
real configuration, however, the administrator will never wish to enable
every policy module. It is recommended that the rest of this chapter be
reviewed before any of this configuration is implemented.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Users may change their label after the initial login; however, this
change is subject constraints of the policy. The example above tells the
Biba policy that a process's minimum integrity is 5, its maximum is 15,
but the default effective label is 10. The process will run at 10 until
it chooses to change label, perhaps due to the user using the setpmac
command, which will be constrained by Biba to the range set at login.

.. raw:: html

   </div>

In all cases, after a change to ``login.conf``, the login class
capability database must be rebuilt using ``cap_mkdb`` and this will be
reflected throughout every forthcoming example or discussion.

It is useful to note that many sites may have a particularly large
number of users requiring several different user classes. In depth
planning is required as this may get extremely difficult to manage.

Future versions of FreeBSD will include a new way to deal with mapping
users to labels; however, this will not be available until some time
after FreeBSD?5.3.

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

17.4.1.3. Network Interfaces and Label Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Labels may also be set on network interfaces to help control the flow of
data across the network. In all cases they function in the same way the
policies function with respect to objects. Users at high settings in
``biba``, for example, will not be permitted to access network
interfaces with a label of low.

The ``maclabel`` may be passed to ``ifconfig`` when setting the MAC
label on network interfaces. For example:

.. code:: screen

    # ifconfig bge0 maclabel biba/equal

will set the MAC label of ``biba/equal`` on the
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4>`__
interface. When using a setting similar to ``biba/high(low-high)`` the
entire label should be quoted; otherwise an error will be returned.

Each policy module which supports labeling has a tunable which may be
used to disable the MAC label on network interfaces. Setting the label
to ``equal`` will have a similar effect. Review the output from
``sysctl``, the policy manual pages, or even the information found later
in this chapter for those tunables.

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

17.4.2. Singlelabel or Multilabel?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

By default the system will use the ``singlelabel`` option. But what does
this mean to the administrator? There are several differences which, in
their own right, offer pros and cons to the flexibility in the systems
security model.

The ``singlelabel`` only permits for one label, for instance
``biba/high`` to be used for each subject or object. It provides for
lower administration overhead but decreases the flexibility of policies
which support labeling. Many administrators may want to use the
``multilabel`` option in their security policy.

The ``multilabel`` option will permit each subject or object to have its
own independent MAC label in place of the standard ``singlelabel``
option which will allow only one label throughout the partition. The
``multilabel`` and ``single`` label options are only required for the
policies which implement the labeling feature, including the Biba,
Lomac, MLS and SEBSD policies.

In many cases, the ``multilabel`` may not need to be set at all.
Consider the following situation and security model:

.. raw:: html

   <div class="itemizedlist">

-  FreeBSD web-server using the MAC framework and a mix of the various
   policies.

-  This machine only requires one label, ``biba/high``, for everything
   in the system. Here the file system would not require the
   ``multilabel`` option as a single label will always be in effect.

-  But, this machine will be a web server and should have the web server
   run at ``biba/low`` to prevent write up capabilities. The Biba policy
   and how it works will be discussed later, so if the previous comment
   was difficult to interpret just continue reading and return. The
   server could use a separate partition set at ``biba/low`` for most if
   not all of its runtime state. Much is lacking from this example, for
   instance the restrictions on data, configuration and user settings;
   however, this is just a quick example to prove the aforementioned
   point.

.. raw:: html

   </div>

If any of the non-labeling policies are to be used, then the
``multilabel`` option would never be required. These include the
``seeotheruids``, ``portacl`` and ``partition`` policies.

It should also be noted that using ``multilabel`` with a partition and
establishing a security model based on ``multilabel`` functionality
could open the doors for higher administrative overhead as everything in
the file system would have a label. This includes directories, files,
and even device nodes.

The following command will set ``multilabel`` on the file systems to
have multiple labels. This may only be done in single user mode:

.. code:: screen

    # tunefs -l enable /

This is not a requirement for the swap file system.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Some users have experienced problems with setting the ``multilabel``
flag on the root partition. If this is the case, please review the
`??????17.16, ?Troubleshooting the MAC
Framework? <mac-troubleshoot.html>`__ of this chapter.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp89188176" class="footnote">

`:sup:`[9]` <#idp89188176>`__\ Other conditions may produce different
failures. For instance, the file may not be owned by the user attempting
to relabel the object, the object may not exist or may be read only. A
mandatory policy will not allow the process to relabel the file, maybe
because of a property of the file, a property of the process, or a
property of the proposed new label value. For example: a user running at
low integrity tries to change the label of a high integrity file. Or
perhaps a user running at low integrity tries to change the label of a
low integrity file to a high integrity label.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+----------------------------------------------+
| `????? <mac-initial.html>`__?   | `???? <mac.html>`__     | ?\ `??????? <mac-planning.html>`__           |
+---------------------------------+-------------------------+----------------------------------------------+
| 17.3. Explanation of MAC?       | `???? <index.html>`__   | ?17.5. Planning the Security Configuration   |
+---------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
