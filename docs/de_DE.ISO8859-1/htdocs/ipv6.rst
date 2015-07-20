==================
IPv6 unter FreeBSD
==================

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

IPv6 unter FreeBSD
==================

.. raw:: html

   <div id="catnav">

Inhaltsverzeichis
^^^^^^^^^^^^^^^^^

-  `IPv6 unter FreeBSD <../ipv6/>`__
-  `Reiner IPv6-Betrieb <../../ipv6/ipv6only.html>`__
-  `World IPv6 Day <../../ipv6/w6d.html>`__

   -  `WWW-Statistiken <../../ipv6/w6d-www-stats.html>`__

.. raw:: html

   </div>

Einf?hrung
----------

IPv6 wird seit mehr als 10 Jahren von FreeBSD unterst?tzt (die erste
FreeBSD-Version mit standardm??ig aktivierter IPv6-Unterst?tzung war
FreeBSD?4.0-RELEASE, das im Jahre 2000 ver?ffentlicht wurde. Diese Seite
beschreibt den aktuellen Stand der IPv6-Unterst?tzung unter FreeBSD und
bietet zus?tzlich Informationen zum "IPv6 World Day 2011".

Neuigkeiten
-----------

-  **12. Januar 2012**: F?r 9.0-RELEASE sind ab sofort reine
   IPv6-Snapshots verf?gbar. Weitere Details zu diesen Snapshots finden
   sich auf der `IPv6Only wiki
   page <http://wiki.freebsd.org/IPv6Only>`__.
-  **15. Dezember 2011**: F?r 9.0-RC3 sind ab sofort reine
   IPv6-Snapshots verf?gbar. Weitere Details zu diesen Snapshots finden
   sich auf der `IPv6Only wiki
   page <http://wiki.freebsd.org/IPv6Only>`__.
-  **3. August 2011**: F?r 9.0-BETA1 sind ab sofort reine IPv6-Snapshots
   verf?gbar. Weitere Details zu diesen Snapshots finden sich auf der
   `IPv6Only wiki page <http://wiki.freebsd.org/IPv6Only>`__.
-  **9. Juni 2011**: Wir bedanken uns bei allen Teilnehmern des World
   IPv6 Days. IPv6-Statistiken f?r `www.FreeBSD.org <../..>`__ f?r den
   Zeitraum von 12 Stunden vor und nach diesem Ereignis sind ab sofort
   `verf?gbar <../../ipv6/w6d-www-stats.html>`__.
-  **7. Juni 2011**: Aktualisierte reine IPv6-Snapshots wurden
   bereitgestellt. Neu ist die Unterst?tzung von "RFC 6106 DNS
   Suchlisten und Nameserver" in
   `rtsol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsol&sektion=8>`__
   und
   `rtsold(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rtsold&sektion=8>`__
   bereits w?hrend der Installation. Weitere Informationen zu diesen
   Snapshots finden Sie `hier <../../ipv6/ipv6only.html>`__,
   Download-Links und Informationen zur Installation ?ber ein Netzwerk
   hingegen im `FreeBSD Wiki <http://wiki.freebsd.org/IPv6Only>`__.
-  **6. Juni 2011**: Die FreeBSD Foundation and iXsystems haben heute
   bekanntgegeben, dass sie den World IPv6 Day unterst?tzen werden, um
   die globale Verbreitung von IPv6 zu f?rdern. Lesen Sie dazu bitte die
   offizielle
   `Presseerkl?rung <http://www.prweb.com/releases/2011/6/prweb8529718.htm>`__.
   Weitere Informationen zu FreeBSD und zum World IPv6 Day finden Sie
   `hier <../../ipv6/w6d.html>`__.
-  **6. Juni 2011**: Aktualisierte reine IPv6-Snapshots wurden
   bereitgestellt. Weitere Informationen zu diesen Snapshots finden Sie
   `hier <../../ipv6/ipv6only.html>`__, Download-Links hingegen
   `hier <http://wiki.freebsd.org/IPv6Only>`__.
-  **6. Juni 2011**: Hiroki Sato hat `RFC
   6106 <http://www.rfc-editor.org/rfc/rfc6106.txt>`__, "IPv6 Router
   Advertisement Options for DNS Configuration" (RDNSS and DNSSL)
   support"
   `committed <http://svn.freebsd.org/changeset/base/222732>`__.

IPv6 unter FreeBSD
------------------

FreeBSD ist ein weit verbreitetes Open Source-Betriebssystem, dessen
Netwerk-Stack die Grundlage f?r jahrezehntelange Forschung bildet und
der auch als Basis f?r die IPv6-Referenzimplementierung (die vom
`KAME <http://www.kame.net/>`__-Projekt erstellt wurde) diente. FreeBSD
unterst?tzt IPv6 seit M?rz?2000 (die erste FreeBSD-Version mit
IPv6-Unterst?tzung war `4.0-RELEASE <../releases/>`__.

IPv6 und das FreeBSD Project
----------------------------

Das FreeBSD Project hat sich von Anfang an an der Entwicklung von IPv6
beteiligt. Durch die Hilfe der Community war es m?glich,
FreeBSD-Releases ab Mai?2003 auch ?ber IPv6 bereitzustellen. Die
FreeBSD-Webseiten, Mailinglisten sowie die Entwickler-Infrastruktur
unterst?tzen IPv6 seit 2007.

FreeBSD wird oft in kritischen Bereichen der Internet-Infrastruktur,
beispielsweise in Root-Nameservern, Routern und Firewalls eingesetzt.
Einige der weltmeist gr??ten und zuverl?ssigsten Internetseiten laufen
ebenfalls unter FreeBSD. Au?erdem verwenden zahlreiche Hersteller von
integrierten Produkten FreeBSD als Basis, um die bestm?gliche
IPv6-Unterst?tzung anbieten zu k?nnen. Kommentare verschiedener
Unternehmen, die FreeBSD als Basis f?r ihre Produkte verwenden, k?nnen
Sie auf der Seite `FreeBSD Foundation
Testimonials <http://www.freebsdfoundation.org/testimonials.shtml>`__
nachlesen.

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
