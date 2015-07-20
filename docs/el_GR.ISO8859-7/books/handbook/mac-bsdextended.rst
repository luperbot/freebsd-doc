================================
17.7. The MAC bsdextended Module
================================

.. raw:: html

   <div class="navheader">

17.7. The MAC bsdextended Module
`????? <mac-modules.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-ifoff.html>`__

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

17.7. The MAC bsdextended Module
--------------------------------

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
module enforces the file system firewall. This module's policy provides
an extension to the standard file system permissions model, permitting
an administrator to create a firewall-like ruleset to protect files,
utilities, and directories in the file system hierarchy. When access to
a file system object is attempted, the list of rules is iterated until
either a matching rule is located or the end is reached. This behavior
may be changed by the use of a
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
parameter, security.mac.bsdextended.firstmatch\_enabled. Similar to
other firewall modules in FreeBSD, a file containing access control
rules can be created and read by the system at boot time using an
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
variable.

The rule list may be entered using a utility,
`ugidfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ugidfw&sektion=8>`__,
that has a syntax similar to that of
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__.
More tools can be written by using the functions in the
`libugidfw(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libugidfw&sektion=3>`__
library.

Extreme caution should be taken when working with this module; incorrect
use could block access to certain parts of the file system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.7.1. Examples
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After the
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
module has been loaded, the following command may be used to list the
current rule configuration:

.. code:: screen

    # ugidfw list
    0 slots, 0 rules

As expected, there are no rules defined. This means that everything is
still completely accessible. To create a rule which will block all
access by users but leave ``root`` unaffected, simply run the following
command:

.. code:: screen

    # ugidfw add subject not uid root new object not uid root mode n

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

In releases prior to FreeBSD?5.3, the *``add``* parameter did not exist.
In those cases the *``set``* should be used instead. See below for a
command example.

.. raw:: html

   </div>

This is a very bad idea as it will block all users from issuing even the
most simple commands, such as ``ls``. A more patriotic list of rules
might be:

.. code:: screen

    # ugidfw set 2 subject uid user1 object uid user2 mode n
    # ugidfw set 3 subject uid user1 object gid user2 mode n

This will block any and all access, including directory listings, to
``user2``'s home directory from the username ``user1``.

In place of ``user1``, the ``not uid user2`` could be passed. This will
enforce the same access restrictions above for all users in place of
just one user.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

The ``root`` user will be unaffected by these changes.

.. raw:: html

   </div>

This should provide a general idea of how the
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
module may be used to help fortify a file system. For more information,
see the
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
and the
`ugidfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ugidfw&sektion=8>`__
manual pages.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+-----------------------------------+
| `????? <mac-modules.html>`__?   | `???? <mac.html>`__     | ?\ `??????? <mac-ifoff.html>`__   |
+---------------------------------+-------------------------+-----------------------------------+
| 17.6. Module Configuration?     | `???? <index.html>`__   | ?17.8. The MAC ifoff Module       |
+---------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
