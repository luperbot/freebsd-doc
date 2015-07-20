================================
FreeBSD 5.0-RELEASE Announcement
================================

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

-  `FreeBSD Bezugsquellen <../../where.html>`__
-  `Release Informationen <../../releases/>`__

   -  Produktivversion:
      `10.1 <../../../releases/10.1R/announce.html>`__
   -  Alte Produktivversion:
      `9.3 <../../../releases/9.3R/announce.html>`__

-  `Anwendungen (Ports) <../../ports/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD 5.0-RELEASE Announcement
================================

| **Date:** Sun, 19 Jan 2003 10:03:42 -0700
|  **From:** scottl@FreeBSD.org (Scott Long)
|  **To:** freebsd-announce@FreeBSD.org
|  **Subject:** FreeBSD 5.0 verf?gbar

Es ist mein Vorrecht und ich freue mich, die Verf?gbarkeit von FreeBSD
5.0-RELEASE bekanntgeben zu d?rfen. Nach fast drei Jahren Entwicklung
bringt die neue Release verbesserte Mehrprozessor- und
Multithread-Unterst?tzung. Weiterhin l?uft FreeBSD jetzt auf den
Plattformen sparc64 und ia64. Die Release enth?lt unter anderem diese
neuen oder verbesserten Funktionen:

-  UFS2, der Nachfolger des Dateisystems UFS, durchbricht die
   1?TB-Barriere von UFS.
-  Das Pr?fen der Dateisysteme im Hintergrund und
   Dateisystem-Schnappschn?sse machen Wartungsfenster zum Reparieren von
   Dateisystemen oder f?r Datensicherungen ?berfl?ssig.
-  Mit den experimentellen vorgeschriebenen Zugriffskontrollen
   (*Mandatory Access Controls, MAC*) lassen sich Sicherheitsrichtlinien
   erweiterbar und flexibel definieren.
-  Eine feinere Unterteilung der Sperren (*locks*) im Kernel bahnt den
   Weg f?r effizientere Mehrprozessor-Systeme.
-  Mit der Unterst?tzung f?r Bluetooth, ACPI, CardBus, IEEE?1394 und der
   experimentellen Unterst?tzung f?r Hardware-Cryptobeschleuniger bleibt
   FreeBSD auch weiterhin an der technischen Spitze.
-  GCC 3.2.1, den neusten Compiler der sich immer weiter verbessernden
   GNU-Compiler-Sammlung.
-  GEOM, ein erweiterbares und flexibles Speichersubsystem, und DEVFS,
   das Dateisystem f?r Ger?tedateien, erm?glichen den Einsatz moderner
   Speicher-Technik.
-  Mit sparc64 und ia64 unterst?tzt FreeBSD weitere moderne
   64-Bit-Plattformen.

Auch wenn FreeBSD?5.0 viele neue und interessante Funktionen enth?lt,
ist es nicht f?r jeden Benutzer geeignet. Konservative Benutzer ziehen
es wahrscheinlich vor, weiterhin FreeBSD?4.X zu benutzen. Kompromisse,
die Sie eingehen m?ssen und die k?nftigen Pl?ne f?r FreeBSD?4.X und 5.X
sind im Early Adopter's Guide beschrieben:

``http://www.FreeBSD.org/de/releases/5.0R/early-adopter.html``

Eine vollst?ndige Liste der neuen Funktionen und der bekannten Probleme
finden Sie in den Release Notes und den Errata unter diesen URLs:

``http://www.FreeBSD.org/de/releases/5.0R/relnotes.html``

``http://www.FreeBSD.org/de/releases/5.0R/errata.html``

Weitere Informationen ?ber das Release?Engineering finden Sie unter:

``http://www.FreeBSD.org/releng/``

**Verf?gbarkeit**

FreeBSD 5.0-RELEASE unterst?tzt die Architekturen i386, pc98, alpha,
sparc64 und ia64. Es kann mithilfe der Boot-Disketten ?ber das Internet
oder von einer Kopie auf einem lokalen NFS/FTP-Server installiert
werden. F?r alle Architekturen stehen jetzt Distributionen zur
Verf?gung.

Helfen Sie bitte weiterhin dem FreeBSD Project, in dem Sie die Medien
bei einer der Firmen beziehen, die uns unterst?tzen. Die folgenden
Firmen bieten auf FreeBSD?5.0 aufbauende Produkte an:

+----------------------+--------------------------------------------+
| FreeBSD Mall, Inc.   | ``http://www.freebsdmall.com/``            |
+----------------------+--------------------------------------------+
| Daemonnews, Inc.     | ``http://www.bsdmall.com/freebsd1.html``   |
+----------------------+--------------------------------------------+

Wenn Sie sich die Medien nicht leisten k?nnen, ungeduldig sind oder
FreeBSD nur verteilen m?chten, dann sollten Sie auf jeden Fall die
ISO-Abbilder herunterladen. Wir k?nnen nicht garantieren, dass alle
Spiegel die gr??eren ISO-Abbilder bereithalten, folgende Spiegel sollten
sie aber bereitstellen:

-  ``ftp://ftp.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp12.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.tw.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.jp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp3.jp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp4.jp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp5.jp.freebsd.org/pub/FreeBSD/``
-  ``ftp://ftp.cz.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp7.de.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.lt.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.za.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp.se.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp1.ru.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp2.ru.FreeBSD.org/pub/FreeBSD/``
-  ``ftp://ftp4.ru.FreeBSD.org/pub/FreeBSD/``

FreeBSD kann auch via FTP von Servern in den folgenden Staaten bezogen
werden: Argentinien, Australien, Brasilien, Bulgarien, Kanada, China,
Tschechische Republik, D?nemark, Estland, Finnland, Frankreich,
Deutschland, Hong Kong, Ungarn, Island, Irland, Japan, Korea, Litauen,
Holland, Neuseeland, Polen, Portugal, Rum?nien, Russland, Saudi Arabien,
S?dafrika, Slovakei, Slovenien, Spanien, Schweden, Taiwan, Thailand,
Ukraine, und Gro?britannien.

Bevor Sie den zentralen Server nutzen, versuchen Sie bitte, den Spiegel
in ihrer Region anzusprechen, der unter der folgenden URL erreichbar
sein sollte:

ftp://ftp.<yourdomain>.FreeBSD.org/pub/FreeBSD

Zus?tzliche Spiegel haben die Namen ftp2, ftp3 und so weiter.

Weitere Informationen ?ber FreeBSD-Spiegel finden Sie unter:

http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/mirrors-ftp.html

Wenn Sie eine Anleitung f?r die Installation von FreeBSD brauchen,
sollten Sie einen Blick in Kapitel 2 des FreeBSD Handbuchs werfen. Es
enth?lt eine Schritt-f?r-Schritt Anleitung f?r Anwender, die FreeBSD
noch nie benutzt haben. Das Handbuch ist on-line unter der folgenden URL
verf?gbar:

http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/install.html

Danksagung
==========

Die Ver?ffentlichung von FreeBSD?5.0 wurde von diversen Firmen durch die
Bereitstellung von Hardware, Internet-Zug?ngen und Personal unterst?tzt;
zu diesen Firmen geh?ren unter anderem The FreeBSD Mall, Compaq, Yahoo!,
Sentex Communications und NTT/Verio.

Das Release-Engineering Team f?r 5.0-RELEASE umfasste die folgenden
Personen:

+---------------------------------------------+--------------------------------------+
| Scott Long <scottl@FreeBSD.org\ >           | Release-Engineering und Bau          |
+---------------------------------------------+--------------------------------------+
| Bruce A. Mah <bmah@FreeBSD.org\ >           | Release-Engineering, Dokumentation   |
+---------------------------------------------+--------------------------------------+
| Robert Watson <rwatson@FreeBSD.org\ >       | Release-Engineering, Sicherheit      |
+---------------------------------------------+--------------------------------------+
| John Baldwin <jhb@FreeBSD.org\ >            | Release-Engineering                  |
+---------------------------------------------+--------------------------------------+
| Murray Stokely <murray@FreeBSD.org\ >       | Release-Engineering                  |
+---------------------------------------------+--------------------------------------+
| Marcel Moolenaar <marcel@FreeBSD.org\ >     | IA64-Release-Bau                     |
+---------------------------------------------+--------------------------------------+
| Takahashi Yoshihiro <nyan@FreeBSD.org\ >    | PC98-Release-Bau                     |
+---------------------------------------------+--------------------------------------+
| Kris Kennaway <kris@FreeBSD.org\ >          | Paket-Bau                            |
+---------------------------------------------+--------------------------------------+
| Jacques A. Vidrine <nectar@FreeBSD.org\ >   | Security-Officer                     |
+---------------------------------------------+--------------------------------------+

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
