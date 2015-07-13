============================
16.5.?Available MAC Policies
============================

.. raw:: html

   <div class="navheader">

16.5.?Available MAC Policies
`Prev <mac-planning.html>`__?
Chapter?16.?Mandatory Access Control
?\ `Next <mac-userlocked.html>`__

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

16.5.?Available MAC Policies
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beginning with FreeBSD?8.0, the default FreeBSD kernel includes
``options MAC``. This means that every module included with the MAC
framework can be loaded with ``kldload`` as a run-time kernel module.
After testing the module, add the module name to ``/boot/loader.conf``
so that it will load during boot. Each module also provides a kernel
option for those administrators who choose to compile their own custom
kernel.

FreeBSD includes a group of policies that will cover most security
requirements. Each policy is summarized below. The last three policies
support integer settings in place of the three default labels.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

16.5.1.?The MAC See Other UIDs Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_seeotheruids.ko``

Kernel configuration line: ``options MAC_SEEOTHERUIDS``

Boot option: ``mac_seeotheruids_load="YES"``

The
`mac\_seeotheruids(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_seeotheruids&sektion=4>`__
module extends the ``security.bsd.see_other_uids`` and
``security.bsd.see_other_gids`` ``sysctl`` tunables. This option does
not require any labels to be set before configuration and can operate
transparently with other modules.

After loading the module, the following ``sysctl`` tunables may be used
to control its features:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.seeotheruids.enabled`` enables the module and
   implements the default settings which deny users the ability to view
   processes and sockets owned by other users.

-  ``security.mac.seeotheruids.specificgid_enabled`` allows specified
   groups to be exempt from this policy. To exempt specific groups, use
   the ``security.mac.seeotheruids.specificgid=XXX`` ``sysctl`` tunable,
   replacing *``XXX``* with the numeric group ID to be exempted.

-  ``security.mac.seeotheruids.primarygroup_enabled`` is used to exempt
   specific primary groups from this policy. When using this tunable,
   ``security.mac.seeotheruids.specificgid_enabled`` may not be set.

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

16.5.2.?The MAC BSD Extended Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_bsdextended.ko``

Kernel configuration line: ``options MAC_BSDEXTENDED``

Boot option: ``mac_bsdextended_load="YES"``

The
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
module enforces a file system firewall. It provides an extension to the
standard file system permissions model, permitting an administrator to
create a firewall-like ruleset to protect files, utilities, and
directories in the file system hierarchy. When access to a file system
object is attempted, the list of rules is iterated until either a
matching rule is located or the end is reached. This behavior may be
changed using ``security.mac.bsdextended.firstmatch_enabled``. Similar
to other firewall modules in FreeBSD, a file containing the access
control rules can be created and read by the system at boot time using
an
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
variable.

The rule list may be entered using
`ugidfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ugidfw&sektion=8>`__
which has a syntax similar to
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__.
More tools can be written by using the functions in the
`libugidfw(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libugidfw&sektion=3>`__
library.

After the
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
module has been loaded, the following command may be used to list the
current rule configuration:

.. code:: screen

    # ugidfw list
    0 slots, 0 rules

By default, no rules are defined and everything is completely
accessible. To create a rule which blocks all access by users but leaves
``root`` unaffected:

.. code:: screen

    # ugidfw add subject not uid root new object not uid root mode n

While this rule is simple to implement, it is a very bad idea as it
blocks all users from issuing any commands. A more realistic example
blocks ``user1`` all access, including directory listings, to
``user2``'s home directory:

.. code:: screen

    # ugidfw set 2 subject uid user1 object uid user2 mode n
    # ugidfw set 3 subject uid user1 object gid user2 mode n

Instead of ``user1``, ``not       uid user2`` could be used in order to
enforce the same access restrictions for all users. However, the
``root`` user is unaffected by these rules.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Extreme caution should be taken when working with this module as
incorrect use could block access to certain parts of the file system.

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

16.5.3.?The MAC Interface Silencing Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_ifoff.ko``

Kernel configuration line: ``options       MAC_IFOFF``

Boot option: ``mac_ifoff_load="YES"``

The
`mac\_ifoff(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_ifoff&sektion=4>`__
module is used to disable network interfaces on the fly and to keep
network interfaces from being brought up during system boot. It does not
use labels and does not depend on any other MAC modules.

Most of this module's control is performed through these ``sysctl``
tunables:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.ifoff.lo_enabled`` enables or disables all traffic on
   the loopback,
   `lo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lo&sektion=4>`__,
   interface.

-  ``security.mac.ifoff.bpfrecv_enabled`` enables or disables all
   traffic on the Berkeley Packet Filter interface,
   `bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__.

-  ``security.mac.ifoff.other_enabled`` enables or disables traffic on
   all other interfaces.

.. raw:: html

   </div>

One of the most common uses of
`mac\_ifoff(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_ifoff&sektion=4>`__
is network monitoring in an environment where network traffic should not
be permitted during the boot sequence. Another use would be to write a
script which uses an application such as
`security/aide <http://www.freebsd.org/cgi/url.cgi?ports/security/aide/pkg-descr>`__
to automatically block network traffic if it finds new or altered files
in protected directories.

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

16.5.4.?The MAC Port Access Control List Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_portacl.ko``

Kernel configuration line: ``MAC_PORTACL``

Boot option: ``mac_portacl_load="YES"``

The
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
module is used to limit binding to local TCP and UDP ports, making it
possible to allow non-\ ``root`` users to bind to specified privileged
ports below 1024.

Once loaded, this module enables the MAC policy on all sockets. The
following tunables are available:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.portacl.enabled`` enables or disables the policy
   completely.

-  ``security.mac.portacl.port_high`` sets the highest port number that
   `mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
   protects.

-  ``security.mac.portacl.suser_exempt``, when set to a non-zero value,
   exempts the ``root`` user from this policy.

-  ``security.mac.portacl.rules`` specifies the policy as a text string
   of the form ``rule[,rule,...]``, with as many rules as needed, and
   where each rule is of the form ``idtype:id:protocol:port``. The
   *``idtype``* is either ``uid`` or ``gid``. The *``protocol``*
   parameter can be ``tcp`` or ``udp``. The *``port``* parameter is the
   port number to allow the specified user or group to bind to. Only
   numeric values can be used for the user ID, group ID, and port
   parameters.

.. raw:: html

   </div>

By default, ports below 1024 can only be used by privileged processes
which run as ``root``. For
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
to allow non-privileged processes to bind to ports below 1024, set the
following tunables as follows:

.. code:: screen

    # sysctl security.mac.portacl.port_high=1023
    # sysctl net.inet.ip.portrange.reservedlow=0
    # sysctl net.inet.ip.portrange.reservedhigh=0

To prevent the ``root`` user from being affected by this policy, set
``security.mac.portacl.suser_exempt`` to a non-zero value.

.. code:: screen

    # sysctl security.mac.portacl.suser_exempt=1

To allow the ``www`` user with UID 80 to bind to port 80 without ever
needing ``root`` privilege:

.. code:: screen

    # sysctl security.mac.portacl.rules=uid:80:tcp:80

This next example permits the user with the UID of 1001 to bind to TCP
ports 110 (POP3) and 995 (POP3s):

.. code:: screen

    # sysctl security.mac.portacl.rules=uid:1001:tcp:110,uid:1001:tcp:995

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

16.5.5.?The MAC Partition Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_partition.ko``

Kernel configuration line: ``options MAC_PARTITION``

Boot option: ``mac_partition_load="YES"``

The
`mac\_partition(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_partition&sektion=4>`__
policy drops processes into specific “partitions” based on their MAC
label. Most configuration for this policy is done using
`setpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setpmac&sektion=8>`__.
One ``sysctl`` tunable is available for this policy:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.partition.enabled`` enables the enforcement of MAC
   process partitions.

.. raw:: html

   </div>

When this policy is enabled, users will only be permitted to see their
processes, and any others within their partition, but will not be
permitted to work with utilities outside the scope of this partition.
For instance, a user in the ``insecure`` class will not be permitted to
access ``top`` as well as many other commands that must spawn a process.

This example adds ``top`` to the label set on users in the ``insecure``
class. All processes spawned by users in the ``insecure`` class will
stay in the ``partition/13`` label.

.. code:: screen

    # setpmac partition/13 top

This command displays the partition label and the process list:

.. code:: screen

    # ps Zax

This command displays another user's process partition label and that
user's currently running processes:

.. code:: screen

    # ps -ZU trhodes

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Users can see processes in ``root``'s label unless the
`mac\_seeotheruids(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_seeotheruids&sektion=4>`__
policy is loaded.

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

16.5.6.?The MAC Multi-Level Security Module
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_mls.ko``

Kernel configuration line: ``options MAC_MLS``

Boot option: ``mac_mls_load="YES"``

The
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4>`__
policy controls access between subjects and objects in the system by
enforcing a strict information flow policy.

In MLS environments, a “clearance” level is set in the label of each
subject or object, along with compartments. Since these clearance levels
can reach numbers greater than several thousand, it would be a daunting
task to thoroughly configure every subject or object. To ease this
administrative overhead, three labels are included in this policy:
``mls/low``, ``mls/equal``, and ``mls/high``, where:

.. raw:: html

   <div class="itemizedlist">

-  Anything labeled with ``mls/low`` will have a low clearance level and
   not be permitted to access information of a higher level. This label
   also prevents objects of a higher clearance level from writing or
   passing information to a lower level.

-  ``mls/equal`` should be placed on objects which should be exempt from
   the policy.

-  ``mls/high`` is the highest level of clearance possible. Objects
   assigned this label will hold dominance over all other objects in the
   system; however, they will not permit the leaking of information to
   objects of a lower class.

.. raw:: html

   </div>

MLS provides:

.. raw:: html

   <div class="itemizedlist">

-  A hierarchical security level with a set of non-hierarchical
   categories.

-  Fixed rules of ``no read up, no write           down``. This means
   that a subject can have read access to objects on its own level or
   below, but not above. Similarly, a subject can have write access to
   objects on its own level or above, but not beneath.

-  Secrecy, or the prevention of inappropriate disclosure of data.

-  A basis for the design of systems that concurrently handle data at
   multiple sensitivity levels without leaking information between
   secret and confidential.

.. raw:: html

   </div>

The following ``sysctl`` tunables are available:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.mls.enabled`` is used to enable or disable the MLS
   policy.

-  ``security.mac.mls.ptys_equal`` labels all
   `pty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pty&sektion=4>`__
   devices as ``mls/equal`` during creation.

-  ``security.mac.mls.revocation_enabled`` revokes access to objects
   after their label changes to a label of a lower grade.

-  ``security.mac.mls.max_compartments`` sets the maximum number of
   compartment levels allowed on a system.

.. raw:: html

   </div>

To manipulate MLS labels, use
`setfmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setfmac&sektion=8>`__.
To assign a label to an object:

.. code:: screen

    # setfmac mls/5 test

To get the MLS label for the file ``test``:

.. code:: screen

    # getfmac test

Another approach is to create a master policy file in ``/etc/`` which
specifies the MLS policy information and to feed that file to
``setfmac``.

When using the MLS policy module, an administrator plans to control the
flow of sensitive information. The default
``block read up block write       down`` sets everything to a low state.
Everything is accessible and an administrator slowly augments the
confidentiality of the information.

Beyond the three basic label options, an administrator may group users
and groups as required to block the information flow between them. It
might be easier to look at the information in clearance levels using
descriptive words, such as classifications of ``Confidential``,
``Secret``, and ``Top Secret``. Some administrators instead create
different groups based on project levels. Regardless of the
classification method, a well thought out plan must exist before
implementing a restrictive policy.

Some example situations for the MLS policy module include an e-commerce
web server, a file server holding critical company information, and
financial institution environments.

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

16.5.7.?The MAC Biba Module
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_biba.ko``

Kernel configuration line: ``options       MAC_BIBA``

Boot option: ``mac_biba_load="YES"``

The
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
module loads the MAC Biba policy. This policy is similar to the MLS
policy with the exception that the rules for information flow are
slightly reversed. This is to prevent the downward flow of sensitive
information whereas the MLS policy prevents the upward flow of sensitive
information.

In Biba environments, an “integrity” label is set on each subject or
object. These labels are made up of hierarchical grades and
non-hierarchical components. As a grade ascends, so does its integrity.

Supported labels are ``biba/low``, ``biba/equal``, and ``biba/high``,
where:

.. raw:: html

   <div class="itemizedlist">

-  ``biba/low`` is considered the lowest integrity an object or subject
   may have. Setting this on objects or subjects blocks their write
   access to objects or subjects marked as ``biba/high``, but will not
   prevent read access.

-  ``biba/equal`` should only be placed on objects considered to be
   exempt from the policy.

-  ``biba/high`` permits writing to objects set at a lower label, but
   does not permit reading that object. It is recommended that this
   label be placed on objects that affect the integrity of the entire
   system.

.. raw:: html

   </div>

Biba provides:

.. raw:: html

   <div class="itemizedlist">

-  Hierarchical integrity levels with a set of non-hierarchical
   integrity categories.

-  Fixed rules are ``no write up, no read           down``, the opposite
   of MLS. A subject can have write access to objects on its own level
   or below, but not above. Similarly, a subject can have read access to
   objects on its own level or above, but not below.

-  Integrity by preventing inappropriate modification of data.

-  Integrity levels instead of MLS sensitivity levels.

.. raw:: html

   </div>

The following tunables can be used to manipulate the Biba policy:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.biba.enabled`` is used to enable or disable
   enforcement of the Biba policy on the target machine.

-  ``security.mac.biba.ptys_equal`` is used to disable the Biba policy
   on
   `pty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pty&sektion=4>`__
   devices.

-  ``security.mac.biba.revocation_enabled`` forces the revocation of
   access to objects if the label is changed to dominate the subject.

.. raw:: html

   </div>

To access the Biba policy setting on system objects, use ``setfmac`` and
``getfmac``:

.. code:: screen

    # setfmac biba/low test
    # getfmac test
    test: biba/low

Integrity, which is different from sensitivity, is used to guarantee
that information is not manipulated by untrusted parties. This includes
information passed between subjects and objects. It ensures that users
will only be able to modify or access information they have been given
explicit access to. The
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
security policy module permits an administrator to configure which files
and programs a user may see and invoke while assuring that the programs
and files are trusted by the system for that user.

During the initial planning phase, an administrator must be prepared to
partition users into grades, levels, and areas. The system will default
to a high label once this policy module is enabled, and it is up to the
administrator to configure the different grades and levels for users.
Instead of using clearance levels, a good planning method could include
topics. For instance, only allow developers modification access to the
source code repository, source code compiler, and other development
utilities. Other users would be grouped into other categories such as
testers, designers, or end users and would only be permitted read
access.

A lower integrity subject is unable to write to a higher integrity
subject and a higher integrity subject cannot list or read a lower
integrity object. Setting a label at the lowest possible grade could
make it inaccessible to subjects. Some prospective environments for this
security policy module would include a constrained web server, a
development and test machine, and a source code repository. A less
useful implementation would be a personal workstation, a machine used as
a router, or a network firewall.

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

16.5.8.?The MAC Low-watermark Module
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_lomac.ko``

Kernel configuration line: ``options       MAC_LOMAC``

Boot option: ``mac_lomac_load="YES"``

Unlike the MAC Biba policy, the
`mac\_lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_lomac&sektion=4>`__
policy permits access to lower integrity objects only after decreasing
the integrity level to not disrupt any integrity rules.

The Low-watermark integrity policy works almost identically to Biba,
with the exception of using floating labels to support subject demotion
via an auxiliary grade compartment. This secondary compartment takes the
form ``[auxgrade]``. When assigning a policy with an auxiliary grade,
use the syntax ``lomac/10[2]``, where ``2`` is the auxiliary grade.

This policy relies on the ubiquitous labeling of all system objects with
integrity labels, permitting subjects to read from low integrity objects
and then downgrading the label on the subject to prevent future writes
to high integrity objects using ``[auxgrade]``. The policy may provide
greater compatibility and require less initial configuration than Biba.

Like the Biba and MLS policies, ``setfmac`` and ``setpmac`` are used to
place labels on system objects:

.. code:: screen

    # setfmac /usr/home/trhodes lomac/high[low]
    # getfmac /usr/home/trhodes lomac/high[low]

The auxiliary grade ``low`` is a feature provided only by the MAC LOMAC
policy.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+-------------------------------------+
| `Prev <mac-planning.html>`__?                | `Up <mac.html>`__       | ?\ `Next <mac-userlocked.html>`__   |
+----------------------------------------------+-------------------------+-------------------------------------+
| 16.4.?Planning the Security Configuration?   | `Home <index.html>`__   | ?16.6.?User Lock Down               |
+----------------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
