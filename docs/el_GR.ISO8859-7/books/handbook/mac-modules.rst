==========================
17.6. Module Configuration
==========================

.. raw:: html

   <div class="navheader">

17.6. Module Configuration
`????? <mac-planning.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-bsdextended.html>`__

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

17.6. Module Configuration
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Every module included with the MAC framework may be either compiled into
the kernel as noted above or loaded as a run-time kernel module. The
recommended method is to add the module name to the
``/boot/loader.conf`` file so that it will load during the initial boot
operation.

The following sections will discuss the various MAC modules and cover
their features. Implementing them into a specific environment will also
be a consideration of this chapter. Some modules support the use of
labeling, which is controlling access by enforcing a label such as ?this
is allowed and this is not?. A label configuration file may control how
files may be accessed, network communication can be exchanged, and more.
The previous section showed how the ``multilabel`` flag could be set on
file systems to enable per-file or per-partition access control.

A single label configuration would enforce only one label across the
system, that is why the ``tunefs`` option is called ``multilabel``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.6.1. The MAC seeotheruids Module
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
module mimics and extends the ``security.bsd.see_other_uids`` and
``security.bsd.see_other_gids`` ``sysctl`` tunables. This option does
not require any labels to be set before configuration and can operate
transparently with the other modules.

After loading the module, the following ``sysctl`` tunables may be used
to control the features:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.seeotheruids.enabled`` will enable the module's
   features and use the default settings. These default settings will
   deny users the ability to view processes and sockets owned by other
   users.

-  ``security.mac.seeotheruids.specificgid_enabled`` will allow a
   certain group to be exempt from this policy. To exempt specific
   groups from this policy, use the
   ``security.mac.seeotheruids.specificgid=XXX`` ``sysctl`` tunable. In
   the above example, the *``XXX``* should be replaced with the numeric
   group ID to be exempted.

-  ``security.mac.seeotheruids.primarygroup_enabled`` is used to exempt
   specific primary groups from this policy. When using this tunable,
   the ``security.mac.seeotheruids.specificgid_enabled`` may not be set.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+-----------------------------------------+
| `????? <mac-planning.html>`__?               | `???? <mac.html>`__     | ?\ `??????? <mac-bsdextended.html>`__   |
+----------------------------------------------+-------------------------+-----------------------------------------+
| 17.5. Planning the Security Configuration?   | `???? <index.html>`__   | ?17.7. The MAC bsdextended Module       |
+----------------------------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
