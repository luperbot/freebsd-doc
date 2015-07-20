=======================
FreeBSD/sparc64 Project
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

FreeBSD/sparc64 Project
=======================

Einf?hrung
~~~~~~~~~~

Diese Seite enth?lt Informationen ?ber die Portierung von FreeBSD auf
die SPARC64?-Architektur von Fujitsu sowie auf die UltraSPARC?
Architektur von Oracle. Diskussionen ?ber diese Portierung finden auf
der Mailingliste
`freebsd-sparc <http://lists.freebsd.org/mailman/listinfo/freebsd-sparc64>`__
statt.

Inhaltsverzeichnis
~~~~~~~~~~~~~~~~~~

-  `Status <#status>`__
-  `Hardware-Liste <#hw>`__
-  `Danksagungen <#who>`__
-  `FreeBSD/sparc64 mailing list <#list>`__
-  `Weiterf?hrende Informationen <#links>`__

Status
~~~~~~

UltraSPARC ist eine
`Tier?2 <../../doc/en_US.ISO8859-1/articles/committers-guide/archs.html>`__-Architektur,
und als solche vom `FreeBSD <http://www.FreeBSD.org/>`__ Project nicht
vollst?ndig unterst?tzt. Obwohl voll funktionsf?hig, ist dieser Port ist
nicht so ausgereift wie die vorhandenen i386- oder amd64-Portierungen.

Hardware-Liste
~~~~~~~~~~~~~~

Unten finden Sie eine Liste der unterst?tzten Systeme. SMP funktioniert
auf allen unterst?tzten Systemen, die mehr als einen Prozessor besitzen.
Alle Einzelheiten entnehmen Sie bitte den
`Hardware-Notes <../../releases/10.1R/hardware.html>`__ der benutzten
`Release <../releases/>`__.

-  Naturetech GENIALstation 777S
-  Sun Blade 100
-  Sun Blade 150
-  Sun Enterprise 150
-  Sun Enterprise 220R
-  Sun Enterprise 250
-  Sun Enterprise 420R
-  Sun Enterprise 450
-  Sun Fire B100s (die integrierte Netzwerkkarte wird ab 8.1-RELEASE
   unterst?tzt)
-  Sun Fire V100
-  Sun Fire V120
-  Sun Netra™ T1 100/105
-  Sun Netra T1 AC200/DC200
-  Sun Netra t 1100
-  Sun Netra t 1120
-  Sun Netra t 1125
-  Sun Netra t 1400/1405
-  Sun Netra 120
-  Sun Netra X1
-  Sun SPARCEngine? Ultra AX1105
-  Sun SPARCEngine Ultra AXe
-  Sun SPARCEngine Ultra AXi
-  Sun SPARCEngine Ultra AXmp
-  Sun SPARCEngine CP1500
-  Sun Ultra™ 1
-  Sun Ultra 1E
-  Sun Ultra 2
-  Sun Ultra 5
-  Sun Ultra 10
-  Sun Ultra 30
-  Sun Ultra 60
-  Sun Ultra 80
-  Sun Ultra 450

Die folgenden Systeme werden von FreeBSD nur teilweise unterst?tzt.
Insbesondere werden Fibre-Channel-Controller in SBus-basierten Systemen
derzeit noch nicht unterst?tzt. Es ist allerdings m?glich, diese Systeme
mit vom esp(4)-Treiber unterst?tzten SCSI-Controllern (Sun ESP SCSI-,
Sun FAS Fast-SCSI- sowie Sun FAS366 Fast-Wide SCSI-Controller) zu
betreiben.

-  Sun Enterprise 3500
-  Sun Enterprise 4500

Beginnend mit 7.2-RELEASE werden auch Sparc64-Systeme (die auf Sun
UltraSPARC III und neuer basieren) von FreeBSD unterst?tzt. Dazu geh?ren
die folgenden Systeme:

-  Sun Blade 1000
-  Sun Blade 1500
-  Sun Blade 2000
-  Sun Blade 2500
-  Sun Fire 280R
-  Sun Fire V210
-  Sun Fire V215 (ab FreeBSD 7.3-RELEASE/8.1-RELEASE unterst?tzt)
-  Sun Fire V240
-  Sun Fire V245 (ab FreeBSD 7.3-RELEASE/8.1-RELEASE unterst?tzt)
-  Sun Fire V250
-  Sun Fire V440 (die On-Board-Netzwerkkarte wird beginnend mit FreeBSD
   7.3-RELEASE/8.0-RELEASE unterst?tzt)
-  Sun Fire V480 (seit FreeBSD 7.3-RELEASE/8.0-RELEASE werden die
   Centerplanes 501-6780 unterst?tzt, weitere Centerplanes sollen ab
   FreeBSD 8.3-RELEASE/9.0-RELEASE unterst?tzt werden)
-  Fire V880
-  Sun Fire V890 (ab 7.4-RELEASE/8.1-RELEASE unterst?tzt, nur reine
   Ultrasparc IV/IV+ CPU-Konfigurationen)
-  Sun Netra 20/Netra T4

Die folgenden UltraSPARC IIIi-Systeme wurden zwar nicht getestet,
sollten aber von FreeBSD ebenfalls unterst?tzt werden:

-  Sun Fire V125
-  Sun Fire V490 (ab 7.4-RELEASE/8.1-RELEASE unterst?tzt, nur reine
   Ultrasparc IV/IV+ CPU-Konfigurationen)

Beginnend mit 7.4-RELEASE und 8.1-RELEASE werden auch Sparc64-Systeme
(die auf Fujitsu SPARC64 V basieren) von FreeBSD unterst?tzt. Dazu
geh?ren die folgenden Systeme:

-  Fujitsu PRIMEPOWER? 250

Die folgenden Fujitsu SPARC64-Systeme wurden zwar nicht getestet,
sollten aber von FreeBSD ebenfalls unterst?tzt werden:

-  Fujitsu PRIMEPOWER 450
-  Fujitsu PRIMEPOWER 650
-  Fujitsu PRIMEPOWER 850

Haben Sie ein System, welches hier nicht angef?hrt ist, lassen Sie
`uns <mailto:freebsd-sparc@FreeBSD.org>`__ dies bitte wissen.

Danksagungen
~~~~~~~~~~~~

Die folgenden Personen haben geholfen, die FreeBSD-Portierung zu
erm?glichen:

-  `Jake Burkholder <mailto:jake@FreeBSD.org>`__
-  `Thomas M?stl <mailto:tmm@FreeBSD.org>`__
-  `David O'Brien <mailto:obrien@FreeBSD.org>`__

Weiterf?hrende Information
~~~~~~~~~~~~~~~~~~~~~~~~~~

-  `SPARC Standard
   Dokumente <http://www.sparc.org/specificationsDocuments.html>`__
-  `NetBSD/sparc64 <http://www.netbsd.org/Ports/sparc64/>`__
-  `OpenBSD/sparc64 <http://www.openbsd.org/sparc64.html>`__

Mailingliste FreeBSD/sparc64
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Um diese Liste zu abonnieren, senden Sie eine E-Mail an
``<       freebsd-sparc64-subscribe@FreeBSD.org>`` oder besuchen Sie die
`mailman-Schnittstelle <http://lists.FreeBSD.org/mailman/listinfo/freebsd-sparc64>`__.

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
