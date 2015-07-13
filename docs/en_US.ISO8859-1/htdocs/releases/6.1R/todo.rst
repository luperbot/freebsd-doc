=======================
FreeBSD 6.1 Open Issues
=======================

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

-  `Get FreeBSD <../../where.html>`__
-  `Release Information <../../releases/>`__

   -  Production Release:
      `10.1 <../../releases/10.1R/announce.html>`__
   -  Production Release:
      `9.3 <../../releases/9.3R/announce.html>`__
   -  Production Release:
      `8.4 <../../releases/8.4R/announce.html>`__

-  `Snapshot Releases <../../snapshots/>`__

   -  Upcoming Release:
      `10.2 <../../releases/10.2R/schedule.html>`__

-  `Ported Applications <../../ports/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD 6.1 Open Issues
=======================

This is a list of open issues that need to be resolved for FreeBSD 6.1.
If you have any updates for this list, please e-mail re@FreeBSD.org.

-  `Show stopper defects <#showstopper>`__
-  `Required features <#required>`__
-  `Desired features <#desired>`__
-  `Documentation Items <#docs>`__
-  `Testing foci <#testing>`__
-  `Problems Discovered by Kernel Stress Test Suite <#stresstest>`__
-  `Problems specific to the sparc64 architecture <#sparc64>`__

Show stopper defects for 6.1-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
No pending issue.
Required features for 6.1-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
No pending issue.
Desired features for 6.1-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+--------------------+--------------------+--------------------+--------------------+
| Issue              | Status             | Responsible        | Description        |
+====================+====================+====================+====================+
| devfs locking      | In?progress        | Jeff Roberson      | It is trivial to   |
| problem            |                    |                    | deadlock it on an  |
|                    |                    |                    | SMP system, and    |
|                    |                    |                    | there are other    |
|                    |                    |                    | panics with device |
|                    |                    |                    | removal.           |
+--------------------+--------------------+--------------------+--------------------+
| pty leak           | In?progress        | Olivier Houchard   | Since 6.x has a    |
|                    |                    |                    | hard-coded limit,  |
|                    |                    |                    | once all ptys are  |
|                    |                    |                    | leaked things like |
|                    |                    |                    | ssh and login no   |
|                    |                    |                    | longer work. This  |
|                    |                    |                    | seems              |
|                    |                    |                    | devfs-related, and |
|                    |                    |                    | occurs only under  |
|                    |                    |                    | extreme stress     |
|                    |                    |                    | testing, not       |
|                    |                    |                    | normal use.        |
+--------------------+--------------------+--------------------+--------------------+
| swap\_pager        | Unknown            | Don “Truck” Lewis? | When swapfiles are |
| warnings           |                    |                    | in use, there are  |
|                    |                    |                    | often warnings     |
|                    |                    |                    | printed:           |
|                    |                    |                    | ``swap_pager: inde |
|                    |                    |                    | finite wait buffer |
|                    |                    |                    | : bufobj: 0, blkno |
|                    |                    |                    | : 889347, size: 81 |
|                    |                    |                    | 92``.              |
|                    |                    |                    | There is also the  |
|                    |                    |                    | possibility of     |
|                    |                    |                    | deadlock.          |
+--------------------+--------------------+--------------------+--------------------+
| unmount pending    | In?progress        | Suleiman Souhlal   | When unmounting    |
| error              |                    |                    | filesystems Kris   |
|                    |                    |                    | Kennaway reports   |
|                    |                    |                    | seeing this        |
|                    |                    |                    | warning:           |
|                    |                    |                    | ``/c: unmount pend |
|                    |                    |                    | ing error: blocks  |
|                    |                    |                    | -68512 files 0``.  |
|                    |                    |                    | This dates back at |
|                    |                    |                    | least to 5.3. It   |
|                    |                    |                    | might be           |
|                    |                    |                    | associated with    |
|                    |                    |                    | filesystem         |
|                    |                    |                    | corruption         |
|                    |                    |                    | reported by many   |
|                    |                    |                    | users in which the |
|                    |                    |                    | 'used' space on a  |
|                    |                    |                    | filesystem is      |
|                    |                    |                    | negative; fsck -f  |
|                    |                    |                    | is needed to       |
|                    |                    |                    | correct this.      |
+--------------------+--------------------+--------------------+--------------------+
| "calcru: runtime   | Unknown            | ?                  | stress2 thr1 test  |
| went backwards"    |                    |                    | can trigger        |
| problem for        |                    |                    | "calcru: runtime   |
| threaded program   |                    |                    | went backwards"    |
|                    |                    |                    | problem and there  |
|                    |                    |                    | are also many      |
|                    |                    |                    | similar reports on |
|                    |                    |                    | -stable and        |
|                    |                    |                    | -current.          |
|                    |                    |                    | Poul-Henning Kamp  |
|                    |                    |                    | committed a        |
|                    |                    |                    | possible fix       |
|                    |                    |                    | (src/sys/kern/kern |
|                    |                    |                    | \_tc.c             |
|                    |                    |                    | rev.1.169) to      |
|                    |                    |                    | update the         |
|                    |                    |                    | calibration code   |
|                    |                    |                    | to be more precise |
|                    |                    |                    | on 2 March.        |
+--------------------+--------------------+--------------------+--------------------+
| NFS data           | In?progress        | Mohan Srinivasan   | Running fsx        |
| corruption between |                    |                    | between a 7.0 NFS  |
| two 7.0 machines   |                    |                    | client and server  |
|                    |                    |                    | detects data       |
|                    |                    |                    | corruption. This   |
|                    |                    |                    | problem can also   |
|                    |                    |                    | be reproduced by   |
|                    |                    |                    | using 6.1 NFS      |
|                    |                    |                    | server. The        |
|                    |                    |                    | problem seems to   |
|                    |                    |                    | be avoidable by    |
|                    |                    |                    | turning off the    |
|                    |                    |                    | attribute cache on |
|                    |                    |                    | the NFS client.    |
+--------------------+--------------------+--------------------+--------------------+
| sort(1) does not   | Not?done           | ?                  | sort(1) can cause  |
| work with some     |                    |                    | a coredump with    |
| locales            |                    |                    | some locales. See  |
|                    |                    |                    | also gnu/93629.    |
+--------------------+--------------------+--------------------+--------------------+
| unreliable serial  | Unknown            |                    | At the manual      |
| console            |                    |                    | 'root mount'       |
|                    |                    |                    | prompt, the serial |
|                    |                    |                    | console is very    |
|                    |                    |                    | unreliable and     |
|                    |                    |                    | drops most         |
|                    |                    |                    | characters. This   |
|                    |                    |                    | appears to be      |
|                    |                    |                    | caused by cngetc() |
|                    |                    |                    | polling the sio    |
|                    |                    |                    | driver for input,  |
|                    |                    |                    | and the sio driver |
|                    |                    |                    | resetting the chip |
|                    |                    |                    | on every poll      |
|                    |                    |                    | iteration. That    |
|                    |                    |                    | results in a very  |
|                    |                    |                    | small window for   |
|                    |                    |                    | it to accept       |
|                    |                    |                    | input. Fixing this |
|                    |                    |                    | requires a large   |
|                    |                    |                    | review of the      |
|                    |                    |                    | operation of the   |
|                    |                    |                    | sio driver. The    |
|                    |                    |                    | uart driver looks  |
|                    |                    |                    | to handle this     |
|                    |                    |                    | better and might   |
|                    |                    |                    | be a suitable      |
|                    |                    |                    | replacement.       |
+--------------------+--------------------+--------------------+--------------------+
| fix ntpdate(1)     | Unknown            | Ollivier Robert    |                    |
| bogus output on    |                    |                    |                    |
| amd64.             |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
| make -jN           | Not?done           | ?                  | Doing 'make -jN',  |
|                    |                    |                    | then               |
|                    |                    |                    | suspending/resumin |
|                    |                    |                    | g                  |
|                    |                    |                    | it may result in   |
|                    |                    |                    | make reporting it  |
|                    |                    |                    | lost child         |
|                    |                    |                    | process(es).       |
+--------------------+--------------------+--------------------+--------------------+
| update sysinstall  | In?progress        | Craig Rodrigues    | Sysinstall could   |
| disk labeling      |                    |                    | use the same fixes |
|                    |                    |                    | recently made to   |
|                    |                    |                    | fdisk so it plays  |
|                    |                    |                    | nice with GEOM and |
|                    |                    |                    | disk labeling.     |
|                    |                    |                    | This does not      |
|                    |                    |                    | cause problems     |
|                    |                    |                    | during install     |
|                    |                    |                    | because nothing on |
|                    |                    |                    | the disk is        |
|                    |                    |                    | mounted when its   |
|                    |                    |                    | label is being     |
|                    |                    |                    | manipulated but it |
|                    |                    |                    | can cause problems |
|                    |                    |                    | if sysinstall gets |
|                    |                    |                    | used on a live     |
|                    |                    |                    | system to adjust   |
|                    |                    |                    | labels on existing |
|                    |                    |                    | disks which        |
|                    |                    |                    | sys-admins tend to |
|                    |                    |                    | do.                |
+--------------------+--------------------+--------------------+--------------------+
| i386 deadlocks     | Deferred for       | Alan L. Cox        | i386 deadlocks if  |
| with >16GB swap    | future release     |                    | more than 16GB of  |
|                    |                    |                    | swap is in use.    |
|                    |                    |                    | Increasing the     |
|                    |                    |                    | kern.maxswzone     |
|                    |                    |                    | tunable would be a |
|                    |                    |                    | workaround this.   |
|                    |                    |                    | Although a patch   |
|                    |                    |                    | from Alan L. Cox   |
|                    |                    |                    | is needed to allow |
|                    |                    |                    | this variable to   |
|                    |                    |                    | be increased, this |
|                    |                    |                    | is not suitable    |
|                    |                    |                    | for 6.1R. This     |
|                    |                    |                    | limitation should  |
|                    |                    |                    | be documented in   |
|                    |                    |                    | the Release Notes. |
+--------------------+--------------------+--------------------+--------------------+
| panic in bpf       | Deferred for       | Sam Leffler        | killing tcpdump    |
|                    | future release     |                    | (e.g. with ^C) can |
|                    |                    |                    | cause panics in    |
|                    |                    |                    | bpf. To fix this   |
|                    |                    |                    | problem, some      |
|                    |                    |                    | architectural      |
|                    |                    |                    | changes are        |
|                    |                    |                    | needed.            |
+--------------------+--------------------+--------------------+--------------------+
| OpenBSM            | Deferred for       | Robert Watson      | The integration of |
|                    | future release     |                    | OpenBSM is waiting |
|                    |                    |                    | on some final      |
|                    |                    |                    | licensing hurdles. |
|                    |                    |                    | It is expected to  |
|                    |                    |                    | be available in    |
|                    |                    |                    | the next release.  |
+--------------------+--------------------+--------------------+--------------------+

Documentation items that must be resolved for 6.1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Issue
Status
Responsible
Description
No pending issue.
Testing foci for 6.1-RELEASE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                                                      | Status          | Responsible                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
+============================================================+=================+===================================+=====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| manual root mount lockmgr panics                           | Needs?testing   | Suleiman Souhlal                  | Specifying a manual root mount location causes lockmgr panics. Suleiman Souhlal has committed a patch for this.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| dhclient causes ipv6 panics.                               | Needs?testing   | Doug Barton                       | Doug Barton has more details about this.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| amd64 panics in ipv6 with date(1)                          | Needs?testing   | Hajimu UMEMOTO                    | amd64 panics in ipv6 when the date is changed using date(1) or ntpdate(1). This may be a MI issue.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| grep(1) -w does not work with multibyte locales            | Needs?testing   | Tim J. Robbins                    | grep(1) -w generates wrong results with non-UTF-8 multibyte locales. Tim J. Robbins has committed a patch to -HEAD. See also gnu/91909.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Improve kbdmux                                             | Needs?testing   | Maksim Yevmenkin                  | *From the `ideas page <http://www.freebsd.org/projects/ideas/>`__.* We need this for the growing number of systems that assume that USB is the primary keyboard. Current status appears to be that the kbdmux driver breaks very easily. We need this working well enough where it can be enabled by default, and all attached keyboards Just Work. Maksim Yevmenkin commit kbdmux and rc.d/syscons patches in HEAD and RELENG\_6. It is not yet enabled by default. See kbdmux(4) and contact Maksim Yevmenkin if you have problems.                                                                                                                                                                                                                                                                                                                                                               |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| umount -f panics                                           | Needs?testing   | Jeff Roberson, Suleiman Souhlal   | panics from race conditions. A patch from Jeff Roberson seems to fix some of them.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| quota deadlocks                                            | Needs?testing   | Jeff Roberson                     | Quota support is not locked properly and causes deadlocks. A patch from Jeff Roberson seems to fix some of them.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ifconfig regression on 6.x                                 | Needs?testing   | Yar Tikhiy                        | ifconfig cannot handle vlan and mtu parameters at the same time after rev.1.7.2.3 of sbin/ifconfig/ifvlan.c commit. For more information and a proposed patch, see `bin/94028 <http://www.freebsd.org/cgi/query-pr.cgi?pr=bin/94028>`__.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SMP kernels for install                                    | Needs?testing   | Sam Leffler                       | *From the `ideas page <http://www.freebsd.org/projects/ideas/>`__.* Right now we only install a UP kernel, for performance reasons. We should be able to package both a UP and SMP kernel into the release bits, and have sysinstall install both. It should also select the correct one for the target system and make that the default on boot. The easiest way to do this would be to have sysinstall boot an SMP kernel and then look at the hw.ncpu sysctl. The only problem is being able to have sysinstall fall back to booting a UP kernel for itself if the SMP one fails. This can probably be 'faked' by setting one of the SMP-disabling variables in the loader. But in any case, the point is to make the process Just Work for the user, without the user needing to know arcane loader/sysctl knobs. SMP laptops are here, and we should be ready to support SMP out-of-the-box.   |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| dup(2) regression on 6.x                                   | Needs?testing   | Christian S.J. Peron              | Simple "close(0); dup(fd)" does not return descriptor "0" in some cases. This problem has been reported in `kern/87208 <http://www.freebsd.org/cgi/query-pr.cgi?pr=kern/87208>`__, and there is a proposed patch in the PR, too. Christian S.J. Peron has committed a fix for this.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| cpu\_ipi\_selected() can cause a trap on FreeBSD/sparc64   | Needs?testing   | Marius Strobl                     | On sparc64, cpu\_ipi\_selected() can cause a trap (which is bad since it appears in the trap code path).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| UFS deadlocks on amd64                                     | Needs?testing   | Tor Egge                          | Seen by Kris Kennaway. This problem seems MI.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| UFS deadlocks                                              | Needs?testing   | Tor Egge                          | Seen by Peter Jeremy.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| panic in fxp driver                                        | Needs?testing   | Andre Oppermann                   | See http://people.freebsd.org/~pho/stress/log/cons186.html.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| exec\_map depletion                                        | Needs?testing   | Stephan Uphoff                    | The exec\_map is regularly running out of space on machines running 7.0. Stephan Uphoff has a committed a patch that seems to fix this problem.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| /dev/mem instability                                       | Needs?testing   | Marius Strobl, Stephan Uphoff     | Instability when accessing /dev/mem. A fix was committed for i386. amd64 does not seem to have the problem. A sparc64 fix is still in progress.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| deadlock in vn\_start\_write() consumers                   | Needs?testing   | Tor Egge                          | Many potential deadlocks have been fixed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
+------------------------------------------------------------+-----------------+-----------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Stress Test Panics
~~~~~~~~~~~~~~~~~~

The system is continuously being subjected to Peter Holm's `Kernel
Stress Test Suite <http://www.holm.cc/stress/>`__. The following issues
have recently been discovered from this test suite.

Currently none reported.

sparc64 problems
~~~~~~~~~~~~~~~~

These are problems that range in severity for FreeBSD/sparc64. They will
not hold up the release, but they will still be tracked for future
releases.

+------------------------------+---------------+--------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Issue                        | Status        | Responsible                    | Description                                                                                                                                                                                          |
+==============================+===============+================================+======================================================================================================================================================================================================+
| sparc64 frequent hangs       | In?progress   | Marius Strobl                  | Some of the more serious hangs on sparc64 have been fixed, but more remain.                                                                                                                          |
+------------------------------+---------------+--------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| serious sparc64 IPv6 panic   | In?progress   | George V. Neville-Neil         | Triggered by just ping6'ing the box. It may even be a MI issue, the reporter of this bug only uses IPv6 with sparc64. This problem seems to be triggered even when debug.mpsafenet="0".              |
+------------------------------+---------------+--------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| swap panic on sparc64        | Unknown       | Kris Kennaway has panic info   | Kris Kennaway reports configuring a 74GB swap-backed md on sparc64 that caused a panic after a week or two of load (during which time swap was slowly filling as more of the md was dirtied).        |
+------------------------------+---------------+--------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| KLDs on sparc64              | Not?done      | ?                              | On sparc64 machines with more than 4Gb memory KLDs are not usable and will panic the system. The problem is reportedly with how the KLDs are compiled, it only works if the code ends up below 4G.   |
+------------------------------+---------------+--------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Max RAM on sparc64           | Not?done      | ?                              | Maximum RAM on sparc64 appears to be limited to 16Gb.                                                                                                                                                |
+------------------------------+---------------+--------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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
