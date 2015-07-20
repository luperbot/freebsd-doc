==========================
17.8. The MAC ifoff Module
==========================

.. raw:: html

   <div class="navheader">

17.8. The MAC ifoff Module
`????? <mac-bsdextended.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-portacl.html>`__

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

17.8. The MAC ifoff Module
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Module name: ``mac_ifoff.ko``

Kernel configuration line: ``options MAC_IFOFF``

Boot option: ``mac_ifoff_load="YES"``

The
`mac\_ifoff(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_ifoff&sektion=4>`__
module exists solely to disable network interfaces on the fly and keep
network interfaces from being brought up during the initial system boot.
It does not require any labels to be set up on the system, nor does it
have a dependency on other MAC modules.

Most of the control is done through the ``sysctl`` tunables listed
below.

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.ifoff.lo_enabled`` will enable/disable all traffic on
   the loopback
   (`lo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lo&sektion=4>`__)
   interface.

-  ``security.mac.ifoff.bpfrecv_enabled`` will enable/disable all
   traffic on the Berkeley Packet Filter interface
   (`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__)

-  ``security.mac.ifoff.other_enabled`` will enable/disable traffic on
   all other interfaces.

.. raw:: html

   </div>

One of the most common uses of
`mac\_ifoff(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_ifoff&sektion=4>`__
is network monitoring in an environment where network traffic should not
be permitted during the boot sequence. Another suggested use would be to
write a script which uses
`security/aide <http://www.freebsd.org/cgi/url.cgi?ports/security/aide/pkg-descr>`__
to automatically block network traffic if it finds new or altered files
in protected directories.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+-------------------------------------+
| `????? <mac-bsdextended.html>`__?   | `???? <mac.html>`__     | ?\ `??????? <mac-portacl.html>`__   |
+-------------------------------------+-------------------------+-------------------------------------+
| 17.7. The MAC bsdextended Module?   | `???? <index.html>`__   | ?17.9. The MAC portacl Module       |
+-------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
