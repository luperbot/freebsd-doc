==================================
15.14. FreeBSD Security Advisories
==================================

.. raw:: html

   <div class="navheader">

15.14. FreeBSD Security Advisories
`????? <security-portaudit.html>`__?
???????? 15. ????????
?\ `??????? <security-accounting.html>`__

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

15.14. FreeBSD Security Advisories
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Like many production quality operating systems, FreeBSD publishes
?Security Advisories?. These advisories are usually mailed to the
security lists and noted in the Errata only after the appropriate
releases have been patched. This section will work to explain what an
advisory is, how to understand it, and what measures to take in order to
patch a system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.14.1. What does an advisory look like?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD security advisories look similar to the one below, taken
from the
`freebsd-security-notifications <http://lists.FreeBSD.org/mailman/listinfo/freebsd-security-notifications>`__
mailing list.

.. code:: programlisting

    =============================================================================
    FreeBSD-SA-XX:XX.UTIL                                     Security Advisory
                                                              The FreeBSD Project

    Topic:          denial of service due to some problem

    Category:       core
    Module:         sys
    Announced:      2003-09-23
    Credits:        Person@EMAIL-ADDRESS
    Affects:        All releases of FreeBSD
                    FreeBSD 4-STABLE prior to the correction date
    Corrected:      2003-09-23 16:42:59 UTC (RELENG_4, 4.9-PRERELEASE)
                    2003-09-23 20:08:42 UTC (RELENG_5_1, 5.1-RELEASE-p6)
                    2003-09-23 20:07:06 UTC (RELENG_5_0, 5.0-RELEASE-p15)
                    2003-09-23 16:44:58 UTC (RELENG_4_8, 4.8-RELEASE-p8)
                    2003-09-23 16:47:34 UTC (RELENG_4_7, 4.7-RELEASE-p18)
                    2003-09-23 16:49:46 UTC (RELENG_4_6, 4.6-RELEASE-p21)
                    2003-09-23 16:51:24 UTC (RELENG_4_5, 4.5-RELEASE-p33)
                    2003-09-23 16:52:45 UTC (RELENG_4_4, 4.4-RELEASE-p43)
                    2003-09-23 16:54:39 UTC (RELENG_4_3, 4.3-RELEASE-p39)
    CVE Name:    CVE-XXXX-XXXX

    For general information regarding FreeBSD Security Advisories,
    including descriptions of the fields above, security branches, and the
    following sections, please visit
    http://www.FreeBSD.org/security/.

    I.   Background


    II.  Problem Description


    III. Impact


    IV.  Workaround


    V.   Solution


    VI.  Correction details


    VII. References

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-topic>`__                  | The ``Topic`` field indicates        |
|                                      | exactly what the problem is. It is   |
|                                      | basically an introduction to the     |
|                                      | current security advisory and notes  |
|                                      | the utility with the vulnerability.  |
+--------------------------------------+--------------------------------------+
| `|2| <#co-category>`__               | The ``Category`` refers to the       |
|                                      | affected part of the system which    |
|                                      | may be one of ``core``, ``contrib``, |
|                                      | or ``ports``. The ``core`` category  |
|                                      | means that the vulnerability affects |
|                                      | a core component of the FreeBSD      |
|                                      | operating system. The ``contrib``    |
|                                      | category means that the              |
|                                      | vulnerability affects software       |
|                                      | contributed to the FreeBSD Project,  |
|                                      | such as sendmail. Finally the        |
|                                      | ``ports`` category indicates that    |
|                                      | the vulnerability affects add on     |
|                                      | software available as part of the    |
|                                      | Ports Collection.                    |
+--------------------------------------+--------------------------------------+
| `|3| <#co-module>`__                 | The ``Module`` field refers to the   |
|                                      | component location, for instance     |
|                                      | ``sys``. In this example, we see     |
|                                      | that the module, ``sys``, is         |
|                                      | affected; therefore, this            |
|                                      | vulnerability affects a component    |
|                                      | used within the kernel.              |
+--------------------------------------+--------------------------------------+
| `|4| <#co-announce>`__               | The ``Announced`` field reflects the |
|                                      | date said security advisory was      |
|                                      | published, or announced to the       |
|                                      | world. This means that the security  |
|                                      | team has verified that the problem   |
|                                      | does exist and that a patch has been |
|                                      | committed to the FreeBSD source code |
|                                      | repository.                          |
+--------------------------------------+--------------------------------------+
| `|5| <#co-credit>`__                 | The ``Credits`` field gives credit   |
|                                      | to the individual or organization    |
|                                      | who noticed the vulnerability and    |
|                                      | reported it.                         |
+--------------------------------------+--------------------------------------+
| `|6| <#co-affects>`__                | The ``Affects`` field explains which |
|                                      | releases of FreeBSD are affected by  |
|                                      | this vulnerability. For the kernel,  |
|                                      | a quick look over the output from    |
|                                      | ``ident`` on the affected files will |
|                                      | help in determining the revision.    |
|                                      | For ports, the version number is     |
|                                      | listed after the port name in        |
|                                      | ``/var/db/pkg``. If the system does  |
|                                      | not sync with the FreeBSD CVS        |
|                                      | repository and rebuild daily,        |
|                                      | chances are that it is affected.     |
+--------------------------------------+--------------------------------------+
| `|7| <#co-corrected>`__              | The ``Corrected`` field indicates    |
|                                      | the date, time, time offset, and     |
|                                      | release that was corrected.          |
+--------------------------------------+--------------------------------------+
| `|8| <#co-cve>`__                    | Reserved for the identification      |
|                                      | information used to look up          |
|                                      | vulnerabilities in the Common        |
|                                      | Vulnerabilities Database system.     |
+--------------------------------------+--------------------------------------+
| `|9| <#co-backround>`__              | The ``Background`` field gives       |
|                                      | information on exactly what the      |
|                                      | affected utility is. Most of the     |
|                                      | time this is why the utility exists  |
|                                      | in FreeBSD, what it is used for, and |
|                                      | a bit of information on how the      |
|                                      | utility came to be.                  |
+--------------------------------------+--------------------------------------+
| `|10| <#co-descript>`__              | The ``Problem Description`` field    |
|                                      | explains the security hole in depth. |
|                                      | This can include information on      |
|                                      | flawed code, or even how the utility |
|                                      | could be maliciously used to open a  |
|                                      | security hole.                       |
+--------------------------------------+--------------------------------------+
| `|11| <#co-impact>`__                | The ``Impact`` field describes what  |
|                                      | type of impact the problem could     |
|                                      | have on a system. For example, this  |
|                                      | could be anything from a denial of   |
|                                      | service attack, to extra privileges  |
|                                      | available to users, or even giving   |
|                                      | the attacker superuser access.       |
+--------------------------------------+--------------------------------------+
| `|12| <#co-workaround>`__            | The ``Workaround`` field offers a    |
|                                      | feasible workaround to system        |
|                                      | administrators who may be incapable  |
|                                      | of upgrading the system. This may be |
|                                      | due to time constraints, network     |
|                                      | availability, or a slew of other     |
|                                      | reasons. Regardless, security should |
|                                      | not be taken lightly, and an         |
|                                      | affected system should either be     |
|                                      | patched or the security hole         |
|                                      | workaround should be implemented.    |
+--------------------------------------+--------------------------------------+
| `|13| <#co-solution>`__              | The ``Solution`` field offers        |
|                                      | instructions on patching the         |
|                                      | affected system. This is a step by   |
|                                      | step tested and verified method for  |
|                                      | getting a system patched and working |
|                                      | securely.                            |
+--------------------------------------+--------------------------------------+
| `|14| <#co-details>`__               | The ``Correction Details`` field     |
|                                      | displays the CVS branch or release   |
|                                      | name with the periods changed to     |
|                                      | underscore characters. It also shows |
|                                      | the revision number of the affected  |
|                                      | files within each branch.            |
+--------------------------------------+--------------------------------------+
| `|15| <#co-ref>`__                   | The ``References`` field usually     |
|                                      | offers sources of other information. |
|                                      | This can include web URLs, books,    |
|                                      | mailing lists, and newsgroups.       |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+----------------------------+---------------------------------------------+
| `????? <security-portaudit.html>`__?             | `???? <security.html>`__   | ?\ `??????? <security-accounting.html>`__   |
+--------------------------------------------------+----------------------------+---------------------------------------------+
| 15.13. Monitoring Third Party Security Issues?   | `???? <index.html>`__      | ?15.15. Process Accounting                  |
+--------------------------------------------------+----------------------------+---------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |9| image:: ./imagelib/callouts/9.png
.. |10| image:: ./imagelib/callouts/10.png
.. |11| image:: ./imagelib/callouts/11.png
.. |12| image:: ./imagelib/callouts/12.png
.. |13| image:: ./imagelib/callouts/13.png
.. |14| image:: ./imagelib/callouts/14.png
.. |15| image:: ./imagelib/callouts/15.png
