===================
FreeBSD/ppc Projekt
===================

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

Header und Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

Externe Links
-------------

.. raw:: html

   <div id="searchnav">

.. raw:: html

   </div>

.. raw:: html

   <div id="search">

.. raw:: html

   <div>

Suche
-----

.. raw:: html

   <div>

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="menu">

-  `Startseite <../>`__

-  `?ber FreeBSD <../about.html>`__

   -  `F?r Einsteiger <../projects/newbies.html>`__
   -  `Eigenschaften <../features.html>`__
   -  `Advocacy <../../advocacy/>`__
   -  `Marketing <../../marketing/>`__
   -  `Privacy Policy <../../privacy.html>`__

-  `Bezugsquellen <../where.html>`__

   -  `Release Information <../releases/>`__
   -  `Release Engineering <../../releng/>`__

-  `Dokumentation <../docs.html>`__

   -  `FAQ <../../doc/de_DE.ISO8859-1/books/faq/>`__
   -  `Handbuch <../../doc/de_DE.ISO8859-1/books/handbook/>`__
   -  `Porter-Handbuch <../../doc/de_DE.ISO8859-1/books/porters-handbook>`__
   -  `Entwickler-Handbuch <../../doc/de_DE.ISO8859-1/books/developers-handbook>`__
   -  `Manualpages <//www.FreeBSD.org/cgi/man.cgi>`__

-  `Community <../community.html>`__

   -  `Mailinglisten <../community/mailinglists.html>`__
   -  `Forum <http://forums.freebsd.org>`__
   -  `User Groups <../../usergroups.html>`__
   -  `Events <../../events/events.html>`__

-  `Entwicklung <../../projects/index.html>`__

   -  `Projektideen <http://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN-Repository <http://svnweb.FreeBSD.org>`__
   -  `Perforce-Repository <http://p4web.FreeBSD.org>`__

-  `Hilfe <../support.html>`__

   -  `Kommerzieller Support <../../commercial/commercial.html>`__
   -  `Sicherheit <../../security/>`__
   -  `Problemberichte <//www.FreeBSD.org/cgi/query-pr-summary.cgi>`__
   -  `Problembericht erstellen <../send-pr.html>`__

-  `Foundation <http://www.freebsdfoundation.org/>`__

   -  `Geldspende <http://www.freebsdfoundation.org/donate/>`__
   -  `Hardwarespende <../../donations/>`__

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

-  `Entwicklung <../projects/index.html>`__
-  `Developer's
   Handbook <../../doc/de_DE.ISO8859-1/books/developers-handbook>`__
-  `Porter-Handbuch <../../doc/de_DE.ISO8859-1/books/porters-handbook>`__
-  `Quellcode-Repositories <../developers/cvs.html>`__
-  `Release Engineering <../../releng/index.html>`__
-  `Plattformen <../platforms/>`__
-  `Projektvorschl?ge <http://wiki.FreeBSD.org/IdeasPage>`__
-  `FreeBSD
   unterst?tzen <../../doc/de_DE.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD/ppc Projekt
===================

Einf?hrung
~~~~~~~~~~

Diese Seiten des FreeBSD/ppc-Projekts enthalten Informationen ?ber die
Portierung von FreeBSD auf die PowerPC?-Architektur. Wie die Portierung
selbst sind auch diese Seiten unter st?ndiger Bearbeitung.

Inhaltsverzeichnis
~~~~~~~~~~~~~~~~~~

-  `Status <#intro>`__
-  `Neuigkeiten <#news>`__
-  `FAQs zur Portierung <#faq>`__
-  `Unterst?tzte Hardware <#hardware>`__
-  `Die Mailingliste FreeBSD/ppc <#list>`__
-  `Bekannte Probleme <#issues>`__
-  `Dokumentation, White-Papers, Werkzeuge <#doc>`__
-  `Verwandte Themen <#links>`__

Status
~~~~~~

Die FreeBSD/ppc-Portierung gilt nach wie vor als
`Tier-2 <../../doc/en_US.ISO8859-1/articles/committers-guide/archs.html>`__-Plattform.
Dies bedeutet, dass sie von Security Officer, Release Ingenieuren und
Toolchain-Betreuern noch nicht vollst?ndig unterst?tzt wird.

--------------

Neuigkeiten
~~~~~~~~~~~

-  **05. Januar 2011**: Die Unterst?tzung f?r die Sony Playstation 3
   wurde in das SVN-Repository aufgenommen.
-  **13. Juli 2010**: Die powerpc64-Architektur wird nun unterst?tzt.
-  **03. M?rz 2008**: Die Unterst?tzung f?r die Freescale? PowerQUICC
   III MPC85XX-Familie von Boards mit All-in-One-Chips wurde in den
   CVS-Baum committed.
-  **27. Februar 2008**: FreeBSD 7.0 ist das erste Release, das den
   FreeBSD/ppc-Port offiziell unterst?tzt.

--------------

H?ufig gestellte Fragen
~~~~~~~~~~~~~~~~~~~~~~~

#. `Wie kann ich FreeBSD/ppc installieren? <#1>`__
#. `Wie verwende ich Ports unter FreeBSD/ppc? <#3>`__
#. `Soll ich powerpc oder powerpc64 installieren? <#4>`__
#. `An wen soll ich mich wenden? <#5>`__

Wie kann ich FreeBSD/ppc installieren?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ISO-Images f?r von FreeBSD 10.1, die f?r New-World Macs geeignet sind,
stehen zum Download bereit. Lesen Sie f?r weitere Informationen bitte
die `Release Notes <../../releases/10.1R/announce.html>`__ sowie die
offizielle `Ank?ndigung <../../releases/10.1R/announce.html>`__.

Wie verwende ich Ports unter FreeBSD/ppc?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Verwenden Sie portsnap. Lesen Sie dazu bitte den Abschnitt `Benutzen der
Ports-Sammlung <../../doc/de_DE.ISO8859-1/books/handbook/ports-using.html>`__
des Handbuchs.

Soll ich powerpc oder powerpc64 installieren?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der powerpc64-Port bietet Ihnen einen 64-Bit-Kernel sowie ein
64-Bit-Userland und wird auf allen 64-Bit-Prozessoren unterst?tzt.
Besitzen Sie einen 32-Bit-Prozessor (G3, G4), m?ssen Sie die
(32-Bit-)powerpc-Plattform installieren. Bei einem 64-Bit-Prozessor, der
auch 32-Bit-Unterst?tzung bietet (G5), haben Sie die Wahl zwischen 32
und 64 Bit. Verwenden Sie hingegen einen reinen 64-Bit-Prozessor (Cell),
so m?ssen Sie powerpc64 verwenden. Bevor Sie sich zwischen 32 und 64 Bit
entscheiden, sollten Sie bedenken, dass powerpc64 einige zus?tzliche
Funktionen (beispielsweise die Unterst?tzung f?r mehr als 2 GB RAM oder
ZFS) bietet. Allerdings ist die Unterst?tzung dieser Plattform derzeit
noch etwas schlechter, da es sich um eine relativ neue und daher noch
recht wenig verbreitete Architektur handelt. Wie die anderen
64-Bit-Plattformen bietet auch FreeBSD/powerpc64 die M?glichkeit, sowohl
32-Bit- als auch 64-Bit-Programme auszuf?hren.

An wen soll ich mich wenden?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dieses Projekt wird von `Peter Grehan <mailto:grehan@FreeBSD.org>`__
geleitet. M?chten Sie Code beitragen, sollten Sie sich daher an ihn
wenden. M?chten Sie hingegen etwas ?ber den Projektstatus erfahren,
sollten Sie diese Seiten sowie die `Mailingliste FreeBSD/ppc <#list>`__
regelm??ig lesen.

--------------

Unterst?tzte Hardware
~~~~~~~~~~~~~~~~~~~~~

Der FreeBSD/ppc-Port sollte auf jedem aktuellen Apple-Rechner (d.h. auf
jedem Apple-Computer mit einem eingebauten USB-Port) sowie auf der Sony
Playststation 3 laufen. F?r die folgenden Systeme wurde eine
erfolgreiche Installation sowie ein erfolgreicher Betrieb von FreeBSD
berichtet:

+--------------------+--------------------+--------------------+--------------------+
| Hersteller         | Modell             | Eingereicht von    | Anmerkungen        |
|                    |                    | (Links optional)   |                    |
+====================+====================+====================+====================+
| Apple              | iMac G3 350 MHz    | `Martin            | Rage 128VR         |
|                    |                    | Minkus <mailto:dis |                    |
|                    |                    | killer@diskiller.n |                    |
|                    |                    | et>`__             |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | iMac G3 DV Special | `David S.          | Keine              |
|                    | Edition            | Besade <mailto:web |                    |
|                    |                    | master@machowto.co |                    |
|                    |                    | m>`__              |                    |
|                    |                    | (`dmesg <http://pe |                    |
|                    |                    | ople.freebsd.org/~ |                    |
|                    |                    | flz/local/dmesg.pp |                    |
|                    |                    | c>`__)             |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | iMac G3 Revision B | `Peter             | Rage 3D Pro 215GP, |
|                    |                    | Grehan <mailto:gre | Beschleunigung     |
|                    |                    | han@FreeBSD.org>`_ | deaktiviert        |
|                    |                    | _                  |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | eMac 700 MHz       | `Peter             | Nvidia GeForce2 MX |
|                    |                    | Grehan <mailto:gre |                    |
|                    |                    | han@FreeBSD.org>`_ |                    |
|                    |                    | _                  |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | Mac Mini G4 1.4    | `Tilman            | Keine              |
|                    | GHz                | Linneweh <mailto:a |                    |
|                    |                    | rved@FreeBSD.org>` |                    |
|                    |                    | __                 |                    |
|                    |                    | (`dmesg <http://pe |                    |
|                    |                    | ople.freebsd.org/~ |                    |
|                    |                    | arved/stuff/minima |                    |
|                    |                    | c>`__)             |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | Powerbook G4 1.33  | `Peter             | Nvidia GeForce     |
|                    | GHz                | Grehan <mailto:gre | G5200              |
|                    |                    | han@FreeBSD.org>`_ |                    |
|                    |                    | _                  |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | Aluminium          | `Andreas           | Keine              |
|                    | Powerbook G4 1.5   | Tobler <mailto:toa |                    |
|                    | GHz                | @pop.agri.ch>`__   |                    |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | PowerMac G5        |                    | FreeBSD 8.0        |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | iMac G5            |                    | FreeBSD 8.0        |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | Xserve G5          |                    | FreeBSD 8.1        |
+--------------------+--------------------+--------------------+--------------------+
| Apple              | PowerMac G5 (seit  |                    | FreeBSD 8.1        |
|                    | Ende 2005)         |                    |                    |
+--------------------+--------------------+--------------------+--------------------+

--------------

Die Mailingliste FreeBSD/ppc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Um diese Liste zu abonnieren, schicken sie eine E-Mail an
freebsd-ppc-subscribe@FreeBSD.org oder Sie besuchen die entsprechende
`Mailman-Seite <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ppc>`__.

--------------

Bekannte Probleme
~~~~~~~~~~~~~~~~~

-  Es gibt einen bekannten Bug im Boot-Loader, der das Booten eines
   alternativen Kernels verhindert. Das Testen eines neuen Kernels ist
   daher etwas riskant. Wenn Sie den Loader am Open Firmware-Prompt
   starten, geben Sie daher eine Partition an, die nicht existiert, von
   der kein Kernel geladen werden muss, oder bei der es sich nicht um
   eine UFS-Partition handelt:

   ::

       0 > boot hd:loader hd:0

   Danach k?nnen Sie die Variable currdev setzen und den Kernel manuell
   laden:

   ::

       OK set currdev=hd:14
       OK load /boot/kernel/kernel.save

--------------

Dokumentation, White-Papers, Werkzeuge
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  `PowerPC chip
   documentation <http://www.freescale.com/files/product/doc/MPCFPE32B.pdf>`__
-  `Open Firmware Quick
   Reference <http://www.firmworks.com/QuickRef.html>`__
-  `"TN1061: Fundamentals of Open Firmware, Part 1 - The User
   Interface" <http://developer.apple.com/technotes/tn/tn1061.html>`__
-  `"TN1062: Fundamentals of Open Firmware, Part 2 - The Device
   Tree" <http://developer.apple.com/technotes/tn/tn1062.html>`__
-  `Apple hardware developer
   docs <http://developer.apple.com/techpubs/hardware/hardware2.html>`__
-  `"TN2004: Debugging Open Firmware Using
   Telnet" <http://developer.apple.com/technotes/tn/tn2004.html>`__
-  `"TN2023: Open Firmware Ethernet Debugging II - Telnet
   Downloading <http://developer.apple.com/technotes/tn/tn2023.html>`__
-  `"TN2001: Running Files from a Hard Drive in Open
   Firmware" <http://developer.apple.com/technotes/tn/tn2001.html>`__
-  `psim <http://sourceware.org/psim/>`__ - Ein PowerPC-Simulator, der
   als FreeBSD-Port
   `emulators/psim-freebsd <http://www.freshports.org/?package=psim-freebsd>`__
   verf?gbar ist.

Verwandte Themen
~~~~~~~~~~~~~~~~

-  `Das FreeBSD/ppc Wiki <http://wiki.freebsd.org/powerpc>`__
-  `Garance A. Drosehn beschreibt die Nutzung von FreeBSD auf dem Mac
   Mini <http://lists.freebsd.org/pipermail/freebsd-ppc/2005-January/000814.html>`__
-  `NetBSD/macppc <http://www.NetBSD.org/Ports/macppc/>`__
-  `OpenBSD/macppc <http://www.OpenBSD.org/macppc.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Sitemap <../../search/index-site.html>`__ \| `Legal
Notices <../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. Alle
Rechte vorbehalten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ..
