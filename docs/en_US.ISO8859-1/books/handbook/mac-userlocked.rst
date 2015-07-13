====================
16.6.?User Lock Down
====================

.. raw:: html

   <div class="navheader">

16.6.?User Lock Down
`Prev <mac-policies.html>`__?
Chapter?16.?Mandatory Access Control
?\ `Next <mac-implementing.html>`__

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

16.6.?User Lock Down
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This example considers a relatively small storage system with fewer than
fifty users. Users will have login capabilities and are permitted to
store data and access resources.

For this scenario, the
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
and
`mac\_seeotheruids(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_seeotheruids&sektion=4>`__
policy modules could co-exist and block access to system objects while
hiding user processes.

Begin by adding the following line to ``/boot/loader.conf``:

.. code:: programlisting

    mac_seeotheruids_load="YES"

The
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
security policy module may be activated by adding this line to
``/etc/rc.conf``:

.. code:: programlisting

    ugidfw_enable="YES"

Default rules stored in ``/etc/rc.bsdextended`` will be loaded at system
initialization. However, the default entries may need modification.
Since this machine is expected only to service users, everything may be
left commented out except the last two lines in order to force the
loading of user owned system objects by default.

Add the required users to this machine and reboot. For testing purposes,
try logging in as a different user across two consoles. Run ``ps aux``
to see if processes of other users are visible. Verify that running
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ on
another user's home directory fails.

Do not try to test with the ``root`` user unless the specific
``sysctl``\ s have been modified to block super user access.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When a new user is added, their
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
rule will not be in the ruleset list. To update the ruleset quickly,
unload the security policy module and reload it again using
`kldunload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldunload&sektion=8>`__
and
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+---------------------------------------+
| `Prev <mac-policies.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-implementing.html>`__   |
+---------------------------------+-------------------------+---------------------------------------+
| 16.5.?Available MAC Policies?   | `Home <index.html>`__   | ?16.7.?Nagios in a MAC Jail           |
+---------------------------------+-------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
