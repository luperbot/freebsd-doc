========================
17.3. Explanation of MAC
========================

.. raw:: html

   <div class="navheader">

17.3. Explanation of MAC
`????? <mac-inline-glossary.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-understandlabel.html>`__

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

17.3. Explanation of MAC
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With all of these new terms in mind, consider how the MAC framework
augments the security of the system as a whole. The various security
policy modules provided by the MAC framework could be used to protect
the network and file systems, block users from accessing certain ports
and sockets, and more. Perhaps the best use of the policy modules is to
blend them together, by loading several security policy modules at a
time for a multi-layered security environment. In a multi-layered
security environment, multiple policy modules are in effect to keep
security in check. This is different to a hardening policy, which
typically hardens elements of a system that is used only for specific
purposes. The only downside is administrative overhead in cases of
multiple file system labels, setting network access control user by
user, etc.

These downsides are minimal when compared to the lasting effect of the
framework; for instance, the ability to pick and choose which policies
are required for a specific configuration keeps performance overhead
down. The reduction of support for unneeded policies can increase the
overall performance of the system as well as offer flexibility of
choice. A good implementation would consider the overall security
requirements and effectively implement the various security policy
modules offered by the framework.

Thus a system utilizing MAC features should at least guarantee that a
user will not be permitted to change security attributes at will; all
user utilities, programs and scripts must work within the constraints of
the access rules provided by the selected security policy modules; and
that total control of the MAC access rules are in the hands of the
system administrator.

It is the sole duty of the system administrator to carefully select the
correct security policy modules. Some environments may need to limit
access control over the network; in these cases, the
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__,
`mac\_ifoff(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_ifoff&sektion=4>`__
and even
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
policy modules might make good starting points. In other cases, strict
confidentiality of file system objects might be required. Policy modules
such as
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
and
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4>`__
exist for this purpose.

Policy decisions could be made based on network configuration. Perhaps
only certain users should be permitted access to facilities provided by
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ to
access the network or the Internet. The
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
would be the policy module of choice for these situations. But what
should be done in the case of file systems? Should all access to certain
directories be severed from other groups or specific users? Or should we
limit user or utility access to specific files by setting certain
objects as classified?

In the file system case, access to objects might be considered
confidential to some users, but not to others. For an example, a large
development team might be broken off into smaller groups of individuals.
Developers in project A might not be permitted to access objects written
by developers in project B. Yet they might need to access objects
created by developers in project C; that is quite a situation indeed.
Using the different security policy modules provided by the MAC
framework; users could be divided into these groups and then given
access to the appropriate areas without fear of information leakage.

Thus, each security policy module has a unique way of dealing with the
overall security of a system. Module selection should be based on a well
thought out security policy. In many cases, the overall policy may need
to be revised and reimplemented on the system. Understanding the
different security policy modules offered by the MAC framework will help
administrators choose the best policies for their situations.

The default FreeBSD kernel does not include the option for the MAC
framework; thus the following kernel option must be added before trying
any of the examples or information in this chapter:

.. code:: programlisting

    options   MAC

And the kernel will require a rebuild and a reinstall.

.. raw:: html

   <div class="caution" xmlns="">

???????:
~~~~~~~~

While the various manual pages for MAC policy modules state that they
may be built into the kernel, it is possible to lock the system out of
the network and more. Implementing MAC is much like implementing a
firewall, care must be taken to prevent being completely locked out of
the system. The ability to revert back to a previous configuration
should be considered while the implementation of MAC remotely should be
done with extreme caution.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+---------------------------------------------+
| `????? <mac-inline-glossary.html>`__?   | `???? <mac.html>`__     | ?\ `??????? <mac-understandlabel.html>`__   |
+-----------------------------------------+-------------------------+---------------------------------------------+
| 17.2. Key Terms in this Chapter?        | `???? <index.html>`__   | ?17.4. Understanding MAC Labels             |
+-----------------------------------------+-------------------------+---------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
