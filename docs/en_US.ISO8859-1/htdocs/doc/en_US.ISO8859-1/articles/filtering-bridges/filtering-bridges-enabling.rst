======================
4.?Enabling the Bridge
======================

.. raw:: html

   <div class="navheader">

4.?Enabling the Bridge
`Prev <filtering-bridges-finalprep.html>`__?
?
?\ `Next <filtering-bridges-ipfirewall.html>`__

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

4.?Enabling the Bridge
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

At this point, to enable the bridge, you have to execute the following
commands (having the shrewdness to replace the names of the two network
interfaces ``fxp0`` and ``xl0`` with your own ones):

.. code:: screen

    # sysctl net.link.ether.bridge.config=fxp0:0,xl0:0
    # sysctl net.link.ether.bridge.ipfw=1
    # sysctl net.link.ether.bridge.enable=1

The first row specifies which interfaces should be activated by the
bridge, the second one will enable the firewall on the bridge and
finally the third one will enable the bridge.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

If you have FreeBSD?5.1-RELEASE or previous the sysctl variables are
spelled differently. See
`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4>`__
for details.

.. raw:: html

   </div>

At this point you should be able to insert the machine between two sets
of hosts without compromising any communication abilities between them.
If so, the next step is to add the
``net.link.ether.bridge.[blah]``\ =\ *``[blah]``* portions of these rows
to the ``/etc/sysctl.conf`` file, in order to have them execute at
startup.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+-------------------------+---------------------------------------------------+
| `Prev <filtering-bridges-finalprep.html>`__?   | ?                       | ?\ `Next <filtering-bridges-ipfirewall.html>`__   |
+------------------------------------------------+-------------------------+---------------------------------------------------+
| 3.?Final Preparation?                          | `Home <index.html>`__   | ?5.?Configuring The Firewall                      |
+------------------------------------------------+-------------------------+---------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
