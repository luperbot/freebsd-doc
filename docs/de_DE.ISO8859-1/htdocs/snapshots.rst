=========================
FreeBSD Snapshot Releases
=========================

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

-  `FreeBSD Bezugsquellen <../where.html>`__
-  `Release Informationen <../releases/>`__

   -  Produktivversion:
      `10.1 <../../releases/10.1R/announce.html>`__
   -  Alte Produktivversion:
      `9.3 <../../releases/9.3R/announce.html>`__

-  `Anwendungen (Ports) <../ports/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Snapshot Releases
=========================

Was sind Snapshots?
-------------------

Im Rahmen der Bem?hungen, die Qualit?t ver?ffentlichter
FreeBSD-Versionen zu verbessern, werden seit einiger Zeit
*Test*-Versionen ver?ffentlicht, die als Snapshot (Schnappschuss)
bezeichnet werden. Diese Snapshots sind vom Umfang her ?hnlich wie
vollst?ndige Versionen, allerdings fehlen in der Regel Softwarepakete
Dritter sowie die aktuellen Versionen der Dokumentation.

Snapshots beziehen
------------------

Aktuelle Snapshots finden Sie auf dem FreeBSD-FTP-Server unter der
Adresse ftp://ftp.FreeBSD.org/pub/FreeBSD/snapshots sowie auf
zahlreichen
`Spiegelservern <../../doc/de_DE.ISO8859-1/books/handbook/mirrors-ftp.html>`__
(im gleichen Verzeichnis).

Zurzeit werden monatlich Snapshots f?r
`9-CURRENT <../../doc/de_DE.ISO8859-1/books/handbook/current-stable.html#CURRENT>`__,
`8-STABLE <../../doc/de_DE.ISO8859-1/books/handbook/current-stable.html#STABLE>`__,
`7-STABLE <../../doc/de_DE.ISO8859-1/books/handbook/current-stable.html#STABLE>`__,
sowie
`6-STABLE <../doc/en_US.ISO8859-1/books/handbook/current-stable.html#STABLE>`__
bereitgestellt. Die jeweiligen Snapshots werden in Verzeichnissen
gespeichert, deren Namen dem Schema ``<YYYY><MM>`` folgen (``<YYYY>``
steht dabei f?r das Jahr, ``<MM>`` f?r das Monat, in dem der Snapshot
ver?ffentlicht wurde. F?r alle unterst?tzten Plattformen werden die
ISO-Images ``bootonly``, ``disc1`` und ``disc2`` (sowie, falls
verf?gbar, ``livefs``) bereitgestellt. Zus?tzlich kann f?r jeden
Snapshot eine Datei namens ``RELNOTES.TXT`` vorhanden sein, in der die
?nderungen beschrieben werden, die in den jeweiligen Snapshot
eingeflossen sind.

Was Sie ?ber Snapshots wissen sollten
-------------------------------------

Falls sie dar?ber nachdenken, einen Snapshot einzusetzen, sollten Sie
sich ?ber die folgenden Punkte im klaren sein:

-  Snapshots sind prim?r zum Test neuer Funktionen gedacht und haben -
   im Gegensatz zu offiziellen Releases - keinen kompletten Testlauf
   hinter sich. Snapshots k?nnen daher experimentelle oder veraltete
   Funktionen enthalten, die Ihr existierendes System korrumpieren
   k?nnen.
-  Die Versionsnummer wird f?r den Snapshot nicht ge?ndert. Sie steht
   *nur* auf den Installationdisketten, damit klar ist, wann der
   Snapshot erzeugt wurde. Es sind *keine* Ver?ffentlichungen, sondern
   *Snapshots*, und dieser Unterschied darf nicht untergehen! Nat?rlich
   k?nnen und werden Leute Snapshots mit Datum in E-Mails und News
   erw?hnen; wir wollen nur nicht, dass jemand glaubt, heute w?re
   Weihnachten, weil die n?chste Version schon ver?ffentlicht wurde!
-  Snapshots werden oft ohne Softwarepakete Dritter bereitgestellt, eine
   aktuelle Ports-Sammmlung ist aber in der Regel enthalten.
-  Weiterhin wird es keine Aktualisierung der Dokumentation geben. Wenn
   in einem README noch auf die vorgehende Version verwiesen wird, Pech.
   Es ist deutlich wichtiger, die Korrekturen f?r die behobenen Fehler
   und die Neuerungen f?r Tests verf?gbar zu machen. Beschwerden ?ber
   solche Dinge wandern ungelesen in den M?lleimer. Nochmals: Es sind
   *Snapshots*, nicht Ver?ffentlichungen.

Kommentare zu den Snapshots sind nat?rlich hochwillkommen. Davon haben
nicht nur wir etwas - alle, die FreeBSD f?r wichtige Anwendungen
einsetzen, sollten es begr??en, wenn sie die M?glichkeit erhalten,
neuere Versionen in einem kontrollierten Rahmen testen zu k?nnen.
Au?erdem sind die Snapshots der beste Beweis, dass Ihre Kommentare und
Vorschl?ge eingearbeitet werden und dass Sie (hoffentlich) mit der
n?chsten ver?ffentlichten Version keine b?sen ?berraschungen erleben
werden. Wenn Sie uns aber nach der Ver?ffentlichung der n?chsten Version
bitterb?se Briefe schreiben, weil etwas nicht funktioniert, und es sich
dann herausstellt, dass Sie niemals einer der Snapshots ausprobiert
haben...

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
