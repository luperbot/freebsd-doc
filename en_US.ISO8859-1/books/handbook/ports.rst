======================================================
Chapter?5.?Installing Applications: Packages and Ports
======================================================

.. raw:: html

   <div class="navheader">

Chapter?5.?Installing Applications: Packages and Ports
`Prev <basics-more-information.html>`__?
Part?I.?Getting Started
?\ `Next <ports-overview.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Chapter?5.?Installing Applications: Packages and Ports
------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`5.1. Synopsis <ports.html#ports-synopsis>`__
`5.2. Overview of Software Installation <ports-overview.html>`__
`5.3. Finding Software <ports-finding-applications.html>`__
`5.4. Using pkg for Binary Package Management <pkgng-intro.html>`__
`5.5. Using the Ports Collection <ports-using.html>`__
`5.6. Building Packages with Poudriere <ports-poudriere.html>`__
`5.7. Post-Installation Considerations <ports-nextsteps.html>`__
`5.8. Dealing with Broken Ports <ports-broken.html>`__

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

5.1.?Synopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD is bundled with a rich collection of system tools as part of the
base system. In addition, FreeBSD provides two complementary
technologies for installing third-party software: the FreeBSD Ports
Collection, for installing from source, and packages, for installing
from pre-built binaries. Either method may be used to install software
from local media or from the network.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  The difference between binary packages and ports.

-  How to find third-party software that has been ported to FreeBSD.

-  How to manage binary packages using pkg.

-  How to build third-party software from source using the Ports
   Collection.

-  How to find the files installed with the application for
   post-installation configuration.

-  What to do if a software installation fails.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+---------------------------------+-------------------------------------------+
| `Prev <basics-more-information.html>`__?   | `Up <getting-started.html>`__   | ?\ `Next <ports-overview.html>`__         |
+--------------------------------------------+---------------------------------+-------------------------------------------+
| 4.12.?Manual Pages?                        | `Home <index.html>`__           | ?5.2.?Overview of Software Installation   |
+--------------------------------------------+---------------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
