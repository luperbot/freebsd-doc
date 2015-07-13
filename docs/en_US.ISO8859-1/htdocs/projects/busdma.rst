==================================================
FreeBSD busdma and SMPng driver conversion project
==================================================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Header And Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

.. raw:: html

   <div class="frontdonateroundbox">

.. raw:: html

   <div class="frontdonatetop">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatecontent">

`Donate to FreeBSD <https://www.FreeBSDFoundation.org/donate/>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="frontdonatebot">

.. raw:: html

   <div>

**.**

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Peripheral Links
----------------

.. raw:: html

   <div id="searchnav">

.. raw:: html

   </div>

.. raw:: html

   <div id="search">

Search
------

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Site Navigation
---------------

.. raw:: html

   <div id="menu">

-  `Home <../../>`__

-  `About <../../about.html>`__

   -  `Introduction <../../projects/newbies.html>`__
   -  `Features <../../features.html>`__
   -  `Advocacy <../../advocacy/>`__
   -  `Marketing <../../marketing/>`__
   -  `Privacy Policy <../../privacy.html>`__

-  `Get FreeBSD <../../where.html>`__

   -  `Release Information <../../releases/>`__
   -  `Release Engineering <../../releng/>`__

-  `Documentation <../../docs.html>`__

   -  `FAQ <../../doc/en_US.ISO8859-1/books/faq/>`__
   -  `Handbook <../../doc/en_US.ISO8859-1/books/handbook/>`__
   -  `Porter's
      Handbook <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
   -  `Developer's
      Handbook <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
   -  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
   -  `Documentation Project
      Primer <../../doc/en_US.ISO8859-1/books/fdp-primer>`__
   -  `All Books and Articles <../../docs/books.html>`__

-  `Community <../../community.html>`__

   -  `Mailing Lists <../../community/mailinglists.html>`__
   -  `Forums <https://forums.FreeBSD.org>`__
   -  `User Groups <../../usergroups.html>`__
   -  `Events <../../events/events.html>`__
   -  `Q&A
      (external) <http://serverfault.com/questions/tagged/freebsd>`__

-  `Developers <../../projects/index.html>`__

   -  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN Repository <https://svnweb.FreeBSD.org>`__
   -  `Perforce Repository <http://p4web.FreeBSD.org>`__

-  `Support <../../support.html>`__

   -  `Vendors <../../commercial/commercial.html>`__
   -  `Security Information <../../security/>`__
   -  `Bug Reports <https://bugs.FreeBSD.org/search/>`__
   -  `Submitting Bug Reports <https://www.FreeBSD.org/support.html>`__

-  `Foundation <https://www.freebsdfoundation.org/>`__

   -  `Monetary Donations <https://www.freebsdfoundation.org/donate/>`__
   -  `Hardware Donations <../../donations/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `Developers <../../projects/index.html>`__
-  `Developer's
   Handbook <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
-  `Porter's
   Handbook <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
-  `Source code repositories <../../developers/cvs.html>`__
-  `Release Engineering <../../releng/index.html>`__
-  `Platforms <../../platforms/>`__
-  `Project Ideas <https://wiki.FreeBSD.org/IdeasPage>`__
-  `Contributing <../../doc/en_US.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD busdma and SMPng driver conversion project
==================================================

Contents
--------

-  `Project Goal <#goal>`__
-  `Resources and Links <#resources>`__
-  `Platform Support Status <#platform-status>`__
-  `Network Interface Driver Status <#ifnet-status>`__
-  `Storage Device Driver Status <#storage-status>`__
-  `Miscellaneous Device Driver Status <#misc-status>`__
-  `Documentation Status <#doc-status>`__

Project Goal
------------

**busdma**

The busdma interfaces permit hardware device drivers to operate on a
variety of platforms avoiding the encoding of platform-specific access
methods into drivers. This lowers the maintenance costs for drivers
across platforms, and improves the chances that a driver will "just
work" on a new platform. Modifying a driver to make use of busdma is
relatively straight forward, but does require familiarity with both the
device driver and busdma primitives. For busdma to be used in FreeBSD,
two sets of changes are generally required: adaptation of the busdma
implementation to run on all platforms, and adaptation of drivers to use
the framework. As such, status information on this project is broken
down into platform support, and driver support (sorted by category).
Completing this work requires a thorough audit of the system device
drivers, then prioritized conversion of drivers. Drivers are also
expected to use bus\_space functions, and this column is sometimes used
to denote a driver in need of conversion to bus\_space as well.

**INTR\_MPSAFE**

Hardware drivers register their interrupt handler with the
``bus_setup_intr()`` function. Setting the flag ``INTR_MPSAFE`` tells
the system interrupt code to call the interrupt routine without holding
the Giant mutex. This can give a significant performance gain on SMP
systems.

Drivers can set this flag even if they are not fully locked down as long
as their interrupt routine is careful about not touching other data
structures in the driver. An easy way to do this is to check and clear
the hardware interrupt status registers and then schedule the interrupt
processing for a taskqueue or kernel thread.

**SMPng locked**

Drivers should employ mutexes and sx locks to protect their data
structures and hardware registers from competing threads. Mutex
operations are somewhat expensive, so a good strategy is combine as many
atomic operations into a single mutex acquisition as possible.

**p!=a safety**

Intel PAE support requires that pointers and physical address
representations be of differing sizes. This means that drivers must be
written to use vm\_paddr\_t or bus\_addr\_t rather than assuming that
physical addresses can be represented using a void \*. In addition,
format strings and casts must be carefully handled.

The task list below is not intended to be complete, but does represent a
set of relevant and/or important components of the overall work. The
"Responsible" field identifies a developer who has expressed willingness
to be responsible for completing the identified task; this doesn't
preclude others working on it, but suggests that coordination with the
responsible party might be appropriate so as to avoid unnecessary
duplication of work, and to maximize forward progress. If beginning work
on a new area of substantial size, or one that appears unclaimed, it may
be worth dropping an e-mail to Maxime Henrion to see if any progress has
been made.

The definition of the date field varies depending on the status of a
task. For completed tasks, it refers to the date completed or reported
completed. For in-progress tasks, it refers to the date of the last
update of the entry. For stalled tasks, it refers to the date that the
task was declared stalled. For new tasks, it refers to the date the task
was added to the list.

Tasks are sorted first by status, then by date.

Resources and Links
-------------------

A series of manual pages related to this project can be found here:

-  Physical Address Extensions -
   `pae(4) <//www.FreeBSD.org/cgi/man.cgi?query=pae&sektion=4&arch=i386>`__
-  Bus and Machine-independent DMA Mapping Interface -
   `bus\_dma(9) <//www.FreeBSD.org/cgi/man.cgi?query=busdma&sektion=9>`__
-  Machine-dependent part of the Virtual Memory (VM) system -
   `pmap(9) <//www.FreeBSD.org/cgi/man.cgi?query=pmap&sektion=9>`__
-  Resource Management Functions -
   `rman(9) <//www.FreeBSD.org/cgi/man.cgi?query=rman&sektion=9>`__

Platform Support Status
-----------------------

+-----------+--------------------+---------------------+----------+-------------------------------------------------------------------+
| Task      | Responsible        | Last updated        | Status   | Details                                                           |
+===========+====================+=====================+==========+===================================================================+
| amd64     | Peter Wemm         | July 1, 2003        | Done     | Fully supported.                                                  |
+-----------+--------------------+---------------------+----------+-------------------------------------------------------------------+
| arm       | Olivier Houchard   | December 23, 2005   | Done     | Fully supported.                                                  |
+-----------+--------------------+---------------------+----------+-------------------------------------------------------------------+
| ia64      | Marcel Moolenaar   | December 10, 2002   | Done     | There may be problems for systems with large amounts of memory.   |
+-----------+--------------------+---------------------+----------+-------------------------------------------------------------------+
| i386      | Sam Leffler        | December 9, 2002    | Done     | Fully supported.                                                  |
+-----------+--------------------+---------------------+----------+-------------------------------------------------------------------+
| powerpc   | Peter Grehan       | January 15, 2003    | Done     | Fully supported.                                                  |
+-----------+--------------------+---------------------+----------+-------------------------------------------------------------------+
| sparc64   | Thomas M?stl       | January 6, 2003     | Done     | Fully supported.                                                  |
+-----------+--------------------+---------------------+----------+-------------------------------------------------------------------+

Network Interface Driver Status
-------------------------------

+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| Driver     | Responsible                   | Last updated         | busdma          | INTR\_MPSAFE   | SMPng locked   | a!=p            | Notes                                                                 |
+============+===============================+======================+=================+================+================+=================+=======================================================================+
| if\_an     | ?                             | December 23, 2005    | Unknown         | Unknown        | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ar     | ?                             | ?                    | Not done        | Not done       | Not done       | Not done        | kvtop()                                                               |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_arl    | ?                             | August 27, 2006      | Unknown         | Unknown        | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ath    | ?                             | August 27, 2006      | Unknown         | Unknown        | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_aue    | ?                             | September 3, 2006    | N/A             | Not done       | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_awi    | ?                             | August 27, 2006      | Unknown         | Unknown        | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_axe    | ?                             | September 3, 2006    | N/A             | Not done       | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_bce    | ?                             | August 25, 2006      | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_bfe    | Mike Silbersack               | August 23, 2006      | Done            | In progress    | In progress    | In progress     | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_bge    | Bill Paul                     | April 13, 2004       | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_cdce   | ?                             | September 3, 2006    | N/A             | Not done       | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_cnw    | ?                             | August 27, 2006      | Unknown         | Unknown        | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_cp     | Roman Kurakin                 | October 31, 2005     | Done            | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_cs     | Warner Losh                   | December 23, 2005    | Not done        | Not done       | Not done       | Unknown         | Needs bus\_space conversion                                           |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ct     | Roman Kurakin                 | October 31, 2005     | Done            | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_cue    | ?                             | September 3, 2006    | N/A             | Not done       | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_cx     | Roman Kurakin                 | June 24, 2004        | Done            | In progress    | In progress    | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_dc     | Maxime Henrion                | August 19, 2005      | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_de     | Maxime Henrion                | August 17, 2005      | Done            | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ed     | Warner Losh                   | December 23, 2005    | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_em     | Prafulla S. Deuskar           | April 13, 2004       | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_en     | Hartmut Brandt                | November 2, 2005     | Done            | Not done       | Not done       | Done            | Locking present; not yet marked INTR\_MPSAFE?                         |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ep     | Matthew N. Dodd,Warner Losh   | April 13, 2004       | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ex     | Warner Losh                   | Dcember 23, 2005     | Done            | Not done       | Not done       | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_fatm   | Hartmut Brandt                | November 2, 2005     | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_fwe    | ?                             | ?                    | Not done        | Not done       | Not done       | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_fxp    | Maxime Henrion                | April 13, 2004       | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_gem    | Thomas M?stl                  | July 31, 2005        | Done            | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_hatm   | Hartmut Brandt                | November 2, 2005     | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_hme    | Thomas M?stl                  | January 30, 2005     | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_idt    | ?                             | ?                    | Not done        | Not done       | Not done       | Not done        | vtophys()                                                             |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ipw    | ?                             | August 27, 2006      | Unknown         | Unknown        | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_iwi    | ?                             | August 27, 2006      | Unknown         | Unknown        | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ixgb   | ?                             | August 21, 2006      | Needs testing   | Not done       | Not done       | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_kue    | ?                             | September 3, 2006    | N/A             | Not done       | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_le     | Marius Strobl                 | January 31, 2006     | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_lge    | ?                             | November 23, 2005    | Not done        | Done           | Done           | Not done        | vtophys()                                                             |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_lmc    | ?                             | February 11, 2006    | Done            | Done           | Done           | Unknown         | Untested on PAE                                                       |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_mn     | ?                             | ?                    | Not done        | Not done       | Not done       | Not done        | vtophys(). Please contact Poul-Henning Kamp for info/hardware.        |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_mxge   | Andrew Gallatin               | August 23, 2006      | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_my     | ?                             | August 17, 2005      | Not done        | Done           | Done           | Not done        | vtophys()                                                             |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_nfe    | ?                             | August 23, 2006      | Done            | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_nge    | ?                             | August 17, 2005      | Not done        | Done           | Done           | Not done        | vtophys()                                                             |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_nve    | ?                             | November 23, 2005    | Not done        | Done           | Done           | Not done        | vtophys()                                                             |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_pcn    | David O'Brien                 | August 19, 2005      | Not done        | Done           | Done           | Not done        | vtophys()                                                             |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_pdq    | ?                             | ?                    | Not done        | Not done       | Not done       | Not done        | Mostly busdma, except for vtophys().                                  |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ral    | ?                             | August 27, 2006      | Unknown         | Unknown        | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ray    | ?                             | August 27, 2006      | Unknown         | Unknown        | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_re     | ?                             | May 30, 2005         | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_rl     | Bill Paul                     | April 13, 2004       | Done            | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_rue    | ?                             | September 3, 2006    | N/A             | Not done       | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_sf     | ?                             | August 19, 2005      | Not done        | Done           | Done           | Not done        | vtophys()                                                             |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_sis    | Bill Paul                     | April 13, 2004       | Done            | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_sk     | ?                             | August 24, 2006      | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_sn     | Warner Losh                   | December 23, 2005    | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_snc    | ?                             | December 23, 2005    | Unknown         | Unknown        | Unknown        | Unknown         | pc98 only device (although it could work with many cardbus bridges)   |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_sr     | ?                             | ?                    | Not done        | Not done       | Not done       | Not done        | vtophys()                                                             |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ste    | ?                             | August 31, 2005      | Not done        | Done           | Done           | Not done        | vtophys()                                                             |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_stge   | Pyun YongHyeon                | August 23, 2006      | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ti     | ?                             | December 13, 2005    | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_tl     | ?                             | September 15, 2005   | Not done        | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_tx     | Maxime Henrion                | April 19, 2003       | Done            | Not done       | Not done       | Needs testing   | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_txp    | ?                             | September 22, 2005   | In progress     | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_udav   | ?                             | September 3, 2006    | N/A             | Not done       | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_ural   | ?                             | September 3, 2006    | N/A             | Not done       | Unknown        | Unknown         | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_vge    | ?                             | August 23, 2006      | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_vr     | ?                             | April 23, 2004       | Not done        | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_vx     | ?                             | September 22, 2005   | N/A             | Done           | Done           | Not done        | Uses PIO to copy mbufs to and from hardware.                          |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_wb     | ?                             | September 22, 2005   | Not done        | Done           | Done           | Not done        | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_wi     | Sam Leffler, Warner Losh      | November 4, 2003     | Unknown         | Done           | Unknown        | Unknown         | This driver needs lots of help                                        |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_xe     | Warner Losh                   | December 23, 2005    | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+
| if\_xl     | Maxime Henrion                | April 13, 2004       | Done            | Done           | Done           | Done            | ?                                                                     |
+------------+-------------------------------+----------------------+-----------------+----------------+----------------+-----------------+-----------------------------------------------------------------------+

Storage Device Driver Status
----------------------------

+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| Driver     | Responsible        | Last updated        | busdma     | INTR\_MPSAFE   | SMPng locked   | a!=p       | Notes                                                                            |
+============+====================+=====================+============+================+================+============+==================================================================================+
| aac        | ?                  | January 31, 2005    | Done       | Done           | Done           | Done       | Not endian clean.                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| adv        | ?                  | December 9, 2002    | Done       | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| aha        | ?                  | April 13, 2004      | Done       | In progress    | In progress    | Not done   | Uses BUSDMA, but may pun bus address with host address.                          |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ahb        | ?                  | December 9, 2002    | Done       | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ahc        | Justin T. Gibbs    | January 31, 2005    | Done       | Not done       | Not done       | Done       | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ahd        | Justin T. Gibbs    | January 31, 2005    | Done       | Not done       | Not done       | Done       | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| aic        | ?                  | December 23, 2005   | Unknown    | Unknown        | Unknown        | Unknown    | Neeeds evaluation                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| amd        | ?                  | December 14, 2002   | Done       | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| amr        | ?                  | January 30, 2005    | Done       | Done           | Done           | Done       | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| asr        | ?                  | January 4, 2003     | Not done   | Not done       | Not done       | Not done   | vtophys(). Requires major work. A new I2O framework would be desirable.          |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ata        | S?ren Schmidt      | December 9, 2002    | Done       | Done           | Done           | Done       | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| buslogic   | ?                  | ?                   | Not done   | Not done       | Not done       | Not done   | vtophys()                                                                        |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ciss       | ?                  | December 9, 2002    | Done       | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ct         | ?                  | ?                   | Not done   | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| dpt        | ?                  | ?                   | Not done   | Not done       | Not done       | Not done   | vtophys()                                                                        |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| fdc        | ?                  | December 23, 2005   | Unknown    | Unknown        | Unknown        | Unknown    | Needs evaluation                                                                 |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ida        | ?                  | December 9, 2002    | Done       | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| iir        | ?                  | March 1, 2006       | Done       | Done           | Done           | Done       | 64-bit DMA without bouncing is possible, but needs work.                         |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| isp        | ?                  | February 8, 2003    | Done       | Done           | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ips        | ?                  | January 30, 2005    | Done       | Done           | Done           | Done       | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| mlx        | ?                  | February 8, 2003    | Done       | In progress    | In progress    | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| mly        | ?                  | February 8, 2003    | Done       | In progress    | In progress    | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| mpt        | ?                  | December 9, 2002    | Done       | Done           | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ncr        | ?                  | ?                   | Not done   | Not done       | Not done       | Not done   | vtophys(). Please contact Poul-Henning Kamp for a possible source of hardware.   |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| ncv        | ?                  | ?                   | Unknown    | Unknown        | Unknown        | Unknown    | Needs evaluation                                                                 |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| nsp        | ?                  | ?                   | Unknown    | Unknown        | Unknown        | Unknown    | Needs evaluation                                                                 |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| pst        | ?                  | April 11, 2003      | Not done   | Done           | Not done       | Not done   | vtophys()                                                                        |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| stg        | ?                  | December 9, 2002    | Done       | Not done       | Not done       | Not done   | At least, it looks like it may well be.                                          |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| sym        | ?                  | December 19, 2002   | Done       | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| trm        | Olivier Houchard   | December 9, 2002    | Done       | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| twe        | ?                  | December 9, 2002    | Done       | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+
| wds        | ?                  | February 2, 2005    | Done       | Not done       | Not done       | Not done   | ?                                                                                |
+------------+--------------------+---------------------+------------+----------------+----------------+------------+----------------------------------------------------------------------------------+

Miscellaneous Device Driver Status
----------------------------------

+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| Driver     | Responsible           | Last updated        | busdma        | INTR\_MPSAFE   | SMPng locked   | a!=p            | Notes                                                            |
+============+=======================+=====================+===============+================+================+=================+==================================================================+
| agp        | ?                     | October 31, 2005    | Not done      | Not done       | Not done       | Not done        | vtophys()                                                        |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| bktr       | Olivier Houchard      | January 15, 2003    | In progress   | Not done       | Not done       | Not done        | vtophys()                                                        |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| digi       | ?                     | ?                   | Not done      | Not done       | Not done       | Not done        | vtophys()                                                        |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| drm        | Eric Anholt           | October 27, 2003    | In progress   | Done           | Done           | In progress     | vtophys(). The locking could use some review.                    |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| fb         | ?                     | ?                   | Not done      | Not done       | Not done       | Not done        | vtophys()                                                        |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| firewire   | Hidetoshi Shimokawa   | April 17, 2003      | Done          | Not done       | Not done       | Done            | vtophys()                                                        |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| hfa        | ?                     | ?                   | Not done      | Not done       | Not done       | Not done        | vtophys()                                                        |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| hifn       | Sam Leffler           | April 13, 2004      | Done          | Done           | Done           | Not done        | ?                                                                |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| musycc     | ?                     | ?                   | Not done      | Not done       | Not done       | Not done        | vtophys(). Please contact Poul-Henning Kamp for info/hardware.   |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| pcm        | Olivier Houchard      | February 20, 2003   | Done          | Done           | Not done       | Not done        | ?                                                                |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| ubsec      | Sam Leffler           | April 13, 2004      | Done          | Done           | Done           | Not done        | vtophys() is used in debugging printf.                           |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+
| usb        | John-Mark Gurney      | July 24, 2003       | Done          | Not done       | Not done       | Needs testing   | a!=p should be clean, but requires further testing.              |
+------------+-----------------------+---------------------+---------------+----------------+----------------+-----------------+------------------------------------------------------------------+

Documentation Status
--------------------

+-----------------------------------+----------------+--------------------+----------+---------+
| Task                              | Responsible    | Last updated       | Status   | Notes   |
+===================================+================+====================+==========+=========+
| Manual pages for the busdma API   | Hiten Pandya   | January 15, 2003   | Done     | ?       |
+-----------------------------------+----------------+--------------------+----------+---------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Site Map <../../search/index-site.html>`__ \| `Legal
Notices <../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. All
rights reserved.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ../..
