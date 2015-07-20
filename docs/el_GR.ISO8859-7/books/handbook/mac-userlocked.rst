=====================
17.15. User Lock Down
=====================

.. raw:: html

   <div class="navheader">

17.15. User Lock Down
`????? <mac-implementing.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-troubleshoot.html>`__

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

17.15. User Lock Down
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This example considers a relatively small, fewer than fifty users,
storage system. Users would have login capabilities, and be permitted to
not only store data but access resources as well.

For this scenario, the
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
mixed with
`mac\_seeotheruids(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_seeotheruids&sektion=4>`__
could co-exist and block access not only to system objects but to hide
user processes as well.

Begin by adding the following lines to ``/boot/loader.conf``:

.. code:: programlisting

    mac_seeotheruids_enabled="YES"

The
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
security policy module may be activated through the use of the following
rc.conf variable:

.. code:: programlisting

    ugidfw_enable="YES"

Default rules stored in ``/etc/rc.bsdextended`` will be loaded at system
initialization; however, the default entries may need modification.
Since this machine is expected only to service users, everything may be
left commented out except the last two. These will force the loading of
user owned system objects by default.

Add the required users to this machine and reboot. For testing purposes,
try logging in as a different user across two consoles. Run the
``ps aux`` command to see if processes of other users are visible. Try
to run `ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__
on another users home directory, it should fail.

Do not try to test with the ``root`` user unless the specific
``sysctl``\ s have been modified to block super user access.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

When a new user is added, their
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
rule will not be in the ruleset list. To update the ruleset quickly,
simply unload the security policy module and reload it again using the
`kldunload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldunload&sektion=8>`__
and
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
utilities.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+---------------------------------------------+
| `????? <mac-implementing.html>`__?   | `???? <mac.html>`__     | ?\ `??????? <mac-troubleshoot.html>`__      |
+--------------------------------------+-------------------------+---------------------------------------------+
| 17.14. Nagios in a MAC Jail?         | `???? <index.html>`__   | ?17.16. Troubleshooting the MAC Framework   |
+--------------------------------------+-------------------------+---------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
