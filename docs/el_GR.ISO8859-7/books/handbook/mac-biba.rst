==========================
17.12. The MAC Biba Module
==========================

.. raw:: html

   <div class="navheader">

17.12. The MAC Biba Module
`????? <mac-mls.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-lomac.html>`__

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

17.12. The MAC Biba Module
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_biba.ko``

Kernel configuration line: ``options MAC_BIBA``

Boot option: ``mac_biba_load="YES"``

The
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
module loads the MAC Biba policy. This policy works much like that of
the MLS policy with the exception that the rules for information flow
are slightly reversed. This is said to prevent the downward flow of
sensitive information whereas the MLS policy prevents the upward flow of
sensitive information; thus, much of this section can apply to both
policies.

In Biba environments, an ?integrity? label is set on each subject or
object. These labels are made up of hierarchal grades, and
non-hierarchal components. As an object's or subject's grade ascends, so
does its integrity.

Supported labels are ``biba/low``, ``biba/equal``, and ``biba/high``; as
explained below:

.. raw:: html

   <div class="itemizedlist">

-  The ``biba/low`` label is considered the lowest integrity an object
   or subject may have. Setting this on objects or subjects will block
   their write access to objects or subjects marked high. They still
   have read access though.

-  The ``biba/equal`` label should only be placed on objects considered
   to be exempt from the policy.

-  The ``biba/high`` label will permit writing to objects set at a lower
   label, but not permit reading that object. It is recommended that
   this label be placed on objects that affect the integrity of the
   entire system.

.. raw:: html

   </div>

Biba provides for:

.. raw:: html

   <div class="itemizedlist">

-  Hierarchical integrity level with a set of non hierarchical integrity
   categories;

-  Fixed rules: no write up, no read down (opposite of MLS). A subject
   can have write access to objects on its own level or below, but not
   above. Similarly, a subject can have read access to objects on its
   own level or above, but not below;

-  Integrity (preventing inappropriate modification of data);

-  Integrity levels (instead of MLS sensitivity levels).

.. raw:: html

   </div>

The following ``sysctl`` tunables can be used to manipulate the Biba
policy.

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.biba.enabled`` may be used to enable/disable
   enforcement of the Biba policy on the target machine.

-  ``security.mac.biba.ptys_equal`` may be used to disable the Biba
   policy on
   `pty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pty&sektion=4>`__
   devices.

-  ``security.mac.biba.revocation_enabled`` will force the revocation of
   access to objects if the label is changed to dominate the subject.

.. raw:: html

   </div>

To access the Biba policy setting on system objects, use the ``setfmac``
and ``getfmac`` commands:

.. code:: screen

    # setfmac biba/low test
    # getfmac test
    test: biba/low

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.12.1. Planning Mandatory Integrity
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Integrity, different from sensitivity, guarantees that the information
will never be manipulated by untrusted parties. This includes
information passed between subjects, objects, and both. It ensures that
users will only be able to modify and in some cases even access
information they explicitly need to.

The
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
security policy module permits an administrator to address which files
and programs a user or users may see and invoke while assuring that the
programs and files are free from threats and trusted by the system for
that user, or group of users.

During the initial planning phase, an administrator must be prepared to
partition users into grades, levels, and areas. Users will be blocked
access not only to data but programs and utilities both before and after
they start. The system will default to a high label once this policy
module is enabled, and it is up to the administrator to configure the
different grades and levels for users. Instead of using clearance levels
as described above, a good planning method could include topics. For
instance, only allow developers modification access to the source code
repository, source code compiler, and other development utilities. While
other users would be grouped into other categories such as testers,
designers, or just ordinary users and would only be permitted read
access.

With its natural security control, a lower integrity subject is unable
to write to a higher integrity subject; a higher integrity subject
cannot observe or read a lower integrity object. Setting a label at the
lowest possible grade could make it inaccessible to subjects. Some
prospective environments for this security policy module would include a
constrained web server, development and test machine, and source code
repository. A less useful implementation would be a personal
workstation, a machine used as a router, or a network firewall.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------+-----------------------------------+
| `????? <mac-mls.html>`__?                     | `???? <mac.html>`__     | ?\ `??????? <mac-lomac.html>`__   |
+-----------------------------------------------+-------------------------+-----------------------------------+
| 17.11. The MAC Multi-Level Security Module?   | `???? <index.html>`__   | ?17.13. The MAC LOMAC Module      |
+-----------------------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
