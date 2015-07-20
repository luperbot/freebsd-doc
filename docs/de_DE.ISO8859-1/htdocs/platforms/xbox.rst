====================
FreeBSD/xbox Project
====================

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

FreeBSD/xbox Project
====================

Einf?hrung
~~~~~~~~~~

Bei FreeBSD/xbox handelt es sich um eine Portierung von FreeBSD, deren
Ziel es ist, FreeBSD auf der Xbox?-Plattform von Microsoft? zu
betreiben. Dieses Projekt wurde von `Rink
Springer <mailto:rink@FreeBSD.org>`__ gestartet, der auch den Gro?teil
der Programmierarbeit erledigt. Dabei wird er von `Ed
Schouten <mailto:ed@FreeBSD.org>`__ unterst?tzt, der Patches ?berpr?ft
und Details zu verschiedenen Xbox-Internas bereitgestellt hat.

Status
~~~~~~

FreeBSD/xbox ist seit FreeBSD 6-STABLE lauff?hig. Sowohl Framebuffer-,
Ethernet-, Audio- als auch USB-Ger?te (beispielsweise USB-Tastaturen f?r
die Konsole) werden unterst?tzt.

Um Anwender bei der Installations des FreeBSD/xbox-Ports zu
unterst?tzen, wird eine kombinierte Installations-/Live-CD
`bereitgestellt <http://lists.freebsd.org/pipermail/freebsd-stable/2006-August/027894.html>`__.
Das entsprechende ISO-Image kann
`hier <ftp://ftp.stack.nl/pub/freebsd-xbox/>`__ heruntergeladen werden.

FreeBSD-Kernel booten
~~~~~~~~~~~~~~~~~~~~~

Um FreeBSD auf der Xbox? starten zu k?nnen, ben?tigen Sie ein aktuelles
Linux/xbox-BIOS (das als Cromwell bezeichnet wird). Ohne dieses BIOS
w?rde Ihr Kernel direkt nach dem Laden abst?rzen. Ein Cromwell-BIOS mit
inkludierten FreeBSD UFS-Patches (die zum Laden des Kernel von einem
UFS-Dateisystem n?tig sind) ist in der Ports-Sammlung unter
/usr/ports/sysutils/cromwell verf?gbar. Zum ?bertragen des BIOS in das
EEPROM k?nnen Sie den Port /usr/ports/sysutils/raincoat verwenden.
Beachten Sie aber, dass Ihre Xbox-Version dazu kleiner als 1.6 sein
muss.

**Anmerkung**: Manche Xbox-Laufwerke weigern sich, bestimmte Medien
korrekt einzulesen. Sollte dies bei Ihnen der Fall sein, so sollten Sie
ein anderes (als lauff?hig bekanntes) DVD/CD-ROM-Laufwerk verwenden.

Festplatteninstallation
~~~~~~~~~~~~~~~~~~~~~~~

Sie k?nnen die Live-CD zwar zur Installation verwenden, in diesem Fall
m?ssten Sie aber jeden Schritt manuell durchf?hren. Es wird daher
empfohlen, die Platte mit einer FreeBSD/i386-Installation vorzubereiten
und danach die Konfigurationsdatei /boot/xboxlinux.cfg manuell
einzurichten, damit Cromwell den korrekten Kernel l?dt.

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
