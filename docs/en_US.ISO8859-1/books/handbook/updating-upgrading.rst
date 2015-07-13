==========================================
Chapter?24.?Updating and Upgrading FreeBSD
==========================================

.. raw:: html

   <div class="navheader">

Chapter?24.?Updating and Upgrading FreeBSD
`Prev <lang-setup.html>`__?
Part?III.?System Administration
?\ `Next <updating-upgrading-freebsdupdate.html>`__

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

Chapter?24.?Updating and Upgrading FreeBSD
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Restructured, reorganized, and parts updated by Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

Original work by Jordan Hubbard, Poul-Henning Kamp, John Polstra and Nik
Clayton.

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

`24.1. Synopsis <updating-upgrading.html#updating-upgrading-synopsis>`__
`24.2. FreeBSD Update <updating-upgrading-freebsdupdate.html>`__
`24.3. Updating the Documentation
Set <updating-upgrading-documentation.html>`__
`24.4. Tracking a Development Branch <current-stable.html>`__
`24.5. Synchronizing Source <synching.html>`__
`24.6. Rebuilding World <makeworld.html>`__
`24.7. Tracking for Multiple Machines <small-lan.html>`__

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

24.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD is under constant development between releases. Some people
prefer to use the officially released versions, while others prefer to
keep in sync with the latest developments. However, even official
releases are often updated with security and other critical fixes.
Regardless of the version used, FreeBSD provides all the necessary tools
to keep the system updated, and allows for easy upgrades between
versions. This chapter describes how to track the development system and
the basic tools for keeping a FreeBSD system up-to-date.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  How to keep a FreeBSD system up-to-date with freebsd-update,
   Subversion, or CTM.

-  How to compare the state of an installed system against a known
   pristine copy.

-  How to keep the installed documentation up-to-date with Subversion or
   documentation ports.

-  The difference between the two development branches: FreeBSD-STABLE
   and FreeBSD-CURRENT.

-  How to rebuild and reinstall the entire base system.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Properly set up the network connection (`Chapter?31, *Advanced
   Networking* <advanced-networking.html>`__).

-  Know how to install additional third-party software (`Chapter?5,
   *Installing Applications: Packages and Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Throughout this chapter, ``svn`` is used to obtain and update FreeBSD
sources. To use it, first install the
`devel/subversion <http://www.freebsd.org/cgi/url.cgi?ports/devel/subversion/pkg-descr>`__
port or package.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+---------------------------------------+-------------------------------------------------------+
| `Prev <lang-setup.html>`__?                          | `Up <system-administration.html>`__   | ?\ `Next <updating-upgrading-freebsdupdate.html>`__   |
+------------------------------------------------------+---------------------------------------+-------------------------------------------------------+
| 23.4.?Locale Configuration for Specific Languages?   | `Home <index.html>`__                 | ?24.2.?FreeBSD Update                                 |
+------------------------------------------------------+---------------------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
