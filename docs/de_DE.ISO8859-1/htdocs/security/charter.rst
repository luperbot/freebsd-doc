====================================
Charta des FreeBSD-Security-Officers
====================================

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

-  `Hilfe <../support.html>`__
-  `Anbieter <../../commercial/>`__

   -  `Software <../../commercial/software_bycat.html>`__
   -  `Hardware <../../commercial/hardware.html>`__
   -  `Beratung <../../commercial/consult_bycat.html>`__
   -  `Internet Service Provider <../../commercial/isp.html>`__
   -  `Verschiedenes <../../commercial/misc.html>`__

-  `Sicherheit <../../security/index.html>`__

   -  `Advisories <../../security/advisories.html>`__
   -  `Errata Notices <../../security/notices.html>`__

-  `Fehlerberichte <../support/bugreports.html>`__

   -  `Einreichen <../send-pr.html>`__

-  `Internet-Ressourcen <../support/webresources.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Charta des FreeBSD-Security-Officers
====================================

[?im Februar 2002 von Core akzeptiert?]

1. Einleitung
~~~~~~~~~~~~~

Die Aufgabe des FreeBSD-Security-Officers ist es, die Gemeinschaft der
FreeBSD-Benutzer zu besch?tzen: Er informiert die Gemeinschaft ?ber
Fehler, Sicherheitsl?cher, beliebte Angriffe und andere Risiken. Als
Vertreter des FreeBSD-Projekts bearbeitet er zusammen mit externen
Organisationen vertrauliche, nicht ?ffentliche Sicherheitsprobleme. Der
FreeBSD-Security-Officer f?rdert die Verbreitung von Informationen
(beispielsweise Hinweise zur Administration oder Programmierung), die
zum sicheren Betrieb eines FreeBSD-Systems erforderlich sind.

2. Pflichten
~~~~~~~~~~~~

Der Security-Officer hat unter anderem folgende Pflichten:

-  Er schlichtet sicherheitsrelevante Streitf?lle.
-  Er behebt z?gig sicherheitskritische Software-Fehler.
-  Er gibt die FreeBSD-Sicherheitshinweise heraus.
-  Er beantwortet Anfragen von Verk?ufern, die Sicherheitsprobleme
   betreffen.
-  Er ?berpr?ft so viele Quelltexte, insbesondere Quellen die
   Sicherheits- oder Netzfunktionen implementieren, wie m?glich.
-  Er beobachtet geeignete Informationsquellen auf Fehlerberichte,
   Sicherheitsl?cher und andere die Sicherheit von FreeBSD-Systemen
   gef?hrdente Umst?nde.
-  Er beteiligt sich an der Architektur von FreeBSD, um einen positiven
   Einflu? auf die Systemsicherheit zu nehmen.
-  Er verwaltet den PGP-Schl?ssel des FreeBSD-Security-Officers.

3. Berechtigungen
~~~~~~~~~~~~~~~~~

Das FreeBSD-Core-Team hat die Zust?ndigkeit f?r sicherheitsrelevante
Fragen an den FreeBSD-Security-Officer abgegeben. In der Aus?bung der
damit verbundenen Rechte ist der Security-Officer gegen?ber dem
Core-Team verantwortlich. Es wird erwartet, dass der Security-Officer
mit gesundem Menschenverstand handelt und die erforderliche Diskretion
bewahrt. Jede Handlung, die den Leitlinien der Committer widerspricht,
muss sorgf?ltig gepr?ft werden.

Unter der Ma?gabe, dass er gegen?ber dem Core-Team verantwortlich ist,
besitzt der Security-Officer insbesondere die nachstehenden Rechte:

-  schnelle Commits: Der Security-Officer kann in sicherheitsrelevanten
   Bereichen die normalen Leitlinien der Committer umgehen.
-  Veto: Der Security-Officer besitzt die Entscheidungsgewalt ?ber
   Fragen der Sicherheit. Er kann die R?cknahme von Commits oder das
   Entfernen von Subsystemen fordern, die seiner Meinung nach die
   Sicherheit von FreeBSD gef?hrden.
-  Team: Der Security-Officer stellt das Security-Officer-Team zusammen
   und kann dem Team seine Rechte und Pflichten nach eigenem Ermessen
   ?bertragen. Die Mitgliedschaft im Security-Officer-Team wird vom
   Security-Officer und emeritierten Security-Officern (die dachten, von
   ihren Pflichten befreit zu sein) bestimmt.
-  Mailingliste: Die Mailingliste security-officer@FreeBSD.org wird vom
   Security-Officer verwaltet.

4. Ernennung
~~~~~~~~~~~~

Ein neuer Security-Officer wird vom vorigen Security-Officer ernannt und
vom Core-Team im Amt best?tigt. Der Security-Officer ist gegen?ber dem
Core-Team verantwortlich.

Die Mitglieder des Security-Officer-Teams werden vom Security-Officer
ausgew?hlt und sind gegen?ber dem Security-Officer sowie dem Core-Team
verantwortlich. Von Mitgliedern des Security-Officer-Teams wird
erwartet, dass sie den Security-Officer unterst?tzen und auch sonst zum
Schutz der FreeBSD-Gemeinschaft beitragen.

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
