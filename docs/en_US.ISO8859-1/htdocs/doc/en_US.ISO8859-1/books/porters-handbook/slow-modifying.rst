=======================
4.3.?Modifying the Port
=======================

.. raw:: html

   <div class="navheader">

4.3.?Modifying the Port
`Prev <slow-sources.html>`__?
Chapter?4.?Slow Porting
?\ `Next <slow-patch.html>`__

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

4.3.?Modifying the Port
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unpack a copy of the tarball in a private directory and make whatever
changes are necessary to get the port to compile properly under the
current version of FreeBSD. Keep *careful track* of steps, as they will
be needed to automate the process shortly. Everything, including the
deletion, addition, or modification of files has to be doable using an
automated script or patch file when the port is finished.

If the port requires significant user interaction/customization to
compile or install, take a look at one of Larry Wall's classic Configure
scripts and perhaps do something similar. The goal of the new ports
collection is to make each port as “plug-and-play” as possible for the
end-user while using a minimum of disk space.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Unless explicitly stated, patch files, scripts, and other files created
and contributed to the FreeBSD ports collection are assumed to be
covered by the standard BSD copyright conditions.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+------------------------------+---------------------------------+
| `Prev <slow-sources.html>`__?        | `Up <slow-porting.html>`__   | ?\ `Next <slow-patch.html>`__   |
+--------------------------------------+------------------------------+---------------------------------+
| 4.2.?Getting the Original Sources?   | `Home <index.html>`__        | ?4.4.?Patching                  |
+--------------------------------------+------------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
