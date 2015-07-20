===================================
FreeBSD Documentation Project: SGML
===================================

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

-  `Dokumentation <../docs.html>`__
-  `FAQ <../../doc/de_DE.ISO8859-1/books/faq/>`__
-  `Handbuch <../../doc/de_DE.ISO8859-1/books/handbook/>`__
-  `Manual-Pages (Online) <//www.FreeBSD.org/cgi/man.cgi>`__
-  `B?cher und Artikel (Online) <../docs/books.html>`__
-  `Publikationen <../../publish.html>`__
-  `Internet-Ressourcen <../docs/webresources.html>`__
-  `F?r Einsteiger <../projects/newbies.html>`__
-  `Documentation Project <../docproj/>`__
-  `German Documentation
   Project <https://people.freebsd.org/~jkois/FreeBSDde/de/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Documentation Project: SGML
===================================

Das Documentation Project verwendet SGML zur Erstellung der
Dokumentation.

SGML steht f?r **S**\ tandard **G**\ eneralized **M**\ arkup
**L**\ anguage.

Kurz gesagt (SGML-Puristen m?gen dies verzeihen) handelt es sich bei
SGML um eine Sprache zum Schreiben anderer Sprachen.

Wahrscheinlich haben Sie SGML bereits verwendet, ohne dass Sie sich
dessen bewusst sind. So verf?gt beispielsweise HTML (die Sprache, in der
zahlreiche Internetseiten geschrieben sind) ?ber eine formale
Beschreibung, die in SGML verfasst wurde. Wenn Sie HTML verwenden,
verwenden Sie aber trotzdem **kein** SGML, sondern eine Sprache, die in
SGML definiert wurde.

Es gibt zahlreiche, in SGML definierte Sprachen. HTML ist dabei
lediglich eine unter vielen Sprachen. Eine weitere bekannte Sprache ist
"DocBook". Diese Sprache wurde speziell daf?r entwickelt, technische
Dokumentationen zu schreiben. Dazu verf?gt sie ?ber zahlreiche Tags
(also Markierungen der Form ``<Tag?Inhalt>``), um diese Dokumentationen
f?r deren anschlie?ende Formatierung zu beschreiben. Das FreeBSD
Documentation Project hat DocBook an seine Bed?rfnisse angepasst und
unter anderem einige neue Elemente definiert, um die Sprache pr?ziser zu
machen.

Sehen Sie sich dazu den folgenden (in HTML geschriebenen) Absatz an. Der
Inhalt ist Nebensache, konzentrieren Sie sich auf die verwendeten Tags:

::

        <p>The system's passwords are stored in <tt>/etc/passwd</tt>. To edit
          this file you should use <b><tt>vipw</tt></b>. However, if you just
          want to add a new user you can use <b><tt>adduser</tt></b>.</p>

Der gleiche (diesmal in DocBook geschriebene) Absatz sieht
folgenderma?en aus:

::

        <para>The system's passwords are stored in
          <filename>/etc/passwd</filename>. To edit this file you should use
          <command>vipw</command>. However, if you just want to add a new user
          you can use <command>adduser</command>.</para>

Wie Sie sehen, ist DocBook "ausdrucksst?rker" als HTML. In HTML wird der
Dateiname als "in Schreibenmaschinenschrift darzustellen" markiert. In
DocBook wird der Dateiname hingegen als "filename" markiert. Es wird
allerdings nicht angegeben, wie "filename" dargestellt werden soll.

Diese Vorgehensweise hat mehrere Vorteile:

-  Sie ist eindeutig und konsistent.

   Sie verlieren keine Zeit mit ?berlegungen wie "Hm, ich muss einen
   Dateinamen darstellen, nehme ich daf?r 'tt', 'b', oder besser doch
   'em'?"

   Stattdessen verwenden Sie einfach das der jeweiligen Situation
   angepasste Tag.

   Die Konvertierung von DocBook in andere Formate wie HTML oder
   PostScript? stellt sicher, dass alle Dateinamen innerhalb des
   Dokuments gleich dargestellt werden.

-  Sie m?ssen sich keine Gedanken mehr ?ber die Darstellung Ihres
   Dokuments machen, sondern k?nnen sich auf den Inhalt konzentrieren.

-  Da die Dokumentation nicht an ein bestimmtes Format gebunden ist,
   kann die gleiche Dokumentation in viele verschiedene Formate (wie
   normalen Text, HTML, PostScript, RTF, PDF und andere mehr)
   konvertiert werden.

-  Die Dokumentation ist 'intelligenter' und erlaubt dadurch auch
   anspruchsvollere Dinge, wie die automatische Erstellung eines Index
   mit allen innerhalb des Dokuments verwendeten Befehlen.

Mit DocBook erstellte Dokumente haben eine gewisse ?hnlichkeit mit den
von Microsoft? Word bekannten Dokumentvorlagen, sind aber sehr viel
m?chtiger.

Diese besonderen F?higkeiten haben aber ihren Preis:

-  Da es sehr viele Tags gibt, dauert es l?nger, bis Sie alle kennen
   werden und optimal einsetzen k?nnen.

   Um die Lernkurve zu verflachen, ist es sehr hilfreich, sich
   Dokumentationen anderer Autoren anzusehen, um zu sehen, wie diese
   ?hnliche Informationen beschreiben.

-  Der Konvertierungsprozess ist relativ komplex.

Sie k?nnen kein DocBook. K?nnen Sie das Documentation Project trotzdem unterst?tzen?
------------------------------------------------------------------------------------

Nat?rlich. Jede Dokumentation ist besser als keine Dokumentation. Es ist
kein gro?es Problem, wenn Ihr Beitrag nicht als DocBook formatiert ist.

`Reichen <submitting.html>`__ Sie Ihren Beitrag einfach ein. Jemand aus
dem Documentation Project wird Ihren Beitrag ?bernehmen, ihn in DocBook
formatieren und committen. Vielleicht erhalten Sie den formatierten Text
sogar zur?ck. Dann k?nnen Sie einen "Vorher-/Nachher-Vergleich"
durchf?hren und so etwas mehr ?ber DocBook lernen.

Da Ihr Beitrag in diesem Fall aber zuerst in DocBook formatiert werden
muss, verlangsamt sich der Konvertierungsprozess etwas, es kann daher
bis zu einigen Tagen dauern, bis Ihr Beitrag committet wird.

Gibt es weitere Informationen zu SGML und DocBook?
--------------------------------------------------

Lesen Sie zuerst den `**Documentation Project
Primer** <../../doc/de_DE.ISO8859-1/books/fdp-primer/index.html>`__.
Dieser enth?lt eine ausf?hrliche Beschreibung aller Dinge, die Sie zur
Arbeit an der FreeBSD Dokumentation ben?tigen. Er ist in mehrere
Abschnitte unterteilt, kann aber auch als `**eine einzelne gro?e
Seite** <../../doc/de_DE.ISO8859-1/books/fdp-primer/book.html>`__
aufgerufen werden.

`**http://www.oasis-open.org/cover/sgml-xml.html** <http://www.oasis-open.org/cover/sgml-xml.html>`__
    Die offiziellen SGML/XML-Internetseiten mit zahlreichen Links zu
    SGML-Ressourcen.

`**http://www-sul.stanford.edu/tools/tutorials/html2.0/gentle.html** <http://www-sul.stanford.edu/tools/tutorials/html2.0/gentle.html>`__
    "The Gentle Introduction to SGML" ist f?r alle empfehlenswert, die
    mehr ?ber SGML (insbesondere aus der Sicht eines Einsteigers) wissen
    wollen.

`**http://www.oasis-open.org/docbook/** <http://www.oasis-open.org/docbook/>`__
    Die offizielle DocBook DTD wird von OASIS gewartet. Diese Seiten
    richten sich besonders an Personen, die mit SGML bereits vertraut
    sind und nun DocBook lernen wollen.

`Startseite des FreeBSD Documentation Projects <docproj.html>`__

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
