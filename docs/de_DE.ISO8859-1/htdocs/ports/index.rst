==========================
Die FreeBSD Ports-Sammlung
==========================

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

-  `Allgemeines <../ports/index.html>`__
-  `Installation <../ports/installing.html>`__
-  `Aktualisierung <../ports/updating.html>`__
-  `Durchsuchen <../ports/searching.html>`__
-  ???Kategorien

   -  `alphabetisch sortiert <../ports/categories-alpha.html>`__
   -  `logisch gruppiert <../ports/categories-grouped.html>`__

-  `Alle Ports <../ports/master-index.html>`__
-  `Weitere Informationen <../ports/references.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Die FreeBSD Ports-Sammlung
==========================

Search ports for: All Package Name Description Long description
Maintainer Requires

--------------

Die Ports- und Paketsammlung von FreeBSD erlaubt es Anwendern und
Administratoren auf einfache Art und Weise, ben?tigte Programme zu
installieren. Derzeit enth?lt die Ports-Sammlung
`**25015** <growth/status.png>`__ Ports.

Die Ports-Sammlung unterst?tzt stets die aktuelle Version der
Entwicklungszweige
`FreeBSD-CURRENT <../../doc/de_DE.ISO8859-1/books/faq/introduction.html#CURRENT>`__
sowie
`FreeBSD-STABLE <../../doc/en_US.ISO8859-1/books/faq/introduction.html#STABLE>`__.
?ltere Versionen werden nicht unterst?tzt und k?nnen daher Probleme bei
der Zusammenarbeit mit einer aktuellen Ports-Sammlung verursachen. So
k?nnten aktuelle Ports beispielsweise Funktionen voraussetzen, die von
?lteren FreeBSD-Versionen nicht unterst?tzt werden. Das FreeBSD Project
versucht zwar, alle relativ aktuellen FreeBSD-Versionen zu unterst?tzen,
leider ist dies aber nicht immer m?glich. In diesem Fall ist man auf die
Unterst?tzung der Community angewiesen, um auch veraltete
FreeBSD-Versionen unterst?tzen zu k?nnen.

Jeder der hier aufgef?hrten \`\`Ports'' enth?lt die f?r den
urspr?nglichen Quellcode eines Programms ben?tigten Patches, um dieses
unter FreeBSD installieren und betreiben zu k?nnen. Um ein Programm zu
installieren, m?ssen Sie lediglich den Quellcode herunterladen,
entpacken und im Verzeichnis des Ports
```make`` <http://www.freebsd.org/cgi/man.cgi?query=make>`__ eingeben.
In der Regel werden Sie jedoch die komplette
`Ports-Sammlung <installing.html>`__ bereits bei der Installation Ihres
FreeBSD-System installieren und danach bei Bedarf aktualisieren, um
Zugriff auf Tausende Programme zu erhalten.

Jeder Port verf?gt ?ber ein ``Makefile``, das automatisch den Quellcode
des zu installierenden Programms herunterl?dt (entweder von einer
lokalen Platte, einer CD-ROM oder auch ?ber
```ftp`` <http://www.freebsd.org/cgi/man.cgi?query=ftp>`__), entpackt,
alle ben?tigten Patches anwendet und das Programm kompiliert. Wenn alles
gut geht, reicht ein einfaches ``make install`` aus, um ein Programm zu
installieren und in der Paket-Datenbank zu registrieren.

F?r einen Gro?teil der verf?gbaren Ports gibt es auch vorkompilierte
``Pakete``, die dem Anwender die Kompilierung des Quellcodes ersparen.
Jeder Port enth?lt einen Link auf das jeweilige Paket. Sie k?nnen dieses
Paket einfach herunterladen und danach mit
```pkg_add`` <http://www.freebsd.org/cgi/man.cgi?query=pkg_add>`__
installieren. Alternativ k?nnen Sie den Link auch direkt an ``pkg_add``
?bergeben, da dieses Werkzeug auch FTP-URLs und Dateinamen verarbeiten
kann.

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
