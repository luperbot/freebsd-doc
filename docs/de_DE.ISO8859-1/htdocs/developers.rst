======================
Quellcode-Repositories
======================

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

Quellcode-Repositories
======================

CVS
---

Der Quellcode des FreeBSD Projects wird mit
`CVS <http://www.FreeBSD.org/cgi/man.cgi?cvs>`__ (dem Concurrent Version
System) verwaltet. Jede ?nderung seit FreeBSD?2.0 wird in diesem System
inklusive einer Commit-Meldung, die den Grund der ?nderung beschreibt,
gespeichert. Das Repository kann beispielsweise ?ber die weiter unten
beschriebene Internet-Schnittstelle durchst?bert werden. Um eine
komplette lokale Kopie des FreeBSD-CVS-Repository anzulegen, haben Sie
folgende M?glichkeiten:

-  `CVSup <../../doc/de_DE.ISO8859-1/books/handbook/cvsup.html>`__, wenn
   Sie ein leistungsf?higes und optimiertes (und in Modula-3
   geschriebenes) Werkzeug einsetzen wollen.
-  `anoncvs <../../doc/de_DE.ISO8859-1/books/handbook/anoncvs.html>`__,
   wenn Sie ein Werkzeug einsetzen wollen, das zwar weniger optimiert
   als cvsup ist (anonvs arbeitet etwas langsamer und verursacht ein
   etwas h?heres Transfervolumen), es daf?r aber leichter macht, nur
   kleinere Bereiche des Quellcode-Baumes auszuchecken und das bereits
   im Basissystem enthalten ist.
-  `CTM <../../doc/de_DE.ISO8859-1/books/handbook/ctm.html>`__, ein
   System, bei dem Sie Aktualisierungen automatisch als E-Mails erhalten
   (die die einzuspielenden Patches enthalten).
-  Die `Internet-Schnittstelle <http://cvsweb.FreeBSD.org/>`__, wenn Sie
   das Repository einfach durchst?bern wollen oder nach einer bestimmten
   ?nderung oder Dateirevision suchen.

Spiegelserver f?r das CVS-Web-Interface existieren `in der Tschechischen
Republik <http://www.cz.FreeBSD.org/cgi/cvsweb.cgi/>`__, `in
D?nemark <http://www.dk.FreeBSD.org/cgi/cvsweb.cgi/>`__, `in
Japan <http://www.jp.FreeBSD.org/cgi/cvsweb.cgi/>`__ und `in den USA
(Kalifornien) <http://cvsweb.FreeBSD.org/>`__.

Subversion
----------

Im Juni 2008 wurde der Quellcode f?r die Entwicklung des Basissystem in
ein `Subversion <http://subversion.tigris.org/>`__ (abgek?rzt
SVN)-Repository (ein anderes Versionskontrollsystem) migriert. Analog
zum bisherigen CVS-Repository gibt es auch f?r SVN eine
`Internet-Schnittstelle <http://svnweb.FreeBSD.org/base/>`__, die es
erlaubt, das Repostitory zu durchst?bern. Alle ?nderungen, die in das
SVN-Repository eingebracht werden, werden weiterhin in das
CVS-Repository exportiert.

Im Mai 2012 hat das FreeBSD Documentation Project seinen Quellcode von
CVS nach Subversion migriert. Im Gegensatz zum Basissystem wird dieses
Repository aber NICHT nach CVS exportiert. Analog zum bisherigen
CVS-Repository gibt es auch f?r SVN eine
`Internet-Schnittstelle <http://svnweb.FreeBSD.org/doc/>`__, die es
erlaubt, das komplette SVN-Repostitory des FreeBSD Documentation
Projects zu durchst?bern.

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
