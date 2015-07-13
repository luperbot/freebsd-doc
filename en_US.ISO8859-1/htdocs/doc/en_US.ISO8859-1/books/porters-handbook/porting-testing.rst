=====================
3.4.?Testing the Port
=====================

.. raw:: html

   <div class="navheader">

3.4.?Testing the Port
`Prev <porting-checksum.html>`__?
Chapter?3.?Quick Porting
?\ `Next <porting-portlint.html>`__

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

3.4.?Testing the Port
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Make sure that the port rules do exactly what is desired, including
packaging up the port. These are the important points to verify:

.. raw:: html

   <div class="itemizedlist">

-  ``pkg-plist`` does not contain anything not installed by the port.

-  ``pkg-plist`` contains everything that is installed by the port.

-  The port can be installed using the ``install`` target. This verifies
   that the install script works correctly.

-  The port can be deinstalled properly using the ``deinstall`` target.
   This verifies that the deinstall script works correctly.

-  Make sure that ``make package`` can be run as a normal user (that is,
   not as ``root``). If that fails, ``NEED_ROOT=yes`` must be added to
   the port ``Makefile``.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedure?3.1.?Recommended Test Ordering

.. raw:: html

   </div>

#. ``make stage``

#. ``make check-orphans``

#. ``make package``

#. ``make install``

#. ``make deinstall``

#. ``pkg add         package-filename``

#. ``make package`` (as user)

.. raw:: html

   </div>

Make certain no warnings are shown in any of the stages.

Thorough automated testing can be done with
`ports-mgmt/tinderbox <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/tinderbox/pkg-descr>`__
or
`ports-mgmt/poudriere <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/poudriere/pkg-descr>`__
from the Ports Collection. These applications maintain ``jails`` where
all of the steps shown above can be tested without affecting the state
of the host system.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+---------------------------------------------+
| `Prev <porting-checksum.html>`__?   | `Up <quick-porting.html>`__   | ?\ `Next <porting-portlint.html>`__         |
+-------------------------------------+-------------------------------+---------------------------------------------+
| 3.3.?Creating the Checksum File?    | `Home <index.html>`__         | ?3.5.?Checking the Port with ``portlint``   |
+-------------------------------------+-------------------------------+---------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
