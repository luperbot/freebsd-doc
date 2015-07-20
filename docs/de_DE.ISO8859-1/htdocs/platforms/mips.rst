====================
FreeBSD/MIPS Project
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

FreeBSD/MIPS Project
====================

Einf?hrung
~~~~~~~~~~

Diese Seite enth?lt Information ?ber das Portieren von FreeBSD auf die
MIPS-Plattform. Diskussionen ?ber den MIPS-Port finden auf der
Mailingliste
`freebsd-mips <http://lists.freebsd.org/mailman/listinfo/freebsd-mips>`__
statt.

Inhaltsverzeichnis
~~~~~~~~~~~~~~~~~~

-  `Status <#status>`__
-  `Portierungs FAQs <#faq>`__
-  `FreeBSD/MIPS Mailingliste <#list>`__

H?ufig gestellte Fragen
~~~~~~~~~~~~~~~~~~~~~~~

#. `Was ist das FreeBSD/MIPS Projekt? <#1>`__
#. `Auf welche Hardware konzentrieren sie sich? <#2>`__
#. `Wie ist der aktuelle Status? <#3>`__
#. `Woher bekomme ich FreeBSD/MIPS? <#4>`__
#. `Wen soll ich kontaktieren? <#5>`__

Status
~~~~~~

FreeBSD/MIPS ist eine `Tier
3 <../../doc/en_US.ISO8859-1/articles/committers-guide/archs.html>`__-Architektur
und wird daher als experimentell betrachtet und vom `FreeBSD
Project <../..>`__ nicht unterst?tzt.

Was ist das FreeBSD/MIPS Project?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD/MIPS ist eine Portierung des FreeBSD-Betriebssystems auf
Computer, die auf MIPS-Prozessoren basieren.

Auf welche Hardware konzentrieren Sie sich?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Derzeit konzentrieren wir uns auf verschiedene MIPS32-Entwicklerboards
sowie SGI's MIPS64-Computer. Andere MIPS-Plattformen wie gel?ufige
Embedded-Ger?te und Computer mit einer ?hnlichen Ausstattung werden
voraussichtlich zu einem sp?teren Zeitpunkt in Angriff genommen werden.

Wie ist der aktuelle Status?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD/MIPS befindet sich in einem fr?hen Entwicklungsstadium. Das
`MIPS-Wiki <http://wiki.freebsd.org/FreeBSD/mips>`__ berichtet ?ber
laufende Arbeiten.

Woher bekomme ich FreeBSD/MIPS?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FreeBSD/MIPS wird im FreeBSD-Perforce-Repository entwickelt, diffs
werden jedoch gelegentlich auf `die Mailingliste <#list>`__ gestellt.

Wen soll ich kontaktieren?
^^^^^^^^^^^^^^^^^^^^^^^^^^

Sprechen Sie die Projektleiterin `Juli
Mallett <mailto:jmallett@FreeBSD.org>`__ an, wenn Sie Code beitragen
m?chten. Wenn Sie sich ?ber den Stand der Dinge informieren wollen,
schauen Sie auf dieser Seite regelm??ig vorbei oder abonnieren Sie die
`FreeBSD/MIPS Mailingliste <#list>`__.

FreeBSD/MIPS Mailingliste
~~~~~~~~~~~~~~~~~~~~~~~~~

Um diese Liste zu abonnieren, schicken sie eine Mail an
``<       freebsd-mips-subscribe@FreeBSD.org>`` oder besuchen Sie die
`Mailman-Seite <http://lists.FreeBSD.org/mailman/listinfo/freebsd-mips>`__.

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
