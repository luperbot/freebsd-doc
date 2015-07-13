=============================
6.27.?Adding Users and Groups
=============================

.. raw:: html

   <div class="navheader">

6.27.?Adding Users and Groups
`Prev <rc-scripts.html>`__?
Chapter?6.?Special Considerations
?\ `Next <requiring-kernel-sources.html>`__

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

6.27.?Adding Users and Groups
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some ports require a particular user account to be present, usually for
daemons that run as that user. For these ports, choose a *unique* UID
from 50 to 999 and register it in ``ports/UIDs`` (for users) and
``ports/GIDs`` (for groups). The unique identification should be the
same for users and groups.

Please include a patch against these two files when requiring a new user
or group to be created for the port.

Then use ``USERS`` and ``GROUPS`` in ``Makefile``, and the user will be
automatically created when installing the port.

.. code:: programlisting

    USERS= pulse
    GROUPS= pulse pulse-access pulse-rt

The current list of reserved UIDs and GIDs can be found in
``ports/UIDs`` and ``ports/GIDs``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------------+-------------------------+-----------------------------------------------+
| `Prev <rc-scripts.html>`__?                              | `Up <special.html>`__   | ?\ `Next <requiring-kernel-sources.html>`__   |
+----------------------------------------------------------+-------------------------+-----------------------------------------------+
| 6.26.?Starting and Stopping Services (``rc`` Scripts)?   | `Home <index.html>`__   | ?6.28.?Ports That Rely on Kernel Sources      |
+----------------------------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
