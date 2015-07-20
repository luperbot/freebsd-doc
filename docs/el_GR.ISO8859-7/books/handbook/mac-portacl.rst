============================
17.9. The MAC portacl Module
============================

.. raw:: html

   <div class="navheader">

17.9. The MAC portacl Module
`????? <mac-ifoff.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-partition.html>`__

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

17.9. The MAC portacl Module
----------------------------

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
module is used to limit binding to local TCP and UDP ports using a
variety of ``sysctl`` variables. In essence
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
makes it possible to allow non-\ ``root`` users to bind to specified
privileged ports, i.e. ports fewer than 1024.

Once loaded, this module will enable the MAC policy on all sockets. The
following tunables are available:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.portacl.enabled`` will enable/disable the policy
   completely.`:sup:`[10]` <#ftn.idp89377616>`__

-  ``security.mac.portacl.port_high`` will set the highest port number
   that
   `mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
   will enable protection for.

-  ``security.mac.portacl.suser_exempt`` will, when set to a non-zero
   value, exempt the ``root`` user from this policy.

-  ``security.mac.portacl.rules`` will specify the actual mac\_portacl
   policy; see below.

.. raw:: html

   </div>

The actual ``mac_portacl`` policy, as specified in the
``security.mac.portacl.rules`` sysctl, is a text string of the form:
``rule[,rule,...]`` with as many rules as needed. Each rule is of the
form: ``idtype:id:protocol:port``. The *``idtype``* parameter can be
``uid`` or ``gid`` and used to interpret the *``id``* parameter as
either a user id or group id, respectively. The *``protocol``* parameter
is used to determine if the rule should apply to TCP or UDP by setting
the parameter to ``tcp`` or ``udp``. The final *``port``* parameter is
the port number to allow the specified user or group to bind to.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

Since the ruleset is interpreted directly by the kernel only numeric
values can be used for the user ID, group ID, and port parameters. I.e.
user, group, and port service names cannot be used.

.. raw:: html

   </div>

By default, on UNIX(R)-like systems, ports fewer than 1024 can only be
used by/bound to privileged processes, i.e. those run as ``root``. For
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
to allow non-privileged processes to bind to ports below 1024 this
standard UNIX(R) restriction has to be disabled. This can be
accomplished by setting the
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
variables ``net.inet.ip.portrange.reservedlow`` and
``net.inet.ip.portrange.reservedhigh`` to zero.

See the examples below or review the
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
manual page for further information.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.9.1. Examples
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following examples should illuminate the above discussion a little
better:

.. code:: screen

    # sysctl security.mac.portacl.port_high=1023
    # sysctl net.inet.ip.portrange.reservedlow=0 net.inet.ip.portrange.reservedhigh=0

First we set
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
to cover the standard privileged ports and disable the normal UNIX(R)
bind restrictions.

.. code:: screen

    # sysctl security.mac.portacl.suser_exempt=1

The ``root`` user should not be crippled by this policy, thus set the
``security.mac.portacl.suser_exempt`` to a non-zero value. The
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
module has now been set up to behave the same way UNIX(R)-like systems
behave by default.

.. code:: screen

    # sysctl security.mac.portacl.rules=uid:80:tcp:80

Allow the user with UID 80 (normally the ``www`` user) to bind to port
80. This can be used to allow the ``www`` user to run a web server
without ever having ``root`` privilege.

.. code:: screen

    # sysctl security.mac.portacl.rules=uid:1001:tcp:110,uid:1001:tcp:995

Permit the user with the UID of 1001 to bind to the TCP ports 110
(?pop3?) and 995 (?pop3s?). This will permit this user to start a server
that accepts connections on ports 110 and 995.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp89377616" class="footnote">

`:sup:`[10]` <#idp89377616>`__\ Due to a bug the
``security.mac.portacl.enabled`` ``sysctl`` variable will not work on
FreeBSD?5.2.1 or previous releases.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+---------------------------------------+
| `????? <mac-ifoff.html>`__?   | `???? <mac.html>`__     | ?\ `??????? <mac-partition.html>`__   |
+-------------------------------+-------------------------+---------------------------------------+
| 17.8. The MAC ifoff Module?   | `???? <index.html>`__   | ?17.10. The MAC partition Module      |
+-------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
