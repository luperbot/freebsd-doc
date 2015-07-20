================================
FreeBSD 5.3-RELEASE Announcement
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

FreeBSD 5.3-RELEASE Announcement
================================

| **Date:** Sat, 06 Nov 2004 16:19:57 -0700
|  **From:** Scott Long <scottl@FreeBSD.org>
|  **To:** freebsd-announce@FreeBSD.org
|  **Subject:** [FreeBSD-Announce] FreeBSD 5.3-RELEASE Announcement

Es ist mein Vorrecht und ich freue mich, die Verf?gbarkeit von FreeBSD
5.3-RELEASE bekanntgeben zu d?rfen. Diese Release ist ein Meilenstein
der FreeBSD?5.x Reihe und der Beginn der Releases aus dem 5-STABLE
Zweig. Seit 5.2.1 wurden einige ?nderungen vorgenommen, unter anderem:

-  Mit der neuen Kompatibilit?tsschicht laufen auf i386-Systemen
   Microsoft Windows NDIS Netzwerktreiber im Kernel.

-  Die Netzwerk- und Socket-Subsysteme nutzen nun mehrere Threads und
   sind wiedereintrittsfest. Dadurch werden Netzwerkdaten auf
   Mehrprozessorsystemen schneller verarbeitet.

-  Die Entwicklungsumgebung wurde auf GCC?3.4.2, Binutils?2.15 und
   GDB?6.1 aktualisiert.

-  Als graphischen Oberfl?chen stehen X.org?6.7, Gnome?2.6.2 und
   KDE?3.3.0 stehen zur Verf?gung.

Diese Release ist sorgf?tig getestet. Der Schwerpunkt der Entwicklung
lag bei Fehlerbehebungen und dem Festschreiben der Kernel- und
Benutzer-APIs. Die 5.X-Reihe wird nicht mehr als "Neue Technik"
bezeichnet, daher ermuntern wir Benutzer und H?ndler auf diese Release
zu migrieren. Die Migration von FreeBSD?4.X auf 5.X wird im
nachstehenden Dokument beschrieben:

http://www.FreeBSD.org/de/releases/5.3R/migration-guide.html

Eine vollst?ndige Liste der neuen Funktionen und der bekannten Probleme
finden Sie in den Release-Notes und den Errata unter diesen URLs:

| http://www.FreeBSD.org/de/releases/5.3R/relnotes.html
|  http://www.FreeBSD.org/de/releases/5.3R/errata.html

Weitere Informationen ?ber das Release?Engineering finden Sie unter:

http://www.FreeBSD.org/releng

Verf?gbarkeit
-------------

FreeBSD 5.3-RELEASE unterst?tzt die Architekturen i386, pc98, alpha,
sparc64 und ia64. Es kann mithilfe von Startmedien ?ber das Internet
oder von einer Kopie auf einem lokalen NFS/FTP-Server installiert
werden. F?r alle Architekturen stehen jetzt Distributionen zur
Verf?gung.

Helfen Sie bitte weiterhin dem FreeBSD Project, in dem Sie die Medien
bei einer der Firmen beziehen, die uns unterst?tzen. Die folgenden
Firmen bieten auf FreeBSD?5.3 aufbauende Produkte an:

-  FreeBSD Mall, Inc. ``http://www.freebsdmall.com/``

-  Daemonnews, Inc. ``http://www.bsdmall.com/freebsd1.html``

Wenn Sie sich die Medien nicht leisten k?nnen, ungeduldig sind oder
FreeBSD nur verteilen m?chten, dann sollten Sie auf jeden Fall die
ISO-Abbilder herunterladen. Wir k?nnen nicht garantieren, dass alle
Spiegel die gr??eren ISO-Abbilder bereithalten, die nachstehenden
Spiegel sollten sie aber bereitstellen. MD5-Pr?summen der
Release-Abbilder finden Sie am Ende dieser Nachricht.

Bittorrent
----------

Die Verteilung ?ber Bittorrent wird gerade getestet. Eine Liste der
Tracker des Release-ISOs finden Sie unter der folgenden URL:

``http://people.freebsd.org/~scottl/5.3-torrent``

FTP
---

-  ``ftp://ftp.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp2.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp3.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp4.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp5.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp6.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp7.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp10.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp2.au.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp.cz.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp.fr.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp2.jp.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp1.ru.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp2.ru.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp2.tw.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp3.us.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp10.us.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp11.us.FreeBSD.org/pub/FreeBSD/``

-  ``ftp://ftp15.us.FreeBSD.org/pub/FreeBSD/``

FreeBSD kann auch via FTP von Servern in den folgenden Staaten bezogen
werden: Argentinien, Australien, Brasilien, Bulgarien, Kanada, China,
Tschechische Republik, D?nemark, Estland, Finnland, Frankreich,
Deutschland, Hong Kong, Ungarn, Island, Irland, Japan, Korea, Litauen,
Amylonia, Holland, Neuseeland, Polen, Portugal, Rum?nien, Russland,
Saudi Arabien, S?dafrika, Slovakei, Slovenien, Spanien, Schweden,
Taiwan, Thailand, Ukraine, und Gro?britannien.

Bevor Sie den zentralen Server nutzen, versuchen Sie bitte, den Spiegel
in ihrer Region anzusprechen, der unter der folgenden URL erreichbar
sein sollte:

ftp://ftp.<yourdomain>.FreeBSD.org/pub/FreeBSD

Zus?tzliche Spiegel haben die Namen ftp2, ftp3 und so weiter.

Weiters ?ber FreeBSD-Spiegel finden Sie unter:

``       http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/mirrors-ftp.html``

Wenn Sie eine Anleitung f?r die Installation von FreeBSD brauchen,
sollten Sie einen Blick in Kapitel?2 des FreeBSD Handbuchs werfen. Es
enth?lt eine Schritt-f?r-Schritt Anleitung f?r Anwender, die FreeBSD
noch nie benutzt haben:

``     http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/install.html``

Danksagung
----------

Die Ver?ffentlichung von FreeBSD?5.3 wurde von diversen Firmen durch die
Bereitstellung von Hardware, Internet-Zug?ngen und Personal unterst?tzt;
zu diesen Firmen geh?ren unter anderem The FreeBSD Mall, Compaq, Yahoo!,
Sentex Communications, Sandvine, Inc., FreeBSD Systems, Inc, und
NTT/Verio.

Das Release-Engineering Team f?r 5.3-RELEASE umfasste die folgenden
Personen:

+---------------------------------------------+----------------------------------------------------------+
| Scott Long <scottl@FreeBSD.org\ >           | Release Engineering, I386 und AMD64 Release-Bau          |
+---------------------------------------------+----------------------------------------------------------+
| Ken Smith <kensmith@FreeBSD.org\ >          | I386 und Sparc64 Release-Bau, Koordination der Spiegel   |
+---------------------------------------------+----------------------------------------------------------+
| Hiroki Sato <hrs@FreeBSD.org\ >             | Release Engineering, Dokumentation and Koordination      |
+---------------------------------------------+----------------------------------------------------------+
| Robert Watson <rwatson@FreeBSD.org\ >       | Release Engineering, Sicherheit                          |
+---------------------------------------------+----------------------------------------------------------+
| John Baldwin <jhb@FreeBSD.org\ >            | Release Engineering                                      |
+---------------------------------------------+----------------------------------------------------------+
| Murray Stokely <murray@FreeBSD.org\ >       | Release Engineering                                      |
+---------------------------------------------+----------------------------------------------------------+
| Marcel Moolenaar <marcel@FreeBSD.org\ >     | IA64 Release-Bau                                         |
+---------------------------------------------+----------------------------------------------------------+
| Takahashi Yoshihiro <nyan@FreeBSD.org\ >    | PC98 Release-Bau                                         |
+---------------------------------------------+----------------------------------------------------------+
| Wilko Bulte <wilko@FreeBSD.org\ >           | Alpha Release-Bau                                        |
+---------------------------------------------+----------------------------------------------------------+
| Kris Kennaway <kris@FreeBSD.org\ >          | Paket-Bau                                                |
+---------------------------------------------+----------------------------------------------------------+
| Joe Marcus Clarke <marcus@FreeBSD.org\ >    | Paket-Bau                                                |
+---------------------------------------------+----------------------------------------------------------+
| Jacques A. Vidrine <nectar@FreeBSD.org\ >   | Security-Officer                                         |
+---------------------------------------------+----------------------------------------------------------+

Pr?fsummen der Abbilder
-----------------------

F?r Alpha:

::

    MD5 (5.3-RELEASE-alpha-bootonly.iso) = 82fd65e9cfdb6431934d0f1c1b6a15a3
    MD5 (5.3-RELEASE-alpha-disc1.iso) = f7d2267e623be6e7409c119b46982061
    MD5 (5.3-RELEASE-alpha-disc2.iso) = 26ab899510752a05bf0019529b3ae09e
    MD5 (5.3-RELEASE-alpha-miniinst.iso) = 3cc9b2881ea519027fbec6f95ab2ea84

F?r amd64:

::

    MD5 (5.3-RELEASE-amd64-bootonly.iso) = 3b13650ee101461d55233d2648402cfd
    MD5 (5.3-RELEASE-amd64-disc2.iso) = f35d3c6f46499ffab755ccf9b63cd558
    MD5 (5.3-RELEASE-amd64-miniinst.iso) = 1efce73bf26984feb6128518b225ad7e
    MD5 (5.3-RELEASE-amd64-disc1.iso) = 22894ae0c26f03537608d06815700148

F?r i386:

::

    MD5 (5.3-RELEASE-i386-bootonly.iso) = e370ae39bb34f0789c638b6ad50038a2
    MD5 (5.3-RELEASE-i386-disc1.iso) = fbcbfdff31f27de396f257e0a37a78b8
    MD5 (5.3-RELEASE-i386-disc2.iso) = 21874a5663022768336e4cc73d1dd30d
    MD5 (5.3-RELEASE-i386-miniinst.iso) = 96124b2608ba481693e04d364d485e3c

F?r ia64:

::

    MD5 (5.3-RELEASE-ia64-bootonly.iso) = 2e5dfceb79b2975885cab6b318c965b8
    MD5 (5.3-RELEASE-ia64-disc1.iso) = 61b5bc276bf2b75aed0908802ea12926
    MD5 (5.3-RELEASE-ia64-disc2.iso) = 02613e71ea7e04c43f75a8feccb0bdfa
    MD5 (5.3-RELEASE-ia64-miniinst.iso) = 709233fd711756966f298e31bcab4e45

F?r pc98:

::

    MD5 (5.3-RELEASE-pc98-disc2.iso) = 373ddc67857b90b34190ad07a23e5298
    MD5 (5.3-RELEASE-pc98-miniinst.iso) = 01735af51f7b7f6ce37314e5ec49a842

F?r sparc64:

::

    MD5 (5.3-RELEASE-sparc64-bootonly.iso)= db98df3d41cb20d6cdac668125736880
    MD5 (5.3-RELEASE-sparc64-disc1.iso) = cd960f33a4e4ae33628b28580900932a
    MD5 (5.3-RELEASE-sparc64-disc2.iso) = 058c9fce47fec044e6be91773532293a
    MD5 (5.3-RELEASE-sparc64-miniinst.iso)= 05eb044da17fda978f88716a8203be3d

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
