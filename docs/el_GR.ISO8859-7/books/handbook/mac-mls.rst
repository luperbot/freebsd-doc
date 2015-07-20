==========================================
17.11. The MAC Multi-Level Security Module
==========================================

.. raw:: html

   <div class="navheader">

17.11. The MAC Multi-Level Security Module
`????? <mac-partition.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-biba.html>`__

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

17.11. The MAC Multi-Level Security Module
------------------------------------------

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

In MLS environments, a ?clearance? level is set in each subject or
objects label, along with compartments. Since these clearance or
sensibility levels can reach numbers greater than six thousand; it would
be a daunting task for any system administrator to thoroughly configure
each subject or object. Thankfully, three ?instant? labels are already
included in this policy.

These labels are ``mls/low``, ``mls/equal`` and ``mls/high``. Since
these labels are described in depth in the manual page, they will only
get a brief description here:

.. raw:: html

   <div class="itemizedlist">

-  The ``mls/low`` label contains a low configuration which permits it
   to be dominated by all other objects. Anything labeled with
   ``mls/low`` will have a low clearance level and not be permitted to
   access information of a higher level. In addition, this label will
   prevent objects of a higher clearance level from writing or passing
   information on to them.

-  The ``mls/equal`` label should be placed on objects considered to be
   exempt from the policy.

-  The ``mls/high`` label is the highest level of clearance possible.
   Objects assigned this label will hold dominance over all other
   objects in the system; however, they will not permit the leaking of
   information to objects of a lower class.

.. raw:: html

   </div>

MLS provides for:

.. raw:: html

   <div class="itemizedlist">

-  A hierarchical security level with a set of non hierarchical
   categories;

-  Fixed rules: no read up, no write down (a subject can have read
   access to objects on its own level or below, but not above.
   Similarly, a subject can have write access to objects on its own
   level or above but not beneath.);

-  Secrecy (preventing inappropriate disclosure of data);

-  Basis for the design of systems that concurrently handle data at
   multiple sensitivity levels (without leaking information between
   secret and confidential).

.. raw:: html

   </div>

The following ``sysctl`` tunables are available for the configuration of
special services and interfaces:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.mls.enabled`` is used to enable/disable the MLS
   policy.

-  ``security.mac.mls.ptys_equal`` will label all
   `pty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pty&sektion=4>`__
   devices as ``mls/equal`` during creation.

-  ``security.mac.mls.revocation_enabled`` is used to revoke access to
   objects after their label changes to a label of a lower grade.

-  ``security.mac.mls.max_compartments`` is used to set the maximum
   number of compartment levels with objects; basically the maximum
   compartment number allowed on a system.

.. raw:: html

   </div>

To manipulate the MLS labels, the
`setfmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setfmac&sektion=8>`__
command has been provided. To assign a label to an object, issue the
following command:

.. code:: screen

    # setfmac mls/5 test

To get the MLS label for the file ``test`` issue the following command:

.. code:: screen

    # getfmac test

This is a summary of the MLS policy's features. Another approach is to
create a master policy file in ``/etc`` which specifies the MLS policy
information and to feed that file into the ``setfmac`` command. This
method will be explained after all policies are covered.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.11.1. Planning Mandatory Sensitivity
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With the Multi-Level Security Policy Module, an administrator plans for
controlling the flow of sensitive information. By default, with its
block read up block write down nature, the system defaults everything to
a low state. Everything is accessible and an administrator slowly
changes this during the configuration stage; augmenting the
confidentiality of the information.

Beyond the three basic label options above, an administrator may group
users and groups as required to block the information flow between them.
It might be easier to look at the information in clearance levels
familiarized with words, for instance classifications such as
``Confidential``, ``Secret``, and ``Top Secret``. Some administrators
might just create different groups based on project levels. Regardless
of classification method, a well thought out plan must exist before
implementing such a restrictive policy.

Some example situations for this security policy module could be an
e-commerce web server, a file server holding critical company
information, and financial institution environments. The most unlikely
place would be a personal workstation with only two or three users.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+----------------------------------+
| `????? <mac-partition.html>`__?    | `???? <mac.html>`__     | ?\ `??????? <mac-biba.html>`__   |
+------------------------------------+-------------------------+----------------------------------+
| 17.10. The MAC partition Module?   | `???? <index.html>`__   | ?17.12. The MAC Biba Module      |
+------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
