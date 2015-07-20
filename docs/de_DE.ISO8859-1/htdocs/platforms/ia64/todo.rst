====================
FreeBSD/ia64 Project
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

-  `Startseite <../../>`__

-  `?ber FreeBSD <../../about.html>`__

   -  `F?r Einsteiger <../../projects/newbies.html>`__
   -  `Eigenschaften <../../features.html>`__
   -  `Advocacy <../../../advocacy/>`__
   -  `Marketing <../../../marketing/>`__
   -  `Privacy Policy <../../../privacy.html>`__

-  `Bezugsquellen <../../where.html>`__

   -  `Release Information <../../releases/>`__
   -  `Release Engineering <../../../releng/>`__

-  `Dokumentation <../../docs.html>`__

   -  `FAQ <../../../doc/de_DE.ISO8859-1/books/faq/>`__
   -  `Handbuch <../../../doc/de_DE.ISO8859-1/books/handbook/>`__
   -  `Porter-Handbuch <../../../doc/de_DE.ISO8859-1/books/porters-handbook>`__
   -  `Entwickler-Handbuch <../../../doc/de_DE.ISO8859-1/books/developers-handbook>`__
   -  `Manualpages <//www.FreeBSD.org/cgi/man.cgi>`__

-  `Community <../../community.html>`__

   -  `Mailinglisten <../../community/mailinglists.html>`__
   -  `Forum <http://forums.freebsd.org>`__
   -  `User Groups <../../../usergroups.html>`__
   -  `Events <../../../events/events.html>`__

-  `Entwicklung <../../../projects/index.html>`__

   -  `Projektideen <http://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN-Repository <http://svnweb.FreeBSD.org>`__
   -  `Perforce-Repository <http://p4web.FreeBSD.org>`__

-  `Hilfe <../../support.html>`__

   -  `Kommerzieller Support <../../../commercial/commercial.html>`__
   -  `Sicherheit <../../../security/>`__
   -  `Problemberichte <//www.FreeBSD.org/cgi/query-pr-summary.cgi>`__
   -  `Problembericht erstellen <../../send-pr.html>`__

-  `Foundation <http://www.freebsdfoundation.org/>`__

   -  `Geldspende <http://www.freebsdfoundation.org/donate/>`__
   -  `Hardwarespende <../../../donations/>`__

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

-  `Entwicklung <../../projects/index.html>`__
-  `Developer's
   Handbook <../../../doc/de_DE.ISO8859-1/books/developers-handbook>`__
-  `Porter-Handbuch <../../../doc/de_DE.ISO8859-1/books/porters-handbook>`__
-  `Quellcode-Repositories <../../developers/cvs.html>`__
-  `Release Engineering <../../../releng/index.html>`__
-  `Plattformen <../../platforms/>`__
-  `Projektvorschl?ge <http://wiki.FreeBSD.org/IdeasPage>`__
-  `FreeBSD
   unterst?tzen <../../../doc/de_DE.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD/ia64 Project
====================

|Montecito die|
Die FreeBSD/ia64-PR-Datenbank durchsuchen:

Was noch getan werden muss
~~~~~~~~~~~~~~~~~~~~~~~~~~

Diese Seite ist Ausgangspunkt f?r Leute, die Aufgaben suchen. Die
Reihenfolge der Aufgaben auf dieser Seite ist nicht immer ein Hinweis
auf deren Priorit?t, in der Regel aber schon. Nicht alle Aufgaben finden
hier Erw?hnung, das bedeutet jedoch nicht, dass diese nicht zu erledigen
sind. Ein typisches Beispiel ist das Instandhalten der ia64 Webseiten
... ungl?cklicherweise.

Auf dem Weg zur Tier 1 Plattform
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Nach zwei Ver?ffentlichungen als Tier?2 Plattform, wird es Zeit, eine
Tier?1 Plattform zu werden. Dies umfasst verschiedene Aufgaben wie:

-  Der Installationsprozess soll eine schon vorhandene GPT mit einer
   EFI-Partition, die ein anderes Betriebssystem enth?lt,
   ber?cksichtigen. Ein FreeBSD-Eintrag im EFI-Boot-Men? w?re auch ganz
   nett.
-  Portieren des GNU-Debuggers. Er wird auf einer Entwicklungsmaschine
   dringend ben?tigt und ist f?r Tier?1 Plattformen vorgeschrieben.
-  Portieren des X-Servers (ports/x11/XFree86-4-Server). Dies ist nicht
   unbedingt Voraussetzung f?r den Tier?1 Status, jedoch wird der
   X-Server gebraucht, um ia64 als Desktopmaschine zu benutzen.

Ports und Packages
^^^^^^^^^^^^^^^^^^

Wichtig f?r den Erfolg von FreeBSD auf ia64 sind neben ls(1) weitere
laufende Programme. Unsere umfangreiche Ports-Sammlung ist vor allem auf
ia32 ausgerichtet, kein Wunder also, dass viele Ports nicht unter ia64
bauen oder laufen. Es gibt eine aktuelle `Liste der
Ports <http://pointyhat.FreeBSD.org/errorlogs/ia64-8-latest/>`__, die
sich aus dem ein oder anderen Grund nicht bauen lassen. Ein Port wird
nicht gebaut und nicht gez?hlt, wenn er von einem Port abh?ngt, der sich
nicht bauen l?sst. Es w?re eine gro?e Hilfe, wenn Sie an Ports arbeiten,
von denen viele andere Ports abh?ngen (siehe die "Aff." Spalte der
Tabelle).

Feinschliff
^^^^^^^^^^^

Es gibt viele Funktionen (vor allem Routinen in Maschinensprache), die
ohne R?cksicht auf Geschwindigkeit oder Robustheit geschrieben wurden.
Diese Funktionen k?nnen unabh?ngig von der laufenden Entwicklung ersetzt
werden. Diese Aufgabe setzt auch nicht unbedingt ein riesiges Wissen
oder gro?e Erfahrung voraus.

Hauptentwicklung
^^^^^^^^^^^^^^^^

Einige Sachen, die noch nicht funktionieren oder die es noch nicht gibt,
sind so verzwickt und grundlegend, dass sie auch andere Plattformen
betreffen k?nnten. Unter anderem:

-  UP- und SMP-Stabilit?t verbessern. Das Low-Level-Handling der
   VM-?bersetzungen muss verbessert werden. Das betrifft die Korrektheit
   sowie die Performanz.
-  Grundlegende Ger?tetreiber wie sio(4) und syscons(4) funktionieren
   nicht auf ia64 Maschinen, welche keine Unterst?tzung f?r
   Legacy-Ger?te haben. Das ist ein gro?es Problem, da dies alle
   Plattformen betrifft und eventuell zur Konsequenz hat, dass (gro?e)
   Teile gewisser Subsysteme neu geschrieben werden m?ssen. Auf jeden
   Fall eine Aufgabe, die gro? angelegte Unterst?tzung und Koordination
   ben?tigt.
-  Besserer Umgang mit sp?rlichen (physischen) Speicherkonfigurationen,
   in dem das Erstellen von VM-Tabellen, die den ganzen Adressraum
   umfassen, vermieden wird. Es sollen besser Speicherteile benutzt
   werden, die zu Verf?gung stehen. Momentan sind wir gezwungen, aus
   diesem Grund Speicher zu ignorieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Sitemap <../../../search/index-site.html>`__ \| `Legal
Notices <../../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project.
Alle Rechte vorbehalten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../../layout/images/logo-red.png
   :target: ../..
.. |Montecito die| image:: ../../../platforms/ia64/montecito-die.png
