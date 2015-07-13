============================
3.?Configuring the cy driver
============================

.. raw:: html

   <div class="navheader">

3.?Configuring the ``cy`` driver
`Prev <sio.html>`__?
?
?\ `Next <ar01s04.html>`__

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

3.?Configuring the ``cy`` driver
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*Contributed by Alex Nash. 6 June 1996.*

The Cyclades multiport cards are based on the ``cy`` driver instead of
the usual ``sio`` driver used by other multiport cards. Configuration is
a simple matter of:

.. raw:: html

   <div class="procedure">

#. Add the ``cy`` device to your kernel configuration (note that your
   irq and iomem settings may differ).

   .. code:: programlisting

       device cy0 at isa? irq 10 iomem 0xd4000 iosiz 0x2000

#. Rebuild and install the new kernel.

#. Make the device nodes by typing (the following example assumes an
   8-port board)`:sup:`[1]` <#ftn.idp65140816>`__:

   .. code:: screen

       # cd /dev
       # for i in 0 1 2 3 4 5 6 7;do ./MAKEDEV cuac$i ttyc$i;done

#. If appropriate, add dialup entries to ``/etc/ttys`` by duplicating
   serial device (``ttyd``) entries and using ``ttyc`` in place of
   ``ttyd``. For example:

   .. code:: programlisting

       ttyc0   "/usr/libexec/getty std.38400"  unknown on insecure
       ttyc1   "/usr/libexec/getty std.38400"  unknown on insecure
       ttyc2   "/usr/libexec/getty std.38400"  unknown on insecure
       …
       ttyc7   "/usr/libexec/getty std.38400"  unknown on insecure

#. Reboot with the new kernel.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp65140816" class="footnote">

`:sup:`[1]` <#idp65140816>`__\ You can omit this part if you are running
FreeBSD?5.X with
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-------------------------------------+
| `Prev <sio.html>`__?                 | ?                       | ?\ `Next <ar01s04.html>`__          |
+--------------------------------------+-------------------------+-------------------------------------+
| 2.?Configuring the ``sio`` driver?   | `Home <index.html>`__   | ?4.?Configuring the ``si`` driver   |
+--------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
