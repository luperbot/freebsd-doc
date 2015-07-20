===================
FreeBSD/ARM Project
===================

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

FreeBSD/ARM Project
===================

Einf?hrung
~~~~~~~~~~

Bei FreeBSD/ARM handelt es sich um eine Portierung von FreeBSD, deren
Ziel es ist, die ARM-Architektur sowie deren Hardware zu unterst?tzen.
Diskussionen ?ber den ARM-Port werden auf der Mailingliste
`freebsd-arm <http://lists.freebsd.org/mailman/listinfo/freebsd-arm>`__
gef?hrt.

Inhaltsverzeichnis
~~~~~~~~~~~~~~~~~~

-  `Status <#status>`__
-  `Hardware-Unterst?tzung <#hw>`__
-  `Was noch getan werden muss <#todo>`__
-  `FreeBSD/ARM-Links <#links>`__
-  `Mini-Install Guide <#miniinst>`__
-  `Mailingliste FreeBSD/ARM <#list>`__

Status
~~~~~~

FreeBSD/ARM ist offiziell eine `Tier
2 <../../doc/en_US.ISO8859-1/articles/committers-guide/archs.html>`__-Architektur,
daher stellt das `FreeBSD Project <../..>`__ keine offiziellen Releases
und vorkompilierten Pakete bereit, da diese Plattform prim?r f?r
eingebettete Systeme verwendet wird. Dennoch wird FreeBSD/ARM aktiv
entwickelt und gewartet und wird sehr gut unterst?tzt. Dadurch bietet es
eine exzellente Grundlage f?r die Entwicklung von ARM-basierten
Systemen.

Hardware-Unterst?tzung
~~~~~~~~~~~~~~~~~~~~~~

FreeBSD l?uft auf i80321-basierenden Intel XScale?-Boards. Dazu geh?ren
auch die Boards IQ31244 sowie IQ80321. Die Unterst?tzung ist allerdings
noch minimal, da sie nur den Prozessor, den PCI-X-Bus,
em(4)-Ethernetadapter, die UART-Schnittstelle, sowie Timerger?te
umfasst.

Der i80219-XScale-Prozessor wird unterst?tzt, ebenso das
EP80219-Entwicklerboard.

Der IXP425-Prozessor wird unterst?tzt, ebenso das Avila
GW2348-4-Entwicklerboard.

Die Atmel AT91RM9200 CPU/Microcontroller-Familie wird unterst?tzt.
Unterst?tzung gibt es auch f?r die Kwikbyte
KB9202-Entwicklerboard-Familie, das BWCT-Board, sowie Hot-e
HL200-Thin-Clients.

F?r den Prozessor StrongARM 1100 wird ebenfalls minimale Unterst?tzung
geboten, allerdings nur innerhalb der M?glichkeiten der
Simics-Emulation: Dazu geh?ren Prozessor, UART sowie die Systemuhr.
Theoretisch ist es m?glich, von einem mit Simics emulierten
Assabet-Board zu booten. Allerdings wurden bisher keine derartigen
Versuche, egal, ob erfolgreich oder nicht, gemeldet.

An der Unterst?tzung des TS-7200-Entwicklerboards von Technologic
Systems wird gearbeitet. Dies gilt auch f?r den Atmel
AT91SAM926x-Prozessor, das Marvell Orion ARM SoC, die Samsung
S3C2XX0-Familie sowie die EP93XX-Prozessoren von Cirrus Logic.

Was noch getan werden muss
~~~~~~~~~~~~~~~~~~~~~~~~~~

-  SATA-Unterst?tzung muss noch implementiert werden.
-  Andere Ger?te, wie watchdog, i2c und bus sollen von NetBSD ?bernommen
   werden.

FreeBSD/ARM-Links
~~~~~~~~~~~~~~~~~

-  `Brief history of
   ARM <http://tisu.mit.jyu.fi/embedded/TIE345/luentokalvot/Embedded_3_ARM.pdf>`__
-  `NetBSD Arm/32 project <http://www.netbsd.org/Ports/arm32/>`__

Mini-Install guide
~~~~~~~~~~~~~~~~~~

Olivier Houchard (cognet@FreeBSD.org) hat eine Installationsanleitung
f?r die aktuellen FreeBSD-Quellen geschrieben. Diese ist
`hier <http://people.freebsd.org/~cognet/arm.html>`__ zu finden.

Mailingliste FreeBSD/ARM
~~~~~~~~~~~~~~~~~~~~~~~~

Um diese Liste zu abonnieren, senden Sie eine E-Mail an
``<freebsd-arm-subscribe@FreeBSD.org>`` oder melden Sie sich ? die
`Mailman-Webschnittstelle <http://lists.FreeBSD.org/mailman/listinfo/freebsd-arm>`__
an.

Was Musiker ?ber FreeBSD/ARM sagen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Mit FreeBSD/ARM k?nnen Sie die nahezu lautlose Arbeit Ihres
(eingebetteten) Computers genie?en. Es gibt sogar ein Musikst?ck, das
dieses Vergn?gen beschreibt – "Enjoy The Silence" von Depeche Mode:

::

    All I ever wanted
    All I ever needed
    Is here in my ARMs
    Words are very unnecessary
    They can only do harm

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
